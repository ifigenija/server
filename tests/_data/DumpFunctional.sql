--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-18 09:46:46 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 242 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3002 (class 0 OID 0)
-- Dependencies: 242
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 19978692)
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
-- TOC entry 226 (class 1259 OID 19979214)
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
-- TOC entry 225 (class 1259 OID 19979197)
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
-- TOC entry 219 (class 1259 OID 19979105)
-- Name: besedilo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE besedilo (
    id uuid NOT NULL,
    stevilka character varying(255) NOT NULL,
    naslov character varying(255) DEFAULT NULL::character varying,
    avtor character varying(255) DEFAULT NULL::character varying,
    podnaslov character varying(255) DEFAULT NULL::character varying,
    jezik character varying(255) DEFAULT NULL::character varying,
    naslovizvirnika character varying(255) DEFAULT NULL::character varying,
    internacionalninaslov character varying(255) DEFAULT NULL::character varying,
    datumprejema date,
    moskevloge integer,
    zenskevloge integer,
    prevajalec character varying(255) DEFAULT NULL::character varying,
    povzetekvsebine text,
    letoizida integer,
    krajizida character varying(255) DEFAULT NULL::character varying,
    zaloznik character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 19979453)
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
-- TOC entry 195 (class 1259 OID 19978873)
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
    planiranzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    allday boolean DEFAULT false,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status character varying(4) DEFAULT NULL::character varying,
    razred character varying(4) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 19978904)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 19979379)
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
-- TOC entry 190 (class 1259 OID 19978813)
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
-- TOC entry 227 (class 1259 OID 19979227)
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
    sthonorarnih integer,
    sthonorarnihigr integer,
    sthonorarnihigrtujjz integer,
    sthonorarnihigrsamoz integer,
    obiskdoma integer DEFAULT 0 NOT NULL,
    obiskkopr integer DEFAULT 0 NOT NULL,
    obiskgost integer DEFAULT 0 NOT NULL,
    obiskzamejo integer DEFAULT 0 NOT NULL,
    obiskint integer DEFAULT 0 NOT NULL,
    obiskkoprint integer DEFAULT 0 NOT NULL,
    ponovidoma integer DEFAULT 0 NOT NULL,
    ponovikopr integer DEFAULT 0 NOT NULL,
    ponovizamejo integer DEFAULT 0 NOT NULL,
    ponovigost integer DEFAULT 0 NOT NULL,
    ponovikoprint integer DEFAULT 0 NOT NULL,
    ponoviint integer DEFAULT 0 NOT NULL,
    naziv character varying(50) DEFAULT NULL::character varying,
    kpe numeric(15,2) DEFAULT 0::numeric NOT NULL,
    sort integer,
    tipprogramskeenote_id uuid,
    tip character varying(20) NOT NULL,
    prikoproducentu boolean,
    strosekodkpred numeric(15,2) DEFAULT 0::numeric,
    stroskiostali numeric(15,2) DEFAULT 0::numeric,
    krajgostovanja character varying(255) DEFAULT NULL::character varying,
    ustanova character varying(255) DEFAULT NULL::character varying,
    datumgostovanja date,
    transportnistroski numeric(15,2) DEFAULT NULL::numeric,
    dnevprvzad numeric(15,2) DEFAULT NULL::numeric,
    drzavagostovanja_id uuid,
    stpe integer DEFAULT 0,
    zvrst character varying(255) DEFAULT NULL::character varying,
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
-- TOC entry 213 (class 1259 OID 19979037)
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
-- TOC entry 193 (class 1259 OID 19978852)
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
-- TOC entry 191 (class 1259 OID 19978830)
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
-- TOC entry 202 (class 1259 OID 19978951)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 238 (class 1259 OID 19979434)
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
-- TOC entry 239 (class 1259 OID 19979446)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 19979468)
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
-- TOC entry 170 (class 1259 OID 19946838)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 19978976)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 19978787)
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
-- TOC entry 182 (class 1259 OID 19978701)
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
-- TOC entry 183 (class 1259 OID 19978712)
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
-- TOC entry 178 (class 1259 OID 19978666)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 19978685)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 19978983)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 19979017)
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
-- TOC entry 222 (class 1259 OID 19979146)
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
    vrednostdopremiere numeric(12,2) DEFAULT NULL::numeric,
    aktivna boolean,
    zaposlenvdrjz boolean,
    samozaposlen boolean,
    igralec boolean,
    opis text
);


--
-- TOC entry 185 (class 1259 OID 19978745)
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
-- TOC entry 187 (class 1259 OID 19978779)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 19979325)
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
-- TOC entry 203 (class 1259 OID 19978957)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 19978764)
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
-- TOC entry 192 (class 1259 OID 19978842)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 19978969)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 19979339)
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
-- TOC entry 231 (class 1259 OID 19979349)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 19979282)
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
    stizvnekomerc integer,
    stizvprem integer,
    stizvpremdoma integer,
    stizvpremkopr integer,
    stizvponprem integer,
    stizvponpremdoma integer,
    stizvponpremzamejo integer,
    stizvponpremgost integer,
    stizvponpremkopr integer,
    stizvponpremint integer,
    stizvponpremkoprint integer,
    stizvponprej integer,
    stizvponprejdoma integer,
    stizvponprejzamejo integer,
    stizvponprejgost integer,
    stizvponprejkopr integer,
    stizvponprejint integer,
    stizvponprejkoprint integer,
    stizvgostuj integer,
    stizvostalihnek integer,
    stizvgostovanjslo integer,
    stizvgostovanjzam integer,
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
    sthonorarnih integer,
    sthonorarnihigr integer,
    sthonorarnihigrtujjz integer,
    sthonorarnihigrsamoz integer,
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
-- TOC entry 232 (class 1259 OID 19979357)
-- Name: programskaenotasklopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programskaenotasklopa (
    id uuid NOT NULL,
    naslovpe character varying(255) NOT NULL,
    avtorpe character varying(255) NOT NULL,
    obsegpe character varying(255) NOT NULL,
    mesecpe character varying(255) NOT NULL,
    vrednostpe numeric(15,2) DEFAULT 0::numeric NOT NULL,
    programrazno_id uuid
);


--
-- TOC entry 209 (class 1259 OID 19978998)
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
-- TOC entry 201 (class 1259 OID 19978942)
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
-- TOC entry 200 (class 1259 OID 19978932)
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
-- TOC entry 221 (class 1259 OID 19979135)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 19979072)
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
-- TOC entry 175 (class 1259 OID 19978637)
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
-- TOC entry 174 (class 1259 OID 19978635)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3003 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 19979011)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 19978675)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 19978659)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 19979025)
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
-- TOC entry 204 (class 1259 OID 19978963)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 19978909)
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
-- TOC entry 173 (class 1259 OID 19978624)
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
-- TOC entry 172 (class 1259 OID 19978616)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 19978611)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 19979082)
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
-- TOC entry 184 (class 1259 OID 19978737)
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
-- TOC entry 199 (class 1259 OID 19978919)
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
-- TOC entry 220 (class 1259 OID 19979123)
-- Name: tipfunkcije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipfunkcije (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text,
    imezenski character varying(255) DEFAULT NULL::character varying,
    podrocje character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 233 (class 1259 OID 19979367)
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
-- TOC entry 189 (class 1259 OID 19978799)
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
-- TOC entry 176 (class 1259 OID 19978646)
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
-- TOC entry 224 (class 1259 OID 19979172)
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
    maticnioder_id uuid
);


