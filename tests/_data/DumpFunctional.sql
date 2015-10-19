--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-10-19 15:40:35 CEST

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
-- TOC entry 181 (class 1259 OID 22605575)
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
-- TOC entry 233 (class 1259 OID 22606172)
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
-- TOC entry 232 (class 1259 OID 22606155)
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
-- TOC entry 223 (class 1259 OID 22606032)
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
-- TOC entry 226 (class 1259 OID 22606062)
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
-- TOC entry 247 (class 1259 OID 22606443)
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
-- TOC entry 200 (class 1259 OID 22605812)
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
-- TOC entry 202 (class 1259 OID 22605843)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 22606369)
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
-- TOC entry 192 (class 1259 OID 22605718)
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
-- TOC entry 234 (class 1259 OID 22606185)
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
-- TOC entry 219 (class 1259 OID 22605986)
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
-- TOC entry 198 (class 1259 OID 22605791)
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
-- TOC entry 195 (class 1259 OID 22605758)
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
-- TOC entry 193 (class 1259 OID 22605735)
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
-- TOC entry 208 (class 1259 OID 22605900)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 245 (class 1259 OID 22606424)
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
-- TOC entry 246 (class 1259 OID 22606436)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 248 (class 1259 OID 22606458)
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
-- TOC entry 212 (class 1259 OID 22605925)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 22605692)
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
-- TOC entry 183 (class 1259 OID 22605594)
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
-- TOC entry 187 (class 1259 OID 22605658)
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
-- TOC entry 184 (class 1259 OID 22605605)
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
-- TOC entry 178 (class 1259 OID 22605549)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 22605568)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 22605932)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 217 (class 1259 OID 22605966)
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
-- TOC entry 229 (class 1259 OID 22606103)
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
-- TOC entry 186 (class 1259 OID 22605638)
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
-- TOC entry 189 (class 1259 OID 22605684)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 22606314)
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
-- TOC entry 209 (class 1259 OID 22605906)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 188 (class 1259 OID 22605669)
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
-- TOC entry 196 (class 1259 OID 22605773)
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
-- TOC entry 197 (class 1259 OID 22605784)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 22605918)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 22606328)
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
-- TOC entry 238 (class 1259 OID 22606338)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 22606253)
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
-- TOC entry 239 (class 1259 OID 22606346)
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
-- TOC entry 215 (class 1259 OID 22605947)
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
-- TOC entry 207 (class 1259 OID 22605891)
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
-- TOC entry 206 (class 1259 OID 22605881)
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
-- TOC entry 228 (class 1259 OID 22606092)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 222 (class 1259 OID 22606022)
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
-- TOC entry 194 (class 1259 OID 22605747)
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
-- TOC entry 175 (class 1259 OID 22605520)
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
-- TOC entry 174 (class 1259 OID 22605518)
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
-- TOC entry 216 (class 1259 OID 22605960)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 22605558)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 22605542)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 22605974)
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
-- TOC entry 210 (class 1259 OID 22605912)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 204 (class 1259 OID 22605858)
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
-- TOC entry 173 (class 1259 OID 22605507)
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
-- TOC entry 172 (class 1259 OID 22605499)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 22605494)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 224 (class 1259 OID 22606039)
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
-- TOC entry 185 (class 1259 OID 22605630)
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
-- TOC entry 205 (class 1259 OID 22605868)
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
-- TOC entry 227 (class 1259 OID 22606080)
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
-- TOC entry 182 (class 1259 OID 22605584)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 240 (class 1259 OID 22606357)
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
-- TOC entry 203 (class 1259 OID 22605848)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 191 (class 1259 OID 22605704)
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
-- TOC entry 176 (class 1259 OID 22605529)
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
-- TOC entry 231 (class 1259 OID 22606130)
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
-- TOC entry 199 (class 1259 OID 22605802)
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
-- TOC entry 214 (class 1259 OID 22605939)
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
-- TOC entry 225 (class 1259 OID 22606053)
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
-- TOC entry 243 (class 1259 OID 22606404)
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
-- TOC entry 242 (class 1259 OID 22606376)
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
-- TOC entry 244 (class 1259 OID 22606416)
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
-- TOC entry 221 (class 1259 OID 22606011)
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
-- TOC entry 201 (class 1259 OID 22605837)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 230 (class 1259 OID 22606120)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 220 (class 1259 OID 22606001)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2219 (class 2604 OID 22605523)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3054 (class 0 OID 22605575)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5624-f2d0-93d8-c5d8f889adfc	10	30	Otroci	Abonma za otroke	200
000a0000-5624-f2d0-8c20-218d83380645	20	60	Mladina	Abonma za mladino	400
000a0000-5624-f2d0-7b33-3b7790cb6bb2	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3106 (class 0 OID 22606172)
-- Dependencies: 233
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5624-f2d0-143f-a308fff93948	000d0000-5624-f2d0-caf4-bcb83a386597	\N	00090000-5624-f2d0-331b-00f5c6ee7728	000b0000-5624-f2d0-80a8-48084dc0ad09	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5624-f2d0-2584-4fc63266cff3	000d0000-5624-f2d0-bbe3-9dd9a4ea1e7d	00100000-5624-f2d0-61dd-e36cced0147e	00090000-5624-f2d0-4d45-30c82caa8fea	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5624-f2d0-6b85-ef399eb2bb28	000d0000-5624-f2d0-0390-3c6e544fd72c	00100000-5624-f2d0-6533-fc13623a14ce	00090000-5624-f2d0-7db8-dd7cd59b6e08	\N	0003	t	\N	2015-10-19	\N	2	t	\N	f	f
000c0000-5624-f2d0-a5b6-17ddaafbd6b0	000d0000-5624-f2d0-1818-49b19474ab5c	\N	00090000-5624-f2d0-9413-93ab44d510da	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5624-f2d0-08b6-4bc95010182c	000d0000-5624-f2d0-b9f4-2028103432d9	\N	00090000-5624-f2d0-3441-98c2d4f791fd	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5624-f2d0-8b45-6acbf175eccd	000d0000-5624-f2d0-0f8e-a2a5bea7f143	\N	00090000-5624-f2d0-7c70-698089a1218e	000b0000-5624-f2d0-f854-069efbbda5f4	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5624-f2d0-efeb-515490773466	000d0000-5624-f2d0-8a6f-4ad0456d126b	00100000-5624-f2d0-b917-60795d3dc57b	00090000-5624-f2d0-50a8-c88287f1a5f3	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5624-f2d0-e67d-a3a282d80c36	000d0000-5624-f2d0-8618-97e15a120316	\N	00090000-5624-f2d0-0ade-11f3c4010ef3	000b0000-5624-f2d0-25e2-470382c1436f	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5624-f2d0-5737-37288e908505	000d0000-5624-f2d0-8a6f-4ad0456d126b	00100000-5624-f2d0-aaf8-eb3807a3ddb0	00090000-5624-f2d0-87ce-068963fb0b92	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5624-f2d0-c50e-0868e4c64494	000d0000-5624-f2d0-8a6f-4ad0456d126b	00100000-5624-f2d0-bf14-a9a84ae3b34e	00090000-5624-f2d0-acb0-7a573c985acb	\N	0010	t	\N	2015-10-19	\N	16	f	\N	f	t
000c0000-5624-f2d0-5290-dd485a301cb2	000d0000-5624-f2d0-8a6f-4ad0456d126b	00100000-5624-f2d0-1bd8-bc619afe770f	00090000-5624-f2d0-5fec-3d4543f7035b	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5624-f2d0-5353-d31151cd62df	000d0000-5624-f2d0-4308-c212cb744d19	\N	00090000-5624-f2d0-4d45-30c82caa8fea	000b0000-5624-f2d0-522a-dd50c209432f	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3105 (class 0 OID 22606155)
-- Dependencies: 232
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3096 (class 0 OID 22606032)
-- Dependencies: 223
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5624-f2d0-6dff-a4cca033eb94	00160000-5624-f2d0-0253-16e7b745e5a3	00090000-5624-f2d0-b406-2d135361181f	aizv	10	t
003d0000-5624-f2d0-a000-3053123917fd	00160000-5624-f2d0-0253-16e7b745e5a3	00090000-5624-f2d0-131a-8f3767e5e9ab	apri	14	t
003d0000-5624-f2d0-bb8d-f42280d5be17	00160000-5624-f2d0-c20f-3ebc76a524e5	00090000-5624-f2d0-421a-fa4e556d3b6d	aizv	11	t
003d0000-5624-f2d0-ffff-a71753413350	00160000-5624-f2d0-e024-e7144b4a00fc	00090000-5624-f2d0-aa09-12ca8f21de8f	aizv	12	t
003d0000-5624-f2d0-ab21-afee8d0078b0	00160000-5624-f2d0-0253-16e7b745e5a3	00090000-5624-f2d0-7ed2-7ec1a2b143a8	apri	18	f
\.


