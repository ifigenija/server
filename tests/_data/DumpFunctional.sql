--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-10-19 15:58:46 CEST

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
-- TOC entry 181 (class 1259 OID 22619471)
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
-- TOC entry 233 (class 1259 OID 22620069)
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
-- TOC entry 232 (class 1259 OID 22620052)
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
-- TOC entry 223 (class 1259 OID 22619929)
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
-- TOC entry 226 (class 1259 OID 22619959)
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
-- TOC entry 247 (class 1259 OID 22620340)
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
-- TOC entry 200 (class 1259 OID 22619709)
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
-- TOC entry 202 (class 1259 OID 22619740)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 22620266)
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
-- TOC entry 192 (class 1259 OID 22619614)
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
-- TOC entry 234 (class 1259 OID 22620082)
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
-- TOC entry 219 (class 1259 OID 22619883)
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
-- TOC entry 198 (class 1259 OID 22619688)
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
-- TOC entry 195 (class 1259 OID 22619654)
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
-- TOC entry 193 (class 1259 OID 22619631)
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
-- TOC entry 208 (class 1259 OID 22619797)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 245 (class 1259 OID 22620321)
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
-- TOC entry 246 (class 1259 OID 22620333)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 248 (class 1259 OID 22620355)
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
-- TOC entry 212 (class 1259 OID 22619822)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 22619588)
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
-- TOC entry 183 (class 1259 OID 22619490)
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
-- TOC entry 187 (class 1259 OID 22619554)
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
-- TOC entry 184 (class 1259 OID 22619501)
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
-- TOC entry 178 (class 1259 OID 22619445)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 22619464)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 22619829)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 217 (class 1259 OID 22619863)
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
-- TOC entry 229 (class 1259 OID 22620000)
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
-- TOC entry 186 (class 1259 OID 22619534)
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
-- TOC entry 189 (class 1259 OID 22619580)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 22620211)
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
-- TOC entry 209 (class 1259 OID 22619803)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 188 (class 1259 OID 22619565)
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
-- TOC entry 196 (class 1259 OID 22619669)
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
-- TOC entry 197 (class 1259 OID 22619681)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 22619815)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 22620225)
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
-- TOC entry 238 (class 1259 OID 22620235)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 22620150)
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
-- TOC entry 239 (class 1259 OID 22620243)
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
-- TOC entry 215 (class 1259 OID 22619844)
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
-- TOC entry 207 (class 1259 OID 22619788)
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
-- TOC entry 206 (class 1259 OID 22619778)
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
-- TOC entry 228 (class 1259 OID 22619989)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 222 (class 1259 OID 22619919)
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
-- TOC entry 194 (class 1259 OID 22619643)
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
-- TOC entry 175 (class 1259 OID 22619416)
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
-- TOC entry 174 (class 1259 OID 22619414)
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
-- TOC entry 216 (class 1259 OID 22619857)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 22619454)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 22619438)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 22619871)
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
-- TOC entry 210 (class 1259 OID 22619809)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 204 (class 1259 OID 22619755)
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
-- TOC entry 173 (class 1259 OID 22619403)
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
-- TOC entry 172 (class 1259 OID 22619395)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 22619390)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 224 (class 1259 OID 22619936)
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
-- TOC entry 185 (class 1259 OID 22619526)
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
-- TOC entry 205 (class 1259 OID 22619765)
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
-- TOC entry 227 (class 1259 OID 22619977)
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
-- TOC entry 182 (class 1259 OID 22619480)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 240 (class 1259 OID 22620254)
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
-- TOC entry 203 (class 1259 OID 22619745)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 191 (class 1259 OID 22619600)
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
-- TOC entry 176 (class 1259 OID 22619425)
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
-- TOC entry 231 (class 1259 OID 22620027)
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
-- TOC entry 199 (class 1259 OID 22619699)
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
-- TOC entry 214 (class 1259 OID 22619836)
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
-- TOC entry 225 (class 1259 OID 22619950)
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
-- TOC entry 243 (class 1259 OID 22620301)
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
-- TOC entry 242 (class 1259 OID 22620273)
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
-- TOC entry 244 (class 1259 OID 22620313)
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
-- TOC entry 221 (class 1259 OID 22619908)
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
-- TOC entry 201 (class 1259 OID 22619734)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 230 (class 1259 OID 22620017)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 220 (class 1259 OID 22619898)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2219 (class 2604 OID 22619419)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3056 (class 0 OID 22619471)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5624-f713-f7c1-32539f7560c6	10	30	Otroci	Abonma za otroke	200
000a0000-5624-f713-8c03-670d25d495bb	20	60	Mladina	Abonma za mladino	400
000a0000-5624-f713-4c5f-bb2ad0bd51df	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3108 (class 0 OID 22620069)
-- Dependencies: 233
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5624-f713-04ee-a0264e97081b	000d0000-5624-f713-073a-a560e072b46e	\N	00090000-5624-f713-fd25-7a3c7f665f5d	000b0000-5624-f713-45f9-fb58d44ff0d2	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5624-f713-c4da-639bde4c8409	000d0000-5624-f713-0c5e-2e980b5f9123	00100000-5624-f713-6336-c81e4b855399	00090000-5624-f713-0601-e0019d7dc554	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5624-f713-83b5-e45f023d5090	000d0000-5624-f713-3f96-7a0c7325ce0e	00100000-5624-f713-16a2-e807a1480391	00090000-5624-f713-77c2-593d0c7d00da	\N	0003	t	\N	2015-10-19	\N	2	t	\N	f	f
000c0000-5624-f713-e260-921c3ef3f4d4	000d0000-5624-f713-adb4-3fe1f8be4ef9	\N	00090000-5624-f713-94a7-f9ad8b002523	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5624-f713-337b-857919fbf4da	000d0000-5624-f713-e5c7-cdaf84432156	\N	00090000-5624-f713-eb09-ddc5b1e715c8	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5624-f713-57e4-fb010b053249	000d0000-5624-f713-1cc0-a45354226a9f	\N	00090000-5624-f713-0640-8ef8f8d77b92	000b0000-5624-f713-0a69-886a32a7331c	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5624-f713-37d7-10f2a8f4e495	000d0000-5624-f713-d57b-bed7f48a2c5a	00100000-5624-f713-142b-6451ebe930fe	00090000-5624-f713-3537-ddb708fd065e	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5624-f713-1bd1-e0a425f8fe0f	000d0000-5624-f713-b421-34147a3c5669	\N	00090000-5624-f713-0fa3-1682641a1e60	000b0000-5624-f713-3384-f55c6ee5fcd5	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5624-f713-e26e-23f4c7bf7814	000d0000-5624-f713-d57b-bed7f48a2c5a	00100000-5624-f713-0962-cee539df6f34	00090000-5624-f713-3807-9e66e0ce9762	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5624-f713-36dc-b9ed2053abd3	000d0000-5624-f713-d57b-bed7f48a2c5a	00100000-5624-f713-e009-7ab814045394	00090000-5624-f713-d3ce-271dd2a221a9	\N	0010	t	\N	2015-10-19	\N	16	f	\N	f	t
000c0000-5624-f713-8135-d0f6da7fedae	000d0000-5624-f713-d57b-bed7f48a2c5a	00100000-5624-f713-9bbe-eaa0bd1a017d	00090000-5624-f713-2419-415c70cc28f8	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5624-f713-29cd-4a36d927987a	000d0000-5624-f713-4cdf-744dfc933d5f	\N	00090000-5624-f713-0601-e0019d7dc554	000b0000-5624-f713-8dab-5d7e530c28f0	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3107 (class 0 OID 22620052)
-- Dependencies: 232
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 22619929)
-- Dependencies: 223
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5624-f713-a304-a145fdf01130	00160000-5624-f713-1c45-af12b3d4ba7b	00090000-5624-f713-7037-22ad61c6cf6b	aizv	10	t
003d0000-5624-f713-e510-89ee84fe6b73	00160000-5624-f713-1c45-af12b3d4ba7b	00090000-5624-f713-ca51-5f0ab8a89be6	apri	14	t
003d0000-5624-f713-cbaa-9e7cdd4241c9	00160000-5624-f713-aff4-6d6dd88f1cfe	00090000-5624-f713-de52-f8cf8ac3bbfb	aizv	11	t
003d0000-5624-f713-e199-03261a3d0a89	00160000-5624-f713-a780-abfa15711361	00090000-5624-f713-1a18-7551ec24b280	aizv	12	t
003d0000-5624-f713-a379-07c0bdc988d8	00160000-5624-f713-1c45-af12b3d4ba7b	00090000-5624-f713-6a78-9089f3618fd3	apri	18	f
\.


