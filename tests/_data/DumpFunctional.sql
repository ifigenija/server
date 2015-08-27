--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-27 12:27:21 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 241 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2981 (class 0 OID 0)
-- Dependencies: 241
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 177 (class 1259 OID 15887515)
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
-- TOC entry 223 (class 1259 OID 15888031)
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
-- TOC entry 222 (class 1259 OID 15888014)
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
-- TOC entry 216 (class 1259 OID 15887924)
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
-- TOC entry 239 (class 1259 OID 15888280)
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
-- TOC entry 191 (class 1259 OID 15887693)
-- Name: dogodek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodek (
    id uuid NOT NULL,
    predstava_id uuid,
    zasedenost_id uuid,
    vaja_id uuid,
    gostovanje_id uuid,
    dogodek_izven_id uuid,
    prostor_id uuid,
    sezona_id uuid,
    planiranzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status integer,
    razred character varying(10) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 15887727)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 15888182)
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
-- TOC entry 186 (class 1259 OID 15887636)
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
-- TOC entry 224 (class 1259 OID 15888044)
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
-- TOC entry 210 (class 1259 OID 15887859)
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
-- TOC entry 189 (class 1259 OID 15887673)
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
-- TOC entry 193 (class 1259 OID 15887721)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 15887653)
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
-- TOC entry 199 (class 1259 OID 15887774)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 237 (class 1259 OID 15888261)
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
-- TOC entry 238 (class 1259 OID 15888273)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 15888295)
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
-- TOC entry 203 (class 1259 OID 15887799)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 15887610)
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
-- TOC entry 178 (class 1259 OID 15887524)
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
-- TOC entry 179 (class 1259 OID 15887535)
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
    email character varying(40) DEFAULT NULL::character varying,
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
-- TOC entry 174 (class 1259 OID 15887489)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 15887508)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 15887806)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 15887839)
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
-- TOC entry 219 (class 1259 OID 15887963)
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
-- TOC entry 181 (class 1259 OID 15887568)
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
-- TOC entry 183 (class 1259 OID 15887602)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 15887780)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 15887587)
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
-- TOC entry 188 (class 1259 OID 15887665)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 15887792)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 15888143)
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
-- TOC entry 227 (class 1259 OID 15888153)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 15888099)
-- Name: programdela; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programdela (
    id uuid NOT NULL,
    sezona_id uuid,
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
-- TOC entry 228 (class 1259 OID 15888161)
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
-- TOC entry 206 (class 1259 OID 15887821)
-- Name: prostor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prostor (
    id uuid NOT NULL,
    popa_id uuid,
    naslov_id uuid,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    jeprizorisce boolean,
    kapaciteta integer,
    opis text
);


--
-- TOC entry 198 (class 1259 OID 15887765)
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
-- TOC entry 197 (class 1259 OID 15887755)
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
-- TOC entry 218 (class 1259 OID 15887952)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 15887891)
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
-- TOC entry 171 (class 1259 OID 15887460)
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
-- TOC entry 170 (class 1259 OID 15887458)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2982 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 207 (class 1259 OID 15887833)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 15887498)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 15887482)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 15887847)
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
-- TOC entry 201 (class 1259 OID 15887786)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 15887732)
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
-- TOC entry 233 (class 1259 OID 15888202)
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
-- TOC entry 232 (class 1259 OID 15888194)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 15888189)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 15887901)
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
-- TOC entry 180 (class 1259 OID 15887560)
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
-- TOC entry 196 (class 1259 OID 15887742)
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
-- TOC entry 217 (class 1259 OID 15887941)
-- Name: tipfunkcije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipfunkcije (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis text,
    imezenski character varying(255) DEFAULT NULL::character varying,
    podrocje character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 15888171)
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
-- TOC entry 185 (class 1259 OID 15887622)
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
-- TOC entry 172 (class 1259 OID 15887469)
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
-- TOC entry 221 (class 1259 OID 15887989)
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
-- TOC entry 190 (class 1259 OID 15887684)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 15887813)
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
-- TOC entry 215 (class 1259 OID 15887915)
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
-- TOC entry 235 (class 1259 OID 15888241)
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
-- TOC entry 234 (class 1259 OID 15888213)
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
-- TOC entry 236 (class 1259 OID 15888253)
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
-- TOC entry 212 (class 1259 OID 15887884)
-- Name: zaposlitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zaposlitev (
    id uuid NOT NULL,
    oseba_id uuid,
    sifra character varying(10) NOT NULL,
    status character varying(10) NOT NULL,
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
-- TOC entry 192 (class 1259 OID 15887716)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 15887979)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 15887874)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 15887463)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2911 (class 0 OID 15887515)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2957 (class 0 OID 15888031)
-- Dependencies: 223
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55de-e607-f35f-91e2a7e22442	000d0000-55de-e607-4fb4-0cc0f0ebaf65	\N	00090000-55de-e607-89bc-f08cc37f4fc2	000b0000-55de-e607-e3ef-d3bf5cd20f71	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55de-e607-aa58-e080da3d27c4	000d0000-55de-e607-fbfb-2c716d72f4e6	00100000-55de-e607-2cc1-4453d0d185ac	00090000-55de-e607-9394-727601b88350	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55de-e607-dd0d-d0255cfc661c	000d0000-55de-e607-fea2-e415caedf8fc	00100000-55de-e607-369d-4a2866349f78	00090000-55de-e607-3a08-c80fe1b0791a	\N	0003	t	\N	2015-08-27	\N	2	\N	\N	f	f
000c0000-55de-e607-2d0d-5bf762e55b70	000d0000-55de-e607-9f2c-afc3887a25ef	\N	00090000-55de-e607-98ed-b03cbbabc3f8	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55de-e607-6697-c37e690f1c8b	000d0000-55de-e607-cdef-777aa6ceb279	\N	00090000-55de-e607-083a-84ab20fea9e6	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55de-e607-d09d-f0bf90cf6c2f	000d0000-55de-e607-7f3f-94402e3632c5	\N	00090000-55de-e607-60e4-339fd309b640	000b0000-55de-e607-6e8a-5c76c0cca4b3	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55de-e607-d2d5-428667753d6e	000d0000-55de-e607-567d-2bed658a2524	00100000-55de-e607-71f5-1af1333f8a0c	00090000-55de-e607-7928-6fb3cca4beb0	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55de-e607-0613-59cb35a06fb0	000d0000-55de-e607-4431-7f56fa98028a	\N	00090000-55de-e607-a152-961085aa21b7	000b0000-55de-e607-b603-2c3fb22153cd	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55de-e607-06d5-fdeeb12c3b7a	000d0000-55de-e607-567d-2bed658a2524	00100000-55de-e607-c594-98320defe71f	00090000-55de-e607-cdef-105acf7ab9cf	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55de-e607-0e3a-7b71f8487da9	000d0000-55de-e607-567d-2bed658a2524	00100000-55de-e607-957c-379964e9d152	00090000-55de-e607-d73d-07994a1854d8	\N	0010	t	\N	2015-08-27	\N	16	\N	\N	f	t
000c0000-55de-e607-abd4-232593a5d889	000d0000-55de-e607-567d-2bed658a2524	00100000-55de-e607-dae1-27202a0ade84	00090000-55de-e607-b855-425d936e135f	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2956 (class 0 OID 15888014)
-- Dependencies: 222
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 15887924)
-- Dependencies: 216
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55de-e607-37ce-155e6ebd7262	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55de-e607-07aa-9f64d152a422	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55de-e607-5d6e-3f2c9ae1fd33	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2973 (class 0 OID 15888280)
-- Dependencies: 239
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2925 (class 0 OID 15887693)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55de-e607-eac4-1f4fdc41ba60	\N	\N	00200000-55de-e607-db39-ec9e1aa6c8a2	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55de-e607-60c5-89becbfccfbb	\N	\N	00200000-55de-e607-266f-125d2a6a1ff6	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55de-e607-90f7-9963952d9abb	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55de-e607-bc95-b18b79c439f1	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55de-e607-5a7e-855dadeaf4d6	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2928 (class 0 OID 15887727)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 15888182)
-- Dependencies: 230
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 15887636)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55de-e605-f6f5-c0369b97bf90	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55de-e605-fe8f-700e28993e63	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55de-e605-0972-2bbe787cd8a6	AL	ALB	008	Albania 	Albanija	\N
00040000-55de-e605-8219-6acd25b98bfd	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55de-e605-8fda-119e28395ea5	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55de-e605-7b6f-ad8c0ed24137	AD	AND	020	Andorra 	Andora	\N
00040000-55de-e605-fa1e-232d65c7359b	AO	AGO	024	Angola 	Angola	\N
00040000-55de-e605-844a-bad02d246432	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55de-e605-6624-fe1a51310f0a	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55de-e605-28bf-5b4e6afc30c5	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55de-e605-b416-2a900631d093	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55de-e605-6ffd-1142d48410d6	AM	ARM	051	Armenia 	Armenija	\N
00040000-55de-e605-fdb9-c5e44d511b30	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55de-e605-0131-6de425811899	AU	AUS	036	Australia 	Avstralija	\N
00040000-55de-e605-0b9c-9c3701cdad3b	AT	AUT	040	Austria 	Avstrija	\N
00040000-55de-e605-4937-772509932bf5	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55de-e605-0b9b-5ff8c0134be9	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55de-e605-f838-d4adc85ba0e9	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55de-e605-3b0c-de6dab65c651	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55de-e605-9047-3149ef68b417	BB	BRB	052	Barbados 	Barbados	\N
00040000-55de-e605-9f96-e10ef8b23f56	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55de-e605-5c44-75bbc27c172e	BE	BEL	056	Belgium 	Belgija	\N
00040000-55de-e605-b08a-5605c9877d94	BZ	BLZ	084	Belize 	Belize	\N
00040000-55de-e605-03e1-32b093a391a0	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55de-e605-fc06-c96519449510	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55de-e605-8f2e-29f3b4f09b64	BT	BTN	064	Bhutan 	Butan	\N
00040000-55de-e605-c040-cd39e7e7e8ea	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55de-e605-fd86-e465317b9fe1	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55de-e605-c258-733568d57a11	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55de-e605-1d83-1c65f6883d7d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55de-e605-82db-24260bac4c01	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55de-e605-ceb3-0103eb51c204	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55de-e605-6662-b603d8d86a81	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55de-e605-4d94-234487d9d69d	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55de-e605-9329-f04ccd07c088	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55de-e605-98e5-5cec473352bf	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55de-e605-c4d3-10f1470dc086	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55de-e605-c578-0621a3f97127	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55de-e605-7d94-dabc4210e529	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55de-e605-e71c-42f2c19512aa	CA	CAN	124	Canada 	Kanada	\N
00040000-55de-e605-5b33-f8251b8ef82a	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55de-e605-fb69-137115390951	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55de-e605-9d50-188e33f4754f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55de-e605-2cb2-9e82fc7392cf	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55de-e605-5dc5-c0da81be817a	CL	CHL	152	Chile 	Čile	\N
00040000-55de-e605-fbfb-85f79c73f1d6	CN	CHN	156	China 	Kitajska	\N
00040000-55de-e605-5731-1a83992dbb42	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55de-e605-89ef-c13d11068a72	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55de-e605-1b49-beb3c38884ce	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55de-e605-8819-c9e9189e3cb3	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55de-e605-13be-9e6f13c4cd99	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55de-e605-1846-22ec0ee76b27	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55de-e605-9cbd-e5fc94883702	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55de-e605-fd3a-b8abb6eb054e	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55de-e605-e67b-a99a15b12706	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55de-e605-4d3f-946dd59cdf50	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55de-e605-2a7a-275ea65038d0	CU	CUB	192	Cuba 	Kuba	\N
00040000-55de-e605-4210-04fd968e82ea	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55de-e605-e48b-daa1c026a977	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55de-e605-341b-287664e184bc	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55de-e605-c88f-a90bac283e28	DK	DNK	208	Denmark 	Danska	\N
00040000-55de-e605-f009-2925f4b74103	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55de-e605-0e39-c3d9750ca650	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55de-e605-4f2d-0f5830e94a2e	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55de-e605-7225-6a1cd1d89a3d	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55de-e605-3b00-ce5086a7f0de	EG	EGY	818	Egypt 	Egipt	\N
00040000-55de-e605-04c3-ee65ddd8cb66	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55de-e605-feb5-05c5655510cf	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55de-e605-b169-4204b76c71fc	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55de-e605-600f-41ef34c6a7a7	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55de-e605-3422-c6003007f986	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55de-e605-b14f-e5c0c8c8d109	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55de-e605-d42a-4f1c91ff7c83	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55de-e605-3513-3c2892134d94	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55de-e605-8466-0ca60ff3f089	FI	FIN	246	Finland 	Finska	\N
00040000-55de-e605-190c-4ca11451858a	FR	FRA	250	France 	Francija	\N
00040000-55de-e605-90f6-37f21832f1d3	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55de-e605-4f0a-4bfa218d670a	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55de-e605-f798-075a16aa8798	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55de-e605-0abc-62cda9ab07d2	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55de-e605-d926-20c1699723d6	GA	GAB	266	Gabon 	Gabon	\N
00040000-55de-e605-b3ad-bb4c207fdabe	GM	GMB	270	Gambia 	Gambija	\N
00040000-55de-e605-f9d2-4f02f0e14ca4	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55de-e605-3192-4b3c86382cb5	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55de-e605-6cc4-5c1470abed8b	GH	GHA	288	Ghana 	Gana	\N
00040000-55de-e605-6a10-5f15af0358bf	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55de-e605-bcb4-3b73cd305acf	GR	GRC	300	Greece 	Grčija	\N
00040000-55de-e605-6242-6824b07b125e	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55de-e605-fa86-ce8a717d1dad	GD	GRD	308	Grenada 	Grenada	\N
00040000-55de-e605-d386-d8661b86b277	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55de-e605-c988-3be1836c5bfc	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55de-e605-3c3b-2e548ab72468	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55de-e605-c88a-d24da6a84336	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55de-e605-12ba-6b2658ad1987	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55de-e605-bf44-23bf96d40e2f	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55de-e605-e9fc-7c12b21f9a98	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55de-e605-ba43-7ddd0855c950	HT	HTI	332	Haiti 	Haiti	\N
00040000-55de-e605-eb8c-b28be182a3e7	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55de-e605-4277-41e97a40a728	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55de-e605-e798-f4d19448d1f2	HN	HND	340	Honduras 	Honduras	\N
00040000-55de-e605-73ac-1819cc9e0df6	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55de-e605-234f-84fda4a09014	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55de-e605-5350-8dd856cdc7b3	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55de-e605-271c-7ddf0495bd23	IN	IND	356	India 	Indija	\N
00040000-55de-e605-ba91-9d4bbd64685f	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55de-e605-4121-e1db82f246ca	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55de-e605-540e-60d49b527aa5	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55de-e605-cd52-c32080cd88da	IE	IRL	372	Ireland 	Irska	\N
00040000-55de-e605-ba04-3d1aff377ef3	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55de-e605-9f6b-a4e5e5ad8bd0	IL	ISR	376	Israel 	Izrael	\N
00040000-55de-e605-0686-3c231a0235ad	IT	ITA	380	Italy 	Italija	\N
00040000-55de-e605-0b52-8e751883cdd4	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55de-e605-2fe1-5878b331ee38	JP	JPN	392	Japan 	Japonska	\N
00040000-55de-e605-65a7-9dda006af942	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55de-e605-73dd-204f683fd245	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55de-e605-8c73-985442f0142a	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55de-e605-abb6-c11dce15ea10	KE	KEN	404	Kenya 	Kenija	\N
00040000-55de-e605-a993-6d400748d057	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55de-e605-f059-52b96b33b990	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55de-e605-7fa4-6caef3a0ff53	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55de-e605-3abe-1b0dfbd79edd	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55de-e605-7e04-13a07715dffa	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55de-e605-0c74-4be478f98b9a	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55de-e605-1b10-59868bbc0fed	LV	LVA	428	Latvia 	Latvija	\N
00040000-55de-e605-6668-f4c673a77c6d	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55de-e605-fde7-4a3ef4994ad8	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55de-e605-2360-c79ea75b072b	LR	LBR	430	Liberia 	Liberija	\N
00040000-55de-e605-1d2a-0218769e4c4a	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55de-e605-4e28-e6ba4ca4032b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55de-e605-f015-2ac9be86fa1e	LT	LTU	440	Lithuania 	Litva	\N
00040000-55de-e605-dcd4-b7863fd76d93	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55de-e605-96b1-c5febd6d3852	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55de-e605-6cc9-2d450f05953a	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55de-e605-abdc-2c7a4d266f01	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55de-e605-9c71-be31cf192821	MW	MWI	454	Malawi 	Malavi	\N
00040000-55de-e605-5cc6-5bfbc60f7015	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55de-e605-d2b6-de4c1ff3dd40	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55de-e605-c187-f9efc8467e7c	ML	MLI	466	Mali 	Mali	\N
00040000-55de-e605-b920-06771928e6d1	MT	MLT	470	Malta 	Malta	\N
00040000-55de-e605-76d6-84b56fe676b0	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55de-e605-9d0f-153ef61f35ca	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55de-e605-6eed-853c63fb92a7	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55de-e605-e3e8-10e45fe7afeb	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55de-e605-65e8-33031d7f7b27	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55de-e605-dcbd-b81031eb8754	MX	MEX	484	Mexico 	Mehika	\N
00040000-55de-e605-e039-11052ee3bf8e	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55de-e605-9346-ea0b48ff2fa6	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55de-e605-e3d6-b2fa41f55250	MC	MCO	492	Monaco 	Monako	\N
00040000-55de-e605-32f3-faf40a435f54	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55de-e605-109f-770b67912088	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55de-e605-e62b-e838474176a0	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55de-e605-ceb5-00cf3b53c319	MA	MAR	504	Morocco 	Maroko	\N
00040000-55de-e605-6d85-646e7e6819b0	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55de-e605-f3eb-a4f9383ae0f0	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55de-e605-2bb8-6f7f71cd6a43	NA	NAM	516	Namibia 	Namibija	\N
00040000-55de-e605-8e44-0996fe435354	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55de-e605-2a1b-a1c24bc30f04	NP	NPL	524	Nepal 	Nepal	\N
00040000-55de-e605-f5bc-ddb946047ba2	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55de-e605-e770-79f7561716a0	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55de-e605-05de-be6e022af2e3	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55de-e605-20f6-54be1db40c6c	NE	NER	562	Niger 	Niger 	\N
00040000-55de-e605-49db-15839e1cc86c	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55de-e605-99d8-7affe2ed98a5	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55de-e606-f414-ad4a9d960772	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55de-e606-3f5e-fe82913e2071	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55de-e606-83e4-73c4b5572ca8	NO	NOR	578	Norway 	Norveška	\N
00040000-55de-e606-37dd-b80c0300978c	OM	OMN	512	Oman 	Oman	\N
00040000-55de-e606-2c5f-ab081bc26063	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55de-e606-88aa-47f5cacf232d	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55de-e606-eb59-254576b6439c	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55de-e606-3a4a-131f78978fa8	PA	PAN	591	Panama 	Panama	\N
00040000-55de-e606-c00c-d4ba5a173329	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55de-e606-5070-adeebaea3d3a	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55de-e606-c697-a805947a93d6	PE	PER	604	Peru 	Peru	\N
00040000-55de-e606-5101-f0460f07e038	PH	PHL	608	Philippines 	Filipini	\N
00040000-55de-e606-1b3c-c10b6b59f0c4	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55de-e606-b988-38513b9add35	PL	POL	616	Poland 	Poljska	\N
00040000-55de-e606-06b6-eabcf989287d	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55de-e606-faa0-af8b554c5c1e	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55de-e606-0c3c-a32de31bf37e	QA	QAT	634	Qatar 	Katar	\N
00040000-55de-e606-b9c7-61382872019f	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55de-e606-ba44-10b6a36b5ee3	RO	ROU	642	Romania 	Romunija	\N
00040000-55de-e606-f762-352675b9db97	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55de-e606-17db-a6c16d98a3a5	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55de-e606-c976-830c22148395	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55de-e606-9733-047d770445f0	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55de-e606-8eca-9bdb20116762	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55de-e606-ab15-2167715b3d25	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55de-e606-6917-08ee4a8df628	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55de-e606-1cf4-eae9cbe07642	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55de-e606-7bec-91708024db3b	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55de-e606-acdf-9eb55652ed97	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55de-e606-f90a-f44ff45178e4	SM	SMR	674	San Marino 	San Marino	\N
00040000-55de-e606-d332-966182f58d62	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55de-e606-d2c5-1479483d302a	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55de-e606-6ba2-892e7d8950ac	SN	SEN	686	Senegal 	Senegal	\N
00040000-55de-e606-75f5-91c637ba2dfc	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55de-e606-68d6-147d6a90dbc3	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55de-e606-5e21-c9d5f05bf599	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55de-e606-cd91-46affd563298	SG	SGP	702	Singapore 	Singapur	\N
00040000-55de-e606-5c89-b789eb29d978	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55de-e606-edb4-4f6dd73af897	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55de-e606-4096-41f2fabb0576	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55de-e606-c600-f269f413b27d	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55de-e606-d162-4b1af766c8a2	SO	SOM	706	Somalia 	Somalija	\N
00040000-55de-e606-9754-354c8c2dbc66	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55de-e606-68cc-27f016aa13a3	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55de-e606-22ab-5e4a8f36fa27	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55de-e606-002c-6e32d9517548	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55de-e606-4640-e895ba3624b3	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55de-e606-2d4f-240181c0445d	SD	SDN	729	Sudan 	Sudan	\N
00040000-55de-e606-a71e-8f2bf5dce408	SR	SUR	740	Suriname 	Surinam	\N
00040000-55de-e606-8f4a-4bfbbe4bb0c1	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55de-e606-f277-48e9024e6cdf	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55de-e606-8d61-988a930c348f	SE	SWE	752	Sweden 	Švedska	\N
00040000-55de-e606-86ef-5161cfa1ae56	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55de-e606-1d8a-bf1416740b05	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55de-e606-0688-fdeeb15d7026	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55de-e606-0f52-d795d123b34a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55de-e606-b6dd-7ff88d397c60	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55de-e606-6f1f-b19fc6db8ea2	TH	THA	764	Thailand 	Tajska	\N
00040000-55de-e606-6efe-c3e88babfc9d	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55de-e606-61c9-82e7980cbdb7	TG	TGO	768	Togo 	Togo	\N
00040000-55de-e606-7010-eceb594f0735	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55de-e606-81bf-5ec2151569a7	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55de-e606-2c91-ada83c37b6f4	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55de-e606-80fe-3b01186a3b5e	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55de-e606-1370-d245c490aa24	TR	TUR	792	Turkey 	Turčija	\N
00040000-55de-e606-7eef-5cc13202a372	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55de-e606-7eb6-4bde7e530168	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55de-e606-c124-193a24b04b85	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55de-e606-028b-4457ca93e74b	UG	UGA	800	Uganda 	Uganda	\N
00040000-55de-e606-6276-04e0afbba6f3	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55de-e606-2351-1c76cb460518	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55de-e606-afc1-d835668cd2c9	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55de-e606-a305-658416037e2e	US	USA	840	United States 	Združene države Amerike	\N
00040000-55de-e606-7a63-d8636f3a30de	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55de-e606-cbe9-6faca3af6335	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55de-e606-aa0b-9aceefabea45	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55de-e606-67af-671ab2c41bb7	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55de-e606-572d-4ffc48ecbcfc	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55de-e606-19d1-d0aa8f56e1e9	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55de-e606-9cb6-b9da889fe143	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55de-e606-f01f-3966f155b1c1	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55de-e606-733b-a2bd13c82e29	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55de-e606-5bd6-09e7fe978a22	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55de-e606-7383-09913d3294f6	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55de-e606-302e-9b2256cd2df2	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55de-e606-c274-d798c8653b29	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2958 (class 0 OID 15888044)
-- Dependencies: 224
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55de-e607-a028-0e49b61c98da	000e0000-55de-e607-cafb-55e25b9917e5	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55de-e605-81b1-ae02b2540ef0	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55de-e607-e516-027bb66ec2fe	000e0000-55de-e607-e01d-5f425ad8bec6	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55de-e605-9678-f8acb0b87e59	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55de-e607-0b0c-b53d0c83a2a1	000e0000-55de-e607-12b1-730f915b5e10	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55de-e605-81b1-ae02b2540ef0	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55de-e607-d541-0e948d50a6ac	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55de-e607-4aaa-9aa7518e7217	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2944 (class 0 OID 15887859)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55de-e607-567d-2bed658a2524	000e0000-55de-e607-e01d-5f425ad8bec6	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55de-e605-6052-9880fe3856b9
000d0000-55de-e607-4fb4-0cc0f0ebaf65	000e0000-55de-e607-e01d-5f425ad8bec6	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55de-e605-6052-9880fe3856b9
000d0000-55de-e607-fbfb-2c716d72f4e6	000e0000-55de-e607-e01d-5f425ad8bec6	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55de-e605-e139-97fb8b8c29a2
000d0000-55de-e607-fea2-e415caedf8fc	000e0000-55de-e607-e01d-5f425ad8bec6	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55de-e605-f9da-84b0bd2a97d2
000d0000-55de-e607-9f2c-afc3887a25ef	000e0000-55de-e607-e01d-5f425ad8bec6	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55de-e605-02f1-3ad6a87a570f
000d0000-55de-e607-cdef-777aa6ceb279	000e0000-55de-e607-e01d-5f425ad8bec6	\N	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55de-e605-02f1-3ad6a87a570f
000d0000-55de-e607-7f3f-94402e3632c5	000e0000-55de-e607-e01d-5f425ad8bec6	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55de-e605-6052-9880fe3856b9
000d0000-55de-e607-4431-7f56fa98028a	000e0000-55de-e607-e01d-5f425ad8bec6	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55de-e605-327c-183ffad51409
\.


