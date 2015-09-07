--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-08 09:58:25 CEST

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
-- TOC entry 2975 (class 0 OID 0)
-- Dependencies: 240
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 17804787)
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
-- TOC entry 225 (class 1259 OID 17805305)
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
-- TOC entry 224 (class 1259 OID 17805288)
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
-- TOC entry 218 (class 1259 OID 17805197)
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
-- TOC entry 238 (class 1259 OID 17805529)
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
-- TOC entry 194 (class 1259 OID 17804965)
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
    allday boolean DEFAULT false NOT NULL,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status character varying(20) DEFAULT NULL::character varying,
    razred character varying(10) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 196 (class 1259 OID 17804996)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 232 (class 1259 OID 17805455)
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
-- TOC entry 189 (class 1259 OID 17804908)
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
-- TOC entry 226 (class 1259 OID 17805318)
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
-- TOC entry 212 (class 1259 OID 17805129)
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
-- TOC entry 192 (class 1259 OID 17804944)
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
-- TOC entry 190 (class 1259 OID 17804925)
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
-- TOC entry 201 (class 1259 OID 17805043)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 236 (class 1259 OID 17805510)
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
-- TOC entry 237 (class 1259 OID 17805522)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 17805544)
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
-- TOC entry 205 (class 1259 OID 17805068)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 17804882)
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
-- TOC entry 181 (class 1259 OID 17804796)
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
-- TOC entry 182 (class 1259 OID 17804807)
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
-- TOC entry 177 (class 1259 OID 17804761)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 17804780)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 17805075)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 17805109)
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
-- TOC entry 221 (class 1259 OID 17805237)
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
-- TOC entry 184 (class 1259 OID 17804840)
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
-- TOC entry 186 (class 1259 OID 17804874)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 17805049)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 185 (class 1259 OID 17804859)
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
-- TOC entry 191 (class 1259 OID 17804937)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 204 (class 1259 OID 17805061)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 17805416)
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
-- TOC entry 229 (class 1259 OID 17805426)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 227 (class 1259 OID 17805373)
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
-- TOC entry 230 (class 1259 OID 17805434)
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
-- TOC entry 208 (class 1259 OID 17805090)
-- Name: prostor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prostor (
    id uuid NOT NULL,
    popa_id uuid,
    naslov_id uuid,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    jeprizorisce boolean,
    seplanira boolean DEFAULT false NOT NULL,
    kapaciteta integer,
    opis text
);


--
-- TOC entry 200 (class 1259 OID 17805034)
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
-- TOC entry 199 (class 1259 OID 17805024)
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
-- TOC entry 220 (class 1259 OID 17805226)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 17805164)
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
-- TOC entry 174 (class 1259 OID 17804732)
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
-- TOC entry 173 (class 1259 OID 17804730)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 209 (class 1259 OID 17805103)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 17804770)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 17804754)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 17805117)
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
-- TOC entry 203 (class 1259 OID 17805055)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 17805001)
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
-- TOC entry 172 (class 1259 OID 17804719)
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
-- TOC entry 171 (class 1259 OID 17804711)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 170 (class 1259 OID 17804706)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 216 (class 1259 OID 17805174)
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
-- TOC entry 183 (class 1259 OID 17804832)
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
-- TOC entry 198 (class 1259 OID 17805011)
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
-- TOC entry 219 (class 1259 OID 17805214)
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
-- TOC entry 231 (class 1259 OID 17805444)
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
-- TOC entry 188 (class 1259 OID 17804894)
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
-- TOC entry 175 (class 1259 OID 17804741)
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
-- TOC entry 223 (class 1259 OID 17805263)
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
-- TOC entry 193 (class 1259 OID 17804955)
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
-- TOC entry 207 (class 1259 OID 17805082)
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
-- TOC entry 217 (class 1259 OID 17805188)
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
-- TOC entry 234 (class 1259 OID 17805490)
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
-- TOC entry 233 (class 1259 OID 17805462)
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
-- TOC entry 235 (class 1259 OID 17805502)
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
-- TOC entry 214 (class 1259 OID 17805154)
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
-- TOC entry 195 (class 1259 OID 17804991)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 17805253)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 213 (class 1259 OID 17805144)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2178 (class 2604 OID 17804735)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2909 (class 0 OID 17804787)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 17805305)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55ee-951f-d731-cf554302aa92	000d0000-55ee-951f-994a-539dac4cd29d	\N	00090000-55ee-951f-4663-d815b2c261b0	000b0000-55ee-951f-71f0-d63f66020568	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55ee-951f-dbaf-c1becbc92f9c	000d0000-55ee-951f-80b2-6978d526ae62	00100000-55ee-951f-b2c6-4f413036bb40	00090000-55ee-951f-d4ba-be3c6fdfec67	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55ee-951f-aee9-aed64b4a9abb	000d0000-55ee-951f-0179-126fa3e6d338	00100000-55ee-951f-bc25-48eb55e0fb29	00090000-55ee-951f-6ff1-e29df874dc8a	\N	0003	t	\N	2015-09-08	\N	2	t	\N	f	f
000c0000-55ee-951f-cdac-82ab10015bdd	000d0000-55ee-951f-b5b9-4e8ebd59590b	\N	00090000-55ee-951f-26f0-7071bcf72040	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55ee-951f-f30e-81bd03becb9d	000d0000-55ee-951f-7b7a-16efdfda1408	\N	00090000-55ee-951f-a3d7-55315b10164d	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55ee-951f-0462-cd9af34c7993	000d0000-55ee-951f-9e3d-f165792104f7	\N	00090000-55ee-951f-2e17-616716776d45	000b0000-55ee-951f-aa2b-112176a1ced5	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55ee-951f-1e1f-372ecbfae044	000d0000-55ee-951f-6ae9-d88a86e9afe7	00100000-55ee-951f-d4cc-587e685cd6cf	00090000-55ee-951f-a398-5dede714486f	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55ee-951f-4c6b-e228e91f1daf	000d0000-55ee-951f-3f9f-bae358c6c684	\N	00090000-55ee-951f-d0b3-e02f46b89c8c	000b0000-55ee-951f-cd10-85171f974127	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55ee-951f-12b2-339f846035fa	000d0000-55ee-951f-6ae9-d88a86e9afe7	00100000-55ee-951f-2e1d-3ae945b3fc79	00090000-55ee-951f-84d2-719f41815f80	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55ee-951f-44f1-cdb459ef18bd	000d0000-55ee-951f-6ae9-d88a86e9afe7	00100000-55ee-951f-f273-2b37956558e4	00090000-55ee-951f-9930-a7321a46be64	\N	0010	t	\N	2015-09-08	\N	16	f	\N	f	t
000c0000-55ee-951f-832f-0a3a9183cee7	000d0000-55ee-951f-6ae9-d88a86e9afe7	00100000-55ee-951f-97b6-8c8b8ab7be2e	00090000-55ee-951f-aee5-4ca24d29ffdc	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
\.