--
-- TOC entry 3101 (class 0 OID 22619959)
-- Dependencies: 226
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5624-f713-1c45-af12b3d4ba7b	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5624-f713-aff4-6d6dd88f1cfe	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5624-f713-a780-abfa15711361	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3122 (class 0 OID 22620340)
-- Dependencies: 247
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3075 (class 0 OID 22619709)
-- Dependencies: 200
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5624-f713-0c53-30c15053fd3c	\N	\N	00200000-5624-f713-3a32-8201b4c1da46	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5624-f713-4e76-f211bb2d5d31	\N	\N	00200000-5624-f713-0203-2e74a9e7c6c4	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5624-f713-448e-25acbaa828dc	\N	\N	00200000-5624-f713-a7b7-d0aca2925b2e	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5624-f713-0afa-7ad43250779e	\N	\N	00200000-5624-f713-b511-0530fe0e79c2	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5624-f713-4972-f45b729a67d4	\N	\N	00200000-5624-f713-52b3-d98146add7ee	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3077 (class 0 OID 22619740)
-- Dependencies: 202
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 22620266)
-- Dependencies: 241
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3067 (class 0 OID 22619614)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5624-f711-44ff-b9bd35694cdf	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5624-f711-fe63-65d72c9faa41	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5624-f711-bdb5-2a67cb62a147	AL	ALB	008	Albania 	Albanija	\N
00040000-5624-f711-c3c1-2cef38ab604e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5624-f711-de9b-c9ed1b9a057c	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5624-f711-893b-677eff8604a1	AD	AND	020	Andorra 	Andora	\N
00040000-5624-f711-eb22-40a9034a4f9b	AO	AGO	024	Angola 	Angola	\N
00040000-5624-f711-3c9f-206c91f685a5	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5624-f711-121a-1f3f52550fb2	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5624-f711-49d2-04e5975039a0	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5624-f711-2c2e-25ad199b6d71	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5624-f711-9fe2-32ffdd1f300a	AM	ARM	051	Armenia 	Armenija	\N
00040000-5624-f711-c198-6ccac50524d2	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5624-f711-008b-b3cb36b23480	AU	AUS	036	Australia 	Avstralija	\N
00040000-5624-f711-4ae8-54e20f4d8cf9	AT	AUT	040	Austria 	Avstrija	\N
00040000-5624-f711-3f60-472ef16f09b2	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5624-f711-ac95-27e3e5a82e27	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5624-f711-ae0d-002a9bdc13de	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5624-f711-838c-b1f390634ad8	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5624-f711-8c38-01b7d48b8a34	BB	BRB	052	Barbados 	Barbados	\N
00040000-5624-f711-9eb3-cae597dd5b8b	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5624-f711-d31e-e8527750dfe6	BE	BEL	056	Belgium 	Belgija	\N
00040000-5624-f711-82ba-ba1dbed30b5e	BZ	BLZ	084	Belize 	Belize	\N
00040000-5624-f711-e402-72055889da0a	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5624-f711-394b-b4b7a548cf6e	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5624-f711-705d-e2085cd29e61	BT	BTN	064	Bhutan 	Butan	\N
00040000-5624-f711-1af0-c5e992e56132	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5624-f711-d008-33345ec8f249	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5624-f711-7788-746f86b4cc90	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5624-f711-aecd-91ef35485abb	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5624-f711-a608-aaaeacb6cce2	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5624-f711-44f4-3b183617bf91	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5624-f711-3717-2c050ea69cc7	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5624-f711-290e-a2524a1c4988	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5624-f711-4d07-65d493adf76a	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5624-f711-3ce9-dbcddff74590	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5624-f711-7e44-2938bbf9cf3d	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5624-f711-72fe-393ad6220e09	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5624-f711-6408-e64571856728	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5624-f711-c197-47ae1fd70e3b	CA	CAN	124	Canada 	Kanada	\N
00040000-5624-f711-3ed9-51297f7418c5	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5624-f711-4b83-1ab1b8057695	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5624-f711-70ac-df3019b81461	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5624-f711-4dc5-b12ee8083922	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5624-f711-0ff1-35e603f0f7cd	CL	CHL	152	Chile 	Čile	\N
00040000-5624-f711-2125-99df459561e1	CN	CHN	156	China 	Kitajska	\N
00040000-5624-f711-6d60-68eb402b1086	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5624-f711-6973-6a9668ad494a	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5624-f711-6e6e-35b505d7138a	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5624-f711-6054-4111df741801	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5624-f711-2caa-a34b0c5b5d84	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5624-f711-bcb5-68904143de77	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5624-f711-fe75-e46cdd65da37	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5624-f711-b3a9-81335ec93ced	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5624-f711-c389-ef58c4a0f734	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5624-f711-5084-502fa8e8bfaf	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5624-f711-1f93-b01219cc62a3	CU	CUB	192	Cuba 	Kuba	\N
00040000-5624-f711-c2a3-e4cb27560e70	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5624-f711-9a00-79cf0d8d336a	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5624-f711-a817-1802d4d0e9e6	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5624-f711-ea09-70d17a3e7340	DK	DNK	208	Denmark 	Danska	\N
00040000-5624-f711-4f1a-da324eac2ca2	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5624-f711-28db-714ec4405fcf	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5624-f711-c067-b9113512e926	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5624-f711-1cca-2905073150b0	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5624-f711-a89a-b1f4f3e253c6	EG	EGY	818	Egypt 	Egipt	\N
00040000-5624-f711-828d-344d5e6b5cea	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5624-f711-df01-31312c176fe6	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5624-f711-22ca-f3edd165828b	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5624-f711-dd92-89ef47a49b64	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5624-f711-5927-ec2a95af8fa5	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5624-f711-ada7-4e2b32211003	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5624-f711-17f6-d65ae5732855	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5624-f711-96a0-765b493a655f	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5624-f711-0fd5-54a9cb6c8082	FI	FIN	246	Finland 	Finska	\N
00040000-5624-f711-ea58-ac14fc82952d	FR	FRA	250	France 	Francija	\N
00040000-5624-f711-f0a0-52b7b0fe1aa5	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5624-f711-158e-150a4654e587	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5624-f711-0198-9cf2bbb000b0	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5624-f711-8f87-ba93103b94f9	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5624-f711-cfd7-1632542014b8	GA	GAB	266	Gabon 	Gabon	\N
00040000-5624-f711-85dc-e992e950ba68	GM	GMB	270	Gambia 	Gambija	\N
00040000-5624-f711-ab14-f890f7f17011	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5624-f711-94a4-7e2180924a1d	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5624-f711-de80-d16aad47a549	GH	GHA	288	Ghana 	Gana	\N
00040000-5624-f711-2ca2-66986e9fe1a9	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5624-f711-87c7-244429c044b3	GR	GRC	300	Greece 	Grčija	\N
00040000-5624-f711-20d9-5c810daed422	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5624-f711-941a-42123a72c3bc	GD	GRD	308	Grenada 	Grenada	\N
00040000-5624-f711-9d9c-ba4f3f5dd692	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5624-f711-c94a-c818a65bf92f	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5624-f711-10c1-bd06d777944c	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5624-f711-55ad-9687a9111a67	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5624-f711-c37d-4365071d4238	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5624-f711-9b5c-64785039d005	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5624-f711-507c-1a1856d656b7	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5624-f711-78f5-29392296cc45	HT	HTI	332	Haiti 	Haiti	\N
00040000-5624-f711-f406-f6e816d37690	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5624-f711-d08a-8336963a13c9	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5624-f711-5943-985f04628bca	HN	HND	340	Honduras 	Honduras	\N
00040000-5624-f711-ab71-7799b138129d	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5624-f711-8617-43385d7a00a3	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5624-f711-de53-78dabdb03fd5	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5624-f711-aeaa-d52127fb7c73	IN	IND	356	India 	Indija	\N
00040000-5624-f711-494c-8c29d16cd78d	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5624-f711-1fa5-12dc26dfdf04	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5624-f711-3de7-e1340b4b70d0	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5624-f711-9799-1f2c1d6e2d33	IE	IRL	372	Ireland 	Irska	\N
00040000-5624-f711-cd7f-bf28a0395641	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5624-f711-0d9c-f414960e65ca	IL	ISR	376	Israel 	Izrael	\N
00040000-5624-f711-58e4-016e52c931b4	IT	ITA	380	Italy 	Italija	\N
00040000-5624-f711-8402-40606d931b46	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5624-f711-3f86-f2360d891f57	JP	JPN	392	Japan 	Japonska	\N
00040000-5624-f711-9339-d2eb40fd0079	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5624-f711-15f7-2145fed74e03	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5624-f711-2c3c-d6f66e93076f	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5624-f711-f501-ec20444e101e	KE	KEN	404	Kenya 	Kenija	\N
00040000-5624-f711-8ca0-cc467e5f4ff0	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5624-f711-a52f-f8330d9e923e	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5624-f711-b18d-e263ef39fed7	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5624-f711-e82f-bda28c08a5e8	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5624-f711-a12d-810caffd69e8	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5624-f711-e517-bc37d4b240e0	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5624-f711-e8ad-994447fe2d05	LV	LVA	428	Latvia 	Latvija	\N
00040000-5624-f711-4155-de191bf97ce8	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5624-f711-facf-b1379ebcfee7	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5624-f711-7eed-1c4e4a23b3cf	LR	LBR	430	Liberia 	Liberija	\N
00040000-5624-f711-a4a6-3ec4cb758c5b	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5624-f711-8c52-6a0326995810	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5624-f711-0ad5-1a0337f91e8a	LT	LTU	440	Lithuania 	Litva	\N
00040000-5624-f711-94dc-139534e7ecc2	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5624-f711-b7a9-d3f5cccb2ab3	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5624-f711-0ba9-07dcadc60ea7	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5624-f711-c4ee-c5236dad8a0f	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5624-f711-0d13-53c9f1e666f7	MW	MWI	454	Malawi 	Malavi	\N
00040000-5624-f711-a160-efdd6bb15d20	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5624-f711-9dd3-5c379d0df9ff	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5624-f711-87be-03c3bc3f9262	ML	MLI	466	Mali 	Mali	\N
00040000-5624-f711-c439-2c4cd1d9385e	MT	MLT	470	Malta 	Malta	\N
00040000-5624-f711-1b2e-c963ff295718	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5624-f711-e19b-e8f339047f3b	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5624-f711-c4ba-a62c197e5661	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5624-f711-84a1-710766a74479	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5624-f711-afb8-a85afbd93b61	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5624-f711-c7bc-d7a1247c5b2b	MX	MEX	484	Mexico 	Mehika	\N
00040000-5624-f711-402e-32b7e2059f8e	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5624-f711-6b35-652da8c07a7b	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5624-f711-625e-f48090f9c58f	MC	MCO	492	Monaco 	Monako	\N
00040000-5624-f711-9245-70d3c4a542e6	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5624-f711-aaa3-c4fe1f8cec3f	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5624-f711-1a32-79088580f408	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5624-f711-22c9-6ec0f12aaf11	MA	MAR	504	Morocco 	Maroko	\N
00040000-5624-f711-a8c5-9174c8d3dbf8	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5624-f711-e7b4-a3be0306a0f2	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5624-f711-db15-7fc801ab748a	NA	NAM	516	Namibia 	Namibija	\N
00040000-5624-f711-799b-390abf5adde4	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5624-f711-27da-e73adfc85009	NP	NPL	524	Nepal 	Nepal	\N
00040000-5624-f711-4c01-811eb08336e6	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5624-f711-d3d0-c92abe592aae	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5624-f711-3990-1e7ad65a6412	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5624-f711-9e1c-369878e9507d	NE	NER	562	Niger 	Niger 	\N
00040000-5624-f711-7399-dc2593d41501	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5624-f711-5942-18297df23b22	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5624-f711-bf7a-bdb35f1d2aa4	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5624-f711-6451-dce243e9b4ce	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5624-f711-f5ff-d230f2d4421b	NO	NOR	578	Norway 	Norveška	\N
00040000-5624-f711-4c80-aab2a944e28d	OM	OMN	512	Oman 	Oman	\N
00040000-5624-f711-201e-518c1f75e7cf	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5624-f711-af4e-e2250a5ef726	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5624-f711-9b1f-9cb51c374a1b	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5624-f711-1fc0-b28a4e9d5dd0	PA	PAN	591	Panama 	Panama	\N
00040000-5624-f711-71a5-b1e2419f0458	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5624-f711-b8f8-214c0cbd9741	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5624-f711-f5ce-d0ab380d5811	PE	PER	604	Peru 	Peru	\N
00040000-5624-f711-8f0d-f18950fce3b2	PH	PHL	608	Philippines 	Filipini	\N
00040000-5624-f711-70ed-a38933c94a13	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5624-f711-b34a-48a7d7556903	PL	POL	616	Poland 	Poljska	\N
00040000-5624-f711-70a6-ff65ed97fab6	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5624-f711-9971-efde7a59a517	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5624-f711-594c-5abbf579db5a	QA	QAT	634	Qatar 	Katar	\N
00040000-5624-f711-7c60-1bb899b75105	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5624-f711-207a-8781a049470b	RO	ROU	642	Romania 	Romunija	\N
00040000-5624-f711-90d6-b96209f31571	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5624-f711-dd4b-2b204df8f001	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5624-f711-9b64-6c5a6b6d2d1f	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5624-f711-c5c1-cf3a53a9b65b	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5624-f711-bbc7-0725fd1a5c6d	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5624-f711-5cdc-18559eba54a6	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5624-f711-6f0c-5688264170fb	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5624-f711-fd77-430801e43158	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5624-f711-bf9a-b10990ebb216	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5624-f711-b787-a3f6272f232c	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5624-f711-b33d-d4ca0859f4e5	SM	SMR	674	San Marino 	San Marino	\N
00040000-5624-f711-acaf-2a9d6ceecafa	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5624-f711-782d-2e6df9b3a56a	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5624-f711-be24-912f5dbbb4db	SN	SEN	686	Senegal 	Senegal	\N
00040000-5624-f711-038b-1a3cf285512c	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5624-f711-d9f7-f914b8d4dde1	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5624-f711-a878-3267ac880c1a	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5624-f711-e43d-c2ebbbc2c829	SG	SGP	702	Singapore 	Singapur	\N
00040000-5624-f711-4969-04eb6c24bd06	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5624-f711-7991-050024679ed2	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5624-f711-5b79-74e126d3c924	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5624-f711-e735-70ed42439b10	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5624-f711-2b38-800ddaf2cdb7	SO	SOM	706	Somalia 	Somalija	\N
00040000-5624-f711-0e4d-db2862649fa9	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5624-f711-8687-7dc7a8f1c579	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5624-f711-80a9-335653cd1b66	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5624-f711-716b-ea3494279a9c	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5624-f711-e187-276c1485bf8e	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5624-f711-8145-76e69d6114b4	SD	SDN	729	Sudan 	Sudan	\N
00040000-5624-f711-4f93-414df6200c58	SR	SUR	740	Suriname 	Surinam	\N
00040000-5624-f711-a180-85a2b5d96a70	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5624-f711-f4bd-264e4826275f	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5624-f711-d1ca-e792362fea2f	SE	SWE	752	Sweden 	Švedska	\N
00040000-5624-f711-c820-12e89011e516	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5624-f711-f4b9-d8f5c4d562b6	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5624-f711-2d82-f61ffb7df797	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5624-f711-7af7-f11fc1eb06f1	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5624-f711-37dd-fecf6fee2367	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5624-f711-4639-55053fd1a377	TH	THA	764	Thailand 	Tajska	\N
00040000-5624-f711-d093-182a78dd3c85	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5624-f711-85b4-d23424a22539	TG	TGO	768	Togo 	Togo	\N
00040000-5624-f711-4a32-e8b1d067c260	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5624-f711-5755-554755a98c08	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5624-f711-566e-ac2e6f634b85	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5624-f711-6d65-1ad35e3c43f8	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5624-f711-41c6-7aadcd6d1eee	TR	TUR	792	Turkey 	Turčija	\N
00040000-5624-f711-0e18-5ec7d5d74e43	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5624-f711-4538-8e004633b1f3	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5624-f711-3cbe-eb5e0e83fd5e	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5624-f711-0fb3-71ae735d1f1a	UG	UGA	800	Uganda 	Uganda	\N
00040000-5624-f711-edd3-aca387600c68	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5624-f711-ddc5-f18e71dbe0ac	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5624-f711-27b6-3292d4f3b1b5	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5624-f711-a057-cc17c19d1888	US	USA	840	United States 	Združene države Amerike	\N
00040000-5624-f711-34fb-9965b89fe644	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5624-f711-3801-cde2ad6050b8	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5624-f711-00af-9be0df8fa51d	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5624-f711-eda4-6a19bbcf8c42	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5624-f711-068c-88c04fcf0e45	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5624-f711-7edf-fa7529a7988b	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5624-f711-8fb7-2efc2cd44660	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5624-f711-1705-af6262385911	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5624-f711-7c31-a8f057d45e6f	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5624-f711-c2ad-40b051b80fb7	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5624-f711-0444-c9060548b513	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5624-f711-2e69-f23b17b2dc32	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5624-f711-06c8-0d44ecad4cb0	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3109 (class 0 OID 22620082)
-- Dependencies: 234
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5624-f713-12f0-f492dd8f99cc	000e0000-5624-f713-dcfb-ff6dea4c06c7	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5624-f711-efdc-8673fe6d8ea8	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5624-f713-0431-9b8328eec44f	000e0000-5624-f713-4a56-71e5b22219e7	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5624-f711-5e7b-6cc351f888c5	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5624-f713-1cff-6fe2c0cf5791	000e0000-5624-f713-8264-4b6aac427151	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5624-f711-efdc-8673fe6d8ea8	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5624-f713-8530-e5e04bdd1cda	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5624-f713-d514-101398d584bd	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3094 (class 0 OID 22619883)
-- Dependencies: 219
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5624-f713-073a-a560e072b46e	000e0000-5624-f713-4a56-71e5b22219e7	000c0000-5624-f713-04ee-a0264e97081b	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5624-f711-8265-442ae79d0cbb
000d0000-5624-f713-0c5e-2e980b5f9123	000e0000-5624-f713-4a56-71e5b22219e7	000c0000-5624-f713-c4da-639bde4c8409	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5624-f711-70ef-2779551b51dc
000d0000-5624-f713-3f96-7a0c7325ce0e	000e0000-5624-f713-4a56-71e5b22219e7	000c0000-5624-f713-83b5-e45f023d5090	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5624-f711-f5c7-57e31a55d527
000d0000-5624-f713-adb4-3fe1f8be4ef9	000e0000-5624-f713-4a56-71e5b22219e7	000c0000-5624-f713-e260-921c3ef3f4d4	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5624-f711-a206-7941e2d1c868
000d0000-5624-f713-e5c7-cdaf84432156	000e0000-5624-f713-4a56-71e5b22219e7	000c0000-5624-f713-337b-857919fbf4da	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5624-f711-a206-7941e2d1c868
000d0000-5624-f713-1cc0-a45354226a9f	000e0000-5624-f713-4a56-71e5b22219e7	000c0000-5624-f713-57e4-fb010b053249	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5624-f711-8265-442ae79d0cbb
000d0000-5624-f713-d57b-bed7f48a2c5a	000e0000-5624-f713-4a56-71e5b22219e7	000c0000-5624-f713-e26e-23f4c7bf7814	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5624-f711-8265-442ae79d0cbb
000d0000-5624-f713-b421-34147a3c5669	000e0000-5624-f713-4a56-71e5b22219e7	000c0000-5624-f713-1bd1-e0a425f8fe0f	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5624-f711-c1c5-37a22d6a23ff
000d0000-5624-f713-4cdf-744dfc933d5f	000e0000-5624-f713-4a56-71e5b22219e7	000c0000-5624-f713-29cd-4a36d927987a	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5624-f711-cf3e-1d987597055b
\.


--
-- TOC entry 3073 (class 0 OID 22619688)
-- Dependencies: 198
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3070 (class 0 OID 22619654)
-- Dependencies: 195
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3068 (class 0 OID 22619631)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5624-f713-7444-ca443e50a182	00080000-5624-f713-e9c5-d3ce23dffd8a	00090000-5624-f713-d3ce-271dd2a221a9	AK		igralka
\.


--
-- TOC entry 3083 (class 0 OID 22619797)
-- Dependencies: 208
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 22620321)
-- Dependencies: 245
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 22620333)
-- Dependencies: 246
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 22620355)
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
-- TOC entry 3087 (class 0 OID 22619822)
-- Dependencies: 212
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3065 (class 0 OID 22619588)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5624-f711-458f-fc326deef257	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5624-f711-d2da-bb0429c2e9d4	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5624-f711-8e9d-c26a49df38cd	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5624-f711-cb5b-ba9a2ff2a6a3	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5624-f711-62a3-16c15fc4aa44	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5624-f711-458d-df97f48ec216	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5624-f711-f015-9e45488ee71c	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5624-f711-41ee-17272fc06544	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5624-f711-0b9c-6a2f1b0dac6a	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5624-f711-3565-0cadafaf6389	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5624-f711-2bed-92e02cff1278	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5624-f711-726e-c3afa4094f5c	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5624-f711-c756-db35b395164f	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5624-f711-3e48-fd38d6f8700e	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5624-f711-7c3d-ae7de8e305d7	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5624-f713-425b-a0c039ecaa61	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5624-f713-f09d-a871f1399a4d	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5624-f713-940a-565b77df15b8	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5624-f713-d91c-d5809639074c	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5624-f713-7123-c182ff5f6f91	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5624-f714-4880-27064547806f	application.tenant.maticnopodjetje	string	s:36:"00080000-5624-f714-6b62-38e10bbe716f";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3058 (class 0 OID 22619490)
-- Dependencies: 183
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5624-f713-0d63-9c0d281f41c1	00000000-5624-f713-425b-a0c039ecaa61	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5624-f713-b63e-5dc44bc12a9e	00000000-5624-f713-425b-a0c039ecaa61	00010000-5624-f711-e8d0-f058c796d35f	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5624-f713-f3b6-940c524bbb9b	00000000-5624-f713-f09d-a871f1399a4d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3062 (class 0 OID 22619554)
-- Dependencies: 187
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5624-f713-1372-f25905a3540d	\N	00100000-5624-f713-6336-c81e4b855399	00100000-5624-f713-16a2-e807a1480391	01	Gledališče Nimbis
00410000-5624-f713-dee1-201f27ea22e9	00410000-5624-f713-1372-f25905a3540d	00100000-5624-f713-6336-c81e4b855399	00100000-5624-f713-16a2-e807a1480391	02	Tehnika
\.