--
-- TOC entry 2923 (class 0 OID 15887673)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 15887721)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2921 (class 0 OID 15887653)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55de-e607-0d94-58729e4fae90	00080000-55de-e607-3cf7-7d60a04793bc	00090000-55de-e607-d73d-07994a1854d8	AK		
\.


--
-- TOC entry 2933 (class 0 OID 15887774)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 15888261)
-- Dependencies: 237
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 15888273)
-- Dependencies: 238
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 15888295)
-- Dependencies: 240
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 15887799)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2918 (class 0 OID 15887610)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55de-e606-5855-80a7d8228c77	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55de-e606-75e0-0d10cac565da	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55de-e606-90d8-3bf74e3fe7ff	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55de-e606-a9b7-6302f4e794da	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55de-e606-11d8-d9da29bd33e7	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55de-e606-2265-8ba6ac117c54	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55de-e606-3303-806a1850c743	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55de-e606-dabe-9c2b1722472b	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55de-e606-d8de-6447d538081d	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55de-e606-a9bd-ba2c4ab0e16d	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55de-e606-2fd3-cbe42697a8ea	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55de-e606-b3f7-752a9722ec6d	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55de-e606-96b7-10986be52614	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55de-e607-5978-5e1767ef163c	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55de-e607-3200-5893eaa64b46	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55de-e607-c51c-eedd477ef184	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55de-e607-58c6-d0a1ac5943ff	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55de-e607-0d22-d0fc360d6454	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55de-e608-9261-d5e11f523cdc	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2912 (class 0 OID 15887524)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55de-e607-9cf9-963405c88fde	00000000-55de-e607-5978-5e1767ef163c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55de-e607-cf7a-6ac8008383d7	00000000-55de-e607-5978-5e1767ef163c	00010000-55de-e606-1052-e1a4f5ac59b1	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55de-e607-0639-6c2da3a849d3	00000000-55de-e607-3200-5893eaa64b46	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2913 (class 0 OID 15887535)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55de-e607-89bc-f08cc37f4fc2	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55de-e607-98ed-b03cbbabc3f8	00010000-55de-e607-5bfa-1cbab09d6492	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55de-e607-3a08-c80fe1b0791a	00010000-55de-e607-0223-b478ecc36420	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55de-e607-cdef-105acf7ab9cf	00010000-55de-e607-c3e1-2d3d23d15da7	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55de-e607-7123-e008a9fae210	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55de-e607-60e4-339fd309b640	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55de-e607-b855-425d936e135f	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55de-e607-7928-6fb3cca4beb0	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55de-e607-d73d-07994a1854d8	00010000-55de-e607-49e2-b529cf02c103	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55de-e607-9394-727601b88350	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55de-e607-3b6b-fb2447e7cede	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55de-e607-083a-84ab20fea9e6	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55de-e607-a152-961085aa21b7	00010000-55de-e607-80b5-8719248c6a37	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2908 (class 0 OID 15887489)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55de-e606-a724-ca8560538338	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55de-e606-9079-90f379e0bdcb	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55de-e606-c266-9be76107d275	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55de-e606-dad8-f9284008776c	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55de-e606-1366-ee9dcc98205d	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55de-e606-b78d-a347e37dbbbd	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55de-e606-86cc-327c18737c62	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55de-e606-a2bc-601cbccedf08	Abonma-read	Abonma - branje	f
00030000-55de-e606-0fa2-1769f18c3626	Abonma-write	Abonma - spreminjanje	f
00030000-55de-e606-afbc-a39e9550a5ea	Alternacija-read	Alternacija - branje	f
00030000-55de-e606-27ca-0d8a4cca1f38	Alternacija-write	Alternacija - spreminjanje	f
00030000-55de-e606-b00e-e1c4d1a82a9b	Arhivalija-read	Arhivalija - branje	f
00030000-55de-e606-3f68-94663bb2c03c	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55de-e606-73ed-ba345e6a5095	Besedilo-read	Besedilo - branje	f
00030000-55de-e606-1589-617a413149c7	Besedilo-write	Besedilo - spreminjanje	f
00030000-55de-e606-6290-3a9ca05e7817	DogodekIzven-read	DogodekIzven - branje	f
00030000-55de-e606-c517-8deff7eac74f	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55de-e606-618d-ed1f32968ab6	Dogodek-read	Dogodek - branje	f
00030000-55de-e606-4c1d-012087c2c899	Dogodek-write	Dogodek - spreminjanje	f
00030000-55de-e606-f10a-e1530edfc48f	DrugiVir-read	DrugiVir - branje	f
00030000-55de-e606-7493-e59f2f61d9d8	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55de-e606-9b5c-863b2893a033	Drzava-read	Drzava - branje	f
00030000-55de-e606-8ca1-b09e67da6e74	Drzava-write	Drzava - spreminjanje	f
00030000-55de-e606-642c-3d22ac2c3615	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55de-e606-e7ff-b6042facc705	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55de-e606-2fd3-871887106dfc	Funkcija-read	Funkcija - branje	f
00030000-55de-e606-bc78-7fbb1014a3cf	Funkcija-write	Funkcija - spreminjanje	f
00030000-55de-e606-d66e-01ba32041214	Gostovanje-read	Gostovanje - branje	f
00030000-55de-e606-043e-0500113f0932	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55de-e606-5bf7-d30eb196570a	Gostujoca-read	Gostujoca - branje	f
00030000-55de-e606-8aca-bb08e6bbbfa6	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55de-e606-81f5-42412c7ff0e3	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55de-e606-7857-c789984fa7b8	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55de-e606-007a-7166bfbf936b	Kupec-read	Kupec - branje	f
00030000-55de-e606-5c91-e907e8f45f1e	Kupec-write	Kupec - spreminjanje	f
00030000-55de-e606-df6a-74ed914f1cd4	NacinPlacina-read	NacinPlacina - branje	f
00030000-55de-e606-6d83-f2e6f3d30cb0	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55de-e606-cf9b-3965529268e2	Option-read	Option - branje	f
00030000-55de-e606-6777-6670b3ac0124	Option-write	Option - spreminjanje	f
00030000-55de-e606-1591-5e9c1c6cef63	OptionValue-read	OptionValue - branje	f
00030000-55de-e606-2a2c-eb33a86cfacf	OptionValue-write	OptionValue - spreminjanje	f
00030000-55de-e606-222e-a062c725e424	Oseba-read	Oseba - branje	f
00030000-55de-e606-0992-1528a0791f66	Oseba-write	Oseba - spreminjanje	f
00030000-55de-e606-37bf-3e21749016bd	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55de-e606-5dee-873f6259a3db	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55de-e606-7fec-12ece217f259	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55de-e606-3485-5c5b98dec047	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55de-e606-e3a8-d402390ecdc0	Pogodba-read	Pogodba - branje	f
00030000-55de-e606-38ee-6547bc02b31d	Pogodba-write	Pogodba - spreminjanje	f
00030000-55de-e606-7143-3a1ac3bbd467	Popa-read	Popa - branje	f
00030000-55de-e606-f742-43184d3aef58	Popa-write	Popa - spreminjanje	f
00030000-55de-e606-cb35-43735f67a600	Posta-read	Posta - branje	f
00030000-55de-e606-19fa-7205e4d1e38e	Posta-write	Posta - spreminjanje	f
00030000-55de-e606-1926-5800c275cb3c	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55de-e606-b007-29c1b5f9739e	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55de-e606-1563-b76257929eb2	PostniNaslov-read	PostniNaslov - branje	f
00030000-55de-e606-cb4b-44953d3be30e	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55de-e606-6740-eb6e99b0d8b9	Predstava-read	Predstava - branje	f
00030000-55de-e606-ffd4-5395902c5915	Predstava-write	Predstava - spreminjanje	f
00030000-55de-e606-b030-95ff4d0c6497	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55de-e606-2c57-3e46b65a3ba6	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55de-e606-3e2b-48f5093201dd	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55de-e606-079b-53ce99684ef0	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55de-e606-4111-cf34b673ae90	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55de-e606-2785-9b8a3b6c03b0	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55de-e606-87af-208a301708fa	ProgramDela-read	ProgramDela - branje	f
00030000-55de-e606-6c00-0d8e38a83e74	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55de-e606-7e5f-3236c613dfd4	ProgramFestival-read	ProgramFestival - branje	f
00030000-55de-e606-32eb-2cd1f6f14af4	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55de-e606-4042-d078c3e4234d	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55de-e606-e018-47039b0d1c88	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55de-e606-15fa-326d20c345a6	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55de-e606-b5a7-c78a4fe4201c	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55de-e606-6220-de8392182950	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55de-e606-121f-2bca6e8aa306	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55de-e606-7f7c-7cba1507c1c0	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55de-e606-6a06-f20b2388ade7	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55de-e606-af55-bdb6748c7e40	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55de-e606-c1e1-12ded0996eb8	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55de-e606-a2b3-47e1beaf9d4a	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55de-e606-258d-6e36c6827d96	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55de-e606-9481-12b3c6352f37	ProgramRazno-read	ProgramRazno - branje	f
00030000-55de-e606-784c-88bf26abe421	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55de-e606-9365-9b7bff1404de	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55de-e606-2156-7c231e089b4d	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55de-e606-83e7-6722222aea03	Prostor-read	Prostor - branje	f
00030000-55de-e606-19f2-f453ebfd433e	Prostor-write	Prostor - spreminjanje	f
00030000-55de-e606-c4a7-6c6d3852ab28	Racun-read	Racun - branje	f
00030000-55de-e606-7eb7-2b0ff2dc3e20	Racun-write	Racun - spreminjanje	f
00030000-55de-e606-42f3-e96dacefaaee	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55de-e606-5334-76985fa4a334	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55de-e606-149f-543bbb9a1a0d	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55de-e606-ac35-e544d51357f6	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55de-e606-0fc2-bd171eb0ec49	Rekvizit-read	Rekvizit - branje	f
00030000-55de-e606-7d26-a29ee703417f	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55de-e606-eeb2-695ef21e5f47	Revizija-read	Revizija - branje	f
00030000-55de-e606-0172-550724addae6	Revizija-write	Revizija - spreminjanje	f
00030000-55de-e606-65e2-91fae0a6e2a0	Rezervacija-read	Rezervacija - branje	f
00030000-55de-e606-681c-c66e13a9fdcf	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55de-e606-7044-3a673c021c9e	SedezniRed-read	SedezniRed - branje	f
00030000-55de-e606-a055-a3d8bf69bb7d	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55de-e606-c9d4-1bc1a0c682fe	Sedez-read	Sedez - branje	f
00030000-55de-e606-6afe-65027b4abc6d	Sedez-write	Sedez - spreminjanje	f
00030000-55de-e606-383b-bd8a6c2fe2d2	Sezona-read	Sezona - branje	f
00030000-55de-e606-9292-dd8764fd08f3	Sezona-write	Sezona - spreminjanje	f
00030000-55de-e606-2079-f9411dfe55f8	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55de-e606-5fdb-0e3950414a42	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55de-e606-7c4c-4edf216b2673	Stevilcenje-read	Stevilcenje - branje	f
00030000-55de-e606-d3ef-1169baab1e13	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55de-e606-18bd-64199fb19b67	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55de-e606-667b-92c772096d09	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55de-e606-b504-70956d2917c5	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55de-e606-15e5-c7e83f6df690	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55de-e606-45db-1f6a43e1a0dc	Telefonska-read	Telefonska - branje	f
00030000-55de-e606-1bee-a53af13f50e4	Telefonska-write	Telefonska - spreminjanje	f
00030000-55de-e606-c79c-f6ec2077d92f	TerminStoritve-read	TerminStoritve - branje	f
00030000-55de-e606-f48b-6252d46c69d0	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55de-e606-0863-7c5453e1059f	TipFunkcije-read	TipFunkcije - branje	f
00030000-55de-e606-ca46-d9f50e67e51a	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55de-e606-b8fb-252ae4d697fb	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55de-e606-afc6-175254094294	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55de-e606-d331-4838bb76808f	Trr-read	Trr - branje	f
00030000-55de-e606-82fd-c431ae895def	Trr-write	Trr - spreminjanje	f
00030000-55de-e606-c182-0ab7c6d8b0a8	Uprizoritev-read	Uprizoritev - branje	f
00030000-55de-e606-769d-8e5e0c8d9b2d	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55de-e606-9b0a-964d3186d541	Vaja-read	Vaja - branje	f
00030000-55de-e606-c9ae-b13ad0207503	Vaja-write	Vaja - spreminjanje	f
00030000-55de-e606-2905-9955a7cf5d3e	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55de-e606-e6f5-d552772c079a	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55de-e606-7414-988210b62350	VrstaStroska-read	VrstaStroska - branje	f
00030000-55de-e606-f2d6-beb191ef0dac	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55de-e606-6da2-50ca5f85aa24	Zaposlitev-read	Zaposlitev - branje	f
00030000-55de-e606-f935-27479b2e4088	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55de-e606-0dc8-c5c37f155ddb	Zasedenost-read	Zasedenost - branje	f
00030000-55de-e606-f438-1931c05bca15	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55de-e606-44df-b2e270999d0b	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55de-e606-e7ad-27db713a532f	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55de-e606-8612-8aab887d29f0	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55de-e606-d889-6cba5de91a60	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55de-e606-1641-bd7c33621360	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55de-e606-d3f9-3ad6790e2c5c	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55de-e606-693d-0e53122678bf	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55de-e606-f9f7-669361ecec87	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55de-e606-6865-42c0243f4389	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55de-e606-32d3-352f70d18f7a	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55de-e606-3ff7-c3ca4b8fb4b4	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55de-e606-76a0-f20e63d5343f	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55de-e606-c1d3-67e8adf50681	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55de-e606-99f2-6f45953ba341	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55de-e606-7526-508bb4015851	Datoteka-write	Datoteka - spreminjanje	f
00030000-55de-e606-d0e3-f86efa4153d9	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2910 (class 0 OID 15887508)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55de-e606-feac-c9722207abb0	00030000-55de-e606-9079-90f379e0bdcb
00020000-55de-e606-58a5-95c895bf3954	00030000-55de-e606-9b5c-863b2893a033
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-a2bc-601cbccedf08
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-0fa2-1769f18c3626
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-afbc-a39e9550a5ea
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-27ca-0d8a4cca1f38
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-b00e-e1c4d1a82a9b
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-618d-ed1f32968ab6
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-dad8-f9284008776c
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-4c1d-012087c2c899
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-9b5c-863b2893a033
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-8ca1-b09e67da6e74
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-2fd3-871887106dfc
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-bc78-7fbb1014a3cf
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-d66e-01ba32041214
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-043e-0500113f0932
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-5bf7-d30eb196570a
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-8aca-bb08e6bbbfa6
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-81f5-42412c7ff0e3
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-7857-c789984fa7b8
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-cf9b-3965529268e2
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-1591-5e9c1c6cef63
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-222e-a062c725e424
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-0992-1528a0791f66
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-7143-3a1ac3bbd467
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-f742-43184d3aef58
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-cb35-43735f67a600
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-19fa-7205e4d1e38e
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-1563-b76257929eb2
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-cb4b-44953d3be30e
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-6740-eb6e99b0d8b9
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-ffd4-5395902c5915
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-4111-cf34b673ae90
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-2785-9b8a3b6c03b0
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-83e7-6722222aea03
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-19f2-f453ebfd433e
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-149f-543bbb9a1a0d
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-ac35-e544d51357f6
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-0fc2-bd171eb0ec49
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-7d26-a29ee703417f
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-383b-bd8a6c2fe2d2
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-9292-dd8764fd08f3
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-0863-7c5453e1059f
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-c182-0ab7c6d8b0a8
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-769d-8e5e0c8d9b2d
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-9b0a-964d3186d541
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-c9ae-b13ad0207503
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-0dc8-c5c37f155ddb
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-f438-1931c05bca15
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-44df-b2e270999d0b
00020000-55de-e606-5a98-5d5064deac9e	00030000-55de-e606-8612-8aab887d29f0
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-a2bc-601cbccedf08
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-b00e-e1c4d1a82a9b
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-618d-ed1f32968ab6
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-9b5c-863b2893a033
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-d66e-01ba32041214
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-5bf7-d30eb196570a
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-81f5-42412c7ff0e3
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-7857-c789984fa7b8
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-cf9b-3965529268e2
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-1591-5e9c1c6cef63
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-222e-a062c725e424
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-0992-1528a0791f66
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-7143-3a1ac3bbd467
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-cb35-43735f67a600
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-1563-b76257929eb2
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-cb4b-44953d3be30e
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-6740-eb6e99b0d8b9
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-83e7-6722222aea03
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-149f-543bbb9a1a0d
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-0fc2-bd171eb0ec49
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-383b-bd8a6c2fe2d2
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-45db-1f6a43e1a0dc
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-1bee-a53af13f50e4
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-d331-4838bb76808f
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-82fd-c431ae895def
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-6da2-50ca5f85aa24
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-f935-27479b2e4088
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-44df-b2e270999d0b
00020000-55de-e606-b6e6-422cf879e95e	00030000-55de-e606-8612-8aab887d29f0
00020000-55de-e606-6dfc-d06948b9680f	00030000-55de-e606-a2bc-601cbccedf08
00020000-55de-e606-6dfc-d06948b9680f	00030000-55de-e606-afbc-a39e9550a5ea
00020000-55de-e606-6dfc-d06948b9680f	00030000-55de-e606-b00e-e1c4d1a82a9b
00020000-55de-e606-6dfc-d06948b9680f	00030000-55de-e606-3f68-94663bb2c03c
00020000-55de-e606-6dfc-d06948b9680f	00030000-55de-e606-73ed-ba345e6a5095
00020000-55de-e606-6dfc-d06948b9680f	00030000-55de-e606-6290-3a9ca05e7817
00020000-55de-e606-6dfc-d06948b9680f	00030000-55de-e606-618d-ed1f32968ab6
00020000-55de-e606-6dfc-d06948b9680f	00030000-55de-e606-9b5c-863b2893a033
00020000-55de-e606-6dfc-d06948b9680f	00030000-55de-e606-2fd3-871887106dfc
00020000-55de-e606-6dfc-d06948b9680f	00030000-55de-e606-d66e-01ba32041214
00020000-55de-e606-6dfc-d06948b9680f	00030000-55de-e606-5bf7-d30eb196570a
00020000-55de-e606-6dfc-d06948b9680f	00030000-55de-e606-81f5-42412c7ff0e3
00020000-55de-e606-6dfc-d06948b9680f	00030000-55de-e606-cf9b-3965529268e2
00020000-55de-e606-6dfc-d06948b9680f	00030000-55de-e606-1591-5e9c1c6cef63
00020000-55de-e606-6dfc-d06948b9680f	00030000-55de-e606-222e-a062c725e424
00020000-55de-e606-6dfc-d06948b9680f	00030000-55de-e606-7143-3a1ac3bbd467
00020000-55de-e606-6dfc-d06948b9680f	00030000-55de-e606-cb35-43735f67a600
00020000-55de-e606-6dfc-d06948b9680f	00030000-55de-e606-6740-eb6e99b0d8b9
00020000-55de-e606-6dfc-d06948b9680f	00030000-55de-e606-4111-cf34b673ae90
00020000-55de-e606-6dfc-d06948b9680f	00030000-55de-e606-83e7-6722222aea03
00020000-55de-e606-6dfc-d06948b9680f	00030000-55de-e606-149f-543bbb9a1a0d
00020000-55de-e606-6dfc-d06948b9680f	00030000-55de-e606-0fc2-bd171eb0ec49
00020000-55de-e606-6dfc-d06948b9680f	00030000-55de-e606-383b-bd8a6c2fe2d2
00020000-55de-e606-6dfc-d06948b9680f	00030000-55de-e606-0863-7c5453e1059f
00020000-55de-e606-6dfc-d06948b9680f	00030000-55de-e606-9b0a-964d3186d541
00020000-55de-e606-6dfc-d06948b9680f	00030000-55de-e606-0dc8-c5c37f155ddb
00020000-55de-e606-6dfc-d06948b9680f	00030000-55de-e606-44df-b2e270999d0b
00020000-55de-e606-6dfc-d06948b9680f	00030000-55de-e606-8612-8aab887d29f0
00020000-55de-e606-91a8-129240ea94aa	00030000-55de-e606-a2bc-601cbccedf08
00020000-55de-e606-91a8-129240ea94aa	00030000-55de-e606-0fa2-1769f18c3626
00020000-55de-e606-91a8-129240ea94aa	00030000-55de-e606-27ca-0d8a4cca1f38
00020000-55de-e606-91a8-129240ea94aa	00030000-55de-e606-b00e-e1c4d1a82a9b
00020000-55de-e606-91a8-129240ea94aa	00030000-55de-e606-618d-ed1f32968ab6
00020000-55de-e606-91a8-129240ea94aa	00030000-55de-e606-9b5c-863b2893a033
00020000-55de-e606-91a8-129240ea94aa	00030000-55de-e606-d66e-01ba32041214
00020000-55de-e606-91a8-129240ea94aa	00030000-55de-e606-5bf7-d30eb196570a
00020000-55de-e606-91a8-129240ea94aa	00030000-55de-e606-cf9b-3965529268e2
00020000-55de-e606-91a8-129240ea94aa	00030000-55de-e606-1591-5e9c1c6cef63
00020000-55de-e606-91a8-129240ea94aa	00030000-55de-e606-7143-3a1ac3bbd467
00020000-55de-e606-91a8-129240ea94aa	00030000-55de-e606-cb35-43735f67a600
00020000-55de-e606-91a8-129240ea94aa	00030000-55de-e606-6740-eb6e99b0d8b9
00020000-55de-e606-91a8-129240ea94aa	00030000-55de-e606-83e7-6722222aea03
00020000-55de-e606-91a8-129240ea94aa	00030000-55de-e606-149f-543bbb9a1a0d
00020000-55de-e606-91a8-129240ea94aa	00030000-55de-e606-0fc2-bd171eb0ec49
00020000-55de-e606-91a8-129240ea94aa	00030000-55de-e606-383b-bd8a6c2fe2d2
00020000-55de-e606-91a8-129240ea94aa	00030000-55de-e606-0863-7c5453e1059f
00020000-55de-e606-91a8-129240ea94aa	00030000-55de-e606-44df-b2e270999d0b
00020000-55de-e606-91a8-129240ea94aa	00030000-55de-e606-8612-8aab887d29f0
00020000-55de-e606-0fbe-64b9614b8e74	00030000-55de-e606-a2bc-601cbccedf08
00020000-55de-e606-0fbe-64b9614b8e74	00030000-55de-e606-b00e-e1c4d1a82a9b
00020000-55de-e606-0fbe-64b9614b8e74	00030000-55de-e606-618d-ed1f32968ab6
00020000-55de-e606-0fbe-64b9614b8e74	00030000-55de-e606-9b5c-863b2893a033
00020000-55de-e606-0fbe-64b9614b8e74	00030000-55de-e606-d66e-01ba32041214
00020000-55de-e606-0fbe-64b9614b8e74	00030000-55de-e606-5bf7-d30eb196570a
00020000-55de-e606-0fbe-64b9614b8e74	00030000-55de-e606-cf9b-3965529268e2
00020000-55de-e606-0fbe-64b9614b8e74	00030000-55de-e606-1591-5e9c1c6cef63
00020000-55de-e606-0fbe-64b9614b8e74	00030000-55de-e606-7143-3a1ac3bbd467
00020000-55de-e606-0fbe-64b9614b8e74	00030000-55de-e606-cb35-43735f67a600
00020000-55de-e606-0fbe-64b9614b8e74	00030000-55de-e606-6740-eb6e99b0d8b9
00020000-55de-e606-0fbe-64b9614b8e74	00030000-55de-e606-83e7-6722222aea03
00020000-55de-e606-0fbe-64b9614b8e74	00030000-55de-e606-149f-543bbb9a1a0d
00020000-55de-e606-0fbe-64b9614b8e74	00030000-55de-e606-0fc2-bd171eb0ec49
00020000-55de-e606-0fbe-64b9614b8e74	00030000-55de-e606-383b-bd8a6c2fe2d2
00020000-55de-e606-0fbe-64b9614b8e74	00030000-55de-e606-c79c-f6ec2077d92f
00020000-55de-e606-0fbe-64b9614b8e74	00030000-55de-e606-c266-9be76107d275
00020000-55de-e606-0fbe-64b9614b8e74	00030000-55de-e606-0863-7c5453e1059f
00020000-55de-e606-0fbe-64b9614b8e74	00030000-55de-e606-44df-b2e270999d0b
00020000-55de-e606-0fbe-64b9614b8e74	00030000-55de-e606-8612-8aab887d29f0
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-a724-ca8560538338
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-9079-90f379e0bdcb
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-c266-9be76107d275
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-dad8-f9284008776c
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-1366-ee9dcc98205d
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-b78d-a347e37dbbbd
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-86cc-327c18737c62
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-a2bc-601cbccedf08
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-0fa2-1769f18c3626
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-afbc-a39e9550a5ea
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-27ca-0d8a4cca1f38
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-b00e-e1c4d1a82a9b
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-3f68-94663bb2c03c
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-73ed-ba345e6a5095
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-1589-617a413149c7
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-6290-3a9ca05e7817
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-c517-8deff7eac74f
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-618d-ed1f32968ab6
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-4c1d-012087c2c899
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-9b5c-863b2893a033
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-8ca1-b09e67da6e74
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-f10a-e1530edfc48f
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-7493-e59f2f61d9d8
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-642c-3d22ac2c3615
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-e7ff-b6042facc705
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-2fd3-871887106dfc
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-bc78-7fbb1014a3cf
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-d66e-01ba32041214
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-043e-0500113f0932
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-5bf7-d30eb196570a
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-8aca-bb08e6bbbfa6
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-81f5-42412c7ff0e3
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-7857-c789984fa7b8
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-007a-7166bfbf936b
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-5c91-e907e8f45f1e
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-df6a-74ed914f1cd4
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-6d83-f2e6f3d30cb0
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-cf9b-3965529268e2
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-6777-6670b3ac0124
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-1591-5e9c1c6cef63
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-2a2c-eb33a86cfacf
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-222e-a062c725e424
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-0992-1528a0791f66
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-37bf-3e21749016bd
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-5dee-873f6259a3db
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-7fec-12ece217f259
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-3485-5c5b98dec047
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-e3a8-d402390ecdc0
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-38ee-6547bc02b31d
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-7143-3a1ac3bbd467
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-f742-43184d3aef58
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-cb35-43735f67a600
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-19fa-7205e4d1e38e
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-1926-5800c275cb3c
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-b007-29c1b5f9739e
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-1563-b76257929eb2
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-cb4b-44953d3be30e
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-6740-eb6e99b0d8b9
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-ffd4-5395902c5915
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-b030-95ff4d0c6497
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-2c57-3e46b65a3ba6
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-3e2b-48f5093201dd
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-079b-53ce99684ef0
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-4111-cf34b673ae90
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-2785-9b8a3b6c03b0
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-87af-208a301708fa
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-6c00-0d8e38a83e74
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-7e5f-3236c613dfd4
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-32eb-2cd1f6f14af4
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-4042-d078c3e4234d
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-e018-47039b0d1c88
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-15fa-326d20c345a6
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-b5a7-c78a4fe4201c
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-6220-de8392182950
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-121f-2bca6e8aa306
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-7f7c-7cba1507c1c0
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-6a06-f20b2388ade7
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-af55-bdb6748c7e40
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-c1e1-12ded0996eb8
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-a2b3-47e1beaf9d4a
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-258d-6e36c6827d96
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-9481-12b3c6352f37
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-784c-88bf26abe421
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-9365-9b7bff1404de
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-2156-7c231e089b4d
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-83e7-6722222aea03
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-19f2-f453ebfd433e
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-c4a7-6c6d3852ab28
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-7eb7-2b0ff2dc3e20
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-42f3-e96dacefaaee
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-5334-76985fa4a334
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-149f-543bbb9a1a0d
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-ac35-e544d51357f6
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-0fc2-bd171eb0ec49
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-7d26-a29ee703417f
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-eeb2-695ef21e5f47
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-0172-550724addae6
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-65e2-91fae0a6e2a0
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-681c-c66e13a9fdcf
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-7044-3a673c021c9e
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-a055-a3d8bf69bb7d
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-c9d4-1bc1a0c682fe
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-6afe-65027b4abc6d
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-383b-bd8a6c2fe2d2
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-9292-dd8764fd08f3
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-2079-f9411dfe55f8
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-5fdb-0e3950414a42
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-7c4c-4edf216b2673
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-d3ef-1169baab1e13
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-18bd-64199fb19b67
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-667b-92c772096d09
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-b504-70956d2917c5
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-15e5-c7e83f6df690
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-45db-1f6a43e1a0dc
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-1bee-a53af13f50e4
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-c79c-f6ec2077d92f
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-f48b-6252d46c69d0
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-0863-7c5453e1059f
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-ca46-d9f50e67e51a
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-b8fb-252ae4d697fb
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-afc6-175254094294
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-d331-4838bb76808f
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-82fd-c431ae895def
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-c182-0ab7c6d8b0a8
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-769d-8e5e0c8d9b2d
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-9b0a-964d3186d541
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-c9ae-b13ad0207503
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-2905-9955a7cf5d3e
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-e6f5-d552772c079a
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-6da2-50ca5f85aa24
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-f935-27479b2e4088
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-0dc8-c5c37f155ddb
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-f438-1931c05bca15
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-44df-b2e270999d0b
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-e7ad-27db713a532f
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-8612-8aab887d29f0
00020000-55de-e607-c5e4-d24e164249b9	00030000-55de-e606-d889-6cba5de91a60
\.


