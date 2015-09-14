--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-14 12:42:27 CEST

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
-- TOC entry 3009 (class 0 OID 0)
-- Dependencies: 242
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 19177894)
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
-- TOC entry 226 (class 1259 OID 19178413)
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
-- TOC entry 225 (class 1259 OID 19178396)
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
-- TOC entry 219 (class 1259 OID 19178304)
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
-- TOC entry 240 (class 1259 OID 19178651)
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
-- TOC entry 195 (class 1259 OID 19178072)
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
-- TOC entry 197 (class 1259 OID 19178103)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 19178577)
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
-- TOC entry 190 (class 1259 OID 19178015)
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
-- TOC entry 227 (class 1259 OID 19178426)
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
-- TOC entry 213 (class 1259 OID 19178236)
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
-- TOC entry 193 (class 1259 OID 19178051)
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
-- TOC entry 191 (class 1259 OID 19178032)
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
-- TOC entry 202 (class 1259 OID 19178150)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 238 (class 1259 OID 19178632)
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
-- TOC entry 239 (class 1259 OID 19178644)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 19178666)
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
-- TOC entry 206 (class 1259 OID 19178175)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 19177989)
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
-- TOC entry 182 (class 1259 OID 19177903)
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
-- TOC entry 183 (class 1259 OID 19177914)
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
-- TOC entry 178 (class 1259 OID 19177868)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 19177887)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 19178182)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 19178216)
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
-- TOC entry 222 (class 1259 OID 19178345)
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
-- TOC entry 185 (class 1259 OID 19177947)
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
-- TOC entry 187 (class 1259 OID 19177981)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 170 (class 1259 OID 18175925)
-- Name: postavkac2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkac2 (
    id uuid NOT NULL,
    skupina integer NOT NULL,
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
-- TOC entry 229 (class 1259 OID 19178524)
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
-- TOC entry 203 (class 1259 OID 19178156)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 19177966)
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
-- TOC entry 192 (class 1259 OID 19178044)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 205 (class 1259 OID 19178168)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 19178538)
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
-- TOC entry 231 (class 1259 OID 19178548)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 19178481)
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
-- TOC entry 232 (class 1259 OID 19178556)
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
-- TOC entry 209 (class 1259 OID 19178197)
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
-- TOC entry 201 (class 1259 OID 19178141)
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
-- TOC entry 200 (class 1259 OID 19178131)
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
-- TOC entry 221 (class 1259 OID 19178334)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 19178271)
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
-- TOC entry 175 (class 1259 OID 19177839)
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
-- TOC entry 174 (class 1259 OID 19177837)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3010 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 19178210)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 19177877)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 19177861)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 19178224)
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
-- TOC entry 204 (class 1259 OID 19178162)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 19178108)
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
-- TOC entry 173 (class 1259 OID 19177826)
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
-- TOC entry 172 (class 1259 OID 19177818)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 19177813)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 19178281)
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
-- TOC entry 184 (class 1259 OID 19177939)
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
-- TOC entry 199 (class 1259 OID 19178118)
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
-- TOC entry 220 (class 1259 OID 19178322)
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
-- TOC entry 233 (class 1259 OID 19178566)
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
-- TOC entry 189 (class 1259 OID 19178001)
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
-- TOC entry 176 (class 1259 OID 19177848)
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
-- TOC entry 224 (class 1259 OID 19178371)
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
-- TOC entry 194 (class 1259 OID 19178062)
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
-- TOC entry 208 (class 1259 OID 19178189)
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
-- TOC entry 218 (class 1259 OID 19178295)
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
-- TOC entry 236 (class 1259 OID 19178612)
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
-- TOC entry 235 (class 1259 OID 19178584)
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
-- TOC entry 237 (class 1259 OID 19178624)
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
-- TOC entry 215 (class 1259 OID 19178261)
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
-- TOC entry 196 (class 1259 OID 19178098)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 19178361)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 19178251)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2194 (class 2604 OID 19177842)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2942 (class 0 OID 19177894)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 19178413)
-- Dependencies: 226
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55f6-a492-7d58-1dc7351f7fa4	000d0000-55f6-a491-236b-db7760458d8d	\N	00090000-55f6-a491-6333-c157856809c4	000b0000-55f6-a491-7b2a-292d45dd9955	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55f6-a492-666b-1d2626e900c4	000d0000-55f6-a491-0d89-34ee1e11b737	00100000-55f6-a492-7749-42daa907c3af	00090000-55f6-a491-8368-351d8095dc86	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55f6-a492-db69-51e174bbb2bd	000d0000-55f6-a491-343b-8ebcb4b6b286	00100000-55f6-a492-2411-cf726594f48a	00090000-55f6-a491-60ca-3589ab5cd7cf	\N	0003	t	\N	2015-09-14	\N	2	t	\N	f	f
000c0000-55f6-a492-bbf7-9efdb5305d95	000d0000-55f6-a491-ae6c-a09b06301de8	\N	00090000-55f6-a491-bc1d-fc164f7f426e	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55f6-a492-e1cc-8aed2607838b	000d0000-55f6-a491-7b01-8c85693ec667	\N	00090000-55f6-a491-8421-233552dd2d8c	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55f6-a492-408e-de4efc8ddf81	000d0000-55f6-a491-160a-f6d7d8e03269	\N	00090000-55f6-a491-9c6c-3a270bd7bdc4	000b0000-55f6-a491-72b1-27d9159a42b1	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55f6-a492-6266-93707947ab46	000d0000-55f6-a491-ed55-e645e74d6eec	00100000-55f6-a492-065c-b025ccd70a1d	00090000-55f6-a491-15fa-42d8c9e91669	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55f6-a492-7f3b-354f2e249714	000d0000-55f6-a491-1e5e-5a5f589d6c89	\N	00090000-55f6-a491-5768-57b57dfbaff7	000b0000-55f6-a491-5a14-a09aaf9ed46a	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55f6-a492-431f-d88d3e7e4f9c	000d0000-55f6-a491-ed55-e645e74d6eec	00100000-55f6-a492-32e1-5785e763d09c	00090000-55f6-a491-0042-b5b6d63bbfdb	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55f6-a492-e261-9e853eb7a189	000d0000-55f6-a491-ed55-e645e74d6eec	00100000-55f6-a492-8994-3cc87853f56a	00090000-55f6-a491-63e9-14a2245d7ed7	\N	0010	t	\N	2015-09-14	\N	16	f	\N	f	t
000c0000-55f6-a492-8d29-bc31dfa9d5fb	000d0000-55f6-a491-ed55-e645e74d6eec	00100000-55f6-a492-f3d4-72ed35bf378b	00090000-55f6-a491-a66e-afa4d58cf64c	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55f6-a492-c23f-5dee36a9bb96	000d0000-55f6-a491-538e-a8b6b3cc1d71	\N	00090000-55f6-a491-8368-351d8095dc86	000b0000-55f6-a491-1e38-1321bfa2e913	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 2986 (class 0 OID 19178396)
-- Dependencies: 225
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 19178304)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55f6-a491-485a-c5b43245069a	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55f6-a491-2e87-b2f77f2ee356	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55f6-a491-67f8-c4fefd1c8a7a	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3001 (class 0 OID 19178651)
-- Dependencies: 240
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2956 (class 0 OID 19178072)
-- Dependencies: 195
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55f6-a491-2bb4-8eacf6609fdd	\N	\N	00200000-55f6-a491-07ce-f9d25050f3fc	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-55f6-a491-d0f0-ee0ecd0b1417	\N	\N	00200000-55f6-a491-d095-dafe4ea73e8c	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-55f6-a491-1e86-997b2120b0f0	\N	\N	00200000-55f6-a491-c3d6-bd289b754ef7	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-55f6-a491-34bc-fd8cb91499e5	\N	\N	00200000-55f6-a491-12c8-ca760f97afc2	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-55f6-a491-b22e-fe08284e6352	\N	\N	00200000-55f6-a491-2a6c-76b8338b58d7	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2958 (class 0 OID 19178103)
-- Dependencies: 197
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 19178577)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 19178015)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55f6-a48f-a74c-cefca5cccf31	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55f6-a48f-6de8-250a3fe9958f	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55f6-a48f-608a-df5a899cf978	AL	ALB	008	Albania 	Albanija	\N
00040000-55f6-a48f-5186-4eae6636ea3b	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55f6-a48f-4b48-2f255356bb5b	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55f6-a48f-1b2b-6d34c76e9d1b	AD	AND	020	Andorra 	Andora	\N
00040000-55f6-a48f-8195-0c7f1f423428	AO	AGO	024	Angola 	Angola	\N
00040000-55f6-a48f-9eb2-c8af954b521f	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55f6-a48f-b1fb-4fd6ddba1e89	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55f6-a48f-b19f-fbfe5a78d1c3	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55f6-a48f-96d7-6bbc36497cdd	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55f6-a48f-ec59-77eb2c46962a	AM	ARM	051	Armenia 	Armenija	\N
00040000-55f6-a48f-c34c-040b79886cb6	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55f6-a48f-5dc8-5ab810d8e06c	AU	AUS	036	Australia 	Avstralija	\N
00040000-55f6-a48f-ea0a-202de2c17a5a	AT	AUT	040	Austria 	Avstrija	\N
00040000-55f6-a48f-f76a-00bf90a13341	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55f6-a48f-1ba3-d8f1137520ae	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55f6-a48f-3ef0-7e083a2d9d2f	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55f6-a48f-8daf-f7d986d05f62	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55f6-a48f-0448-ca078b55e098	BB	BRB	052	Barbados 	Barbados	\N
00040000-55f6-a48f-5fe5-6a0105628c43	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55f6-a48f-b311-fed4bd195f8d	BE	BEL	056	Belgium 	Belgija	\N
00040000-55f6-a48f-a2a8-75799d57ee33	BZ	BLZ	084	Belize 	Belize	\N
00040000-55f6-a48f-1f82-4adf07842449	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55f6-a48f-cc7e-47abe96794dc	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55f6-a48f-3b3b-1900f36474dd	BT	BTN	064	Bhutan 	Butan	\N
00040000-55f6-a48f-2058-3d0fff593365	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55f6-a48f-2430-b69f08ca9b68	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55f6-a48f-3695-64d7f9531876	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55f6-a48f-c0e1-8b8d0fc46694	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55f6-a48f-8715-37e44f201ab2	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55f6-a48f-aa0c-ecacf76aab4b	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55f6-a48f-5f5b-b3bc4fb3ef82	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55f6-a48f-9dbd-8daa50247460	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55f6-a48f-2253-87f9956b2388	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55f6-a48f-de2e-dbe59fa7c150	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55f6-a48f-8394-d269722cb108	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55f6-a48f-f167-af04258641ac	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55f6-a48f-8dd4-072e49725961	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55f6-a48f-0649-9775d1bd7f09	CA	CAN	124	Canada 	Kanada	\N
00040000-55f6-a48f-341c-fcce6e24f660	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55f6-a48f-d35d-7c8d12cec1ce	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55f6-a48f-a88a-6aad721c49d1	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55f6-a48f-991a-240ba3e4b778	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55f6-a48f-61ee-36d1aabbe57d	CL	CHL	152	Chile 	Čile	\N
00040000-55f6-a48f-5ff3-8ceb815cb8a7	CN	CHN	156	China 	Kitajska	\N
00040000-55f6-a48f-ac6d-def567b278cd	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55f6-a48f-3cdf-98de506876dd	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55f6-a48f-f9a1-6811cb2edfc3	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55f6-a48f-3d4f-a9f651a9a115	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55f6-a48f-5974-5341e894a94b	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55f6-a48f-3997-0b34daa50729	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55f6-a48f-22f9-3794babb6d63	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55f6-a48f-0b93-ea4c7abac23d	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55f6-a48f-b756-c6f03fdd848b	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55f6-a48f-40ed-e9fa254113a3	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55f6-a48f-1af7-d0d000046fda	CU	CUB	192	Cuba 	Kuba	\N
00040000-55f6-a48f-322a-2fb011b7019e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55f6-a48f-2d4c-48b2de274920	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55f6-a48f-abc7-7c1396e0c5e6	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55f6-a48f-1f57-b02c390b372d	DK	DNK	208	Denmark 	Danska	\N
00040000-55f6-a48f-6261-0ba09f803678	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55f6-a48f-e33d-11e515b1b104	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55f6-a48f-6d9c-dba45246917a	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55f6-a48f-fff5-b03bc985aa35	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55f6-a48f-425e-5bda694d7819	EG	EGY	818	Egypt 	Egipt	\N
00040000-55f6-a48f-4f35-41c5f3a8d21c	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55f6-a48f-0c89-d2aa158ab512	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55f6-a48f-9223-ae6b2baef9b9	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55f6-a48f-f669-ee531e9ab009	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55f6-a48f-25ab-43a1348988b9	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55f6-a48f-599c-5a3466414144	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55f6-a48f-514a-f5f0caf2ab35	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55f6-a48f-33ae-7660f05661a1	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55f6-a48f-29c9-0fc085664220	FI	FIN	246	Finland 	Finska	\N
00040000-55f6-a48f-fef8-c6bde3b0bbb9	FR	FRA	250	France 	Francija	\N
00040000-55f6-a48f-bece-266a42ed407f	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55f6-a48f-8985-fc72ee5e74db	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55f6-a48f-b8b3-747e61bf9746	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55f6-a48f-4939-c1e1e75cd037	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55f6-a48f-c527-bcbce34afd73	GA	GAB	266	Gabon 	Gabon	\N
00040000-55f6-a48f-d615-9b4b2e11c4d8	GM	GMB	270	Gambia 	Gambija	\N
00040000-55f6-a48f-9f46-2e8506560ba5	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55f6-a48f-b3d5-6f65b099f14d	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55f6-a48f-ef46-c9b6b64efc8a	GH	GHA	288	Ghana 	Gana	\N
00040000-55f6-a48f-2306-60ff49a1cd5b	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55f6-a48f-b383-ebae1cadc459	GR	GRC	300	Greece 	Grčija	\N
00040000-55f6-a48f-c51d-94c65d3c64f2	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55f6-a48f-e2bd-10cae913560d	GD	GRD	308	Grenada 	Grenada	\N
00040000-55f6-a48f-2dd4-247b5d6b44cb	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55f6-a48f-51bb-08eaabf97d45	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55f6-a48f-9c54-171fe6e5a170	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55f6-a48f-5bca-fecfbc163807	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55f6-a48f-7fb3-9086f20c6fe2	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55f6-a48f-07de-03beafebb8fb	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55f6-a48f-902e-366842f904b6	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55f6-a48f-55fb-e81cd9a614fe	HT	HTI	332	Haiti 	Haiti	\N
00040000-55f6-a48f-f69b-f8e1fde58309	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55f6-a48f-c4dc-73700451403a	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55f6-a48f-1bed-dd20f5a5ca66	HN	HND	340	Honduras 	Honduras	\N
00040000-55f6-a48f-2c6b-9d7e89cd3b7d	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55f6-a48f-8d2a-fd1a6efa6e1e	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55f6-a48f-61c8-641a5dd94915	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55f6-a48f-012e-a8bb2c7548f3	IN	IND	356	India 	Indija	\N
00040000-55f6-a48f-5675-274d5d57473c	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55f6-a48f-7192-74d5c4f773a9	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55f6-a48f-9c5b-bb95ae350579	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55f6-a48f-c0dc-b06a03440e89	IE	IRL	372	Ireland 	Irska	\N
00040000-55f6-a48f-dcf0-873b6490241c	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55f6-a48f-7bb0-a63efd8cfed1	IL	ISR	376	Israel 	Izrael	\N
00040000-55f6-a48f-3bb5-44cab5fa5b66	IT	ITA	380	Italy 	Italija	\N
00040000-55f6-a48f-974f-c05bbdd340a7	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55f6-a48f-4ce6-7c17777ae4d2	JP	JPN	392	Japan 	Japonska	\N
00040000-55f6-a48f-f1ca-e7252da08b07	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55f6-a48f-8bdb-da73ff22d1d0	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55f6-a48f-17d7-d2b8f4ce7503	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55f6-a48f-ab01-c633425829b4	KE	KEN	404	Kenya 	Kenija	\N
00040000-55f6-a48f-15b0-ade9e4c04f7b	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55f6-a48f-0ab3-eff7601f4371	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55f6-a48f-030a-32a316e5e67d	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55f6-a48f-12fd-e2187e85a1ae	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55f6-a48f-9f3e-7cdb70f0aa4b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55f6-a48f-c81c-43a189376557	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55f6-a48f-6597-e374c361d151	LV	LVA	428	Latvia 	Latvija	\N
00040000-55f6-a48f-7d3d-405138c1f865	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55f6-a48f-9d01-95fb195015ff	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55f6-a48f-a577-049871164f49	LR	LBR	430	Liberia 	Liberija	\N
00040000-55f6-a48f-28a1-7fca1fbfc837	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55f6-a48f-ca48-b32388b19de1	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55f6-a48f-36ca-613d6689dce8	LT	LTU	440	Lithuania 	Litva	\N
00040000-55f6-a48f-e98c-af0b63b365fa	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55f6-a48f-6924-b9ef8aad60fb	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55f6-a48f-eb8a-bbca521e2014	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55f6-a48f-9e60-d77679cca3ee	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55f6-a48f-8217-c31af4a79ae0	MW	MWI	454	Malawi 	Malavi	\N
00040000-55f6-a48f-9921-f8c9e799e1c3	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55f6-a48f-ad2c-8b3cd0e4e956	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55f6-a48f-7e4b-2d4a5ec17351	ML	MLI	466	Mali 	Mali	\N
00040000-55f6-a48f-4d98-209f05ba5fd0	MT	MLT	470	Malta 	Malta	\N
00040000-55f6-a48f-1b6d-c795593a32db	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55f6-a48f-ece2-8e07d5f51a48	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55f6-a48f-3a08-ded4dfc99434	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55f6-a48f-d20d-26ce4cfb35b6	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55f6-a48f-3739-ccd3288691e0	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55f6-a48f-1d38-b008047a9c68	MX	MEX	484	Mexico 	Mehika	\N
00040000-55f6-a48f-07f9-f3738c549065	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55f6-a48f-291e-dafeb29acf7d	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55f6-a48f-8349-79fd3eaad32d	MC	MCO	492	Monaco 	Monako	\N
00040000-55f6-a48f-b3f4-c3ef7da2172b	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55f6-a48f-0a0a-3ac53bb82684	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55f6-a48f-42a0-b25a83e7ea65	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55f6-a48f-9395-28ed553138fc	MA	MAR	504	Morocco 	Maroko	\N
00040000-55f6-a48f-b309-eef83f49740d	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55f6-a48f-6c7f-12322c9bb6d2	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55f6-a48f-d981-8e15a0eef772	NA	NAM	516	Namibia 	Namibija	\N
00040000-55f6-a48f-a38a-ac71eab4df13	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55f6-a48f-7edf-adb51e0c1d7d	NP	NPL	524	Nepal 	Nepal	\N
00040000-55f6-a48f-ff58-5cdac62a30ef	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55f6-a48f-891b-f3aa91731848	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55f6-a48f-8652-da5f0811a10c	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55f6-a48f-fd31-688f7c1a3175	NE	NER	562	Niger 	Niger 	\N
00040000-55f6-a48f-5429-2d22bd008d22	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55f6-a48f-47ba-5b6ea4045430	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55f6-a48f-d179-d137721dbf89	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55f6-a48f-75fd-864575981b9b	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55f6-a48f-ce12-eae7becdf101	NO	NOR	578	Norway 	Norveška	\N
00040000-55f6-a48f-7803-a6b8b51dca04	OM	OMN	512	Oman 	Oman	\N
00040000-55f6-a48f-cce6-6ad427fd9501	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55f6-a48f-3593-e7670e579005	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55f6-a48f-6f9d-fd196c73459d	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55f6-a48f-a160-82ee9a87236a	PA	PAN	591	Panama 	Panama	\N
00040000-55f6-a48f-61ce-6d18594b7dd5	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55f6-a48f-f1aa-70ce72f0630b	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55f6-a48f-9554-6686bec1a5a0	PE	PER	604	Peru 	Peru	\N
00040000-55f6-a48f-a16a-38fc75fa85a7	PH	PHL	608	Philippines 	Filipini	\N
00040000-55f6-a48f-36d5-4e6d86aaa9cb	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55f6-a48f-cc31-a245e0261868	PL	POL	616	Poland 	Poljska	\N
00040000-55f6-a48f-3b2b-c2c61115a8e6	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55f6-a48f-63df-cebbe44965f0	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55f6-a48f-fef8-0a2f8a55c834	QA	QAT	634	Qatar 	Katar	\N
00040000-55f6-a48f-c45e-563a104ab29e	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55f6-a48f-1289-0ae5838d8a45	RO	ROU	642	Romania 	Romunija	\N
00040000-55f6-a48f-750a-2641c3a25c16	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55f6-a48f-c800-089c68157348	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55f6-a48f-89cf-49af195563f1	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55f6-a48f-9999-26bafdf3806f	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55f6-a48f-138d-79abbc61c478	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55f6-a48f-b67e-1a6cd087210f	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55f6-a48f-181f-a1d4595ee996	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55f6-a48f-f440-1cc4f1030d96	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55f6-a48f-dd9e-67b2307a7888	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55f6-a48f-eb49-c6710ac40117	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55f6-a48f-832e-3b71c5651a42	SM	SMR	674	San Marino 	San Marino	\N
00040000-55f6-a48f-18f8-b1b865e154a7	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55f6-a48f-e549-2e258b2fac02	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55f6-a48f-a433-24df50ed0f26	SN	SEN	686	Senegal 	Senegal	\N
00040000-55f6-a48f-26a8-b172a0c03160	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55f6-a48f-0343-50814537c4a3	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55f6-a48f-e22c-7da89619fda0	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55f6-a48f-2e7b-54346d1f06be	SG	SGP	702	Singapore 	Singapur	\N
00040000-55f6-a48f-0d40-932f6eeacbcd	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55f6-a48f-9341-d77b5873d5ae	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55f6-a48f-bd8c-829658f00c6e	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55f6-a48f-94fc-84e18d36451e	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55f6-a48f-001a-cbd32dd1df76	SO	SOM	706	Somalia 	Somalija	\N
00040000-55f6-a48f-a5fc-9823536144e4	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55f6-a48f-9946-14d28e41594c	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55f6-a48f-ab42-34bc778afb47	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55f6-a48f-9380-d3e8aa596348	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55f6-a48f-3280-fa05dbbef867	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55f6-a48f-e852-5cf761eae28b	SD	SDN	729	Sudan 	Sudan	\N
00040000-55f6-a48f-aadf-5e5c497e1217	SR	SUR	740	Suriname 	Surinam	\N
00040000-55f6-a48f-a948-19ab0df5b351	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55f6-a48f-1ae4-eba843d69b0e	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55f6-a48f-151d-4014e0ffabbd	SE	SWE	752	Sweden 	Švedska	\N
00040000-55f6-a48f-0e7f-85f95f62ec21	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55f6-a48f-78c2-e41154737f8b	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55f6-a48f-6695-62dafe751bd0	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55f6-a48f-edfb-0fc828ab11ce	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55f6-a48f-f640-1fa7d76e13ef	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55f6-a48f-3c93-fb3979176adc	TH	THA	764	Thailand 	Tajska	\N
00040000-55f6-a48f-e185-dc6027b3ba08	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55f6-a48f-b1d2-bd3a4eae492c	TG	TGO	768	Togo 	Togo	\N
00040000-55f6-a48f-8112-2a7769879185	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55f6-a48f-d18a-58f1c7f8e230	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55f6-a48f-c7fb-368c7bb6df54	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55f6-a48f-a335-6e028853ba34	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55f6-a48f-da9f-d2e658dbd9ce	TR	TUR	792	Turkey 	Turčija	\N
00040000-55f6-a48f-f7e1-88b8b9fbf09c	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55f6-a48f-807d-490082c6b42b	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f6-a48f-ee5e-beb184a8d639	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55f6-a48f-5589-ebe1427d2195	UG	UGA	800	Uganda 	Uganda	\N
00040000-55f6-a48f-bc89-0cef510fef31	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55f6-a48f-ca0f-2a310cb29aa7	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55f6-a48f-4b73-6c31fa97a25d	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55f6-a48f-2e66-0b33d43bbdb7	US	USA	840	United States 	Združene države Amerike	\N
00040000-55f6-a48f-ccc7-df14d62717b2	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55f6-a48f-afc7-2a53bc3776f6	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55f6-a48f-08ac-1d44b08a8899	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55f6-a48f-ddb9-8dd9171ae8ef	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55f6-a48f-cfa4-ef033d44a79d	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55f6-a48f-b95d-f134e1f8f793	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55f6-a48f-e7ff-4975c8618402	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55f6-a48f-4d4f-b9784fcaec42	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55f6-a48f-83dd-c68e9984f6ff	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55f6-a48f-7521-4a9cea247bb8	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55f6-a48f-6aac-9b37c0c2a856	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55f6-a48f-9e41-ff2a33a85f1c	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55f6-a48f-fea6-270ac9211f31	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2988 (class 0 OID 19178426)
-- Dependencies: 227
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55f6-a491-6918-abd0e1859282	000e0000-55f6-a491-018b-7df3d334c2c3	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f6-a48f-fc86-83f1ceedcaf0	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f6-a491-64b9-901953245f7c	000e0000-55f6-a491-88da-90a4dde146b1	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f6-a48f-13c9-3640b6b1145f	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55f6-a491-b45b-f267713e3d69	000e0000-55f6-a491-dc94-64b5a85c0b08	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55f6-a48f-fc86-83f1ceedcaf0	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f6-a492-b771-db37d0aacd91	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55f6-a492-8716-82c51aae84b3	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2974 (class 0 OID 19178236)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55f6-a491-236b-db7760458d8d	000e0000-55f6-a491-88da-90a4dde146b1	000c0000-55f6-a492-7d58-1dc7351f7fa4	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55f6-a48f-25f8-52d4054974ba
000d0000-55f6-a491-0d89-34ee1e11b737	000e0000-55f6-a491-88da-90a4dde146b1	000c0000-55f6-a492-666b-1d2626e900c4	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55f6-a48f-b225-49a3ca349da8
000d0000-55f6-a491-343b-8ebcb4b6b286	000e0000-55f6-a491-88da-90a4dde146b1	000c0000-55f6-a492-db69-51e174bbb2bd	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55f6-a48f-44e9-cb8cbed1e46a
000d0000-55f6-a491-ae6c-a09b06301de8	000e0000-55f6-a491-88da-90a4dde146b1	000c0000-55f6-a492-bbf7-9efdb5305d95	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55f6-a48f-a6db-50fa13aeb049
000d0000-55f6-a491-7b01-8c85693ec667	000e0000-55f6-a491-88da-90a4dde146b1	000c0000-55f6-a492-e1cc-8aed2607838b	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55f6-a48f-a6db-50fa13aeb049
000d0000-55f6-a491-160a-f6d7d8e03269	000e0000-55f6-a491-88da-90a4dde146b1	000c0000-55f6-a492-408e-de4efc8ddf81	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55f6-a48f-25f8-52d4054974ba
000d0000-55f6-a491-ed55-e645e74d6eec	000e0000-55f6-a491-88da-90a4dde146b1	000c0000-55f6-a492-431f-d88d3e7e4f9c	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55f6-a48f-25f8-52d4054974ba
000d0000-55f6-a491-1e5e-5a5f589d6c89	000e0000-55f6-a491-88da-90a4dde146b1	000c0000-55f6-a492-7f3b-354f2e249714	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55f6-a48f-e68a-f0d853b36807
000d0000-55f6-a491-538e-a8b6b3cc1d71	000e0000-55f6-a491-88da-90a4dde146b1	000c0000-55f6-a492-c23f-5dee36a9bb96	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55f6-a48f-b23a-9e3ba7a3ef75
\.


