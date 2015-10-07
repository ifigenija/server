--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-06 16:03:00 CEST

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
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 245
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 21375429)
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
-- TOC entry 229 (class 1259 OID 21375986)
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
-- TOC entry 228 (class 1259 OID 21375969)
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
-- TOC entry 219 (class 1259 OID 21375846)
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
-- TOC entry 222 (class 1259 OID 21375876)
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
-- TOC entry 243 (class 1259 OID 21376231)
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
-- TOC entry 197 (class 1259 OID 21375637)
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
-- TOC entry 199 (class 1259 OID 21375668)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 21376157)
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
-- TOC entry 190 (class 1259 OID 21375550)
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
-- TOC entry 230 (class 1259 OID 21375999)
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
    sthonorarnihzun integer,
    sthonorarnihzunigr integer,
    sthonorarnihzunigrtujjz integer,
    sthonorarnihzunsamoz integer,
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
-- TOC entry 215 (class 1259 OID 21375801)
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
-- TOC entry 195 (class 1259 OID 21375616)
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
-- TOC entry 193 (class 1259 OID 21375590)
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
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 191 (class 1259 OID 21375567)
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
-- TOC entry 204 (class 1259 OID 21375715)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 21376212)
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
-- TOC entry 242 (class 1259 OID 21376224)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 21376246)
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
-- TOC entry 170 (class 1259 OID 21093458)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 21375740)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 21375524)
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
-- TOC entry 182 (class 1259 OID 21375438)
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
-- TOC entry 183 (class 1259 OID 21375449)
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
-- TOC entry 178 (class 1259 OID 21375403)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 21375422)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 21375747)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 21375781)
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
-- TOC entry 225 (class 1259 OID 21375917)
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
-- TOC entry 185 (class 1259 OID 21375482)
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
-- TOC entry 187 (class 1259 OID 21375516)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 21376102)
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
-- TOC entry 205 (class 1259 OID 21375721)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 21375501)
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
-- TOC entry 194 (class 1259 OID 21375605)
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
-- TOC entry 207 (class 1259 OID 21375733)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 21376116)
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
-- TOC entry 234 (class 1259 OID 21376126)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 21376059)
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
    stpremiervelikih integer,
    stpremiermalih integer,
    stpremiermalihkopr integer,
    stpremiervelikihkopr integer,
    stpremiersredkopr integer,
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
    sthonorarnihzun integer,
    sthonorarnihzunigr integer,
    sthonorarnihzunigrtujjz integer,
    sthonorarnihzunsamoz integer,
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
-- TOC entry 235 (class 1259 OID 21376134)
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
-- TOC entry 211 (class 1259 OID 21375762)
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
-- TOC entry 203 (class 1259 OID 21375706)
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
-- TOC entry 202 (class 1259 OID 21375696)
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
-- TOC entry 224 (class 1259 OID 21375906)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 21375836)
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
-- TOC entry 192 (class 1259 OID 21375579)
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
-- TOC entry 175 (class 1259 OID 21375374)
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
-- TOC entry 174 (class 1259 OID 21375372)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 212 (class 1259 OID 21375775)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 21375412)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 21375396)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 21375789)
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
-- TOC entry 206 (class 1259 OID 21375727)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 21375673)
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
-- TOC entry 173 (class 1259 OID 21375361)
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
-- TOC entry 172 (class 1259 OID 21375353)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 21375348)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 21375853)
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
-- TOC entry 184 (class 1259 OID 21375474)
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
-- TOC entry 201 (class 1259 OID 21375683)
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
-- TOC entry 223 (class 1259 OID 21375894)
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
-- TOC entry 236 (class 1259 OID 21376145)
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
-- TOC entry 189 (class 1259 OID 21375536)
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
-- TOC entry 176 (class 1259 OID 21375383)
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
-- TOC entry 227 (class 1259 OID 21375944)
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
-- TOC entry 196 (class 1259 OID 21375627)
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
-- TOC entry 210 (class 1259 OID 21375754)
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
-- TOC entry 221 (class 1259 OID 21375867)
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
-- TOC entry 239 (class 1259 OID 21376192)
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
-- TOC entry 238 (class 1259 OID 21376164)
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
-- TOC entry 240 (class 1259 OID 21376204)
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
-- TOC entry 217 (class 1259 OID 21375826)
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
-- TOC entry 198 (class 1259 OID 21375662)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 21375934)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 21375816)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 21375377)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2980 (class 0 OID 21375429)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 21375986)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5613-d491-5c56-44cc877aa678	000d0000-5613-d491-6555-0781fd4b8d51	\N	00090000-5613-d491-07d6-66916467ee0a	000b0000-5613-d491-f0eb-4bc32c1be107	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5613-d491-310d-d16c48c77439	000d0000-5613-d491-1343-23d4d380fc8e	00100000-5613-d491-4828-74fe4c486ab7	00090000-5613-d491-d3a6-dd650004fbdb	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5613-d491-b1c8-32562696e1cd	000d0000-5613-d491-8ee0-99192496426c	00100000-5613-d491-c583-e87689df593c	00090000-5613-d491-deb5-c7a657fdbda0	\N	0003	t	\N	2015-10-06	\N	2	t	\N	f	f
000c0000-5613-d491-984c-d3ae1f26d7ad	000d0000-5613-d491-c2b2-ade538b33258	\N	00090000-5613-d491-ce49-4e6bad2bf9b0	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5613-d491-d0e3-213117532fff	000d0000-5613-d491-8478-cd51abf2ea6d	\N	00090000-5613-d491-4b27-cad23acf383a	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5613-d491-ad43-2e1b5e187ac3	000d0000-5613-d491-a728-d76a30ae46f7	\N	00090000-5613-d491-7228-3e529a540f73	000b0000-5613-d491-b097-957cb3e9f4a4	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5613-d491-6149-16d97c8e8ab1	000d0000-5613-d491-ae9b-48e9b7b795e4	00100000-5613-d491-3abc-f2fd3ee32542	00090000-5613-d491-6cdf-d9161acab1df	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5613-d491-7c9b-e5d3875b4c74	000d0000-5613-d491-3737-f6cd3ff6af45	\N	00090000-5613-d491-77e4-c4a4a4453162	000b0000-5613-d491-285d-78250b930e38	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5613-d491-a2bd-fc69afd7a3d1	000d0000-5613-d491-ae9b-48e9b7b795e4	00100000-5613-d491-a888-5bd5e77d67d4	00090000-5613-d491-b22b-79f38a974796	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5613-d491-f631-e065ba5a73a1	000d0000-5613-d491-ae9b-48e9b7b795e4	00100000-5613-d491-092c-def6d7fdff06	00090000-5613-d491-82d6-4ae0dca7b320	\N	0010	t	\N	2015-10-06	\N	16	f	\N	f	t
000c0000-5613-d491-678a-b39c679d94cc	000d0000-5613-d491-ae9b-48e9b7b795e4	00100000-5613-d491-9959-5f5d9c3e6962	00090000-5613-d491-2258-b257eac038a1	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5613-d491-1b4d-8fabfe3285a6	000d0000-5613-d491-b24b-180d6ec67027	\N	00090000-5613-d491-d3a6-dd650004fbdb	000b0000-5613-d491-a671-56a89120ec48	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3027 (class 0 OID 21375969)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 21375846)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5613-d491-e12b-4ed847b525bb	00160000-5613-d491-c4af-d20f1367fdfb	00090000-5613-d491-1a75-945ec3e41338	aizv	10	t
003d0000-5613-d491-49ff-d72dae4b8d5e	00160000-5613-d491-c4af-d20f1367fdfb	00090000-5613-d491-24f6-e22cbefac95c	apri	14	t
003d0000-5613-d491-b3c7-27310beeb247	00160000-5613-d491-03fb-d809b4819ace	00090000-5613-d491-7e03-6d68af106ce9	aizv	11	t
003d0000-5613-d491-a0c3-2f78d0e8733d	00160000-5613-d491-f60d-2b408eb47efe	00090000-5613-d491-7d0b-4fba7a22a344	aizv	12	t
003d0000-5613-d491-ec5d-59fdf023dd87	00160000-5613-d491-c4af-d20f1367fdfb	00090000-5613-d491-eb93-a0eee9993e55	apri	18	f
\.