--
-- TOC entry 2938 (class 0 OID 15887806)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2942 (class 0 OID 15887839)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 15887963)
-- Dependencies: 219
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55de-e607-e3ef-d3bf5cd20f71	00090000-55de-e607-89bc-f08cc37f4fc2	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55de-e607-6e8a-5c76c0cca4b3	00090000-55de-e607-60e4-339fd309b640	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55de-e607-b603-2c3fb22153cd	00090000-55de-e607-a152-961085aa21b7	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2915 (class 0 OID 15887568)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55de-e607-3cf7-7d60a04793bc	00040000-55de-e606-4096-41f2fabb0576	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55de-e607-ccea-f173357afbfb	00040000-55de-e606-4096-41f2fabb0576	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55de-e607-b378-8bd2d617afb8	00040000-55de-e606-4096-41f2fabb0576	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55de-e607-8071-b7d660a80e93	00040000-55de-e606-4096-41f2fabb0576	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55de-e607-ce2a-43012ea80e18	00040000-55de-e606-4096-41f2fabb0576	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55de-e607-a60d-c10fe490c498	00040000-55de-e605-b416-2a900631d093	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55de-e607-3e34-8a073084227e	00040000-55de-e605-4d3f-946dd59cdf50	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55de-e607-63fa-861cd78cbb67	00040000-55de-e605-0b9c-9c3701cdad3b	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55de-e608-bb6a-3f15be054520	00040000-55de-e606-4096-41f2fabb0576	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2917 (class 0 OID 15887602)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55de-e605-30be-b5f17994f0c9	8341	Adlešiči
00050000-55de-e605-c081-0e04ea2d2807	5270	Ajdovščina
00050000-55de-e605-77f0-a23d8c1eda26	6280	Ankaran/Ancarano
00050000-55de-e605-5352-c5703ae61deb	9253	Apače
00050000-55de-e605-3223-8d4b71284efe	8253	Artiče
00050000-55de-e605-2edd-30e5519f4741	4275	Begunje na Gorenjskem
00050000-55de-e605-c0ed-6be6be8b210a	1382	Begunje pri Cerknici
00050000-55de-e605-3df5-48eeb7d29e47	9231	Beltinci
00050000-55de-e605-e2e0-30daef907cc8	2234	Benedikt
00050000-55de-e605-2b8f-e110f20f41d6	2345	Bistrica ob Dravi
00050000-55de-e605-84ef-faba58391424	3256	Bistrica ob Sotli
00050000-55de-e605-aa5b-8c31eda4c557	8259	Bizeljsko
00050000-55de-e605-6643-b77388f1ef8c	1223	Blagovica
00050000-55de-e605-7f53-8e046914ca13	8283	Blanca
00050000-55de-e605-ed73-1120e23b4190	4260	Bled
00050000-55de-e605-dec7-36103b6051d3	4273	Blejska Dobrava
00050000-55de-e605-8dce-73eb9615f2ea	9265	Bodonci
00050000-55de-e605-efd9-7f29240aa6de	9222	Bogojina
00050000-55de-e605-cddd-6ad6c1f77d9b	4263	Bohinjska Bela
00050000-55de-e605-9ea9-764748680d1d	4264	Bohinjska Bistrica
00050000-55de-e605-f9a9-f42270bafe3e	4265	Bohinjsko jezero
00050000-55de-e605-1adc-be8826e0a27f	1353	Borovnica
00050000-55de-e605-3d0d-c44b7f6b3a63	8294	Boštanj
00050000-55de-e605-671d-b2dedc7c8244	5230	Bovec
00050000-55de-e605-7b8b-9a50589aef92	5295	Branik
00050000-55de-e605-a0b1-5bfe503077ec	3314	Braslovče
00050000-55de-e605-c5df-c9603f91326d	5223	Breginj
00050000-55de-e605-4a9b-ada51ffc2949	8280	Brestanica
00050000-55de-e605-5c33-23edf4d2ee77	2354	Bresternica
00050000-55de-e605-c6a0-ec0c9e2bdae7	4243	Brezje
00050000-55de-e605-7831-ced42b9e2fae	1351	Brezovica pri Ljubljani
00050000-55de-e605-df65-89a58b0f1a18	8250	Brežice
00050000-55de-e605-b6dc-8eb1cacf6b8c	4210	Brnik - Aerodrom
00050000-55de-e605-1480-6f1ef3d0100f	8321	Brusnice
00050000-55de-e605-9a1d-9a0fd573e5bc	3255	Buče
00050000-55de-e605-058b-ae31188462ac	8276	Bučka 
00050000-55de-e605-75e1-2131d5422aef	9261	Cankova
00050000-55de-e605-6db6-fe7ba42a0c9d	3000	Celje 
00050000-55de-e605-9ede-3a77793fbcaa	3001	Celje - poštni predali
00050000-55de-e605-dfd6-64d960c942f2	4207	Cerklje na Gorenjskem
00050000-55de-e605-e2e6-529a38814b5e	8263	Cerklje ob Krki
00050000-55de-e605-7a50-4c38a37e0156	1380	Cerknica
00050000-55de-e605-e5ed-e7e404aaca2a	5282	Cerkno
00050000-55de-e605-cda9-020405f49abf	2236	Cerkvenjak
00050000-55de-e605-c082-bc7067a8753d	2215	Ceršak
00050000-55de-e605-dec3-4bd562997a8b	2326	Cirkovce
00050000-55de-e605-7b46-79335b546fcd	2282	Cirkulane
00050000-55de-e605-94e6-99377abbc8ef	5273	Col
00050000-55de-e605-06b8-d3d92e58df43	8251	Čatež ob Savi
00050000-55de-e605-d10c-0851611ec2d3	1413	Čemšenik
00050000-55de-e605-7417-b0868614df7a	5253	Čepovan
00050000-55de-e605-5ee9-b0b506bab27b	9232	Črenšovci
00050000-55de-e605-5283-57cd9e86d883	2393	Črna na Koroškem
00050000-55de-e605-ba9c-11e21a0e578f	6275	Črni Kal
00050000-55de-e605-0678-b5e90db02c14	5274	Črni Vrh nad Idrijo
00050000-55de-e605-527e-a3f4f26308f3	5262	Črniče
00050000-55de-e605-1cf1-750e73ff6238	8340	Črnomelj
00050000-55de-e605-82a8-cda8d15c95fa	6271	Dekani
00050000-55de-e605-1087-66e70a680a37	5210	Deskle
00050000-55de-e605-eb24-977df784e030	2253	Destrnik
00050000-55de-e605-af1a-a5676ada9c2c	6215	Divača
00050000-55de-e605-b08a-5d43cfeedfb4	1233	Dob
00050000-55de-e605-27c9-a276cd9c0470	3224	Dobje pri Planini
00050000-55de-e605-4795-ccc90aab2314	8257	Dobova
00050000-55de-e605-2f8c-d3c8a146c920	1423	Dobovec
00050000-55de-e605-6968-62e15dc5185a	5263	Dobravlje
00050000-55de-e605-ac22-505885506255	3204	Dobrna
00050000-55de-e605-50fd-64a866c61715	8211	Dobrnič
00050000-55de-e605-63b8-fc58401bc3c7	1356	Dobrova
00050000-55de-e605-470d-f4d4c047f04f	9223	Dobrovnik/Dobronak 
00050000-55de-e605-31de-65d0fd2c9995	5212	Dobrovo v Brdih
00050000-55de-e605-a40d-f4c98b2ebf88	1431	Dol pri Hrastniku
00050000-55de-e605-9dcf-f1c9791863a4	1262	Dol pri Ljubljani
00050000-55de-e605-de2e-595ea6724623	1273	Dole pri Litiji
00050000-55de-e605-6026-e52270ae5c8d	1331	Dolenja vas
00050000-55de-e605-d558-9f32534a45c3	8350	Dolenjske Toplice
00050000-55de-e605-d4da-0b75c2087369	1230	Domžale
00050000-55de-e605-477b-fb039d3b76e8	2252	Dornava
00050000-55de-e605-c09c-f0d6c2345535	5294	Dornberk
00050000-55de-e605-4b3c-62e97ea91180	1319	Draga
00050000-55de-e605-0b96-24154fe6ecbe	8343	Dragatuš
00050000-55de-e605-282e-6a5702b79689	3222	Dramlje
00050000-55de-e605-ca9c-d054b03b71bc	2370	Dravograd
00050000-55de-e605-7966-6c90d5332161	4203	Duplje
00050000-55de-e605-9154-6e3b9cdb3ba7	6221	Dutovlje
00050000-55de-e605-6bb6-925a9f1777f7	8361	Dvor
00050000-55de-e605-a9dc-881a44f764af	2343	Fala
00050000-55de-e605-44d8-56a87e0df62b	9208	Fokovci
00050000-55de-e605-3438-bee002ab7e7a	2313	Fram
00050000-55de-e605-5880-5dbdbbe7e3cc	3213	Frankolovo
00050000-55de-e605-2c36-1009d6e07d8e	1274	Gabrovka
00050000-55de-e605-fce0-dbddb7d063c0	8254	Globoko
00050000-55de-e605-746c-5b1d607d8fe7	5275	Godovič
00050000-55de-e605-954a-1547417ee756	4204	Golnik
00050000-55de-e605-4a4f-caea183e537f	3303	Gomilsko
00050000-55de-e605-f67c-fa345c8aa364	4224	Gorenja vas
00050000-55de-e605-4f2c-c27b5aff337e	3263	Gorica pri Slivnici
00050000-55de-e605-24a5-fb9153138a0e	2272	Gorišnica
00050000-55de-e605-72d5-f8246d38de97	9250	Gornja Radgona
00050000-55de-e605-c49b-ae886f194d8f	3342	Gornji Grad
00050000-55de-e605-7e5f-59888c1ce4ae	4282	Gozd Martuljek
00050000-55de-e605-c1b0-0f07d0337258	6272	Gračišče
00050000-55de-e605-475b-5509cf79c459	9264	Grad
00050000-55de-e605-e9fd-2dba02c75b81	8332	Gradac
00050000-55de-e605-1c89-57b82128236f	1384	Grahovo
00050000-55de-e605-c879-75543c66bb09	5242	Grahovo ob Bači
00050000-55de-e605-1dc8-0ee932e1f53c	5251	Grgar
00050000-55de-e605-950b-ef44f454b77f	3302	Griže
00050000-55de-e605-c248-0677dc60f818	3231	Grobelno
00050000-55de-e605-c1d2-97cd19dd4941	1290	Grosuplje
00050000-55de-e605-1103-7186d9acc89e	2288	Hajdina
00050000-55de-e605-dff8-4812b5889a58	8362	Hinje
00050000-55de-e605-389b-327ae96784d6	2311	Hoče
00050000-55de-e605-190c-3d10323d80d9	9205	Hodoš/Hodos
00050000-55de-e605-9e5e-9ba3375e545b	1354	Horjul
00050000-55de-e605-6f1e-6e1ea43b7be7	1372	Hotedršica
00050000-55de-e605-678c-2ba279c8d3c1	1430	Hrastnik
00050000-55de-e605-bd53-ac913a36819e	6225	Hruševje
00050000-55de-e605-3bf6-6519c1057c60	4276	Hrušica
00050000-55de-e605-0045-28333649ad11	5280	Idrija
00050000-55de-e605-ff7a-aecfb1242330	1292	Ig
00050000-55de-e605-f192-a9c55e6daad4	6250	Ilirska Bistrica
00050000-55de-e605-1684-c8c27208e788	6251	Ilirska Bistrica-Trnovo
00050000-55de-e605-50c3-80b574b6e25a	1295	Ivančna Gorica
00050000-55de-e605-2f44-9e0f49682de0	2259	Ivanjkovci
00050000-55de-e605-d841-17a6dd22d98d	1411	Izlake
00050000-55de-e605-e59a-5816ea8f17fc	6310	Izola/Isola
00050000-55de-e605-ed7d-e79028157155	2222	Jakobski Dol
00050000-55de-e605-5fe9-73443a2b8631	2221	Jarenina
00050000-55de-e605-ecfd-0fc7f7aba034	6254	Jelšane
00050000-55de-e605-b7ae-0ae5c146842e	4270	Jesenice
00050000-55de-e605-8074-5ec5a189e7ff	8261	Jesenice na Dolenjskem
00050000-55de-e605-d5e6-4b5a693c0521	3273	Jurklošter
00050000-55de-e605-7119-cff32653382c	2223	Jurovski Dol
00050000-55de-e605-6bef-4b0595cf393c	2256	Juršinci
00050000-55de-e605-ff54-d627d1a9a7b7	5214	Kal nad Kanalom
00050000-55de-e605-2f59-1f33059aa9ad	3233	Kalobje
00050000-55de-e605-173d-0b5c8f430e99	4246	Kamna Gorica
00050000-55de-e605-ba55-9b6ba4c084a5	2351	Kamnica
00050000-55de-e605-8de9-f53832babab5	1241	Kamnik
00050000-55de-e605-b1b3-8bca3c1c7e2b	5213	Kanal
00050000-55de-e605-bbdb-50cd3c3640dc	8258	Kapele
00050000-55de-e605-96d8-97dbd78bb7e7	2362	Kapla
00050000-55de-e605-8601-246e882825db	2325	Kidričevo
00050000-55de-e605-9ba2-5c490b1c5f16	1412	Kisovec
00050000-55de-e605-0e86-9f6123723e3d	6253	Knežak
00050000-55de-e605-6fb4-66e3aa87bf1c	5222	Kobarid
00050000-55de-e605-3204-54b7198909b1	9227	Kobilje
00050000-55de-e605-fe63-f2fa480793e1	1330	Kočevje
00050000-55de-e605-8571-a44db0b3304f	1338	Kočevska Reka
00050000-55de-e605-cf03-8f525b5a4084	2276	Kog
00050000-55de-e605-57c6-aa8bf2b378c2	5211	Kojsko
00050000-55de-e605-3285-f7a8e7856b0b	6223	Komen
00050000-55de-e605-ab81-a397986bd8e0	1218	Komenda
00050000-55de-e605-2949-e106bd48cb0d	6000	Koper/Capodistria 
00050000-55de-e605-699b-d141e10d36f5	6001	Koper/Capodistria - poštni predali
00050000-55de-e605-e1f3-26eb145b0166	8282	Koprivnica
00050000-55de-e605-ff9d-721c883dfe02	5296	Kostanjevica na Krasu
00050000-55de-e605-f2fe-473856b96036	8311	Kostanjevica na Krki
00050000-55de-e605-b453-bb98d5a7cf5c	1336	Kostel
00050000-55de-e605-841a-a9cc66b8031d	6256	Košana
00050000-55de-e605-36db-3405efd07b80	2394	Kotlje
00050000-55de-e605-5d0e-a2b7e7a774f3	6240	Kozina
00050000-55de-e605-1455-66db9accc97e	3260	Kozje
00050000-55de-e605-7e65-6f6d467bdca4	4000	Kranj 
00050000-55de-e605-c9ed-8cb390a3f6e6	4001	Kranj - poštni predali
00050000-55de-e605-80ff-da1f88c43416	4280	Kranjska Gora
00050000-55de-e605-fba4-b73f15f09df9	1281	Kresnice
00050000-55de-e605-cf12-407df7454d83	4294	Križe
00050000-55de-e605-8679-4218e21883e1	9206	Križevci
00050000-55de-e605-5edd-a2742a8969bc	9242	Križevci pri Ljutomeru
00050000-55de-e605-9ef4-ff47c3dd6679	1301	Krka
00050000-55de-e605-0a5a-c0f903cb5949	8296	Krmelj
00050000-55de-e605-aef9-36e90465c109	4245	Kropa
00050000-55de-e605-8dd0-d504310ed999	8262	Krška vas
00050000-55de-e605-8f95-2229904d084f	8270	Krško
00050000-55de-e605-e61e-fbf8897c28de	9263	Kuzma
00050000-55de-e605-ec70-293c81134dbd	2318	Laporje
00050000-55de-e605-9f71-3d11cff65d2f	3270	Laško
00050000-55de-e605-fdaf-15442d900826	1219	Laze v Tuhinju
00050000-55de-e605-6e1d-986063842836	2230	Lenart v Slovenskih goricah
00050000-55de-e605-8cfb-c94a0b277f70	9220	Lendava/Lendva
00050000-55de-e605-3d4e-660d411e43d2	4248	Lesce
00050000-55de-e605-befa-c1d47efacff1	3261	Lesično
00050000-55de-e605-01bf-eba3c658f941	8273	Leskovec pri Krškem
00050000-55de-e605-c709-552fca95b5f0	2372	Libeliče
00050000-55de-e605-3b46-aeaf6b63011d	2341	Limbuš
00050000-55de-e605-e9b2-68ff0d790f91	1270	Litija
00050000-55de-e605-fa6b-a1382d495fc2	3202	Ljubečna
00050000-55de-e605-760d-6113b50f5589	1000	Ljubljana 
00050000-55de-e605-ca15-3db9a34c5375	1001	Ljubljana - poštni predali
00050000-55de-e605-e931-d4ce3bbd9d83	1231	Ljubljana - Črnuče
00050000-55de-e605-c6f2-182f1fd4ce9d	1261	Ljubljana - Dobrunje
00050000-55de-e605-1f7d-399c9bfef3f9	1260	Ljubljana - Polje
00050000-55de-e605-7ba0-b01787891d8d	1210	Ljubljana - Šentvid
00050000-55de-e605-19da-1c0ab553db3e	1211	Ljubljana - Šmartno
00050000-55de-e605-6e0c-51c5b2c012df	3333	Ljubno ob Savinji
00050000-55de-e605-f6a4-19329d5afa3d	9240	Ljutomer
00050000-55de-e605-b52e-c4e78e5ab85a	3215	Loče
00050000-55de-e605-daaf-910f493fd4b8	5231	Log pod Mangartom
00050000-55de-e605-48a8-ed38bbeee2b6	1358	Log pri Brezovici
00050000-55de-e605-f17d-362f77b8e8f9	1370	Logatec
00050000-55de-e605-5b7d-0ea32d2460e7	1371	Logatec
00050000-55de-e605-b971-1452c5f51882	1434	Loka pri Zidanem Mostu
00050000-55de-e605-eeb9-84bcc23b1cb3	3223	Loka pri Žusmu
00050000-55de-e605-295d-f3f6e4398e3e	6219	Lokev
00050000-55de-e605-4fd0-94e549051e40	1318	Loški Potok
00050000-55de-e605-cef1-e218cb78cc53	2324	Lovrenc na Dravskem polju
00050000-55de-e605-f327-5f3940faf840	2344	Lovrenc na Pohorju
00050000-55de-e605-3e36-e4ac51729e40	3334	Luče
00050000-55de-e605-5954-e1609777aaca	1225	Lukovica
00050000-55de-e605-eea5-4690d851df9e	9202	Mačkovci
00050000-55de-e605-1f1c-3a9ea6676847	2322	Majšperk
00050000-55de-e605-08e5-94a27d17a7c8	2321	Makole
00050000-55de-e605-1b7e-700c29b8fc64	9243	Mala Nedelja
00050000-55de-e605-4198-ef9176a6459b	2229	Malečnik
00050000-55de-e605-6ee9-80ca4a36283c	6273	Marezige
00050000-55de-e605-4af0-a302578ad4ec	2000	Maribor 
00050000-55de-e605-a0e9-a90175cdaef5	2001	Maribor - poštni predali
00050000-55de-e605-c310-34ec0dd54f48	2206	Marjeta na Dravskem polju
00050000-55de-e605-8d03-40dcd6219e5b	2281	Markovci
00050000-55de-e605-41c9-502ff05337eb	9221	Martjanci
00050000-55de-e605-aa75-b9177dcfa90e	6242	Materija
00050000-55de-e605-817f-a17bc3222ff1	4211	Mavčiče
00050000-55de-e605-5d0e-914d571bfa35	1215	Medvode
00050000-55de-e605-672a-19fdaa14be57	1234	Mengeš
00050000-55de-e605-ea1d-9bcfb24ee791	8330	Metlika
00050000-55de-e605-56e3-e614189e86a4	2392	Mežica
00050000-55de-e605-84a4-da2a577b3eb5	2204	Miklavž na Dravskem polju
00050000-55de-e605-f462-dfba013719d4	2275	Miklavž pri Ormožu
00050000-55de-e605-8c7a-56742bc92859	5291	Miren
00050000-55de-e605-27f5-0eb020fc77c3	8233	Mirna
00050000-55de-e605-b413-ed088d87256d	8216	Mirna Peč
00050000-55de-e605-8123-43aa77ba0dcc	2382	Mislinja
00050000-55de-e605-a946-baeeaccaec3f	4281	Mojstrana
00050000-55de-e605-a502-8f483d8ceade	8230	Mokronog
00050000-55de-e605-fa30-a5982f6a0f87	1251	Moravče
00050000-55de-e605-d7d7-0c55c60d44e6	9226	Moravske Toplice
00050000-55de-e605-bef3-b646b22159f2	5216	Most na Soči
00050000-55de-e605-5271-02ee753bc591	1221	Motnik
00050000-55de-e605-cf93-ce644e802a0b	3330	Mozirje
00050000-55de-e605-d385-142b8ed20f27	9000	Murska Sobota 
00050000-55de-e605-6bf6-9960aa4e613f	9001	Murska Sobota - poštni predali
00050000-55de-e605-e73c-d60d8121edc1	2366	Muta
00050000-55de-e605-9257-3c6618bd9207	4202	Naklo
00050000-55de-e605-bb83-bc521de82709	3331	Nazarje
00050000-55de-e605-2c58-afd6fe28d295	1357	Notranje Gorice
00050000-55de-e605-5ab2-0efc48f06ebe	3203	Nova Cerkev
00050000-55de-e605-027a-30078bd68e57	5000	Nova Gorica 
00050000-55de-e605-39da-49c5bec5dfce	5001	Nova Gorica - poštni predali
00050000-55de-e605-4b6f-b95d5e99ab2d	1385	Nova vas
00050000-55de-e605-ff5c-4af7f67506f6	8000	Novo mesto
00050000-55de-e605-ca4a-e6875123d7a1	8001	Novo mesto - poštni predali
00050000-55de-e605-33d6-ff0c94018c17	6243	Obrov
00050000-55de-e605-1ad7-c0e6f72d087b	9233	Odranci
00050000-55de-e605-90e6-2a5b4d62b9ac	2317	Oplotnica
00050000-55de-e605-e313-a31557eacf91	2312	Orehova vas
00050000-55de-e605-98cf-440391d2085a	2270	Ormož
00050000-55de-e605-8680-18d64379eb96	1316	Ortnek
00050000-55de-e605-6a8e-3132079ce080	1337	Osilnica
00050000-55de-e605-9568-f77a555966b9	8222	Otočec
00050000-55de-e605-4064-44d8b995a621	2361	Ožbalt
00050000-55de-e605-0c29-7a5a975c3fcc	2231	Pernica
00050000-55de-e605-3bc0-f6762df94caa	2211	Pesnica pri Mariboru
00050000-55de-e605-2b3b-9111fa099e94	9203	Petrovci
00050000-55de-e605-30c4-a0191f39b0b4	3301	Petrovče
00050000-55de-e605-795a-276d947fc056	6330	Piran/Pirano
00050000-55de-e605-6322-d937816e08b5	8255	Pišece
00050000-55de-e605-f281-9c501e1ea33e	6257	Pivka
00050000-55de-e605-7bd1-29c5919a44d6	6232	Planina
00050000-55de-e605-37d4-875479d368e8	3225	Planina pri Sevnici
00050000-55de-e605-2591-3f8c42126b3b	6276	Pobegi
00050000-55de-e605-eb39-a01f89738395	8312	Podbočje
00050000-55de-e605-ce0c-0372bbb94289	5243	Podbrdo
00050000-55de-e605-dbfa-aff4c859d054	3254	Podčetrtek
00050000-55de-e605-524d-c94ccb22223e	2273	Podgorci
00050000-55de-e605-156c-bd09630c5c03	6216	Podgorje
00050000-55de-e605-4182-44fa9eed34b9	2381	Podgorje pri Slovenj Gradcu
00050000-55de-e605-520f-36502502cc9a	6244	Podgrad
00050000-55de-e605-c7a3-a5eb6b1ba59f	1414	Podkum
00050000-55de-e605-ec5c-070e948870d6	2286	Podlehnik
00050000-55de-e605-e9ff-5496536eb1b1	5272	Podnanos
00050000-55de-e605-2224-c814a652094a	4244	Podnart
00050000-55de-e605-6872-064bee6c1faf	3241	Podplat
00050000-55de-e605-ab77-3e4eb17a1937	3257	Podsreda
00050000-55de-e605-b038-1eba16048cfb	2363	Podvelka
00050000-55de-e605-3bee-dd48be780f05	2208	Pohorje
00050000-55de-e605-07ff-983c2539b984	2257	Polenšak
00050000-55de-e605-d570-27636abd00b3	1355	Polhov Gradec
00050000-55de-e605-eeff-d83775e1a486	4223	Poljane nad Škofjo Loko
00050000-55de-e605-22d1-5ab2c2072d6c	2319	Poljčane
00050000-55de-e605-c0ec-b3ba688aaa2e	1272	Polšnik
00050000-55de-e605-00e7-27056304f9d5	3313	Polzela
00050000-55de-e605-f480-42a1e644738c	3232	Ponikva
00050000-55de-e605-73b0-84a1be89d83d	6320	Portorož/Portorose
00050000-55de-e605-5950-9c1c5f9861b3	6230	Postojna
00050000-55de-e605-8145-5a3783327097	2331	Pragersko
00050000-55de-e605-71c3-b9ac88618b24	3312	Prebold
00050000-55de-e605-3a23-0e0c7d63931c	4205	Preddvor
00050000-55de-e605-10ee-fe1e4c32b9d5	6255	Prem
00050000-55de-e605-9406-118d3331911a	1352	Preserje
00050000-55de-e605-56b2-f22a24036e90	6258	Prestranek
00050000-55de-e605-60ba-9fe27feb5124	2391	Prevalje
00050000-55de-e605-9de3-a61efc03dead	3262	Prevorje
00050000-55de-e605-3056-d63a51fb84ad	1276	Primskovo 
00050000-55de-e605-f4cd-4153a7ba6485	3253	Pristava pri Mestinju
00050000-55de-e605-5985-22bb3304a921	9207	Prosenjakovci/Partosfalva
00050000-55de-e605-2479-12701c2c685a	5297	Prvačina
00050000-55de-e605-070b-46f296a2354d	2250	Ptuj
00050000-55de-e605-c1b8-df6bbd4845fa	2323	Ptujska Gora
00050000-55de-e605-9fd2-91654e369bc7	9201	Puconci
00050000-55de-e605-5de2-170263b95fe3	2327	Rače
00050000-55de-e605-8490-28ea14f33df9	1433	Radeče
00050000-55de-e605-7214-50efb1478ee5	9252	Radenci
00050000-55de-e605-0ba2-e0f74868f7e6	2360	Radlje ob Dravi
00050000-55de-e605-69fd-dfb3b1b90075	1235	Radomlje
00050000-55de-e605-1836-86870e6b4eb0	4240	Radovljica
00050000-55de-e605-a750-ec0175e46a59	8274	Raka
00050000-55de-e605-c6e9-52f542f8ade0	1381	Rakek
00050000-55de-e605-0959-4b3d269d0986	4283	Rateče - Planica
00050000-55de-e605-d488-0f7c74b7eef0	2390	Ravne na Koroškem
00050000-55de-e605-86b9-8ef20a939a2e	9246	Razkrižje
00050000-55de-e605-31fc-961112ff9508	3332	Rečica ob Savinji
00050000-55de-e605-a6ce-90173800f013	5292	Renče
00050000-55de-e605-d69f-cff6b74b6fe0	1310	Ribnica
00050000-55de-e605-1d43-74a6b59255aa	2364	Ribnica na Pohorju
00050000-55de-e605-c13b-be2cdbed2073	3272	Rimske Toplice
00050000-55de-e605-798c-e0a25ad626d2	1314	Rob
00050000-55de-e605-ae3e-f2c79202959a	5215	Ročinj
00050000-55de-e605-00fd-162718ad1c27	3250	Rogaška Slatina
00050000-55de-e605-c6e6-4ee8038659a4	9262	Rogašovci
00050000-55de-e605-b786-19fb098b67e7	3252	Rogatec
00050000-55de-e605-5a08-313c71388b00	1373	Rovte
00050000-55de-e605-2a65-76018e9c4773	2342	Ruše
00050000-55de-e605-9f4a-1c42a556786d	1282	Sava
00050000-55de-e605-e751-93ecaec613ae	6333	Sečovlje/Sicciole
00050000-55de-e605-8177-814973681535	4227	Selca
00050000-55de-e605-1582-80df179f0f17	2352	Selnica ob Dravi
00050000-55de-e605-a32e-fbc18a30e79d	8333	Semič
00050000-55de-e605-389e-d01f9a3d09f6	8281	Senovo
00050000-55de-e605-3ec4-136ced54795e	6224	Senožeče
00050000-55de-e605-4580-5d95ed69af4c	8290	Sevnica
00050000-55de-e605-6910-031eabdb2894	6210	Sežana
00050000-55de-e605-2aaa-5f1bcb8f8ec2	2214	Sladki Vrh
00050000-55de-e605-4a23-d80ddd428921	5283	Slap ob Idrijci
00050000-55de-e605-3dff-1b5a6d0b7da3	2380	Slovenj Gradec
00050000-55de-e605-0ecb-5badf5ccb3bf	2310	Slovenska Bistrica
00050000-55de-e605-215f-60863dd269d2	3210	Slovenske Konjice
00050000-55de-e605-18ac-3d4865f00c5d	1216	Smlednik
00050000-55de-e605-e83f-14a5df372c95	5232	Soča
00050000-55de-e605-4916-e7aa64bdf0bf	1317	Sodražica
00050000-55de-e605-7903-f545673c38d5	3335	Solčava
00050000-55de-e605-4bcd-15c78560c162	5250	Solkan
00050000-55de-e605-9dd0-3f26847b8f5a	4229	Sorica
00050000-55de-e605-b6da-5637afda05af	4225	Sovodenj
00050000-55de-e605-04aa-d09b6d33b1cf	5281	Spodnja Idrija
00050000-55de-e605-4ebd-8cbd09a393c4	2241	Spodnji Duplek
00050000-55de-e605-64fa-d7409b5357ad	9245	Spodnji Ivanjci
00050000-55de-e605-e83d-be215c6436a3	2277	Središče ob Dravi
00050000-55de-e605-eb38-32c09fd07d1c	4267	Srednja vas v Bohinju
00050000-55de-e605-dbf6-f9c06d7f538e	8256	Sromlje 
00050000-55de-e605-6f6a-a834d83eff4b	5224	Srpenica
00050000-55de-e605-7ff2-9e1953a04d1e	1242	Stahovica
00050000-55de-e605-ccc2-fbffe41efe3c	1332	Stara Cerkev
00050000-55de-e605-bb18-a92853365504	8342	Stari trg ob Kolpi
00050000-55de-e605-af2d-ec6cd63290b0	1386	Stari trg pri Ložu
00050000-55de-e605-383d-57fdea232932	2205	Starše
00050000-55de-e605-f238-118df83089c6	2289	Stoperce
00050000-55de-e605-5a85-cbcf1ad4bb39	8322	Stopiče
00050000-55de-e605-9ccd-53b260d1ce12	3206	Stranice
00050000-55de-e605-748b-993854a3566e	8351	Straža
00050000-55de-e605-0021-28ea727fc3f6	1313	Struge
00050000-55de-e605-3bb8-4702da1befcb	8293	Studenec
00050000-55de-e605-6b44-f403be4f146f	8331	Suhor
00050000-55de-e605-a55d-24f18f74d90d	2233	Sv. Ana v Slovenskih goricah
00050000-55de-e605-26c6-5d4c1b90c123	2235	Sv. Trojica v Slovenskih goricah
00050000-55de-e605-bf1e-b275d915ddf3	2353	Sveti Duh na Ostrem Vrhu
00050000-55de-e605-d784-16d57b05eb8e	9244	Sveti Jurij ob Ščavnici
00050000-55de-e605-6271-1ec1cf1cae1b	3264	Sveti Štefan
00050000-55de-e605-c75b-3e61ef4eeda6	2258	Sveti Tomaž
00050000-55de-e605-e63f-cca4a89e6f4a	9204	Šalovci
00050000-55de-e605-9d5c-b255c8417a67	5261	Šempas
00050000-55de-e605-8519-10984656e812	5290	Šempeter pri Gorici
00050000-55de-e605-bb8a-d40e619eda57	3311	Šempeter v Savinjski dolini
00050000-55de-e605-3de2-8a169e42388e	4208	Šenčur
00050000-55de-e605-f544-8bb9d2ffb18e	2212	Šentilj v Slovenskih goricah
00050000-55de-e605-1c20-75982210b0d9	8297	Šentjanž
00050000-55de-e605-d3e2-4e12b6ca0995	2373	Šentjanž pri Dravogradu
00050000-55de-e605-1a12-4588b85123ea	8310	Šentjernej
00050000-55de-e605-bec3-d7aeed5f0107	3230	Šentjur
00050000-55de-e605-d4cf-b0b667463f9c	3271	Šentrupert
00050000-55de-e605-63c4-46b2f02a20c5	8232	Šentrupert
00050000-55de-e605-e8da-553280963e2e	1296	Šentvid pri Stični
00050000-55de-e605-eb72-0fed5e9ef1c8	8275	Škocjan
00050000-55de-e605-6dcf-df56b6be522b	6281	Škofije
00050000-55de-e605-9625-25a78a91ab43	4220	Škofja Loka
00050000-55de-e605-996f-21411b0e74e3	3211	Škofja vas
00050000-55de-e605-e7d5-0625ef8ad5b7	1291	Škofljica
00050000-55de-e605-1510-ca89d6787ef1	6274	Šmarje
00050000-55de-e605-653e-fb66c3aff644	1293	Šmarje - Sap
00050000-55de-e605-d48a-feb4d0d7e484	3240	Šmarje pri Jelšah
00050000-55de-e605-85a2-244635e2860e	8220	Šmarješke Toplice
00050000-55de-e605-f562-0a1b85fced38	2315	Šmartno na Pohorju
00050000-55de-e605-cca8-f900a12eaef9	3341	Šmartno ob Dreti
00050000-55de-e605-8b8e-3f69bdfb0730	3327	Šmartno ob Paki
00050000-55de-e605-f3bc-ad7d5726b669	1275	Šmartno pri Litiji
00050000-55de-e605-3efe-de3d51792844	2383	Šmartno pri Slovenj Gradcu
00050000-55de-e605-17c5-3b6ab2de73a7	3201	Šmartno v Rožni dolini
00050000-55de-e605-2ca8-1632b1bee611	3325	Šoštanj
00050000-55de-e605-4ed6-f9af35148f42	6222	Štanjel
00050000-55de-e605-42c1-0fa7de1d4544	3220	Štore
00050000-55de-e605-1ad0-837888d1c477	3304	Tabor
00050000-55de-e605-01db-fd9706685405	3221	Teharje
00050000-55de-e605-ebd5-f1d491a7e83b	9251	Tišina
00050000-55de-e605-1e4c-57b2cb3269a7	5220	Tolmin
00050000-55de-e605-c700-b60c7270c9a5	3326	Topolšica
00050000-55de-e605-7b59-6a8e8270d3ef	2371	Trbonje
00050000-55de-e605-fd5c-9a7b47bec55b	1420	Trbovlje
00050000-55de-e605-27ab-aac743004145	8231	Trebelno 
00050000-55de-e605-6e70-7c8ba2f9a353	8210	Trebnje
00050000-55de-e605-46e7-0cb742591fc8	5252	Trnovo pri Gorici
00050000-55de-e605-371b-3afc6bf4dd39	2254	Trnovska vas
00050000-55de-e605-c282-b9927b6c93d4	1222	Trojane
00050000-55de-e605-37a2-57d61c6a9a01	1236	Trzin
00050000-55de-e605-3aa5-6ae32884519b	4290	Tržič
00050000-55de-e605-f609-2b8842dd3d0b	8295	Tržišče
00050000-55de-e605-ce52-ef3861ce3f82	1311	Turjak
00050000-55de-e605-fced-97a52990668f	9224	Turnišče
00050000-55de-e605-4362-6f97613e5732	8323	Uršna sela
00050000-55de-e605-f02c-9ecf0807f672	1252	Vače
00050000-55de-e605-9b8a-dcc7488e3d93	3320	Velenje 
00050000-55de-e605-7dae-ce466ba36447	3322	Velenje - poštni predali
00050000-55de-e605-7f90-640f3513a2fe	8212	Velika Loka
00050000-55de-e605-945d-702efb9163e8	2274	Velika Nedelja
00050000-55de-e605-595c-22f54b6ff34a	9225	Velika Polana
00050000-55de-e605-8a03-7ed784040be5	1315	Velike Lašče
00050000-55de-e605-549a-829840669352	8213	Veliki Gaber
00050000-55de-e605-b2b0-ff0f9e95a5ae	9241	Veržej
00050000-55de-e605-ac49-b6510c73721a	1312	Videm - Dobrepolje
00050000-55de-e605-0e55-b23f3847aa11	2284	Videm pri Ptuju
00050000-55de-e605-04ea-7ce9af7d9b5b	8344	Vinica
00050000-55de-e605-48ee-4624ecab11e2	5271	Vipava
00050000-55de-e605-a521-eea4d7b6b3c7	4212	Visoko
00050000-55de-e605-1c16-16cd5d7d431b	1294	Višnja Gora
00050000-55de-e605-d136-3f499a69f5c2	3205	Vitanje
00050000-55de-e605-94a2-037d0e1efd86	2255	Vitomarci
00050000-55de-e605-6b44-7e1fa78713a1	1217	Vodice
00050000-55de-e605-476e-03e672a346f0	3212	Vojnik\t
00050000-55de-e605-5de8-3b3c567a862d	5293	Volčja Draga
00050000-55de-e605-0dcd-fd52c72d4bd2	2232	Voličina
00050000-55de-e605-1351-db46ecf9d104	3305	Vransko
00050000-55de-e605-c34e-a5133d448a6d	6217	Vremski Britof
00050000-55de-e605-ad0a-a5404aef6aca	1360	Vrhnika
00050000-55de-e605-fa8d-5e5870b62b96	2365	Vuhred
00050000-55de-e605-2a31-353bb2817611	2367	Vuzenica
00050000-55de-e605-5671-a66cfdbd85d6	8292	Zabukovje 
00050000-55de-e605-7d1d-6b73ac438d5e	1410	Zagorje ob Savi
00050000-55de-e605-5eb2-91403f3c293e	1303	Zagradec
00050000-55de-e605-0957-2b79084b2384	2283	Zavrč
00050000-55de-e605-6155-46d22a96c28d	8272	Zdole 
00050000-55de-e605-89d9-3c87bbebe035	4201	Zgornja Besnica
00050000-55de-e605-0694-3d03982d980f	2242	Zgornja Korena
00050000-55de-e605-6905-da7bf6411630	2201	Zgornja Kungota
00050000-55de-e605-97d5-5273ee8ff670	2316	Zgornja Ložnica
00050000-55de-e605-2c3e-7afa5cb308ec	2314	Zgornja Polskava
00050000-55de-e605-8a80-bab68d92269d	2213	Zgornja Velka
00050000-55de-e605-4eae-38fff829f075	4247	Zgornje Gorje
00050000-55de-e605-84c2-8aec3169e04d	4206	Zgornje Jezersko
00050000-55de-e605-8149-489652dc836b	2285	Zgornji Leskovec
00050000-55de-e605-774f-b75ec923820d	1432	Zidani Most
00050000-55de-e605-bcee-817d6067c65d	3214	Zreče
00050000-55de-e605-0023-908276c180e5	4209	Žabnica
00050000-55de-e605-4222-d5202b2be9e5	3310	Žalec
00050000-55de-e605-78a0-7697c4eec109	4228	Železniki
00050000-55de-e605-f638-da430cacf4fe	2287	Žetale
00050000-55de-e605-4743-d865e15fb1f0	4226	Žiri
00050000-55de-e605-00cd-d1e3bfebde76	4274	Žirovnica
00050000-55de-e605-08e2-aae61229a37f	8360	Žužemberk
\.