--
-- TOC entry 2954 (class 0 OID 19178051)
-- Dependencies: 193
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 19178032)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55f6-a491-239f-58b0f9341fb7	00080000-55f6-a491-af59-014faae9bb19	00090000-55f6-a491-63e9-14a2245d7ed7	AK		igralka
\.


--
-- TOC entry 2963 (class 0 OID 19178150)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 19178632)
-- Dependencies: 238
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 19178644)
-- Dependencies: 239
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 19178666)
-- Dependencies: 241
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 19178175)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 19177989)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55f6-a490-1ada-aafdb2eb591d	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55f6-a490-da48-794b4e67b4a2	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55f6-a490-d1f1-c947c94b4e8b	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55f6-a490-0068-95af15e38679	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55f6-a490-79a5-fd3e9882fec9	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55f6-a490-9f16-cdae0341eb9b	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}s:4:"500s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55f6-a490-1d4b-534223b14181	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55f6-a490-c66a-2cf969078e83	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f6-a490-4801-3125c2c22ba3	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55f6-a490-2e98-13363861ddc3	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55f6-a490-90db-449507d40f3d	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55f6-a490-5607-52f395e59035	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55f6-a490-2a5a-105dedb20fd0	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55f6-a490-3710-a48ab85517f1	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55f6-a491-847c-b776ae224a49	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55f6-a491-3a24-90af4b51de60	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55f6-a491-ba72-cf4035e1d822	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55f6-a491-cc66-3c71b192f913	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55f6-a491-fcb8-08f009a2fba7	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55f6-a493-412a-ee2fa63a7eb6	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2943 (class 0 OID 19177903)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55f6-a491-8e0d-46b27139352b	00000000-55f6-a491-847c-b776ae224a49	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55f6-a491-e08f-2b92e481d664	00000000-55f6-a491-847c-b776ae224a49	00010000-55f6-a490-30ee-5f3b926dc639	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55f6-a491-d992-72e59303c33e	00000000-55f6-a491-3a24-90af4b51de60	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2944 (class 0 OID 19177914)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55f6-a491-6333-c157856809c4	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55f6-a491-bc1d-fc164f7f426e	00010000-55f6-a491-b2b9-f0b233243873	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55f6-a491-60ca-3589ab5cd7cf	00010000-55f6-a491-c7af-3ea4ebdeeabf	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55f6-a491-0042-b5b6d63bbfdb	00010000-55f6-a491-66ce-bfc4ec196b41	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55f6-a491-1325-d8268d46ffbd	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55f6-a491-9c6c-3a270bd7bdc4	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55f6-a491-a66e-afa4d58cf64c	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55f6-a491-15fa-42d8c9e91669	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55f6-a491-63e9-14a2245d7ed7	00010000-55f6-a491-e887-477d218fcc1f	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55f6-a491-8368-351d8095dc86	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55f6-a491-0ee7-78e882a611a0	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55f6-a491-8421-233552dd2d8c	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55f6-a491-5768-57b57dfbaff7	00010000-55f6-a491-6b20-8ac90367095b	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2939 (class 0 OID 19177868)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55f6-a48f-e060-a67ff38b103b	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55f6-a48f-f134-9929160665a5	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55f6-a48f-3ac8-feeeb1d4c297	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55f6-a48f-c8bf-0708fa676704	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55f6-a48f-fd16-6a0485c695e9	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55f6-a48f-a81a-89a78ff3f4a7	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55f6-a48f-019a-c2dd7a26aadd	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55f6-a48f-9a6d-b53b89f82740	Abonma-read	Abonma - branje	f
00030000-55f6-a48f-8e37-56f0005570f9	Abonma-write	Abonma - spreminjanje	f
00030000-55f6-a48f-92b7-73cd3ce054c5	Alternacija-read	Alternacija - branje	f
00030000-55f6-a48f-8eb7-b32a750a5506	Alternacija-write	Alternacija - spreminjanje	f
00030000-55f6-a48f-48b4-f69e2401e38c	Arhivalija-read	Arhivalija - branje	f
00030000-55f6-a48f-a18d-2fd149990a21	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55f6-a48f-251f-d643645af49d	Besedilo-read	Besedilo - branje	f
00030000-55f6-a48f-03a0-bb248890b207	Besedilo-write	Besedilo - spreminjanje	f
00030000-55f6-a48f-5f3f-f5d21e364a1f	DogodekIzven-read	DogodekIzven - branje	f
00030000-55f6-a48f-fafc-7f82a9d9dd51	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55f6-a48f-8a09-53a4b9c45501	Dogodek-read	Dogodek - branje	f
00030000-55f6-a48f-597b-7c5e6f97674b	Dogodek-write	Dogodek - spreminjanje	f
00030000-55f6-a48f-3ab9-ba5dbdc8ebcc	DrugiVir-read	DrugiVir - branje	f
00030000-55f6-a48f-8c43-99d58c41e03e	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55f6-a48f-ff9b-a0479618c662	Drzava-read	Drzava - branje	f
00030000-55f6-a48f-c446-2d8cbe2b08e7	Drzava-write	Drzava - spreminjanje	f
00030000-55f6-a48f-52c0-b95ca4d99e20	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55f6-a48f-68eb-8bf5965d9a7d	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55f6-a48f-554d-1d84db9dfc3a	Funkcija-read	Funkcija - branje	f
00030000-55f6-a48f-71bc-6ae436bf9c85	Funkcija-write	Funkcija - spreminjanje	f
00030000-55f6-a490-50eb-38258acc0d85	Gostovanje-read	Gostovanje - branje	f
00030000-55f6-a490-6849-d826b9f9662e	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55f6-a490-d32a-fb7c4c58eba4	Gostujoca-read	Gostujoca - branje	f
00030000-55f6-a490-e9a8-b4c22d775ada	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55f6-a490-7122-091c5809c8df	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55f6-a490-d4c1-2e97d6750a78	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55f6-a490-965d-9709a53d4157	Kupec-read	Kupec - branje	f
00030000-55f6-a490-3026-9b31eb4bafed	Kupec-write	Kupec - spreminjanje	f
00030000-55f6-a490-e995-c6382cc8c4e4	NacinPlacina-read	NacinPlacina - branje	f
00030000-55f6-a490-01f4-3557af9727a5	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55f6-a490-e9ee-f9bb348f4791	Option-read	Option - branje	f
00030000-55f6-a490-9d68-0c2bf61bf0e2	Option-write	Option - spreminjanje	f
00030000-55f6-a490-822d-86a710d7f0b3	OptionValue-read	OptionValue - branje	f
00030000-55f6-a490-b62a-bfa42a860087	OptionValue-write	OptionValue - spreminjanje	f
00030000-55f6-a490-606c-f01e9dc709e8	Oseba-read	Oseba - branje	f
00030000-55f6-a490-e3c9-9046806e7ea5	Oseba-write	Oseba - spreminjanje	f
00030000-55f6-a490-1f64-3ec32cfad246	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55f6-a490-5c73-b4b48991e056	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55f6-a490-fcea-d90b3c40ddbc	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55f6-a490-8375-e6d1d87e3fd7	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55f6-a490-0bef-52ff2f7b91c3	Pogodba-read	Pogodba - branje	f
00030000-55f6-a490-0084-da94d569b8fc	Pogodba-write	Pogodba - spreminjanje	f
00030000-55f6-a490-8c64-ab3e9bf6919e	Popa-read	Popa - branje	f
00030000-55f6-a490-a2d2-5346ea4fb255	Popa-write	Popa - spreminjanje	f
00030000-55f6-a490-d5bf-fd845d2ce420	Posta-read	Posta - branje	f
00030000-55f6-a490-0dd5-20f8fae745a7	Posta-write	Posta - spreminjanje	f
00030000-55f6-a490-1f81-f80bdbccdbc1	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-55f6-a490-448b-fd25b3aedf34	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-55f6-a490-c777-d2658ba49cbd	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55f6-a490-8aa7-e4a2d5133cce	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55f6-a490-d36c-d05ca1a9b657	PostniNaslov-read	PostniNaslov - branje	f
00030000-55f6-a490-9bc0-2d32979f4a1e	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55f6-a490-5682-5ee6178a0aba	Predstava-read	Predstava - branje	f
00030000-55f6-a490-d421-41b2e2b94ea3	Predstava-write	Predstava - spreminjanje	f
00030000-55f6-a490-daf5-840243839a23	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55f6-a490-10c0-f2238a18f002	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55f6-a490-2512-8b3c58712604	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55f6-a490-b369-28374e7466f4	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55f6-a490-7000-9a6f1adddd5b	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55f6-a490-5c67-b8e565cd8c27	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55f6-a490-95e5-ffd05cf09a2f	ProgramDela-read	ProgramDela - branje	f
00030000-55f6-a490-6ee0-55e8e8f0fd25	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55f6-a490-ee35-007588c5fe5c	ProgramFestival-read	ProgramFestival - branje	f
00030000-55f6-a490-af5d-433acdff4f33	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55f6-a490-6ccb-9ff06cd13c45	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55f6-a490-35ae-20eda0f5ae53	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55f6-a490-11a2-1c222804d68c	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55f6-a490-cabe-f5022187e429	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55f6-a490-de40-c19d3a76e030	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55f6-a490-1432-f9e21b91c8bb	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55f6-a490-9e18-141dcc5a5bbb	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55f6-a490-9fb2-5ebff7a1d84c	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55f6-a490-e229-207569206140	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55f6-a490-6dc4-3fd33f592b9e	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55f6-a490-6d7c-3c1db6fa39d7	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55f6-a490-8175-a559b2e16ae1	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55f6-a490-ffd1-13822729cd16	ProgramRazno-read	ProgramRazno - branje	f
00030000-55f6-a490-9024-4a0a8d4a5af1	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55f6-a490-e0ea-f7f28b7c4c43	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55f6-a490-d22b-3ccd40c67c44	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55f6-a490-354e-375afefb9006	Prostor-read	Prostor - branje	f
00030000-55f6-a490-c27c-ee8ce30e3f63	Prostor-write	Prostor - spreminjanje	f
00030000-55f6-a490-803c-cfe9c8111b37	Racun-read	Racun - branje	f
00030000-55f6-a490-3e9d-f126c683f56e	Racun-write	Racun - spreminjanje	f
00030000-55f6-a490-82e4-ad4029bd501a	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55f6-a490-b361-9013535c2a0a	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55f6-a490-42f1-9c968b0a5204	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55f6-a490-d9d9-10dcf5af02dd	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55f6-a490-9bd3-44a81315309b	Rekvizit-read	Rekvizit - branje	f
00030000-55f6-a490-e756-f59c1333f076	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55f6-a490-3782-389172bf9ea3	Revizija-read	Revizija - branje	f
00030000-55f6-a490-2e63-78dc0157edde	Revizija-write	Revizija - spreminjanje	f
00030000-55f6-a490-b4b2-c0f587540b3a	Rezervacija-read	Rezervacija - branje	f
00030000-55f6-a490-5205-5931d87102b3	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55f6-a490-13fa-d2eb2e737794	SedezniRed-read	SedezniRed - branje	f
00030000-55f6-a490-bcc3-f5acb6ae3cf0	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55f6-a490-9efd-cfbe47aa8d90	Sedez-read	Sedez - branje	f
00030000-55f6-a490-19a5-57964445a15a	Sedez-write	Sedez - spreminjanje	f
00030000-55f6-a490-5cfe-16e530f6f846	Sezona-read	Sezona - branje	f
00030000-55f6-a490-cb0e-871da58593e9	Sezona-write	Sezona - spreminjanje	f
00030000-55f6-a490-32f5-8f28537b3d4e	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55f6-a490-474b-985d3a9dc14b	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55f6-a490-2d5c-eb180d8beebc	Stevilcenje-read	Stevilcenje - branje	f
00030000-55f6-a490-f67a-7b0e31b5ef9f	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55f6-a490-5b52-4a28077d45bb	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55f6-a490-a217-58a45278c063	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55f6-a490-aea8-1587d7a5232c	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55f6-a490-26d5-7d15ef6ce0d8	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55f6-a490-1fec-8b715a8ef401	Telefonska-read	Telefonska - branje	f
00030000-55f6-a490-0eac-86174598429b	Telefonska-write	Telefonska - spreminjanje	f
00030000-55f6-a490-ed3c-dfae68867075	TerminStoritve-read	TerminStoritve - branje	f
00030000-55f6-a490-111a-18e6a9a23482	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55f6-a490-e895-d36889790fb2	TipFunkcije-read	TipFunkcije - branje	f
00030000-55f6-a490-b2d3-360e421b2dc5	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55f6-a490-1abd-0dcbdec7fc6f	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55f6-a490-2a53-927bb449afa9	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55f6-a490-986b-ce94736b954a	Trr-read	Trr - branje	f
00030000-55f6-a490-f054-6a4337a74a40	Trr-write	Trr - spreminjanje	f
00030000-55f6-a490-1c08-02d36e745318	Uprizoritev-read	Uprizoritev - branje	f
00030000-55f6-a490-ec09-060cf38fd100	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55f6-a490-b2c8-064e128029c9	Vaja-read	Vaja - branje	f
00030000-55f6-a490-5c48-703bd9f7d328	Vaja-write	Vaja - spreminjanje	f
00030000-55f6-a490-55a1-0cf27a1ec2c9	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55f6-a490-77e0-d201678f023f	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55f6-a490-c061-c64976a0efa3	VrstaStroska-read	VrstaStroska - branje	f
00030000-55f6-a490-24c1-b87a568ade90	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55f6-a490-8930-a1d82f5f7503	Zaposlitev-read	Zaposlitev - branje	f
00030000-55f6-a490-fc00-57018d308398	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55f6-a490-7993-c8ef60792b3a	Zasedenost-read	Zasedenost - branje	f
00030000-55f6-a490-0944-cd636660f6f2	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55f6-a490-f9b4-25900964fced	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55f6-a490-d4f7-aa3f74ff82a6	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55f6-a490-ef73-c392e3b0222b	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55f6-a490-4120-8cc3df7bc817	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55f6-a490-98a3-190b713f688e	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55f6-a490-beca-da86b7fe9033	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55f6-a490-0711-37a986c08b59	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55f6-a490-f1b8-b4623c96dcd0	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55f6-a490-63e3-d509583d594b	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f6-a490-c4a9-eb02c089957e	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55f6-a490-ed3b-b8011d523cfe	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f6-a490-7020-b7b230abbd0d	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55f6-a490-db33-a259836ae47e	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55f6-a490-fe12-53516174f371	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55f6-a490-a457-b8a1b15326ef	Datoteka-write	Datoteka - spreminjanje	f
00030000-55f6-a490-fb93-672a399a5ea3	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2941 (class 0 OID 19177887)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55f6-a490-da49-522e797377ce	00030000-55f6-a48f-f134-9929160665a5
00020000-55f6-a490-fdf3-563189d76787	00030000-55f6-a48f-ff9b-a0479618c662
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a48f-9a6d-b53b89f82740
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a48f-8e37-56f0005570f9
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a48f-92b7-73cd3ce054c5
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a48f-8eb7-b32a750a5506
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a48f-48b4-f69e2401e38c
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a48f-8a09-53a4b9c45501
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a48f-c8bf-0708fa676704
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a48f-597b-7c5e6f97674b
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a48f-ff9b-a0479618c662
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a48f-c446-2d8cbe2b08e7
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a48f-554d-1d84db9dfc3a
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a48f-71bc-6ae436bf9c85
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-50eb-38258acc0d85
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-6849-d826b9f9662e
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-d32a-fb7c4c58eba4
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-e9a8-b4c22d775ada
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-7122-091c5809c8df
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-d4c1-2e97d6750a78
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-e9ee-f9bb348f4791
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-822d-86a710d7f0b3
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-606c-f01e9dc709e8
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-e3c9-9046806e7ea5
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-8c64-ab3e9bf6919e
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-a2d2-5346ea4fb255
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-d5bf-fd845d2ce420
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-0dd5-20f8fae745a7
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-d36c-d05ca1a9b657
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-9bc0-2d32979f4a1e
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-5682-5ee6178a0aba
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-d421-41b2e2b94ea3
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-7000-9a6f1adddd5b
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-5c67-b8e565cd8c27
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-354e-375afefb9006
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-c27c-ee8ce30e3f63
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-42f1-9c968b0a5204
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-d9d9-10dcf5af02dd
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-9bd3-44a81315309b
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-e756-f59c1333f076
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-5cfe-16e530f6f846
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-cb0e-871da58593e9
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-e895-d36889790fb2
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-1c08-02d36e745318
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-ec09-060cf38fd100
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-b2c8-064e128029c9
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-5c48-703bd9f7d328
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-7993-c8ef60792b3a
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-0944-cd636660f6f2
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-f9b4-25900964fced
00020000-55f6-a490-d81d-0f30ab6752ba	00030000-55f6-a490-ef73-c392e3b0222b
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a48f-9a6d-b53b89f82740
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a48f-48b4-f69e2401e38c
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a48f-8a09-53a4b9c45501
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a48f-ff9b-a0479618c662
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a490-50eb-38258acc0d85
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a490-d32a-fb7c4c58eba4
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a490-7122-091c5809c8df
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a490-d4c1-2e97d6750a78
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a490-e9ee-f9bb348f4791
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a490-822d-86a710d7f0b3
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a490-606c-f01e9dc709e8
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a490-e3c9-9046806e7ea5
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a490-8c64-ab3e9bf6919e
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a490-d5bf-fd845d2ce420
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a490-d36c-d05ca1a9b657
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a490-9bc0-2d32979f4a1e
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a490-5682-5ee6178a0aba
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a490-354e-375afefb9006
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a490-42f1-9c968b0a5204
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a490-9bd3-44a81315309b
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a490-5cfe-16e530f6f846
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a490-1fec-8b715a8ef401
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a490-0eac-86174598429b
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a490-986b-ce94736b954a
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a490-f054-6a4337a74a40
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a490-8930-a1d82f5f7503
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a490-fc00-57018d308398
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a490-f9b4-25900964fced
00020000-55f6-a490-3d2a-666fbcc409e5	00030000-55f6-a490-ef73-c392e3b0222b
00020000-55f6-a490-95fe-8543c9b4fd8b	00030000-55f6-a48f-9a6d-b53b89f82740
00020000-55f6-a490-95fe-8543c9b4fd8b	00030000-55f6-a48f-92b7-73cd3ce054c5
00020000-55f6-a490-95fe-8543c9b4fd8b	00030000-55f6-a48f-48b4-f69e2401e38c
00020000-55f6-a490-95fe-8543c9b4fd8b	00030000-55f6-a48f-a18d-2fd149990a21
00020000-55f6-a490-95fe-8543c9b4fd8b	00030000-55f6-a48f-251f-d643645af49d
00020000-55f6-a490-95fe-8543c9b4fd8b	00030000-55f6-a48f-5f3f-f5d21e364a1f
00020000-55f6-a490-95fe-8543c9b4fd8b	00030000-55f6-a48f-8a09-53a4b9c45501
00020000-55f6-a490-95fe-8543c9b4fd8b	00030000-55f6-a48f-ff9b-a0479618c662
00020000-55f6-a490-95fe-8543c9b4fd8b	00030000-55f6-a48f-554d-1d84db9dfc3a
00020000-55f6-a490-95fe-8543c9b4fd8b	00030000-55f6-a490-50eb-38258acc0d85
00020000-55f6-a490-95fe-8543c9b4fd8b	00030000-55f6-a490-d32a-fb7c4c58eba4
00020000-55f6-a490-95fe-8543c9b4fd8b	00030000-55f6-a490-7122-091c5809c8df
00020000-55f6-a490-95fe-8543c9b4fd8b	00030000-55f6-a490-e9ee-f9bb348f4791
00020000-55f6-a490-95fe-8543c9b4fd8b	00030000-55f6-a490-822d-86a710d7f0b3
00020000-55f6-a490-95fe-8543c9b4fd8b	00030000-55f6-a490-606c-f01e9dc709e8
00020000-55f6-a490-95fe-8543c9b4fd8b	00030000-55f6-a490-8c64-ab3e9bf6919e
00020000-55f6-a490-95fe-8543c9b4fd8b	00030000-55f6-a490-d5bf-fd845d2ce420
00020000-55f6-a490-95fe-8543c9b4fd8b	00030000-55f6-a490-5682-5ee6178a0aba
00020000-55f6-a490-95fe-8543c9b4fd8b	00030000-55f6-a490-7000-9a6f1adddd5b
00020000-55f6-a490-95fe-8543c9b4fd8b	00030000-55f6-a490-354e-375afefb9006
00020000-55f6-a490-95fe-8543c9b4fd8b	00030000-55f6-a490-42f1-9c968b0a5204
00020000-55f6-a490-95fe-8543c9b4fd8b	00030000-55f6-a490-9bd3-44a81315309b
00020000-55f6-a490-95fe-8543c9b4fd8b	00030000-55f6-a490-5cfe-16e530f6f846
00020000-55f6-a490-95fe-8543c9b4fd8b	00030000-55f6-a490-e895-d36889790fb2
00020000-55f6-a490-95fe-8543c9b4fd8b	00030000-55f6-a490-b2c8-064e128029c9
00020000-55f6-a490-95fe-8543c9b4fd8b	00030000-55f6-a490-7993-c8ef60792b3a
00020000-55f6-a490-95fe-8543c9b4fd8b	00030000-55f6-a490-f9b4-25900964fced
00020000-55f6-a490-95fe-8543c9b4fd8b	00030000-55f6-a490-ef73-c392e3b0222b
00020000-55f6-a490-27b6-40af356507a8	00030000-55f6-a48f-9a6d-b53b89f82740
00020000-55f6-a490-27b6-40af356507a8	00030000-55f6-a48f-8e37-56f0005570f9
00020000-55f6-a490-27b6-40af356507a8	00030000-55f6-a48f-8eb7-b32a750a5506
00020000-55f6-a490-27b6-40af356507a8	00030000-55f6-a48f-48b4-f69e2401e38c
00020000-55f6-a490-27b6-40af356507a8	00030000-55f6-a48f-8a09-53a4b9c45501
00020000-55f6-a490-27b6-40af356507a8	00030000-55f6-a48f-ff9b-a0479618c662
00020000-55f6-a490-27b6-40af356507a8	00030000-55f6-a490-50eb-38258acc0d85
00020000-55f6-a490-27b6-40af356507a8	00030000-55f6-a490-d32a-fb7c4c58eba4
00020000-55f6-a490-27b6-40af356507a8	00030000-55f6-a490-e9ee-f9bb348f4791
00020000-55f6-a490-27b6-40af356507a8	00030000-55f6-a490-822d-86a710d7f0b3
00020000-55f6-a490-27b6-40af356507a8	00030000-55f6-a490-8c64-ab3e9bf6919e
00020000-55f6-a490-27b6-40af356507a8	00030000-55f6-a490-d5bf-fd845d2ce420
00020000-55f6-a490-27b6-40af356507a8	00030000-55f6-a490-5682-5ee6178a0aba
00020000-55f6-a490-27b6-40af356507a8	00030000-55f6-a490-354e-375afefb9006
00020000-55f6-a490-27b6-40af356507a8	00030000-55f6-a490-42f1-9c968b0a5204
00020000-55f6-a490-27b6-40af356507a8	00030000-55f6-a490-9bd3-44a81315309b
00020000-55f6-a490-27b6-40af356507a8	00030000-55f6-a490-5cfe-16e530f6f846
00020000-55f6-a490-27b6-40af356507a8	00030000-55f6-a490-e895-d36889790fb2
00020000-55f6-a490-27b6-40af356507a8	00030000-55f6-a490-f9b4-25900964fced
00020000-55f6-a490-27b6-40af356507a8	00030000-55f6-a490-ef73-c392e3b0222b
00020000-55f6-a490-2b5e-a28897a72e43	00030000-55f6-a48f-9a6d-b53b89f82740
00020000-55f6-a490-2b5e-a28897a72e43	00030000-55f6-a48f-48b4-f69e2401e38c
00020000-55f6-a490-2b5e-a28897a72e43	00030000-55f6-a48f-8a09-53a4b9c45501
00020000-55f6-a490-2b5e-a28897a72e43	00030000-55f6-a48f-ff9b-a0479618c662
00020000-55f6-a490-2b5e-a28897a72e43	00030000-55f6-a490-50eb-38258acc0d85
00020000-55f6-a490-2b5e-a28897a72e43	00030000-55f6-a490-d32a-fb7c4c58eba4
00020000-55f6-a490-2b5e-a28897a72e43	00030000-55f6-a490-e9ee-f9bb348f4791
00020000-55f6-a490-2b5e-a28897a72e43	00030000-55f6-a490-822d-86a710d7f0b3
00020000-55f6-a490-2b5e-a28897a72e43	00030000-55f6-a490-8c64-ab3e9bf6919e
00020000-55f6-a490-2b5e-a28897a72e43	00030000-55f6-a490-d5bf-fd845d2ce420
00020000-55f6-a490-2b5e-a28897a72e43	00030000-55f6-a490-5682-5ee6178a0aba
00020000-55f6-a490-2b5e-a28897a72e43	00030000-55f6-a490-354e-375afefb9006
00020000-55f6-a490-2b5e-a28897a72e43	00030000-55f6-a490-42f1-9c968b0a5204
00020000-55f6-a490-2b5e-a28897a72e43	00030000-55f6-a490-9bd3-44a81315309b
00020000-55f6-a490-2b5e-a28897a72e43	00030000-55f6-a490-5cfe-16e530f6f846
00020000-55f6-a490-2b5e-a28897a72e43	00030000-55f6-a490-ed3c-dfae68867075
00020000-55f6-a490-2b5e-a28897a72e43	00030000-55f6-a48f-3ac8-feeeb1d4c297
00020000-55f6-a490-2b5e-a28897a72e43	00030000-55f6-a490-e895-d36889790fb2
00020000-55f6-a490-2b5e-a28897a72e43	00030000-55f6-a490-f9b4-25900964fced
00020000-55f6-a490-2b5e-a28897a72e43	00030000-55f6-a490-ef73-c392e3b0222b
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a48f-e060-a67ff38b103b
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a48f-f134-9929160665a5
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a48f-3ac8-feeeb1d4c297
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a48f-c8bf-0708fa676704
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a48f-fd16-6a0485c695e9
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a48f-a81a-89a78ff3f4a7
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a48f-019a-c2dd7a26aadd
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a48f-9a6d-b53b89f82740
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a48f-8e37-56f0005570f9
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a48f-92b7-73cd3ce054c5
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a48f-8eb7-b32a750a5506
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a48f-48b4-f69e2401e38c
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a48f-a18d-2fd149990a21
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a48f-251f-d643645af49d
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a48f-03a0-bb248890b207
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a48f-5f3f-f5d21e364a1f
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a48f-fafc-7f82a9d9dd51
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a48f-8a09-53a4b9c45501
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a48f-597b-7c5e6f97674b
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a48f-ff9b-a0479618c662
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a48f-c446-2d8cbe2b08e7
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a48f-3ab9-ba5dbdc8ebcc
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a48f-8c43-99d58c41e03e
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a48f-52c0-b95ca4d99e20
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a48f-68eb-8bf5965d9a7d
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a48f-554d-1d84db9dfc3a
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a48f-71bc-6ae436bf9c85
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-50eb-38258acc0d85
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-6849-d826b9f9662e
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-d32a-fb7c4c58eba4
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-e9a8-b4c22d775ada
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-7122-091c5809c8df
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-d4c1-2e97d6750a78
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-965d-9709a53d4157
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-3026-9b31eb4bafed
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-e995-c6382cc8c4e4
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-01f4-3557af9727a5
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-e9ee-f9bb348f4791
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-9d68-0c2bf61bf0e2
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-822d-86a710d7f0b3
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-b62a-bfa42a860087
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-606c-f01e9dc709e8
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-e3c9-9046806e7ea5
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-1f64-3ec32cfad246
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-5c73-b4b48991e056
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-fcea-d90b3c40ddbc
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-8375-e6d1d87e3fd7
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-0bef-52ff2f7b91c3
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-0084-da94d569b8fc
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-8c64-ab3e9bf6919e
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-a2d2-5346ea4fb255
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-d5bf-fd845d2ce420
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-0dd5-20f8fae745a7
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-1f81-f80bdbccdbc1
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-448b-fd25b3aedf34
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-c777-d2658ba49cbd
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-8aa7-e4a2d5133cce
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-d36c-d05ca1a9b657
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-9bc0-2d32979f4a1e
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-5682-5ee6178a0aba
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-d421-41b2e2b94ea3
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-daf5-840243839a23
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-10c0-f2238a18f002
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-2512-8b3c58712604
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-b369-28374e7466f4
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-7000-9a6f1adddd5b
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-5c67-b8e565cd8c27
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-95e5-ffd05cf09a2f
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-6ee0-55e8e8f0fd25
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-ee35-007588c5fe5c
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-af5d-433acdff4f33
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-6ccb-9ff06cd13c45
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-35ae-20eda0f5ae53
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-11a2-1c222804d68c
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-cabe-f5022187e429
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-de40-c19d3a76e030
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-1432-f9e21b91c8bb
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-9e18-141dcc5a5bbb
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-9fb2-5ebff7a1d84c
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-e229-207569206140
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-6dc4-3fd33f592b9e
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-6d7c-3c1db6fa39d7
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-8175-a559b2e16ae1
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-ffd1-13822729cd16
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-9024-4a0a8d4a5af1
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-e0ea-f7f28b7c4c43
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-d22b-3ccd40c67c44
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-354e-375afefb9006
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-c27c-ee8ce30e3f63
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-803c-cfe9c8111b37
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-3e9d-f126c683f56e
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-82e4-ad4029bd501a
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-b361-9013535c2a0a
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-42f1-9c968b0a5204
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-d9d9-10dcf5af02dd
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-9bd3-44a81315309b
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-e756-f59c1333f076
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-3782-389172bf9ea3
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-2e63-78dc0157edde
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-b4b2-c0f587540b3a
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-5205-5931d87102b3
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-13fa-d2eb2e737794
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-bcc3-f5acb6ae3cf0
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-9efd-cfbe47aa8d90
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-19a5-57964445a15a
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-5cfe-16e530f6f846
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-cb0e-871da58593e9
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-32f5-8f28537b3d4e
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-474b-985d3a9dc14b
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-2d5c-eb180d8beebc
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-f67a-7b0e31b5ef9f
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-5b52-4a28077d45bb
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-a217-58a45278c063
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-aea8-1587d7a5232c
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-26d5-7d15ef6ce0d8
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-1fec-8b715a8ef401
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-0eac-86174598429b
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-ed3c-dfae68867075
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-111a-18e6a9a23482
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-e895-d36889790fb2
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-b2d3-360e421b2dc5
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-1abd-0dcbdec7fc6f
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-2a53-927bb449afa9
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-986b-ce94736b954a
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-f054-6a4337a74a40
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-1c08-02d36e745318
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-ec09-060cf38fd100
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-b2c8-064e128029c9
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-5c48-703bd9f7d328
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-55a1-0cf27a1ec2c9
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-77e0-d201678f023f
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-c061-c64976a0efa3
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-24c1-b87a568ade90
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-8930-a1d82f5f7503
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-fc00-57018d308398
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-7993-c8ef60792b3a
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-0944-cd636660f6f2
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-f9b4-25900964fced
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-d4f7-aa3f74ff82a6
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-ef73-c392e3b0222b
00020000-55f6-a491-7d3e-137ca455df9a	00030000-55f6-a490-4120-8cc3df7bc817
\.


