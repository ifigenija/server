--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-10-05 11:52:49 CEST

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
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 245
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 21254750)
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
-- TOC entry 229 (class 1259 OID 21255307)
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
-- TOC entry 228 (class 1259 OID 21255290)
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
-- TOC entry 219 (class 1259 OID 21255167)
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
-- TOC entry 222 (class 1259 OID 21255197)
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
-- TOC entry 243 (class 1259 OID 21255551)
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
-- TOC entry 197 (class 1259 OID 21254958)
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
-- TOC entry 199 (class 1259 OID 21254989)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 21255477)
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
-- TOC entry 190 (class 1259 OID 21254871)
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
-- TOC entry 230 (class 1259 OID 21255320)
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
-- TOC entry 215 (class 1259 OID 21255122)
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
-- TOC entry 195 (class 1259 OID 21254937)
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
-- TOC entry 193 (class 1259 OID 21254911)
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
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 191 (class 1259 OID 21254888)
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
-- TOC entry 204 (class 1259 OID 21255036)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 21255532)
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
-- TOC entry 242 (class 1259 OID 21255544)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 21255566)
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
-- TOC entry 208 (class 1259 OID 21255061)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 21254845)
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
-- TOC entry 182 (class 1259 OID 21254759)
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
-- TOC entry 183 (class 1259 OID 21254770)
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
-- TOC entry 178 (class 1259 OID 21254724)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 21254743)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 21255068)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 21255102)
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
-- TOC entry 225 (class 1259 OID 21255238)
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
-- TOC entry 185 (class 1259 OID 21254803)
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
-- TOC entry 187 (class 1259 OID 21254837)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 21255422)
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
-- TOC entry 205 (class 1259 OID 21255042)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 21254822)
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
-- TOC entry 194 (class 1259 OID 21254926)
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
-- TOC entry 207 (class 1259 OID 21255054)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 21255436)
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
-- TOC entry 234 (class 1259 OID 21255446)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 21255379)
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
-- TOC entry 235 (class 1259 OID 21255454)
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
-- TOC entry 211 (class 1259 OID 21255083)
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
-- TOC entry 203 (class 1259 OID 21255027)
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
-- TOC entry 202 (class 1259 OID 21255017)
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
-- TOC entry 224 (class 1259 OID 21255227)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 21255157)
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
-- TOC entry 192 (class 1259 OID 21254900)
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
-- TOC entry 175 (class 1259 OID 21254695)
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
-- TOC entry 174 (class 1259 OID 21254693)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 212 (class 1259 OID 21255096)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 21254733)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 21254717)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 21255110)
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
-- TOC entry 206 (class 1259 OID 21255048)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 21254994)
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
-- TOC entry 173 (class 1259 OID 21254682)
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
-- TOC entry 172 (class 1259 OID 21254674)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 21254669)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 21255174)
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
-- TOC entry 184 (class 1259 OID 21254795)
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
-- TOC entry 201 (class 1259 OID 21255004)
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
-- TOC entry 223 (class 1259 OID 21255215)
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
-- TOC entry 236 (class 1259 OID 21255465)
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
-- TOC entry 189 (class 1259 OID 21254857)
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
-- TOC entry 176 (class 1259 OID 21254704)
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
-- TOC entry 227 (class 1259 OID 21255265)
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
-- TOC entry 196 (class 1259 OID 21254948)
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
-- TOC entry 210 (class 1259 OID 21255075)
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
-- TOC entry 221 (class 1259 OID 21255188)
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
-- TOC entry 239 (class 1259 OID 21255512)
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
-- TOC entry 238 (class 1259 OID 21255484)
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
-- TOC entry 240 (class 1259 OID 21255524)
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
-- TOC entry 217 (class 1259 OID 21255147)
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
-- TOC entry 198 (class 1259 OID 21254983)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 21255255)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 21255137)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 21254698)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2979 (class 0 OID 21254750)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 21255307)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5612-486f-d11b-a5c919348d8f	000d0000-5612-486f-5387-2c9c4922fd77	\N	00090000-5612-486e-3c63-8805d6f48c33	000b0000-5612-486f-44e6-79d032c06f07	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5612-486f-24e9-5f642bb1f15a	000d0000-5612-486f-5b73-105e11adbd0f	00100000-5612-486e-4b3e-1e28f39acdd2	00090000-5612-486e-ad05-ed0df2c83b45	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5612-486f-0517-a19109551d58	000d0000-5612-486f-0694-4c5e06f89994	00100000-5612-486e-7d7c-fc8a3c16c66e	00090000-5612-486e-aeca-1b7ea56b95a6	\N	0003	t	\N	2015-10-05	\N	2	t	\N	f	f
000c0000-5612-486f-1f20-7f4cb7501391	000d0000-5612-486f-1183-9bf803027808	\N	00090000-5612-486e-036f-192228b8b586	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5612-486f-314a-1150b70f73e9	000d0000-5612-486f-b9e8-f563c3021940	\N	00090000-5612-486e-6155-5ba6104cdf74	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5612-486f-ca41-23af4f1a9457	000d0000-5612-486f-3676-146531e736e1	\N	00090000-5612-486e-0fd3-e215b2e2ad9d	000b0000-5612-486f-6298-64e2764c5b33	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5612-486f-5a86-c6166e00d446	000d0000-5612-486f-c6e1-4172e4c4f796	00100000-5612-486e-c398-b2a8fdaaf980	00090000-5612-486e-1d58-1d78de51504d	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5612-486f-eefe-bdacdd9d4b41	000d0000-5612-486f-f9ff-01026b7de6ae	\N	00090000-5612-486e-6c2b-8b681ce3ce23	000b0000-5612-486f-3440-835dfe0b9fec	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5612-486f-0d2b-3d5522ac3094	000d0000-5612-486f-c6e1-4172e4c4f796	00100000-5612-486e-e1ad-86ccef14e481	00090000-5612-486e-7b7c-dc2621673ba8	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5612-486f-7dbf-6dafb5775bb1	000d0000-5612-486f-c6e1-4172e4c4f796	00100000-5612-486e-129f-13369672e982	00090000-5612-486e-d42b-537a55942b02	\N	0010	t	\N	2015-10-05	\N	16	f	\N	f	t
000c0000-5612-486f-c6d7-000758ce5bb7	000d0000-5612-486f-c6e1-4172e4c4f796	00100000-5612-486e-2f46-0c30c1177f7a	00090000-5612-486e-c40b-92bdd15b3330	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5612-486f-9c48-6f7e2fc4da5e	000d0000-5612-486f-8083-8f8f6fee11cc	\N	00090000-5612-486e-ad05-ed0df2c83b45	000b0000-5612-486f-649c-e07cc8410d76	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3026 (class 0 OID 21255290)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 21255167)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5612-486f-feef-0f0f3996dd88	00160000-5612-486e-153d-ea7c995ce252	00090000-5612-486e-403e-a4c88c92446c	aizv	10	t
003d0000-5612-486f-48c3-0aee7de995bd	00160000-5612-486e-153d-ea7c995ce252	00090000-5612-486e-93cf-a3dbbba8e33d	apri	14	t
003d0000-5612-486f-273c-1fc8d833ec2e	00160000-5612-486e-0b03-9ec35c5e5cd0	00090000-5612-486e-825a-6b53708d4c94	aizv	11	t
003d0000-5612-486f-af76-21b280760b35	00160000-5612-486e-878a-a0dbc2b384d9	00090000-5612-486e-fdb2-baa3f1f9cc18	aizv	12	t
003d0000-5612-486f-fc15-e2ec07082336	00160000-5612-486e-153d-ea7c995ce252	00090000-5612-486e-73f0-dfd48435196c	apri	18	f
\.


--
-- TOC entry 3020 (class 0 OID 21255197)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5612-486e-153d-ea7c995ce252	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	\N
00160000-5612-486e-0b03-9ec35c5e5cd0	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	\N
00160000-5612-486e-878a-a0dbc2b384d9	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	\N
\.