--
-- TOC entry 2934 (class 0 OID 15887780)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 15887587)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55de-e607-48df-f27b1483ebea	00080000-55de-e607-3cf7-7d60a04793bc	\N	00040000-55de-e606-4096-41f2fabb0576	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55de-e607-f63d-f898973ba144	00080000-55de-e607-3cf7-7d60a04793bc	\N	00040000-55de-e606-4096-41f2fabb0576		\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55de-e607-7c54-75ef96ed67c3	00080000-55de-e607-ccea-f173357afbfb	\N	00040000-55de-e606-4096-41f2fabb0576		\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2922 (class 0 OID 15887665)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 15887792)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2960 (class 0 OID 15888143)
-- Dependencies: 226
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 15888153)
-- Dependencies: 227
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55de-e607-09f5-67b45d49d26d	00080000-55de-e607-b378-8bd2d617afb8	0987	AK
00190000-55de-e607-ebb9-80d48604d96d	00080000-55de-e607-ccea-f173357afbfb	0989	AK
00190000-55de-e607-2895-7701dc9abbc8	00080000-55de-e607-8071-b7d660a80e93	0986	AK
00190000-55de-e607-7108-c63f5d45fa3e	00080000-55de-e607-a60d-c10fe490c498	0984	AK
00190000-55de-e607-81e8-5eaacb35b026	00080000-55de-e607-3e34-8a073084227e	0983	AK
00190000-55de-e607-0c65-07a132c1cd39	00080000-55de-e607-63fa-861cd78cbb67	0982	AK
00190000-55de-e608-2dcb-d599ae9fc0af	00080000-55de-e608-bb6a-3f15be054520	1001	AK
\.