--
-- TOC entry 2968 (class 0 OID 19178182)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 19178216)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 19178345)
-- Dependencies: 222
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55f6-a491-7b2a-292d45dd9955	00090000-55f6-a491-6333-c157856809c4	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55f6-a491-72b1-27d9159a42b1	00090000-55f6-a491-9c6c-3a270bd7bdc4	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55f6-a491-5a14-a09aaf9ed46a	00090000-55f6-a491-5768-57b57dfbaff7	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55f6-a491-1e38-1321bfa2e913	00090000-55f6-a491-8368-351d8095dc86	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2946 (class 0 OID 19177947)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55f6-a491-af59-014faae9bb19	00040000-55f6-a48f-bd8c-829658f00c6e	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-a491-2eca-60c35d8b7546	00040000-55f6-a48f-bd8c-829658f00c6e	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55f6-a491-d816-e32a198cd568	00040000-55f6-a48f-bd8c-829658f00c6e	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-a491-78e7-e759bf865c47	00040000-55f6-a48f-bd8c-829658f00c6e	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-a491-365d-6629dcca8949	00040000-55f6-a48f-bd8c-829658f00c6e	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-a491-1f41-55dc392f6c1f	00040000-55f6-a48f-96d7-6bbc36497cdd	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-a491-e0d7-0a0cbe02cc40	00040000-55f6-a48f-40ed-e9fa254113a3	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-a491-bbfc-069b67cdb0a1	00040000-55f6-a48f-ea0a-202de2c17a5a	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-a491-6393-9e52bd449172	00040000-55f6-a48f-b3d5-6f65b099f14d	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55f6-a493-50bf-d86fa818e7fd	00040000-55f6-a48f-bd8c-829658f00c6e	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2948 (class 0 OID 19177981)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55f6-a48f-5922-f04e0a566c21	8341	Adlešiči
00050000-55f6-a48f-4ed7-c6e13dc4050c	5270	Ajdovščina
00050000-55f6-a48f-f696-536480ad89cb	6280	Ankaran/Ancarano
00050000-55f6-a48f-f348-bdb41283f055	9253	Apače
00050000-55f6-a48f-397d-9e02ce593004	8253	Artiče
00050000-55f6-a48f-155e-2603afc67717	4275	Begunje na Gorenjskem
00050000-55f6-a48f-80b3-b4aa175b01cc	1382	Begunje pri Cerknici
00050000-55f6-a48f-b90f-dd78f4c50da7	9231	Beltinci
00050000-55f6-a48f-980b-69a70da08f58	2234	Benedikt
00050000-55f6-a48f-9795-bff045168419	2345	Bistrica ob Dravi
00050000-55f6-a48f-7535-491bd773ef55	3256	Bistrica ob Sotli
00050000-55f6-a48f-48ab-6594e87626c4	8259	Bizeljsko
00050000-55f6-a48f-f1aa-a58198fcf18f	1223	Blagovica
00050000-55f6-a48f-af45-c65d9fd904eb	8283	Blanca
00050000-55f6-a48f-704b-65fdd2f3bd6a	4260	Bled
00050000-55f6-a48f-f1a1-8db4d8b580b2	4273	Blejska Dobrava
00050000-55f6-a48f-a9b3-1b6926d6644d	9265	Bodonci
00050000-55f6-a48f-db38-e13f39f08842	9222	Bogojina
00050000-55f6-a48f-4fd8-695df515671d	4263	Bohinjska Bela
00050000-55f6-a48f-4641-497ab0a297bb	4264	Bohinjska Bistrica
00050000-55f6-a48f-25e5-ea233078f6b7	4265	Bohinjsko jezero
00050000-55f6-a48f-dbda-d20b4df25150	1353	Borovnica
00050000-55f6-a48f-8456-5311905d74f0	8294	Boštanj
00050000-55f6-a48f-f5ce-4dbf6a4e9bfa	5230	Bovec
00050000-55f6-a48f-47ba-54a3b59ae1b4	5295	Branik
00050000-55f6-a48f-81ae-02510aeca1f2	3314	Braslovče
00050000-55f6-a48f-ece4-de6ab6569dcd	5223	Breginj
00050000-55f6-a48f-973c-98d34f8985a7	8280	Brestanica
00050000-55f6-a48f-6cca-df8d4fa5865b	2354	Bresternica
00050000-55f6-a48f-6975-21de8d0cf6e3	4243	Brezje
00050000-55f6-a48f-7326-ed8a637c5a96	1351	Brezovica pri Ljubljani
00050000-55f6-a48f-6ce4-3b2f0f4273b2	8250	Brežice
00050000-55f6-a48f-243b-c703dc45a6d7	4210	Brnik - Aerodrom
00050000-55f6-a48f-21cd-fcebb6b16479	8321	Brusnice
00050000-55f6-a48f-a7c7-9a7d16b8d61a	3255	Buče
00050000-55f6-a48f-16c4-50e78cc27a42	8276	Bučka 
00050000-55f6-a48f-a1a0-08826cc939ec	9261	Cankova
00050000-55f6-a48f-2ecc-bf0037083fbd	3000	Celje 
00050000-55f6-a48f-1177-defe54aadbf3	3001	Celje - poštni predali
00050000-55f6-a48f-dc36-73470f6c4eb9	4207	Cerklje na Gorenjskem
00050000-55f6-a48f-c27d-0bbf702bf764	8263	Cerklje ob Krki
00050000-55f6-a48f-293b-0a2df8e52397	1380	Cerknica
00050000-55f6-a48f-d74b-b81f8b3c2ca8	5282	Cerkno
00050000-55f6-a48f-0aa5-d811a76357d9	2236	Cerkvenjak
00050000-55f6-a48f-ec2f-159b89676fc7	2215	Ceršak
00050000-55f6-a48f-2be5-2524a64de44d	2326	Cirkovce
00050000-55f6-a48f-b401-429dcbc2dcef	2282	Cirkulane
00050000-55f6-a48f-8495-8e9c1f488451	5273	Col
00050000-55f6-a48f-eb73-6c2a33a96f04	8251	Čatež ob Savi
00050000-55f6-a48f-ceda-21dc669614ef	1413	Čemšenik
00050000-55f6-a48f-fee4-5b490118ea39	5253	Čepovan
00050000-55f6-a48f-2720-f03b5bbb6642	9232	Črenšovci
00050000-55f6-a48f-db4d-d0cde1390304	2393	Črna na Koroškem
00050000-55f6-a48f-dbf2-02d588233f4f	6275	Črni Kal
00050000-55f6-a48f-69aa-40ef2e59e7de	5274	Črni Vrh nad Idrijo
00050000-55f6-a48f-1a61-4701197c28cc	5262	Črniče
00050000-55f6-a48f-7807-0774570f1dd3	8340	Črnomelj
00050000-55f6-a48f-3025-d927385117c9	6271	Dekani
00050000-55f6-a48f-9798-61fdacdd69fd	5210	Deskle
00050000-55f6-a48f-b5ec-bfe2ad1639eb	2253	Destrnik
00050000-55f6-a48f-c12d-ed5d87d3ba30	6215	Divača
00050000-55f6-a48f-2008-85900d80cb77	1233	Dob
00050000-55f6-a48f-bb7f-3cede708baf7	3224	Dobje pri Planini
00050000-55f6-a48f-72e9-8ccb6c96a617	8257	Dobova
00050000-55f6-a48f-f582-519253465628	1423	Dobovec
00050000-55f6-a48f-5722-f4b1181f19cb	5263	Dobravlje
00050000-55f6-a48f-eaaf-bc8ad650c191	3204	Dobrna
00050000-55f6-a48f-aaac-53b022fadf3c	8211	Dobrnič
00050000-55f6-a48f-340e-8b7088ae93b4	1356	Dobrova
00050000-55f6-a48f-3252-37daddb15a05	9223	Dobrovnik/Dobronak 
00050000-55f6-a48f-2e30-04a14fcaf0bf	5212	Dobrovo v Brdih
00050000-55f6-a48f-ca46-155515331aef	1431	Dol pri Hrastniku
00050000-55f6-a48f-08b4-29c4ef3db9f9	1262	Dol pri Ljubljani
00050000-55f6-a48f-9834-4f937f8c4442	1273	Dole pri Litiji
00050000-55f6-a48f-8adb-7aa67c894e29	1331	Dolenja vas
00050000-55f6-a48f-b4a2-d31426b93340	8350	Dolenjske Toplice
00050000-55f6-a48f-e46c-6d107cd8048b	1230	Domžale
00050000-55f6-a48f-cdd9-b55779511b30	2252	Dornava
00050000-55f6-a48f-33a7-24d413cf9426	5294	Dornberk
00050000-55f6-a48f-e95d-a763592a633a	1319	Draga
00050000-55f6-a48f-6361-aad6418e0dab	8343	Dragatuš
00050000-55f6-a48f-63b7-08769a582099	3222	Dramlje
00050000-55f6-a48f-e328-6e9237c640b7	2370	Dravograd
00050000-55f6-a48f-67dd-0f065efea23c	4203	Duplje
00050000-55f6-a48f-7a84-ad507e683564	6221	Dutovlje
00050000-55f6-a48f-c58f-aeb48cba37a7	8361	Dvor
00050000-55f6-a48f-ad3e-dd3d1894710b	2343	Fala
00050000-55f6-a48f-265c-c20c4a451c73	9208	Fokovci
00050000-55f6-a48f-f151-9b4d0340f039	2313	Fram
00050000-55f6-a48f-858c-62e613522d56	3213	Frankolovo
00050000-55f6-a48f-3372-a5c4746de792	1274	Gabrovka
00050000-55f6-a48f-5cdb-baafc53ddb82	8254	Globoko
00050000-55f6-a48f-7351-b689628271ff	5275	Godovič
00050000-55f6-a48f-2fbf-bcd8179da8a9	4204	Golnik
00050000-55f6-a48f-153e-340ad90d0701	3303	Gomilsko
00050000-55f6-a48f-01d4-d184a75ed275	4224	Gorenja vas
00050000-55f6-a48f-f408-982981e2ee73	3263	Gorica pri Slivnici
00050000-55f6-a48f-f651-dd3c33fbfa36	2272	Gorišnica
00050000-55f6-a48f-f57d-0ec8d56e8785	9250	Gornja Radgona
00050000-55f6-a48f-e54d-2c43c2c8e19c	3342	Gornji Grad
00050000-55f6-a48f-c8c5-e074b9c12860	4282	Gozd Martuljek
00050000-55f6-a48f-9930-43017bc58491	6272	Gračišče
00050000-55f6-a48f-1344-a94ce4bf77c2	9264	Grad
00050000-55f6-a48f-dca1-7d6e2c45cb7e	8332	Gradac
00050000-55f6-a48f-5546-499be395b01e	1384	Grahovo
00050000-55f6-a48f-91d3-63f2341016bb	5242	Grahovo ob Bači
00050000-55f6-a48f-5990-d6a3c789402f	5251	Grgar
00050000-55f6-a48f-f316-03a500ac8fd6	3302	Griže
00050000-55f6-a48f-0c25-7f94e5beb6b6	3231	Grobelno
00050000-55f6-a48f-56af-cad6f8b1c4a6	1290	Grosuplje
00050000-55f6-a48f-a87b-0fe4281841c6	2288	Hajdina
00050000-55f6-a48f-a141-e4fc797cd282	8362	Hinje
00050000-55f6-a48f-8602-ceac0e2131de	2311	Hoče
00050000-55f6-a48f-6b26-7f8032968778	9205	Hodoš/Hodos
00050000-55f6-a48f-dd50-48a74e6abe73	1354	Horjul
00050000-55f6-a48f-054b-f8936fee9596	1372	Hotedršica
00050000-55f6-a48f-e350-f3f160740d26	1430	Hrastnik
00050000-55f6-a48f-d6fa-a1d38a2508e2	6225	Hruševje
00050000-55f6-a48f-bea1-c59b197e22a7	4276	Hrušica
00050000-55f6-a48f-e446-b0a74845bd25	5280	Idrija
00050000-55f6-a48f-2cba-9cffa25f4fa4	1292	Ig
00050000-55f6-a48f-21e4-9a2d0e19204e	6250	Ilirska Bistrica
00050000-55f6-a48f-dc98-df6485b4a6ef	6251	Ilirska Bistrica-Trnovo
00050000-55f6-a48f-959e-987a4c6fffd8	1295	Ivančna Gorica
00050000-55f6-a48f-ccd6-1aaa8c691b1f	2259	Ivanjkovci
00050000-55f6-a48f-a8b4-8a375f9d1d78	1411	Izlake
00050000-55f6-a48f-88a1-4df523190ad5	6310	Izola/Isola
00050000-55f6-a48f-de21-b6da22b211d3	2222	Jakobski Dol
00050000-55f6-a48f-25b0-070186a64758	2221	Jarenina
00050000-55f6-a48f-b4a3-6acb5e518a13	6254	Jelšane
00050000-55f6-a48f-21f8-3be1036de538	4270	Jesenice
00050000-55f6-a48f-b3a4-dd1230255522	8261	Jesenice na Dolenjskem
00050000-55f6-a48f-fc42-16b570a92d64	3273	Jurklošter
00050000-55f6-a48f-ff80-1bfc6c14fdb7	2223	Jurovski Dol
00050000-55f6-a48f-e412-aae87deca483	2256	Juršinci
00050000-55f6-a48f-9dfb-e02b90af2796	5214	Kal nad Kanalom
00050000-55f6-a48f-aba8-272ee9f78bb7	3233	Kalobje
00050000-55f6-a48f-0cd0-9130f68707d0	4246	Kamna Gorica
00050000-55f6-a48f-29b7-90f821610bbe	2351	Kamnica
00050000-55f6-a48f-c76b-902e7727167a	1241	Kamnik
00050000-55f6-a48f-eaad-740c3f716d38	5213	Kanal
00050000-55f6-a48f-69c3-530731efd94d	8258	Kapele
00050000-55f6-a48f-8709-ca86f4baafa1	2362	Kapla
00050000-55f6-a48f-ec21-c47b7a1cca47	2325	Kidričevo
00050000-55f6-a48f-5d73-8ff35305532e	1412	Kisovec
00050000-55f6-a48f-2c86-fc58e739e956	6253	Knežak
00050000-55f6-a48f-7839-6418ba90609d	5222	Kobarid
00050000-55f6-a48f-9697-81c5068992df	9227	Kobilje
00050000-55f6-a48f-792c-0f82318a2757	1330	Kočevje
00050000-55f6-a48f-7407-bd5e3f300f8d	1338	Kočevska Reka
00050000-55f6-a48f-922c-cbd95271e039	2276	Kog
00050000-55f6-a48f-0fbd-dfebabc6a77e	5211	Kojsko
00050000-55f6-a48f-91e0-01f744d1d818	6223	Komen
00050000-55f6-a48f-95a1-9d4c226c5844	1218	Komenda
00050000-55f6-a48f-2bd8-16d57fb9ac8c	6000	Koper/Capodistria 
00050000-55f6-a48f-b1e5-5365d433783d	6001	Koper/Capodistria - poštni predali
00050000-55f6-a48f-9a8c-70f6b4fe69d4	8282	Koprivnica
00050000-55f6-a48f-a191-42df4e932693	5296	Kostanjevica na Krasu
00050000-55f6-a48f-f6b1-77d1f5942ae0	8311	Kostanjevica na Krki
00050000-55f6-a48f-ae48-31271b512711	1336	Kostel
00050000-55f6-a48f-158e-6197402524b1	6256	Košana
00050000-55f6-a48f-c63b-4784bef3f444	2394	Kotlje
00050000-55f6-a48f-7dc3-7ef0fe60e40b	6240	Kozina
00050000-55f6-a48f-a875-c10be10e6714	3260	Kozje
00050000-55f6-a48f-d455-5ca578b9a511	4000	Kranj 
00050000-55f6-a48f-192a-e3a2d319b3fc	4001	Kranj - poštni predali
00050000-55f6-a48f-1603-12b20470256b	4280	Kranjska Gora
00050000-55f6-a48f-0967-b65ce4bd31c3	1281	Kresnice
00050000-55f6-a48f-ef9d-062f81120924	4294	Križe
00050000-55f6-a48f-a8f5-626d5a20459d	9206	Križevci
00050000-55f6-a48f-7fe8-7be66dfb7a51	9242	Križevci pri Ljutomeru
00050000-55f6-a48f-391f-fa9703d9eae9	1301	Krka
00050000-55f6-a48f-8441-21fde37b4249	8296	Krmelj
00050000-55f6-a48f-5861-0ed36aa3f7b6	4245	Kropa
00050000-55f6-a48f-a97b-7655f8f9ac27	8262	Krška vas
00050000-55f6-a48f-322b-5eeaad200e3d	8270	Krško
00050000-55f6-a48f-3686-426664a8e484	9263	Kuzma
00050000-55f6-a48f-90cb-ff3c1babb2c4	2318	Laporje
00050000-55f6-a48f-7bd9-e31a0bb2a437	3270	Laško
00050000-55f6-a48f-8917-2bd8e9baa5d4	1219	Laze v Tuhinju
00050000-55f6-a48f-3df7-01c05bd237dc	2230	Lenart v Slovenskih goricah
00050000-55f6-a48f-13ab-c71279455412	9220	Lendava/Lendva
00050000-55f6-a48f-cb1e-8d26d6e55172	4248	Lesce
00050000-55f6-a48f-ea6a-d83ec63a110c	3261	Lesično
00050000-55f6-a48f-ca24-5e108f53440d	8273	Leskovec pri Krškem
00050000-55f6-a48f-e08e-3201bfe8b6b6	2372	Libeliče
00050000-55f6-a48f-d41c-c427ba2b6b4e	2341	Limbuš
00050000-55f6-a48f-fca9-65cd9ab92bc7	1270	Litija
00050000-55f6-a48f-1756-546417797857	3202	Ljubečna
00050000-55f6-a48f-e00c-0f9f23ee012f	1000	Ljubljana 
00050000-55f6-a48f-2447-1cae2948676f	1001	Ljubljana - poštni predali
00050000-55f6-a48f-5d73-e65ac5b100a9	1231	Ljubljana - Črnuče
00050000-55f6-a48f-dd2d-aa2c90003c44	1261	Ljubljana - Dobrunje
00050000-55f6-a48f-8a40-225f5bb8184c	1260	Ljubljana - Polje
00050000-55f6-a48f-7c3e-ddc3205f193c	1210	Ljubljana - Šentvid
00050000-55f6-a48f-c982-0317c64ff547	1211	Ljubljana - Šmartno
00050000-55f6-a48f-9264-760db9e640e5	3333	Ljubno ob Savinji
00050000-55f6-a48f-48a6-75ec6212396a	9240	Ljutomer
00050000-55f6-a48f-ffcc-7986ad903882	3215	Loče
00050000-55f6-a48f-e79a-266c616dad0e	5231	Log pod Mangartom
00050000-55f6-a48f-9d61-10ecfe43751b	1358	Log pri Brezovici
00050000-55f6-a48f-1e9e-ffe16619d509	1370	Logatec
00050000-55f6-a48f-d894-3cdfe7d95538	1371	Logatec
00050000-55f6-a48f-2785-d4088c93d682	1434	Loka pri Zidanem Mostu
00050000-55f6-a48f-9711-cd5bfec353c4	3223	Loka pri Žusmu
00050000-55f6-a48f-cb88-57aace24f892	6219	Lokev
00050000-55f6-a48f-c7ab-594181542d84	1318	Loški Potok
00050000-55f6-a48f-3452-41b80294ef8f	2324	Lovrenc na Dravskem polju
00050000-55f6-a48f-f7a9-d61bbe49cafe	2344	Lovrenc na Pohorju
00050000-55f6-a48f-ddce-d9e0a207a7ed	3334	Luče
00050000-55f6-a48f-8231-7585a67cb8ba	1225	Lukovica
00050000-55f6-a48f-8291-b2cb79d42717	9202	Mačkovci
00050000-55f6-a48f-bfb6-42fac7bac14a	2322	Majšperk
00050000-55f6-a48f-5bbd-ecff34ea55ae	2321	Makole
00050000-55f6-a48f-e39a-2dd5a67dcafe	9243	Mala Nedelja
00050000-55f6-a48f-24f5-fce0ec4e5e52	2229	Malečnik
00050000-55f6-a48f-aea3-f2978b9a197f	6273	Marezige
00050000-55f6-a48f-a85f-8a6c7b141eca	2000	Maribor 
00050000-55f6-a48f-0ff2-bede1d21e097	2001	Maribor - poštni predali
00050000-55f6-a48f-96af-2111b7b8fa26	2206	Marjeta na Dravskem polju
00050000-55f6-a48f-c823-78103e35bb17	2281	Markovci
00050000-55f6-a48f-1c57-00d6ea8ceea9	9221	Martjanci
00050000-55f6-a48f-ff96-1005e0cfd622	6242	Materija
00050000-55f6-a48f-7b52-6d386318fc2c	4211	Mavčiče
00050000-55f6-a48f-280c-643e97dc554f	1215	Medvode
00050000-55f6-a48f-27dc-e980c0c906e7	1234	Mengeš
00050000-55f6-a48f-ac8b-279deecbf054	8330	Metlika
00050000-55f6-a48f-6b98-544d8455801c	2392	Mežica
00050000-55f6-a48f-81f9-b2b5d57391be	2204	Miklavž na Dravskem polju
00050000-55f6-a48f-818c-0b216d549d7e	2275	Miklavž pri Ormožu
00050000-55f6-a48f-0aa7-4033e218672b	5291	Miren
00050000-55f6-a48f-ef28-918739289e2f	8233	Mirna
00050000-55f6-a48f-2a03-c1635242aeed	8216	Mirna Peč
00050000-55f6-a48f-435c-fff467b9fa04	2382	Mislinja
00050000-55f6-a48f-4df9-e09fa4c9a85f	4281	Mojstrana
00050000-55f6-a48f-9b88-55cac8b8c3a8	8230	Mokronog
00050000-55f6-a48f-a5f6-05edcc28b674	1251	Moravče
00050000-55f6-a48f-efe2-30f33c198432	9226	Moravske Toplice
00050000-55f6-a48f-f8de-95742dc93038	5216	Most na Soči
00050000-55f6-a48f-8413-a24fa5f6f027	1221	Motnik
00050000-55f6-a48f-902d-b2c80884af6b	3330	Mozirje
00050000-55f6-a48f-0d05-e4f1bce610b2	9000	Murska Sobota 
00050000-55f6-a48f-e560-426c83dece35	9001	Murska Sobota - poštni predali
00050000-55f6-a48f-fde4-27f91f3564af	2366	Muta
00050000-55f6-a48f-6ac4-af23ae0363fd	4202	Naklo
00050000-55f6-a48f-ecc0-beb137dcb44e	3331	Nazarje
00050000-55f6-a48f-1694-5da2b5481ca3	1357	Notranje Gorice
00050000-55f6-a48f-df08-29c33137962f	3203	Nova Cerkev
00050000-55f6-a48f-e6fc-7d3ff8802ca7	5000	Nova Gorica 
00050000-55f6-a48f-3ae7-a9624660216c	5001	Nova Gorica - poštni predali
00050000-55f6-a48f-8116-7ac1a91fc377	1385	Nova vas
00050000-55f6-a48f-1bb5-6c8feb04705f	8000	Novo mesto
00050000-55f6-a48f-7b8e-8c942628b84e	8001	Novo mesto - poštni predali
00050000-55f6-a48f-e411-32fd6f11e5c2	6243	Obrov
00050000-55f6-a48f-0fb9-bba3f0c239e0	9233	Odranci
00050000-55f6-a48f-4ffe-03fb9a4092a2	2317	Oplotnica
00050000-55f6-a48f-e7b2-80aab8c0e604	2312	Orehova vas
00050000-55f6-a48f-ed92-dfd3703205d1	2270	Ormož
00050000-55f6-a48f-db61-586b639a14fe	1316	Ortnek
00050000-55f6-a48f-f24c-3725c5587e8f	1337	Osilnica
00050000-55f6-a48f-bf7b-b85596e7e182	8222	Otočec
00050000-55f6-a48f-3b07-7a6ddb79a9d9	2361	Ožbalt
00050000-55f6-a48f-3c85-85c4d36a69cf	2231	Pernica
00050000-55f6-a48f-c045-9be64be1333e	2211	Pesnica pri Mariboru
00050000-55f6-a48f-e93e-e2430faca372	9203	Petrovci
00050000-55f6-a48f-967f-40442efce3d5	3301	Petrovče
00050000-55f6-a48f-ee1b-f03a547cf9ca	6330	Piran/Pirano
00050000-55f6-a48f-8fc6-e97b96e97745	8255	Pišece
00050000-55f6-a48f-3321-9a1f64b2c703	6257	Pivka
00050000-55f6-a48f-96d3-3f515d26dbc0	6232	Planina
00050000-55f6-a48f-d348-951f75962bb1	3225	Planina pri Sevnici
00050000-55f6-a48f-f101-a6f202fa6d7f	6276	Pobegi
00050000-55f6-a48f-2da5-f9efd7539fd9	8312	Podbočje
00050000-55f6-a48f-b8af-e99387a9469f	5243	Podbrdo
00050000-55f6-a48f-86f1-57e897791e35	3254	Podčetrtek
00050000-55f6-a48f-3b33-f107cc2af44f	2273	Podgorci
00050000-55f6-a48f-7d06-2a3bb69e6e73	6216	Podgorje
00050000-55f6-a48f-cf70-51770a4250b2	2381	Podgorje pri Slovenj Gradcu
00050000-55f6-a48f-8dac-38824a2ea602	6244	Podgrad
00050000-55f6-a48f-a304-baa5b703430d	1414	Podkum
00050000-55f6-a48f-a287-cc9d966e3478	2286	Podlehnik
00050000-55f6-a48f-4502-655b118b962b	5272	Podnanos
00050000-55f6-a48f-e811-df7bd27e1de6	4244	Podnart
00050000-55f6-a48f-7049-4e51b4282673	3241	Podplat
00050000-55f6-a48f-3388-02b1bd22f66d	3257	Podsreda
00050000-55f6-a48f-b6f3-83ba128d55c8	2363	Podvelka
00050000-55f6-a48f-5a49-e87a5c62daa6	2208	Pohorje
00050000-55f6-a48f-5ae4-b74f1f4b4a92	2257	Polenšak
00050000-55f6-a48f-5441-eb08939832f8	1355	Polhov Gradec
00050000-55f6-a48f-2288-218f28ca954f	4223	Poljane nad Škofjo Loko
00050000-55f6-a48f-a150-9a7d7ae7a67f	2319	Poljčane
00050000-55f6-a48f-752e-618207000739	1272	Polšnik
00050000-55f6-a48f-14f3-15f2ea213312	3313	Polzela
00050000-55f6-a48f-7dbe-11df9f506784	3232	Ponikva
00050000-55f6-a48f-bfbc-49b7bd4daadc	6320	Portorož/Portorose
00050000-55f6-a48f-0d93-6c4310b6cf73	6230	Postojna
00050000-55f6-a48f-5dda-48c49e8c61e3	2331	Pragersko
00050000-55f6-a48f-4869-e065c9e94d2a	3312	Prebold
00050000-55f6-a48f-c588-4a87b1c2ce1e	4205	Preddvor
00050000-55f6-a48f-77bc-cde81b1d050b	6255	Prem
00050000-55f6-a48f-47bd-0981e4c39cfb	1352	Preserje
00050000-55f6-a48f-13d6-80fae154470f	6258	Prestranek
00050000-55f6-a48f-c3b3-40e2fb290020	2391	Prevalje
00050000-55f6-a48f-ac96-b4f37326201c	3262	Prevorje
00050000-55f6-a48f-dfdc-41e429a21032	1276	Primskovo 
00050000-55f6-a48f-c802-96bc30e71ff9	3253	Pristava pri Mestinju
00050000-55f6-a48f-70ee-97a30f461da9	9207	Prosenjakovci/Partosfalva
00050000-55f6-a48f-c7ff-b41a8d10dbb7	5297	Prvačina
00050000-55f6-a48f-819e-d9e0f767d3e6	2250	Ptuj
00050000-55f6-a48f-440a-065e2b735fa6	2323	Ptujska Gora
00050000-55f6-a48f-a031-5e94633107ef	9201	Puconci
00050000-55f6-a48f-2d73-e6418fa28540	2327	Rače
00050000-55f6-a48f-c6a5-8106d0da4818	1433	Radeče
00050000-55f6-a48f-a335-b5b646058834	9252	Radenci
00050000-55f6-a48f-725b-6929365a2d9e	2360	Radlje ob Dravi
00050000-55f6-a48f-d012-9bec9157a3e8	1235	Radomlje
00050000-55f6-a48f-094d-bff0d0a715b0	4240	Radovljica
00050000-55f6-a48f-ff80-8096cee79132	8274	Raka
00050000-55f6-a48f-38af-30cb848cd8f9	1381	Rakek
00050000-55f6-a48f-5f91-2db6f40abbb3	4283	Rateče - Planica
00050000-55f6-a48f-5ce0-de2ab03edbfe	2390	Ravne na Koroškem
00050000-55f6-a48f-bce0-84d9be0cfa02	9246	Razkrižje
00050000-55f6-a48f-ef6f-c639e672b8ff	3332	Rečica ob Savinji
00050000-55f6-a48f-e5bb-9aa3756fb29a	5292	Renče
00050000-55f6-a48f-e5b8-4fcfd4ec5e31	1310	Ribnica
00050000-55f6-a48f-3625-f23694d7a202	2364	Ribnica na Pohorju
00050000-55f6-a48f-539c-6beb81bc7bbf	3272	Rimske Toplice
00050000-55f6-a48f-49b3-27ab9567de14	1314	Rob
00050000-55f6-a48f-f589-d3938174ab12	5215	Ročinj
00050000-55f6-a48f-af5b-732661d37148	3250	Rogaška Slatina
00050000-55f6-a48f-ee6e-0bc11a5467be	9262	Rogašovci
00050000-55f6-a48f-7820-59c77cc0a888	3252	Rogatec
00050000-55f6-a48f-82e3-64ea68fd8115	1373	Rovte
00050000-55f6-a48f-8aaf-4f002fab87e8	2342	Ruše
00050000-55f6-a48f-6974-ef2c31fc2472	1282	Sava
00050000-55f6-a48f-548e-9888bffa54ca	6333	Sečovlje/Sicciole
00050000-55f6-a48f-bbed-90d79a1533c8	4227	Selca
00050000-55f6-a48f-3c62-f2e67c34decd	2352	Selnica ob Dravi
00050000-55f6-a48f-a815-bada0351ace7	8333	Semič
00050000-55f6-a48f-5d5f-74e371c4f052	8281	Senovo
00050000-55f6-a48f-8793-ace28231e8cc	6224	Senožeče
00050000-55f6-a48f-6578-fb900e513787	8290	Sevnica
00050000-55f6-a48f-a785-cd86c71dc4c7	6210	Sežana
00050000-55f6-a48f-6620-e55ac6c7a47a	2214	Sladki Vrh
00050000-55f6-a48f-d7f9-10ffa5a66944	5283	Slap ob Idrijci
00050000-55f6-a48f-8304-20a6402cf020	2380	Slovenj Gradec
00050000-55f6-a48f-acd4-81129ba89fbf	2310	Slovenska Bistrica
00050000-55f6-a48f-831b-9e961989cd00	3210	Slovenske Konjice
00050000-55f6-a48f-2210-e6187abe13b1	1216	Smlednik
00050000-55f6-a48f-b474-1232ee838e5d	5232	Soča
00050000-55f6-a48f-8198-0777fe20ea34	1317	Sodražica
00050000-55f6-a48f-17e1-f252e06e20bb	3335	Solčava
00050000-55f6-a48f-84c1-2e7b5fda6f54	5250	Solkan
00050000-55f6-a48f-f406-c0fa16a80f00	4229	Sorica
00050000-55f6-a48f-c988-4abfa372955c	4225	Sovodenj
00050000-55f6-a48f-4689-47dfe8ad4ab0	5281	Spodnja Idrija
00050000-55f6-a48f-5712-c2fdf78cab7f	2241	Spodnji Duplek
00050000-55f6-a48f-b8ac-d1d0be921fa8	9245	Spodnji Ivanjci
00050000-55f6-a48f-7d4c-f419af23e340	2277	Središče ob Dravi
00050000-55f6-a48f-1b22-785b850ef68a	4267	Srednja vas v Bohinju
00050000-55f6-a48f-ee85-b2e10b217cb1	8256	Sromlje 
00050000-55f6-a48f-fe1b-ae599629a187	5224	Srpenica
00050000-55f6-a48f-6924-6f723580108e	1242	Stahovica
00050000-55f6-a48f-c14c-6fa67071a75d	1332	Stara Cerkev
00050000-55f6-a48f-b135-3a622874c849	8342	Stari trg ob Kolpi
00050000-55f6-a48f-29e8-6fd6f5e4baf9	1386	Stari trg pri Ložu
00050000-55f6-a48f-2ac1-20a0ce2b1aaf	2205	Starše
00050000-55f6-a48f-2e51-d8e857bc969f	2289	Stoperce
00050000-55f6-a48f-5e51-11d896d8f75b	8322	Stopiče
00050000-55f6-a48f-f620-07e1fc2c5ca9	3206	Stranice
00050000-55f6-a48f-f5e9-307b529a9133	8351	Straža
00050000-55f6-a48f-1666-e18d1a8089b2	1313	Struge
00050000-55f6-a48f-55fd-240e99822249	8293	Studenec
00050000-55f6-a48f-0679-219fd0d83150	8331	Suhor
00050000-55f6-a48f-bd42-0ae49d346f09	2233	Sv. Ana v Slovenskih goricah
00050000-55f6-a48f-7aa5-0ea565010301	2235	Sv. Trojica v Slovenskih goricah
00050000-55f6-a48f-908d-bd25cd19dede	2353	Sveti Duh na Ostrem Vrhu
00050000-55f6-a48f-9dab-f737c27803f3	9244	Sveti Jurij ob Ščavnici
00050000-55f6-a48f-7510-7554210a56a8	3264	Sveti Štefan
00050000-55f6-a48f-73f2-6771e67162ff	2258	Sveti Tomaž
00050000-55f6-a48f-e79c-1250abfe61ff	9204	Šalovci
00050000-55f6-a48f-89bc-ee132803d005	5261	Šempas
00050000-55f6-a48f-7f09-9905bbea7f35	5290	Šempeter pri Gorici
00050000-55f6-a48f-51f3-eb65b58adcde	3311	Šempeter v Savinjski dolini
00050000-55f6-a48f-9465-8451944913f9	4208	Šenčur
00050000-55f6-a48f-1c18-cdb34f6bd878	2212	Šentilj v Slovenskih goricah
00050000-55f6-a48f-73cd-44cab30d30a9	8297	Šentjanž
00050000-55f6-a48f-9a0c-038ea1643eee	2373	Šentjanž pri Dravogradu
00050000-55f6-a48f-df9b-d7e6f50fd0fb	8310	Šentjernej
00050000-55f6-a48f-ab7f-d5c8e0a48c62	3230	Šentjur
00050000-55f6-a48f-24f7-64ad5dac9e3e	3271	Šentrupert
00050000-55f6-a48f-7920-e4a96eb847a7	8232	Šentrupert
00050000-55f6-a48f-4e82-05e829237616	1296	Šentvid pri Stični
00050000-55f6-a48f-b6e9-0dcb55b2c03d	8275	Škocjan
00050000-55f6-a48f-ef6d-f23130d4a946	6281	Škofije
00050000-55f6-a48f-0120-5e84f75a02f8	4220	Škofja Loka
00050000-55f6-a48f-ee7f-68314fd9543a	3211	Škofja vas
00050000-55f6-a48f-46a2-114e207d80be	1291	Škofljica
00050000-55f6-a48f-54ba-9f802e355eeb	6274	Šmarje
00050000-55f6-a48f-8603-d81ffb1367c1	1293	Šmarje - Sap
00050000-55f6-a48f-4a8d-a2ad08ed2a62	3240	Šmarje pri Jelšah
00050000-55f6-a48f-db29-6b8e1a84fcb9	8220	Šmarješke Toplice
00050000-55f6-a48f-283f-f04bc91d7512	2315	Šmartno na Pohorju
00050000-55f6-a48f-f254-bf185c10fbe3	3341	Šmartno ob Dreti
00050000-55f6-a48f-8b5a-23e0f5516d69	3327	Šmartno ob Paki
00050000-55f6-a48f-e16f-1f98519dc106	1275	Šmartno pri Litiji
00050000-55f6-a48f-7d8d-549e09b3a693	2383	Šmartno pri Slovenj Gradcu
00050000-55f6-a48f-7d0a-a1a7b0f92c71	3201	Šmartno v Rožni dolini
00050000-55f6-a48f-477d-269918a9613e	3325	Šoštanj
00050000-55f6-a48f-b7a4-a07e84b3951a	6222	Štanjel
00050000-55f6-a48f-84b5-842987af037c	3220	Štore
00050000-55f6-a48f-f802-5ad8eb1d69bf	3304	Tabor
00050000-55f6-a48f-e07c-9395c61abc85	3221	Teharje
00050000-55f6-a48f-f1d1-fed8f43da87e	9251	Tišina
00050000-55f6-a48f-30d9-dfc0ec6004c4	5220	Tolmin
00050000-55f6-a48f-71e8-6cf966d031e1	3326	Topolšica
00050000-55f6-a48f-c8f8-ee61822d7b90	2371	Trbonje
00050000-55f6-a48f-9b26-bf4f13ebf9b1	1420	Trbovlje
00050000-55f6-a48f-b7d9-0989fb5575f2	8231	Trebelno 
00050000-55f6-a48f-9bd7-d167bcd0bf44	8210	Trebnje
00050000-55f6-a48f-68f9-74e8f31cc79d	5252	Trnovo pri Gorici
00050000-55f6-a48f-5ac1-d20ceada4ee0	2254	Trnovska vas
00050000-55f6-a48f-0b21-1b500e86aa35	1222	Trojane
00050000-55f6-a48f-91de-29cb6c8ff08b	1236	Trzin
00050000-55f6-a48f-bae7-8151aa639bc8	4290	Tržič
00050000-55f6-a48f-2d7f-1e1ea00d0a51	8295	Tržišče
00050000-55f6-a48f-b314-3391b39bf605	1311	Turjak
00050000-55f6-a48f-771c-18d9f83f5c13	9224	Turnišče
00050000-55f6-a48f-e629-e89a0caa6db2	8323	Uršna sela
00050000-55f6-a48f-998b-3446ecf2a4cb	1252	Vače
00050000-55f6-a48f-e641-fb738bf7754b	3320	Velenje 
00050000-55f6-a48f-7153-25abe2246914	3322	Velenje - poštni predali
00050000-55f6-a48f-17f0-ffb667da0cb7	8212	Velika Loka
00050000-55f6-a48f-ba99-ef43b33ca55d	2274	Velika Nedelja
00050000-55f6-a48f-345c-8c8a5d85192b	9225	Velika Polana
00050000-55f6-a48f-e09d-52ad85173acc	1315	Velike Lašče
00050000-55f6-a48f-9dae-6d3036048b2e	8213	Veliki Gaber
00050000-55f6-a48f-6cf6-5153c45380ff	9241	Veržej
00050000-55f6-a48f-739a-f8f690c7b301	1312	Videm - Dobrepolje
00050000-55f6-a48f-be5a-ffd104a31b6f	2284	Videm pri Ptuju
00050000-55f6-a48f-4312-f4ec9906311b	8344	Vinica
00050000-55f6-a48f-5ebc-de7f457b8952	5271	Vipava
00050000-55f6-a48f-1f86-92777dece38b	4212	Visoko
00050000-55f6-a48f-b225-5006d97d5359	1294	Višnja Gora
00050000-55f6-a48f-b5f1-1db517a7ee4e	3205	Vitanje
00050000-55f6-a48f-ee97-b83cdd02d84f	2255	Vitomarci
00050000-55f6-a48f-1b0e-ae503bc74ad5	1217	Vodice
00050000-55f6-a48f-b474-7777f8ce97a6	3212	Vojnik\t
00050000-55f6-a48f-6f16-f0dbde30063d	5293	Volčja Draga
00050000-55f6-a48f-1390-f20da8ba7eac	2232	Voličina
00050000-55f6-a48f-d1db-7bd0e23c64ad	3305	Vransko
00050000-55f6-a48f-596b-b57afd2cad89	6217	Vremski Britof
00050000-55f6-a48f-0081-0063c21be4cd	1360	Vrhnika
00050000-55f6-a48f-ba62-87bc24b60a0b	2365	Vuhred
00050000-55f6-a48f-6ad7-7dbcf1ceed3f	2367	Vuzenica
00050000-55f6-a48f-0ee2-578175a17772	8292	Zabukovje 
00050000-55f6-a48f-ce4e-322dca62c005	1410	Zagorje ob Savi
00050000-55f6-a48f-b671-0ede7b9b2c77	1303	Zagradec
00050000-55f6-a48f-c233-e5a081017bd1	2283	Zavrč
00050000-55f6-a48f-4877-1049d889a79b	8272	Zdole 
00050000-55f6-a48f-c62d-0922ffb3f331	4201	Zgornja Besnica
00050000-55f6-a48f-4366-335e5630caec	2242	Zgornja Korena
00050000-55f6-a48f-b0e3-e403b37c9d68	2201	Zgornja Kungota
00050000-55f6-a48f-b127-2b4305751dc2	2316	Zgornja Ložnica
00050000-55f6-a48f-1ea2-1b9b328e6f0b	2314	Zgornja Polskava
00050000-55f6-a48f-68c7-8dcf0650f2e8	2213	Zgornja Velka
00050000-55f6-a48f-725c-31b5ff4038ad	4247	Zgornje Gorje
00050000-55f6-a48f-b3e3-cc39e33e05bf	4206	Zgornje Jezersko
00050000-55f6-a48f-36c5-d5076675998d	2285	Zgornji Leskovec
00050000-55f6-a48f-dc8a-cdca3911b127	1432	Zidani Most
00050000-55f6-a48f-de09-8d2c2740ab73	3214	Zreče
00050000-55f6-a48f-e9d5-fa91aa29aa53	4209	Žabnica
00050000-55f6-a48f-bb08-c2f7b7584a5c	3310	Žalec
00050000-55f6-a48f-22d5-1cc49485c5fe	4228	Železniki
00050000-55f6-a48f-6830-e94b7598a8dc	2287	Žetale
00050000-55f6-a48f-a27e-51baff04bd53	4226	Žiri
00050000-55f6-a48f-f8e8-7776a62b2db3	4274	Žirovnica
00050000-55f6-a48f-caea-e5289d6b3c21	8360	Žužemberk
\.