--
-- TOC entry 3041 (class 0 OID 21255551)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 21254958)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5612-486f-8091-40f2bed4d497	\N	\N	00200000-5612-486f-ed24-a2446b290794	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5612-486f-cdfb-493d1d7f0828	\N	\N	00200000-5612-486f-0b10-0500850f9465	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5612-486f-0fe7-f00f95f96846	\N	\N	00200000-5612-486f-4117-2a26160dd621	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5612-486f-e293-76349d8dcbb8	\N	\N	00200000-5612-486f-4e9f-450b18552f1f	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5612-486f-bf6b-57fb44474e93	\N	\N	00200000-5612-486f-3e7a-d4f3d11ba056	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2997 (class 0 OID 21254989)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 21255477)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 21254871)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5612-486c-4d7b-c50d05b60ca5	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5612-486c-edb4-e8bccc422004	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5612-486c-5b75-3c434453a8e8	AL	ALB	008	Albania 	Albanija	\N
00040000-5612-486c-9001-6e4203873414	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5612-486c-01e1-fedaf30dac15	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5612-486c-af62-bed79c338bf6	AD	AND	020	Andorra 	Andora	\N
00040000-5612-486c-1616-2e8b57aeab8f	AO	AGO	024	Angola 	Angola	\N
00040000-5612-486c-112e-e0d692b45cfe	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5612-486c-28f7-74dde021f304	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5612-486c-a2f6-4810dbeebad8	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5612-486c-af60-e06ed8f7d929	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5612-486c-06ae-774e3eef8eec	AM	ARM	051	Armenia 	Armenija	\N
00040000-5612-486c-a890-cf2c37fcf221	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5612-486c-cc11-743fff35316f	AU	AUS	036	Australia 	Avstralija	\N
00040000-5612-486c-d832-1c2a77a19494	AT	AUT	040	Austria 	Avstrija	\N
00040000-5612-486c-f1e6-1d487344a2a2	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5612-486c-0ee0-84b5b0f8b020	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5612-486c-73b0-ba889d57171f	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5612-486c-4cfe-c8a9887d8daf	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5612-486c-d11f-e3a12e34584d	BB	BRB	052	Barbados 	Barbados	\N
00040000-5612-486c-594d-f497b44980d2	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5612-486c-cef9-554e4845d2ac	BE	BEL	056	Belgium 	Belgija	\N
00040000-5612-486c-4ad8-7730b8fc0c22	BZ	BLZ	084	Belize 	Belize	\N
00040000-5612-486c-b030-3457cdd7bbd1	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5612-486c-8473-893d80ef893e	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5612-486c-cc43-b36dec752203	BT	BTN	064	Bhutan 	Butan	\N
00040000-5612-486c-6884-ab15882387dd	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5612-486c-3c51-808c7790d827	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5612-486c-59b8-3f911b933bf4	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5612-486c-d774-80225882c14f	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5612-486c-0fa9-ac5559b860a4	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5612-486c-9321-7bc0b7b89e00	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5612-486c-d510-614b7f128bd2	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5612-486c-3d45-e0c4fdbb7b91	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5612-486c-5715-4cf9c7f3a4d6	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5612-486c-0f45-6bc377360a4a	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5612-486c-0b0f-223d412149e2	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5612-486c-a2ba-dcd5d039262b	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5612-486c-c2a2-0b348dfb0059	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5612-486c-2cfc-719e432f26b2	CA	CAN	124	Canada 	Kanada	\N
00040000-5612-486c-b829-69e9099a2859	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5612-486c-31f2-ac52d124045c	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5612-486c-fc91-db70c1217092	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5612-486c-6810-543e9881d9a5	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5612-486c-8fc0-945151593e54	CL	CHL	152	Chile 	Čile	\N
00040000-5612-486c-d9da-05ecad16a66b	CN	CHN	156	China 	Kitajska	\N
00040000-5612-486c-af39-ebda0664e324	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5612-486c-a204-eaf0aa3a54ea	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5612-486c-5bb3-9b058c8765d3	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5612-486c-b4ea-6c80945002a3	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5612-486c-2265-e0a60723a0bb	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5612-486c-0a13-5bc4868ee952	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5612-486c-2750-34674cbe42b8	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5612-486c-7cff-35af7c620b92	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5612-486c-bbea-ff2ada895322	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5612-486c-bfe3-741d3317fa16	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5612-486c-9b25-e498eb6e3cac	CU	CUB	192	Cuba 	Kuba	\N
00040000-5612-486c-325c-46d7ed7e3bc3	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5612-486c-4f81-d6738d86bc64	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5612-486c-273e-9159b8b434a3	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5612-486c-24af-6e022ecd69ea	DK	DNK	208	Denmark 	Danska	\N
00040000-5612-486c-a3a6-5535a683426a	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5612-486c-6f8f-229381604a4a	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5612-486c-dceb-7b16b1692e67	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5612-486c-9467-97d2a3452bd5	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5612-486c-da95-d393a7bb2bef	EG	EGY	818	Egypt 	Egipt	\N
00040000-5612-486c-e15e-49f4f1ed80ad	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5612-486c-7d63-c7a7b121994e	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5612-486c-5db8-04ce810887bc	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5612-486c-0a63-91b39e0ac3c2	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5612-486c-10cf-91b86d22258d	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5612-486c-a46a-8ae69b9068c7	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5612-486c-7fa8-d6461922fb55	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5612-486c-3c95-a4201f2bf662	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5612-486c-6918-dc0f83816214	FI	FIN	246	Finland 	Finska	\N
00040000-5612-486c-23da-2a5e9897f776	FR	FRA	250	France 	Francija	\N
00040000-5612-486c-28af-a75667701009	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5612-486c-bec4-abf76b327050	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5612-486c-a133-e6dab6c045d9	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5612-486c-4320-03c1658c0d85	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5612-486c-636d-5868572cb515	GA	GAB	266	Gabon 	Gabon	\N
00040000-5612-486c-f46d-df4cdd2ae239	GM	GMB	270	Gambia 	Gambija	\N
00040000-5612-486c-6a02-4de25faae2b8	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5612-486c-9c3a-51bd592257a2	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5612-486c-530e-083709a65c80	GH	GHA	288	Ghana 	Gana	\N
00040000-5612-486c-4955-1dd49cbbddbb	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5612-486c-f729-eadf1bc787a1	GR	GRC	300	Greece 	Grčija	\N
00040000-5612-486c-dd17-28878b96d1a3	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5612-486c-b372-744f64e78096	GD	GRD	308	Grenada 	Grenada	\N
00040000-5612-486c-b7d4-23c8a3100e82	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5612-486c-2fdd-9563d8b785d0	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5612-486c-c65d-40cfbddb58e6	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5612-486c-671d-2672bea744d4	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5612-486c-fe33-d465bfb66491	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5612-486c-01ca-f0dcbe5707bc	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5612-486c-1c0c-812302347288	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5612-486c-58a8-c11e35317614	HT	HTI	332	Haiti 	Haiti	\N
00040000-5612-486c-516f-7c2b0d9d434e	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5612-486c-7909-a134e62df548	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5612-486c-7427-f255e6593403	HN	HND	340	Honduras 	Honduras	\N
00040000-5612-486c-cc25-9d378c24aaa6	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5612-486c-ec34-a64cb5a7552a	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5612-486c-8b47-15efd2525af0	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5612-486c-c0f9-ca064273f157	IN	IND	356	India 	Indija	\N
00040000-5612-486c-58bf-9f85ba8ca997	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5612-486c-36e3-1d28f4127b72	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5612-486c-7c45-481570b764f1	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5612-486c-6131-212beff6874b	IE	IRL	372	Ireland 	Irska	\N
00040000-5612-486c-f1ed-71b868466a45	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5612-486c-dae7-6b6a38e76650	IL	ISR	376	Israel 	Izrael	\N
00040000-5612-486c-29d9-8fdf068b923a	IT	ITA	380	Italy 	Italija	\N
00040000-5612-486c-a7d1-2cce9a5e725d	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5612-486c-eb16-d2d04fb10d30	JP	JPN	392	Japan 	Japonska	\N
00040000-5612-486c-1878-edee0c322b4c	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5612-486c-3f4f-2e0cd3b836a3	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5612-486c-2855-b1e984406017	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5612-486c-37ce-2a607b1567e6	KE	KEN	404	Kenya 	Kenija	\N
00040000-5612-486c-2a7a-79d32a7bdc29	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5612-486c-e8b5-324fa4a8440a	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5612-486c-95b3-27b69585eb94	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5612-486c-bb95-476ccc446f63	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5612-486c-bade-abd8b9829e5d	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5612-486c-37a6-5ab6831cf706	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5612-486c-2b06-c664833ecc18	LV	LVA	428	Latvia 	Latvija	\N
00040000-5612-486c-8990-6c19053fe9f9	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5612-486c-2fd6-25f964e69c68	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5612-486c-a346-2b1ed948ecc8	LR	LBR	430	Liberia 	Liberija	\N
00040000-5612-486c-5826-10f713be1b14	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5612-486c-5cf7-ab7ca8f49c05	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5612-486c-49f9-7c6c295729e3	LT	LTU	440	Lithuania 	Litva	\N
00040000-5612-486c-e783-bef3decd2ba3	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5612-486c-ceba-88cf3a889d9f	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5612-486c-d8df-c7aa25c0da8b	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5612-486c-41d9-c05363791bec	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5612-486c-340b-efb6209405cb	MW	MWI	454	Malawi 	Malavi	\N
00040000-5612-486c-f75c-5df4a5482489	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5612-486c-f07d-deba611ac64e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5612-486c-943c-b7d337b37f5d	ML	MLI	466	Mali 	Mali	\N
00040000-5612-486c-e379-417c38f351f5	MT	MLT	470	Malta 	Malta	\N
00040000-5612-486c-9d9c-79263e66bd18	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5612-486c-6f98-8bb88e0deb4e	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5612-486c-bc6d-569397b9f6d4	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5612-486c-8152-fc91280921c2	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5612-486c-01a3-4735d50cc273	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5612-486c-6b08-d91440f60ce7	MX	MEX	484	Mexico 	Mehika	\N
00040000-5612-486c-3b40-64522be6053f	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5612-486c-0563-9d16a4d1bdf1	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5612-486c-4040-a83eba50aa3c	MC	MCO	492	Monaco 	Monako	\N
00040000-5612-486c-4815-e1d9d6bf6b67	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5612-486c-63e2-adef71a3d1f8	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5612-486c-fc59-7729d0ccfecf	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5612-486c-d2cc-f323c215374d	MA	MAR	504	Morocco 	Maroko	\N
00040000-5612-486c-2955-535433c2e137	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5612-486c-d7f0-cfca8e0dd098	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5612-486c-4003-faa5891f4032	NA	NAM	516	Namibia 	Namibija	\N
00040000-5612-486c-035e-ea57263fb224	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5612-486c-a298-6989309618cd	NP	NPL	524	Nepal 	Nepal	\N
00040000-5612-486c-bdaa-0eb3134829bb	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5612-486c-5a09-3c5470429923	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5612-486c-8def-8a321e6de91c	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5612-486c-a478-63543245bac4	NE	NER	562	Niger 	Niger 	\N
00040000-5612-486c-5255-bf939cdd4980	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5612-486c-0df3-9ad169bca47e	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5612-486c-5f6e-ab7fcd2bf0b3	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5612-486c-f71f-657bb492b97b	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5612-486c-a6b9-c2a1ccece7e9	NO	NOR	578	Norway 	Norveška	\N
00040000-5612-486c-fe13-3fd48fcdc137	OM	OMN	512	Oman 	Oman	\N
00040000-5612-486c-fea6-8aa9b036a232	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5612-486c-7012-38fc8b8f8aa9	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5612-486c-88e8-6b4a01ef8939	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5612-486c-f53e-891eb6f5e4b9	PA	PAN	591	Panama 	Panama	\N
00040000-5612-486c-b63c-dbd0dce57d41	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5612-486c-0b20-0e32debb3a55	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5612-486c-8cb0-86dde7adc59f	PE	PER	604	Peru 	Peru	\N
00040000-5612-486c-1e9e-6fdadebe95e9	PH	PHL	608	Philippines 	Filipini	\N
00040000-5612-486c-4793-af2fb59da930	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5612-486c-a743-16c8a1677193	PL	POL	616	Poland 	Poljska	\N
00040000-5612-486c-3df3-a23eafeb3fd3	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5612-486c-992e-03514d7c1053	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5612-486c-270d-927fc5a4949b	QA	QAT	634	Qatar 	Katar	\N
00040000-5612-486c-99e7-77c7f6888d80	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5612-486c-09f4-3083e170fc23	RO	ROU	642	Romania 	Romunija	\N
00040000-5612-486c-54ab-09e2a8a915d8	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5612-486c-7a1c-0d105bacc3bf	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5612-486c-8782-97597e8dcba7	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5612-486c-19a1-1e6f8119c1b3	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5612-486c-501d-768f87a26cc6	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5612-486c-060f-ef15e97140de	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5612-486c-59e9-0fcb01241d13	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5612-486c-859e-4490ad2fee16	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5612-486c-1f82-930e152a0adc	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5612-486c-eb46-34abc9995235	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5612-486c-847d-a99f8eaee36e	SM	SMR	674	San Marino 	San Marino	\N
00040000-5612-486c-0007-8f7248998d1d	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5612-486c-6f75-8d7f0a73abb5	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5612-486c-8e82-031af56b6de7	SN	SEN	686	Senegal 	Senegal	\N
00040000-5612-486c-8516-5bdba316bf43	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5612-486c-d3c8-b86e719f5306	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5612-486c-d1cf-b3d52e36bd3c	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5612-486c-3e21-a7d12f3c0bd0	SG	SGP	702	Singapore 	Singapur	\N
00040000-5612-486c-ca29-a128b83a5e00	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5612-486c-30ea-1eb6bc35a719	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5612-486c-bfe2-fb90bdde56e6	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5612-486c-40ca-0ee6f78dd02e	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5612-486c-da09-6ca13e93431b	SO	SOM	706	Somalia 	Somalija	\N
00040000-5612-486c-c57a-32fd9db47001	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5612-486c-1e86-a8b2fd299a30	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5612-486c-fe64-fd8189cf0bf9	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5612-486c-9d18-3219a8b60a0b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5612-486c-43a8-6031f9e96e72	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5612-486c-9b70-e6832f3d6f2a	SD	SDN	729	Sudan 	Sudan	\N
00040000-5612-486c-ab87-24a995667e12	SR	SUR	740	Suriname 	Surinam	\N
00040000-5612-486c-33c3-d9904f513564	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5612-486c-c102-9057696c4159	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5612-486c-c58b-e0bc5f7dc0b7	SE	SWE	752	Sweden 	Švedska	\N
00040000-5612-486c-13d9-553986bdac6b	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5612-486c-e70d-00272399382d	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5612-486c-52fa-29d81a057ca1	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5612-486c-377b-0f0e139f20e4	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5612-486c-5b9c-9d7006971da1	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5612-486c-a9b3-50f60ca8839a	TH	THA	764	Thailand 	Tajska	\N
00040000-5612-486c-6220-ce587cf45627	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5612-486c-59eb-c7efa3d9d12a	TG	TGO	768	Togo 	Togo	\N
00040000-5612-486c-6a59-0ba6db654dd6	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5612-486c-b27b-d71159778103	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5612-486c-0e1e-286f7c0da982	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5612-486c-66a4-645c7569ef88	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5612-486c-6fa1-267af9eab9da	TR	TUR	792	Turkey 	Turčija	\N
00040000-5612-486c-e369-cd139c96ca70	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5612-486c-36d1-658a5150f519	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5612-486c-715c-6ed25470c885	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5612-486c-c471-109639562871	UG	UGA	800	Uganda 	Uganda	\N
00040000-5612-486c-52f6-bc799bdf849d	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5612-486c-f4bf-b6c49f3ad391	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5612-486c-7d49-a0f376aa69ff	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5612-486c-65d8-3627eb6f4981	US	USA	840	United States 	Združene države Amerike	\N
00040000-5612-486c-ad85-c6b0796a6e32	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5612-486c-5069-3cfed0e424c2	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5612-486c-6273-bc41897b0245	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5612-486c-b70a-6de0fd7c1b9c	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5612-486c-e582-9fb147ab7393	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5612-486c-c3ad-0ac0effdcba6	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5612-486c-50f2-c518a4546a2d	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5612-486c-2b7f-16d842cf218b	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5612-486c-ec33-9525f1b387eb	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5612-486c-7a44-62c2ebc5e7ee	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5612-486c-0c13-a893fefa2ceb	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5612-486c-3076-6b0227667e75	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5612-486c-0345-2557e24cd943	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3028 (class 0 OID 21255320)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5612-486f-22dd-89eb61936393	000e0000-5612-486f-e433-428a0bf5fbad	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5612-486c-43ec-e293d9eeb704	premiera	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5612-486f-6167-f95ad36072e5	000e0000-5612-486f-0a0e-05b0b73e6855	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5612-486c-28af-b53b4b2869e3	premiera	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5612-486f-969c-de777c9e9613	000e0000-5612-486f-3c77-17f9534d09c3	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5612-486c-43ec-e293d9eeb704	premiera	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5612-486f-ff03-9e390912d63d	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5612-486f-95d5-3d615742bdd3	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3013 (class 0 OID 21255122)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5612-486f-5387-2c9c4922fd77	000e0000-5612-486f-0a0e-05b0b73e6855	000c0000-5612-486f-d11b-a5c919348d8f	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5612-486c-6705-e6a67748ac9a
000d0000-5612-486f-5b73-105e11adbd0f	000e0000-5612-486f-0a0e-05b0b73e6855	000c0000-5612-486f-24e9-5f642bb1f15a	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5612-486c-656c-f65b7e551b03
000d0000-5612-486f-0694-4c5e06f89994	000e0000-5612-486f-0a0e-05b0b73e6855	000c0000-5612-486f-0517-a19109551d58	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5612-486c-75a8-5603a6148cc9
000d0000-5612-486f-1183-9bf803027808	000e0000-5612-486f-0a0e-05b0b73e6855	000c0000-5612-486f-1f20-7f4cb7501391	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5612-486c-e3ae-f1910dd2cb89
000d0000-5612-486f-b9e8-f563c3021940	000e0000-5612-486f-0a0e-05b0b73e6855	000c0000-5612-486f-314a-1150b70f73e9	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5612-486c-e3ae-f1910dd2cb89
000d0000-5612-486f-3676-146531e736e1	000e0000-5612-486f-0a0e-05b0b73e6855	000c0000-5612-486f-ca41-23af4f1a9457	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5612-486c-6705-e6a67748ac9a
000d0000-5612-486f-c6e1-4172e4c4f796	000e0000-5612-486f-0a0e-05b0b73e6855	000c0000-5612-486f-0d2b-3d5522ac3094	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5612-486c-6705-e6a67748ac9a
000d0000-5612-486f-f9ff-01026b7de6ae	000e0000-5612-486f-0a0e-05b0b73e6855	000c0000-5612-486f-eefe-bdacdd9d4b41	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5612-486c-24cc-8556af0a57cb
000d0000-5612-486f-8083-8f8f6fee11cc	000e0000-5612-486f-0a0e-05b0b73e6855	000c0000-5612-486f-9c48-6f7e2fc4da5e	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5612-486c-73bc-a81e330afcf2
\.


--
-- TOC entry 2993 (class 0 OID 21254937)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 21254911)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 21254888)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5612-486f-79e2-28a886515223	00080000-5612-486e-015d-8668e174a757	00090000-5612-486e-d42b-537a55942b02	AK		igralka
\.