--
-- TOC entry 2959 (class 0 OID 15888099)
-- Dependencies: 225
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55de-e607-596b-7bdef2ab7183	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2962 (class 0 OID 15888161)
-- Dependencies: 228
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 15887821)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55de-e607-6b49-55ebbc3cb0d0	\N	\N	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55de-e607-ec0e-473feff9a9cf	\N	\N	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55de-e607-d266-fc22d8c19827	\N	\N	0003	Kazinska	t	84	Kazinska dvorana
00220000-55de-e607-7fc5-5a6a19a23139	\N	\N	0004	Mali oder	t	24	Mali oder 
00220000-55de-e607-66ae-c8c892128af3	\N	\N	0005	Komorni oder	t	15	Komorni oder
00220000-55de-e607-331f-b0174059b7e2	\N	\N	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55de-e607-18e2-8c05b57455f0	\N	\N	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2932 (class 0 OID 15887765)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 15887755)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 15887952)
-- Dependencies: 218
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 15887891)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 15887460)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55de-e608-bb6a-3f15be054520	00010000-55de-e606-0d43-919fdf50da07	2015-08-27 12:27:20	INS	a:0:{}
2	App\\Entity\\Option	00000000-55de-e608-9261-d5e11f523cdc	00010000-55de-e606-0d43-919fdf50da07	2015-08-27 12:27:20	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55de-e608-2dcb-d599ae9fc0af	00010000-55de-e606-0d43-919fdf50da07	2015-08-27 12:27:20	INS	a:0:{}
\.