--
-- TOC entry 2953 (class 0 OID 17805288)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 17805197)
-- Dependencies: 218
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55ee-951e-952e-f2c06375ce1c	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55ee-951e-d4dc-45758d57323b	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55ee-951e-c34a-e7e8197db6f3	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2967 (class 0 OID 17805529)
-- Dependencies: 238
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2923 (class 0 OID 17804965)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55ee-951f-4076-dedb11e5b9ac	\N	\N	00200000-55ee-951f-e086-92b776f85527	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55ee-951f-66d4-92f15cfc946b	\N	\N	00200000-55ee-951f-fe11-dd5fe6c072dd	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55ee-951f-8031-319185aea5e3	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55ee-951f-880d-259cdfc3d002	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55ee-951f-0e66-ad4b673aa7cc	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2925 (class 0 OID 17804996)
-- Dependencies: 196
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 17805455)
-- Dependencies: 232
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2918 (class 0 OID 17804908)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55ee-951d-c155-f397043a018c	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55ee-951d-44a5-55576f51d520	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55ee-951d-6ff1-3c7af0d6afb1	AL	ALB	008	Albania 	Albanija	\N
00040000-55ee-951d-344a-d6999723b29b	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55ee-951d-bcb7-23785969ec23	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55ee-951d-5e62-b53ca13c97b9	AD	AND	020	Andorra 	Andora	\N
00040000-55ee-951d-9a8e-559ece050463	AO	AGO	024	Angola 	Angola	\N
00040000-55ee-951d-bcf1-f3780105d300	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55ee-951d-b436-9911ab737536	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55ee-951d-8e05-391c63fa6d07	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55ee-951d-04b0-f7e4213ea6b9	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55ee-951d-40c6-a18d81b12829	AM	ARM	051	Armenia 	Armenija	\N
00040000-55ee-951d-0981-4f3475fa86c4	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55ee-951d-5819-099211077a99	AU	AUS	036	Australia 	Avstralija	\N
00040000-55ee-951d-03d5-df65923d5bb4	AT	AUT	040	Austria 	Avstrija	\N
00040000-55ee-951d-901f-50d9da64e40e	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55ee-951d-4163-51fa7d25f21e	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55ee-951d-6579-8b2eb171a50f	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55ee-951d-ab18-663d7466e01f	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55ee-951d-2a49-fc1aeb651250	BB	BRB	052	Barbados 	Barbados	\N
00040000-55ee-951d-a110-2a4ca085898a	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55ee-951d-f94a-aa45683128ed	BE	BEL	056	Belgium 	Belgija	\N
00040000-55ee-951d-23fb-6928fd7e0eed	BZ	BLZ	084	Belize 	Belize	\N
00040000-55ee-951d-7149-b38d3336e6d8	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55ee-951d-8c36-cf3c440e9c3f	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55ee-951d-d951-fca1a41ad604	BT	BTN	064	Bhutan 	Butan	\N
00040000-55ee-951d-1774-47537cc1ff10	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55ee-951d-6f9e-6b5ace84a82d	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55ee-951d-36e2-96c02372f269	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55ee-951d-defc-506ff3ad13fa	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55ee-951d-5677-f84dcc374dc7	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55ee-951d-d4d6-dd0700ce6d8f	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55ee-951d-fc6a-11861b25c1b9	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55ee-951d-c1c7-efcd916a4a23	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55ee-951d-790e-855af7a07be4	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55ee-951d-f1d9-f3619c1f3bca	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55ee-951d-788a-42a3e54a1bcb	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55ee-951d-7276-95666f2a568f	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55ee-951d-ea89-e8cf3bb722ae	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55ee-951d-8ddb-c53b55ae3eca	CA	CAN	124	Canada 	Kanada	\N
00040000-55ee-951d-34e0-6d3cdf773af4	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55ee-951d-3edd-be5a4dd6ebc6	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55ee-951d-cc61-090883551172	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55ee-951d-eda8-b582485e2460	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55ee-951d-c03f-72effce30e80	CL	CHL	152	Chile 	Čile	\N
00040000-55ee-951d-ccb2-5fc25f507b9f	CN	CHN	156	China 	Kitajska	\N
00040000-55ee-951d-a9bb-ad09cd726768	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55ee-951d-a7ad-234782d914f1	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55ee-951d-ec7a-d17da51fec9d	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55ee-951d-4e20-2c2b0f85b50e	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55ee-951d-46dc-0a1e71605840	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55ee-951d-f12d-d33378a4e8a4	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55ee-951d-6f9e-0dfd749987f5	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55ee-951d-490c-94a34695b20e	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55ee-951d-6854-eeda63b2d9fe	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55ee-951d-d6fe-b5c18b4c4c67	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55ee-951d-0822-c6e134ac4e2d	CU	CUB	192	Cuba 	Kuba	\N
00040000-55ee-951d-1685-9088dc73fd43	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55ee-951d-28e2-dc1cee967842	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55ee-951d-7afd-5edaa7ea9c4d	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55ee-951d-daf4-3a419085aea0	DK	DNK	208	Denmark 	Danska	\N
00040000-55ee-951d-19a9-15f37861b102	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55ee-951d-2e38-29c7c610398f	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55ee-951d-0821-1dd9c0d600fc	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55ee-951d-bd03-f2b70c50946a	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55ee-951d-d1c0-1cb3f2115e94	EG	EGY	818	Egypt 	Egipt	\N
00040000-55ee-951d-d028-f444cd336e36	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55ee-951d-321b-e5a20b780d4a	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55ee-951d-b22d-7b910296d177	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55ee-951d-0f3e-67f86cc2d6cd	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55ee-951d-fa67-2778f57b1c1a	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55ee-951d-bba9-f1f085feebfa	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55ee-951d-026e-2a13f6fae7a7	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55ee-951d-497f-a1667433d594	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55ee-951d-e1b9-ea1aa449c76a	FI	FIN	246	Finland 	Finska	\N
00040000-55ee-951d-1153-a5b6a363c4ab	FR	FRA	250	France 	Francija	\N
00040000-55ee-951d-1ae1-202cb2f5601b	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55ee-951d-c7c3-3417da241243	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55ee-951d-fd4a-1ffa24673d84	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55ee-951d-6e67-e7d2a4a55777	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55ee-951d-bd37-63a120bfcf18	GA	GAB	266	Gabon 	Gabon	\N
00040000-55ee-951d-271b-3b7807758304	GM	GMB	270	Gambia 	Gambija	\N
00040000-55ee-951d-92f5-8da3c16bbbcc	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55ee-951d-b69d-9d2a65d11df8	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55ee-951d-d60e-08b5662350f9	GH	GHA	288	Ghana 	Gana	\N
00040000-55ee-951d-6a1a-8cbc6e36a7e9	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55ee-951d-e6ad-bd1686fa40fb	GR	GRC	300	Greece 	Grčija	\N
00040000-55ee-951d-7cf3-47d39a886a2e	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55ee-951d-b77e-9c883e520501	GD	GRD	308	Grenada 	Grenada	\N
00040000-55ee-951d-42a7-9f62b3fd08a1	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55ee-951d-d037-af4fcccc0283	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55ee-951d-500d-751a90bd1fd5	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55ee-951d-d5e8-6ca741537e18	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55ee-951d-cb80-404384cc1256	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55ee-951d-30e0-47e96b9bbb24	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55ee-951d-88b2-24adcbfa2d7e	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55ee-951d-2138-2a2f8e2a200a	HT	HTI	332	Haiti 	Haiti	\N
00040000-55ee-951d-90e5-b41f4d3b0019	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55ee-951d-e9d3-3bb18457574a	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55ee-951d-dceb-b9c002dee3c1	HN	HND	340	Honduras 	Honduras	\N
00040000-55ee-951d-f07c-a451ab380a23	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55ee-951d-5fbf-c8b7fc7ec018	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55ee-951d-009e-d0df05a4f9f3	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55ee-951d-7f4c-5ae396158ba7	IN	IND	356	India 	Indija	\N
00040000-55ee-951d-8a7c-866d083f26ff	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55ee-951d-fb2d-df744f11f90a	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55ee-951d-0a50-fa375d4c43bf	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55ee-951d-431a-1dd074c1b4de	IE	IRL	372	Ireland 	Irska	\N
00040000-55ee-951d-432b-83d9973ec1e8	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55ee-951d-e113-880f75d8d8b7	IL	ISR	376	Israel 	Izrael	\N
00040000-55ee-951d-bc01-2807be77914a	IT	ITA	380	Italy 	Italija	\N
00040000-55ee-951d-f941-f6218e04b29a	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55ee-951d-a814-db0b51e5e00d	JP	JPN	392	Japan 	Japonska	\N
00040000-55ee-951d-eb7c-ed673818f872	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55ee-951d-c88f-a876046eb5e8	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55ee-951d-38c2-c5e723d04f03	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55ee-951d-4280-cf948a604386	KE	KEN	404	Kenya 	Kenija	\N
00040000-55ee-951d-99d8-6329aca4d198	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55ee-951d-a4e5-ef773771abaf	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55ee-951d-4097-1ee19f92fbfb	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55ee-951d-cc8f-b68cd30f5afc	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55ee-951d-302d-f30c87eafa0d	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55ee-951d-db13-166ac47b3a7d	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55ee-951d-be30-f8094e0e59d0	LV	LVA	428	Latvia 	Latvija	\N
00040000-55ee-951d-63ab-fad4b5048579	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55ee-951d-e8d7-006b8d29925e	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55ee-951d-8fc4-e9a8fd8ee58b	LR	LBR	430	Liberia 	Liberija	\N
00040000-55ee-951d-e7f3-8a81dba3327d	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55ee-951d-cfb6-97429872e61e	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55ee-951d-b720-60af976fb65e	LT	LTU	440	Lithuania 	Litva	\N
00040000-55ee-951d-7c23-57b6136c91d8	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55ee-951d-4261-1cd5ec3295ae	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55ee-951d-8910-b4c5e691122f	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55ee-951d-d74c-52cc2f63c5a2	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55ee-951d-e3cb-29c39bf7c547	MW	MWI	454	Malawi 	Malavi	\N
00040000-55ee-951d-68ea-7636bff4b18f	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55ee-951d-98dc-1b511d414f16	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55ee-951d-8a1b-23dff54d0c54	ML	MLI	466	Mali 	Mali	\N
00040000-55ee-951d-3562-5df2013fae41	MT	MLT	470	Malta 	Malta	\N
00040000-55ee-951d-838a-b3637afed14d	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55ee-951d-8ff3-2c616b174d87	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55ee-951d-062e-9438a7007a67	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55ee-951d-d133-d6a14cf48ca6	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55ee-951d-00d9-acf9e81402d0	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55ee-951d-d6dc-5b2a3521e79d	MX	MEX	484	Mexico 	Mehika	\N
00040000-55ee-951d-5f53-33c80f76170a	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55ee-951d-0327-ac9337b9a889	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55ee-951d-0cec-4150c1d0fe35	MC	MCO	492	Monaco 	Monako	\N
00040000-55ee-951d-94b8-7611d5720a43	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55ee-951d-d65e-2e632cbb02d3	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55ee-951d-a1fc-3f12748c7cfa	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55ee-951d-1b36-a81c1a7b268b	MA	MAR	504	Morocco 	Maroko	\N
00040000-55ee-951d-7273-8e5739bd4f21	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55ee-951d-ee94-048db1884103	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55ee-951d-3c15-9052b471d1ec	NA	NAM	516	Namibia 	Namibija	\N
00040000-55ee-951d-4bff-71aad7c4ce97	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55ee-951d-c5d1-d07f4ed80223	NP	NPL	524	Nepal 	Nepal	\N
00040000-55ee-951d-86a4-3b5ba93946ac	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55ee-951d-13b3-ea1dd1cc7db6	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55ee-951d-4e80-a181a7b7eea8	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55ee-951d-543c-264f0f9188d0	NE	NER	562	Niger 	Niger 	\N
00040000-55ee-951d-65e6-657feea1b1c8	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55ee-951d-b46b-cf3da577cc03	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55ee-951d-f337-d810296f091a	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55ee-951d-a353-d1197a0d33b2	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55ee-951d-8bc7-6ca8f84b23cb	NO	NOR	578	Norway 	Norveška	\N
00040000-55ee-951d-1132-3e2b65f6fcfe	OM	OMN	512	Oman 	Oman	\N
00040000-55ee-951d-787e-b782987357e8	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55ee-951d-4c2a-f25709c100b2	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55ee-951d-24b8-e05d38b5abed	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55ee-951d-510d-adf5c4d468f6	PA	PAN	591	Panama 	Panama	\N
00040000-55ee-951d-69b4-b9290456b27f	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55ee-951d-fd5e-a9408ef26d93	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55ee-951d-6783-1810e07e6d28	PE	PER	604	Peru 	Peru	\N
00040000-55ee-951d-e013-888d576f096a	PH	PHL	608	Philippines 	Filipini	\N
00040000-55ee-951d-49f3-d78cb786dab2	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55ee-951d-777c-602a669bfa65	PL	POL	616	Poland 	Poljska	\N
00040000-55ee-951d-3850-2b8151e78bba	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55ee-951d-1a32-788c7a25693e	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55ee-951d-7747-3f5458b1182d	QA	QAT	634	Qatar 	Katar	\N
00040000-55ee-951d-3669-596374cef0e2	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55ee-951d-64ed-d22ddb410ad3	RO	ROU	642	Romania 	Romunija	\N
00040000-55ee-951d-8221-f015cf5369ad	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55ee-951d-06c2-1226d39cd943	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55ee-951d-482d-dc821e61ec87	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55ee-951d-84f0-25a5a3b8946f	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55ee-951d-56fb-461228e9a71b	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55ee-951d-d57b-7f12827bf1c1	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55ee-951d-c594-5af4bbe02b7f	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55ee-951d-17a5-1728e15566fe	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55ee-951d-831c-854d00c7e96e	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55ee-951d-ea7b-52f99ca4aacb	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55ee-951d-42fb-c11d8d49ea0b	SM	SMR	674	San Marino 	San Marino	\N
00040000-55ee-951d-7f9b-0515f0c63282	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55ee-951d-7f99-c1977f83dece	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55ee-951d-e6a6-e4e52c3ca8c3	SN	SEN	686	Senegal 	Senegal	\N
00040000-55ee-951d-a0d8-988ef960f8e4	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55ee-951d-cc7f-68283cac3db0	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55ee-951d-54e8-92d12e3bab36	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55ee-951d-42ee-07854c534007	SG	SGP	702	Singapore 	Singapur	\N
00040000-55ee-951d-a114-a12bb996ed97	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55ee-951d-aa73-12efe17ffaa6	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55ee-951d-b9a2-fe22c232dbc2	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55ee-951d-44c8-3a496d34afdb	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55ee-951d-f631-cbee345774f4	SO	SOM	706	Somalia 	Somalija	\N
00040000-55ee-951d-a872-01e31dd1c9a4	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55ee-951d-01de-bb5be443f79b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55ee-951d-319a-29cf2594ac60	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55ee-951d-e608-d24e4355976e	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55ee-951d-d608-62de077ed10f	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55ee-951d-ee9f-67d2d9681a7b	SD	SDN	729	Sudan 	Sudan	\N
00040000-55ee-951d-471e-0383beda87ca	SR	SUR	740	Suriname 	Surinam	\N
00040000-55ee-951d-ba92-e12450f1dba6	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55ee-951d-4d9d-5b8ebce66d68	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55ee-951d-62fd-7b7e88d21d21	SE	SWE	752	Sweden 	Švedska	\N
00040000-55ee-951d-9fa4-37b2b96e972d	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55ee-951d-e85f-e45d214e4739	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55ee-951d-7136-9c05592b7974	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55ee-951d-8b6b-07232f37f58f	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55ee-951d-bcc7-ed1bb19d8167	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55ee-951d-58c0-25318a946f54	TH	THA	764	Thailand 	Tajska	\N
00040000-55ee-951d-57e3-525b4e69b34f	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55ee-951d-39e3-c45b94d5d03d	TG	TGO	768	Togo 	Togo	\N
00040000-55ee-951d-470d-fa95a7b99150	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55ee-951d-9938-dc92b2c5e985	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55ee-951d-e516-c7ac79395e1e	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55ee-951d-31eb-2b2491436bfe	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55ee-951d-ca64-76adc450a184	TR	TUR	792	Turkey 	Turčija	\N
00040000-55ee-951d-bdd9-c22fb390f989	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55ee-951d-b644-3f01ce735fad	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55ee-951d-50ad-a7f2e2261f3d	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55ee-951d-fe1f-3d104d43a7b1	UG	UGA	800	Uganda 	Uganda	\N
00040000-55ee-951d-df32-d8329a7fa7d0	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55ee-951d-3481-e4dd059e13de	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55ee-951d-291d-195fcc7e9b9a	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55ee-951d-4bf9-4570c2ffc52b	US	USA	840	United States 	Združene države Amerike	\N
00040000-55ee-951d-e5e6-9c1aa5c8bf64	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55ee-951d-6617-681adfcfd912	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55ee-951d-81f9-f2587ae3a29c	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55ee-951d-c320-81e6244c1850	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55ee-951d-c85e-02a143e25521	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55ee-951d-db93-6e9328cdd214	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55ee-951d-c776-c616d821d167	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55ee-951d-4685-09c4667c2070	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55ee-951d-3020-05ba2f220f50	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55ee-951d-60c1-929710d391aa	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55ee-951d-c847-24628689bad9	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55ee-951d-92a5-c3c21ccc0ee2	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55ee-951d-c896-d9633f13f8e4	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2955 (class 0 OID 17805318)
-- Dependencies: 226
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55ee-951f-6d2d-1c31ac7e42b6	000e0000-55ee-951f-82b4-6c5cd4860a5f	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ee-951d-1e93-a129ec956507	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55ee-951f-a399-9109bad8fbb9	000e0000-55ee-951f-40b0-3b16e005149c	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ee-951d-6b9c-03ea51e9a5d4	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55ee-951f-6336-bc006a861d6f	000e0000-55ee-951f-eacd-74a22ade5fc8	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ee-951d-1e93-a129ec956507	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55ee-951f-a4ff-4a97f5dbaaa3	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55ee-951f-cdff-35aec44d342a	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2941 (class 0 OID 17805129)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55ee-951f-994a-539dac4cd29d	000e0000-55ee-951f-40b0-3b16e005149c	000c0000-55ee-951f-d731-cf554302aa92	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55ee-951d-3d98-93f76913815c
000d0000-55ee-951f-80b2-6978d526ae62	000e0000-55ee-951f-40b0-3b16e005149c	000c0000-55ee-951f-dbaf-c1becbc92f9c	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55ee-951d-8629-33b78d5008ae
000d0000-55ee-951f-0179-126fa3e6d338	000e0000-55ee-951f-40b0-3b16e005149c	000c0000-55ee-951f-aee9-aed64b4a9abb	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55ee-951d-74d9-27a060df3d7a
000d0000-55ee-951f-b5b9-4e8ebd59590b	000e0000-55ee-951f-40b0-3b16e005149c	000c0000-55ee-951f-cdac-82ab10015bdd	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55ee-951d-5913-f46a2cf088a2
000d0000-55ee-951f-7b7a-16efdfda1408	000e0000-55ee-951f-40b0-3b16e005149c	000c0000-55ee-951f-f30e-81bd03becb9d	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55ee-951d-5913-f46a2cf088a2
000d0000-55ee-951f-9e3d-f165792104f7	000e0000-55ee-951f-40b0-3b16e005149c	000c0000-55ee-951f-0462-cd9af34c7993	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55ee-951d-3d98-93f76913815c
000d0000-55ee-951f-6ae9-d88a86e9afe7	000e0000-55ee-951f-40b0-3b16e005149c	000c0000-55ee-951f-12b2-339f846035fa	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55ee-951d-3d98-93f76913815c
000d0000-55ee-951f-3f9f-bae358c6c684	000e0000-55ee-951f-40b0-3b16e005149c	000c0000-55ee-951f-4c6b-e228e91f1daf	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55ee-951d-e410-01a61970ef16
\.


--
-- TOC entry 2921 (class 0 OID 17804944)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2919 (class 0 OID 17804925)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55ee-951f-1f0d-5d6228938cc3	00080000-55ee-951e-e034-1fc480052f84	00090000-55ee-951f-9930-a7321a46be64	AK		igralka
\.