--
-- TOC entry 194 (class 1259 OID 19978863)
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
-- TOC entry 208 (class 1259 OID 19978990)
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
-- TOC entry 218 (class 1259 OID 19979096)
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
-- TOC entry 236 (class 1259 OID 19979414)
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
-- TOC entry 235 (class 1259 OID 19979386)
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
-- TOC entry 237 (class 1259 OID 19979426)
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
-- TOC entry 215 (class 1259 OID 19979062)
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
-- TOC entry 196 (class 1259 OID 19978899)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 19979162)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 19979052)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2187 (class 2604 OID 19978640)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2935 (class 0 OID 19978692)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 19979214)
-- Dependencies: 226
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55fb-c164-4079-f2ac40a99137	000d0000-55fb-c163-d302-26731747be2f	\N	00090000-55fb-c163-c069-f18f45b89069	000b0000-55fb-c163-7e6c-02bf4d3e4c80	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55fb-c164-61bc-2a1119f5480f	000d0000-55fb-c163-475e-5d8ae2c3eb72	00100000-55fb-c163-00f4-673d2d2494a5	00090000-55fb-c163-0d12-e96224a3f282	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55fb-c164-5702-ec93ffd75773	000d0000-55fb-c163-a70e-39016efb5e12	00100000-55fb-c163-318e-d42c95cddd47	00090000-55fb-c163-be42-8e67cac850f4	\N	0003	t	\N	2015-09-18	\N	2	t	\N	f	f
000c0000-55fb-c164-0e27-fb3835f33839	000d0000-55fb-c163-549c-79c844593771	\N	00090000-55fb-c163-8dcf-6b7c84617731	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55fb-c164-32d3-400c1bdf4088	000d0000-55fb-c163-dfac-b56f22fec40f	\N	00090000-55fb-c163-2eee-f1551defe23e	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55fb-c164-94c3-7f4a68943f67	000d0000-55fb-c163-96aa-5cca9017157d	\N	00090000-55fb-c163-5497-902d9bade5ac	000b0000-55fb-c163-db5b-099a0f3eca29	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55fb-c164-5095-bd8321af1af6	000d0000-55fb-c163-5d08-756545fb7d2c	00100000-55fb-c163-359f-65952445673e	00090000-55fb-c163-3729-64a0a824e057	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55fb-c164-4020-287b2bdbf6b6	000d0000-55fb-c163-ce5a-537a5924fbe9	\N	00090000-55fb-c163-a14f-cd8093f62d82	000b0000-55fb-c163-d2fd-c8af3cd48465	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55fb-c164-411c-cd047de91f8b	000d0000-55fb-c163-5d08-756545fb7d2c	00100000-55fb-c163-939c-b540deaab87c	00090000-55fb-c163-6c39-9b71ecde7470	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55fb-c164-7d73-76a9059b2016	000d0000-55fb-c163-5d08-756545fb7d2c	00100000-55fb-c163-274e-5fd311a9623a	00090000-55fb-c163-c750-aa6eaa68afd4	\N	0010	t	\N	2015-09-18	\N	16	f	\N	f	t
000c0000-55fb-c164-4d49-411001f69271	000d0000-55fb-c163-5d08-756545fb7d2c	00100000-55fb-c163-b82a-fdf2b3f459b4	00090000-55fb-c163-6cc7-8fc45ca12624	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55fb-c164-8d5b-6c5433326734	000d0000-55fb-c163-a231-489017a72666	\N	00090000-55fb-c163-0d12-e96224a3f282	000b0000-55fb-c163-0e77-87b2c8d81f50	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 2979 (class 0 OID 19979197)
-- Dependencies: 225
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2973 (class 0 OID 19979105)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55fb-c163-a035-284940881870	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55fb-c163-ab0b-649395f5ce97	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55fb-c163-1e64-c32103332054	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2994 (class 0 OID 19979453)
-- Dependencies: 240
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 19978873)
-- Dependencies: 195
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55fb-c163-6b4f-8aadb0c4db23	\N	\N	00200000-55fb-c163-4a41-0bd967b4e3e8	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-55fb-c163-6b23-11b367923844	\N	\N	00200000-55fb-c163-c31c-8b67c33fe050	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-55fb-c163-b7e9-7a020b5f72af	\N	\N	00200000-55fb-c163-438c-ebf04b9c2095	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-55fb-c163-099e-b7298930c7b7	\N	\N	00200000-55fb-c163-b655-d4ae8f00f4bf	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-55fb-c163-00d0-d52d51c183d7	\N	\N	00200000-55fb-c163-c02e-6cb80176cdb5	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2951 (class 0 OID 19978904)
-- Dependencies: 197
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 19979379)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2944 (class 0 OID 19978813)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55fb-c161-9062-43e431af9e51	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55fb-c161-bf8f-c1bf9a0cd594	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55fb-c161-1dcb-01a1411fb79a	AL	ALB	008	Albania 	Albanija	\N
00040000-55fb-c161-bf5f-3fcf8b7f044e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55fb-c161-f7bf-9b5545d14367	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55fb-c161-d4c7-7fee7adb9060	AD	AND	020	Andorra 	Andora	\N
00040000-55fb-c161-50eb-2004d3e9fda3	AO	AGO	024	Angola 	Angola	\N
00040000-55fb-c161-be20-8d32ba4f72b6	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55fb-c161-e4fe-fa7f1968a933	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55fb-c161-45e9-c6157d3acd79	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55fb-c161-4058-05f9bfcfdea8	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55fb-c161-48a8-e81b8d106c30	AM	ARM	051	Armenia 	Armenija	\N
00040000-55fb-c161-0a88-e10a012b0a20	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55fb-c161-47bd-778e52915a82	AU	AUS	036	Australia 	Avstralija	\N
00040000-55fb-c161-989f-b9c0b2a1cfb8	AT	AUT	040	Austria 	Avstrija	\N
00040000-55fb-c161-1784-84fc3a10923d	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55fb-c161-e8d4-e2393a8e5ebb	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55fb-c161-0b17-3fcfa44484f7	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55fb-c161-3da1-b8084ef55693	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55fb-c161-9ca5-c7e405a7c075	BB	BRB	052	Barbados 	Barbados	\N
00040000-55fb-c161-4d76-784665f410f3	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55fb-c161-bc54-1da1f208175a	BE	BEL	056	Belgium 	Belgija	\N
00040000-55fb-c161-e59c-5858cc4294fe	BZ	BLZ	084	Belize 	Belize	\N
00040000-55fb-c161-f60f-8529083ba41f	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55fb-c161-9118-b2d171d9c4de	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55fb-c161-f8ea-edef42a9fe8a	BT	BTN	064	Bhutan 	Butan	\N
00040000-55fb-c161-58a4-088acfa1fe65	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55fb-c161-91f6-42e0ee38ccd9	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55fb-c161-14f3-bfa0118bb673	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55fb-c161-78db-f1669a37a2be	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55fb-c161-f024-e94ae5617a29	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55fb-c161-acad-ec296a11e120	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55fb-c161-d023-62e0f677a3e5	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55fb-c161-ef27-cbae5522f2bb	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55fb-c161-1de9-dc2a853ecd1c	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55fb-c161-03d8-646c13064dcf	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55fb-c161-2824-98a163474b86	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55fb-c161-334c-3b40312c617c	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55fb-c161-fc5f-15768d223b68	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55fb-c161-8c07-5909b14e6566	CA	CAN	124	Canada 	Kanada	\N
00040000-55fb-c161-d83d-161ae08932b4	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55fb-c161-8a25-210eb40b4a9e	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55fb-c161-ce7a-ddbd5a7523fd	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55fb-c161-8f4a-255094a83fa6	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55fb-c161-defb-e06171b6e607	CL	CHL	152	Chile 	Čile	\N
00040000-55fb-c161-b4a8-26d7026bfedf	CN	CHN	156	China 	Kitajska	\N
00040000-55fb-c161-93ae-7a7400ffdeae	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55fb-c161-a0b1-403abbcd49c9	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55fb-c161-4eed-b3282557057d	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55fb-c161-02d5-22effa8893bf	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55fb-c161-c854-b9dc1e3f5371	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55fb-c161-bb47-44e9541cb7a1	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55fb-c161-7ef1-bf27e3930241	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55fb-c161-bc34-e1616882531a	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55fb-c161-e2b0-3ae61413e817	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55fb-c161-ca48-77908f67b46b	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55fb-c161-27e2-d50f539adf0d	CU	CUB	192	Cuba 	Kuba	\N
00040000-55fb-c161-a945-4a9fd35fe1e7	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55fb-c161-4072-1e9d0ed71cf0	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55fb-c161-f3f1-6964ac967dd2	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55fb-c161-c146-7ebe0a3c0f02	DK	DNK	208	Denmark 	Danska	\N
00040000-55fb-c161-f32a-9bcab310997a	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55fb-c161-a719-91b778a71ef0	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55fb-c161-1792-69fb72d9d7fc	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55fb-c161-49c5-0a5fb556ad66	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55fb-c161-1a93-2a97c7c6c892	EG	EGY	818	Egypt 	Egipt	\N
00040000-55fb-c161-bb71-2a6eeda9721a	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55fb-c161-1eb4-58faf914e303	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55fb-c161-503f-bcdb7f2b94a1	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55fb-c161-f40b-a8443f7beb4f	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55fb-c161-5a7b-5a2252339642	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55fb-c161-8b64-3ac226a9d11c	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55fb-c161-7d17-aecf7f40dfcf	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55fb-c161-b37c-253812fb85d4	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55fb-c161-a5f5-b19e4de7dd6f	FI	FIN	246	Finland 	Finska	\N
00040000-55fb-c161-c208-daef45d92c1c	FR	FRA	250	France 	Francija	\N
00040000-55fb-c161-fb62-0e5c94aef686	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55fb-c161-4b38-8886426f4e4a	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55fb-c161-e894-454716251dac	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55fb-c161-d6e2-895b68c19170	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55fb-c161-ba53-dcfd412d8f54	GA	GAB	266	Gabon 	Gabon	\N
00040000-55fb-c161-141e-d63165c40bf1	GM	GMB	270	Gambia 	Gambija	\N
00040000-55fb-c161-bdd2-dc59a7948f34	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55fb-c161-0c42-4c0e551e79a8	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55fb-c161-5eb8-e59a155b0ce5	GH	GHA	288	Ghana 	Gana	\N
00040000-55fb-c161-129c-8c7b34ff57a8	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55fb-c161-f547-8a5a9414b666	GR	GRC	300	Greece 	Grčija	\N
00040000-55fb-c161-fd86-744fc814dfe3	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55fb-c161-7de0-a7854b07b878	GD	GRD	308	Grenada 	Grenada	\N
00040000-55fb-c161-6569-b43de2885d44	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55fb-c161-2584-d877bb35ffc1	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55fb-c161-e0ec-91e4903a4d3b	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55fb-c161-fad5-02106c6294f4	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55fb-c161-f701-894ae1f4c5dd	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55fb-c161-d4cf-cc1deb0eee4d	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55fb-c161-b052-7745154061ac	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55fb-c161-c205-41f9c1a3ef09	HT	HTI	332	Haiti 	Haiti	\N
00040000-55fb-c161-a424-f0b0cb1b5265	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55fb-c161-f63a-d89613a1678c	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55fb-c161-8698-2ae6de495aea	HN	HND	340	Honduras 	Honduras	\N
00040000-55fb-c161-f2a8-507b331fbc16	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55fb-c161-566d-c45f3895fd7e	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55fb-c161-0815-3624268dd9dc	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55fb-c161-f057-27d99397bb72	IN	IND	356	India 	Indija	\N
00040000-55fb-c161-d197-a1ba393527c4	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55fb-c161-301c-328c252e2a78	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55fb-c161-d75e-b3a92ea7819b	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55fb-c161-a81b-3b1f185050f0	IE	IRL	372	Ireland 	Irska	\N
00040000-55fb-c161-2290-05f9c1c42106	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55fb-c161-f30f-b00eea5fc6ec	IL	ISR	376	Israel 	Izrael	\N
00040000-55fb-c161-2611-96e57ecfae78	IT	ITA	380	Italy 	Italija	\N
00040000-55fb-c161-f98c-84e1c703b2bc	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55fb-c161-39ce-d3bac6dccc5e	JP	JPN	392	Japan 	Japonska	\N
00040000-55fb-c161-8f3b-9e022d5890c0	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55fb-c161-980e-14c113e80522	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55fb-c161-1a91-1a81a62022c6	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55fb-c161-30c5-23e6051218c0	KE	KEN	404	Kenya 	Kenija	\N
00040000-55fb-c161-9cae-46ebcc7d4e0b	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55fb-c161-d7ff-541939c5e552	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55fb-c161-886c-1bf339ef1ab2	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55fb-c161-8a6e-64236ddf1bf8	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55fb-c161-fccd-c67d735e297a	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55fb-c161-1c46-cdd5e8899d19	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55fb-c161-7921-f69f626be804	LV	LVA	428	Latvia 	Latvija	\N
00040000-55fb-c161-15ec-89b755399c56	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55fb-c161-861a-d40fbd131a40	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55fb-c161-f572-9ddd1146d40f	LR	LBR	430	Liberia 	Liberija	\N
00040000-55fb-c161-fc6b-31a95f9288ec	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55fb-c161-a66c-740e252d9100	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55fb-c161-e080-388ac9f3ea4f	LT	LTU	440	Lithuania 	Litva	\N
00040000-55fb-c161-73e1-6fc01b7b3ce4	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55fb-c161-e29e-791368e73677	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55fb-c161-7280-7d77febe61b8	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55fb-c161-a3bf-a62f6666ce76	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55fb-c161-0e72-39a0d6f408c8	MW	MWI	454	Malawi 	Malavi	\N
00040000-55fb-c161-c554-76617e8a53de	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55fb-c161-6a5b-d699bc686917	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55fb-c161-ddec-058cebedf32f	ML	MLI	466	Mali 	Mali	\N
00040000-55fb-c161-a958-5eb9002ed61c	MT	MLT	470	Malta 	Malta	\N
00040000-55fb-c161-ebb8-95ae7ffda653	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55fb-c161-a450-d5b0c353ca80	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55fb-c161-3689-a8947300a211	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55fb-c161-b06e-e56b2e023ab3	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55fb-c161-1725-9ac682f106bf	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55fb-c161-251e-b23fb5d89a73	MX	MEX	484	Mexico 	Mehika	\N
00040000-55fb-c161-1f55-046febbd8dcc	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55fb-c161-176d-e60b90806b6d	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55fb-c161-e84e-091867805772	MC	MCO	492	Monaco 	Monako	\N
00040000-55fb-c161-25ac-354d32a4d674	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55fb-c161-9630-67c82a29c50d	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55fb-c161-7a75-28d4d6039a6e	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55fb-c161-443c-e7526839abae	MA	MAR	504	Morocco 	Maroko	\N
00040000-55fb-c161-c15d-8d57af27864b	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55fb-c161-3256-b2708ee56b00	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55fb-c161-55cf-eba34964182f	NA	NAM	516	Namibia 	Namibija	\N
00040000-55fb-c161-720e-c0ab4619a483	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55fb-c161-567c-1550e40ebe7b	NP	NPL	524	Nepal 	Nepal	\N
00040000-55fb-c161-7dbe-d89864788d52	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55fb-c161-bcd8-82b43ef820ed	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55fb-c161-1503-39fc3b97c918	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55fb-c161-17cb-7c8b32073786	NE	NER	562	Niger 	Niger 	\N
00040000-55fb-c161-69ef-1be9dc4f3c81	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55fb-c161-3f7d-b6ffb7fa2053	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55fb-c161-540c-3f6865496819	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55fb-c161-fa4b-6779e66dd3e6	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55fb-c161-6f04-7da090ed9434	NO	NOR	578	Norway 	Norveška	\N
00040000-55fb-c161-36dd-01726b86e30a	OM	OMN	512	Oman 	Oman	\N
00040000-55fb-c161-3182-7f86ecc683e4	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55fb-c161-2c0c-ac071b7dc626	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55fb-c161-7d58-7fb5a1d76663	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55fb-c161-9152-482aaf9467fa	PA	PAN	591	Panama 	Panama	\N
00040000-55fb-c161-e903-bac2783b2155	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55fb-c161-743c-0201cd2cf4df	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55fb-c161-97f1-4d850c9ca26e	PE	PER	604	Peru 	Peru	\N
00040000-55fb-c161-4358-3a1ca1c4a206	PH	PHL	608	Philippines 	Filipini	\N
00040000-55fb-c161-ebb8-f3bf3e33bc42	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55fb-c161-576e-2a66341373aa	PL	POL	616	Poland 	Poljska	\N
00040000-55fb-c161-940e-119f7ed8699b	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55fb-c161-ae4e-099959b81da3	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55fb-c161-785e-69ce01dc8563	QA	QAT	634	Qatar 	Katar	\N
00040000-55fb-c161-a32a-1d97dfe85f6d	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55fb-c161-1af9-d378454bafdc	RO	ROU	642	Romania 	Romunija	\N
00040000-55fb-c161-8232-7ba2090ab9fb	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55fb-c161-f5ba-e77659f433ec	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55fb-c161-489f-a483453f7bd4	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55fb-c161-a6db-0535d28360e9	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55fb-c161-fc8a-334c64c48863	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55fb-c161-87c7-7e1d7e138e98	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55fb-c161-6099-00a0fb793662	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55fb-c161-db7f-1d30c035ad20	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55fb-c161-3c6e-1c50cf3f09cb	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55fb-c161-82ac-e1558b6912fd	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55fb-c161-247e-a3363ddac789	SM	SMR	674	San Marino 	San Marino	\N
00040000-55fb-c161-4dad-6a5c73e3ad3a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55fb-c161-170d-f4785427fd45	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55fb-c161-e1a1-ea587979fc7d	SN	SEN	686	Senegal 	Senegal	\N
00040000-55fb-c161-adbd-30e0d00811e8	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55fb-c161-603e-c1ddbde695ce	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55fb-c161-e8b9-c83e557633e7	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55fb-c161-87cc-bffaa9ca9f4c	SG	SGP	702	Singapore 	Singapur	\N
00040000-55fb-c161-10f3-31a8ce8dafa9	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55fb-c161-3e6f-158164f7c106	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55fb-c161-1c79-2fd176ab8916	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55fb-c161-a629-1215261c4777	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55fb-c161-091e-29b96dd29ebf	SO	SOM	706	Somalia 	Somalija	\N
00040000-55fb-c161-c47d-ebcda6b8fbf2	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55fb-c161-0719-88d39f1c0e78	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55fb-c161-27f2-af2c708ca9d6	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55fb-c161-c43d-fffe75e6a938	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55fb-c161-cc33-db1df533cf73	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55fb-c161-25fe-cc70a41c76cb	SD	SDN	729	Sudan 	Sudan	\N
00040000-55fb-c161-edd8-f919149dff1d	SR	SUR	740	Suriname 	Surinam	\N
00040000-55fb-c161-7515-006040179f53	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55fb-c161-bb54-02f7dc74376e	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55fb-c161-d3dd-63d5f5d5e0ea	SE	SWE	752	Sweden 	Švedska	\N
00040000-55fb-c161-01f7-5ad0b70f8048	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55fb-c161-111b-5c2ed4293f63	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55fb-c161-9ccc-7fc771be3520	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55fb-c161-c0f7-5b6c2896a7c0	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55fb-c161-bc44-002254cae7be	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55fb-c161-9b7e-3f8b57b580c6	TH	THA	764	Thailand 	Tajska	\N
00040000-55fb-c161-3b40-09252527d9eb	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55fb-c161-04ad-b235de81583c	TG	TGO	768	Togo 	Togo	\N
00040000-55fb-c161-6739-0aa321e3611f	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55fb-c161-cce3-da98f00939fd	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55fb-c161-09a2-4594c040f2ba	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55fb-c161-d52f-fdaa21fe01f2	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55fb-c161-eda7-98a890367a99	TR	TUR	792	Turkey 	Turčija	\N
00040000-55fb-c161-5318-32147fa93593	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55fb-c161-3e53-35d1052b12aa	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55fb-c161-d98e-dd0d1e2dfa11	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55fb-c161-6c6e-955ef2b42900	UG	UGA	800	Uganda 	Uganda	\N
00040000-55fb-c161-32cc-73e907473cdf	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55fb-c161-6ad0-1de42dd5f6d4	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55fb-c161-13d1-625661ac8137	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55fb-c161-4b3b-ec7513da7d5b	US	USA	840	United States 	Združene države Amerike	\N
00040000-55fb-c161-d12c-a899eec1957c	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55fb-c161-ae3e-19601aceb7af	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55fb-c161-f110-5526dfd8c8c6	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55fb-c161-d2a1-580d3ce19d01	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55fb-c161-d8c0-75f12c1dbd37	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55fb-c161-8081-a21272b65469	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55fb-c161-930a-050e4eedf282	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55fb-c161-cf04-4c1dfe39e87f	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55fb-c161-b8dc-5e5695d74bc9	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55fb-c161-890e-9669e8d35307	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55fb-c161-2c36-15ed5faa3aff	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55fb-c161-b140-305f30f17696	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55fb-c161-3757-8e561c6122d8	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2981 (class 0 OID 19979227)
-- Dependencies: 227
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55fb-c163-0e25-21203977dabf	000e0000-55fb-c163-45d6-5fa4ff44787d	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55fb-c161-c0ce-9d705588c9a0	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55fb-c163-6e03-8c3f1e6d77c4	000e0000-55fb-c163-2fa0-0f257f97515b	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55fb-c161-e057-271155772132	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55fb-c163-0976-2ec4a1bd208b	000e0000-55fb-c163-9567-2a1269833fa7	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55fb-c161-c0ce-9d705588c9a0	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55fb-c163-87a6-13d66544f183	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55fb-c163-9293-8bb8dafeb40d	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2967 (class 0 OID 19979037)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55fb-c163-d302-26731747be2f	000e0000-55fb-c163-2fa0-0f257f97515b	000c0000-55fb-c164-4079-f2ac40a99137	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55fb-c161-1cfe-1076812fc262
000d0000-55fb-c163-475e-5d8ae2c3eb72	000e0000-55fb-c163-2fa0-0f257f97515b	000c0000-55fb-c164-61bc-2a1119f5480f	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55fb-c161-3d0c-fb26a71b3d37
000d0000-55fb-c163-a70e-39016efb5e12	000e0000-55fb-c163-2fa0-0f257f97515b	000c0000-55fb-c164-5702-ec93ffd75773	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55fb-c161-04bd-7f2b552c78df
000d0000-55fb-c163-549c-79c844593771	000e0000-55fb-c163-2fa0-0f257f97515b	000c0000-55fb-c164-0e27-fb3835f33839	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55fb-c161-1689-50aaafd0746b
000d0000-55fb-c163-dfac-b56f22fec40f	000e0000-55fb-c163-2fa0-0f257f97515b	000c0000-55fb-c164-32d3-400c1bdf4088	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55fb-c161-1689-50aaafd0746b
000d0000-55fb-c163-96aa-5cca9017157d	000e0000-55fb-c163-2fa0-0f257f97515b	000c0000-55fb-c164-94c3-7f4a68943f67	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55fb-c161-1cfe-1076812fc262
000d0000-55fb-c163-5d08-756545fb7d2c	000e0000-55fb-c163-2fa0-0f257f97515b	000c0000-55fb-c164-411c-cd047de91f8b	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55fb-c161-1cfe-1076812fc262
000d0000-55fb-c163-ce5a-537a5924fbe9	000e0000-55fb-c163-2fa0-0f257f97515b	000c0000-55fb-c164-4020-287b2bdbf6b6	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55fb-c161-c948-5c69e8690af2
000d0000-55fb-c163-a231-489017a72666	000e0000-55fb-c163-2fa0-0f257f97515b	000c0000-55fb-c164-8d5b-6c5433326734	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55fb-c161-7f63-3515178a96e4
\.


--
-- TOC entry 2947 (class 0 OID 19978852)
-- Dependencies: 193
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2945 (class 0 OID 19978830)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55fb-c163-2af2-a74b57f75e43	00080000-55fb-c163-8340-86dde68eabe5	00090000-55fb-c163-c750-aa6eaa68afd4	AK		igralka
\.


--
-- TOC entry 2956 (class 0 OID 19978951)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 19979434)
-- Dependencies: 238
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 19979446)
-- Dependencies: 239
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 19979468)
-- Dependencies: 241
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2924 (class 0 OID 19946838)
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
\.