--
-- TOC entry 3099 (class 0 OID 22606062)
-- Dependencies: 226
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5624-f2d0-0253-16e7b745e5a3	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5624-f2d0-c20f-3ebc76a524e5	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5624-f2d0-e024-e7144b4a00fc	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3120 (class 0 OID 22606443)
-- Dependencies: 247
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3073 (class 0 OID 22605812)
-- Dependencies: 200
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5624-f2d0-23e8-43f245455720	\N	\N	00200000-5624-f2d0-f1e7-0e426d344dac	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5624-f2d0-c27d-e68f662abfbe	\N	\N	00200000-5624-f2d0-7525-0db668929aef	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5624-f2d0-2167-de71613810b7	\N	\N	00200000-5624-f2d0-ca91-c0d65067dfa8	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5624-f2d0-6fd4-c29b793bbe0f	\N	\N	00200000-5624-f2d0-6810-663836ad007d	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5624-f2d0-cea3-ff93fef7e137	\N	\N	00200000-5624-f2d0-5d61-6703eee533ef	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3075 (class 0 OID 22605843)
-- Dependencies: 202
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 22606369)
-- Dependencies: 241
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3065 (class 0 OID 22605718)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5624-f2ce-7036-973e916403c8	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5624-f2ce-0e92-701eb778e754	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5624-f2ce-e306-9324f47db7db	AL	ALB	008	Albania 	Albanija	\N
00040000-5624-f2ce-0c9d-5ecafe73aa94	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5624-f2ce-bfbc-6c843f3e9e83	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5624-f2ce-538b-f0c21763210d	AD	AND	020	Andorra 	Andora	\N
00040000-5624-f2ce-713a-8fe569b615be	AO	AGO	024	Angola 	Angola	\N
00040000-5624-f2ce-10c9-fb04ff467206	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5624-f2ce-ef86-7afa4cab4380	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5624-f2ce-d376-7763268b7fd9	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5624-f2ce-4286-7e6ca4d18eb5	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5624-f2ce-335e-cdaa9a61ee19	AM	ARM	051	Armenia 	Armenija	\N
00040000-5624-f2ce-4f8d-18004033ffef	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5624-f2ce-0436-1587c9a921c0	AU	AUS	036	Australia 	Avstralija	\N
00040000-5624-f2ce-0251-6d38ae9fc7d3	AT	AUT	040	Austria 	Avstrija	\N
00040000-5624-f2ce-256f-b0d676df9a6a	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5624-f2ce-7374-05e8ea5b573f	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5624-f2ce-2700-47bb0e4b60f0	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5624-f2ce-0532-de5922b71a89	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5624-f2ce-a00f-d42a416c165c	BB	BRB	052	Barbados 	Barbados	\N
00040000-5624-f2ce-33bb-ca0ba4c9226d	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5624-f2ce-b8b9-12520721e07f	BE	BEL	056	Belgium 	Belgija	\N
00040000-5624-f2ce-944d-36f6382f76fc	BZ	BLZ	084	Belize 	Belize	\N
00040000-5624-f2ce-c20c-1719e6216797	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5624-f2ce-9549-ff303fe00e57	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5624-f2ce-96a7-feb3ee289932	BT	BTN	064	Bhutan 	Butan	\N
00040000-5624-f2ce-20bd-008ea26b5e35	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5624-f2ce-b95e-df0531ede0b7	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5624-f2ce-54f4-e83304acf04d	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5624-f2ce-7c59-dfa841ed8b56	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5624-f2ce-fab6-a3d7136bc005	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5624-f2ce-a9bc-7d6239c31406	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5624-f2ce-9720-ef7c912e2c87	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5624-f2ce-7c0f-99294eefc4af	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5624-f2ce-bc9d-57ebd667c17a	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5624-f2ce-ae59-62fabada56f4	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5624-f2ce-b692-912de3e98fc1	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5624-f2ce-14c0-e8d9d347bbcc	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5624-f2ce-f40f-35a07b9d64aa	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5624-f2ce-4613-474d4c84518d	CA	CAN	124	Canada 	Kanada	\N
00040000-5624-f2ce-b8b0-ca8b1a6a4660	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5624-f2ce-a02e-b86bf5c29a28	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5624-f2ce-ae64-a348b23c1051	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5624-f2ce-c2ac-178ed0a9828f	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5624-f2ce-f449-a3ce804c2bf6	CL	CHL	152	Chile 	Čile	\N
00040000-5624-f2ce-8dc7-c107b3e22aac	CN	CHN	156	China 	Kitajska	\N
00040000-5624-f2ce-a25a-35517439372c	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5624-f2ce-d2ad-3de1cdc9625f	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5624-f2ce-007b-8dad95822b10	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5624-f2ce-f9f6-04f27d341456	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5624-f2ce-2310-3dfededb684f	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5624-f2ce-3f9b-d0e7797d339d	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5624-f2ce-9f57-3ef0f2c1402c	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5624-f2ce-39ef-e646afa37c9f	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5624-f2ce-163a-9f3e43bfb157	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5624-f2ce-f26f-70e0d3e8b048	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5624-f2ce-2e7d-25c43b4172e0	CU	CUB	192	Cuba 	Kuba	\N
00040000-5624-f2ce-99a5-def0959f7352	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5624-f2ce-3964-ac60a045102f	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5624-f2ce-6ab7-55158c6e63dc	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5624-f2ce-235f-e9b2a2129961	DK	DNK	208	Denmark 	Danska	\N
00040000-5624-f2ce-8d36-cf60d6215aba	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5624-f2ce-7e1a-347b296b674a	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5624-f2ce-3bc6-4babefedbc36	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5624-f2ce-5ed3-8389b8baa73c	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5624-f2ce-91ce-5d919d9774d2	EG	EGY	818	Egypt 	Egipt	\N
00040000-5624-f2ce-c09f-ffc2ddcb4be2	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5624-f2ce-65f9-94c2fe9f0d11	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5624-f2ce-ab3b-ae64b8ccc371	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5624-f2ce-19e8-b878a00766c2	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5624-f2ce-d1df-f480c4892bef	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5624-f2ce-a1e4-1d00140819ba	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5624-f2ce-5e09-00625e4f0027	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5624-f2ce-5036-3968323fe0d6	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5624-f2ce-e1eb-986ca1ff26ae	FI	FIN	246	Finland 	Finska	\N
00040000-5624-f2ce-5cb5-5e3d11af815c	FR	FRA	250	France 	Francija	\N
00040000-5624-f2ce-ba71-a12a9b84cfeb	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5624-f2ce-c854-19e322cb6a85	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5624-f2ce-e211-508f83d14a7f	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5624-f2ce-e0b6-a1cf3b3cd848	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5624-f2ce-b6c8-08818f6597f3	GA	GAB	266	Gabon 	Gabon	\N
00040000-5624-f2ce-7804-91f145a54059	GM	GMB	270	Gambia 	Gambija	\N
00040000-5624-f2ce-df37-a62ffcddc937	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5624-f2ce-6180-00cfa4d990f4	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5624-f2ce-a9db-d4716a951609	GH	GHA	288	Ghana 	Gana	\N
00040000-5624-f2ce-7cd1-b3c129cf540e	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5624-f2ce-0790-df31c2c1c33e	GR	GRC	300	Greece 	Grčija	\N
00040000-5624-f2ce-a640-0c000fd86313	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5624-f2ce-3a6d-12486491eff5	GD	GRD	308	Grenada 	Grenada	\N
00040000-5624-f2ce-e518-7600aac3ccda	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5624-f2ce-759d-84eeb0415d4f	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5624-f2ce-761a-7fb670e46bfc	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5624-f2ce-001e-9854a9eb5f39	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5624-f2ce-e7a3-e344bdc0b3c2	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5624-f2ce-2084-d62ddd3d8b6d	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5624-f2ce-b93c-a772901d1ff2	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5624-f2ce-1e30-1d673326b145	HT	HTI	332	Haiti 	Haiti	\N
00040000-5624-f2ce-1a6b-4dd4132c84bd	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5624-f2ce-cd62-a2a96ebef7f4	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5624-f2ce-064c-8e9fdbc6a5b4	HN	HND	340	Honduras 	Honduras	\N
00040000-5624-f2ce-5ecf-d78e140693f4	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5624-f2ce-f71e-6b35dcbc18c3	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5624-f2ce-873d-9ec8b0cf0fba	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5624-f2ce-744d-fb33b09347b0	IN	IND	356	India 	Indija	\N
00040000-5624-f2ce-843b-72980911ded9	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5624-f2ce-d433-4f3b99aeeb7c	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5624-f2ce-4b5e-ef92205cf257	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5624-f2ce-8276-a05a920807ca	IE	IRL	372	Ireland 	Irska	\N
00040000-5624-f2ce-c0cb-fe707e418677	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5624-f2ce-835a-10a21e94b13c	IL	ISR	376	Israel 	Izrael	\N
00040000-5624-f2ce-cb72-515b8e380e8f	IT	ITA	380	Italy 	Italija	\N
00040000-5624-f2ce-37a0-edeb7dd40f84	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5624-f2ce-aebd-a6372e2354f3	JP	JPN	392	Japan 	Japonska	\N
00040000-5624-f2ce-46b8-2ea5941607fc	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5624-f2ce-0a7a-61410eb02380	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5624-f2ce-246d-9245cca77d39	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5624-f2ce-0a3c-77d5d435ae19	KE	KEN	404	Kenya 	Kenija	\N
00040000-5624-f2ce-7a04-48c758c6b75b	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5624-f2ce-7d7d-138418138bae	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5624-f2ce-93de-c4f2f1cc0994	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5624-f2ce-4941-b9b99a3a7947	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5624-f2ce-bf5d-aef81bd3eb87	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5624-f2ce-ba3a-6ff4e86341b6	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5624-f2ce-cd32-8f03ea252b9b	LV	LVA	428	Latvia 	Latvija	\N
00040000-5624-f2ce-dea1-f2ab53b6df80	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5624-f2ce-1842-dd166075df7e	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5624-f2ce-3090-49abfec32a7c	LR	LBR	430	Liberia 	Liberija	\N
00040000-5624-f2ce-e141-3039872aaa8c	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5624-f2ce-d15a-912161d66329	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5624-f2ce-f9e0-29eeed129fde	LT	LTU	440	Lithuania 	Litva	\N
00040000-5624-f2ce-136a-87c6df0860ec	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5624-f2ce-27ce-7055e28eb446	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5624-f2ce-aa3a-862296f0a1a3	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5624-f2ce-dc9b-643f77ab8372	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5624-f2ce-c206-abbcfd139028	MW	MWI	454	Malawi 	Malavi	\N
00040000-5624-f2ce-f54a-5b139a5f98fb	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5624-f2ce-70df-be96e421c2d9	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5624-f2ce-22f3-4949a9b31876	ML	MLI	466	Mali 	Mali	\N
00040000-5624-f2ce-2905-aea486168bba	MT	MLT	470	Malta 	Malta	\N
00040000-5624-f2ce-d3e0-6bde0f28d01b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5624-f2ce-e692-1227cd94cb33	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5624-f2ce-c298-0b016377065c	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5624-f2ce-3b33-6d30e2c08c70	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5624-f2ce-28d8-78fb74db9610	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5624-f2ce-5297-b3acaad73213	MX	MEX	484	Mexico 	Mehika	\N
00040000-5624-f2ce-a56c-6434e25a9425	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5624-f2ce-77dd-0fb5f2af5850	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5624-f2ce-5e14-da5d13290c4c	MC	MCO	492	Monaco 	Monako	\N
00040000-5624-f2ce-3331-c5fa6cd4b29c	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5624-f2ce-1e97-9ed2a6c8f1a0	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5624-f2ce-0da4-2ad072699d12	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5624-f2ce-f95c-530639f00865	MA	MAR	504	Morocco 	Maroko	\N
00040000-5624-f2ce-b5f1-81333b7c6d70	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5624-f2ce-b0b7-63a55c8814ed	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5624-f2ce-b066-2a4eeb45ea75	NA	NAM	516	Namibia 	Namibija	\N
00040000-5624-f2ce-8deb-d880165f19ec	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5624-f2ce-0e0f-9c4282a67699	NP	NPL	524	Nepal 	Nepal	\N
00040000-5624-f2ce-0c68-d0c56fe01a1e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5624-f2ce-0a2a-1cf43425ee7c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5624-f2ce-9eae-0acb35857009	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5624-f2ce-8896-4e216c685624	NE	NER	562	Niger 	Niger 	\N
00040000-5624-f2ce-0f7c-1dbccf39f62a	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5624-f2ce-b53d-f620f08b07c5	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5624-f2ce-8fda-bf1878242b7f	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5624-f2ce-2abf-98da6e44d3a1	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5624-f2ce-c865-33a8825ddb21	NO	NOR	578	Norway 	Norveška	\N
00040000-5624-f2ce-d7cb-fdf22f8711a9	OM	OMN	512	Oman 	Oman	\N
00040000-5624-f2ce-ec59-6c76a0450220	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5624-f2ce-d2a7-94028ee57b2d	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5624-f2ce-502b-dd974a8d3d10	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5624-f2ce-450d-c116a2578331	PA	PAN	591	Panama 	Panama	\N
00040000-5624-f2ce-8edc-d5b43a9e6c2c	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5624-f2ce-f0d0-ea03ed2a678e	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5624-f2ce-3eb8-9b4fcfa5ec17	PE	PER	604	Peru 	Peru	\N
00040000-5624-f2ce-cd8b-840c6e3c5b21	PH	PHL	608	Philippines 	Filipini	\N
00040000-5624-f2ce-5054-e061c7f894ab	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5624-f2ce-f9e0-1ed4256c3833	PL	POL	616	Poland 	Poljska	\N
00040000-5624-f2ce-670c-542b774bc3f8	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5624-f2ce-aafe-b2d11b59258f	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5624-f2ce-e40c-a246ffc40221	QA	QAT	634	Qatar 	Katar	\N
00040000-5624-f2ce-28a4-86a5c95a6131	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5624-f2ce-9451-96f2dd043a37	RO	ROU	642	Romania 	Romunija	\N
00040000-5624-f2ce-4e49-ffac55ba60c6	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5624-f2ce-06fc-ac54d6572198	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5624-f2ce-f89f-4dd149766136	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5624-f2ce-ff6e-546befd70c0f	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5624-f2ce-4954-f929afd47074	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5624-f2ce-a7da-8868b133382b	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5624-f2ce-1c1a-5582e5d57d88	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5624-f2ce-358d-7ed329dd78cf	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5624-f2ce-ac27-707329cbdd64	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5624-f2ce-31aa-898e6a67813c	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5624-f2ce-323a-50fe4ceed823	SM	SMR	674	San Marino 	San Marino	\N
00040000-5624-f2ce-787c-58bd617a96e6	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5624-f2ce-b5c9-c9a9b5f9198a	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5624-f2ce-d13b-1569e682f127	SN	SEN	686	Senegal 	Senegal	\N
00040000-5624-f2ce-3e2c-0c50d842676c	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5624-f2ce-17d8-831bde0c1165	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5624-f2ce-c229-e300eeac2568	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5624-f2ce-23e7-f06455b24eb7	SG	SGP	702	Singapore 	Singapur	\N
00040000-5624-f2ce-474e-701a360bc7fa	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5624-f2ce-65b9-41017e1a26d6	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5624-f2ce-b643-8521c4034e83	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5624-f2ce-eb8f-0763ea20b702	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5624-f2ce-797d-a22ae1b46ad1	SO	SOM	706	Somalia 	Somalija	\N
00040000-5624-f2ce-5c6d-47cdb289f3b6	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5624-f2ce-83ea-f7373440228c	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5624-f2ce-74d1-91af20efe566	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5624-f2ce-7c0b-ecd95d0955bd	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5624-f2ce-32c5-a99f0588303c	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5624-f2ce-8f63-cdcecd5335c7	SD	SDN	729	Sudan 	Sudan	\N
00040000-5624-f2ce-6515-593e27834d19	SR	SUR	740	Suriname 	Surinam	\N
00040000-5624-f2ce-5825-b0e1aff06c5d	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5624-f2ce-edfd-04572fa5a4d2	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5624-f2ce-0c98-6ed22782c621	SE	SWE	752	Sweden 	Švedska	\N
00040000-5624-f2ce-54bf-135ab0bf85df	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5624-f2ce-a1e5-c780c7cb1edc	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5624-f2ce-a775-d7ca39c76789	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5624-f2ce-6575-d4407298ab44	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5624-f2ce-49b5-f88d502885ad	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5624-f2ce-d81d-3b696d49dbf3	TH	THA	764	Thailand 	Tajska	\N
00040000-5624-f2ce-7a28-e31a13321c08	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5624-f2ce-506c-4065bc6dc3d2	TG	TGO	768	Togo 	Togo	\N
00040000-5624-f2ce-7864-1b14164dd2c3	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5624-f2ce-dd6f-70fe8699d29a	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5624-f2ce-515c-0f832af6e9ad	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5624-f2ce-fcc2-c7993b8429e3	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5624-f2ce-637c-a9eee824903e	TR	TUR	792	Turkey 	Turčija	\N
00040000-5624-f2ce-71c9-d662c274bbe7	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5624-f2ce-c214-c01f62c6a35f	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5624-f2ce-a19b-742e26dd0cac	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5624-f2ce-5e78-050df3e79f20	UG	UGA	800	Uganda 	Uganda	\N
00040000-5624-f2ce-23f8-e89e346e4548	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5624-f2ce-50fa-7612fc3b534e	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5624-f2ce-1f64-03661252e3c7	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5624-f2ce-6f67-0ffb193eccba	US	USA	840	United States 	Združene države Amerike	\N
00040000-5624-f2ce-3c8f-db53976d52da	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5624-f2ce-beeb-5a672fcbe058	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5624-f2ce-88c1-93217953f488	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5624-f2ce-ba9b-8bcb7c3af11c	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5624-f2ce-37be-68a8fc3e512a	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5624-f2ce-7c86-d36cd63ded4c	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5624-f2ce-60f9-1898df795d13	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5624-f2ce-79d2-2ca9bc711a21	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5624-f2ce-5ac4-2ad4579134d5	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5624-f2ce-1548-ba204734f7cd	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5624-f2ce-f99c-a9beb5dc558f	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5624-f2ce-4d74-96723e6bfb57	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5624-f2ce-67f6-fc8e4179c5f6	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3107 (class 0 OID 22606185)
-- Dependencies: 234
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5624-f2d0-0d3b-8d78aa98da07	000e0000-5624-f2d0-4911-9c2f779833c1	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5624-f2ce-5c16-a6247cd253fe	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5624-f2d0-8c23-7b992f952195	000e0000-5624-f2d0-7b60-1817a844ef24	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5624-f2ce-347d-ef6276ee793e	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5624-f2d0-b9ac-c63b1661ac89	000e0000-5624-f2d0-61f2-e53925233b6f	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5624-f2ce-5c16-a6247cd253fe	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5624-f2d0-7a40-be9c485605a3	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5624-f2d0-5f8d-2913aa8429e1	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3092 (class 0 OID 22605986)
-- Dependencies: 219
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5624-f2d0-caf4-bcb83a386597	000e0000-5624-f2d0-7b60-1817a844ef24	000c0000-5624-f2d0-143f-a308fff93948	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5624-f2ce-9e19-3fdde1268874
000d0000-5624-f2d0-bbe3-9dd9a4ea1e7d	000e0000-5624-f2d0-7b60-1817a844ef24	000c0000-5624-f2d0-2584-4fc63266cff3	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5624-f2ce-6a6e-cdd0bab9f1d4
000d0000-5624-f2d0-0390-3c6e544fd72c	000e0000-5624-f2d0-7b60-1817a844ef24	000c0000-5624-f2d0-6b85-ef399eb2bb28	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5624-f2ce-9e74-25c7808394ba
000d0000-5624-f2d0-1818-49b19474ab5c	000e0000-5624-f2d0-7b60-1817a844ef24	000c0000-5624-f2d0-a5b6-17ddaafbd6b0	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5624-f2ce-39f7-11b24a846e76
000d0000-5624-f2d0-b9f4-2028103432d9	000e0000-5624-f2d0-7b60-1817a844ef24	000c0000-5624-f2d0-08b6-4bc95010182c	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5624-f2ce-39f7-11b24a846e76
000d0000-5624-f2d0-0f8e-a2a5bea7f143	000e0000-5624-f2d0-7b60-1817a844ef24	000c0000-5624-f2d0-8b45-6acbf175eccd	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5624-f2ce-9e19-3fdde1268874
000d0000-5624-f2d0-8a6f-4ad0456d126b	000e0000-5624-f2d0-7b60-1817a844ef24	000c0000-5624-f2d0-5737-37288e908505	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5624-f2ce-9e19-3fdde1268874
000d0000-5624-f2d0-8618-97e15a120316	000e0000-5624-f2d0-7b60-1817a844ef24	000c0000-5624-f2d0-e67d-a3a282d80c36	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5624-f2ce-e661-59e06ca713a4
000d0000-5624-f2d0-4308-c212cb744d19	000e0000-5624-f2d0-7b60-1817a844ef24	000c0000-5624-f2d0-5353-d31151cd62df	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5624-f2ce-410b-3724f290b843
\.


--
-- TOC entry 3071 (class 0 OID 22605791)
-- Dependencies: 198
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3068 (class 0 OID 22605758)
-- Dependencies: 195
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3066 (class 0 OID 22605735)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5624-f2d0-3213-c8fcdbf59dcd	00080000-5624-f2d0-a2b7-d7a037a4412b	00090000-5624-f2d0-acb0-7a573c985acb	AK		igralka
\.


--
-- TOC entry 3081 (class 0 OID 22605900)
-- Dependencies: 208
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 22606424)
-- Dependencies: 245
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 22606436)
-- Dependencies: 246
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 22606458)
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
-- TOC entry 3085 (class 0 OID 22605925)
-- Dependencies: 212
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3063 (class 0 OID 22605692)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5624-f2cf-0b81-8a2da54abe88	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5624-f2cf-d0ad-9e34fafa9ca0	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5624-f2cf-053d-ce8621142c35	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5624-f2cf-6c39-997c4c1574e3	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5624-f2cf-68a1-72cca8d7efe7	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5624-f2cf-9069-925774954e31	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5624-f2cf-d949-27cacf22ca42	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5624-f2cf-01d6-6a45c741c2ed	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5624-f2cf-aaea-30b783fe086f	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5624-f2cf-815f-47abf1fb0b76	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5624-f2cf-7f9d-d9243eced4fe	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5624-f2cf-74f9-05c0032ad371	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5624-f2cf-ec6c-ce4302a61042	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5624-f2cf-8c6c-d849654ca1a7	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5624-f2cf-b8a0-1ad027be7ca4	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5624-f2d0-af04-d11047d00638	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5624-f2d0-7f39-022c8da2e45d	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5624-f2d0-333e-61cbdf40cf0e	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5624-f2d0-4abc-982c07661f32	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5624-f2d0-0a89-b99749fc5821	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5624-f2d1-fec5-290171e3d8f6	application.tenant.maticnopodjetje	string	s:36:"00080000-5624-f2d1-d289-b31164ff0c30";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3056 (class 0 OID 22605594)
-- Dependencies: 183
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5624-f2d0-0362-520ae2cba564	00000000-5624-f2d0-af04-d11047d00638	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5624-f2d0-a08e-23a24f0509d3	00000000-5624-f2d0-af04-d11047d00638	00010000-5624-f2cf-df4a-bace56682289	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5624-f2d0-e676-18fd655cb353	00000000-5624-f2d0-7f39-022c8da2e45d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3060 (class 0 OID 22605658)
-- Dependencies: 187
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5624-f2d0-555b-408725c69c77	\N	00100000-5624-f2d0-61dd-e36cced0147e	00100000-5624-f2d0-6533-fc13623a14ce	01	Gledališče Nimbis
00410000-5624-f2d0-0121-7afa3e1dca6d	00410000-5624-f2d0-555b-408725c69c77	00100000-5624-f2d0-61dd-e36cced0147e	00100000-5624-f2d0-6533-fc13623a14ce	02	Tehnika
\.