--
-- TOC entry 2930 (class 0 OID 17805043)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 17805510)
-- Dependencies: 236
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 17805522)
-- Dependencies: 237
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 17805544)
-- Dependencies: 239
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 17805068)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 17804882)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55ee-951d-ce7b-2153a70cfddb	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55ee-951d-df1a-1c7144c83521	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55ee-951d-611a-5241c239528b	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55ee-951d-de88-0f8b05034e70	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55ee-951d-f404-4a7ab61fb0cc	dogodek.status	array	a:7:{i:100;a:1:{s:5:"label";s:11:"Dolgoročno";}i:200;a:1:{s:5:"label";s:9:"Planirano";}i:300;a:1:{s:5:"label";s:8:"Fiksiran";}i:400;a:1:{s:5:"label";s:17:"Potrjen - interno";}i:500;a:1:{s:5:"label";s:15:"Potrjen - javno";}i:600;a:1:{s:5:"label";s:10:"Zaključen";}i:700;a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55ee-951d-c31f-5687b250b6ff	dogodek.razred	array	a:5:{i:100;a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}i:200;a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}i:300;a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}i:400;a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}i:500;a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55ee-951d-1447-f2bd23061fae	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55ee-951d-d9ce-a2c4eb959638	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55ee-951d-b12d-94ec32ffa2da	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55ee-951d-0303-2d19303d4c8a	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55ee-951d-afc8-b3c53591b207	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55ee-951d-cee2-6437a8982dd7	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55ee-951d-ad88-45ea6038ea95	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55ee-951d-f655-31a1e4e26ca9	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55ee-951f-2efd-dae51628a90a	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55ee-951f-046d-434f393cfd37	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55ee-951f-1199-0ba91904547e	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55ee-951f-981e-fa85e40efd8a	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55ee-951f-9b71-369bd37f6039	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55ee-9520-97dc-d21a7aa23032	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2910 (class 0 OID 17804796)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55ee-951f-98d0-27e6970076b3	00000000-55ee-951f-2efd-dae51628a90a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55ee-951f-667e-8ccd481435f4	00000000-55ee-951f-2efd-dae51628a90a	00010000-55ee-951d-48cc-e443067c268d	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55ee-951f-8b30-c41b59e7121c	00000000-55ee-951f-046d-434f393cfd37	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2911 (class 0 OID 17804807)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55ee-951f-4663-d815b2c261b0	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55ee-951f-26f0-7071bcf72040	00010000-55ee-951f-4566-772c0f01f3a2	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55ee-951f-6ff1-e29df874dc8a	00010000-55ee-951f-e7c2-38648acabdeb	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55ee-951f-84d2-719f41815f80	00010000-55ee-951f-7027-45aac9092971	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55ee-951f-3e38-c2aadef38828	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55ee-951f-2e17-616716776d45	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55ee-951f-aee5-4ca24d29ffdc	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55ee-951f-a398-5dede714486f	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55ee-951f-9930-a7321a46be64	00010000-55ee-951f-bdb7-e3bbc516e852	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55ee-951f-d4ba-be3c6fdfec67	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55ee-951f-4dd8-3a7b16ebf76a	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55ee-951f-a3d7-55315b10164d	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55ee-951f-d0b3-e02f46b89c8c	00010000-55ee-951f-7516-e98576cd1536	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2906 (class 0 OID 17804761)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55ee-951d-9042-fb9d7d97a319	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55ee-951d-925a-14cfe05020b6	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55ee-951d-d156-52651fbcfcbd	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55ee-951d-6ccc-2d55a1e00c1f	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55ee-951d-f0dd-0220f12620de	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55ee-951d-6977-bee256668087	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55ee-951d-30ad-88a19009e5d1	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55ee-951d-091f-4d39cfa67ed6	Abonma-read	Abonma - branje	f
00030000-55ee-951d-62ce-a2cc010f3c38	Abonma-write	Abonma - spreminjanje	f
00030000-55ee-951d-7a63-208bc66bebd0	Alternacija-read	Alternacija - branje	f
00030000-55ee-951d-7ea4-dd71d475dabb	Alternacija-write	Alternacija - spreminjanje	f
00030000-55ee-951d-3917-a94719341d0d	Arhivalija-read	Arhivalija - branje	f
00030000-55ee-951d-1128-b81eb9d7bcd0	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55ee-951d-b12b-43806ee86a42	Besedilo-read	Besedilo - branje	f
00030000-55ee-951d-0025-4e70d64d8b92	Besedilo-write	Besedilo - spreminjanje	f
00030000-55ee-951d-057b-bbb6d8a31641	DogodekIzven-read	DogodekIzven - branje	f
00030000-55ee-951d-44f3-83ad255ad868	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55ee-951d-6f6e-64422cedffd6	Dogodek-read	Dogodek - branje	f
00030000-55ee-951d-fbdf-cbe8947207be	Dogodek-write	Dogodek - spreminjanje	f
00030000-55ee-951d-8afd-72d9758cc1b1	DrugiVir-read	DrugiVir - branje	f
00030000-55ee-951d-cf52-4c4f5888f071	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55ee-951d-d58f-6cb1c47ebca0	Drzava-read	Drzava - branje	f
00030000-55ee-951d-74bb-85cb526d9b46	Drzava-write	Drzava - spreminjanje	f
00030000-55ee-951d-f7ec-aab8f2f94e03	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55ee-951d-4591-85a43a320d1b	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55ee-951d-f7d7-e6f45773e526	Funkcija-read	Funkcija - branje	f
00030000-55ee-951d-8161-0ad482ddcd6c	Funkcija-write	Funkcija - spreminjanje	f
00030000-55ee-951d-4ac2-3929f3608f5b	Gostovanje-read	Gostovanje - branje	f
00030000-55ee-951d-aa53-24f03dd50739	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55ee-951d-22e6-f5d72c722059	Gostujoca-read	Gostujoca - branje	f
00030000-55ee-951d-afc2-acb9617c08d2	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55ee-951d-d3bd-5751860177bc	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55ee-951d-2568-60cce57aece5	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55ee-951d-cf15-33c7c595b179	Kupec-read	Kupec - branje	f
00030000-55ee-951d-403d-7790f1cc9209	Kupec-write	Kupec - spreminjanje	f
00030000-55ee-951d-4bfc-4d1848dbbc1d	NacinPlacina-read	NacinPlacina - branje	f
00030000-55ee-951d-fa45-ed959a73123c	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55ee-951d-1f69-c3be8c6c328b	Option-read	Option - branje	f
00030000-55ee-951d-2331-bd9e1307193c	Option-write	Option - spreminjanje	f
00030000-55ee-951d-a945-25e0b89b1cb5	OptionValue-read	OptionValue - branje	f
00030000-55ee-951d-1158-11cf49a7dcae	OptionValue-write	OptionValue - spreminjanje	f
00030000-55ee-951d-0591-e5f8d5bfcb6c	Oseba-read	Oseba - branje	f
00030000-55ee-951d-3746-851088105787	Oseba-write	Oseba - spreminjanje	f
00030000-55ee-951d-5b6b-ad17aae64004	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55ee-951d-aa5c-8e13c7ab186a	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55ee-951d-b105-005411c6924d	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55ee-951d-1e8c-9650dff31a6f	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55ee-951d-558f-4ef4bb246028	Pogodba-read	Pogodba - branje	f
00030000-55ee-951d-83e6-cf2abe7a2c90	Pogodba-write	Pogodba - spreminjanje	f
00030000-55ee-951d-f3b0-60d07527a2d5	Popa-read	Popa - branje	f
00030000-55ee-951d-9c0b-320795db8c99	Popa-write	Popa - spreminjanje	f
00030000-55ee-951d-6b22-ef9c57845472	Posta-read	Posta - branje	f
00030000-55ee-951d-522e-127ffcc7c7c5	Posta-write	Posta - spreminjanje	f
00030000-55ee-951d-f750-7c19fd50e42d	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55ee-951d-e468-722dfc7874be	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55ee-951d-d05f-dd9c4d36982a	PostniNaslov-read	PostniNaslov - branje	f
00030000-55ee-951d-a3e2-cccab957c640	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55ee-951d-9317-7fd4cba14487	Predstava-read	Predstava - branje	f
00030000-55ee-951d-ce9e-79895359b170	Predstava-write	Predstava - spreminjanje	f
00030000-55ee-951d-0391-abed448fbc06	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55ee-951d-c025-cba98db4672f	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55ee-951d-a5bf-b0cc0244f49a	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55ee-951d-27ee-3b4da59aef40	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55ee-951d-071b-a19c07395248	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55ee-951d-0997-33ed5ffb1271	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55ee-951d-4d0d-d212ebf1594f	ProgramDela-read	ProgramDela - branje	f
00030000-55ee-951d-795e-12822c6cc777	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55ee-951d-312e-c3abaa9f47b7	ProgramFestival-read	ProgramFestival - branje	f
00030000-55ee-951d-a274-784ca5979f97	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55ee-951d-953d-e78f6ce399d5	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55ee-951d-dec7-d641957dc56f	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55ee-951d-3b8f-4919bb662536	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55ee-951d-0627-f9bc38c64d46	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55ee-951d-fd8c-7e5011575d13	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55ee-951d-cb4f-d15226eb48f5	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55ee-951d-075e-af58d90ba038	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55ee-951d-2302-ac41893ecf39	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55ee-951d-58d8-720682319a07	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55ee-951d-790a-495ec0b42c1f	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55ee-951d-3386-668e7ebde6d7	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55ee-951d-5fc2-c4678f0bed93	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55ee-951d-d887-27d5c19890e9	ProgramRazno-read	ProgramRazno - branje	f
00030000-55ee-951d-2738-866ba81b85a0	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55ee-951d-3b67-3556dfbae5b7	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55ee-951d-f737-3c3c76a54d40	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55ee-951d-523c-9e85304d3ddc	Prostor-read	Prostor - branje	f
00030000-55ee-951d-2fea-053f006128ff	Prostor-write	Prostor - spreminjanje	f
00030000-55ee-951d-7ed8-0d56af6c48ab	Racun-read	Racun - branje	f
00030000-55ee-951d-3568-7a4f7d193b64	Racun-write	Racun - spreminjanje	f
00030000-55ee-951d-df25-b8f1ece0a1d8	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55ee-951d-cd40-41457a832e41	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55ee-951d-bbb3-a970a0e07745	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55ee-951d-b6e8-155d4ccc7785	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55ee-951d-e5aa-fe7d5ae7c421	Rekvizit-read	Rekvizit - branje	f
00030000-55ee-951d-2b15-12fbcc4f5e14	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55ee-951d-e805-e38db5d02b78	Revizija-read	Revizija - branje	f
00030000-55ee-951d-49ca-58ef185a0c45	Revizija-write	Revizija - spreminjanje	f
00030000-55ee-951d-7f2f-2d408300e01d	Rezervacija-read	Rezervacija - branje	f
00030000-55ee-951d-ab3e-c69c3c1aca15	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55ee-951d-bac1-82f50f3d95cd	SedezniRed-read	SedezniRed - branje	f
00030000-55ee-951d-0252-f2b8c751f50c	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55ee-951d-ad74-334187c57808	Sedez-read	Sedez - branje	f
00030000-55ee-951d-3582-8c46ad97bc3e	Sedez-write	Sedez - spreminjanje	f
00030000-55ee-951d-62b3-0d82505e724d	Sezona-read	Sezona - branje	f
00030000-55ee-951d-9f9d-c29c1d781474	Sezona-write	Sezona - spreminjanje	f
00030000-55ee-951d-300a-5b3fc6d83e26	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55ee-951d-1048-abe3d4448693	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55ee-951d-1435-f42adcd28e6b	Stevilcenje-read	Stevilcenje - branje	f
00030000-55ee-951d-dddd-406bd62d21c2	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55ee-951d-2a2b-ea86b9a2a609	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55ee-951d-b13b-5a124bfcde7f	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55ee-951d-59e4-17160d257b27	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55ee-951d-3779-39bf90e9bb86	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55ee-951d-067e-94d61f23288d	Telefonska-read	Telefonska - branje	f
00030000-55ee-951d-39e2-97916788f793	Telefonska-write	Telefonska - spreminjanje	f
00030000-55ee-951d-ed6c-bb81401d3a1f	TerminStoritve-read	TerminStoritve - branje	f
00030000-55ee-951d-f566-30b5a1244685	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55ee-951d-067a-0edbd19673cb	TipFunkcije-read	TipFunkcije - branje	f
00030000-55ee-951d-d3f8-4f2224d822de	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55ee-951d-e41a-f211a903a3a3	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55ee-951d-0682-1cef592b583e	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55ee-951d-cf28-a072ff8cffb0	Trr-read	Trr - branje	f
00030000-55ee-951d-b9e0-7e91aca153cb	Trr-write	Trr - spreminjanje	f
00030000-55ee-951d-05f5-9d1b9da20a60	Uprizoritev-read	Uprizoritev - branje	f
00030000-55ee-951d-0316-099a0742b4e5	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55ee-951d-39fa-bf2cac9fcd20	Vaja-read	Vaja - branje	f
00030000-55ee-951d-7e54-7e44e995be53	Vaja-write	Vaja - spreminjanje	f
00030000-55ee-951d-cb82-765d1378eddb	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55ee-951d-55fe-5c28153a239b	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55ee-951d-b539-36bdac9beec9	VrstaStroska-read	VrstaStroska - branje	f
00030000-55ee-951d-709b-c72948ef6756	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55ee-951d-d65a-2522bb873481	Zaposlitev-read	Zaposlitev - branje	f
00030000-55ee-951d-fa83-f2526c15c957	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55ee-951d-5e38-5c9bf3bd0ff3	Zasedenost-read	Zasedenost - branje	f
00030000-55ee-951d-ee34-dfcbcb7b44e2	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55ee-951d-814a-7d01a847a9f7	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55ee-951d-6bdb-f2a6db01244f	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55ee-951d-46f1-051930345bb9	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55ee-951d-916b-b07505a0da2a	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55ee-951d-2b28-bd44af30631c	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55ee-951d-92dd-345f44f9d03d	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55ee-951d-dc25-1112c76ffe0f	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55ee-951d-5f12-80325dc45533	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55ee-951d-ea41-7c2337253f45	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55ee-951d-ccba-49d46481c285	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55ee-951d-f444-5a141ca24f99	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55ee-951d-cac7-bb388252b5d3	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55ee-951d-42ae-e8d97014e1ea	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55ee-951d-f528-6291a076f385	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55ee-951d-b01e-14c1d9e816ab	Datoteka-write	Datoteka - spreminjanje	f
00030000-55ee-951d-3186-54b4f3941999	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2908 (class 0 OID 17804780)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55ee-951d-03e4-9c7be9bd95d2	00030000-55ee-951d-925a-14cfe05020b6
00020000-55ee-951d-3033-677cb4b07bd2	00030000-55ee-951d-d58f-6cb1c47ebca0
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-091f-4d39cfa67ed6
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-62ce-a2cc010f3c38
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-7a63-208bc66bebd0
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-7ea4-dd71d475dabb
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-3917-a94719341d0d
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-6f6e-64422cedffd6
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-6ccc-2d55a1e00c1f
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-fbdf-cbe8947207be
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-d58f-6cb1c47ebca0
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-74bb-85cb526d9b46
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-f7d7-e6f45773e526
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-8161-0ad482ddcd6c
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-4ac2-3929f3608f5b
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-aa53-24f03dd50739
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-22e6-f5d72c722059
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-afc2-acb9617c08d2
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-d3bd-5751860177bc
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-2568-60cce57aece5
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-1f69-c3be8c6c328b
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-a945-25e0b89b1cb5
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-0591-e5f8d5bfcb6c
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-3746-851088105787
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-f3b0-60d07527a2d5
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-9c0b-320795db8c99
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-6b22-ef9c57845472
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-522e-127ffcc7c7c5
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-d05f-dd9c4d36982a
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-a3e2-cccab957c640
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-9317-7fd4cba14487
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-ce9e-79895359b170
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-071b-a19c07395248
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-0997-33ed5ffb1271
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-523c-9e85304d3ddc
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-2fea-053f006128ff
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-bbb3-a970a0e07745
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-b6e8-155d4ccc7785
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-e5aa-fe7d5ae7c421
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-2b15-12fbcc4f5e14
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-62b3-0d82505e724d
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-9f9d-c29c1d781474
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-067a-0edbd19673cb
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-05f5-9d1b9da20a60
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-0316-099a0742b4e5
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-39fa-bf2cac9fcd20
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-7e54-7e44e995be53
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-5e38-5c9bf3bd0ff3
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-ee34-dfcbcb7b44e2
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-814a-7d01a847a9f7
00020000-55ee-951d-0e44-2cd3d48017fc	00030000-55ee-951d-46f1-051930345bb9
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-091f-4d39cfa67ed6
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-3917-a94719341d0d
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-6f6e-64422cedffd6
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-d58f-6cb1c47ebca0
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-4ac2-3929f3608f5b
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-22e6-f5d72c722059
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-d3bd-5751860177bc
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-2568-60cce57aece5
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-1f69-c3be8c6c328b
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-a945-25e0b89b1cb5
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-0591-e5f8d5bfcb6c
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-3746-851088105787
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-f3b0-60d07527a2d5
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-6b22-ef9c57845472
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-d05f-dd9c4d36982a
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-a3e2-cccab957c640
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-9317-7fd4cba14487
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-523c-9e85304d3ddc
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-bbb3-a970a0e07745
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-e5aa-fe7d5ae7c421
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-62b3-0d82505e724d
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-067e-94d61f23288d
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-39e2-97916788f793
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-cf28-a072ff8cffb0
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-b9e0-7e91aca153cb
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-d65a-2522bb873481
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-fa83-f2526c15c957
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-814a-7d01a847a9f7
00020000-55ee-951d-4c71-34f222c9c4d8	00030000-55ee-951d-46f1-051930345bb9
00020000-55ee-951d-43d0-19166c6f2944	00030000-55ee-951d-091f-4d39cfa67ed6
00020000-55ee-951d-43d0-19166c6f2944	00030000-55ee-951d-7a63-208bc66bebd0
00020000-55ee-951d-43d0-19166c6f2944	00030000-55ee-951d-3917-a94719341d0d
00020000-55ee-951d-43d0-19166c6f2944	00030000-55ee-951d-1128-b81eb9d7bcd0
00020000-55ee-951d-43d0-19166c6f2944	00030000-55ee-951d-b12b-43806ee86a42
00020000-55ee-951d-43d0-19166c6f2944	00030000-55ee-951d-057b-bbb6d8a31641
00020000-55ee-951d-43d0-19166c6f2944	00030000-55ee-951d-6f6e-64422cedffd6
00020000-55ee-951d-43d0-19166c6f2944	00030000-55ee-951d-d58f-6cb1c47ebca0
00020000-55ee-951d-43d0-19166c6f2944	00030000-55ee-951d-f7d7-e6f45773e526
00020000-55ee-951d-43d0-19166c6f2944	00030000-55ee-951d-4ac2-3929f3608f5b
00020000-55ee-951d-43d0-19166c6f2944	00030000-55ee-951d-22e6-f5d72c722059
00020000-55ee-951d-43d0-19166c6f2944	00030000-55ee-951d-d3bd-5751860177bc
00020000-55ee-951d-43d0-19166c6f2944	00030000-55ee-951d-1f69-c3be8c6c328b
00020000-55ee-951d-43d0-19166c6f2944	00030000-55ee-951d-a945-25e0b89b1cb5
00020000-55ee-951d-43d0-19166c6f2944	00030000-55ee-951d-0591-e5f8d5bfcb6c
00020000-55ee-951d-43d0-19166c6f2944	00030000-55ee-951d-f3b0-60d07527a2d5
00020000-55ee-951d-43d0-19166c6f2944	00030000-55ee-951d-6b22-ef9c57845472
00020000-55ee-951d-43d0-19166c6f2944	00030000-55ee-951d-9317-7fd4cba14487
00020000-55ee-951d-43d0-19166c6f2944	00030000-55ee-951d-071b-a19c07395248
00020000-55ee-951d-43d0-19166c6f2944	00030000-55ee-951d-523c-9e85304d3ddc
00020000-55ee-951d-43d0-19166c6f2944	00030000-55ee-951d-bbb3-a970a0e07745
00020000-55ee-951d-43d0-19166c6f2944	00030000-55ee-951d-e5aa-fe7d5ae7c421
00020000-55ee-951d-43d0-19166c6f2944	00030000-55ee-951d-62b3-0d82505e724d
00020000-55ee-951d-43d0-19166c6f2944	00030000-55ee-951d-067a-0edbd19673cb
00020000-55ee-951d-43d0-19166c6f2944	00030000-55ee-951d-39fa-bf2cac9fcd20
00020000-55ee-951d-43d0-19166c6f2944	00030000-55ee-951d-5e38-5c9bf3bd0ff3
00020000-55ee-951d-43d0-19166c6f2944	00030000-55ee-951d-814a-7d01a847a9f7
00020000-55ee-951d-43d0-19166c6f2944	00030000-55ee-951d-46f1-051930345bb9
00020000-55ee-951d-e6fb-fac30986b7b8	00030000-55ee-951d-091f-4d39cfa67ed6
00020000-55ee-951d-e6fb-fac30986b7b8	00030000-55ee-951d-62ce-a2cc010f3c38
00020000-55ee-951d-e6fb-fac30986b7b8	00030000-55ee-951d-7ea4-dd71d475dabb
00020000-55ee-951d-e6fb-fac30986b7b8	00030000-55ee-951d-3917-a94719341d0d
00020000-55ee-951d-e6fb-fac30986b7b8	00030000-55ee-951d-6f6e-64422cedffd6
00020000-55ee-951d-e6fb-fac30986b7b8	00030000-55ee-951d-d58f-6cb1c47ebca0
00020000-55ee-951d-e6fb-fac30986b7b8	00030000-55ee-951d-4ac2-3929f3608f5b
00020000-55ee-951d-e6fb-fac30986b7b8	00030000-55ee-951d-22e6-f5d72c722059
00020000-55ee-951d-e6fb-fac30986b7b8	00030000-55ee-951d-1f69-c3be8c6c328b
00020000-55ee-951d-e6fb-fac30986b7b8	00030000-55ee-951d-a945-25e0b89b1cb5
00020000-55ee-951d-e6fb-fac30986b7b8	00030000-55ee-951d-f3b0-60d07527a2d5
00020000-55ee-951d-e6fb-fac30986b7b8	00030000-55ee-951d-6b22-ef9c57845472
00020000-55ee-951d-e6fb-fac30986b7b8	00030000-55ee-951d-9317-7fd4cba14487
00020000-55ee-951d-e6fb-fac30986b7b8	00030000-55ee-951d-523c-9e85304d3ddc
00020000-55ee-951d-e6fb-fac30986b7b8	00030000-55ee-951d-bbb3-a970a0e07745
00020000-55ee-951d-e6fb-fac30986b7b8	00030000-55ee-951d-e5aa-fe7d5ae7c421
00020000-55ee-951d-e6fb-fac30986b7b8	00030000-55ee-951d-62b3-0d82505e724d
00020000-55ee-951d-e6fb-fac30986b7b8	00030000-55ee-951d-067a-0edbd19673cb
00020000-55ee-951d-e6fb-fac30986b7b8	00030000-55ee-951d-814a-7d01a847a9f7
00020000-55ee-951d-e6fb-fac30986b7b8	00030000-55ee-951d-46f1-051930345bb9
00020000-55ee-951d-feb2-2d78323c14e1	00030000-55ee-951d-091f-4d39cfa67ed6
00020000-55ee-951d-feb2-2d78323c14e1	00030000-55ee-951d-3917-a94719341d0d
00020000-55ee-951d-feb2-2d78323c14e1	00030000-55ee-951d-6f6e-64422cedffd6
00020000-55ee-951d-feb2-2d78323c14e1	00030000-55ee-951d-d58f-6cb1c47ebca0
00020000-55ee-951d-feb2-2d78323c14e1	00030000-55ee-951d-4ac2-3929f3608f5b
00020000-55ee-951d-feb2-2d78323c14e1	00030000-55ee-951d-22e6-f5d72c722059
00020000-55ee-951d-feb2-2d78323c14e1	00030000-55ee-951d-1f69-c3be8c6c328b
00020000-55ee-951d-feb2-2d78323c14e1	00030000-55ee-951d-a945-25e0b89b1cb5
00020000-55ee-951d-feb2-2d78323c14e1	00030000-55ee-951d-f3b0-60d07527a2d5
00020000-55ee-951d-feb2-2d78323c14e1	00030000-55ee-951d-6b22-ef9c57845472
00020000-55ee-951d-feb2-2d78323c14e1	00030000-55ee-951d-9317-7fd4cba14487
00020000-55ee-951d-feb2-2d78323c14e1	00030000-55ee-951d-523c-9e85304d3ddc
00020000-55ee-951d-feb2-2d78323c14e1	00030000-55ee-951d-bbb3-a970a0e07745
00020000-55ee-951d-feb2-2d78323c14e1	00030000-55ee-951d-e5aa-fe7d5ae7c421
00020000-55ee-951d-feb2-2d78323c14e1	00030000-55ee-951d-62b3-0d82505e724d
00020000-55ee-951d-feb2-2d78323c14e1	00030000-55ee-951d-ed6c-bb81401d3a1f
00020000-55ee-951d-feb2-2d78323c14e1	00030000-55ee-951d-d156-52651fbcfcbd
00020000-55ee-951d-feb2-2d78323c14e1	00030000-55ee-951d-067a-0edbd19673cb
00020000-55ee-951d-feb2-2d78323c14e1	00030000-55ee-951d-814a-7d01a847a9f7
00020000-55ee-951d-feb2-2d78323c14e1	00030000-55ee-951d-46f1-051930345bb9
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-9042-fb9d7d97a319
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-925a-14cfe05020b6
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-d156-52651fbcfcbd
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-6ccc-2d55a1e00c1f
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-f0dd-0220f12620de
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-6977-bee256668087
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-30ad-88a19009e5d1
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-091f-4d39cfa67ed6
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-62ce-a2cc010f3c38
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-7a63-208bc66bebd0
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-7ea4-dd71d475dabb
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-3917-a94719341d0d
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-1128-b81eb9d7bcd0
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-b12b-43806ee86a42
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-0025-4e70d64d8b92
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-057b-bbb6d8a31641
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-44f3-83ad255ad868
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-6f6e-64422cedffd6
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-fbdf-cbe8947207be
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-d58f-6cb1c47ebca0
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-74bb-85cb526d9b46
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-8afd-72d9758cc1b1
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-cf52-4c4f5888f071
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-f7ec-aab8f2f94e03
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-4591-85a43a320d1b
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-f7d7-e6f45773e526
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-8161-0ad482ddcd6c
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-4ac2-3929f3608f5b
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-aa53-24f03dd50739
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-22e6-f5d72c722059
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-afc2-acb9617c08d2
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-d3bd-5751860177bc
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-2568-60cce57aece5
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-cf15-33c7c595b179
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-403d-7790f1cc9209
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-4bfc-4d1848dbbc1d
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-fa45-ed959a73123c
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-1f69-c3be8c6c328b
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-2331-bd9e1307193c
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-a945-25e0b89b1cb5
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-1158-11cf49a7dcae
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-0591-e5f8d5bfcb6c
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-3746-851088105787
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-5b6b-ad17aae64004
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-aa5c-8e13c7ab186a
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-b105-005411c6924d
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-1e8c-9650dff31a6f
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-558f-4ef4bb246028
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-83e6-cf2abe7a2c90
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-f3b0-60d07527a2d5
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-9c0b-320795db8c99
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-6b22-ef9c57845472
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-522e-127ffcc7c7c5
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-f750-7c19fd50e42d
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-e468-722dfc7874be
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-d05f-dd9c4d36982a
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-a3e2-cccab957c640
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-9317-7fd4cba14487
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-ce9e-79895359b170
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-0391-abed448fbc06
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-c025-cba98db4672f
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-a5bf-b0cc0244f49a
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-27ee-3b4da59aef40
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-071b-a19c07395248
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-0997-33ed5ffb1271
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-4d0d-d212ebf1594f
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-795e-12822c6cc777
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-312e-c3abaa9f47b7
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-a274-784ca5979f97
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-953d-e78f6ce399d5
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-dec7-d641957dc56f
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-3b8f-4919bb662536
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-0627-f9bc38c64d46
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-fd8c-7e5011575d13
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-cb4f-d15226eb48f5
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-075e-af58d90ba038
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-2302-ac41893ecf39
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-58d8-720682319a07
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-790a-495ec0b42c1f
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-3386-668e7ebde6d7
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-5fc2-c4678f0bed93
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-d887-27d5c19890e9
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-2738-866ba81b85a0
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-3b67-3556dfbae5b7
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-f737-3c3c76a54d40
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-523c-9e85304d3ddc
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-2fea-053f006128ff
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-7ed8-0d56af6c48ab
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-3568-7a4f7d193b64
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-df25-b8f1ece0a1d8
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-cd40-41457a832e41
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-bbb3-a970a0e07745
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-b6e8-155d4ccc7785
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-e5aa-fe7d5ae7c421
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-2b15-12fbcc4f5e14
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-e805-e38db5d02b78
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-49ca-58ef185a0c45
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-7f2f-2d408300e01d
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-ab3e-c69c3c1aca15
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-bac1-82f50f3d95cd
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-0252-f2b8c751f50c
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-ad74-334187c57808
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-3582-8c46ad97bc3e
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-62b3-0d82505e724d
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-9f9d-c29c1d781474
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-300a-5b3fc6d83e26
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-1048-abe3d4448693
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-1435-f42adcd28e6b
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-dddd-406bd62d21c2
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-2a2b-ea86b9a2a609
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-b13b-5a124bfcde7f
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-59e4-17160d257b27
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-3779-39bf90e9bb86
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-067e-94d61f23288d
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-39e2-97916788f793
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-ed6c-bb81401d3a1f
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-f566-30b5a1244685
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-067a-0edbd19673cb
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-d3f8-4f2224d822de
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-e41a-f211a903a3a3
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-0682-1cef592b583e
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-cf28-a072ff8cffb0
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-b9e0-7e91aca153cb
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-05f5-9d1b9da20a60
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-0316-099a0742b4e5
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-39fa-bf2cac9fcd20
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-7e54-7e44e995be53
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-cb82-765d1378eddb
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-55fe-5c28153a239b
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-b539-36bdac9beec9
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-709b-c72948ef6756
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-d65a-2522bb873481
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-fa83-f2526c15c957
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-5e38-5c9bf3bd0ff3
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-ee34-dfcbcb7b44e2
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-814a-7d01a847a9f7
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-6bdb-f2a6db01244f
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-46f1-051930345bb9
00020000-55ee-951e-d672-e3cb10645f82	00030000-55ee-951d-916b-b07505a0da2a
\.


