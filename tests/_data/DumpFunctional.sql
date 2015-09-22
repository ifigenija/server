--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-22 09:23:53 CEST

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
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 245
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 20354251)
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
-- TOC entry 229 (class 1259 OID 20354807)
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
-- TOC entry 228 (class 1259 OID 20354790)
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
-- TOC entry 219 (class 1259 OID 20354668)
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
-- TOC entry 222 (class 1259 OID 20354698)
-- Name: besedilo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE besedilo (
    id uuid NOT NULL,
    stevilka character varying(255) NOT NULL,
    naslov character varying(255) DEFAULT NULL::character varying,
    podnaslov character varying(255) DEFAULT NULL::character varying,
    jezik character varying(255) DEFAULT NULL::character varying,
    naslovizvirnika character varying(255) DEFAULT NULL::character varying,
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
-- TOC entry 243 (class 1259 OID 20355046)
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
-- TOC entry 197 (class 1259 OID 20354458)
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
-- TOC entry 199 (class 1259 OID 20354490)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 20354972)
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
-- TOC entry 190 (class 1259 OID 20354372)
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
-- TOC entry 230 (class 1259 OID 20354820)
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
-- TOC entry 215 (class 1259 OID 20354623)
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
-- TOC entry 195 (class 1259 OID 20354437)
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
-- TOC entry 193 (class 1259 OID 20354412)
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
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 191 (class 1259 OID 20354389)
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
-- TOC entry 204 (class 1259 OID 20354537)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 20355027)
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
-- TOC entry 242 (class 1259 OID 20355039)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 20355061)
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
-- TOC entry 208 (class 1259 OID 20354562)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 20354346)
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
-- TOC entry 182 (class 1259 OID 20354260)
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
-- TOC entry 183 (class 1259 OID 20354271)
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
-- TOC entry 178 (class 1259 OID 20354225)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 20354244)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 20354569)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 20354603)
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
-- TOC entry 225 (class 1259 OID 20354738)
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
    aktivna boolean,
    zaposlenvdrjz boolean,
    samozaposlen boolean,
    igralec boolean,
    opis text
);


--
-- TOC entry 185 (class 1259 OID 20354304)
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
-- TOC entry 187 (class 1259 OID 20354338)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 20354918)
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
-- TOC entry 205 (class 1259 OID 20354543)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 20354323)
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
-- TOC entry 194 (class 1259 OID 20354427)
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
-- TOC entry 207 (class 1259 OID 20354555)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 20354932)
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
-- TOC entry 234 (class 1259 OID 20354942)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 20354875)
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
-- TOC entry 235 (class 1259 OID 20354950)
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
-- TOC entry 211 (class 1259 OID 20354584)
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
-- TOC entry 203 (class 1259 OID 20354528)
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
-- TOC entry 202 (class 1259 OID 20354518)
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
-- TOC entry 224 (class 1259 OID 20354727)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 20354658)
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
-- TOC entry 192 (class 1259 OID 20354401)
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
-- TOC entry 175 (class 1259 OID 20354196)
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
-- TOC entry 174 (class 1259 OID 20354194)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 212 (class 1259 OID 20354597)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 20354234)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 20354218)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 20354611)
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
-- TOC entry 206 (class 1259 OID 20354549)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 20354495)
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
-- TOC entry 173 (class 1259 OID 20354183)
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
-- TOC entry 172 (class 1259 OID 20354175)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 20354170)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 20354675)
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
-- TOC entry 184 (class 1259 OID 20354296)
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
-- TOC entry 201 (class 1259 OID 20354505)
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
-- TOC entry 223 (class 1259 OID 20354715)
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
-- TOC entry 236 (class 1259 OID 20354960)
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
-- TOC entry 189 (class 1259 OID 20354358)
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
-- TOC entry 176 (class 1259 OID 20354205)
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
-- TOC entry 227 (class 1259 OID 20354765)
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
-- TOC entry 196 (class 1259 OID 20354448)
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
-- TOC entry 210 (class 1259 OID 20354576)
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
-- TOC entry 221 (class 1259 OID 20354689)
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
-- TOC entry 239 (class 1259 OID 20355007)
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
-- TOC entry 238 (class 1259 OID 20354979)
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
-- TOC entry 240 (class 1259 OID 20355019)
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
-- TOC entry 217 (class 1259 OID 20354648)
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
-- TOC entry 198 (class 1259 OID 20354484)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 20354755)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 20354638)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 20354199)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2973 (class 0 OID 20354251)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 20354807)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5601-0208-5eda-c8ba08ea7537	000d0000-5601-0208-b9a0-c3e09b477a01	\N	00090000-5601-0207-3245-1d9035cb4908	000b0000-5601-0207-fedb-d5fd8bc8dcd3	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5601-0208-6f8f-824468f8691b	000d0000-5601-0208-fc73-aa2d757ab3be	00100000-5601-0207-2c41-227001bf43c1	00090000-5601-0207-f1b5-b740bf7693b3	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5601-0208-a62a-9c754b45cc3b	000d0000-5601-0208-e87d-1afab51b1be9	00100000-5601-0207-c35f-da71c6802154	00090000-5601-0207-d536-71cba2960524	\N	0003	t	\N	2015-09-22	\N	2	t	\N	f	f
000c0000-5601-0208-c4a8-e9cf614986a9	000d0000-5601-0208-d0b3-aabf2a851767	\N	00090000-5601-0207-4870-81cd136e1f0f	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5601-0208-910d-ddf6c5f76f12	000d0000-5601-0208-cb34-7c1c1f6ce001	\N	00090000-5601-0207-1916-48ebf31912bd	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5601-0208-e98e-61c93085b2d5	000d0000-5601-0208-52d4-6b809bd3c72e	\N	00090000-5601-0207-2a40-49fad21b1da7	000b0000-5601-0207-4bb8-e53e131c9d42	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5601-0208-d336-f4b83fff3501	000d0000-5601-0208-808b-c81212f4b3e1	00100000-5601-0207-7208-136e8653a874	00090000-5601-0207-53c0-8ca5efc801f8	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5601-0208-9497-13c410272288	000d0000-5601-0208-91b6-44e95dce14c1	\N	00090000-5601-0207-a884-5303ff003132	000b0000-5601-0207-6681-fa9deaac67ec	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5601-0208-c5ef-58023cf35056	000d0000-5601-0208-808b-c81212f4b3e1	00100000-5601-0207-5038-294d62a797aa	00090000-5601-0207-d184-acd4231dfca1	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5601-0208-547c-342c65de52c8	000d0000-5601-0208-808b-c81212f4b3e1	00100000-5601-0207-1398-8f1e4e425593	00090000-5601-0207-dbdf-79670dd1c44d	\N	0010	t	\N	2015-09-22	\N	16	f	\N	f	t
000c0000-5601-0208-6b61-8bbbff40194c	000d0000-5601-0208-808b-c81212f4b3e1	00100000-5601-0207-5363-50a269c388a3	00090000-5601-0207-d6a6-ecb6fe1ffa62	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5601-0208-acab-e50bd00b49b2	000d0000-5601-0208-73d0-38346ce2aabd	\N	00090000-5601-0207-f1b5-b740bf7693b3	000b0000-5601-0207-d4a2-846a3d6633fa	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3020 (class 0 OID 20354790)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 20354668)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5601-0207-0272-17a7549c4ed0	00160000-5601-0207-68cc-76dd4db4e053	00090000-5601-0207-d58e-b696885112de	Avtor originala	10	t
003d0000-5601-0207-37f6-23ece0154cb5	00160000-5601-0207-68cc-76dd4db4e053	00090000-5601-0207-07b1-26c28a1ae067	Predelava	14	t
003d0000-5601-0207-7244-e0516732ec6d	00160000-5601-0207-185b-f8e2422e3e1d	00090000-5601-0207-9525-f1871bc59ed6	Avtor originala	11	t
003d0000-5601-0207-7611-369b5176cbfc	00160000-5601-0207-495c-8fbb116c3dcf	00090000-5601-0207-80a4-82d26a259cfc	Avtor originala	12	t
003d0000-5601-0207-65ff-d21f7ff15fda	00160000-5601-0207-68cc-76dd4db4e053	00090000-5601-0207-ca54-32d681b1ae0a	Predelava	18	f
\.


--
-- TOC entry 3014 (class 0 OID 20354698)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5601-0207-68cc-76dd4db4e053	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	\N
00160000-5601-0207-185b-f8e2422e3e1d	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	\N
00160000-5601-0207-495c-8fbb116c3dcf	0003	Smoletov Vrt		slovenščina		\N	2015-05-26	2	8		\N	\N	\N	\N
\.