--
-- TOC entry 3057 (class 0 OID 22605605)
-- Dependencies: 184
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5624-f2d0-331b-00f5c6ee7728	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5624-f2d0-9413-93ab44d510da	00010000-5624-f2d0-63a2-a318dc4b67d1	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5624-f2d0-7db8-dd7cd59b6e08	00010000-5624-f2d0-d288-502db599ce87	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5624-f2d0-87ce-068963fb0b92	00010000-5624-f2d0-07e8-d42b908c1815	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5624-f2d0-62f5-6d828957290e	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5624-f2d0-7c70-698089a1218e	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5624-f2d0-5fec-3d4543f7035b	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5624-f2d0-50a8-c88287f1a5f3	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5624-f2d0-acb0-7a573c985acb	00010000-5624-f2d0-1ed9-ea8ff3c4fd40	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5624-f2d0-4d45-30c82caa8fea	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5624-f2d0-9b76-9bc2546ee432	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5624-f2d0-3441-98c2d4f791fd	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5624-f2d0-0ade-11f3c4010ef3	00010000-5624-f2d0-61c5-5dd777298a9b	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5624-f2d0-b406-2d135361181f	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5624-f2d0-131a-8f3767e5e9ab	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5624-f2d0-421a-fa4e556d3b6d	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5624-f2d0-aa09-12ca8f21de8f	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5624-f2d0-7ed2-7ec1a2b143a8	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 3051 (class 0 OID 22605549)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5624-f2ce-7c19-78d9fc1a1635	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5624-f2ce-d554-7e0861f1c39b	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5624-f2ce-881d-fe2d3cb18299	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5624-f2ce-19ef-4f5bc57d818a	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5624-f2ce-f5aa-0b2ea89d9d8d	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5624-f2ce-41f7-f33956fb7e7c	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5624-f2ce-2e5f-4d0bc1a404d6	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5624-f2ce-e76d-55957af4900f	Abonma-read	Abonma - branje	f
00030000-5624-f2ce-f59e-078fa0075334	Abonma-write	Abonma - spreminjanje	f
00030000-5624-f2ce-fa7d-a049829cc8c4	Alternacija-read	Alternacija - branje	f
00030000-5624-f2ce-2a61-eccd55aae1fa	Alternacija-write	Alternacija - spreminjanje	f
00030000-5624-f2ce-093c-9351f346f593	Arhivalija-read	Arhivalija - branje	f
00030000-5624-f2ce-aa40-547aa392bb10	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5624-f2ce-5768-d641e55f4624	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5624-f2ce-fd85-c9c5a217915a	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5624-f2ce-f185-0509d509439f	Besedilo-read	Besedilo - branje	f
00030000-5624-f2ce-93fb-7ef06ac5c468	Besedilo-write	Besedilo - spreminjanje	f
00030000-5624-f2ce-a7fa-f0f10a806a1a	DogodekIzven-read	DogodekIzven - branje	f
00030000-5624-f2ce-f691-de4a23e97d25	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5624-f2ce-e8d8-2c08e8d80a10	Dogodek-read	Dogodek - branje	f
00030000-5624-f2ce-6b50-3a635b04e92a	Dogodek-write	Dogodek - spreminjanje	f
00030000-5624-f2ce-1ac4-777051ee378b	DrugiVir-read	DrugiVir - branje	f
00030000-5624-f2ce-0ecd-e991aa6c03c4	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5624-f2ce-4c53-07f802ee19f2	Drzava-read	Drzava - branje	f
00030000-5624-f2ce-ded8-05aed735e3ca	Drzava-write	Drzava - spreminjanje	f
00030000-5624-f2ce-e13e-7db410c33fe4	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5624-f2ce-971f-e271d73021d8	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5624-f2ce-c116-dd35747b6fe3	Funkcija-read	Funkcija - branje	f
00030000-5624-f2ce-4970-31387ae3535b	Funkcija-write	Funkcija - spreminjanje	f
00030000-5624-f2ce-7ce7-e3212a97bfc0	Gostovanje-read	Gostovanje - branje	f
00030000-5624-f2ce-c889-1833e3d419f4	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5624-f2ce-dd4b-04ba68cc7b91	Gostujoca-read	Gostujoca - branje	f
00030000-5624-f2ce-def6-9205a76ce3ea	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5624-f2ce-1b9f-68ec6136dd79	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5624-f2ce-80d6-092d8f23b541	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5624-f2ce-a5ba-fd7d9689dc21	Kupec-read	Kupec - branje	f
00030000-5624-f2ce-8527-d5be7b623e44	Kupec-write	Kupec - spreminjanje	f
00030000-5624-f2ce-1a62-6248fde51ef3	NacinPlacina-read	NacinPlacina - branje	f
00030000-5624-f2ce-5732-dd1a7c0ecf89	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5624-f2ce-a25c-19e6fdaf9035	Option-read	Option - branje	f
00030000-5624-f2ce-6944-b984492f58b7	Option-write	Option - spreminjanje	f
00030000-5624-f2ce-966d-51accd251d07	OptionValue-read	OptionValue - branje	f
00030000-5624-f2ce-d7d8-1837f3980d71	OptionValue-write	OptionValue - spreminjanje	f
00030000-5624-f2ce-2c1b-4228f275353d	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	f
00030000-5624-f2ce-4940-0b6c2650aeed	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	f
00030000-5624-f2ce-44a6-941b49e227c1	Oseba-read	Oseba - branje	f
00030000-5624-f2ce-e7a9-3cd56eefcbeb	Oseba-write	Oseba - spreminjanje	f
00030000-5624-f2ce-99b3-a8a5afee9348	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5624-f2ce-3026-6f2ae0b85b29	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5624-f2ce-986f-d0e9082824a0	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5624-f2ce-f9d6-92949ac691e1	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5624-f2ce-01bb-d0211f7a3e44	Pogodba-read	Pogodba - branje	f
00030000-5624-f2ce-d65f-9666eeb22245	Pogodba-write	Pogodba - spreminjanje	f
00030000-5624-f2ce-8803-8f72410e5a74	Popa-read	Popa - branje	f
00030000-5624-f2ce-97f9-e8987a38058f	Popa-write	Popa - spreminjanje	f
00030000-5624-f2ce-8b17-6836fdaa919e	Posta-read	Posta - branje	f
00030000-5624-f2ce-c1c4-f1322688aed9	Posta-write	Posta - spreminjanje	f
00030000-5624-f2ce-f068-7aac90f31a80	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5624-f2ce-36e1-a02ccc1ae25e	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5624-f2ce-2b5e-58e8db8cd5f4	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5624-f2ce-a199-5c961bb08dc1	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5624-f2ce-6ef4-96bff544df29	PostniNaslov-read	PostniNaslov - branje	f
00030000-5624-f2ce-1a8c-ff7d11fa0ab8	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5624-f2ce-b8c9-0b96206c47bb	Predstava-read	Predstava - branje	f
00030000-5624-f2ce-d73f-5a805691bca8	Predstava-write	Predstava - spreminjanje	f
00030000-5624-f2ce-99e0-2b60776f58b4	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5624-f2ce-b13d-03955618205a	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5624-f2ce-3119-922f929530ef	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5624-f2ce-f95c-d477391a6cbb	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5624-f2ce-376e-10cbdbf657ee	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5624-f2ce-435a-616266a96d99	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5624-f2ce-9c58-a95364f99332	ProgramDela-read	ProgramDela - branje	f
00030000-5624-f2ce-4edd-94fcacf2f968	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5624-f2ce-0357-54a4a7f4c35a	ProgramFestival-read	ProgramFestival - branje	f
00030000-5624-f2ce-588b-015aabbc24ed	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5624-f2ce-3fd3-25609632a620	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5624-f2ce-3acb-14924f90c388	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5624-f2ce-9bab-ecb609075c13	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5624-f2ce-d847-8c42066c2948	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5624-f2ce-ef32-dbe56f379d21	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5624-f2ce-ac63-9e79c306c49f	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5624-f2ce-d8bd-d6c491a8ed53	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5624-f2ce-8354-cb6018fe9208	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5624-f2ce-fbae-85545e03488a	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5624-f2ce-3066-589f950cbcdd	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5624-f2ce-dc4a-96ca3ad4e9c0	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5624-f2ce-1f29-72902ae07066	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5624-f2ce-4779-52f0174f9867	ProgramRazno-read	ProgramRazno - branje	f
00030000-5624-f2ce-4a19-98ab526fa592	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5624-f2ce-cf0e-efa8f8789085	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5624-f2ce-6f82-60b58d903126	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5624-f2ce-60fc-b3425808f889	Prostor-read	Prostor - branje	f
00030000-5624-f2ce-c7e5-6f9fd27ee3f8	Prostor-write	Prostor - spreminjanje	f
00030000-5624-f2ce-6d8f-ee392a2a37db	Racun-read	Racun - branje	f
00030000-5624-f2ce-9539-4398c2a1a6c0	Racun-write	Racun - spreminjanje	f
00030000-5624-f2ce-b8e0-1473396dba5c	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5624-f2ce-747f-722781324106	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5624-f2ce-1e9f-4dce755c9de4	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5624-f2ce-547f-4fa2ece52f73	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5624-f2ce-4d95-a24ed22c1947	Rekvizit-read	Rekvizit - branje	f
00030000-5624-f2ce-a782-a3270a4937d5	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5624-f2ce-6e27-793009f724f3	Revizija-read	Revizija - branje	f
00030000-5624-f2ce-37b8-bec88fe444ff	Revizija-write	Revizija - spreminjanje	f
00030000-5624-f2ce-3c6a-ccc0e64e9483	Rezervacija-read	Rezervacija - branje	f
00030000-5624-f2ce-7ec8-f0afb0eb8ae6	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5624-f2ce-7495-81754bff95fd	SedezniRed-read	SedezniRed - branje	f
00030000-5624-f2ce-075c-03bf597d0e2b	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5624-f2ce-f509-3ee61f58f4a2	Sedez-read	Sedez - branje	f
00030000-5624-f2ce-5e05-a13c41f51abe	Sedez-write	Sedez - spreminjanje	f
00030000-5624-f2ce-633a-da9ff5e386b7	Sezona-read	Sezona - branje	f
00030000-5624-f2ce-c001-f19c9f9ef437	Sezona-write	Sezona - spreminjanje	f
00030000-5624-f2ce-4291-164da8347cdf	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5624-f2ce-8a83-d397de7f64f7	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5624-f2ce-1b7f-a1ab2e60154a	Stevilcenje-read	Stevilcenje - branje	f
00030000-5624-f2ce-f16a-2f8c16cd0a8d	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5624-f2ce-817f-651ed26357a3	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5624-f2ce-9558-0656df557a90	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5624-f2ce-b4a2-78b2761e43fe	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5624-f2ce-8279-c638f2ec7df4	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5624-f2ce-a44c-b347264acfa3	Telefonska-read	Telefonska - branje	f
00030000-5624-f2ce-eb98-77dc9c6fea26	Telefonska-write	Telefonska - spreminjanje	f
00030000-5624-f2ce-4ffd-91d62367c64f	TerminStoritve-read	TerminStoritve - branje	f
00030000-5624-f2ce-c86d-5d9992f1147d	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5624-f2ce-0dd2-3e665df79ee4	TipFunkcije-read	TipFunkcije - branje	f
00030000-5624-f2ce-9c4c-480009878b55	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5624-f2ce-4119-248a977ec39c	TipPopa-read	TipPopa - branje	f
00030000-5624-f2ce-702c-9a352dcbe888	TipPopa-write	TipPopa - spreminjanje	f
00030000-5624-f2ce-5667-f986e003b8c6	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5624-f2ce-82ff-c11058210ced	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5624-f2ce-b83b-a6f896751425	TipVaje-read	TipVaje - branje	f
00030000-5624-f2ce-fb1f-151604bd07b5	TipVaje-write	TipVaje - spreminjanje	f
00030000-5624-f2ce-2e6b-2320e5dba7a0	Trr-read	Trr - branje	f
00030000-5624-f2ce-6e69-c6493afde94c	Trr-write	Trr - spreminjanje	f
00030000-5624-f2ce-912b-73fd53a1dfe5	Uprizoritev-read	Uprizoritev - branje	f
00030000-5624-f2ce-58e0-a2fece13df72	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5624-f2ce-a788-f4a21da38106	Vaja-read	Vaja - branje	f
00030000-5624-f2ce-6e74-8e1c1ca67ff6	Vaja-write	Vaja - spreminjanje	f
00030000-5624-f2ce-8417-758a7a5f6bc8	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5624-f2ce-8792-7567ac07ddfc	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5624-f2ce-216a-a6c109a96564	VrstaStroska-read	VrstaStroska - branje	f
00030000-5624-f2ce-fb50-e3455fc2e392	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5624-f2ce-fd68-a318bdb459d4	Zaposlitev-read	Zaposlitev - branje	f
00030000-5624-f2ce-9365-51733f6598f7	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5624-f2ce-a223-d54ccfebe4c0	Zasedenost-read	Zasedenost - branje	f
00030000-5624-f2ce-b594-424d4b54789d	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5624-f2ce-2267-ff32a07a8f83	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5624-f2ce-afea-a7a8af1e644d	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5624-f2ce-ed61-799fc41a4a5c	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5624-f2ce-a1f8-a7549b542e16	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5624-f2ce-a6c0-7629b3003583	Job-read	Branje opravil - samo zase - branje	f
00030000-5624-f2ce-3057-d2246a9b8cba	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5624-f2ce-a7b7-6ce03584ef38	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5624-f2ce-f988-88000961523a	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5624-f2ce-5c95-896115167a97	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5624-f2ce-3293-f4b0b15cc9a4	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5624-f2ce-f49e-ce36b5e4ff69	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5624-f2ce-3d19-2958981d50e9	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5624-f2ce-06ca-c088df25a8db	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5624-f2ce-cc07-2b4b9d5b55ba	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5624-f2ce-26e7-a6ac44d4ea34	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5624-f2ce-de1a-4d973730328b	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5624-f2ce-a472-a7d132c158ec	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5624-f2ce-799c-778d7a1c59c5	Datoteka-write	Datoteka - spreminjanje	f
00030000-5624-f2ce-7325-32eb05a78cca	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3053 (class 0 OID 22605568)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5624-f2ce-6a6f-52fc97c2bc04	00030000-5624-f2ce-d554-7e0861f1c39b
00020000-5624-f2ce-7fa9-05a0e0a55c31	00030000-5624-f2ce-4c53-07f802ee19f2
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-e76d-55957af4900f
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-f59e-078fa0075334
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-fa7d-a049829cc8c4
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-2a61-eccd55aae1fa
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-093c-9351f346f593
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-e8d8-2c08e8d80a10
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-19ef-4f5bc57d818a
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-6b50-3a635b04e92a
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-4c53-07f802ee19f2
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-ded8-05aed735e3ca
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-c116-dd35747b6fe3
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-4970-31387ae3535b
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-7ce7-e3212a97bfc0
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-c889-1833e3d419f4
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-dd4b-04ba68cc7b91
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-def6-9205a76ce3ea
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-1b9f-68ec6136dd79
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-80d6-092d8f23b541
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-a25c-19e6fdaf9035
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-966d-51accd251d07
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-44a6-941b49e227c1
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-e7a9-3cd56eefcbeb
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-8803-8f72410e5a74
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-97f9-e8987a38058f
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-8b17-6836fdaa919e
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-c1c4-f1322688aed9
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-6ef4-96bff544df29
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-1a8c-ff7d11fa0ab8
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-b8c9-0b96206c47bb
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-d73f-5a805691bca8
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-376e-10cbdbf657ee
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-435a-616266a96d99
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-60fc-b3425808f889
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-c7e5-6f9fd27ee3f8
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-1e9f-4dce755c9de4
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-547f-4fa2ece52f73
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-4d95-a24ed22c1947
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-a782-a3270a4937d5
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-633a-da9ff5e386b7
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-c001-f19c9f9ef437
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-0dd2-3e665df79ee4
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-912b-73fd53a1dfe5
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-58e0-a2fece13df72
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-a788-f4a21da38106
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-6e74-8e1c1ca67ff6
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-a223-d54ccfebe4c0
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-b594-424d4b54789d
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-2267-ff32a07a8f83
00020000-5624-f2cf-24d9-bc302dcc6add	00030000-5624-f2ce-ed61-799fc41a4a5c
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-e76d-55957af4900f
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-093c-9351f346f593
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-e8d8-2c08e8d80a10
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-4c53-07f802ee19f2
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-7ce7-e3212a97bfc0
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-dd4b-04ba68cc7b91
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-1b9f-68ec6136dd79
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-80d6-092d8f23b541
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-a25c-19e6fdaf9035
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-966d-51accd251d07
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-44a6-941b49e227c1
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-e7a9-3cd56eefcbeb
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-8803-8f72410e5a74
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-8b17-6836fdaa919e
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-6ef4-96bff544df29
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-1a8c-ff7d11fa0ab8
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-b8c9-0b96206c47bb
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-60fc-b3425808f889
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-1e9f-4dce755c9de4
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-4d95-a24ed22c1947
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-633a-da9ff5e386b7
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-a44c-b347264acfa3
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-eb98-77dc9c6fea26
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-2e6b-2320e5dba7a0
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-6e69-c6493afde94c
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-fd68-a318bdb459d4
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-9365-51733f6598f7
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-2267-ff32a07a8f83
00020000-5624-f2cf-96bb-5e6a3678f4eb	00030000-5624-f2ce-ed61-799fc41a4a5c
00020000-5624-f2cf-46d4-4d74471eeec0	00030000-5624-f2ce-e76d-55957af4900f
00020000-5624-f2cf-46d4-4d74471eeec0	00030000-5624-f2ce-fa7d-a049829cc8c4
00020000-5624-f2cf-46d4-4d74471eeec0	00030000-5624-f2ce-093c-9351f346f593
00020000-5624-f2cf-46d4-4d74471eeec0	00030000-5624-f2ce-aa40-547aa392bb10
00020000-5624-f2cf-46d4-4d74471eeec0	00030000-5624-f2ce-f185-0509d509439f
00020000-5624-f2cf-46d4-4d74471eeec0	00030000-5624-f2ce-a7fa-f0f10a806a1a
00020000-5624-f2cf-46d4-4d74471eeec0	00030000-5624-f2ce-e8d8-2c08e8d80a10
00020000-5624-f2cf-46d4-4d74471eeec0	00030000-5624-f2ce-4c53-07f802ee19f2
00020000-5624-f2cf-46d4-4d74471eeec0	00030000-5624-f2ce-c116-dd35747b6fe3
00020000-5624-f2cf-46d4-4d74471eeec0	00030000-5624-f2ce-7ce7-e3212a97bfc0
00020000-5624-f2cf-46d4-4d74471eeec0	00030000-5624-f2ce-dd4b-04ba68cc7b91
00020000-5624-f2cf-46d4-4d74471eeec0	00030000-5624-f2ce-1b9f-68ec6136dd79
00020000-5624-f2cf-46d4-4d74471eeec0	00030000-5624-f2ce-a25c-19e6fdaf9035
00020000-5624-f2cf-46d4-4d74471eeec0	00030000-5624-f2ce-966d-51accd251d07
00020000-5624-f2cf-46d4-4d74471eeec0	00030000-5624-f2ce-44a6-941b49e227c1
00020000-5624-f2cf-46d4-4d74471eeec0	00030000-5624-f2ce-8803-8f72410e5a74
00020000-5624-f2cf-46d4-4d74471eeec0	00030000-5624-f2ce-8b17-6836fdaa919e
00020000-5624-f2cf-46d4-4d74471eeec0	00030000-5624-f2ce-b8c9-0b96206c47bb
00020000-5624-f2cf-46d4-4d74471eeec0	00030000-5624-f2ce-376e-10cbdbf657ee
00020000-5624-f2cf-46d4-4d74471eeec0	00030000-5624-f2ce-60fc-b3425808f889
00020000-5624-f2cf-46d4-4d74471eeec0	00030000-5624-f2ce-1e9f-4dce755c9de4
00020000-5624-f2cf-46d4-4d74471eeec0	00030000-5624-f2ce-4d95-a24ed22c1947
00020000-5624-f2cf-46d4-4d74471eeec0	00030000-5624-f2ce-633a-da9ff5e386b7
00020000-5624-f2cf-46d4-4d74471eeec0	00030000-5624-f2ce-0dd2-3e665df79ee4
00020000-5624-f2cf-46d4-4d74471eeec0	00030000-5624-f2ce-a788-f4a21da38106
00020000-5624-f2cf-46d4-4d74471eeec0	00030000-5624-f2ce-a223-d54ccfebe4c0
00020000-5624-f2cf-46d4-4d74471eeec0	00030000-5624-f2ce-2267-ff32a07a8f83
00020000-5624-f2cf-46d4-4d74471eeec0	00030000-5624-f2ce-ed61-799fc41a4a5c
00020000-5624-f2cf-7bf0-284eb823ff0e	00030000-5624-f2ce-e76d-55957af4900f
00020000-5624-f2cf-7bf0-284eb823ff0e	00030000-5624-f2ce-f59e-078fa0075334
00020000-5624-f2cf-7bf0-284eb823ff0e	00030000-5624-f2ce-2a61-eccd55aae1fa
00020000-5624-f2cf-7bf0-284eb823ff0e	00030000-5624-f2ce-093c-9351f346f593
00020000-5624-f2cf-7bf0-284eb823ff0e	00030000-5624-f2ce-e8d8-2c08e8d80a10
00020000-5624-f2cf-7bf0-284eb823ff0e	00030000-5624-f2ce-4c53-07f802ee19f2
00020000-5624-f2cf-7bf0-284eb823ff0e	00030000-5624-f2ce-7ce7-e3212a97bfc0
00020000-5624-f2cf-7bf0-284eb823ff0e	00030000-5624-f2ce-dd4b-04ba68cc7b91
00020000-5624-f2cf-7bf0-284eb823ff0e	00030000-5624-f2ce-a25c-19e6fdaf9035
00020000-5624-f2cf-7bf0-284eb823ff0e	00030000-5624-f2ce-966d-51accd251d07
00020000-5624-f2cf-7bf0-284eb823ff0e	00030000-5624-f2ce-8803-8f72410e5a74
00020000-5624-f2cf-7bf0-284eb823ff0e	00030000-5624-f2ce-8b17-6836fdaa919e
00020000-5624-f2cf-7bf0-284eb823ff0e	00030000-5624-f2ce-b8c9-0b96206c47bb
00020000-5624-f2cf-7bf0-284eb823ff0e	00030000-5624-f2ce-60fc-b3425808f889
00020000-5624-f2cf-7bf0-284eb823ff0e	00030000-5624-f2ce-1e9f-4dce755c9de4
00020000-5624-f2cf-7bf0-284eb823ff0e	00030000-5624-f2ce-4d95-a24ed22c1947
00020000-5624-f2cf-7bf0-284eb823ff0e	00030000-5624-f2ce-633a-da9ff5e386b7
00020000-5624-f2cf-7bf0-284eb823ff0e	00030000-5624-f2ce-0dd2-3e665df79ee4
00020000-5624-f2cf-7bf0-284eb823ff0e	00030000-5624-f2ce-2267-ff32a07a8f83
00020000-5624-f2cf-7bf0-284eb823ff0e	00030000-5624-f2ce-ed61-799fc41a4a5c
00020000-5624-f2cf-0067-5844d3e166ce	00030000-5624-f2ce-e76d-55957af4900f
00020000-5624-f2cf-0067-5844d3e166ce	00030000-5624-f2ce-093c-9351f346f593
00020000-5624-f2cf-0067-5844d3e166ce	00030000-5624-f2ce-e8d8-2c08e8d80a10
00020000-5624-f2cf-0067-5844d3e166ce	00030000-5624-f2ce-4c53-07f802ee19f2
00020000-5624-f2cf-0067-5844d3e166ce	00030000-5624-f2ce-7ce7-e3212a97bfc0
00020000-5624-f2cf-0067-5844d3e166ce	00030000-5624-f2ce-dd4b-04ba68cc7b91
00020000-5624-f2cf-0067-5844d3e166ce	00030000-5624-f2ce-a25c-19e6fdaf9035
00020000-5624-f2cf-0067-5844d3e166ce	00030000-5624-f2ce-966d-51accd251d07
00020000-5624-f2cf-0067-5844d3e166ce	00030000-5624-f2ce-8803-8f72410e5a74
00020000-5624-f2cf-0067-5844d3e166ce	00030000-5624-f2ce-8b17-6836fdaa919e
00020000-5624-f2cf-0067-5844d3e166ce	00030000-5624-f2ce-b8c9-0b96206c47bb
00020000-5624-f2cf-0067-5844d3e166ce	00030000-5624-f2ce-60fc-b3425808f889
00020000-5624-f2cf-0067-5844d3e166ce	00030000-5624-f2ce-1e9f-4dce755c9de4
00020000-5624-f2cf-0067-5844d3e166ce	00030000-5624-f2ce-4d95-a24ed22c1947
00020000-5624-f2cf-0067-5844d3e166ce	00030000-5624-f2ce-633a-da9ff5e386b7
00020000-5624-f2cf-0067-5844d3e166ce	00030000-5624-f2ce-4ffd-91d62367c64f
00020000-5624-f2cf-0067-5844d3e166ce	00030000-5624-f2ce-881d-fe2d3cb18299
00020000-5624-f2cf-0067-5844d3e166ce	00030000-5624-f2ce-0dd2-3e665df79ee4
00020000-5624-f2cf-0067-5844d3e166ce	00030000-5624-f2ce-2267-ff32a07a8f83
00020000-5624-f2cf-0067-5844d3e166ce	00030000-5624-f2ce-ed61-799fc41a4a5c
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-7c19-78d9fc1a1635
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-d554-7e0861f1c39b
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-881d-fe2d3cb18299
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-19ef-4f5bc57d818a
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-f5aa-0b2ea89d9d8d
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-41f7-f33956fb7e7c
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-2e5f-4d0bc1a404d6
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-e76d-55957af4900f
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-f59e-078fa0075334
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-fa7d-a049829cc8c4
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-2a61-eccd55aae1fa
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-093c-9351f346f593
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-aa40-547aa392bb10
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-f185-0509d509439f
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-93fb-7ef06ac5c468
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-a7fa-f0f10a806a1a
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-f691-de4a23e97d25
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-e8d8-2c08e8d80a10
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-6b50-3a635b04e92a
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-4c53-07f802ee19f2
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-ded8-05aed735e3ca
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-1ac4-777051ee378b
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-0ecd-e991aa6c03c4
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-e13e-7db410c33fe4
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-971f-e271d73021d8
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-c116-dd35747b6fe3
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-4970-31387ae3535b
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-7ce7-e3212a97bfc0
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-c889-1833e3d419f4
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-dd4b-04ba68cc7b91
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-def6-9205a76ce3ea
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-1b9f-68ec6136dd79
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-80d6-092d8f23b541
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-a5ba-fd7d9689dc21
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-8527-d5be7b623e44
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-1a62-6248fde51ef3
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-5732-dd1a7c0ecf89
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-a25c-19e6fdaf9035
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-6944-b984492f58b7
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-966d-51accd251d07
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-d7d8-1837f3980d71
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-44a6-941b49e227c1
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-e7a9-3cd56eefcbeb
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-99b3-a8a5afee9348
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-3026-6f2ae0b85b29
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-986f-d0e9082824a0
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-f9d6-92949ac691e1
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-01bb-d0211f7a3e44
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-d65f-9666eeb22245
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-8803-8f72410e5a74
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-97f9-e8987a38058f
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-8b17-6836fdaa919e
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-c1c4-f1322688aed9
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-f068-7aac90f31a80
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-36e1-a02ccc1ae25e
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-2b5e-58e8db8cd5f4
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-a199-5c961bb08dc1
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-6ef4-96bff544df29
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-1a8c-ff7d11fa0ab8
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-b8c9-0b96206c47bb
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-d73f-5a805691bca8
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-99e0-2b60776f58b4
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-b13d-03955618205a
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-3119-922f929530ef
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-f95c-d477391a6cbb
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-376e-10cbdbf657ee
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-435a-616266a96d99
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-9c58-a95364f99332
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-4edd-94fcacf2f968
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-0357-54a4a7f4c35a
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-588b-015aabbc24ed
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-3fd3-25609632a620
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-3acb-14924f90c388
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-9bab-ecb609075c13
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-d847-8c42066c2948
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-ef32-dbe56f379d21
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-ac63-9e79c306c49f
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-d8bd-d6c491a8ed53
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-8354-cb6018fe9208
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-fbae-85545e03488a
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-3066-589f950cbcdd
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-dc4a-96ca3ad4e9c0
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-1f29-72902ae07066
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-4779-52f0174f9867
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-4a19-98ab526fa592
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-cf0e-efa8f8789085
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-6f82-60b58d903126
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-60fc-b3425808f889
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-c7e5-6f9fd27ee3f8
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-6d8f-ee392a2a37db
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-9539-4398c2a1a6c0
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-b8e0-1473396dba5c
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-747f-722781324106
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-1e9f-4dce755c9de4
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-547f-4fa2ece52f73
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-4d95-a24ed22c1947
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-a782-a3270a4937d5
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-6e27-793009f724f3
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-37b8-bec88fe444ff
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-3c6a-ccc0e64e9483
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-7ec8-f0afb0eb8ae6
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-7495-81754bff95fd
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-075c-03bf597d0e2b
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-f509-3ee61f58f4a2
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-5e05-a13c41f51abe
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-633a-da9ff5e386b7
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-c001-f19c9f9ef437
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-4291-164da8347cdf
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-8a83-d397de7f64f7
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-1b7f-a1ab2e60154a
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-f16a-2f8c16cd0a8d
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-817f-651ed26357a3
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-9558-0656df557a90
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-b4a2-78b2761e43fe
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-8279-c638f2ec7df4
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-a44c-b347264acfa3
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-eb98-77dc9c6fea26
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-4ffd-91d62367c64f
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-c86d-5d9992f1147d
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-0dd2-3e665df79ee4
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-9c4c-480009878b55
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-5667-f986e003b8c6
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-82ff-c11058210ced
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-2e6b-2320e5dba7a0
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-6e69-c6493afde94c
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-912b-73fd53a1dfe5
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-58e0-a2fece13df72
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-a788-f4a21da38106
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-6e74-8e1c1ca67ff6
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-8417-758a7a5f6bc8
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-8792-7567ac07ddfc
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-216a-a6c109a96564
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-fb50-e3455fc2e392
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-fd68-a318bdb459d4
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-9365-51733f6598f7
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-a223-d54ccfebe4c0
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-b594-424d4b54789d
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-2267-ff32a07a8f83
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-afea-a7a8af1e644d
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-ed61-799fc41a4a5c
00020000-5624-f2d0-793a-5d9b5c601791	00030000-5624-f2ce-a1f8-a7549b542e16
\.