--
-- TOC entry 2935 (class 0 OID 17805075)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 17805109)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 17805237)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55ee-951f-71f0-d63f66020568	00090000-55ee-951f-4663-d815b2c261b0	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55ee-951f-aa2b-112176a1ced5	00090000-55ee-951f-2e17-616716776d45	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55ee-951f-cd10-85171f974127	00090000-55ee-951f-d0b3-e02f46b89c8c	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2913 (class 0 OID 17804840)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55ee-951e-e034-1fc480052f84	00040000-55ee-951d-b9a2-fe22c232dbc2	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-951e-aefd-68190f9a8855	00040000-55ee-951d-b9a2-fe22c232dbc2	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55ee-951e-312c-b780b0612b2f	00040000-55ee-951d-b9a2-fe22c232dbc2	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-951e-5046-3e98ebac3b5a	00040000-55ee-951d-b9a2-fe22c232dbc2	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-951e-3583-80bcabe7eb62	00040000-55ee-951d-b9a2-fe22c232dbc2	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-951e-4c18-a3c036b32342	00040000-55ee-951d-04b0-f7e4213ea6b9	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-951e-02df-c2a9566532f3	00040000-55ee-951d-d6fe-b5c18b4c4c67	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-951e-f603-810040d05d3f	00040000-55ee-951d-03d5-df65923d5bb4	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-951e-39f3-7071117cc51d	00040000-55ee-951d-b69d-9d2a65d11df8	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-9520-ff67-99e77f145deb	00040000-55ee-951d-b9a2-fe22c232dbc2	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2915 (class 0 OID 17804874)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55ee-951c-5cdd-840ccc700547	8341	Adlešiči
00050000-55ee-951c-f51a-945db00fc7c8	5270	Ajdovščina
00050000-55ee-951c-8301-d1fa198df3bc	6280	Ankaran/Ancarano
00050000-55ee-951c-c9f9-88ac0dd4ca8a	9253	Apače
00050000-55ee-951c-aeb3-e21a6263c556	8253	Artiče
00050000-55ee-951c-3727-66294ed8a734	4275	Begunje na Gorenjskem
00050000-55ee-951c-76ce-f7220d39f1d0	1382	Begunje pri Cerknici
00050000-55ee-951c-e031-7979ed61bc34	9231	Beltinci
00050000-55ee-951c-7529-4f5a639287da	2234	Benedikt
00050000-55ee-951c-47b1-c8c587c94d81	2345	Bistrica ob Dravi
00050000-55ee-951c-c257-73ece877f877	3256	Bistrica ob Sotli
00050000-55ee-951c-00eb-376e461cae1a	8259	Bizeljsko
00050000-55ee-951c-dba4-7dbb77bca41b	1223	Blagovica
00050000-55ee-951c-53ea-3d054316b0d0	8283	Blanca
00050000-55ee-951c-8188-7ab268aad415	4260	Bled
00050000-55ee-951c-8079-2b7d7770bc74	4273	Blejska Dobrava
00050000-55ee-951c-19c5-3f8005129ea0	9265	Bodonci
00050000-55ee-951c-f4d5-589758d9f423	9222	Bogojina
00050000-55ee-951c-b3d2-4673b8f8e954	4263	Bohinjska Bela
00050000-55ee-951c-565a-8194d006f9ea	4264	Bohinjska Bistrica
00050000-55ee-951c-10de-ecbea6610d3f	4265	Bohinjsko jezero
00050000-55ee-951c-f8e2-f0f4ed28e348	1353	Borovnica
00050000-55ee-951c-4658-25d16cd07b09	8294	Boštanj
00050000-55ee-951c-20b8-c07add5de2bb	5230	Bovec
00050000-55ee-951c-c2b7-641fc30375c4	5295	Branik
00050000-55ee-951c-6fc6-8f2462c309bf	3314	Braslovče
00050000-55ee-951c-ae0a-565156c9af13	5223	Breginj
00050000-55ee-951c-1e2d-fedcd773b4c5	8280	Brestanica
00050000-55ee-951c-7ae0-34fb61fdd71c	2354	Bresternica
00050000-55ee-951c-57df-4c6925dcabd6	4243	Brezje
00050000-55ee-951c-eb3c-c232cc88e005	1351	Brezovica pri Ljubljani
00050000-55ee-951c-9199-a7a58491f043	8250	Brežice
00050000-55ee-951c-8acf-5989dbb37aed	4210	Brnik - Aerodrom
00050000-55ee-951c-5f8e-dcf64bfc1b97	8321	Brusnice
00050000-55ee-951c-2bcc-e32b66770abd	3255	Buče
00050000-55ee-951c-721f-c2d38282dbf0	8276	Bučka 
00050000-55ee-951c-9ceb-0c4443f843d2	9261	Cankova
00050000-55ee-951c-2900-6752cb6e2040	3000	Celje 
00050000-55ee-951c-84cb-b068a3cb55ed	3001	Celje - poštni predali
00050000-55ee-951c-0cd7-747248735c3b	4207	Cerklje na Gorenjskem
00050000-55ee-951c-648e-24114d0cf381	8263	Cerklje ob Krki
00050000-55ee-951c-2bcf-40795bb51420	1380	Cerknica
00050000-55ee-951c-5ffc-2858782ff342	5282	Cerkno
00050000-55ee-951c-4402-b03c92ab4340	2236	Cerkvenjak
00050000-55ee-951c-6b29-e838d472463e	2215	Ceršak
00050000-55ee-951c-e420-3d394ccebf8b	2326	Cirkovce
00050000-55ee-951c-25a2-d697b8d651a9	2282	Cirkulane
00050000-55ee-951c-622e-5cc955751527	5273	Col
00050000-55ee-951c-964c-44a9ac5cdd34	8251	Čatež ob Savi
00050000-55ee-951c-2e55-ea61465f6ce6	1413	Čemšenik
00050000-55ee-951c-5942-179c220824be	5253	Čepovan
00050000-55ee-951c-1475-0f3312ba87d5	9232	Črenšovci
00050000-55ee-951c-c4fd-6946ad6e4438	2393	Črna na Koroškem
00050000-55ee-951c-4b67-522ca81c6faf	6275	Črni Kal
00050000-55ee-951c-614a-97a64f1f8474	5274	Črni Vrh nad Idrijo
00050000-55ee-951c-25ca-0cba67c2d25e	5262	Črniče
00050000-55ee-951c-c2a6-8dfb5ee499fb	8340	Črnomelj
00050000-55ee-951c-edce-8ca922d33bcb	6271	Dekani
00050000-55ee-951c-e638-a8d70c467674	5210	Deskle
00050000-55ee-951c-8b92-0dd8ef113b21	2253	Destrnik
00050000-55ee-951c-2187-785fb6e9fd64	6215	Divača
00050000-55ee-951c-a450-6f613e938c86	1233	Dob
00050000-55ee-951c-4fa3-84644da0807c	3224	Dobje pri Planini
00050000-55ee-951c-f4b3-a51d8695b1d7	8257	Dobova
00050000-55ee-951c-47d0-714dea9e2fdf	1423	Dobovec
00050000-55ee-951c-f865-ea926a84711a	5263	Dobravlje
00050000-55ee-951c-38eb-e517e6a1feaf	3204	Dobrna
00050000-55ee-951c-66e5-df4c5a1304ef	8211	Dobrnič
00050000-55ee-951c-19c6-30aab9c11e56	1356	Dobrova
00050000-55ee-951c-ae7a-1981bd0172e3	9223	Dobrovnik/Dobronak 
00050000-55ee-951c-7701-8b450bcec8ba	5212	Dobrovo v Brdih
00050000-55ee-951c-2bbb-1c3920c0ea0f	1431	Dol pri Hrastniku
00050000-55ee-951c-da43-206a5d1ac81f	1262	Dol pri Ljubljani
00050000-55ee-951c-0199-d41c7dbd167a	1273	Dole pri Litiji
00050000-55ee-951c-238e-8a7028fbbdda	1331	Dolenja vas
00050000-55ee-951c-5757-bb99ebad0aa3	8350	Dolenjske Toplice
00050000-55ee-951c-04e8-c9cd87efb619	1230	Domžale
00050000-55ee-951c-dc3b-38bd826f8570	2252	Dornava
00050000-55ee-951c-2527-e44949f7441b	5294	Dornberk
00050000-55ee-951c-ff9b-7f1b56f07760	1319	Draga
00050000-55ee-951c-82d9-3c13c31f8d06	8343	Dragatuš
00050000-55ee-951c-60a0-643eb45a3088	3222	Dramlje
00050000-55ee-951c-cf54-d877dfedf922	2370	Dravograd
00050000-55ee-951c-213b-4f21a94e464c	4203	Duplje
00050000-55ee-951c-da2c-0b78f5449378	6221	Dutovlje
00050000-55ee-951c-a172-035fa7ee138a	8361	Dvor
00050000-55ee-951c-973b-6411be836759	2343	Fala
00050000-55ee-951c-c0f6-869bce23476c	9208	Fokovci
00050000-55ee-951c-c2c5-0f7b9f4edd4b	2313	Fram
00050000-55ee-951c-c398-8f0fe21494cf	3213	Frankolovo
00050000-55ee-951c-e0bb-ff50aa5f130e	1274	Gabrovka
00050000-55ee-951c-0112-b07be1c65871	8254	Globoko
00050000-55ee-951c-842d-b5108af06e60	5275	Godovič
00050000-55ee-951c-51e9-86751dbb2f40	4204	Golnik
00050000-55ee-951c-0e18-f062b085aee3	3303	Gomilsko
00050000-55ee-951c-ebd5-adaf1704ddaa	4224	Gorenja vas
00050000-55ee-951c-5d19-75dedff01709	3263	Gorica pri Slivnici
00050000-55ee-951c-74ff-031d2d51eaf3	2272	Gorišnica
00050000-55ee-951c-8d6f-535e9c0ecf1c	9250	Gornja Radgona
00050000-55ee-951c-7efe-b7eaed7ed5de	3342	Gornji Grad
00050000-55ee-951c-7791-fcc29b9f9dee	4282	Gozd Martuljek
00050000-55ee-951c-e1ba-6bb093c9c434	6272	Gračišče
00050000-55ee-951c-7e95-b5e99bfde496	9264	Grad
00050000-55ee-951c-e410-87f08ccb8231	8332	Gradac
00050000-55ee-951c-64f4-0a27264044ee	1384	Grahovo
00050000-55ee-951c-7b61-4122ced69651	5242	Grahovo ob Bači
00050000-55ee-951c-ba29-78c368dd6cd5	5251	Grgar
00050000-55ee-951c-ca7f-7e7203ee7070	3302	Griže
00050000-55ee-951c-c571-3c99a3edc4e3	3231	Grobelno
00050000-55ee-951c-8355-510f021b28b9	1290	Grosuplje
00050000-55ee-951c-b157-fd5f7be2fc72	2288	Hajdina
00050000-55ee-951c-7278-b076b037b77d	8362	Hinje
00050000-55ee-951c-2369-6de2472d8470	2311	Hoče
00050000-55ee-951c-1489-9e0c63fcb8ba	9205	Hodoš/Hodos
00050000-55ee-951c-6378-289b00d23186	1354	Horjul
00050000-55ee-951c-9f1b-e115268961d9	1372	Hotedršica
00050000-55ee-951c-44cc-1ac485271bdd	1430	Hrastnik
00050000-55ee-951c-0353-ebe135556297	6225	Hruševje
00050000-55ee-951c-4958-719ea611cb97	4276	Hrušica
00050000-55ee-951c-3004-bb178ce6d349	5280	Idrija
00050000-55ee-951c-09aa-1d6da32f70e7	1292	Ig
00050000-55ee-951c-4e6b-a793b3c06620	6250	Ilirska Bistrica
00050000-55ee-951c-64af-e1e5cc9b5768	6251	Ilirska Bistrica-Trnovo
00050000-55ee-951c-7a4a-9c48e2cac9df	1295	Ivančna Gorica
00050000-55ee-951c-a348-e37f8dc60a26	2259	Ivanjkovci
00050000-55ee-951c-2ee6-c083843c0ad8	1411	Izlake
00050000-55ee-951c-4de1-a38f63796e5c	6310	Izola/Isola
00050000-55ee-951c-1af9-a08170b53ede	2222	Jakobski Dol
00050000-55ee-951c-6e20-fd0139cb4f5b	2221	Jarenina
00050000-55ee-951c-e5da-b89952ac86d3	6254	Jelšane
00050000-55ee-951c-5d60-792210a3161f	4270	Jesenice
00050000-55ee-951c-7972-259e6a8d1c1a	8261	Jesenice na Dolenjskem
00050000-55ee-951c-1c64-f2cd2104cc14	3273	Jurklošter
00050000-55ee-951c-5b8d-f9c3a908355d	2223	Jurovski Dol
00050000-55ee-951c-280e-ec3d6f7df39f	2256	Juršinci
00050000-55ee-951c-f786-104df1038d5b	5214	Kal nad Kanalom
00050000-55ee-951c-8e0f-d11636fbeb04	3233	Kalobje
00050000-55ee-951c-6d0f-a8d88de1d1c2	4246	Kamna Gorica
00050000-55ee-951c-07be-d43125fe38d2	2351	Kamnica
00050000-55ee-951c-c936-7974d0f3359a	1241	Kamnik
00050000-55ee-951c-a6a1-730a3edd2a97	5213	Kanal
00050000-55ee-951c-fe47-2fa15b39881a	8258	Kapele
00050000-55ee-951c-1bc4-94d4457bab0d	2362	Kapla
00050000-55ee-951c-f05a-74642c973c8e	2325	Kidričevo
00050000-55ee-951c-951f-7879b9ad502b	1412	Kisovec
00050000-55ee-951c-6f7b-0569f0576aa3	6253	Knežak
00050000-55ee-951c-2eac-fce2df03f35b	5222	Kobarid
00050000-55ee-951c-737f-181a70396565	9227	Kobilje
00050000-55ee-951c-6d51-c3ae572e3d58	1330	Kočevje
00050000-55ee-951c-9856-d51e50941b99	1338	Kočevska Reka
00050000-55ee-951c-4bd0-6681850fa082	2276	Kog
00050000-55ee-951c-4c5a-cba099fcf854	5211	Kojsko
00050000-55ee-951c-9ef8-c6279221e00a	6223	Komen
00050000-55ee-951c-e217-5b650097dbec	1218	Komenda
00050000-55ee-951c-1863-38ad0c58adcf	6000	Koper/Capodistria 
00050000-55ee-951c-67fa-dd071bcbaf66	6001	Koper/Capodistria - poštni predali
00050000-55ee-951c-62b6-16275fcd22a6	8282	Koprivnica
00050000-55ee-951c-5e3f-6cad1fe2b4ae	5296	Kostanjevica na Krasu
00050000-55ee-951c-931e-39c8f092ecc4	8311	Kostanjevica na Krki
00050000-55ee-951c-f207-04cf6f805bc4	1336	Kostel
00050000-55ee-951c-3985-facff4fc3a76	6256	Košana
00050000-55ee-951c-71c8-3faed70cbf43	2394	Kotlje
00050000-55ee-951c-1bfb-a79a6cd8e1d0	6240	Kozina
00050000-55ee-951c-5706-98d4427c9bff	3260	Kozje
00050000-55ee-951c-abb0-bd098df3488e	4000	Kranj 
00050000-55ee-951c-7ec7-9d08cdc33d56	4001	Kranj - poštni predali
00050000-55ee-951c-190c-0d1b90a2050c	4280	Kranjska Gora
00050000-55ee-951c-6441-aafb7584c13e	1281	Kresnice
00050000-55ee-951c-5a4d-fec213f919c4	4294	Križe
00050000-55ee-951c-1c80-ee246a5b3f75	9206	Križevci
00050000-55ee-951c-c719-b63fdae0cb75	9242	Križevci pri Ljutomeru
00050000-55ee-951c-418a-b9b7717215cd	1301	Krka
00050000-55ee-951c-c836-173d1c911a73	8296	Krmelj
00050000-55ee-951c-6e8c-b1955d8cab98	4245	Kropa
00050000-55ee-951c-fdbe-5d8ee8f794ed	8262	Krška vas
00050000-55ee-951c-865b-ce526268acf0	8270	Krško
00050000-55ee-951c-f852-8fb6ba43e8e3	9263	Kuzma
00050000-55ee-951c-1a44-a373998880bb	2318	Laporje
00050000-55ee-951c-7ba9-c107814aa9c1	3270	Laško
00050000-55ee-951c-1e04-2f6c9656a8cc	1219	Laze v Tuhinju
00050000-55ee-951c-9544-449cfed84f2a	2230	Lenart v Slovenskih goricah
00050000-55ee-951c-b51c-af5cefa70923	9220	Lendava/Lendva
00050000-55ee-951c-70a0-b77469506a36	4248	Lesce
00050000-55ee-951c-bcc2-0fab0b00cc09	3261	Lesično
00050000-55ee-951c-9648-cc352719c0dc	8273	Leskovec pri Krškem
00050000-55ee-951c-c3bb-5600c0e19e9b	2372	Libeliče
00050000-55ee-951c-ec6f-9758f785c765	2341	Limbuš
00050000-55ee-951c-4a1c-a6b07c88e062	1270	Litija
00050000-55ee-951c-6a1f-9c2d75987881	3202	Ljubečna
00050000-55ee-951c-24be-37ae8f209fd5	1000	Ljubljana 
00050000-55ee-951c-9e12-03a7ef92174a	1001	Ljubljana - poštni predali
00050000-55ee-951c-1ebe-3422973b4f4e	1231	Ljubljana - Črnuče
00050000-55ee-951c-ac03-2bb97a8d3f23	1261	Ljubljana - Dobrunje
00050000-55ee-951c-8c7a-3a97c93cface	1260	Ljubljana - Polje
00050000-55ee-951c-9e4a-73ebe06397fc	1210	Ljubljana - Šentvid
00050000-55ee-951c-4e99-1b3e2afa1ed6	1211	Ljubljana - Šmartno
00050000-55ee-951c-59a1-0df20f2cd959	3333	Ljubno ob Savinji
00050000-55ee-951c-7cbe-0803d97db6b6	9240	Ljutomer
00050000-55ee-951c-ba9b-a352bc0eee67	3215	Loče
00050000-55ee-951c-583f-9b4c52ce2a68	5231	Log pod Mangartom
00050000-55ee-951c-5271-66625b51c43f	1358	Log pri Brezovici
00050000-55ee-951c-0ad3-a7ed5b4cc763	1370	Logatec
00050000-55ee-951c-c4f4-0d72e54029f0	1371	Logatec
00050000-55ee-951c-4360-1fe166418f34	1434	Loka pri Zidanem Mostu
00050000-55ee-951c-44f6-e08b673e646a	3223	Loka pri Žusmu
00050000-55ee-951c-cfb8-f3841d144539	6219	Lokev
00050000-55ee-951c-1c7b-c5583f082dce	1318	Loški Potok
00050000-55ee-951c-8030-2104e338ed98	2324	Lovrenc na Dravskem polju
00050000-55ee-951c-e4d4-67f8b22c914e	2344	Lovrenc na Pohorju
00050000-55ee-951c-a432-c4e05e65a2b2	3334	Luče
00050000-55ee-951c-335d-ef84c75bddc6	1225	Lukovica
00050000-55ee-951c-df8c-a3459a72b3d5	9202	Mačkovci
00050000-55ee-951c-593c-ae99ddc3e072	2322	Majšperk
00050000-55ee-951c-a6c1-8eb6b4c71e23	2321	Makole
00050000-55ee-951c-cccb-b6bc340b94ac	9243	Mala Nedelja
00050000-55ee-951c-d4e7-d4e0e2542200	2229	Malečnik
00050000-55ee-951c-d4eb-75b70f2f8ad4	6273	Marezige
00050000-55ee-951c-5213-1e6cdbe4fe65	2000	Maribor 
00050000-55ee-951c-0d2c-ffbc0877fd98	2001	Maribor - poštni predali
00050000-55ee-951c-df86-068b09aadd3a	2206	Marjeta na Dravskem polju
00050000-55ee-951c-325f-d028ab45ceae	2281	Markovci
00050000-55ee-951c-410e-5f6b07f819b9	9221	Martjanci
00050000-55ee-951c-70af-baa71a578af7	6242	Materija
00050000-55ee-951c-c577-e398972cdbee	4211	Mavčiče
00050000-55ee-951c-54cf-738c2bf07063	1215	Medvode
00050000-55ee-951c-d9b2-c2460315892a	1234	Mengeš
00050000-55ee-951c-844e-771aa611e394	8330	Metlika
00050000-55ee-951c-8c36-aaa4e9d9920d	2392	Mežica
00050000-55ee-951c-8899-00e7f91c0ff2	2204	Miklavž na Dravskem polju
00050000-55ee-951c-9e2c-f70678cdbfa5	2275	Miklavž pri Ormožu
00050000-55ee-951c-f3a6-03941c17540f	5291	Miren
00050000-55ee-951c-4e11-c5732d4b99c2	8233	Mirna
00050000-55ee-951c-ea31-7222155c233a	8216	Mirna Peč
00050000-55ee-951c-7ac0-bb772bf18a7b	2382	Mislinja
00050000-55ee-951c-d88e-f58d047129a7	4281	Mojstrana
00050000-55ee-951c-aa59-346496a2350d	8230	Mokronog
00050000-55ee-951c-f1b2-f59c6e986928	1251	Moravče
00050000-55ee-951c-d853-3335ac30f27b	9226	Moravske Toplice
00050000-55ee-951c-eb78-c8491de58c03	5216	Most na Soči
00050000-55ee-951c-40ab-f63008d0b183	1221	Motnik
00050000-55ee-951c-532f-4a338b271f8c	3330	Mozirje
00050000-55ee-951c-8c1c-cbdedcaa20c0	9000	Murska Sobota 
00050000-55ee-951c-95a9-ac6d8958adf3	9001	Murska Sobota - poštni predali
00050000-55ee-951c-572c-3a2b5e553979	2366	Muta
00050000-55ee-951c-5670-1a7ccbec5dd1	4202	Naklo
00050000-55ee-951c-16db-cd8bb762e909	3331	Nazarje
00050000-55ee-951c-46e1-9d639fe7810e	1357	Notranje Gorice
00050000-55ee-951c-935a-f8ae37136de7	3203	Nova Cerkev
00050000-55ee-951c-858a-7b31e3facfa4	5000	Nova Gorica 
00050000-55ee-951c-1388-19196a01a1c4	5001	Nova Gorica - poštni predali
00050000-55ee-951c-c071-b5bdb2160dbe	1385	Nova vas
00050000-55ee-951c-9b09-6f3fad8f645b	8000	Novo mesto
00050000-55ee-951c-668b-60e791f20951	8001	Novo mesto - poštni predali
00050000-55ee-951c-dfaa-61fa960ced58	6243	Obrov
00050000-55ee-951c-eca8-5c86c26293de	9233	Odranci
00050000-55ee-951c-6753-edb409ad309e	2317	Oplotnica
00050000-55ee-951c-cdba-5587049f129b	2312	Orehova vas
00050000-55ee-951c-5e80-429efba3682e	2270	Ormož
00050000-55ee-951c-7baa-cc11eb7e8cc6	1316	Ortnek
00050000-55ee-951c-2cb6-dd7b027419ce	1337	Osilnica
00050000-55ee-951c-ad48-e24cddbb8224	8222	Otočec
00050000-55ee-951c-40d5-cb6967ed9566	2361	Ožbalt
00050000-55ee-951c-100b-e1a900469229	2231	Pernica
00050000-55ee-951c-11d3-b374bc563738	2211	Pesnica pri Mariboru
00050000-55ee-951d-4e86-8efe72f995c2	9203	Petrovci
00050000-55ee-951d-c9ba-72009182b733	3301	Petrovče
00050000-55ee-951d-9f98-4fa63ad4cee1	6330	Piran/Pirano
00050000-55ee-951d-cdc9-68237f3bb1c5	8255	Pišece
00050000-55ee-951d-c82f-7158d8901ef0	6257	Pivka
00050000-55ee-951d-2308-d2a5f8f64326	6232	Planina
00050000-55ee-951d-28f2-16c95156eda8	3225	Planina pri Sevnici
00050000-55ee-951d-1edc-1682be2db1e5	6276	Pobegi
00050000-55ee-951d-5366-9e27fdd47c7a	8312	Podbočje
00050000-55ee-951d-f424-360495f87612	5243	Podbrdo
00050000-55ee-951d-e980-3488a7ac19a2	3254	Podčetrtek
00050000-55ee-951d-07f4-394e10a84a0e	2273	Podgorci
00050000-55ee-951d-6e77-033edbbce8f5	6216	Podgorje
00050000-55ee-951d-be42-0b76fe165de7	2381	Podgorje pri Slovenj Gradcu
00050000-55ee-951d-6ff1-26282fdd4fd8	6244	Podgrad
00050000-55ee-951d-00b2-c004aca52678	1414	Podkum
00050000-55ee-951d-e9e7-492cff566ecf	2286	Podlehnik
00050000-55ee-951d-29e5-83316534fc6f	5272	Podnanos
00050000-55ee-951d-9cee-f43852c5a625	4244	Podnart
00050000-55ee-951d-d797-f99155b5cc81	3241	Podplat
00050000-55ee-951d-f562-69a819220a77	3257	Podsreda
00050000-55ee-951d-6411-3080d8dbb242	2363	Podvelka
00050000-55ee-951d-43a7-e6751637cc47	2208	Pohorje
00050000-55ee-951d-3b0d-cd0e44cbc419	2257	Polenšak
00050000-55ee-951d-fe56-ffe61a5cfae5	1355	Polhov Gradec
00050000-55ee-951d-a665-4583d17e48d5	4223	Poljane nad Škofjo Loko
00050000-55ee-951d-6fe4-bf0b25f27c57	2319	Poljčane
00050000-55ee-951d-df9e-b7c526cbb848	1272	Polšnik
00050000-55ee-951d-acd1-53ecda9135d5	3313	Polzela
00050000-55ee-951d-4938-fcdaabe1d7cc	3232	Ponikva
00050000-55ee-951d-5545-697eae69c339	6320	Portorož/Portorose
00050000-55ee-951d-d4b3-43f0e3fb4a3d	6230	Postojna
00050000-55ee-951d-5c79-88f7bf83934e	2331	Pragersko
00050000-55ee-951d-87ae-d99f349322a6	3312	Prebold
00050000-55ee-951d-f817-9d7c60886651	4205	Preddvor
00050000-55ee-951d-4a08-949e531bb999	6255	Prem
00050000-55ee-951d-ee2f-c5708e0bb5c3	1352	Preserje
00050000-55ee-951d-bf48-fdcfc26282e9	6258	Prestranek
00050000-55ee-951d-c53c-3a64c72f2134	2391	Prevalje
00050000-55ee-951d-64d2-00810a5d6d21	3262	Prevorje
00050000-55ee-951d-25bd-700fa2f5ec54	1276	Primskovo 
00050000-55ee-951d-0f1a-cb13ff004abe	3253	Pristava pri Mestinju
00050000-55ee-951d-0968-5565d984dba0	9207	Prosenjakovci/Partosfalva
00050000-55ee-951d-b36d-1c217fb5ee52	5297	Prvačina
00050000-55ee-951d-bcd8-859710b98175	2250	Ptuj
00050000-55ee-951d-9acd-928991cf1fb8	2323	Ptujska Gora
00050000-55ee-951d-40ac-39a88018c89d	9201	Puconci
00050000-55ee-951d-16f8-8252d8badac9	2327	Rače
00050000-55ee-951d-3350-d1501f0c2e8e	1433	Radeče
00050000-55ee-951d-6d43-7330a39c7a14	9252	Radenci
00050000-55ee-951d-16ed-1adab16f174c	2360	Radlje ob Dravi
00050000-55ee-951d-cca7-99786ad3b5b7	1235	Radomlje
00050000-55ee-951d-d2f1-b3e902900680	4240	Radovljica
00050000-55ee-951d-974a-547486e3f9af	8274	Raka
00050000-55ee-951d-82f8-ee4443f531b0	1381	Rakek
00050000-55ee-951d-acac-a6cb8a2fed2b	4283	Rateče - Planica
00050000-55ee-951d-f621-c5569a0632a2	2390	Ravne na Koroškem
00050000-55ee-951d-8e09-a0ede63ea8fb	9246	Razkrižje
00050000-55ee-951d-943d-81bb95d7b5b2	3332	Rečica ob Savinji
00050000-55ee-951d-2097-1bb0e6b5ad97	5292	Renče
00050000-55ee-951d-2c56-3c577921641b	1310	Ribnica
00050000-55ee-951d-ce7d-f1034dfb7b44	2364	Ribnica na Pohorju
00050000-55ee-951d-4686-6bc2320afb2f	3272	Rimske Toplice
00050000-55ee-951d-d0d3-a8b35982a728	1314	Rob
00050000-55ee-951d-7ef5-15ad549500ed	5215	Ročinj
00050000-55ee-951d-7d4a-a351d2775b63	3250	Rogaška Slatina
00050000-55ee-951d-f469-c2bf837a9b68	9262	Rogašovci
00050000-55ee-951d-bb25-0ad2f3101670	3252	Rogatec
00050000-55ee-951d-3f44-1344056a6ecb	1373	Rovte
00050000-55ee-951d-2ad1-5d23c47313f3	2342	Ruše
00050000-55ee-951d-e93f-29d5173fa4b0	1282	Sava
00050000-55ee-951d-7ac9-bf84bb1c43a6	6333	Sečovlje/Sicciole
00050000-55ee-951d-893f-8840d81f9c00	4227	Selca
00050000-55ee-951d-9924-ccc109a4d6e8	2352	Selnica ob Dravi
00050000-55ee-951d-cdf3-1b25bc703909	8333	Semič
00050000-55ee-951d-e27c-7d91be44a3ed	8281	Senovo
00050000-55ee-951d-b549-a0b613625c01	6224	Senožeče
00050000-55ee-951d-5fc0-167ac399ef56	8290	Sevnica
00050000-55ee-951d-b40d-72db443b8373	6210	Sežana
00050000-55ee-951d-6735-84c0e8378c2b	2214	Sladki Vrh
00050000-55ee-951d-3c59-4d8d552fb631	5283	Slap ob Idrijci
00050000-55ee-951d-d09c-00146155a116	2380	Slovenj Gradec
00050000-55ee-951d-bbb9-b967eafcc72b	2310	Slovenska Bistrica
00050000-55ee-951d-3401-218d9827b9b8	3210	Slovenske Konjice
00050000-55ee-951d-03ba-9ac03732d69a	1216	Smlednik
00050000-55ee-951d-b8df-7ba839679ab4	5232	Soča
00050000-55ee-951d-2377-a1b71b57ec15	1317	Sodražica
00050000-55ee-951d-c289-ea625d66060e	3335	Solčava
00050000-55ee-951d-975f-cdd8f35c6e21	5250	Solkan
00050000-55ee-951d-3384-fa38d32c09a5	4229	Sorica
00050000-55ee-951d-54ce-bc522fd8fe80	4225	Sovodenj
00050000-55ee-951d-aaef-94c864f0283b	5281	Spodnja Idrija
00050000-55ee-951d-c320-a02cd293aaf7	2241	Spodnji Duplek
00050000-55ee-951d-02c7-3671432e548a	9245	Spodnji Ivanjci
00050000-55ee-951d-c0ab-64e6f0e79f87	2277	Središče ob Dravi
00050000-55ee-951d-e4a4-8ee5d08576db	4267	Srednja vas v Bohinju
00050000-55ee-951d-776c-f62c9620b5a0	8256	Sromlje 
00050000-55ee-951d-15b0-b54fc8344a15	5224	Srpenica
00050000-55ee-951d-79f4-e5e221044c15	1242	Stahovica
00050000-55ee-951d-1b46-800fee6fde72	1332	Stara Cerkev
00050000-55ee-951d-6ff9-2386bc4225ef	8342	Stari trg ob Kolpi
00050000-55ee-951d-74cc-5bda12ba29b4	1386	Stari trg pri Ložu
00050000-55ee-951d-e1d6-cb9e4200c13e	2205	Starše
00050000-55ee-951d-7823-4d1d85705c04	2289	Stoperce
00050000-55ee-951d-07cb-6be5ca99c894	8322	Stopiče
00050000-55ee-951d-b7e4-5d12429102b5	3206	Stranice
00050000-55ee-951d-9826-9cfdf47c9903	8351	Straža
00050000-55ee-951d-78de-3e5960a98297	1313	Struge
00050000-55ee-951d-42bf-0dfb89c4c714	8293	Studenec
00050000-55ee-951d-f1c2-405ac7f523ed	8331	Suhor
00050000-55ee-951d-544a-fe18ed9bc6a1	2233	Sv. Ana v Slovenskih goricah
00050000-55ee-951d-a283-8f86ba5bc417	2235	Sv. Trojica v Slovenskih goricah
00050000-55ee-951d-56d7-c6d776e68817	2353	Sveti Duh na Ostrem Vrhu
00050000-55ee-951d-b4db-e957fcbc90d0	9244	Sveti Jurij ob Ščavnici
00050000-55ee-951d-0e7d-531f48cb116a	3264	Sveti Štefan
00050000-55ee-951d-ddb9-99a53c965932	2258	Sveti Tomaž
00050000-55ee-951d-361c-c0df8ef60acd	9204	Šalovci
00050000-55ee-951d-3b83-d5be8ffa439a	5261	Šempas
00050000-55ee-951d-15ab-50eb7dabc2e5	5290	Šempeter pri Gorici
00050000-55ee-951d-9771-1796cbb0e862	3311	Šempeter v Savinjski dolini
00050000-55ee-951d-cccc-fcc0d68c0af6	4208	Šenčur
00050000-55ee-951d-eb34-e8df06d272f8	2212	Šentilj v Slovenskih goricah
00050000-55ee-951d-3258-1fe1478fd099	8297	Šentjanž
00050000-55ee-951d-0720-bba909689701	2373	Šentjanž pri Dravogradu
00050000-55ee-951d-0df8-022505f3fd7f	8310	Šentjernej
00050000-55ee-951d-6e92-5bc9eec142ca	3230	Šentjur
00050000-55ee-951d-e6a8-08f4e5240e06	3271	Šentrupert
00050000-55ee-951d-d428-20ee8a9cb698	8232	Šentrupert
00050000-55ee-951d-14ae-a990a18e97fa	1296	Šentvid pri Stični
00050000-55ee-951d-7366-f5ec91d6f2be	8275	Škocjan
00050000-55ee-951d-3002-5122f0e7cf82	6281	Škofije
00050000-55ee-951d-46e7-edeb9b0a7475	4220	Škofja Loka
00050000-55ee-951d-7964-d876885776ac	3211	Škofja vas
00050000-55ee-951d-ac3f-947c376a066c	1291	Škofljica
00050000-55ee-951d-958e-1ae4ef8c8382	6274	Šmarje
00050000-55ee-951d-485e-483ed26920bc	1293	Šmarje - Sap
00050000-55ee-951d-03dc-cdac9be01079	3240	Šmarje pri Jelšah
00050000-55ee-951d-e612-184c56bcb3e1	8220	Šmarješke Toplice
00050000-55ee-951d-7d21-b33c01a227fb	2315	Šmartno na Pohorju
00050000-55ee-951d-c0a9-de3ee5be14e8	3341	Šmartno ob Dreti
00050000-55ee-951d-057f-a4da5389d08e	3327	Šmartno ob Paki
00050000-55ee-951d-1327-73039f7d64f9	1275	Šmartno pri Litiji
00050000-55ee-951d-fc63-3445c4de5631	2383	Šmartno pri Slovenj Gradcu
00050000-55ee-951d-9daf-416c3f32c45b	3201	Šmartno v Rožni dolini
00050000-55ee-951d-367d-3ac07812aa01	3325	Šoštanj
00050000-55ee-951d-2727-dd41a30b65ec	6222	Štanjel
00050000-55ee-951d-95d8-860d98c23b2b	3220	Štore
00050000-55ee-951d-fa7a-d0ca859ff57b	3304	Tabor
00050000-55ee-951d-6b99-bdc8cb5ec87f	3221	Teharje
00050000-55ee-951d-7d88-9b1500e470e7	9251	Tišina
00050000-55ee-951d-4c0b-553b78f66315	5220	Tolmin
00050000-55ee-951d-8485-f97e593ea433	3326	Topolšica
00050000-55ee-951d-af68-e8ecd209cfde	2371	Trbonje
00050000-55ee-951d-7abf-01df018885d7	1420	Trbovlje
00050000-55ee-951d-4eb0-1eacbe902077	8231	Trebelno 
00050000-55ee-951d-c77d-e8028c0f355d	8210	Trebnje
00050000-55ee-951d-6b77-48cb702055df	5252	Trnovo pri Gorici
00050000-55ee-951d-f991-60d4367763c5	2254	Trnovska vas
00050000-55ee-951d-c6a0-f1c2fc5cc379	1222	Trojane
00050000-55ee-951d-775d-6a2a5335044e	1236	Trzin
00050000-55ee-951d-4ae6-626ce9ebb09d	4290	Tržič
00050000-55ee-951d-f86a-baf91fdf5163	8295	Tržišče
00050000-55ee-951d-f097-c1a6d7d613c2	1311	Turjak
00050000-55ee-951d-e167-af89e85dc76e	9224	Turnišče
00050000-55ee-951d-8cf9-c109c820ddcf	8323	Uršna sela
00050000-55ee-951d-7356-760cb17f7907	1252	Vače
00050000-55ee-951d-b68b-18b276d3f6ae	3320	Velenje 
00050000-55ee-951d-d93d-2846fd0c1116	3322	Velenje - poštni predali
00050000-55ee-951d-c78f-740264b2dfa9	8212	Velika Loka
00050000-55ee-951d-c6ab-d2ae20d42f1d	2274	Velika Nedelja
00050000-55ee-951d-9e81-1ffa9042ed16	9225	Velika Polana
00050000-55ee-951d-8bfc-0bb2fc1a41ab	1315	Velike Lašče
00050000-55ee-951d-9aa3-b79b7d186d5c	8213	Veliki Gaber
00050000-55ee-951d-0651-e76c4ad9e796	9241	Veržej
00050000-55ee-951d-1d15-cd72050dcee1	1312	Videm - Dobrepolje
00050000-55ee-951d-8359-730c2ee3e308	2284	Videm pri Ptuju
00050000-55ee-951d-1b89-4ca8f302869d	8344	Vinica
00050000-55ee-951d-5f80-30e51026f13f	5271	Vipava
00050000-55ee-951d-a887-4c7825c4814e	4212	Visoko
00050000-55ee-951d-c99f-9ce235e2be7d	1294	Višnja Gora
00050000-55ee-951d-7e7c-2b4cf55cafe1	3205	Vitanje
00050000-55ee-951d-db17-3d35efb84d04	2255	Vitomarci
00050000-55ee-951d-5da9-4bdfe96870fd	1217	Vodice
00050000-55ee-951d-5d91-421a874b16e8	3212	Vojnik\t
00050000-55ee-951d-e428-bdfd054faf95	5293	Volčja Draga
00050000-55ee-951d-fcdd-252ecc99b5f7	2232	Voličina
00050000-55ee-951d-99e7-ca3229202abe	3305	Vransko
00050000-55ee-951d-6ecb-e2b3b96744a9	6217	Vremski Britof
00050000-55ee-951d-49a3-b10b33a52190	1360	Vrhnika
00050000-55ee-951d-2f0b-5f9f01054f66	2365	Vuhred
00050000-55ee-951d-4024-9f7d6ad8da36	2367	Vuzenica
00050000-55ee-951d-ff9a-abc5fb1826cb	8292	Zabukovje 
00050000-55ee-951d-9ab1-d655c3006912	1410	Zagorje ob Savi
00050000-55ee-951d-ac4f-60ca36f2c1c0	1303	Zagradec
00050000-55ee-951d-95ea-e2419a37db6e	2283	Zavrč
00050000-55ee-951d-39d9-fc1e8610eae4	8272	Zdole 
00050000-55ee-951d-3187-c37b65283998	4201	Zgornja Besnica
00050000-55ee-951d-a0d1-97460aef0fbb	2242	Zgornja Korena
00050000-55ee-951d-5474-2818002255f7	2201	Zgornja Kungota
00050000-55ee-951d-077f-c4f985ba2b6c	2316	Zgornja Ložnica
00050000-55ee-951d-55cd-27120b281a0f	2314	Zgornja Polskava
00050000-55ee-951d-95bb-ecdb39e607fd	2213	Zgornja Velka
00050000-55ee-951d-3c6b-98da123cd0e8	4247	Zgornje Gorje
00050000-55ee-951d-0efa-976d7ee6906f	4206	Zgornje Jezersko
00050000-55ee-951d-4cfb-728aa752b55c	2285	Zgornji Leskovec
00050000-55ee-951d-3862-a96d7fdb8391	1432	Zidani Most
00050000-55ee-951d-9af8-4fabcde12be7	3214	Zreče
00050000-55ee-951d-61de-8123ce2723d8	4209	Žabnica
00050000-55ee-951d-8f0d-c284d3d8bdbb	3310	Žalec
00050000-55ee-951d-7724-ac79fc9f3c8f	4228	Železniki
00050000-55ee-951d-6c69-af2e44b3e621	2287	Žetale
00050000-55ee-951d-f4ed-a6c0073e0650	4226	Žiri
00050000-55ee-951d-1a70-f22533cb1381	4274	Žirovnica
00050000-55ee-951d-229c-da8632c6828e	8360	Žužemberk
\.