--
-- TOC entry 2960 (class 0 OID 19978976)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2942 (class 0 OID 19978787)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55fb-c162-2e3b-90d6863a461a	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55fb-c162-54a8-c06ee02bf2b3	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55fb-c162-07d9-184a453a3d35	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55fb-c162-cd5c-1f8efa67bdaa	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55fb-c162-de81-db5c349fdb0b	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55fb-c162-eb6e-27276cdb4077	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55fb-c162-7407-3cd1de6ca85b	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55fb-c162-6a65-d061a6740d70	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55fb-c162-5a11-389d9c25f60e	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55fb-c162-d848-a2168378ed1b	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55fb-c162-157d-36a4fd2082e7	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55fb-c162-4440-43c1208083cc	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55fb-c162-27df-ab09786e870b	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55fb-c162-68da-9d38c12164cb	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55fb-c163-b6e7-a50bfa62b03e	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55fb-c163-7007-8cf45a820e11	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55fb-c163-0963-075a6106961d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55fb-c163-bbcb-965f54533303	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55fb-c163-990f-a3c5516c91fe	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55fb-c165-4f9c-3f940c23e7d4	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2936 (class 0 OID 19978701)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55fb-c163-51fd-39419c5bc558	00000000-55fb-c163-b6e7-a50bfa62b03e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55fb-c163-62e8-c91b4b34a8c4	00000000-55fb-c163-b6e7-a50bfa62b03e	00010000-55fb-c162-9460-de03db275ec0	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55fb-c163-d546-d0c80d96baee	00000000-55fb-c163-7007-8cf45a820e11	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2937 (class 0 OID 19978712)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55fb-c163-c069-f18f45b89069	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55fb-c163-8dcf-6b7c84617731	00010000-55fb-c163-a209-b29a9e12f38c	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55fb-c163-be42-8e67cac850f4	00010000-55fb-c163-ce88-150b1fcf05c2	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55fb-c163-6c39-9b71ecde7470	00010000-55fb-c163-1b66-7d5d493a9422	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55fb-c163-38f2-5d292e0f7512	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55fb-c163-5497-902d9bade5ac	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55fb-c163-6cc7-8fc45ca12624	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55fb-c163-3729-64a0a824e057	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55fb-c163-c750-aa6eaa68afd4	00010000-55fb-c163-da72-112c4700564d	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55fb-c163-0d12-e96224a3f282	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55fb-c163-f1cc-a227caa7d008	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55fb-c163-2eee-f1551defe23e	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55fb-c163-a14f-cd8093f62d82	00010000-55fb-c163-f658-67d003db4b6c	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2932 (class 0 OID 19978666)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55fb-c161-c5da-ab6fc138e071	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55fb-c161-e198-612ef7131d3f	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55fb-c161-0abb-56f60f9fc120	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55fb-c161-e577-e3c1d9da0691	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55fb-c161-7faa-c9ec1b8ce945	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55fb-c161-8819-cf77bce08d2f	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55fb-c161-e62b-10890ac8d1b1	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55fb-c161-d0bf-c22cdf8edf1b	Abonma-read	Abonma - branje	f
00030000-55fb-c161-bad6-b56158df288f	Abonma-write	Abonma - spreminjanje	f
00030000-55fb-c161-68bd-a0a69e1769ae	Alternacija-read	Alternacija - branje	f
00030000-55fb-c161-7842-65629580cc6a	Alternacija-write	Alternacija - spreminjanje	f
00030000-55fb-c161-93dd-67f0f1e3eab0	Arhivalija-read	Arhivalija - branje	f
00030000-55fb-c161-35a3-3201eb76d5f9	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55fb-c161-2832-c8aa796b9108	Besedilo-read	Besedilo - branje	f
00030000-55fb-c161-c7b0-b33d1bec5713	Besedilo-write	Besedilo - spreminjanje	f
00030000-55fb-c161-ab57-6f1b55ebbecf	DogodekIzven-read	DogodekIzven - branje	f
00030000-55fb-c161-54a3-dbdfaf79ba2a	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55fb-c161-d87f-4c1bd1ae36a3	Dogodek-read	Dogodek - branje	f
00030000-55fb-c161-0762-0bf99ac736d6	Dogodek-write	Dogodek - spreminjanje	f
00030000-55fb-c161-61b0-881ef0310a73	DrugiVir-read	DrugiVir - branje	f
00030000-55fb-c161-fb27-139c5d39beeb	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55fb-c161-5218-7a033b672429	Drzava-read	Drzava - branje	f
00030000-55fb-c161-f911-3cc3532669eb	Drzava-write	Drzava - spreminjanje	f
00030000-55fb-c161-115d-75956c905646	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55fb-c161-d93c-4343038c4293	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55fb-c161-959a-9df42b647b40	Funkcija-read	Funkcija - branje	f
00030000-55fb-c161-fcf1-e5901629fef7	Funkcija-write	Funkcija - spreminjanje	f
00030000-55fb-c161-8fd2-200a2b3b3c57	Gostovanje-read	Gostovanje - branje	f
00030000-55fb-c161-fc65-51feef2c1b2b	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55fb-c161-378e-25e9e86b94ed	Gostujoca-read	Gostujoca - branje	f
00030000-55fb-c161-c182-7ee4f91ac343	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55fb-c161-a703-7e27665dba00	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55fb-c161-f094-db9e30e34ed1	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55fb-c161-b914-83f5bf407bf7	Kupec-read	Kupec - branje	f
00030000-55fb-c161-544e-3c183465eab2	Kupec-write	Kupec - spreminjanje	f
00030000-55fb-c161-b643-2ebe545f7c72	NacinPlacina-read	NacinPlacina - branje	f
00030000-55fb-c161-6134-9d0afd6fea71	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55fb-c161-733a-146d368d09ee	Option-read	Option - branje	f
00030000-55fb-c161-e570-d6c315545d58	Option-write	Option - spreminjanje	f
00030000-55fb-c161-6e57-038cf300a28e	OptionValue-read	OptionValue - branje	f
00030000-55fb-c161-cedf-601a2bd2f23b	OptionValue-write	OptionValue - spreminjanje	f
00030000-55fb-c161-14a6-19abb5e53ae0	Oseba-read	Oseba - branje	f
00030000-55fb-c161-dbbc-7d06f951677e	Oseba-write	Oseba - spreminjanje	f
00030000-55fb-c161-9bb5-34d4f7f82828	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55fb-c161-5b23-6340a0f06181	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55fb-c161-665b-622fb6a4bce6	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55fb-c161-a79e-145c2a6d5036	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55fb-c161-259f-9e1ef0e453f2	Pogodba-read	Pogodba - branje	f
00030000-55fb-c161-2578-d464b7fd265d	Pogodba-write	Pogodba - spreminjanje	f
00030000-55fb-c161-500c-4eb63cd43270	Popa-read	Popa - branje	f
00030000-55fb-c161-767f-6b9b5dd27a55	Popa-write	Popa - spreminjanje	f
00030000-55fb-c161-1c39-7fdb45f2fc86	Posta-read	Posta - branje	f
00030000-55fb-c161-580e-8a980027abfd	Posta-write	Posta - spreminjanje	f
00030000-55fb-c161-8dd4-edc8f5f7aa6d	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-55fb-c161-24fe-2dde38a7d62d	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-55fb-c161-6190-9328868653af	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55fb-c161-1b03-05f3a8c19c4a	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55fb-c161-52bc-4423e564af8e	PostniNaslov-read	PostniNaslov - branje	f
00030000-55fb-c161-934b-5b7c24aeb3c0	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55fb-c161-f6ee-672d1d7537c5	Predstava-read	Predstava - branje	f
00030000-55fb-c161-d6a7-b34e7de38660	Predstava-write	Predstava - spreminjanje	f
00030000-55fb-c161-84c3-5737e9c94941	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55fb-c161-a7d9-44925ab4d426	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55fb-c161-0daa-5187991db08e	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55fb-c161-7718-709405200567	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55fb-c161-d991-4a92afa90067	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55fb-c161-c9a1-055c7b2c9c18	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55fb-c161-2a1e-bc8136e1f2be	ProgramDela-read	ProgramDela - branje	f
00030000-55fb-c161-247e-7afaa62b2cde	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55fb-c161-1c1e-cb71c2e21228	ProgramFestival-read	ProgramFestival - branje	f
00030000-55fb-c161-c64d-23fc0ef3c1b5	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55fb-c161-14f2-623339a6a0fa	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55fb-c161-aa5b-cf27a73cacdc	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55fb-c161-8033-fef2c2c5fbc1	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55fb-c161-d4c1-345dfbcf8e50	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55fb-c161-0c01-e46336e00f5f	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55fb-c161-9db9-87d4784ebf09	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55fb-c161-d7a5-ef8d22671fdf	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55fb-c161-3072-92f1650592ba	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55fb-c161-7e3e-ca05c20b9335	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55fb-c161-70a8-9ea7e3e872dd	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55fb-c161-e23d-e65c07a75db7	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55fb-c161-b8e8-6d53a6e262da	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55fb-c161-4917-c725d684d62e	ProgramRazno-read	ProgramRazno - branje	f
00030000-55fb-c161-ccf3-b6b6dcac1ec9	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55fb-c161-2458-66167dcd2723	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55fb-c161-8c9f-f053dc6855d2	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55fb-c161-683d-f290b0c5148a	Prostor-read	Prostor - branje	f
00030000-55fb-c161-b847-1552ea9edb1a	Prostor-write	Prostor - spreminjanje	f
00030000-55fb-c161-ddb3-6d9700ad2c76	Racun-read	Racun - branje	f
00030000-55fb-c161-2fab-a68835ba5803	Racun-write	Racun - spreminjanje	f
00030000-55fb-c161-a71d-6197620eb598	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55fb-c161-eb49-0bcdee107cf0	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55fb-c161-aba4-31475e7f694d	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55fb-c161-a74d-fd650384c2f0	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55fb-c161-f1c9-ed666fc2b9bd	Rekvizit-read	Rekvizit - branje	f
00030000-55fb-c161-eb3c-5594c67eee7b	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55fb-c161-9af9-041f73f8897e	Revizija-read	Revizija - branje	f
00030000-55fb-c161-d02e-870d8f294685	Revizija-write	Revizija - spreminjanje	f
00030000-55fb-c161-623f-6631a61badfc	Rezervacija-read	Rezervacija - branje	f
00030000-55fb-c161-8bca-e7013ca10cd2	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55fb-c161-fb2b-a118b41a5b9c	SedezniRed-read	SedezniRed - branje	f
00030000-55fb-c161-1142-d0eb6c061cf5	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55fb-c161-f127-c0a634a8f57c	Sedez-read	Sedez - branje	f
00030000-55fb-c161-6a7c-2f7196b57362	Sedez-write	Sedez - spreminjanje	f
00030000-55fb-c161-3a30-49418dd74861	Sezona-read	Sezona - branje	f
00030000-55fb-c161-7cde-2c652a72c2b1	Sezona-write	Sezona - spreminjanje	f
00030000-55fb-c161-7c76-a9ab5279d444	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55fb-c161-6ed8-d7b236d5f5e1	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55fb-c161-98e6-a36407e7c548	Stevilcenje-read	Stevilcenje - branje	f
00030000-55fb-c161-fa48-c8f963461d98	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55fb-c161-9219-5ef06cb51056	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55fb-c161-2a4e-12c8ef3857a7	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55fb-c162-6e39-10219f923949	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55fb-c162-0f0e-396114d12a9c	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55fb-c162-6fb9-8bdea27b6091	Telefonska-read	Telefonska - branje	f
00030000-55fb-c162-d0f6-942aa1d635c8	Telefonska-write	Telefonska - spreminjanje	f
00030000-55fb-c162-ac73-20e8cc2d9d50	TerminStoritve-read	TerminStoritve - branje	f
00030000-55fb-c162-9a2c-5a4e154ad4e5	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55fb-c162-5f9b-7738dfcd37a2	TipFunkcije-read	TipFunkcije - branje	f
00030000-55fb-c162-d6b6-e0aa23466fe1	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55fb-c162-d670-dbddf7182e8c	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55fb-c162-9870-0bba06d77ecb	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55fb-c162-e8ed-9b8a7b192c73	Trr-read	Trr - branje	f
00030000-55fb-c162-2159-39d4644272bc	Trr-write	Trr - spreminjanje	f
00030000-55fb-c162-b262-a8de81dd60ad	Uprizoritev-read	Uprizoritev - branje	f
00030000-55fb-c162-367d-e47d29c4d1f7	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55fb-c162-c4e0-de70661023bb	Vaja-read	Vaja - branje	f
00030000-55fb-c162-a4e5-e342ff2c91d8	Vaja-write	Vaja - spreminjanje	f
00030000-55fb-c162-aab9-14668c3eb950	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55fb-c162-da99-502eb3758412	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55fb-c162-7346-02c27f225bbe	VrstaStroska-read	VrstaStroska - branje	f
00030000-55fb-c162-7aa3-5ff043b3523d	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55fb-c162-b738-aebf993bd8e4	Zaposlitev-read	Zaposlitev - branje	f
00030000-55fb-c162-ab2b-2ade1c03b555	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55fb-c162-1f19-d2f00e107542	Zasedenost-read	Zasedenost - branje	f
00030000-55fb-c162-fbea-27bac7e226ed	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55fb-c162-1e5f-7a41018411b1	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55fb-c162-611a-652408153337	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55fb-c162-00e9-3af351292fb7	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55fb-c162-d3d9-199aac253fe0	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55fb-c162-928d-d1cac0865840	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55fb-c162-2e8d-9950137d955a	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55fb-c162-0607-f9b799ea9094	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55fb-c162-fd69-accbe6bf1797	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55fb-c162-2f86-342a6f7024cc	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55fb-c162-3e38-2f373abb645c	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55fb-c162-bcd6-4e56cab1ea74	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55fb-c162-100b-968aaf760327	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55fb-c162-87e5-3535daba8ab1	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55fb-c162-d86e-856a545f5abf	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55fb-c162-728a-78ec6b62cc9f	Datoteka-write	Datoteka - spreminjanje	f
00030000-55fb-c162-51a6-0a07b1292ef5	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2934 (class 0 OID 19978685)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55fb-c162-32ff-8a91ac78c185	00030000-55fb-c161-e198-612ef7131d3f
00020000-55fb-c162-3293-40ff967db0d0	00030000-55fb-c161-5218-7a033b672429
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-d0bf-c22cdf8edf1b
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-bad6-b56158df288f
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-68bd-a0a69e1769ae
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-7842-65629580cc6a
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-93dd-67f0f1e3eab0
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-d87f-4c1bd1ae36a3
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-e577-e3c1d9da0691
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-0762-0bf99ac736d6
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-5218-7a033b672429
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-f911-3cc3532669eb
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-959a-9df42b647b40
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-fcf1-e5901629fef7
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-8fd2-200a2b3b3c57
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-fc65-51feef2c1b2b
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-378e-25e9e86b94ed
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-c182-7ee4f91ac343
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-a703-7e27665dba00
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-f094-db9e30e34ed1
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-733a-146d368d09ee
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-6e57-038cf300a28e
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-14a6-19abb5e53ae0
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-dbbc-7d06f951677e
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-500c-4eb63cd43270
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-767f-6b9b5dd27a55
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-1c39-7fdb45f2fc86
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-580e-8a980027abfd
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-52bc-4423e564af8e
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-934b-5b7c24aeb3c0
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-f6ee-672d1d7537c5
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-d6a7-b34e7de38660
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-d991-4a92afa90067
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-c9a1-055c7b2c9c18
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-683d-f290b0c5148a
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-b847-1552ea9edb1a
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-aba4-31475e7f694d
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-a74d-fd650384c2f0
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-f1c9-ed666fc2b9bd
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-eb3c-5594c67eee7b
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-3a30-49418dd74861
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c161-7cde-2c652a72c2b1
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c162-5f9b-7738dfcd37a2
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c162-b262-a8de81dd60ad
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c162-367d-e47d29c4d1f7
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c162-c4e0-de70661023bb
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c162-a4e5-e342ff2c91d8
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c162-1f19-d2f00e107542
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c162-fbea-27bac7e226ed
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c162-1e5f-7a41018411b1
00020000-55fb-c162-92a4-88b033502c3a	00030000-55fb-c162-00e9-3af351292fb7
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c161-d0bf-c22cdf8edf1b
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c161-93dd-67f0f1e3eab0
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c161-d87f-4c1bd1ae36a3
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c161-5218-7a033b672429
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c161-8fd2-200a2b3b3c57
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c161-378e-25e9e86b94ed
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c161-a703-7e27665dba00
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c161-f094-db9e30e34ed1
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c161-733a-146d368d09ee
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c161-6e57-038cf300a28e
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c161-14a6-19abb5e53ae0
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c161-dbbc-7d06f951677e
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c161-500c-4eb63cd43270
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c161-1c39-7fdb45f2fc86
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c161-52bc-4423e564af8e
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c161-934b-5b7c24aeb3c0
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c161-f6ee-672d1d7537c5
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c161-683d-f290b0c5148a
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c161-aba4-31475e7f694d
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c161-f1c9-ed666fc2b9bd
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c161-3a30-49418dd74861
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c162-6fb9-8bdea27b6091
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c162-d0f6-942aa1d635c8
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c162-e8ed-9b8a7b192c73
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c162-2159-39d4644272bc
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c162-b738-aebf993bd8e4
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c162-ab2b-2ade1c03b555
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c162-1e5f-7a41018411b1
00020000-55fb-c162-2373-6cd8803b4d15	00030000-55fb-c162-00e9-3af351292fb7
00020000-55fb-c162-b354-e39602ed303e	00030000-55fb-c161-d0bf-c22cdf8edf1b
00020000-55fb-c162-b354-e39602ed303e	00030000-55fb-c161-68bd-a0a69e1769ae
00020000-55fb-c162-b354-e39602ed303e	00030000-55fb-c161-93dd-67f0f1e3eab0
00020000-55fb-c162-b354-e39602ed303e	00030000-55fb-c161-35a3-3201eb76d5f9
00020000-55fb-c162-b354-e39602ed303e	00030000-55fb-c161-2832-c8aa796b9108
00020000-55fb-c162-b354-e39602ed303e	00030000-55fb-c161-ab57-6f1b55ebbecf
00020000-55fb-c162-b354-e39602ed303e	00030000-55fb-c161-d87f-4c1bd1ae36a3
00020000-55fb-c162-b354-e39602ed303e	00030000-55fb-c161-5218-7a033b672429
00020000-55fb-c162-b354-e39602ed303e	00030000-55fb-c161-959a-9df42b647b40
00020000-55fb-c162-b354-e39602ed303e	00030000-55fb-c161-8fd2-200a2b3b3c57
00020000-55fb-c162-b354-e39602ed303e	00030000-55fb-c161-378e-25e9e86b94ed
00020000-55fb-c162-b354-e39602ed303e	00030000-55fb-c161-a703-7e27665dba00
00020000-55fb-c162-b354-e39602ed303e	00030000-55fb-c161-733a-146d368d09ee
00020000-55fb-c162-b354-e39602ed303e	00030000-55fb-c161-6e57-038cf300a28e
00020000-55fb-c162-b354-e39602ed303e	00030000-55fb-c161-14a6-19abb5e53ae0
00020000-55fb-c162-b354-e39602ed303e	00030000-55fb-c161-500c-4eb63cd43270
00020000-55fb-c162-b354-e39602ed303e	00030000-55fb-c161-1c39-7fdb45f2fc86
00020000-55fb-c162-b354-e39602ed303e	00030000-55fb-c161-f6ee-672d1d7537c5
00020000-55fb-c162-b354-e39602ed303e	00030000-55fb-c161-d991-4a92afa90067
00020000-55fb-c162-b354-e39602ed303e	00030000-55fb-c161-683d-f290b0c5148a
00020000-55fb-c162-b354-e39602ed303e	00030000-55fb-c161-aba4-31475e7f694d
00020000-55fb-c162-b354-e39602ed303e	00030000-55fb-c161-f1c9-ed666fc2b9bd
00020000-55fb-c162-b354-e39602ed303e	00030000-55fb-c161-3a30-49418dd74861
00020000-55fb-c162-b354-e39602ed303e	00030000-55fb-c162-5f9b-7738dfcd37a2
00020000-55fb-c162-b354-e39602ed303e	00030000-55fb-c162-c4e0-de70661023bb
00020000-55fb-c162-b354-e39602ed303e	00030000-55fb-c162-1f19-d2f00e107542
00020000-55fb-c162-b354-e39602ed303e	00030000-55fb-c162-1e5f-7a41018411b1
00020000-55fb-c162-b354-e39602ed303e	00030000-55fb-c162-00e9-3af351292fb7
00020000-55fb-c162-87d5-26dc50ee9800	00030000-55fb-c161-d0bf-c22cdf8edf1b
00020000-55fb-c162-87d5-26dc50ee9800	00030000-55fb-c161-bad6-b56158df288f
00020000-55fb-c162-87d5-26dc50ee9800	00030000-55fb-c161-7842-65629580cc6a
00020000-55fb-c162-87d5-26dc50ee9800	00030000-55fb-c161-93dd-67f0f1e3eab0
00020000-55fb-c162-87d5-26dc50ee9800	00030000-55fb-c161-d87f-4c1bd1ae36a3
00020000-55fb-c162-87d5-26dc50ee9800	00030000-55fb-c161-5218-7a033b672429
00020000-55fb-c162-87d5-26dc50ee9800	00030000-55fb-c161-8fd2-200a2b3b3c57
00020000-55fb-c162-87d5-26dc50ee9800	00030000-55fb-c161-378e-25e9e86b94ed
00020000-55fb-c162-87d5-26dc50ee9800	00030000-55fb-c161-733a-146d368d09ee
00020000-55fb-c162-87d5-26dc50ee9800	00030000-55fb-c161-6e57-038cf300a28e
00020000-55fb-c162-87d5-26dc50ee9800	00030000-55fb-c161-500c-4eb63cd43270
00020000-55fb-c162-87d5-26dc50ee9800	00030000-55fb-c161-1c39-7fdb45f2fc86
00020000-55fb-c162-87d5-26dc50ee9800	00030000-55fb-c161-f6ee-672d1d7537c5
00020000-55fb-c162-87d5-26dc50ee9800	00030000-55fb-c161-683d-f290b0c5148a
00020000-55fb-c162-87d5-26dc50ee9800	00030000-55fb-c161-aba4-31475e7f694d
00020000-55fb-c162-87d5-26dc50ee9800	00030000-55fb-c161-f1c9-ed666fc2b9bd
00020000-55fb-c162-87d5-26dc50ee9800	00030000-55fb-c161-3a30-49418dd74861
00020000-55fb-c162-87d5-26dc50ee9800	00030000-55fb-c162-5f9b-7738dfcd37a2
00020000-55fb-c162-87d5-26dc50ee9800	00030000-55fb-c162-1e5f-7a41018411b1
00020000-55fb-c162-87d5-26dc50ee9800	00030000-55fb-c162-00e9-3af351292fb7
00020000-55fb-c162-ea77-7c4cb1674612	00030000-55fb-c161-d0bf-c22cdf8edf1b
00020000-55fb-c162-ea77-7c4cb1674612	00030000-55fb-c161-93dd-67f0f1e3eab0
00020000-55fb-c162-ea77-7c4cb1674612	00030000-55fb-c161-d87f-4c1bd1ae36a3
00020000-55fb-c162-ea77-7c4cb1674612	00030000-55fb-c161-5218-7a033b672429
00020000-55fb-c162-ea77-7c4cb1674612	00030000-55fb-c161-8fd2-200a2b3b3c57
00020000-55fb-c162-ea77-7c4cb1674612	00030000-55fb-c161-378e-25e9e86b94ed
00020000-55fb-c162-ea77-7c4cb1674612	00030000-55fb-c161-733a-146d368d09ee
00020000-55fb-c162-ea77-7c4cb1674612	00030000-55fb-c161-6e57-038cf300a28e
00020000-55fb-c162-ea77-7c4cb1674612	00030000-55fb-c161-500c-4eb63cd43270
00020000-55fb-c162-ea77-7c4cb1674612	00030000-55fb-c161-1c39-7fdb45f2fc86
00020000-55fb-c162-ea77-7c4cb1674612	00030000-55fb-c161-f6ee-672d1d7537c5
00020000-55fb-c162-ea77-7c4cb1674612	00030000-55fb-c161-683d-f290b0c5148a
00020000-55fb-c162-ea77-7c4cb1674612	00030000-55fb-c161-aba4-31475e7f694d
00020000-55fb-c162-ea77-7c4cb1674612	00030000-55fb-c161-f1c9-ed666fc2b9bd
00020000-55fb-c162-ea77-7c4cb1674612	00030000-55fb-c161-3a30-49418dd74861
00020000-55fb-c162-ea77-7c4cb1674612	00030000-55fb-c162-ac73-20e8cc2d9d50
00020000-55fb-c162-ea77-7c4cb1674612	00030000-55fb-c161-0abb-56f60f9fc120
00020000-55fb-c162-ea77-7c4cb1674612	00030000-55fb-c162-5f9b-7738dfcd37a2
00020000-55fb-c162-ea77-7c4cb1674612	00030000-55fb-c162-1e5f-7a41018411b1
00020000-55fb-c162-ea77-7c4cb1674612	00030000-55fb-c162-00e9-3af351292fb7
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-c5da-ab6fc138e071
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-e198-612ef7131d3f
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-0abb-56f60f9fc120
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-e577-e3c1d9da0691
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-7faa-c9ec1b8ce945
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-8819-cf77bce08d2f
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-e62b-10890ac8d1b1
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-d0bf-c22cdf8edf1b
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-bad6-b56158df288f
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-68bd-a0a69e1769ae
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-7842-65629580cc6a
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-93dd-67f0f1e3eab0
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-35a3-3201eb76d5f9
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-2832-c8aa796b9108
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-c7b0-b33d1bec5713
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-ab57-6f1b55ebbecf
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-54a3-dbdfaf79ba2a
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-d87f-4c1bd1ae36a3
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-0762-0bf99ac736d6
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-5218-7a033b672429
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-f911-3cc3532669eb
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-61b0-881ef0310a73
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-fb27-139c5d39beeb
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-115d-75956c905646
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-d93c-4343038c4293
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-959a-9df42b647b40
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-fcf1-e5901629fef7
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-8fd2-200a2b3b3c57
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-fc65-51feef2c1b2b
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-378e-25e9e86b94ed
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-c182-7ee4f91ac343
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-a703-7e27665dba00
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-f094-db9e30e34ed1
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-b914-83f5bf407bf7
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-544e-3c183465eab2
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-b643-2ebe545f7c72
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-6134-9d0afd6fea71
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-733a-146d368d09ee
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-e570-d6c315545d58
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-6e57-038cf300a28e
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-cedf-601a2bd2f23b
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-14a6-19abb5e53ae0
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-dbbc-7d06f951677e
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-9bb5-34d4f7f82828
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-5b23-6340a0f06181
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-665b-622fb6a4bce6
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-a79e-145c2a6d5036
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-259f-9e1ef0e453f2
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-2578-d464b7fd265d
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-500c-4eb63cd43270
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-767f-6b9b5dd27a55
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-1c39-7fdb45f2fc86
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-580e-8a980027abfd
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-8dd4-edc8f5f7aa6d
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-24fe-2dde38a7d62d
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-6190-9328868653af
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-1b03-05f3a8c19c4a
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-52bc-4423e564af8e
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-934b-5b7c24aeb3c0
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-f6ee-672d1d7537c5
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-d6a7-b34e7de38660
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-84c3-5737e9c94941
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-a7d9-44925ab4d426
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-0daa-5187991db08e
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-7718-709405200567
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-d991-4a92afa90067
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-c9a1-055c7b2c9c18
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-2a1e-bc8136e1f2be
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-247e-7afaa62b2cde
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-1c1e-cb71c2e21228
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-c64d-23fc0ef3c1b5
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-14f2-623339a6a0fa
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-aa5b-cf27a73cacdc
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-8033-fef2c2c5fbc1
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-d4c1-345dfbcf8e50
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-0c01-e46336e00f5f
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-9db9-87d4784ebf09
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-d7a5-ef8d22671fdf
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-3072-92f1650592ba
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-7e3e-ca05c20b9335
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-70a8-9ea7e3e872dd
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-e23d-e65c07a75db7
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-b8e8-6d53a6e262da
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-4917-c725d684d62e
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-ccf3-b6b6dcac1ec9
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-2458-66167dcd2723
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-8c9f-f053dc6855d2
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-683d-f290b0c5148a
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-b847-1552ea9edb1a
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-ddb3-6d9700ad2c76
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-2fab-a68835ba5803
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-a71d-6197620eb598
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-eb49-0bcdee107cf0
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-aba4-31475e7f694d
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-a74d-fd650384c2f0
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-f1c9-ed666fc2b9bd
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-eb3c-5594c67eee7b
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-9af9-041f73f8897e
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-d02e-870d8f294685
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-623f-6631a61badfc
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-8bca-e7013ca10cd2
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-fb2b-a118b41a5b9c
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-1142-d0eb6c061cf5
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-f127-c0a634a8f57c
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-6a7c-2f7196b57362
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-3a30-49418dd74861
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-7cde-2c652a72c2b1
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-7c76-a9ab5279d444
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-6ed8-d7b236d5f5e1
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-98e6-a36407e7c548
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-fa48-c8f963461d98
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-9219-5ef06cb51056
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c161-2a4e-12c8ef3857a7
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c162-6e39-10219f923949
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c162-0f0e-396114d12a9c
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c162-6fb9-8bdea27b6091
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c162-d0f6-942aa1d635c8
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c162-ac73-20e8cc2d9d50
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c162-9a2c-5a4e154ad4e5
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c162-5f9b-7738dfcd37a2
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c162-d6b6-e0aa23466fe1
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c162-d670-dbddf7182e8c
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c162-9870-0bba06d77ecb
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c162-e8ed-9b8a7b192c73
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c162-2159-39d4644272bc
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c162-b262-a8de81dd60ad
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c162-367d-e47d29c4d1f7
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c162-c4e0-de70661023bb
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c162-a4e5-e342ff2c91d8
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c162-aab9-14668c3eb950
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c162-da99-502eb3758412
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c162-7346-02c27f225bbe
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c162-7aa3-5ff043b3523d
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c162-b738-aebf993bd8e4
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c162-ab2b-2ade1c03b555
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c162-1f19-d2f00e107542
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c162-fbea-27bac7e226ed
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c162-1e5f-7a41018411b1
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c162-611a-652408153337
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c162-00e9-3af351292fb7
00020000-55fb-c163-58b4-35370784b9c6	00030000-55fb-c162-d3d9-199aac253fe0
\.