--
-- TOC entry 2931 (class 0 OID 18175925)
-- Dependencies: 170
-- Data for Name: postavkac2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkac2 (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 19178524)
-- Dependencies: 229
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 19178156)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 19177966)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55f6-a491-bf5b-f28810645499	00080000-55f6-a491-af59-014faae9bb19	\N	00040000-55f6-a48f-bd8c-829658f00c6e	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55f6-a491-5cca-a611cdde2e44	00080000-55f6-a491-af59-014faae9bb19	\N	00040000-55f6-a48f-bd8c-829658f00c6e	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55f6-a491-508c-4e06dd2d6dcc	00080000-55f6-a491-2eca-60c35d8b7546	\N	00040000-55f6-a48f-bd8c-829658f00c6e	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2953 (class 0 OID 19178044)
-- Dependencies: 192
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 19178168)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 19178538)
-- Dependencies: 230
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 19178548)
-- Dependencies: 231
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55f6-a491-1bfa-0e26534597d0	00080000-55f6-a491-d816-e32a198cd568	0987	AK
00190000-55f6-a491-9867-9ee702890d26	00080000-55f6-a491-2eca-60c35d8b7546	0989	AK
00190000-55f6-a491-a17c-9534b83b569e	00080000-55f6-a491-78e7-e759bf865c47	0986	AK
00190000-55f6-a491-7342-592f45ede099	00080000-55f6-a491-1f41-55dc392f6c1f	0984	AK
00190000-55f6-a491-5512-db1bbfc38ab3	00080000-55f6-a491-e0d7-0a0cbe02cc40	0983	AK
00190000-55f6-a491-1580-3963aea92fd7	00080000-55f6-a491-bbfc-069b67cdb0a1	0982	AK
00190000-55f6-a493-c0be-d36bcefe8568	00080000-55f6-a493-50bf-d86fa818e7fd	1001	AK
\.