--
-- TOC entry 3059 (class 0 OID 22619501)
-- Dependencies: 184
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5624-f713-fd25-7a3c7f665f5d	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5624-f713-94a7-f9ad8b002523	00010000-5624-f713-5c26-e0ffcf641eda	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5624-f713-77c2-593d0c7d00da	00010000-5624-f713-9c2e-d68fa431cbd5	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5624-f713-3807-9e66e0ce9762	00010000-5624-f713-7bf0-28dc29a310bb	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5624-f713-435e-5ff6a06b68e8	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5624-f713-0640-8ef8f8d77b92	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5624-f713-2419-415c70cc28f8	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5624-f713-3537-ddb708fd065e	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5624-f713-d3ce-271dd2a221a9	00010000-5624-f713-f8d9-e591ace99ce1	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5624-f713-0601-e0019d7dc554	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5624-f713-0782-30dbf8d1ce52	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5624-f713-eb09-ddc5b1e715c8	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5624-f713-0fa3-1682641a1e60	00010000-5624-f713-2807-d7e49aa7c3cd	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5624-f713-7037-22ad61c6cf6b	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5624-f713-ca51-5f0ab8a89be6	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5624-f713-de52-f8cf8ac3bbfb	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5624-f713-1a18-7551ec24b280	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5624-f713-6a78-9089f3618fd3	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 3053 (class 0 OID 22619445)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5624-f711-a5bd-30a6b9b62704	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5624-f711-683b-3d3137f7aaa6	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5624-f711-72a9-b8cc6b2fc66e	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5624-f711-e2e0-9db3f54a4dc7	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5624-f711-4f8a-a665d9d587ab	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5624-f711-92ca-2e38b7ffe8f3	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5624-f711-206d-d62caca17041	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5624-f711-129d-d692e76e5ab9	Abonma-read	Abonma - branje	f
00030000-5624-f711-2fcd-e871631ff099	Abonma-write	Abonma - spreminjanje	f
00030000-5624-f711-479d-b728e61d5596	Alternacija-read	Alternacija - branje	f
00030000-5624-f711-1b6b-f7a62822d4c0	Alternacija-write	Alternacija - spreminjanje	f
00030000-5624-f711-586d-9c2b25c22ce6	Arhivalija-read	Arhivalija - branje	f
00030000-5624-f711-e59d-531002206860	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5624-f711-1bfd-17ff8c551361	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5624-f711-56ba-9378547b08e6	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5624-f711-5f71-12215a136983	Besedilo-read	Besedilo - branje	f
00030000-5624-f711-1354-922a1472783d	Besedilo-write	Besedilo - spreminjanje	f
00030000-5624-f711-1f17-f5f4fd3953a4	DogodekIzven-read	DogodekIzven - branje	f
00030000-5624-f711-bede-c62bdb62c99b	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5624-f711-e7cc-09967a006acf	Dogodek-read	Dogodek - branje	f
00030000-5624-f711-d263-e7d5a665934c	Dogodek-write	Dogodek - spreminjanje	f
00030000-5624-f711-6572-3ff76304871c	DrugiVir-read	DrugiVir - branje	f
00030000-5624-f711-505e-5ea49fc0d8ad	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5624-f711-49df-59ee3f37bf0d	Drzava-read	Drzava - branje	f
00030000-5624-f711-29fb-fc9a0324b843	Drzava-write	Drzava - spreminjanje	f
00030000-5624-f711-2911-91386b5d6eb0	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5624-f711-70e0-faea0e290003	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5624-f711-16c8-6ec65a33f161	Funkcija-read	Funkcija - branje	f
00030000-5624-f711-8350-00b8f56d6700	Funkcija-write	Funkcija - spreminjanje	f
00030000-5624-f711-4845-f0ec824714d2	Gostovanje-read	Gostovanje - branje	f
00030000-5624-f711-291c-968e0f29db79	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5624-f711-3974-5515f5a04f15	Gostujoca-read	Gostujoca - branje	f
00030000-5624-f711-1080-39339b6bd03b	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5624-f711-3f6b-5d5d370ed545	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5624-f711-474f-b1d5287f6c47	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5624-f711-2adc-2064a102115a	Kupec-read	Kupec - branje	f
00030000-5624-f711-f852-e4a7f7c04c63	Kupec-write	Kupec - spreminjanje	f
00030000-5624-f711-16f4-5cfec26e0776	NacinPlacina-read	NacinPlacina - branje	f
00030000-5624-f711-4b8a-a11274e58445	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5624-f711-209f-22d4f450d77b	Option-read	Option - branje	f
00030000-5624-f711-ab24-2084d4f87089	Option-write	Option - spreminjanje	f
00030000-5624-f711-77a4-d1c5d6afff94	OptionValue-read	OptionValue - branje	f
00030000-5624-f711-ebfa-39cf11e96bec	OptionValue-write	OptionValue - spreminjanje	f
00030000-5624-f711-8892-52192643188b	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	f
00030000-5624-f711-ad17-5000caab477f	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	f
00030000-5624-f711-0304-83d6518cd5dc	Oseba-read	Oseba - branje	f
00030000-5624-f711-c3ac-ee5b1e5c147c	Oseba-write	Oseba - spreminjanje	f
00030000-5624-f711-071b-19d501e90594	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5624-f711-1d06-50f2c99c81c2	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5624-f711-0078-4d743e5b7642	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5624-f711-d32e-55b7c035a85f	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5624-f711-ce49-8f5fdc569dda	Pogodba-read	Pogodba - branje	f
00030000-5624-f711-fec5-a391ace49f82	Pogodba-write	Pogodba - spreminjanje	f
00030000-5624-f711-439f-1f28dac11353	Popa-read	Popa - branje	f
00030000-5624-f711-0747-6a8f004c033d	Popa-write	Popa - spreminjanje	f
00030000-5624-f711-98f3-5ce7c530f6ce	Posta-read	Posta - branje	f
00030000-5624-f711-e48d-59f825d3b796	Posta-write	Posta - spreminjanje	f
00030000-5624-f711-f1f7-50deb5ac342b	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5624-f711-74af-7c22499db959	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5624-f711-a0bd-323b2397fc49	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5624-f711-4226-5a57f4d347a6	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5624-f711-3143-45c5322a9708	PostniNaslov-read	PostniNaslov - branje	f
00030000-5624-f711-4e83-e4430f5c87b1	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5624-f711-834f-11965be39bef	Predstava-read	Predstava - branje	f
00030000-5624-f711-edd7-91145d632543	Predstava-write	Predstava - spreminjanje	f
00030000-5624-f711-84c2-c1d89117838f	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5624-f711-d20f-74c10a82a2de	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5624-f711-be05-ed73e9877e8a	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5624-f711-3980-000560e6d300	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5624-f711-3ff1-2d31b44fd66e	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5624-f711-5d6c-360963ed5ff0	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5624-f711-48f7-accbdf3c84f0	ProgramDela-read	ProgramDela - branje	f
00030000-5624-f711-7034-f90f9406a42a	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5624-f711-5fcb-9bea9f47d65d	ProgramFestival-read	ProgramFestival - branje	f
00030000-5624-f711-1195-0051bc292a0a	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5624-f711-9a5e-f215684a466e	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5624-f711-0fd4-c6021d8ef0fb	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5624-f711-a2bf-a59def15a2fd	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5624-f711-beb6-5602bf37fd02	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5624-f711-69d2-a371ad4211be	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5624-f711-14b8-9f01b23ed07c	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5624-f711-1412-44d076d2ad76	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5624-f711-1937-ffd29fa3c607	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5624-f711-548c-bfe9eb7da0bd	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5624-f711-9fc9-4447c4b39fd4	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5624-f711-b3f1-ebbeb2708a21	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5624-f711-1096-ef6d2e83f6fe	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5624-f711-a265-607a6afad5b4	ProgramRazno-read	ProgramRazno - branje	f
00030000-5624-f711-b144-8dbb65b951d4	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5624-f711-4d53-bfa9e6934ba5	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5624-f711-ccd6-70ef1b00a148	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5624-f711-8fd9-8c5968b84819	Prostor-read	Prostor - branje	f
00030000-5624-f711-efd4-0f13fa4d52fc	Prostor-write	Prostor - spreminjanje	f
00030000-5624-f711-1f4c-aaaeebe62149	Racun-read	Racun - branje	f
00030000-5624-f711-e26b-0cfd8a53ca24	Racun-write	Racun - spreminjanje	f
00030000-5624-f711-c443-6d358edafa98	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5624-f711-2d24-fb82a923ca9c	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5624-f711-f17a-c73c36658865	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5624-f711-8f3e-03bef08fb9c4	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5624-f711-5789-04f973e742fa	Rekvizit-read	Rekvizit - branje	f
00030000-5624-f711-a375-362f07a89e31	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5624-f711-f15c-2752d4d384d4	Revizija-read	Revizija - branje	f
00030000-5624-f711-015b-de6c40c57433	Revizija-write	Revizija - spreminjanje	f
00030000-5624-f711-ba81-77aeb72d489b	Rezervacija-read	Rezervacija - branje	f
00030000-5624-f711-0198-b16399b0ce96	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5624-f711-6fc3-ba880ccabca8	SedezniRed-read	SedezniRed - branje	f
00030000-5624-f711-a15c-025548ccf5f1	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5624-f711-6b8f-eec6f250debf	Sedez-read	Sedez - branje	f
00030000-5624-f711-4a3e-e08e260f7aa4	Sedez-write	Sedez - spreminjanje	f
00030000-5624-f711-7e24-eca41f8f4fbb	Sezona-read	Sezona - branje	f
00030000-5624-f711-83e7-d5eecb69ce66	Sezona-write	Sezona - spreminjanje	f
00030000-5624-f711-71c0-1544ec7f2ca7	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5624-f711-b32d-4a61b388909d	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5624-f711-00b8-aa66d37c51e5	Stevilcenje-read	Stevilcenje - branje	f
00030000-5624-f711-293e-0d9f3bd04bc0	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5624-f711-a6a6-c2c623f39022	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5624-f711-bf9e-5112eb7b8134	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5624-f711-a78d-7dc3dce57280	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5624-f711-441e-f27741308710	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5624-f711-cb54-20b03f7cf0fe	Telefonska-read	Telefonska - branje	f
00030000-5624-f711-a0ca-3367b588f272	Telefonska-write	Telefonska - spreminjanje	f
00030000-5624-f711-3a7e-a64174ba8cd6	TerminStoritve-read	TerminStoritve - branje	f
00030000-5624-f711-c99a-5eaf8ca16baf	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5624-f711-cc56-3e8fa4766541	TipFunkcije-read	TipFunkcije - branje	f
00030000-5624-f711-da73-b3fd2acd1461	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5624-f711-ba18-865b29a5a016	TipPopa-read	TipPopa - branje	f
00030000-5624-f711-00fd-8d6b4547ba82	TipPopa-write	TipPopa - spreminjanje	f
00030000-5624-f711-c44a-248646142321	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5624-f711-98a9-a90f430cfa9a	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5624-f711-242b-837fa6814ce1	TipVaje-read	TipVaje - branje	f
00030000-5624-f711-2448-de9fd2700f31	TipVaje-write	TipVaje - spreminjanje	f
00030000-5624-f711-762a-8599c660946e	Trr-read	Trr - branje	f
00030000-5624-f711-9ba4-662c1ebf9583	Trr-write	Trr - spreminjanje	f
00030000-5624-f711-fc4c-5d298f4e3b15	Uprizoritev-read	Uprizoritev - branje	f
00030000-5624-f711-31d7-dab24ca0850d	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5624-f711-748a-b212a2303f74	Vaja-read	Vaja - branje	f
00030000-5624-f711-2fbf-06c8484af1dd	Vaja-write	Vaja - spreminjanje	f
00030000-5624-f711-cbee-a52b52a3b97c	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5624-f711-06a2-bd83c56c5928	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5624-f711-c805-f223e849cdb2	VrstaStroska-read	VrstaStroska - branje	f
00030000-5624-f711-fb6c-459064ee6552	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5624-f711-7001-5237c75eb7ab	Zaposlitev-read	Zaposlitev - branje	f
00030000-5624-f711-57d1-2c95341b2b0d	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5624-f711-4ab6-90279f5ce227	Zasedenost-read	Zasedenost - branje	f
00030000-5624-f711-719f-0570f3c7f1b9	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5624-f711-13b9-f10f4695c59c	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5624-f711-7219-dee365546efc	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5624-f711-c89b-3af2210d593a	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5624-f711-6312-0d09f43c5389	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5624-f711-a47e-3825880f2c61	Job-read	Branje opravil - samo zase - branje	f
00030000-5624-f711-0489-4e09fee97a5f	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5624-f711-1095-adcf3eda358b	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5624-f711-e2ab-d24484ce530f	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5624-f711-36ac-c0c07169203c	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5624-f711-1b62-e730d457ed7c	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5624-f711-7b0c-7e60ff4c6e56	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5624-f711-5bb1-092c6c47d030	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5624-f711-1703-77e331ea17e9	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5624-f711-867f-38fb35306f77	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5624-f711-e833-e44a090c2f94	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5624-f711-15e2-026e83e8e946	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5624-f711-f36b-6d0b1f8e7f51	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5624-f711-d79f-0f96f11dbf7c	Datoteka-write	Datoteka - spreminjanje	f
00030000-5624-f711-ebc8-f4c09d59d949	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3055 (class 0 OID 22619464)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5624-f711-5e95-486a946ce4e7	00030000-5624-f711-683b-3d3137f7aaa6
00020000-5624-f711-3604-b25f9bab421c	00030000-5624-f711-49df-59ee3f37bf0d
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-129d-d692e76e5ab9
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-2fcd-e871631ff099
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-479d-b728e61d5596
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-1b6b-f7a62822d4c0
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-586d-9c2b25c22ce6
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-e7cc-09967a006acf
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-e2e0-9db3f54a4dc7
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-d263-e7d5a665934c
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-49df-59ee3f37bf0d
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-29fb-fc9a0324b843
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-16c8-6ec65a33f161
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-8350-00b8f56d6700
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-4845-f0ec824714d2
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-291c-968e0f29db79
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-3974-5515f5a04f15
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-1080-39339b6bd03b
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-3f6b-5d5d370ed545
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-474f-b1d5287f6c47
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-209f-22d4f450d77b
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-77a4-d1c5d6afff94
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-0304-83d6518cd5dc
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-c3ac-ee5b1e5c147c
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-439f-1f28dac11353
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-0747-6a8f004c033d
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-98f3-5ce7c530f6ce
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-e48d-59f825d3b796
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-3143-45c5322a9708
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-4e83-e4430f5c87b1
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-834f-11965be39bef
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-edd7-91145d632543
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-3ff1-2d31b44fd66e
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-5d6c-360963ed5ff0
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-8fd9-8c5968b84819
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-efd4-0f13fa4d52fc
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-f17a-c73c36658865
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-8f3e-03bef08fb9c4
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-5789-04f973e742fa
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-a375-362f07a89e31
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-7e24-eca41f8f4fbb
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-83e7-d5eecb69ce66
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-cc56-3e8fa4766541
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-fc4c-5d298f4e3b15
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-31d7-dab24ca0850d
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-748a-b212a2303f74
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-2fbf-06c8484af1dd
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-4ab6-90279f5ce227
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-719f-0570f3c7f1b9
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-13b9-f10f4695c59c
00020000-5624-f711-d41c-b001a9428877	00030000-5624-f711-c89b-3af2210d593a
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-129d-d692e76e5ab9
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-586d-9c2b25c22ce6
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-e7cc-09967a006acf
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-49df-59ee3f37bf0d
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-4845-f0ec824714d2
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-3974-5515f5a04f15
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-3f6b-5d5d370ed545
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-474f-b1d5287f6c47
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-209f-22d4f450d77b
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-77a4-d1c5d6afff94
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-0304-83d6518cd5dc
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-c3ac-ee5b1e5c147c
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-439f-1f28dac11353
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-98f3-5ce7c530f6ce
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-3143-45c5322a9708
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-4e83-e4430f5c87b1
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-834f-11965be39bef
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-8fd9-8c5968b84819
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-f17a-c73c36658865
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-5789-04f973e742fa
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-7e24-eca41f8f4fbb
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-cb54-20b03f7cf0fe
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-a0ca-3367b588f272
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-762a-8599c660946e
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-9ba4-662c1ebf9583
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-7001-5237c75eb7ab
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-57d1-2c95341b2b0d
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-13b9-f10f4695c59c
00020000-5624-f711-caf1-eddcb02e94cf	00030000-5624-f711-c89b-3af2210d593a
00020000-5624-f711-617d-13ce53f1a980	00030000-5624-f711-129d-d692e76e5ab9
00020000-5624-f711-617d-13ce53f1a980	00030000-5624-f711-479d-b728e61d5596
00020000-5624-f711-617d-13ce53f1a980	00030000-5624-f711-586d-9c2b25c22ce6
00020000-5624-f711-617d-13ce53f1a980	00030000-5624-f711-e59d-531002206860
00020000-5624-f711-617d-13ce53f1a980	00030000-5624-f711-5f71-12215a136983
00020000-5624-f711-617d-13ce53f1a980	00030000-5624-f711-1f17-f5f4fd3953a4
00020000-5624-f711-617d-13ce53f1a980	00030000-5624-f711-e7cc-09967a006acf
00020000-5624-f711-617d-13ce53f1a980	00030000-5624-f711-49df-59ee3f37bf0d
00020000-5624-f711-617d-13ce53f1a980	00030000-5624-f711-16c8-6ec65a33f161
00020000-5624-f711-617d-13ce53f1a980	00030000-5624-f711-4845-f0ec824714d2
00020000-5624-f711-617d-13ce53f1a980	00030000-5624-f711-3974-5515f5a04f15
00020000-5624-f711-617d-13ce53f1a980	00030000-5624-f711-3f6b-5d5d370ed545
00020000-5624-f711-617d-13ce53f1a980	00030000-5624-f711-209f-22d4f450d77b
00020000-5624-f711-617d-13ce53f1a980	00030000-5624-f711-77a4-d1c5d6afff94
00020000-5624-f711-617d-13ce53f1a980	00030000-5624-f711-0304-83d6518cd5dc
00020000-5624-f711-617d-13ce53f1a980	00030000-5624-f711-439f-1f28dac11353
00020000-5624-f711-617d-13ce53f1a980	00030000-5624-f711-98f3-5ce7c530f6ce
00020000-5624-f711-617d-13ce53f1a980	00030000-5624-f711-834f-11965be39bef
00020000-5624-f711-617d-13ce53f1a980	00030000-5624-f711-3ff1-2d31b44fd66e
00020000-5624-f711-617d-13ce53f1a980	00030000-5624-f711-8fd9-8c5968b84819
00020000-5624-f711-617d-13ce53f1a980	00030000-5624-f711-f17a-c73c36658865
00020000-5624-f711-617d-13ce53f1a980	00030000-5624-f711-5789-04f973e742fa
00020000-5624-f711-617d-13ce53f1a980	00030000-5624-f711-7e24-eca41f8f4fbb
00020000-5624-f711-617d-13ce53f1a980	00030000-5624-f711-cc56-3e8fa4766541
00020000-5624-f711-617d-13ce53f1a980	00030000-5624-f711-748a-b212a2303f74
00020000-5624-f711-617d-13ce53f1a980	00030000-5624-f711-4ab6-90279f5ce227
00020000-5624-f711-617d-13ce53f1a980	00030000-5624-f711-13b9-f10f4695c59c
00020000-5624-f711-617d-13ce53f1a980	00030000-5624-f711-c89b-3af2210d593a
00020000-5624-f711-ea86-2e77a0a37cf5	00030000-5624-f711-129d-d692e76e5ab9
00020000-5624-f711-ea86-2e77a0a37cf5	00030000-5624-f711-2fcd-e871631ff099
00020000-5624-f711-ea86-2e77a0a37cf5	00030000-5624-f711-1b6b-f7a62822d4c0
00020000-5624-f711-ea86-2e77a0a37cf5	00030000-5624-f711-586d-9c2b25c22ce6
00020000-5624-f711-ea86-2e77a0a37cf5	00030000-5624-f711-e7cc-09967a006acf
00020000-5624-f711-ea86-2e77a0a37cf5	00030000-5624-f711-49df-59ee3f37bf0d
00020000-5624-f711-ea86-2e77a0a37cf5	00030000-5624-f711-4845-f0ec824714d2
00020000-5624-f711-ea86-2e77a0a37cf5	00030000-5624-f711-3974-5515f5a04f15
00020000-5624-f711-ea86-2e77a0a37cf5	00030000-5624-f711-209f-22d4f450d77b
00020000-5624-f711-ea86-2e77a0a37cf5	00030000-5624-f711-77a4-d1c5d6afff94
00020000-5624-f711-ea86-2e77a0a37cf5	00030000-5624-f711-439f-1f28dac11353
00020000-5624-f711-ea86-2e77a0a37cf5	00030000-5624-f711-98f3-5ce7c530f6ce
00020000-5624-f711-ea86-2e77a0a37cf5	00030000-5624-f711-834f-11965be39bef
00020000-5624-f711-ea86-2e77a0a37cf5	00030000-5624-f711-8fd9-8c5968b84819
00020000-5624-f711-ea86-2e77a0a37cf5	00030000-5624-f711-f17a-c73c36658865
00020000-5624-f711-ea86-2e77a0a37cf5	00030000-5624-f711-5789-04f973e742fa
00020000-5624-f711-ea86-2e77a0a37cf5	00030000-5624-f711-7e24-eca41f8f4fbb
00020000-5624-f711-ea86-2e77a0a37cf5	00030000-5624-f711-cc56-3e8fa4766541
00020000-5624-f711-ea86-2e77a0a37cf5	00030000-5624-f711-13b9-f10f4695c59c
00020000-5624-f711-ea86-2e77a0a37cf5	00030000-5624-f711-c89b-3af2210d593a
00020000-5624-f711-a78b-3dee086b93b3	00030000-5624-f711-129d-d692e76e5ab9
00020000-5624-f711-a78b-3dee086b93b3	00030000-5624-f711-586d-9c2b25c22ce6
00020000-5624-f711-a78b-3dee086b93b3	00030000-5624-f711-e7cc-09967a006acf
00020000-5624-f711-a78b-3dee086b93b3	00030000-5624-f711-49df-59ee3f37bf0d
00020000-5624-f711-a78b-3dee086b93b3	00030000-5624-f711-4845-f0ec824714d2
00020000-5624-f711-a78b-3dee086b93b3	00030000-5624-f711-3974-5515f5a04f15
00020000-5624-f711-a78b-3dee086b93b3	00030000-5624-f711-209f-22d4f450d77b
00020000-5624-f711-a78b-3dee086b93b3	00030000-5624-f711-77a4-d1c5d6afff94
00020000-5624-f711-a78b-3dee086b93b3	00030000-5624-f711-439f-1f28dac11353
00020000-5624-f711-a78b-3dee086b93b3	00030000-5624-f711-98f3-5ce7c530f6ce
00020000-5624-f711-a78b-3dee086b93b3	00030000-5624-f711-834f-11965be39bef
00020000-5624-f711-a78b-3dee086b93b3	00030000-5624-f711-8fd9-8c5968b84819
00020000-5624-f711-a78b-3dee086b93b3	00030000-5624-f711-f17a-c73c36658865
00020000-5624-f711-a78b-3dee086b93b3	00030000-5624-f711-5789-04f973e742fa
00020000-5624-f711-a78b-3dee086b93b3	00030000-5624-f711-7e24-eca41f8f4fbb
00020000-5624-f711-a78b-3dee086b93b3	00030000-5624-f711-3a7e-a64174ba8cd6
00020000-5624-f711-a78b-3dee086b93b3	00030000-5624-f711-72a9-b8cc6b2fc66e
00020000-5624-f711-a78b-3dee086b93b3	00030000-5624-f711-cc56-3e8fa4766541
00020000-5624-f711-a78b-3dee086b93b3	00030000-5624-f711-13b9-f10f4695c59c
00020000-5624-f711-a78b-3dee086b93b3	00030000-5624-f711-c89b-3af2210d593a
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-a5bd-30a6b9b62704
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-683b-3d3137f7aaa6
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-72a9-b8cc6b2fc66e
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-e2e0-9db3f54a4dc7
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-4f8a-a665d9d587ab
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-92ca-2e38b7ffe8f3
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-206d-d62caca17041
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-129d-d692e76e5ab9
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-2fcd-e871631ff099
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-479d-b728e61d5596
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-1b6b-f7a62822d4c0
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-586d-9c2b25c22ce6
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-e59d-531002206860
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-5f71-12215a136983
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-1354-922a1472783d
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-1f17-f5f4fd3953a4
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-bede-c62bdb62c99b
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-e7cc-09967a006acf
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-d263-e7d5a665934c
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-49df-59ee3f37bf0d
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-29fb-fc9a0324b843
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-6572-3ff76304871c
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-505e-5ea49fc0d8ad
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-2911-91386b5d6eb0
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-70e0-faea0e290003
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-16c8-6ec65a33f161
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-8350-00b8f56d6700
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-4845-f0ec824714d2
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-291c-968e0f29db79
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-3974-5515f5a04f15
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-1080-39339b6bd03b
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-3f6b-5d5d370ed545
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-474f-b1d5287f6c47
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-2adc-2064a102115a
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-f852-e4a7f7c04c63
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-16f4-5cfec26e0776
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-4b8a-a11274e58445
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-209f-22d4f450d77b
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-ab24-2084d4f87089
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-77a4-d1c5d6afff94
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-ebfa-39cf11e96bec
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-0304-83d6518cd5dc
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-c3ac-ee5b1e5c147c
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-071b-19d501e90594
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-1d06-50f2c99c81c2
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-0078-4d743e5b7642
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-d32e-55b7c035a85f
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-ce49-8f5fdc569dda
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-fec5-a391ace49f82
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-439f-1f28dac11353
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-0747-6a8f004c033d
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-98f3-5ce7c530f6ce
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-e48d-59f825d3b796
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-f1f7-50deb5ac342b
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-74af-7c22499db959
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-a0bd-323b2397fc49
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-4226-5a57f4d347a6
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-3143-45c5322a9708
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-4e83-e4430f5c87b1
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-834f-11965be39bef
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-edd7-91145d632543
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-84c2-c1d89117838f
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-d20f-74c10a82a2de
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-be05-ed73e9877e8a
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-3980-000560e6d300
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-3ff1-2d31b44fd66e
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-5d6c-360963ed5ff0
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-48f7-accbdf3c84f0
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-7034-f90f9406a42a
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-5fcb-9bea9f47d65d
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-1195-0051bc292a0a
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-9a5e-f215684a466e
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-0fd4-c6021d8ef0fb
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-a2bf-a59def15a2fd
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-beb6-5602bf37fd02
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-69d2-a371ad4211be
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-14b8-9f01b23ed07c
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-1412-44d076d2ad76
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-1937-ffd29fa3c607
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-548c-bfe9eb7da0bd
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-9fc9-4447c4b39fd4
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-b3f1-ebbeb2708a21
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-1096-ef6d2e83f6fe
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-a265-607a6afad5b4
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-b144-8dbb65b951d4
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-4d53-bfa9e6934ba5
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-ccd6-70ef1b00a148
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-8fd9-8c5968b84819
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-efd4-0f13fa4d52fc
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-1f4c-aaaeebe62149
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-e26b-0cfd8a53ca24
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-c443-6d358edafa98
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-2d24-fb82a923ca9c
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-f17a-c73c36658865
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-8f3e-03bef08fb9c4
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-5789-04f973e742fa
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-a375-362f07a89e31
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-f15c-2752d4d384d4
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-015b-de6c40c57433
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-ba81-77aeb72d489b
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-0198-b16399b0ce96
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-6fc3-ba880ccabca8
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-a15c-025548ccf5f1
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-6b8f-eec6f250debf
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-4a3e-e08e260f7aa4
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-7e24-eca41f8f4fbb
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-83e7-d5eecb69ce66
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-71c0-1544ec7f2ca7
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-b32d-4a61b388909d
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-00b8-aa66d37c51e5
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-293e-0d9f3bd04bc0
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-a6a6-c2c623f39022
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-bf9e-5112eb7b8134
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-a78d-7dc3dce57280
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-441e-f27741308710
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-cb54-20b03f7cf0fe
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-a0ca-3367b588f272
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-3a7e-a64174ba8cd6
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-c99a-5eaf8ca16baf
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-cc56-3e8fa4766541
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-da73-b3fd2acd1461
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-c44a-248646142321
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-98a9-a90f430cfa9a
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-762a-8599c660946e
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-9ba4-662c1ebf9583
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-fc4c-5d298f4e3b15
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-31d7-dab24ca0850d
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-748a-b212a2303f74
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-2fbf-06c8484af1dd
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-cbee-a52b52a3b97c
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-06a2-bd83c56c5928
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-c805-f223e849cdb2
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-fb6c-459064ee6552
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-7001-5237c75eb7ab
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-57d1-2c95341b2b0d
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-4ab6-90279f5ce227
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-719f-0570f3c7f1b9
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-13b9-f10f4695c59c
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-7219-dee365546efc
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-c89b-3af2210d593a
00020000-5624-f713-493c-1d414853dfda	00030000-5624-f711-6312-0d09f43c5389
\.