--
-- TOC entry 3021 (class 0 OID 21375876)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5613-d491-c4af-d20f1367fdfb	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5613-d491-03fb-d809b4819ace	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5613-d491-f60d-2b408eb47efe	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3042 (class 0 OID 21376231)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 21375637)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5613-d491-ea09-11070301b032	\N	\N	00200000-5613-d491-02ba-a838f79f5c4a	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5613-d491-4730-4cf612e25c0a	\N	\N	00200000-5613-d491-fe8f-8ed0969b4843	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5613-d491-5056-be46dce8466f	\N	\N	00200000-5613-d491-a417-b7ae43f53329	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5613-d491-2cbe-b615c189ad48	\N	\N	00200000-5613-d491-7dcb-962d8a9e73b8	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5613-d491-fc07-ca4a98887f5a	\N	\N	00200000-5613-d491-baee-bc4692e33501	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2998 (class 0 OID 21375668)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 21376157)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 21375550)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5613-d48f-9bbe-997672babf70	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5613-d48f-6b55-f0bd8769fcf1	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5613-d48f-7daf-34460bb7e99f	AL	ALB	008	Albania 	Albanija	\N
00040000-5613-d48f-4454-20b039193bc5	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5613-d48f-1d21-39242d3d6746	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5613-d48f-03f0-fe542f7890cb	AD	AND	020	Andorra 	Andora	\N
00040000-5613-d48f-11cf-0fdb4a63a63c	AO	AGO	024	Angola 	Angola	\N
00040000-5613-d48f-cb9f-a32ae1b8082a	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5613-d48f-277d-5f810352190d	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5613-d48f-4c02-75a03786324a	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5613-d48f-6941-7976d3994108	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5613-d48f-9f89-ad40becf2c0c	AM	ARM	051	Armenia 	Armenija	\N
00040000-5613-d48f-7d5b-04e561024c4c	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5613-d48f-7a74-716821a660bb	AU	AUS	036	Australia 	Avstralija	\N
00040000-5613-d48f-7171-c2829347cc65	AT	AUT	040	Austria 	Avstrija	\N
00040000-5613-d48f-0364-66ae3f19ca56	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5613-d48f-4529-fd056eff6ce3	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5613-d48f-c74a-45be713dcdc2	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5613-d48f-4ae0-8e794a7ce5a3	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5613-d48f-2139-5e14a0ab29ab	BB	BRB	052	Barbados 	Barbados	\N
00040000-5613-d48f-0f46-1810f25865a6	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5613-d48f-58fe-adcb7ff54e27	BE	BEL	056	Belgium 	Belgija	\N
00040000-5613-d48f-f015-2dcfbde5c950	BZ	BLZ	084	Belize 	Belize	\N
00040000-5613-d48f-e813-c8bdf0a45935	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5613-d48f-fb9d-ed60070b400e	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5613-d48f-73e8-e693ccb79a9c	BT	BTN	064	Bhutan 	Butan	\N
00040000-5613-d48f-109b-6891afda260d	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5613-d48f-9858-a1e3d30124ba	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5613-d48f-87d4-0a30a816f3da	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5613-d48f-e246-3ff436a3cb29	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5613-d48f-88bb-70cdbcbe8f78	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5613-d48f-bab5-a4c837eba1ac	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5613-d48f-0014-c58ad1e4accc	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5613-d48f-30ad-0ed68f963962	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5613-d48f-14f4-4c1f02b1eaba	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5613-d48f-d0c5-bf96e214c906	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5613-d48f-f3b2-9e603a14b8a7	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5613-d48f-0d3e-019384c6b36f	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5613-d48f-ad33-7ad943343206	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5613-d48f-05dc-42d7b0ae9e2a	CA	CAN	124	Canada 	Kanada	\N
00040000-5613-d48f-1b14-3e38fa5fa448	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5613-d48f-0c0f-14103ebf1d59	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5613-d48f-60d2-7904b5c1a952	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5613-d48f-f8e2-b1ea11f46499	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5613-d48f-c766-c7d43b030ab0	CL	CHL	152	Chile 	Čile	\N
00040000-5613-d48f-cc39-dc032f3b5d66	CN	CHN	156	China 	Kitajska	\N
00040000-5613-d48f-ba99-f464b4e9c3fb	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5613-d48f-8e18-c6b97bd7b8ba	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5613-d48f-73f0-948a46beb4da	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5613-d48f-b76f-34e750a90510	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5613-d48f-2425-43ef53015494	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5613-d48f-2cb2-aec7d675849d	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5613-d48f-3991-be526b83456e	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5613-d48f-8096-f9565d158fa9	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5613-d48f-b2c0-7a2fdc4b2910	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5613-d48f-e81e-d1aa42fa9db2	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5613-d48f-4357-dfb8a50c82dd	CU	CUB	192	Cuba 	Kuba	\N
00040000-5613-d48f-3705-5956112c3bfd	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5613-d48f-8234-410ddfcfe08f	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5613-d48f-8561-95114d45bacb	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5613-d48f-1e3c-de82603c522d	DK	DNK	208	Denmark 	Danska	\N
00040000-5613-d48f-4337-71cfc55a53ea	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5613-d48f-e3ef-6718d50f9f39	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5613-d48f-19c9-a31c2d4ae20e	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5613-d48f-7de3-f687eda9caed	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5613-d48f-051d-770eae91ff5d	EG	EGY	818	Egypt 	Egipt	\N
00040000-5613-d48f-168a-06be8a46eae7	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5613-d48f-c70c-6873a10deb5d	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5613-d48f-d4f5-863d859a53fb	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5613-d48f-1289-a962fe3f0cb0	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5613-d48f-5f06-886009de4e54	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5613-d48f-4d91-c7513c62b3d8	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5613-d48f-47a8-e7acaace2a9e	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5613-d48f-6a67-09753050420a	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5613-d48f-200a-4646546bfa08	FI	FIN	246	Finland 	Finska	\N
00040000-5613-d48f-f10b-12b0f6552765	FR	FRA	250	France 	Francija	\N
00040000-5613-d48f-f7b3-75212ba19553	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5613-d48f-9fd0-4aca22022976	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5613-d48f-cdc9-679f2a42dcda	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5613-d48f-36c2-d857d9080214	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5613-d48f-2ab8-1cc1d1d0ebce	GA	GAB	266	Gabon 	Gabon	\N
00040000-5613-d48f-a679-7e4f609cd277	GM	GMB	270	Gambia 	Gambija	\N
00040000-5613-d48f-8261-0d7bb431b4ed	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5613-d48f-e2f8-e98131f249d9	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5613-d48f-e800-f36506eccc37	GH	GHA	288	Ghana 	Gana	\N
00040000-5613-d48f-b657-3ea6f77d618a	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5613-d48f-df8e-1b50ffe37cea	GR	GRC	300	Greece 	Grčija	\N
00040000-5613-d48f-acfd-8305be741779	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5613-d48f-136e-38896501df3d	GD	GRD	308	Grenada 	Grenada	\N
00040000-5613-d48f-b367-c8ef6eb2feaf	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5613-d48f-675d-3d5c5b242af1	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5613-d48f-b938-aacd40673bd9	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5613-d48f-954b-a89ac9d138bb	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5613-d48f-f4ee-1a842c924c66	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5613-d48f-ab2d-2576a22dcb22	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5613-d48f-259a-1c403f54d652	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5613-d48f-e18b-c1cea0de6c03	HT	HTI	332	Haiti 	Haiti	\N
00040000-5613-d48f-2d6a-31325d52efd7	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5613-d48f-8228-b3f6577adbd8	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5613-d48f-0171-cb7740734074	HN	HND	340	Honduras 	Honduras	\N
00040000-5613-d48f-95b5-b663cb0a449a	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5613-d48f-77dc-3995098faeee	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5613-d48f-a5c4-36c167a07f07	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5613-d48f-b068-ffbfd6eeda56	IN	IND	356	India 	Indija	\N
00040000-5613-d48f-d56b-4b95c9eff3f0	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5613-d48f-6d6c-7422b17db409	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5613-d48f-3595-82734af94409	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5613-d48f-3767-b09361de16d5	IE	IRL	372	Ireland 	Irska	\N
00040000-5613-d48f-6bc1-db8e9548e7fa	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5613-d48f-ac34-5599c31a5eea	IL	ISR	376	Israel 	Izrael	\N
00040000-5613-d48f-25ff-bc17089b4619	IT	ITA	380	Italy 	Italija	\N
00040000-5613-d48f-41b6-231931691f77	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5613-d48f-0e3a-4de1f17e560c	JP	JPN	392	Japan 	Japonska	\N
00040000-5613-d48f-3ffb-b3db665906fe	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5613-d48f-34f4-92c569a1cc1f	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5613-d48f-6ef7-95a49868277e	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5613-d48f-3f40-2aa113776e2a	KE	KEN	404	Kenya 	Kenija	\N
00040000-5613-d48f-d196-bfa808d082be	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5613-d48f-31df-c7677cb5d52a	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5613-d48f-4762-0f2acd695933	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5613-d48f-a894-d5f668d1840b	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5613-d48f-52f7-331fa3d80d9d	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5613-d48f-fbee-d094d562c24f	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5613-d48f-323f-d570e748c55f	LV	LVA	428	Latvia 	Latvija	\N
00040000-5613-d48f-8186-3f5459932743	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5613-d48f-2cf7-72bbd06f416b	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5613-d48f-d9f2-fa1f980c4aa3	LR	LBR	430	Liberia 	Liberija	\N
00040000-5613-d48f-48aa-b46c0d6a75c4	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5613-d48f-8da0-a658a08bf806	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5613-d48f-07fd-2e2e9374f13c	LT	LTU	440	Lithuania 	Litva	\N
00040000-5613-d48f-903b-ba5234fa8a56	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5613-d48f-464f-a140946a2dd7	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5613-d48f-e816-a88461fc6563	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5613-d48f-ee34-56d11d861741	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5613-d48f-52ef-1e8d6d17bca3	MW	MWI	454	Malawi 	Malavi	\N
00040000-5613-d48f-e478-87afef6a3922	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5613-d48f-a27e-2fb9dba700df	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5613-d48f-b749-548aa7272126	ML	MLI	466	Mali 	Mali	\N
00040000-5613-d48f-915b-c153e70205d7	MT	MLT	470	Malta 	Malta	\N
00040000-5613-d48f-d5fd-f7f82c0dda49	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5613-d48f-443e-1a1fc87df85a	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5613-d48f-98e6-c63a22d5d599	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5613-d48f-f55c-1baad05c9874	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5613-d48f-7b23-bb7bdc6be7e8	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5613-d48f-a4d9-4a93c6ee3e65	MX	MEX	484	Mexico 	Mehika	\N
00040000-5613-d48f-8f8d-ba4f059500c6	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5613-d48f-e2bf-8a4c7462407f	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5613-d48f-2c1f-de86db7e614c	MC	MCO	492	Monaco 	Monako	\N
00040000-5613-d48f-1241-72348068c7ac	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5613-d48f-85a6-2339a31b4297	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5613-d48f-8813-ff0f1ec96dc9	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5613-d48f-b381-a6e030497938	MA	MAR	504	Morocco 	Maroko	\N
00040000-5613-d48f-898c-9ef5f74dac53	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5613-d48f-45cd-c927b1fa2278	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5613-d48f-8982-ff356e13597d	NA	NAM	516	Namibia 	Namibija	\N
00040000-5613-d48f-e2fe-1917c2fde991	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5613-d48f-996d-0c16cac804bf	NP	NPL	524	Nepal 	Nepal	\N
00040000-5613-d48f-e78e-5e817adef670	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5613-d48f-97d6-ae32f74397b3	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5613-d48f-9ed7-3878db4fe98a	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5613-d48f-3834-341777049194	NE	NER	562	Niger 	Niger 	\N
00040000-5613-d48f-2a48-c343c549dc99	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5613-d48f-9a97-980dbaee6a3f	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5613-d48f-7f87-19282abba087	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5613-d48f-929d-0fe1b266ade7	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5613-d48f-c735-741378967d33	NO	NOR	578	Norway 	Norveška	\N
00040000-5613-d48f-3609-7793c92f9920	OM	OMN	512	Oman 	Oman	\N
00040000-5613-d48f-303a-a6d1ec535821	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5613-d48f-dac8-88208c6ddfe2	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5613-d48f-234b-fe3b877fecea	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5613-d48f-71a5-67e5548bfc5b	PA	PAN	591	Panama 	Panama	\N
00040000-5613-d48f-ae9e-1b6f68b78949	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5613-d48f-bc27-53b3167c53f3	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5613-d48f-65b6-e93ecd34432b	PE	PER	604	Peru 	Peru	\N
00040000-5613-d48f-20dc-8b38dc4c2fbd	PH	PHL	608	Philippines 	Filipini	\N
00040000-5613-d48f-23ab-4835f7e800e7	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5613-d48f-ca62-cbeaeca36b33	PL	POL	616	Poland 	Poljska	\N
00040000-5613-d48f-ce63-c49316a5ba66	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5613-d48f-0d23-f9ba62fec2c9	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5613-d48f-72f8-5a688c07d4bf	QA	QAT	634	Qatar 	Katar	\N
00040000-5613-d48f-07a4-9bd024bd64a4	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5613-d48f-1c0f-340a114c0be9	RO	ROU	642	Romania 	Romunija	\N
00040000-5613-d48f-2def-845330f13370	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5613-d48f-7df0-80af675c2397	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5613-d48f-6966-1c5bf89d6871	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5613-d48f-4452-bbc0ab75ab89	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5613-d48f-36c4-23ca65aa2a4d	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5613-d48f-127d-b4eb15c9d636	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5613-d48f-6667-15a3b76168ee	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5613-d48f-e15e-548c621aa758	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5613-d48f-ec7f-cfd7559cb535	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5613-d48f-75d7-76a74a18c17d	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5613-d48f-db07-9437d0e16119	SM	SMR	674	San Marino 	San Marino	\N
00040000-5613-d48f-485e-c822ec5b8c33	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5613-d48f-112b-ffda0b7b10bd	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5613-d48f-ee2e-1e685a359592	SN	SEN	686	Senegal 	Senegal	\N
00040000-5613-d48f-4e7a-baf5c03e32b8	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5613-d48f-ab8a-3e2f769a2808	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5613-d48f-2ca3-701e5be80c6b	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5613-d48f-f71d-fc6a5591e18d	SG	SGP	702	Singapore 	Singapur	\N
00040000-5613-d48f-200b-b93c10db951c	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5613-d48f-d58a-a5b762f1a4ee	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5613-d48f-fd55-13792b4bced7	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5613-d48f-107a-e718cdd7fac0	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5613-d48f-d91c-7104963dab30	SO	SOM	706	Somalia 	Somalija	\N
00040000-5613-d48f-1635-297e79c5461f	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5613-d48f-d993-fc6bef1f36e9	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5613-d48f-dc58-bccd25c7c87b	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5613-d48f-bf57-9bad059147c9	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5613-d48f-af76-7b15904a6019	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5613-d48f-7841-bac0c38d0812	SD	SDN	729	Sudan 	Sudan	\N
00040000-5613-d48f-d032-0dc9195d94f6	SR	SUR	740	Suriname 	Surinam	\N
00040000-5613-d48f-293c-4aaed8016a2d	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5613-d48f-bcc9-a527439e27ce	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5613-d48f-aa12-6da54d52f6f7	SE	SWE	752	Sweden 	Švedska	\N
00040000-5613-d48f-9a3c-66da7de997e9	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5613-d48f-1743-6fdab357542f	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5613-d48f-8f54-6a15ab9c403d	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5613-d48f-d972-4e493d8c0c57	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5613-d48f-df6c-6d2313c94a1b	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5613-d48f-3296-1f09f692aefb	TH	THA	764	Thailand 	Tajska	\N
00040000-5613-d48f-f243-6980cb52c2d0	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5613-d48f-d347-8ce2d7c417f4	TG	TGO	768	Togo 	Togo	\N
00040000-5613-d48f-4799-953354760361	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5613-d48f-0215-a709f5acdc9b	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5613-d48f-9f42-ecf3ef6d0f05	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5613-d48f-68cc-dc71ada3484c	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5613-d48f-9328-4d9e4df364fa	TR	TUR	792	Turkey 	Turčija	\N
00040000-5613-d48f-d344-603b13aac075	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5613-d48f-8e52-aa738327b8b4	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5613-d48f-b60b-eccbc0eb0a47	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5613-d48f-5872-beff08148174	UG	UGA	800	Uganda 	Uganda	\N
00040000-5613-d48f-6fff-e345e7520685	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5613-d48f-de73-f30ef6ebb154	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5613-d48f-e6cf-cb3d68f62e25	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5613-d48f-a189-02d75f1ddc17	US	USA	840	United States 	Združene države Amerike	\N
00040000-5613-d48f-d1bc-df0746e70d89	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5613-d48f-73ae-2d6f59dbf907	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5613-d48f-f5dc-85da35056dfa	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5613-d48f-f51b-f577f8a061e8	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5613-d48f-64dc-45a42ec7f8e5	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5613-d48f-8617-2f152193bbe9	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5613-d48f-9133-98dbfcb408cf	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5613-d48f-e27f-29699835ff5a	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5613-d48f-1b05-768794282e25	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5613-d48f-0e97-a4d48beb70ce	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5613-d48f-8018-943082b53e14	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5613-d48f-24ff-f77daccf2d76	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5613-d48f-a730-4eb89028d1e2	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3029 (class 0 OID 21375999)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5613-d491-5238-12968cffdc5c	000e0000-5613-d491-df4a-cbc0c294eaeb	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5613-d48f-f517-f70806585636	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5613-d491-5df0-5ad5ced9b7f2	000e0000-5613-d491-d2cf-553fa66cbb12	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5613-d48f-3666-98ea391a1b7a	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5613-d491-3ee3-921097d8bed6	000e0000-5613-d491-36c1-d7fb3e2ff28f	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5613-d48f-f517-f70806585636	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5613-d491-ad6e-dc8ed54f6075	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5613-d491-59fb-f254837d0ac6	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3014 (class 0 OID 21375801)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5613-d491-6555-0781fd4b8d51	000e0000-5613-d491-d2cf-553fa66cbb12	000c0000-5613-d491-5c56-44cc877aa678	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5613-d48f-7704-f3dfe2df7dd2
000d0000-5613-d491-1343-23d4d380fc8e	000e0000-5613-d491-d2cf-553fa66cbb12	000c0000-5613-d491-310d-d16c48c77439	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5613-d48f-f528-221da289db28
000d0000-5613-d491-8ee0-99192496426c	000e0000-5613-d491-d2cf-553fa66cbb12	000c0000-5613-d491-b1c8-32562696e1cd	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5613-d48f-7b1e-c44b7df51099
000d0000-5613-d491-c2b2-ade538b33258	000e0000-5613-d491-d2cf-553fa66cbb12	000c0000-5613-d491-984c-d3ae1f26d7ad	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5613-d48f-03b8-7dbe3e741669
000d0000-5613-d491-8478-cd51abf2ea6d	000e0000-5613-d491-d2cf-553fa66cbb12	000c0000-5613-d491-d0e3-213117532fff	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5613-d48f-03b8-7dbe3e741669
000d0000-5613-d491-a728-d76a30ae46f7	000e0000-5613-d491-d2cf-553fa66cbb12	000c0000-5613-d491-ad43-2e1b5e187ac3	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5613-d48f-7704-f3dfe2df7dd2
000d0000-5613-d491-ae9b-48e9b7b795e4	000e0000-5613-d491-d2cf-553fa66cbb12	000c0000-5613-d491-a2bd-fc69afd7a3d1	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5613-d48f-7704-f3dfe2df7dd2
000d0000-5613-d491-3737-f6cd3ff6af45	000e0000-5613-d491-d2cf-553fa66cbb12	000c0000-5613-d491-7c9b-e5d3875b4c74	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5613-d48f-c8b6-722f16b24854
000d0000-5613-d491-b24b-180d6ec67027	000e0000-5613-d491-d2cf-553fa66cbb12	000c0000-5613-d491-1b4d-8fabfe3285a6	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5613-d48f-e597-89ffe2085876
\.


--
-- TOC entry 2994 (class 0 OID 21375616)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 21375590)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 21375567)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5613-d491-1847-6a220d564552	00080000-5613-d491-9a88-d7bcd69fa504	00090000-5613-d491-82d6-4ae0dca7b320	AK		igralka
\.


--
-- TOC entry 3003 (class 0 OID 21375715)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 21376212)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3041 (class 0 OID 21376224)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3043 (class 0 OID 21376246)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 21093458)
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
\.