--
-- TOC entry 3002 (class 0 OID 21255036)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 21255532)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 21255544)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 21255566)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 21093458)
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
-- TOC entry 3006 (class 0 OID 21255061)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 21254845)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5612-486d-25b9-86f56f168191	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5612-486d-aae7-8fb498133e1f	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5612-486d-678a-0c5d53fbe379	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5612-486d-268c-508608c6e5da	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5612-486d-c820-54f3c6d5a010	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5612-486d-96eb-0e220ac6a6a2	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5612-486d-18af-3d50144f65a9	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5612-486d-9ac8-2b2336e1fc71	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5612-486d-e49b-d0f468bc5588	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5612-486d-f814-803e7f07ed30	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5612-486d-e500-60d9cd5eece6	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5612-486d-400e-226500c47643	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5612-486d-d296-dbc3e1b1ffb5	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5612-486d-2575-88855dc1835e	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5612-486d-b14d-5b0db6ec21e7	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5612-486e-8618-f62329e1cad7	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5612-486e-21fd-75153043ed3a	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5612-486e-b3eb-3df6abd76397	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5612-486e-26af-096cb2526005	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5612-486e-f25a-011454f260b0	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5612-4870-94a4-39dbb9c0df74	application.tenant.maticnopodjetje	string	s:36:"00080000-5612-4870-94f9-186f455d44ab";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 2980 (class 0 OID 21254759)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5612-486e-2068-b7d3d453e49c	00000000-5612-486e-8618-f62329e1cad7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5612-486e-7703-0efdd874ca66	00000000-5612-486e-8618-f62329e1cad7	00010000-5612-486d-1cf4-1808be0bbf19	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5612-486e-eae4-1c92bf6eadbd	00000000-5612-486e-21fd-75153043ed3a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2981 (class 0 OID 21254770)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5612-486e-3c63-8805d6f48c33	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5612-486e-036f-192228b8b586	00010000-5612-486e-6aa6-bee84680349d	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5612-486e-aeca-1b7ea56b95a6	00010000-5612-486e-c5d4-ed4929173684	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5612-486e-7b7c-dc2621673ba8	00010000-5612-486e-4ff4-09e9c7d03cf8	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5612-486e-9746-18dafb1c5928	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5612-486e-0fd3-e215b2e2ad9d	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5612-486e-c40b-92bdd15b3330	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5612-486e-1d58-1d78de51504d	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5612-486e-d42b-537a55942b02	00010000-5612-486e-6056-aca0980c179d	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5612-486e-ad05-ed0df2c83b45	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5612-486e-fa93-d3b0f18ea9e6	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5612-486e-6155-5ba6104cdf74	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5612-486e-6c2b-8b681ce3ce23	00010000-5612-486e-cb04-8c87c58683a5	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5612-486e-403e-a4c88c92446c	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5612-486e-93cf-a3dbbba8e33d	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5612-486e-825a-6b53708d4c94	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5612-486e-fdb2-baa3f1f9cc18	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5612-486e-73f0-dfd48435196c	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2976 (class 0 OID 21254724)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5612-486c-ec1d-d87029d64754	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5612-486c-f93a-a9754ac5564d	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5612-486c-2e3d-0559c996b41c	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5612-486c-1ffe-8df11795899c	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5612-486c-6bac-732bdf304432	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5612-486c-0c39-491d4a60ec9b	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5612-486c-e6a9-3e80699ffa28	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5612-486c-94ba-cdc29c326b3a	Abonma-read	Abonma - branje	f
00030000-5612-486c-7187-17fb6d68089d	Abonma-write	Abonma - spreminjanje	f
00030000-5612-486c-a554-5116c4b8a1c2	Alternacija-read	Alternacija - branje	f
00030000-5612-486c-b2eb-cf524d75fb31	Alternacija-write	Alternacija - spreminjanje	f
00030000-5612-486c-5697-6dde9b4fcfb2	Arhivalija-read	Arhivalija - branje	f
00030000-5612-486c-14ff-b8403e3357db	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5612-486c-7672-d3bee235b7ed	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5612-486c-67e9-825bfded6e43	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5612-486c-1920-6123189d9058	Besedilo-read	Besedilo - branje	f
00030000-5612-486c-a71f-7890e2bfc08a	Besedilo-write	Besedilo - spreminjanje	f
00030000-5612-486c-a490-0009b0545275	DogodekIzven-read	DogodekIzven - branje	f
00030000-5612-486c-4f23-f976c9029314	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5612-486c-a622-7197ee633e9b	Dogodek-read	Dogodek - branje	f
00030000-5612-486c-dda7-de99cc9467b6	Dogodek-write	Dogodek - spreminjanje	f
00030000-5612-486c-3f39-070bed5b9cd0	DrugiVir-read	DrugiVir - branje	f
00030000-5612-486c-9add-231047d71ed5	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5612-486c-9c10-fcfc1614788a	Drzava-read	Drzava - branje	f
00030000-5612-486c-44fd-828c68487290	Drzava-write	Drzava - spreminjanje	f
00030000-5612-486c-ddc9-264bfc907ea2	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5612-486c-d29b-0974110da65a	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5612-486c-9ee1-b057adc6b34c	Funkcija-read	Funkcija - branje	f
00030000-5612-486c-25c9-255f4c8c6992	Funkcija-write	Funkcija - spreminjanje	f
00030000-5612-486c-fceb-cf2b79771512	Gostovanje-read	Gostovanje - branje	f
00030000-5612-486c-ac93-57609557390c	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5612-486c-87b4-25ce687710b8	Gostujoca-read	Gostujoca - branje	f
00030000-5612-486c-4da4-8904913b280e	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5612-486c-07d6-48da98820e3e	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5612-486c-4fe0-0cb4af13c96b	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5612-486c-87a9-63ae6666c7c3	Kupec-read	Kupec - branje	f
00030000-5612-486c-e9b4-31d9cb46459a	Kupec-write	Kupec - spreminjanje	f
00030000-5612-486c-1e9b-570444c27fc9	NacinPlacina-read	NacinPlacina - branje	f
00030000-5612-486c-d020-56af1558d8e7	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5612-486c-ac0a-6bc63ccaee33	Option-read	Option - branje	f
00030000-5612-486c-f268-a9351270e3a7	Option-write	Option - spreminjanje	f
00030000-5612-486c-cdfd-bd9f2177ed9e	OptionValue-read	OptionValue - branje	f
00030000-5612-486c-4147-9c1073820b4f	OptionValue-write	OptionValue - spreminjanje	f
00030000-5612-486c-dcf8-4f8751ee6b66	Oseba-read	Oseba - branje	f
00030000-5612-486c-eb28-e57c10df4e98	Oseba-write	Oseba - spreminjanje	f
00030000-5612-486c-c1ee-180a94a286c3	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5612-486c-0e36-760c74568ad9	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5612-486c-b637-bc7bc05dcb8b	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5612-486c-e883-a516c2405d17	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5612-486c-27b0-87c61ec8694d	Pogodba-read	Pogodba - branje	f
00030000-5612-486c-799e-59d4a7637d88	Pogodba-write	Pogodba - spreminjanje	f
00030000-5612-486c-e7b3-854e0ad64a75	Popa-read	Popa - branje	f
00030000-5612-486c-2e6a-3135a72b51e5	Popa-write	Popa - spreminjanje	f
00030000-5612-486c-2c29-37704fa160d4	Posta-read	Posta - branje	f
00030000-5612-486c-9d32-396c417d274a	Posta-write	Posta - spreminjanje	f
00030000-5612-486c-d2a2-9d58ee7c2b57	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5612-486c-db82-a717f36d3d99	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5612-486c-3243-8823e1d7b19a	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5612-486c-abdc-0174ec02e52d	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5612-486c-d070-4226f0e81fb2	PostniNaslov-read	PostniNaslov - branje	f
00030000-5612-486c-c723-61537f331a93	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5612-486c-154c-5701e230ef23	Predstava-read	Predstava - branje	f
00030000-5612-486c-f043-1f8e25e94620	Predstava-write	Predstava - spreminjanje	f
00030000-5612-486c-14ce-e14cf949c90c	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5612-486c-01db-b6a4df9e4f0d	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5612-486c-2bf4-b883bf8b3bc5	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5612-486c-cc79-63bf6673c758	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5612-486c-6f76-39a2ab9fe542	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5612-486c-5355-7a6d00f2f56f	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5612-486c-a896-0ff7477d0016	ProgramDela-read	ProgramDela - branje	f
00030000-5612-486c-529e-f6bfd095248e	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5612-486c-2d3d-7bb6a6cbbc3c	ProgramFestival-read	ProgramFestival - branje	f
00030000-5612-486c-701e-6e96ee2cb801	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5612-486c-b09c-668fcc2d6c8f	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5612-486c-2c10-67385c91502c	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5612-486c-7388-d77d7ae608b6	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5612-486c-6c7b-3f5a07357c7f	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5612-486c-ba78-e400ae68b7d5	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5612-486c-d892-dca693b9f17e	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5612-486c-48a2-a64f5686f031	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5612-486c-99ab-cb0794f3fd4f	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5612-486c-12f0-34d4b3ca13f2	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5612-486c-9f70-832148ba64c6	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5612-486c-32cc-4a15b42073e2	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5612-486c-456b-5b795374a2a9	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5612-486c-bc10-6b5c2d6f8647	ProgramRazno-read	ProgramRazno - branje	f
00030000-5612-486c-d32f-25c6b32c8c3c	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5612-486c-2dc4-ca4d85d0e7d0	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5612-486c-c125-69fde077cadf	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5612-486c-2315-2ab5172690a7	Prostor-read	Prostor - branje	f
00030000-5612-486c-ecee-4de7b5d66589	Prostor-write	Prostor - spreminjanje	f
00030000-5612-486c-31a2-878c1e408b6a	Racun-read	Racun - branje	f
00030000-5612-486c-d555-d78eac025f40	Racun-write	Racun - spreminjanje	f
00030000-5612-486c-ea24-c27562e43c41	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5612-486c-33fc-00fc933bce50	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5612-486c-e375-ed832e1e90a8	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5612-486c-fe5b-db290866662d	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5612-486c-3920-3679f68e83da	Rekvizit-read	Rekvizit - branje	f
00030000-5612-486c-7eee-1b1bf4033989	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5612-486c-c742-f5eb04d4dab5	Revizija-read	Revizija - branje	f
00030000-5612-486c-457b-921c5e99c01f	Revizija-write	Revizija - spreminjanje	f
00030000-5612-486c-e8c9-4390a35c857e	Rezervacija-read	Rezervacija - branje	f
00030000-5612-486c-61e9-93a2e4b49e5b	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5612-486c-5e68-f24e26654ef3	SedezniRed-read	SedezniRed - branje	f
00030000-5612-486c-ee51-9750289ea470	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5612-486c-301a-67151257f687	Sedez-read	Sedez - branje	f
00030000-5612-486c-90ef-d25e7342bfeb	Sedez-write	Sedez - spreminjanje	f
00030000-5612-486c-8524-3afe2efe66fa	Sezona-read	Sezona - branje	f
00030000-5612-486c-207a-4a01d5690102	Sezona-write	Sezona - spreminjanje	f
00030000-5612-486c-9df9-ec29a69e20fd	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5612-486c-3a53-310db77444fa	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5612-486c-b4fc-0fdc20a67092	Stevilcenje-read	Stevilcenje - branje	f
00030000-5612-486c-e4bd-113cef55f15c	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5612-486c-cdfb-f4a9492c65ac	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5612-486c-cf54-e30ba80b09be	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5612-486c-afab-a9a4ef60fda6	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5612-486c-ecd4-6407d443b000	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5612-486c-27bb-52e54f4e0f3d	Telefonska-read	Telefonska - branje	f
00030000-5612-486c-4b1e-249658d070cb	Telefonska-write	Telefonska - spreminjanje	f
00030000-5612-486c-173b-81e96800902e	TerminStoritve-read	TerminStoritve - branje	f
00030000-5612-486c-542d-115156b10e90	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5612-486c-e813-b22607f4ab7c	TipFunkcije-read	TipFunkcije - branje	f
00030000-5612-486c-12c1-c4414f9c5565	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5612-486c-b3c4-e58a42375740	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5612-486c-5af1-a766963162a9	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5612-486c-d81a-b0a22cddb976	Trr-read	Trr - branje	f
00030000-5612-486c-f113-4a661db23f8a	Trr-write	Trr - spreminjanje	f
00030000-5612-486c-a6e3-b0b36388f3ef	Uprizoritev-read	Uprizoritev - branje	f
00030000-5612-486c-c449-1f8dad8c595e	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5612-486c-f389-9f57261c0b16	Vaja-read	Vaja - branje	f
00030000-5612-486c-e8f6-5d6bd0556d05	Vaja-write	Vaja - spreminjanje	f
00030000-5612-486c-f118-8c00f529892f	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5612-486c-d7cb-8760261fadfa	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5612-486c-d8d3-f6954e2e2386	VrstaStroska-read	VrstaStroska - branje	f
00030000-5612-486c-ba92-1402dec5efef	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5612-486c-68cb-d2419e9357bd	Zaposlitev-read	Zaposlitev - branje	f
00030000-5612-486c-83bc-42c36efc83ab	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5612-486c-f94b-652a8a2cff7f	Zasedenost-read	Zasedenost - branje	f
00030000-5612-486c-3125-fd17bd97a95b	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5612-486c-db69-985aac16556a	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5612-486c-e4fe-5ad4ae5d720e	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5612-486c-2b58-1d5ba17e7ff0	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5612-486c-924a-488b6d06244d	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5612-486c-e01e-70ef515c81a3	Job-read	Branje opravil - samo zase - branje	f
00030000-5612-486c-6baf-241f27041fa1	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5612-486c-540f-5e7ee36e8e20	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5612-486c-a6fa-73776595217a	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5612-486c-c8ee-3bc4febe17b2	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5612-486c-ae71-0526b05c57bf	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5612-486c-5b39-f8c29da5df36	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5612-486c-5d9d-9c78529de757	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5612-486c-fcef-cc0a2fc771fe	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5612-486c-6c17-a319a5d91342	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5612-486c-4e40-d277d9871b51	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5612-486d-9690-0175ae6f3e8b	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5612-486d-7183-c9f715d8b26e	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5612-486d-3240-cd9dcf08101c	Datoteka-write	Datoteka - spreminjanje	f
00030000-5612-486d-e4e4-37dd70d0554a	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2978 (class 0 OID 21254743)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5612-486d-ee8a-e47fa1db9641	00030000-5612-486c-f93a-a9754ac5564d
00020000-5612-486d-68a6-781f91966a24	00030000-5612-486c-9c10-fcfc1614788a
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-94ba-cdc29c326b3a
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-7187-17fb6d68089d
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-a554-5116c4b8a1c2
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-b2eb-cf524d75fb31
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-5697-6dde9b4fcfb2
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-a622-7197ee633e9b
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-1ffe-8df11795899c
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-dda7-de99cc9467b6
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-9c10-fcfc1614788a
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-44fd-828c68487290
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-9ee1-b057adc6b34c
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-25c9-255f4c8c6992
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-fceb-cf2b79771512
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-ac93-57609557390c
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-87b4-25ce687710b8
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-4da4-8904913b280e
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-07d6-48da98820e3e
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-4fe0-0cb4af13c96b
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-ac0a-6bc63ccaee33
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-cdfd-bd9f2177ed9e
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-dcf8-4f8751ee6b66
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-eb28-e57c10df4e98
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-e7b3-854e0ad64a75
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-2e6a-3135a72b51e5
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-2c29-37704fa160d4
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-9d32-396c417d274a
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-d070-4226f0e81fb2
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-c723-61537f331a93
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-154c-5701e230ef23
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-f043-1f8e25e94620
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-6f76-39a2ab9fe542
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-5355-7a6d00f2f56f
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-2315-2ab5172690a7
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-ecee-4de7b5d66589
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-e375-ed832e1e90a8
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-fe5b-db290866662d
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-3920-3679f68e83da
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-7eee-1b1bf4033989
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-8524-3afe2efe66fa
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-207a-4a01d5690102
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-e813-b22607f4ab7c
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-a6e3-b0b36388f3ef
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-c449-1f8dad8c595e
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-f389-9f57261c0b16
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-e8f6-5d6bd0556d05
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-f94b-652a8a2cff7f
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-3125-fd17bd97a95b
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-db69-985aac16556a
00020000-5612-486d-f82d-67efa88af758	00030000-5612-486c-2b58-1d5ba17e7ff0
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-94ba-cdc29c326b3a
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-5697-6dde9b4fcfb2
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-a622-7197ee633e9b
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-9c10-fcfc1614788a
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-fceb-cf2b79771512
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-87b4-25ce687710b8
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-07d6-48da98820e3e
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-4fe0-0cb4af13c96b
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-ac0a-6bc63ccaee33
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-cdfd-bd9f2177ed9e
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-dcf8-4f8751ee6b66
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-eb28-e57c10df4e98
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-e7b3-854e0ad64a75
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-2c29-37704fa160d4
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-d070-4226f0e81fb2
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-c723-61537f331a93
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-154c-5701e230ef23
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-2315-2ab5172690a7
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-e375-ed832e1e90a8
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-3920-3679f68e83da
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-8524-3afe2efe66fa
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-27bb-52e54f4e0f3d
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-4b1e-249658d070cb
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-d81a-b0a22cddb976
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-f113-4a661db23f8a
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-68cb-d2419e9357bd
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-83bc-42c36efc83ab
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-db69-985aac16556a
00020000-5612-486d-1007-3d365c25b778	00030000-5612-486c-2b58-1d5ba17e7ff0
00020000-5612-486d-3a14-0df1ca8fd7c6	00030000-5612-486c-94ba-cdc29c326b3a
00020000-5612-486d-3a14-0df1ca8fd7c6	00030000-5612-486c-a554-5116c4b8a1c2
00020000-5612-486d-3a14-0df1ca8fd7c6	00030000-5612-486c-5697-6dde9b4fcfb2
00020000-5612-486d-3a14-0df1ca8fd7c6	00030000-5612-486c-14ff-b8403e3357db
00020000-5612-486d-3a14-0df1ca8fd7c6	00030000-5612-486c-1920-6123189d9058
00020000-5612-486d-3a14-0df1ca8fd7c6	00030000-5612-486c-a490-0009b0545275
00020000-5612-486d-3a14-0df1ca8fd7c6	00030000-5612-486c-a622-7197ee633e9b
00020000-5612-486d-3a14-0df1ca8fd7c6	00030000-5612-486c-9c10-fcfc1614788a
00020000-5612-486d-3a14-0df1ca8fd7c6	00030000-5612-486c-9ee1-b057adc6b34c
00020000-5612-486d-3a14-0df1ca8fd7c6	00030000-5612-486c-fceb-cf2b79771512
00020000-5612-486d-3a14-0df1ca8fd7c6	00030000-5612-486c-87b4-25ce687710b8
00020000-5612-486d-3a14-0df1ca8fd7c6	00030000-5612-486c-07d6-48da98820e3e
00020000-5612-486d-3a14-0df1ca8fd7c6	00030000-5612-486c-ac0a-6bc63ccaee33
00020000-5612-486d-3a14-0df1ca8fd7c6	00030000-5612-486c-cdfd-bd9f2177ed9e
00020000-5612-486d-3a14-0df1ca8fd7c6	00030000-5612-486c-dcf8-4f8751ee6b66
00020000-5612-486d-3a14-0df1ca8fd7c6	00030000-5612-486c-e7b3-854e0ad64a75
00020000-5612-486d-3a14-0df1ca8fd7c6	00030000-5612-486c-2c29-37704fa160d4
00020000-5612-486d-3a14-0df1ca8fd7c6	00030000-5612-486c-154c-5701e230ef23
00020000-5612-486d-3a14-0df1ca8fd7c6	00030000-5612-486c-6f76-39a2ab9fe542
00020000-5612-486d-3a14-0df1ca8fd7c6	00030000-5612-486c-2315-2ab5172690a7
00020000-5612-486d-3a14-0df1ca8fd7c6	00030000-5612-486c-e375-ed832e1e90a8
00020000-5612-486d-3a14-0df1ca8fd7c6	00030000-5612-486c-3920-3679f68e83da
00020000-5612-486d-3a14-0df1ca8fd7c6	00030000-5612-486c-8524-3afe2efe66fa
00020000-5612-486d-3a14-0df1ca8fd7c6	00030000-5612-486c-e813-b22607f4ab7c
00020000-5612-486d-3a14-0df1ca8fd7c6	00030000-5612-486c-f389-9f57261c0b16
00020000-5612-486d-3a14-0df1ca8fd7c6	00030000-5612-486c-f94b-652a8a2cff7f
00020000-5612-486d-3a14-0df1ca8fd7c6	00030000-5612-486c-db69-985aac16556a
00020000-5612-486d-3a14-0df1ca8fd7c6	00030000-5612-486c-2b58-1d5ba17e7ff0
00020000-5612-486d-0c63-b2c742d6553e	00030000-5612-486c-94ba-cdc29c326b3a
00020000-5612-486d-0c63-b2c742d6553e	00030000-5612-486c-7187-17fb6d68089d
00020000-5612-486d-0c63-b2c742d6553e	00030000-5612-486c-b2eb-cf524d75fb31
00020000-5612-486d-0c63-b2c742d6553e	00030000-5612-486c-5697-6dde9b4fcfb2
00020000-5612-486d-0c63-b2c742d6553e	00030000-5612-486c-a622-7197ee633e9b
00020000-5612-486d-0c63-b2c742d6553e	00030000-5612-486c-9c10-fcfc1614788a
00020000-5612-486d-0c63-b2c742d6553e	00030000-5612-486c-fceb-cf2b79771512
00020000-5612-486d-0c63-b2c742d6553e	00030000-5612-486c-87b4-25ce687710b8
00020000-5612-486d-0c63-b2c742d6553e	00030000-5612-486c-ac0a-6bc63ccaee33
00020000-5612-486d-0c63-b2c742d6553e	00030000-5612-486c-cdfd-bd9f2177ed9e
00020000-5612-486d-0c63-b2c742d6553e	00030000-5612-486c-e7b3-854e0ad64a75
00020000-5612-486d-0c63-b2c742d6553e	00030000-5612-486c-2c29-37704fa160d4
00020000-5612-486d-0c63-b2c742d6553e	00030000-5612-486c-154c-5701e230ef23
00020000-5612-486d-0c63-b2c742d6553e	00030000-5612-486c-2315-2ab5172690a7
00020000-5612-486d-0c63-b2c742d6553e	00030000-5612-486c-e375-ed832e1e90a8
00020000-5612-486d-0c63-b2c742d6553e	00030000-5612-486c-3920-3679f68e83da
00020000-5612-486d-0c63-b2c742d6553e	00030000-5612-486c-8524-3afe2efe66fa
00020000-5612-486d-0c63-b2c742d6553e	00030000-5612-486c-e813-b22607f4ab7c
00020000-5612-486d-0c63-b2c742d6553e	00030000-5612-486c-db69-985aac16556a
00020000-5612-486d-0c63-b2c742d6553e	00030000-5612-486c-2b58-1d5ba17e7ff0
00020000-5612-486d-065f-b649bfef813f	00030000-5612-486c-94ba-cdc29c326b3a
00020000-5612-486d-065f-b649bfef813f	00030000-5612-486c-5697-6dde9b4fcfb2
00020000-5612-486d-065f-b649bfef813f	00030000-5612-486c-a622-7197ee633e9b
00020000-5612-486d-065f-b649bfef813f	00030000-5612-486c-9c10-fcfc1614788a
00020000-5612-486d-065f-b649bfef813f	00030000-5612-486c-fceb-cf2b79771512
00020000-5612-486d-065f-b649bfef813f	00030000-5612-486c-87b4-25ce687710b8
00020000-5612-486d-065f-b649bfef813f	00030000-5612-486c-ac0a-6bc63ccaee33
00020000-5612-486d-065f-b649bfef813f	00030000-5612-486c-cdfd-bd9f2177ed9e
00020000-5612-486d-065f-b649bfef813f	00030000-5612-486c-e7b3-854e0ad64a75
00020000-5612-486d-065f-b649bfef813f	00030000-5612-486c-2c29-37704fa160d4
00020000-5612-486d-065f-b649bfef813f	00030000-5612-486c-154c-5701e230ef23
00020000-5612-486d-065f-b649bfef813f	00030000-5612-486c-2315-2ab5172690a7
00020000-5612-486d-065f-b649bfef813f	00030000-5612-486c-e375-ed832e1e90a8
00020000-5612-486d-065f-b649bfef813f	00030000-5612-486c-3920-3679f68e83da
00020000-5612-486d-065f-b649bfef813f	00030000-5612-486c-8524-3afe2efe66fa
00020000-5612-486d-065f-b649bfef813f	00030000-5612-486c-173b-81e96800902e
00020000-5612-486d-065f-b649bfef813f	00030000-5612-486c-2e3d-0559c996b41c
00020000-5612-486d-065f-b649bfef813f	00030000-5612-486c-e813-b22607f4ab7c
00020000-5612-486d-065f-b649bfef813f	00030000-5612-486c-db69-985aac16556a
00020000-5612-486d-065f-b649bfef813f	00030000-5612-486c-2b58-1d5ba17e7ff0
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-ec1d-d87029d64754
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-f93a-a9754ac5564d
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-2e3d-0559c996b41c
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-1ffe-8df11795899c
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-6bac-732bdf304432
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-0c39-491d4a60ec9b
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-e6a9-3e80699ffa28
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-94ba-cdc29c326b3a
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-7187-17fb6d68089d
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-a554-5116c4b8a1c2
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-b2eb-cf524d75fb31
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-5697-6dde9b4fcfb2
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-14ff-b8403e3357db
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-1920-6123189d9058
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-a71f-7890e2bfc08a
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-a490-0009b0545275
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-4f23-f976c9029314
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-a622-7197ee633e9b
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-dda7-de99cc9467b6
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-9c10-fcfc1614788a
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-44fd-828c68487290
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-3f39-070bed5b9cd0
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-9add-231047d71ed5
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-ddc9-264bfc907ea2
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-d29b-0974110da65a
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-9ee1-b057adc6b34c
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-25c9-255f4c8c6992
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-fceb-cf2b79771512
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-ac93-57609557390c
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-87b4-25ce687710b8
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-4da4-8904913b280e
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-07d6-48da98820e3e
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-4fe0-0cb4af13c96b
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-87a9-63ae6666c7c3
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-e9b4-31d9cb46459a
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-1e9b-570444c27fc9
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-d020-56af1558d8e7
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-ac0a-6bc63ccaee33
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-f268-a9351270e3a7
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-cdfd-bd9f2177ed9e
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-4147-9c1073820b4f
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-dcf8-4f8751ee6b66
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-eb28-e57c10df4e98
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-c1ee-180a94a286c3
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-0e36-760c74568ad9
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-b637-bc7bc05dcb8b
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-e883-a516c2405d17
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-27b0-87c61ec8694d
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-799e-59d4a7637d88
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-e7b3-854e0ad64a75
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-2e6a-3135a72b51e5
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-2c29-37704fa160d4
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-9d32-396c417d274a
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-d2a2-9d58ee7c2b57
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-db82-a717f36d3d99
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-3243-8823e1d7b19a
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-abdc-0174ec02e52d
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-d070-4226f0e81fb2
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-c723-61537f331a93
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-154c-5701e230ef23
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-f043-1f8e25e94620
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-14ce-e14cf949c90c
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-01db-b6a4df9e4f0d
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-2bf4-b883bf8b3bc5
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-cc79-63bf6673c758
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-6f76-39a2ab9fe542
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-5355-7a6d00f2f56f
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-a896-0ff7477d0016
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-529e-f6bfd095248e
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-2d3d-7bb6a6cbbc3c
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-701e-6e96ee2cb801
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-b09c-668fcc2d6c8f
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-2c10-67385c91502c
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-7388-d77d7ae608b6
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-6c7b-3f5a07357c7f
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-ba78-e400ae68b7d5
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-d892-dca693b9f17e
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-48a2-a64f5686f031
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-99ab-cb0794f3fd4f
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-12f0-34d4b3ca13f2
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-9f70-832148ba64c6
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-32cc-4a15b42073e2
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-456b-5b795374a2a9
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-bc10-6b5c2d6f8647
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-d32f-25c6b32c8c3c
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-2dc4-ca4d85d0e7d0
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-c125-69fde077cadf
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-2315-2ab5172690a7
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-ecee-4de7b5d66589
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-31a2-878c1e408b6a
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-d555-d78eac025f40
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-ea24-c27562e43c41
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-33fc-00fc933bce50
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-e375-ed832e1e90a8
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-fe5b-db290866662d
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-3920-3679f68e83da
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-7eee-1b1bf4033989
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-c742-f5eb04d4dab5
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-457b-921c5e99c01f
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-e8c9-4390a35c857e
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-61e9-93a2e4b49e5b
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-5e68-f24e26654ef3
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-ee51-9750289ea470
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-301a-67151257f687
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-90ef-d25e7342bfeb
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-8524-3afe2efe66fa
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-207a-4a01d5690102
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-9df9-ec29a69e20fd
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-3a53-310db77444fa
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-b4fc-0fdc20a67092
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-e4bd-113cef55f15c
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-cdfb-f4a9492c65ac
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-cf54-e30ba80b09be
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-afab-a9a4ef60fda6
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-ecd4-6407d443b000
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-27bb-52e54f4e0f3d
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-4b1e-249658d070cb
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-173b-81e96800902e
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-542d-115156b10e90
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-e813-b22607f4ab7c
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-12c1-c4414f9c5565
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-b3c4-e58a42375740
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-5af1-a766963162a9
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-d81a-b0a22cddb976
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-f113-4a661db23f8a
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-a6e3-b0b36388f3ef
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-c449-1f8dad8c595e
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-f389-9f57261c0b16
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-e8f6-5d6bd0556d05
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-f118-8c00f529892f
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-d7cb-8760261fadfa
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-d8d3-f6954e2e2386
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-ba92-1402dec5efef
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-68cb-d2419e9357bd
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-83bc-42c36efc83ab
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-f94b-652a8a2cff7f
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-3125-fd17bd97a95b
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-db69-985aac16556a
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-e4fe-5ad4ae5d720e
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-2b58-1d5ba17e7ff0
00020000-5612-486e-1ad2-98eee6cbadb1	00030000-5612-486c-924a-488b6d06244d
\.