--
-- TOC entry 3035 (class 0 OID 20355046)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 20354458)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5601-0208-abc2-e477e261c1ba	\N	\N	00200000-5601-0208-264a-e966a413e358	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5601-0208-c50d-6eb348aa9aa2	\N	\N	00200000-5601-0208-150b-99c79ea9b2af	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5601-0208-c994-9b17f3a2003d	\N	\N	00200000-5601-0208-6570-61baaf420ba8	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5601-0208-d399-8b694e8ac3c9	\N	\N	00200000-5601-0208-b590-fe2dcaeff940	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5601-0208-6468-771773a9d802	\N	\N	00200000-5601-0208-98b5-60fad2a95fa8	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2991 (class 0 OID 20354490)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 20354972)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 20354372)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5601-0206-0854-5c2a3a66bcf5	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5601-0206-6fba-613bfb1b31d0	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5601-0206-a35f-45eebedff470	AL	ALB	008	Albania 	Albanija	\N
00040000-5601-0206-fed4-9ec6e09ad259	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5601-0206-712a-e2e8952155d7	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5601-0206-dbd5-969692602352	AD	AND	020	Andorra 	Andora	\N
00040000-5601-0206-c7be-280114c314ad	AO	AGO	024	Angola 	Angola	\N
00040000-5601-0206-5c33-5573680fc416	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5601-0206-cc86-e8563079333f	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5601-0206-5084-a86cda7269db	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5601-0206-7f77-ff4a7bc28405	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5601-0206-c3a0-087d5349747b	AM	ARM	051	Armenia 	Armenija	\N
00040000-5601-0206-feff-03544e96a2f4	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5601-0206-c404-cce8e9cd6bca	AU	AUS	036	Australia 	Avstralija	\N
00040000-5601-0206-ad6b-16fe8e4d8ebd	AT	AUT	040	Austria 	Avstrija	\N
00040000-5601-0206-92ab-97af654bdd07	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5601-0206-e512-95d195eb8ff2	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5601-0206-7cba-c8419fe2d537	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5601-0206-3c6b-3b4107451f5b	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5601-0206-fe17-63d28a3da9e7	BB	BRB	052	Barbados 	Barbados	\N
00040000-5601-0206-1680-523a63f9378f	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5601-0206-6c0e-2cb05e18e7eb	BE	BEL	056	Belgium 	Belgija	\N
00040000-5601-0206-8cfa-c04519b32bc8	BZ	BLZ	084	Belize 	Belize	\N
00040000-5601-0206-700e-e6bb311c5769	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5601-0206-4fd3-870edccfe1b4	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5601-0206-75b2-13172615c56d	BT	BTN	064	Bhutan 	Butan	\N
00040000-5601-0206-43d4-c0be5d1c410c	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5601-0206-961c-f396f8ce51f8	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5601-0206-8c69-4c9e21224e4b	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5601-0206-3ba3-ae9acdb85597	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5601-0206-33c4-18f229a9fe52	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5601-0206-9e79-b93dbd3c9b63	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5601-0206-0c03-ff08aa3f9843	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5601-0206-a380-4bd325c50c65	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5601-0206-1acd-ae881f101136	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5601-0206-52b6-75565a8005b2	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5601-0206-f814-f993730d95f3	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5601-0206-65e9-ac83c0fec7dd	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5601-0206-bf72-c131c0668ee0	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5601-0206-b870-7a1cb8109d41	CA	CAN	124	Canada 	Kanada	\N
00040000-5601-0206-c2fb-d0359d4aded8	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5601-0206-507f-1020992affee	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5601-0206-e82c-212a97cd120f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5601-0206-db53-8b3bd0d30e7d	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5601-0206-2307-0713b432aa5d	CL	CHL	152	Chile 	Čile	\N
00040000-5601-0206-0653-78ffd060f9a5	CN	CHN	156	China 	Kitajska	\N
00040000-5601-0206-5d91-1ef06544e743	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5601-0206-9828-1ed92ede00c7	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5601-0206-a30d-18f66db15f3d	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5601-0206-34d6-617dd5336fbf	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5601-0206-44ed-45fb246653d9	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5601-0206-db7f-e08798a3a99a	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5601-0206-ad1b-d7b19e34d613	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5601-0206-9efe-1b3f1dba0dd8	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5601-0206-ee58-a8d644729c1c	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5601-0206-37b7-dd7876024111	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5601-0206-b29e-6f8bd54e8f4a	CU	CUB	192	Cuba 	Kuba	\N
00040000-5601-0206-e1a9-179dff794bfa	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5601-0206-5f77-e15d5c6d3a77	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5601-0206-38ad-45e8f4cf3481	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5601-0206-bad3-cb6328cf683a	DK	DNK	208	Denmark 	Danska	\N
00040000-5601-0206-0634-58e10efbb372	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5601-0206-5ce2-06d020a7d456	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5601-0206-bfc6-d7936d0f5dee	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5601-0206-66de-f65265ea7815	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5601-0206-0557-eb35023ba8c5	EG	EGY	818	Egypt 	Egipt	\N
00040000-5601-0206-65ca-366fffc9ff68	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5601-0206-652e-864b9677a4c3	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5601-0206-4e1c-0a26e2330199	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5601-0206-3bc3-4673647d8323	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5601-0206-53fa-4da970f82c6d	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5601-0206-f43b-d28f1bf5a7e0	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5601-0206-4839-c61b6d1286c7	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5601-0206-ec54-1f9e31fbaafe	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5601-0206-875d-f7085a536d9e	FI	FIN	246	Finland 	Finska	\N
00040000-5601-0206-f93b-1d4eb45e3069	FR	FRA	250	France 	Francija	\N
00040000-5601-0206-13f5-85ed4f616c0a	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5601-0206-33b0-075ccd03a137	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5601-0206-98af-214517296d26	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5601-0206-ad6e-31906727363e	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5601-0206-c099-4e0919a58ee0	GA	GAB	266	Gabon 	Gabon	\N
00040000-5601-0206-f2e3-d192ecd023d5	GM	GMB	270	Gambia 	Gambija	\N
00040000-5601-0206-c361-bf6def03f3c6	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5601-0206-63ed-b11e81163a00	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5601-0206-65d3-c3a3e8aadd7f	GH	GHA	288	Ghana 	Gana	\N
00040000-5601-0206-01ca-d6fcd36fb7e3	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5601-0206-b3fd-db9f1f5cefd7	GR	GRC	300	Greece 	Grčija	\N
00040000-5601-0206-228c-a09c42846998	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5601-0206-3c26-4b26a6beab56	GD	GRD	308	Grenada 	Grenada	\N
00040000-5601-0206-a665-4af681c39c42	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5601-0206-106d-fc7a1576c798	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5601-0206-e8c4-a8df673b52e0	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5601-0206-2498-60022e2622ef	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5601-0206-0115-aa360ae0495f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5601-0206-cd23-97c02470e511	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5601-0206-a571-f63f83bd4ebb	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5601-0206-da4c-f3a0549c7eb7	HT	HTI	332	Haiti 	Haiti	\N
00040000-5601-0206-a7e9-f3f03a09a272	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5601-0206-de2c-a10b2f5ee42b	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5601-0206-87d8-aa8b280ff4b4	HN	HND	340	Honduras 	Honduras	\N
00040000-5601-0206-d570-ed5fce92828b	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5601-0206-48e9-ac7dbafe4a87	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5601-0206-0c1c-28fb1f307292	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5601-0206-b37c-8da12b01177f	IN	IND	356	India 	Indija	\N
00040000-5601-0206-ff3b-ace508209176	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5601-0206-2c4f-ee454cb0c98d	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5601-0206-3212-075bfd4aa914	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5601-0206-901b-98f7bfbdc9fe	IE	IRL	372	Ireland 	Irska	\N
00040000-5601-0206-92f0-919b60fcb966	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5601-0206-4e50-5cb4e049bb9a	IL	ISR	376	Israel 	Izrael	\N
00040000-5601-0206-1b47-df6a48fcde34	IT	ITA	380	Italy 	Italija	\N
00040000-5601-0206-0ed9-e43065719274	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5601-0206-411d-002712504173	JP	JPN	392	Japan 	Japonska	\N
00040000-5601-0206-ab0f-22c0383d413d	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5601-0206-59ae-fa8ca54d45e6	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5601-0206-6c19-55e274743c07	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5601-0206-ec71-127406e04a30	KE	KEN	404	Kenya 	Kenija	\N
00040000-5601-0206-eb4f-26e3634f422e	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5601-0206-d4b4-0a2224c99deb	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5601-0206-bd88-a20573220549	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5601-0206-505a-1a3e810e4a0f	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5601-0206-f806-83e93a3c896d	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5601-0206-c630-71fd91e7dca0	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5601-0206-2946-58de38db04ec	LV	LVA	428	Latvia 	Latvija	\N
00040000-5601-0206-2826-4ab49da56b15	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5601-0206-426a-2c0e3c00af47	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5601-0206-ea8f-dffeb191e930	LR	LBR	430	Liberia 	Liberija	\N
00040000-5601-0206-5d0d-ed828b7ca810	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5601-0206-ff92-581361af763d	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5601-0206-3061-ca23c9b1fa1e	LT	LTU	440	Lithuania 	Litva	\N
00040000-5601-0206-6e8e-f66f7711ecf3	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5601-0206-da73-fbcf50cd4876	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5601-0206-1797-b4868564a3da	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5601-0206-1417-674c5c217097	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5601-0206-06ca-d87a244667a0	MW	MWI	454	Malawi 	Malavi	\N
00040000-5601-0206-7bce-aeb0b5587cfc	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5601-0206-9351-24e1addf7d0b	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5601-0206-55bb-5833b80f31e3	ML	MLI	466	Mali 	Mali	\N
00040000-5601-0206-3310-beecb3e37e75	MT	MLT	470	Malta 	Malta	\N
00040000-5601-0206-4d54-903c74a2f311	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5601-0206-53a4-95428f2a5583	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5601-0206-dd2e-7cb2bbd91ea9	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5601-0206-ef4c-8b093b7ade48	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5601-0206-7497-8ad060e7c545	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5601-0206-0028-132ac724ee18	MX	MEX	484	Mexico 	Mehika	\N
00040000-5601-0206-f470-5e2efc110c1b	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5601-0206-ca28-d389af976ada	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5601-0206-1bdd-a50a5b5434ed	MC	MCO	492	Monaco 	Monako	\N
00040000-5601-0206-d67d-320bd67dbc70	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5601-0206-a836-0af1dc3ff0c6	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5601-0206-1920-6e0827ddf6ce	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5601-0206-15c6-0c0cb69dafe0	MA	MAR	504	Morocco 	Maroko	\N
00040000-5601-0206-cff7-c13f32d5c80a	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5601-0206-5a85-2bb6f21d4300	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5601-0206-e918-97bef55aa833	NA	NAM	516	Namibia 	Namibija	\N
00040000-5601-0206-d624-06bf37bd52ed	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5601-0206-d0dc-21bc5eb1f055	NP	NPL	524	Nepal 	Nepal	\N
00040000-5601-0206-7bad-080c48d07be1	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5601-0206-9849-a7ba064f9143	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5601-0206-861b-05692eb57b93	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5601-0206-cb92-f303192f43e9	NE	NER	562	Niger 	Niger 	\N
00040000-5601-0206-1789-d07b37343b72	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5601-0206-b77c-c46386128e44	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5601-0206-8fdc-c82a6ae60762	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5601-0206-eac5-73cfe5c30806	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5601-0206-d3dd-b0c73e02e115	NO	NOR	578	Norway 	Norveška	\N
00040000-5601-0206-afed-89f7aa97e85a	OM	OMN	512	Oman 	Oman	\N
00040000-5601-0206-284d-97ad90207532	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5601-0206-47b6-a22b6fdbaee8	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5601-0206-fba1-e92585a795a3	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5601-0206-5dc9-6358fb391ac9	PA	PAN	591	Panama 	Panama	\N
00040000-5601-0206-1f9d-28be2d6d0709	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5601-0206-dc61-5615221bd24d	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5601-0206-e831-adceeb06bd85	PE	PER	604	Peru 	Peru	\N
00040000-5601-0206-18ce-54fbc80270b6	PH	PHL	608	Philippines 	Filipini	\N
00040000-5601-0206-ca08-593472f523c1	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5601-0206-327f-7ebc63e6c4f8	PL	POL	616	Poland 	Poljska	\N
00040000-5601-0206-0d08-3cfeedd36534	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5601-0206-ea1f-07425f83dfd7	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5601-0206-8fa9-66126f6d4a2f	QA	QAT	634	Qatar 	Katar	\N
00040000-5601-0206-f66d-c7dc70f6f257	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5601-0206-8cc3-801c8f438516	RO	ROU	642	Romania 	Romunija	\N
00040000-5601-0206-204a-397219c2e765	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5601-0206-ee5a-54769b73b924	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5601-0206-0b77-37d5e01b69a6	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5601-0206-f010-80eb247a8247	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5601-0206-6442-169470806ea5	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5601-0206-b80a-3b2c55dbfd97	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5601-0206-0003-6ac72d6394be	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5601-0206-f4ad-3c2e499aa24b	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5601-0206-e823-8e18836138c7	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5601-0206-fdab-c6d6d7d0f238	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5601-0206-b345-574c2ab0c903	SM	SMR	674	San Marino 	San Marino	\N
00040000-5601-0206-c14d-34fc9806bec4	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5601-0206-43db-1fc9baa25a22	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5601-0206-3184-f6e4c3861fe9	SN	SEN	686	Senegal 	Senegal	\N
00040000-5601-0206-5e08-5edaf0a3c637	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5601-0206-3cdb-03a2c71383ff	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5601-0206-e8e3-cd028bedaec7	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5601-0206-d43a-274f5eb2cbc9	SG	SGP	702	Singapore 	Singapur	\N
00040000-5601-0206-9737-00204b2019cb	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5601-0206-6ba6-b36f3210955d	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5601-0206-00da-dfdba0b580cc	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5601-0206-39b8-ec78e9b76876	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5601-0206-3ded-27b1725be9c7	SO	SOM	706	Somalia 	Somalija	\N
00040000-5601-0206-215b-be73cabcc8c7	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5601-0206-a970-e732c0d7b641	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5601-0206-7b66-998f8154a63d	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5601-0206-7947-684fe76494dc	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5601-0206-889e-2ccf6c2cd434	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5601-0206-4890-58068ce0785e	SD	SDN	729	Sudan 	Sudan	\N
00040000-5601-0206-f13d-3cdfb2cf94e8	SR	SUR	740	Suriname 	Surinam	\N
00040000-5601-0206-e0dc-902da0889438	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5601-0206-1e45-50a31b409a21	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5601-0206-504d-1f107efbc123	SE	SWE	752	Sweden 	Švedska	\N
00040000-5601-0206-9faf-6861cc0ec0c7	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5601-0206-6cec-72e9da20cdf9	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5601-0206-b839-0133ce346ab4	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5601-0206-c4c0-59782a841b29	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5601-0206-89fa-17b4fb54e7e9	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5601-0206-c748-d835c6f1f4a4	TH	THA	764	Thailand 	Tajska	\N
00040000-5601-0206-6e43-7c4ff22c6068	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5601-0206-ed72-976a0301f175	TG	TGO	768	Togo 	Togo	\N
00040000-5601-0206-0099-fb0ed5b320c7	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5601-0206-5c1e-8950b8914a9c	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5601-0206-1063-e5f650c56220	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5601-0206-19b1-16096d0c668c	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5601-0206-b374-becc79b5370e	TR	TUR	792	Turkey 	Turčija	\N
00040000-5601-0206-1d29-175ac6470b33	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5601-0206-d490-b8de64695c82	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5601-0206-5604-55d5551f85db	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5601-0206-6fcc-63ecf0a3a800	UG	UGA	800	Uganda 	Uganda	\N
00040000-5601-0206-f1c4-6d7f434c1b40	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5601-0206-5e74-1c39617d5c33	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5601-0206-34d4-14eaebf87279	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5601-0206-3023-f066c395c9c6	US	USA	840	United States 	Združene države Amerike	\N
00040000-5601-0206-327c-06f6d3d4ae91	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5601-0206-2c30-acf89aa13bc4	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5601-0206-c7d7-b458f2393507	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5601-0206-0e8b-862961a964ff	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5601-0206-1830-414a3c5e6daa	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5601-0206-6166-a451bdec56b4	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5601-0206-1ccf-62b23533d110	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5601-0206-1c22-e214ad4eacdf	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5601-0206-b0ed-a9a24a225655	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5601-0206-2cb8-3d89c67e107c	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5601-0206-8d74-2f9bc6d79cbf	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5601-0206-3906-19e46abb7523	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5601-0206-ce0b-906d16a6d7c1	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3022 (class 0 OID 20354820)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5601-0208-da64-b26ec73ada48	000e0000-5601-0207-3c94-be3942ef75c8	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5601-0206-c6bc-d7279239a9c7	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5601-0208-161f-a9ad8913a665	000e0000-5601-0207-4c99-f8d043f83b4c	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5601-0206-ce86-91aa3c07770d	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5601-0208-8354-8798d565c313	000e0000-5601-0207-efe0-46d0d2bef91f	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5601-0206-c6bc-d7279239a9c7	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5601-0208-8187-e8641c715faa	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5601-0208-3ab7-76876967f7ad	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3007 (class 0 OID 20354623)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5601-0208-b9a0-c3e09b477a01	000e0000-5601-0207-4c99-f8d043f83b4c	000c0000-5601-0208-5eda-c8ba08ea7537	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5601-0206-a12d-e547398cb99b
000d0000-5601-0208-fc73-aa2d757ab3be	000e0000-5601-0207-4c99-f8d043f83b4c	000c0000-5601-0208-6f8f-824468f8691b	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5601-0206-b03a-dd5ba732e6b8
000d0000-5601-0208-e87d-1afab51b1be9	000e0000-5601-0207-4c99-f8d043f83b4c	000c0000-5601-0208-a62a-9c754b45cc3b	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5601-0206-7def-d774cd8a9e0a
000d0000-5601-0208-d0b3-aabf2a851767	000e0000-5601-0207-4c99-f8d043f83b4c	000c0000-5601-0208-c4a8-e9cf614986a9	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5601-0206-fe74-8e51a5ec6233
000d0000-5601-0208-cb34-7c1c1f6ce001	000e0000-5601-0207-4c99-f8d043f83b4c	000c0000-5601-0208-910d-ddf6c5f76f12	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5601-0206-fe74-8e51a5ec6233
000d0000-5601-0208-52d4-6b809bd3c72e	000e0000-5601-0207-4c99-f8d043f83b4c	000c0000-5601-0208-e98e-61c93085b2d5	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5601-0206-a12d-e547398cb99b
000d0000-5601-0208-808b-c81212f4b3e1	000e0000-5601-0207-4c99-f8d043f83b4c	000c0000-5601-0208-c5ef-58023cf35056	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5601-0206-a12d-e547398cb99b
000d0000-5601-0208-91b6-44e95dce14c1	000e0000-5601-0207-4c99-f8d043f83b4c	000c0000-5601-0208-9497-13c410272288	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5601-0206-93cc-fe4fd7f02f84
000d0000-5601-0208-73d0-38346ce2aabd	000e0000-5601-0207-4c99-f8d043f83b4c	000c0000-5601-0208-acab-e50bd00b49b2	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5601-0206-d76d-855086cfa1cd
\.


--
-- TOC entry 2987 (class 0 OID 20354437)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 20354412)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 20354389)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5601-0207-3ab3-687d725afda9	00080000-5601-0207-f3ba-cee149a79085	00090000-5601-0207-dbdf-79670dd1c44d	AK		igralka
\.