--
-- TOC entry 3007 (class 0 OID 21375740)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 21375524)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5613-d490-ecb8-ce4cc44a8a6d	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5613-d490-3edd-148bf8aa9481	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5613-d490-6915-1917f476035e	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5613-d490-74cc-7e1768d8d245	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5613-d490-1886-5ffc8c2a11e9	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5613-d490-44dc-c6a1407d2d21	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5613-d490-6582-e82bb74fc445	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5613-d490-1b44-09b340901c46	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5613-d490-0bc2-d201448c4c8d	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5613-d490-3e15-4940a51dfbbf	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5613-d490-25f6-bc6a11890cc2	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5613-d490-07d5-386add029ad4	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5613-d490-e134-b0592ab66ecc	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5613-d490-c5ce-1dbd313d4208	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5613-d490-f491-df0ca577948a	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5613-d491-c286-943b789c7afb	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5613-d491-ea4e-4c6ef45ea1ff	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5613-d491-df1d-4647ec84a4ee	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5613-d491-3f83-a811410b5caf	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5613-d491-25dd-80115d5d919b	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5613-d493-a13f-ee5c3b240e42	application.tenant.maticnopodjetje	string	s:36:"00080000-5613-d493-3e2f-c153eb32ff0f";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 2981 (class 0 OID 21375438)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5613-d491-485e-002786cb24a7	00000000-5613-d491-c286-943b789c7afb	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5613-d491-0dd1-2356e37a12d9	00000000-5613-d491-c286-943b789c7afb	00010000-5613-d48f-6770-48b337d250e6	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5613-d491-da26-c4eca2f12415	00000000-5613-d491-ea4e-4c6ef45ea1ff	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2982 (class 0 OID 21375449)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5613-d491-07d6-66916467ee0a	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5613-d491-ce49-4e6bad2bf9b0	00010000-5613-d491-58b2-ae3bba6a3497	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5613-d491-deb5-c7a657fdbda0	00010000-5613-d491-caa4-fd22d71746bb	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5613-d491-b22b-79f38a974796	00010000-5613-d491-5caf-581e6110f86a	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5613-d491-d5a6-b976e9dfcebe	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5613-d491-7228-3e529a540f73	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5613-d491-2258-b257eac038a1	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5613-d491-6cdf-d9161acab1df	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5613-d491-82d6-4ae0dca7b320	00010000-5613-d491-825f-ae40186085cb	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5613-d491-d3a6-dd650004fbdb	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5613-d491-d88a-054739ba5b3b	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5613-d491-4b27-cad23acf383a	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5613-d491-77e4-c4a4a4453162	00010000-5613-d491-17d1-943095134d56	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5613-d491-1a75-945ec3e41338	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5613-d491-24f6-e22cbefac95c	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5613-d491-7e03-6d68af106ce9	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5613-d491-7d0b-4fba7a22a344	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5613-d491-eb93-a0eee9993e55	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2977 (class 0 OID 21375403)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5613-d48f-983f-6c84b297c0a7	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5613-d48f-df35-e88318b2a044	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5613-d48f-1edd-4071486c6fc6	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5613-d48f-5ee1-06c9a3fbfd6a	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5613-d48f-65f9-80c1572eebf9	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5613-d48f-e104-542fb5440844	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5613-d48f-5c88-ed678fb9faaa	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5613-d48f-e21d-4955a053aa06	Abonma-read	Abonma - branje	f
00030000-5613-d48f-aa4a-f5d825ae09f3	Abonma-write	Abonma - spreminjanje	f
00030000-5613-d48f-42bb-e60fecfaa630	Alternacija-read	Alternacija - branje	f
00030000-5613-d48f-4066-e85e324eb996	Alternacija-write	Alternacija - spreminjanje	f
00030000-5613-d48f-e936-9e5315ec99f0	Arhivalija-read	Arhivalija - branje	f
00030000-5613-d48f-d980-42d4363d888b	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5613-d48f-01d3-70a7662774f9	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5613-d48f-2979-073ef81149ed	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5613-d48f-64bc-dd519130ec8d	Besedilo-read	Besedilo - branje	f
00030000-5613-d48f-d673-d0d8e7c0f5b9	Besedilo-write	Besedilo - spreminjanje	f
00030000-5613-d48f-67da-6ca3f4908b6e	DogodekIzven-read	DogodekIzven - branje	f
00030000-5613-d48f-1a27-6f5d4732e882	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5613-d48f-2ac3-1a6755e7ef73	Dogodek-read	Dogodek - branje	f
00030000-5613-d48f-9604-0035b114db4a	Dogodek-write	Dogodek - spreminjanje	f
00030000-5613-d48f-56e6-99c461ed49b4	DrugiVir-read	DrugiVir - branje	f
00030000-5613-d48f-8ed4-193fa686f314	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5613-d48f-fb3d-c23c99172e89	Drzava-read	Drzava - branje	f
00030000-5613-d48f-1e7b-4059543bb9dc	Drzava-write	Drzava - spreminjanje	f
00030000-5613-d48f-9070-7a5fed102bf7	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5613-d48f-731e-7c40ef4443e9	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5613-d48f-6c0b-d6ce1d31e6cb	Funkcija-read	Funkcija - branje	f
00030000-5613-d48f-0135-785ea7cc68ef	Funkcija-write	Funkcija - spreminjanje	f
00030000-5613-d48f-bf02-2a4a1b55294d	Gostovanje-read	Gostovanje - branje	f
00030000-5613-d48f-62b1-360bc3df0d0c	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5613-d48f-8cf8-63c69d8281f6	Gostujoca-read	Gostujoca - branje	f
00030000-5613-d48f-2e45-1f31496c3172	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5613-d48f-4674-f29ff604cec3	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5613-d48f-44c3-a3941f40a432	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5613-d48f-7efb-3502295dbf94	Kupec-read	Kupec - branje	f
00030000-5613-d48f-7ce8-563ca7f38942	Kupec-write	Kupec - spreminjanje	f
00030000-5613-d48f-b61d-75607049a1a1	NacinPlacina-read	NacinPlacina - branje	f
00030000-5613-d48f-5a33-8ce8de572745	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5613-d48f-a780-a032e63bfeb9	Option-read	Option - branje	f
00030000-5613-d48f-503f-977885e1fc56	Option-write	Option - spreminjanje	f
00030000-5613-d48f-87bd-d4d8a15a99a0	OptionValue-read	OptionValue - branje	f
00030000-5613-d48f-e72d-e8a6c4715f40	OptionValue-write	OptionValue - spreminjanje	f
00030000-5613-d48f-d501-b68341a87206	Oseba-read	Oseba - branje	f
00030000-5613-d48f-4843-2ace4c0f54c4	Oseba-write	Oseba - spreminjanje	f
00030000-5613-d48f-f4d1-6120262aa805	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5613-d48f-46d6-d7a888d1819e	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5613-d48f-5ec8-c266b06fb8b1	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5613-d48f-d336-0d98cc66b215	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5613-d48f-857a-a6b10f0dad0a	Pogodba-read	Pogodba - branje	f
00030000-5613-d48f-42a3-e1a30cbc0369	Pogodba-write	Pogodba - spreminjanje	f
00030000-5613-d48f-4c69-f0686d963795	Popa-read	Popa - branje	f
00030000-5613-d48f-cb94-30a90af20108	Popa-write	Popa - spreminjanje	f
00030000-5613-d48f-7517-845849cce9d0	Posta-read	Posta - branje	f
00030000-5613-d48f-859f-c38e9c5e1d4c	Posta-write	Posta - spreminjanje	f
00030000-5613-d48f-8ed2-7fab455eeed0	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5613-d48f-d2d4-f30db6896680	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5613-d48f-05e0-1468e7f7401a	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5613-d48f-7174-ee0cf6fa2523	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5613-d48f-8f75-dd44aa15732a	PostniNaslov-read	PostniNaslov - branje	f
00030000-5613-d48f-f6be-591b03512534	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5613-d48f-2e84-ba8d9e6063b4	Predstava-read	Predstava - branje	f
00030000-5613-d48f-b472-f7aab65c3563	Predstava-write	Predstava - spreminjanje	f
00030000-5613-d48f-0d97-bfdc903145d6	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5613-d48f-cb47-557340e0508e	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5613-d48f-4f0e-3985d86c3131	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5613-d48f-e31d-dc61ec35045a	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5613-d48f-695a-50ef51fdbeb7	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5613-d48f-3976-19da35a5656e	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5613-d48f-17fb-6c67a91da8c8	ProgramDela-read	ProgramDela - branje	f
00030000-5613-d48f-8d0a-2d8856769f10	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5613-d48f-f6fa-1727a34a7b01	ProgramFestival-read	ProgramFestival - branje	f
00030000-5613-d48f-53c5-5ca35447d226	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5613-d48f-648a-2c9ae958de47	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5613-d48f-eb03-26117a839e12	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5613-d48f-d6b1-ba4f4a8ef84e	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5613-d48f-ac33-01e8d5c729ad	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5613-d48f-11af-e3ace4a1dfe1	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5613-d48f-d39e-43224f4a1bbe	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5613-d48f-f2f3-8fce2ca96113	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5613-d48f-0cea-85c238d5ab4a	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5613-d48f-e451-66788ab7cbe0	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5613-d48f-14a1-190694a630b4	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5613-d48f-bf85-e27cf7a02fdf	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5613-d48f-d23a-ae166f103c71	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5613-d48f-54c7-35e0db9d3bc0	ProgramRazno-read	ProgramRazno - branje	f
00030000-5613-d48f-3ecd-d216bc7a927c	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5613-d48f-d7cd-04ac38f6c1f6	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5613-d48f-30c9-905550ab293c	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5613-d48f-89bd-94c8d6cbd81d	Prostor-read	Prostor - branje	f
00030000-5613-d48f-2e90-7f45abce1a4b	Prostor-write	Prostor - spreminjanje	f
00030000-5613-d48f-0232-d2031755cc9a	Racun-read	Racun - branje	f
00030000-5613-d48f-0729-f56ebe17d80f	Racun-write	Racun - spreminjanje	f
00030000-5613-d48f-2e49-3881073292f6	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5613-d48f-a8e6-11a61f334528	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5613-d48f-c15c-6a114966ed37	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5613-d48f-183b-1fe3991a88a8	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5613-d48f-c8a1-ed57d4e499fb	Rekvizit-read	Rekvizit - branje	f
00030000-5613-d48f-b766-e0d6626223c9	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5613-d48f-6de9-08dc77a517fa	Revizija-read	Revizija - branje	f
00030000-5613-d48f-c18f-339e903906bf	Revizija-write	Revizija - spreminjanje	f
00030000-5613-d48f-815f-3f460012b4a2	Rezervacija-read	Rezervacija - branje	f
00030000-5613-d48f-c721-03b267196cec	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5613-d48f-c912-e7e56c03abe7	SedezniRed-read	SedezniRed - branje	f
00030000-5613-d48f-c881-acf241e6ac96	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5613-d48f-e411-99822eb7e5e1	Sedez-read	Sedez - branje	f
00030000-5613-d48f-93a3-b2db4e6b19a1	Sedez-write	Sedez - spreminjanje	f
00030000-5613-d48f-b362-f7be7442c51b	Sezona-read	Sezona - branje	f
00030000-5613-d48f-c4ec-d74539e8ddac	Sezona-write	Sezona - spreminjanje	f
00030000-5613-d48f-45c3-650e4f358751	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5613-d48f-e595-a389a7f0512a	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5613-d48f-89a1-8957a8d62a6f	Stevilcenje-read	Stevilcenje - branje	f
00030000-5613-d48f-8c11-2969a78f7632	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5613-d48f-22ff-5b0f36be4dc5	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5613-d48f-3635-127ea2727d98	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5613-d48f-dda2-124a7529d9ab	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5613-d48f-4f56-cab5c95db9a8	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5613-d48f-4e95-f7b3681a343c	Telefonska-read	Telefonska - branje	f
00030000-5613-d48f-f48a-2a7ce632257a	Telefonska-write	Telefonska - spreminjanje	f
00030000-5613-d48f-3da2-d302a29b1c29	TerminStoritve-read	TerminStoritve - branje	f
00030000-5613-d48f-86df-f62af4e2b349	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5613-d48f-62e9-35b7e57a170c	TipFunkcije-read	TipFunkcije - branje	f
00030000-5613-d48f-6ea7-fb18293ccc14	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5613-d48f-9654-f1843aa8df05	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5613-d48f-7f7f-12ff2278ac47	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5613-d48f-1bdc-7bcfd7b311c1	Trr-read	Trr - branje	f
00030000-5613-d48f-be23-3d92970aafd6	Trr-write	Trr - spreminjanje	f
00030000-5613-d48f-f19a-5c80935a8e16	Uprizoritev-read	Uprizoritev - branje	f
00030000-5613-d48f-2510-e4f095ee7e71	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5613-d48f-11ad-c1344220e3df	Vaja-read	Vaja - branje	f
00030000-5613-d48f-7aa1-a93cf4866128	Vaja-write	Vaja - spreminjanje	f
00030000-5613-d48f-6396-ef5afc411297	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5613-d48f-992b-85311beb5290	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5613-d48f-52a4-dbd5d088638d	VrstaStroska-read	VrstaStroska - branje	f
00030000-5613-d48f-eaef-afa71d2b987a	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5613-d48f-a6ce-86127d80ec4d	Zaposlitev-read	Zaposlitev - branje	f
00030000-5613-d48f-1e69-2f75cd8c893d	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5613-d48f-093c-084cd7e17613	Zasedenost-read	Zasedenost - branje	f
00030000-5613-d48f-a334-c370b5031176	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5613-d48f-dfed-e631678dfa24	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5613-d48f-6731-b95e062898e3	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5613-d48f-9a67-e8ffeb15250f	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5613-d48f-eb16-b5a7bff37a64	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5613-d48f-ca35-0111193a441e	Job-read	Branje opravil - samo zase - branje	f
00030000-5613-d48f-5d8e-ba4625a9a611	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5613-d48f-f5aa-a235ba49f10e	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5613-d48f-54c1-a8e4befbff99	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5613-d48f-c675-aaa0aa40d356	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5613-d48f-82e8-6171dec5f18c	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5613-d48f-ec76-a21fe506ad76	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5613-d48f-aacb-495c9f4360dc	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5613-d48f-4c58-6df5d0b82672	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5613-d48f-8037-80220c991359	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5613-d48f-453e-3df6f5ab41d7	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5613-d48f-a454-aa505ba12dba	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5613-d48f-58bc-4750dce5ad26	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5613-d48f-9e0e-7f40e191f48f	Datoteka-write	Datoteka - spreminjanje	f
00030000-5613-d48f-ffaf-9e552840e24e	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2979 (class 0 OID 21375422)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5613-d48f-0332-57ba50269e02	00030000-5613-d48f-df35-e88318b2a044
00020000-5613-d48f-1063-6f6f4be50c2c	00030000-5613-d48f-fb3d-c23c99172e89
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-e21d-4955a053aa06
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-aa4a-f5d825ae09f3
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-42bb-e60fecfaa630
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-4066-e85e324eb996
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-e936-9e5315ec99f0
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-2ac3-1a6755e7ef73
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-5ee1-06c9a3fbfd6a
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-9604-0035b114db4a
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-fb3d-c23c99172e89
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-1e7b-4059543bb9dc
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-6c0b-d6ce1d31e6cb
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-0135-785ea7cc68ef
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-bf02-2a4a1b55294d
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-62b1-360bc3df0d0c
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-8cf8-63c69d8281f6
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-2e45-1f31496c3172
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-4674-f29ff604cec3
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-44c3-a3941f40a432
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-a780-a032e63bfeb9
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-87bd-d4d8a15a99a0
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-d501-b68341a87206
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-4843-2ace4c0f54c4
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-4c69-f0686d963795
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-cb94-30a90af20108
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-7517-845849cce9d0
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-859f-c38e9c5e1d4c
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-8f75-dd44aa15732a
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-f6be-591b03512534
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-2e84-ba8d9e6063b4
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-b472-f7aab65c3563
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-695a-50ef51fdbeb7
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-3976-19da35a5656e
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-89bd-94c8d6cbd81d
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-2e90-7f45abce1a4b
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-c15c-6a114966ed37
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-183b-1fe3991a88a8
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-c8a1-ed57d4e499fb
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-b766-e0d6626223c9
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-b362-f7be7442c51b
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-c4ec-d74539e8ddac
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-62e9-35b7e57a170c
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-f19a-5c80935a8e16
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-2510-e4f095ee7e71
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-11ad-c1344220e3df
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-7aa1-a93cf4866128
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-093c-084cd7e17613
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-a334-c370b5031176
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-dfed-e631678dfa24
00020000-5613-d48f-ac7a-d1e22310dcd9	00030000-5613-d48f-9a67-e8ffeb15250f
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-e21d-4955a053aa06
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-e936-9e5315ec99f0
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-2ac3-1a6755e7ef73
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-fb3d-c23c99172e89
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-bf02-2a4a1b55294d
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-8cf8-63c69d8281f6
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-4674-f29ff604cec3
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-44c3-a3941f40a432
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-a780-a032e63bfeb9
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-87bd-d4d8a15a99a0
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-d501-b68341a87206
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-4843-2ace4c0f54c4
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-4c69-f0686d963795
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-7517-845849cce9d0
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-8f75-dd44aa15732a
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-f6be-591b03512534
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-2e84-ba8d9e6063b4
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-89bd-94c8d6cbd81d
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-c15c-6a114966ed37
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-c8a1-ed57d4e499fb
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-b362-f7be7442c51b
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-4e95-f7b3681a343c
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-f48a-2a7ce632257a
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-1bdc-7bcfd7b311c1
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-be23-3d92970aafd6
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-a6ce-86127d80ec4d
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-1e69-2f75cd8c893d
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-dfed-e631678dfa24
00020000-5613-d48f-c653-0cb5032cf5f9	00030000-5613-d48f-9a67-e8ffeb15250f
00020000-5613-d48f-c639-1705bcad2e8f	00030000-5613-d48f-e21d-4955a053aa06
00020000-5613-d48f-c639-1705bcad2e8f	00030000-5613-d48f-42bb-e60fecfaa630
00020000-5613-d48f-c639-1705bcad2e8f	00030000-5613-d48f-e936-9e5315ec99f0
00020000-5613-d48f-c639-1705bcad2e8f	00030000-5613-d48f-d980-42d4363d888b
00020000-5613-d48f-c639-1705bcad2e8f	00030000-5613-d48f-64bc-dd519130ec8d
00020000-5613-d48f-c639-1705bcad2e8f	00030000-5613-d48f-67da-6ca3f4908b6e
00020000-5613-d48f-c639-1705bcad2e8f	00030000-5613-d48f-2ac3-1a6755e7ef73
00020000-5613-d48f-c639-1705bcad2e8f	00030000-5613-d48f-fb3d-c23c99172e89
00020000-5613-d48f-c639-1705bcad2e8f	00030000-5613-d48f-6c0b-d6ce1d31e6cb
00020000-5613-d48f-c639-1705bcad2e8f	00030000-5613-d48f-bf02-2a4a1b55294d
00020000-5613-d48f-c639-1705bcad2e8f	00030000-5613-d48f-8cf8-63c69d8281f6
00020000-5613-d48f-c639-1705bcad2e8f	00030000-5613-d48f-4674-f29ff604cec3
00020000-5613-d48f-c639-1705bcad2e8f	00030000-5613-d48f-a780-a032e63bfeb9
00020000-5613-d48f-c639-1705bcad2e8f	00030000-5613-d48f-87bd-d4d8a15a99a0
00020000-5613-d48f-c639-1705bcad2e8f	00030000-5613-d48f-d501-b68341a87206
00020000-5613-d48f-c639-1705bcad2e8f	00030000-5613-d48f-4c69-f0686d963795
00020000-5613-d48f-c639-1705bcad2e8f	00030000-5613-d48f-7517-845849cce9d0
00020000-5613-d48f-c639-1705bcad2e8f	00030000-5613-d48f-2e84-ba8d9e6063b4
00020000-5613-d48f-c639-1705bcad2e8f	00030000-5613-d48f-695a-50ef51fdbeb7
00020000-5613-d48f-c639-1705bcad2e8f	00030000-5613-d48f-89bd-94c8d6cbd81d
00020000-5613-d48f-c639-1705bcad2e8f	00030000-5613-d48f-c15c-6a114966ed37
00020000-5613-d48f-c639-1705bcad2e8f	00030000-5613-d48f-c8a1-ed57d4e499fb
00020000-5613-d48f-c639-1705bcad2e8f	00030000-5613-d48f-b362-f7be7442c51b
00020000-5613-d48f-c639-1705bcad2e8f	00030000-5613-d48f-62e9-35b7e57a170c
00020000-5613-d48f-c639-1705bcad2e8f	00030000-5613-d48f-11ad-c1344220e3df
00020000-5613-d48f-c639-1705bcad2e8f	00030000-5613-d48f-093c-084cd7e17613
00020000-5613-d48f-c639-1705bcad2e8f	00030000-5613-d48f-dfed-e631678dfa24
00020000-5613-d48f-c639-1705bcad2e8f	00030000-5613-d48f-9a67-e8ffeb15250f
00020000-5613-d48f-6528-cf5f65f6d963	00030000-5613-d48f-e21d-4955a053aa06
00020000-5613-d48f-6528-cf5f65f6d963	00030000-5613-d48f-aa4a-f5d825ae09f3
00020000-5613-d48f-6528-cf5f65f6d963	00030000-5613-d48f-4066-e85e324eb996
00020000-5613-d48f-6528-cf5f65f6d963	00030000-5613-d48f-e936-9e5315ec99f0
00020000-5613-d48f-6528-cf5f65f6d963	00030000-5613-d48f-2ac3-1a6755e7ef73
00020000-5613-d48f-6528-cf5f65f6d963	00030000-5613-d48f-fb3d-c23c99172e89
00020000-5613-d48f-6528-cf5f65f6d963	00030000-5613-d48f-bf02-2a4a1b55294d
00020000-5613-d48f-6528-cf5f65f6d963	00030000-5613-d48f-8cf8-63c69d8281f6
00020000-5613-d48f-6528-cf5f65f6d963	00030000-5613-d48f-a780-a032e63bfeb9
00020000-5613-d48f-6528-cf5f65f6d963	00030000-5613-d48f-87bd-d4d8a15a99a0
00020000-5613-d48f-6528-cf5f65f6d963	00030000-5613-d48f-4c69-f0686d963795
00020000-5613-d48f-6528-cf5f65f6d963	00030000-5613-d48f-7517-845849cce9d0
00020000-5613-d48f-6528-cf5f65f6d963	00030000-5613-d48f-2e84-ba8d9e6063b4
00020000-5613-d48f-6528-cf5f65f6d963	00030000-5613-d48f-89bd-94c8d6cbd81d
00020000-5613-d48f-6528-cf5f65f6d963	00030000-5613-d48f-c15c-6a114966ed37
00020000-5613-d48f-6528-cf5f65f6d963	00030000-5613-d48f-c8a1-ed57d4e499fb
00020000-5613-d48f-6528-cf5f65f6d963	00030000-5613-d48f-b362-f7be7442c51b
00020000-5613-d48f-6528-cf5f65f6d963	00030000-5613-d48f-62e9-35b7e57a170c
00020000-5613-d48f-6528-cf5f65f6d963	00030000-5613-d48f-dfed-e631678dfa24
00020000-5613-d48f-6528-cf5f65f6d963	00030000-5613-d48f-9a67-e8ffeb15250f
00020000-5613-d48f-8cc6-9ea58b1fc536	00030000-5613-d48f-e21d-4955a053aa06
00020000-5613-d48f-8cc6-9ea58b1fc536	00030000-5613-d48f-e936-9e5315ec99f0
00020000-5613-d48f-8cc6-9ea58b1fc536	00030000-5613-d48f-2ac3-1a6755e7ef73
00020000-5613-d48f-8cc6-9ea58b1fc536	00030000-5613-d48f-fb3d-c23c99172e89
00020000-5613-d48f-8cc6-9ea58b1fc536	00030000-5613-d48f-bf02-2a4a1b55294d
00020000-5613-d48f-8cc6-9ea58b1fc536	00030000-5613-d48f-8cf8-63c69d8281f6
00020000-5613-d48f-8cc6-9ea58b1fc536	00030000-5613-d48f-a780-a032e63bfeb9
00020000-5613-d48f-8cc6-9ea58b1fc536	00030000-5613-d48f-87bd-d4d8a15a99a0
00020000-5613-d48f-8cc6-9ea58b1fc536	00030000-5613-d48f-4c69-f0686d963795
00020000-5613-d48f-8cc6-9ea58b1fc536	00030000-5613-d48f-7517-845849cce9d0
00020000-5613-d48f-8cc6-9ea58b1fc536	00030000-5613-d48f-2e84-ba8d9e6063b4
00020000-5613-d48f-8cc6-9ea58b1fc536	00030000-5613-d48f-89bd-94c8d6cbd81d
00020000-5613-d48f-8cc6-9ea58b1fc536	00030000-5613-d48f-c15c-6a114966ed37
00020000-5613-d48f-8cc6-9ea58b1fc536	00030000-5613-d48f-c8a1-ed57d4e499fb
00020000-5613-d48f-8cc6-9ea58b1fc536	00030000-5613-d48f-b362-f7be7442c51b
00020000-5613-d48f-8cc6-9ea58b1fc536	00030000-5613-d48f-3da2-d302a29b1c29
00020000-5613-d48f-8cc6-9ea58b1fc536	00030000-5613-d48f-1edd-4071486c6fc6
00020000-5613-d48f-8cc6-9ea58b1fc536	00030000-5613-d48f-62e9-35b7e57a170c
00020000-5613-d48f-8cc6-9ea58b1fc536	00030000-5613-d48f-dfed-e631678dfa24
00020000-5613-d48f-8cc6-9ea58b1fc536	00030000-5613-d48f-9a67-e8ffeb15250f
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-983f-6c84b297c0a7
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-df35-e88318b2a044
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-1edd-4071486c6fc6
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-5ee1-06c9a3fbfd6a
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-65f9-80c1572eebf9
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-e104-542fb5440844
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-5c88-ed678fb9faaa
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-e21d-4955a053aa06
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-aa4a-f5d825ae09f3
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-42bb-e60fecfaa630
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-4066-e85e324eb996
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-e936-9e5315ec99f0
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-d980-42d4363d888b
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-64bc-dd519130ec8d
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-d673-d0d8e7c0f5b9
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-67da-6ca3f4908b6e
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-1a27-6f5d4732e882
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-2ac3-1a6755e7ef73
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-9604-0035b114db4a
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-fb3d-c23c99172e89
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-1e7b-4059543bb9dc
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-56e6-99c461ed49b4
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-8ed4-193fa686f314
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-9070-7a5fed102bf7
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-731e-7c40ef4443e9
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-6c0b-d6ce1d31e6cb
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-0135-785ea7cc68ef
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-bf02-2a4a1b55294d
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-62b1-360bc3df0d0c
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-8cf8-63c69d8281f6
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-2e45-1f31496c3172
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-4674-f29ff604cec3
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-44c3-a3941f40a432
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-7efb-3502295dbf94
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-7ce8-563ca7f38942
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-b61d-75607049a1a1
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-5a33-8ce8de572745
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-a780-a032e63bfeb9
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-503f-977885e1fc56
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-87bd-d4d8a15a99a0
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-e72d-e8a6c4715f40
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-d501-b68341a87206
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-4843-2ace4c0f54c4
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-f4d1-6120262aa805
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-46d6-d7a888d1819e
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-5ec8-c266b06fb8b1
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-d336-0d98cc66b215
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-857a-a6b10f0dad0a
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-42a3-e1a30cbc0369
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-4c69-f0686d963795
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-cb94-30a90af20108
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-7517-845849cce9d0
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-859f-c38e9c5e1d4c
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-8ed2-7fab455eeed0
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-d2d4-f30db6896680
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-05e0-1468e7f7401a
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-7174-ee0cf6fa2523
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-8f75-dd44aa15732a
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-f6be-591b03512534
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-2e84-ba8d9e6063b4
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-b472-f7aab65c3563
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-0d97-bfdc903145d6
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-cb47-557340e0508e
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-4f0e-3985d86c3131
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-e31d-dc61ec35045a
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-695a-50ef51fdbeb7
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-3976-19da35a5656e
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-17fb-6c67a91da8c8
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-8d0a-2d8856769f10
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-f6fa-1727a34a7b01
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-53c5-5ca35447d226
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-648a-2c9ae958de47
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-eb03-26117a839e12
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-d6b1-ba4f4a8ef84e
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-ac33-01e8d5c729ad
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-11af-e3ace4a1dfe1
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-d39e-43224f4a1bbe
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-f2f3-8fce2ca96113
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-0cea-85c238d5ab4a
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-e451-66788ab7cbe0
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-14a1-190694a630b4
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-bf85-e27cf7a02fdf
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-d23a-ae166f103c71
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-54c7-35e0db9d3bc0
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-3ecd-d216bc7a927c
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-d7cd-04ac38f6c1f6
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-30c9-905550ab293c
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-89bd-94c8d6cbd81d
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-2e90-7f45abce1a4b
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-0232-d2031755cc9a
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-0729-f56ebe17d80f
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-2e49-3881073292f6
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-a8e6-11a61f334528
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-c15c-6a114966ed37
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-183b-1fe3991a88a8
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-c8a1-ed57d4e499fb
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-b766-e0d6626223c9
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-6de9-08dc77a517fa
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-c18f-339e903906bf
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-815f-3f460012b4a2
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-c721-03b267196cec
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-c912-e7e56c03abe7
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-c881-acf241e6ac96
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-e411-99822eb7e5e1
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-93a3-b2db4e6b19a1
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-b362-f7be7442c51b
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-c4ec-d74539e8ddac
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-45c3-650e4f358751
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-e595-a389a7f0512a
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-89a1-8957a8d62a6f
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-8c11-2969a78f7632
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-22ff-5b0f36be4dc5
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-3635-127ea2727d98
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-dda2-124a7529d9ab
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-4f56-cab5c95db9a8
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-4e95-f7b3681a343c
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-f48a-2a7ce632257a
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-3da2-d302a29b1c29
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-86df-f62af4e2b349
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-62e9-35b7e57a170c
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-6ea7-fb18293ccc14
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-9654-f1843aa8df05
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-7f7f-12ff2278ac47
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-1bdc-7bcfd7b311c1
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-be23-3d92970aafd6
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-f19a-5c80935a8e16
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-2510-e4f095ee7e71
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-11ad-c1344220e3df
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-7aa1-a93cf4866128
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-6396-ef5afc411297
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-992b-85311beb5290
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-52a4-dbd5d088638d
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-eaef-afa71d2b987a
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-a6ce-86127d80ec4d
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-1e69-2f75cd8c893d
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-093c-084cd7e17613
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-a334-c370b5031176
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-dfed-e631678dfa24
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-6731-b95e062898e3
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-9a67-e8ffeb15250f
00020000-5613-d491-5978-1b8162bd7d88	00030000-5613-d48f-eb16-b5a7bff37a64
\.