--
-- TOC entry 3007 (class 0 OID 21255068)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 21255102)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 21255238)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5612-486f-44e6-79d032c06f07	00090000-5612-486e-3c63-8805d6f48c33	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5612-486f-6298-64e2764c5b33	00090000-5612-486e-0fd3-e215b2e2ad9d	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5612-486f-3440-835dfe0b9fec	00090000-5612-486e-6c2b-8b681ce3ce23	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5612-486f-649c-e07cc8410d76	00090000-5612-486e-ad05-ed0df2c83b45	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2983 (class 0 OID 21254803)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5612-486e-015d-8668e174a757	00040000-5612-486c-bfe2-fb90bdde56e6	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5612-486e-e2e1-2368770faf48	00040000-5612-486c-bfe2-fb90bdde56e6	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5612-486e-633a-7b8787a0db35	00040000-5612-486c-bfe2-fb90bdde56e6	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5612-486e-eac5-f9cc6d20c984	00040000-5612-486c-bfe2-fb90bdde56e6	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5612-486e-7f17-a19a46719f34	00040000-5612-486c-bfe2-fb90bdde56e6	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5612-486e-db42-3a6256a8d24e	00040000-5612-486c-af60-e06ed8f7d929	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5612-486e-3425-a59728ed8abe	00040000-5612-486c-bfe3-741d3317fa16	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5612-486e-2306-4627e2a07a02	00040000-5612-486c-d832-1c2a77a19494	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5612-486e-dade-53a19f76f3a7	00040000-5612-486c-9c3a-51bd592257a2	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5612-4870-94f9-186f455d44ab	00040000-5612-486c-bfe2-fb90bdde56e6	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2985 (class 0 OID 21254837)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5612-486c-15e4-839fbb428ae7	8341	Adlešiči
00050000-5612-486c-e405-641c9dee4a51	5270	Ajdovščina
00050000-5612-486c-6670-79b7edaa59e2	6280	Ankaran/Ancarano
00050000-5612-486c-b50b-e0969039dfdd	9253	Apače
00050000-5612-486c-b8a0-9bd268ba7589	8253	Artiče
00050000-5612-486c-80f9-e6db2ba955d8	4275	Begunje na Gorenjskem
00050000-5612-486c-20ec-fdd7e0b4f89c	1382	Begunje pri Cerknici
00050000-5612-486c-b9d3-8325e249655e	9231	Beltinci
00050000-5612-486c-b7cb-e075a1bd7bc1	2234	Benedikt
00050000-5612-486c-def2-56c76b20d7a4	2345	Bistrica ob Dravi
00050000-5612-486c-c3eb-66e65f40cda0	3256	Bistrica ob Sotli
00050000-5612-486c-8b56-49b5f0ef0a85	8259	Bizeljsko
00050000-5612-486c-283b-83388198b5eb	1223	Blagovica
00050000-5612-486c-9a82-590ef5920b0c	8283	Blanca
00050000-5612-486c-bdea-f545cdb2c5f4	4260	Bled
00050000-5612-486c-ed6f-590c9dbbfbaf	4273	Blejska Dobrava
00050000-5612-486c-30a2-53c324068660	9265	Bodonci
00050000-5612-486c-f45c-b3e5596e8987	9222	Bogojina
00050000-5612-486c-df38-503d2952c47a	4263	Bohinjska Bela
00050000-5612-486c-f182-4c5f5a0b934b	4264	Bohinjska Bistrica
00050000-5612-486c-8d9b-284bc375fe09	4265	Bohinjsko jezero
00050000-5612-486c-1c22-b31a3641216b	1353	Borovnica
00050000-5612-486c-6e6c-f9c0b5bad1f4	8294	Boštanj
00050000-5612-486c-c958-11e3c9bfcf3f	5230	Bovec
00050000-5612-486c-082e-ba3452a485d2	5295	Branik
00050000-5612-486c-a0ee-f6aa5832c522	3314	Braslovče
00050000-5612-486c-9f8c-59d54633d364	5223	Breginj
00050000-5612-486c-1082-4088c5dc5217	8280	Brestanica
00050000-5612-486c-d71d-cccdf7919fe0	2354	Bresternica
00050000-5612-486c-bdae-157db92734a9	4243	Brezje
00050000-5612-486c-c8c3-6be5015cca27	1351	Brezovica pri Ljubljani
00050000-5612-486c-6b69-9fe11044c932	8250	Brežice
00050000-5612-486c-3d88-d69c1beea996	4210	Brnik - Aerodrom
00050000-5612-486c-b03d-ed0b3575267b	8321	Brusnice
00050000-5612-486c-bed7-8c823ce12410	3255	Buče
00050000-5612-486c-84a3-92af43a65933	8276	Bučka 
00050000-5612-486c-22ee-899c4bb83927	9261	Cankova
00050000-5612-486c-3d20-b2f2a285a152	3000	Celje 
00050000-5612-486c-9532-b08140397f05	3001	Celje - poštni predali
00050000-5612-486c-3bc4-2c4ba4459c9b	4207	Cerklje na Gorenjskem
00050000-5612-486c-b0de-672f3f37f385	8263	Cerklje ob Krki
00050000-5612-486c-8e0d-cba38c7388d9	1380	Cerknica
00050000-5612-486c-4f71-843bcdeaf3a3	5282	Cerkno
00050000-5612-486c-4c1f-6df5af4bddf1	2236	Cerkvenjak
00050000-5612-486c-b3c5-7da79bb02169	2215	Ceršak
00050000-5612-486c-7ae3-dcd4afb240d0	2326	Cirkovce
00050000-5612-486c-f5c4-586acd06822a	2282	Cirkulane
00050000-5612-486c-e3d6-4090bc5d5373	5273	Col
00050000-5612-486c-8f6b-4ae26d844bee	8251	Čatež ob Savi
00050000-5612-486c-409c-a8320a5a37bb	1413	Čemšenik
00050000-5612-486c-cf8f-6bb2e57abef8	5253	Čepovan
00050000-5612-486c-8d84-2f3d2fc93c39	9232	Črenšovci
00050000-5612-486c-9a53-b0d763bf2743	2393	Črna na Koroškem
00050000-5612-486c-f111-c247f7dbeddd	6275	Črni Kal
00050000-5612-486c-814d-b056869e7f4a	5274	Črni Vrh nad Idrijo
00050000-5612-486c-9359-441e07318f2a	5262	Črniče
00050000-5612-486c-e502-bcc7f42a33de	8340	Črnomelj
00050000-5612-486c-ffa7-939339a43a1e	6271	Dekani
00050000-5612-486c-f511-32862c8ad648	5210	Deskle
00050000-5612-486c-a710-39e1ab632645	2253	Destrnik
00050000-5612-486c-e4c9-5faa015cbaf9	6215	Divača
00050000-5612-486c-fe7b-accf6e7d4401	1233	Dob
00050000-5612-486c-9aff-ea9dd8f5b001	3224	Dobje pri Planini
00050000-5612-486c-6462-d4a8f59ace14	8257	Dobova
00050000-5612-486c-bb22-7a95b4d5fcf4	1423	Dobovec
00050000-5612-486c-1647-711c1e9c0920	5263	Dobravlje
00050000-5612-486c-55ef-2116dae28e5c	3204	Dobrna
00050000-5612-486c-82d0-ed9893e9118d	8211	Dobrnič
00050000-5612-486c-e4ba-3507cb1c60e3	1356	Dobrova
00050000-5612-486c-19b6-6e9388258b52	9223	Dobrovnik/Dobronak 
00050000-5612-486c-d720-0290bd16d0f3	5212	Dobrovo v Brdih
00050000-5612-486c-58e0-bcf18e253f8c	1431	Dol pri Hrastniku
00050000-5612-486c-44d7-04772fe73f23	1262	Dol pri Ljubljani
00050000-5612-486c-a5b7-bd8ef3e0f4db	1273	Dole pri Litiji
00050000-5612-486c-3cb6-f3235c68c8c5	1331	Dolenja vas
00050000-5612-486c-b5ec-8d871a79cd03	8350	Dolenjske Toplice
00050000-5612-486c-947a-430a1e64bf91	1230	Domžale
00050000-5612-486c-6c9f-d3a03807a089	2252	Dornava
00050000-5612-486c-36eb-815e31244bb6	5294	Dornberk
00050000-5612-486c-100c-815ceb4761da	1319	Draga
00050000-5612-486c-9f8c-8dc8241fe2f6	8343	Dragatuš
00050000-5612-486c-f41a-09f2fbc67dab	3222	Dramlje
00050000-5612-486c-d8a7-c33ce0ec4b59	2370	Dravograd
00050000-5612-486c-de40-5e888cdc0688	4203	Duplje
00050000-5612-486c-1d11-3e610d88c110	6221	Dutovlje
00050000-5612-486c-f89e-9536033e4354	8361	Dvor
00050000-5612-486c-4865-c7e4c2086b7c	2343	Fala
00050000-5612-486c-e835-71da50ee4925	9208	Fokovci
00050000-5612-486c-0a5d-df3268ce6606	2313	Fram
00050000-5612-486c-e995-d6c0258c610f	3213	Frankolovo
00050000-5612-486c-d59c-56a62da33637	1274	Gabrovka
00050000-5612-486c-c62e-eba9805cc991	8254	Globoko
00050000-5612-486c-4f6b-c23e9941573e	5275	Godovič
00050000-5612-486c-360c-919febbb1426	4204	Golnik
00050000-5612-486c-c92d-8fb15af631f5	3303	Gomilsko
00050000-5612-486c-d550-f4007464ae57	4224	Gorenja vas
00050000-5612-486c-f900-10eafac36045	3263	Gorica pri Slivnici
00050000-5612-486c-ccd5-31f30f6926cb	2272	Gorišnica
00050000-5612-486c-8e00-34596c6ff296	9250	Gornja Radgona
00050000-5612-486c-ab2c-afae7c4d4329	3342	Gornji Grad
00050000-5612-486c-c35a-995c812616f3	4282	Gozd Martuljek
00050000-5612-486c-322f-eaf2d927c4b7	6272	Gračišče
00050000-5612-486c-4c27-b1843466b69f	9264	Grad
00050000-5612-486c-b308-29fc08d96f51	8332	Gradac
00050000-5612-486c-6ddb-b668d4cf2341	1384	Grahovo
00050000-5612-486c-b665-5c056020b10b	5242	Grahovo ob Bači
00050000-5612-486c-21b3-de72ce63496b	5251	Grgar
00050000-5612-486c-8081-b53578fe716c	3302	Griže
00050000-5612-486c-e923-f8b6269b9fc7	3231	Grobelno
00050000-5612-486c-651a-7eabe8762f08	1290	Grosuplje
00050000-5612-486c-daab-c6d5f990cdd6	2288	Hajdina
00050000-5612-486c-a931-6cbf39b470e1	8362	Hinje
00050000-5612-486c-c335-f5f11d404596	2311	Hoče
00050000-5612-486c-4263-45ec204255a9	9205	Hodoš/Hodos
00050000-5612-486c-df48-54cca69f887a	1354	Horjul
00050000-5612-486c-5ca0-a1da177ae119	1372	Hotedršica
00050000-5612-486c-f879-0827debcbac5	1430	Hrastnik
00050000-5612-486c-a77a-f83255794be8	6225	Hruševje
00050000-5612-486c-7e2a-a17cb344488f	4276	Hrušica
00050000-5612-486c-798f-7562c565a7c7	5280	Idrija
00050000-5612-486c-5f7f-954f76f2e04f	1292	Ig
00050000-5612-486c-a72a-52898d66960f	6250	Ilirska Bistrica
00050000-5612-486c-43d5-cfe2c23b0d88	6251	Ilirska Bistrica-Trnovo
00050000-5612-486c-a62d-6d8d99ac7c69	1295	Ivančna Gorica
00050000-5612-486c-ceae-3bfb82ec04b6	2259	Ivanjkovci
00050000-5612-486c-e5b0-2e730009b107	1411	Izlake
00050000-5612-486c-672f-12b83915a772	6310	Izola/Isola
00050000-5612-486c-a9bc-ec89da6932b9	2222	Jakobski Dol
00050000-5612-486c-e812-f117c212475a	2221	Jarenina
00050000-5612-486c-0677-04a10ccbf7e5	6254	Jelšane
00050000-5612-486c-31e7-0471b80013de	4270	Jesenice
00050000-5612-486c-b624-18e164a1da83	8261	Jesenice na Dolenjskem
00050000-5612-486c-b162-ee820e52f34e	3273	Jurklošter
00050000-5612-486c-0947-c4cd2d4e9e42	2223	Jurovski Dol
00050000-5612-486c-2891-bf99d4496c75	2256	Juršinci
00050000-5612-486c-7a23-f6a00fc172da	5214	Kal nad Kanalom
00050000-5612-486c-353e-9d76699167dd	3233	Kalobje
00050000-5612-486c-349c-12b009d597e8	4246	Kamna Gorica
00050000-5612-486c-9cb3-8264a21567cd	2351	Kamnica
00050000-5612-486c-3edb-43ec335f0d94	1241	Kamnik
00050000-5612-486c-d97c-8c71273dc137	5213	Kanal
00050000-5612-486c-4843-f065c62fc430	8258	Kapele
00050000-5612-486c-88de-9d1ffb2e66a7	2362	Kapla
00050000-5612-486c-152b-c9fef91a6359	2325	Kidričevo
00050000-5612-486c-076f-77c4fbbb6fd1	1412	Kisovec
00050000-5612-486c-a3da-c98d60760f44	6253	Knežak
00050000-5612-486c-74ef-63a25e529d7d	5222	Kobarid
00050000-5612-486c-e01e-5415f8ea6af4	9227	Kobilje
00050000-5612-486c-3eaf-b92768a1b893	1330	Kočevje
00050000-5612-486c-b603-928ddaede641	1338	Kočevska Reka
00050000-5612-486c-6ffc-75b158c6edb4	2276	Kog
00050000-5612-486c-3133-5504f6140da9	5211	Kojsko
00050000-5612-486c-03fb-f6c255c94edd	6223	Komen
00050000-5612-486c-4f65-a7f6592907e0	1218	Komenda
00050000-5612-486c-2a6b-285edc8bc144	6000	Koper/Capodistria 
00050000-5612-486c-7b51-77e80ce7b27d	6001	Koper/Capodistria - poštni predali
00050000-5612-486c-4724-122870982589	8282	Koprivnica
00050000-5612-486c-8b8c-2e5574c935ba	5296	Kostanjevica na Krasu
00050000-5612-486c-7c30-bb85917b875c	8311	Kostanjevica na Krki
00050000-5612-486c-ae40-800e88739cca	1336	Kostel
00050000-5612-486c-ffed-7a0675cf135f	6256	Košana
00050000-5612-486c-f5e5-626f4497c8b8	2394	Kotlje
00050000-5612-486c-3522-d509ef88fe5e	6240	Kozina
00050000-5612-486c-49ac-7f2f951b7541	3260	Kozje
00050000-5612-486c-b57e-fc744910f0bd	4000	Kranj 
00050000-5612-486c-5a78-109d55ba7965	4001	Kranj - poštni predali
00050000-5612-486c-d5d3-6f52c2f0fbd3	4280	Kranjska Gora
00050000-5612-486c-8cae-2859c64abc65	1281	Kresnice
00050000-5612-486c-adc6-ccd624f06386	4294	Križe
00050000-5612-486c-205f-b1661240ba36	9206	Križevci
00050000-5612-486c-4b91-1eb0acf8e97a	9242	Križevci pri Ljutomeru
00050000-5612-486c-0284-38eef5357f34	1301	Krka
00050000-5612-486c-4066-c9c1a4d43eed	8296	Krmelj
00050000-5612-486c-fc08-35469306076b	4245	Kropa
00050000-5612-486c-778b-22db6d64855b	8262	Krška vas
00050000-5612-486c-c454-8e74a2fc4406	8270	Krško
00050000-5612-486c-5b1c-8d8a3c8c7668	9263	Kuzma
00050000-5612-486c-aec0-f82dd12569b1	2318	Laporje
00050000-5612-486c-f2ab-f4979747f5cb	3270	Laško
00050000-5612-486c-86d3-3f99251a3c79	1219	Laze v Tuhinju
00050000-5612-486c-a9ac-6ef2ed1e5627	2230	Lenart v Slovenskih goricah
00050000-5612-486c-4dec-b4b75359cf94	9220	Lendava/Lendva
00050000-5612-486c-488a-b6627df4e2e7	4248	Lesce
00050000-5612-486c-2e44-e199b7ec64c8	3261	Lesično
00050000-5612-486c-356c-60db61305ca8	8273	Leskovec pri Krškem
00050000-5612-486c-ddba-1f8502b9ef2d	2372	Libeliče
00050000-5612-486c-22dd-ff81bd88556a	2341	Limbuš
00050000-5612-486c-3da6-beb10ccea47c	1270	Litija
00050000-5612-486c-48d4-96e878236868	3202	Ljubečna
00050000-5612-486c-84e8-f7166d2c577d	1000	Ljubljana 
00050000-5612-486c-fef4-155b37293c32	1001	Ljubljana - poštni predali
00050000-5612-486c-8195-08f8e8eea552	1231	Ljubljana - Črnuče
00050000-5612-486c-974f-17d28182f09b	1261	Ljubljana - Dobrunje
00050000-5612-486c-8618-850d4e6ae093	1260	Ljubljana - Polje
00050000-5612-486c-f935-b1ee865dfab3	1210	Ljubljana - Šentvid
00050000-5612-486c-2418-ec02961e7e52	1211	Ljubljana - Šmartno
00050000-5612-486c-0d21-3e0c25c2476d	3333	Ljubno ob Savinji
00050000-5612-486c-c0f4-b3fba1267bd5	9240	Ljutomer
00050000-5612-486c-c3e6-584ab9950a9b	3215	Loče
00050000-5612-486c-dcf0-a6ee86c81be5	5231	Log pod Mangartom
00050000-5612-486c-a139-4d601c40e7a7	1358	Log pri Brezovici
00050000-5612-486c-e892-09265a1ea848	1370	Logatec
00050000-5612-486c-efd8-6bb6cdd01539	1371	Logatec
00050000-5612-486c-146c-73e5bea700f8	1434	Loka pri Zidanem Mostu
00050000-5612-486c-3aa3-ac05210e5e4f	3223	Loka pri Žusmu
00050000-5612-486c-aab6-99168e378d36	6219	Lokev
00050000-5612-486c-3492-eb2801813086	1318	Loški Potok
00050000-5612-486c-e262-fc820ea86d8a	2324	Lovrenc na Dravskem polju
00050000-5612-486c-0e69-55381b622e0d	2344	Lovrenc na Pohorju
00050000-5612-486c-f5c3-1a2b994d7c3a	3334	Luče
00050000-5612-486c-46d8-0fa6ed1cc80a	1225	Lukovica
00050000-5612-486c-179d-c9d63f312b54	9202	Mačkovci
00050000-5612-486c-8175-fc69f37c2a59	2322	Majšperk
00050000-5612-486c-d3d8-16cf666dae94	2321	Makole
00050000-5612-486c-9b0f-1fc4a246ff07	9243	Mala Nedelja
00050000-5612-486c-d0d1-d40866dbc97f	2229	Malečnik
00050000-5612-486c-19ad-9c7b5fc3d85d	6273	Marezige
00050000-5612-486c-be8e-253c5ba2da45	2000	Maribor 
00050000-5612-486c-f975-55b26cec8f8f	2001	Maribor - poštni predali
00050000-5612-486c-efd1-0af90db62a9e	2206	Marjeta na Dravskem polju
00050000-5612-486c-1873-ed5037bfe988	2281	Markovci
00050000-5612-486c-ebd8-6043c8e95a91	9221	Martjanci
00050000-5612-486c-0c54-35a25fd1f827	6242	Materija
00050000-5612-486c-145a-e0b04e8afe50	4211	Mavčiče
00050000-5612-486c-2c30-e88552bd4439	1215	Medvode
00050000-5612-486c-7a04-7271c39fda46	1234	Mengeš
00050000-5612-486c-d0a0-7dfe8e93279d	8330	Metlika
00050000-5612-486c-5236-dc9dfa18eefe	2392	Mežica
00050000-5612-486c-a152-ad5885f82c91	2204	Miklavž na Dravskem polju
00050000-5612-486c-43aa-3085e90326f5	2275	Miklavž pri Ormožu
00050000-5612-486c-b730-d5d8b127fb01	5291	Miren
00050000-5612-486c-b3a5-ca323f651c3d	8233	Mirna
00050000-5612-486c-cb1b-f846de98e6c1	8216	Mirna Peč
00050000-5612-486c-c9a7-d76ae0b6aa80	2382	Mislinja
00050000-5612-486c-4f3a-dc8ee3306812	4281	Mojstrana
00050000-5612-486c-0e8a-6f395e1650f9	8230	Mokronog
00050000-5612-486c-0df7-5a93baa489d5	1251	Moravče
00050000-5612-486c-036d-2d40a686ac48	9226	Moravske Toplice
00050000-5612-486c-4cee-80358b70ce7f	5216	Most na Soči
00050000-5612-486c-980c-d629c4dac9d2	1221	Motnik
00050000-5612-486c-cd3e-23dfe884b513	3330	Mozirje
00050000-5612-486c-d9f9-fcbbb331f7b9	9000	Murska Sobota 
00050000-5612-486c-660c-f314801777db	9001	Murska Sobota - poštni predali
00050000-5612-486c-b6cc-e858597fe281	2366	Muta
00050000-5612-486c-a341-2fb9fccf5183	4202	Naklo
00050000-5612-486c-3da0-c9c80bb9f84a	3331	Nazarje
00050000-5612-486c-d0d2-c661343b52aa	1357	Notranje Gorice
00050000-5612-486c-1ec0-eaa27ec2e02a	3203	Nova Cerkev
00050000-5612-486c-1a7c-d6cf710dc9e5	5000	Nova Gorica 
00050000-5612-486c-e540-80df8c622769	5001	Nova Gorica - poštni predali
00050000-5612-486c-8daa-85c6775fe78f	1385	Nova vas
00050000-5612-486c-2824-524c35c8d0bf	8000	Novo mesto
00050000-5612-486c-a5b4-d3327d4e06d0	8001	Novo mesto - poštni predali
00050000-5612-486c-84f3-f6a6b17b2f01	6243	Obrov
00050000-5612-486c-849c-98e9797cea80	9233	Odranci
00050000-5612-486c-1332-f0a78a1dda03	2317	Oplotnica
00050000-5612-486c-a417-e68f81b030cd	2312	Orehova vas
00050000-5612-486c-090e-64af70d8bc5f	2270	Ormož
00050000-5612-486c-410d-4a4a13594446	1316	Ortnek
00050000-5612-486c-c87a-5913035e9f09	1337	Osilnica
00050000-5612-486c-dc1a-a632f097baa8	8222	Otočec
00050000-5612-486c-9a80-8148c9900e3a	2361	Ožbalt
00050000-5612-486c-990d-eaf18207e075	2231	Pernica
00050000-5612-486c-f7dc-0aa6555f3c1e	2211	Pesnica pri Mariboru
00050000-5612-486c-208e-3b17d8f364a8	9203	Petrovci
00050000-5612-486c-90b4-7cab2e9b976e	3301	Petrovče
00050000-5612-486c-a5fe-a703e455b405	6330	Piran/Pirano
00050000-5612-486c-97bf-579cf4461caa	8255	Pišece
00050000-5612-486c-399f-2ce21939b290	6257	Pivka
00050000-5612-486c-e44d-cd8e0e02675e	6232	Planina
00050000-5612-486c-4990-9a0776e9f787	3225	Planina pri Sevnici
00050000-5612-486c-e227-2ca23bff967e	6276	Pobegi
00050000-5612-486c-cdcf-2a23b7873c66	8312	Podbočje
00050000-5612-486c-b06f-fb6c315013ae	5243	Podbrdo
00050000-5612-486c-1831-5c8d29ba31f7	3254	Podčetrtek
00050000-5612-486c-267c-4a9ee7223f14	2273	Podgorci
00050000-5612-486c-f116-d64b2c8b217f	6216	Podgorje
00050000-5612-486c-9a64-c7b466ad480c	2381	Podgorje pri Slovenj Gradcu
00050000-5612-486c-1bf5-5c20a3c67413	6244	Podgrad
00050000-5612-486c-a287-3291c7a12029	1414	Podkum
00050000-5612-486c-4156-fb25a1e517c9	2286	Podlehnik
00050000-5612-486c-15ca-5dcc78055854	5272	Podnanos
00050000-5612-486c-0642-374cfb47de5e	4244	Podnart
00050000-5612-486c-147b-81a424a0c809	3241	Podplat
00050000-5612-486c-a5d4-45714183d763	3257	Podsreda
00050000-5612-486c-0785-d1d9d03bacba	2363	Podvelka
00050000-5612-486c-5469-5bcbe747eba4	2208	Pohorje
00050000-5612-486c-3989-cab83f1fc8c0	2257	Polenšak
00050000-5612-486c-e383-602b8eb4341d	1355	Polhov Gradec
00050000-5612-486c-d83b-100caf6de40b	4223	Poljane nad Škofjo Loko
00050000-5612-486c-7193-0bf73346f1b5	2319	Poljčane
00050000-5612-486c-5d4c-67d720ff0049	1272	Polšnik
00050000-5612-486c-8b89-28fd4e2dcc82	3313	Polzela
00050000-5612-486c-6782-fe72fbe7b42e	3232	Ponikva
00050000-5612-486c-0071-f434017f1302	6320	Portorož/Portorose
00050000-5612-486c-5e7a-d921f7762608	6230	Postojna
00050000-5612-486c-a9b8-584e5fa6e317	2331	Pragersko
00050000-5612-486c-9c12-7d9704d1a940	3312	Prebold
00050000-5612-486c-0ac5-0d96fdb85a94	4205	Preddvor
00050000-5612-486c-f4cf-b61c0c9f0dbc	6255	Prem
00050000-5612-486c-c5d2-d597d4e1a915	1352	Preserje
00050000-5612-486c-6335-779792844624	6258	Prestranek
00050000-5612-486c-433c-59935873e066	2391	Prevalje
00050000-5612-486c-b8f6-098751a21d11	3262	Prevorje
00050000-5612-486c-d8ac-da47776b2f65	1276	Primskovo 
00050000-5612-486c-aa32-1cbcacdc2e76	3253	Pristava pri Mestinju
00050000-5612-486c-306d-f22a5929f3cc	9207	Prosenjakovci/Partosfalva
00050000-5612-486c-3496-e828d6633dd3	5297	Prvačina
00050000-5612-486c-3728-eb96c06c627a	2250	Ptuj
00050000-5612-486c-e9d0-b8cd99c1a878	2323	Ptujska Gora
00050000-5612-486c-9de5-f1b6c06b1264	9201	Puconci
00050000-5612-486c-8fdf-7bccbe5837b2	2327	Rače
00050000-5612-486c-ec29-58753511be40	1433	Radeče
00050000-5612-486c-2cd9-bf4225439997	9252	Radenci
00050000-5612-486c-1426-a0673238d422	2360	Radlje ob Dravi
00050000-5612-486c-fd16-3d0d51d6b91a	1235	Radomlje
00050000-5612-486c-43bd-ca5a8643369a	4240	Radovljica
00050000-5612-486c-1ddc-87997efc900a	8274	Raka
00050000-5612-486c-43f7-138c133c3ef3	1381	Rakek
00050000-5612-486c-5414-935076e6236b	4283	Rateče - Planica
00050000-5612-486c-a65d-03d28e74a290	2390	Ravne na Koroškem
00050000-5612-486c-0162-5d8ed05f9e16	9246	Razkrižje
00050000-5612-486c-8718-d9ee7127d690	3332	Rečica ob Savinji
00050000-5612-486c-fa3f-fbbdbe7c8827	5292	Renče
00050000-5612-486c-c8d3-681ca7dfb521	1310	Ribnica
00050000-5612-486c-65db-891634e81068	2364	Ribnica na Pohorju
00050000-5612-486c-480a-e36c993c99b8	3272	Rimske Toplice
00050000-5612-486c-80ee-221f12807882	1314	Rob
00050000-5612-486c-c11d-0bc8756bfda8	5215	Ročinj
00050000-5612-486c-a98d-5b5339ab793a	3250	Rogaška Slatina
00050000-5612-486c-9fbd-2b593cbab19a	9262	Rogašovci
00050000-5612-486c-4e88-fbce6f503729	3252	Rogatec
00050000-5612-486c-5f6d-9b5811abe251	1373	Rovte
00050000-5612-486c-d3d9-c7dfe29fe53a	2342	Ruše
00050000-5612-486c-3d3d-4dcf9307c4c6	1282	Sava
00050000-5612-486c-c9a1-1e779cd0ef64	6333	Sečovlje/Sicciole
00050000-5612-486c-62ef-e093b7a1014c	4227	Selca
00050000-5612-486c-b4da-e26035ebd88b	2352	Selnica ob Dravi
00050000-5612-486c-8555-161ff6b190d3	8333	Semič
00050000-5612-486c-0cc1-1b4453634a14	8281	Senovo
00050000-5612-486c-515a-f435e0ed7f9f	6224	Senožeče
00050000-5612-486c-7ba3-903bcf4a209d	8290	Sevnica
00050000-5612-486c-b801-ed54c59b883c	6210	Sežana
00050000-5612-486c-8944-9c859d551414	2214	Sladki Vrh
00050000-5612-486c-14ab-15c1c09058c6	5283	Slap ob Idrijci
00050000-5612-486c-5728-4a896c04631b	2380	Slovenj Gradec
00050000-5612-486c-967d-7735d2faa1c3	2310	Slovenska Bistrica
00050000-5612-486c-0a21-dc86305a5097	3210	Slovenske Konjice
00050000-5612-486c-c43b-74529686e802	1216	Smlednik
00050000-5612-486c-41bd-f3c52f75a775	5232	Soča
00050000-5612-486c-43d7-cb475bacd649	1317	Sodražica
00050000-5612-486c-6ced-aeaced1d5d39	3335	Solčava
00050000-5612-486c-5cc1-efafbe65b505	5250	Solkan
00050000-5612-486c-a07c-f6259fd5b715	4229	Sorica
00050000-5612-486c-d11f-9a1916270a0b	4225	Sovodenj
00050000-5612-486c-11c6-f73e5d40d308	5281	Spodnja Idrija
00050000-5612-486c-3e40-fa5940dda6ce	2241	Spodnji Duplek
00050000-5612-486c-7be0-51e9de0c2f71	9245	Spodnji Ivanjci
00050000-5612-486c-f5b0-29949ad59ee6	2277	Središče ob Dravi
00050000-5612-486c-5070-60baa710b1c2	4267	Srednja vas v Bohinju
00050000-5612-486c-e6a9-5df5a37a38f6	8256	Sromlje 
00050000-5612-486c-5825-cf4611e45de3	5224	Srpenica
00050000-5612-486c-ba87-53e78a3c6a7c	1242	Stahovica
00050000-5612-486c-d183-66f87dcbc214	1332	Stara Cerkev
00050000-5612-486c-f30a-063f3dda268f	8342	Stari trg ob Kolpi
00050000-5612-486c-efa5-88560731b40e	1386	Stari trg pri Ložu
00050000-5612-486c-4ea3-df1737f9ba7c	2205	Starše
00050000-5612-486c-9947-eea7b62d900e	2289	Stoperce
00050000-5612-486c-e0f2-8d3455a800e1	8322	Stopiče
00050000-5612-486c-6b09-9a99f1625801	3206	Stranice
00050000-5612-486c-8668-cd7065845dce	8351	Straža
00050000-5612-486c-eafc-b69b3ac7fac6	1313	Struge
00050000-5612-486c-4010-41901a416311	8293	Studenec
00050000-5612-486c-a913-e1d511a88700	8331	Suhor
00050000-5612-486c-117a-23a8344f4ff6	2233	Sv. Ana v Slovenskih goricah
00050000-5612-486c-35bc-03ab29f87f67	2235	Sv. Trojica v Slovenskih goricah
00050000-5612-486c-1376-3a7f61f452c2	2353	Sveti Duh na Ostrem Vrhu
00050000-5612-486c-4f8a-5df4f62e6799	9244	Sveti Jurij ob Ščavnici
00050000-5612-486c-cc54-8d9457395ed0	3264	Sveti Štefan
00050000-5612-486c-fffd-f851e24a5a25	2258	Sveti Tomaž
00050000-5612-486c-b4d2-fe88eea75892	9204	Šalovci
00050000-5612-486c-5cba-4e049e1067ff	5261	Šempas
00050000-5612-486c-23d2-3dc481e62782	5290	Šempeter pri Gorici
00050000-5612-486c-8c41-593fc89850b4	3311	Šempeter v Savinjski dolini
00050000-5612-486c-9ce6-9b4c9217260e	4208	Šenčur
00050000-5612-486c-2d64-7953c7202bfc	2212	Šentilj v Slovenskih goricah
00050000-5612-486c-983a-1debea0623b8	8297	Šentjanž
00050000-5612-486c-dfcd-914a04e9e8a1	2373	Šentjanž pri Dravogradu
00050000-5612-486c-e8b5-693e8d38e505	8310	Šentjernej
00050000-5612-486c-0c2d-13936783fc74	3230	Šentjur
00050000-5612-486c-1601-e575233b2718	3271	Šentrupert
00050000-5612-486c-cfc7-2eba0f9e3be9	8232	Šentrupert
00050000-5612-486c-7b88-f5cb58c09b85	1296	Šentvid pri Stični
00050000-5612-486c-b868-34b17454faae	8275	Škocjan
00050000-5612-486c-8be1-878c312d50f2	6281	Škofije
00050000-5612-486c-adc5-af9a2e13cd86	4220	Škofja Loka
00050000-5612-486c-2b6f-f7a4ce35a444	3211	Škofja vas
00050000-5612-486c-efbd-e69389ad425c	1291	Škofljica
00050000-5612-486c-d3c5-4ca7ac070f5c	6274	Šmarje
00050000-5612-486c-bf25-dfb7f8176234	1293	Šmarje - Sap
00050000-5612-486c-37ba-8cdc74a9c993	3240	Šmarje pri Jelšah
00050000-5612-486c-819b-7ff109791e14	8220	Šmarješke Toplice
00050000-5612-486c-580d-e087ff3a49ad	2315	Šmartno na Pohorju
00050000-5612-486c-c439-0061643fc9d4	3341	Šmartno ob Dreti
00050000-5612-486c-27c2-5612f1cc0828	3327	Šmartno ob Paki
00050000-5612-486c-044f-23a082b256ed	1275	Šmartno pri Litiji
00050000-5612-486c-f3b7-31cab2e139c7	2383	Šmartno pri Slovenj Gradcu
00050000-5612-486c-9406-7d4fed7e369a	3201	Šmartno v Rožni dolini
00050000-5612-486c-7c59-66994d1d7686	3325	Šoštanj
00050000-5612-486c-0887-e7b4bb512994	6222	Štanjel
00050000-5612-486c-7a5e-efd39e6b4de4	3220	Štore
00050000-5612-486c-d855-919949635e1f	3304	Tabor
00050000-5612-486c-2814-7a5b286b0b90	3221	Teharje
00050000-5612-486c-61a9-9bd81903b122	9251	Tišina
00050000-5612-486c-88e2-d17fd9dc39db	5220	Tolmin
00050000-5612-486c-cf51-ac2bac16de69	3326	Topolšica
00050000-5612-486c-2f9e-fb61cf822965	2371	Trbonje
00050000-5612-486c-f2b5-e537dd5af7b5	1420	Trbovlje
00050000-5612-486c-9ddc-0279c3e342da	8231	Trebelno 
00050000-5612-486c-2a01-5174e9a4c337	8210	Trebnje
00050000-5612-486c-e643-c2e984044d1d	5252	Trnovo pri Gorici
00050000-5612-486c-d43f-0e0465633953	2254	Trnovska vas
00050000-5612-486c-3d83-3867a8cad0a2	1222	Trojane
00050000-5612-486c-d183-1d64feee2836	1236	Trzin
00050000-5612-486c-6366-1ad3ee350800	4290	Tržič
00050000-5612-486c-2c61-b9aa83f60934	8295	Tržišče
00050000-5612-486c-e524-449263eaced9	1311	Turjak
00050000-5612-486c-5e17-7acb60fd4581	9224	Turnišče
00050000-5612-486c-ba26-dc8f2da60e9f	8323	Uršna sela
00050000-5612-486c-28e7-ebb347ad2279	1252	Vače
00050000-5612-486c-b758-38c550be2d5e	3320	Velenje 
00050000-5612-486c-9709-dea7a8623e94	3322	Velenje - poštni predali
00050000-5612-486c-e36b-8037cb75dd45	8212	Velika Loka
00050000-5612-486c-2548-428e9f047b28	2274	Velika Nedelja
00050000-5612-486c-4bb6-d192bca1be3a	9225	Velika Polana
00050000-5612-486c-039b-6926437d318b	1315	Velike Lašče
00050000-5612-486c-aff5-d07163116d61	8213	Veliki Gaber
00050000-5612-486c-3383-a167d0ba6142	9241	Veržej
00050000-5612-486c-39d8-d29bc9318c43	1312	Videm - Dobrepolje
00050000-5612-486c-06aa-2031bdf90352	2284	Videm pri Ptuju
00050000-5612-486c-9168-22244bb2e8ed	8344	Vinica
00050000-5612-486c-664c-5bd6976199c7	5271	Vipava
00050000-5612-486c-bf40-d452518f7d37	4212	Visoko
00050000-5612-486c-7df3-5815121a68af	1294	Višnja Gora
00050000-5612-486c-4e38-b0a4bdc7d41b	3205	Vitanje
00050000-5612-486c-b696-3b3072c92771	2255	Vitomarci
00050000-5612-486c-e54a-3cd8f42e6ad0	1217	Vodice
00050000-5612-486c-ba83-edf8bd275e2f	3212	Vojnik\t
00050000-5612-486c-939d-63b340c1ba3c	5293	Volčja Draga
00050000-5612-486c-cf97-f3b8091c7863	2232	Voličina
00050000-5612-486c-5b84-d2d05d5686ee	3305	Vransko
00050000-5612-486c-1ec4-a90dc1122fcb	6217	Vremski Britof
00050000-5612-486c-7b51-1b89e2b2d025	1360	Vrhnika
00050000-5612-486c-05a3-291260169372	2365	Vuhred
00050000-5612-486c-5ce0-caeb7d67113d	2367	Vuzenica
00050000-5612-486c-ac57-70edbe42dc26	8292	Zabukovje 
00050000-5612-486c-0664-e17015a8d072	1410	Zagorje ob Savi
00050000-5612-486c-1beb-dc8a27b94e0c	1303	Zagradec
00050000-5612-486c-392c-ae46a134caeb	2283	Zavrč
00050000-5612-486c-5426-a10268b1966c	8272	Zdole 
00050000-5612-486c-f720-539a3bfae0fa	4201	Zgornja Besnica
00050000-5612-486c-d11c-797dbbf1af94	2242	Zgornja Korena
00050000-5612-486c-4222-a9774cf8f207	2201	Zgornja Kungota
00050000-5612-486c-2d0d-d21d8dce27e8	2316	Zgornja Ložnica
00050000-5612-486c-e4d2-2834cc2a43e3	2314	Zgornja Polskava
00050000-5612-486c-7208-5a17db10e44a	2213	Zgornja Velka
00050000-5612-486c-4f88-8547c0232deb	4247	Zgornje Gorje
00050000-5612-486c-e0c1-342d66db7402	4206	Zgornje Jezersko
00050000-5612-486c-bbae-d4ecd5efc104	2285	Zgornji Leskovec
00050000-5612-486c-edd5-66f91b33d074	1432	Zidani Most
00050000-5612-486c-40f3-7fd57dbae95b	3214	Zreče
00050000-5612-486c-9f0b-59de21e8d63f	4209	Žabnica
00050000-5612-486c-45b5-c31187abd484	3310	Žalec
00050000-5612-486c-eb83-274525f35069	4228	Železniki
00050000-5612-486c-902a-41ddccc5d2e9	2287	Žetale
00050000-5612-486c-2edf-eaf4138f7234	4226	Žiri
00050000-5612-486c-b702-9771712cf619	4274	Žirovnica
00050000-5612-486c-9e44-09b8c0ebc5a5	8360	Žužemberk
\.