--
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2941 (class 0 OID 15887833)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 15887498)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55de-e606-feac-c9722207abb0	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55de-e606-58a5-95c895bf3954	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55de-e606-641c-6bcb5dba61e1	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55de-e606-d49e-714177bfc1dc	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55de-e606-5a98-5d5064deac9e	planer	Planer dogodkov v koledarju	t
00020000-55de-e606-b6e6-422cf879e95e	kadrovska	Kadrovska služba	t
00020000-55de-e606-6dfc-d06948b9680f	arhivar	Ažuriranje arhivalij	t
00020000-55de-e606-91a8-129240ea94aa	igralec	Igralec	t
00020000-55de-e606-0fbe-64b9614b8e74	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55de-e607-c5e4-d24e164249b9	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2907 (class 0 OID 15887482)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55de-e606-1052-e1a4f5ac59b1	00020000-55de-e606-641c-6bcb5dba61e1
00010000-55de-e606-0d43-919fdf50da07	00020000-55de-e606-641c-6bcb5dba61e1
00010000-55de-e607-0151-d30fd303d014	00020000-55de-e607-c5e4-d24e164249b9
\.


--
-- TOC entry 2943 (class 0 OID 15887847)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 15887786)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 15887732)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 15888202)
-- Dependencies: 233
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55de-e605-cd47-414a7913d4d0	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55de-e605-2c27-6dbf4f93a4c4	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55de-e605-a074-0fd4b6e8eea0	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55de-e605-f4ab-9ebdc9b00547	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55de-e605-972e-4316bbc6ca59	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2966 (class 0 OID 15888194)
-- Dependencies: 232
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55de-e605-21d4-b63d5f5db1de	00230000-55de-e605-f4ab-9ebdc9b00547	popa
00240000-55de-e605-dc6a-444a408b4bfd	00230000-55de-e605-f4ab-9ebdc9b00547	oseba
00240000-55de-e605-15ca-eb5dc6fa822e	00230000-55de-e605-f4ab-9ebdc9b00547	sezona
00240000-55de-e605-2568-4df82d5a13e6	00230000-55de-e605-2c27-6dbf4f93a4c4	prostor
00240000-55de-e605-2c05-984b3fc8a2c2	00230000-55de-e605-f4ab-9ebdc9b00547	besedilo
00240000-55de-e605-1e6e-24d4a07a9e17	00230000-55de-e605-f4ab-9ebdc9b00547	uprizoritev
00240000-55de-e605-fe57-d3d2aa795cbe	00230000-55de-e605-f4ab-9ebdc9b00547	funkcija
00240000-55de-e605-c989-ef224600fc70	00230000-55de-e605-f4ab-9ebdc9b00547	tipfunkcije
00240000-55de-e605-c181-0196a71e316b	00230000-55de-e605-f4ab-9ebdc9b00547	alternacija
00240000-55de-e605-004b-e524463f360e	00230000-55de-e605-cd47-414a7913d4d0	pogodba
00240000-55de-e605-782f-6811f56b916b	00230000-55de-e605-f4ab-9ebdc9b00547	zaposlitev
00240000-55de-e605-2cc3-6cb9d94d6614	00230000-55de-e605-cd47-414a7913d4d0	programdela
00240000-55de-e605-d955-59c0b6520236	00230000-55de-e605-f4ab-9ebdc9b00547	zapis
\.