--
-- TOC entry 3008 (class 0 OID 21375747)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 21375781)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 21375917)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5613-d491-f0eb-4bc32c1be107	00090000-5613-d491-07d6-66916467ee0a	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5613-d491-b097-957cb3e9f4a4	00090000-5613-d491-7228-3e529a540f73	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5613-d491-285d-78250b930e38	00090000-5613-d491-77e4-c4a4a4453162	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5613-d491-a671-56a89120ec48	00090000-5613-d491-d3a6-dd650004fbdb	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2984 (class 0 OID 21375482)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5613-d491-9a88-d7bcd69fa504	00040000-5613-d48f-fd55-13792b4bced7	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-d491-5143-e9453aca044f	00040000-5613-d48f-fd55-13792b4bced7	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5613-d491-4f0a-0c16eed9fa8f	00040000-5613-d48f-fd55-13792b4bced7	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-d491-4509-5c00b8c2af19	00040000-5613-d48f-fd55-13792b4bced7	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-d491-6f45-8eb3be818729	00040000-5613-d48f-fd55-13792b4bced7	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-d491-4115-246b22ff53c8	00040000-5613-d48f-6941-7976d3994108	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-d491-81e4-2d9d77f7cd5b	00040000-5613-d48f-e81e-d1aa42fa9db2	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-d491-501a-58362e071a75	00040000-5613-d48f-7171-c2829347cc65	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-d491-668d-cb36d100c5fe	00040000-5613-d48f-e2f8-e98131f249d9	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5613-d493-3e2f-c153eb32ff0f	00040000-5613-d48f-fd55-13792b4bced7	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2986 (class 0 OID 21375516)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5613-d48e-4f4b-89b329b8241e	8341	Adlešiči
00050000-5613-d48e-6e10-aa231fab3cb7	5270	Ajdovščina
00050000-5613-d48e-2564-95b2731ef9fd	6280	Ankaran/Ancarano
00050000-5613-d48e-01a2-e04ec7175e80	9253	Apače
00050000-5613-d48e-f348-b06a7e94de7d	8253	Artiče
00050000-5613-d48e-65e2-28da857f819f	4275	Begunje na Gorenjskem
00050000-5613-d48e-38bf-ea90d1b93884	1382	Begunje pri Cerknici
00050000-5613-d48e-0dff-256359bdbcf8	9231	Beltinci
00050000-5613-d48e-c859-eb1d293c8353	2234	Benedikt
00050000-5613-d48e-a122-812d02536f7a	2345	Bistrica ob Dravi
00050000-5613-d48e-3fcf-ce3f78e10c15	3256	Bistrica ob Sotli
00050000-5613-d48e-2341-6c601f86520c	8259	Bizeljsko
00050000-5613-d48e-2917-2894a47973d5	1223	Blagovica
00050000-5613-d48e-150d-abd9fa00b2f1	8283	Blanca
00050000-5613-d48e-6826-da16692f55f1	4260	Bled
00050000-5613-d48e-dc12-0f0e5fb65809	4273	Blejska Dobrava
00050000-5613-d48e-dbcb-381d4c16adb6	9265	Bodonci
00050000-5613-d48e-4eca-988945dfa2b2	9222	Bogojina
00050000-5613-d48e-3d77-155fbbbf099c	4263	Bohinjska Bela
00050000-5613-d48e-c9fb-d3c18fd97f7f	4264	Bohinjska Bistrica
00050000-5613-d48e-a411-44473709dc9b	4265	Bohinjsko jezero
00050000-5613-d48e-1b12-e935cb1bb512	1353	Borovnica
00050000-5613-d48e-344d-5f2232a52551	8294	Boštanj
00050000-5613-d48e-1f22-ebe1f194db34	5230	Bovec
00050000-5613-d48e-2d47-6369652fc894	5295	Branik
00050000-5613-d48e-71b0-a9cc0324bef5	3314	Braslovče
00050000-5613-d48e-ff36-0c647b1b201b	5223	Breginj
00050000-5613-d48e-69b8-bcd42422e53c	8280	Brestanica
00050000-5613-d48e-ba0a-ac2f42725997	2354	Bresternica
00050000-5613-d48e-7229-37a22b7fe3bf	4243	Brezje
00050000-5613-d48e-4a39-683a4f93b31a	1351	Brezovica pri Ljubljani
00050000-5613-d48e-0bcc-a84f28ba48e0	8250	Brežice
00050000-5613-d48e-5215-03b0d992336a	4210	Brnik - Aerodrom
00050000-5613-d48e-fcbb-21a5493b8c76	8321	Brusnice
00050000-5613-d48e-773d-49309b25e501	3255	Buče
00050000-5613-d48e-8813-f0f5df3d16e7	8276	Bučka 
00050000-5613-d48e-b3fa-2e4e04f2009d	9261	Cankova
00050000-5613-d48e-83e6-e97707156b4b	3000	Celje 
00050000-5613-d48e-21df-5fa65b4f7c3f	3001	Celje - poštni predali
00050000-5613-d48e-dee4-b7fa5f9ccaec	4207	Cerklje na Gorenjskem
00050000-5613-d48e-ca90-3a265516155e	8263	Cerklje ob Krki
00050000-5613-d48e-b900-510c1b8be288	1380	Cerknica
00050000-5613-d48e-0fd7-9aacdcdb18ec	5282	Cerkno
00050000-5613-d48e-0776-75b241a0e81d	2236	Cerkvenjak
00050000-5613-d48e-e5ba-9dc4c5dc63bf	2215	Ceršak
00050000-5613-d48e-e4bd-89d17f1e4766	2326	Cirkovce
00050000-5613-d48e-96ba-d264e64486f5	2282	Cirkulane
00050000-5613-d48e-c6f0-21885a788ef4	5273	Col
00050000-5613-d48e-5afa-e375a802edbf	8251	Čatež ob Savi
00050000-5613-d48e-ae43-629232699a0c	1413	Čemšenik
00050000-5613-d48e-6237-aaa485273e0d	5253	Čepovan
00050000-5613-d48e-7f2d-41366521cc7b	9232	Črenšovci
00050000-5613-d48e-8a12-a74fedfe47c2	2393	Črna na Koroškem
00050000-5613-d48e-6db7-54b9f967dfd0	6275	Črni Kal
00050000-5613-d48e-a24f-8e728010d688	5274	Črni Vrh nad Idrijo
00050000-5613-d48e-e7a0-78ccceab61e8	5262	Črniče
00050000-5613-d48e-2ae1-c3df02413391	8340	Črnomelj
00050000-5613-d48e-1971-cb8e57cd3ae4	6271	Dekani
00050000-5613-d48e-acfd-71c97f702878	5210	Deskle
00050000-5613-d48e-104b-aa60a4678ed9	2253	Destrnik
00050000-5613-d48e-1d7d-23bffe885aa8	6215	Divača
00050000-5613-d48e-c448-9811df6b9d06	1233	Dob
00050000-5613-d48e-ca5c-2173355d3ca3	3224	Dobje pri Planini
00050000-5613-d48e-d61c-b890cb07185e	8257	Dobova
00050000-5613-d48e-b8cd-18e593018ba8	1423	Dobovec
00050000-5613-d48e-5571-d6098d9ea2bc	5263	Dobravlje
00050000-5613-d48e-1d8f-48ec3bd158e4	3204	Dobrna
00050000-5613-d48e-c5cf-36344f16e093	8211	Dobrnič
00050000-5613-d48e-4e80-3d362d38687d	1356	Dobrova
00050000-5613-d48e-1cb1-9c276ab0107a	9223	Dobrovnik/Dobronak 
00050000-5613-d48e-5b2b-6c5dc65f6c46	5212	Dobrovo v Brdih
00050000-5613-d48e-8d4a-2bc50c83ee87	1431	Dol pri Hrastniku
00050000-5613-d48e-e4b9-71da93b52443	1262	Dol pri Ljubljani
00050000-5613-d48e-7d86-e480f95b8a10	1273	Dole pri Litiji
00050000-5613-d48e-1bd1-b23511386a76	1331	Dolenja vas
00050000-5613-d48e-aa55-b5b1e1656587	8350	Dolenjske Toplice
00050000-5613-d48e-31f1-02d2c32d8a87	1230	Domžale
00050000-5613-d48e-d661-151484813955	2252	Dornava
00050000-5613-d48e-d5ea-bbd1f73b8e2f	5294	Dornberk
00050000-5613-d48e-fc1d-45e8e102a118	1319	Draga
00050000-5613-d48e-b83f-f49745d1d5fc	8343	Dragatuš
00050000-5613-d48e-9c77-c23b8790e2b0	3222	Dramlje
00050000-5613-d48e-f58c-fe985dcbf68b	2370	Dravograd
00050000-5613-d48e-94da-c3d283c9b223	4203	Duplje
00050000-5613-d48e-ec8b-898d6cefcb1e	6221	Dutovlje
00050000-5613-d48e-5036-f9a78413fb19	8361	Dvor
00050000-5613-d48e-76ce-18f6965efa5c	2343	Fala
00050000-5613-d48e-fd1c-dbe2847f728a	9208	Fokovci
00050000-5613-d48e-a860-9c02cf88bd9b	2313	Fram
00050000-5613-d48e-b6aa-ead23c8156a6	3213	Frankolovo
00050000-5613-d48e-d385-905ea7c80e62	1274	Gabrovka
00050000-5613-d48e-d9ba-5dd7bf1c9c1f	8254	Globoko
00050000-5613-d48e-30d6-33738228d468	5275	Godovič
00050000-5613-d48e-7b29-548d9e167534	4204	Golnik
00050000-5613-d48e-79b7-e44ecca75b50	3303	Gomilsko
00050000-5613-d48e-fe80-930b00a6a08f	4224	Gorenja vas
00050000-5613-d48e-4f52-400c65f78216	3263	Gorica pri Slivnici
00050000-5613-d48e-3621-06825cc02574	2272	Gorišnica
00050000-5613-d48e-74d2-8ce495951d44	9250	Gornja Radgona
00050000-5613-d48e-a68a-3f151c8aa87d	3342	Gornji Grad
00050000-5613-d48e-7864-ea5d2ebe201e	4282	Gozd Martuljek
00050000-5613-d48e-ae26-7f948349acec	6272	Gračišče
00050000-5613-d48e-7240-eac1d0e9ec04	9264	Grad
00050000-5613-d48e-03f1-b06801ff1000	8332	Gradac
00050000-5613-d48e-d7c6-a0924b28b231	1384	Grahovo
00050000-5613-d48e-31d5-eacd7b8b979e	5242	Grahovo ob Bači
00050000-5613-d48e-368f-f1958701240e	5251	Grgar
00050000-5613-d48e-cd5b-c3978224b6b9	3302	Griže
00050000-5613-d48e-26b8-d3138c72faf4	3231	Grobelno
00050000-5613-d48e-2ba8-428f06322bc2	1290	Grosuplje
00050000-5613-d48e-f8b0-353baad253ad	2288	Hajdina
00050000-5613-d48e-2703-d9505cd98722	8362	Hinje
00050000-5613-d48e-57ff-e8a07ac44d79	2311	Hoče
00050000-5613-d48e-c529-6eff62e9c4af	9205	Hodoš/Hodos
00050000-5613-d48e-4365-23954abf89d4	1354	Horjul
00050000-5613-d48e-d18e-fc13b19c9571	1372	Hotedršica
00050000-5613-d48e-5ab6-08f6ef0ab48b	1430	Hrastnik
00050000-5613-d48e-f9e9-5732eebf50a2	6225	Hruševje
00050000-5613-d48e-3163-5f9e0d6b41e8	4276	Hrušica
00050000-5613-d48e-95ee-c69485c08b9b	5280	Idrija
00050000-5613-d48e-c2dc-06320f1cc088	1292	Ig
00050000-5613-d48f-19ff-378ffeb68cd4	6250	Ilirska Bistrica
00050000-5613-d48f-b674-c8fab9bfc05f	6251	Ilirska Bistrica-Trnovo
00050000-5613-d48f-ec01-372dfc0adf6b	1295	Ivančna Gorica
00050000-5613-d48f-f5d5-b901bdb15a85	2259	Ivanjkovci
00050000-5613-d48f-e942-2b3f79e24cf7	1411	Izlake
00050000-5613-d48f-0af1-c704bf42b256	6310	Izola/Isola
00050000-5613-d48f-8625-a1b3ba1e38b7	2222	Jakobski Dol
00050000-5613-d48f-caa1-f2afd86035f0	2221	Jarenina
00050000-5613-d48f-0be1-cdd5fbb7f9b2	6254	Jelšane
00050000-5613-d48f-0696-6583d1f23427	4270	Jesenice
00050000-5613-d48f-7929-081788d6bfa2	8261	Jesenice na Dolenjskem
00050000-5613-d48f-1976-4d9a583042ed	3273	Jurklošter
00050000-5613-d48f-71f0-04057065672b	2223	Jurovski Dol
00050000-5613-d48f-2527-4e5d27dd3a97	2256	Juršinci
00050000-5613-d48f-eae3-1a9c6783ec8a	5214	Kal nad Kanalom
00050000-5613-d48f-d53e-19dfef429607	3233	Kalobje
00050000-5613-d48f-e2d4-236252930a43	4246	Kamna Gorica
00050000-5613-d48f-2485-17f2b27f708a	2351	Kamnica
00050000-5613-d48f-4035-f07bfee59287	1241	Kamnik
00050000-5613-d48f-115d-2f0493eb602b	5213	Kanal
00050000-5613-d48f-080d-02a0a5278761	8258	Kapele
00050000-5613-d48f-bd26-7f8773b3c041	2362	Kapla
00050000-5613-d48f-a005-6a083c106418	2325	Kidričevo
00050000-5613-d48f-a46d-bb3cd1820efd	1412	Kisovec
00050000-5613-d48f-62da-2543fc626800	6253	Knežak
00050000-5613-d48f-bd6c-4402e9bf1dcd	5222	Kobarid
00050000-5613-d48f-a199-b25804222ed0	9227	Kobilje
00050000-5613-d48f-0f99-d1890685bd0a	1330	Kočevje
00050000-5613-d48f-d119-e94e3faf5df8	1338	Kočevska Reka
00050000-5613-d48f-f429-39d1402034d7	2276	Kog
00050000-5613-d48f-f705-caad1168d6da	5211	Kojsko
00050000-5613-d48f-11f1-2f48a05cdc74	6223	Komen
00050000-5613-d48f-d05a-7fb7a90f6029	1218	Komenda
00050000-5613-d48f-d50a-2192cb1654a3	6000	Koper/Capodistria 
00050000-5613-d48f-8264-1beba5bca0ae	6001	Koper/Capodistria - poštni predali
00050000-5613-d48f-aff8-1d7698da2ada	8282	Koprivnica
00050000-5613-d48f-0785-ee506a998822	5296	Kostanjevica na Krasu
00050000-5613-d48f-0972-f98c81628197	8311	Kostanjevica na Krki
00050000-5613-d48f-4a1e-e21157acb865	1336	Kostel
00050000-5613-d48f-21ac-2e81562a6c56	6256	Košana
00050000-5613-d48f-4cb9-417211b715d7	2394	Kotlje
00050000-5613-d48f-ba08-1f672c15fd4b	6240	Kozina
00050000-5613-d48f-9539-9599d3381701	3260	Kozje
00050000-5613-d48f-74c0-140959e03162	4000	Kranj 
00050000-5613-d48f-04aa-8e0d2640bc49	4001	Kranj - poštni predali
00050000-5613-d48f-66bb-8d9bb9699466	4280	Kranjska Gora
00050000-5613-d48f-91bd-b54bb32d714c	1281	Kresnice
00050000-5613-d48f-78e3-f3ac2fcae821	4294	Križe
00050000-5613-d48f-1c86-570294544126	9206	Križevci
00050000-5613-d48f-8dbc-a6566ed50e02	9242	Križevci pri Ljutomeru
00050000-5613-d48f-a30e-c4fa9871a222	1301	Krka
00050000-5613-d48f-d963-55c5daec4a8e	8296	Krmelj
00050000-5613-d48f-b2be-9ba2caa3f69c	4245	Kropa
00050000-5613-d48f-93b8-bb3bc4afd869	8262	Krška vas
00050000-5613-d48f-ed40-7080890676f0	8270	Krško
00050000-5613-d48f-7850-a82bc7f84da9	9263	Kuzma
00050000-5613-d48f-1815-e3c699bdfc22	2318	Laporje
00050000-5613-d48f-6d22-a42233c6535e	3270	Laško
00050000-5613-d48f-5c12-f9b84db63f7e	1219	Laze v Tuhinju
00050000-5613-d48f-2fd3-debaff88a37e	2230	Lenart v Slovenskih goricah
00050000-5613-d48f-a71c-435d101fa585	9220	Lendava/Lendva
00050000-5613-d48f-9f83-5dcd67688f09	4248	Lesce
00050000-5613-d48f-d3e5-d7d80835c281	3261	Lesično
00050000-5613-d48f-9b5b-d0202cfc93d8	8273	Leskovec pri Krškem
00050000-5613-d48f-6bfb-e8d990d67da6	2372	Libeliče
00050000-5613-d48f-ec0d-ed5c5d8ca9ae	2341	Limbuš
00050000-5613-d48f-01be-e7b5a031c0fe	1270	Litija
00050000-5613-d48f-7672-62f54e4f11ba	3202	Ljubečna
00050000-5613-d48f-8ee7-590f804dca8c	1000	Ljubljana 
00050000-5613-d48f-f2b9-e562605d838a	1001	Ljubljana - poštni predali
00050000-5613-d48f-3e35-79ef0eb7153b	1231	Ljubljana - Črnuče
00050000-5613-d48f-d306-a236e7b3f937	1261	Ljubljana - Dobrunje
00050000-5613-d48f-b493-555f3440715c	1260	Ljubljana - Polje
00050000-5613-d48f-d540-3c84a16c02c3	1210	Ljubljana - Šentvid
00050000-5613-d48f-bd3d-9a9dd3e0ceb2	1211	Ljubljana - Šmartno
00050000-5613-d48f-beb4-21fcfbc42dc5	3333	Ljubno ob Savinji
00050000-5613-d48f-eeb7-07e36cbfee3e	9240	Ljutomer
00050000-5613-d48f-e113-c2845bf25cd6	3215	Loče
00050000-5613-d48f-b354-009cbb38cf76	5231	Log pod Mangartom
00050000-5613-d48f-cb50-4f823d602781	1358	Log pri Brezovici
00050000-5613-d48f-2cb9-5c4ead906ec9	1370	Logatec
00050000-5613-d48f-4d57-ac16b8f9b13b	1371	Logatec
00050000-5613-d48f-5f00-5caebc9bb488	1434	Loka pri Zidanem Mostu
00050000-5613-d48f-ce84-15fc84d06981	3223	Loka pri Žusmu
00050000-5613-d48f-74cc-af77d39a7d21	6219	Lokev
00050000-5613-d48f-a128-0b8f0202e38e	1318	Loški Potok
00050000-5613-d48f-645f-6f3842e183ce	2324	Lovrenc na Dravskem polju
00050000-5613-d48f-9bfa-3c5ccb440647	2344	Lovrenc na Pohorju
00050000-5613-d48f-f3d6-aba7999ce4b1	3334	Luče
00050000-5613-d48f-61d7-bf92a30a95aa	1225	Lukovica
00050000-5613-d48f-11a4-1b8466629b24	9202	Mačkovci
00050000-5613-d48f-3776-45a27acbe5d1	2322	Majšperk
00050000-5613-d48f-7d79-71158377fc6a	2321	Makole
00050000-5613-d48f-84a7-3bd93624269c	9243	Mala Nedelja
00050000-5613-d48f-92d8-357a79d14c22	2229	Malečnik
00050000-5613-d48f-ef30-11fd6cdd2351	6273	Marezige
00050000-5613-d48f-1a2a-581802d32891	2000	Maribor 
00050000-5613-d48f-64df-9a8c4e1d5661	2001	Maribor - poštni predali
00050000-5613-d48f-0ae2-f38d2a3eeac3	2206	Marjeta na Dravskem polju
00050000-5613-d48f-e6f7-4ad82ba3cdc0	2281	Markovci
00050000-5613-d48f-abe1-8eacc8d7da04	9221	Martjanci
00050000-5613-d48f-aa6b-cbe82e57bc1a	6242	Materija
00050000-5613-d48f-9bab-47288b90351a	4211	Mavčiče
00050000-5613-d48f-dced-55e14cf35d95	1215	Medvode
00050000-5613-d48f-3b98-bfc18d38d298	1234	Mengeš
00050000-5613-d48f-4054-e8dce1abc7cd	8330	Metlika
00050000-5613-d48f-325a-2b486aab9560	2392	Mežica
00050000-5613-d48f-8a16-32ec42688f14	2204	Miklavž na Dravskem polju
00050000-5613-d48f-9380-527ab9fc768b	2275	Miklavž pri Ormožu
00050000-5613-d48f-2e73-1801f10e317a	5291	Miren
00050000-5613-d48f-d2b6-ba4fc728052d	8233	Mirna
00050000-5613-d48f-873b-b7a60247272d	8216	Mirna Peč
00050000-5613-d48f-6ca1-b3f04f8b59ac	2382	Mislinja
00050000-5613-d48f-8b84-b4e30480e250	4281	Mojstrana
00050000-5613-d48f-ebac-200bbf2dcb05	8230	Mokronog
00050000-5613-d48f-5252-053eba1ab137	1251	Moravče
00050000-5613-d48f-449d-703d5aaeda1a	9226	Moravske Toplice
00050000-5613-d48f-89ab-9d3cbdf5013c	5216	Most na Soči
00050000-5613-d48f-bd2b-f3797c19cd8a	1221	Motnik
00050000-5613-d48f-3060-3784b96b9adc	3330	Mozirje
00050000-5613-d48f-e344-7f32319a417b	9000	Murska Sobota 
00050000-5613-d48f-c354-d156bd96a93a	9001	Murska Sobota - poštni predali
00050000-5613-d48f-6440-3758e941a594	2366	Muta
00050000-5613-d48f-b09e-7c60bdbb56a2	4202	Naklo
00050000-5613-d48f-2148-251a37a3234c	3331	Nazarje
00050000-5613-d48f-a8e2-17c605082647	1357	Notranje Gorice
00050000-5613-d48f-f3e6-8542f5645af1	3203	Nova Cerkev
00050000-5613-d48f-022f-6af13b4a0eca	5000	Nova Gorica 
00050000-5613-d48f-fa0c-9fa6e4f1d70d	5001	Nova Gorica - poštni predali
00050000-5613-d48f-e8e4-14710defcdac	1385	Nova vas
00050000-5613-d48f-6201-244121af6aa5	8000	Novo mesto
00050000-5613-d48f-f041-eeb08034903c	8001	Novo mesto - poštni predali
00050000-5613-d48f-ffb5-9aff29e59325	6243	Obrov
00050000-5613-d48f-09b2-31e71ba0fae4	9233	Odranci
00050000-5613-d48f-2a63-4c4d367aac40	2317	Oplotnica
00050000-5613-d48f-e744-58f018a2eece	2312	Orehova vas
00050000-5613-d48f-7b05-d0e20281a767	2270	Ormož
00050000-5613-d48f-42e4-4ba7207f3ed5	1316	Ortnek
00050000-5613-d48f-9a94-bbc1e7f4e2e1	1337	Osilnica
00050000-5613-d48f-9156-c475ae321790	8222	Otočec
00050000-5613-d48f-9e14-5eff1e247f30	2361	Ožbalt
00050000-5613-d48f-b6a1-424473ca6a2d	2231	Pernica
00050000-5613-d48f-6815-2eb9dcaacc61	2211	Pesnica pri Mariboru
00050000-5613-d48f-5d96-78dc82cc1c31	9203	Petrovci
00050000-5613-d48f-9cf6-02dadddee9e7	3301	Petrovče
00050000-5613-d48f-99d0-3103f344909e	6330	Piran/Pirano
00050000-5613-d48f-a7ea-6570c68bd88b	8255	Pišece
00050000-5613-d48f-29b3-3da76782c0de	6257	Pivka
00050000-5613-d48f-aa67-cb8f8eacf232	6232	Planina
00050000-5613-d48f-b213-86926dbf374c	3225	Planina pri Sevnici
00050000-5613-d48f-0ae8-b08aeecf109e	6276	Pobegi
00050000-5613-d48f-acbb-8531d6381708	8312	Podbočje
00050000-5613-d48f-7475-175cf4b8ba38	5243	Podbrdo
00050000-5613-d48f-aab2-23595b8e68bf	3254	Podčetrtek
00050000-5613-d48f-095d-447b57890020	2273	Podgorci
00050000-5613-d48f-3003-5c019f05cd62	6216	Podgorje
00050000-5613-d48f-4a9c-38184cfc370d	2381	Podgorje pri Slovenj Gradcu
00050000-5613-d48f-0301-823bfe092066	6244	Podgrad
00050000-5613-d48f-e893-73ae1dc3faa3	1414	Podkum
00050000-5613-d48f-aa75-f72389ba03cf	2286	Podlehnik
00050000-5613-d48f-c5b7-a93a5d9bf9dd	5272	Podnanos
00050000-5613-d48f-248b-73f6a6a27975	4244	Podnart
00050000-5613-d48f-798a-d4201d6101dc	3241	Podplat
00050000-5613-d48f-a259-d794022f300b	3257	Podsreda
00050000-5613-d48f-6e13-1c6afe387ac0	2363	Podvelka
00050000-5613-d48f-2043-b6358259abc3	2208	Pohorje
00050000-5613-d48f-bed7-cd5b941d37ca	2257	Polenšak
00050000-5613-d48f-741d-e43db8c864ca	1355	Polhov Gradec
00050000-5613-d48f-4044-67ac50fd7004	4223	Poljane nad Škofjo Loko
00050000-5613-d48f-ccd1-9a1c7f548cdc	2319	Poljčane
00050000-5613-d48f-17f2-ab17036b468e	1272	Polšnik
00050000-5613-d48f-5f83-eeb8c86b45ca	3313	Polzela
00050000-5613-d48f-2f55-b75a129b1490	3232	Ponikva
00050000-5613-d48f-0555-cb60ec1ffdbf	6320	Portorož/Portorose
00050000-5613-d48f-f509-f3f683d5f32f	6230	Postojna
00050000-5613-d48f-51d3-9379bd7d7adf	2331	Pragersko
00050000-5613-d48f-ba91-9b733cddbea2	3312	Prebold
00050000-5613-d48f-fbc2-07d96e5feb05	4205	Preddvor
00050000-5613-d48f-9c0e-791c5715e02a	6255	Prem
00050000-5613-d48f-f260-8ca4658d59c7	1352	Preserje
00050000-5613-d48f-8c05-23b68004dd38	6258	Prestranek
00050000-5613-d48f-1091-75e1c29e50fc	2391	Prevalje
00050000-5613-d48f-a54d-78525d2517ef	3262	Prevorje
00050000-5613-d48f-aaa5-4ac248a89ea0	1276	Primskovo 
00050000-5613-d48f-b0ee-5abc80b876d8	3253	Pristava pri Mestinju
00050000-5613-d48f-5ee9-6e155465a22d	9207	Prosenjakovci/Partosfalva
00050000-5613-d48f-c9b8-7f4cb3fb85af	5297	Prvačina
00050000-5613-d48f-e361-f9a52916e9ed	2250	Ptuj
00050000-5613-d48f-ecb1-487a4b23a49b	2323	Ptujska Gora
00050000-5613-d48f-523a-4f0a61ea31f8	9201	Puconci
00050000-5613-d48f-6c75-b26928c12b99	2327	Rače
00050000-5613-d48f-af03-2b245d777e1c	1433	Radeče
00050000-5613-d48f-94e2-3131b9aab153	9252	Radenci
00050000-5613-d48f-69fd-35579b304482	2360	Radlje ob Dravi
00050000-5613-d48f-22e4-73f7959d209f	1235	Radomlje
00050000-5613-d48f-a4dd-39a2846f5563	4240	Radovljica
00050000-5613-d48f-00ec-7c79cdb6da33	8274	Raka
00050000-5613-d48f-0c03-33c7ad1c7730	1381	Rakek
00050000-5613-d48f-dc6f-e02c18ba052b	4283	Rateče - Planica
00050000-5613-d48f-ec82-69100282668b	2390	Ravne na Koroškem
00050000-5613-d48f-c784-ac2fffe08bfd	9246	Razkrižje
00050000-5613-d48f-cdb2-83aa320f5fbf	3332	Rečica ob Savinji
00050000-5613-d48f-a221-25bd506d9555	5292	Renče
00050000-5613-d48f-7658-4d68c662e9f7	1310	Ribnica
00050000-5613-d48f-317b-0cf4120ce5ed	2364	Ribnica na Pohorju
00050000-5613-d48f-4c5e-86103b94479f	3272	Rimske Toplice
00050000-5613-d48f-71f1-f8297a78d254	1314	Rob
00050000-5613-d48f-d767-2e381e415250	5215	Ročinj
00050000-5613-d48f-b915-d8b7f3919f0a	3250	Rogaška Slatina
00050000-5613-d48f-7e8f-45fb3de87ddb	9262	Rogašovci
00050000-5613-d48f-8866-7fcc26c632b8	3252	Rogatec
00050000-5613-d48f-3e0f-dc15e1ff7c81	1373	Rovte
00050000-5613-d48f-2951-2adf8b35e8f8	2342	Ruše
00050000-5613-d48f-5eb1-028c92103cd5	1282	Sava
00050000-5613-d48f-0352-4aa0504ecb31	6333	Sečovlje/Sicciole
00050000-5613-d48f-6ca9-84e357ae090b	4227	Selca
00050000-5613-d48f-eaf3-3c92c44f07c2	2352	Selnica ob Dravi
00050000-5613-d48f-bac9-6551c8c65eb6	8333	Semič
00050000-5613-d48f-6c8e-8c157cdaa457	8281	Senovo
00050000-5613-d48f-ee35-eb75eb96afb2	6224	Senožeče
00050000-5613-d48f-7124-35b7b87af5f2	8290	Sevnica
00050000-5613-d48f-754f-c1f92c53c833	6210	Sežana
00050000-5613-d48f-bd2f-210bed168717	2214	Sladki Vrh
00050000-5613-d48f-e1a4-ab506d13dfd5	5283	Slap ob Idrijci
00050000-5613-d48f-35ae-34259cd6f6e4	2380	Slovenj Gradec
00050000-5613-d48f-d56a-b1f6b37cd76f	2310	Slovenska Bistrica
00050000-5613-d48f-0dc4-c619d447b86e	3210	Slovenske Konjice
00050000-5613-d48f-84e8-85934d265b65	1216	Smlednik
00050000-5613-d48f-f929-71ae9b138c4c	5232	Soča
00050000-5613-d48f-f4a9-d44b64bfb3a1	1317	Sodražica
00050000-5613-d48f-d0d6-d124ec6dcc6c	3335	Solčava
00050000-5613-d48f-9cd3-919c65cc60df	5250	Solkan
00050000-5613-d48f-91cb-599e39d9b648	4229	Sorica
00050000-5613-d48f-b532-5d3130a30e26	4225	Sovodenj
00050000-5613-d48f-ee2f-4894a5693c07	5281	Spodnja Idrija
00050000-5613-d48f-bd7c-a2d6fbec4054	2241	Spodnji Duplek
00050000-5613-d48f-48b6-0114727473f6	9245	Spodnji Ivanjci
00050000-5613-d48f-fb0f-01ecaf9b2878	2277	Središče ob Dravi
00050000-5613-d48f-5cf4-a346753b3630	4267	Srednja vas v Bohinju
00050000-5613-d48f-ae0d-8a0be4f6fc28	8256	Sromlje 
00050000-5613-d48f-b471-39df401f0554	5224	Srpenica
00050000-5613-d48f-9a04-04eb9b9f8cca	1242	Stahovica
00050000-5613-d48f-b101-86a8269a7d53	1332	Stara Cerkev
00050000-5613-d48f-ea97-edef60f6c3e2	8342	Stari trg ob Kolpi
00050000-5613-d48f-cd2a-cdec4317f3ac	1386	Stari trg pri Ložu
00050000-5613-d48f-51fc-2864ac6d845b	2205	Starše
00050000-5613-d48f-45dd-de0b2f2abd74	2289	Stoperce
00050000-5613-d48f-10be-01e26cc33477	8322	Stopiče
00050000-5613-d48f-8def-191af63486fd	3206	Stranice
00050000-5613-d48f-c7ce-74ef2591d758	8351	Straža
00050000-5613-d48f-979e-c6c85b99a6a4	1313	Struge
00050000-5613-d48f-e22a-11c9e16ec98b	8293	Studenec
00050000-5613-d48f-57b6-de57484f87e9	8331	Suhor
00050000-5613-d48f-041a-cc9586c0371b	2233	Sv. Ana v Slovenskih goricah
00050000-5613-d48f-ae6c-fffa9b0857e4	2235	Sv. Trojica v Slovenskih goricah
00050000-5613-d48f-5b3e-07732d7c8087	2353	Sveti Duh na Ostrem Vrhu
00050000-5613-d48f-ebc4-1eb8ae5bd0eb	9244	Sveti Jurij ob Ščavnici
00050000-5613-d48f-be28-cd38b6401f5c	3264	Sveti Štefan
00050000-5613-d48f-08df-004767225175	2258	Sveti Tomaž
00050000-5613-d48f-cca3-92658d5e475f	9204	Šalovci
00050000-5613-d48f-c25a-41f02df7ea35	5261	Šempas
00050000-5613-d48f-1326-7c1fe4778248	5290	Šempeter pri Gorici
00050000-5613-d48f-5ae4-89714b1824c1	3311	Šempeter v Savinjski dolini
00050000-5613-d48f-6e98-6458e6e7125d	4208	Šenčur
00050000-5613-d48f-948d-70b0072cf163	2212	Šentilj v Slovenskih goricah
00050000-5613-d48f-1dee-5da540e7e36c	8297	Šentjanž
00050000-5613-d48f-3e55-639d459beb84	2373	Šentjanž pri Dravogradu
00050000-5613-d48f-66f5-c5c95d91b92a	8310	Šentjernej
00050000-5613-d48f-8c3c-a8c3c60200e9	3230	Šentjur
00050000-5613-d48f-4063-157ef29d8d51	3271	Šentrupert
00050000-5613-d48f-955a-34b42373e522	8232	Šentrupert
00050000-5613-d48f-17fc-33ac00a7b560	1296	Šentvid pri Stični
00050000-5613-d48f-e1f8-3a998d882eaf	8275	Škocjan
00050000-5613-d48f-c912-1fe920d8f049	6281	Škofije
00050000-5613-d48f-6487-155e3f62fa8a	4220	Škofja Loka
00050000-5613-d48f-e07f-483262ffcfeb	3211	Škofja vas
00050000-5613-d48f-f9c3-102ed2608e4b	1291	Škofljica
00050000-5613-d48f-fe3a-4bad41b20d2d	6274	Šmarje
00050000-5613-d48f-cd34-c89668688be2	1293	Šmarje - Sap
00050000-5613-d48f-9c47-f8ff8ec8461a	3240	Šmarje pri Jelšah
00050000-5613-d48f-987b-383160159ecc	8220	Šmarješke Toplice
00050000-5613-d48f-be7b-7a560a1a4546	2315	Šmartno na Pohorju
00050000-5613-d48f-41c6-730b1942f654	3341	Šmartno ob Dreti
00050000-5613-d48f-d162-0e17dbb9cd36	3327	Šmartno ob Paki
00050000-5613-d48f-c309-f27ae6c9fee3	1275	Šmartno pri Litiji
00050000-5613-d48f-d1b3-87c415539f60	2383	Šmartno pri Slovenj Gradcu
00050000-5613-d48f-877b-22adc8ac49e8	3201	Šmartno v Rožni dolini
00050000-5613-d48f-594f-462cfc050809	3325	Šoštanj
00050000-5613-d48f-6a29-bae3fc7f2292	6222	Štanjel
00050000-5613-d48f-442c-30a40d66ebe4	3220	Štore
00050000-5613-d48f-fbbc-442e72e248fd	3304	Tabor
00050000-5613-d48f-9acf-6186e4a7ef28	3221	Teharje
00050000-5613-d48f-4651-88224f476e1e	9251	Tišina
00050000-5613-d48f-4d5b-6b72d2738e1d	5220	Tolmin
00050000-5613-d48f-fbd7-d66c4fadbb48	3326	Topolšica
00050000-5613-d48f-3ec4-c24288027d6a	2371	Trbonje
00050000-5613-d48f-2d19-b6eddf3949b3	1420	Trbovlje
00050000-5613-d48f-8e4d-04e70ff8f0ef	8231	Trebelno 
00050000-5613-d48f-d6db-4bff5d768364	8210	Trebnje
00050000-5613-d48f-7c14-c639f4154ac9	5252	Trnovo pri Gorici
00050000-5613-d48f-b5f1-531895b48e39	2254	Trnovska vas
00050000-5613-d48f-3a44-a9478d23968c	1222	Trojane
00050000-5613-d48f-b79b-711715144a73	1236	Trzin
00050000-5613-d48f-b639-d01ae89cfba5	4290	Tržič
00050000-5613-d48f-3859-d2453b00befc	8295	Tržišče
00050000-5613-d48f-d993-693a49d4acdb	1311	Turjak
00050000-5613-d48f-a9d3-62fca87b1da2	9224	Turnišče
00050000-5613-d48f-5fe1-ac0fd1b53030	8323	Uršna sela
00050000-5613-d48f-c7ca-4054e2865bc1	1252	Vače
00050000-5613-d48f-5e39-e541448e03ac	3320	Velenje 
00050000-5613-d48f-3d5f-0bfa111a1740	3322	Velenje - poštni predali
00050000-5613-d48f-222b-031874d963f4	8212	Velika Loka
00050000-5613-d48f-2b65-7f1b66882f56	2274	Velika Nedelja
00050000-5613-d48f-02d9-2265375ff022	9225	Velika Polana
00050000-5613-d48f-c50b-abd18e684ea1	1315	Velike Lašče
00050000-5613-d48f-513a-65af5c4a9544	8213	Veliki Gaber
00050000-5613-d48f-92d5-9775259c1a8a	9241	Veržej
00050000-5613-d48f-a88a-f1d8723e8fa9	1312	Videm - Dobrepolje
00050000-5613-d48f-cf68-ae60e74597e5	2284	Videm pri Ptuju
00050000-5613-d48f-4642-eb30dac79a00	8344	Vinica
00050000-5613-d48f-7e87-cbb99e776da7	5271	Vipava
00050000-5613-d48f-44db-f145605b13a2	4212	Visoko
00050000-5613-d48f-9ac0-678bfb620ba8	1294	Višnja Gora
00050000-5613-d48f-f437-8106aed576dc	3205	Vitanje
00050000-5613-d48f-a2b2-a4cad4ab44ed	2255	Vitomarci
00050000-5613-d48f-bafd-e4a2417d4996	1217	Vodice
00050000-5613-d48f-4b24-9c01e265d5ed	3212	Vojnik\t
00050000-5613-d48f-2cbb-a26f49d9da17	5293	Volčja Draga
00050000-5613-d48f-b06c-94aff26c8b39	2232	Voličina
00050000-5613-d48f-bf05-c97c85c3a47c	3305	Vransko
00050000-5613-d48f-3d2d-3912b4be16a8	6217	Vremski Britof
00050000-5613-d48f-03bf-6ccd8e6d3df5	1360	Vrhnika
00050000-5613-d48f-8315-1bc862f46a88	2365	Vuhred
00050000-5613-d48f-9b86-160591748607	2367	Vuzenica
00050000-5613-d48f-19ed-1cbd1376cc30	8292	Zabukovje 
00050000-5613-d48f-15eb-4460b8597792	1410	Zagorje ob Savi
00050000-5613-d48f-937b-50a85d44648c	1303	Zagradec
00050000-5613-d48f-ae6a-3b3151d83bcb	2283	Zavrč
00050000-5613-d48f-c1e4-496fbd5805fd	8272	Zdole 
00050000-5613-d48f-4dca-c57335d330ab	4201	Zgornja Besnica
00050000-5613-d48f-3dab-68afc1ff348f	2242	Zgornja Korena
00050000-5613-d48f-3415-a0edb6a71647	2201	Zgornja Kungota
00050000-5613-d48f-06a5-47bc87ca3c0d	2316	Zgornja Ložnica
00050000-5613-d48f-af37-d2c9d8e8341d	2314	Zgornja Polskava
00050000-5613-d48f-240a-3c37ef3546a9	2213	Zgornja Velka
00050000-5613-d48f-c856-229c01627ad7	4247	Zgornje Gorje
00050000-5613-d48f-b75e-08a0c544d148	4206	Zgornje Jezersko
00050000-5613-d48f-ee10-be7f2be01d2b	2285	Zgornji Leskovec
00050000-5613-d48f-e038-c7959a3d9e75	1432	Zidani Most
00050000-5613-d48f-6019-fbe8ae939f78	3214	Zreče
00050000-5613-d48f-243f-2ffa78137f64	4209	Žabnica
00050000-5613-d48f-d8b0-8e67ff190ffc	3310	Žalec
00050000-5613-d48f-192a-10f4364b4ae4	4228	Železniki
00050000-5613-d48f-7db8-e5e7eeca09dd	2287	Žetale
00050000-5613-d48f-0e6d-4dc12623d40f	4226	Žiri
00050000-5613-d48f-a9f2-e44580c17424	4274	Žirovnica
00050000-5613-d48f-e76a-eb8f5ce2cba1	8360	Žužemberk
\.