--
-- TOC entry 2996 (class 0 OID 20354537)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 20355027)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 20355039)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 20355061)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 19946838)
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
-- TOC entry 3000 (class 0 OID 20354562)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 20354346)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5601-0206-d469-2aedac99c913	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5601-0206-ff4e-c8ceab2ea802	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5601-0206-4cc1-569b61805a47	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5601-0206-2e4d-32b5283b2c70	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5601-0206-4338-b061085e3a9f	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5601-0206-8ab7-97898180a49a	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5601-0206-486e-f66f21623305	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5601-0206-139b-47aaf800c9f5	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5601-0206-590e-e3ce53496efc	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5601-0206-897e-53cf7efb8731	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5601-0206-436b-36d5375a06fa	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5601-0206-24b2-9a2e014bebb3	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5601-0206-295a-e09fd397256a	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5601-0206-ec7c-25e073938be7	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5601-0207-e044-cfb2ac37e9f9	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5601-0207-24e4-3dea02458ab6	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5601-0207-ebb9-9d347ce3c550	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5601-0207-9de3-79a471ebd85b	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5601-0207-5e27-a11871a0ab82	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5601-0208-5c9e-dfc21de80e38	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2974 (class 0 OID 20354260)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5601-0207-c180-9c0a46caf483	00000000-5601-0207-e044-cfb2ac37e9f9	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5601-0207-6bd6-f1151e598533	00000000-5601-0207-e044-cfb2ac37e9f9	00010000-5601-0206-6ca7-d1df800dae41	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5601-0207-cd86-e1607ae219ad	00000000-5601-0207-24e4-3dea02458ab6	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2975 (class 0 OID 20354271)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5601-0207-3245-1d9035cb4908	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5601-0207-4870-81cd136e1f0f	00010000-5601-0207-f201-5948376b712d	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5601-0207-d536-71cba2960524	00010000-5601-0207-3afb-167511e4e982	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5601-0207-d184-acd4231dfca1	00010000-5601-0207-b1b3-f9aa8e75f2b6	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5601-0207-f447-5cfec4aaece6	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5601-0207-2a40-49fad21b1da7	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5601-0207-d6a6-ecb6fe1ffa62	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5601-0207-53c0-8ca5efc801f8	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5601-0207-dbdf-79670dd1c44d	00010000-5601-0207-7b89-2ef840e5c30f	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5601-0207-f1b5-b740bf7693b3	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5601-0207-fb24-f5ade30f3d88	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5601-0207-1916-48ebf31912bd	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5601-0207-a884-5303ff003132	00010000-5601-0207-b8fa-ccc360179eb6	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5601-0207-d58e-b696885112de	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5601-0207-07b1-26c28a1ae067	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5601-0207-9525-f1871bc59ed6	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5601-0207-80a4-82d26a259cfc	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5601-0207-ca54-32d681b1ae0a	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2970 (class 0 OID 20354225)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5601-0206-362a-6304eaedbd0f	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5601-0206-63c2-d877aff09a21	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5601-0206-cfa0-60856bfdfa8a	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5601-0206-b577-746ad74a3ce5	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5601-0206-a60a-4653c48f3a6a	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5601-0206-5f69-4a78729a9ec4	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5601-0206-d625-52842ff74bcc	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5601-0206-d8cd-8a34a01d0422	Abonma-read	Abonma - branje	f
00030000-5601-0206-6ee8-52aca9b7c511	Abonma-write	Abonma - spreminjanje	f
00030000-5601-0206-4415-a9132f6f47ba	Alternacija-read	Alternacija - branje	f
00030000-5601-0206-3cfa-2cf0c5b05f32	Alternacija-write	Alternacija - spreminjanje	f
00030000-5601-0206-ffe8-fcafd5f5a764	Arhivalija-read	Arhivalija - branje	f
00030000-5601-0206-0807-17f39fe00213	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5601-0206-baf4-ab146a53a440	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5601-0206-b5c2-2f9742119139	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5601-0206-7f40-e316fccbdb0f	Besedilo-read	Besedilo - branje	f
00030000-5601-0206-bab4-e3a740d2d870	Besedilo-write	Besedilo - spreminjanje	f
00030000-5601-0206-ead0-d2cb5bc6bb1b	DogodekIzven-read	DogodekIzven - branje	f
00030000-5601-0206-4bc9-2140a0b90114	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5601-0206-5870-d716ef62c2db	Dogodek-read	Dogodek - branje	f
00030000-5601-0206-eb9f-ffaf2f48434f	Dogodek-write	Dogodek - spreminjanje	f
00030000-5601-0206-f852-e3995e06a1c9	DrugiVir-read	DrugiVir - branje	f
00030000-5601-0206-3341-cd2f8455eea6	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5601-0206-a363-4c836d455b95	Drzava-read	Drzava - branje	f
00030000-5601-0206-48d2-f6717e3a36e9	Drzava-write	Drzava - spreminjanje	f
00030000-5601-0206-b1e8-5e770503dc88	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5601-0206-f839-0c0c99c0cb06	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5601-0206-85ac-99496f209081	Funkcija-read	Funkcija - branje	f
00030000-5601-0206-7124-056d489512e0	Funkcija-write	Funkcija - spreminjanje	f
00030000-5601-0206-cb5a-f8adf08e056a	Gostovanje-read	Gostovanje - branje	f
00030000-5601-0206-cec4-7297488312ee	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5601-0206-b43c-747eb08ecf1e	Gostujoca-read	Gostujoca - branje	f
00030000-5601-0206-ebb3-69930130b084	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5601-0206-d059-6297f095fb39	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5601-0206-42d1-7b964d0ea6fe	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5601-0206-de72-274b2d59261e	Kupec-read	Kupec - branje	f
00030000-5601-0206-f9cb-64664f3fdcd7	Kupec-write	Kupec - spreminjanje	f
00030000-5601-0206-d918-f78435c8f2cc	NacinPlacina-read	NacinPlacina - branje	f
00030000-5601-0206-0523-ca602b381d2a	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5601-0206-8b2e-d161ea79f2ee	Option-read	Option - branje	f
00030000-5601-0206-bd7f-90df7b2bb6e6	Option-write	Option - spreminjanje	f
00030000-5601-0206-afad-8ce6e986f7e1	OptionValue-read	OptionValue - branje	f
00030000-5601-0206-6a4c-7753666b5220	OptionValue-write	OptionValue - spreminjanje	f
00030000-5601-0206-3933-1aeee86bc244	Oseba-read	Oseba - branje	f
00030000-5601-0206-38e9-afddda35c54e	Oseba-write	Oseba - spreminjanje	f
00030000-5601-0206-796c-1b88283d0234	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5601-0206-5c4b-91ae03d17a88	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5601-0206-9391-9658cd471a18	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5601-0206-ffa8-b9a71169c7e0	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5601-0206-f976-1b4739e5f3ad	Pogodba-read	Pogodba - branje	f
00030000-5601-0206-1f97-8bed9d0fa386	Pogodba-write	Pogodba - spreminjanje	f
00030000-5601-0206-a97b-0a372785dc6d	Popa-read	Popa - branje	f
00030000-5601-0206-2da9-bb30f4a18d82	Popa-write	Popa - spreminjanje	f
00030000-5601-0206-8d61-4d526822f089	Posta-read	Posta - branje	f
00030000-5601-0206-1c3c-9fcd130aa4af	Posta-write	Posta - spreminjanje	f
00030000-5601-0206-3745-b50d38e7344e	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5601-0206-497f-963fb2ccbc3b	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5601-0206-0965-4b8f318addb1	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5601-0206-9ba5-14c088776b5c	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5601-0206-57ef-e3663830180a	PostniNaslov-read	PostniNaslov - branje	f
00030000-5601-0206-c93b-7b3b62a4c56c	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5601-0206-6c33-31cff4c5f721	Predstava-read	Predstava - branje	f
00030000-5601-0206-5d4c-45065a102502	Predstava-write	Predstava - spreminjanje	f
00030000-5601-0206-ef5d-f91cb8759200	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5601-0206-4364-2bf18bbf4631	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5601-0206-54f6-7ec14f81086d	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5601-0206-f657-833f738e3049	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5601-0206-3c51-73b95d7e934b	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5601-0206-ae8f-f840c0279da7	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5601-0206-bd3b-63f640a32b00	ProgramDela-read	ProgramDela - branje	f
00030000-5601-0206-14dd-b6e264014b8b	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5601-0206-88c0-7be2fc457670	ProgramFestival-read	ProgramFestival - branje	f
00030000-5601-0206-82d2-065474246b41	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5601-0206-59c2-106793b06bee	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5601-0206-532b-8bc5c73828c8	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5601-0206-2a6c-c1ada3d2ae79	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5601-0206-e486-c6a0bfe5243c	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5601-0206-bab1-dd469bb25f28	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5601-0206-ff47-b7d90870409d	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5601-0206-93af-660f3de35789	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5601-0206-a071-4a40e2c66655	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5601-0206-80e6-885f35e0779c	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5601-0206-5560-cc64e27dcab8	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5601-0206-348f-86a0e87a8e9f	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5601-0206-9e54-f5fac5f66a98	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5601-0206-ce6c-c6402242dd63	ProgramRazno-read	ProgramRazno - branje	f
00030000-5601-0206-4e03-26efc9373458	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5601-0206-5b5f-eb828d9ec9e8	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5601-0206-a5eb-2f1fbaaa5ef1	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5601-0206-28b5-587596a1b31e	Prostor-read	Prostor - branje	f
00030000-5601-0206-aa03-c85abc42f536	Prostor-write	Prostor - spreminjanje	f
00030000-5601-0206-79a2-6939a26b6457	Racun-read	Racun - branje	f
00030000-5601-0206-08bb-5fbbd9ad1b8c	Racun-write	Racun - spreminjanje	f
00030000-5601-0206-d132-34fa6a43340a	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5601-0206-0469-cf1ac5922320	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5601-0206-4ae9-e0f504e18043	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5601-0206-d2e4-bc2904b88aff	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5601-0206-fcbc-51c52dc2cf02	Rekvizit-read	Rekvizit - branje	f
00030000-5601-0206-0b7e-a509456cd647	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5601-0206-d539-41686a867e86	Revizija-read	Revizija - branje	f
00030000-5601-0206-125e-b8838885079c	Revizija-write	Revizija - spreminjanje	f
00030000-5601-0206-3553-7f66d79fc75e	Rezervacija-read	Rezervacija - branje	f
00030000-5601-0206-6572-32127f2da1fc	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5601-0206-3daf-99a35d61b4d4	SedezniRed-read	SedezniRed - branje	f
00030000-5601-0206-2411-1111b8afdfcc	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5601-0206-6af0-4c6bc0db5e73	Sedez-read	Sedez - branje	f
00030000-5601-0206-9f6b-3503aa6a52ec	Sedez-write	Sedez - spreminjanje	f
00030000-5601-0206-709f-65d052e0dd3b	Sezona-read	Sezona - branje	f
00030000-5601-0206-d3b9-1974026c8f5c	Sezona-write	Sezona - spreminjanje	f
00030000-5601-0206-0b42-bd964d80d76b	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5601-0206-12db-d69b433c7815	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5601-0206-d406-0c65263e4a07	Stevilcenje-read	Stevilcenje - branje	f
00030000-5601-0206-5f4a-ffa017739863	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5601-0206-f8c6-d5a8908ac763	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5601-0206-47d5-b2b0223c87ab	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5601-0206-1415-6ebe247a95da	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5601-0206-3bad-31e90974cf64	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5601-0206-c561-ef93263aa2dc	Telefonska-read	Telefonska - branje	f
00030000-5601-0206-d7d8-cda035d199fb	Telefonska-write	Telefonska - spreminjanje	f
00030000-5601-0206-3f81-0b9a3c0a8726	TerminStoritve-read	TerminStoritve - branje	f
00030000-5601-0206-5f3d-9227924c9e8f	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5601-0206-e698-8a4b7b5957cd	TipFunkcije-read	TipFunkcije - branje	f
00030000-5601-0206-8c01-d381e0677f52	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5601-0206-bdc8-994ba044a39a	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5601-0206-78e4-a97f058d4704	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5601-0206-57c0-ae58958bbc7e	Trr-read	Trr - branje	f
00030000-5601-0206-8db1-589e9e1b7a4d	Trr-write	Trr - spreminjanje	f
00030000-5601-0206-01ac-e0a98936cfff	Uprizoritev-read	Uprizoritev - branje	f
00030000-5601-0206-ff5e-34c01f76781b	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5601-0206-57db-86f1be3cd19a	Vaja-read	Vaja - branje	f
00030000-5601-0206-3cab-075ee4b11aa0	Vaja-write	Vaja - spreminjanje	f
00030000-5601-0206-fa14-3117ee212356	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5601-0206-916c-05c2ba3c1cbe	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5601-0206-ed51-322e2cfbab9d	VrstaStroska-read	VrstaStroska - branje	f
00030000-5601-0206-eccb-61a8b341a5a5	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5601-0206-0163-c182085a893b	Zaposlitev-read	Zaposlitev - branje	f
00030000-5601-0206-cda6-a446c0308b2d	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5601-0206-702a-664274984f39	Zasedenost-read	Zasedenost - branje	f
00030000-5601-0206-a4ae-de35f55ea8ca	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5601-0206-e72b-bac68c44c777	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5601-0206-dd96-348c9e1d59cf	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5601-0206-776c-3b1b36ce6542	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5601-0206-5398-93dc51449d0a	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5601-0206-3fc1-7e445c6c867a	Job-read	Branje opravil - samo zase - branje	f
00030000-5601-0206-549d-69bb5ca77b38	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5601-0206-67df-c344a878dcd5	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5601-0206-2d0d-1e58bdd6ad34	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5601-0206-e83c-3cd87de1b6dc	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5601-0206-3e35-4b438989f8fa	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5601-0206-9d4f-50a3168d397a	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5601-0206-1d94-99703c6ae15b	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5601-0206-2311-c8976add96b2	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5601-0206-8433-6390d81d7f4c	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5601-0206-72fa-3a7e6ff3f0da	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5601-0206-1805-8cbbefd50a06	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5601-0206-9d58-ce58b7d3534f	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5601-0206-dfdb-3ff712f410be	Datoteka-write	Datoteka - spreminjanje	f
00030000-5601-0206-eb1b-7c77168f8dde	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2972 (class 0 OID 20354244)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5601-0206-bcd4-490900b27342	00030000-5601-0206-63c2-d877aff09a21
00020000-5601-0206-5944-6a3e47825345	00030000-5601-0206-a363-4c836d455b95
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-d8cd-8a34a01d0422
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-6ee8-52aca9b7c511
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-4415-a9132f6f47ba
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-3cfa-2cf0c5b05f32
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-ffe8-fcafd5f5a764
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-5870-d716ef62c2db
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-b577-746ad74a3ce5
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-eb9f-ffaf2f48434f
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-a363-4c836d455b95
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-48d2-f6717e3a36e9
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-85ac-99496f209081
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-7124-056d489512e0
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-cb5a-f8adf08e056a
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-cec4-7297488312ee
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-b43c-747eb08ecf1e
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-ebb3-69930130b084
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-d059-6297f095fb39
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-42d1-7b964d0ea6fe
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-8b2e-d161ea79f2ee
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-afad-8ce6e986f7e1
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-3933-1aeee86bc244
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-38e9-afddda35c54e
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-a97b-0a372785dc6d
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-2da9-bb30f4a18d82
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-8d61-4d526822f089
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-1c3c-9fcd130aa4af
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-57ef-e3663830180a
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-c93b-7b3b62a4c56c
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-6c33-31cff4c5f721
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-5d4c-45065a102502
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-3c51-73b95d7e934b
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-ae8f-f840c0279da7
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-28b5-587596a1b31e
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-aa03-c85abc42f536
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-4ae9-e0f504e18043
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-d2e4-bc2904b88aff
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-fcbc-51c52dc2cf02
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-0b7e-a509456cd647
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-709f-65d052e0dd3b
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-d3b9-1974026c8f5c
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-e698-8a4b7b5957cd
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-01ac-e0a98936cfff
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-ff5e-34c01f76781b
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-57db-86f1be3cd19a
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-3cab-075ee4b11aa0
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-702a-664274984f39
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-a4ae-de35f55ea8ca
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-e72b-bac68c44c777
00020000-5601-0206-50bf-873507f8c7b2	00030000-5601-0206-776c-3b1b36ce6542
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-d8cd-8a34a01d0422
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-ffe8-fcafd5f5a764
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-5870-d716ef62c2db
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-a363-4c836d455b95
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-cb5a-f8adf08e056a
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-b43c-747eb08ecf1e
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-d059-6297f095fb39
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-42d1-7b964d0ea6fe
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-8b2e-d161ea79f2ee
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-afad-8ce6e986f7e1
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-3933-1aeee86bc244
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-38e9-afddda35c54e
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-a97b-0a372785dc6d
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-8d61-4d526822f089
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-57ef-e3663830180a
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-c93b-7b3b62a4c56c
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-6c33-31cff4c5f721
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-28b5-587596a1b31e
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-4ae9-e0f504e18043
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-fcbc-51c52dc2cf02
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-709f-65d052e0dd3b
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-c561-ef93263aa2dc
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-d7d8-cda035d199fb
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-57c0-ae58958bbc7e
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-8db1-589e9e1b7a4d
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-0163-c182085a893b
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-cda6-a446c0308b2d
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-e72b-bac68c44c777
00020000-5601-0206-fbe1-4c4d89cc7fdb	00030000-5601-0206-776c-3b1b36ce6542
00020000-5601-0206-040b-490d1720ab24	00030000-5601-0206-d8cd-8a34a01d0422
00020000-5601-0206-040b-490d1720ab24	00030000-5601-0206-4415-a9132f6f47ba
00020000-5601-0206-040b-490d1720ab24	00030000-5601-0206-ffe8-fcafd5f5a764
00020000-5601-0206-040b-490d1720ab24	00030000-5601-0206-0807-17f39fe00213
00020000-5601-0206-040b-490d1720ab24	00030000-5601-0206-7f40-e316fccbdb0f
00020000-5601-0206-040b-490d1720ab24	00030000-5601-0206-ead0-d2cb5bc6bb1b
00020000-5601-0206-040b-490d1720ab24	00030000-5601-0206-5870-d716ef62c2db
00020000-5601-0206-040b-490d1720ab24	00030000-5601-0206-a363-4c836d455b95
00020000-5601-0206-040b-490d1720ab24	00030000-5601-0206-85ac-99496f209081
00020000-5601-0206-040b-490d1720ab24	00030000-5601-0206-cb5a-f8adf08e056a
00020000-5601-0206-040b-490d1720ab24	00030000-5601-0206-b43c-747eb08ecf1e
00020000-5601-0206-040b-490d1720ab24	00030000-5601-0206-d059-6297f095fb39
00020000-5601-0206-040b-490d1720ab24	00030000-5601-0206-8b2e-d161ea79f2ee
00020000-5601-0206-040b-490d1720ab24	00030000-5601-0206-afad-8ce6e986f7e1
00020000-5601-0206-040b-490d1720ab24	00030000-5601-0206-3933-1aeee86bc244
00020000-5601-0206-040b-490d1720ab24	00030000-5601-0206-a97b-0a372785dc6d
00020000-5601-0206-040b-490d1720ab24	00030000-5601-0206-8d61-4d526822f089
00020000-5601-0206-040b-490d1720ab24	00030000-5601-0206-6c33-31cff4c5f721
00020000-5601-0206-040b-490d1720ab24	00030000-5601-0206-3c51-73b95d7e934b
00020000-5601-0206-040b-490d1720ab24	00030000-5601-0206-28b5-587596a1b31e
00020000-5601-0206-040b-490d1720ab24	00030000-5601-0206-4ae9-e0f504e18043
00020000-5601-0206-040b-490d1720ab24	00030000-5601-0206-fcbc-51c52dc2cf02
00020000-5601-0206-040b-490d1720ab24	00030000-5601-0206-709f-65d052e0dd3b
00020000-5601-0206-040b-490d1720ab24	00030000-5601-0206-e698-8a4b7b5957cd
00020000-5601-0206-040b-490d1720ab24	00030000-5601-0206-57db-86f1be3cd19a
00020000-5601-0206-040b-490d1720ab24	00030000-5601-0206-702a-664274984f39
00020000-5601-0206-040b-490d1720ab24	00030000-5601-0206-e72b-bac68c44c777
00020000-5601-0206-040b-490d1720ab24	00030000-5601-0206-776c-3b1b36ce6542
00020000-5601-0206-b83f-81b2457d937e	00030000-5601-0206-d8cd-8a34a01d0422
00020000-5601-0206-b83f-81b2457d937e	00030000-5601-0206-6ee8-52aca9b7c511
00020000-5601-0206-b83f-81b2457d937e	00030000-5601-0206-3cfa-2cf0c5b05f32
00020000-5601-0206-b83f-81b2457d937e	00030000-5601-0206-ffe8-fcafd5f5a764
00020000-5601-0206-b83f-81b2457d937e	00030000-5601-0206-5870-d716ef62c2db
00020000-5601-0206-b83f-81b2457d937e	00030000-5601-0206-a363-4c836d455b95
00020000-5601-0206-b83f-81b2457d937e	00030000-5601-0206-cb5a-f8adf08e056a
00020000-5601-0206-b83f-81b2457d937e	00030000-5601-0206-b43c-747eb08ecf1e
00020000-5601-0206-b83f-81b2457d937e	00030000-5601-0206-8b2e-d161ea79f2ee
00020000-5601-0206-b83f-81b2457d937e	00030000-5601-0206-afad-8ce6e986f7e1
00020000-5601-0206-b83f-81b2457d937e	00030000-5601-0206-a97b-0a372785dc6d
00020000-5601-0206-b83f-81b2457d937e	00030000-5601-0206-8d61-4d526822f089
00020000-5601-0206-b83f-81b2457d937e	00030000-5601-0206-6c33-31cff4c5f721
00020000-5601-0206-b83f-81b2457d937e	00030000-5601-0206-28b5-587596a1b31e
00020000-5601-0206-b83f-81b2457d937e	00030000-5601-0206-4ae9-e0f504e18043
00020000-5601-0206-b83f-81b2457d937e	00030000-5601-0206-fcbc-51c52dc2cf02
00020000-5601-0206-b83f-81b2457d937e	00030000-5601-0206-709f-65d052e0dd3b
00020000-5601-0206-b83f-81b2457d937e	00030000-5601-0206-e698-8a4b7b5957cd
00020000-5601-0206-b83f-81b2457d937e	00030000-5601-0206-e72b-bac68c44c777
00020000-5601-0206-b83f-81b2457d937e	00030000-5601-0206-776c-3b1b36ce6542
00020000-5601-0206-1201-7e37cd606c20	00030000-5601-0206-d8cd-8a34a01d0422
00020000-5601-0206-1201-7e37cd606c20	00030000-5601-0206-ffe8-fcafd5f5a764
00020000-5601-0206-1201-7e37cd606c20	00030000-5601-0206-5870-d716ef62c2db
00020000-5601-0206-1201-7e37cd606c20	00030000-5601-0206-a363-4c836d455b95
00020000-5601-0206-1201-7e37cd606c20	00030000-5601-0206-cb5a-f8adf08e056a
00020000-5601-0206-1201-7e37cd606c20	00030000-5601-0206-b43c-747eb08ecf1e
00020000-5601-0206-1201-7e37cd606c20	00030000-5601-0206-8b2e-d161ea79f2ee
00020000-5601-0206-1201-7e37cd606c20	00030000-5601-0206-afad-8ce6e986f7e1
00020000-5601-0206-1201-7e37cd606c20	00030000-5601-0206-a97b-0a372785dc6d
00020000-5601-0206-1201-7e37cd606c20	00030000-5601-0206-8d61-4d526822f089
00020000-5601-0206-1201-7e37cd606c20	00030000-5601-0206-6c33-31cff4c5f721
00020000-5601-0206-1201-7e37cd606c20	00030000-5601-0206-28b5-587596a1b31e
00020000-5601-0206-1201-7e37cd606c20	00030000-5601-0206-4ae9-e0f504e18043
00020000-5601-0206-1201-7e37cd606c20	00030000-5601-0206-fcbc-51c52dc2cf02
00020000-5601-0206-1201-7e37cd606c20	00030000-5601-0206-709f-65d052e0dd3b
00020000-5601-0206-1201-7e37cd606c20	00030000-5601-0206-3f81-0b9a3c0a8726
00020000-5601-0206-1201-7e37cd606c20	00030000-5601-0206-cfa0-60856bfdfa8a
00020000-5601-0206-1201-7e37cd606c20	00030000-5601-0206-e698-8a4b7b5957cd
00020000-5601-0206-1201-7e37cd606c20	00030000-5601-0206-e72b-bac68c44c777
00020000-5601-0206-1201-7e37cd606c20	00030000-5601-0206-776c-3b1b36ce6542
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-362a-6304eaedbd0f
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-63c2-d877aff09a21
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-cfa0-60856bfdfa8a
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-b577-746ad74a3ce5
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-a60a-4653c48f3a6a
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-5f69-4a78729a9ec4
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-d625-52842ff74bcc
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-d8cd-8a34a01d0422
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-6ee8-52aca9b7c511
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-4415-a9132f6f47ba
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-3cfa-2cf0c5b05f32
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-ffe8-fcafd5f5a764
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-0807-17f39fe00213
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-7f40-e316fccbdb0f
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-bab4-e3a740d2d870
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-ead0-d2cb5bc6bb1b
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-4bc9-2140a0b90114
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-5870-d716ef62c2db
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-eb9f-ffaf2f48434f
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-a363-4c836d455b95
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-48d2-f6717e3a36e9
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-f852-e3995e06a1c9
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-3341-cd2f8455eea6
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-b1e8-5e770503dc88
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-f839-0c0c99c0cb06
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-85ac-99496f209081
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-7124-056d489512e0
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-cb5a-f8adf08e056a
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-cec4-7297488312ee
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-b43c-747eb08ecf1e
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-ebb3-69930130b084
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-d059-6297f095fb39
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-42d1-7b964d0ea6fe
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-de72-274b2d59261e
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-f9cb-64664f3fdcd7
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-d918-f78435c8f2cc
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-0523-ca602b381d2a
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-8b2e-d161ea79f2ee
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-bd7f-90df7b2bb6e6
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-afad-8ce6e986f7e1
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-6a4c-7753666b5220
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-3933-1aeee86bc244
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-38e9-afddda35c54e
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-796c-1b88283d0234
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-5c4b-91ae03d17a88
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-9391-9658cd471a18
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-ffa8-b9a71169c7e0
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-f976-1b4739e5f3ad
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-1f97-8bed9d0fa386
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-a97b-0a372785dc6d
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-2da9-bb30f4a18d82
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-8d61-4d526822f089
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-1c3c-9fcd130aa4af
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-3745-b50d38e7344e
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-497f-963fb2ccbc3b
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-0965-4b8f318addb1
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-9ba5-14c088776b5c
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-57ef-e3663830180a
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-c93b-7b3b62a4c56c
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-6c33-31cff4c5f721
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-5d4c-45065a102502
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-ef5d-f91cb8759200
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-4364-2bf18bbf4631
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-54f6-7ec14f81086d
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-f657-833f738e3049
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-3c51-73b95d7e934b
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-ae8f-f840c0279da7
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-bd3b-63f640a32b00
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-14dd-b6e264014b8b
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-88c0-7be2fc457670
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-82d2-065474246b41
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-59c2-106793b06bee
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-532b-8bc5c73828c8
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-2a6c-c1ada3d2ae79
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-e486-c6a0bfe5243c
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-bab1-dd469bb25f28
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-ff47-b7d90870409d
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-93af-660f3de35789
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-a071-4a40e2c66655
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-80e6-885f35e0779c
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-5560-cc64e27dcab8
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-348f-86a0e87a8e9f
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-9e54-f5fac5f66a98
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-ce6c-c6402242dd63
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-4e03-26efc9373458
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-5b5f-eb828d9ec9e8
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-a5eb-2f1fbaaa5ef1
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-28b5-587596a1b31e
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-aa03-c85abc42f536
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-79a2-6939a26b6457
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-08bb-5fbbd9ad1b8c
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-d132-34fa6a43340a
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-0469-cf1ac5922320
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-4ae9-e0f504e18043
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-d2e4-bc2904b88aff
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-fcbc-51c52dc2cf02
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-0b7e-a509456cd647
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-d539-41686a867e86
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-125e-b8838885079c
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-3553-7f66d79fc75e
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-6572-32127f2da1fc
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-3daf-99a35d61b4d4
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-2411-1111b8afdfcc
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-6af0-4c6bc0db5e73
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-9f6b-3503aa6a52ec
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-709f-65d052e0dd3b
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-d3b9-1974026c8f5c
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-0b42-bd964d80d76b
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-12db-d69b433c7815
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-d406-0c65263e4a07
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-5f4a-ffa017739863
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-f8c6-d5a8908ac763
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-47d5-b2b0223c87ab
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-1415-6ebe247a95da
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-3bad-31e90974cf64
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-c561-ef93263aa2dc
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-d7d8-cda035d199fb
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-3f81-0b9a3c0a8726
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-5f3d-9227924c9e8f
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-e698-8a4b7b5957cd
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-8c01-d381e0677f52
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-bdc8-994ba044a39a
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-78e4-a97f058d4704
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-57c0-ae58958bbc7e
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-8db1-589e9e1b7a4d
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-01ac-e0a98936cfff
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-ff5e-34c01f76781b
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-57db-86f1be3cd19a
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-3cab-075ee4b11aa0
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-fa14-3117ee212356
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-916c-05c2ba3c1cbe
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-ed51-322e2cfbab9d
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-eccb-61a8b341a5a5
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-0163-c182085a893b
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-cda6-a446c0308b2d
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-702a-664274984f39
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-a4ae-de35f55ea8ca
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-e72b-bac68c44c777
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-dd96-348c9e1d59cf
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-776c-3b1b36ce6542
00020000-5601-0207-6191-e98c54c67cd1	00030000-5601-0206-5398-93dc51449d0a
\.