--
-- TOC entry 3088 (class 0 OID 22619829)
-- Dependencies: 213
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3092 (class 0 OID 22619863)
-- Dependencies: 217
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 22620000)
-- Dependencies: 229
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5624-f713-45f9-fb58d44ff0d2	00090000-5624-f713-fd25-7a3c7f665f5d	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5624-f713-0a69-886a32a7331c	00090000-5624-f713-0640-8ef8f8d77b92	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5624-f713-3384-f55c6ee5fcd5	00090000-5624-f713-0fa3-1682641a1e60	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5624-f713-8dab-5d7e530c28f0	00090000-5624-f713-0601-e0019d7dc554	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3061 (class 0 OID 22619534)
-- Dependencies: 186
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5624-f713-e9c5-d3ce23dffd8a	\N	00040000-5624-f711-5b79-74e126d3c924	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-f713-a64b-895fbbd3b944	\N	00040000-5624-f711-5b79-74e126d3c924	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5624-f713-9a3a-ac0a4db9b04d	\N	00040000-5624-f711-5b79-74e126d3c924	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-f713-068c-7e473d3961ed	\N	00040000-5624-f711-5b79-74e126d3c924	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-f713-b193-6cee46e0ad20	\N	00040000-5624-f711-5b79-74e126d3c924	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-f713-c3a9-28eeb973b2fa	\N	00040000-5624-f711-2c2e-25ad199b6d71	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-f713-3a3c-b37d19378aaa	\N	00040000-5624-f711-5084-502fa8e8bfaf	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-f713-adcb-fc25e8f8ed59	\N	00040000-5624-f711-4ae8-54e20f4d8cf9	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-f713-d368-4743d09fe55f	\N	00040000-5624-f711-94a4-7e2180924a1d	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5624-f714-6b62-38e10bbe716f	\N	00040000-5624-f711-5b79-74e126d3c924	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3064 (class 0 OID 22619580)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5624-f711-06f7-48b63e75eab8	8341	Adlešiči
00050000-5624-f711-47c9-13c93b9554c2	5270	Ajdovščina
00050000-5624-f711-eee1-d95245931021	6280	Ankaran/Ancarano
00050000-5624-f711-fd81-626618edc911	9253	Apače
00050000-5624-f711-37c6-dcd90d8a3e30	8253	Artiče
00050000-5624-f711-c5f7-33d0cae9fe35	4275	Begunje na Gorenjskem
00050000-5624-f711-6e44-6daef82d40d0	1382	Begunje pri Cerknici
00050000-5624-f711-7039-7f7aef46b3a8	9231	Beltinci
00050000-5624-f711-5640-b6c4344a686e	2234	Benedikt
00050000-5624-f711-4436-2f02c4a0a289	2345	Bistrica ob Dravi
00050000-5624-f711-d62c-043a0bbdd0b6	3256	Bistrica ob Sotli
00050000-5624-f711-27be-d80612de57ad	8259	Bizeljsko
00050000-5624-f711-1830-1c9bde6cc3c5	1223	Blagovica
00050000-5624-f711-3dcd-fdde27937e6e	8283	Blanca
00050000-5624-f711-3c25-411520535c4c	4260	Bled
00050000-5624-f711-4dce-8eeb2103f61c	4273	Blejska Dobrava
00050000-5624-f711-6e88-b242027c0d99	9265	Bodonci
00050000-5624-f711-5115-de6394706143	9222	Bogojina
00050000-5624-f711-225a-a32af663674b	4263	Bohinjska Bela
00050000-5624-f711-70ab-f0c6be944dde	4264	Bohinjska Bistrica
00050000-5624-f711-064a-95af31f4a8cd	4265	Bohinjsko jezero
00050000-5624-f711-4b51-2fde0643e030	1353	Borovnica
00050000-5624-f711-fd1f-c4b94bae0103	8294	Boštanj
00050000-5624-f711-fe5e-05ea5dc38dd9	5230	Bovec
00050000-5624-f711-87c3-a1986f42224c	5295	Branik
00050000-5624-f711-3f72-2072222966f4	3314	Braslovče
00050000-5624-f711-6a54-879fd7be5a1e	5223	Breginj
00050000-5624-f711-41d6-6b037196baa7	8280	Brestanica
00050000-5624-f711-2dd8-876f36827c92	2354	Bresternica
00050000-5624-f711-af2d-41573e8bca29	4243	Brezje
00050000-5624-f711-ea5e-e2dbcbe1a169	1351	Brezovica pri Ljubljani
00050000-5624-f711-dcf6-a98cace7d011	8250	Brežice
00050000-5624-f711-d0c3-3c90d8b3b9b8	4210	Brnik - Aerodrom
00050000-5624-f711-32d1-ef98ea79529c	8321	Brusnice
00050000-5624-f711-a6ee-0344bfb70f56	3255	Buče
00050000-5624-f711-493e-73398e1ce6f8	8276	Bučka 
00050000-5624-f711-5fe3-c200096f603c	9261	Cankova
00050000-5624-f711-bbb6-ee6507bb0570	3000	Celje 
00050000-5624-f711-120c-4dd958100a8e	3001	Celje - poštni predali
00050000-5624-f711-9ef8-791352bed8e2	4207	Cerklje na Gorenjskem
00050000-5624-f711-0d42-601a518d26ae	8263	Cerklje ob Krki
00050000-5624-f711-8ac3-4f6f5f093f97	1380	Cerknica
00050000-5624-f711-8868-8161ecf6cae3	5282	Cerkno
00050000-5624-f711-a181-06046d9e6765	2236	Cerkvenjak
00050000-5624-f711-cb8a-aa2d456cde57	2215	Ceršak
00050000-5624-f711-637e-5efcde1e362b	2326	Cirkovce
00050000-5624-f711-3078-a5f2e21c333a	2282	Cirkulane
00050000-5624-f711-517e-41f605dfddb6	5273	Col
00050000-5624-f711-3121-96c1ae25fe55	8251	Čatež ob Savi
00050000-5624-f711-f1ae-032c8317b949	1413	Čemšenik
00050000-5624-f711-e9fd-f666e8a7b72b	5253	Čepovan
00050000-5624-f711-b91c-870b7a72f22c	9232	Črenšovci
00050000-5624-f711-ec48-aea28cd9c47d	2393	Črna na Koroškem
00050000-5624-f711-c0c0-0691488ea0b9	6275	Črni Kal
00050000-5624-f711-1303-33505760beea	5274	Črni Vrh nad Idrijo
00050000-5624-f711-0e99-a7c452e5db46	5262	Črniče
00050000-5624-f711-1ab3-47efefd813bd	8340	Črnomelj
00050000-5624-f711-f326-d9a78192de3f	6271	Dekani
00050000-5624-f711-7361-62beebb5ced3	5210	Deskle
00050000-5624-f711-996c-3fc38f347cb6	2253	Destrnik
00050000-5624-f711-8bdc-6921e776550c	6215	Divača
00050000-5624-f711-5d80-9622af99ee28	1233	Dob
00050000-5624-f711-2826-7325df272a99	3224	Dobje pri Planini
00050000-5624-f711-5bde-29d541abd472	8257	Dobova
00050000-5624-f711-2ac3-af85ae189b9c	1423	Dobovec
00050000-5624-f711-5335-5e41fc82d82d	5263	Dobravlje
00050000-5624-f711-1d51-488106864535	3204	Dobrna
00050000-5624-f711-06bc-ee8df27e7901	8211	Dobrnič
00050000-5624-f711-db0d-5b69225b787c	1356	Dobrova
00050000-5624-f711-d4d0-3c2a3b7d5bb0	9223	Dobrovnik/Dobronak 
00050000-5624-f711-f64d-d7a4d5c908d9	5212	Dobrovo v Brdih
00050000-5624-f711-3ea9-c30b6e65e2e7	1431	Dol pri Hrastniku
00050000-5624-f711-f8b9-dfe3d19c17c4	1262	Dol pri Ljubljani
00050000-5624-f711-f4fd-c771da722d4b	1273	Dole pri Litiji
00050000-5624-f711-381b-32e28e282266	1331	Dolenja vas
00050000-5624-f711-9b9f-6545534816eb	8350	Dolenjske Toplice
00050000-5624-f711-e961-0108b46bfb43	1230	Domžale
00050000-5624-f711-12ff-8f6c6192e6dd	2252	Dornava
00050000-5624-f711-4987-1cda4db11557	5294	Dornberk
00050000-5624-f711-f570-a43b442fcacc	1319	Draga
00050000-5624-f711-a4bb-dbd05c77546b	8343	Dragatuš
00050000-5624-f711-aab4-9018383fd251	3222	Dramlje
00050000-5624-f711-6b88-276ed1a94754	2370	Dravograd
00050000-5624-f711-887a-a72be99cbe78	4203	Duplje
00050000-5624-f711-20db-c85090ff8ce1	6221	Dutovlje
00050000-5624-f711-2ab1-fae44bc6728a	8361	Dvor
00050000-5624-f711-393f-ddc4a58b29b1	2343	Fala
00050000-5624-f711-9b80-8a56e9ba85c0	9208	Fokovci
00050000-5624-f711-64f8-8293fa6f29f1	2313	Fram
00050000-5624-f711-6348-93529a05d146	3213	Frankolovo
00050000-5624-f711-9ff4-17c095246c98	1274	Gabrovka
00050000-5624-f711-f2a0-f3ba3f19529a	8254	Globoko
00050000-5624-f711-0969-b6ca0508b5b5	5275	Godovič
00050000-5624-f711-bcac-d017b0a3d102	4204	Golnik
00050000-5624-f711-5663-93cea013b6d9	3303	Gomilsko
00050000-5624-f711-1599-33d91021896b	4224	Gorenja vas
00050000-5624-f711-e0a0-90ab22811c81	3263	Gorica pri Slivnici
00050000-5624-f711-e544-d35f4515bec5	2272	Gorišnica
00050000-5624-f711-9660-3881027258b6	9250	Gornja Radgona
00050000-5624-f711-d664-90528c87d2a7	3342	Gornji Grad
00050000-5624-f711-dc63-8fe5a74936df	4282	Gozd Martuljek
00050000-5624-f711-10c4-e02ed2848e12	6272	Gračišče
00050000-5624-f711-81db-ecd2f612ab72	9264	Grad
00050000-5624-f711-5628-8f28723fd5ff	8332	Gradac
00050000-5624-f711-0d1e-7e33bec0a964	1384	Grahovo
00050000-5624-f711-55ba-821a1672e131	5242	Grahovo ob Bači
00050000-5624-f711-c693-0a937c2e652d	5251	Grgar
00050000-5624-f711-cb12-99c702745f8c	3302	Griže
00050000-5624-f711-aaf7-3ef6443d1fe0	3231	Grobelno
00050000-5624-f711-91d9-146489587ea8	1290	Grosuplje
00050000-5624-f711-b1a3-b5d5b93013df	2288	Hajdina
00050000-5624-f711-baaf-238ef961b89c	8362	Hinje
00050000-5624-f711-2a54-52b79f307450	2311	Hoče
00050000-5624-f711-df7a-cd9ea70c3cc8	9205	Hodoš/Hodos
00050000-5624-f711-46d6-94fd1544c3be	1354	Horjul
00050000-5624-f711-02d3-254bb9eeae8a	1372	Hotedršica
00050000-5624-f711-7d93-6f38fcfc7e76	1430	Hrastnik
00050000-5624-f711-ad38-13c4d4bc5516	6225	Hruševje
00050000-5624-f711-ca3c-b2fbdc2d1570	4276	Hrušica
00050000-5624-f711-4da4-96876e27bce4	5280	Idrija
00050000-5624-f711-3ba5-10c2764a681c	1292	Ig
00050000-5624-f711-8941-0a67d396ce3a	6250	Ilirska Bistrica
00050000-5624-f711-055c-6a418837935a	6251	Ilirska Bistrica-Trnovo
00050000-5624-f711-c142-f9ab7a246fab	1295	Ivančna Gorica
00050000-5624-f711-59b7-410cef0eaa4f	2259	Ivanjkovci
00050000-5624-f711-a5ae-35bd56cce699	1411	Izlake
00050000-5624-f711-3756-6346d6aa2d57	6310	Izola/Isola
00050000-5624-f711-4be3-c643b154d8df	2222	Jakobski Dol
00050000-5624-f711-6115-81a6eea622dc	2221	Jarenina
00050000-5624-f711-8472-8abcb669b771	6254	Jelšane
00050000-5624-f711-d102-0a5ebf02d2f7	4270	Jesenice
00050000-5624-f711-c95b-32d499d3f43a	8261	Jesenice na Dolenjskem
00050000-5624-f711-6e1a-f13a460c64d1	3273	Jurklošter
00050000-5624-f711-a7e2-8a729728bf5d	2223	Jurovski Dol
00050000-5624-f711-d430-ba552712cfe6	2256	Juršinci
00050000-5624-f711-52be-1891903c0e29	5214	Kal nad Kanalom
00050000-5624-f711-6a92-fa5097cda380	3233	Kalobje
00050000-5624-f711-e8f3-87b7abd10990	4246	Kamna Gorica
00050000-5624-f711-2091-045094bfefd2	2351	Kamnica
00050000-5624-f711-22ab-49e18f3f4319	1241	Kamnik
00050000-5624-f711-23ed-2ec93a7be437	5213	Kanal
00050000-5624-f711-0fc9-5ad5a83402e4	8258	Kapele
00050000-5624-f711-2f6b-c854e7459fb5	2362	Kapla
00050000-5624-f711-9f7c-3b94b67fef64	2325	Kidričevo
00050000-5624-f711-66d8-04d2a571d151	1412	Kisovec
00050000-5624-f711-3f14-88e0d4984334	6253	Knežak
00050000-5624-f711-c2cd-a2575d1e4993	5222	Kobarid
00050000-5624-f711-6103-eab33a2da9c6	9227	Kobilje
00050000-5624-f711-b365-655c81bb5048	1330	Kočevje
00050000-5624-f711-e1c1-dc2ddc89842f	1338	Kočevska Reka
00050000-5624-f711-65e9-e88a4ed83e1d	2276	Kog
00050000-5624-f711-baf7-aa9f026df442	5211	Kojsko
00050000-5624-f711-7779-5fd010b247bc	6223	Komen
00050000-5624-f711-f0b1-d0548f3c65b1	1218	Komenda
00050000-5624-f711-15c0-f78ff98e20d7	6000	Koper/Capodistria 
00050000-5624-f711-e76f-26db620ae096	6001	Koper/Capodistria - poštni predali
00050000-5624-f711-bef6-c0a9600ea837	8282	Koprivnica
00050000-5624-f711-9fcf-4d71b695387f	5296	Kostanjevica na Krasu
00050000-5624-f711-2adf-b1703e14a85b	8311	Kostanjevica na Krki
00050000-5624-f711-af01-ce281eebff9a	1336	Kostel
00050000-5624-f711-8fda-efb09379e639	6256	Košana
00050000-5624-f711-5b4f-fd3e1236369c	2394	Kotlje
00050000-5624-f711-ab3e-fc6f7c32a599	6240	Kozina
00050000-5624-f711-1dc3-faf157fbe0e1	3260	Kozje
00050000-5624-f711-db54-c13094217821	4000	Kranj 
00050000-5624-f711-da47-aba9ece50afe	4001	Kranj - poštni predali
00050000-5624-f711-dde4-e7b2c423c001	4280	Kranjska Gora
00050000-5624-f711-8555-b364c01b21bd	1281	Kresnice
00050000-5624-f711-bd1f-d0b20466d4f4	4294	Križe
00050000-5624-f711-68a7-f640cc90d713	9206	Križevci
00050000-5624-f711-c807-312b4edbddb7	9242	Križevci pri Ljutomeru
00050000-5624-f711-194a-9f6049c22198	1301	Krka
00050000-5624-f711-cf2b-42d0501c78c8	8296	Krmelj
00050000-5624-f711-8e80-282b3762972f	4245	Kropa
00050000-5624-f711-3104-106161e4d76b	8262	Krška vas
00050000-5624-f711-ebed-31de010d9db9	8270	Krško
00050000-5624-f711-ee20-ce40c765354c	9263	Kuzma
00050000-5624-f711-0448-9b1d60acfa88	2318	Laporje
00050000-5624-f711-3ca7-3bd69c31f9d2	3270	Laško
00050000-5624-f711-2289-6a99112bca84	1219	Laze v Tuhinju
00050000-5624-f711-4abb-a5e8755b1366	2230	Lenart v Slovenskih goricah
00050000-5624-f711-037a-186e6c73bb89	9220	Lendava/Lendva
00050000-5624-f711-589d-59a5f79897d2	4248	Lesce
00050000-5624-f711-58d3-5487934e9cab	3261	Lesično
00050000-5624-f711-7d83-2eac027fd129	8273	Leskovec pri Krškem
00050000-5624-f711-0f6c-41415c107038	2372	Libeliče
00050000-5624-f711-8d81-dc627f686b92	2341	Limbuš
00050000-5624-f711-3b60-643a66b054be	1270	Litija
00050000-5624-f711-d299-d37753530c26	3202	Ljubečna
00050000-5624-f711-870b-4bebb663efbb	1000	Ljubljana 
00050000-5624-f711-1309-53ce6dbe9770	1001	Ljubljana - poštni predali
00050000-5624-f711-ffde-ef5dc0fdad43	1231	Ljubljana - Črnuče
00050000-5624-f711-59e7-fe719ffdf5ef	1261	Ljubljana - Dobrunje
00050000-5624-f711-0144-8aefd8a910f1	1260	Ljubljana - Polje
00050000-5624-f711-f13b-e75b218457c2	1210	Ljubljana - Šentvid
00050000-5624-f711-f148-fae7a468bb0c	1211	Ljubljana - Šmartno
00050000-5624-f711-8cf0-07798a13d7f7	3333	Ljubno ob Savinji
00050000-5624-f711-fa2a-c9e8d7dd7e8c	9240	Ljutomer
00050000-5624-f711-66e8-0dbcb9c3f32f	3215	Loče
00050000-5624-f711-74e7-46cdeedf3122	5231	Log pod Mangartom
00050000-5624-f711-eeaa-e0dbf2fdc017	1358	Log pri Brezovici
00050000-5624-f711-737a-8758ca0d1bf1	1370	Logatec
00050000-5624-f711-a73e-7ba67308cc19	1371	Logatec
00050000-5624-f711-df79-e2cede42b22b	1434	Loka pri Zidanem Mostu
00050000-5624-f711-30eb-0f72b23adea9	3223	Loka pri Žusmu
00050000-5624-f711-e1d8-04d6c6f2853f	6219	Lokev
00050000-5624-f711-ce8b-01d6a516aac5	1318	Loški Potok
00050000-5624-f711-b662-b17e364352d0	2324	Lovrenc na Dravskem polju
00050000-5624-f711-3deb-eea32d9bf939	2344	Lovrenc na Pohorju
00050000-5624-f711-f4a4-819c0bde5002	3334	Luče
00050000-5624-f711-3fe8-5154761675bb	1225	Lukovica
00050000-5624-f711-4fd0-fae1e0a27f0f	9202	Mačkovci
00050000-5624-f711-3be1-b1b95cc9bef6	2322	Majšperk
00050000-5624-f711-8f81-152475bbb0a6	2321	Makole
00050000-5624-f711-7d34-a4de739a7410	9243	Mala Nedelja
00050000-5624-f711-cedb-4a98994f24d3	2229	Malečnik
00050000-5624-f711-e1b3-3e1bc1ec8ce6	6273	Marezige
00050000-5624-f711-f476-2e1ae4a3a511	2000	Maribor 
00050000-5624-f711-2cfb-c1c1f89ba16f	2001	Maribor - poštni predali
00050000-5624-f711-3b42-d2f7634904b9	2206	Marjeta na Dravskem polju
00050000-5624-f711-c48f-a8b5667855f6	2281	Markovci
00050000-5624-f711-8620-b2c47c6245fc	9221	Martjanci
00050000-5624-f711-bf58-fdfd5103f9cd	6242	Materija
00050000-5624-f711-fa6a-16f106415fbf	4211	Mavčiče
00050000-5624-f711-5ca9-67d217369a74	1215	Medvode
00050000-5624-f711-1404-2e40598e7118	1234	Mengeš
00050000-5624-f711-3b2a-d6fcabd6eff6	8330	Metlika
00050000-5624-f711-a424-7c40fb781a8f	2392	Mežica
00050000-5624-f711-e204-88b82a2b20f9	2204	Miklavž na Dravskem polju
00050000-5624-f711-6792-dd9c579b80f2	2275	Miklavž pri Ormožu
00050000-5624-f711-76d6-c4ff7e0dafe1	5291	Miren
00050000-5624-f711-8176-939237bba718	8233	Mirna
00050000-5624-f711-79e3-430858c029f3	8216	Mirna Peč
00050000-5624-f711-446e-431f4635093c	2382	Mislinja
00050000-5624-f711-a63f-0b209acda95e	4281	Mojstrana
00050000-5624-f711-1986-84d3150d1539	8230	Mokronog
00050000-5624-f711-336f-996f8b2b9098	1251	Moravče
00050000-5624-f711-d13f-761b0d0bf462	9226	Moravske Toplice
00050000-5624-f711-628a-17489b03f632	5216	Most na Soči
00050000-5624-f711-7c3b-c9c893f00447	1221	Motnik
00050000-5624-f711-8de7-7c3b52f51fa9	3330	Mozirje
00050000-5624-f711-0c04-eea3297f88a7	9000	Murska Sobota 
00050000-5624-f711-691b-570d740f638d	9001	Murska Sobota - poštni predali
00050000-5624-f711-58d4-ebdad8250381	2366	Muta
00050000-5624-f711-271e-1aa909288b46	4202	Naklo
00050000-5624-f711-9488-296d16dcf39b	3331	Nazarje
00050000-5624-f711-659b-5b5361c0220e	1357	Notranje Gorice
00050000-5624-f711-2ebc-6dec0807cf0b	3203	Nova Cerkev
00050000-5624-f711-0bb0-8f20155c5211	5000	Nova Gorica 
00050000-5624-f711-713a-b01af8f6cf4c	5001	Nova Gorica - poštni predali
00050000-5624-f711-3967-0ed749da89be	1385	Nova vas
00050000-5624-f711-b602-2474984c69b5	8000	Novo mesto
00050000-5624-f711-8d76-f36d4d2a5571	8001	Novo mesto - poštni predali
00050000-5624-f711-f3f5-5f847e7724d6	6243	Obrov
00050000-5624-f711-1ff8-1135b85d1d3a	9233	Odranci
00050000-5624-f711-aca6-63994f8bf921	2317	Oplotnica
00050000-5624-f711-6eec-c8754ba4b4a2	2312	Orehova vas
00050000-5624-f711-83dc-bbd2a2989e17	2270	Ormož
00050000-5624-f711-cd8f-d19cb9cf2b94	1316	Ortnek
00050000-5624-f711-7a1a-60e1e52a5202	1337	Osilnica
00050000-5624-f711-76a5-154222e71952	8222	Otočec
00050000-5624-f711-0f8e-38470c8ff9fe	2361	Ožbalt
00050000-5624-f711-15d5-c9265e311018	2231	Pernica
00050000-5624-f711-aa18-1b07b604996d	2211	Pesnica pri Mariboru
00050000-5624-f711-a6a4-7ce753d1f1ab	9203	Petrovci
00050000-5624-f711-e015-bc99e1550268	3301	Petrovče
00050000-5624-f711-7595-37c8b72ef222	6330	Piran/Pirano
00050000-5624-f711-58bb-0ccd8ec8ced8	8255	Pišece
00050000-5624-f711-a8d1-fea8f18f4398	6257	Pivka
00050000-5624-f711-8ffc-3a629d643201	6232	Planina
00050000-5624-f711-b373-e613afe9dc00	3225	Planina pri Sevnici
00050000-5624-f711-a94a-9ac3cc7ba652	6276	Pobegi
00050000-5624-f711-c379-e45a894971d8	8312	Podbočje
00050000-5624-f711-88b0-1b1bae8ea6b5	5243	Podbrdo
00050000-5624-f711-b749-f7ff2a439b56	3254	Podčetrtek
00050000-5624-f711-0b5f-e424308d050e	2273	Podgorci
00050000-5624-f711-a141-e87d304be214	6216	Podgorje
00050000-5624-f711-0a93-e09a545d5696	2381	Podgorje pri Slovenj Gradcu
00050000-5624-f711-6c42-5f0000f655f3	6244	Podgrad
00050000-5624-f711-3556-7067863df567	1414	Podkum
00050000-5624-f711-3686-d4a397b4a093	2286	Podlehnik
00050000-5624-f711-7932-9775b9dbeda2	5272	Podnanos
00050000-5624-f711-e9eb-b848c5b7528f	4244	Podnart
00050000-5624-f711-0729-9a8eb4086704	3241	Podplat
00050000-5624-f711-5042-bf2ca31a76ca	3257	Podsreda
00050000-5624-f711-ead7-5d47dcc228c3	2363	Podvelka
00050000-5624-f711-069b-78cb3ca01e2b	2208	Pohorje
00050000-5624-f711-804e-214767c09881	2257	Polenšak
00050000-5624-f711-0665-7966cf1bbed4	1355	Polhov Gradec
00050000-5624-f711-d173-206d39256574	4223	Poljane nad Škofjo Loko
00050000-5624-f711-db24-3e0999f36704	2319	Poljčane
00050000-5624-f711-dc60-3a7341ebbe30	1272	Polšnik
00050000-5624-f711-647a-761d325032b3	3313	Polzela
00050000-5624-f711-561c-7219ae057587	3232	Ponikva
00050000-5624-f711-3856-04465453a400	6320	Portorož/Portorose
00050000-5624-f711-5001-0f7023f4b4fe	6230	Postojna
00050000-5624-f711-9092-e9a33e71a8a6	2331	Pragersko
00050000-5624-f711-cafc-1ca0f48b3e99	3312	Prebold
00050000-5624-f711-a6c7-27a996cbe2dc	4205	Preddvor
00050000-5624-f711-ecc6-7e9d953d9b39	6255	Prem
00050000-5624-f711-7e01-b99720c3735c	1352	Preserje
00050000-5624-f711-aad1-5f3035946fe7	6258	Prestranek
00050000-5624-f711-488b-57bcd2938c85	2391	Prevalje
00050000-5624-f711-1b8e-7e2371ed815d	3262	Prevorje
00050000-5624-f711-6e5e-921db3a4bcbb	1276	Primskovo 
00050000-5624-f711-6e70-bcd31bc2b1b3	3253	Pristava pri Mestinju
00050000-5624-f711-7477-0c77ab92fd53	9207	Prosenjakovci/Partosfalva
00050000-5624-f711-66b9-29160338058b	5297	Prvačina
00050000-5624-f711-4048-938139dc8922	2250	Ptuj
00050000-5624-f711-b852-6826866d7275	2323	Ptujska Gora
00050000-5624-f711-58bc-2416a0f61205	9201	Puconci
00050000-5624-f711-f4d0-ed67cfdeb896	2327	Rače
00050000-5624-f711-8168-0251432e7186	1433	Radeče
00050000-5624-f711-1ea1-f0ad23eb9e63	9252	Radenci
00050000-5624-f711-cea6-8987e4ad91a5	2360	Radlje ob Dravi
00050000-5624-f711-a732-2dd3966d3319	1235	Radomlje
00050000-5624-f711-aab1-909daffbab8c	4240	Radovljica
00050000-5624-f711-4ae2-4f0fe07cf21a	8274	Raka
00050000-5624-f711-c850-90fc1870d6ad	1381	Rakek
00050000-5624-f711-1c56-976fa7dacebd	4283	Rateče - Planica
00050000-5624-f711-e08e-10264a5994cf	2390	Ravne na Koroškem
00050000-5624-f711-daf3-00ad1210f43c	9246	Razkrižje
00050000-5624-f711-7af3-d950847c6f84	3332	Rečica ob Savinji
00050000-5624-f711-8dfc-c7656574c793	5292	Renče
00050000-5624-f711-905d-99660f27b402	1310	Ribnica
00050000-5624-f711-ff40-0383f89bef2c	2364	Ribnica na Pohorju
00050000-5624-f711-71a9-902ef110d66e	3272	Rimske Toplice
00050000-5624-f711-50cd-179355d37a7b	1314	Rob
00050000-5624-f711-6f2f-af6738df0d3a	5215	Ročinj
00050000-5624-f711-1513-b389174511fe	3250	Rogaška Slatina
00050000-5624-f711-2b28-0c14c4069981	9262	Rogašovci
00050000-5624-f711-d1fc-c698e5ade066	3252	Rogatec
00050000-5624-f711-b199-78020f4d3c92	1373	Rovte
00050000-5624-f711-a185-768c2ea01837	2342	Ruše
00050000-5624-f711-7b8e-cbc3c13412ab	1282	Sava
00050000-5624-f711-9eab-ab6281861a27	6333	Sečovlje/Sicciole
00050000-5624-f711-37fe-7640e76a03e1	4227	Selca
00050000-5624-f711-8944-9735995ab7b3	2352	Selnica ob Dravi
00050000-5624-f711-cdaa-eb959dfadf7c	8333	Semič
00050000-5624-f711-ca90-4df5cfd2d4be	8281	Senovo
00050000-5624-f711-7a6a-84715ded701c	6224	Senožeče
00050000-5624-f711-2697-e636490bd4d4	8290	Sevnica
00050000-5624-f711-5e2a-7b5b06b24bc8	6210	Sežana
00050000-5624-f711-940f-b71e3333ca3e	2214	Sladki Vrh
00050000-5624-f711-5b27-a0e8a4ceb931	5283	Slap ob Idrijci
00050000-5624-f711-9ffe-8e01cd957b11	2380	Slovenj Gradec
00050000-5624-f711-fe95-eaf8df1aee94	2310	Slovenska Bistrica
00050000-5624-f711-7d65-29e702315a0c	3210	Slovenske Konjice
00050000-5624-f711-1650-93f656a7e4ec	1216	Smlednik
00050000-5624-f711-c9d0-bc02a045deac	5232	Soča
00050000-5624-f711-dd09-0017496beafe	1317	Sodražica
00050000-5624-f711-1e21-2a719c9c2ca0	3335	Solčava
00050000-5624-f711-0579-c482d00415dd	5250	Solkan
00050000-5624-f711-df4b-b5361f064fb1	4229	Sorica
00050000-5624-f711-0742-0671c14d7b49	4225	Sovodenj
00050000-5624-f711-f591-33478bf4b3b2	5281	Spodnja Idrija
00050000-5624-f711-bbf4-be5b2e4ef1e8	2241	Spodnji Duplek
00050000-5624-f711-f47d-da24216fbe7e	9245	Spodnji Ivanjci
00050000-5624-f711-19b5-393f9ef35a08	2277	Središče ob Dravi
00050000-5624-f711-daaf-561f2d7decdd	4267	Srednja vas v Bohinju
00050000-5624-f711-5d0d-969baccf2dad	8256	Sromlje 
00050000-5624-f711-9d20-68f9edeb2f9d	5224	Srpenica
00050000-5624-f711-4224-2404d9fc5076	1242	Stahovica
00050000-5624-f711-d777-5bf52c36147a	1332	Stara Cerkev
00050000-5624-f711-bc71-1b78808fcc43	8342	Stari trg ob Kolpi
00050000-5624-f711-f4db-02311b714214	1386	Stari trg pri Ložu
00050000-5624-f711-92d1-4605e195e581	2205	Starše
00050000-5624-f711-7b11-f7f76d732fc0	2289	Stoperce
00050000-5624-f711-505d-150122401be5	8322	Stopiče
00050000-5624-f711-59ce-823854c0d615	3206	Stranice
00050000-5624-f711-4702-76cdbfc51674	8351	Straža
00050000-5624-f711-8868-fc2eb8e537a3	1313	Struge
00050000-5624-f711-6006-da5da8d2a0e1	8293	Studenec
00050000-5624-f711-9519-f235fb8100d6	8331	Suhor
00050000-5624-f711-9e7d-7f0e7a8d8346	2233	Sv. Ana v Slovenskih goricah
00050000-5624-f711-bc88-e449b3c0d95d	2235	Sv. Trojica v Slovenskih goricah
00050000-5624-f711-e19e-9fac5a549c87	2353	Sveti Duh na Ostrem Vrhu
00050000-5624-f711-2ae7-66b56f950a86	9244	Sveti Jurij ob Ščavnici
00050000-5624-f711-967e-39b9d4d9ae2e	3264	Sveti Štefan
00050000-5624-f711-d061-66bc44d91ff5	2258	Sveti Tomaž
00050000-5624-f711-2a6b-7d6a314171c4	9204	Šalovci
00050000-5624-f711-8a16-fc1a859a4d68	5261	Šempas
00050000-5624-f711-fe75-89665f8aa67e	5290	Šempeter pri Gorici
00050000-5624-f711-f68c-9fc63d1e14d1	3311	Šempeter v Savinjski dolini
00050000-5624-f711-463e-413c3746a737	4208	Šenčur
00050000-5624-f711-acdf-3ed04eda6d3d	2212	Šentilj v Slovenskih goricah
00050000-5624-f711-8823-15edc229d982	8297	Šentjanž
00050000-5624-f711-b8c7-20118ac6517d	2373	Šentjanž pri Dravogradu
00050000-5624-f711-69b5-435d5c15dffc	8310	Šentjernej
00050000-5624-f711-18c2-c3dec42792e8	3230	Šentjur
00050000-5624-f711-cc9a-4e81d5383404	3271	Šentrupert
00050000-5624-f711-9ccb-62f5b6e79cc7	8232	Šentrupert
00050000-5624-f711-ce6a-5ca0832a7401	1296	Šentvid pri Stični
00050000-5624-f711-210c-7a381175cb44	8275	Škocjan
00050000-5624-f711-5035-b1dbc74be0a9	6281	Škofije
00050000-5624-f711-a237-11210d7cea6a	4220	Škofja Loka
00050000-5624-f711-3b49-a00bbb8614a4	3211	Škofja vas
00050000-5624-f711-81e7-1fa8ed64f0d3	1291	Škofljica
00050000-5624-f711-a683-f5d0db1ace4d	6274	Šmarje
00050000-5624-f711-3b9c-fe49c8f42b44	1293	Šmarje - Sap
00050000-5624-f711-8fd4-c36eb6f938d7	3240	Šmarje pri Jelšah
00050000-5624-f711-42c8-c6f5bdb17822	8220	Šmarješke Toplice
00050000-5624-f711-9ef9-2a08981fc192	2315	Šmartno na Pohorju
00050000-5624-f711-4344-533fed2019dd	3341	Šmartno ob Dreti
00050000-5624-f711-d876-9dab65c31429	3327	Šmartno ob Paki
00050000-5624-f711-9a0f-7a95abe16551	1275	Šmartno pri Litiji
00050000-5624-f711-c1eb-e66aefad470b	2383	Šmartno pri Slovenj Gradcu
00050000-5624-f711-b436-6162bd036326	3201	Šmartno v Rožni dolini
00050000-5624-f711-0d95-16a401b20d10	3325	Šoštanj
00050000-5624-f711-e77c-edda6c860fbd	6222	Štanjel
00050000-5624-f711-f2ed-fce8b562b80f	3220	Štore
00050000-5624-f711-d181-091bfa5f4087	3304	Tabor
00050000-5624-f711-e216-0bfed8e4f450	3221	Teharje
00050000-5624-f711-3071-f7ccb0b4bfc0	9251	Tišina
00050000-5624-f711-0da4-8024e8fc28f6	5220	Tolmin
00050000-5624-f711-ca5a-df6fe61b0662	3326	Topolšica
00050000-5624-f711-f3ac-a7c9613072bd	2371	Trbonje
00050000-5624-f711-8fb5-6e9e4267d4d3	1420	Trbovlje
00050000-5624-f711-6411-4370c6ce4bbd	8231	Trebelno 
00050000-5624-f711-91b5-5fa0d38b2fc0	8210	Trebnje
00050000-5624-f711-5208-def047778f10	5252	Trnovo pri Gorici
00050000-5624-f711-08e3-ee8c613708ae	2254	Trnovska vas
00050000-5624-f711-503d-dbc8e1ddee94	1222	Trojane
00050000-5624-f711-bccb-b7260aaf9638	1236	Trzin
00050000-5624-f711-6926-d53c0e40ac43	4290	Tržič
00050000-5624-f711-037f-6415a045233e	8295	Tržišče
00050000-5624-f711-146c-9b9cb9040943	1311	Turjak
00050000-5624-f711-8c6a-48b50d3aebb2	9224	Turnišče
00050000-5624-f711-57d5-90bf2d3e0148	8323	Uršna sela
00050000-5624-f711-65a0-8ec2a1cc5d5b	1252	Vače
00050000-5624-f711-aefd-da479ec01d09	3320	Velenje 
00050000-5624-f711-7834-97a38b26f9e7	3322	Velenje - poštni predali
00050000-5624-f711-5352-0f20d44b00e1	8212	Velika Loka
00050000-5624-f711-1393-004cd74c2fa4	2274	Velika Nedelja
00050000-5624-f711-c0c8-35048a74e59b	9225	Velika Polana
00050000-5624-f711-8307-e6e18dd36b56	1315	Velike Lašče
00050000-5624-f711-4e90-6c78753e492d	8213	Veliki Gaber
00050000-5624-f711-cf20-5245a8b5d3ca	9241	Veržej
00050000-5624-f711-f211-ae02ba425dda	1312	Videm - Dobrepolje
00050000-5624-f711-d27f-8b03e37bf4ea	2284	Videm pri Ptuju
00050000-5624-f711-a18d-68a7324ba5db	8344	Vinica
00050000-5624-f711-c04f-c3726b84bda3	5271	Vipava
00050000-5624-f711-db27-bbb6fbadb5f1	4212	Visoko
00050000-5624-f711-e70a-c381ae525a28	1294	Višnja Gora
00050000-5624-f711-b3ed-d0c8c747f8c1	3205	Vitanje
00050000-5624-f711-608a-b31244157a74	2255	Vitomarci
00050000-5624-f711-052a-989f0ad4f894	1217	Vodice
00050000-5624-f711-1809-b3617c331383	3212	Vojnik\t
00050000-5624-f711-09c9-64b319998eed	5293	Volčja Draga
00050000-5624-f711-d774-d9aeff58aa9b	2232	Voličina
00050000-5624-f711-b8b0-5c496e5c1718	3305	Vransko
00050000-5624-f711-6b7a-11f74b34d193	6217	Vremski Britof
00050000-5624-f711-d034-7b4e9ab81ab8	1360	Vrhnika
00050000-5624-f711-9807-86371162f55d	2365	Vuhred
00050000-5624-f711-0fbb-9ac3a3932e30	2367	Vuzenica
00050000-5624-f711-3d35-63899dfbb2a7	8292	Zabukovje 
00050000-5624-f711-09f9-c9ae71d1e11a	1410	Zagorje ob Savi
00050000-5624-f711-2137-1a76af61f57b	1303	Zagradec
00050000-5624-f711-d2ae-e3631a8b29ff	2283	Zavrč
00050000-5624-f711-647d-613fd217961a	8272	Zdole 
00050000-5624-f711-ae57-d8d603ec25d7	4201	Zgornja Besnica
00050000-5624-f711-7177-5e6fea7ed5a7	2242	Zgornja Korena
00050000-5624-f711-9c5a-d3f10cc49629	2201	Zgornja Kungota
00050000-5624-f711-3ad6-d4879fb13c65	2316	Zgornja Ložnica
00050000-5624-f711-fa8c-c26707823b91	2314	Zgornja Polskava
00050000-5624-f711-e3e0-00c3c8868ae5	2213	Zgornja Velka
00050000-5624-f711-e591-4d5b76cc96c8	4247	Zgornje Gorje
00050000-5624-f711-0e37-7a2c1e6cc5b1	4206	Zgornje Jezersko
00050000-5624-f711-9470-1682494ecd9c	2285	Zgornji Leskovec
00050000-5624-f711-3e83-14cbabac5b24	1432	Zidani Most
00050000-5624-f711-c8b1-5c6ec78bcf23	3214	Zreče
00050000-5624-f711-1cfe-16d5158fcae0	4209	Žabnica
00050000-5624-f711-3cf3-9cf3cd23bc70	3310	Žalec
00050000-5624-f711-314a-cfcf33638568	4228	Železniki
00050000-5624-f711-252c-9c556076a6d6	2287	Žetale
00050000-5624-f711-6295-b393c72d881c	4226	Žiri
00050000-5624-f711-26e3-297e7b060593	4274	Žirovnica
00050000-5624-f711-9c04-9ba7776ad0bd	8360	Žužemberk
\.