--
-- TOC entry 3031 (class 0 OID 21376102)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 21375721)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 21375501)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5613-d491-5e7e-ad20562283f1	00080000-5613-d491-9a88-d7bcd69fa504	\N	00040000-5613-d48f-fd55-13792b4bced7	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5613-d491-21bd-e74c6ba57668	00080000-5613-d491-9a88-d7bcd69fa504	\N	00040000-5613-d48f-fd55-13792b4bced7	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5613-d491-a334-d8801ae18d95	00080000-5613-d491-5143-e9453aca044f	\N	00040000-5613-d48f-fd55-13792b4bced7	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2993 (class 0 OID 21375605)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 21375733)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 21376116)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 21376126)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5613-d491-3193-765a89a5c31b	00080000-5613-d491-4f0a-0c16eed9fa8f	0987	AK
00190000-5613-d491-50e1-5e58e9b2cf9c	00080000-5613-d491-5143-e9453aca044f	0989	AK
00190000-5613-d491-77cd-a2702c326785	00080000-5613-d491-4509-5c00b8c2af19	0986	AK
00190000-5613-d491-2127-d1f68a891dfe	00080000-5613-d491-4115-246b22ff53c8	0984	AK
00190000-5613-d491-3e33-a1d5531ebea9	00080000-5613-d491-81e4-2d9d77f7cd5b	0983	AK
00190000-5613-d491-622f-cc0ef2cd7bfa	00080000-5613-d491-501a-58362e071a75	0982	AK
00190000-5613-d493-ce51-2c27b8d598f0	00080000-5613-d493-3e2f-c153eb32ff0f	1001	AK
\.