--
-- TOC entry 3086 (class 0 OID 22605932)
-- Dependencies: 213
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3090 (class 0 OID 22605966)
-- Dependencies: 217
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3102 (class 0 OID 22606103)
-- Dependencies: 229
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5624-f2d0-80a8-48084dc0ad09	00090000-5624-f2d0-331b-00f5c6ee7728	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5624-f2d0-f854-069efbbda5f4	00090000-5624-f2d0-7c70-698089a1218e	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5624-f2d0-25e2-470382c1436f	00090000-5624-f2d0-0ade-11f3c4010ef3	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5624-f2d0-522a-dd50c209432f	00090000-5624-f2d0-4d45-30c82caa8fea	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3059 (class 0 OID 22605638)
-- Dependencies: 186
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5624-f2d0-a2b7-d7a037a4412b	\N	00040000-5624-f2ce-b643-8521c4034e83	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-f2d0-84ee-a8b6d7231acb	\N	00040000-5624-f2ce-b643-8521c4034e83	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5624-f2d0-3f23-9b030a16404d	\N	00040000-5624-f2ce-b643-8521c4034e83	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-f2d0-5f14-cfbfda67a588	\N	00040000-5624-f2ce-b643-8521c4034e83	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-f2d0-db16-ce7190947dab	\N	00040000-5624-f2ce-b643-8521c4034e83	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-f2d0-d516-aeb4b915e885	\N	00040000-5624-f2ce-4286-7e6ca4d18eb5	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-f2d0-0279-42aba05beb29	\N	00040000-5624-f2ce-f26f-70e0d3e8b048	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-f2d0-7c1f-171a266791be	\N	00040000-5624-f2ce-0251-6d38ae9fc7d3	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-f2d0-98c0-4f8231c85025	\N	00040000-5624-f2ce-6180-00cfa4d990f4	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-f2d1-d289-b31164ff0c30	\N	00040000-5624-f2ce-b643-8521c4034e83	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3062 (class 0 OID 22605684)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5624-f2ce-cb2a-4a8847c06e0a	8341	Adlešiči
00050000-5624-f2ce-95c8-24a03ddfdb65	5270	Ajdovščina
00050000-5624-f2ce-a8a7-faad854d17df	6280	Ankaran/Ancarano
00050000-5624-f2ce-531a-98778344704b	9253	Apače
00050000-5624-f2ce-2f8c-1ecca113657c	8253	Artiče
00050000-5624-f2ce-b99d-a62d2f9ce377	4275	Begunje na Gorenjskem
00050000-5624-f2ce-94ba-833950035ac8	1382	Begunje pri Cerknici
00050000-5624-f2ce-4069-6f11794dccbe	9231	Beltinci
00050000-5624-f2ce-66ee-1a77872a7e5e	2234	Benedikt
00050000-5624-f2ce-dde0-a4e8db91fc37	2345	Bistrica ob Dravi
00050000-5624-f2ce-1d97-f0f53bf8ba97	3256	Bistrica ob Sotli
00050000-5624-f2ce-f119-2dcf88767448	8259	Bizeljsko
00050000-5624-f2ce-64b3-590826bfb6b6	1223	Blagovica
00050000-5624-f2ce-f475-6f6c0d96f110	8283	Blanca
00050000-5624-f2ce-47d2-499ab297b925	4260	Bled
00050000-5624-f2ce-a26c-7d0cc830023f	4273	Blejska Dobrava
00050000-5624-f2ce-a34a-4b6394883cca	9265	Bodonci
00050000-5624-f2ce-9125-839ca2710508	9222	Bogojina
00050000-5624-f2ce-773e-b1529ea04b1c	4263	Bohinjska Bela
00050000-5624-f2ce-ed63-ec87de520534	4264	Bohinjska Bistrica
00050000-5624-f2ce-4cfe-d17d248150d1	4265	Bohinjsko jezero
00050000-5624-f2ce-8ea8-efa634d99f2d	1353	Borovnica
00050000-5624-f2ce-f27d-30015931ee33	8294	Boštanj
00050000-5624-f2ce-1e49-83eacaa7f487	5230	Bovec
00050000-5624-f2ce-6021-cbd9bb3c2c70	5295	Branik
00050000-5624-f2ce-6698-64138c842334	3314	Braslovče
00050000-5624-f2ce-6230-8ff147b2fcea	5223	Breginj
00050000-5624-f2ce-5a92-6fe0ff95671c	8280	Brestanica
00050000-5624-f2ce-246d-982f8fe20d1f	2354	Bresternica
00050000-5624-f2ce-8621-98c679a43d89	4243	Brezje
00050000-5624-f2ce-be56-fffdcac218ff	1351	Brezovica pri Ljubljani
00050000-5624-f2ce-84ea-5e37e5b1187b	8250	Brežice
00050000-5624-f2ce-b16e-0fd2d7b46ff4	4210	Brnik - Aerodrom
00050000-5624-f2ce-7773-c480da21e95c	8321	Brusnice
00050000-5624-f2ce-3a9f-7b33a722e625	3255	Buče
00050000-5624-f2ce-42a7-87929e56418f	8276	Bučka 
00050000-5624-f2ce-cb99-d05ccf1471fb	9261	Cankova
00050000-5624-f2ce-946c-910196d5bef3	3000	Celje 
00050000-5624-f2ce-5bfd-d39395f4f28c	3001	Celje - poštni predali
00050000-5624-f2ce-8121-c100161cc694	4207	Cerklje na Gorenjskem
00050000-5624-f2ce-8bd3-1885d21c2e3c	8263	Cerklje ob Krki
00050000-5624-f2ce-4285-e657dd74d760	1380	Cerknica
00050000-5624-f2ce-101b-6bf77627e5de	5282	Cerkno
00050000-5624-f2ce-9f54-28e92c03e414	2236	Cerkvenjak
00050000-5624-f2ce-de19-fbba2533d166	2215	Ceršak
00050000-5624-f2ce-1ec8-bc340c9318ac	2326	Cirkovce
00050000-5624-f2ce-58bd-6410fc66324d	2282	Cirkulane
00050000-5624-f2ce-29f0-ee2963f2393f	5273	Col
00050000-5624-f2ce-d1a2-6c633eff38ce	8251	Čatež ob Savi
00050000-5624-f2ce-0735-ebf7861932ea	1413	Čemšenik
00050000-5624-f2ce-6310-7a8ae1ed7eba	5253	Čepovan
00050000-5624-f2ce-bdde-008c21002fa0	9232	Črenšovci
00050000-5624-f2ce-0fba-d3da2678edfe	2393	Črna na Koroškem
00050000-5624-f2ce-0520-0226e2982917	6275	Črni Kal
00050000-5624-f2ce-3d6d-1bf0fc80e8ad	5274	Črni Vrh nad Idrijo
00050000-5624-f2ce-71c9-9ead4e6b2aab	5262	Črniče
00050000-5624-f2ce-0830-68b87477b811	8340	Črnomelj
00050000-5624-f2ce-e643-53100045439c	6271	Dekani
00050000-5624-f2ce-9743-438fa2a6fadc	5210	Deskle
00050000-5624-f2ce-5920-881e4207f52c	2253	Destrnik
00050000-5624-f2ce-80ae-8444f746e254	6215	Divača
00050000-5624-f2ce-0df7-e512bb3c1b49	1233	Dob
00050000-5624-f2ce-4300-ab40ab22cb3a	3224	Dobje pri Planini
00050000-5624-f2ce-f278-6a66d40c34b6	8257	Dobova
00050000-5624-f2ce-2d86-d4a011ba789c	1423	Dobovec
00050000-5624-f2ce-5f0e-6061883b2a27	5263	Dobravlje
00050000-5624-f2ce-e18b-36bae55e33ad	3204	Dobrna
00050000-5624-f2ce-01c6-82fbded401b3	8211	Dobrnič
00050000-5624-f2ce-ef7c-29a270fb9fc0	1356	Dobrova
00050000-5624-f2ce-a9f4-e278b2b081dd	9223	Dobrovnik/Dobronak 
00050000-5624-f2ce-ccb1-d1b83bc762b6	5212	Dobrovo v Brdih
00050000-5624-f2ce-4ac9-e023f53dda33	1431	Dol pri Hrastniku
00050000-5624-f2ce-d086-7413e529c063	1262	Dol pri Ljubljani
00050000-5624-f2ce-c157-4d370b352e29	1273	Dole pri Litiji
00050000-5624-f2ce-fc51-9b78a1bea39e	1331	Dolenja vas
00050000-5624-f2ce-6807-3c38cdfde8f3	8350	Dolenjske Toplice
00050000-5624-f2ce-76d4-84494c0505af	1230	Domžale
00050000-5624-f2ce-c8ca-d372a58e275f	2252	Dornava
00050000-5624-f2ce-5dfb-495919af8808	5294	Dornberk
00050000-5624-f2ce-66b1-6a1aa293d7bc	1319	Draga
00050000-5624-f2ce-9e17-62570688a4fe	8343	Dragatuš
00050000-5624-f2ce-1e47-344553ea9428	3222	Dramlje
00050000-5624-f2ce-4d72-8a8798fda823	2370	Dravograd
00050000-5624-f2ce-7252-e21e9ee29ecb	4203	Duplje
00050000-5624-f2ce-f087-d386b4a89d97	6221	Dutovlje
00050000-5624-f2ce-159d-3b6015994535	8361	Dvor
00050000-5624-f2ce-b5a9-f2c4f97ce83f	2343	Fala
00050000-5624-f2ce-e2e2-a0694b082bec	9208	Fokovci
00050000-5624-f2ce-5e6d-5df6c7125065	2313	Fram
00050000-5624-f2ce-c48d-1c4d9672fea4	3213	Frankolovo
00050000-5624-f2ce-7b98-262a9024d93a	1274	Gabrovka
00050000-5624-f2ce-342f-c9af6947e751	8254	Globoko
00050000-5624-f2ce-38f2-0860938645b3	5275	Godovič
00050000-5624-f2ce-935f-d4c14b516a40	4204	Golnik
00050000-5624-f2ce-d890-1b87db35972d	3303	Gomilsko
00050000-5624-f2ce-4152-1f229c084124	4224	Gorenja vas
00050000-5624-f2ce-7b43-9b754f48f307	3263	Gorica pri Slivnici
00050000-5624-f2ce-a1e3-1ced6bad541a	2272	Gorišnica
00050000-5624-f2ce-dc63-9b4b01dfc757	9250	Gornja Radgona
00050000-5624-f2ce-680f-af5abe0b450f	3342	Gornji Grad
00050000-5624-f2ce-5893-2ed4ad00aeb3	4282	Gozd Martuljek
00050000-5624-f2ce-a0c3-c8d4a47fa7f4	6272	Gračišče
00050000-5624-f2ce-cbd4-0b4c3b64ea11	9264	Grad
00050000-5624-f2ce-0d20-a9e810395899	8332	Gradac
00050000-5624-f2ce-b881-39df18e0c50f	1384	Grahovo
00050000-5624-f2ce-84fa-17a52fb27698	5242	Grahovo ob Bači
00050000-5624-f2ce-35b2-6c99782666d4	5251	Grgar
00050000-5624-f2ce-1b4c-4794ff4100c7	3302	Griže
00050000-5624-f2ce-c1d1-2878c7fa3857	3231	Grobelno
00050000-5624-f2ce-ff31-e16bb50289f6	1290	Grosuplje
00050000-5624-f2ce-3f93-258c1d63b1a4	2288	Hajdina
00050000-5624-f2ce-48da-50fde2036c78	8362	Hinje
00050000-5624-f2ce-d555-b8d7c5ac606c	2311	Hoče
00050000-5624-f2ce-39c8-4a7e64095b49	9205	Hodoš/Hodos
00050000-5624-f2ce-7083-8b5aff6409d7	1354	Horjul
00050000-5624-f2ce-b413-b8d4122ef4b2	1372	Hotedršica
00050000-5624-f2ce-7a26-fe868bbc3cca	1430	Hrastnik
00050000-5624-f2ce-1945-3a1965c79757	6225	Hruševje
00050000-5624-f2ce-0b02-88051735dde6	4276	Hrušica
00050000-5624-f2ce-a376-ddf489a01c7f	5280	Idrija
00050000-5624-f2ce-8810-4e7149ae5782	1292	Ig
00050000-5624-f2ce-3cee-44aed61d5a13	6250	Ilirska Bistrica
00050000-5624-f2ce-a0f6-62ba4817aaef	6251	Ilirska Bistrica-Trnovo
00050000-5624-f2ce-410e-b8f635bef169	1295	Ivančna Gorica
00050000-5624-f2ce-38e3-62e4d90b1a4f	2259	Ivanjkovci
00050000-5624-f2ce-1a29-4c3120548103	1411	Izlake
00050000-5624-f2ce-1ba0-d26044b3b60e	6310	Izola/Isola
00050000-5624-f2ce-d637-6915f2876bb7	2222	Jakobski Dol
00050000-5624-f2ce-78a6-cfe6296e490d	2221	Jarenina
00050000-5624-f2ce-b31a-a13c681638f5	6254	Jelšane
00050000-5624-f2ce-960f-1f2e83636097	4270	Jesenice
00050000-5624-f2ce-aa46-1d12c46a4554	8261	Jesenice na Dolenjskem
00050000-5624-f2ce-33b7-fad709cbf87a	3273	Jurklošter
00050000-5624-f2ce-8391-6c1e4e26c311	2223	Jurovski Dol
00050000-5624-f2ce-26ec-3601d1d45dd2	2256	Juršinci
00050000-5624-f2ce-e151-542be18a6bd9	5214	Kal nad Kanalom
00050000-5624-f2ce-aaff-a21f4848efb6	3233	Kalobje
00050000-5624-f2ce-4abc-975e69f22340	4246	Kamna Gorica
00050000-5624-f2ce-637f-1ca1780a5cde	2351	Kamnica
00050000-5624-f2ce-2d85-7f9d2c6eddda	1241	Kamnik
00050000-5624-f2ce-cd10-ddc58ccc61a4	5213	Kanal
00050000-5624-f2ce-c4bb-d3e60bea9726	8258	Kapele
00050000-5624-f2ce-da6c-61111de45bf4	2362	Kapla
00050000-5624-f2ce-ab72-6680e090dc77	2325	Kidričevo
00050000-5624-f2ce-0437-290cbeafd58c	1412	Kisovec
00050000-5624-f2ce-2298-01a2b4eabf30	6253	Knežak
00050000-5624-f2ce-b7b4-762131eeb1cc	5222	Kobarid
00050000-5624-f2ce-d44c-140efc3d1aa1	9227	Kobilje
00050000-5624-f2ce-907c-09a44619a4de	1330	Kočevje
00050000-5624-f2ce-9016-91eb929ead7b	1338	Kočevska Reka
00050000-5624-f2ce-445a-662298ed4141	2276	Kog
00050000-5624-f2ce-b4cb-119ff29c0aac	5211	Kojsko
00050000-5624-f2ce-5a11-270bc29fcc72	6223	Komen
00050000-5624-f2ce-af55-e8f8e4ac3635	1218	Komenda
00050000-5624-f2ce-7820-615233eed90e	6000	Koper/Capodistria 
00050000-5624-f2ce-5d14-bb61ee82d81b	6001	Koper/Capodistria - poštni predali
00050000-5624-f2ce-ea37-8430280eb973	8282	Koprivnica
00050000-5624-f2ce-fed2-0693e73136d1	5296	Kostanjevica na Krasu
00050000-5624-f2ce-fb28-80c3bc423ac5	8311	Kostanjevica na Krki
00050000-5624-f2ce-6c2f-39d33078cb27	1336	Kostel
00050000-5624-f2ce-8d1b-883000cec0c4	6256	Košana
00050000-5624-f2ce-a3a9-c86f60402dea	2394	Kotlje
00050000-5624-f2ce-5e80-5374af6f7d13	6240	Kozina
00050000-5624-f2ce-56a2-ed2a39d23799	3260	Kozje
00050000-5624-f2ce-58fb-5129ba280dc9	4000	Kranj 
00050000-5624-f2ce-14e5-b87cf8cb0a17	4001	Kranj - poštni predali
00050000-5624-f2ce-cae9-bdf968d694fc	4280	Kranjska Gora
00050000-5624-f2ce-05ad-1c49595169d7	1281	Kresnice
00050000-5624-f2ce-b192-4784b21adb41	4294	Križe
00050000-5624-f2ce-7d7c-bc3231117d59	9206	Križevci
00050000-5624-f2ce-775d-dbd071353962	9242	Križevci pri Ljutomeru
00050000-5624-f2ce-d641-557bcd4c5af4	1301	Krka
00050000-5624-f2ce-2030-b4042356fa5c	8296	Krmelj
00050000-5624-f2ce-829a-0e762a3f3b72	4245	Kropa
00050000-5624-f2ce-081d-2420ba69ac1b	8262	Krška vas
00050000-5624-f2ce-0add-464095062162	8270	Krško
00050000-5624-f2ce-0a8f-9d839da8e267	9263	Kuzma
00050000-5624-f2ce-6c3f-d814b9aead0c	2318	Laporje
00050000-5624-f2ce-0e3f-3d8c1b5bea1f	3270	Laško
00050000-5624-f2ce-1220-edf9fa724684	1219	Laze v Tuhinju
00050000-5624-f2ce-94b4-eff6f70e1c0d	2230	Lenart v Slovenskih goricah
00050000-5624-f2ce-d0f6-e506a1309336	9220	Lendava/Lendva
00050000-5624-f2ce-79bd-9b0dc87a9263	4248	Lesce
00050000-5624-f2ce-c2ff-05561b11e1bb	3261	Lesično
00050000-5624-f2ce-2c27-181f866b6a89	8273	Leskovec pri Krškem
00050000-5624-f2ce-df96-2e1ce48f1cb7	2372	Libeliče
00050000-5624-f2ce-d364-42a0e64eb3af	2341	Limbuš
00050000-5624-f2ce-1938-b0808a5b03ba	1270	Litija
00050000-5624-f2ce-eabe-18e5a8545b28	3202	Ljubečna
00050000-5624-f2ce-6843-8dd31e8d9314	1000	Ljubljana 
00050000-5624-f2ce-93b4-144d4c2e944d	1001	Ljubljana - poštni predali
00050000-5624-f2ce-ad16-2818a30dda67	1231	Ljubljana - Črnuče
00050000-5624-f2ce-d260-99cf0187974a	1261	Ljubljana - Dobrunje
00050000-5624-f2ce-81e8-6a04a8c33c4b	1260	Ljubljana - Polje
00050000-5624-f2ce-2328-3bf1f69e1cd6	1210	Ljubljana - Šentvid
00050000-5624-f2ce-ece1-f22b5a019ba0	1211	Ljubljana - Šmartno
00050000-5624-f2ce-87e6-cd43cf8fd64b	3333	Ljubno ob Savinji
00050000-5624-f2ce-8319-2b52edb1a544	9240	Ljutomer
00050000-5624-f2ce-89c1-9a46103d41d9	3215	Loče
00050000-5624-f2ce-3d98-a0dd505102f5	5231	Log pod Mangartom
00050000-5624-f2ce-e529-2c65632bb3d5	1358	Log pri Brezovici
00050000-5624-f2ce-fd99-9109ac5bd9de	1370	Logatec
00050000-5624-f2ce-08fa-1d96bf09419d	1371	Logatec
00050000-5624-f2ce-d909-7b7d5d93f924	1434	Loka pri Zidanem Mostu
00050000-5624-f2ce-a622-e63ea68daae6	3223	Loka pri Žusmu
00050000-5624-f2ce-58c5-e8a5e95f62c4	6219	Lokev
00050000-5624-f2ce-9104-1f3aee47cdc5	1318	Loški Potok
00050000-5624-f2ce-86af-9b04f2e9f087	2324	Lovrenc na Dravskem polju
00050000-5624-f2ce-1695-c23162e7e0b0	2344	Lovrenc na Pohorju
00050000-5624-f2ce-3738-5dc8cd361cf5	3334	Luče
00050000-5624-f2ce-949c-6b61d39e9c7a	1225	Lukovica
00050000-5624-f2ce-d635-3204d64bb80d	9202	Mačkovci
00050000-5624-f2ce-a4d2-4b321311afae	2322	Majšperk
00050000-5624-f2ce-a885-09d0bb6995b2	2321	Makole
00050000-5624-f2ce-9a8a-294c5be5247f	9243	Mala Nedelja
00050000-5624-f2ce-ae3d-a1eb22ec0d95	2229	Malečnik
00050000-5624-f2ce-d459-756847b62c32	6273	Marezige
00050000-5624-f2ce-f87d-402b646d02a2	2000	Maribor 
00050000-5624-f2ce-f570-f907e68eec14	2001	Maribor - poštni predali
00050000-5624-f2ce-328c-95f1f119c103	2206	Marjeta na Dravskem polju
00050000-5624-f2ce-e6ab-ce46b2050620	2281	Markovci
00050000-5624-f2ce-dbfd-78755cae7a5f	9221	Martjanci
00050000-5624-f2ce-c72e-dae9b93f2a19	6242	Materija
00050000-5624-f2ce-f0cd-2d364da35ad5	4211	Mavčiče
00050000-5624-f2ce-647f-5a9ec90645a0	1215	Medvode
00050000-5624-f2ce-7d5a-b985119c63a1	1234	Mengeš
00050000-5624-f2ce-6de3-e2c84b78f95e	8330	Metlika
00050000-5624-f2ce-341f-dbdc7bc49e0b	2392	Mežica
00050000-5624-f2ce-8bbe-6bf9a1e727df	2204	Miklavž na Dravskem polju
00050000-5624-f2ce-bb65-943d7acc819e	2275	Miklavž pri Ormožu
00050000-5624-f2ce-00ee-7a4580309140	5291	Miren
00050000-5624-f2ce-ebf8-8cba34457af1	8233	Mirna
00050000-5624-f2ce-703a-bff2ebb2ad32	8216	Mirna Peč
00050000-5624-f2ce-4c7d-ad8389d21866	2382	Mislinja
00050000-5624-f2ce-d6ac-72ff5e44472b	4281	Mojstrana
00050000-5624-f2ce-9a80-afba81ad5b7d	8230	Mokronog
00050000-5624-f2ce-093f-a57a8f3af7a6	1251	Moravče
00050000-5624-f2ce-9b1d-8c0c1a6620c6	9226	Moravske Toplice
00050000-5624-f2ce-8949-8496b561408f	5216	Most na Soči
00050000-5624-f2ce-a1bd-846b4bfb56e0	1221	Motnik
00050000-5624-f2ce-705a-9adc78b2af43	3330	Mozirje
00050000-5624-f2ce-3dab-32905c011453	9000	Murska Sobota 
00050000-5624-f2ce-b277-a7f69a55bd90	9001	Murska Sobota - poštni predali
00050000-5624-f2ce-508a-c9d78aa82479	2366	Muta
00050000-5624-f2ce-6fbd-697776253c90	4202	Naklo
00050000-5624-f2ce-a8e9-0f93fe426f2b	3331	Nazarje
00050000-5624-f2ce-da57-00247e7ff8e3	1357	Notranje Gorice
00050000-5624-f2ce-eb6a-91cb47271cb3	3203	Nova Cerkev
00050000-5624-f2ce-282b-e9b750b69884	5000	Nova Gorica 
00050000-5624-f2ce-440b-170aee0aa682	5001	Nova Gorica - poštni predali
00050000-5624-f2ce-beba-5529db18b8ee	1385	Nova vas
00050000-5624-f2ce-adde-612e925af38f	8000	Novo mesto
00050000-5624-f2ce-d726-dee6ef8fef77	8001	Novo mesto - poštni predali
00050000-5624-f2ce-26a9-529435a50acd	6243	Obrov
00050000-5624-f2ce-4d62-16844c52c7aa	9233	Odranci
00050000-5624-f2ce-7bad-6975d12f0977	2317	Oplotnica
00050000-5624-f2ce-b96c-2a49e1a36ffc	2312	Orehova vas
00050000-5624-f2ce-fe45-fc8f0924055b	2270	Ormož
00050000-5624-f2ce-bf76-6ab98e412422	1316	Ortnek
00050000-5624-f2ce-c008-10898c9a2ede	1337	Osilnica
00050000-5624-f2ce-8f66-0302a878ea09	8222	Otočec
00050000-5624-f2ce-2a99-396a75401e72	2361	Ožbalt
00050000-5624-f2ce-448a-c6a55e1c1bb9	2231	Pernica
00050000-5624-f2ce-92f2-46c4a1d161b3	2211	Pesnica pri Mariboru
00050000-5624-f2ce-4b10-9c532956a698	9203	Petrovci
00050000-5624-f2ce-e74d-8e56699b7555	3301	Petrovče
00050000-5624-f2ce-ff2e-3d6400e6ee70	6330	Piran/Pirano
00050000-5624-f2ce-9187-3a517a413cf2	8255	Pišece
00050000-5624-f2ce-9eda-5bce6e15b1f9	6257	Pivka
00050000-5624-f2ce-06da-9ecd99358425	6232	Planina
00050000-5624-f2ce-59c0-479ee7255654	3225	Planina pri Sevnici
00050000-5624-f2ce-d046-20e3f9f78d39	6276	Pobegi
00050000-5624-f2ce-196c-84fec85e6fbf	8312	Podbočje
00050000-5624-f2ce-12df-6b276ee654ac	5243	Podbrdo
00050000-5624-f2ce-951a-0e8f511f4f0d	3254	Podčetrtek
00050000-5624-f2ce-c914-e6cda4259e1c	2273	Podgorci
00050000-5624-f2ce-5cda-99a5c9ead800	6216	Podgorje
00050000-5624-f2ce-3b35-45d4fab0c6f0	2381	Podgorje pri Slovenj Gradcu
00050000-5624-f2ce-41bb-f44caeee3dba	6244	Podgrad
00050000-5624-f2ce-4a82-1c547c6e4926	1414	Podkum
00050000-5624-f2ce-c062-bf606234555d	2286	Podlehnik
00050000-5624-f2ce-b9f2-4a8a6f879ba9	5272	Podnanos
00050000-5624-f2ce-c78b-810bd65c30c6	4244	Podnart
00050000-5624-f2ce-0b18-63a1dad4aca3	3241	Podplat
00050000-5624-f2ce-fccb-55f887e89891	3257	Podsreda
00050000-5624-f2ce-ab02-a25ce6f914e5	2363	Podvelka
00050000-5624-f2ce-b696-4d4d517a1c74	2208	Pohorje
00050000-5624-f2ce-d735-93aa099144b3	2257	Polenšak
00050000-5624-f2ce-682e-81047caf4116	1355	Polhov Gradec
00050000-5624-f2ce-d392-5cd6d07be56d	4223	Poljane nad Škofjo Loko
00050000-5624-f2ce-c5ed-c43519f218fb	2319	Poljčane
00050000-5624-f2ce-55d0-663908b571b1	1272	Polšnik
00050000-5624-f2ce-9950-71af9d7537ef	3313	Polzela
00050000-5624-f2ce-3ac0-0d07e215d49c	3232	Ponikva
00050000-5624-f2ce-7d71-968c17bd21dd	6320	Portorož/Portorose
00050000-5624-f2ce-8a58-c542753c7bb3	6230	Postojna
00050000-5624-f2ce-4803-7c85ce2c8658	2331	Pragersko
00050000-5624-f2ce-da56-2f8dc00a0cc0	3312	Prebold
00050000-5624-f2ce-6cf1-da3204465bbb	4205	Preddvor
00050000-5624-f2ce-7e77-379b99962d75	6255	Prem
00050000-5624-f2ce-2be8-f01edff53331	1352	Preserje
00050000-5624-f2ce-6f09-d89e3b5661fe	6258	Prestranek
00050000-5624-f2ce-6e61-809721c4a5c7	2391	Prevalje
00050000-5624-f2ce-88b6-03b8b4170334	3262	Prevorje
00050000-5624-f2ce-d58e-944e726c8dec	1276	Primskovo 
00050000-5624-f2ce-8231-28815231deaf	3253	Pristava pri Mestinju
00050000-5624-f2ce-4193-3d9e33a2be3c	9207	Prosenjakovci/Partosfalva
00050000-5624-f2ce-e873-0dd290b80b72	5297	Prvačina
00050000-5624-f2ce-8992-0a7551f0c8d9	2250	Ptuj
00050000-5624-f2ce-2522-c8574b165019	2323	Ptujska Gora
00050000-5624-f2ce-d977-059a053907e2	9201	Puconci
00050000-5624-f2ce-d6a4-544707983a05	2327	Rače
00050000-5624-f2ce-2f0e-cb128bd47af4	1433	Radeče
00050000-5624-f2ce-8871-a63691319871	9252	Radenci
00050000-5624-f2ce-78f2-fa038c96fd53	2360	Radlje ob Dravi
00050000-5624-f2ce-fb53-8c89e5d5f9df	1235	Radomlje
00050000-5624-f2ce-53a6-02264520f84b	4240	Radovljica
00050000-5624-f2ce-a430-020cb4acc09f	8274	Raka
00050000-5624-f2ce-31a6-58a30713ab9e	1381	Rakek
00050000-5624-f2ce-9797-3bd0bc6384c6	4283	Rateče - Planica
00050000-5624-f2ce-e8a1-a004b9f08647	2390	Ravne na Koroškem
00050000-5624-f2ce-c934-fc8df86106a8	9246	Razkrižje
00050000-5624-f2ce-11d5-b2826f91bd71	3332	Rečica ob Savinji
00050000-5624-f2ce-693e-1daa54c97969	5292	Renče
00050000-5624-f2ce-c4ec-5d41deb6e82e	1310	Ribnica
00050000-5624-f2ce-c60d-5522c15ffe1f	2364	Ribnica na Pohorju
00050000-5624-f2ce-61e7-ca768540c96d	3272	Rimske Toplice
00050000-5624-f2ce-16bb-ee4b7a386e0c	1314	Rob
00050000-5624-f2ce-6dee-d14daed41120	5215	Ročinj
00050000-5624-f2ce-c4d9-460e87c0b09d	3250	Rogaška Slatina
00050000-5624-f2ce-eb4e-a6ec3d4f7b0f	9262	Rogašovci
00050000-5624-f2ce-808a-e9f0d0796211	3252	Rogatec
00050000-5624-f2ce-b1d3-f5e347cadd9f	1373	Rovte
00050000-5624-f2ce-530f-ccd02daa6a3d	2342	Ruše
00050000-5624-f2ce-4421-e1389f125326	1282	Sava
00050000-5624-f2ce-4d29-3a29bda70b25	6333	Sečovlje/Sicciole
00050000-5624-f2ce-06fe-8ecddf6fa01c	4227	Selca
00050000-5624-f2ce-53f9-e37d4f1fe664	2352	Selnica ob Dravi
00050000-5624-f2ce-f43d-f9e92f91470e	8333	Semič
00050000-5624-f2ce-9bb9-2ca2987385e8	8281	Senovo
00050000-5624-f2ce-0428-5a1304fab36a	6224	Senožeče
00050000-5624-f2ce-ff15-aef3635e4ba1	8290	Sevnica
00050000-5624-f2ce-10cf-42114d6d18a5	6210	Sežana
00050000-5624-f2ce-c5c9-f7170412fc0f	2214	Sladki Vrh
00050000-5624-f2ce-aea7-f63c87ddf0a7	5283	Slap ob Idrijci
00050000-5624-f2ce-d240-50f4f6e8451e	2380	Slovenj Gradec
00050000-5624-f2ce-aca0-37fd80229920	2310	Slovenska Bistrica
00050000-5624-f2ce-63e7-e8e568705115	3210	Slovenske Konjice
00050000-5624-f2ce-7cc1-d77e11fd5026	1216	Smlednik
00050000-5624-f2ce-bf98-c13319b8cc2c	5232	Soča
00050000-5624-f2ce-5487-9bab7d198c49	1317	Sodražica
00050000-5624-f2ce-d6bc-c202e2f10ce5	3335	Solčava
00050000-5624-f2ce-6fb1-4f4151df68ed	5250	Solkan
00050000-5624-f2ce-0525-d859ac808de0	4229	Sorica
00050000-5624-f2ce-9aaf-b3c52fac274a	4225	Sovodenj
00050000-5624-f2ce-dbdf-1abb2b089e71	5281	Spodnja Idrija
00050000-5624-f2ce-3472-12c0140cd194	2241	Spodnji Duplek
00050000-5624-f2ce-de85-f231d52d2053	9245	Spodnji Ivanjci
00050000-5624-f2ce-123c-637e7cf65923	2277	Središče ob Dravi
00050000-5624-f2ce-30cc-6fbf9429c09e	4267	Srednja vas v Bohinju
00050000-5624-f2ce-082c-0efaa0bb83f0	8256	Sromlje 
00050000-5624-f2ce-5027-bd47b2eca772	5224	Srpenica
00050000-5624-f2ce-9ad8-191dd1318743	1242	Stahovica
00050000-5624-f2ce-ce95-255eed5620e8	1332	Stara Cerkev
00050000-5624-f2ce-1862-d6cf70e25b71	8342	Stari trg ob Kolpi
00050000-5624-f2ce-8c10-7e6addef3d29	1386	Stari trg pri Ložu
00050000-5624-f2ce-a7c0-3aa043741f63	2205	Starše
00050000-5624-f2ce-d93c-22813f00b55d	2289	Stoperce
00050000-5624-f2ce-1fe1-951ed0e80a70	8322	Stopiče
00050000-5624-f2ce-0ebc-342e64b0db6c	3206	Stranice
00050000-5624-f2ce-7e4e-51d76fec0435	8351	Straža
00050000-5624-f2ce-e5f4-abf7d267150c	1313	Struge
00050000-5624-f2ce-7fbf-4252332cea8f	8293	Studenec
00050000-5624-f2ce-3210-4ddb8de02c2f	8331	Suhor
00050000-5624-f2ce-a378-5ee70097d3ea	2233	Sv. Ana v Slovenskih goricah
00050000-5624-f2ce-2a56-8b423da1db75	2235	Sv. Trojica v Slovenskih goricah
00050000-5624-f2ce-ca5d-91b2045a3fc7	2353	Sveti Duh na Ostrem Vrhu
00050000-5624-f2ce-35b6-28559ecb9cc5	9244	Sveti Jurij ob Ščavnici
00050000-5624-f2ce-5b8e-0f731f14e0c3	3264	Sveti Štefan
00050000-5624-f2ce-7a93-04d74bd37ab0	2258	Sveti Tomaž
00050000-5624-f2ce-da8d-31675fc92a44	9204	Šalovci
00050000-5624-f2ce-13a1-2afc2420b2d8	5261	Šempas
00050000-5624-f2ce-3c82-038bcba2ffb2	5290	Šempeter pri Gorici
00050000-5624-f2ce-959a-732dbfc64dd6	3311	Šempeter v Savinjski dolini
00050000-5624-f2ce-d09e-54b9addb8d76	4208	Šenčur
00050000-5624-f2ce-09fc-09882f723da5	2212	Šentilj v Slovenskih goricah
00050000-5624-f2ce-b921-a67a138c6934	8297	Šentjanž
00050000-5624-f2ce-ace5-9f82b1a2961b	2373	Šentjanž pri Dravogradu
00050000-5624-f2ce-e73a-af4c3d7cc1a4	8310	Šentjernej
00050000-5624-f2ce-de28-fd8df8d88ce7	3230	Šentjur
00050000-5624-f2ce-a271-53b77f0c13c0	3271	Šentrupert
00050000-5624-f2ce-60dd-cc8829485572	8232	Šentrupert
00050000-5624-f2ce-a25e-ae85ed83ff0c	1296	Šentvid pri Stični
00050000-5624-f2ce-679f-637d23ab3213	8275	Škocjan
00050000-5624-f2ce-7887-fe9e63fb1991	6281	Škofije
00050000-5624-f2ce-567e-b3b4d4fdfcf3	4220	Škofja Loka
00050000-5624-f2ce-d931-c3ce464bac45	3211	Škofja vas
00050000-5624-f2ce-b466-5d48a142bd39	1291	Škofljica
00050000-5624-f2ce-ee42-3f84ccbadd71	6274	Šmarje
00050000-5624-f2ce-4bec-886ba47411d0	1293	Šmarje - Sap
00050000-5624-f2ce-6bae-9f9bf41e3cbc	3240	Šmarje pri Jelšah
00050000-5624-f2ce-3d7a-bd1e55ed9217	8220	Šmarješke Toplice
00050000-5624-f2ce-e277-0694644da856	2315	Šmartno na Pohorju
00050000-5624-f2ce-1bff-68a7f8280ee9	3341	Šmartno ob Dreti
00050000-5624-f2ce-3100-414db3bee014	3327	Šmartno ob Paki
00050000-5624-f2ce-adba-a9b6f7e45e7b	1275	Šmartno pri Litiji
00050000-5624-f2ce-1f92-8d714daa3f86	2383	Šmartno pri Slovenj Gradcu
00050000-5624-f2ce-8612-11fa24b4d305	3201	Šmartno v Rožni dolini
00050000-5624-f2ce-2016-74680ce2d9f5	3325	Šoštanj
00050000-5624-f2ce-e209-7e397298dbc6	6222	Štanjel
00050000-5624-f2ce-188f-f2b98981d121	3220	Štore
00050000-5624-f2ce-d416-8b8c452d3bc5	3304	Tabor
00050000-5624-f2ce-0da8-651d85baf51a	3221	Teharje
00050000-5624-f2ce-3a2f-28efb71d603b	9251	Tišina
00050000-5624-f2ce-a536-f666c6fc0470	5220	Tolmin
00050000-5624-f2ce-464b-51932d13112b	3326	Topolšica
00050000-5624-f2ce-012c-3a9fda59f9ac	2371	Trbonje
00050000-5624-f2ce-4c3e-442d773bd313	1420	Trbovlje
00050000-5624-f2ce-7c67-b2ce2c2aa757	8231	Trebelno 
00050000-5624-f2ce-f301-09098e4d519e	8210	Trebnje
00050000-5624-f2ce-f7c9-92d17eced927	5252	Trnovo pri Gorici
00050000-5624-f2ce-f58b-af535d83aba5	2254	Trnovska vas
00050000-5624-f2ce-1cad-62f7c918904b	1222	Trojane
00050000-5624-f2ce-88e9-a4c1b7c3b42a	1236	Trzin
00050000-5624-f2ce-8e25-6c4f359405e7	4290	Tržič
00050000-5624-f2ce-a60a-0daaf58df647	8295	Tržišče
00050000-5624-f2ce-c55f-f5c40058d0a4	1311	Turjak
00050000-5624-f2ce-f79d-bd65f37dccf8	9224	Turnišče
00050000-5624-f2ce-0148-5b2c4404e8da	8323	Uršna sela
00050000-5624-f2ce-a24d-6934f18e2cdf	1252	Vače
00050000-5624-f2ce-66e9-8ac7b70353a7	3320	Velenje 
00050000-5624-f2ce-cc9a-1a6b8b183376	3322	Velenje - poštni predali
00050000-5624-f2ce-bd6a-fc174fd49939	8212	Velika Loka
00050000-5624-f2ce-3e8e-b26c074994b3	2274	Velika Nedelja
00050000-5624-f2ce-b950-ab89f567d87c	9225	Velika Polana
00050000-5624-f2ce-20e1-aca437a4bb2e	1315	Velike Lašče
00050000-5624-f2ce-9022-062c52264790	8213	Veliki Gaber
00050000-5624-f2ce-4f4b-c4f3d4e0925d	9241	Veržej
00050000-5624-f2ce-8c58-e34fa0c2ef4c	1312	Videm - Dobrepolje
00050000-5624-f2ce-5389-80d7e860b04e	2284	Videm pri Ptuju
00050000-5624-f2ce-49ad-78eb54a909d3	8344	Vinica
00050000-5624-f2ce-fccc-5b1507fdc162	5271	Vipava
00050000-5624-f2ce-f4c0-6218b4cbdffd	4212	Visoko
00050000-5624-f2ce-656a-8d2cfff7f57e	1294	Višnja Gora
00050000-5624-f2ce-9869-5bb05f73b5fb	3205	Vitanje
00050000-5624-f2ce-3eec-40b81bd65960	2255	Vitomarci
00050000-5624-f2ce-04cf-23ca121761a4	1217	Vodice
00050000-5624-f2ce-f301-6e4f775d2eb3	3212	Vojnik\t
00050000-5624-f2ce-6a11-ea6ba6907c60	5293	Volčja Draga
00050000-5624-f2ce-b0a5-29b2e561803e	2232	Voličina
00050000-5624-f2ce-d8df-447cdb10040b	3305	Vransko
00050000-5624-f2ce-6f67-664efa431296	6217	Vremski Britof
00050000-5624-f2ce-ba1b-b8c1cfb3f476	1360	Vrhnika
00050000-5624-f2ce-7cd2-d044c3644a87	2365	Vuhred
00050000-5624-f2ce-51d8-2a7e0ae079af	2367	Vuzenica
00050000-5624-f2ce-b876-9716368ca4a6	8292	Zabukovje 
00050000-5624-f2ce-cc5b-a554a96ad072	1410	Zagorje ob Savi
00050000-5624-f2ce-3a5d-8ad0589c0b1f	1303	Zagradec
00050000-5624-f2ce-a3ca-40191047947a	2283	Zavrč
00050000-5624-f2ce-f901-f09dfa00b257	8272	Zdole 
00050000-5624-f2ce-aafa-6ef4f2019e08	4201	Zgornja Besnica
00050000-5624-f2ce-342f-c420557aa207	2242	Zgornja Korena
00050000-5624-f2ce-75f4-88fa8095fa46	2201	Zgornja Kungota
00050000-5624-f2ce-ae2e-ec2e1b3666e5	2316	Zgornja Ložnica
00050000-5624-f2ce-2972-009cf684daac	2314	Zgornja Polskava
00050000-5624-f2ce-7cd2-d9312b2d1ffc	2213	Zgornja Velka
00050000-5624-f2ce-17c9-d61b6049b0b6	4247	Zgornje Gorje
00050000-5624-f2ce-bada-0aea84ac3e9a	4206	Zgornje Jezersko
00050000-5624-f2ce-9b78-37fdd8c4c70c	2285	Zgornji Leskovec
00050000-5624-f2ce-fb1f-7c0188b3838d	1432	Zidani Most
00050000-5624-f2ce-0e64-e24dcdd08e79	3214	Zreče
00050000-5624-f2ce-68a9-a356e9a57239	4209	Žabnica
00050000-5624-f2ce-58d4-d8057ae8460e	3310	Žalec
00050000-5624-f2ce-27b4-d93088025700	4228	Železniki
00050000-5624-f2ce-8027-dcfca60d99b3	2287	Žetale
00050000-5624-f2ce-9338-97892af76bbd	4226	Žiri
00050000-5624-f2ce-0d77-85cce2c60784	4274	Žirovnica
00050000-5624-f2ce-2e23-f48b62bbeeca	8360	Žužemberk
\.