--
-- TOC entry 3030 (class 0 OID 21255422)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 21255042)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 21254822)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5612-486e-6175-5ae0b435bf58	00080000-5612-486e-015d-8668e174a757	\N	00040000-5612-486c-bfe2-fb90bdde56e6	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5612-486e-ce09-34b720dd4474	00080000-5612-486e-015d-8668e174a757	\N	00040000-5612-486c-bfe2-fb90bdde56e6	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5612-486e-2796-ea0ddb40bf8b	00080000-5612-486e-e2e1-2368770faf48	\N	00040000-5612-486c-bfe2-fb90bdde56e6	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2992 (class 0 OID 21254926)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 21255054)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 21255436)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 21255446)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5612-486e-309e-45e8daae57cd	00080000-5612-486e-633a-7b8787a0db35	0987	AK
00190000-5612-486e-8b50-a8eaead6b432	00080000-5612-486e-e2e1-2368770faf48	0989	AK
00190000-5612-486e-01d0-a18d144e34f3	00080000-5612-486e-eac5-f9cc6d20c984	0986	AK
00190000-5612-486e-46ae-9aae51a8e6f1	00080000-5612-486e-db42-3a6256a8d24e	0984	AK
00190000-5612-486e-b256-745f6f538ca5	00080000-5612-486e-3425-a59728ed8abe	0983	AK
00190000-5612-486e-323c-a108e8c72a69	00080000-5612-486e-2306-4627e2a07a02	0982	AK
00190000-5612-4870-9311-68f7d5df6135	00080000-5612-4870-94f9-186f455d44ab	1001	AK
\.