--
-- TOC entry 2961 (class 0 OID 19978983)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 19979017)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 19979146)
-- Dependencies: 222
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55fb-c163-7e6c-02bf4d3e4c80	00090000-55fb-c163-c069-f18f45b89069	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55fb-c163-db5b-099a0f3eca29	00090000-55fb-c163-5497-902d9bade5ac	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55fb-c163-d2fd-c8af3cd48465	00090000-55fb-c163-a14f-cd8093f62d82	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55fb-c163-0e77-87b2c8d81f50	00090000-55fb-c163-0d12-e96224a3f282	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2939 (class 0 OID 19978745)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55fb-c163-8340-86dde68eabe5	00040000-55fb-c161-1c79-2fd176ab8916	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-c163-4777-7e1cad08146a	00040000-55fb-c161-1c79-2fd176ab8916	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55fb-c163-fb63-234ab7ed9243	00040000-55fb-c161-1c79-2fd176ab8916	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-c163-5366-808aa20e03dc	00040000-55fb-c161-1c79-2fd176ab8916	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-c163-5394-956a89528b47	00040000-55fb-c161-1c79-2fd176ab8916	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-c163-b3eb-7134e42ffb7c	00040000-55fb-c161-4058-05f9bfcfdea8	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-c163-0f18-aafff7f13a1e	00040000-55fb-c161-ca48-77908f67b46b	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-c163-f9b2-cbc0866a631e	00040000-55fb-c161-989f-b9c0b2a1cfb8	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-c163-fb41-cb4b312d9fd2	00040000-55fb-c161-0c42-4c0e551e79a8	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55fb-c165-6813-b1bf2e9dc92c	00040000-55fb-c161-1c79-2fd176ab8916	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2941 (class 0 OID 19978779)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55fb-c161-442c-dabdcc3e66d4	8341	Adlešiči
00050000-55fb-c161-ded7-9746e7666341	5270	Ajdovščina
00050000-55fb-c161-aba3-a0dc18d4a5d3	6280	Ankaran/Ancarano
00050000-55fb-c161-b6db-cda47d0ba6fd	9253	Apače
00050000-55fb-c161-f658-49f5bf73978d	8253	Artiče
00050000-55fb-c161-a95d-88e87b2fd0f3	4275	Begunje na Gorenjskem
00050000-55fb-c161-50d5-684f5cc8a51c	1382	Begunje pri Cerknici
00050000-55fb-c161-6856-e792be0ebbd1	9231	Beltinci
00050000-55fb-c161-6c0f-1b0c0c9ef04c	2234	Benedikt
00050000-55fb-c161-d1f4-95b9906f113f	2345	Bistrica ob Dravi
00050000-55fb-c161-fca4-086d4d475ad2	3256	Bistrica ob Sotli
00050000-55fb-c161-3845-9db8119129ad	8259	Bizeljsko
00050000-55fb-c161-3f4b-b5978b4bf814	1223	Blagovica
00050000-55fb-c161-d5d2-b79a3f6ca4fb	8283	Blanca
00050000-55fb-c161-6b8a-cb2b2dee7ab7	4260	Bled
00050000-55fb-c161-b87e-f18fda89ffbd	4273	Blejska Dobrava
00050000-55fb-c161-a1b5-3d31d75865b8	9265	Bodonci
00050000-55fb-c161-630f-c294d622a32a	9222	Bogojina
00050000-55fb-c161-fcb1-5f6075ea05b3	4263	Bohinjska Bela
00050000-55fb-c161-bfb6-f44c8aff2c36	4264	Bohinjska Bistrica
00050000-55fb-c161-3c10-2b38bc8da438	4265	Bohinjsko jezero
00050000-55fb-c161-b748-7b0e7c9ae98e	1353	Borovnica
00050000-55fb-c161-55d1-0c623f53873c	8294	Boštanj
00050000-55fb-c161-cbf4-02cb922bba25	5230	Bovec
00050000-55fb-c161-914d-c9673761bf31	5295	Branik
00050000-55fb-c161-841e-69d783f27d4a	3314	Braslovče
00050000-55fb-c161-36b9-aabca0348c3c	5223	Breginj
00050000-55fb-c161-35c2-3e07d35e0c83	8280	Brestanica
00050000-55fb-c161-c4ed-e9d008556bc4	2354	Bresternica
00050000-55fb-c161-b57f-f1bb445a0550	4243	Brezje
00050000-55fb-c161-b1e8-b2eee38eb217	1351	Brezovica pri Ljubljani
00050000-55fb-c161-139b-8927c8c3a89b	8250	Brežice
00050000-55fb-c161-c7d8-e53830dc2080	4210	Brnik - Aerodrom
00050000-55fb-c161-2693-15a22caf4290	8321	Brusnice
00050000-55fb-c161-8135-1f89fa707592	3255	Buče
00050000-55fb-c161-51a9-29bd89035861	8276	Bučka 
00050000-55fb-c161-2091-5994562f5ffe	9261	Cankova
00050000-55fb-c161-1143-c45d3cf9d89d	3000	Celje 
00050000-55fb-c161-d149-d48121cd8162	3001	Celje - poštni predali
00050000-55fb-c161-a481-1e115a105a59	4207	Cerklje na Gorenjskem
00050000-55fb-c161-c5e0-920abca0b6cb	8263	Cerklje ob Krki
00050000-55fb-c161-12fe-078e1749e500	1380	Cerknica
00050000-55fb-c161-6199-fd43dc5fe3e1	5282	Cerkno
00050000-55fb-c161-136e-b7cd0676bcce	2236	Cerkvenjak
00050000-55fb-c161-32a6-7671ecd62932	2215	Ceršak
00050000-55fb-c161-2a7d-564159cde585	2326	Cirkovce
00050000-55fb-c161-829e-17ac47a53e1f	2282	Cirkulane
00050000-55fb-c161-e054-ff49b646c5db	5273	Col
00050000-55fb-c161-d71a-36f3cab5f418	8251	Čatež ob Savi
00050000-55fb-c161-d9af-f8f36baabbc4	1413	Čemšenik
00050000-55fb-c161-1b8e-18e577bfdf13	5253	Čepovan
00050000-55fb-c161-c161-2a916a33a67f	9232	Črenšovci
00050000-55fb-c161-daa7-4ca67438f964	2393	Črna na Koroškem
00050000-55fb-c161-83ce-2a18714d4086	6275	Črni Kal
00050000-55fb-c161-4e34-36e07249d01e	5274	Črni Vrh nad Idrijo
00050000-55fb-c161-7e19-f25f05a46477	5262	Črniče
00050000-55fb-c161-3dac-14226a40e811	8340	Črnomelj
00050000-55fb-c161-01e3-a27ef6626da8	6271	Dekani
00050000-55fb-c161-caa0-ae4c83d07f2c	5210	Deskle
00050000-55fb-c161-f54e-510257504039	2253	Destrnik
00050000-55fb-c161-ce01-8965614ea880	6215	Divača
00050000-55fb-c161-b69f-1f70aadc85b6	1233	Dob
00050000-55fb-c161-8810-e6c684feb171	3224	Dobje pri Planini
00050000-55fb-c161-fb48-cb0a460f8190	8257	Dobova
00050000-55fb-c161-ff63-dc0743637e73	1423	Dobovec
00050000-55fb-c161-4797-670020c0d2e4	5263	Dobravlje
00050000-55fb-c161-fa1c-64b1a384671d	3204	Dobrna
00050000-55fb-c161-4f66-ac3520d79982	8211	Dobrnič
00050000-55fb-c161-b873-c4131a99241d	1356	Dobrova
00050000-55fb-c161-44af-b38120d488e5	9223	Dobrovnik/Dobronak 
00050000-55fb-c161-b850-edfe070ae335	5212	Dobrovo v Brdih
00050000-55fb-c161-5c66-5505e2737263	1431	Dol pri Hrastniku
00050000-55fb-c161-fc69-1d25f7bb848a	1262	Dol pri Ljubljani
00050000-55fb-c161-005a-717f85c66911	1273	Dole pri Litiji
00050000-55fb-c161-fc5a-896673e54cf7	1331	Dolenja vas
00050000-55fb-c161-df64-b3c638a8888b	8350	Dolenjske Toplice
00050000-55fb-c161-1668-a695c181c31a	1230	Domžale
00050000-55fb-c161-d211-d2acca02dbda	2252	Dornava
00050000-55fb-c161-d7b7-1e992cddc5b7	5294	Dornberk
00050000-55fb-c161-a0cf-4effa8d53e36	1319	Draga
00050000-55fb-c161-fc5f-dea237d233dd	8343	Dragatuš
00050000-55fb-c161-8fb2-d786ed02c0a8	3222	Dramlje
00050000-55fb-c161-93e4-bfdd73fd01b0	2370	Dravograd
00050000-55fb-c161-3a6a-fa3fd383954b	4203	Duplje
00050000-55fb-c161-dd33-ccf46fb12ba1	6221	Dutovlje
00050000-55fb-c161-13ca-1261ae51b738	8361	Dvor
00050000-55fb-c161-c5c7-f223ad26101a	2343	Fala
00050000-55fb-c161-34e4-adbe10a26ad3	9208	Fokovci
00050000-55fb-c161-92dd-777f4b559804	2313	Fram
00050000-55fb-c161-6b82-b1c10cc7af59	3213	Frankolovo
00050000-55fb-c161-779d-714f6d155659	1274	Gabrovka
00050000-55fb-c161-8b3f-5050899cea8c	8254	Globoko
00050000-55fb-c161-3634-c8a494aa2ec5	5275	Godovič
00050000-55fb-c161-0218-64387cea15dc	4204	Golnik
00050000-55fb-c161-a796-41e1a44ec835	3303	Gomilsko
00050000-55fb-c161-c655-4f44799576a8	4224	Gorenja vas
00050000-55fb-c161-048d-ecd4c465b980	3263	Gorica pri Slivnici
00050000-55fb-c161-dd88-1eec53faf9d1	2272	Gorišnica
00050000-55fb-c161-fb69-d1d7a8183748	9250	Gornja Radgona
00050000-55fb-c161-6c76-8a698203d560	3342	Gornji Grad
00050000-55fb-c161-86e3-991508e81dbd	4282	Gozd Martuljek
00050000-55fb-c161-3d31-4df1e75e76c1	6272	Gračišče
00050000-55fb-c161-b18d-b7d760aeda48	9264	Grad
00050000-55fb-c161-ed20-300943e40726	8332	Gradac
00050000-55fb-c161-7a18-5f8b1b92986c	1384	Grahovo
00050000-55fb-c161-af5c-5258841610c6	5242	Grahovo ob Bači
00050000-55fb-c161-f90b-79d0eb571938	5251	Grgar
00050000-55fb-c161-edbe-2966d6222867	3302	Griže
00050000-55fb-c161-ee0e-71934d721859	3231	Grobelno
00050000-55fb-c161-2fda-be4ade9f188a	1290	Grosuplje
00050000-55fb-c161-4545-38a4057c6803	2288	Hajdina
00050000-55fb-c161-d7c6-c464d6e6b193	8362	Hinje
00050000-55fb-c161-7030-cb3cf3cdb0de	2311	Hoče
00050000-55fb-c161-6afd-353e47112aa2	9205	Hodoš/Hodos
00050000-55fb-c161-a0e0-f63da20a49aa	1354	Horjul
00050000-55fb-c161-ded1-72f45b64b1dc	1372	Hotedršica
00050000-55fb-c161-dd6b-79116b6b6745	1430	Hrastnik
00050000-55fb-c161-f619-172fa6eb3498	6225	Hruševje
00050000-55fb-c161-2310-747f5d8ca5da	4276	Hrušica
00050000-55fb-c161-cafc-0c8f118ac9d9	5280	Idrija
00050000-55fb-c161-691c-9a7b4c1c34aa	1292	Ig
00050000-55fb-c161-c5c4-62d0b6315904	6250	Ilirska Bistrica
00050000-55fb-c161-bc8d-92037eabe22d	6251	Ilirska Bistrica-Trnovo
00050000-55fb-c161-ab7c-16207ae43bbf	1295	Ivančna Gorica
00050000-55fb-c161-a46f-49c7e6c3aad3	2259	Ivanjkovci
00050000-55fb-c161-6e02-4a8d79dccb7b	1411	Izlake
00050000-55fb-c161-8923-aa6f8889a224	6310	Izola/Isola
00050000-55fb-c161-e056-eabef55e35d7	2222	Jakobski Dol
00050000-55fb-c161-78c4-48c6f20968ac	2221	Jarenina
00050000-55fb-c161-6038-fb46ede5069d	6254	Jelšane
00050000-55fb-c161-f60d-9f67091b38f5	4270	Jesenice
00050000-55fb-c161-f6a7-ab98213aa66a	8261	Jesenice na Dolenjskem
00050000-55fb-c161-7821-2c1c43111543	3273	Jurklošter
00050000-55fb-c161-9206-10c567671551	2223	Jurovski Dol
00050000-55fb-c161-7d46-a1d5bbc746a9	2256	Juršinci
00050000-55fb-c161-dfde-a63d359a05b6	5214	Kal nad Kanalom
00050000-55fb-c161-3dbe-a9af9f8352a5	3233	Kalobje
00050000-55fb-c161-ff15-0759e6ae760c	4246	Kamna Gorica
00050000-55fb-c161-d93d-a6a466b7ec41	2351	Kamnica
00050000-55fb-c161-61ab-94931725e9cf	1241	Kamnik
00050000-55fb-c161-ddbb-6056822eaca0	5213	Kanal
00050000-55fb-c161-f467-ddc9e60364cc	8258	Kapele
00050000-55fb-c161-4b7d-0b2ac1609967	2362	Kapla
00050000-55fb-c161-0faa-a701011a6f05	2325	Kidričevo
00050000-55fb-c161-4698-d2d1425a2cae	1412	Kisovec
00050000-55fb-c161-7afc-2e6fd99c19b0	6253	Knežak
00050000-55fb-c161-3136-4540fd95fa01	5222	Kobarid
00050000-55fb-c161-f774-2db36a3ba206	9227	Kobilje
00050000-55fb-c161-1af0-5977fb9cf4a2	1330	Kočevje
00050000-55fb-c161-c6af-782ee78552b7	1338	Kočevska Reka
00050000-55fb-c161-49e4-8e89b7f595c3	2276	Kog
00050000-55fb-c161-c968-bcefe15fa0a7	5211	Kojsko
00050000-55fb-c161-c6a0-500d43d249f8	6223	Komen
00050000-55fb-c161-0ee8-0edc90ee3c9b	1218	Komenda
00050000-55fb-c161-0b14-17dd228ef74c	6000	Koper/Capodistria 
00050000-55fb-c161-ce24-3a3269139bea	6001	Koper/Capodistria - poštni predali
00050000-55fb-c161-46ac-c76842245806	8282	Koprivnica
00050000-55fb-c161-8c33-76f2d02ef4b4	5296	Kostanjevica na Krasu
00050000-55fb-c161-f759-d259c0b10fbc	8311	Kostanjevica na Krki
00050000-55fb-c161-ba2f-dca99fd8864b	1336	Kostel
00050000-55fb-c161-7955-a2da483a8e84	6256	Košana
00050000-55fb-c161-6aee-a10e7e953274	2394	Kotlje
00050000-55fb-c161-14ea-aa50b73bf63e	6240	Kozina
00050000-55fb-c161-4697-9899d62bea8c	3260	Kozje
00050000-55fb-c161-0b74-ff84249070df	4000	Kranj 
00050000-55fb-c161-91f1-78b5219882c1	4001	Kranj - poštni predali
00050000-55fb-c161-238f-2804d5cff124	4280	Kranjska Gora
00050000-55fb-c161-e480-fd1365632b5c	1281	Kresnice
00050000-55fb-c161-1d39-dc6dc00850ee	4294	Križe
00050000-55fb-c161-59db-33e67daefb19	9206	Križevci
00050000-55fb-c161-1ba8-43265fd6fdfa	9242	Križevci pri Ljutomeru
00050000-55fb-c161-320a-30c768421b93	1301	Krka
00050000-55fb-c161-0880-adc00a6df6d3	8296	Krmelj
00050000-55fb-c161-562b-af5a60a113ca	4245	Kropa
00050000-55fb-c161-cd2d-6520d292ada3	8262	Krška vas
00050000-55fb-c161-62f6-8ccee2731db1	8270	Krško
00050000-55fb-c161-1aad-f3d74755562c	9263	Kuzma
00050000-55fb-c161-bfd3-01f9bf276268	2318	Laporje
00050000-55fb-c161-6bbe-b9d23cf32aad	3270	Laško
00050000-55fb-c161-a3a5-c6dce8eb734e	1219	Laze v Tuhinju
00050000-55fb-c161-04b7-5c384f4e97a3	2230	Lenart v Slovenskih goricah
00050000-55fb-c161-63ac-1875d0198194	9220	Lendava/Lendva
00050000-55fb-c161-de9a-505147e9b9f1	4248	Lesce
00050000-55fb-c161-b6f0-982016e4ed1b	3261	Lesično
00050000-55fb-c161-3d14-e42235a15dab	8273	Leskovec pri Krškem
00050000-55fb-c161-d027-1057979df9c6	2372	Libeliče
00050000-55fb-c161-513a-e5dda154670f	2341	Limbuš
00050000-55fb-c161-cf9d-af51a9551fd4	1270	Litija
00050000-55fb-c161-dfb0-9f3e040d5822	3202	Ljubečna
00050000-55fb-c161-eacc-c1929449f70f	1000	Ljubljana 
00050000-55fb-c161-34cb-58617a6ac85a	1001	Ljubljana - poštni predali
00050000-55fb-c161-f006-eceedfb83d16	1231	Ljubljana - Črnuče
00050000-55fb-c161-29b8-14039f07aabf	1261	Ljubljana - Dobrunje
00050000-55fb-c161-c9dc-851d19570753	1260	Ljubljana - Polje
00050000-55fb-c161-8bb2-4d13ac31ad9c	1210	Ljubljana - Šentvid
00050000-55fb-c161-c3de-f976548744ac	1211	Ljubljana - Šmartno
00050000-55fb-c161-ef4d-0afc7507ddf4	3333	Ljubno ob Savinji
00050000-55fb-c161-1c1c-552366a8f6bd	9240	Ljutomer
00050000-55fb-c161-43c4-a1efd1c6bea1	3215	Loče
00050000-55fb-c161-d32f-598f6731589f	5231	Log pod Mangartom
00050000-55fb-c161-9003-44e37323a678	1358	Log pri Brezovici
00050000-55fb-c161-764f-aed053df9771	1370	Logatec
00050000-55fb-c161-896b-df6bebcd6ea0	1371	Logatec
00050000-55fb-c161-5387-0b4bbb44238b	1434	Loka pri Zidanem Mostu
00050000-55fb-c161-d90f-3da15aff8c41	3223	Loka pri Žusmu
00050000-55fb-c161-0507-8b0b3b46b9e2	6219	Lokev
00050000-55fb-c161-01cd-b8e0d90e5919	1318	Loški Potok
00050000-55fb-c161-4783-594bc56106d9	2324	Lovrenc na Dravskem polju
00050000-55fb-c161-444f-b980870eaf1e	2344	Lovrenc na Pohorju
00050000-55fb-c161-6fc2-a31f33b97a85	3334	Luče
00050000-55fb-c161-263e-5134cd41f138	1225	Lukovica
00050000-55fb-c161-5767-109f20e09ad2	9202	Mačkovci
00050000-55fb-c161-f52a-5839c20c2a2a	2322	Majšperk
00050000-55fb-c161-1882-724ef5057c6b	2321	Makole
00050000-55fb-c161-4cba-e7710003c807	9243	Mala Nedelja
00050000-55fb-c161-2649-e8cc111da686	2229	Malečnik
00050000-55fb-c161-2933-df6f4f488e6d	6273	Marezige
00050000-55fb-c161-bb3b-c3f669a3a2d5	2000	Maribor 
00050000-55fb-c161-06ca-aedb6ba8d3e2	2001	Maribor - poštni predali
00050000-55fb-c161-d141-94c62ea9ca78	2206	Marjeta na Dravskem polju
00050000-55fb-c161-9436-ff68e2d7ca3a	2281	Markovci
00050000-55fb-c161-7841-5343903ea51d	9221	Martjanci
00050000-55fb-c161-ed90-04023c94a98e	6242	Materija
00050000-55fb-c161-95e7-a784732e4eec	4211	Mavčiče
00050000-55fb-c161-d829-3343caa36c73	1215	Medvode
00050000-55fb-c161-2898-c37db6d37996	1234	Mengeš
00050000-55fb-c161-0ebe-2315a5165f4f	8330	Metlika
00050000-55fb-c161-0162-f20756b56b8a	2392	Mežica
00050000-55fb-c161-efb1-c88b6612c162	2204	Miklavž na Dravskem polju
00050000-55fb-c161-4e2c-e6a848af94e9	2275	Miklavž pri Ormožu
00050000-55fb-c161-50da-2ddead71a47d	5291	Miren
00050000-55fb-c161-eeb3-6b172e53a930	8233	Mirna
00050000-55fb-c161-db1e-06cc1888e9be	8216	Mirna Peč
00050000-55fb-c161-f5c8-f25693a13737	2382	Mislinja
00050000-55fb-c161-e02a-4a786f7bb97f	4281	Mojstrana
00050000-55fb-c161-90d8-db9d92529db3	8230	Mokronog
00050000-55fb-c161-9fe8-7fce7f3c1cf7	1251	Moravče
00050000-55fb-c161-d59d-76dbc910ce45	9226	Moravske Toplice
00050000-55fb-c161-9fcc-ef35168b4381	5216	Most na Soči
00050000-55fb-c161-e5e3-2685da515e53	1221	Motnik
00050000-55fb-c161-ff11-91bab35fe04e	3330	Mozirje
00050000-55fb-c161-d6d6-cfbfbf7a6fd6	9000	Murska Sobota 
00050000-55fb-c161-5b5f-600c8334e827	9001	Murska Sobota - poštni predali
00050000-55fb-c161-4a34-08461ddf3bc3	2366	Muta
00050000-55fb-c161-e607-f02ddedf1ad8	4202	Naklo
00050000-55fb-c161-49ec-e51b7a3d26e0	3331	Nazarje
00050000-55fb-c161-7812-350e8467af60	1357	Notranje Gorice
00050000-55fb-c161-c5c9-3b4225b25ced	3203	Nova Cerkev
00050000-55fb-c161-e769-b191a8c6eb68	5000	Nova Gorica 
00050000-55fb-c161-9a8b-d32e10fe4dd0	5001	Nova Gorica - poštni predali
00050000-55fb-c161-8a78-15286392d7d6	1385	Nova vas
00050000-55fb-c161-6d35-1fc18a52c823	8000	Novo mesto
00050000-55fb-c161-7eb7-f4632c7727ba	8001	Novo mesto - poštni predali
00050000-55fb-c161-55f6-b1eb03f90f62	6243	Obrov
00050000-55fb-c161-8952-586b6e03fe9c	9233	Odranci
00050000-55fb-c161-7c4d-3b06eee628c6	2317	Oplotnica
00050000-55fb-c161-fb7f-9d9183828fde	2312	Orehova vas
00050000-55fb-c161-658f-70bb00c6bf3b	2270	Ormož
00050000-55fb-c161-be40-c912ed23278c	1316	Ortnek
00050000-55fb-c161-a50d-50491a0899db	1337	Osilnica
00050000-55fb-c161-b069-61bc5aec02e1	8222	Otočec
00050000-55fb-c161-3234-ecc7c5c8b735	2361	Ožbalt
00050000-55fb-c161-c8a0-0e3fb39e233d	2231	Pernica
00050000-55fb-c161-f777-ebfba5e71fde	2211	Pesnica pri Mariboru
00050000-55fb-c161-a9e8-a781311d213e	9203	Petrovci
00050000-55fb-c161-2663-3d922b52841e	3301	Petrovče
00050000-55fb-c161-9c9e-03f03961f076	6330	Piran/Pirano
00050000-55fb-c161-8355-ba4abe5dc380	8255	Pišece
00050000-55fb-c161-d161-24e642f7d4d2	6257	Pivka
00050000-55fb-c161-75eb-a25b023bc837	6232	Planina
00050000-55fb-c161-9356-2f72755b786b	3225	Planina pri Sevnici
00050000-55fb-c161-8b43-1638f7c45404	6276	Pobegi
00050000-55fb-c161-0604-156f9e0a4854	8312	Podbočje
00050000-55fb-c161-f75c-4e5f9c7182c6	5243	Podbrdo
00050000-55fb-c161-80ed-49b4b51c9b50	3254	Podčetrtek
00050000-55fb-c161-e227-00688bd1e8a7	2273	Podgorci
00050000-55fb-c161-ee40-8fc410977f79	6216	Podgorje
00050000-55fb-c161-fb4a-d220e553ba04	2381	Podgorje pri Slovenj Gradcu
00050000-55fb-c161-647a-8d43b6925c5d	6244	Podgrad
00050000-55fb-c161-1ddb-653dcc00600d	1414	Podkum
00050000-55fb-c161-e329-8f1c54879d52	2286	Podlehnik
00050000-55fb-c161-af3e-9f612217028f	5272	Podnanos
00050000-55fb-c161-20fb-9020a99bb25c	4244	Podnart
00050000-55fb-c161-9797-8bebbeae6bdc	3241	Podplat
00050000-55fb-c161-18b7-f804b2cd03c9	3257	Podsreda
00050000-55fb-c161-2ae1-020311a37249	2363	Podvelka
00050000-55fb-c161-5c3c-9d37a931895c	2208	Pohorje
00050000-55fb-c161-5767-f4144b00f440	2257	Polenšak
00050000-55fb-c161-9a50-9f734de36c42	1355	Polhov Gradec
00050000-55fb-c161-9693-69a989d3fee9	4223	Poljane nad Škofjo Loko
00050000-55fb-c161-7fe7-9128795a49fe	2319	Poljčane
00050000-55fb-c161-d608-338364ab3f69	1272	Polšnik
00050000-55fb-c161-97cd-954dd40a534b	3313	Polzela
00050000-55fb-c161-eb6c-aece19d50ce5	3232	Ponikva
00050000-55fb-c161-e702-5bf94745a747	6320	Portorož/Portorose
00050000-55fb-c161-76e9-f1b059b0bf39	6230	Postojna
00050000-55fb-c161-e2a0-e2b60a4b07b0	2331	Pragersko
00050000-55fb-c161-89b2-1698e4f6808f	3312	Prebold
00050000-55fb-c161-9256-cb995a5145ba	4205	Preddvor
00050000-55fb-c161-afc8-4c106748c49b	6255	Prem
00050000-55fb-c161-fd63-7abc92e68e56	1352	Preserje
00050000-55fb-c161-a5ae-c12f20224ce7	6258	Prestranek
00050000-55fb-c161-786f-8232feaf9568	2391	Prevalje
00050000-55fb-c161-7d13-1e8b8b123cfd	3262	Prevorje
00050000-55fb-c161-6aa9-3533a50c9d84	1276	Primskovo 
00050000-55fb-c161-3d1c-aa9df616094a	3253	Pristava pri Mestinju
00050000-55fb-c161-fd66-2f7702b0b80a	9207	Prosenjakovci/Partosfalva
00050000-55fb-c161-bb42-96c819ac4819	5297	Prvačina
00050000-55fb-c161-9d5d-b69f1ce6e6a4	2250	Ptuj
00050000-55fb-c161-2db1-5cd078041ea8	2323	Ptujska Gora
00050000-55fb-c161-5155-d0eaec93bc23	9201	Puconci
00050000-55fb-c161-8c29-c116e24c5f18	2327	Rače
00050000-55fb-c161-2b33-9aba75c9375a	1433	Radeče
00050000-55fb-c161-66ec-8c8f851d696b	9252	Radenci
00050000-55fb-c161-526e-2508a43f2f94	2360	Radlje ob Dravi
00050000-55fb-c161-72ea-b9faddb0bc04	1235	Radomlje
00050000-55fb-c161-591c-ade6694cf982	4240	Radovljica
00050000-55fb-c161-cfbd-8ddde3bae0a4	8274	Raka
00050000-55fb-c161-5d5f-63e4aa62e3a4	1381	Rakek
00050000-55fb-c161-b876-2b7635528199	4283	Rateče - Planica
00050000-55fb-c161-1415-ef6b8b16bd23	2390	Ravne na Koroškem
00050000-55fb-c161-8fb7-3bc2eb2831ff	9246	Razkrižje
00050000-55fb-c161-38b3-2ed727099674	3332	Rečica ob Savinji
00050000-55fb-c161-3414-47c23267f3ab	5292	Renče
00050000-55fb-c161-4470-9bf73d9c6db0	1310	Ribnica
00050000-55fb-c161-3272-3ec78fe74048	2364	Ribnica na Pohorju
00050000-55fb-c161-f1ba-3fb3418242f2	3272	Rimske Toplice
00050000-55fb-c161-b367-24a9c2f27db7	1314	Rob
00050000-55fb-c161-9ddd-d029bbaae071	5215	Ročinj
00050000-55fb-c161-0ee4-4a45cee62c8f	3250	Rogaška Slatina
00050000-55fb-c161-a5cf-f59924107f9b	9262	Rogašovci
00050000-55fb-c161-5635-f997d21fbf01	3252	Rogatec
00050000-55fb-c161-9e53-9678773f2d88	1373	Rovte
00050000-55fb-c161-8362-3cee98689be5	2342	Ruše
00050000-55fb-c161-3569-2f9bf41f836f	1282	Sava
00050000-55fb-c161-c4f2-842ceefe0f95	6333	Sečovlje/Sicciole
00050000-55fb-c161-1a46-9e12dcd1bd85	4227	Selca
00050000-55fb-c161-4cf4-5ab2458bb7b6	2352	Selnica ob Dravi
00050000-55fb-c161-c7cc-9cf40fc01305	8333	Semič
00050000-55fb-c161-51f3-f83b9dd2ab52	8281	Senovo
00050000-55fb-c161-2ca7-648f70f2113a	6224	Senožeče
00050000-55fb-c161-292c-582261576485	8290	Sevnica
00050000-55fb-c161-b34b-6137bbebfc51	6210	Sežana
00050000-55fb-c161-d8a7-e1700eedf399	2214	Sladki Vrh
00050000-55fb-c161-1de8-9b3891559662	5283	Slap ob Idrijci
00050000-55fb-c161-ca04-1f3043018fb1	2380	Slovenj Gradec
00050000-55fb-c161-2709-129b450435c4	2310	Slovenska Bistrica
00050000-55fb-c161-2785-177da09abd70	3210	Slovenske Konjice
00050000-55fb-c161-e102-17e04ae4dbf8	1216	Smlednik
00050000-55fb-c161-bbdb-8e1e9d86ee25	5232	Soča
00050000-55fb-c161-3904-8f7e80ea8bc1	1317	Sodražica
00050000-55fb-c161-db74-486e0beebb1b	3335	Solčava
00050000-55fb-c161-e571-1f8a1b1b664e	5250	Solkan
00050000-55fb-c161-f167-5da9e678393d	4229	Sorica
00050000-55fb-c161-3eca-9a842e270432	4225	Sovodenj
00050000-55fb-c161-89bd-0ec4382f2738	5281	Spodnja Idrija
00050000-55fb-c161-eef7-376c0dafcce8	2241	Spodnji Duplek
00050000-55fb-c161-de17-ea539e58ddf4	9245	Spodnji Ivanjci
00050000-55fb-c161-626a-3d0f70459005	2277	Središče ob Dravi
00050000-55fb-c161-380f-2fd41fb46b29	4267	Srednja vas v Bohinju
00050000-55fb-c161-e6cf-0d3b52ea5b73	8256	Sromlje 
00050000-55fb-c161-1f16-7180436853fd	5224	Srpenica
00050000-55fb-c161-bf72-d47ed11cb5b9	1242	Stahovica
00050000-55fb-c161-3951-537b0e118202	1332	Stara Cerkev
00050000-55fb-c161-42ee-414193e737ae	8342	Stari trg ob Kolpi
00050000-55fb-c161-367e-8450faf0077a	1386	Stari trg pri Ložu
00050000-55fb-c161-97f9-50b3a64074fd	2205	Starše
00050000-55fb-c161-b077-b3609aac8f60	2289	Stoperce
00050000-55fb-c161-981f-4b8cd73b7c14	8322	Stopiče
00050000-55fb-c161-ef7c-96e0dbdd6133	3206	Stranice
00050000-55fb-c161-4895-005978ca7cef	8351	Straža
00050000-55fb-c161-52c0-42ef1d0a0347	1313	Struge
00050000-55fb-c161-7f15-01f117bcbf5c	8293	Studenec
00050000-55fb-c161-32af-cd5964ade918	8331	Suhor
00050000-55fb-c161-5947-b79315c3db49	2233	Sv. Ana v Slovenskih goricah
00050000-55fb-c161-5ebb-c491e0a998f1	2235	Sv. Trojica v Slovenskih goricah
00050000-55fb-c161-b925-a064df8e835f	2353	Sveti Duh na Ostrem Vrhu
00050000-55fb-c161-9b22-fd392f779172	9244	Sveti Jurij ob Ščavnici
00050000-55fb-c161-dbda-2899a146025f	3264	Sveti Štefan
00050000-55fb-c161-4f2a-0c6367164cce	2258	Sveti Tomaž
00050000-55fb-c161-26f9-d5a3cf43bb77	9204	Šalovci
00050000-55fb-c161-0f29-ca79d2966a8e	5261	Šempas
00050000-55fb-c161-3a67-4b54218e161e	5290	Šempeter pri Gorici
00050000-55fb-c161-da5c-fbcf1743f102	3311	Šempeter v Savinjski dolini
00050000-55fb-c161-734d-64b424525241	4208	Šenčur
00050000-55fb-c161-3d58-0d6b103b9385	2212	Šentilj v Slovenskih goricah
00050000-55fb-c161-3b3f-3f135493fe60	8297	Šentjanž
00050000-55fb-c161-f826-614da9f41e29	2373	Šentjanž pri Dravogradu
00050000-55fb-c161-5a03-8e7776c2b220	8310	Šentjernej
00050000-55fb-c161-9307-d03e3c22a7bb	3230	Šentjur
00050000-55fb-c161-476b-ac523a187a3f	3271	Šentrupert
00050000-55fb-c161-e6eb-ceffeddfa157	8232	Šentrupert
00050000-55fb-c161-46a9-990a2e3f09aa	1296	Šentvid pri Stični
00050000-55fb-c161-2009-cdde4bbd7f8c	8275	Škocjan
00050000-55fb-c161-465c-ba74886f7645	6281	Škofije
00050000-55fb-c161-afc7-ae5b73dfe342	4220	Škofja Loka
00050000-55fb-c161-25f6-a38d007cf862	3211	Škofja vas
00050000-55fb-c161-fe33-95f1dd33fe14	1291	Škofljica
00050000-55fb-c161-396d-26e020ad8c0c	6274	Šmarje
00050000-55fb-c161-45a3-e4d1e28d54fe	1293	Šmarje - Sap
00050000-55fb-c161-11e4-2f1565b7ccd6	3240	Šmarje pri Jelšah
00050000-55fb-c161-5d26-a35fc53aa808	8220	Šmarješke Toplice
00050000-55fb-c161-65c9-c8692d2f7196	2315	Šmartno na Pohorju
00050000-55fb-c161-bab8-b1441a96f4e9	3341	Šmartno ob Dreti
00050000-55fb-c161-9b98-60f6391249a2	3327	Šmartno ob Paki
00050000-55fb-c161-186b-ad6071b640e3	1275	Šmartno pri Litiji
00050000-55fb-c161-c5d5-31adc3f09c0c	2383	Šmartno pri Slovenj Gradcu
00050000-55fb-c161-fd0a-29dc52cece21	3201	Šmartno v Rožni dolini
00050000-55fb-c161-1766-cf48b16fc798	3325	Šoštanj
00050000-55fb-c161-ebf8-74914a60788e	6222	Štanjel
00050000-55fb-c161-c3a8-a0eca0384da9	3220	Štore
00050000-55fb-c161-a8ed-32a73fa6f7cb	3304	Tabor
00050000-55fb-c161-9bd9-fc2ec5ee48da	3221	Teharje
00050000-55fb-c161-4332-5284672c15f2	9251	Tišina
00050000-55fb-c161-7033-9dd57736d5bd	5220	Tolmin
00050000-55fb-c161-99d8-7d8d30442862	3326	Topolšica
00050000-55fb-c161-d6dd-2f1d1ac4cc68	2371	Trbonje
00050000-55fb-c161-22a8-f687c54f3fb7	1420	Trbovlje
00050000-55fb-c161-4da8-c75c0feed31c	8231	Trebelno 
00050000-55fb-c161-6e47-a6c678939dee	8210	Trebnje
00050000-55fb-c161-d3f1-3e071fdc921b	5252	Trnovo pri Gorici
00050000-55fb-c161-623a-a8bbc9b46851	2254	Trnovska vas
00050000-55fb-c161-06d1-dba884e011ac	1222	Trojane
00050000-55fb-c161-a969-9523fc3b4609	1236	Trzin
00050000-55fb-c161-9ee4-224e032f69f3	4290	Tržič
00050000-55fb-c161-be75-23db68c1069b	8295	Tržišče
00050000-55fb-c161-5b88-96184d394a3a	1311	Turjak
00050000-55fb-c161-dba3-fe7447c1a57a	9224	Turnišče
00050000-55fb-c161-27e6-b7f7bd8c3ff2	8323	Uršna sela
00050000-55fb-c161-14ff-7f38682bad39	1252	Vače
00050000-55fb-c161-bc60-4f3ee83f8854	3320	Velenje 
00050000-55fb-c161-acef-338e4b85f36b	3322	Velenje - poštni predali
00050000-55fb-c161-2922-48cb6c5661fb	8212	Velika Loka
00050000-55fb-c161-0d1f-131737493fac	2274	Velika Nedelja
00050000-55fb-c161-b4f5-0560c984a88a	9225	Velika Polana
00050000-55fb-c161-49f9-ab1d4ca48761	1315	Velike Lašče
00050000-55fb-c161-5697-f42dbb7ba328	8213	Veliki Gaber
00050000-55fb-c161-c9a5-e3e48beaff6e	9241	Veržej
00050000-55fb-c161-1cf8-1e66da71e9fd	1312	Videm - Dobrepolje
00050000-55fb-c161-f0e2-73f264866d99	2284	Videm pri Ptuju
00050000-55fb-c161-7e63-3a30dee8e8ed	8344	Vinica
00050000-55fb-c161-01ed-197e90b634e2	5271	Vipava
00050000-55fb-c161-ca46-a0c1ead275c1	4212	Visoko
00050000-55fb-c161-346b-f162759fae75	1294	Višnja Gora
00050000-55fb-c161-2ee1-e6006d0d504f	3205	Vitanje
00050000-55fb-c161-3fb1-939139ea1a7e	2255	Vitomarci
00050000-55fb-c161-9d39-f67acc161c5a	1217	Vodice
00050000-55fb-c161-1e1f-7d03fb6e8a48	3212	Vojnik\t
00050000-55fb-c161-e09c-89159bfa2adb	5293	Volčja Draga
00050000-55fb-c161-bc67-49209f8a37f1	2232	Voličina
00050000-55fb-c161-73b4-2a162d69102d	3305	Vransko
00050000-55fb-c161-5201-e60f4725b79d	6217	Vremski Britof
00050000-55fb-c161-af25-f6b8620eb8df	1360	Vrhnika
00050000-55fb-c161-99ac-49c225b1258d	2365	Vuhred
00050000-55fb-c161-36f5-b4b5021c28da	2367	Vuzenica
00050000-55fb-c161-4b84-3690fe14ceeb	8292	Zabukovje 
00050000-55fb-c161-963b-d3939741f58d	1410	Zagorje ob Savi
00050000-55fb-c161-e9a9-39c41162a3ca	1303	Zagradec
00050000-55fb-c161-35ce-39ab33ccbf26	2283	Zavrč
00050000-55fb-c161-7b0a-0f01ea9df293	8272	Zdole 
00050000-55fb-c161-e41d-2aacead8fd11	4201	Zgornja Besnica
00050000-55fb-c161-ed3a-4e558d164f52	2242	Zgornja Korena
00050000-55fb-c161-3958-24aeea93c0bf	2201	Zgornja Kungota
00050000-55fb-c161-defb-a839c9a6bb79	2316	Zgornja Ložnica
00050000-55fb-c161-7141-87d5f70c16de	2314	Zgornja Polskava
00050000-55fb-c161-273a-0e0e2aa10ae2	2213	Zgornja Velka
00050000-55fb-c161-a8ef-3455f42a5931	4247	Zgornje Gorje
00050000-55fb-c161-9954-2245e1b943ba	4206	Zgornje Jezersko
00050000-55fb-c161-3da5-4b4635ce1831	2285	Zgornji Leskovec
00050000-55fb-c161-acc9-6e7a0dac550a	1432	Zidani Most
00050000-55fb-c161-2038-ad09ce206cdb	3214	Zreče
00050000-55fb-c161-70e0-f4e07ee2ed71	4209	Žabnica
00050000-55fb-c161-9442-204451ccd6f2	3310	Žalec
00050000-55fb-c161-7250-cbd2caf73d8e	4228	Železniki
00050000-55fb-c161-df2c-241cc99fb669	2287	Žetale
00050000-55fb-c161-89f4-e7a9068df20e	4226	Žiri
00050000-55fb-c161-ff39-3006efd90874	4274	Žirovnica
00050000-55fb-c161-9230-4d1656394798	8360	Žužemberk
\.