--
-- TOC entry 3111 (class 0 OID 22620211)
-- Dependencies: 236
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3084 (class 0 OID 22619803)
-- Dependencies: 209
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3063 (class 0 OID 22619565)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5624-f713-6d0e-83ce4335ba60	00080000-5624-f713-e9c5-d3ce23dffd8a	\N	00040000-5624-f711-5b79-74e126d3c924	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5624-f713-d5bb-b584163b3f8f	00080000-5624-f713-e9c5-d3ce23dffd8a	\N	00040000-5624-f711-5b79-74e126d3c924	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5624-f713-1663-196cf9aaf160	00080000-5624-f713-a64b-895fbbd3b944	\N	00040000-5624-f711-5b79-74e126d3c924	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3071 (class 0 OID 22619669)
-- Dependencies: 196
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3072 (class 0 OID 22619681)
-- Dependencies: 197
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3086 (class 0 OID 22619815)
-- Dependencies: 211
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 22620225)
-- Dependencies: 237
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 22620235)
-- Dependencies: 238
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5624-f713-6600-0490347ba78f	00080000-5624-f713-9a3a-ac0a4db9b04d	0987	AK
00190000-5624-f713-d985-ad484e5d50c1	00080000-5624-f713-a64b-895fbbd3b944	0989	AK
00190000-5624-f713-3001-b93d504b2546	00080000-5624-f713-068c-7e473d3961ed	0986	AK
00190000-5624-f713-8eb6-e900247bcf9b	00080000-5624-f713-c3a9-28eeb973b2fa	0984	AK
00190000-5624-f713-8a19-33bfb3f8900b	00080000-5624-f713-3a3c-b37d19378aaa	0983	AK
00190000-5624-f713-d236-32347c2fad85	00080000-5624-f713-adcb-fc25e8f8ed59	0982	AK
00190000-5624-f714-bbd6-ed462b794238	00080000-5624-f714-6b62-38e10bbe716f	1001	AK
\.