--
-- TOC entry 3029 (class 0 OID 21255379)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5612-486f-223b-3437508ae976	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3033 (class 0 OID 21255454)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 21255083)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5612-486e-ffa6-36f78a9f433e	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5612-486e-2f04-7e71f330360c	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5612-486e-48c4-671af779f3b8	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5612-486e-c187-c82a1b986586	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5612-486e-f859-11ca8affebb9	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5612-486e-137a-544bb901f91b	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5612-486e-4084-791337c1597e	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3001 (class 0 OID 21255027)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 21255017)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 21255227)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 21255157)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 21254900)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2973 (class 0 OID 21254695)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5612-4870-94f9-186f455d44ab	00010000-5612-486d-fa33-a4208d6f618e	2015-10-05 11:52:48	INS	a:0:{}
2	App\\Entity\\Option	00000000-5612-4870-94a4-39dbb9c0df74	00010000-5612-486d-fa33-a4208d6f618e	2015-10-05 11:52:48	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5612-4870-9311-68f7d5df6135	00010000-5612-486d-fa33-a4208d6f618e	2015-10-05 11:52:48	INS	a:0:{}
\.


--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3010 (class 0 OID 21255096)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 21254733)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5612-486d-ee8a-e47fa1db9641	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5612-486d-68a6-781f91966a24	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5612-486d-aa09-fe82eb8fb54d	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5612-486d-5d0a-a96e62f93d11	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5612-486d-f82d-67efa88af758	planer	Planer dogodkov v koledarju	t
00020000-5612-486d-1007-3d365c25b778	kadrovska	Kadrovska služba	t
00020000-5612-486d-3a14-0df1ca8fd7c6	arhivar	Ažuriranje arhivalij	t
00020000-5612-486d-0c63-b2c742d6553e	igralec	Igralec	t
00020000-5612-486d-065f-b649bfef813f	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5612-486e-1ad2-98eee6cbadb1	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2975 (class 0 OID 21254717)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5612-486d-1cf4-1808be0bbf19	00020000-5612-486d-aa09-fe82eb8fb54d
00010000-5612-486d-fa33-a4208d6f618e	00020000-5612-486d-aa09-fe82eb8fb54d
00010000-5612-486e-b407-59c7bd2a4503	00020000-5612-486e-1ad2-98eee6cbadb1
\.