--
-- TOC entry 2989 (class 0 OID 19178481)
-- Dependencies: 228
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55f6-a491-25ed-505392191046	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2993 (class 0 OID 19178556)
-- Dependencies: 232
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 19178197)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55f6-a491-b482-af08e20df31f	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55f6-a491-d8e4-9bc9b22609dc	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55f6-a491-39d2-59bed48619f4	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55f6-a491-dc12-ee1d24716ee4	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55f6-a491-d7bd-48b0bc7a3473	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55f6-a491-b845-016553217715	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55f6-a491-a6cc-6b56c044f9e1	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2962 (class 0 OID 19178141)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 19178131)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 19178334)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 19178271)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 19177839)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55f6-a493-50bf-d86fa818e7fd	00010000-55f6-a490-ede2-6a0833454a61	2015-09-14 12:42:27	INS	a:0:{}
2	App\\Entity\\Option	00000000-55f6-a493-412a-ee2fa63a7eb6	00010000-55f6-a490-ede2-6a0833454a61	2015-09-14 12:42:27	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55f6-a493-c0be-d36bcefe8568	00010000-55f6-a490-ede2-6a0833454a61	2015-09-14 12:42:27	INS	a:0:{}
\.


--
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2971 (class 0 OID 19178210)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 19177877)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55f6-a490-da49-522e797377ce	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55f6-a490-fdf3-563189d76787	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55f6-a490-ae17-a6cfe81d74ed	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55f6-a490-b60a-28b60d367502	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55f6-a490-d81d-0f30ab6752ba	planer	Planer dogodkov v koledarju	t
00020000-55f6-a490-3d2a-666fbcc409e5	kadrovska	Kadrovska služba	t
00020000-55f6-a490-95fe-8543c9b4fd8b	arhivar	Ažuriranje arhivalij	t
00020000-55f6-a490-27b6-40af356507a8	igralec	Igralec	t
00020000-55f6-a490-2b5e-a28897a72e43	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55f6-a491-7d3e-137ca455df9a	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2938 (class 0 OID 19177861)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55f6-a490-30ee-5f3b926dc639	00020000-55f6-a490-ae17-a6cfe81d74ed
00010000-55f6-a490-ede2-6a0833454a61	00020000-55f6-a490-ae17-a6cfe81d74ed
00010000-55f6-a491-c650-b58a99a37c57	00020000-55f6-a491-7d3e-137ca455df9a
\.