--
-- TOC entry 2965 (class 0 OID 15888189)
-- Dependencies: 231
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
d3cf9806-8c49-4617-a46d-ee6e6c972663	00230000-55de-e605-f4ab-9ebdc9b00547	0	1001
\.


--
-- TOC entry 2948 (class 0 OID 15887901)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55de-e607-e33d-192f51dc92f6	000e0000-55de-e607-e01d-5f425ad8bec6	00080000-55de-e607-3cf7-7d60a04793bc	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55de-e606-43db-761e3c29d602
00270000-55de-e607-815a-a2cebc74f265	000e0000-55de-e607-e01d-5f425ad8bec6	00080000-55de-e607-3cf7-7d60a04793bc	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55de-e606-43db-761e3c29d602
00270000-55de-e607-4db7-51c3eb749817	000e0000-55de-e607-e01d-5f425ad8bec6	00080000-55de-e607-ce2a-43012ea80e18	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4	\N
\.


--
-- TOC entry 2914 (class 0 OID 15887560)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 15887742)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55de-e607-6ccb-2df288f1f27f	00180000-55de-e607-eac4-1f4fdc41ba60	000c0000-55de-e607-f35f-91e2a7e22442	00090000-55de-e607-d73d-07994a1854d8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55de-e607-587c-425c1b969f7e	00180000-55de-e607-eac4-1f4fdc41ba60	000c0000-55de-e607-aa58-e080da3d27c4	00090000-55de-e607-9394-727601b88350	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55de-e607-693d-57b276adca37	00180000-55de-e607-eac4-1f4fdc41ba60	000c0000-55de-e607-dd0d-d0255cfc661c	00090000-55de-e607-3a08-c80fe1b0791a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55de-e607-bb0d-1d0be86390f4	00180000-55de-e607-eac4-1f4fdc41ba60	000c0000-55de-e607-2d0d-5bf762e55b70	00090000-55de-e607-98ed-b03cbbabc3f8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55de-e607-1f42-3b01f67f086a	00180000-55de-e607-eac4-1f4fdc41ba60	000c0000-55de-e607-6697-c37e690f1c8b	00090000-55de-e607-083a-84ab20fea9e6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55de-e607-1335-3328013df7c2	00180000-55de-e607-90f7-9963952d9abb	\N	00090000-55de-e607-083a-84ab20fea9e6	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2951 (class 0 OID 15887941)
-- Dependencies: 217
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55de-e605-b1ff-19a75b5b720c	Avtor	Avtorji	Avtorka	umetnik
000f0000-55de-e605-020c-874514d122cf	Priredba	Priredba	Priredba	umetnik
000f0000-55de-e605-ec49-46340a1187ed	Prevod	Prevod	Prevod	umetnik
000f0000-55de-e605-e139-97fb8b8c29a2	Režija	Režija	Režija	umetnik
000f0000-55de-e605-59e8-ae16134b76a9	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55de-e605-4b93-4fb066f61301	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55de-e605-feba-f208d2235103	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55de-e605-0d9d-66e191549dc4	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55de-e605-795e-b2364b3a7f6b	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55de-e605-8fe6-8fc961322a89	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55de-e605-327c-183ffad51409	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55de-e605-be17-1b62eb2d7232	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55de-e605-b529-d6520d6e9708	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55de-e605-6e4b-7823679a6ff9	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55de-e605-6052-9880fe3856b9	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55de-e605-d28d-f1db0117f431	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55de-e605-02f1-3ad6a87a570f	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55de-e605-f9da-84b0bd2a97d2	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2963 (class 0 OID 15888171)
-- Dependencies: 229
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55de-e605-b714-86f16dd998d8	01	Velika predstava	f	1.00	1.00
002b0000-55de-e605-5bc2-61579181aae4	02	Mala predstava	f	0.50	0.50
002b0000-55de-e605-3f7a-f5e17cca4efd	03	Mala koprodukcija	t	0.40	1.00
002b0000-55de-e605-81b1-ae02b2540ef0	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55de-e605-9678-f8acb0b87e59	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2919 (class 0 OID 15887622)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 15887469)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55de-e606-0d43-919fdf50da07	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROdnbXQ.QQfzIaI9.gcOXBQj1kv2nUDQK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55de-e607-0223-b478ecc36420	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55de-e607-5bfa-1cbab09d6492	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55de-e607-49e2-b529cf02c103	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55de-e607-80b5-8719248c6a37	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55de-e607-c3e1-2d3d23d15da7	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55de-e607-3d5b-6a559f45481a	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55de-e607-dc46-1498d8ffa5f1	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55de-e607-883f-cbb985350fc2	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55de-e607-2656-c4d3d263e929	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55de-e607-0151-d30fd303d014	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55de-e606-1052-e1a4f5ac59b1	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2955 (class 0 OID 15887989)
-- Dependencies: 221
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55de-e607-cafb-55e25b9917e5	00160000-55de-e607-37ce-155e6ebd7262	\N	00140000-55de-e605-9e9f-522ff17a56c6	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55de-e607-66ae-c8c892128af3
000e0000-55de-e607-e01d-5f425ad8bec6	00160000-55de-e607-5d6e-3f2c9ae1fd33	\N	00140000-55de-e605-1c00-561cbc36a7bf	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55de-e607-331f-b0174059b7e2
000e0000-55de-e607-12b1-730f915b5e10	\N	\N	00140000-55de-e605-1c00-561cbc36a7bf	00190000-55de-e607-09f5-67b45d49d26d	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55de-e607-66ae-c8c892128af3
000e0000-55de-e607-6f3c-3f8921132e75	\N	\N	00140000-55de-e605-1c00-561cbc36a7bf	00190000-55de-e607-09f5-67b45d49d26d	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55de-e607-66ae-c8c892128af3
000e0000-55de-e607-de8e-85cca954ece6	\N	\N	00140000-55de-e605-1c00-561cbc36a7bf	00190000-55de-e607-09f5-67b45d49d26d	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55de-e607-6b49-55ebbc3cb0d0
000e0000-55de-e607-63b8-eff77235a7fb	\N	\N	00140000-55de-e605-1c00-561cbc36a7bf	00190000-55de-e607-09f5-67b45d49d26d	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55de-e607-6b49-55ebbc3cb0d0
\.