--
-- TOC entry 2931 (class 0 OID 17805049)
-- Dependencies: 202
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2914 (class 0 OID 17804859)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55ee-951f-46cd-5aa225cd4001	00080000-55ee-951e-e034-1fc480052f84	\N	00040000-55ee-951d-b9a2-fe22c232dbc2	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55ee-951f-bcc4-0cdf686a9020	00080000-55ee-951e-e034-1fc480052f84	\N	00040000-55ee-951d-b9a2-fe22c232dbc2	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55ee-951f-6072-3f413f5452c1	00080000-55ee-951e-aefd-68190f9a8855	\N	00040000-55ee-951d-b9a2-fe22c232dbc2	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2920 (class 0 OID 17804937)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 17805061)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2957 (class 0 OID 17805416)
-- Dependencies: 228
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 17805426)
-- Dependencies: 229
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55ee-951f-03c0-3990c19c8819	00080000-55ee-951e-312c-b780b0612b2f	0987	AK
00190000-55ee-951f-4b41-a39c29437228	00080000-55ee-951e-aefd-68190f9a8855	0989	AK
00190000-55ee-951f-ab4e-f02918378a58	00080000-55ee-951e-5046-3e98ebac3b5a	0986	AK
00190000-55ee-951f-3484-8da041119ce7	00080000-55ee-951e-4c18-a3c036b32342	0984	AK
00190000-55ee-951f-3321-e5c59b6f5ea7	00080000-55ee-951e-02df-c2a9566532f3	0983	AK
00190000-55ee-951f-232a-8295c6dbd3a9	00080000-55ee-951e-f603-810040d05d3f	0982	AK
00190000-55ee-9520-4f22-5ad644f03e3e	00080000-55ee-9520-ff67-99e77f145deb	1001	AK
\.