--
-- TOC entry 3110 (class 0 OID 22620150)
-- Dependencies: 235
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5624-f713-35de-6e23c1a69b41	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3114 (class 0 OID 22620243)
-- Dependencies: 239
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3090 (class 0 OID 22619844)
-- Dependencies: 215
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5624-f713-dd97-09a6aa436a9d	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5624-f713-4241-ee54557ee136	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5624-f713-5df6-7beca9d08c3c	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5624-f713-8e62-913585f4145e	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5624-f713-b63a-11fc4320343f	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5624-f713-6975-1e5f5f5e16ff	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5624-f713-c50c-c05e4ebf1acf	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3082 (class 0 OID 22619788)
-- Dependencies: 207
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3081 (class 0 OID 22619778)
-- Dependencies: 206
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 22619989)
-- Dependencies: 228
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 22619919)
-- Dependencies: 222
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3069 (class 0 OID 22619643)
-- Dependencies: 194
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 22619416)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5624-f714-6b62-38e10bbe716f	00010000-5624-f711-e999-5098eabcc412	2015-10-19 15:58:44	INS	a:0:{}
2	App\\Entity\\Option	00000000-5624-f714-4880-27064547806f	00010000-5624-f711-e999-5098eabcc412	2015-10-19 15:58:44	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5624-f714-bbd6-ed462b794238	00010000-5624-f711-e999-5098eabcc412	2015-10-19 15:58:44	INS	a:0:{}
\.