--
-- TOC entry 2983 (class 0 OID 19979325)
-- Dependencies: 229
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2957 (class 0 OID 19978957)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 19978764)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55fb-c163-9a38-184cb5309add	00080000-55fb-c163-8340-86dde68eabe5	\N	00040000-55fb-c161-1c79-2fd176ab8916	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55fb-c163-b838-f075c02e9be3	00080000-55fb-c163-8340-86dde68eabe5	\N	00040000-55fb-c161-1c79-2fd176ab8916	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55fb-c163-0338-86375173e9f5	00080000-55fb-c163-4777-7e1cad08146a	\N	00040000-55fb-c161-1c79-2fd176ab8916	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2946 (class 0 OID 19978842)
-- Dependencies: 192
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 19978969)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 19979339)
-- Dependencies: 230
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 19979349)
-- Dependencies: 231
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55fb-c163-33f8-8f4e65b69e43	00080000-55fb-c163-fb63-234ab7ed9243	0987	AK
00190000-55fb-c163-6e9f-ad570f3e7274	00080000-55fb-c163-4777-7e1cad08146a	0989	AK
00190000-55fb-c163-3e4b-93f5a833677a	00080000-55fb-c163-5366-808aa20e03dc	0986	AK
00190000-55fb-c163-a525-61e8a167e97a	00080000-55fb-c163-b3eb-7134e42ffb7c	0984	AK
00190000-55fb-c163-6d8b-5005ea65efc3	00080000-55fb-c163-0f18-aafff7f13a1e	0983	AK
00190000-55fb-c163-3505-80742aee351e	00080000-55fb-c163-f9b2-cbc0866a631e	0982	AK
00190000-55fb-c165-c433-bfec344b0bab	00080000-55fb-c165-6813-b1bf2e9dc92c	1001	AK
\.