--
-- TOC entry 2956 (class 0 OID 17805373)
-- Dependencies: 227
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55ee-951f-7a66-4e746a837b24	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2959 (class 0 OID 17805434)
-- Dependencies: 230
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 17805090)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, seplanira, kapaciteta, opis) FROM stdin;
00220000-55ee-951e-f71b-ba112fb7a24d	\N	\N	0001	Poskusna 1	f	t	8	Poskusna učilnica v prvem
00220000-55ee-951e-9f5d-e101d495d214	\N	\N	0002	Poskusna 3	f	f	34	Poskusna učilnica v tretjem
00220000-55ee-951e-f026-59d1d7c015a1	\N	\N	0003	Kazinska	t	t	84	Kazinska dvorana
00220000-55ee-951e-5c55-b908316955d4	\N	\N	0004	Mali oder	t	t	24	Mali oder 
00220000-55ee-951e-8734-641dd0ab609f	\N	\N	0005	Komorni oder	t	t	15	Komorni oder
00220000-55ee-951e-cb01-004467f9cbb1	\N	\N	0006	Stara dvorana	t	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55ee-951e-e3fb-9387b247b019	\N	\N	0007	Velika dvorana	t	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2929 (class 0 OID 17805034)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 17805024)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 17805226)
-- Dependencies: 220
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2944 (class 0 OID 17805164)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 17804732)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55ee-9520-ff67-99e77f145deb	00010000-55ee-951d-6390-798e699ffc28	2015-09-08 09:58:24	INS	a:0:{}
2	App\\Entity\\Option	00000000-55ee-9520-97dc-d21a7aa23032	00010000-55ee-951d-6390-798e699ffc28	2015-09-08 09:58:24	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55ee-9520-4f22-5ad644f03e3e	00010000-55ee-951d-6390-798e699ffc28	2015-09-08 09:58:24	INS	a:0:{}
\.


