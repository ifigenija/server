--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-24 16:13:43 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 240 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2964 (class 0 OID 0)
-- Dependencies: 240
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 177 (class 1259 OID 15332078)
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
-- TOC entry 222 (class 1259 OID 15332581)
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
-- TOC entry 221 (class 1259 OID 15332564)
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
-- TOC entry 215 (class 1259 OID 15332476)
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
-- TOC entry 238 (class 1259 OID 15332829)
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
-- TOC entry 191 (class 1259 OID 15332257)
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
-- TOC entry 194 (class 1259 OID 15332291)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 15332731)
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
-- TOC entry 186 (class 1259 OID 15332200)
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
-- TOC entry 223 (class 1259 OID 15332594)
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
-- TOC entry 210 (class 1259 OID 15332421)
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
-- TOC entry 189 (class 1259 OID 15332237)
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
-- TOC entry 193 (class 1259 OID 15332285)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 15332217)
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
-- TOC entry 199 (class 1259 OID 15332338)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 236 (class 1259 OID 15332810)
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
-- TOC entry 237 (class 1259 OID 15332822)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 15332844)
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
-- TOC entry 203 (class 1259 OID 15332363)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 15332174)
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
-- TOC entry 178 (class 1259 OID 15332087)
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
-- TOC entry 179 (class 1259 OID 15332098)
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
-- TOC entry 174 (class 1259 OID 15332052)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 15332071)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 15332370)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 15332401)
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
-- TOC entry 218 (class 1259 OID 15332515)
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
-- TOC entry 181 (class 1259 OID 15332131)
-- Name: popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE popa (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    sifra character varying(4) NOT NULL,
    tipkli character varying(20) DEFAULT NULL::character varying,
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
-- TOC entry 183 (class 1259 OID 15332166)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 15332344)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 15332151)
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
-- TOC entry 188 (class 1259 OID 15332229)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 15332356)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 15332692)
-- Name: produkcijadelitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijadelitev (
    id uuid NOT NULL,
    koproducent_id uuid NOT NULL,
    odstotekfinanciranja numeric(15,2) DEFAULT NULL::numeric,
    delez numeric(15,2) DEFAULT NULL::numeric,
    zaproseno numeric(15,2) DEFAULT NULL::numeric,
    maticnikop boolean NOT NULL,
    enotaprograma_id uuid
);


--
-- TOC entry 226 (class 1259 OID 15332702)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 224 (class 1259 OID 15332648)
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
-- TOC entry 227 (class 1259 OID 15332710)
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
-- TOC entry 206 (class 1259 OID 15332385)
-- Name: prostor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prostor (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    jeprizorisce boolean,
    kapaciteta integer,
    opis text
);


--
-- TOC entry 198 (class 1259 OID 15332329)
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
-- TOC entry 197 (class 1259 OID 15332319)
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
-- TOC entry 217 (class 1259 OID 15332504)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 15332453)
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
-- TOC entry 171 (class 1259 OID 15332023)
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
-- TOC entry 170 (class 1259 OID 15332021)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 207 (class 1259 OID 15332395)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 15332061)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 15332045)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 15332409)
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
-- TOC entry 201 (class 1259 OID 15332350)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 15332296)
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
-- TOC entry 232 (class 1259 OID 15332751)
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
-- TOC entry 231 (class 1259 OID 15332743)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 15332738)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 15332463)
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
    sort integer
);


--
-- TOC entry 180 (class 1259 OID 15332123)
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
-- TOC entry 196 (class 1259 OID 15332306)
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
-- TOC entry 216 (class 1259 OID 15332493)
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
-- TOC entry 228 (class 1259 OID 15332720)
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
-- TOC entry 185 (class 1259 OID 15332186)
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
-- TOC entry 172 (class 1259 OID 15332032)
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
-- TOC entry 220 (class 1259 OID 15332541)
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
    kratkinaslov character varying(255) DEFAULT NULL::character varying,
    maticnioder_id uuid
);


--
-- TOC entry 190 (class 1259 OID 15332248)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 15332377)
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
-- TOC entry 234 (class 1259 OID 15332790)
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
-- TOC entry 233 (class 1259 OID 15332762)
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
-- TOC entry 235 (class 1259 OID 15332802)
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
-- TOC entry 212 (class 1259 OID 15332446)
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
-- TOC entry 192 (class 1259 OID 15332280)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 15332531)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 15332436)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2170 (class 2604 OID 15332026)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2895 (class 0 OID 15332078)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 15332581)
-- Dependencies: 222
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55db-2696-d710-ccefa0ccdbd7	000d0000-55db-2696-627c-7539b45e6c7e	\N	00090000-55db-2695-cf9b-bfcbba161b6c	000b0000-55db-2696-18df-15993c75f955	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55db-2696-e8fd-8426ee23cfe5	000d0000-55db-2696-80ac-5842b92a613c	00100000-55db-2696-b603-57ffee5ab491	00090000-55db-2695-65a2-2539c8325f79	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55db-2696-c425-04b35728d0ba	000d0000-55db-2696-ec84-bdbe841937f5	00100000-55db-2696-0dbe-378505c4b225	00090000-55db-2695-ee23-c89bd0177bfb	\N	0003	t	\N	2015-08-24	\N	2	\N	\N	f	f
000c0000-55db-2696-dd6f-878fe9131110	000d0000-55db-2696-1bc5-c195754a77d6	\N	00090000-55db-2695-8f13-d3f9ee0d88df	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55db-2696-b402-2a95af407061	000d0000-55db-2696-9b68-2173bc5ef70c	\N	00090000-55db-2695-bf94-5c1bd716e001	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55db-2696-c0df-cbc25988e843	000d0000-55db-2696-6bd5-ef6b12736eaf	\N	00090000-55db-2695-02b2-4c49e618b4d9	000b0000-55db-2696-f58d-95b18bd2f124	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55db-2696-5e01-7b5bb9750399	000d0000-55db-2696-48d1-a1c04fc96db8	00100000-55db-2696-3d43-95b38c02487b	00090000-55db-2695-f76b-c630e0f1bdd9	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55db-2696-0e25-e08fd8b89e57	000d0000-55db-2696-cb5b-cce53321ccae	\N	00090000-55db-2695-1ce7-ae007998afe4	000b0000-55db-2696-027c-11c062a171d1	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55db-2696-7b27-7d6ba7f00644	000d0000-55db-2696-48d1-a1c04fc96db8	00100000-55db-2696-7895-c5c67734ca3c	00090000-55db-2695-1f33-e8ea0da452b1	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55db-2696-51b7-0401809eb15a	000d0000-55db-2696-48d1-a1c04fc96db8	00100000-55db-2696-8c57-dca96b3d83a3	00090000-55db-2695-d44e-a55c99e74486	\N	0010	t	\N	2015-08-24	\N	16	\N	\N	f	t
000c0000-55db-2696-1b8f-af95a922b573	000d0000-55db-2696-48d1-a1c04fc96db8	00100000-55db-2696-519f-04ad322408d9	00090000-55db-2695-73d3-da8f27e63d53	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2939 (class 0 OID 15332564)
-- Dependencies: 221
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 15332476)
-- Dependencies: 215
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55db-2695-096d-0a8d98c6f939	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55db-2695-cbc0-ce814c6e95da	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55db-2695-beb8-b43eab1d9d3e	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2956 (class 0 OID 15332829)
-- Dependencies: 238
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 15332257)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55db-2696-c857-fd9e1d1bfa46	\N	\N	00200000-55db-2696-f9fd-bb9aafac01a7	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55db-2696-b42f-ee3f7cf40737	\N	\N	00200000-55db-2696-a420-bf311706c1d9	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55db-2696-653e-528240373422	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55db-2696-3da0-39ef743adc68	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55db-2696-7509-8c6bafc64134	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2912 (class 0 OID 15332291)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 15332731)
-- Dependencies: 229
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 15332200)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55db-2694-a8ed-94ed5ca6eded	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55db-2694-85d3-a54b51f44d9f	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55db-2694-b21a-6227c3b4d14a	AL	ALB	008	Albania 	Albanija	\N
00040000-55db-2694-07ac-d26f3f8516a3	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55db-2694-d53b-1b8f3a08ed4e	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55db-2694-2989-9eba1f53a025	AD	AND	020	Andorra 	Andora	\N
00040000-55db-2694-b480-398cd175606e	AO	AGO	024	Angola 	Angola	\N
00040000-55db-2694-30fb-a3b44f3149ad	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55db-2694-a897-368208ab21e3	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55db-2694-b086-e7ee0ae1917b	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55db-2694-aa3a-72f960111a7e	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55db-2694-92b8-ae5ac9fabf82	AM	ARM	051	Armenia 	Armenija	\N
00040000-55db-2694-2a90-dd364940d5d9	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55db-2694-ed0d-42bdd2b893a8	AU	AUS	036	Australia 	Avstralija	\N
00040000-55db-2694-83aa-e2e8be676e44	AT	AUT	040	Austria 	Avstrija	\N
00040000-55db-2694-1c3b-0f2fde1816a5	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55db-2694-8e57-e331a805c3c9	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55db-2694-e3a6-bb0a56f43e45	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55db-2694-a7b5-d7a98ea25f3d	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55db-2694-2d82-fb9522ecc767	BB	BRB	052	Barbados 	Barbados	\N
00040000-55db-2694-f996-3385557277b3	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55db-2694-f698-05bc8a28ac23	BE	BEL	056	Belgium 	Belgija	\N
00040000-55db-2694-8adf-c8c8c815c81c	BZ	BLZ	084	Belize 	Belize	\N
00040000-55db-2694-1876-5e56a525ab6e	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55db-2694-32b0-88dabd5145ee	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55db-2694-695c-da26dbbf6e9b	BT	BTN	064	Bhutan 	Butan	\N
00040000-55db-2694-20e0-16b51300ff56	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55db-2694-10f9-8f196974bbd6	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55db-2694-8f2f-35fdcb11ce76	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55db-2694-c824-117f301ce357	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55db-2694-fbfd-51f3d6fe0ee6	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55db-2694-6706-b74044667c13	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55db-2694-67b0-8305ef86ca79	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55db-2694-62fe-7a47414b8917	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55db-2694-83ea-daf3bc727c05	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55db-2694-92b5-d2d673a09e33	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55db-2694-fe3d-3bc961add89f	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55db-2694-0c22-001b2e1df00a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55db-2694-2949-f271a7ea27bf	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55db-2694-cab8-e2b4c39392a6	CA	CAN	124	Canada 	Kanada	\N
00040000-55db-2694-b4c0-3d7f03babfaf	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55db-2694-4ad2-a6bc11b55419	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55db-2694-15ca-9375c3364f54	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55db-2694-c0a8-d9bc4b190b04	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55db-2694-af81-dcfb1083aa50	CL	CHL	152	Chile 	Čile	\N
00040000-55db-2694-fde8-3fbb80c9c4c6	CN	CHN	156	China 	Kitajska	\N
00040000-55db-2694-d2e6-f02739ab2355	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55db-2694-1b23-a3553fbe8d3d	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55db-2694-212e-b556ba82e99e	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55db-2694-ea75-c97d6b1c899c	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55db-2694-6fd0-783ae1dcf5ea	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55db-2694-d30c-2637ab2ebaba	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55db-2694-080c-b7ab2fe172ec	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55db-2694-5095-0b47777b53de	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55db-2694-c084-6bc635a24526	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55db-2694-0eb3-a20623044755	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55db-2694-227b-b6ffcdad2612	CU	CUB	192	Cuba 	Kuba	\N
00040000-55db-2694-81b7-6abbab7c2a90	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55db-2694-cf55-cad31cffa619	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55db-2694-a411-5453f9d7e490	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55db-2694-b216-4cc8b8172c19	DK	DNK	208	Denmark 	Danska	\N
00040000-55db-2694-8df3-f258f28c556e	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55db-2694-a486-8511916cda30	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55db-2694-20f0-fa2467025b92	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55db-2694-4b39-7a31fe5492e4	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55db-2694-2d75-cb5c7d09ec59	EG	EGY	818	Egypt 	Egipt	\N
00040000-55db-2694-a6e0-318739ccbe27	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55db-2694-5a96-dd5589a236bc	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55db-2694-11d9-f21a0510296d	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55db-2694-49f9-7624442a4c85	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55db-2694-ebe6-18aef95bc1af	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55db-2694-d5d2-e2b1c5a049bd	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55db-2694-ece6-7c75e92b6062	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55db-2694-4b19-70c031f1196f	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55db-2694-677f-6c691d645472	FI	FIN	246	Finland 	Finska	\N
00040000-55db-2694-729f-95abcb6ab5a2	FR	FRA	250	France 	Francija	\N
00040000-55db-2694-cf89-475fc7ac4576	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55db-2694-aafb-4d9c669ff33f	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55db-2694-9591-18b975301ac8	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55db-2694-a9ee-a9e6a1615992	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55db-2694-e956-b36934e69a96	GA	GAB	266	Gabon 	Gabon	\N
00040000-55db-2694-4869-15208c138372	GM	GMB	270	Gambia 	Gambija	\N
00040000-55db-2694-f284-fe5f47dab54c	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55db-2694-0573-9d308230766b	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55db-2694-f77a-ed91ada77f9b	GH	GHA	288	Ghana 	Gana	\N
00040000-55db-2694-8d7b-1a311840c21b	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55db-2694-536e-ae078aee0dd1	GR	GRC	300	Greece 	Grčija	\N
00040000-55db-2694-5920-d733ebb58d1d	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55db-2694-9e50-3a58a84156c0	GD	GRD	308	Grenada 	Grenada	\N
00040000-55db-2694-1fa6-ba45db5b5e6b	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55db-2694-f8cd-1846e24c6b07	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55db-2694-bafe-2e119f83b89c	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55db-2694-1207-3dc9c929bb4e	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55db-2694-94c6-2efb01254c1e	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55db-2694-1416-55a1a7e951cd	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55db-2694-b669-08a1843ea6e9	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55db-2694-70e0-5f02d530c4d0	HT	HTI	332	Haiti 	Haiti	\N
00040000-55db-2694-9b32-e2a33017d00a	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55db-2694-178d-eb0cfe1054b0	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55db-2694-9133-25df5dddea99	HN	HND	340	Honduras 	Honduras	\N
00040000-55db-2694-87f5-545f5dee11f0	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55db-2694-e761-2ba957ace0ab	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55db-2694-c519-8a43f72d2bb7	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55db-2694-9d15-e3ecebd0caf5	IN	IND	356	India 	Indija	\N
00040000-55db-2694-e6d7-8067e55be6f5	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55db-2694-f015-21f04f288e70	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55db-2694-3844-6a76ae61859f	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55db-2694-317f-517b9e78565f	IE	IRL	372	Ireland 	Irska	\N
00040000-55db-2694-9f03-fd9377d1ed4e	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55db-2694-ef37-d9339b39db7b	IL	ISR	376	Israel 	Izrael	\N
00040000-55db-2694-c052-dfc55bb7c2b4	IT	ITA	380	Italy 	Italija	\N
00040000-55db-2694-45a4-2b20e62b9645	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55db-2694-362c-6c7ef2f0361c	JP	JPN	392	Japan 	Japonska	\N
00040000-55db-2694-ce38-541af3890a05	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55db-2694-f45b-cbbf8a8460e2	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55db-2694-0f4d-db769eafdd6a	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55db-2694-664d-ce96b3be07e1	KE	KEN	404	Kenya 	Kenija	\N
00040000-55db-2694-07e5-0b5c75bfd3f0	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55db-2694-868e-7057b37feaee	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55db-2694-2703-041a0cfc0ef6	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55db-2694-31b7-efb9fdb8f3b6	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55db-2694-0299-993a9361a599	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55db-2694-2ed9-fb1b6bdf7980	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55db-2694-ab98-aa85da42e0e3	LV	LVA	428	Latvia 	Latvija	\N
00040000-55db-2694-62b7-be160b2f9efc	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55db-2694-eec9-65ef04ea917c	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55db-2694-54d2-6572c0682158	LR	LBR	430	Liberia 	Liberija	\N
00040000-55db-2694-2e0c-b2450ddcbc6f	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55db-2694-bd90-57ea15e81c05	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55db-2694-ffe4-3fb80187c983	LT	LTU	440	Lithuania 	Litva	\N
00040000-55db-2694-7863-da5dab98f170	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55db-2694-c751-6a3aa0cefa21	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55db-2694-470e-ebb36d8481f5	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55db-2694-45d9-386bc9816d7a	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55db-2694-14cf-13b2bf17382a	MW	MWI	454	Malawi 	Malavi	\N
00040000-55db-2694-ae37-24a98c6abdc4	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55db-2694-d9e6-686f6f793dfc	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55db-2694-0c35-a1effb19c205	ML	MLI	466	Mali 	Mali	\N
00040000-55db-2694-68a6-5577e8fa34f9	MT	MLT	470	Malta 	Malta	\N
00040000-55db-2694-42a8-e7bc35c002af	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55db-2694-546d-caabfc36cd4a	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55db-2694-ac53-ef9c127da006	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55db-2694-c2d2-2e9c21be1e59	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55db-2694-c71e-56d536a43070	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55db-2694-d4b7-cb42cf533724	MX	MEX	484	Mexico 	Mehika	\N
00040000-55db-2694-ca21-2ac1968341c4	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55db-2694-6b27-a8b45763743e	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55db-2694-3315-aeebd8f59f88	MC	MCO	492	Monaco 	Monako	\N
00040000-55db-2694-b457-3e0a9ae00eef	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55db-2694-233d-0f1b6600ef02	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55db-2694-54fd-b94b44a9c7e0	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55db-2694-035d-50f50995c1ca	MA	MAR	504	Morocco 	Maroko	\N
00040000-55db-2694-6b17-7804c12c4426	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55db-2694-1580-6f37d1935f04	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55db-2694-ea96-9999c7a9fb8e	NA	NAM	516	Namibia 	Namibija	\N
00040000-55db-2694-35d8-78b03d4ff4a8	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55db-2694-3604-0442b8a541bd	NP	NPL	524	Nepal 	Nepal	\N
00040000-55db-2694-e792-788cfec213a5	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55db-2694-afc6-2afcf3f42e22	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55db-2694-75fc-a0789f057d5c	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55db-2694-e1e1-376835f137ae	NE	NER	562	Niger 	Niger 	\N
00040000-55db-2694-3d44-e4aacc3fb0a1	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55db-2694-e6ed-bebce97ea89d	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55db-2694-ee33-5ab604e08c3c	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55db-2694-9861-f8fc537a67b3	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55db-2694-456f-236e9222a79a	NO	NOR	578	Norway 	Norveška	\N
00040000-55db-2694-1992-80d26d5f778e	OM	OMN	512	Oman 	Oman	\N
00040000-55db-2694-50a6-e9cc14c37aa4	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55db-2694-643a-9df537128f18	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55db-2694-0480-9ece1ba7d77a	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55db-2694-b038-f2ae57bf808c	PA	PAN	591	Panama 	Panama	\N
00040000-55db-2694-80fc-f2f591842c11	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55db-2694-b48d-603431db1b9f	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55db-2694-2ade-a72cc8831fd7	PE	PER	604	Peru 	Peru	\N
00040000-55db-2694-e678-a548f3458931	PH	PHL	608	Philippines 	Filipini	\N
00040000-55db-2694-230f-773e859fc027	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55db-2694-45d6-13e318415eb7	PL	POL	616	Poland 	Poljska	\N
00040000-55db-2694-5e95-ddb20f601822	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55db-2694-f133-de68138e6507	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55db-2694-037e-3565ba77b64f	QA	QAT	634	Qatar 	Katar	\N
00040000-55db-2694-c1e0-879b96380e9c	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55db-2694-c38a-146c182e5954	RO	ROU	642	Romania 	Romunija	\N
00040000-55db-2694-f55a-88be4aeea690	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55db-2694-da25-336d376f5ed0	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55db-2694-d628-a5156eec5e09	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55db-2694-1c7d-83b752511147	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55db-2694-f3ce-4829fb6c1da6	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55db-2694-3012-7436fdc3b5c1	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55db-2694-a67d-353be34d9fdb	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55db-2694-181b-0d6cc7015015	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55db-2694-fb78-5c39d4bdb45b	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55db-2694-cdbd-f9514d0c8852	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55db-2694-b03a-3ee41c3608ee	SM	SMR	674	San Marino 	San Marino	\N
00040000-55db-2694-c642-df8ceae58e96	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55db-2694-2e1a-48e61bfce30d	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55db-2694-55e8-72fcd5896bc1	SN	SEN	686	Senegal 	Senegal	\N
00040000-55db-2694-4093-f571895b7384	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55db-2694-b9b0-af97a33b7ff9	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55db-2694-afcf-7623e9ff0e93	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55db-2694-aeb9-5258aaafc684	SG	SGP	702	Singapore 	Singapur	\N
00040000-55db-2694-4bc9-58e1b1bc9d5f	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55db-2694-0893-2344c0de0f70	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55db-2694-d7bd-5d7495927861	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55db-2694-69f2-7b78102fb7bd	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55db-2694-e45c-7d50871e7b01	SO	SOM	706	Somalia 	Somalija	\N
00040000-55db-2694-1d0b-c199ce10f04a	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55db-2694-c7d0-05fd51956b14	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55db-2694-7277-b7dce35ac612	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55db-2694-c195-269ff7db1c80	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55db-2694-e1d9-3b85e48de52f	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55db-2694-1664-70bab17cada3	SD	SDN	729	Sudan 	Sudan	\N
00040000-55db-2694-834e-f6de508be202	SR	SUR	740	Suriname 	Surinam	\N
00040000-55db-2694-c6a1-8bbc70cba010	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55db-2694-4f7b-816f18fab7fd	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55db-2694-9c6f-ad747a1a7217	SE	SWE	752	Sweden 	Švedska	\N
00040000-55db-2694-b9aa-7980ceaf99f0	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55db-2694-720a-ba84e95515c0	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55db-2694-7c6c-07f21c771146	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55db-2694-d25f-725de868088a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55db-2694-b2dd-4ec50e5d5470	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55db-2694-46aa-8cdb22ef6932	TH	THA	764	Thailand 	Tajska	\N
00040000-55db-2694-3eef-d2dbfa17d8f7	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55db-2694-bbc2-c765a91da021	TG	TGO	768	Togo 	Togo	\N
00040000-55db-2694-e7d2-9ad9446c6e72	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55db-2694-379e-c2d186d0e762	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55db-2694-27e9-01e8c58136f5	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55db-2694-0c40-e7ce01bdd6e5	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55db-2694-7545-ec95cecac21a	TR	TUR	792	Turkey 	Turčija	\N
00040000-55db-2694-e89c-4120abdcae0f	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55db-2694-cde4-a82b26db4c56	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55db-2694-1ac8-b782c6a199e9	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55db-2694-64e4-9de944c6233b	UG	UGA	800	Uganda 	Uganda	\N
00040000-55db-2694-3253-d8a7fc449a8c	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55db-2694-39a9-e2439ce35b8e	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55db-2694-7459-b76fa74bd08d	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55db-2694-669d-6a95e1163942	US	USA	840	United States 	Združene države Amerike	\N
00040000-55db-2694-4435-fb1bfd395d7e	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55db-2694-e87a-40381af52dd6	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55db-2694-b170-d27d6bfdcc5e	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55db-2694-745f-9fab20ed8060	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55db-2694-2992-0c190ca6e238	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55db-2694-24c2-2d484fb58ec9	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55db-2694-f54b-846b5490acfc	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55db-2694-f565-f38cf73b1494	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55db-2694-40fa-ba2c38ad3b3a	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55db-2694-3a5e-bdb28d8cda7d	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55db-2694-bc49-b341926f219e	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55db-2694-28a1-8380835891c4	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55db-2694-2ff5-92f0c7165c19	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2941 (class 0 OID 15332594)
-- Dependencies: 223
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55db-2696-ed06-b058c03acb71	000e0000-55db-2695-1e13-a912cd215877	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		\N	002b0000-55db-2694-f22c-9409c730fa6c	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55db-2696-240d-63bc231d776a	000e0000-55db-2695-5345-d544176e19aa	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		\N	002b0000-55db-2694-a930-f4b0d350045a	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55db-2696-5cdc-b100ad6bd05a	000e0000-55db-2695-242e-d31e05301d61	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		\N	002b0000-55db-2694-f22c-9409c730fa6c	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55db-2696-f487-9524591e14f7	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55db-2696-eb62-d41181c92f27	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2928 (class 0 OID 15332421)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55db-2696-48d1-a1c04fc96db8	000e0000-55db-2695-5345-d544176e19aa	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55db-2694-bb3d-5ee50892098c
000d0000-55db-2696-627c-7539b45e6c7e	000e0000-55db-2695-5345-d544176e19aa	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55db-2694-bb3d-5ee50892098c
000d0000-55db-2696-80ac-5842b92a613c	000e0000-55db-2695-5345-d544176e19aa	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55db-2694-c332-c49487abe4e1
000d0000-55db-2696-ec84-bdbe841937f5	000e0000-55db-2695-5345-d544176e19aa	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55db-2694-742f-69c7e58995c8
000d0000-55db-2696-1bc5-c195754a77d6	000e0000-55db-2695-5345-d544176e19aa	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55db-2694-5690-fcd4c7b7fc51
000d0000-55db-2696-9b68-2173bc5ef70c	000e0000-55db-2695-5345-d544176e19aa	\N	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55db-2694-5690-fcd4c7b7fc51
000d0000-55db-2696-6bd5-ef6b12736eaf	000e0000-55db-2695-5345-d544176e19aa	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55db-2694-bb3d-5ee50892098c
000d0000-55db-2696-cb5b-cce53321ccae	000e0000-55db-2695-5345-d544176e19aa	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55db-2694-fbc7-84f8901bf92a
\.