--
-- TOC entry 2982 (class 0 OID 19979282)
-- Dependencies: 228
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55fb-c163-a60b-94e3c5e8b0eb	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2986 (class 0 OID 19979357)
-- Dependencies: 232
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 19978998)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55fb-c163-4580-56c114910d0d	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55fb-c163-553e-11ebcaa4975a	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55fb-c163-af7e-600b0992b7c3	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55fb-c163-d617-a088859aa1c9	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55fb-c163-9752-b4a9dbff1fc1	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55fb-c163-24e1-0cb9a3e6b94d	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55fb-c163-b8d8-28cf4307ea44	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2955 (class 0 OID 19978942)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 19978932)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2975 (class 0 OID 19979135)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 19979072)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 19978637)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55fb-c165-6813-b1bf2e9dc92c	00010000-55fb-c162-b6a1-6005b858cec7	2015-09-18 09:46:45	INS	a:0:{}
2	App\\Entity\\Option	00000000-55fb-c165-4f9c-3f940c23e7d4	00010000-55fb-c162-b6a1-6005b858cec7	2015-09-18 09:46:45	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55fb-c165-c433-bfec344b0bab	00010000-55fb-c162-b6a1-6005b858cec7	2015-09-18 09:46:45	INS	a:0:{}
\.


--
-- TOC entry 3004 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2964 (class 0 OID 19979011)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 19978675)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55fb-c162-32ff-8a91ac78c185	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55fb-c162-3293-40ff967db0d0	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55fb-c162-b5ba-887aef952807	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55fb-c162-405b-f49637bc0b9f	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55fb-c162-92a4-88b033502c3a	planer	Planer dogodkov v koledarju	t
00020000-55fb-c162-2373-6cd8803b4d15	kadrovska	Kadrovska služba	t
00020000-55fb-c162-b354-e39602ed303e	arhivar	Ažuriranje arhivalij	t
00020000-55fb-c162-87d5-26dc50ee9800	igralec	Igralec	t
00020000-55fb-c162-ea77-7c4cb1674612	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55fb-c163-58b4-35370784b9c6	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2931 (class 0 OID 19978659)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55fb-c162-9460-de03db275ec0	00020000-55fb-c162-b5ba-887aef952807
00010000-55fb-c162-b6a1-6005b858cec7	00020000-55fb-c162-b5ba-887aef952807
00010000-55fb-c163-f5fe-4a6c653e0d9a	00020000-55fb-c163-58b4-35370784b9c6
\.