--
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2938 (class 0 OID 17805103)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 17804770)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55ee-951d-03e4-9c7be9bd95d2	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55ee-951d-3033-677cb4b07bd2	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55ee-951d-21c9-43dfb075767d	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55ee-951d-d598-6986eb54d08a	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55ee-951d-0e44-2cd3d48017fc	planer	Planer dogodkov v koledarju	t
00020000-55ee-951d-4c71-34f222c9c4d8	kadrovska	Kadrovska služba	t
00020000-55ee-951d-43d0-19166c6f2944	arhivar	Ažuriranje arhivalij	t
00020000-55ee-951d-e6fb-fac30986b7b8	igralec	Igralec	t
00020000-55ee-951d-feb2-2d78323c14e1	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55ee-951e-d672-e3cb10645f82	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2905 (class 0 OID 17804754)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55ee-951d-48cc-e443067c268d	00020000-55ee-951d-21c9-43dfb075767d
00010000-55ee-951d-6390-798e699ffc28	00020000-55ee-951d-21c9-43dfb075767d
00010000-55ee-951f-862a-e667e5a5f8c0	00020000-55ee-951e-d672-e3cb10645f82
\.


--
-- TOC entry 2940 (class 0 OID 17805117)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 17805055)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2926 (class 0 OID 17805001)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 17804719)
-- Dependencies: 172
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55ee-951d-0634-344a70a99045	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55ee-951d-c8d4-dbdd51cae2c1	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55ee-951d-c572-3e1e58290050	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55ee-951d-147e-297ece568c85	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55ee-951d-3b1c-c10571a9abac	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2900 (class 0 OID 17804711)
-- Dependencies: 171
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55ee-951d-a69a-9d49116701c3	00230000-55ee-951d-147e-297ece568c85	popa
00240000-55ee-951d-1832-76521720db1a	00230000-55ee-951d-147e-297ece568c85	oseba
00240000-55ee-951d-7a57-00b97c41a536	00230000-55ee-951d-147e-297ece568c85	sezona
00240000-55ee-951d-7498-114c68be147d	00230000-55ee-951d-c8d4-dbdd51cae2c1	prostor
00240000-55ee-951d-2096-c4b32cf93dc9	00230000-55ee-951d-147e-297ece568c85	besedilo
00240000-55ee-951d-be5e-53bdc9fe404b	00230000-55ee-951d-147e-297ece568c85	uprizoritev
00240000-55ee-951d-1eaf-61a6bc5343b1	00230000-55ee-951d-147e-297ece568c85	funkcija
00240000-55ee-951d-072a-521b68e86bc8	00230000-55ee-951d-147e-297ece568c85	tipfunkcije
00240000-55ee-951d-9bb4-732594360b01	00230000-55ee-951d-147e-297ece568c85	alternacija
00240000-55ee-951d-3528-d4c0227c7164	00230000-55ee-951d-0634-344a70a99045	pogodba
00240000-55ee-951d-153e-eb3345af9985	00230000-55ee-951d-147e-297ece568c85	zaposlitev
00240000-55ee-951d-367c-9e971019bf42	00230000-55ee-951d-147e-297ece568c85	zvrstuprizoritve
00240000-55ee-951d-6d4c-8459e665bf84	00230000-55ee-951d-0634-344a70a99045	programdela
00240000-55ee-951d-4aca-ef5d708706b9	00230000-55ee-951d-147e-297ece568c85	zapis
\.


--
-- TOC entry 2899 (class 0 OID 17804706)
-- Dependencies: 170
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
029ff845-0dd9-450d-ad91-377d4b9c18dc	00240000-55ee-951d-a69a-9d49116701c3	0	1001
\.


--
-- TOC entry 2945 (class 0 OID 17805174)
-- Dependencies: 216
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55ee-951f-f62e-8dedd10df8a1	000e0000-55ee-951f-40b0-3b16e005149c	00080000-55ee-951e-e034-1fc480052f84	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55ee-951d-ab55-6cdf684be25b
00270000-55ee-951f-f5b7-59a1bee657a5	000e0000-55ee-951f-40b0-3b16e005149c	00080000-55ee-951e-e034-1fc480052f84	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55ee-951d-ab55-6cdf684be25b
00270000-55ee-951f-6004-971b12711bf9	000e0000-55ee-951f-40b0-3b16e005149c	00080000-55ee-951e-3583-80bcabe7eb62	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4	\N
\.


--
-- TOC entry 2912 (class 0 OID 17804832)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 17805011)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55ee-951f-a442-9eef8aef7900	00180000-55ee-951f-4076-dedb11e5b9ac	000c0000-55ee-951f-d731-cf554302aa92	00090000-55ee-951f-9930-a7321a46be64	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ee-951f-75eb-5c36c09caef6	00180000-55ee-951f-4076-dedb11e5b9ac	000c0000-55ee-951f-dbaf-c1becbc92f9c	00090000-55ee-951f-d4ba-be3c6fdfec67	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ee-951f-d99c-f7045eeafa0b	00180000-55ee-951f-4076-dedb11e5b9ac	000c0000-55ee-951f-aee9-aed64b4a9abb	00090000-55ee-951f-6ff1-e29df874dc8a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ee-951f-e037-38b1a5a22a08	00180000-55ee-951f-4076-dedb11e5b9ac	000c0000-55ee-951f-cdac-82ab10015bdd	00090000-55ee-951f-26f0-7071bcf72040	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ee-951f-573b-7fd121fc8b2e	00180000-55ee-951f-4076-dedb11e5b9ac	000c0000-55ee-951f-f30e-81bd03becb9d	00090000-55ee-951f-a3d7-55315b10164d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ee-951f-6e7e-08d24c36ab6f	00180000-55ee-951f-8031-319185aea5e3	\N	00090000-55ee-951f-a3d7-55315b10164d	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2948 (class 0 OID 17805214)
-- Dependencies: 219
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55ee-951d-e78a-fe4a65b74b77	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55ee-951d-85d0-2f055697d374	02	Priredba	Priredba	Priredba	umetnik
000f0000-55ee-951d-4bb1-fe91b50d4efb	03	Prevod	Prevod	Prevod	umetnik
000f0000-55ee-951d-8629-33b78d5008ae	04	Režija	Režija	Režija	umetnik
000f0000-55ee-951d-4bfd-0e64ff60f3e1	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55ee-951d-ee29-bb88599b5600	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55ee-951d-7666-42bb954bb2f1	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55ee-951d-07e4-6e49eb0fedcb	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55ee-951d-8ffa-6edd8422abc7	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55ee-951d-b9bd-706c2a8a01e3	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55ee-951d-e410-01a61970ef16	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55ee-951d-9c66-c9be9ddcdee7	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55ee-951d-ac1d-edc4538f0767	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55ee-951d-9523-4dbb7ee2d414	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55ee-951d-3d98-93f76913815c	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55ee-951d-6fcc-a7c65d9b51fe	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55ee-951d-5913-f46a2cf088a2	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55ee-951d-74d9-27a060df3d7a	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2960 (class 0 OID 17805444)
-- Dependencies: 231
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55ee-951d-c82f-7c9387ff1635	01	Velika predstava	f	1.00	1.00
002b0000-55ee-951d-c640-3d736b67a9cc	02	Mala predstava	f	0.50	0.50
002b0000-55ee-951d-a8d3-78c1f6317d46	03	Mala koprodukcija	t	0.40	1.00
002b0000-55ee-951d-1e93-a129ec956507	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55ee-951d-6b9c-03ea51e9a5d4	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2917 (class 0 OID 17804894)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 17804741)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55ee-951d-6390-798e699ffc28	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO4TkMysIbOfa/BfUqd/v4D3ocEWiWMHm	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55ee-951f-e7c2-38648acabdeb	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55ee-951f-4566-772c0f01f3a2	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55ee-951f-bdb7-e3bbc516e852	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55ee-951f-7516-e98576cd1536	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55ee-951f-7027-45aac9092971	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55ee-951f-f21c-edf5728565bb	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55ee-951f-553f-9fbfa08cc2cc	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55ee-951f-c8ef-d119df4e8031	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55ee-951f-6948-705ed447d00a	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55ee-951f-862a-e667e5a5f8c0	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55ee-951d-48cc-e443067c268d	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2952 (class 0 OID 17805263)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55ee-951f-82b4-6c5cd4860a5f	00160000-55ee-951e-952e-f2c06375ce1c	\N	00140000-55ee-951d-4784-eb63ad765c1f	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55ee-951e-8734-641dd0ab609f
000e0000-55ee-951f-40b0-3b16e005149c	00160000-55ee-951e-c34a-e7e8197db6f3	\N	00140000-55ee-951d-950e-892a7e1332c4	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55ee-951e-cb01-004467f9cbb1
000e0000-55ee-951f-eacd-74a22ade5fc8	\N	\N	00140000-55ee-951d-950e-892a7e1332c4	00190000-55ee-951f-03c0-3990c19c8819	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55ee-951e-8734-641dd0ab609f
000e0000-55ee-951f-5203-c93cc5209d3a	\N	\N	00140000-55ee-951d-950e-892a7e1332c4	00190000-55ee-951f-03c0-3990c19c8819	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55ee-951e-8734-641dd0ab609f
000e0000-55ee-951f-e843-6b4bcf0939ce	\N	\N	00140000-55ee-951d-950e-892a7e1332c4	00190000-55ee-951f-03c0-3990c19c8819	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55ee-951e-f71b-ba112fb7a24d
000e0000-55ee-951f-41e1-1ae1c6c0241a	\N	\N	00140000-55ee-951d-950e-892a7e1332c4	00190000-55ee-951f-03c0-3990c19c8819	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55ee-951e-f71b-ba112fb7a24d
\.