--
-- TOC entry 2907 (class 0 OID 15332237)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2911 (class 0 OID 15332285)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 15332217)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55db-2696-15e3-6089b02ca7c1	00080000-55db-2695-15f2-4da8c59fd847	00090000-55db-2695-d44e-a55c99e74486	AK		
\.


--
-- TOC entry 2917 (class 0 OID 15332338)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 15332810)
-- Dependencies: 236
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2955 (class 0 OID 15332822)
-- Dependencies: 237
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2957 (class 0 OID 15332844)
-- Dependencies: 239
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2921 (class 0 OID 15332363)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 15332174)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55db-2694-3682-e39293f0ab8d	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55db-2694-e9a6-d5fba667d88f	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55db-2694-f4ef-577c11007b5f	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55db-2694-b862-7222c627b5de	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55db-2694-279f-901165541ea6	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55db-2694-b717-3740bc26ff25	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55db-2694-b377-06162f03bddd	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55db-2694-3930-5452e9f9be57	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55db-2694-5e19-7ffb4506c169	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55db-2694-12b6-6a70c2490f1c	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55db-2694-a738-5583d9a98baa	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55db-2694-6d1e-472ebe4e8749	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55db-2694-a2fe-f09cb171da3d	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55db-2694-6f21-964ba37e1c6e	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55db-2695-10d8-b8267d92a86f	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55db-2695-6a37-0b2ea20162b0	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55db-2695-5ad1-a6c7957a68ec	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55db-2695-7157-950e99f5c4d7	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55db-2695-ddc7-fbe7bb1e0084	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55db-2696-8651-2f73d2ba9c11	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2896 (class 0 OID 15332087)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55db-2695-aabe-8668090f0420	00000000-55db-2695-10d8-b8267d92a86f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55db-2695-6f67-c58c00de7209	00000000-55db-2695-10d8-b8267d92a86f	00010000-55db-2694-2058-dfa41b36cae1	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55db-2695-d36c-937e1e5c6081	00000000-55db-2695-6a37-0b2ea20162b0	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2897 (class 0 OID 15332098)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55db-2695-cf9b-bfcbba161b6c	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55db-2695-8f13-d3f9ee0d88df	00010000-55db-2695-7854-7f7d420e90be	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55db-2695-ee23-c89bd0177bfb	00010000-55db-2695-863c-9da7f63770d4	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55db-2695-1f33-e8ea0da452b1	00010000-55db-2695-8ab4-f4889296e895	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55db-2695-6480-c97545304393	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55db-2695-02b2-4c49e618b4d9	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55db-2695-73d3-da8f27e63d53	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55db-2695-f76b-c630e0f1bdd9	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55db-2695-d44e-a55c99e74486	00010000-55db-2695-6854-2e7504a2f3d0	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55db-2695-65a2-2539c8325f79	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55db-2695-4a19-22ef83b23d01	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55db-2695-bf94-5c1bd716e001	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55db-2695-1ce7-ae007998afe4	00010000-55db-2695-67fb-166572ab7e1c	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2892 (class 0 OID 15332052)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55db-2694-c992-a14d2fbadd54	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55db-2694-c4c7-0e02478b913e	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55db-2694-96a7-3acc81b2be8a	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55db-2694-0ba4-519542aff92e	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55db-2694-d0d8-c29956b7c3e1	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55db-2694-393b-9f7966db4256	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55db-2694-e257-148df2e48b26	Abonma-read	Abonma - branje	f
00030000-55db-2694-9f18-aa816aac37a2	Abonma-write	Abonma - spreminjanje	f
00030000-55db-2694-19db-2e7153b32789	Alternacija-read	Alternacija - branje	f
00030000-55db-2694-84a7-7abbbbb0e7d1	Alternacija-write	Alternacija - spreminjanje	f
00030000-55db-2694-7be8-446e3bb823db	Arhivalija-read	Arhivalija - branje	f
00030000-55db-2694-98e1-fb1f85d33d5a	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55db-2694-b3a2-f78435a71426	Besedilo-read	Besedilo - branje	f
00030000-55db-2694-2992-0ebc09aaec94	Besedilo-write	Besedilo - spreminjanje	f
00030000-55db-2694-b082-3675f527ee60	DogodekIzven-read	DogodekIzven - branje	f
00030000-55db-2694-237d-9bade5a22f03	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55db-2694-d951-a721bd1538fb	Dogodek-read	Dogodek - branje	f
00030000-55db-2694-e4ad-e61b09679b30	Dogodek-write	Dogodek - spreminjanje	f
00030000-55db-2694-014f-7185e2eb7a0e	DrugiVir-read	DrugiVir - branje	f
00030000-55db-2694-a218-a786ae924e71	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55db-2694-be0d-aac27f2ae0d4	Drzava-read	Drzava - branje	f
00030000-55db-2694-c0bf-d7e290d59eb2	Drzava-write	Drzava - spreminjanje	f
00030000-55db-2694-213e-8390c39afcf4	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55db-2694-c354-5cd680753555	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55db-2694-74c9-b0d18c86dfa1	Funkcija-read	Funkcija - branje	f
00030000-55db-2694-9482-48844dc99e05	Funkcija-write	Funkcija - spreminjanje	f
00030000-55db-2694-9048-e3c756c93783	Gostovanje-read	Gostovanje - branje	f
00030000-55db-2694-73c6-308d8888fdd2	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55db-2694-348f-aaabf5541871	Gostujoca-read	Gostujoca - branje	f
00030000-55db-2694-ce42-94a65bc085c7	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55db-2694-b105-b853920aa99c	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55db-2694-dcd0-44d48f90e4d1	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55db-2694-7463-2b22117fc2c6	Kupec-read	Kupec - branje	f
00030000-55db-2694-f521-bd6e13bdce43	Kupec-write	Kupec - spreminjanje	f
00030000-55db-2694-efe5-b5df25123820	NacinPlacina-read	NacinPlacina - branje	f
00030000-55db-2694-6833-b6b4161288f4	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55db-2694-595b-a51108ec002d	Option-read	Option - branje	f
00030000-55db-2694-cf71-4f1c15ec5a6c	Option-write	Option - spreminjanje	f
00030000-55db-2694-ad78-917693e6575b	OptionValue-read	OptionValue - branje	f
00030000-55db-2694-9e80-f392c9ccd2f1	OptionValue-write	OptionValue - spreminjanje	f
00030000-55db-2694-2e04-5af3ff227dc1	Oseba-read	Oseba - branje	f
00030000-55db-2694-41c8-0c7ad50a695e	Oseba-write	Oseba - spreminjanje	f
00030000-55db-2694-e306-6e71fea4d160	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55db-2694-e242-9e8b5ba2a26a	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55db-2694-a29d-8dc0bfdb72f3	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55db-2694-e4de-d7838f2c490d	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55db-2694-1a4a-028ec897da8c	Pogodba-read	Pogodba - branje	f
00030000-55db-2694-aafa-3d5dc2a30244	Pogodba-write	Pogodba - spreminjanje	f
00030000-55db-2694-342d-e448d61535af	Popa-read	Popa - branje	f
00030000-55db-2694-2092-1e1310de8387	Popa-write	Popa - spreminjanje	f
00030000-55db-2694-73fb-dc8ba287ec89	Posta-read	Posta - branje	f
00030000-55db-2694-03f9-389042418885	Posta-write	Posta - spreminjanje	f
00030000-55db-2694-238a-8a586c655fb7	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55db-2694-f7b3-e8cc74c03f5e	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55db-2694-ac84-1b45c3af81a9	PostniNaslov-read	PostniNaslov - branje	f
00030000-55db-2694-027f-a6271a260f3d	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55db-2694-ef6d-ad3e284de71d	Predstava-read	Predstava - branje	f
00030000-55db-2694-1046-01c340fc1be4	Predstava-write	Predstava - spreminjanje	f
00030000-55db-2694-a07c-e46de3dd99ba	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55db-2694-a8af-d2a93fc2933e	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55db-2694-4fb6-fcbc44fa4be3	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55db-2694-813a-297c772af75a	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55db-2694-3c78-208168dd530a	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55db-2694-826c-e314fc77ec79	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55db-2694-f6d2-bc3f4dda391d	ProgramDela-read	ProgramDela - branje	f
00030000-55db-2694-99a7-f8ffd58a7246	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55db-2694-af16-2afe9da1e99a	ProgramFestival-read	ProgramFestival - branje	f
00030000-55db-2694-8e5d-09171ee504c4	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55db-2694-097e-5cd8c2a8186f	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55db-2694-d802-ecda489519d5	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55db-2694-d440-16e0c405d8f7	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55db-2694-fdcc-0a6691c05004	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55db-2694-1ca3-633c02a81af7	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55db-2694-2818-79ee14d53eb1	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55db-2694-0893-abc324db0ccc	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55db-2694-4aea-cacdb313b17e	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55db-2694-2c7c-ff7ab72bcfc7	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55db-2694-9359-06c8af927185	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55db-2694-f065-bf632ec43bc6	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55db-2694-daa7-d55e93e872e5	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55db-2694-0be8-c01f5f061334	ProgramRazno-read	ProgramRazno - branje	f
00030000-55db-2694-e7a1-7f5167ac38f2	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55db-2694-7d64-fa51eabffbf3	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55db-2694-e3f8-2400c146f77f	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55db-2694-a700-c720ab59554e	Prostor-read	Prostor - branje	f
00030000-55db-2694-6b9f-632f67358b8d	Prostor-write	Prostor - spreminjanje	f
00030000-55db-2694-061b-26b55df2e9f9	Racun-read	Racun - branje	f
00030000-55db-2694-317f-1d7a6bdfad9b	Racun-write	Racun - spreminjanje	f
00030000-55db-2694-5e1b-3a4d1c396751	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55db-2694-e192-c733a76b9321	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55db-2694-1314-e894641fc595	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55db-2694-409c-0fbc581a6a13	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55db-2694-11c0-a6cefece95a7	Rekvizit-read	Rekvizit - branje	f
00030000-55db-2694-252c-ac27a7cf3ff0	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55db-2694-cfe9-0bc054612af2	Revizija-read	Revizija - branje	f
00030000-55db-2694-8433-ae4c71f5c3c5	Revizija-write	Revizija - spreminjanje	f
00030000-55db-2694-ba5c-5d22713866b1	Rezervacija-read	Rezervacija - branje	f
00030000-55db-2694-3afb-08737eaa1761	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55db-2694-ce51-b6993b55dfe4	SedezniRed-read	SedezniRed - branje	f
00030000-55db-2694-a3fa-f18867d41046	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55db-2694-52c7-2ad9a5e1d0fd	Sedez-read	Sedez - branje	f
00030000-55db-2694-8ae5-ec45a897cd9c	Sedez-write	Sedez - spreminjanje	f
00030000-55db-2694-c780-e26e5dfc3609	Sezona-read	Sezona - branje	f
00030000-55db-2694-bdd5-16517f8a3482	Sezona-write	Sezona - spreminjanje	f
00030000-55db-2694-6813-ebb1f9914624	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55db-2694-7982-40f3268ded2d	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55db-2694-b3c8-715aec488c99	Stevilcenje-read	Stevilcenje - branje	f
00030000-55db-2694-f097-567de8a67dea	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55db-2694-bb4f-0f0d6d0e2eda	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55db-2694-f8b8-08ee11a41982	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55db-2694-6a9e-cb5cd784dd89	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55db-2694-14fd-f81acdb016cb	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55db-2694-1ad2-5e174dcd4b3a	Telefonska-read	Telefonska - branje	f
00030000-55db-2694-2f55-0b8ad201005f	Telefonska-write	Telefonska - spreminjanje	f
00030000-55db-2694-ae02-b2dc9626eabd	TerminStoritve-read	TerminStoritve - branje	f
00030000-55db-2694-5caf-3f521a9d43b9	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55db-2694-84c0-8fae45fdf60a	TipFunkcije-read	TipFunkcije - branje	f
00030000-55db-2694-cbaa-8654d90a93a7	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55db-2694-1a31-f6c09908ef2f	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55db-2694-eac4-1c7d70d0a47a	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55db-2694-5b0a-1466a782ba48	Trr-read	Trr - branje	f
00030000-55db-2694-8922-2a6660b26469	Trr-write	Trr - spreminjanje	f
00030000-55db-2694-7c5e-c5fa739fbc37	Uprizoritev-read	Uprizoritev - branje	f
00030000-55db-2694-e371-f524cc41cac8	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55db-2694-14d8-9dc43bfde103	Vaja-read	Vaja - branje	f
00030000-55db-2694-52bb-4fbd0c60ade9	Vaja-write	Vaja - spreminjanje	f
00030000-55db-2694-70b2-644c2c3463bd	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55db-2694-d04d-804edb036558	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55db-2694-ebac-7ff288592063	Zaposlitev-read	Zaposlitev - branje	f
00030000-55db-2694-951d-81e66bb602c1	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55db-2694-f647-886926c7fdb9	Zasedenost-read	Zasedenost - branje	f
00030000-55db-2694-b82d-41711a3ecb07	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55db-2694-84e0-ffe863a8ebbb	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55db-2694-67b2-74498c20a8b1	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55db-2694-58cd-0033962b743d	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55db-2694-9e98-0b451ce91f30	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55db-2694-cbdc-0cba13ab8370	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55db-2694-dd46-2de4e713c398	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55db-2694-fec4-6783bd7f3989	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55db-2694-4116-b987170ce0e6	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55db-2694-bf87-41a8ce68e295	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55db-2694-8109-c9790dcbf839	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55db-2694-ce9d-040d30740d5c	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55db-2694-f9e9-9002421208af	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55db-2694-e2c8-2318ae94a6b9	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55db-2694-cbd4-28b84fa97620	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55db-2694-cff0-5570ee9ae090	Datoteka-write	Datoteka - spreminjanje	f
00030000-55db-2694-9211-6cc102b47fb9	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2894 (class 0 OID 15332071)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55db-2694-c13b-24f77b59e65f	00030000-55db-2694-c4c7-0e02478b913e
00020000-55db-2694-76e4-35cbb2c8b9b5	00030000-55db-2694-be0d-aac27f2ae0d4
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-e257-148df2e48b26
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-9f18-aa816aac37a2
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-19db-2e7153b32789
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-84a7-7abbbbb0e7d1
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-7be8-446e3bb823db
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-d951-a721bd1538fb
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-0ba4-519542aff92e
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-e4ad-e61b09679b30
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-be0d-aac27f2ae0d4
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-c0bf-d7e290d59eb2
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-74c9-b0d18c86dfa1
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-9482-48844dc99e05
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-9048-e3c756c93783
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-73c6-308d8888fdd2
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-348f-aaabf5541871
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-ce42-94a65bc085c7
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-b105-b853920aa99c
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-dcd0-44d48f90e4d1
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-595b-a51108ec002d
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-ad78-917693e6575b
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-2e04-5af3ff227dc1
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-41c8-0c7ad50a695e
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-342d-e448d61535af
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-2092-1e1310de8387
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-73fb-dc8ba287ec89
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-03f9-389042418885
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-ac84-1b45c3af81a9
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-027f-a6271a260f3d
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-ef6d-ad3e284de71d
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-1046-01c340fc1be4
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-3c78-208168dd530a
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-826c-e314fc77ec79
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-a700-c720ab59554e
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-6b9f-632f67358b8d
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-1314-e894641fc595
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-409c-0fbc581a6a13
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-11c0-a6cefece95a7
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-252c-ac27a7cf3ff0
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-c780-e26e5dfc3609
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-bdd5-16517f8a3482
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-84c0-8fae45fdf60a
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-7c5e-c5fa739fbc37
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-e371-f524cc41cac8
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-14d8-9dc43bfde103
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-52bb-4fbd0c60ade9
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-f647-886926c7fdb9
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-b82d-41711a3ecb07
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-84e0-ffe863a8ebbb
00020000-55db-2694-798b-fcd0a22ea1cf	00030000-55db-2694-58cd-0033962b743d
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-e257-148df2e48b26
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-7be8-446e3bb823db
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-d951-a721bd1538fb
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-be0d-aac27f2ae0d4
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-9048-e3c756c93783
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-348f-aaabf5541871
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-b105-b853920aa99c
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-dcd0-44d48f90e4d1
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-595b-a51108ec002d
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-ad78-917693e6575b
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-2e04-5af3ff227dc1
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-41c8-0c7ad50a695e
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-342d-e448d61535af
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-73fb-dc8ba287ec89
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-ac84-1b45c3af81a9
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-027f-a6271a260f3d
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-ef6d-ad3e284de71d
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-a700-c720ab59554e
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-1314-e894641fc595
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-11c0-a6cefece95a7
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-c780-e26e5dfc3609
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-1ad2-5e174dcd4b3a
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-2f55-0b8ad201005f
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-5b0a-1466a782ba48
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-8922-2a6660b26469
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-ebac-7ff288592063
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-951d-81e66bb602c1
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-84e0-ffe863a8ebbb
00020000-55db-2694-ac2c-25c083b73216	00030000-55db-2694-58cd-0033962b743d
00020000-55db-2694-9dac-b87c88bf657b	00030000-55db-2694-e257-148df2e48b26
00020000-55db-2694-9dac-b87c88bf657b	00030000-55db-2694-19db-2e7153b32789
00020000-55db-2694-9dac-b87c88bf657b	00030000-55db-2694-7be8-446e3bb823db
00020000-55db-2694-9dac-b87c88bf657b	00030000-55db-2694-98e1-fb1f85d33d5a
00020000-55db-2694-9dac-b87c88bf657b	00030000-55db-2694-b3a2-f78435a71426
00020000-55db-2694-9dac-b87c88bf657b	00030000-55db-2694-b082-3675f527ee60
00020000-55db-2694-9dac-b87c88bf657b	00030000-55db-2694-d951-a721bd1538fb
00020000-55db-2694-9dac-b87c88bf657b	00030000-55db-2694-be0d-aac27f2ae0d4
00020000-55db-2694-9dac-b87c88bf657b	00030000-55db-2694-74c9-b0d18c86dfa1
00020000-55db-2694-9dac-b87c88bf657b	00030000-55db-2694-9048-e3c756c93783
00020000-55db-2694-9dac-b87c88bf657b	00030000-55db-2694-348f-aaabf5541871
00020000-55db-2694-9dac-b87c88bf657b	00030000-55db-2694-b105-b853920aa99c
00020000-55db-2694-9dac-b87c88bf657b	00030000-55db-2694-595b-a51108ec002d
00020000-55db-2694-9dac-b87c88bf657b	00030000-55db-2694-ad78-917693e6575b
00020000-55db-2694-9dac-b87c88bf657b	00030000-55db-2694-2e04-5af3ff227dc1
00020000-55db-2694-9dac-b87c88bf657b	00030000-55db-2694-342d-e448d61535af
00020000-55db-2694-9dac-b87c88bf657b	00030000-55db-2694-73fb-dc8ba287ec89
00020000-55db-2694-9dac-b87c88bf657b	00030000-55db-2694-ef6d-ad3e284de71d
00020000-55db-2694-9dac-b87c88bf657b	00030000-55db-2694-3c78-208168dd530a
00020000-55db-2694-9dac-b87c88bf657b	00030000-55db-2694-a700-c720ab59554e
00020000-55db-2694-9dac-b87c88bf657b	00030000-55db-2694-1314-e894641fc595
00020000-55db-2694-9dac-b87c88bf657b	00030000-55db-2694-11c0-a6cefece95a7
00020000-55db-2694-9dac-b87c88bf657b	00030000-55db-2694-c780-e26e5dfc3609
00020000-55db-2694-9dac-b87c88bf657b	00030000-55db-2694-84c0-8fae45fdf60a
00020000-55db-2694-9dac-b87c88bf657b	00030000-55db-2694-14d8-9dc43bfde103
00020000-55db-2694-9dac-b87c88bf657b	00030000-55db-2694-f647-886926c7fdb9
00020000-55db-2694-9dac-b87c88bf657b	00030000-55db-2694-84e0-ffe863a8ebbb
00020000-55db-2694-9dac-b87c88bf657b	00030000-55db-2694-58cd-0033962b743d
00020000-55db-2694-0666-3a7d0e7e2a35	00030000-55db-2694-e257-148df2e48b26
00020000-55db-2694-0666-3a7d0e7e2a35	00030000-55db-2694-9f18-aa816aac37a2
00020000-55db-2694-0666-3a7d0e7e2a35	00030000-55db-2694-84a7-7abbbbb0e7d1
00020000-55db-2694-0666-3a7d0e7e2a35	00030000-55db-2694-7be8-446e3bb823db
00020000-55db-2694-0666-3a7d0e7e2a35	00030000-55db-2694-d951-a721bd1538fb
00020000-55db-2694-0666-3a7d0e7e2a35	00030000-55db-2694-be0d-aac27f2ae0d4
00020000-55db-2694-0666-3a7d0e7e2a35	00030000-55db-2694-9048-e3c756c93783
00020000-55db-2694-0666-3a7d0e7e2a35	00030000-55db-2694-348f-aaabf5541871
00020000-55db-2694-0666-3a7d0e7e2a35	00030000-55db-2694-595b-a51108ec002d
00020000-55db-2694-0666-3a7d0e7e2a35	00030000-55db-2694-ad78-917693e6575b
00020000-55db-2694-0666-3a7d0e7e2a35	00030000-55db-2694-342d-e448d61535af
00020000-55db-2694-0666-3a7d0e7e2a35	00030000-55db-2694-73fb-dc8ba287ec89
00020000-55db-2694-0666-3a7d0e7e2a35	00030000-55db-2694-ef6d-ad3e284de71d
00020000-55db-2694-0666-3a7d0e7e2a35	00030000-55db-2694-a700-c720ab59554e
00020000-55db-2694-0666-3a7d0e7e2a35	00030000-55db-2694-1314-e894641fc595
00020000-55db-2694-0666-3a7d0e7e2a35	00030000-55db-2694-11c0-a6cefece95a7
00020000-55db-2694-0666-3a7d0e7e2a35	00030000-55db-2694-c780-e26e5dfc3609
00020000-55db-2694-0666-3a7d0e7e2a35	00030000-55db-2694-84c0-8fae45fdf60a
00020000-55db-2694-0666-3a7d0e7e2a35	00030000-55db-2694-84e0-ffe863a8ebbb
00020000-55db-2694-0666-3a7d0e7e2a35	00030000-55db-2694-58cd-0033962b743d
00020000-55db-2694-f683-fb3975f5ae47	00030000-55db-2694-e257-148df2e48b26
00020000-55db-2694-f683-fb3975f5ae47	00030000-55db-2694-7be8-446e3bb823db
00020000-55db-2694-f683-fb3975f5ae47	00030000-55db-2694-d951-a721bd1538fb
00020000-55db-2694-f683-fb3975f5ae47	00030000-55db-2694-be0d-aac27f2ae0d4
00020000-55db-2694-f683-fb3975f5ae47	00030000-55db-2694-9048-e3c756c93783
00020000-55db-2694-f683-fb3975f5ae47	00030000-55db-2694-348f-aaabf5541871
00020000-55db-2694-f683-fb3975f5ae47	00030000-55db-2694-595b-a51108ec002d
00020000-55db-2694-f683-fb3975f5ae47	00030000-55db-2694-ad78-917693e6575b
00020000-55db-2694-f683-fb3975f5ae47	00030000-55db-2694-342d-e448d61535af
00020000-55db-2694-f683-fb3975f5ae47	00030000-55db-2694-73fb-dc8ba287ec89
00020000-55db-2694-f683-fb3975f5ae47	00030000-55db-2694-ef6d-ad3e284de71d
00020000-55db-2694-f683-fb3975f5ae47	00030000-55db-2694-a700-c720ab59554e
00020000-55db-2694-f683-fb3975f5ae47	00030000-55db-2694-1314-e894641fc595
00020000-55db-2694-f683-fb3975f5ae47	00030000-55db-2694-11c0-a6cefece95a7
00020000-55db-2694-f683-fb3975f5ae47	00030000-55db-2694-c780-e26e5dfc3609
00020000-55db-2694-f683-fb3975f5ae47	00030000-55db-2694-ae02-b2dc9626eabd
00020000-55db-2694-f683-fb3975f5ae47	00030000-55db-2694-96a7-3acc81b2be8a
00020000-55db-2694-f683-fb3975f5ae47	00030000-55db-2694-84c0-8fae45fdf60a
00020000-55db-2694-f683-fb3975f5ae47	00030000-55db-2694-84e0-ffe863a8ebbb
00020000-55db-2694-f683-fb3975f5ae47	00030000-55db-2694-58cd-0033962b743d
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-c992-a14d2fbadd54
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-c4c7-0e02478b913e
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-96a7-3acc81b2be8a
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-0ba4-519542aff92e
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-d0d8-c29956b7c3e1
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-393b-9f7966db4256
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-e257-148df2e48b26
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-9f18-aa816aac37a2
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-19db-2e7153b32789
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-84a7-7abbbbb0e7d1
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-7be8-446e3bb823db
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-98e1-fb1f85d33d5a
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-b3a2-f78435a71426
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-2992-0ebc09aaec94
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-b082-3675f527ee60
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-237d-9bade5a22f03
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-d951-a721bd1538fb
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-e4ad-e61b09679b30
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-be0d-aac27f2ae0d4
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-c0bf-d7e290d59eb2
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-014f-7185e2eb7a0e
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-a218-a786ae924e71
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-213e-8390c39afcf4
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-c354-5cd680753555
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-74c9-b0d18c86dfa1
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-9482-48844dc99e05
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-9048-e3c756c93783
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-73c6-308d8888fdd2
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-348f-aaabf5541871
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-ce42-94a65bc085c7
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-b105-b853920aa99c
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-dcd0-44d48f90e4d1
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-7463-2b22117fc2c6
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-f521-bd6e13bdce43
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-efe5-b5df25123820
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-6833-b6b4161288f4
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-595b-a51108ec002d
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-cf71-4f1c15ec5a6c
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-ad78-917693e6575b
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-9e80-f392c9ccd2f1
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-2e04-5af3ff227dc1
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-41c8-0c7ad50a695e
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-e306-6e71fea4d160
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-e242-9e8b5ba2a26a
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-a29d-8dc0bfdb72f3
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-e4de-d7838f2c490d
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-1a4a-028ec897da8c
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-aafa-3d5dc2a30244
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-342d-e448d61535af
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-2092-1e1310de8387
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-73fb-dc8ba287ec89
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-03f9-389042418885
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-238a-8a586c655fb7
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-f7b3-e8cc74c03f5e
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-ac84-1b45c3af81a9
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-027f-a6271a260f3d
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-ef6d-ad3e284de71d
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-1046-01c340fc1be4
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-a07c-e46de3dd99ba
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-a8af-d2a93fc2933e
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-4fb6-fcbc44fa4be3
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-813a-297c772af75a
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-3c78-208168dd530a
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-826c-e314fc77ec79
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-f6d2-bc3f4dda391d
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-99a7-f8ffd58a7246
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-af16-2afe9da1e99a
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-8e5d-09171ee504c4
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-097e-5cd8c2a8186f
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-d802-ecda489519d5
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-d440-16e0c405d8f7
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-fdcc-0a6691c05004
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-1ca3-633c02a81af7
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-2818-79ee14d53eb1
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-0893-abc324db0ccc
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-4aea-cacdb313b17e
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-2c7c-ff7ab72bcfc7
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-9359-06c8af927185
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-f065-bf632ec43bc6
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-daa7-d55e93e872e5
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-0be8-c01f5f061334
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-e7a1-7f5167ac38f2
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-7d64-fa51eabffbf3
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-e3f8-2400c146f77f
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-a700-c720ab59554e
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-6b9f-632f67358b8d
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-061b-26b55df2e9f9
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-317f-1d7a6bdfad9b
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-5e1b-3a4d1c396751
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-e192-c733a76b9321
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-1314-e894641fc595
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-409c-0fbc581a6a13
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-11c0-a6cefece95a7
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-252c-ac27a7cf3ff0
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-cfe9-0bc054612af2
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-8433-ae4c71f5c3c5
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-ba5c-5d22713866b1
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-3afb-08737eaa1761
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-ce51-b6993b55dfe4
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-a3fa-f18867d41046
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-52c7-2ad9a5e1d0fd
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-8ae5-ec45a897cd9c
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-c780-e26e5dfc3609
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-bdd5-16517f8a3482
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-6813-ebb1f9914624
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-7982-40f3268ded2d
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-b3c8-715aec488c99
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-f097-567de8a67dea
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-bb4f-0f0d6d0e2eda
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-f8b8-08ee11a41982
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-6a9e-cb5cd784dd89
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-14fd-f81acdb016cb
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-1ad2-5e174dcd4b3a
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-2f55-0b8ad201005f
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-ae02-b2dc9626eabd
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-5caf-3f521a9d43b9
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-84c0-8fae45fdf60a
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-cbaa-8654d90a93a7
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-1a31-f6c09908ef2f
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-eac4-1c7d70d0a47a
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-5b0a-1466a782ba48
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-8922-2a6660b26469
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-7c5e-c5fa739fbc37
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-e371-f524cc41cac8
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-14d8-9dc43bfde103
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-52bb-4fbd0c60ade9
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-70b2-644c2c3463bd
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-d04d-804edb036558
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-ebac-7ff288592063
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-951d-81e66bb602c1
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-f647-886926c7fdb9
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-b82d-41711a3ecb07
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-84e0-ffe863a8ebbb
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-67b2-74498c20a8b1
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-58cd-0033962b743d
00020000-55db-2695-fd36-ef1a8dd48dc1	00030000-55db-2694-9e98-0b451ce91f30
\.