--
-- TOC entry 2966 (class 0 OID 19979025)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 19978963)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 19978909)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 19978624)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55fb-c161-bb96-fc963c96b2e7	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55fb-c161-3571-506ca177cb5a	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55fb-c161-3f0d-a9d7eea5ebbd	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55fb-c161-d108-aac316ea2127	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55fb-c161-50ad-5777720df6dd	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2926 (class 0 OID 19978616)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55fb-c161-27da-38152fb52e68	00230000-55fb-c161-d108-aac316ea2127	popa
00240000-55fb-c161-5ad5-bd684285bd9b	00230000-55fb-c161-d108-aac316ea2127	oseba
00240000-55fb-c161-9724-893d34df5958	00230000-55fb-c161-d108-aac316ea2127	sezona
00240000-55fb-c161-8bda-bdc5205ff4f2	00230000-55fb-c161-3571-506ca177cb5a	prostor
00240000-55fb-c161-909e-ef5eccf78b87	00230000-55fb-c161-d108-aac316ea2127	besedilo
00240000-55fb-c161-4dab-5c56cbca14ab	00230000-55fb-c161-d108-aac316ea2127	uprizoritev
00240000-55fb-c161-01f0-b386bdc56b94	00230000-55fb-c161-d108-aac316ea2127	funkcija
00240000-55fb-c161-c085-609b5e30e4ad	00230000-55fb-c161-d108-aac316ea2127	tipfunkcije
00240000-55fb-c161-9f12-bf6453783fcf	00230000-55fb-c161-d108-aac316ea2127	alternacija
00240000-55fb-c161-71a8-22c1f4804a16	00230000-55fb-c161-bb96-fc963c96b2e7	pogodba
00240000-55fb-c161-1c4d-c75e03ee55c8	00230000-55fb-c161-d108-aac316ea2127	zaposlitev
00240000-55fb-c161-7f41-6d0dec35410d	00230000-55fb-c161-d108-aac316ea2127	zvrstuprizoritve
00240000-55fb-c161-fa5c-e1737e46c3be	00230000-55fb-c161-bb96-fc963c96b2e7	programdela
00240000-55fb-c161-ee2a-c08183f47250	00230000-55fb-c161-d108-aac316ea2127	zapis
\.


--
-- TOC entry 2925 (class 0 OID 19978611)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
7e0f7544-f57d-4808-a311-edeb123a5301	00240000-55fb-c161-27da-38152fb52e68	0	1001
\.


--
-- TOC entry 2971 (class 0 OID 19979082)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55fb-c163-f726-8b3eed737ec1	000e0000-55fb-c163-2fa0-0f257f97515b	00080000-55fb-c163-8340-86dde68eabe5	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55fb-c161-fe08-95ecb0d51c3d
00270000-55fb-c163-0a75-6d93b631bfd1	000e0000-55fb-c163-2fa0-0f257f97515b	00080000-55fb-c163-8340-86dde68eabe5	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55fb-c161-fe08-95ecb0d51c3d
\.


--
-- TOC entry 2938 (class 0 OID 19978737)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 19978919)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55fb-c164-31f5-ff0c61a14681	00180000-55fb-c163-6b4f-8aadb0c4db23	000c0000-55fb-c164-4079-f2ac40a99137	00090000-55fb-c163-c750-aa6eaa68afd4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fb-c164-5b75-f39db3431684	00180000-55fb-c163-6b4f-8aadb0c4db23	000c0000-55fb-c164-61bc-2a1119f5480f	00090000-55fb-c163-0d12-e96224a3f282	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fb-c164-b1fc-7a097c43576d	00180000-55fb-c163-6b4f-8aadb0c4db23	000c0000-55fb-c164-5702-ec93ffd75773	00090000-55fb-c163-be42-8e67cac850f4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fb-c164-3753-33df01ca42bc	00180000-55fb-c163-6b4f-8aadb0c4db23	000c0000-55fb-c164-0e27-fb3835f33839	00090000-55fb-c163-8dcf-6b7c84617731	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fb-c164-8b6c-783d609a7568	00180000-55fb-c163-6b4f-8aadb0c4db23	000c0000-55fb-c164-32d3-400c1bdf4088	00090000-55fb-c163-2eee-f1551defe23e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55fb-c164-64cb-37b1f80434bb	00180000-55fb-c163-b7e9-7a020b5f72af	\N	00090000-55fb-c163-2eee-f1551defe23e	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2974 (class 0 OID 19979123)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55fb-c161-7f63-3515178a96e4	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55fb-c161-2e01-82e3d93fc2f6	02	Priredba	Priredba	Priredba	umetnik
000f0000-55fb-c161-38fe-cc363b932028	03	Prevod	Prevod	Prevod	umetnik
000f0000-55fb-c161-3d0c-fb26a71b3d37	04	Režija	Režija	Režija	umetnik
000f0000-55fb-c161-1270-cf95c1d427a7	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55fb-c161-e641-4be451f1c0d2	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55fb-c161-7531-03bcb30a5278	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55fb-c161-8401-8603981a1565	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55fb-c161-6de5-70e07fd828dc	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55fb-c161-f930-e8a2bf79765a	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55fb-c161-c948-5c69e8690af2	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55fb-c161-c7d2-acecc12c1ebe	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55fb-c161-fda6-6161dcdec7d8	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55fb-c161-988b-c96f0381f96b	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55fb-c161-1cfe-1076812fc262	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55fb-c161-7f3a-e61238569e12	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55fb-c161-1689-50aaafd0746b	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55fb-c161-04bd-7f2b552c78df	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2987 (class 0 OID 19979367)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55fb-c161-d241-582f6bf35cb8	01	Velika predstava	f	1.00	1.00
002b0000-55fb-c161-db45-266088ac4e0b	02	Mala predstava	f	0.50	0.50
002b0000-55fb-c161-2f50-18ca196e1c85	03	Mala koprodukcija	t	0.40	1.00
002b0000-55fb-c161-c0ce-9d705588c9a0	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55fb-c161-e057-271155772132	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2943 (class 0 OID 19978799)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 19978646)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55fb-c162-b6a1-6005b858cec7	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROZxZXLlU9dpCihmVIch5.z3gDjXb/7uS	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55fb-c163-ce88-150b1fcf05c2	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55fb-c163-a209-b29a9e12f38c	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55fb-c163-da72-112c4700564d	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55fb-c163-f658-67d003db4b6c	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55fb-c163-1b66-7d5d493a9422	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55fb-c163-848b-e53e6aa62959	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55fb-c163-b826-afd3e54f1678	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55fb-c163-2fe8-97fd92ec9c21	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55fb-c163-3b68-31f316fa7a7d	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55fb-c163-f5fe-4a6c653e0d9a	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55fb-c162-9460-de03db275ec0	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2978 (class 0 OID 19979172)
-- Dependencies: 224
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55fb-c163-45d6-5fa4ff44787d	00160000-55fb-c163-a035-284940881870	\N	00140000-55fb-c161-1c6d-b3c256a64073	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55fb-c163-9752-b4a9dbff1fc1
000e0000-55fb-c163-2fa0-0f257f97515b	00160000-55fb-c163-1e64-c32103332054	\N	00140000-55fb-c161-da12-4c294e902563	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55fb-c163-24e1-0cb9a3e6b94d
000e0000-55fb-c163-9567-2a1269833fa7	\N	\N	00140000-55fb-c161-da12-4c294e902563	00190000-55fb-c163-33f8-8f4e65b69e43	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55fb-c163-9752-b4a9dbff1fc1
000e0000-55fb-c163-d73b-d5f70c217fa0	\N	\N	00140000-55fb-c161-da12-4c294e902563	00190000-55fb-c163-33f8-8f4e65b69e43	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55fb-c163-9752-b4a9dbff1fc1
000e0000-55fb-c163-24b8-b25cfa5483be	\N	\N	00140000-55fb-c161-da12-4c294e902563	00190000-55fb-c163-33f8-8f4e65b69e43	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55fb-c163-4580-56c114910d0d
000e0000-55fb-c163-e2cf-a872c1db2d5f	\N	\N	00140000-55fb-c161-da12-4c294e902563	00190000-55fb-c163-33f8-8f4e65b69e43	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55fb-c163-4580-56c114910d0d
\.