--
-- TOC entry 3001 (class 0 OID 20354569)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 20354603)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 20354738)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5601-0207-fedb-d5fd8bc8dcd3	00090000-5601-0207-3245-1d9035cb4908	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-5601-0207-4bb8-e53e131c9d42	00090000-5601-0207-2a40-49fad21b1da7	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-5601-0207-6681-fa9deaac67ec	00090000-5601-0207-a884-5303ff003132	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	\N	f	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-5601-0207-d4a2-846a3d6633fa	00090000-5601-0207-f1b5-b740bf7693b3	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	\N	f	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2977 (class 0 OID 20354304)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5601-0207-f3ba-cee149a79085	00040000-5601-0206-00da-dfdba0b580cc	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5601-0207-7d8e-467f5365b77f	00040000-5601-0206-00da-dfdba0b580cc	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5601-0207-b207-735d6eea1c3a	00040000-5601-0206-00da-dfdba0b580cc	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5601-0207-a0c6-a7c145aa8a1d	00040000-5601-0206-00da-dfdba0b580cc	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5601-0207-e8cc-f85a0496f457	00040000-5601-0206-00da-dfdba0b580cc	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5601-0207-d73e-54bf7320d54d	00040000-5601-0206-7f77-ff4a7bc28405	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5601-0207-abc1-ff4f1cc0f279	00040000-5601-0206-37b7-dd7876024111	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5601-0207-7847-78cc2a31bf4c	00040000-5601-0206-ad6b-16fe8e4d8ebd	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5601-0207-0d9a-9b91fe129715	00040000-5601-0206-63ed-b11e81163a00	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5601-0208-c6d4-03d3dcc88cb5	00040000-5601-0206-00da-dfdba0b580cc	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2979 (class 0 OID 20354338)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5601-0205-74c1-c65fba76fadf	8341	Adlešiči
00050000-5601-0205-145f-b60e9431df2f	5270	Ajdovščina
00050000-5601-0205-ff2e-d3eb2fb05598	6280	Ankaran/Ancarano
00050000-5601-0205-6106-22d07391d4b1	9253	Apače
00050000-5601-0205-207c-7912c0c89703	8253	Artiče
00050000-5601-0205-b0f1-a37b91ca6a8a	4275	Begunje na Gorenjskem
00050000-5601-0205-e94b-815d3bf67673	1382	Begunje pri Cerknici
00050000-5601-0205-3f0a-adc91c7eb4e2	9231	Beltinci
00050000-5601-0205-0f98-7a8762f8fb4a	2234	Benedikt
00050000-5601-0205-fae3-00af11b251af	2345	Bistrica ob Dravi
00050000-5601-0205-0a8e-c836499b2cb4	3256	Bistrica ob Sotli
00050000-5601-0205-5311-c47737833df2	8259	Bizeljsko
00050000-5601-0205-3cde-44d34ce139d5	1223	Blagovica
00050000-5601-0205-b223-1689cca4766f	8283	Blanca
00050000-5601-0205-97a7-395dc4625d7e	4260	Bled
00050000-5601-0205-6242-dcf706443903	4273	Blejska Dobrava
00050000-5601-0205-ca54-8ba6b4fcc8f4	9265	Bodonci
00050000-5601-0205-82b5-d21827980539	9222	Bogojina
00050000-5601-0205-fac9-ca029b7fa338	4263	Bohinjska Bela
00050000-5601-0205-e9e5-42ba7a4dc3a0	4264	Bohinjska Bistrica
00050000-5601-0205-9cbf-6176dda275d4	4265	Bohinjsko jezero
00050000-5601-0205-c2f8-e2c7be67f87d	1353	Borovnica
00050000-5601-0205-e196-e31a87037370	8294	Boštanj
00050000-5601-0205-9682-e87e99cf7cbd	5230	Bovec
00050000-5601-0205-f835-f005bf4526cd	5295	Branik
00050000-5601-0205-1dc9-112aa06bd97b	3314	Braslovče
00050000-5601-0205-fc29-42489b363bd3	5223	Breginj
00050000-5601-0205-edc5-b84f34e89f1f	8280	Brestanica
00050000-5601-0205-92e7-3de3d43997ad	2354	Bresternica
00050000-5601-0205-e704-d8b374ac59e8	4243	Brezje
00050000-5601-0205-b8d6-6368a2f88f6d	1351	Brezovica pri Ljubljani
00050000-5601-0205-535b-47c804b7b65e	8250	Brežice
00050000-5601-0205-c63f-5c124eb3f93e	4210	Brnik - Aerodrom
00050000-5601-0205-9fd5-c819840f7f8a	8321	Brusnice
00050000-5601-0205-ae2c-c76c346888f5	3255	Buče
00050000-5601-0205-b52b-231c152f4b6f	8276	Bučka 
00050000-5601-0205-7d15-e2b81cdcc027	9261	Cankova
00050000-5601-0205-ef5f-16b9abe9bb67	3000	Celje 
00050000-5601-0205-519d-e4956f10f835	3001	Celje - poštni predali
00050000-5601-0205-c9ee-3a015fd39b09	4207	Cerklje na Gorenjskem
00050000-5601-0205-b0c1-2259fdbbef3c	8263	Cerklje ob Krki
00050000-5601-0205-9557-b37125d5bcc5	1380	Cerknica
00050000-5601-0205-08f8-2e79a23efb13	5282	Cerkno
00050000-5601-0205-8661-76852c6458c3	2236	Cerkvenjak
00050000-5601-0205-65ef-8d713184c850	2215	Ceršak
00050000-5601-0205-36de-f818195a5f03	2326	Cirkovce
00050000-5601-0205-dd40-17d1f044027e	2282	Cirkulane
00050000-5601-0205-35b7-a0e851cb7050	5273	Col
00050000-5601-0205-d051-00c6c6f9c704	8251	Čatež ob Savi
00050000-5601-0205-5209-bcccecb18f62	1413	Čemšenik
00050000-5601-0205-311f-f24b3e5cda74	5253	Čepovan
00050000-5601-0205-154d-8fd70c06836a	9232	Črenšovci
00050000-5601-0205-9c72-8a324ea6d05a	2393	Črna na Koroškem
00050000-5601-0205-c3e1-927d10dec800	6275	Črni Kal
00050000-5601-0205-ea6e-35ee9b567ff7	5274	Črni Vrh nad Idrijo
00050000-5601-0205-77ea-0b7c711c8417	5262	Črniče
00050000-5601-0205-abee-0c4b161a7fa4	8340	Črnomelj
00050000-5601-0205-e37f-c50c01d85529	6271	Dekani
00050000-5601-0205-58b0-e91c03a27ac1	5210	Deskle
00050000-5601-0205-6b25-c6be6dbdc867	2253	Destrnik
00050000-5601-0205-609f-74880df8185c	6215	Divača
00050000-5601-0205-7cb4-b43b2422e9eb	1233	Dob
00050000-5601-0205-63a9-6926a913eb1f	3224	Dobje pri Planini
00050000-5601-0205-eefd-a326fc8c7154	8257	Dobova
00050000-5601-0205-12af-acf4efe8ec14	1423	Dobovec
00050000-5601-0205-ac2e-efa034e53648	5263	Dobravlje
00050000-5601-0205-fb82-bb013410294c	3204	Dobrna
00050000-5601-0205-219a-d7d8750c9e88	8211	Dobrnič
00050000-5601-0205-fc10-060d3b9b733f	1356	Dobrova
00050000-5601-0205-6612-71854f83600e	9223	Dobrovnik/Dobronak 
00050000-5601-0205-c488-5454ad19860b	5212	Dobrovo v Brdih
00050000-5601-0205-435c-1f74402e0a7c	1431	Dol pri Hrastniku
00050000-5601-0205-a75f-daad3a12c258	1262	Dol pri Ljubljani
00050000-5601-0205-b043-646a6993c4eb	1273	Dole pri Litiji
00050000-5601-0205-6f98-bd5c27a48c31	1331	Dolenja vas
00050000-5601-0205-bb84-347b9fce6b9a	8350	Dolenjske Toplice
00050000-5601-0205-dce8-e6c3cc22a17c	1230	Domžale
00050000-5601-0205-d60f-17b232da33c7	2252	Dornava
00050000-5601-0205-eafe-b4c5022e63d0	5294	Dornberk
00050000-5601-0205-227d-9e6edd70d983	1319	Draga
00050000-5601-0205-498a-986e3931d5c3	8343	Dragatuš
00050000-5601-0205-5051-2079f5e8c719	3222	Dramlje
00050000-5601-0205-dba2-c394da73a4cd	2370	Dravograd
00050000-5601-0205-35c1-8084702f6b3f	4203	Duplje
00050000-5601-0205-20f3-367ed5fd5bcd	6221	Dutovlje
00050000-5601-0205-a696-e1b3cff606fc	8361	Dvor
00050000-5601-0205-ab0d-d7cdca19346c	2343	Fala
00050000-5601-0205-b2aa-5eff0bf84d79	9208	Fokovci
00050000-5601-0205-89bc-9abc2557bee2	2313	Fram
00050000-5601-0205-0144-fbd74067f6d1	3213	Frankolovo
00050000-5601-0205-2e62-fafe0313d7ca	1274	Gabrovka
00050000-5601-0205-0750-92846defc5b6	8254	Globoko
00050000-5601-0205-11ee-31fd809bb1f7	5275	Godovič
00050000-5601-0205-7a8e-5c29532cd471	4204	Golnik
00050000-5601-0205-0aa4-c9d6192c76f5	3303	Gomilsko
00050000-5601-0205-c543-d384433829ae	4224	Gorenja vas
00050000-5601-0205-7469-2d895fb567e4	3263	Gorica pri Slivnici
00050000-5601-0205-1349-ab54dc21c205	2272	Gorišnica
00050000-5601-0205-6127-ea7c899ba9b2	9250	Gornja Radgona
00050000-5601-0205-dc5e-09cf11339fbc	3342	Gornji Grad
00050000-5601-0205-2f74-7915b163f1cb	4282	Gozd Martuljek
00050000-5601-0205-09d8-330215d59c06	6272	Gračišče
00050000-5601-0205-fe17-6d833fafc673	9264	Grad
00050000-5601-0205-5267-12c664efcab3	8332	Gradac
00050000-5601-0205-e725-a2151eec644a	1384	Grahovo
00050000-5601-0205-139f-2ffc3d58ce7e	5242	Grahovo ob Bači
00050000-5601-0205-c68a-0da7d8fdb5f8	5251	Grgar
00050000-5601-0205-7918-1232fbe2aef3	3302	Griže
00050000-5601-0205-a7c6-5bd3c2ad6c25	3231	Grobelno
00050000-5601-0205-8000-31a555a8bc63	1290	Grosuplje
00050000-5601-0205-5b79-2ff286382c0f	2288	Hajdina
00050000-5601-0205-1001-247556fda810	8362	Hinje
00050000-5601-0205-c940-24e66217c9af	2311	Hoče
00050000-5601-0205-c8e3-0662a1e467c0	9205	Hodoš/Hodos
00050000-5601-0205-38e4-743a3ba13694	1354	Horjul
00050000-5601-0205-0f22-cdda699b0496	1372	Hotedršica
00050000-5601-0205-5c56-c36ce4ba66d5	1430	Hrastnik
00050000-5601-0205-3540-369657f5cd4b	6225	Hruševje
00050000-5601-0205-830b-963f65198a33	4276	Hrušica
00050000-5601-0205-3e0a-1f3d39ab484a	5280	Idrija
00050000-5601-0205-c97c-e171f2cde964	1292	Ig
00050000-5601-0205-96c7-21971313a77f	6250	Ilirska Bistrica
00050000-5601-0205-706c-196fa0ec097b	6251	Ilirska Bistrica-Trnovo
00050000-5601-0205-06c9-bee541edefed	1295	Ivančna Gorica
00050000-5601-0205-d6a3-9368980655eb	2259	Ivanjkovci
00050000-5601-0205-2d06-633918dc9ba1	1411	Izlake
00050000-5601-0205-0cda-7645bdb07a89	6310	Izola/Isola
00050000-5601-0205-1a2a-2e6be652a9f4	2222	Jakobski Dol
00050000-5601-0205-7403-aadaf6ff7868	2221	Jarenina
00050000-5601-0205-ebc9-7a768e1d3025	6254	Jelšane
00050000-5601-0205-044a-32780907831d	4270	Jesenice
00050000-5601-0205-107e-2638d24441e4	8261	Jesenice na Dolenjskem
00050000-5601-0205-a9c3-b7e42745aa6a	3273	Jurklošter
00050000-5601-0205-6fc7-65803237bb0e	2223	Jurovski Dol
00050000-5601-0205-42ee-03f9012c058b	2256	Juršinci
00050000-5601-0205-61a7-4b0b174b56ea	5214	Kal nad Kanalom
00050000-5601-0205-a572-addd0d23bb03	3233	Kalobje
00050000-5601-0205-64df-6c6b6273a4f4	4246	Kamna Gorica
00050000-5601-0205-8194-0aff57f500ab	2351	Kamnica
00050000-5601-0205-ab9a-a40c8f678b63	1241	Kamnik
00050000-5601-0205-a628-efa7d50b8857	5213	Kanal
00050000-5601-0205-7107-84c2cfc66ea3	8258	Kapele
00050000-5601-0205-c98c-7d480a00dcc5	2362	Kapla
00050000-5601-0205-fcff-243dcc4045b5	2325	Kidričevo
00050000-5601-0205-fb9f-d15e14620779	1412	Kisovec
00050000-5601-0205-037f-113266c20032	6253	Knežak
00050000-5601-0205-77c0-34c44b485950	5222	Kobarid
00050000-5601-0205-fbda-8cd2d09229c5	9227	Kobilje
00050000-5601-0205-48af-3ee0c88e72ea	1330	Kočevje
00050000-5601-0205-eac5-057543f27271	1338	Kočevska Reka
00050000-5601-0205-d3b1-c5b5757e9a35	2276	Kog
00050000-5601-0205-1d6c-b092bbc170de	5211	Kojsko
00050000-5601-0205-6bbf-a08964396881	6223	Komen
00050000-5601-0205-b589-fe7cc0fda8d7	1218	Komenda
00050000-5601-0205-8194-1484ebcbe4e8	6000	Koper/Capodistria 
00050000-5601-0205-52ee-d656c614e33e	6001	Koper/Capodistria - poštni predali
00050000-5601-0205-5e0f-9beb7bcaf3bb	8282	Koprivnica
00050000-5601-0205-5caa-fc2f5ca4ec92	5296	Kostanjevica na Krasu
00050000-5601-0205-6fa9-42336b7d22c6	8311	Kostanjevica na Krki
00050000-5601-0205-6252-308477d026ef	1336	Kostel
00050000-5601-0205-e881-2bbbedbc0e12	6256	Košana
00050000-5601-0205-bd5c-b4b853911136	2394	Kotlje
00050000-5601-0205-bb1e-a76e71cf33b6	6240	Kozina
00050000-5601-0205-c958-73a5a01c5daf	3260	Kozje
00050000-5601-0205-0d08-ba789621a4dd	4000	Kranj 
00050000-5601-0205-4122-9074d8cb6b31	4001	Kranj - poštni predali
00050000-5601-0205-353f-b3d922fb5b71	4280	Kranjska Gora
00050000-5601-0205-d6b7-997ca7660a7e	1281	Kresnice
00050000-5601-0205-adce-e8078e68f0a0	4294	Križe
00050000-5601-0205-6955-01d15db41086	9206	Križevci
00050000-5601-0205-2f6e-5dd05a58abd3	9242	Križevci pri Ljutomeru
00050000-5601-0205-46c0-94df565c666b	1301	Krka
00050000-5601-0205-c980-ad8010a8b0c2	8296	Krmelj
00050000-5601-0205-b10f-b140497cf851	4245	Kropa
00050000-5601-0205-88c4-769d76db95c9	8262	Krška vas
00050000-5601-0205-99a4-00a79abff495	8270	Krško
00050000-5601-0205-f000-59ab029d1707	9263	Kuzma
00050000-5601-0205-a49e-91903f8752be	2318	Laporje
00050000-5601-0205-bc87-22d746d56257	3270	Laško
00050000-5601-0205-22ce-cf03a6291141	1219	Laze v Tuhinju
00050000-5601-0205-0810-7ef01f3475b9	2230	Lenart v Slovenskih goricah
00050000-5601-0205-a1bc-8d17385a1ec1	9220	Lendava/Lendva
00050000-5601-0205-29d8-f7dff00788d5	4248	Lesce
00050000-5601-0205-d1d6-8dbce5abfdbc	3261	Lesično
00050000-5601-0205-4ecd-305496fc67ce	8273	Leskovec pri Krškem
00050000-5601-0205-7bcb-77dc876831e8	2372	Libeliče
00050000-5601-0205-8217-65e08a64acc1	2341	Limbuš
00050000-5601-0205-e095-fda84e3f801b	1270	Litija
00050000-5601-0205-1daa-f128b160905a	3202	Ljubečna
00050000-5601-0205-eb23-00dde0ad1df8	1000	Ljubljana 
00050000-5601-0205-522d-2c7cce41092c	1001	Ljubljana - poštni predali
00050000-5601-0205-21c2-1a348635dc4d	1231	Ljubljana - Črnuče
00050000-5601-0205-0c12-67839a61f78a	1261	Ljubljana - Dobrunje
00050000-5601-0205-6f0e-a934c0b3b377	1260	Ljubljana - Polje
00050000-5601-0205-b16c-7d7766bc380b	1210	Ljubljana - Šentvid
00050000-5601-0205-1b4d-ad5235d80b55	1211	Ljubljana - Šmartno
00050000-5601-0205-75fd-2660fe9a29ff	3333	Ljubno ob Savinji
00050000-5601-0205-c8a7-93c14dae4ed6	9240	Ljutomer
00050000-5601-0205-3577-54daf9f20eca	3215	Loče
00050000-5601-0205-2496-33530b934141	5231	Log pod Mangartom
00050000-5601-0205-061a-fb76959f7bb7	1358	Log pri Brezovici
00050000-5601-0205-6a2e-a12a1d4e60fd	1370	Logatec
00050000-5601-0205-88a4-6ed2025a7e98	1371	Logatec
00050000-5601-0205-3ec1-a0a8c9700b12	1434	Loka pri Zidanem Mostu
00050000-5601-0205-e3d9-652f885ddf14	3223	Loka pri Žusmu
00050000-5601-0205-c4df-9df39e60b882	6219	Lokev
00050000-5601-0205-810d-f0fbda5d46dc	1318	Loški Potok
00050000-5601-0205-606d-810544cd1e29	2324	Lovrenc na Dravskem polju
00050000-5601-0205-7701-f753cb4fdba5	2344	Lovrenc na Pohorju
00050000-5601-0205-33d1-d6584b8480b8	3334	Luče
00050000-5601-0205-2da3-1a893629360b	1225	Lukovica
00050000-5601-0205-beaa-fb1246dc5a48	9202	Mačkovci
00050000-5601-0205-7463-bf8fc7fd5fd3	2322	Majšperk
00050000-5601-0205-798a-d7ce60803491	2321	Makole
00050000-5601-0205-6588-085e5ed69cf6	9243	Mala Nedelja
00050000-5601-0205-6717-d3ac2fab2f8b	2229	Malečnik
00050000-5601-0205-0a3b-f9de6db575f6	6273	Marezige
00050000-5601-0205-25c3-3e595a0ca8ab	2000	Maribor 
00050000-5601-0205-c5ef-9bf5305533ee	2001	Maribor - poštni predali
00050000-5601-0205-a856-5ffc2a34baaf	2206	Marjeta na Dravskem polju
00050000-5601-0205-c520-c4fff3009197	2281	Markovci
00050000-5601-0205-4503-948b6700f1e2	9221	Martjanci
00050000-5601-0205-33fc-654a548df08a	6242	Materija
00050000-5601-0205-b5fc-56e58dabbd13	4211	Mavčiče
00050000-5601-0205-a48b-53485c5595c9	1215	Medvode
00050000-5601-0205-7837-91430b2c8fad	1234	Mengeš
00050000-5601-0205-c13e-b9e2a8b8a413	8330	Metlika
00050000-5601-0205-b418-a9c95f1fd148	2392	Mežica
00050000-5601-0205-4a9a-d5bb02e7bda4	2204	Miklavž na Dravskem polju
00050000-5601-0205-caf7-b032f736ef9c	2275	Miklavž pri Ormožu
00050000-5601-0205-4c38-c14ffd12db41	5291	Miren
00050000-5601-0205-472b-03b502dbe615	8233	Mirna
00050000-5601-0205-2b7c-b37b76b11687	8216	Mirna Peč
00050000-5601-0205-0cff-bc6fd48cab17	2382	Mislinja
00050000-5601-0205-bab8-8f2bfcf14eed	4281	Mojstrana
00050000-5601-0205-cbf2-4f4c9ca1f441	8230	Mokronog
00050000-5601-0205-73d1-9a04f5aa9e2a	1251	Moravče
00050000-5601-0205-1dbe-0dabece64baf	9226	Moravske Toplice
00050000-5601-0205-ab17-1388b9e21c86	5216	Most na Soči
00050000-5601-0205-741f-6fb31b1e1af0	1221	Motnik
00050000-5601-0205-d036-9904558c939a	3330	Mozirje
00050000-5601-0205-97a4-36766df705b2	9000	Murska Sobota 
00050000-5601-0205-2979-65b642289579	9001	Murska Sobota - poštni predali
00050000-5601-0205-b7ca-9c4bc5bc61eb	2366	Muta
00050000-5601-0205-7987-700c3fd6d6dd	4202	Naklo
00050000-5601-0205-7fec-bfeb3180297e	3331	Nazarje
00050000-5601-0205-394a-f79168828e3e	1357	Notranje Gorice
00050000-5601-0205-29d3-6b250ccfd06f	3203	Nova Cerkev
00050000-5601-0205-cafd-5bf815665dca	5000	Nova Gorica 
00050000-5601-0205-feb9-f91354651a1f	5001	Nova Gorica - poštni predali
00050000-5601-0205-06a5-a82509ab6370	1385	Nova vas
00050000-5601-0205-d529-fec2a18733e2	8000	Novo mesto
00050000-5601-0205-ac94-3d6e3a19d4f2	8001	Novo mesto - poštni predali
00050000-5601-0205-9fe0-e26ab3437c37	6243	Obrov
00050000-5601-0205-2895-1ffa6f5ebd3e	9233	Odranci
00050000-5601-0205-e9de-c491e216fd51	2317	Oplotnica
00050000-5601-0205-f2a7-a5d6b7ed7329	2312	Orehova vas
00050000-5601-0205-1b68-754afa8bb791	2270	Ormož
00050000-5601-0205-dd91-3599b0f06af6	1316	Ortnek
00050000-5601-0205-07dc-c9402207dbf7	1337	Osilnica
00050000-5601-0205-28d5-75f368d5838e	8222	Otočec
00050000-5601-0205-7603-b67409baf8d1	2361	Ožbalt
00050000-5601-0205-f54e-78e4c8a01b7a	2231	Pernica
00050000-5601-0205-f066-f6641e40a4ef	2211	Pesnica pri Mariboru
00050000-5601-0205-cb44-2d327b28e7fa	9203	Petrovci
00050000-5601-0205-ad45-ed300fbf893c	3301	Petrovče
00050000-5601-0206-7d5e-5802caa8005a	6330	Piran/Pirano
00050000-5601-0206-1fda-48edd641308f	8255	Pišece
00050000-5601-0206-5587-67a92112a3a6	6257	Pivka
00050000-5601-0206-afc1-a00aff6bc8f7	6232	Planina
00050000-5601-0206-c270-fd085fdf5864	3225	Planina pri Sevnici
00050000-5601-0206-b03c-f5953b2b987a	6276	Pobegi
00050000-5601-0206-d9a0-092782fbc7c0	8312	Podbočje
00050000-5601-0206-1bee-a3c6c0ce7546	5243	Podbrdo
00050000-5601-0206-11dc-cd0fc17683ad	3254	Podčetrtek
00050000-5601-0206-794c-74a18dfadcdc	2273	Podgorci
00050000-5601-0206-df4c-ead66c3ecc54	6216	Podgorje
00050000-5601-0206-9aa3-4cf844d23de6	2381	Podgorje pri Slovenj Gradcu
00050000-5601-0206-55b9-d21cf21fa644	6244	Podgrad
00050000-5601-0206-a064-7a69b98a6183	1414	Podkum
00050000-5601-0206-b57c-6ea93d37d2a9	2286	Podlehnik
00050000-5601-0206-33eb-6bb03df23b0c	5272	Podnanos
00050000-5601-0206-63a3-1619c50e9af9	4244	Podnart
00050000-5601-0206-56d9-1fad78b5d3da	3241	Podplat
00050000-5601-0206-d3e8-b28655533bcb	3257	Podsreda
00050000-5601-0206-2a8c-a00b2ec3be6d	2363	Podvelka
00050000-5601-0206-ae60-9654d2854cf1	2208	Pohorje
00050000-5601-0206-7e91-2cf2616b8414	2257	Polenšak
00050000-5601-0206-2df1-42956e0db301	1355	Polhov Gradec
00050000-5601-0206-9820-2a3be32ee961	4223	Poljane nad Škofjo Loko
00050000-5601-0206-e263-56a297f19c17	2319	Poljčane
00050000-5601-0206-8f3c-41c6c6d61dce	1272	Polšnik
00050000-5601-0206-dc61-bf16cc5c3d69	3313	Polzela
00050000-5601-0206-e0c2-0b82abcb1ec8	3232	Ponikva
00050000-5601-0206-5fd7-055be720a077	6320	Portorož/Portorose
00050000-5601-0206-7023-0edef72c99b4	6230	Postojna
00050000-5601-0206-88eb-648b1aad5d3d	2331	Pragersko
00050000-5601-0206-d4ae-3bae50bf495e	3312	Prebold
00050000-5601-0206-03a2-de4de5437a31	4205	Preddvor
00050000-5601-0206-a2d5-d7b1fb12b74a	6255	Prem
00050000-5601-0206-c18b-ecc112a8ec0c	1352	Preserje
00050000-5601-0206-0353-94e5089d5461	6258	Prestranek
00050000-5601-0206-28fc-60e41d3e81a1	2391	Prevalje
00050000-5601-0206-6de4-18a76805c4dc	3262	Prevorje
00050000-5601-0206-6969-731c4367620e	1276	Primskovo 
00050000-5601-0206-6c91-9b266acc899e	3253	Pristava pri Mestinju
00050000-5601-0206-7dcd-f91769a74939	9207	Prosenjakovci/Partosfalva
00050000-5601-0206-5d90-c37986a17287	5297	Prvačina
00050000-5601-0206-dea5-276ae2056e5a	2250	Ptuj
00050000-5601-0206-3cd7-c54eccc2637b	2323	Ptujska Gora
00050000-5601-0206-228a-ba3cc9f8ccc0	9201	Puconci
00050000-5601-0206-1575-5796ea7134d9	2327	Rače
00050000-5601-0206-51fd-a24a077c84a6	1433	Radeče
00050000-5601-0206-efbb-c4e85ad312ca	9252	Radenci
00050000-5601-0206-bf7c-05832c9417d5	2360	Radlje ob Dravi
00050000-5601-0206-2761-5fab1d1215db	1235	Radomlje
00050000-5601-0206-cc4a-b28cf9bcef06	4240	Radovljica
00050000-5601-0206-6d32-fc64b0ca92c7	8274	Raka
00050000-5601-0206-c331-2ce8f32d90f6	1381	Rakek
00050000-5601-0206-784f-f0251209ac5f	4283	Rateče - Planica
00050000-5601-0206-a948-6f97b4991853	2390	Ravne na Koroškem
00050000-5601-0206-9af6-5aecc8dab3f7	9246	Razkrižje
00050000-5601-0206-44de-ee98e59db239	3332	Rečica ob Savinji
00050000-5601-0206-c9db-e91536c119e2	5292	Renče
00050000-5601-0206-29b0-9ce308bd8b55	1310	Ribnica
00050000-5601-0206-567b-668ed46075cc	2364	Ribnica na Pohorju
00050000-5601-0206-37fa-87012a72dcdd	3272	Rimske Toplice
00050000-5601-0206-a623-c043f5446420	1314	Rob
00050000-5601-0206-7aaf-fff9d03ff467	5215	Ročinj
00050000-5601-0206-05c9-f1162f4885cf	3250	Rogaška Slatina
00050000-5601-0206-3061-4e189b2d1780	9262	Rogašovci
00050000-5601-0206-6429-0779342336f9	3252	Rogatec
00050000-5601-0206-0f2b-afe9091e501f	1373	Rovte
00050000-5601-0206-067e-71efa9ab6b1b	2342	Ruše
00050000-5601-0206-8954-63c3b0e7b948	1282	Sava
00050000-5601-0206-fbb5-19e771e1dc21	6333	Sečovlje/Sicciole
00050000-5601-0206-1887-54f401135401	4227	Selca
00050000-5601-0206-ac5f-b4a30febf222	2352	Selnica ob Dravi
00050000-5601-0206-16e0-20be301fc88b	8333	Semič
00050000-5601-0206-2626-7d4ee014758a	8281	Senovo
00050000-5601-0206-31ab-34fee627b3b2	6224	Senožeče
00050000-5601-0206-b1db-7eb6a8661628	8290	Sevnica
00050000-5601-0206-52b3-bba4754bb53b	6210	Sežana
00050000-5601-0206-e35b-9b08b1e93442	2214	Sladki Vrh
00050000-5601-0206-c58f-0b142006ef60	5283	Slap ob Idrijci
00050000-5601-0206-90d1-eb16da0ef6f3	2380	Slovenj Gradec
00050000-5601-0206-58fe-ad79d614e542	2310	Slovenska Bistrica
00050000-5601-0206-ac7d-095cad40d0e5	3210	Slovenske Konjice
00050000-5601-0206-e8f6-94be0531759c	1216	Smlednik
00050000-5601-0206-4086-b296103ad877	5232	Soča
00050000-5601-0206-0bcc-d22c31011d11	1317	Sodražica
00050000-5601-0206-d47a-be25aaea7ee2	3335	Solčava
00050000-5601-0206-7262-700c863fa170	5250	Solkan
00050000-5601-0206-d8c2-9fa565f44244	4229	Sorica
00050000-5601-0206-f598-0304ed1b9a51	4225	Sovodenj
00050000-5601-0206-d694-f807f82fc923	5281	Spodnja Idrija
00050000-5601-0206-ab62-9f46d37b9743	2241	Spodnji Duplek
00050000-5601-0206-f45d-2f7eeec2664a	9245	Spodnji Ivanjci
00050000-5601-0206-afe2-0b40002f6385	2277	Središče ob Dravi
00050000-5601-0206-9042-5352c5f82158	4267	Srednja vas v Bohinju
00050000-5601-0206-5755-47e03207f0e9	8256	Sromlje 
00050000-5601-0206-7c30-f7855c47ac6b	5224	Srpenica
00050000-5601-0206-8d8e-06547998ea7f	1242	Stahovica
00050000-5601-0206-9919-21ca8a75b077	1332	Stara Cerkev
00050000-5601-0206-60b3-b0b31b721d64	8342	Stari trg ob Kolpi
00050000-5601-0206-66c4-46aed35d144a	1386	Stari trg pri Ložu
00050000-5601-0206-7342-8a997c52540f	2205	Starše
00050000-5601-0206-7ee8-ce36ea616a30	2289	Stoperce
00050000-5601-0206-6124-4a854b07921f	8322	Stopiče
00050000-5601-0206-52dc-e545a0c461e3	3206	Stranice
00050000-5601-0206-9f15-46b18ad0506e	8351	Straža
00050000-5601-0206-f689-7059b8eb7c78	1313	Struge
00050000-5601-0206-2b86-716e5787e369	8293	Studenec
00050000-5601-0206-5c45-411fd8e9f46d	8331	Suhor
00050000-5601-0206-e9a5-4aae34be3021	2233	Sv. Ana v Slovenskih goricah
00050000-5601-0206-89cd-4aa0dbb784a9	2235	Sv. Trojica v Slovenskih goricah
00050000-5601-0206-4e13-47bf1d27a15d	2353	Sveti Duh na Ostrem Vrhu
00050000-5601-0206-2546-0532293c0d6f	9244	Sveti Jurij ob Ščavnici
00050000-5601-0206-8cde-0d15a97638bb	3264	Sveti Štefan
00050000-5601-0206-7a60-f7846751abce	2258	Sveti Tomaž
00050000-5601-0206-8a55-fbd5cd088c94	9204	Šalovci
00050000-5601-0206-2bfa-569b69b227c1	5261	Šempas
00050000-5601-0206-d4c9-ce3877fd49f8	5290	Šempeter pri Gorici
00050000-5601-0206-4c23-3648da1a577b	3311	Šempeter v Savinjski dolini
00050000-5601-0206-be89-38e3abb650c5	4208	Šenčur
00050000-5601-0206-e7e6-e1cb67a25746	2212	Šentilj v Slovenskih goricah
00050000-5601-0206-c1ca-1834dc5888cd	8297	Šentjanž
00050000-5601-0206-291b-f014cb24e047	2373	Šentjanž pri Dravogradu
00050000-5601-0206-096a-4f614ca524cc	8310	Šentjernej
00050000-5601-0206-6cee-d65c98196f67	3230	Šentjur
00050000-5601-0206-9280-93f6b3a36584	3271	Šentrupert
00050000-5601-0206-1fe2-a635b1b5e73b	8232	Šentrupert
00050000-5601-0206-3302-1bdbd6eae066	1296	Šentvid pri Stični
00050000-5601-0206-f816-968417db065c	8275	Škocjan
00050000-5601-0206-9786-16d8490e8f1e	6281	Škofije
00050000-5601-0206-e171-a080fe22d81f	4220	Škofja Loka
00050000-5601-0206-6c13-25a9c4a2b7ec	3211	Škofja vas
00050000-5601-0206-b147-173cb0fee938	1291	Škofljica
00050000-5601-0206-d1f1-b1ec76abb628	6274	Šmarje
00050000-5601-0206-64f6-13dbb8870aa5	1293	Šmarje - Sap
00050000-5601-0206-c792-e0ba61009b0f	3240	Šmarje pri Jelšah
00050000-5601-0206-fdbd-3b178fa572e5	8220	Šmarješke Toplice
00050000-5601-0206-8378-bf77cba679d1	2315	Šmartno na Pohorju
00050000-5601-0206-5a6a-dce8006475b6	3341	Šmartno ob Dreti
00050000-5601-0206-a3b7-4e0eb4bcefd9	3327	Šmartno ob Paki
00050000-5601-0206-f399-0baa42b1b527	1275	Šmartno pri Litiji
00050000-5601-0206-7c3b-3b71a48a0272	2383	Šmartno pri Slovenj Gradcu
00050000-5601-0206-cd2b-8ebf00b77a14	3201	Šmartno v Rožni dolini
00050000-5601-0206-2148-5e1f32adce22	3325	Šoštanj
00050000-5601-0206-36a4-1e39ba1d1c0d	6222	Štanjel
00050000-5601-0206-6c68-1b6622469bc0	3220	Štore
00050000-5601-0206-0aa2-5401cba8a50b	3304	Tabor
00050000-5601-0206-66da-ee623fcdc8df	3221	Teharje
00050000-5601-0206-bd34-09d87dc1f9d1	9251	Tišina
00050000-5601-0206-4b89-e25ea1765df8	5220	Tolmin
00050000-5601-0206-dca9-0307b097df89	3326	Topolšica
00050000-5601-0206-4bf0-00fc8b41c7cd	2371	Trbonje
00050000-5601-0206-aebb-6fee7ccf692b	1420	Trbovlje
00050000-5601-0206-f5e3-10dd7c2eb863	8231	Trebelno 
00050000-5601-0206-6e76-9195cc3f37ab	8210	Trebnje
00050000-5601-0206-cf6d-72de5fd65429	5252	Trnovo pri Gorici
00050000-5601-0206-bb14-b5343c0569a5	2254	Trnovska vas
00050000-5601-0206-cd18-52f08c1f5639	1222	Trojane
00050000-5601-0206-47da-87c345a9e8ef	1236	Trzin
00050000-5601-0206-b61d-3793e29afb0c	4290	Tržič
00050000-5601-0206-ade5-91ae74a35fe2	8295	Tržišče
00050000-5601-0206-db37-8aa2bbd38812	1311	Turjak
00050000-5601-0206-33d0-681b093ff1e5	9224	Turnišče
00050000-5601-0206-3927-76c46276c8bb	8323	Uršna sela
00050000-5601-0206-d425-7734c2f967cb	1252	Vače
00050000-5601-0206-87bc-9c41b53106f6	3320	Velenje 
00050000-5601-0206-4800-74c80ee52ab0	3322	Velenje - poštni predali
00050000-5601-0206-280e-a2c06cc8c9e8	8212	Velika Loka
00050000-5601-0206-6249-f96e8b9224e2	2274	Velika Nedelja
00050000-5601-0206-8000-40edb4ee7669	9225	Velika Polana
00050000-5601-0206-f894-478bc828df3a	1315	Velike Lašče
00050000-5601-0206-dfab-f35b98a8dc2f	8213	Veliki Gaber
00050000-5601-0206-ca13-0756df5f45cf	9241	Veržej
00050000-5601-0206-ea8c-88af743d7e40	1312	Videm - Dobrepolje
00050000-5601-0206-382e-66bf6c58b4d4	2284	Videm pri Ptuju
00050000-5601-0206-38a0-4da2a7311b83	8344	Vinica
00050000-5601-0206-244c-1bc4949ef476	5271	Vipava
00050000-5601-0206-4a6a-b7e2fc1e38b8	4212	Visoko
00050000-5601-0206-0d66-4128d9e95250	1294	Višnja Gora
00050000-5601-0206-1d50-aa03ee02de5d	3205	Vitanje
00050000-5601-0206-2015-695c919c6b20	2255	Vitomarci
00050000-5601-0206-d5c9-95f433ed7762	1217	Vodice
00050000-5601-0206-74bd-7d56d31044d0	3212	Vojnik\t
00050000-5601-0206-7c74-ba555195f8d8	5293	Volčja Draga
00050000-5601-0206-4bcf-11642d6e7a61	2232	Voličina
00050000-5601-0206-e906-94ed81b96cc7	3305	Vransko
00050000-5601-0206-13b8-f8792e87776e	6217	Vremski Britof
00050000-5601-0206-8f2c-0775b23f86fa	1360	Vrhnika
00050000-5601-0206-2d62-1773566149be	2365	Vuhred
00050000-5601-0206-1687-08e9dd7bd8c7	2367	Vuzenica
00050000-5601-0206-b903-8db9414c8ecf	8292	Zabukovje 
00050000-5601-0206-59b9-333a507a903f	1410	Zagorje ob Savi
00050000-5601-0206-fc88-de51e92331f6	1303	Zagradec
00050000-5601-0206-d874-75bac7ea39fc	2283	Zavrč
00050000-5601-0206-6177-badfcebab1db	8272	Zdole 
00050000-5601-0206-0d67-e8cd1aa5585f	4201	Zgornja Besnica
00050000-5601-0206-db03-b55c2bfd6658	2242	Zgornja Korena
00050000-5601-0206-336a-5903a7432bd0	2201	Zgornja Kungota
00050000-5601-0206-aaf9-0f86410452d0	2316	Zgornja Ložnica
00050000-5601-0206-20df-58ea4b35f6ce	2314	Zgornja Polskava
00050000-5601-0206-90bd-387048fe3fb8	2213	Zgornja Velka
00050000-5601-0206-3407-1e9d0e25394c	4247	Zgornje Gorje
00050000-5601-0206-5ee6-ec6682df8347	4206	Zgornje Jezersko
00050000-5601-0206-4b4e-1ac984fdf742	2285	Zgornji Leskovec
00050000-5601-0206-3849-1283810ca0d8	1432	Zidani Most
00050000-5601-0206-d81f-e03f2b775751	3214	Zreče
00050000-5601-0206-cdff-d96db283d08f	4209	Žabnica
00050000-5601-0206-fca1-82611c4b47aa	3310	Žalec
00050000-5601-0206-47d1-cc2443251cc1	4228	Železniki
00050000-5601-0206-3f42-8985c76a0738	2287	Žetale
00050000-5601-0206-4cb5-9258a90e1855	4226	Žiri
00050000-5601-0206-05c7-81f53eb5e4e7	4274	Žirovnica
00050000-5601-0206-6cfc-0c98ecd16adf	8360	Žužemberk
\.