--
-- TOC entry 3030 (class 0 OID 21376059)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5613-d491-4dab-ff9262286733	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3034 (class 0 OID 21376134)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 21375762)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5613-d491-9965-4e6373bd29ad	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5613-d491-ee5b-b1a1fc0fe864	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5613-d491-5237-98540d66bb69	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5613-d491-b313-6ecb34b1058f	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5613-d491-710e-0ca6001f264a	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5613-d491-08ae-ccf5171df280	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5613-d491-e067-6a16cf1bfdc9	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3002 (class 0 OID 21375706)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 21375696)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 21375906)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 21375836)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 21375579)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 21375374)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5613-d493-3e2f-c153eb32ff0f	00010000-5613-d48f-0ea3-7e7a98ebf29f	2015-10-06 16:02:59	INS	a:0:{}
2	App\\Entity\\Option	00000000-5613-d493-a13f-ee5c3b240e42	00010000-5613-d48f-0ea3-7e7a98ebf29f	2015-10-06 16:02:59	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5613-d493-ce51-2c27b8d598f0	00010000-5613-d48f-0ea3-7e7a98ebf29f	2015-10-06 16:02:59	INS	a:0:{}
\.


--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3011 (class 0 OID 21375775)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 21375412)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5613-d48f-0332-57ba50269e02	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5613-d48f-1063-6f6f4be50c2c	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5613-d48f-14a3-1ce7cfa31338	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5613-d48f-2489-dd846ee343de	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5613-d48f-ac7a-d1e22310dcd9	planer	Planer dogodkov v koledarju	t
00020000-5613-d48f-c653-0cb5032cf5f9	kadrovska	Kadrovska služba	t
00020000-5613-d48f-c639-1705bcad2e8f	arhivar	Ažuriranje arhivalij	t
00020000-5613-d48f-6528-cf5f65f6d963	igralec	Igralec	t
00020000-5613-d48f-8cc6-9ea58b1fc536	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5613-d491-5978-1b8162bd7d88	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2976 (class 0 OID 21375396)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5613-d48f-6770-48b337d250e6	00020000-5613-d48f-14a3-1ce7cfa31338
00010000-5613-d48f-0ea3-7e7a98ebf29f	00020000-5613-d48f-14a3-1ce7cfa31338
00010000-5613-d491-18c4-ba9581c0cb11	00020000-5613-d491-5978-1b8162bd7d88
\.