--
-- TOC entry 2948 (class 0 OID 19978863)
-- Dependencies: 194
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55fb-c163-4a41-0bd967b4e3e8	000e0000-55fb-c163-2fa0-0f257f97515b	\N	1	
00200000-55fb-c163-c31c-8b67c33fe050	000e0000-55fb-c163-2fa0-0f257f97515b	\N	2	
00200000-55fb-c163-438c-ebf04b9c2095	000e0000-55fb-c163-2fa0-0f257f97515b	\N	3	
00200000-55fb-c163-b655-d4ae8f00f4bf	000e0000-55fb-c163-2fa0-0f257f97515b	\N	4	
00200000-55fb-c163-c02e-6cb80176cdb5	000e0000-55fb-c163-2fa0-0f257f97515b	\N	5	
\.


--
-- TOC entry 2962 (class 0 OID 19978990)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 19979096)
-- Dependencies: 218
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55fb-c161-32a6-518b1362ed1e	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55fb-c161-f9ba-e8339a0ddf4f	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55fb-c161-9257-5c216ede62f1	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55fb-c161-7590-12ff4d9e496e	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55fb-c161-aed1-7dca647fc984	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55fb-c161-cebf-6fa24f6bf2f7	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55fb-c161-68a7-32115c0984ac	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55fb-c161-aebd-cbb37774bb1f	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55fb-c161-fe08-95ecb0d51c3d	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55fb-c161-a3ad-230fdeb5c6f8	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55fb-c161-b00d-9b30077fa259	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55fb-c161-6b5a-a7a3fc87b4f8	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55fb-c161-01de-0cc9b7b51d3e	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55fb-c161-67fd-1c96a1e6c642	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55fb-c161-2374-333bea22c5e4	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55fb-c161-552a-c63ba97b19f8	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55fb-c161-8bc1-f26fa8ce2272	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55fb-c161-28c5-7111d055385e	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55fb-c161-d2f0-e81ffa4caf2d	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55fb-c161-1bab-1b7aa3eb971a	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55fb-c161-610d-87a1e17686b2	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55fb-c161-c9a1-f60cd45146d3	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55fb-c161-b6ea-203c062e83f2	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55fb-c161-e5cb-725ddb4c2dd2	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55fb-c161-d627-b4615e01a2fd	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55fb-c161-cfa3-8dd69a22be01	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55fb-c161-06dc-0e0a449e816d	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55fb-c161-2a9d-b5c6bb0b33a0	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2990 (class 0 OID 19979414)
-- Dependencies: 236
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 19979386)
-- Dependencies: 235
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 19979426)
-- Dependencies: 237
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 19979062)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55fb-c163-00f4-673d2d2494a5	00090000-55fb-c163-0d12-e96224a3f282	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fb-c163-318e-d42c95cddd47	00090000-55fb-c163-be42-8e67cac850f4	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fb-c163-359f-65952445673e	00090000-55fb-c163-3729-64a0a824e057	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fb-c163-939c-b540deaab87c	00090000-55fb-c163-6c39-9b71ecde7470	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fb-c163-274e-5fd311a9623a	00090000-55fb-c163-c750-aa6eaa68afd4	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55fb-c163-b82a-fdf2b3f459b4	00090000-55fb-c163-6cc7-8fc45ca12624	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2950 (class 0 OID 19978899)
-- Dependencies: 196
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 19979162)
-- Dependencies: 223
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55fb-c161-1c6d-b3c256a64073	01	Drama	drama (SURS 01)
00140000-55fb-c161-da88-8b930b0c15f6	02	Opera	opera (SURS 02)
00140000-55fb-c161-8bd5-48d48480307a	03	Balet	balet (SURS 03)
00140000-55fb-c161-8a1a-7941d592d931	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55fb-c161-673a-20eaa7974aab	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55fb-c161-da12-4c294e902563	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55fb-c161-8c52-620375e5cfa9	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2968 (class 0 OID 19979052)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2476 (class 2606 OID 19978700)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 19979221)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 19979211)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 19979121)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 19979466)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 19978888)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 19978908)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 19979384)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 19978825)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 19979276)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 19979048)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 19978861)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 19978839)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 19978955)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 19979443)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 19979450)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2716 (class 2606 OID 19979474)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 19946842)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2578 (class 2606 OID 19978982)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 19978797)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 19978709)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 19978733)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 19978689)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2467 (class 2606 OID 19978674)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 19978988)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 19979024)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 19979157)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 19978761)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 19978785)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 19979337)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 19978961)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 19978775)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 19978849)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 19978973)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 19979346)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 19979354)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 19979324)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 19979365)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 19979006)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 19978946)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 19978937)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 19979145)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 19979079)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 19978645)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 19979015)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 19978663)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2469 (class 2606 OID 19978683)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 19979033)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 19978968)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 19978917)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 19978633)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2453 (class 2606 OID 19978621)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 19978615)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 19979092)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 19978742)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 19978928)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 19979132)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 19979377)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 19978810)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 19978658)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 19979190)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 19978871)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 19978996)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 19979104)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 19979424)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 19979408)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 19979432)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 19979070)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 19978903)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 19979170)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 19979060)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 1259 OID 19978897)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2532 (class 1259 OID 19978898)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2533 (class 1259 OID 19978896)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2534 (class 1259 OID 19978895)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2535 (class 1259 OID 19978894)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2616 (class 1259 OID 19979093)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2617 (class 1259 OID 19979094)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2618 (class 1259 OID 19979095)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2702 (class 1259 OID 19979445)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2703 (class 1259 OID 19979444)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2490 (class 1259 OID 19978763)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2579 (class 1259 OID 19978989)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2689 (class 1259 OID 19979412)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2690 (class 1259 OID 19979411)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2691 (class 1259 OID 19979413)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2692 (class 1259 OID 19979410)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2693 (class 1259 OID 19979409)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2573 (class 1259 OID 19978975)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2574 (class 1259 OID 19978974)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2526 (class 1259 OID 19978872)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2603 (class 1259 OID 19979049)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2604 (class 1259 OID 19979051)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2605 (class 1259 OID 19979050)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2515 (class 1259 OID 19978841)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 19978840)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2680 (class 1259 OID 19979366)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2632 (class 1259 OID 19979159)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2633 (class 1259 OID 19979160)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2634 (class 1259 OID 19979161)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2699 (class 1259 OID 19979433)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2641 (class 1259 OID 19979195)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2642 (class 1259 OID 19979192)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2643 (class 1259 OID 19979196)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2644 (class 1259 OID 19979194)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2645 (class 1259 OID 19979193)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2505 (class 1259 OID 19978812)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2506 (class 1259 OID 19978811)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2481 (class 1259 OID 19978736)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2591 (class 1259 OID 19979016)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2471 (class 1259 OID 19978690)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2472 (class 1259 OID 19978691)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2596 (class 1259 OID 19979036)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2597 (class 1259 OID 19979035)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2598 (class 1259 OID 19979034)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2519 (class 1259 OID 19978850)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2520 (class 1259 OID 19978851)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2451 (class 1259 OID 19978623)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2553 (class 1259 OID 19978941)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2554 (class 1259 OID 19978939)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2555 (class 1259 OID 19978938)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2556 (class 1259 OID 19978940)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2462 (class 1259 OID 19978664)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2463 (class 1259 OID 19978665)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2582 (class 1259 OID 19978997)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2712 (class 1259 OID 19979467)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2713 (class 1259 OID 19979475)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2714 (class 1259 OID 19979476)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2568 (class 1259 OID 19978962)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2612 (class 1259 OID 19979080)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2613 (class 1259 OID 19979081)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2662 (class 1259 OID 19979281)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2663 (class 1259 OID 19979280)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2664 (class 1259 OID 19979277)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2665 (class 1259 OID 19979278)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2666 (class 1259 OID 19979279)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2494 (class 1259 OID 19978777)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2495 (class 1259 OID 19978776)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2496 (class 1259 OID 19978778)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2585 (class 1259 OID 19979010)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2586 (class 1259 OID 19979009)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2672 (class 1259 OID 19979347)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2673 (class 1259 OID 19979348)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2655 (class 1259 OID 19979225)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2656 (class 1259 OID 19979226)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2657 (class 1259 OID 19979223)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2658 (class 1259 OID 19979224)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2609 (class 1259 OID 19979071)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2559 (class 1259 OID 19978950)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2560 (class 1259 OID 19978949)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2561 (class 1259 OID 19978947)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2562 (class 1259 OID 19978948)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2651 (class 1259 OID 19979213)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2652 (class 1259 OID 19979212)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2525 (class 1259 OID 19978862)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2669 (class 1259 OID 19979338)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2688 (class 1259 OID 19979385)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2706 (class 1259 OID 19979451)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2707 (class 1259 OID 19979452)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2477 (class 1259 OID 19978711)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2478 (class 1259 OID 19978710)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2486 (class 1259 OID 19978743)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2487 (class 1259 OID 19978744)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2548 (class 1259 OID 19978931)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2549 (class 1259 OID 19978930)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2550 (class 1259 OID 19978929)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2536 (class 1259 OID 19978890)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2537 (class 1259 OID 19978891)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2538 (class 1259 OID 19978889)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2539 (class 1259 OID 19978893)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2540 (class 1259 OID 19978892)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2493 (class 1259 OID 19978762)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2511 (class 1259 OID 19978826)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2512 (class 1259 OID 19978828)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2513 (class 1259 OID 19978827)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2514 (class 1259 OID 19978829)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2567 (class 1259 OID 19978956)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2637 (class 1259 OID 19979158)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2646 (class 1259 OID 19979191)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2628 (class 1259 OID 19979133)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2629 (class 1259 OID 19979134)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2484 (class 1259 OID 19978734)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2485 (class 1259 OID 19978735)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2606 (class 1259 OID 19979061)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2457 (class 1259 OID 19978634)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2504 (class 1259 OID 19978798)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2454 (class 1259 OID 19978622)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2685 (class 1259 OID 19979378)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 19979008)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2590 (class 1259 OID 19979007)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2659 (class 1259 OID 19979222)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2501 (class 1259 OID 19978786)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2638 (class 1259 OID 19979171)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2696 (class 1259 OID 19979425)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2678 (class 1259 OID 19979355)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2679 (class 1259 OID 19979356)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2625 (class 1259 OID 19979122)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2547 (class 1259 OID 19978918)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 19978684)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2745 (class 2606 OID 19979597)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2744 (class 2606 OID 19979602)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2740 (class 2606 OID 19979622)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2746 (class 2606 OID 19979592)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2742 (class 2606 OID 19979612)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2741 (class 2606 OID 19979617)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2743 (class 2606 OID 19979607)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2778 (class 2606 OID 19979772)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2777 (class 2606 OID 19979777)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2776 (class 2606 OID 19979782)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 19979947)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2811 (class 2606 OID 19979942)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2728 (class 2606 OID 19979532)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2762 (class 2606 OID 19979702)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2805 (class 2606 OID 19979927)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2806 (class 2606 OID 19979922)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2804 (class 2606 OID 19979932)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2807 (class 2606 OID 19979917)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2808 (class 2606 OID 19979912)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2760 (class 2606 OID 19979697)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2761 (class 2606 OID 19979692)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2739 (class 2606 OID 19979587)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2772 (class 2606 OID 19979742)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2770 (class 2606 OID 19979752)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2771 (class 2606 OID 19979747)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2734 (class 2606 OID 19979567)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2735 (class 2606 OID 19979562)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2758 (class 2606 OID 19979682)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2802 (class 2606 OID 19979902)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2781 (class 2606 OID 19979787)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2780 (class 2606 OID 19979792)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2779 (class 2606 OID 19979797)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2809 (class 2606 OID 19979937)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2783 (class 2606 OID 19979817)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2786 (class 2606 OID 19979802)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2782 (class 2606 OID 19979822)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2784 (class 2606 OID 19979812)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2785 (class 2606 OID 19979807)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2732 (class 2606 OID 19979557)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2733 (class 2606 OID 19979552)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2724 (class 2606 OID 19979517)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2725 (class 2606 OID 19979512)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2766 (class 2606 OID 19979722)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2721 (class 2606 OID 19979492)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2720 (class 2606 OID 19979497)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2767 (class 2606 OID 19979737)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2768 (class 2606 OID 19979732)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2769 (class 2606 OID 19979727)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2737 (class 2606 OID 19979572)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2736 (class 2606 OID 19979577)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2717 (class 2606 OID 19979477)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2750 (class 2606 OID 19979657)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2752 (class 2606 OID 19979647)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2753 (class 2606 OID 19979642)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2751 (class 2606 OID 19979652)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2719 (class 2606 OID 19979482)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2718 (class 2606 OID 19979487)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2763 (class 2606 OID 19979707)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2814 (class 2606 OID 19979962)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2816 (class 2606 OID 19979967)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2815 (class 2606 OID 19979972)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2759 (class 2606 OID 19979687)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2775 (class 2606 OID 19979762)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2774 (class 2606 OID 19979767)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2793 (class 2606 OID 19979877)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2794 (class 2606 OID 19979872)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2797 (class 2606 OID 19979857)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2796 (class 2606 OID 19979862)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2795 (class 2606 OID 19979867)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2730 (class 2606 OID 19979542)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2731 (class 2606 OID 19979537)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2729 (class 2606 OID 19979547)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2764 (class 2606 OID 19979717)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2765 (class 2606 OID 19979712)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2800 (class 2606 OID 19979887)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2799 (class 2606 OID 19979892)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2790 (class 2606 OID 19979847)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2789 (class 2606 OID 19979852)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2792 (class 2606 OID 19979837)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2791 (class 2606 OID 19979842)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2773 (class 2606 OID 19979757)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2754 (class 2606 OID 19979677)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2755 (class 2606 OID 19979672)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2757 (class 2606 OID 19979662)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2756 (class 2606 OID 19979667)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2787 (class 2606 OID 19979832)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2788 (class 2606 OID 19979827)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2738 (class 2606 OID 19979582)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2798 (class 2606 OID 19979882)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2801 (class 2606 OID 19979897)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2803 (class 2606 OID 19979907)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2813 (class 2606 OID 19979952)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2812 (class 2606 OID 19979957)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2722 (class 2606 OID 19979507)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2723 (class 2606 OID 19979502)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2727 (class 2606 OID 19979522)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2726 (class 2606 OID 19979527)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2747 (class 2606 OID 19979637)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2748 (class 2606 OID 19979632)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2749 (class 2606 OID 19979627)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-18 09:46:46 CEST

--
-- PostgreSQL database dump complete
--