--
-- TOC entry 2922 (class 0 OID 15332370)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2926 (class 0 OID 15332401)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 15332515)
-- Dependencies: 218
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55db-2696-18df-15993c75f955	00090000-55db-2695-cf9b-bfcbba161b6c	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55db-2696-f58d-95b18bd2f124	00090000-55db-2695-02b2-4c49e618b4d9	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55db-2696-027c-11c062a171d1	00090000-55db-2695-1ce7-ae007998afe4	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2899 (class 0 OID 15332131)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55db-2695-15f2-4da8c59fd847	00040000-55db-2694-d7bd-5d7495927861	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55db-2695-6bb7-113b3bb1e663	00040000-55db-2694-d7bd-5d7495927861	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55db-2695-8f90-4717ab68e349	00040000-55db-2694-d7bd-5d7495927861	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55db-2695-746b-c038ca0962ac	00040000-55db-2694-d7bd-5d7495927861	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55db-2695-50f6-a6754124e0e5	00040000-55db-2694-d7bd-5d7495927861	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55db-2695-e355-45df4d78eadf	00040000-55db-2694-aa3a-72f960111a7e	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55db-2695-82bf-f0013bdd728b	00040000-55db-2694-0eb3-a20623044755	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55db-2695-ab4b-9fb087a0607e	00040000-55db-2694-83aa-e2e8be676e44	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55db-2696-b5ac-29e13e02062b	00040000-55db-2694-d7bd-5d7495927861	1001	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2901 (class 0 OID 15332166)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55db-2693-6964-e73fb18c4cd5	8341	Adlešiči
00050000-55db-2693-b284-0d6d67700b69	5270	Ajdovščina
00050000-55db-2693-686a-1fc0c322e60e	6280	Ankaran/Ancarano
00050000-55db-2693-1aa3-1e1fa1cfb2ca	9253	Apače
00050000-55db-2693-1079-d2258d2f4b74	8253	Artiče
00050000-55db-2693-aa88-ebaaea989340	4275	Begunje na Gorenjskem
00050000-55db-2693-2d13-26dc84e4a1ba	1382	Begunje pri Cerknici
00050000-55db-2693-9639-d3fe374cc7b8	9231	Beltinci
00050000-55db-2693-fdf1-6417fbd0bfd7	2234	Benedikt
00050000-55db-2693-4ce5-5ef5cfd88764	2345	Bistrica ob Dravi
00050000-55db-2693-7386-0fd1b8fa3c40	3256	Bistrica ob Sotli
00050000-55db-2693-71bc-32b9a2418db0	8259	Bizeljsko
00050000-55db-2693-049d-d489b93dc83f	1223	Blagovica
00050000-55db-2693-1459-40fe376c3a6d	8283	Blanca
00050000-55db-2693-936e-3e3a2473f0d1	4260	Bled
00050000-55db-2693-186d-59fa410171bd	4273	Blejska Dobrava
00050000-55db-2693-edd8-f32533695b88	9265	Bodonci
00050000-55db-2693-75eb-b1988b6954e6	9222	Bogojina
00050000-55db-2693-7346-f78d2aba6bc1	4263	Bohinjska Bela
00050000-55db-2693-cf33-1764e4037643	4264	Bohinjska Bistrica
00050000-55db-2693-9ced-af69439caafd	4265	Bohinjsko jezero
00050000-55db-2693-f9da-8d1046bae88f	1353	Borovnica
00050000-55db-2693-3f12-7a4e1097fe49	8294	Boštanj
00050000-55db-2693-4658-0279273e5ed7	5230	Bovec
00050000-55db-2693-f09c-79d648f900d6	5295	Branik
00050000-55db-2693-fc56-c2785b1ff6a4	3314	Braslovče
00050000-55db-2693-1c68-008f37f7dae8	5223	Breginj
00050000-55db-2693-7aed-f47dd7ad5f54	8280	Brestanica
00050000-55db-2693-0536-bec89de3a7ca	2354	Bresternica
00050000-55db-2693-cfb7-cb4923f5ca6b	4243	Brezje
00050000-55db-2693-358d-b42f3b36ad67	1351	Brezovica pri Ljubljani
00050000-55db-2693-791b-581e7b269755	8250	Brežice
00050000-55db-2693-4f04-c5497793eb2b	4210	Brnik - Aerodrom
00050000-55db-2693-2cd7-4f17ca527bd4	8321	Brusnice
00050000-55db-2693-3083-d2ef4d107153	3255	Buče
00050000-55db-2693-d46c-2df905b8088d	8276	Bučka 
00050000-55db-2693-de2d-8fe044add8c0	9261	Cankova
00050000-55db-2693-35ff-a6d113a40e1d	3000	Celje 
00050000-55db-2693-0da6-ac522de3a9a4	3001	Celje - poštni predali
00050000-55db-2693-2c6f-c34402873f3d	4207	Cerklje na Gorenjskem
00050000-55db-2693-34c2-5fda4579ef39	8263	Cerklje ob Krki
00050000-55db-2693-74f5-52ddfd22bbb8	1380	Cerknica
00050000-55db-2693-e618-54e91ca50c11	5282	Cerkno
00050000-55db-2693-37db-f897927f3863	2236	Cerkvenjak
00050000-55db-2693-05c9-aa2f2f114829	2215	Ceršak
00050000-55db-2693-0d62-2b48cfa5be8c	2326	Cirkovce
00050000-55db-2693-1003-c50e2c216d8c	2282	Cirkulane
00050000-55db-2693-1c82-d48dfa2c8963	5273	Col
00050000-55db-2693-b258-54d2017a120e	8251	Čatež ob Savi
00050000-55db-2693-b2ef-0f6f85ec8199	1413	Čemšenik
00050000-55db-2693-1ebe-75ce78d9c5d2	5253	Čepovan
00050000-55db-2693-5b33-ca6be7d1e519	9232	Črenšovci
00050000-55db-2693-2db8-e033f8265e60	2393	Črna na Koroškem
00050000-55db-2693-3d6c-794fd938ca81	6275	Črni Kal
00050000-55db-2693-64ac-77ed6392ff67	5274	Črni Vrh nad Idrijo
00050000-55db-2693-a6ef-8f7ae3ce1977	5262	Črniče
00050000-55db-2693-7398-163bd26ee09c	8340	Črnomelj
00050000-55db-2693-6e61-82415347d05a	6271	Dekani
00050000-55db-2693-3b4f-9d13e3024aa1	5210	Deskle
00050000-55db-2693-ad18-0f8a05b246f3	2253	Destrnik
00050000-55db-2693-760d-957a6704607e	6215	Divača
00050000-55db-2693-2c59-e5d621207944	1233	Dob
00050000-55db-2693-1d0b-88197f454701	3224	Dobje pri Planini
00050000-55db-2693-7461-febddf6cb760	8257	Dobova
00050000-55db-2693-5e7b-2afe5a7f79a3	1423	Dobovec
00050000-55db-2693-4953-f170113c0134	5263	Dobravlje
00050000-55db-2693-ff3a-8cd3235e7e9d	3204	Dobrna
00050000-55db-2693-294d-f600fea5d826	8211	Dobrnič
00050000-55db-2693-0724-d0aa565db0e5	1356	Dobrova
00050000-55db-2693-0fd5-4eada117a61a	9223	Dobrovnik/Dobronak 
00050000-55db-2693-1d39-d6de4c720b45	5212	Dobrovo v Brdih
00050000-55db-2693-7054-eb5072582d16	1431	Dol pri Hrastniku
00050000-55db-2693-63ce-1343e48ccac2	1262	Dol pri Ljubljani
00050000-55db-2693-91dd-e8ed11b61eff	1273	Dole pri Litiji
00050000-55db-2693-03ce-caa841a31580	1331	Dolenja vas
00050000-55db-2693-d970-fd2ac35fc354	8350	Dolenjske Toplice
00050000-55db-2693-8312-45c7df13cfeb	1230	Domžale
00050000-55db-2693-a7db-d14ab4ff24a7	2252	Dornava
00050000-55db-2693-0519-38a42e767444	5294	Dornberk
00050000-55db-2693-a6a4-62177bcf496d	1319	Draga
00050000-55db-2693-cdc2-c66e0937c693	8343	Dragatuš
00050000-55db-2693-87ee-80affb240d0b	3222	Dramlje
00050000-55db-2693-8da8-c7a7a0e4cd9a	2370	Dravograd
00050000-55db-2694-005a-9fcab4ec25c0	4203	Duplje
00050000-55db-2694-0963-7e69e2f32efc	6221	Dutovlje
00050000-55db-2694-cb21-cf6f151eb88d	8361	Dvor
00050000-55db-2694-3246-f76b6d170bec	2343	Fala
00050000-55db-2694-e009-98e61fcf59d2	9208	Fokovci
00050000-55db-2694-b386-c3b55543d66e	2313	Fram
00050000-55db-2694-189c-dbf0d604dfbc	3213	Frankolovo
00050000-55db-2694-c797-4078d21dcd5d	1274	Gabrovka
00050000-55db-2694-51c5-9e60d85da903	8254	Globoko
00050000-55db-2694-aabd-72d0b6cf619f	5275	Godovič
00050000-55db-2694-c5e4-5659be35902e	4204	Golnik
00050000-55db-2694-7687-041b11f30fc6	3303	Gomilsko
00050000-55db-2694-0eef-eb892fd3ee63	4224	Gorenja vas
00050000-55db-2694-a3a7-8b966ddccddd	3263	Gorica pri Slivnici
00050000-55db-2694-f1dd-3b8e74c1191e	2272	Gorišnica
00050000-55db-2694-50de-399f5bdc5eab	9250	Gornja Radgona
00050000-55db-2694-b5ad-1703e7291117	3342	Gornji Grad
00050000-55db-2694-3824-bec115e2cac5	4282	Gozd Martuljek
00050000-55db-2694-a4b4-384c89e1c7de	6272	Gračišče
00050000-55db-2694-ef09-946207101d7a	9264	Grad
00050000-55db-2694-fcdc-34d373547bc4	8332	Gradac
00050000-55db-2694-bd03-dc222e426f97	1384	Grahovo
00050000-55db-2694-cb8a-06334fdaa633	5242	Grahovo ob Bači
00050000-55db-2694-334c-b8c948ee0e98	5251	Grgar
00050000-55db-2694-d1af-f72ddcd4405a	3302	Griže
00050000-55db-2694-1495-7be255f447e9	3231	Grobelno
00050000-55db-2694-487d-094fc668e477	1290	Grosuplje
00050000-55db-2694-8a84-5bf569cf1152	2288	Hajdina
00050000-55db-2694-2481-c09a427a6116	8362	Hinje
00050000-55db-2694-b608-126f6ded75a8	2311	Hoče
00050000-55db-2694-d68a-52e99bb49c82	9205	Hodoš/Hodos
00050000-55db-2694-77a9-5c3939854566	1354	Horjul
00050000-55db-2694-7f0a-182026ece045	1372	Hotedršica
00050000-55db-2694-530a-7759e25d248f	1430	Hrastnik
00050000-55db-2694-c439-a38fe5c723cb	6225	Hruševje
00050000-55db-2694-87c6-8d1a9d9d6521	4276	Hrušica
00050000-55db-2694-bdea-09a373512a2e	5280	Idrija
00050000-55db-2694-8873-591aa5335712	1292	Ig
00050000-55db-2694-838b-d72f1ef64efd	6250	Ilirska Bistrica
00050000-55db-2694-6a6f-0171686b7729	6251	Ilirska Bistrica-Trnovo
00050000-55db-2694-ede9-6c034d55d7e2	1295	Ivančna Gorica
00050000-55db-2694-40d1-efed9c828618	2259	Ivanjkovci
00050000-55db-2694-f0a0-d261a444e127	1411	Izlake
00050000-55db-2694-1fa1-e16a76e056dd	6310	Izola/Isola
00050000-55db-2694-59a1-28688457db47	2222	Jakobski Dol
00050000-55db-2694-c8cc-370cb6ba639c	2221	Jarenina
00050000-55db-2694-929a-d697d4959664	6254	Jelšane
00050000-55db-2694-8aea-b0da95e51c86	4270	Jesenice
00050000-55db-2694-a2f3-5c486814957c	8261	Jesenice na Dolenjskem
00050000-55db-2694-4390-7ecf04fd7a2e	3273	Jurklošter
00050000-55db-2694-f7d7-be7b5fa8a763	2223	Jurovski Dol
00050000-55db-2694-8a9d-2de555ac8eeb	2256	Juršinci
00050000-55db-2694-9062-938217f36185	5214	Kal nad Kanalom
00050000-55db-2694-8bd6-76a68845fb98	3233	Kalobje
00050000-55db-2694-cd68-a76d1edfb5c1	4246	Kamna Gorica
00050000-55db-2694-7b25-8afc9466f1c2	2351	Kamnica
00050000-55db-2694-fc50-845c86d22380	1241	Kamnik
00050000-55db-2694-bd22-da01a49954a6	5213	Kanal
00050000-55db-2694-6783-1191dc8bedc9	8258	Kapele
00050000-55db-2694-f26b-707e25510e9a	2362	Kapla
00050000-55db-2694-875b-21dd0f51ba36	2325	Kidričevo
00050000-55db-2694-6325-ce836dcb518d	1412	Kisovec
00050000-55db-2694-5525-61fca8492125	6253	Knežak
00050000-55db-2694-00d1-ee410245fcba	5222	Kobarid
00050000-55db-2694-762d-cc7b6d98cbd6	9227	Kobilje
00050000-55db-2694-7815-30b4ad2279c2	1330	Kočevje
00050000-55db-2694-ba03-155230805c8d	1338	Kočevska Reka
00050000-55db-2694-ce49-fc384c22b433	2276	Kog
00050000-55db-2694-9796-6145d3a83b02	5211	Kojsko
00050000-55db-2694-b034-82e6f4fd4545	6223	Komen
00050000-55db-2694-b3aa-83f505338268	1218	Komenda
00050000-55db-2694-7b53-79891734f709	6000	Koper/Capodistria 
00050000-55db-2694-4863-918d153663fc	6001	Koper/Capodistria - poštni predali
00050000-55db-2694-9ff3-d03fb6bd1510	8282	Koprivnica
00050000-55db-2694-4cbd-27cd8119bdae	5296	Kostanjevica na Krasu
00050000-55db-2694-0779-f8407f03553f	8311	Kostanjevica na Krki
00050000-55db-2694-84c4-a6c231dbbd10	1336	Kostel
00050000-55db-2694-1c81-b6a52602d52c	6256	Košana
00050000-55db-2694-2c42-006ac7ef7623	2394	Kotlje
00050000-55db-2694-968a-445b45779524	6240	Kozina
00050000-55db-2694-ca5f-eb5c0dce1011	3260	Kozje
00050000-55db-2694-379c-6022eb70a1b8	4000	Kranj 
00050000-55db-2694-dff2-f62568179369	4001	Kranj - poštni predali
00050000-55db-2694-888e-954238572da3	4280	Kranjska Gora
00050000-55db-2694-895c-76b36c88cb9d	1281	Kresnice
00050000-55db-2694-87f8-63f06fef9440	4294	Križe
00050000-55db-2694-37d2-b5c269092bb9	9206	Križevci
00050000-55db-2694-912b-280b32b105dc	9242	Križevci pri Ljutomeru
00050000-55db-2694-1ce3-081c7f0ce178	1301	Krka
00050000-55db-2694-749b-755ce47064cd	8296	Krmelj
00050000-55db-2694-fbc4-6d3df185c8b6	4245	Kropa
00050000-55db-2694-9168-91252f60ebe2	8262	Krška vas
00050000-55db-2694-5c46-c045d57412a1	8270	Krško
00050000-55db-2694-e80e-136bcff3130c	9263	Kuzma
00050000-55db-2694-9411-1e091f140bcf	2318	Laporje
00050000-55db-2694-7788-a4fa2b1479fa	3270	Laško
00050000-55db-2694-b1e3-25090ae5be26	1219	Laze v Tuhinju
00050000-55db-2694-b2b5-24ba140d5451	2230	Lenart v Slovenskih goricah
00050000-55db-2694-a51b-bc790d75983e	9220	Lendava/Lendva
00050000-55db-2694-5cd4-7e99a0f1d4ab	4248	Lesce
00050000-55db-2694-5508-4631e347e13b	3261	Lesično
00050000-55db-2694-1224-66a87dff8b2a	8273	Leskovec pri Krškem
00050000-55db-2694-397e-9c13bf651099	2372	Libeliče
00050000-55db-2694-5f3b-3bac56b7c794	2341	Limbuš
00050000-55db-2694-9256-645a5dc62622	1270	Litija
00050000-55db-2694-2f3b-dec8e58c4a02	3202	Ljubečna
00050000-55db-2694-a3dd-3cde3614f8f3	1000	Ljubljana 
00050000-55db-2694-0b81-f84c83fe5029	1001	Ljubljana - poštni predali
00050000-55db-2694-89d2-eb965d8e515e	1231	Ljubljana - Črnuče
00050000-55db-2694-f6ae-5e28431d9081	1261	Ljubljana - Dobrunje
00050000-55db-2694-e419-d5934e5a377a	1260	Ljubljana - Polje
00050000-55db-2694-6436-24c2c1831c06	1210	Ljubljana - Šentvid
00050000-55db-2694-6a64-1fb65e28bf0e	1211	Ljubljana - Šmartno
00050000-55db-2694-4746-96b5090ea2e6	3333	Ljubno ob Savinji
00050000-55db-2694-36b9-7f5dfb09ad2a	9240	Ljutomer
00050000-55db-2694-60fc-75702f354253	3215	Loče
00050000-55db-2694-39f1-508909abf93a	5231	Log pod Mangartom
00050000-55db-2694-b992-a7b71d9ea018	1358	Log pri Brezovici
00050000-55db-2694-c9a0-1b3100e70026	1370	Logatec
00050000-55db-2694-d462-41e7aeabcd08	1371	Logatec
00050000-55db-2694-95fe-b556e1c9d7f4	1434	Loka pri Zidanem Mostu
00050000-55db-2694-0678-fc17373e0217	3223	Loka pri Žusmu
00050000-55db-2694-95f6-12e763a9b5ba	6219	Lokev
00050000-55db-2694-c1fc-11c8cefdfd54	1318	Loški Potok
00050000-55db-2694-a622-09a63a726482	2324	Lovrenc na Dravskem polju
00050000-55db-2694-290c-f5d2e5c0ace6	2344	Lovrenc na Pohorju
00050000-55db-2694-e748-5def3aef6eb4	3334	Luče
00050000-55db-2694-ffd3-6fe3f361ac82	1225	Lukovica
00050000-55db-2694-c637-039fd3f15660	9202	Mačkovci
00050000-55db-2694-6441-8c06735bef08	2322	Majšperk
00050000-55db-2694-e47b-f52b4f9d7712	2321	Makole
00050000-55db-2694-92b2-f50ca09f4d34	9243	Mala Nedelja
00050000-55db-2694-f784-a56ffa0c7661	2229	Malečnik
00050000-55db-2694-cf5d-b5c39a887400	6273	Marezige
00050000-55db-2694-bc66-f7076c8766db	2000	Maribor 
00050000-55db-2694-3dd2-a0dce0034b93	2001	Maribor - poštni predali
00050000-55db-2694-12d5-7bdfe14cd7e6	2206	Marjeta na Dravskem polju
00050000-55db-2694-677e-6d6d454a43f3	2281	Markovci
00050000-55db-2694-c07e-3f565b92ac14	9221	Martjanci
00050000-55db-2694-0c2a-7ccd3bf10e88	6242	Materija
00050000-55db-2694-ba76-ab0f5716aded	4211	Mavčiče
00050000-55db-2694-e7c4-613a34550564	1215	Medvode
00050000-55db-2694-4057-46dff50ed78b	1234	Mengeš
00050000-55db-2694-c794-308e404793f8	8330	Metlika
00050000-55db-2694-bb99-fda6a5c9e278	2392	Mežica
00050000-55db-2694-b95a-8bae0c6f1de4	2204	Miklavž na Dravskem polju
00050000-55db-2694-2027-4869c5ea75ca	2275	Miklavž pri Ormožu
00050000-55db-2694-f058-6adf1dbfb227	5291	Miren
00050000-55db-2694-45b8-8dd580dc7732	8233	Mirna
00050000-55db-2694-5672-2938d2f65049	8216	Mirna Peč
00050000-55db-2694-4ed0-d09284822e1b	2382	Mislinja
00050000-55db-2694-cae5-6dd16a4e3e0f	4281	Mojstrana
00050000-55db-2694-3de0-2f258e88bd38	8230	Mokronog
00050000-55db-2694-0787-e628343b8dc0	1251	Moravče
00050000-55db-2694-332c-3156cf8ee2fa	9226	Moravske Toplice
00050000-55db-2694-717f-a7c6a5f5df75	5216	Most na Soči
00050000-55db-2694-82f6-32b191ea6ae8	1221	Motnik
00050000-55db-2694-bf95-a802cf3f4879	3330	Mozirje
00050000-55db-2694-f059-6ed04d08c782	9000	Murska Sobota 
00050000-55db-2694-1594-fcf91eb5edbf	9001	Murska Sobota - poštni predali
00050000-55db-2694-a92a-70234b2fcea0	2366	Muta
00050000-55db-2694-03fe-021cf34683e3	4202	Naklo
00050000-55db-2694-25a3-33d9b2565397	3331	Nazarje
00050000-55db-2694-3c68-ffd9ffb9a98c	1357	Notranje Gorice
00050000-55db-2694-f0f1-81ce3df2ba74	3203	Nova Cerkev
00050000-55db-2694-6539-a21ad023c123	5000	Nova Gorica 
00050000-55db-2694-057b-7a891949a401	5001	Nova Gorica - poštni predali
00050000-55db-2694-be34-9d0c8429be9c	1385	Nova vas
00050000-55db-2694-9a4e-7004b5c45046	8000	Novo mesto
00050000-55db-2694-b43d-c32ad2fa7cfc	8001	Novo mesto - poštni predali
00050000-55db-2694-145b-4442cf9993db	6243	Obrov
00050000-55db-2694-370e-cfd3417ea75a	9233	Odranci
00050000-55db-2694-a5ab-40958d24d683	2317	Oplotnica
00050000-55db-2694-1fee-1601ef94edbd	2312	Orehova vas
00050000-55db-2694-8d77-0282f3d29914	2270	Ormož
00050000-55db-2694-dd54-6b6401d27145	1316	Ortnek
00050000-55db-2694-2a63-f57f1c5ce4cf	1337	Osilnica
00050000-55db-2694-9849-b4551440c620	8222	Otočec
00050000-55db-2694-b576-3bcfe9edba25	2361	Ožbalt
00050000-55db-2694-fe78-b7163142ef3f	2231	Pernica
00050000-55db-2694-8c86-00724310ed99	2211	Pesnica pri Mariboru
00050000-55db-2694-443f-33960c140963	9203	Petrovci
00050000-55db-2694-d70d-678d21b1e062	3301	Petrovče
00050000-55db-2694-7085-b723163198c0	6330	Piran/Pirano
00050000-55db-2694-7f46-e59cdbb7a952	8255	Pišece
00050000-55db-2694-27f5-6c737019b377	6257	Pivka
00050000-55db-2694-4912-df2510efdfee	6232	Planina
00050000-55db-2694-f727-5e9e019894fb	3225	Planina pri Sevnici
00050000-55db-2694-a29d-140f8d31701f	6276	Pobegi
00050000-55db-2694-9dc4-2db1f2573635	8312	Podbočje
00050000-55db-2694-afbd-2b3f4424e0ea	5243	Podbrdo
00050000-55db-2694-783f-b1a4ee1b957f	3254	Podčetrtek
00050000-55db-2694-26f3-64088378792e	2273	Podgorci
00050000-55db-2694-0b1f-489f5cd6e1bf	6216	Podgorje
00050000-55db-2694-8e68-9fda443c86ef	2381	Podgorje pri Slovenj Gradcu
00050000-55db-2694-e6b8-1e1be8b212ea	6244	Podgrad
00050000-55db-2694-3d67-cbea46d2e4a1	1414	Podkum
00050000-55db-2694-c2bc-a43389af1a93	2286	Podlehnik
00050000-55db-2694-6141-202b99fd54c7	5272	Podnanos
00050000-55db-2694-f3f0-7d2de225ac0c	4244	Podnart
00050000-55db-2694-311a-df8ac4362ca7	3241	Podplat
00050000-55db-2694-dcde-32c7ba295631	3257	Podsreda
00050000-55db-2694-2d2e-5ebd67639df2	2363	Podvelka
00050000-55db-2694-9644-5e57eebd92a5	2208	Pohorje
00050000-55db-2694-9464-e327c8f5c284	2257	Polenšak
00050000-55db-2694-69be-e9d6a96a44dd	1355	Polhov Gradec
00050000-55db-2694-e885-a85a6b9f36e5	4223	Poljane nad Škofjo Loko
00050000-55db-2694-9f04-95feab47cd04	2319	Poljčane
00050000-55db-2694-1d21-dc6cf3264047	1272	Polšnik
00050000-55db-2694-294c-a700c848fe1c	3313	Polzela
00050000-55db-2694-f1af-ebc8419bbfe5	3232	Ponikva
00050000-55db-2694-c832-d7a18a175031	6320	Portorož/Portorose
00050000-55db-2694-e963-ffa224a6e681	6230	Postojna
00050000-55db-2694-0d34-497e9e94c0d2	2331	Pragersko
00050000-55db-2694-d5a9-e677c1eb6e71	3312	Prebold
00050000-55db-2694-cde5-86b33c72180f	4205	Preddvor
00050000-55db-2694-619f-15831bfe8643	6255	Prem
00050000-55db-2694-999a-5548eeea706a	1352	Preserje
00050000-55db-2694-9a03-c83bfbb0bce2	6258	Prestranek
00050000-55db-2694-da8e-b7994d4c9095	2391	Prevalje
00050000-55db-2694-3364-c31be2fe1ccd	3262	Prevorje
00050000-55db-2694-a1d1-a0d43dc912e1	1276	Primskovo 
00050000-55db-2694-08bb-72ab8b0f5ccd	3253	Pristava pri Mestinju
00050000-55db-2694-878b-326c4e22560f	9207	Prosenjakovci/Partosfalva
00050000-55db-2694-e5b2-094fba4d239b	5297	Prvačina
00050000-55db-2694-9a9c-e8d91da042e3	2250	Ptuj
00050000-55db-2694-549f-8cd73a3956dc	2323	Ptujska Gora
00050000-55db-2694-e6e6-a5b8d9544c82	9201	Puconci
00050000-55db-2694-f9ab-18171ad345a5	2327	Rače
00050000-55db-2694-b5fc-f9cc64797fd4	1433	Radeče
00050000-55db-2694-edb8-c14bf82947b9	9252	Radenci
00050000-55db-2694-310b-a1472c89340d	2360	Radlje ob Dravi
00050000-55db-2694-3983-257fa44da956	1235	Radomlje
00050000-55db-2694-b292-347815a8b22f	4240	Radovljica
00050000-55db-2694-827d-9d07bff67a6d	8274	Raka
00050000-55db-2694-6c4d-68d417fb3819	1381	Rakek
00050000-55db-2694-2fc5-6864ef18080d	4283	Rateče - Planica
00050000-55db-2694-6b08-40348e7a2ca9	2390	Ravne na Koroškem
00050000-55db-2694-8041-a2694a595ac7	9246	Razkrižje
00050000-55db-2694-dcea-097b73f5c6ad	3332	Rečica ob Savinji
00050000-55db-2694-bdd2-b56882e577d2	5292	Renče
00050000-55db-2694-ee28-9b4b12b06966	1310	Ribnica
00050000-55db-2694-c4ec-f900c565c28d	2364	Ribnica na Pohorju
00050000-55db-2694-e781-b1ca5ca2ccf2	3272	Rimske Toplice
00050000-55db-2694-c324-64cd6e7b61bd	1314	Rob
00050000-55db-2694-b971-79b36e84a757	5215	Ročinj
00050000-55db-2694-0774-af73cae1ac4a	3250	Rogaška Slatina
00050000-55db-2694-2701-26b1669ac7cc	9262	Rogašovci
00050000-55db-2694-5b9b-c83e4124ef56	3252	Rogatec
00050000-55db-2694-0160-d376444916c9	1373	Rovte
00050000-55db-2694-f9fa-bd4b3321652f	2342	Ruše
00050000-55db-2694-28fa-038f6f87d8d6	1282	Sava
00050000-55db-2694-5b47-88929cff0506	6333	Sečovlje/Sicciole
00050000-55db-2694-c122-95f3d5d30da1	4227	Selca
00050000-55db-2694-46ba-ffbea6e8a3f3	2352	Selnica ob Dravi
00050000-55db-2694-5e59-ff75ddf6ec71	8333	Semič
00050000-55db-2694-1501-c6c91eec7b83	8281	Senovo
00050000-55db-2694-5c7d-9d33097b60fb	6224	Senožeče
00050000-55db-2694-c17d-ad25f1dbce19	8290	Sevnica
00050000-55db-2694-58d1-5a5b607a82fc	6210	Sežana
00050000-55db-2694-3ae3-60a6eb67e068	2214	Sladki Vrh
00050000-55db-2694-0570-d5577e344a14	5283	Slap ob Idrijci
00050000-55db-2694-e808-97ea756bd83c	2380	Slovenj Gradec
00050000-55db-2694-90b0-877cc9724521	2310	Slovenska Bistrica
00050000-55db-2694-a0c4-564387f83189	3210	Slovenske Konjice
00050000-55db-2694-94bb-2ea7f87271e1	1216	Smlednik
00050000-55db-2694-a57f-1d3b1ad0fdef	5232	Soča
00050000-55db-2694-e488-ab198d68879c	1317	Sodražica
00050000-55db-2694-ff0c-f2a2654b538a	3335	Solčava
00050000-55db-2694-80f9-26904add333e	5250	Solkan
00050000-55db-2694-6b0a-8c79ab62c352	4229	Sorica
00050000-55db-2694-d6c2-f2c38e322ba1	4225	Sovodenj
00050000-55db-2694-5a80-8d68eb2e4219	5281	Spodnja Idrija
00050000-55db-2694-ca6e-5e11c53c41b7	2241	Spodnji Duplek
00050000-55db-2694-da69-8205779ee352	9245	Spodnji Ivanjci
00050000-55db-2694-0d44-3a2dd6446e8d	2277	Središče ob Dravi
00050000-55db-2694-5387-df29110afc10	4267	Srednja vas v Bohinju
00050000-55db-2694-0f3e-aa22754f7388	8256	Sromlje 
00050000-55db-2694-1af8-8f70c5dd9fd9	5224	Srpenica
00050000-55db-2694-4339-a4e050d14903	1242	Stahovica
00050000-55db-2694-dbb7-1c87e3f0834d	1332	Stara Cerkev
00050000-55db-2694-66be-75285488ea64	8342	Stari trg ob Kolpi
00050000-55db-2694-9603-2a5d8bb9b473	1386	Stari trg pri Ložu
00050000-55db-2694-9084-db4e0e1493ac	2205	Starše
00050000-55db-2694-ca01-99093c808045	2289	Stoperce
00050000-55db-2694-5cc3-6300a65d2d88	8322	Stopiče
00050000-55db-2694-7ee4-966e1f7a5089	3206	Stranice
00050000-55db-2694-8e81-75c696f1dd7f	8351	Straža
00050000-55db-2694-89a2-da59782c92d5	1313	Struge
00050000-55db-2694-a22f-2ac218b77af6	8293	Studenec
00050000-55db-2694-21d8-9055f678e5d9	8331	Suhor
00050000-55db-2694-6dee-a368e2263263	2233	Sv. Ana v Slovenskih goricah
00050000-55db-2694-b7b8-1f5fa839aebe	2235	Sv. Trojica v Slovenskih goricah
00050000-55db-2694-14a7-ad02e926ab3f	2353	Sveti Duh na Ostrem Vrhu
00050000-55db-2694-25d1-e5ed1d7abf6b	9244	Sveti Jurij ob Ščavnici
00050000-55db-2694-77dc-37eacf652b05	3264	Sveti Štefan
00050000-55db-2694-fc9e-032835aec76b	2258	Sveti Tomaž
00050000-55db-2694-0aa9-6466d19cfc46	9204	Šalovci
00050000-55db-2694-6bed-f8e2a3f6e14c	5261	Šempas
00050000-55db-2694-f47a-56b6b7f155c8	5290	Šempeter pri Gorici
00050000-55db-2694-7e8d-7d5fe802d545	3311	Šempeter v Savinjski dolini
00050000-55db-2694-57ac-4115e236d9ed	4208	Šenčur
00050000-55db-2694-4b39-f7f32ba86b7d	2212	Šentilj v Slovenskih goricah
00050000-55db-2694-a4bb-15106c38ea8b	8297	Šentjanž
00050000-55db-2694-108d-afb127c1cd14	2373	Šentjanž pri Dravogradu
00050000-55db-2694-c26c-3c437544852c	8310	Šentjernej
00050000-55db-2694-472b-5bbc5749d53d	3230	Šentjur
00050000-55db-2694-40b7-4afedc98c5d7	3271	Šentrupert
00050000-55db-2694-2992-cb1661378d1d	8232	Šentrupert
00050000-55db-2694-7328-6a1534f72572	1296	Šentvid pri Stični
00050000-55db-2694-30cf-ad1e7809cece	8275	Škocjan
00050000-55db-2694-9ff7-92adee9e912f	6281	Škofije
00050000-55db-2694-25d5-43f29922d819	4220	Škofja Loka
00050000-55db-2694-cdc6-5919da00f98e	3211	Škofja vas
00050000-55db-2694-cf2b-c1a62f6eebcc	1291	Škofljica
00050000-55db-2694-0062-9847d9110d1b	6274	Šmarje
00050000-55db-2694-cc13-316f113bb185	1293	Šmarje - Sap
00050000-55db-2694-5bfd-7702e169df14	3240	Šmarje pri Jelšah
00050000-55db-2694-cc9c-356954e26f7b	8220	Šmarješke Toplice
00050000-55db-2694-27b7-7612798a8e1c	2315	Šmartno na Pohorju
00050000-55db-2694-9e91-64f14b3354a3	3341	Šmartno ob Dreti
00050000-55db-2694-2068-bbb5a71ff8ab	3327	Šmartno ob Paki
00050000-55db-2694-dbad-4741dafd1c59	1275	Šmartno pri Litiji
00050000-55db-2694-c313-db9f6b32d99b	2383	Šmartno pri Slovenj Gradcu
00050000-55db-2694-21ac-9e54f0d927a6	3201	Šmartno v Rožni dolini
00050000-55db-2694-c65d-3dee90a33fd7	3325	Šoštanj
00050000-55db-2694-a29e-22a4f4872a65	6222	Štanjel
00050000-55db-2694-61e2-b55f5e6f6d46	3220	Štore
00050000-55db-2694-8d0f-8142014db260	3304	Tabor
00050000-55db-2694-891a-d7b131eaa6b4	3221	Teharje
00050000-55db-2694-26ab-f81a46d5d382	9251	Tišina
00050000-55db-2694-ddc2-2b33d9ff469e	5220	Tolmin
00050000-55db-2694-7456-9323ab9275d3	3326	Topolšica
00050000-55db-2694-bfd2-0c74402dbce4	2371	Trbonje
00050000-55db-2694-cee4-ad5ef8f3bcb2	1420	Trbovlje
00050000-55db-2694-071d-3ed7212837fc	8231	Trebelno 
00050000-55db-2694-97d2-bec6564024fd	8210	Trebnje
00050000-55db-2694-4e66-53c0994ed7d8	5252	Trnovo pri Gorici
00050000-55db-2694-8338-9b5660a23207	2254	Trnovska vas
00050000-55db-2694-b1cf-2349c1e22c10	1222	Trojane
00050000-55db-2694-6c56-195b2f0656b7	1236	Trzin
00050000-55db-2694-2f05-18bb56356cb7	4290	Tržič
00050000-55db-2694-070b-a97ba6e3a657	8295	Tržišče
00050000-55db-2694-8a79-be116395ab91	1311	Turjak
00050000-55db-2694-e6a8-4ef5f83c13f8	9224	Turnišče
00050000-55db-2694-84cd-af017b202dbc	8323	Uršna sela
00050000-55db-2694-0ec8-513b16f4e4b1	1252	Vače
00050000-55db-2694-45ae-39ea17e5dc02	3320	Velenje 
00050000-55db-2694-e576-9b3f4a810f12	3322	Velenje - poštni predali
00050000-55db-2694-da7a-116628407dc0	8212	Velika Loka
00050000-55db-2694-84a6-d174a2ccf359	2274	Velika Nedelja
00050000-55db-2694-f9a7-d3e540baa17e	9225	Velika Polana
00050000-55db-2694-2bfe-c987d98a8f6d	1315	Velike Lašče
00050000-55db-2694-4ba2-0816b638e1a1	8213	Veliki Gaber
00050000-55db-2694-2677-514cdfe811c5	9241	Veržej
00050000-55db-2694-b9fc-76719e3b850f	1312	Videm - Dobrepolje
00050000-55db-2694-3d1b-cddaa18a6fae	2284	Videm pri Ptuju
00050000-55db-2694-cd14-9969646f5d57	8344	Vinica
00050000-55db-2694-e9da-c159a7a17d47	5271	Vipava
00050000-55db-2694-6a01-93b480037db2	4212	Visoko
00050000-55db-2694-bafe-1c2d0cd6caf8	1294	Višnja Gora
00050000-55db-2694-38ad-e4f61fa4f5d8	3205	Vitanje
00050000-55db-2694-4e59-a19cd78a552b	2255	Vitomarci
00050000-55db-2694-af10-554a0fba251b	1217	Vodice
00050000-55db-2694-fcd4-c318536482df	3212	Vojnik\t
00050000-55db-2694-0d0b-cfa82fc39b2d	5293	Volčja Draga
00050000-55db-2694-262c-2a06f737396f	2232	Voličina
00050000-55db-2694-d79b-b898beb16668	3305	Vransko
00050000-55db-2694-6687-8ff9f270a486	6217	Vremski Britof
00050000-55db-2694-8aed-90467f8aa8f8	1360	Vrhnika
00050000-55db-2694-cee9-99f8f17707f1	2365	Vuhred
00050000-55db-2694-9252-686bab4ab1ea	2367	Vuzenica
00050000-55db-2694-09a2-bce89ee17585	8292	Zabukovje 
00050000-55db-2694-e959-d5ba8881f4b8	1410	Zagorje ob Savi
00050000-55db-2694-d9bc-90f5b3bd49b6	1303	Zagradec
00050000-55db-2694-55c6-d2d0a976642b	2283	Zavrč
00050000-55db-2694-8b0a-a6e97b13ae37	8272	Zdole 
00050000-55db-2694-4f2d-baa7a4d963e1	4201	Zgornja Besnica
00050000-55db-2694-8160-52a52fa83423	2242	Zgornja Korena
00050000-55db-2694-ec3d-90b3d4738ccb	2201	Zgornja Kungota
00050000-55db-2694-700e-9974b5fbb18d	2316	Zgornja Ložnica
00050000-55db-2694-f283-494c63c64d30	2314	Zgornja Polskava
00050000-55db-2694-2f73-f95363e4064d	2213	Zgornja Velka
00050000-55db-2694-a1e1-4024dca1291a	4247	Zgornje Gorje
00050000-55db-2694-7a66-b0ea562dc3a8	4206	Zgornje Jezersko
00050000-55db-2694-a697-aecaca0ab34f	2285	Zgornji Leskovec
00050000-55db-2694-5f2b-49f3098f2cc7	1432	Zidani Most
00050000-55db-2694-9db7-7e05e3b60867	3214	Zreče
00050000-55db-2694-39bb-068c711e2467	4209	Žabnica
00050000-55db-2694-967e-25184ba95099	3310	Žalec
00050000-55db-2694-002c-c03a29dcf43b	4228	Železniki
00050000-55db-2694-fc53-5ff763aa5c4e	2287	Žetale
00050000-55db-2694-46ba-f02dc30dc279	4226	Žiri
00050000-55db-2694-1932-889395ca34e2	4274	Žirovnica
00050000-55db-2694-628f-84adcb04d38a	8360	Žužemberk
\.