--
-- TOC entry 3013 (class 0 OID 21375789)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 21375727)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 21375673)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 21375361)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5613-d48f-2775-ada90f7cf39f	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5613-d48f-66f8-b8c8801119b6	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5613-d48f-3066-124a672f1a1c	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5613-d48f-d1e1-4193e7c0bca7	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5613-d48f-d50a-4e088cef14d0	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2971 (class 0 OID 21375353)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5613-d48f-3376-508088bc5009	00230000-5613-d48f-d1e1-4193e7c0bca7	popa
00240000-5613-d48f-2da9-ffa9575bd567	00230000-5613-d48f-d1e1-4193e7c0bca7	oseba
00240000-5613-d48f-4851-8552829fd88a	00230000-5613-d48f-d1e1-4193e7c0bca7	sezona
00240000-5613-d48f-9fb0-67a3c662ec5d	00230000-5613-d48f-66f8-b8c8801119b6	prostor
00240000-5613-d48f-c316-f2b674ac68bd	00230000-5613-d48f-d1e1-4193e7c0bca7	besedilo
00240000-5613-d48f-0944-40b1c0a98ce6	00230000-5613-d48f-d1e1-4193e7c0bca7	uprizoritev
00240000-5613-d48f-d81e-53ea6c0c4225	00230000-5613-d48f-d1e1-4193e7c0bca7	funkcija
00240000-5613-d48f-5972-65a78d6ba736	00230000-5613-d48f-d1e1-4193e7c0bca7	tipfunkcije
00240000-5613-d48f-71c7-3b1e1b746bdf	00230000-5613-d48f-d1e1-4193e7c0bca7	alternacija
00240000-5613-d48f-14aa-210d1cb35f78	00230000-5613-d48f-2775-ada90f7cf39f	pogodba
00240000-5613-d48f-6c33-f94396184a8f	00230000-5613-d48f-d1e1-4193e7c0bca7	zaposlitev
00240000-5613-d48f-6de9-14c8780f67c4	00230000-5613-d48f-d1e1-4193e7c0bca7	zvrstuprizoritve
00240000-5613-d48f-f761-1f8d91d8d10c	00230000-5613-d48f-2775-ada90f7cf39f	programdela
00240000-5613-d48f-7fbb-4a4b8ea4bb8a	00230000-5613-d48f-d1e1-4193e7c0bca7	zapis
\.


--
-- TOC entry 2970 (class 0 OID 21375348)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
b747e958-4f4e-4a38-af60-c80e9f1deb1a	00240000-5613-d48f-3376-508088bc5009	0	1001
\.


--
-- TOC entry 3019 (class 0 OID 21375853)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5613-d491-2354-e62295a99638	000e0000-5613-d491-d2cf-553fa66cbb12	00080000-5613-d491-9a88-d7bcd69fa504	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5613-d48f-4827-ec2d6dea3614
00270000-5613-d491-d409-794570f1e30f	000e0000-5613-d491-d2cf-553fa66cbb12	00080000-5613-d491-9a88-d7bcd69fa504	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5613-d48f-4827-ec2d6dea3614
\.


--
-- TOC entry 2983 (class 0 OID 21375474)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 21375683)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5613-d491-b451-a27b63be5e6a	00180000-5613-d491-ea09-11070301b032	000c0000-5613-d491-5c56-44cc877aa678	00090000-5613-d491-82d6-4ae0dca7b320	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5613-d492-91e5-d1fecb02abf4	00180000-5613-d491-ea09-11070301b032	000c0000-5613-d491-310d-d16c48c77439	00090000-5613-d491-d3a6-dd650004fbdb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5613-d492-f079-a97feb40eaa4	00180000-5613-d491-ea09-11070301b032	000c0000-5613-d491-b1c8-32562696e1cd	00090000-5613-d491-deb5-c7a657fdbda0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5613-d492-d0e5-0cfee7e3cbdf	00180000-5613-d491-ea09-11070301b032	000c0000-5613-d491-984c-d3ae1f26d7ad	00090000-5613-d491-ce49-4e6bad2bf9b0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5613-d492-a0dc-775b0d79a8a3	00180000-5613-d491-ea09-11070301b032	000c0000-5613-d491-d0e3-213117532fff	00090000-5613-d491-4b27-cad23acf383a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5613-d492-b222-1c361fa8bcac	00180000-5613-d491-5056-be46dce8466f	\N	00090000-5613-d491-4b27-cad23acf383a	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3022 (class 0 OID 21375894)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5613-d48f-e597-89ffe2085876	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5613-d48f-d359-271474412b12	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5613-d48f-3062-be4522aa18cc	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5613-d48f-f528-221da289db28	04	Režija	Režija	Režija	umetnik	30
000f0000-5613-d48f-5eab-d0b0c5c8d015	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5613-d48f-4914-7414584e0b06	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5613-d48f-44f6-9119cfe9ca1b	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5613-d48f-7b88-4e1799c64334	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5613-d48f-2b78-c21b8f5d2efa	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5613-d48f-509f-9de88baea108	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5613-d48f-c8b6-722f16b24854	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5613-d48f-3191-3d4cdf482f29	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5613-d48f-3c34-19db078b7149	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5613-d48f-d56b-958ab952e07e	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5613-d48f-7704-f3dfe2df7dd2	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5613-d48f-dc5e-bb711d5edfdd	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5613-d48f-03b8-7dbe3e741669	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5613-d48f-7b1e-c44b7df51099	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3035 (class 0 OID 21376145)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5613-d48f-100e-f0e0e5326f16	01	Velika predstava	f	1.00	1.00
002b0000-5613-d48f-2628-161cb226b1af	02	Mala predstava	f	0.50	0.50
002b0000-5613-d48f-0e50-c89fe57574f2	03	Mala koprodukcija	t	0.40	1.00
002b0000-5613-d48f-f517-f70806585636	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5613-d48f-3666-98ea391a1b7a	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2988 (class 0 OID 21375536)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2975 (class 0 OID 21375383)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5613-d48f-0ea3-7e7a98ebf29f	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO8.aUXDji7xv1FZvgfT2/ETuqFqRaoyK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5613-d491-caa4-fd22d71746bb	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5613-d491-58b2-ae3bba6a3497	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5613-d491-825f-ae40186085cb	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5613-d491-17d1-943095134d56	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5613-d491-5caf-581e6110f86a	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5613-d491-9a06-488d6685fcb6	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5613-d491-2fa4-42c3d66fc67a	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5613-d491-f945-adf4e51ff72d	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5613-d491-c08b-51f5c7a5884c	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5613-d491-18c4-ba9581c0cb11	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5613-d48f-6770-48b337d250e6	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3026 (class 0 OID 21375944)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5613-d491-df4a-cbc0c294eaeb	00160000-5613-d491-c4af-d20f1367fdfb	\N	00140000-5613-d48f-6639-d828e3443d09	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5613-d491-710e-0ca6001f264a
000e0000-5613-d491-d2cf-553fa66cbb12	00160000-5613-d491-f60d-2b408eb47efe	\N	00140000-5613-d48f-a5cf-fec69a0e1baa	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5613-d491-08ae-ccf5171df280
000e0000-5613-d491-36c1-d7fb3e2ff28f	\N	\N	00140000-5613-d48f-a5cf-fec69a0e1baa	00190000-5613-d491-3193-765a89a5c31b	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5613-d491-710e-0ca6001f264a
000e0000-5613-d491-71ca-bc64cbe69464	\N	\N	00140000-5613-d48f-a5cf-fec69a0e1baa	00190000-5613-d491-3193-765a89a5c31b	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5613-d491-710e-0ca6001f264a
000e0000-5613-d491-ab2f-4105356ee7c5	\N	\N	00140000-5613-d48f-a5cf-fec69a0e1baa	00190000-5613-d491-3193-765a89a5c31b	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5613-d491-9965-4e6373bd29ad
000e0000-5613-d491-e986-b4cb8d24ce88	\N	\N	00140000-5613-d48f-a5cf-fec69a0e1baa	00190000-5613-d491-3193-765a89a5c31b	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5613-d491-9965-4e6373bd29ad
\.