--
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3091 (class 0 OID 22619857)
-- Dependencies: 216
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 22619454)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5624-f711-5e95-486a946ce4e7	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5624-f711-3604-b25f9bab421c	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5624-f711-f4ec-739a294c1e0a	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5624-f711-b585-7c4c8973daee	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5624-f711-d41c-b001a9428877	planer	Planer dogodkov v koledarju	t
00020000-5624-f711-caf1-eddcb02e94cf	kadrovska	Kadrovska služba	t
00020000-5624-f711-617d-13ce53f1a980	arhivar	Ažuriranje arhivalij	t
00020000-5624-f711-ea86-2e77a0a37cf5	igralec	Igralec	t
00020000-5624-f711-a78b-3dee086b93b3	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5624-f713-493c-1d414853dfda	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3052 (class 0 OID 22619438)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5624-f711-e8d0-f058c796d35f	00020000-5624-f711-f4ec-739a294c1e0a
00010000-5624-f711-e999-5098eabcc412	00020000-5624-f711-f4ec-739a294c1e0a
00010000-5624-f713-6bf5-0d1e9a06649e	00020000-5624-f713-493c-1d414853dfda
\.


--
-- TOC entry 3093 (class 0 OID 22619871)
-- Dependencies: 218
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3085 (class 0 OID 22619809)
-- Dependencies: 210
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3079 (class 0 OID 22619755)
-- Dependencies: 204
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5624-f713-afb1-5c053208724a	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5624-f713-5a58-c956f3c6fc1e	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5624-f713-7c84-9bea9fa3af20	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3048 (class 0 OID 22619403)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5624-f711-391d-0f39df8710ff	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5624-f711-8234-9791aec8e358	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5624-f711-0d66-05a98784e63c	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5624-f711-b3bf-fd43a9f21556	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5624-f711-b1a0-fa89ddc1c419	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3047 (class 0 OID 22619395)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5624-f711-0bf7-c7d791e4ce30	00230000-5624-f711-b3bf-fd43a9f21556	popa
00240000-5624-f711-5f0b-6fdd2cc6ebbd	00230000-5624-f711-b3bf-fd43a9f21556	oseba
00240000-5624-f711-d007-117767d356b8	00230000-5624-f711-b3bf-fd43a9f21556	tippopa
00240000-5624-f711-dadb-e0d16032f50f	00230000-5624-f711-b3bf-fd43a9f21556	organizacijskaenota
00240000-5624-f711-700c-a6291f902b95	00230000-5624-f711-b3bf-fd43a9f21556	sezona
00240000-5624-f711-23b7-bb0844e3923c	00230000-5624-f711-b3bf-fd43a9f21556	tipvaje
00240000-5624-f711-52a0-5242dccae50a	00230000-5624-f711-8234-9791aec8e358	prostor
00240000-5624-f711-fd8a-446ec1064b49	00230000-5624-f711-b3bf-fd43a9f21556	besedilo
00240000-5624-f711-1f32-e1040be4aef5	00230000-5624-f711-b3bf-fd43a9f21556	uprizoritev
00240000-5624-f711-4624-dc410aad2936	00230000-5624-f711-b3bf-fd43a9f21556	funkcija
00240000-5624-f711-3c1e-8c9b8678c992	00230000-5624-f711-b3bf-fd43a9f21556	tipfunkcije
00240000-5624-f711-475f-673420774f13	00230000-5624-f711-b3bf-fd43a9f21556	alternacija
00240000-5624-f711-4fce-7a35c6519ff2	00230000-5624-f711-391d-0f39df8710ff	pogodba
00240000-5624-f711-c31a-633f1d8118c3	00230000-5624-f711-b3bf-fd43a9f21556	zaposlitev
00240000-5624-f711-2bc1-f39bda9e53d1	00230000-5624-f711-b3bf-fd43a9f21556	zvrstuprizoritve
00240000-5624-f711-9ea4-113e02551329	00230000-5624-f711-391d-0f39df8710ff	programdela
00240000-5624-f711-e712-ce3a5fa64cae	00230000-5624-f711-b3bf-fd43a9f21556	zapis
\.


--
-- TOC entry 3046 (class 0 OID 22619390)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
3ef22e7c-29b9-4cfb-a730-12cdf1a5f338	00240000-5624-f711-0bf7-c7d791e4ce30	0	1001
\.


--
-- TOC entry 3099 (class 0 OID 22619936)
-- Dependencies: 224
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5624-f713-4eea-d3f83dde66f1	000e0000-5624-f713-4a56-71e5b22219e7	00080000-5624-f713-e9c5-d3ce23dffd8a	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5624-f711-1838-f5cac500c1dd
00270000-5624-f713-f0e1-a30aa6c75841	000e0000-5624-f713-4a56-71e5b22219e7	00080000-5624-f713-e9c5-d3ce23dffd8a	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5624-f711-1838-f5cac500c1dd
\.


--
-- TOC entry 3060 (class 0 OID 22619526)
-- Dependencies: 185
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3080 (class 0 OID 22619765)
-- Dependencies: 205
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5624-f713-918d-b1065f27180e	00180000-5624-f713-0c53-30c15053fd3c	000c0000-5624-f713-04ee-a0264e97081b	00090000-5624-f713-d3ce-271dd2a221a9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5624-f713-2ba4-db2d140dff88	00180000-5624-f713-0c53-30c15053fd3c	000c0000-5624-f713-c4da-639bde4c8409	00090000-5624-f713-0601-e0019d7dc554	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5624-f713-5700-28404b4f0308	00180000-5624-f713-0c53-30c15053fd3c	000c0000-5624-f713-83b5-e45f023d5090	00090000-5624-f713-77c2-593d0c7d00da	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5624-f713-ac38-4cbb328dc250	00180000-5624-f713-0c53-30c15053fd3c	000c0000-5624-f713-e260-921c3ef3f4d4	00090000-5624-f713-94a7-f9ad8b002523	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5624-f713-8133-272d9050c897	00180000-5624-f713-0c53-30c15053fd3c	000c0000-5624-f713-337b-857919fbf4da	00090000-5624-f713-eb09-ddc5b1e715c8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	\N	\N
001a0000-5624-f713-1c24-d863ff45a14d	00180000-5624-f713-448e-25acbaa828dc	\N	00090000-5624-f713-eb09-ddc5b1e715c8	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	\N	\N
\.


--
-- TOC entry 3102 (class 0 OID 22619977)
-- Dependencies: 227
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5624-f711-cf3e-1d987597055b	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5624-f711-f755-e30476d6a351	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5624-f711-2a44-bb9f898f4911	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5624-f711-70ef-2779551b51dc	04	Režija	Režija	Režija	umetnik	30
000f0000-5624-f711-8d76-876ebaf4e884	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5624-f711-1312-738b92aa7084	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5624-f711-e4a4-3ae8a9733f7a	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5624-f711-f6b3-cf005d07da8c	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5624-f711-2549-e9cffbbcd8db	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5624-f711-3be9-287fa6f199c6	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5624-f711-c1c5-37a22d6a23ff	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5624-f711-1644-1b7f1852bcd0	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5624-f711-f24d-fa543a9b3872	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5624-f711-77e6-a6d40353c11e	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5624-f711-8265-442ae79d0cbb	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5624-f711-011c-43be303b4e84	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5624-f711-a206-7941e2d1c868	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5624-f711-f5c7-57e31a55d527	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3057 (class 0 OID 22619480)
-- Dependencies: 182
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5624-f713-866f-407c355e287d	0001	šola	osnovna ali srednja šola
00400000-5624-f713-c5a0-5c7dc7f99604	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5624-f713-f3a7-e440e74adfd6	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3115 (class 0 OID 22620254)
-- Dependencies: 240
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5624-f711-7cf4-8d49796d5b57	01	Velika predstava	f	1.00	1.00
002b0000-5624-f711-c60b-ead528bf4c19	02	Mala predstava	f	0.50	0.50
002b0000-5624-f711-ab0b-49585de1c644	03	Mala koprodukcija	t	0.40	1.00
002b0000-5624-f711-efdc-8673fe6d8ea8	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5624-f711-5e7b-6cc351f888c5	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3078 (class 0 OID 22619745)
-- Dependencies: 203
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5624-f711-3cb7-cfb3cb1937eb	0001	prva vaja	prva vaja
00420000-5624-f711-755a-dc37c1167565	0002	tehnična vaja	tehnična vaja
00420000-5624-f711-f181-8ab7055e6689	0003	lučna vaja	lučna vaja
00420000-5624-f711-c6bf-32cafa5ab9b3	0004	kostumska vaja	kostumska vaja
00420000-5624-f711-1611-f07e55b199ed	0005	foto vaja	foto vaja
00420000-5624-f711-b889-0154ea41adb1	0006	1. glavna vaja	1. glavna vaja
00420000-5624-f711-859c-1f452f9ef8dd	0007	2. glavna vaja	2. glavna vaja
00420000-5624-f711-4a78-9e5ea389a14b	0008	1. generalka	1. generalka
00420000-5624-f711-edd0-775c3132851c	0009	2. generalka	2. generalka
00420000-5624-f711-9bff-11b632497672	0010	odprta generalka	odprta generalka
00420000-5624-f711-3187-cc45cf084ac8	0011	obnovitvena vaja	obnovitvena vaja
00420000-5624-f711-9a85-740cb147c50e	0012	pevska vaja	pevska vaja
00420000-5624-f711-5ecc-4c212ecede74	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5624-f711-ccce-bb485162afcb	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3066 (class 0 OID 22619600)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3051 (class 0 OID 22619425)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5624-f711-e999-5098eabcc412	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROlxvgPfFqR9K7gbUme9Rg6gFy/uQGn0O	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5624-f713-9c2e-d68fa431cbd5	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5624-f713-5c26-e0ffcf641eda	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5624-f713-f8d9-e591ace99ce1	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5624-f713-2807-d7e49aa7c3cd	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5624-f713-7bf0-28dc29a310bb	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5624-f713-5621-f4ff4c596777	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5624-f713-7db5-b55e46e53f40	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5624-f713-8a39-d3ada43c3bad	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5624-f713-142a-9f9dbf9e9f52	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5624-f713-6bf5-0d1e9a06649e	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5624-f711-e8d0-f058c796d35f	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3106 (class 0 OID 22620027)
-- Dependencies: 231
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5624-f713-dcfb-ff6dea4c06c7	00160000-5624-f713-1c45-af12b3d4ba7b	\N	00140000-5624-f711-1a8f-b1ede24df617	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5624-f713-b63a-11fc4320343f
000e0000-5624-f713-4a56-71e5b22219e7	00160000-5624-f713-a780-abfa15711361	\N	00140000-5624-f711-3f2a-79cbeb5f9c4e	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5624-f713-6975-1e5f5f5e16ff
000e0000-5624-f713-8264-4b6aac427151	\N	\N	00140000-5624-f711-3f2a-79cbeb5f9c4e	00190000-5624-f713-6600-0490347ba78f	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5624-f713-b63a-11fc4320343f
000e0000-5624-f713-4071-bc8288c396f4	\N	\N	00140000-5624-f711-3f2a-79cbeb5f9c4e	00190000-5624-f713-6600-0490347ba78f	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5624-f713-b63a-11fc4320343f
000e0000-5624-f713-54c5-27edc8e1a894	\N	\N	00140000-5624-f711-3f2a-79cbeb5f9c4e	00190000-5624-f713-6600-0490347ba78f	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5624-f713-dd97-09a6aa436a9d
000e0000-5624-f713-cbbb-2569a734eb09	\N	\N	00140000-5624-f711-3f2a-79cbeb5f9c4e	00190000-5624-f713-6600-0490347ba78f	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5624-f713-dd97-09a6aa436a9d
\.