--
-- TOC entry 2918 (class 0 OID 15332344)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 15332151)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 15332229)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 15332356)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2943 (class 0 OID 15332692)
-- Dependencies: 225
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2944 (class 0 OID 15332702)
-- Dependencies: 226
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55db-2695-ad3b-5c9648756d85	00080000-55db-2695-8f90-4717ab68e349	0987	AK
00190000-55db-2695-4c41-81b90da2cc4d	00080000-55db-2695-6bb7-113b3bb1e663	0989	AK
00190000-55db-2695-1cc7-dfedaeaf00b9	00080000-55db-2695-746b-c038ca0962ac	0986	AK
00190000-55db-2695-ab07-17fb09304869	00080000-55db-2695-e355-45df4d78eadf	0984	AK
00190000-55db-2695-1d62-4e3f802ef97f	00080000-55db-2695-82bf-f0013bdd728b	0983	AK
00190000-55db-2695-b47b-cd11a5fb39f1	00080000-55db-2695-ab4b-9fb087a0607e	0982	AK
00190000-55db-2696-a51b-f2b1c37bb3ae	00080000-55db-2696-b5ac-29e13e02062b	1001	AK
\.


--
-- TOC entry 2942 (class 0 OID 15332648)
-- Dependencies: 224
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55db-2696-0423-893439cb0f44	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2945 (class 0 OID 15332710)
-- Dependencies: 227
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2924 (class 0 OID 15332385)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55db-2695-e6b9-b5f744737e51	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55db-2695-340f-d4973fe7421a	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55db-2695-0db1-b320388c507f	0003	Kazinska	t	84	Kazinska dvorana
00220000-55db-2695-ecc9-ef2acb337fe8	0004	Mali oder	t	24	Mali oder 
00220000-55db-2695-bf45-bd2700fef5f2	0005	Komorni oder	t	15	Komorni oder
00220000-55db-2695-6306-c1fa37ded6d2	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55db-2695-3f88-87b0a9a93516	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2916 (class 0 OID 15332329)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2915 (class 0 OID 15332319)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 15332504)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 15332453)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 15332023)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55db-2696-b5ac-29e13e02062b	00010000-55db-2694-0811-0e89663f1199	2015-08-24 16:13:42	INS	a:0:{}
2	App\\Entity\\Option	00000000-55db-2696-8651-2f73d2ba9c11	00010000-55db-2694-0811-0e89663f1199	2015-08-24 16:13:42	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55db-2696-a51b-f2b1c37bb3ae	00010000-55db-2694-0811-0e89663f1199	2015-08-24 16:13:42	INS	a:0:{}
\.