--
-- TOC entry 2922 (class 0 OID 17804955)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55ee-951f-e086-92b776f85527	000e0000-55ee-951f-40b0-3b16e005149c	\N	1	
00200000-55ee-951f-fe11-dd5fe6c072dd	000e0000-55ee-951f-40b0-3b16e005149c	\N	2	
\.


--
-- TOC entry 2936 (class 0 OID 17805082)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 17805188)
-- Dependencies: 217
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55ee-951d-42fa-cc12404c8268	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55ee-951d-2277-bfd74c801d97	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55ee-951d-16b6-e274c5cf689a	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55ee-951d-4793-5605a52e5cb0	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55ee-951d-3b62-7f3f3bc04726	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55ee-951d-8ac7-709676378167	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55ee-951d-1cbb-04c63d78576c	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55ee-951d-7ddc-ceb793f5ef41	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55ee-951d-ab55-6cdf684be25b	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55ee-951d-d98e-0139b80b05b8	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55ee-951d-8f42-30e930c7ae74	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55ee-951d-1a4f-25a83eaf7148	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55ee-951d-1e33-8864b83ff61f	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55ee-951d-fb42-f438a257fd6f	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55ee-951d-883f-ec59636083df	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55ee-951d-3a40-40776689e5df	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55ee-951d-db2b-62ecc89d375f	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55ee-951d-a19f-18e9c65530b8	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55ee-951d-e7f2-825f81d0b454	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55ee-951d-0c4c-972aca86e004	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55ee-951d-8167-ae1a38d7a30b	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55ee-951d-f3c3-42ae34ee4c09	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55ee-951d-cc57-212f8aa2d38a	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55ee-951d-9e67-5b2c2b9b6d61	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55ee-951d-bee1-ff47422faa79	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55ee-951d-ad5b-34716cd4c7cd	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55ee-951d-c0c5-1512914f1ea2	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55ee-951d-aec1-f741ff7d8094	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2963 (class 0 OID 17805490)
-- Dependencies: 234
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 17805462)
-- Dependencies: 233
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 17805502)
-- Dependencies: 235
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2943 (class 0 OID 17805154)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55ee-951f-b2c6-4f413036bb40	00090000-55ee-951f-d4ba-be3c6fdfec67	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ee-951f-bc25-48eb55e0fb29	00090000-55ee-951f-6ff1-e29df874dc8a	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ee-951f-d4cc-587e685cd6cf	00090000-55ee-951f-a398-5dede714486f	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ee-951f-2e1d-3ae945b3fc79	00090000-55ee-951f-84d2-719f41815f80	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ee-951f-f273-2b37956558e4	00090000-55ee-951f-9930-a7321a46be64	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ee-951f-97b6-8c8b8ab7be2e	00090000-55ee-951f-aee5-4ca24d29ffdc	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2924 (class 0 OID 17804991)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 17805253)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55ee-951d-4784-eb63ad765c1f	01	Drama	drama (SURS 01)
00140000-55ee-951d-e87e-07252f79de7a	02	Opera	opera (SURS 02)
00140000-55ee-951d-da1b-81d3ed798975	03	Balet	balet (SURS 03)
00140000-55ee-951d-6ad6-ace785b652da	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55ee-951d-584c-3d1686d77e5c	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55ee-951d-950e-892a7e1332c4	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55ee-951d-2f8e-085b033665ae	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2942 (class 0 OID 17805144)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2457 (class 2606 OID 17804795)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 17805312)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 17805302)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 17805213)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 17805542)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 17804980)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 17805000)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 17805460)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 17804920)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 17805367)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 17805140)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 17804953)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 17804934)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 17805047)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 17805519)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 17805526)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2692 (class 2606 OID 17805550)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 17805074)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 17804892)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 17804804)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 17804828)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 17804784)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2448 (class 2606 OID 17804769)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 17805080)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 17805116)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 17805248)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 17804856)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 17804880)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 17805053)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 17804870)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 17804941)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 17805065)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 17805423)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 17805431)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 17805415)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 17805442)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 17805098)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 17805038)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 17805029)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 17805236)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 17805171)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 17804740)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 17805107)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 17804758)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2450 (class 2606 OID 17804778)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 17805125)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 17805060)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 17805009)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 17804728)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 17804716)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 17804710)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 17805184)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 17804837)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 17805020)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 17805223)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 17805454)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 17804905)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 17804753)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 17805281)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 17804963)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 17805088)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 17805196)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 17805500)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 17805484)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 17805508)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 17805162)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 17804995)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 17805261)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 17805152)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 1259 OID 17804989)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2513 (class 1259 OID 17804990)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2514 (class 1259 OID 17804988)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2515 (class 1259 OID 17804987)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2597 (class 1259 OID 17805185)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2598 (class 1259 OID 17805186)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2599 (class 1259 OID 17805187)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2678 (class 1259 OID 17805521)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2679 (class 1259 OID 17805520)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2471 (class 1259 OID 17804858)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2560 (class 1259 OID 17805081)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2665 (class 1259 OID 17805488)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2666 (class 1259 OID 17805487)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2667 (class 1259 OID 17805489)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2668 (class 1259 OID 17805486)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2669 (class 1259 OID 17805485)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2554 (class 1259 OID 17805067)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2555 (class 1259 OID 17805066)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2507 (class 1259 OID 17804964)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2584 (class 1259 OID 17805141)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2585 (class 1259 OID 17805143)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2586 (class 1259 OID 17805142)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2496 (class 1259 OID 17804936)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2497 (class 1259 OID 17804935)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2657 (class 1259 OID 17805443)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2612 (class 1259 OID 17805250)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2613 (class 1259 OID 17805251)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2614 (class 1259 OID 17805252)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2675 (class 1259 OID 17805509)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2621 (class 1259 OID 17805286)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2622 (class 1259 OID 17805283)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2623 (class 1259 OID 17805287)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2624 (class 1259 OID 17805285)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2625 (class 1259 OID 17805284)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2486 (class 1259 OID 17804907)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2487 (class 1259 OID 17804906)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2462 (class 1259 OID 17804831)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2572 (class 1259 OID 17805108)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2452 (class 1259 OID 17804785)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2453 (class 1259 OID 17804786)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2577 (class 1259 OID 17805128)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2578 (class 1259 OID 17805127)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2579 (class 1259 OID 17805126)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2500 (class 1259 OID 17804942)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2501 (class 1259 OID 17804943)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2432 (class 1259 OID 17804718)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2534 (class 1259 OID 17805033)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2535 (class 1259 OID 17805031)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2536 (class 1259 OID 17805030)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2537 (class 1259 OID 17805032)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2443 (class 1259 OID 17804759)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2444 (class 1259 OID 17804760)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2563 (class 1259 OID 17805089)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2688 (class 1259 OID 17805543)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2689 (class 1259 OID 17805551)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2690 (class 1259 OID 17805552)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2549 (class 1259 OID 17805054)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2593 (class 1259 OID 17805172)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2594 (class 1259 OID 17805173)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2642 (class 1259 OID 17805372)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2643 (class 1259 OID 17805371)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2644 (class 1259 OID 17805368)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2645 (class 1259 OID 17805369)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2646 (class 1259 OID 17805370)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2475 (class 1259 OID 17804872)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2476 (class 1259 OID 17804871)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2477 (class 1259 OID 17804873)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2566 (class 1259 OID 17805102)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2567 (class 1259 OID 17805101)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2649 (class 1259 OID 17805424)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2650 (class 1259 OID 17805425)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2635 (class 1259 OID 17805316)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2636 (class 1259 OID 17805317)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2637 (class 1259 OID 17805314)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2638 (class 1259 OID 17805315)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2590 (class 1259 OID 17805163)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2540 (class 1259 OID 17805042)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2541 (class 1259 OID 17805041)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2542 (class 1259 OID 17805039)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2543 (class 1259 OID 17805040)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2631 (class 1259 OID 17805304)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2632 (class 1259 OID 17805303)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2506 (class 1259 OID 17804954)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2664 (class 1259 OID 17805461)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2682 (class 1259 OID 17805527)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2683 (class 1259 OID 17805528)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2458 (class 1259 OID 17804806)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2459 (class 1259 OID 17804805)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2467 (class 1259 OID 17804838)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2468 (class 1259 OID 17804839)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2529 (class 1259 OID 17805023)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2530 (class 1259 OID 17805022)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2531 (class 1259 OID 17805021)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2516 (class 1259 OID 17804982)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2517 (class 1259 OID 17804983)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2518 (class 1259 OID 17804981)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2519 (class 1259 OID 17804985)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2520 (class 1259 OID 17804986)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2521 (class 1259 OID 17804984)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2474 (class 1259 OID 17804857)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2492 (class 1259 OID 17804921)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2493 (class 1259 OID 17804923)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2494 (class 1259 OID 17804922)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2495 (class 1259 OID 17804924)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2548 (class 1259 OID 17805048)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2617 (class 1259 OID 17805249)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 17805282)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2608 (class 1259 OID 17805224)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2609 (class 1259 OID 17805225)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2465 (class 1259 OID 17804829)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2466 (class 1259 OID 17804830)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2587 (class 1259 OID 17805153)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2438 (class 1259 OID 17804729)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2485 (class 1259 OID 17804893)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2435 (class 1259 OID 17804717)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2570 (class 1259 OID 17805100)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2571 (class 1259 OID 17805099)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2639 (class 1259 OID 17805313)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 17804881)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2618 (class 1259 OID 17805262)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2672 (class 1259 OID 17805501)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2655 (class 1259 OID 17805432)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2656 (class 1259 OID 17805433)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2528 (class 1259 OID 17805010)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2451 (class 1259 OID 17804779)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2717 (class 2606 OID 17805673)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2718 (class 2606 OID 17805678)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2722 (class 2606 OID 17805698)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2716 (class 2606 OID 17805668)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2720 (class 2606 OID 17805688)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2721 (class 2606 OID 17805693)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2719 (class 2606 OID 17805683)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2752 (class 2606 OID 17805848)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2753 (class 2606 OID 17805853)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2754 (class 2606 OID 17805858)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2786 (class 2606 OID 17806018)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2785 (class 2606 OID 17806013)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2704 (class 2606 OID 17805608)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2738 (class 2606 OID 17805778)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2782 (class 2606 OID 17805998)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2781 (class 2606 OID 17805993)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2783 (class 2606 OID 17806003)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2780 (class 2606 OID 17805988)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2779 (class 2606 OID 17805983)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2737 (class 2606 OID 17805773)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2736 (class 2606 OID 17805768)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2715 (class 2606 OID 17805663)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2746 (class 2606 OID 17805818)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2748 (class 2606 OID 17805828)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2747 (class 2606 OID 17805823)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2711 (class 2606 OID 17805643)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2710 (class 2606 OID 17805638)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2734 (class 2606 OID 17805758)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2777 (class 2606 OID 17805973)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2755 (class 2606 OID 17805863)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2756 (class 2606 OID 17805868)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2757 (class 2606 OID 17805873)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2784 (class 2606 OID 17806008)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2761 (class 2606 OID 17805893)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2758 (class 2606 OID 17805878)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2762 (class 2606 OID 17805898)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2760 (class 2606 OID 17805888)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2759 (class 2606 OID 17805883)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2709 (class 2606 OID 17805633)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2708 (class 2606 OID 17805628)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2701 (class 2606 OID 17805593)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2700 (class 2606 OID 17805588)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2742 (class 2606 OID 17805798)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2696 (class 2606 OID 17805568)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2697 (class 2606 OID 17805573)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2745 (class 2606 OID 17805813)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2744 (class 2606 OID 17805808)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2743 (class 2606 OID 17805803)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2712 (class 2606 OID 17805648)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2713 (class 2606 OID 17805653)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2693 (class 2606 OID 17805553)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2729 (class 2606 OID 17805733)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2727 (class 2606 OID 17805723)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2726 (class 2606 OID 17805718)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2728 (class 2606 OID 17805728)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2694 (class 2606 OID 17805558)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2695 (class 2606 OID 17805563)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2739 (class 2606 OID 17805783)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2789 (class 2606 OID 17806033)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2790 (class 2606 OID 17806038)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2791 (class 2606 OID 17806043)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2735 (class 2606 OID 17805763)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2750 (class 2606 OID 17805838)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2751 (class 2606 OID 17805843)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2773 (class 2606 OID 17805953)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2772 (class 2606 OID 17805948)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2769 (class 2606 OID 17805933)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2770 (class 2606 OID 17805938)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2771 (class 2606 OID 17805943)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2706 (class 2606 OID 17805618)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2705 (class 2606 OID 17805613)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2707 (class 2606 OID 17805623)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2741 (class 2606 OID 17805793)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2740 (class 2606 OID 17805788)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2774 (class 2606 OID 17805958)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2775 (class 2606 OID 17805963)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2767 (class 2606 OID 17805923)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2768 (class 2606 OID 17805928)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2765 (class 2606 OID 17805913)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2766 (class 2606 OID 17805918)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2749 (class 2606 OID 17805833)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2733 (class 2606 OID 17805753)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2732 (class 2606 OID 17805748)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2730 (class 2606 OID 17805738)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2731 (class 2606 OID 17805743)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2764 (class 2606 OID 17805908)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2763 (class 2606 OID 17805903)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2714 (class 2606 OID 17805658)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2776 (class 2606 OID 17805968)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2778 (class 2606 OID 17805978)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2787 (class 2606 OID 17806023)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2788 (class 2606 OID 17806028)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2699 (class 2606 OID 17805583)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2698 (class 2606 OID 17805578)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2702 (class 2606 OID 17805598)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2703 (class 2606 OID 17805603)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2725 (class 2606 OID 17805713)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2724 (class 2606 OID 17805708)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2723 (class 2606 OID 17805703)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-08 09:58:25 CEST

--
-- PostgreSQL database dump complete
--