--
-- TOC entry 3024 (class 0 OID 20354918)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 20354543)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 20354323)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5601-0207-9ddc-6d97f58c77e8	00080000-5601-0207-f3ba-cee149a79085	\N	00040000-5601-0206-00da-dfdba0b580cc	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5601-0207-4576-124a0d34b1d4	00080000-5601-0207-f3ba-cee149a79085	\N	00040000-5601-0206-00da-dfdba0b580cc	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5601-0207-bddf-dc2a4f36e687	00080000-5601-0207-7d8e-467f5365b77f	\N	00040000-5601-0206-00da-dfdba0b580cc	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2986 (class 0 OID 20354427)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 20354555)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 20354932)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 20354942)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5601-0207-6db5-31a4f2123fa3	00080000-5601-0207-b207-735d6eea1c3a	0987	AK
00190000-5601-0207-a800-3461f778d304	00080000-5601-0207-7d8e-467f5365b77f	0989	AK
00190000-5601-0207-bb65-e8a9efdbdffa	00080000-5601-0207-a0c6-a7c145aa8a1d	0986	AK
00190000-5601-0207-97a7-eadc78d91d09	00080000-5601-0207-d73e-54bf7320d54d	0984	AK
00190000-5601-0207-28b5-81b6ddc54db2	00080000-5601-0207-abc1-ff4f1cc0f279	0983	AK
00190000-5601-0207-6799-20ae00816a9a	00080000-5601-0207-7847-78cc2a31bf4c	0982	AK
00190000-5601-0208-963c-5844d49f14a2	00080000-5601-0208-c6d4-03d3dcc88cb5	1001	AK
\.