--
-- TOC entry 3109 (class 0 OID 22606314)
-- Dependencies: 236
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3082 (class 0 OID 22605906)
-- Dependencies: 209
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3061 (class 0 OID 22605669)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5624-f2d0-ad58-04ef8bf51c6b	00080000-5624-f2d0-a2b7-d7a037a4412b	\N	00040000-5624-f2ce-b643-8521c4034e83	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5624-f2d0-b862-da4bd9c2ffc6	00080000-5624-f2d0-a2b7-d7a037a4412b	\N	00040000-5624-f2ce-b643-8521c4034e83	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5624-f2d0-e6ad-efde944c2a1e	00080000-5624-f2d0-84ee-a8b6d7231acb	\N	00040000-5624-f2ce-b643-8521c4034e83	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3069 (class 0 OID 22605773)
-- Dependencies: 196
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3070 (class 0 OID 22605784)
-- Dependencies: 197
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3084 (class 0 OID 22605918)
-- Dependencies: 211
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 22606328)
-- Dependencies: 237
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 22606338)
-- Dependencies: 238
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5624-f2d0-e555-e3b844828776	00080000-5624-f2d0-3f23-9b030a16404d	0987	AK
00190000-5624-f2d0-091c-81e6e75aac31	00080000-5624-f2d0-84ee-a8b6d7231acb	0989	AK
00190000-5624-f2d0-fbd9-ac8019fd2540	00080000-5624-f2d0-5f14-cfbfda67a588	0986	AK
00190000-5624-f2d0-b020-9274431ae213	00080000-5624-f2d0-d516-aeb4b915e885	0984	AK
00190000-5624-f2d0-7ba4-39c13443a320	00080000-5624-f2d0-0279-42aba05beb29	0983	AK
00190000-5624-f2d0-db39-5d4c8bbc87d7	00080000-5624-f2d0-7c1f-171a266791be	0982	AK
00190000-5624-f2d1-2479-e8cdb6dee2f6	00080000-5624-f2d1-d289-b31164ff0c30	1001	AK
\.