--
-- TOC entry 3012 (class 0 OID 21255110)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 21255048)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 21254994)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 21254682)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5612-486c-cfc6-8030a905230a	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5612-486c-77d1-74719278b534	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5612-486c-1434-0e6678bd9ba8	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5612-486c-4885-e76111b230e7	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5612-486c-0b9f-7cba78975bc0	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2970 (class 0 OID 21254674)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5612-486c-aace-eb9360eb63c3	00230000-5612-486c-4885-e76111b230e7	popa
00240000-5612-486c-d8a7-8e7ee6523394	00230000-5612-486c-4885-e76111b230e7	oseba
00240000-5612-486c-1c02-55f4be846c6f	00230000-5612-486c-4885-e76111b230e7	sezona
00240000-5612-486c-04bc-c7c8b4d278b4	00230000-5612-486c-77d1-74719278b534	prostor
00240000-5612-486c-f677-e427972a2ab1	00230000-5612-486c-4885-e76111b230e7	besedilo
00240000-5612-486c-7411-4f09f35dc6dc	00230000-5612-486c-4885-e76111b230e7	uprizoritev
00240000-5612-486c-6eaa-5c6dc004e401	00230000-5612-486c-4885-e76111b230e7	funkcija
00240000-5612-486c-cdb6-1b58a2ec394f	00230000-5612-486c-4885-e76111b230e7	tipfunkcije
00240000-5612-486c-bbda-7fb5ad814fc1	00230000-5612-486c-4885-e76111b230e7	alternacija
00240000-5612-486c-4212-5ab81913ec0d	00230000-5612-486c-cfc6-8030a905230a	pogodba
00240000-5612-486c-afae-bb4de62aecbf	00230000-5612-486c-4885-e76111b230e7	zaposlitev
00240000-5612-486c-8865-1666f6980998	00230000-5612-486c-4885-e76111b230e7	zvrstuprizoritve
00240000-5612-486c-b765-48b11829184d	00230000-5612-486c-cfc6-8030a905230a	programdela
00240000-5612-486c-f47b-7571f13ba939	00230000-5612-486c-4885-e76111b230e7	zapis
\.


--
-- TOC entry 2969 (class 0 OID 21254669)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
a5b56739-1d28-4ffe-8e52-e97a3a3c5683	00240000-5612-486c-aace-eb9360eb63c3	0	1001
\.


--
-- TOC entry 3018 (class 0 OID 21255174)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5612-486f-f0a4-97f233868960	000e0000-5612-486f-0a0e-05b0b73e6855	00080000-5612-486e-015d-8668e174a757	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5612-486c-cba3-ec490d3220e5
00270000-5612-486f-a4f5-ddeb0073f4e6	000e0000-5612-486f-0a0e-05b0b73e6855	00080000-5612-486e-015d-8668e174a757	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5612-486c-cba3-ec490d3220e5
\.


--
-- TOC entry 2982 (class 0 OID 21254795)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 21255004)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5612-486f-cd4c-bac28a65a06b	00180000-5612-486f-8091-40f2bed4d497	000c0000-5612-486f-d11b-a5c919348d8f	00090000-5612-486e-d42b-537a55942b02	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5612-486f-b0ad-2b407a36517b	00180000-5612-486f-8091-40f2bed4d497	000c0000-5612-486f-24e9-5f642bb1f15a	00090000-5612-486e-ad05-ed0df2c83b45	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5612-486f-df56-ff4b0b4a943f	00180000-5612-486f-8091-40f2bed4d497	000c0000-5612-486f-0517-a19109551d58	00090000-5612-486e-aeca-1b7ea56b95a6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5612-486f-8d0a-3024ca9becdf	00180000-5612-486f-8091-40f2bed4d497	000c0000-5612-486f-1f20-7f4cb7501391	00090000-5612-486e-036f-192228b8b586	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5612-486f-e509-d16856ab71c4	00180000-5612-486f-8091-40f2bed4d497	000c0000-5612-486f-314a-1150b70f73e9	00090000-5612-486e-6155-5ba6104cdf74	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5612-486f-8aa7-b2e39f42fe6b	00180000-5612-486f-0fe7-f00f95f96846	\N	00090000-5612-486e-6155-5ba6104cdf74	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3021 (class 0 OID 21255215)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5612-486c-73bc-a81e330afcf2	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5612-486c-65d1-f4a5213ee448	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5612-486c-2538-0de6a72d0af1	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5612-486c-656c-f65b7e551b03	04	Režija	Režija	Režija	umetnik	30
000f0000-5612-486c-4114-0973f9cb6b11	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5612-486c-eac1-4ca96d5700b3	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5612-486c-b28d-d503d1eaf3b0	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5612-486c-f8a0-16f3fe4cf96e	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5612-486c-4e0b-734a01f6d39d	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5612-486c-9b74-5b5ca7a56a00	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5612-486c-24cc-8556af0a57cb	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5612-486c-91cd-5dc579697c9f	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5612-486c-c29e-ee342cd8ef7c	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5612-486c-8849-20a9da4666ce	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5612-486c-6705-e6a67748ac9a	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5612-486c-d915-268d8dd9f318	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5612-486c-e3ae-f1910dd2cb89	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5612-486c-75a8-5603a6148cc9	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3034 (class 0 OID 21255465)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5612-486c-2a38-ac0ff0b9aa6c	01	Velika predstava	f	1.00	1.00
002b0000-5612-486c-c902-cf6607c4674b	02	Mala predstava	f	0.50	0.50
002b0000-5612-486c-16cc-47da456054a9	03	Mala koprodukcija	t	0.40	1.00
002b0000-5612-486c-43ec-e293d9eeb704	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5612-486c-28af-b53b4b2869e3	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2987 (class 0 OID 21254857)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 21254704)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5612-486d-fa33-a4208d6f618e	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRODeifj5QnlUopJkn1iF6/Jqdmin1JqbS	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5612-486e-c5d4-ed4929173684	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5612-486e-6aa6-bee84680349d	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5612-486e-6056-aca0980c179d	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5612-486e-cb04-8c87c58683a5	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5612-486e-4ff4-09e9c7d03cf8	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5612-486e-e992-7d098001e2e7	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5612-486e-bcf9-dd279f73fb79	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5612-486e-d46d-863e107eeea2	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5612-486e-2ff3-ccfbfee5337b	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5612-486e-b407-59c7bd2a4503	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5612-486d-1cf4-1808be0bbf19	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3025 (class 0 OID 21255265)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5612-486f-e433-428a0bf5fbad	00160000-5612-486e-153d-ea7c995ce252	\N	00140000-5612-486c-0b37-cbb096b71c28	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	\N	f	2				\N	f	\N	\N		\N	00220000-5612-486e-f859-11ca8affebb9
000e0000-5612-486f-0a0e-05b0b73e6855	00160000-5612-486e-878a-a0dbc2b384d9	\N	00140000-5612-486c-4345-b73793443910	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	\N	f	2				\N	f	\N	\N		\N	00220000-5612-486e-137a-544bb901f91b
000e0000-5612-486f-3c77-17f9534d09c3	\N	\N	00140000-5612-486c-4345-b73793443910	00190000-5612-486e-309e-45e8daae57cd	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5612-486e-f859-11ca8affebb9
000e0000-5612-486f-8ae8-8714d3c9f1b2	\N	\N	00140000-5612-486c-4345-b73793443910	00190000-5612-486e-309e-45e8daae57cd	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5612-486e-f859-11ca8affebb9
000e0000-5612-486f-37e5-a177afd5f720	\N	\N	00140000-5612-486c-4345-b73793443910	00190000-5612-486e-309e-45e8daae57cd	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5612-486e-ffa6-36f78a9f433e
000e0000-5612-486f-d412-e8cc964784de	\N	\N	00140000-5612-486c-4345-b73793443910	00190000-5612-486e-309e-45e8daae57cd	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5612-486e-ffa6-36f78a9f433e
\.