--
-- TOC entry 3023 (class 0 OID 20354875)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5601-0208-dcaf-2adc0b1a6049	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3027 (class 0 OID 20354950)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 20354584)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5601-0207-5c7a-c67f8aae8ada	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5601-0207-e457-624257a60221	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5601-0207-f836-90a727d79a1d	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5601-0207-e970-8ff492588aa1	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5601-0207-be42-4c32e77a37e1	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-5601-0207-2fbb-19fb40b3797c	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5601-0207-912e-f42f4aa4b050	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2995 (class 0 OID 20354528)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 20354518)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 20354727)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 20354658)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 20354401)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 20354196)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5601-0208-c6d4-03d3dcc88cb5	00010000-5601-0206-7153-29e4f9c497d6	2015-09-22 09:23:52	INS	a:0:{}
2	App\\Entity\\Option	00000000-5601-0208-5c9e-dfc21de80e38	00010000-5601-0206-7153-29e4f9c497d6	2015-09-22 09:23:52	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5601-0208-963c-5844d49f14a2	00010000-5601-0206-7153-29e4f9c497d6	2015-09-22 09:23:52	INS	a:0:{}
\.


--
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3004 (class 0 OID 20354597)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 20354234)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5601-0206-bcd4-490900b27342	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5601-0206-5944-6a3e47825345	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5601-0206-d3a4-fcb409a810e1	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5601-0206-83d7-8e89ef34c631	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5601-0206-50bf-873507f8c7b2	planer	Planer dogodkov v koledarju	t
00020000-5601-0206-fbe1-4c4d89cc7fdb	kadrovska	Kadrovska služba	t
00020000-5601-0206-040b-490d1720ab24	arhivar	Ažuriranje arhivalij	t
00020000-5601-0206-b83f-81b2457d937e	igralec	Igralec	t
00020000-5601-0206-1201-7e37cd606c20	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5601-0207-6191-e98c54c67cd1	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2969 (class 0 OID 20354218)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5601-0206-6ca7-d1df800dae41	00020000-5601-0206-d3a4-fcb409a810e1
00010000-5601-0206-7153-29e4f9c497d6	00020000-5601-0206-d3a4-fcb409a810e1
00010000-5601-0207-0b2a-05d02e884095	00020000-5601-0207-6191-e98c54c67cd1
\.