--
-- TOC entry 3108 (class 0 OID 22606253)
-- Dependencies: 235
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5624-f2d0-8c38-d1e963be0af5	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3112 (class 0 OID 22606346)
-- Dependencies: 239
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3088 (class 0 OID 22605947)
-- Dependencies: 215
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5624-f2d0-5d71-a6b0d671622b	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5624-f2d0-8cd6-ae28d98dfa1a	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5624-f2d0-3aad-bd4976d882d2	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5624-f2d0-e5f0-131bc10bec4a	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5624-f2d0-7bf0-02a54ac63357	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5624-f2d0-a806-b082da47076f	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5624-f2d0-082a-cdd481b6d687	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3080 (class 0 OID 22605891)
-- Dependencies: 207
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3079 (class 0 OID 22605881)
-- Dependencies: 206
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 22606092)
-- Dependencies: 228
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3095 (class 0 OID 22606022)
-- Dependencies: 222
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3067 (class 0 OID 22605747)
-- Dependencies: 194
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3048 (class 0 OID 22605520)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5624-f2d1-d289-b31164ff0c30	00010000-5624-f2cf-0893-255386607237	2015-10-19 15:40:34	INS	a:0:{}
2	App\\Entity\\Option	00000000-5624-f2d1-fec5-290171e3d8f6	00010000-5624-f2cf-0893-255386607237	2015-10-19 15:40:34	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5624-f2d1-2479-e8cdb6dee2f6	00010000-5624-f2cf-0893-255386607237	2015-10-19 15:40:34	INS	a:0:{}
\.