--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2925 (class 0 OID 15332395)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 15332061)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55db-2694-c13b-24f77b59e65f	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55db-2694-76e4-35cbb2c8b9b5	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55db-2694-dc5a-4ed65f347a87	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55db-2694-ef74-01fb17112c23	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55db-2694-798b-fcd0a22ea1cf	planer	Planer dogodkov v koledarju	t
00020000-55db-2694-ac2c-25c083b73216	kadrovska	Kadrovska služba	t
00020000-55db-2694-9dac-b87c88bf657b	arhivar	Ažuriranje arhivalij	t
00020000-55db-2694-0666-3a7d0e7e2a35	igralec	Igralec	t
00020000-55db-2694-f683-fb3975f5ae47	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55db-2695-fd36-ef1a8dd48dc1	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2891 (class 0 OID 15332045)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55db-2694-2058-dfa41b36cae1	00020000-55db-2694-dc5a-4ed65f347a87
00010000-55db-2694-0811-0e89663f1199	00020000-55db-2694-dc5a-4ed65f347a87
00010000-55db-2695-302e-e785bdb6100f	00020000-55db-2695-fd36-ef1a8dd48dc1
\.


--
-- TOC entry 2927 (class 0 OID 15332409)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2919 (class 0 OID 15332350)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2913 (class 0 OID 15332296)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 15332751)
-- Dependencies: 232
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55db-2694-5e4c-7e9d78b46e33	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55db-2694-7c20-e0c4ec91af8f	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55db-2694-7252-c1694eac1a51	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55db-2694-c44f-2687332e8758	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55db-2694-0ca3-9dcd6db1bc7b	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2949 (class 0 OID 15332743)
-- Dependencies: 231
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55db-2694-9cc5-b8d0502fad59	00230000-55db-2694-c44f-2687332e8758	popa
00240000-55db-2694-43be-c43eef36a82f	00230000-55db-2694-c44f-2687332e8758	oseba
00240000-55db-2694-092d-1c4c8f64948d	00230000-55db-2694-c44f-2687332e8758	sezona
00240000-55db-2694-30a8-3eac0c9cc4ca	00230000-55db-2694-7c20-e0c4ec91af8f	prostor
00240000-55db-2694-3319-7ceda1b1a50b	00230000-55db-2694-c44f-2687332e8758	besedilo
00240000-55db-2694-f7a7-9d611b4715d2	00230000-55db-2694-c44f-2687332e8758	uprizoritev
00240000-55db-2694-ebdd-e50d58936593	00230000-55db-2694-c44f-2687332e8758	funkcija
00240000-55db-2694-ae5e-b2398fdbfd5f	00230000-55db-2694-c44f-2687332e8758	tipfunkcije
00240000-55db-2694-dfaf-8f4a0846bb8a	00230000-55db-2694-c44f-2687332e8758	alternacija
00240000-55db-2694-35cb-4ac564b752fe	00230000-55db-2694-5e4c-7e9d78b46e33	pogodba
00240000-55db-2694-dd9a-fb543e55a07b	00230000-55db-2694-c44f-2687332e8758	zaposlitev
00240000-55db-2694-017d-3e35731e1f29	00230000-55db-2694-5e4c-7e9d78b46e33	programdela
00240000-55db-2694-09a5-c8414967a1b8	00230000-55db-2694-c44f-2687332e8758	zapis
\.