--
-- TOC entry 3006 (class 0 OID 20354611)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 20354549)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 20354495)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 20354183)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5601-0206-6cde-57ca521b4600	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5601-0206-b0ff-14e17851f535	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5601-0206-9a79-3a8f0dd250a7	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5601-0206-5b1b-1c06846dbc55	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5601-0206-8f2b-b933db2eb315	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2964 (class 0 OID 20354175)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5601-0206-bd81-9d2a1c72b190	00230000-5601-0206-5b1b-1c06846dbc55	popa
00240000-5601-0206-26ee-3b6751be36e2	00230000-5601-0206-5b1b-1c06846dbc55	oseba
00240000-5601-0206-d700-c09fa1b368b4	00230000-5601-0206-5b1b-1c06846dbc55	sezona
00240000-5601-0206-2ce5-b97ce3feb4a7	00230000-5601-0206-b0ff-14e17851f535	prostor
00240000-5601-0206-58a0-24a61a2ced18	00230000-5601-0206-5b1b-1c06846dbc55	besedilo
00240000-5601-0206-bba5-78ff705aa7f7	00230000-5601-0206-5b1b-1c06846dbc55	uprizoritev
00240000-5601-0206-6f52-ca2553c9d105	00230000-5601-0206-5b1b-1c06846dbc55	funkcija
00240000-5601-0206-b96a-e002e557de58	00230000-5601-0206-5b1b-1c06846dbc55	tipfunkcije
00240000-5601-0206-1d5d-440b367d6d0d	00230000-5601-0206-5b1b-1c06846dbc55	alternacija
00240000-5601-0206-f6d2-cafcd38a0b2b	00230000-5601-0206-6cde-57ca521b4600	pogodba
00240000-5601-0206-477c-685c2a4e6035	00230000-5601-0206-5b1b-1c06846dbc55	zaposlitev
00240000-5601-0206-c95d-297eb0d8a7a3	00230000-5601-0206-5b1b-1c06846dbc55	zvrstuprizoritve
00240000-5601-0206-119c-10664687f677	00230000-5601-0206-6cde-57ca521b4600	programdela
00240000-5601-0206-c3df-2e9f080dce83	00230000-5601-0206-5b1b-1c06846dbc55	zapis
\.


--
-- TOC entry 2963 (class 0 OID 20354170)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
7f1d5efc-db6d-4ade-9482-dd53395de093	00240000-5601-0206-bd81-9d2a1c72b190	0	1001
\.


--
-- TOC entry 3012 (class 0 OID 20354675)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5601-0208-683f-c1351a484662	000e0000-5601-0207-4c99-f8d043f83b4c	00080000-5601-0207-f3ba-cee149a79085	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5601-0206-0146-bbb2f5f02d46
00270000-5601-0208-2a17-e03372e1ba09	000e0000-5601-0207-4c99-f8d043f83b4c	00080000-5601-0207-f3ba-cee149a79085	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5601-0206-0146-bbb2f5f02d46
\.


--
-- TOC entry 2976 (class 0 OID 20354296)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 20354505)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5601-0208-a17d-1356c83f398c	00180000-5601-0208-abc2-e477e261c1ba	000c0000-5601-0208-5eda-c8ba08ea7537	00090000-5601-0207-dbdf-79670dd1c44d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5601-0208-34c2-6438827c2dce	00180000-5601-0208-abc2-e477e261c1ba	000c0000-5601-0208-6f8f-824468f8691b	00090000-5601-0207-f1b5-b740bf7693b3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5601-0208-4aa1-6812c45a3fe5	00180000-5601-0208-abc2-e477e261c1ba	000c0000-5601-0208-a62a-9c754b45cc3b	00090000-5601-0207-d536-71cba2960524	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5601-0208-16fe-1f9fe9fa0a7c	00180000-5601-0208-abc2-e477e261c1ba	000c0000-5601-0208-c4a8-e9cf614986a9	00090000-5601-0207-4870-81cd136e1f0f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5601-0208-5e3e-69a667a0783d	00180000-5601-0208-abc2-e477e261c1ba	000c0000-5601-0208-910d-ddf6c5f76f12	00090000-5601-0207-1916-48ebf31912bd	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5601-0208-ebfa-9775b7c170cf	00180000-5601-0208-c994-9b17f3a2003d	\N	00090000-5601-0207-1916-48ebf31912bd	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3015 (class 0 OID 20354715)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-5601-0206-d76d-855086cfa1cd	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-5601-0206-d361-27945e81ef12	02	Priredba	Priredba	Priredba	umetnik
000f0000-5601-0206-4070-92de0dec6888	03	Prevod	Prevod	Prevod	umetnik
000f0000-5601-0206-b03a-dd5ba732e6b8	04	Režija	Režija	Režija	umetnik
000f0000-5601-0206-e43f-0e619adce37f	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-5601-0206-49c2-3d521bb5da6b	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-5601-0206-d6b3-92cd55b0502b	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-5601-0206-8070-7b985a885691	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-5601-0206-8b2e-98c47dbaff2e	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-5601-0206-4105-d6f9ea7b4dfe	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-5601-0206-93cc-fe4fd7f02f84	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-5601-0206-7088-66485f9ee983	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-5601-0206-6377-7ae9b2890f0d	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-5601-0206-e791-a05b41699b4a	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-5601-0206-a12d-e547398cb99b	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-5601-0206-40ee-46d447125c66	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-5601-0206-fe74-8e51a5ec6233	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-5601-0206-7def-d774cd8a9e0a	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3028 (class 0 OID 20354960)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5601-0206-379c-855110a91dbc	01	Velika predstava	f	1.00	1.00
002b0000-5601-0206-f567-a1ade1327969	02	Mala predstava	f	0.50	0.50
002b0000-5601-0206-1ad2-b4bff62e16c0	03	Mala koprodukcija	t	0.40	1.00
002b0000-5601-0206-c6bc-d7279239a9c7	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5601-0206-ce86-91aa3c07770d	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2981 (class 0 OID 20354358)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 20354205)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5601-0206-7153-29e4f9c497d6	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROTk/IdpIXVsg8bUqnoCVaKaQm4SxXWHa	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5601-0207-3afb-167511e4e982	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5601-0207-f201-5948376b712d	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5601-0207-7b89-2ef840e5c30f	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5601-0207-b8fa-ccc360179eb6	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5601-0207-b1b3-f9aa8e75f2b6	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5601-0207-be86-f0f61f4369fc	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5601-0207-653e-711b41daa2c8	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5601-0207-c427-a7602c4f97f9	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5601-0207-3bc5-e1d1d01c835a	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5601-0207-0b2a-05d02e884095	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5601-0206-6ca7-d1df800dae41	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3019 (class 0 OID 20354765)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5601-0207-3c94-be3942ef75c8	00160000-5601-0207-68cc-76dd4db4e053	\N	00140000-5601-0206-91e2-b3792fb9318c	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	\N	f	2				\N	f	\N	\N		00220000-5601-0207-be42-4c32e77a37e1
000e0000-5601-0207-4c99-f8d043f83b4c	00160000-5601-0207-495c-8fbb116c3dcf	\N	00140000-5601-0206-53c6-d82aac1842b9	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	\N	f	2				\N	f	\N	\N		00220000-5601-0207-2fbb-19fb40b3797c
000e0000-5601-0207-efe0-46d0d2bef91f	\N	\N	00140000-5601-0206-53c6-d82aac1842b9	00190000-5601-0207-6db5-31a4f2123fa3	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		00220000-5601-0207-be42-4c32e77a37e1
000e0000-5601-0207-5cea-785935bd4469	\N	\N	00140000-5601-0206-53c6-d82aac1842b9	00190000-5601-0207-6db5-31a4f2123fa3	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		00220000-5601-0207-be42-4c32e77a37e1
000e0000-5601-0207-c7ba-c44a7d57be24	\N	\N	00140000-5601-0206-53c6-d82aac1842b9	00190000-5601-0207-6db5-31a4f2123fa3	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		00220000-5601-0207-5c7a-c67f8aae8ada
000e0000-5601-0207-bae0-145b7ffbdf59	\N	\N	00140000-5601-0206-53c6-d82aac1842b9	00190000-5601-0207-6db5-31a4f2123fa3	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		00220000-5601-0207-5c7a-c67f8aae8ada
\.