--
-- TOC entry 2973 (class 0 OID 19178224)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 19178162)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 19178108)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 19177826)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55f6-a48f-e7b9-fc229aa38998	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55f6-a48f-8ee6-8163e14d1ee7	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55f6-a48f-c7a3-484073103faa	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55f6-a48f-7392-2ecfc5b9e6bd	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55f6-a48f-9f10-e87ffad7a9dd	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2933 (class 0 OID 19177818)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55f6-a48f-47c6-fc44eebe0ca7	00230000-55f6-a48f-7392-2ecfc5b9e6bd	popa
00240000-55f6-a48f-7e60-0df4d15e1810	00230000-55f6-a48f-7392-2ecfc5b9e6bd	oseba
00240000-55f6-a48f-4d54-21379c15ea7a	00230000-55f6-a48f-7392-2ecfc5b9e6bd	sezona
00240000-55f6-a48f-e4ec-39dbf67de79d	00230000-55f6-a48f-8ee6-8163e14d1ee7	prostor
00240000-55f6-a48f-3ba5-aa31537bfcc9	00230000-55f6-a48f-7392-2ecfc5b9e6bd	besedilo
00240000-55f6-a48f-4c52-9a17d0fb08a0	00230000-55f6-a48f-7392-2ecfc5b9e6bd	uprizoritev
00240000-55f6-a48f-51bf-ebd9200bd013	00230000-55f6-a48f-7392-2ecfc5b9e6bd	funkcija
00240000-55f6-a48f-dd69-d1674d86fd09	00230000-55f6-a48f-7392-2ecfc5b9e6bd	tipfunkcije
00240000-55f6-a48f-a5cd-7d255a9639ad	00230000-55f6-a48f-7392-2ecfc5b9e6bd	alternacija
00240000-55f6-a48f-ef88-4e3138d47f10	00230000-55f6-a48f-e7b9-fc229aa38998	pogodba
00240000-55f6-a48f-4de8-8ca170fb44aa	00230000-55f6-a48f-7392-2ecfc5b9e6bd	zaposlitev
00240000-55f6-a48f-ff71-eb389ad9691b	00230000-55f6-a48f-7392-2ecfc5b9e6bd	zvrstuprizoritve
00240000-55f6-a48f-5451-3e78a254e389	00230000-55f6-a48f-e7b9-fc229aa38998	programdela
00240000-55f6-a48f-6b8d-9fc9a54e494a	00230000-55f6-a48f-7392-2ecfc5b9e6bd	zapis
\.