--
-- TOC entry 2948 (class 0 OID 15332738)
-- Dependencies: 230
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
0b620bdf-18b9-4a4a-aafb-da758d12bf3a	00230000-55db-2694-c44f-2687332e8758	0	1001
\.


--
-- TOC entry 2932 (class 0 OID 15332463)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55db-2696-c5f5-64161b97632b	000e0000-55db-2695-5345-d544176e19aa	00080000-55db-2695-15f2-4da8c59fd847	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55db-2696-a6bb-4cc34de37e2e	000e0000-55db-2695-5345-d544176e19aa	00080000-55db-2695-15f2-4da8c59fd847	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55db-2696-5ee8-7c3be2901b07	000e0000-55db-2695-5345-d544176e19aa	00080000-55db-2695-50f6-a6754124e0e5	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2898 (class 0 OID 15332123)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2914 (class 0 OID 15332306)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55db-2696-abe1-4ec5a5d8a612	00180000-55db-2696-c857-fd9e1d1bfa46	000c0000-55db-2696-d710-ccefa0ccdbd7	00090000-55db-2695-d44e-a55c99e74486	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55db-2696-93b9-b7892310e5f9	00180000-55db-2696-c857-fd9e1d1bfa46	000c0000-55db-2696-e8fd-8426ee23cfe5	00090000-55db-2695-65a2-2539c8325f79	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55db-2696-f100-d1d58169c85b	00180000-55db-2696-c857-fd9e1d1bfa46	000c0000-55db-2696-c425-04b35728d0ba	00090000-55db-2695-ee23-c89bd0177bfb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55db-2696-e81a-55ede7a6e13d	00180000-55db-2696-c857-fd9e1d1bfa46	000c0000-55db-2696-dd6f-878fe9131110	00090000-55db-2695-8f13-d3f9ee0d88df	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55db-2696-151a-c4cd7e9cd26d	00180000-55db-2696-c857-fd9e1d1bfa46	000c0000-55db-2696-b402-2a95af407061	00090000-55db-2695-bf94-5c1bd716e001	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55db-2696-1500-a77865935b79	00180000-55db-2696-653e-528240373422	\N	00090000-55db-2695-bf94-5c1bd716e001	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2934 (class 0 OID 15332493)
-- Dependencies: 216
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55db-2694-0682-823b5c2c8970	Avtor	Avtorji	Avtorka	umetnik
000f0000-55db-2694-70c5-b1a2142af85e	Priredba	Priredba	Priredba	umetnik
000f0000-55db-2694-946c-68fc881b39fc	Prevod	Prevod	Prevod	umetnik
000f0000-55db-2694-c332-c49487abe4e1	Režija	Režija	Režija	umetnik
000f0000-55db-2694-dc28-08c4ff773072	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55db-2694-647f-6c8e2fef3696	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55db-2694-5276-ee86d2ca4545	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55db-2694-8c57-1d5e42015fcc	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55db-2694-6cbe-d35e9c94e383	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55db-2694-db10-d6305ac1ab39	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55db-2694-fbc7-84f8901bf92a	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55db-2694-9aab-759d03f0f78b	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55db-2694-15dc-04a49064d74a	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55db-2694-585c-0c23adf73811	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55db-2694-bb3d-5ee50892098c	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55db-2694-c7c9-25f568dffc5e	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55db-2694-5690-fcd4c7b7fc51	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55db-2694-742f-69c7e58995c8	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2946 (class 0 OID 15332720)
-- Dependencies: 228
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55db-2694-afbb-505162ac641f	01	Velika predstava	f	1.00	1.00
002b0000-55db-2694-91cc-07a0932e0dc6	02	Mala predstava	f	0.50	0.50
002b0000-55db-2694-4117-0c22ab2b89e2	03	Mala koprodukcija	t	0.40	1.00
002b0000-55db-2694-f22c-9409c730fa6c	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55db-2694-a930-f4b0d350045a	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2903 (class 0 OID 15332186)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 15332032)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55db-2694-0811-0e89663f1199	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROQBepgtDa.yEssegYe1/pDasK2HYZt/C	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55db-2695-863c-9da7f63770d4	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55db-2695-7854-7f7d420e90be	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55db-2695-6854-2e7504a2f3d0	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55db-2695-67fb-166572ab7e1c	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55db-2695-8ab4-f4889296e895	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55db-2695-2b8b-20d5f6616759	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55db-2695-2b14-22fb9d1f424c	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55db-2695-9144-939af835da2b	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55db-2695-4c07-ff5eb9980dd8	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55db-2695-302e-e785bdb6100f	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55db-2694-2058-dfa41b36cae1	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2938 (class 0 OID 15332541)
-- Dependencies: 220
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55db-2695-1e13-a912cd215877	00160000-55db-2695-096d-0a8d98c6f939	00150000-55db-2694-e5cc-f7f16e3469ac	00140000-55db-2694-7883-99f9dd331eee	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55db-2695-bf45-bd2700fef5f2
000e0000-55db-2695-5345-d544176e19aa	00160000-55db-2695-beb8-b43eab1d9d3e	00150000-55db-2694-6ed9-84c19b01fa16	00140000-55db-2694-4e2b-9666ed5aced4	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55db-2695-6306-c1fa37ded6d2
000e0000-55db-2695-242e-d31e05301d61	\N	00150000-55db-2694-6ed9-84c19b01fa16	00140000-55db-2694-4e2b-9666ed5aced4	00190000-55db-2695-ad3b-5c9648756d85	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55db-2695-bf45-bd2700fef5f2
000e0000-55db-2695-4563-54f17b399746	\N	00150000-55db-2694-6ed9-84c19b01fa16	00140000-55db-2694-4e2b-9666ed5aced4	00190000-55db-2695-ad3b-5c9648756d85	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55db-2695-bf45-bd2700fef5f2
000e0000-55db-2695-88c0-c4ec19ab1f88	\N	00150000-55db-2694-6ed9-84c19b01fa16	00140000-55db-2694-4e2b-9666ed5aced4	00190000-55db-2695-ad3b-5c9648756d85	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55db-2695-e6b9-b5f744737e51
000e0000-55db-2696-4501-2b3f112cf5bf	\N	00150000-55db-2694-6ed9-84c19b01fa16	00140000-55db-2694-4e2b-9666ed5aced4	00190000-55db-2695-ad3b-5c9648756d85	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f		00220000-55db-2695-e6b9-b5f744737e51
\.