--
-- TOC entry 3074 (class 0 OID 22619699)
-- Dependencies: 199
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5624-f713-3a32-8201b4c1da46	\N	000e0000-5624-f713-4a56-71e5b22219e7	1	
00200000-5624-f713-0203-2e74a9e7c6c4	\N	000e0000-5624-f713-4a56-71e5b22219e7	2	
00200000-5624-f713-a7b7-d0aca2925b2e	\N	000e0000-5624-f713-4a56-71e5b22219e7	3	
00200000-5624-f713-b511-0530fe0e79c2	\N	000e0000-5624-f713-4a56-71e5b22219e7	4	
00200000-5624-f713-52b3-d98146add7ee	\N	000e0000-5624-f713-4a56-71e5b22219e7	5	
\.


--
-- TOC entry 3089 (class 0 OID 22619836)
-- Dependencies: 214
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 22619950)
-- Dependencies: 225
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5624-f711-fd5b-d4cc05d07b42	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5624-f711-1569-cf38c0cd1920	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5624-f711-c713-b901dd54ee45	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5624-f711-843c-10c1572df0a7	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5624-f711-93f6-605c649fa981	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5624-f711-94fa-21515ab9f8cd	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5624-f711-0325-cbc9743342ec	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5624-f711-1577-c48ddf47b7ae	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5624-f711-1838-f5cac500c1dd	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5624-f711-eccf-f0effca46e23	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5624-f711-3a1c-54287aa05e91	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5624-f711-8729-41d4f4b75355	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5624-f711-f8b1-25a249abe644	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5624-f711-0d77-db9f7cf1033c	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5624-f711-3552-e0cf51e17c31	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5624-f711-783f-e5166dec692a	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5624-f711-8f61-400b272f0b13	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5624-f711-6acc-6910fccdab10	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5624-f711-ef54-af37b8e0dcf4	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5624-f711-cf75-52925a8ab41e	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5624-f711-c388-fd8269590da6	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5624-f711-5557-57f5bed18bb6	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5624-f711-8d07-c7120c9a7846	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5624-f711-0c9e-63f2111b5e8d	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5624-f711-84cf-e61f6252fc5c	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5624-f711-7c90-525768652b10	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5624-f711-35aa-459507beb6df	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5624-f711-82c0-0adb94d53116	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3118 (class 0 OID 22620301)
-- Dependencies: 243
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 22620273)
-- Dependencies: 242
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 22620313)
-- Dependencies: 244
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3096 (class 0 OID 22619908)
-- Dependencies: 221
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5624-f713-6336-c81e4b855399	00090000-5624-f713-0601-e0019d7dc554	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5624-f713-16a2-e807a1480391	00090000-5624-f713-77c2-593d0c7d00da	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5624-f713-142b-6451ebe930fe	00090000-5624-f713-3537-ddb708fd065e	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5624-f713-0962-cee539df6f34	00090000-5624-f713-3807-9e66e0ce9762	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5624-f713-e009-7ab814045394	00090000-5624-f713-d3ce-271dd2a221a9	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5624-f713-9bbe-eaa0bd1a017d	00090000-5624-f713-2419-415c70cc28f8	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3076 (class 0 OID 22619734)
-- Dependencies: 201
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 22620017)
-- Dependencies: 230
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5624-f711-1a8f-b1ede24df617	01	Drama	drama (SURS 01)
00140000-5624-f711-e14e-1e32bf3f1b9c	02	Opera	opera (SURS 02)
00140000-5624-f711-7c86-621a27d65764	03	Balet	balet (SURS 03)
00140000-5624-f711-5972-e78ecdbe6870	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5624-f711-3c1c-d10d5d7362be	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5624-f711-3f2a-79cbeb5f9c4e	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5624-f711-927f-c0dd98c8945f	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3095 (class 0 OID 22619898)
-- Dependencies: 220
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2547 (class 2606 OID 22619479)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 22620076)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 22620066)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 22619933)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 22619975)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2818 (class 2606 OID 22620353)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 22619723)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 22619744)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 22620271)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 22619626)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 22620144)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 22619894)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 22619697)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 22619664)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 22619640)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 22619801)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2812 (class 2606 OID 22620330)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 22620337)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2823 (class 2606 OID 22620361)
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
-- TOC entry 2680 (class 2606 OID 22619828)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 22619598)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 22619498)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 22619560)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 22619522)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 22619468)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2538 (class 2606 OID 22619453)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 22619834)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 22619870)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 22620012)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 22619550)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 22619586)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 22620223)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 22619807)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 22619576)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 22619685)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2614 (class 2606 OID 22619677)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 22619819)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 22620232)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 22620240)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 22620210)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 22620252)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 22619852)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 22619792)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 22619783)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 22619999)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 22619926)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 22619652)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 22619424)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 22619861)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 22619442)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2540 (class 2606 OID 22619462)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 22619879)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 22619814)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 22619763)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 22619412)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 22619400)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 22619394)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 22619946)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 22619531)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 22619774)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 22619986)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 22619487)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 22620264)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 22619752)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 22619611)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 22619437)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 22620045)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 22619706)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 22619842)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 22619958)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 22620311)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 22620295)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 22620319)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 22619916)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 22619738)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 22620025)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 22619906)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 1259 OID 22619732)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2629 (class 1259 OID 22619733)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2630 (class 1259 OID 22619731)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2631 (class 1259 OID 22619730)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2632 (class 1259 OID 22619729)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2723 (class 1259 OID 22619947)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2724 (class 1259 OID 22619948)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2725 (class 1259 OID 22619949)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2809 (class 1259 OID 22620332)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2810 (class 1259 OID 22620331)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2565 (class 1259 OID 22619552)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2566 (class 1259 OID 22619553)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2681 (class 1259 OID 22619835)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2796 (class 1259 OID 22620299)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2797 (class 1259 OID 22620298)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2798 (class 1259 OID 22620300)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2799 (class 1259 OID 22620297)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2800 (class 1259 OID 22620296)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2675 (class 1259 OID 22619821)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2676 (class 1259 OID 22619820)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2622 (class 1259 OID 22619707)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2623 (class 1259 OID 22619708)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2705 (class 1259 OID 22619895)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2706 (class 1259 OID 22619897)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2707 (class 1259 OID 22619896)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2597 (class 1259 OID 22619642)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2598 (class 1259 OID 22619641)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2787 (class 1259 OID 22620253)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2739 (class 1259 OID 22620014)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2740 (class 1259 OID 22620015)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2741 (class 1259 OID 22620016)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2806 (class 1259 OID 22620320)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2748 (class 1259 OID 22620050)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2749 (class 1259 OID 22620047)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2750 (class 1259 OID 22620051)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2751 (class 1259 OID 22620049)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2752 (class 1259 OID 22620048)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2587 (class 1259 OID 22619613)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2588 (class 1259 OID 22619612)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2556 (class 1259 OID 22619525)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2693 (class 1259 OID 22619862)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2542 (class 1259 OID 22619469)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2543 (class 1259 OID 22619470)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2698 (class 1259 OID 22619882)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2699 (class 1259 OID 22619881)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2700 (class 1259 OID 22619880)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2570 (class 1259 OID 22619563)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2571 (class 1259 OID 22619562)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2572 (class 1259 OID 22619564)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2610 (class 1259 OID 22619680)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2611 (class 1259 OID 22619678)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2612 (class 1259 OID 22619679)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2522 (class 1259 OID 22619402)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2655 (class 1259 OID 22619787)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2656 (class 1259 OID 22619785)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2657 (class 1259 OID 22619784)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2658 (class 1259 OID 22619786)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2533 (class 1259 OID 22619443)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2534 (class 1259 OID 22619444)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2684 (class 1259 OID 22619843)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2819 (class 1259 OID 22620354)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2721 (class 1259 OID 22619935)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2722 (class 1259 OID 22619934)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2820 (class 1259 OID 22620362)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2821 (class 1259 OID 22620363)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2670 (class 1259 OID 22619808)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2715 (class 1259 OID 22619927)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2716 (class 1259 OID 22619928)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2769 (class 1259 OID 22620149)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2770 (class 1259 OID 22620148)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2771 (class 1259 OID 22620145)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2772 (class 1259 OID 22620146)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2773 (class 1259 OID 22620147)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2576 (class 1259 OID 22619578)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2577 (class 1259 OID 22619577)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2578 (class 1259 OID 22619579)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2687 (class 1259 OID 22619856)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2688 (class 1259 OID 22619855)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2779 (class 1259 OID 22620233)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2780 (class 1259 OID 22620234)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2762 (class 1259 OID 22620080)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2763 (class 1259 OID 22620081)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2764 (class 1259 OID 22620078)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2765 (class 1259 OID 22620079)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2711 (class 1259 OID 22619917)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2712 (class 1259 OID 22619918)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2661 (class 1259 OID 22619796)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2662 (class 1259 OID 22619795)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2663 (class 1259 OID 22619793)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2664 (class 1259 OID 22619794)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2758 (class 1259 OID 22620068)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2759 (class 1259 OID 22620067)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2601 (class 1259 OID 22619653)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2604 (class 1259 OID 22619667)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2605 (class 1259 OID 22619666)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2606 (class 1259 OID 22619665)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 22619668)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2621 (class 1259 OID 22619698)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2615 (class 1259 OID 22619686)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2616 (class 1259 OID 22619687)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2776 (class 1259 OID 22620224)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2795 (class 1259 OID 22620272)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2813 (class 1259 OID 22620338)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2814 (class 1259 OID 22620339)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2552 (class 1259 OID 22619500)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2553 (class 1259 OID 22619499)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2561 (class 1259 OID 22619532)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2562 (class 1259 OID 22619533)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2638 (class 1259 OID 22619739)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2650 (class 1259 OID 22619777)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2651 (class 1259 OID 22619776)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2652 (class 1259 OID 22619775)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2633 (class 1259 OID 22619725)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2634 (class 1259 OID 22619726)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2635 (class 1259 OID 22619724)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2636 (class 1259 OID 22619728)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2637 (class 1259 OID 22619727)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2569 (class 1259 OID 22619551)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2550 (class 1259 OID 22619488)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2551 (class 1259 OID 22619489)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2593 (class 1259 OID 22619627)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2594 (class 1259 OID 22619629)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2595 (class 1259 OID 22619628)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2596 (class 1259 OID 22619630)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2669 (class 1259 OID 22619802)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2744 (class 1259 OID 22620013)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2753 (class 1259 OID 22620046)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2735 (class 1259 OID 22619987)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2736 (class 1259 OID 22619988)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2559 (class 1259 OID 22619523)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2560 (class 1259 OID 22619524)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2708 (class 1259 OID 22619907)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2528 (class 1259 OID 22619413)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2586 (class 1259 OID 22619599)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2575 (class 1259 OID 22619561)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2525 (class 1259 OID 22619401)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2792 (class 1259 OID 22620265)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 22619854)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2692 (class 1259 OID 22619853)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2645 (class 1259 OID 22619753)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2646 (class 1259 OID 22619754)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2766 (class 1259 OID 22620077)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2583 (class 1259 OID 22619587)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2745 (class 1259 OID 22620026)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2803 (class 1259 OID 22620312)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2785 (class 1259 OID 22620241)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2786 (class 1259 OID 22620242)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2732 (class 1259 OID 22619976)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2649 (class 1259 OID 22619764)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2541 (class 1259 OID 22619463)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2858 (class 2606 OID 22620534)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2859 (class 2606 OID 22620539)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2863 (class 2606 OID 22620559)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2857 (class 2606 OID 22620529)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2861 (class 2606 OID 22620549)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2862 (class 2606 OID 22620554)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2860 (class 2606 OID 22620544)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2897 (class 2606 OID 22620729)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2898 (class 2606 OID 22620734)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2899 (class 2606 OID 22620739)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2932 (class 2606 OID 22620904)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2931 (class 2606 OID 22620899)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2835 (class 2606 OID 22620419)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2836 (class 2606 OID 22620424)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2880 (class 2606 OID 22620644)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2928 (class 2606 OID 22620884)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2927 (class 2606 OID 22620879)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2929 (class 2606 OID 22620889)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2926 (class 2606 OID 22620874)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2925 (class 2606 OID 22620869)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2879 (class 2606 OID 22620639)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2878 (class 2606 OID 22620634)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2855 (class 2606 OID 22620519)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2856 (class 2606 OID 22620524)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2888 (class 2606 OID 22620684)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2890 (class 2606 OID 22620694)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2889 (class 2606 OID 22620689)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2846 (class 2606 OID 22620474)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2845 (class 2606 OID 22620469)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2876 (class 2606 OID 22620624)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2923 (class 2606 OID 22620859)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2900 (class 2606 OID 22620744)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2901 (class 2606 OID 22620749)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2902 (class 2606 OID 22620754)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2930 (class 2606 OID 22620894)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2906 (class 2606 OID 22620774)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2903 (class 2606 OID 22620759)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2907 (class 2606 OID 22620779)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2905 (class 2606 OID 22620769)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2904 (class 2606 OID 22620764)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2844 (class 2606 OID 22620464)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2843 (class 2606 OID 22620459)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2832 (class 2606 OID 22620404)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2831 (class 2606 OID 22620399)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2884 (class 2606 OID 22620664)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2827 (class 2606 OID 22620379)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2828 (class 2606 OID 22620384)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2887 (class 2606 OID 22620679)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2886 (class 2606 OID 22620674)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2885 (class 2606 OID 22620669)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2838 (class 2606 OID 22620434)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2837 (class 2606 OID 22620429)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2839 (class 2606 OID 22620439)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2851 (class 2606 OID 22620499)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2849 (class 2606 OID 22620489)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2850 (class 2606 OID 22620494)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2824 (class 2606 OID 22620364)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2871 (class 2606 OID 22620599)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2869 (class 2606 OID 22620589)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2868 (class 2606 OID 22620584)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2870 (class 2606 OID 22620594)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2825 (class 2606 OID 22620369)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2826 (class 2606 OID 22620374)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2881 (class 2606 OID 22620649)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2935 (class 2606 OID 22620919)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2896 (class 2606 OID 22620724)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2895 (class 2606 OID 22620719)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2936 (class 2606 OID 22620924)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2937 (class 2606 OID 22620929)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2877 (class 2606 OID 22620629)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2893 (class 2606 OID 22620709)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2894 (class 2606 OID 22620714)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2918 (class 2606 OID 22620834)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2917 (class 2606 OID 22620829)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2914 (class 2606 OID 22620814)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2915 (class 2606 OID 22620819)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2916 (class 2606 OID 22620824)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2841 (class 2606 OID 22620449)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2840 (class 2606 OID 22620444)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2842 (class 2606 OID 22620454)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2883 (class 2606 OID 22620659)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2882 (class 2606 OID 22620654)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2920 (class 2606 OID 22620844)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2921 (class 2606 OID 22620849)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2912 (class 2606 OID 22620804)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2913 (class 2606 OID 22620809)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2910 (class 2606 OID 22620794)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2911 (class 2606 OID 22620799)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2891 (class 2606 OID 22620699)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 22620704)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2875 (class 2606 OID 22620619)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2874 (class 2606 OID 22620614)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2872 (class 2606 OID 22620604)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2873 (class 2606 OID 22620609)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2909 (class 2606 OID 22620789)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2908 (class 2606 OID 22620784)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2847 (class 2606 OID 22620479)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2848 (class 2606 OID 22620484)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2854 (class 2606 OID 22620514)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2852 (class 2606 OID 22620504)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2853 (class 2606 OID 22620509)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2919 (class 2606 OID 22620839)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2922 (class 2606 OID 22620854)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2924 (class 2606 OID 22620864)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2933 (class 2606 OID 22620909)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2934 (class 2606 OID 22620914)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2830 (class 2606 OID 22620394)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2829 (class 2606 OID 22620389)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2833 (class 2606 OID 22620409)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2834 (class 2606 OID 22620414)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2864 (class 2606 OID 22620564)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2867 (class 2606 OID 22620579)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2866 (class 2606 OID 22620574)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2865 (class 2606 OID 22620569)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-19 15:58:46 CEST

--
-- PostgreSQL database dump complete
--