--
-- TOC entry 3131 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3089 (class 0 OID 22605960)
-- Dependencies: 216
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3052 (class 0 OID 22605558)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5624-f2ce-6a6f-52fc97c2bc04	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5624-f2ce-7fa9-05a0e0a55c31	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5624-f2ce-a587-bf084a81c53d	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5624-f2ce-10d8-9d95098c76f8	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5624-f2cf-24d9-bc302dcc6add	planer	Planer dogodkov v koledarju	t
00020000-5624-f2cf-96bb-5e6a3678f4eb	kadrovska	Kadrovska služba	t
00020000-5624-f2cf-46d4-4d74471eeec0	arhivar	Ažuriranje arhivalij	t
00020000-5624-f2cf-7bf0-284eb823ff0e	igralec	Igralec	t
00020000-5624-f2cf-0067-5844d3e166ce	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5624-f2d0-793a-5d9b5c601791	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3050 (class 0 OID 22605542)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5624-f2cf-df4a-bace56682289	00020000-5624-f2ce-a587-bf084a81c53d
00010000-5624-f2cf-0893-255386607237	00020000-5624-f2ce-a587-bf084a81c53d
00010000-5624-f2d0-2207-7a2065e4e1d0	00020000-5624-f2d0-793a-5d9b5c601791
\.


--
-- TOC entry 3091 (class 0 OID 22605974)
-- Dependencies: 218
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3083 (class 0 OID 22605912)
-- Dependencies: 210
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3077 (class 0 OID 22605858)
-- Dependencies: 204
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5624-f2d0-b7b9-0e621590c65a	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5624-f2d0-3ed5-c70565809c6a	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5624-f2d0-425b-c043025b57c8	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3046 (class 0 OID 22605507)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5624-f2ce-aad6-995e776dabb3	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5624-f2ce-892d-4593fede9edb	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5624-f2ce-012f-3a5b37a3f568	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5624-f2ce-3d3b-167dbdb78d16	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5624-f2ce-b7d6-02515edb2d73	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3045 (class 0 OID 22605499)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5624-f2ce-2adb-79345e140078	00230000-5624-f2ce-3d3b-167dbdb78d16	popa
00240000-5624-f2ce-a773-b302cee071d5	00230000-5624-f2ce-3d3b-167dbdb78d16	oseba
00240000-5624-f2ce-0a83-02a2840c4fad	00230000-5624-f2ce-3d3b-167dbdb78d16	tippopa
00240000-5624-f2ce-f4b3-585323464bc6	00230000-5624-f2ce-3d3b-167dbdb78d16	organizacijskaenota
00240000-5624-f2ce-2ce9-1a2951acd47e	00230000-5624-f2ce-3d3b-167dbdb78d16	sezona
00240000-5624-f2ce-14f0-ef2ecf4f0e50	00230000-5624-f2ce-3d3b-167dbdb78d16	tipvaje
00240000-5624-f2ce-18c8-cc50ebf58cfd	00230000-5624-f2ce-892d-4593fede9edb	prostor
00240000-5624-f2ce-cc5c-a25896de6f2e	00230000-5624-f2ce-3d3b-167dbdb78d16	besedilo
00240000-5624-f2ce-2a4a-c3237131e13e	00230000-5624-f2ce-3d3b-167dbdb78d16	uprizoritev
00240000-5624-f2ce-6753-5ffca1100be1	00230000-5624-f2ce-3d3b-167dbdb78d16	funkcija
00240000-5624-f2ce-22bd-ea11e03d0e15	00230000-5624-f2ce-3d3b-167dbdb78d16	tipfunkcije
00240000-5624-f2ce-6eb9-5e8d364b3e9f	00230000-5624-f2ce-3d3b-167dbdb78d16	alternacija
00240000-5624-f2ce-fcff-f7551b72c50d	00230000-5624-f2ce-aad6-995e776dabb3	pogodba
00240000-5624-f2ce-6f09-bf1cab76f310	00230000-5624-f2ce-3d3b-167dbdb78d16	zaposlitev
00240000-5624-f2ce-2102-d182c711b8ce	00230000-5624-f2ce-3d3b-167dbdb78d16	zvrstuprizoritve
00240000-5624-f2ce-9d4d-b333b12b92b0	00230000-5624-f2ce-aad6-995e776dabb3	programdela
00240000-5624-f2ce-5cd7-9bb88cb8f69b	00230000-5624-f2ce-3d3b-167dbdb78d16	zapis
\.


--
-- TOC entry 3044 (class 0 OID 22605494)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
8fab8814-abc4-467e-8240-08665ce7643d	00240000-5624-f2ce-2adb-79345e140078	0	1001
\.


--
-- TOC entry 3097 (class 0 OID 22606039)
-- Dependencies: 224
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5624-f2d0-db49-137d1b80cc52	000e0000-5624-f2d0-7b60-1817a844ef24	00080000-5624-f2d0-a2b7-d7a037a4412b	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5624-f2ce-c2c2-fac778ce1e90
00270000-5624-f2d0-363b-029c3a35e340	000e0000-5624-f2d0-7b60-1817a844ef24	00080000-5624-f2d0-a2b7-d7a037a4412b	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5624-f2ce-c2c2-fac778ce1e90
\.


--
-- TOC entry 3058 (class 0 OID 22605630)
-- Dependencies: 185
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3078 (class 0 OID 22605868)
-- Dependencies: 205
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5624-f2d0-7aeb-0a2798861860	00180000-5624-f2d0-23e8-43f245455720	000c0000-5624-f2d0-143f-a308fff93948	00090000-5624-f2d0-acb0-7a573c985acb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5624-f2d0-914c-b2793e5483c3	00180000-5624-f2d0-23e8-43f245455720	000c0000-5624-f2d0-2584-4fc63266cff3	00090000-5624-f2d0-4d45-30c82caa8fea	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5624-f2d0-be9c-44f6edcb724b	00180000-5624-f2d0-23e8-43f245455720	000c0000-5624-f2d0-6b85-ef399eb2bb28	00090000-5624-f2d0-7db8-dd7cd59b6e08	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5624-f2d0-4fdd-de8b6ebff9e4	00180000-5624-f2d0-23e8-43f245455720	000c0000-5624-f2d0-a5b6-17ddaafbd6b0	00090000-5624-f2d0-9413-93ab44d510da	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5624-f2d0-d415-3a2118fa7f96	00180000-5624-f2d0-23e8-43f245455720	000c0000-5624-f2d0-08b6-4bc95010182c	00090000-5624-f2d0-3441-98c2d4f791fd	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5624-f2d0-46f2-2c6c240ff73a	00180000-5624-f2d0-2167-de71613810b7	\N	00090000-5624-f2d0-3441-98c2d4f791fd	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	\N	\N
\.


--
-- TOC entry 3100 (class 0 OID 22606080)
-- Dependencies: 227
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5624-f2ce-410b-3724f290b843	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5624-f2ce-bf43-a4bfa44bdcb1	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5624-f2ce-c5af-5b40b00ee31c	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5624-f2ce-6a6e-cdd0bab9f1d4	04	Režija	Režija	Režija	umetnik	30
000f0000-5624-f2ce-cf51-6feee84196da	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5624-f2ce-3261-ce709a3f5224	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5624-f2ce-2e46-3e02f31d7e6b	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5624-f2ce-7f02-c2ab4ca54b73	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5624-f2ce-f85e-42ab08beb24d	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5624-f2ce-ceb1-1fcb028788f6	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5624-f2ce-e661-59e06ca713a4	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5624-f2ce-0a61-2cb534b749d2	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5624-f2ce-2a5f-5b08e666d5eb	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5624-f2ce-9e9a-ee8b46dc3f98	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5624-f2ce-9e19-3fdde1268874	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5624-f2ce-427b-2fc482a11de1	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5624-f2ce-39f7-11b24a846e76	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5624-f2ce-9e74-25c7808394ba	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3055 (class 0 OID 22605584)
-- Dependencies: 182
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5624-f2d0-dded-f88e816b92d7	0001	šola	osnovna ali srednja šola
00400000-5624-f2d0-ac12-316b86ae49e7	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5624-f2d0-4939-b14fd7a846e3	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3113 (class 0 OID 22606357)
-- Dependencies: 240
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5624-f2ce-a430-3c54118520d4	01	Velika predstava	f	1.00	1.00
002b0000-5624-f2ce-e82f-d7a10e8af41e	02	Mala predstava	f	0.50	0.50
002b0000-5624-f2ce-ae50-dc096eef73da	03	Mala koprodukcija	t	0.40	1.00
002b0000-5624-f2ce-5c16-a6247cd253fe	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5624-f2ce-347d-ef6276ee793e	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3076 (class 0 OID 22605848)
-- Dependencies: 203
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5624-f2ce-3945-125940e05f93	0001	prva vaja	prva vaja
00420000-5624-f2ce-ed1c-da7df94f8b35	0002	tehnična vaja	tehnična vaja
00420000-5624-f2ce-9755-84bdb0aae18b	0003	lučna vaja	lučna vaja
00420000-5624-f2ce-9885-26c810f4572d	0004	kostumska vaja	kostumska vaja
00420000-5624-f2ce-5947-f1e82f0cea29	0005	foto vaja	foto vaja
00420000-5624-f2ce-d57b-a475b11b73fd	0006	1. glavna vaja	1. glavna vaja
00420000-5624-f2ce-6ed0-cd02def6448a	0007	2. glavna vaja	2. glavna vaja
00420000-5624-f2ce-f73a-2448d8e8b9c7	0008	1. generalka	1. generalka
00420000-5624-f2ce-f5ad-ae05eb6356b3	0009	2. generalka	2. generalka
00420000-5624-f2ce-651b-5abb1bbd91cc	0010	odprta generalka	odprta generalka
00420000-5624-f2ce-17d0-e2e4c6e29163	0011	obnovitvena vaja	obnovitvena vaja
00420000-5624-f2ce-85f1-c254ff57893d	0012	pevska vaja	pevska vaja
00420000-5624-f2ce-45eb-f8d19931b4cf	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5624-f2ce-9259-7270269c34d2	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3064 (class 0 OID 22605704)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3049 (class 0 OID 22605529)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5624-f2cf-0893-255386607237	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROUMTZiKU56Ap0iw6bDZXnQUDENWhpRPW	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5624-f2d0-d288-502db599ce87	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5624-f2d0-63a2-a318dc4b67d1	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5624-f2d0-1ed9-ea8ff3c4fd40	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5624-f2d0-61c5-5dd777298a9b	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5624-f2d0-07e8-d42b908c1815	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5624-f2d0-0a48-86ad1a7d1dde	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5624-f2d0-f984-76c3db0c6fd4	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5624-f2d0-b7cc-21da5b41f2c0	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5624-f2d0-fe6d-d5c93637560e	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5624-f2d0-2207-7a2065e4e1d0	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5624-f2cf-df4a-bace56682289	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3104 (class 0 OID 22606130)
-- Dependencies: 231
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5624-f2d0-4911-9c2f779833c1	00160000-5624-f2d0-0253-16e7b745e5a3	\N	00140000-5624-f2ce-3c12-45de2c364361	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5624-f2d0-7bf0-02a54ac63357
000e0000-5624-f2d0-7b60-1817a844ef24	00160000-5624-f2d0-e024-e7144b4a00fc	\N	00140000-5624-f2ce-6e3c-16e3e79bafd2	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5624-f2d0-a806-b082da47076f
000e0000-5624-f2d0-61f2-e53925233b6f	\N	\N	00140000-5624-f2ce-6e3c-16e3e79bafd2	00190000-5624-f2d0-e555-e3b844828776	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5624-f2d0-7bf0-02a54ac63357
000e0000-5624-f2d0-18f0-6a1e1db15ab4	\N	\N	00140000-5624-f2ce-6e3c-16e3e79bafd2	00190000-5624-f2d0-e555-e3b844828776	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5624-f2d0-7bf0-02a54ac63357
000e0000-5624-f2d0-74b3-6befc7129b36	\N	\N	00140000-5624-f2ce-6e3c-16e3e79bafd2	00190000-5624-f2d0-e555-e3b844828776	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5624-f2d0-5d71-a6b0d671622b
000e0000-5624-f2d0-467a-5764d0cb6891	\N	\N	00140000-5624-f2ce-6e3c-16e3e79bafd2	00190000-5624-f2d0-e555-e3b844828776	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5624-f2d0-5d71-a6b0d671622b
\.