--
-- TOC entry 2924 (class 0 OID 15887684)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55de-e607-db39-ec9e1aa6c8a2	000e0000-55de-e607-e01d-5f425ad8bec6	1	
00200000-55de-e607-266f-125d2a6a1ff6	000e0000-55de-e607-e01d-5f425ad8bec6	2	
\.


--
-- TOC entry 2939 (class 0 OID 15887813)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 15887915)
-- Dependencies: 215
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55de-e606-2174-b46e98cb750d	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55de-e606-efa8-79d76031a529	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55de-e606-333b-e3e8e5fa7481	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55de-e606-7742-e40bdf8e8aa5	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55de-e606-6427-aac3594bf3d3	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55de-e606-a6d9-d580f73a4298	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55de-e606-4ece-48a5267a0186	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55de-e606-7a40-c2553c50f2a4	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55de-e606-43db-761e3c29d602	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55de-e606-ceb9-399a1b638b1e	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55de-e606-c7ef-737dfbd61b61	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55de-e606-caa2-3046fbe05583	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55de-e606-d0a8-1a2c30b8193d	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55de-e606-e643-8e9df70ea07b	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55de-e606-9bd7-34761a0b76a4	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55de-e606-0119-1ea6949c521d	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55de-e606-92d8-55bf70f28568	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55de-e606-6d0f-1d0f248f623c	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55de-e606-3597-0c27fd2c16be	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55de-e606-c260-d740c75701c8	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55de-e606-ef48-216389c06b19	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55de-e606-1a1c-e8054bd7a97c	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55de-e606-8e74-7bcb5cf35660	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55de-e606-8b28-a94e14199f79	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2969 (class 0 OID 15888241)
-- Dependencies: 235
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 15888213)
-- Dependencies: 234
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 15888253)
-- Dependencies: 236
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 15887884)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55de-e607-2cc1-4453d0d185ac	00090000-55de-e607-9394-727601b88350	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55de-e607-369d-4a2866349f78	00090000-55de-e607-3a08-c80fe1b0791a	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55de-e607-71f5-1af1333f8a0c	00090000-55de-e607-7928-6fb3cca4beb0	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55de-e607-c594-98320defe71f	00090000-55de-e607-cdef-105acf7ab9cf	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55de-e607-957c-379964e9d152	00090000-55de-e607-d73d-07994a1854d8	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55de-e607-dae1-27202a0ade84	00090000-55de-e607-b855-425d936e135f	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2926 (class 0 OID 15887716)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 15887979)
-- Dependencies: 220
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55de-e605-9e9f-522ff17a56c6	01	Drama	drama (SURS 01)
00140000-55de-e605-87dd-39580d8e648f	02	Opera	opera (SURS 02)
00140000-55de-e605-b39e-0f5cfecb99f3	03	Balet	balet (SURS 03)
00140000-55de-e605-4539-eddf275901d4	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55de-e605-f552-327b1b9b17cb	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55de-e605-1c00-561cbc36a7bf	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55de-e605-e3df-589033bd4d87	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2945 (class 0 OID 15887874)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2448 (class 2606 OID 15887523)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 15888038)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 15888028)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 15887940)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 15888293)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 15887706)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 15887731)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 15888187)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 15887648)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 15888093)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 15887870)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 15887682)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 15887725)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 15887662)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 15887778)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 15888270)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 15888277)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2694 (class 2606 OID 15888301)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 15887805)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 15887620)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 15887532)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 15887556)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 15887512)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2439 (class 2606 OID 15887497)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 15887811)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 15887846)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 15887974)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 15887584)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 15887608)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 15887784)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 15887598)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 15887669)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 15887796)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 15888150)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 15888158)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 15888141)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 15888169)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 15887828)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 15887769)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 15887760)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 15887962)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 15887898)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 15887468)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 15887837)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 15887486)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2441 (class 2606 OID 15887506)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 15887855)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 15887791)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 15887740)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 15888211)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 15888199)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 15888193)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 15887911)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 15887565)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 15887751)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 15887951)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 15888181)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 15887633)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 15887481)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 15888007)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 15887691)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 15887819)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 15887923)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 15888251)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 15888235)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 15888259)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 15887889)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 15887720)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 15887987)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 15887882)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 1259 OID 15887713)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2591 (class 1259 OID 15887912)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2592 (class 1259 OID 15887913)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2593 (class 1259 OID 15887914)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2680 (class 1259 OID 15888272)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2681 (class 1259 OID 15888271)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2462 (class 1259 OID 15887586)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2554 (class 1259 OID 15887812)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2667 (class 1259 OID 15888239)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2668 (class 1259 OID 15888238)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2669 (class 1259 OID 15888240)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2670 (class 1259 OID 15888237)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2671 (class 1259 OID 15888236)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2548 (class 1259 OID 15887798)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2549 (class 1259 OID 15887797)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2499 (class 1259 OID 15887692)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2578 (class 1259 OID 15887871)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2579 (class 1259 OID 15887873)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2580 (class 1259 OID 15887872)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2487 (class 1259 OID 15887664)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2488 (class 1259 OID 15887663)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2650 (class 1259 OID 15888170)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2604 (class 1259 OID 15887976)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2605 (class 1259 OID 15887977)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2606 (class 1259 OID 15887978)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2677 (class 1259 OID 15888260)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2613 (class 1259 OID 15888012)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2614 (class 1259 OID 15888009)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2615 (class 1259 OID 15888013)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2616 (class 1259 OID 15888011)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2617 (class 1259 OID 15888010)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2477 (class 1259 OID 15887635)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2478 (class 1259 OID 15887634)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2453 (class 1259 OID 15887559)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2566 (class 1259 OID 15887838)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2517 (class 1259 OID 15887726)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2443 (class 1259 OID 15887513)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2444 (class 1259 OID 15887514)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2571 (class 1259 OID 15887858)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2572 (class 1259 OID 15887857)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2573 (class 1259 OID 15887856)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2491 (class 1259 OID 15887670)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2492 (class 1259 OID 15887672)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2493 (class 1259 OID 15887671)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2660 (class 1259 OID 15888201)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2528 (class 1259 OID 15887764)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2529 (class 1259 OID 15887762)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2530 (class 1259 OID 15887761)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2531 (class 1259 OID 15887763)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2434 (class 1259 OID 15887487)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2435 (class 1259 OID 15887488)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2557 (class 1259 OID 15887820)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2690 (class 1259 OID 15888294)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2691 (class 1259 OID 15888302)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2692 (class 1259 OID 15888303)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2543 (class 1259 OID 15887785)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2587 (class 1259 OID 15887899)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2588 (class 1259 OID 15887900)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2634 (class 1259 OID 15888098)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2635 (class 1259 OID 15888097)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2636 (class 1259 OID 15888094)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2637 (class 1259 OID 15888095)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2638 (class 1259 OID 15888096)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2466 (class 1259 OID 15887600)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2467 (class 1259 OID 15887599)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2468 (class 1259 OID 15887601)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2560 (class 1259 OID 15887832)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2561 (class 1259 OID 15887831)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2642 (class 1259 OID 15888151)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2643 (class 1259 OID 15888152)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2627 (class 1259 OID 15888042)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2628 (class 1259 OID 15888043)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2629 (class 1259 OID 15888040)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2630 (class 1259 OID 15888041)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2584 (class 1259 OID 15887890)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2534 (class 1259 OID 15887773)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2535 (class 1259 OID 15887772)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2536 (class 1259 OID 15887770)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2537 (class 1259 OID 15887771)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2623 (class 1259 OID 15888030)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2624 (class 1259 OID 15888029)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2639 (class 1259 OID 15888142)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2498 (class 1259 OID 15887683)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2657 (class 1259 OID 15888188)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2684 (class 1259 OID 15888278)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2685 (class 1259 OID 15888279)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2449 (class 1259 OID 15887534)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2450 (class 1259 OID 15887533)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2458 (class 1259 OID 15887566)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2459 (class 1259 OID 15887567)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2523 (class 1259 OID 15887754)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2524 (class 1259 OID 15887753)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2525 (class 1259 OID 15887752)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2505 (class 1259 OID 15887715)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2506 (class 1259 OID 15887711)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2507 (class 1259 OID 15887708)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2508 (class 1259 OID 15887709)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2509 (class 1259 OID 15887707)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2510 (class 1259 OID 15887712)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2511 (class 1259 OID 15887710)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2465 (class 1259 OID 15887585)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2483 (class 1259 OID 15887649)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2484 (class 1259 OID 15887651)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2485 (class 1259 OID 15887650)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2486 (class 1259 OID 15887652)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2542 (class 1259 OID 15887779)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2609 (class 1259 OID 15887975)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2618 (class 1259 OID 15888008)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2456 (class 1259 OID 15887557)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2457 (class 1259 OID 15887558)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2581 (class 1259 OID 15887883)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2666 (class 1259 OID 15888212)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 15887621)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2663 (class 1259 OID 15888200)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2564 (class 1259 OID 15887830)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2565 (class 1259 OID 15887829)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2631 (class 1259 OID 15888039)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2473 (class 1259 OID 15887609)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2610 (class 1259 OID 15887988)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2674 (class 1259 OID 15888252)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2648 (class 1259 OID 15888159)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 15888160)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2522 (class 1259 OID 15887741)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2442 (class 1259 OID 15887507)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2512 (class 1259 OID 15887714)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2720 (class 2606 OID 15888439)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2723 (class 2606 OID 15888424)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2722 (class 2606 OID 15888429)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2718 (class 2606 OID 15888449)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2724 (class 2606 OID 15888419)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2719 (class 2606 OID 15888444)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2721 (class 2606 OID 15888434)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2757 (class 2606 OID 15888604)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2756 (class 2606 OID 15888609)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2755 (class 2606 OID 15888614)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2790 (class 2606 OID 15888784)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2791 (class 2606 OID 15888779)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2705 (class 2606 OID 15888354)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2741 (class 2606 OID 15888534)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2785 (class 2606 OID 15888764)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2786 (class 2606 OID 15888759)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2784 (class 2606 OID 15888769)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2787 (class 2606 OID 15888754)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2788 (class 2606 OID 15888749)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2739 (class 2606 OID 15888529)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2740 (class 2606 OID 15888524)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2717 (class 2606 OID 15888414)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2751 (class 2606 OID 15888574)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2749 (class 2606 OID 15888584)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2750 (class 2606 OID 15888579)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2711 (class 2606 OID 15888389)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2712 (class 2606 OID 15888384)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2737 (class 2606 OID 15888514)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2781 (class 2606 OID 15888734)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2760 (class 2606 OID 15888619)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2759 (class 2606 OID 15888624)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2758 (class 2606 OID 15888629)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2789 (class 2606 OID 15888774)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2762 (class 2606 OID 15888649)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2765 (class 2606 OID 15888634)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2761 (class 2606 OID 15888654)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2763 (class 2606 OID 15888644)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2764 (class 2606 OID 15888639)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2709 (class 2606 OID 15888379)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2710 (class 2606 OID 15888374)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2701 (class 2606 OID 15888339)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2702 (class 2606 OID 15888334)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2745 (class 2606 OID 15888554)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2725 (class 2606 OID 15888454)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2698 (class 2606 OID 15888314)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2697 (class 2606 OID 15888319)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2746 (class 2606 OID 15888569)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2747 (class 2606 OID 15888564)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2748 (class 2606 OID 15888559)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2715 (class 2606 OID 15888394)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2713 (class 2606 OID 15888404)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2714 (class 2606 OID 15888399)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2783 (class 2606 OID 15888744)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2729 (class 2606 OID 15888489)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2731 (class 2606 OID 15888479)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2732 (class 2606 OID 15888474)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2730 (class 2606 OID 15888484)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2696 (class 2606 OID 15888304)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2695 (class 2606 OID 15888309)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2742 (class 2606 OID 15888539)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2794 (class 2606 OID 15888799)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2796 (class 2606 OID 15888804)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2795 (class 2606 OID 15888809)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2738 (class 2606 OID 15888519)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2754 (class 2606 OID 15888594)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2753 (class 2606 OID 15888599)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2772 (class 2606 OID 15888709)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2773 (class 2606 OID 15888704)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2776 (class 2606 OID 15888689)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2775 (class 2606 OID 15888694)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2774 (class 2606 OID 15888699)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2707 (class 2606 OID 15888364)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2708 (class 2606 OID 15888359)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2706 (class 2606 OID 15888369)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2743 (class 2606 OID 15888549)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2744 (class 2606 OID 15888544)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2779 (class 2606 OID 15888719)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2778 (class 2606 OID 15888724)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2769 (class 2606 OID 15888679)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2768 (class 2606 OID 15888684)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2771 (class 2606 OID 15888669)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2770 (class 2606 OID 15888674)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2752 (class 2606 OID 15888589)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2733 (class 2606 OID 15888509)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2734 (class 2606 OID 15888504)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2736 (class 2606 OID 15888494)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2735 (class 2606 OID 15888499)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2766 (class 2606 OID 15888664)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2767 (class 2606 OID 15888659)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2777 (class 2606 OID 15888714)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2716 (class 2606 OID 15888409)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2780 (class 2606 OID 15888729)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2782 (class 2606 OID 15888739)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2793 (class 2606 OID 15888789)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2792 (class 2606 OID 15888794)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2699 (class 2606 OID 15888329)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2700 (class 2606 OID 15888324)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2704 (class 2606 OID 15888344)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2703 (class 2606 OID 15888349)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2726 (class 2606 OID 15888469)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2727 (class 2606 OID 15888464)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2728 (class 2606 OID 15888459)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-27 12:27:21 CEST

--
-- PostgreSQL database dump complete
--