--
-- TOC entry 2932 (class 0 OID 19177813)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
66b38798-ed3a-4517-9bea-0018dab5bce0	00240000-55f6-a48f-47c6-fc44eebe0ca7	0	1001
\.


--
-- TOC entry 2978 (class 0 OID 19178281)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55f6-a491-8a2f-cd908ae3dc0b	000e0000-55f6-a491-88da-90a4dde146b1	00080000-55f6-a491-af59-014faae9bb19	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55f6-a48f-8267-b47c1ef0ab0e
00270000-55f6-a491-91a9-d09da4396ddd	000e0000-55f6-a491-88da-90a4dde146b1	00080000-55f6-a491-af59-014faae9bb19	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55f6-a48f-8267-b47c1ef0ab0e
\.


--
-- TOC entry 2945 (class 0 OID 19177939)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2960 (class 0 OID 19178118)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55f6-a492-81fb-f401f6731856	00180000-55f6-a491-2bb4-8eacf6609fdd	000c0000-55f6-a492-7d58-1dc7351f7fa4	00090000-55f6-a491-63e9-14a2245d7ed7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f6-a492-c948-471ad9921071	00180000-55f6-a491-2bb4-8eacf6609fdd	000c0000-55f6-a492-666b-1d2626e900c4	00090000-55f6-a491-8368-351d8095dc86	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f6-a492-b232-e6a13cf7ef4b	00180000-55f6-a491-2bb4-8eacf6609fdd	000c0000-55f6-a492-db69-51e174bbb2bd	00090000-55f6-a491-60ca-3589ab5cd7cf	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f6-a492-858f-551e01bf7551	00180000-55f6-a491-2bb4-8eacf6609fdd	000c0000-55f6-a492-bbf7-9efdb5305d95	00090000-55f6-a491-bc1d-fc164f7f426e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f6-a492-4456-eaeb8b04df3f	00180000-55f6-a491-2bb4-8eacf6609fdd	000c0000-55f6-a492-e1cc-8aed2607838b	00090000-55f6-a491-8421-233552dd2d8c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55f6-a492-5903-07283d1a2ccf	00180000-55f6-a491-1e86-997b2120b0f0	\N	00090000-55f6-a491-8421-233552dd2d8c	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2981 (class 0 OID 19178322)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55f6-a48f-b23a-9e3ba7a3ef75	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55f6-a48f-ed1e-5cc2c9b9ff13	02	Priredba	Priredba	Priredba	umetnik
000f0000-55f6-a48f-ab5f-e2531dd192d7	03	Prevod	Prevod	Prevod	umetnik
000f0000-55f6-a48f-b225-49a3ca349da8	04	Režija	Režija	Režija	umetnik
000f0000-55f6-a48f-a893-3e8bd2adb37e	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55f6-a48f-fb8c-0a9257589161	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55f6-a48f-d368-f7b80f638027	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55f6-a48f-c445-0e47e0f7f5e8	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55f6-a48f-a2ab-968fe978733b	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55f6-a48f-ae76-e6d03d6595f3	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55f6-a48f-e68a-f0d853b36807	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55f6-a48f-14a5-b51593152cbb	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55f6-a48f-d9c5-83633b6feea1	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55f6-a48f-1497-978fe56167aa	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55f6-a48f-25f8-52d4054974ba	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55f6-a48f-0b2a-4f5073b9815a	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55f6-a48f-a6db-50fa13aeb049	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55f6-a48f-44e9-cb8cbed1e46a	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2994 (class 0 OID 19178566)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55f6-a48f-aa13-e16fee8faf8a	01	Velika predstava	f	1.00	1.00
002b0000-55f6-a48f-9882-dd673589e2c0	02	Mala predstava	f	0.50	0.50
002b0000-55f6-a48f-5d6e-02933eec33c6	03	Mala koprodukcija	t	0.40	1.00
002b0000-55f6-a48f-fc86-83f1ceedcaf0	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55f6-a48f-13c9-3640b6b1145f	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2950 (class 0 OID 19178001)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 19177848)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55f6-a490-ede2-6a0833454a61	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROz4ubL3sEoQofKP4qIl0gGEgA1yxn0Uq	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55f6-a491-c7af-3ea4ebdeeabf	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55f6-a491-b2b9-f0b233243873	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55f6-a491-e887-477d218fcc1f	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55f6-a491-6b20-8ac90367095b	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55f6-a491-66ce-bfc4ec196b41	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55f6-a491-2513-5716cbce789d	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55f6-a491-c883-4981f2e1e522	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55f6-a491-0a99-4c1c891c3bec	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55f6-a491-c6a5-7d35a0a88dc0	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55f6-a491-c650-b58a99a37c57	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55f6-a490-30ee-5f3b926dc639	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2985 (class 0 OID 19178371)
-- Dependencies: 224
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55f6-a491-018b-7df3d334c2c3	00160000-55f6-a491-485a-c5b43245069a	\N	00140000-55f6-a48f-053c-c7f99a08d3c6	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55f6-a491-d7bd-48b0bc7a3473
000e0000-55f6-a491-88da-90a4dde146b1	00160000-55f6-a491-67f8-c4fefd1c8a7a	\N	00140000-55f6-a48f-31fe-a0c9668f1b1e	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55f6-a491-b845-016553217715
000e0000-55f6-a491-dc94-64b5a85c0b08	\N	\N	00140000-55f6-a48f-31fe-a0c9668f1b1e	00190000-55f6-a491-1bfa-0e26534597d0	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55f6-a491-d7bd-48b0bc7a3473
000e0000-55f6-a491-da88-4610daab0c15	\N	\N	00140000-55f6-a48f-31fe-a0c9668f1b1e	00190000-55f6-a491-1bfa-0e26534597d0	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55f6-a491-d7bd-48b0bc7a3473
000e0000-55f6-a491-609b-b6537339b4db	\N	\N	00140000-55f6-a48f-31fe-a0c9668f1b1e	00190000-55f6-a491-1bfa-0e26534597d0	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55f6-a491-b482-af08e20df31f
000e0000-55f6-a491-ca93-9406b4f09963	\N	\N	00140000-55f6-a48f-31fe-a0c9668f1b1e	00190000-55f6-a491-1bfa-0e26534597d0	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55f6-a491-b482-af08e20df31f
\.