--
-- TOC entry 2988 (class 0 OID 20354448)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-5601-0208-264a-e966a413e358	000e0000-5601-0207-4c99-f8d043f83b4c	\N	1	
00200000-5601-0208-150b-99c79ea9b2af	000e0000-5601-0207-4c99-f8d043f83b4c	\N	2	
00200000-5601-0208-6570-61baaf420ba8	000e0000-5601-0207-4c99-f8d043f83b4c	\N	3	
00200000-5601-0208-b590-fe2dcaeff940	000e0000-5601-0207-4c99-f8d043f83b4c	\N	4	
00200000-5601-0208-98b5-60fad2a95fa8	000e0000-5601-0207-4c99-f8d043f83b4c	\N	5	
\.


--
-- TOC entry 3002 (class 0 OID 20354576)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 20354689)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5601-0206-5cf2-b169a031cea0	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5601-0206-ffea-119d32cb21bf	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5601-0206-b1ea-caa901029044	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5601-0206-d724-fbc75623020d	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5601-0206-2bc7-bb47872606a3	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5601-0206-e26a-c54fae40fe33	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5601-0206-a92b-d8470eeaaf10	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5601-0206-3bc5-0081a7b254cb	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5601-0206-0146-bbb2f5f02d46	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5601-0206-8206-3e1e7a7349b0	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5601-0206-4f38-e4ef57ee23a8	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5601-0206-065e-9d11df081ffe	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5601-0206-ffd5-94b1f820bd79	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5601-0206-f099-817e499c3ba7	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5601-0206-9f2d-89dd14f6dcb2	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5601-0206-fd35-58fdbf943426	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5601-0206-e97d-e0f224171166	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5601-0206-890c-2baed5a506ba	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5601-0206-f321-b3f8e1c6c80e	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5601-0206-a1b1-6219ecea8d3f	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5601-0206-0dbc-364fa2fb39ca	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5601-0206-7118-fd96800f1f44	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5601-0206-dd4e-200f872d2fe5	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5601-0206-e664-0f0839221965	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5601-0206-3b92-885e39fa7c74	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5601-0206-0bc1-2c770ddda9b4	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5601-0206-d846-8e5f1256cbb9	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5601-0206-2d70-e4016970b822	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3031 (class 0 OID 20355007)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 20354979)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 20355019)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 20354648)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-5601-0207-2c41-227001bf43c1	00090000-5601-0207-f1b5-b740bf7693b3	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-5601-0207-c35f-da71c6802154	00090000-5601-0207-d536-71cba2960524	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-5601-0207-7208-136e8653a874	00090000-5601-0207-53c0-8ca5efc801f8	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-5601-0207-5038-294d62a797aa	00090000-5601-0207-d184-acd4231dfca1	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-5601-0207-1398-8f1e4e425593	00090000-5601-0207-dbdf-79670dd1c44d	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-5601-0207-5363-50a269c388a3	00090000-5601-0207-d6a6-ecb6fe1ffa62	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2990 (class 0 OID 20354484)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 20354755)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5601-0206-91e2-b3792fb9318c	01	Drama	drama (SURS 01)
00140000-5601-0206-4c8d-1c59db63dab3	02	Opera	opera (SURS 02)
00140000-5601-0206-9cc3-644419e10359	03	Balet	balet (SURS 03)
00140000-5601-0206-9b97-69c41e1bd58e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5601-0206-9782-d51251e87f7c	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5601-0206-53c6-d82aac1842b9	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5601-0206-70dc-4bfb80df3cb7	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3008 (class 0 OID 20354638)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2495 (class 2606 OID 20354259)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 20354814)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 20354804)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 20354672)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 20354713)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 20355059)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 20354473)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 20354494)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 20354977)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 20354384)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 20354869)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 20354634)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 20354446)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 20354422)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 20354398)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 20354541)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 20355036)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 20355043)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2749 (class 2606 OID 20355067)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 19946842)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2607 (class 2606 OID 20354568)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 20354356)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 20354268)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 20354292)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 20354248)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2486 (class 2606 OID 20354233)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 20354574)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 20354610)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 20354750)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 20354320)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 20354344)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 20354930)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 20354547)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 20354334)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 20354434)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 20354559)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 20354939)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 20354947)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 20354917)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 20354958)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 20354592)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 20354532)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 20354523)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 20354737)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 20354665)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 20354410)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 20354204)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 20354601)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 20354222)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2488 (class 2606 OID 20354242)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 20354619)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 20354554)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 20354503)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 20354192)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 20354180)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 20354174)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 20354685)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 20354301)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 20354514)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 20354724)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 20354970)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 20354369)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 20354217)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 20354783)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 20354456)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 20354582)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 20354697)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 20355017)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 20355001)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 20355025)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 20354656)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 20354488)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 20354763)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 20354646)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 1259 OID 20354482)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2560 (class 1259 OID 20354483)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2561 (class 1259 OID 20354481)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2562 (class 1259 OID 20354480)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2563 (class 1259 OID 20354479)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2649 (class 1259 OID 20354686)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2650 (class 1259 OID 20354687)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2651 (class 1259 OID 20354688)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2735 (class 1259 OID 20355038)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2736 (class 1259 OID 20355037)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2509 (class 1259 OID 20354322)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2608 (class 1259 OID 20354575)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2722 (class 1259 OID 20355005)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2723 (class 1259 OID 20355004)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2724 (class 1259 OID 20355006)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2725 (class 1259 OID 20355003)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2726 (class 1259 OID 20355002)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2602 (class 1259 OID 20354561)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2603 (class 1259 OID 20354560)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2554 (class 1259 OID 20354457)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2632 (class 1259 OID 20354635)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2633 (class 1259 OID 20354637)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2634 (class 1259 OID 20354636)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2534 (class 1259 OID 20354400)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2535 (class 1259 OID 20354399)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2713 (class 1259 OID 20354959)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2665 (class 1259 OID 20354752)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2666 (class 1259 OID 20354753)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2667 (class 1259 OID 20354754)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2732 (class 1259 OID 20355026)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2674 (class 1259 OID 20354788)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2675 (class 1259 OID 20354785)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2676 (class 1259 OID 20354789)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2677 (class 1259 OID 20354787)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2678 (class 1259 OID 20354786)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2524 (class 1259 OID 20354371)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2525 (class 1259 OID 20354370)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2500 (class 1259 OID 20354295)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2620 (class 1259 OID 20354602)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2490 (class 1259 OID 20354249)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2491 (class 1259 OID 20354250)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2625 (class 1259 OID 20354622)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2626 (class 1259 OID 20354621)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2627 (class 1259 OID 20354620)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2547 (class 1259 OID 20354435)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2548 (class 1259 OID 20354436)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2470 (class 1259 OID 20354182)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2582 (class 1259 OID 20354527)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2583 (class 1259 OID 20354525)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2584 (class 1259 OID 20354524)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2585 (class 1259 OID 20354526)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2481 (class 1259 OID 20354223)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2482 (class 1259 OID 20354224)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2611 (class 1259 OID 20354583)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 20355060)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2647 (class 1259 OID 20354674)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2648 (class 1259 OID 20354673)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2746 (class 1259 OID 20355068)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2747 (class 1259 OID 20355069)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2597 (class 1259 OID 20354548)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2641 (class 1259 OID 20354666)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2642 (class 1259 OID 20354667)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2695 (class 1259 OID 20354874)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2696 (class 1259 OID 20354873)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2697 (class 1259 OID 20354870)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2698 (class 1259 OID 20354871)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2699 (class 1259 OID 20354872)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2513 (class 1259 OID 20354336)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2514 (class 1259 OID 20354335)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2515 (class 1259 OID 20354337)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2614 (class 1259 OID 20354596)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2615 (class 1259 OID 20354595)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2705 (class 1259 OID 20354940)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2706 (class 1259 OID 20354941)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2688 (class 1259 OID 20354818)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2689 (class 1259 OID 20354819)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2690 (class 1259 OID 20354816)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2691 (class 1259 OID 20354817)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2638 (class 1259 OID 20354657)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2588 (class 1259 OID 20354536)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2589 (class 1259 OID 20354535)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2590 (class 1259 OID 20354533)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2591 (class 1259 OID 20354534)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2684 (class 1259 OID 20354806)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2685 (class 1259 OID 20354805)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2538 (class 1259 OID 20354411)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2541 (class 1259 OID 20354425)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2542 (class 1259 OID 20354424)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2543 (class 1259 OID 20354423)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2544 (class 1259 OID 20354426)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2553 (class 1259 OID 20354447)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2702 (class 1259 OID 20354931)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2721 (class 1259 OID 20354978)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2739 (class 1259 OID 20355044)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2740 (class 1259 OID 20355045)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2496 (class 1259 OID 20354270)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2497 (class 1259 OID 20354269)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2505 (class 1259 OID 20354302)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2506 (class 1259 OID 20354303)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2569 (class 1259 OID 20354489)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2577 (class 1259 OID 20354517)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2578 (class 1259 OID 20354516)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2579 (class 1259 OID 20354515)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2564 (class 1259 OID 20354475)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2565 (class 1259 OID 20354476)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2566 (class 1259 OID 20354474)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2567 (class 1259 OID 20354478)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2568 (class 1259 OID 20354477)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2512 (class 1259 OID 20354321)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2530 (class 1259 OID 20354385)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2531 (class 1259 OID 20354387)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2532 (class 1259 OID 20354386)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2533 (class 1259 OID 20354388)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2596 (class 1259 OID 20354542)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2670 (class 1259 OID 20354751)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2679 (class 1259 OID 20354784)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 20354725)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2662 (class 1259 OID 20354726)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2503 (class 1259 OID 20354293)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2504 (class 1259 OID 20354294)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2635 (class 1259 OID 20354647)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 20354193)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2523 (class 1259 OID 20354357)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2473 (class 1259 OID 20354181)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2718 (class 1259 OID 20354971)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2618 (class 1259 OID 20354594)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2619 (class 1259 OID 20354593)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2692 (class 1259 OID 20354815)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 20354345)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2671 (class 1259 OID 20354764)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2729 (class 1259 OID 20355018)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2711 (class 1259 OID 20354948)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2712 (class 1259 OID 20354949)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2658 (class 1259 OID 20354714)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2576 (class 1259 OID 20354504)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2489 (class 1259 OID 20354243)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2776 (class 2606 OID 20355200)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2777 (class 2606 OID 20355205)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2781 (class 2606 OID 20355225)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2775 (class 2606 OID 20355195)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2779 (class 2606 OID 20355215)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2780 (class 2606 OID 20355220)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2778 (class 2606 OID 20355210)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2814 (class 2606 OID 20355390)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2815 (class 2606 OID 20355395)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2816 (class 2606 OID 20355400)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2849 (class 2606 OID 20355565)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2848 (class 2606 OID 20355560)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2761 (class 2606 OID 20355125)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2798 (class 2606 OID 20355310)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2845 (class 2606 OID 20355545)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2844 (class 2606 OID 20355540)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2846 (class 2606 OID 20355550)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2843 (class 2606 OID 20355535)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2842 (class 2606 OID 20355530)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2797 (class 2606 OID 20355305)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2796 (class 2606 OID 20355300)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2774 (class 2606 OID 20355190)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2806 (class 2606 OID 20355350)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2808 (class 2606 OID 20355360)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2807 (class 2606 OID 20355355)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2768 (class 2606 OID 20355160)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2767 (class 2606 OID 20355155)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2794 (class 2606 OID 20355290)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2840 (class 2606 OID 20355520)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2817 (class 2606 OID 20355405)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2818 (class 2606 OID 20355410)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2819 (class 2606 OID 20355415)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2847 (class 2606 OID 20355555)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2823 (class 2606 OID 20355435)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2820 (class 2606 OID 20355420)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2824 (class 2606 OID 20355440)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2822 (class 2606 OID 20355430)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2821 (class 2606 OID 20355425)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2766 (class 2606 OID 20355150)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2765 (class 2606 OID 20355145)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2758 (class 2606 OID 20355110)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2757 (class 2606 OID 20355105)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2802 (class 2606 OID 20355330)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2753 (class 2606 OID 20355085)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2754 (class 2606 OID 20355090)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2805 (class 2606 OID 20355345)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2804 (class 2606 OID 20355340)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2803 (class 2606 OID 20355335)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2771 (class 2606 OID 20355175)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2772 (class 2606 OID 20355180)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2750 (class 2606 OID 20355070)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2789 (class 2606 OID 20355265)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2787 (class 2606 OID 20355255)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2786 (class 2606 OID 20355250)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2788 (class 2606 OID 20355260)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2751 (class 2606 OID 20355075)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2752 (class 2606 OID 20355080)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2799 (class 2606 OID 20355315)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2852 (class 2606 OID 20355580)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2813 (class 2606 OID 20355385)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2812 (class 2606 OID 20355380)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2853 (class 2606 OID 20355585)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2854 (class 2606 OID 20355590)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2795 (class 2606 OID 20355295)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2810 (class 2606 OID 20355370)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2811 (class 2606 OID 20355375)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2835 (class 2606 OID 20355495)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2834 (class 2606 OID 20355490)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2831 (class 2606 OID 20355475)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2832 (class 2606 OID 20355480)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2833 (class 2606 OID 20355485)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2763 (class 2606 OID 20355135)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2762 (class 2606 OID 20355130)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2764 (class 2606 OID 20355140)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2801 (class 2606 OID 20355325)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2800 (class 2606 OID 20355320)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2837 (class 2606 OID 20355505)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2838 (class 2606 OID 20355510)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2829 (class 2606 OID 20355465)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2830 (class 2606 OID 20355470)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2827 (class 2606 OID 20355455)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2828 (class 2606 OID 20355460)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2809 (class 2606 OID 20355365)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2793 (class 2606 OID 20355285)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2792 (class 2606 OID 20355280)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2790 (class 2606 OID 20355270)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2791 (class 2606 OID 20355275)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2826 (class 2606 OID 20355450)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2825 (class 2606 OID 20355445)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2769 (class 2606 OID 20355165)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2770 (class 2606 OID 20355170)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2773 (class 2606 OID 20355185)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2836 (class 2606 OID 20355500)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2839 (class 2606 OID 20355515)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2841 (class 2606 OID 20355525)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2850 (class 2606 OID 20355570)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2851 (class 2606 OID 20355575)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2756 (class 2606 OID 20355100)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2755 (class 2606 OID 20355095)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2759 (class 2606 OID 20355115)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2760 (class 2606 OID 20355120)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2782 (class 2606 OID 20355230)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2785 (class 2606 OID 20355245)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2784 (class 2606 OID 20355240)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2783 (class 2606 OID 20355235)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-22 09:23:54 CEST

--
-- PostgreSQL database dump complete
--