--
-- TOC entry 2995 (class 0 OID 21375627)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-5613-d491-02ba-a838f79f5c4a	000e0000-5613-d491-d2cf-553fa66cbb12	\N	1	
00200000-5613-d491-fe8f-8ed0969b4843	000e0000-5613-d491-d2cf-553fa66cbb12	\N	2	
00200000-5613-d491-a417-b7ae43f53329	000e0000-5613-d491-d2cf-553fa66cbb12	\N	3	
00200000-5613-d491-7dcb-962d8a9e73b8	000e0000-5613-d491-d2cf-553fa66cbb12	\N	4	
00200000-5613-d491-baee-bc4692e33501	000e0000-5613-d491-d2cf-553fa66cbb12	\N	5	
\.


--
-- TOC entry 3009 (class 0 OID 21375754)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 21375867)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5613-d48f-e4bc-e0e94e44275a	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5613-d48f-f7f0-3f5e4599be7d	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5613-d48f-fbd9-d9f85c596c2a	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5613-d48f-1275-a53c8b77ea0d	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5613-d48f-dec9-e607800b7195	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5613-d48f-99c7-a4bfa97afe1c	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5613-d48f-e14c-04082120a809	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5613-d48f-428d-f33868699583	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5613-d48f-4827-ec2d6dea3614	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5613-d48f-8cb2-0649530d3cd0	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5613-d48f-fbc3-1c20668c869c	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5613-d48f-bb82-981b56ff4a5b	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5613-d48f-652d-567888ea88da	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5613-d48f-5cac-7fc535210420	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5613-d48f-a6e1-ebb5e315beb7	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5613-d48f-375c-f3b594f07a12	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5613-d48f-2313-de8c1f4ca568	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5613-d48f-86df-8965836b73eb	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5613-d48f-a75f-09bc712ed839	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5613-d48f-d5aa-b1ce4eed5860	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5613-d48f-1db7-8bd637fa6917	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5613-d48f-99a0-e7a4f15bd8da	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5613-d48f-faea-0b2d419f4b70	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5613-d48f-666f-455178b4982e	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5613-d48f-380d-2be09e71b61d	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5613-d48f-1bfb-b45b183bb954	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5613-d48f-376c-78d8afcf3dee	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5613-d48f-ad49-9319a791339e	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3038 (class 0 OID 21376192)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 21376164)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 21376204)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 21375826)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-5613-d491-4828-74fe4c486ab7	00090000-5613-d491-d3a6-dd650004fbdb	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-5613-d491-c583-e87689df593c	00090000-5613-d491-deb5-c7a657fdbda0	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-5613-d491-3abc-f2fd3ee32542	00090000-5613-d491-6cdf-d9161acab1df	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-5613-d491-a888-5bd5e77d67d4	00090000-5613-d491-b22b-79f38a974796	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-5613-d491-092c-def6d7fdff06	00090000-5613-d491-82d6-4ae0dca7b320	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-5613-d491-9959-5f5d9c3e6962	00090000-5613-d491-2258-b257eac038a1	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 2997 (class 0 OID 21375662)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 21375934)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5613-d48f-6639-d828e3443d09	01	Drama	drama (SURS 01)
00140000-5613-d48f-3d64-5e75b87390d8	02	Opera	opera (SURS 02)
00140000-5613-d48f-d83f-81f2a49d115c	03	Balet	balet (SURS 03)
00140000-5613-d48f-eb24-e6da8fa6228a	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5613-d48f-1a3b-008cb2783c07	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5613-d48f-a5cf-fec69a0e1baa	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5613-d48f-a869-1f1d601b5890	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3015 (class 0 OID 21375816)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2502 (class 2606 OID 21375437)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 21375993)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 21375983)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 21375850)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 21375892)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2751 (class 2606 OID 21376244)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 21375651)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 21375672)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 21376162)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 21375562)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 21376053)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 21375812)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 21375625)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 21375600)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 21375576)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 21375719)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 21376221)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 21376228)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2756 (class 2606 OID 21376252)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 21093462)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2614 (class 2606 OID 21375746)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 21375534)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 21375446)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 21375470)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 21375426)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2493 (class 2606 OID 21375411)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 21375752)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 21375788)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 21375929)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 21375498)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 21375522)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 21376114)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 21375725)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 21375512)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 21375613)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 21375737)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 21376123)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 21376131)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 21376101)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 21376143)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 21375770)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 21375710)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 21375701)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 21375916)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 21375843)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 21375588)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 21375382)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 21375779)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 21375400)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2495 (class 2606 OID 21375420)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 21375797)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 21375732)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 21375681)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 21375370)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 21375358)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 21375352)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 21375863)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 21375479)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 21375692)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 21375903)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 21376155)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 21375547)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 21375395)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 21375962)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 21375635)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 21375760)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 21375875)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 21376202)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 21376186)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 21376210)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 21375834)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 21375666)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 21375942)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 21375824)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 1259 OID 21375660)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2567 (class 1259 OID 21375661)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2568 (class 1259 OID 21375659)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2569 (class 1259 OID 21375658)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2570 (class 1259 OID 21375657)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2656 (class 1259 OID 21375864)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2657 (class 1259 OID 21375865)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2658 (class 1259 OID 21375866)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2742 (class 1259 OID 21376223)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2743 (class 1259 OID 21376222)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2516 (class 1259 OID 21375500)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2615 (class 1259 OID 21375753)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2729 (class 1259 OID 21376190)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2730 (class 1259 OID 21376189)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2731 (class 1259 OID 21376191)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2732 (class 1259 OID 21376188)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2733 (class 1259 OID 21376187)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2609 (class 1259 OID 21375739)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2610 (class 1259 OID 21375738)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2561 (class 1259 OID 21375636)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2639 (class 1259 OID 21375813)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2640 (class 1259 OID 21375815)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2641 (class 1259 OID 21375814)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2541 (class 1259 OID 21375578)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2542 (class 1259 OID 21375577)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2720 (class 1259 OID 21376144)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2672 (class 1259 OID 21375931)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 21375932)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2674 (class 1259 OID 21375933)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2739 (class 1259 OID 21376211)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2681 (class 1259 OID 21375967)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2682 (class 1259 OID 21375964)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2683 (class 1259 OID 21375968)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2684 (class 1259 OID 21375966)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2685 (class 1259 OID 21375965)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2531 (class 1259 OID 21375549)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2532 (class 1259 OID 21375548)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2507 (class 1259 OID 21375473)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2627 (class 1259 OID 21375780)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2497 (class 1259 OID 21375427)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2498 (class 1259 OID 21375428)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2632 (class 1259 OID 21375800)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2633 (class 1259 OID 21375799)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2634 (class 1259 OID 21375798)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2554 (class 1259 OID 21375614)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2555 (class 1259 OID 21375615)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2477 (class 1259 OID 21375360)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2589 (class 1259 OID 21375705)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2590 (class 1259 OID 21375703)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2591 (class 1259 OID 21375702)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2592 (class 1259 OID 21375704)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2488 (class 1259 OID 21375401)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2489 (class 1259 OID 21375402)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2618 (class 1259 OID 21375761)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2752 (class 1259 OID 21376245)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2654 (class 1259 OID 21375852)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2655 (class 1259 OID 21375851)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2753 (class 1259 OID 21376253)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2754 (class 1259 OID 21376254)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2604 (class 1259 OID 21375726)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2648 (class 1259 OID 21375844)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2649 (class 1259 OID 21375845)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2702 (class 1259 OID 21376058)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2703 (class 1259 OID 21376057)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2704 (class 1259 OID 21376054)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2705 (class 1259 OID 21376055)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2706 (class 1259 OID 21376056)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2520 (class 1259 OID 21375514)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2521 (class 1259 OID 21375513)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2522 (class 1259 OID 21375515)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2621 (class 1259 OID 21375774)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2622 (class 1259 OID 21375773)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2712 (class 1259 OID 21376124)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2713 (class 1259 OID 21376125)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2695 (class 1259 OID 21375997)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2696 (class 1259 OID 21375998)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2697 (class 1259 OID 21375995)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2698 (class 1259 OID 21375996)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2645 (class 1259 OID 21375835)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2595 (class 1259 OID 21375714)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2596 (class 1259 OID 21375713)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2597 (class 1259 OID 21375711)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2598 (class 1259 OID 21375712)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2691 (class 1259 OID 21375985)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2692 (class 1259 OID 21375984)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2545 (class 1259 OID 21375589)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2548 (class 1259 OID 21375603)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2549 (class 1259 OID 21375602)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2550 (class 1259 OID 21375601)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2551 (class 1259 OID 21375604)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2560 (class 1259 OID 21375626)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2709 (class 1259 OID 21376115)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2728 (class 1259 OID 21376163)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2746 (class 1259 OID 21376229)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2747 (class 1259 OID 21376230)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2503 (class 1259 OID 21375448)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2504 (class 1259 OID 21375447)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2512 (class 1259 OID 21375480)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2513 (class 1259 OID 21375481)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2576 (class 1259 OID 21375667)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2584 (class 1259 OID 21375695)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2585 (class 1259 OID 21375694)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2586 (class 1259 OID 21375693)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2571 (class 1259 OID 21375653)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2572 (class 1259 OID 21375654)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2573 (class 1259 OID 21375652)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2574 (class 1259 OID 21375656)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2575 (class 1259 OID 21375655)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2519 (class 1259 OID 21375499)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2537 (class 1259 OID 21375563)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2538 (class 1259 OID 21375565)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2539 (class 1259 OID 21375564)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2540 (class 1259 OID 21375566)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2603 (class 1259 OID 21375720)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2677 (class 1259 OID 21375930)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2686 (class 1259 OID 21375963)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2668 (class 1259 OID 21375904)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 21375905)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2510 (class 1259 OID 21375471)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2511 (class 1259 OID 21375472)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2642 (class 1259 OID 21375825)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2483 (class 1259 OID 21375371)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2530 (class 1259 OID 21375535)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2480 (class 1259 OID 21375359)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2725 (class 1259 OID 21376156)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 21375772)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2626 (class 1259 OID 21375771)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2699 (class 1259 OID 21375994)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2527 (class 1259 OID 21375523)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2678 (class 1259 OID 21375943)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2736 (class 1259 OID 21376203)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2718 (class 1259 OID 21376132)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2719 (class 1259 OID 21376133)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2665 (class 1259 OID 21375893)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2583 (class 1259 OID 21375682)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2496 (class 1259 OID 21375421)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2787 (class 2606 OID 21376385)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2786 (class 2606 OID 21376390)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2782 (class 2606 OID 21376410)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2788 (class 2606 OID 21376380)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2784 (class 2606 OID 21376400)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2783 (class 2606 OID 21376405)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2785 (class 2606 OID 21376395)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2823 (class 2606 OID 21376575)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2822 (class 2606 OID 21376580)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2821 (class 2606 OID 21376585)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2855 (class 2606 OID 21376750)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2856 (class 2606 OID 21376745)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2768 (class 2606 OID 21376310)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2805 (class 2606 OID 21376495)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2850 (class 2606 OID 21376730)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2851 (class 2606 OID 21376725)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2849 (class 2606 OID 21376735)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2852 (class 2606 OID 21376720)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2853 (class 2606 OID 21376715)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2803 (class 2606 OID 21376490)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2804 (class 2606 OID 21376485)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2781 (class 2606 OID 21376375)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2815 (class 2606 OID 21376535)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2813 (class 2606 OID 21376545)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2814 (class 2606 OID 21376540)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2774 (class 2606 OID 21376345)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2775 (class 2606 OID 21376340)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2801 (class 2606 OID 21376475)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2847 (class 2606 OID 21376705)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2826 (class 2606 OID 21376590)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2825 (class 2606 OID 21376595)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2824 (class 2606 OID 21376600)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2854 (class 2606 OID 21376740)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2828 (class 2606 OID 21376620)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2831 (class 2606 OID 21376605)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2827 (class 2606 OID 21376625)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2829 (class 2606 OID 21376615)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2830 (class 2606 OID 21376610)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2772 (class 2606 OID 21376335)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2773 (class 2606 OID 21376330)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2764 (class 2606 OID 21376295)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2765 (class 2606 OID 21376290)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2809 (class 2606 OID 21376515)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2761 (class 2606 OID 21376270)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2760 (class 2606 OID 21376275)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2810 (class 2606 OID 21376530)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2811 (class 2606 OID 21376525)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2812 (class 2606 OID 21376520)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2779 (class 2606 OID 21376360)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2778 (class 2606 OID 21376365)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2757 (class 2606 OID 21376255)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2793 (class 2606 OID 21376450)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2795 (class 2606 OID 21376440)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2796 (class 2606 OID 21376435)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2794 (class 2606 OID 21376445)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2759 (class 2606 OID 21376260)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2758 (class 2606 OID 21376265)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2806 (class 2606 OID 21376500)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2859 (class 2606 OID 21376765)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2819 (class 2606 OID 21376570)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2820 (class 2606 OID 21376565)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2861 (class 2606 OID 21376770)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2860 (class 2606 OID 21376775)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2802 (class 2606 OID 21376480)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2818 (class 2606 OID 21376555)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2817 (class 2606 OID 21376560)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2838 (class 2606 OID 21376680)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2839 (class 2606 OID 21376675)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2842 (class 2606 OID 21376660)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2841 (class 2606 OID 21376665)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2840 (class 2606 OID 21376670)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2770 (class 2606 OID 21376320)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2771 (class 2606 OID 21376315)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2769 (class 2606 OID 21376325)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2807 (class 2606 OID 21376510)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2808 (class 2606 OID 21376505)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2845 (class 2606 OID 21376690)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2844 (class 2606 OID 21376695)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2835 (class 2606 OID 21376650)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2834 (class 2606 OID 21376655)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2837 (class 2606 OID 21376640)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2836 (class 2606 OID 21376645)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2816 (class 2606 OID 21376550)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2797 (class 2606 OID 21376470)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2798 (class 2606 OID 21376465)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2800 (class 2606 OID 21376455)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2799 (class 2606 OID 21376460)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2832 (class 2606 OID 21376635)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2833 (class 2606 OID 21376630)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2776 (class 2606 OID 21376350)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2777 (class 2606 OID 21376355)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2780 (class 2606 OID 21376370)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2843 (class 2606 OID 21376685)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2846 (class 2606 OID 21376700)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2848 (class 2606 OID 21376710)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2858 (class 2606 OID 21376755)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2857 (class 2606 OID 21376760)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2762 (class 2606 OID 21376285)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2763 (class 2606 OID 21376280)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2767 (class 2606 OID 21376300)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2766 (class 2606 OID 21376305)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2789 (class 2606 OID 21376415)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2790 (class 2606 OID 21376430)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2791 (class 2606 OID 21376425)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2792 (class 2606 OID 21376420)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-06 16:03:00 CEST

--
-- PostgreSQL database dump complete
--