--
-- TOC entry 2955 (class 0 OID 19178062)
-- Dependencies: 194
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55f6-a491-07ce-f9d25050f3fc	000e0000-55f6-a491-88da-90a4dde146b1	\N	1	
00200000-55f6-a491-d095-dafe4ea73e8c	000e0000-55f6-a491-88da-90a4dde146b1	\N	2	
00200000-55f6-a491-c3d6-bd289b754ef7	000e0000-55f6-a491-88da-90a4dde146b1	\N	3	
00200000-55f6-a491-12c8-ca760f97afc2	000e0000-55f6-a491-88da-90a4dde146b1	\N	4	
00200000-55f6-a491-2a6c-76b8338b58d7	000e0000-55f6-a491-88da-90a4dde146b1	\N	5	
\.


--
-- TOC entry 2969 (class 0 OID 19178189)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 19178295)
-- Dependencies: 218
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55f6-a48f-e37f-5d45a1e6833f	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55f6-a48f-0653-cb93d6b8ff91	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55f6-a48f-dd7e-ab8606ef8ea7	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55f6-a48f-4179-1d867c1ebbe5	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55f6-a48f-3dfc-c57bb150eabe	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55f6-a48f-383d-022bf939c50a	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55f6-a48f-759a-40c7b8390e88	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55f6-a48f-a228-a75b3eeef2e7	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55f6-a48f-8267-b47c1ef0ab0e	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55f6-a48f-76a9-56a29a08e734	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55f6-a48f-e783-f67d76bc3d93	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55f6-a48f-c8b9-dae94a7d7820	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55f6-a48f-9569-835170be2004	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55f6-a48f-672d-7f431b462547	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55f6-a48f-18ab-7ad1b9ec3292	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55f6-a48f-618b-f59ed97b24ac	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55f6-a48f-191c-18297e21e01f	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55f6-a48f-f44c-b5760ea84017	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55f6-a48f-5574-1338d962e853	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55f6-a48f-e072-b6bbb231c87a	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55f6-a48f-d43c-c8273649bd0d	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55f6-a48f-ce52-60f1f6b9bad4	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55f6-a48f-e58c-86076f47edc0	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55f6-a48f-4ca9-ccb79c16c380	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55f6-a48f-c1e7-c3e1e6679e5c	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55f6-a48f-a700-7c2949bae410	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55f6-a48f-1fd7-af381cb117f5	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55f6-a48f-be89-5b59156f13c0	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2997 (class 0 OID 19178612)
-- Dependencies: 236
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 19178584)
-- Dependencies: 235
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 19178624)
-- Dependencies: 237
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 19178261)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55f6-a492-7749-42daa907c3af	00090000-55f6-a491-8368-351d8095dc86	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f6-a492-2411-cf726594f48a	00090000-55f6-a491-60ca-3589ab5cd7cf	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f6-a492-065c-b025ccd70a1d	00090000-55f6-a491-15fa-42d8c9e91669	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f6-a492-32e1-5785e763d09c	00090000-55f6-a491-0042-b5b6d63bbfdb	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f6-a492-8994-3cc87853f56a	00090000-55f6-a491-63e9-14a2245d7ed7	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55f6-a492-f3d4-72ed35bf378b	00090000-55f6-a491-a66e-afa4d58cf64c	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2957 (class 0 OID 19178098)
-- Dependencies: 196
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 19178361)
-- Dependencies: 223
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55f6-a48f-053c-c7f99a08d3c6	01	Drama	drama (SURS 01)
00140000-55f6-a48f-9084-888d13386c94	02	Opera	opera (SURS 02)
00140000-55f6-a48f-5af0-07487a91ce90	03	Balet	balet (SURS 03)
00140000-55f6-a48f-8e97-7ebd2878358e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55f6-a48f-dd7a-b69e884273d0	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55f6-a48f-31fe-a0c9668f1b1e	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55f6-a48f-6b18-7e8db0ef8ca5	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2975 (class 0 OID 19178251)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2484 (class 2606 OID 19177902)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 19178420)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 19178410)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 19178320)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 19178664)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 19178087)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 19178107)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 19178582)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 19178027)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 19178475)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 19178247)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 19178060)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 19178041)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 19178154)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 19178641)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 19178648)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2723 (class 2606 OID 19178672)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 19178181)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 19177999)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 19177911)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 19177935)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 19177891)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2475 (class 2606 OID 19177876)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 19178187)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 19178223)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 19178356)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 19177963)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 19177987)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 18175937)
-- Name: postavkac2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkac2
    ADD CONSTRAINT postavkac2_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 19178536)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 19178160)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 19177977)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 19178048)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 19178172)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 19178545)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 19178553)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 19178523)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 19178564)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 19178205)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 19178145)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 19178136)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 19178344)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 19178278)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 19177847)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 19178214)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 19177865)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2477 (class 2606 OID 19177885)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 19178232)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 19178167)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 19178116)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 19177835)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 19177823)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 19177817)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 19178291)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 19177944)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 19178127)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 19178331)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 19178576)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 19178012)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 19177860)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 19178389)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 19178070)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 19178195)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 19178303)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 19178622)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 19178606)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 19178630)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 19178269)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 19178102)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 19178369)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 19178259)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 1259 OID 19178096)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2540 (class 1259 OID 19178097)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2541 (class 1259 OID 19178095)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2542 (class 1259 OID 19178094)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2543 (class 1259 OID 19178093)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2624 (class 1259 OID 19178292)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2625 (class 1259 OID 19178293)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2626 (class 1259 OID 19178294)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2709 (class 1259 OID 19178643)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2710 (class 1259 OID 19178642)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2498 (class 1259 OID 19177965)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2587 (class 1259 OID 19178188)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2696 (class 1259 OID 19178610)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2697 (class 1259 OID 19178609)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2698 (class 1259 OID 19178611)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2699 (class 1259 OID 19178608)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2700 (class 1259 OID 19178607)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2581 (class 1259 OID 19178174)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2582 (class 1259 OID 19178173)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2534 (class 1259 OID 19178071)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2611 (class 1259 OID 19178248)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2612 (class 1259 OID 19178250)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2613 (class 1259 OID 19178249)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2523 (class 1259 OID 19178043)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2524 (class 1259 OID 19178042)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2688 (class 1259 OID 19178565)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2640 (class 1259 OID 19178358)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 19178359)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2642 (class 1259 OID 19178360)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2706 (class 1259 OID 19178631)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2649 (class 1259 OID 19178394)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2650 (class 1259 OID 19178391)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2651 (class 1259 OID 19178395)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2652 (class 1259 OID 19178393)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2653 (class 1259 OID 19178392)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2513 (class 1259 OID 19178014)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2514 (class 1259 OID 19178013)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2489 (class 1259 OID 19177938)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2599 (class 1259 OID 19178215)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2479 (class 1259 OID 19177892)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2480 (class 1259 OID 19177893)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2604 (class 1259 OID 19178235)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2605 (class 1259 OID 19178234)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2606 (class 1259 OID 19178233)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2527 (class 1259 OID 19178049)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2528 (class 1259 OID 19178050)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2459 (class 1259 OID 19177825)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2561 (class 1259 OID 19178140)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2562 (class 1259 OID 19178138)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2563 (class 1259 OID 19178137)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2564 (class 1259 OID 19178139)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2470 (class 1259 OID 19177866)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2471 (class 1259 OID 19177867)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2590 (class 1259 OID 19178196)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2719 (class 1259 OID 19178665)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2720 (class 1259 OID 19178673)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2721 (class 1259 OID 19178674)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2576 (class 1259 OID 19178161)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2620 (class 1259 OID 19178279)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2621 (class 1259 OID 19178280)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2670 (class 1259 OID 19178480)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2671 (class 1259 OID 19178479)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2672 (class 1259 OID 19178476)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2673 (class 1259 OID 19178477)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2674 (class 1259 OID 19178478)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2502 (class 1259 OID 19177979)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2503 (class 1259 OID 19177978)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2504 (class 1259 OID 19177980)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2593 (class 1259 OID 19178209)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2594 (class 1259 OID 19178208)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2680 (class 1259 OID 19178546)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2681 (class 1259 OID 19178547)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2663 (class 1259 OID 19178424)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2664 (class 1259 OID 19178425)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2665 (class 1259 OID 19178422)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2666 (class 1259 OID 19178423)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2617 (class 1259 OID 19178270)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2567 (class 1259 OID 19178149)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2568 (class 1259 OID 19178148)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2569 (class 1259 OID 19178146)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2570 (class 1259 OID 19178147)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2659 (class 1259 OID 19178412)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2660 (class 1259 OID 19178411)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2533 (class 1259 OID 19178061)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2677 (class 1259 OID 19178537)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2454 (class 1259 OID 18175938)
-- Name: idx_e03797c39e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e03797c39e3adf2c ON postavkac2 USING btree (programdela_id);


--
-- TOC entry 2695 (class 1259 OID 19178583)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2713 (class 1259 OID 19178649)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2714 (class 1259 OID 19178650)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2485 (class 1259 OID 19177913)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2486 (class 1259 OID 19177912)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2494 (class 1259 OID 19177945)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2495 (class 1259 OID 19177946)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2556 (class 1259 OID 19178130)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2557 (class 1259 OID 19178129)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2558 (class 1259 OID 19178128)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2544 (class 1259 OID 19178089)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2545 (class 1259 OID 19178090)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2546 (class 1259 OID 19178088)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2547 (class 1259 OID 19178092)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2548 (class 1259 OID 19178091)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2501 (class 1259 OID 19177964)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2519 (class 1259 OID 19178028)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 19178030)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2521 (class 1259 OID 19178029)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2522 (class 1259 OID 19178031)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2575 (class 1259 OID 19178155)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2645 (class 1259 OID 19178357)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2654 (class 1259 OID 19178390)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2636 (class 1259 OID 19178332)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 19178333)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2492 (class 1259 OID 19177936)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2493 (class 1259 OID 19177937)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2614 (class 1259 OID 19178260)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2465 (class 1259 OID 19177836)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2512 (class 1259 OID 19178000)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2462 (class 1259 OID 19177824)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2597 (class 1259 OID 19178207)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2598 (class 1259 OID 19178206)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2667 (class 1259 OID 19178421)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2509 (class 1259 OID 19177988)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2646 (class 1259 OID 19178370)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2703 (class 1259 OID 19178623)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2686 (class 1259 OID 19178554)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2687 (class 1259 OID 19178555)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2633 (class 1259 OID 19178321)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2555 (class 1259 OID 19178117)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2478 (class 1259 OID 19177886)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2752 (class 2606 OID 19178795)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2751 (class 2606 OID 19178800)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2747 (class 2606 OID 19178820)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2753 (class 2606 OID 19178790)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2749 (class 2606 OID 19178810)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2748 (class 2606 OID 19178815)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2750 (class 2606 OID 19178805)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2785 (class 2606 OID 19178970)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2784 (class 2606 OID 19178975)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2783 (class 2606 OID 19178980)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2817 (class 2606 OID 19179145)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2818 (class 2606 OID 19179140)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2735 (class 2606 OID 19178730)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2769 (class 2606 OID 19178900)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2812 (class 2606 OID 19179125)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2813 (class 2606 OID 19179120)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2811 (class 2606 OID 19179130)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2814 (class 2606 OID 19179115)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2815 (class 2606 OID 19179110)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2767 (class 2606 OID 19178895)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2768 (class 2606 OID 19178890)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2746 (class 2606 OID 19178785)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2779 (class 2606 OID 19178940)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2777 (class 2606 OID 19178950)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2778 (class 2606 OID 19178945)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2741 (class 2606 OID 19178765)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2742 (class 2606 OID 19178760)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2765 (class 2606 OID 19178880)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2809 (class 2606 OID 19179100)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2788 (class 2606 OID 19178985)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 19178990)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2786 (class 2606 OID 19178995)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2816 (class 2606 OID 19179135)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2790 (class 2606 OID 19179015)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2793 (class 2606 OID 19179000)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2789 (class 2606 OID 19179020)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2791 (class 2606 OID 19179010)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2792 (class 2606 OID 19179005)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2739 (class 2606 OID 19178755)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2740 (class 2606 OID 19178750)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2731 (class 2606 OID 19178715)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2732 (class 2606 OID 19178710)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2773 (class 2606 OID 19178920)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2728 (class 2606 OID 19178690)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2727 (class 2606 OID 19178695)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2774 (class 2606 OID 19178935)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2775 (class 2606 OID 19178930)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2776 (class 2606 OID 19178925)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2744 (class 2606 OID 19178770)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2743 (class 2606 OID 19178775)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2724 (class 2606 OID 19178675)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2757 (class 2606 OID 19178855)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2759 (class 2606 OID 19178845)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2760 (class 2606 OID 19178840)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2758 (class 2606 OID 19178850)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2726 (class 2606 OID 19178680)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2725 (class 2606 OID 19178685)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2770 (class 2606 OID 19178905)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2821 (class 2606 OID 19179160)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2823 (class 2606 OID 19179165)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2822 (class 2606 OID 19179170)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2766 (class 2606 OID 19178885)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2782 (class 2606 OID 19178960)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2781 (class 2606 OID 19178965)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2800 (class 2606 OID 19179075)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2801 (class 2606 OID 19179070)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2804 (class 2606 OID 19179055)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2803 (class 2606 OID 19179060)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2802 (class 2606 OID 19179065)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2737 (class 2606 OID 19178740)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2738 (class 2606 OID 19178735)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2736 (class 2606 OID 19178745)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2771 (class 2606 OID 19178915)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2772 (class 2606 OID 19178910)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2807 (class 2606 OID 19179085)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2806 (class 2606 OID 19179090)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2797 (class 2606 OID 19179045)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2796 (class 2606 OID 19179050)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2799 (class 2606 OID 19179035)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2798 (class 2606 OID 19179040)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2780 (class 2606 OID 19178955)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2761 (class 2606 OID 19178875)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2762 (class 2606 OID 19178870)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2764 (class 2606 OID 19178860)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2763 (class 2606 OID 19178865)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2794 (class 2606 OID 19179030)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2795 (class 2606 OID 19179025)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2745 (class 2606 OID 19178780)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2805 (class 2606 OID 19179080)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2808 (class 2606 OID 19179095)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2810 (class 2606 OID 19179105)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2820 (class 2606 OID 19179150)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2819 (class 2606 OID 19179155)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2729 (class 2606 OID 19178705)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2730 (class 2606 OID 19178700)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2734 (class 2606 OID 19178720)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2733 (class 2606 OID 19178725)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2754 (class 2606 OID 19178835)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2755 (class 2606 OID 19178830)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2756 (class 2606 OID 19178825)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-14 12:42:28 CEST

--
-- PostgreSQL database dump complete
--