--
-- TOC entry 3072 (class 0 OID 22605802)
-- Dependencies: 199
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5624-f2d0-f1e7-0e426d344dac	\N	000e0000-5624-f2d0-7b60-1817a844ef24	1	
00200000-5624-f2d0-7525-0db668929aef	\N	000e0000-5624-f2d0-7b60-1817a844ef24	2	
00200000-5624-f2d0-ca91-c0d65067dfa8	\N	000e0000-5624-f2d0-7b60-1817a844ef24	3	
00200000-5624-f2d0-6810-663836ad007d	\N	000e0000-5624-f2d0-7b60-1817a844ef24	4	
00200000-5624-f2d0-5d61-6703eee533ef	\N	000e0000-5624-f2d0-7b60-1817a844ef24	5	
\.


--
-- TOC entry 3087 (class 0 OID 22605939)
-- Dependencies: 214
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 22606053)
-- Dependencies: 225
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5624-f2ce-888a-b214b107197d	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5624-f2ce-a4d5-29e01e9ead23	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5624-f2ce-e2b5-f7479aac23ca	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5624-f2ce-84e9-1c24c613c264	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5624-f2ce-22d3-4be69886b2c8	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5624-f2ce-18ac-371289f58392	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5624-f2ce-b635-c2bdcc941577	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5624-f2ce-2205-eb313329c6a0	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5624-f2ce-c2c2-fac778ce1e90	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5624-f2ce-df80-9fab4b921ca3	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5624-f2ce-7e26-de10dfc9c745	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5624-f2ce-4c71-65db3fa3f938	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5624-f2ce-fb73-577bbf9995e4	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5624-f2ce-a011-614bbbe4331d	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5624-f2ce-7462-f2107542be62	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5624-f2ce-fc28-abbb2c4bbc5d	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5624-f2ce-1d4f-c8c8676bc8aa	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5624-f2ce-a62e-e70dfb9b5ac1	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5624-f2ce-6af4-261553e86de5	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5624-f2ce-e428-789e1fa1d1a8	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5624-f2ce-923f-409f83943b2c	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5624-f2ce-856a-9b4a6cb1fc6e	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5624-f2ce-62ad-9c80c4c0d3a4	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5624-f2ce-41c1-ba1ee00c063e	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5624-f2ce-530b-e92d732dff6c	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5624-f2ce-40b3-cb3edb4da14f	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5624-f2ce-8c8b-8870a35fc010	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5624-f2ce-5e4d-ba7f99c06283	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3116 (class 0 OID 22606404)
-- Dependencies: 243
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 22606376)
-- Dependencies: 242
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 22606416)
-- Dependencies: 244
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 22606011)
-- Dependencies: 221
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5624-f2d0-61dd-e36cced0147e	00090000-5624-f2d0-4d45-30c82caa8fea	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5624-f2d0-6533-fc13623a14ce	00090000-5624-f2d0-7db8-dd7cd59b6e08	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5624-f2d0-b917-60795d3dc57b	00090000-5624-f2d0-50a8-c88287f1a5f3	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5624-f2d0-aaf8-eb3807a3ddb0	00090000-5624-f2d0-87ce-068963fb0b92	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5624-f2d0-bf14-a9a84ae3b34e	00090000-5624-f2d0-acb0-7a573c985acb	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5624-f2d0-1bd8-bc619afe770f	00090000-5624-f2d0-5fec-3d4543f7035b	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3074 (class 0 OID 22605837)
-- Dependencies: 201
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 22606120)
-- Dependencies: 230
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5624-f2ce-3c12-45de2c364361	01	Drama	drama (SURS 01)
00140000-5624-f2ce-55f3-45735be06960	02	Opera	opera (SURS 02)
00140000-5624-f2ce-86bf-2a194372435c	03	Balet	balet (SURS 03)
00140000-5624-f2ce-a2e0-7fad8dd81d89	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5624-f2ce-4344-0db9db578ed1	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5624-f2ce-6e3c-16e3e79bafd2	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5624-f2ce-41d3-6f2a8b0c3f3f	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3093 (class 0 OID 22606001)
-- Dependencies: 220
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2547 (class 2606 OID 22605583)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 22606179)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 22606169)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 22606036)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 22606078)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 22606456)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 22605826)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 22605847)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 22606374)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 22605730)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 22606247)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 22605997)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 22605800)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 22605768)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 22605744)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 22605904)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2811 (class 2606 OID 22606433)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 22606440)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2822 (class 2606 OID 22606464)
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
-- TOC entry 2679 (class 2606 OID 22605931)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 22605702)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 22605602)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 22605664)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 22605626)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 22605572)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2538 (class 2606 OID 22605557)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 22605937)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 22605973)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 22606115)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 22605654)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 22605690)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 22606326)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 22605910)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 22605680)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 22605788)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2613 (class 2606 OID 22605781)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 22605922)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 22606335)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 22606343)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 22606313)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 22606355)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 22605955)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 22605895)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 22605886)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 22606102)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 22606029)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 22605756)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 22605528)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 22605964)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 22605546)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2540 (class 2606 OID 22605566)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 22605982)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 22605917)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 22605866)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 22605516)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 22605504)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 22605498)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 22606049)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 22605635)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 22605877)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 22606089)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 22605591)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 22606367)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 22605855)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 22605715)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 22605541)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 22606148)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 22605809)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 22605945)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 22606061)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 22606414)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 22606398)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 22606422)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 22606019)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 22605841)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 22606128)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 22606009)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 1259 OID 22605835)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2628 (class 1259 OID 22605836)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2629 (class 1259 OID 22605834)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2630 (class 1259 OID 22605833)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2631 (class 1259 OID 22605832)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2722 (class 1259 OID 22606050)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2723 (class 1259 OID 22606051)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2724 (class 1259 OID 22606052)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2808 (class 1259 OID 22606435)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2809 (class 1259 OID 22606434)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2565 (class 1259 OID 22605656)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2566 (class 1259 OID 22605657)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2680 (class 1259 OID 22605938)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2795 (class 1259 OID 22606402)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2796 (class 1259 OID 22606401)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2797 (class 1259 OID 22606403)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2798 (class 1259 OID 22606400)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2799 (class 1259 OID 22606399)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2674 (class 1259 OID 22605924)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2675 (class 1259 OID 22605923)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2621 (class 1259 OID 22605810)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2622 (class 1259 OID 22605811)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2704 (class 1259 OID 22605998)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2705 (class 1259 OID 22606000)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2706 (class 1259 OID 22605999)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2597 (class 1259 OID 22605746)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2598 (class 1259 OID 22605745)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2786 (class 1259 OID 22606356)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2738 (class 1259 OID 22606117)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2739 (class 1259 OID 22606118)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2740 (class 1259 OID 22606119)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2805 (class 1259 OID 22606423)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2747 (class 1259 OID 22606153)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2748 (class 1259 OID 22606150)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2749 (class 1259 OID 22606154)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2750 (class 1259 OID 22606152)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2751 (class 1259 OID 22606151)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2587 (class 1259 OID 22605717)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2588 (class 1259 OID 22605716)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2556 (class 1259 OID 22605629)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2692 (class 1259 OID 22605965)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2542 (class 1259 OID 22605573)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2543 (class 1259 OID 22605574)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2697 (class 1259 OID 22605985)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2698 (class 1259 OID 22605984)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2699 (class 1259 OID 22605983)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2570 (class 1259 OID 22605667)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2571 (class 1259 OID 22605666)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2572 (class 1259 OID 22605668)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2610 (class 1259 OID 22605782)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2611 (class 1259 OID 22605783)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2522 (class 1259 OID 22605506)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2654 (class 1259 OID 22605890)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2655 (class 1259 OID 22605888)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2656 (class 1259 OID 22605887)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2657 (class 1259 OID 22605889)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2533 (class 1259 OID 22605547)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2534 (class 1259 OID 22605548)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2683 (class 1259 OID 22605946)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2818 (class 1259 OID 22606457)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2720 (class 1259 OID 22606038)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2721 (class 1259 OID 22606037)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2819 (class 1259 OID 22606465)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2820 (class 1259 OID 22606466)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2669 (class 1259 OID 22605911)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2714 (class 1259 OID 22606030)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2715 (class 1259 OID 22606031)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2768 (class 1259 OID 22606252)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2769 (class 1259 OID 22606251)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2770 (class 1259 OID 22606248)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2771 (class 1259 OID 22606249)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2772 (class 1259 OID 22606250)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2576 (class 1259 OID 22605682)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2577 (class 1259 OID 22605681)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2578 (class 1259 OID 22605683)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2686 (class 1259 OID 22605959)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2687 (class 1259 OID 22605958)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2778 (class 1259 OID 22606336)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2779 (class 1259 OID 22606337)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2761 (class 1259 OID 22606183)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2762 (class 1259 OID 22606184)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2763 (class 1259 OID 22606181)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2764 (class 1259 OID 22606182)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2710 (class 1259 OID 22606020)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2711 (class 1259 OID 22606021)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2660 (class 1259 OID 22605899)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2661 (class 1259 OID 22605898)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2662 (class 1259 OID 22605896)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2663 (class 1259 OID 22605897)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2757 (class 1259 OID 22606171)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2758 (class 1259 OID 22606170)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2601 (class 1259 OID 22605757)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2604 (class 1259 OID 22605771)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2605 (class 1259 OID 22605770)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2606 (class 1259 OID 22605769)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 22605772)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2620 (class 1259 OID 22605801)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2614 (class 1259 OID 22605789)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2615 (class 1259 OID 22605790)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2775 (class 1259 OID 22606327)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2794 (class 1259 OID 22606375)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2812 (class 1259 OID 22606441)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2813 (class 1259 OID 22606442)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2552 (class 1259 OID 22605604)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2553 (class 1259 OID 22605603)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2561 (class 1259 OID 22605636)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2562 (class 1259 OID 22605637)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2637 (class 1259 OID 22605842)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2649 (class 1259 OID 22605880)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2650 (class 1259 OID 22605879)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2651 (class 1259 OID 22605878)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2632 (class 1259 OID 22605828)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2633 (class 1259 OID 22605829)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2634 (class 1259 OID 22605827)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2635 (class 1259 OID 22605831)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2636 (class 1259 OID 22605830)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2569 (class 1259 OID 22605655)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2550 (class 1259 OID 22605592)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2551 (class 1259 OID 22605593)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2593 (class 1259 OID 22605731)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2594 (class 1259 OID 22605733)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2595 (class 1259 OID 22605732)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2596 (class 1259 OID 22605734)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2668 (class 1259 OID 22605905)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2743 (class 1259 OID 22606116)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2752 (class 1259 OID 22606149)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2734 (class 1259 OID 22606090)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2735 (class 1259 OID 22606091)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2559 (class 1259 OID 22605627)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2560 (class 1259 OID 22605628)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2707 (class 1259 OID 22606010)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2528 (class 1259 OID 22605517)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2586 (class 1259 OID 22605703)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2575 (class 1259 OID 22605665)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2525 (class 1259 OID 22605505)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2791 (class 1259 OID 22606368)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2690 (class 1259 OID 22605957)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2691 (class 1259 OID 22605956)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2644 (class 1259 OID 22605856)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2645 (class 1259 OID 22605857)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2765 (class 1259 OID 22606180)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2583 (class 1259 OID 22605691)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2744 (class 1259 OID 22606129)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2802 (class 1259 OID 22606415)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2784 (class 1259 OID 22606344)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2785 (class 1259 OID 22606345)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2731 (class 1259 OID 22606079)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2648 (class 1259 OID 22605867)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2541 (class 1259 OID 22605567)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2860 (class 2606 OID 22606632)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2859 (class 2606 OID 22606637)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2855 (class 2606 OID 22606657)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2861 (class 2606 OID 22606627)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2857 (class 2606 OID 22606647)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2856 (class 2606 OID 22606652)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2858 (class 2606 OID 22606642)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2897 (class 2606 OID 22606827)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2896 (class 2606 OID 22606832)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2895 (class 2606 OID 22606837)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2929 (class 2606 OID 22607002)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2930 (class 2606 OID 22606997)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2835 (class 2606 OID 22606522)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2834 (class 2606 OID 22606527)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2878 (class 2606 OID 22606742)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2924 (class 2606 OID 22606982)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2925 (class 2606 OID 22606977)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2923 (class 2606 OID 22606987)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2926 (class 2606 OID 22606972)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2927 (class 2606 OID 22606967)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2876 (class 2606 OID 22606737)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2877 (class 2606 OID 22606732)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2854 (class 2606 OID 22606617)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2853 (class 2606 OID 22606622)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2888 (class 2606 OID 22606782)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2886 (class 2606 OID 22606792)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2887 (class 2606 OID 22606787)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2844 (class 2606 OID 22606577)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2845 (class 2606 OID 22606572)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2874 (class 2606 OID 22606722)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2921 (class 2606 OID 22606957)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2900 (class 2606 OID 22606842)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2899 (class 2606 OID 22606847)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2898 (class 2606 OID 22606852)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2928 (class 2606 OID 22606992)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2902 (class 2606 OID 22606872)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2905 (class 2606 OID 22606857)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2901 (class 2606 OID 22606877)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2903 (class 2606 OID 22606867)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2904 (class 2606 OID 22606862)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2842 (class 2606 OID 22606567)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2843 (class 2606 OID 22606562)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2830 (class 2606 OID 22606507)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2831 (class 2606 OID 22606502)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2882 (class 2606 OID 22606762)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2827 (class 2606 OID 22606482)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2826 (class 2606 OID 22606487)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2883 (class 2606 OID 22606777)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2884 (class 2606 OID 22606772)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2885 (class 2606 OID 22606767)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2837 (class 2606 OID 22606537)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2838 (class 2606 OID 22606532)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2836 (class 2606 OID 22606542)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2849 (class 2606 OID 22606592)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2848 (class 2606 OID 22606597)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2823 (class 2606 OID 22606467)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2866 (class 2606 OID 22606697)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2868 (class 2606 OID 22606687)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2869 (class 2606 OID 22606682)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2867 (class 2606 OID 22606692)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2825 (class 2606 OID 22606472)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2824 (class 2606 OID 22606477)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2879 (class 2606 OID 22606747)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2933 (class 2606 OID 22607017)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2893 (class 2606 OID 22606822)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2894 (class 2606 OID 22606817)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2935 (class 2606 OID 22607022)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2934 (class 2606 OID 22607027)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2875 (class 2606 OID 22606727)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2892 (class 2606 OID 22606807)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2891 (class 2606 OID 22606812)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2912 (class 2606 OID 22606932)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2913 (class 2606 OID 22606927)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2916 (class 2606 OID 22606912)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2915 (class 2606 OID 22606917)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2914 (class 2606 OID 22606922)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2840 (class 2606 OID 22606552)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2841 (class 2606 OID 22606547)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2839 (class 2606 OID 22606557)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2880 (class 2606 OID 22606757)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2881 (class 2606 OID 22606752)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2919 (class 2606 OID 22606942)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2918 (class 2606 OID 22606947)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2909 (class 2606 OID 22606902)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2908 (class 2606 OID 22606907)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2911 (class 2606 OID 22606892)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2910 (class 2606 OID 22606897)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2890 (class 2606 OID 22606797)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2889 (class 2606 OID 22606802)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2870 (class 2606 OID 22606717)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2871 (class 2606 OID 22606712)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2873 (class 2606 OID 22606702)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2872 (class 2606 OID 22606707)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2906 (class 2606 OID 22606887)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2907 (class 2606 OID 22606882)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2846 (class 2606 OID 22606582)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2847 (class 2606 OID 22606587)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2852 (class 2606 OID 22606612)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2851 (class 2606 OID 22606602)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2850 (class 2606 OID 22606607)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2917 (class 2606 OID 22606937)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2920 (class 2606 OID 22606952)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2922 (class 2606 OID 22606962)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2932 (class 2606 OID 22607007)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2931 (class 2606 OID 22607012)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2828 (class 2606 OID 22606497)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2829 (class 2606 OID 22606492)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2833 (class 2606 OID 22606512)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2832 (class 2606 OID 22606517)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2862 (class 2606 OID 22606662)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2863 (class 2606 OID 22606677)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2864 (class 2606 OID 22606672)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2865 (class 2606 OID 22606667)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-19 15:40:35 CEST

--
-- PostgreSQL database dump complete
--