--
-- TOC entry 2908 (class 0 OID 15332248)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55db-2696-f9fd-bb9aafac01a7	000e0000-55db-2695-5345-d544176e19aa	1	
00200000-55db-2696-a420-bf311706c1d9	000e0000-55db-2695-5345-d544176e19aa	2	
\.


--
-- TOC entry 2923 (class 0 OID 15332377)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 15332790)
-- Dependencies: 234
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 15332762)
-- Dependencies: 233
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 15332802)
-- Dependencies: 235
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 15332446)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55db-2696-b603-57ffee5ab491	00090000-55db-2695-65a2-2539c8325f79	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55db-2696-0dbe-378505c4b225	00090000-55db-2695-ee23-c89bd0177bfb	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55db-2696-3d43-95b38c02487b	00090000-55db-2695-f76b-c630e0f1bdd9	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55db-2696-7895-c5c67734ca3c	00090000-55db-2695-1f33-e8ea0da452b1	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55db-2696-8c57-dca96b3d83a3	00090000-55db-2695-d44e-a55c99e74486	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55db-2696-519f-04ad322408d9	00090000-55db-2695-73d3-da8f27e63d53	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2910 (class 0 OID 15332280)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 15332531)
-- Dependencies: 219
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55db-2694-7883-99f9dd331eee	01	Drama	drama (SURS 01)
00140000-55db-2694-99d8-1b67c92fba79	02	Opera	opera (SURS 02)
00140000-55db-2694-e76f-9587dac192bd	03	Balet	balet (SURS 03)
00140000-55db-2694-e7ed-23786cd95dc7	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55db-2694-202b-4aa0d675f4d3	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55db-2694-4e2b-9666ed5aced4	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55db-2694-0bd6-28402678c718	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2929 (class 0 OID 15332436)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55db-2694-aa8b-9c78bdff3928	01	Opera	opera
00150000-55db-2694-5d48-86d6a560c890	02	Opereta	opereta
00150000-55db-2694-f7fd-5e9461ad8186	03	Balet	balet
00150000-55db-2694-dd9f-3b20cce50d0c	04	Plesne prireditve	plesne prireditve
00150000-55db-2694-65a5-9678c4114dfd	05	Lutkovno gledališče	lutkovno gledališče
00150000-55db-2694-90f1-ed4cd2a24c0b	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55db-2694-9bf5-3315599e59e2	07	Biografska drama	biografska drama
00150000-55db-2694-e5cc-f7f16e3469ac	08	Komedija	komedija
00150000-55db-2694-7c01-50bda01e3730	09	Črna komedija	črna komedija
00150000-55db-2694-0075-2b8bed9822a0	10	E-igra	E-igra
00150000-55db-2694-6ed9-84c19b01fa16	11	Kriminalka	kriminalka
00150000-55db-2694-c48b-6afb098e7f92	12	Musical	musical
\.