--
-- TOC entry 2994 (class 0 OID 21254948)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-5612-486f-ed24-a2446b290794	000e0000-5612-486f-0a0e-05b0b73e6855	\N	1	
00200000-5612-486f-0b10-0500850f9465	000e0000-5612-486f-0a0e-05b0b73e6855	\N	2	
00200000-5612-486f-4117-2a26160dd621	000e0000-5612-486f-0a0e-05b0b73e6855	\N	3	
00200000-5612-486f-4e9f-450b18552f1f	000e0000-5612-486f-0a0e-05b0b73e6855	\N	4	
00200000-5612-486f-3e7a-d4f3d11ba056	000e0000-5612-486f-0a0e-05b0b73e6855	\N	5	
\.


--
-- TOC entry 3008 (class 0 OID 21255075)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 21255188)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5612-486c-c6dd-45464c303515	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5612-486c-9fc2-08050197f317	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5612-486c-6f34-a99de33c9ff6	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5612-486c-076c-67d72b099bb3	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5612-486c-1559-3635e993a5ec	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5612-486c-5737-c71d2feacea7	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5612-486c-0b5c-7ba020c8784a	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5612-486c-0512-e4dd6a6b7243	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5612-486c-cba3-ec490d3220e5	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5612-486c-6003-6a801dfcd91f	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5612-486c-51b8-b6c79e8b4ce7	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5612-486c-59b1-b43407bcc09f	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5612-486c-274b-ae76bc352ec1	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5612-486c-88fb-9fe9ceea0d4b	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5612-486c-571f-0e188104a409	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5612-486c-eac3-66da9f781a80	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5612-486c-f0e1-ddc513db2aff	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5612-486c-6058-844668cd2348	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5612-486c-da37-d6874a7a3632	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5612-486c-4db6-fe014f10d9fd	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5612-486c-9544-e3cba3c9debd	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5612-486c-0012-3c2fc0efbfc2	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5612-486c-137d-8705f86ddc5f	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5612-486c-2273-4ff3ecfc7b50	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5612-486c-7bb6-8b1c3640c908	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5612-486c-5047-51cab0895f1f	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5612-486c-4fe4-df7ae1c02734	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5612-486c-7b9b-445743b005a4	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3037 (class 0 OID 21255512)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 21255484)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 21255524)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 21255147)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-5612-486e-4b3e-1e28f39acdd2	00090000-5612-486e-ad05-ed0df2c83b45	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-5612-486e-7d7c-fc8a3c16c66e	00090000-5612-486e-aeca-1b7ea56b95a6	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-5612-486e-c398-b2a8fdaaf980	00090000-5612-486e-1d58-1d78de51504d	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-5612-486e-e1ad-86ccef14e481	00090000-5612-486e-7b7c-dc2621673ba8	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-5612-486e-129f-13369672e982	00090000-5612-486e-d42b-537a55942b02	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-5612-486e-2f46-0c30c1177f7a	00090000-5612-486e-c40b-92bdd15b3330	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 2996 (class 0 OID 21254983)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 21255255)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5612-486c-0b37-cbb096b71c28	01	Drama	drama (SURS 01)
00140000-5612-486c-0e97-86c88742b45c	02	Opera	opera (SURS 02)
00140000-5612-486c-1a6e-77e6d233d906	03	Balet	balet (SURS 03)
00140000-5612-486c-a593-bf23e0e94cca	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5612-486c-a4a4-cafcfb304eaf	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5612-486c-4345-b73793443910	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5612-486c-b487-6aa8158a1325	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3014 (class 0 OID 21255137)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2501 (class 2606 OID 21254758)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 21255314)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 21255304)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 21255171)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 21255213)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 21255564)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 21254972)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 21254993)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 21255482)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 21254883)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 21255373)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 21255133)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 21254946)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 21254921)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 21254897)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 21255040)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 21255541)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 21255548)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2755 (class 2606 OID 21255572)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 21093462)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2613 (class 2606 OID 21255067)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 21254855)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 21254767)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 21254791)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 21254747)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2492 (class 2606 OID 21254732)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 21255073)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 21255109)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 21255250)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 21254819)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 21254843)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 21255434)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 21255046)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 21254833)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 21254934)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 21255058)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 21255443)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 21255451)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 21255421)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 21255463)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 21255091)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 21255031)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 21255022)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 21255237)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 21255164)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 21254909)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 21254703)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 21255100)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 21254721)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2494 (class 2606 OID 21254741)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 21255118)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 21255053)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 21255002)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 21254691)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 21254679)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 21254673)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 21255184)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 21254800)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 21255013)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 21255224)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 21255475)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 21254868)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 21254716)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 21255283)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 21254956)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 21255081)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 21255196)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 21255522)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 21255506)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 21255530)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 21255155)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 21254987)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 21255263)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 21255145)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 1259 OID 21254981)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2566 (class 1259 OID 21254982)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2567 (class 1259 OID 21254980)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2568 (class 1259 OID 21254979)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2569 (class 1259 OID 21254978)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2655 (class 1259 OID 21255185)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2656 (class 1259 OID 21255186)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2657 (class 1259 OID 21255187)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2741 (class 1259 OID 21255543)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2742 (class 1259 OID 21255542)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2515 (class 1259 OID 21254821)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2614 (class 1259 OID 21255074)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2728 (class 1259 OID 21255510)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2729 (class 1259 OID 21255509)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2730 (class 1259 OID 21255511)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2731 (class 1259 OID 21255508)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2732 (class 1259 OID 21255507)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2608 (class 1259 OID 21255060)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2609 (class 1259 OID 21255059)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2560 (class 1259 OID 21254957)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2638 (class 1259 OID 21255134)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2639 (class 1259 OID 21255136)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2640 (class 1259 OID 21255135)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2540 (class 1259 OID 21254899)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2541 (class 1259 OID 21254898)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2719 (class 1259 OID 21255464)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2671 (class 1259 OID 21255252)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2672 (class 1259 OID 21255253)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2673 (class 1259 OID 21255254)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2738 (class 1259 OID 21255531)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2680 (class 1259 OID 21255288)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2681 (class 1259 OID 21255285)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2682 (class 1259 OID 21255289)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2683 (class 1259 OID 21255287)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2684 (class 1259 OID 21255286)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2530 (class 1259 OID 21254870)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2531 (class 1259 OID 21254869)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2506 (class 1259 OID 21254794)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2626 (class 1259 OID 21255101)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2496 (class 1259 OID 21254748)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2497 (class 1259 OID 21254749)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2631 (class 1259 OID 21255121)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2632 (class 1259 OID 21255120)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2633 (class 1259 OID 21255119)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2553 (class 1259 OID 21254935)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2554 (class 1259 OID 21254936)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2476 (class 1259 OID 21254681)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2588 (class 1259 OID 21255026)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2589 (class 1259 OID 21255024)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2590 (class 1259 OID 21255023)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2591 (class 1259 OID 21255025)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2487 (class 1259 OID 21254722)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2488 (class 1259 OID 21254723)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2617 (class 1259 OID 21255082)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2751 (class 1259 OID 21255565)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2653 (class 1259 OID 21255173)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2654 (class 1259 OID 21255172)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2752 (class 1259 OID 21255573)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2753 (class 1259 OID 21255574)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2603 (class 1259 OID 21255047)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2647 (class 1259 OID 21255165)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2648 (class 1259 OID 21255166)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2701 (class 1259 OID 21255378)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2702 (class 1259 OID 21255377)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2703 (class 1259 OID 21255374)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2704 (class 1259 OID 21255375)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2705 (class 1259 OID 21255376)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2519 (class 1259 OID 21254835)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 21254834)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2521 (class 1259 OID 21254836)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2620 (class 1259 OID 21255095)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2621 (class 1259 OID 21255094)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2711 (class 1259 OID 21255444)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2712 (class 1259 OID 21255445)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2694 (class 1259 OID 21255318)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2695 (class 1259 OID 21255319)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2696 (class 1259 OID 21255316)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2697 (class 1259 OID 21255317)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2644 (class 1259 OID 21255156)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 21255035)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2595 (class 1259 OID 21255034)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2596 (class 1259 OID 21255032)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2597 (class 1259 OID 21255033)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2690 (class 1259 OID 21255306)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2691 (class 1259 OID 21255305)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2544 (class 1259 OID 21254910)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2547 (class 1259 OID 21254924)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2548 (class 1259 OID 21254923)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2549 (class 1259 OID 21254922)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2550 (class 1259 OID 21254925)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2559 (class 1259 OID 21254947)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2708 (class 1259 OID 21255435)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2727 (class 1259 OID 21255483)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2745 (class 1259 OID 21255549)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2746 (class 1259 OID 21255550)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2502 (class 1259 OID 21254769)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2503 (class 1259 OID 21254768)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2511 (class 1259 OID 21254801)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2512 (class 1259 OID 21254802)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2575 (class 1259 OID 21254988)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2583 (class 1259 OID 21255016)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2584 (class 1259 OID 21255015)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2585 (class 1259 OID 21255014)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2570 (class 1259 OID 21254974)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2571 (class 1259 OID 21254975)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2572 (class 1259 OID 21254973)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2573 (class 1259 OID 21254977)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2574 (class 1259 OID 21254976)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2518 (class 1259 OID 21254820)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2536 (class 1259 OID 21254884)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2537 (class 1259 OID 21254886)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2538 (class 1259 OID 21254885)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2539 (class 1259 OID 21254887)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2602 (class 1259 OID 21255041)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2676 (class 1259 OID 21255251)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2685 (class 1259 OID 21255284)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2667 (class 1259 OID 21255225)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2668 (class 1259 OID 21255226)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2509 (class 1259 OID 21254792)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2510 (class 1259 OID 21254793)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2641 (class 1259 OID 21255146)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 21254692)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2529 (class 1259 OID 21254856)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2479 (class 1259 OID 21254680)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2724 (class 1259 OID 21255476)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 21255093)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2625 (class 1259 OID 21255092)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2698 (class 1259 OID 21255315)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2526 (class 1259 OID 21254844)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2677 (class 1259 OID 21255264)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2735 (class 1259 OID 21255523)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2717 (class 1259 OID 21255452)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2718 (class 1259 OID 21255453)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2664 (class 1259 OID 21255214)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2582 (class 1259 OID 21255003)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2495 (class 1259 OID 21254742)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2786 (class 2606 OID 21255705)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2785 (class 2606 OID 21255710)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2781 (class 2606 OID 21255730)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2787 (class 2606 OID 21255700)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2783 (class 2606 OID 21255720)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2782 (class 2606 OID 21255725)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2784 (class 2606 OID 21255715)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2822 (class 2606 OID 21255895)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2821 (class 2606 OID 21255900)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2820 (class 2606 OID 21255905)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2854 (class 2606 OID 21256070)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2855 (class 2606 OID 21256065)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2767 (class 2606 OID 21255630)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2804 (class 2606 OID 21255815)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2849 (class 2606 OID 21256050)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2850 (class 2606 OID 21256045)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2848 (class 2606 OID 21256055)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2851 (class 2606 OID 21256040)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2852 (class 2606 OID 21256035)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2802 (class 2606 OID 21255810)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2803 (class 2606 OID 21255805)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2780 (class 2606 OID 21255695)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2814 (class 2606 OID 21255855)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2812 (class 2606 OID 21255865)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2813 (class 2606 OID 21255860)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2773 (class 2606 OID 21255665)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2774 (class 2606 OID 21255660)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2800 (class 2606 OID 21255795)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2846 (class 2606 OID 21256025)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2825 (class 2606 OID 21255910)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2824 (class 2606 OID 21255915)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2823 (class 2606 OID 21255920)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2853 (class 2606 OID 21256060)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2827 (class 2606 OID 21255940)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2830 (class 2606 OID 21255925)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2826 (class 2606 OID 21255945)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2828 (class 2606 OID 21255935)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2829 (class 2606 OID 21255930)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2771 (class 2606 OID 21255655)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2772 (class 2606 OID 21255650)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2763 (class 2606 OID 21255615)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2764 (class 2606 OID 21255610)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2808 (class 2606 OID 21255835)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2760 (class 2606 OID 21255590)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2759 (class 2606 OID 21255595)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2809 (class 2606 OID 21255850)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2810 (class 2606 OID 21255845)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2811 (class 2606 OID 21255840)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2778 (class 2606 OID 21255680)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2777 (class 2606 OID 21255685)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2756 (class 2606 OID 21255575)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2792 (class 2606 OID 21255770)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2794 (class 2606 OID 21255760)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2795 (class 2606 OID 21255755)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2793 (class 2606 OID 21255765)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2758 (class 2606 OID 21255580)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2757 (class 2606 OID 21255585)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2805 (class 2606 OID 21255820)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2858 (class 2606 OID 21256085)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2818 (class 2606 OID 21255890)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2819 (class 2606 OID 21255885)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2860 (class 2606 OID 21256090)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2859 (class 2606 OID 21256095)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2801 (class 2606 OID 21255800)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2817 (class 2606 OID 21255875)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2816 (class 2606 OID 21255880)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2837 (class 2606 OID 21256000)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2838 (class 2606 OID 21255995)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2841 (class 2606 OID 21255980)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2840 (class 2606 OID 21255985)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2839 (class 2606 OID 21255990)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2769 (class 2606 OID 21255640)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2770 (class 2606 OID 21255635)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2768 (class 2606 OID 21255645)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2806 (class 2606 OID 21255830)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2807 (class 2606 OID 21255825)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2844 (class 2606 OID 21256010)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2843 (class 2606 OID 21256015)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2834 (class 2606 OID 21255970)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2833 (class 2606 OID 21255975)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2836 (class 2606 OID 21255960)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2835 (class 2606 OID 21255965)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2815 (class 2606 OID 21255870)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2796 (class 2606 OID 21255790)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2797 (class 2606 OID 21255785)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2799 (class 2606 OID 21255775)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2798 (class 2606 OID 21255780)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2831 (class 2606 OID 21255955)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2832 (class 2606 OID 21255950)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2775 (class 2606 OID 21255670)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2776 (class 2606 OID 21255675)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2779 (class 2606 OID 21255690)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2842 (class 2606 OID 21256005)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2845 (class 2606 OID 21256020)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2847 (class 2606 OID 21256030)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2857 (class 2606 OID 21256075)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2856 (class 2606 OID 21256080)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2761 (class 2606 OID 21255605)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2762 (class 2606 OID 21255600)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2766 (class 2606 OID 21255620)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2765 (class 2606 OID 21255625)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2788 (class 2606 OID 21255735)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2789 (class 2606 OID 21255750)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2790 (class 2606 OID 21255745)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2791 (class 2606 OID 21255740)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-10-05 11:52:49 CEST

--
-- PostgreSQL database dump complete
--