--
-- TOC entry 2440 (class 2606 OID 15332086)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 15332588)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 15332578)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 15332492)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 15332842)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 15332270)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 15332295)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 15332736)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 15332212)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 15332642)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 15332432)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 15332246)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 15332289)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 15332226)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 15332342)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 15332819)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 15332826)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2681 (class 2606 OID 15332850)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 15332369)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 15332184)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2444 (class 2606 OID 15332095)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2447 (class 2606 OID 15332119)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 15332075)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2431 (class 2606 OID 15332060)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 15332375)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 15332408)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 15332526)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 15332148)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 15332172)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 15332348)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 15332162)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 15332233)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 15332360)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 15332699)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 15332707)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 15332690)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 15332718)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 15332392)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 15332333)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 15332324)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 15332514)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 15332460)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 15332031)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 15332399)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 15332049)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2433 (class 2606 OID 15332069)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 15332417)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 15332355)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 15332304)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 15332760)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 15332748)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 15332742)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 15332473)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2453 (class 2606 OID 15332128)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 15332315)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 15332503)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 15332730)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 15332197)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 15332044)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 15332557)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 15332255)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 15332383)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 15332800)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 15332784)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 15332808)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 15332451)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 15332284)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 15332539)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 15332444)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 1259 OID 15332277)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2581 (class 1259 OID 15332474)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2582 (class 1259 OID 15332475)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2667 (class 1259 OID 15332821)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2668 (class 1259 OID 15332820)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2454 (class 1259 OID 15332150)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2546 (class 1259 OID 15332376)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2654 (class 1259 OID 15332788)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2655 (class 1259 OID 15332787)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2656 (class 1259 OID 15332789)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2657 (class 1259 OID 15332786)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2658 (class 1259 OID 15332785)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2540 (class 1259 OID 15332362)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2541 (class 1259 OID 15332361)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2491 (class 1259 OID 15332256)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2568 (class 1259 OID 15332433)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 15332435)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2570 (class 1259 OID 15332434)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2479 (class 1259 OID 15332228)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2480 (class 1259 OID 15332227)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2637 (class 1259 OID 15332719)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2591 (class 1259 OID 15332528)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2592 (class 1259 OID 15332529)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 15332530)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2664 (class 1259 OID 15332809)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2600 (class 1259 OID 15332562)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2601 (class 1259 OID 15332559)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2602 (class 1259 OID 15332563)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2603 (class 1259 OID 15332561)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2604 (class 1259 OID 15332560)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2469 (class 1259 OID 15332199)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2470 (class 1259 OID 15332198)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2445 (class 1259 OID 15332122)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2556 (class 1259 OID 15332400)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2509 (class 1259 OID 15332290)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2435 (class 1259 OID 15332076)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2436 (class 1259 OID 15332077)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2561 (class 1259 OID 15332420)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2562 (class 1259 OID 15332419)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2563 (class 1259 OID 15332418)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2483 (class 1259 OID 15332234)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2484 (class 1259 OID 15332236)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2485 (class 1259 OID 15332235)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2647 (class 1259 OID 15332750)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2520 (class 1259 OID 15332328)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2521 (class 1259 OID 15332326)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2522 (class 1259 OID 15332325)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2523 (class 1259 OID 15332327)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2426 (class 1259 OID 15332050)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2427 (class 1259 OID 15332051)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2549 (class 1259 OID 15332384)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2677 (class 1259 OID 15332843)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2678 (class 1259 OID 15332851)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2679 (class 1259 OID 15332852)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2535 (class 1259 OID 15332349)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2577 (class 1259 OID 15332461)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2578 (class 1259 OID 15332462)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2621 (class 1259 OID 15332647)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2622 (class 1259 OID 15332646)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2623 (class 1259 OID 15332643)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2624 (class 1259 OID 15332644)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2625 (class 1259 OID 15332645)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2458 (class 1259 OID 15332164)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2459 (class 1259 OID 15332163)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2460 (class 1259 OID 15332165)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2629 (class 1259 OID 15332700)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2630 (class 1259 OID 15332701)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2614 (class 1259 OID 15332592)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2615 (class 1259 OID 15332593)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2616 (class 1259 OID 15332590)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2617 (class 1259 OID 15332591)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2574 (class 1259 OID 15332452)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 15332337)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2527 (class 1259 OID 15332336)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2528 (class 1259 OID 15332334)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2529 (class 1259 OID 15332335)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2610 (class 1259 OID 15332580)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2611 (class 1259 OID 15332579)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2626 (class 1259 OID 15332691)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2490 (class 1259 OID 15332247)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2644 (class 1259 OID 15332737)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2671 (class 1259 OID 15332827)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2672 (class 1259 OID 15332828)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2441 (class 1259 OID 15332097)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2442 (class 1259 OID 15332096)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2450 (class 1259 OID 15332129)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2451 (class 1259 OID 15332130)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2515 (class 1259 OID 15332318)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 15332317)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2517 (class 1259 OID 15332316)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2497 (class 1259 OID 15332279)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2498 (class 1259 OID 15332275)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2499 (class 1259 OID 15332272)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2500 (class 1259 OID 15332273)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2501 (class 1259 OID 15332271)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2502 (class 1259 OID 15332276)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2503 (class 1259 OID 15332274)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2457 (class 1259 OID 15332149)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2475 (class 1259 OID 15332213)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 15332215)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2477 (class 1259 OID 15332214)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2478 (class 1259 OID 15332216)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2534 (class 1259 OID 15332343)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2596 (class 1259 OID 15332527)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 15332558)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2448 (class 1259 OID 15332120)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2449 (class 1259 OID 15332121)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2571 (class 1259 OID 15332445)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2653 (class 1259 OID 15332761)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2468 (class 1259 OID 15332185)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 15332749)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2554 (class 1259 OID 15332394)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2555 (class 1259 OID 15332393)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2618 (class 1259 OID 15332589)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2465 (class 1259 OID 15332173)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 15332540)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 15332801)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2635 (class 1259 OID 15332708)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2636 (class 1259 OID 15332709)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2514 (class 1259 OID 15332305)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2434 (class 1259 OID 15332070)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2504 (class 1259 OID 15332278)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2707 (class 2606 OID 15332988)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2710 (class 2606 OID 15332973)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2709 (class 2606 OID 15332978)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2705 (class 2606 OID 15332998)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2711 (class 2606 OID 15332968)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2706 (class 2606 OID 15332993)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2708 (class 2606 OID 15332983)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2741 (class 2606 OID 15333143)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2740 (class 2606 OID 15333148)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2774 (class 2606 OID 15333318)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2775 (class 2606 OID 15333313)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2692 (class 2606 OID 15332903)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2728 (class 2606 OID 15333083)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2769 (class 2606 OID 15333298)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2770 (class 2606 OID 15333293)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2768 (class 2606 OID 15333303)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2771 (class 2606 OID 15333288)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2772 (class 2606 OID 15333283)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2726 (class 2606 OID 15333078)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2727 (class 2606 OID 15333073)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2704 (class 2606 OID 15332963)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2736 (class 2606 OID 15333113)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2734 (class 2606 OID 15333123)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2735 (class 2606 OID 15333118)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2698 (class 2606 OID 15332938)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2699 (class 2606 OID 15332933)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2724 (class 2606 OID 15333063)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2765 (class 2606 OID 15333268)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2744 (class 2606 OID 15333153)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2743 (class 2606 OID 15333158)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2742 (class 2606 OID 15333163)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2773 (class 2606 OID 15333308)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2746 (class 2606 OID 15333183)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2749 (class 2606 OID 15333168)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2745 (class 2606 OID 15333188)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2747 (class 2606 OID 15333178)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2748 (class 2606 OID 15333173)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2696 (class 2606 OID 15332928)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2697 (class 2606 OID 15332923)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2688 (class 2606 OID 15332888)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2689 (class 2606 OID 15332883)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2730 (class 2606 OID 15333093)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2712 (class 2606 OID 15333003)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2685 (class 2606 OID 15332863)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2684 (class 2606 OID 15332868)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2731 (class 2606 OID 15333108)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2732 (class 2606 OID 15333103)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2733 (class 2606 OID 15333098)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2702 (class 2606 OID 15332943)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2700 (class 2606 OID 15332953)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2701 (class 2606 OID 15332948)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2767 (class 2606 OID 15333278)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2716 (class 2606 OID 15333038)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2718 (class 2606 OID 15333028)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2719 (class 2606 OID 15333023)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2717 (class 2606 OID 15333033)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2683 (class 2606 OID 15332853)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2682 (class 2606 OID 15332858)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2729 (class 2606 OID 15333088)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2778 (class 2606 OID 15333333)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2780 (class 2606 OID 15333338)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2779 (class 2606 OID 15333343)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2725 (class 2606 OID 15333068)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2739 (class 2606 OID 15333133)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2738 (class 2606 OID 15333138)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2756 (class 2606 OID 15333243)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2757 (class 2606 OID 15333238)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2760 (class 2606 OID 15333223)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2759 (class 2606 OID 15333228)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2758 (class 2606 OID 15333233)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2694 (class 2606 OID 15332913)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2695 (class 2606 OID 15332908)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2693 (class 2606 OID 15332918)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2763 (class 2606 OID 15333253)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2762 (class 2606 OID 15333258)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2753 (class 2606 OID 15333213)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2752 (class 2606 OID 15333218)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2755 (class 2606 OID 15333203)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2754 (class 2606 OID 15333208)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2737 (class 2606 OID 15333128)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2720 (class 2606 OID 15333058)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2721 (class 2606 OID 15333053)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2723 (class 2606 OID 15333043)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2722 (class 2606 OID 15333048)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2750 (class 2606 OID 15333198)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2751 (class 2606 OID 15333193)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2761 (class 2606 OID 15333248)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2703 (class 2606 OID 15332958)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2764 (class 2606 OID 15333263)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2766 (class 2606 OID 15333273)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2777 (class 2606 OID 15333323)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2776 (class 2606 OID 15333328)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2686 (class 2606 OID 15332878)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2687 (class 2606 OID 15332873)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2691 (class 2606 OID 15332893)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2690 (class 2606 OID 15332898)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2713 (class 2606 OID 15333018)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2714 (class 2606 OID 15333013)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2715 (class 2606 OID 15333008)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-24 16:13:43 CEST

--
-- PostgreSQL database dump complete
--

