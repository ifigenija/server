--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-08 17:31:27 CEST

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
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 240
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 18105084)
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
-- TOC entry 225 (class 1259 OID 18105603)
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
-- TOC entry 224 (class 1259 OID 18105586)
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
-- TOC entry 218 (class 1259 OID 18105494)
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
-- TOC entry 238 (class 1259 OID 18105827)
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
-- TOC entry 194 (class 1259 OID 18105262)
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
-- TOC entry 196 (class 1259 OID 18105293)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 232 (class 1259 OID 18105753)
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
-- TOC entry 189 (class 1259 OID 18105205)
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
-- TOC entry 226 (class 1259 OID 18105616)
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
-- TOC entry 212 (class 1259 OID 18105426)
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
-- TOC entry 192 (class 1259 OID 18105241)
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
-- TOC entry 190 (class 1259 OID 18105222)
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
-- TOC entry 201 (class 1259 OID 18105340)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 236 (class 1259 OID 18105808)
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
-- TOC entry 237 (class 1259 OID 18105820)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 18105842)
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
-- TOC entry 205 (class 1259 OID 18105365)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 18105179)
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
-- TOC entry 181 (class 1259 OID 18105093)
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
-- TOC entry 182 (class 1259 OID 18105104)
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
-- TOC entry 177 (class 1259 OID 18105058)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 18105077)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 18105372)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 18105406)
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
-- TOC entry 221 (class 1259 OID 18105535)
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
-- TOC entry 184 (class 1259 OID 18105137)
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
-- TOC entry 186 (class 1259 OID 18105171)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 18105346)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 185 (class 1259 OID 18105156)
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
-- TOC entry 191 (class 1259 OID 18105234)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 204 (class 1259 OID 18105358)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 18105714)
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
-- TOC entry 229 (class 1259 OID 18105724)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 227 (class 1259 OID 18105671)
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
-- TOC entry 230 (class 1259 OID 18105732)
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
-- TOC entry 208 (class 1259 OID 18105387)
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
-- TOC entry 200 (class 1259 OID 18105331)
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
-- TOC entry 199 (class 1259 OID 18105321)
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
-- TOC entry 220 (class 1259 OID 18105524)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 18105461)
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
-- TOC entry 174 (class 1259 OID 18105029)
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
-- TOC entry 173 (class 1259 OID 18105027)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 209 (class 1259 OID 18105400)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 18105067)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 18105051)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 18105414)
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
-- TOC entry 203 (class 1259 OID 18105352)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 18105298)
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
-- TOC entry 172 (class 1259 OID 18105016)
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
-- TOC entry 171 (class 1259 OID 18105008)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 170 (class 1259 OID 18105003)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 216 (class 1259 OID 18105471)
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
-- TOC entry 183 (class 1259 OID 18105129)
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
-- TOC entry 198 (class 1259 OID 18105308)
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
-- TOC entry 219 (class 1259 OID 18105512)
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
-- TOC entry 231 (class 1259 OID 18105742)
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
-- TOC entry 188 (class 1259 OID 18105191)
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
-- TOC entry 175 (class 1259 OID 18105038)
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
-- TOC entry 223 (class 1259 OID 18105561)
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
-- TOC entry 193 (class 1259 OID 18105252)
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
-- TOC entry 207 (class 1259 OID 18105379)
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
-- TOC entry 217 (class 1259 OID 18105485)
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
-- TOC entry 234 (class 1259 OID 18105788)
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
-- TOC entry 233 (class 1259 OID 18105760)
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
-- TOC entry 235 (class 1259 OID 18105800)
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
-- TOC entry 214 (class 1259 OID 18105451)
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
-- TOC entry 195 (class 1259 OID 18105288)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 18105551)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 213 (class 1259 OID 18105441)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2178 (class 2604 OID 18105032)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2910 (class 0 OID 18105084)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2955 (class 0 OID 18105603)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55ee-ff4d-ba80-da4de5b1ea89	000d0000-55ee-ff4d-f479-0ddd013ae715	\N	00090000-55ee-ff4d-9d37-43fb209f923c	000b0000-55ee-ff4d-ebcb-12fe74c27ebf	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55ee-ff4d-2ade-968febc98d7a	000d0000-55ee-ff4d-e82b-2b3d908d6e24	00100000-55ee-ff4d-ae88-4f063cbd916c	00090000-55ee-ff4d-1266-deeb87bbf20f	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55ee-ff4d-d850-2d012ecce2de	000d0000-55ee-ff4d-8f5a-b29cefe106a4	00100000-55ee-ff4d-e64a-a6d9f1fd460a	00090000-55ee-ff4d-7deb-adfc2c9844d0	\N	0003	t	\N	2015-09-08	\N	2	t	\N	f	f
000c0000-55ee-ff4d-5750-697be4decbda	000d0000-55ee-ff4d-1206-0fe9718038e2	\N	00090000-55ee-ff4d-5b07-142af129cc86	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55ee-ff4d-7182-96b47b3dc8cc	000d0000-55ee-ff4d-c56f-0059d1e52fe2	\N	00090000-55ee-ff4d-029d-8fb874c8dcf0	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55ee-ff4d-60a3-891568cf8d7f	000d0000-55ee-ff4d-4e15-d0c8656c9237	\N	00090000-55ee-ff4d-3ec8-208f5fc86879	000b0000-55ee-ff4d-12b7-42ea1ac84b42	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55ee-ff4d-66cc-daa7ef679553	000d0000-55ee-ff4d-8a47-1220a9ae54aa	00100000-55ee-ff4d-e486-4ec232006147	00090000-55ee-ff4d-5e94-936d7aeb8e5d	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55ee-ff4d-c157-2478e8097499	000d0000-55ee-ff4d-ee3c-71e0aaf11264	\N	00090000-55ee-ff4d-ed07-864bc2dd94b7	000b0000-55ee-ff4d-a5bf-215d7d1f88a6	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55ee-ff4d-d41d-ac54ca62cd51	000d0000-55ee-ff4d-8a47-1220a9ae54aa	00100000-55ee-ff4d-d913-58df5e497ca3	00090000-55ee-ff4d-bf8e-4ae377fad588	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55ee-ff4d-3fdd-78bc0cbf571e	000d0000-55ee-ff4d-8a47-1220a9ae54aa	00100000-55ee-ff4d-fcca-e3b74c17322a	00090000-55ee-ff4d-22d2-c00f479caf69	\N	0010	t	\N	2015-09-08	\N	16	f	\N	f	t
000c0000-55ee-ff4d-da73-7a11494026cd	000d0000-55ee-ff4d-8a47-1220a9ae54aa	00100000-55ee-ff4d-1964-6ae99568c5dc	00090000-55ee-ff4d-3c5d-2b8ccd329548	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-55ee-ff4d-49e2-78f9776c8b76	000d0000-55ee-ff4d-05ef-66afe1514d45	\N	00090000-55ee-ff4d-1266-deeb87bbf20f	000b0000-55ee-ff4d-b311-c739aae753a6	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 2954 (class 0 OID 18105586)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 18105494)
-- Dependencies: 218
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55ee-ff4d-76b5-d6b7cd63eb67	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55ee-ff4d-98c8-27ef4559909e	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55ee-ff4d-7414-ddf67a14b3be	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2968 (class 0 OID 18105827)
-- Dependencies: 238
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2924 (class 0 OID 18105262)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55ee-ff4d-5916-f32efc0101aa	\N	\N	00200000-55ee-ff4d-46b7-948e4574da91	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55ee-ff4d-7d63-0ebd3309b748	\N	\N	00200000-55ee-ff4d-ecfe-851eaa1acabc	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55ee-ff4d-9b0c-b477780ecab1	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55ee-ff4d-3ab2-84125761c6cc	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55ee-ff4d-6468-a6e4da593ce6	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2926 (class 0 OID 18105293)
-- Dependencies: 196
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 18105753)
-- Dependencies: 232
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2919 (class 0 OID 18105205)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55ee-ff4c-e61d-63778b049fc2	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55ee-ff4c-b1c3-4ae5fe7713c1	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55ee-ff4c-9073-adc3d5781807	AL	ALB	008	Albania 	Albanija	\N
00040000-55ee-ff4c-d740-954320c32b7c	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55ee-ff4c-8e6a-062590204280	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55ee-ff4c-2abe-40d1db58bde2	AD	AND	020	Andorra 	Andora	\N
00040000-55ee-ff4c-1551-5a7c7103e17b	AO	AGO	024	Angola 	Angola	\N
00040000-55ee-ff4c-03b3-fb319025326e	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55ee-ff4c-2ed1-e530a7f5bfdb	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55ee-ff4c-b312-e68b3253e5ed	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55ee-ff4c-36de-eaa574b6a855	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55ee-ff4c-3e48-d6c74b40db67	AM	ARM	051	Armenia 	Armenija	\N
00040000-55ee-ff4c-a34c-e338437b4c1c	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55ee-ff4c-119b-727af2fd1fd0	AU	AUS	036	Australia 	Avstralija	\N
00040000-55ee-ff4c-bada-9e595dba70fa	AT	AUT	040	Austria 	Avstrija	\N
00040000-55ee-ff4c-f6fd-ab9eb5d81e10	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55ee-ff4c-da06-f8ae985bbc00	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55ee-ff4c-d9e4-7c384607167e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55ee-ff4c-de72-a2e90d5c8fb2	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55ee-ff4c-12df-59f5b27cc3a6	BB	BRB	052	Barbados 	Barbados	\N
00040000-55ee-ff4c-8c68-0fc661963c38	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55ee-ff4c-75fd-2fad80e52290	BE	BEL	056	Belgium 	Belgija	\N
00040000-55ee-ff4c-78f6-a4db7b9615e5	BZ	BLZ	084	Belize 	Belize	\N
00040000-55ee-ff4c-320e-36e3ebf07060	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55ee-ff4c-7d76-ff448b90cbc1	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55ee-ff4c-2886-fdfbd0240ceb	BT	BTN	064	Bhutan 	Butan	\N
00040000-55ee-ff4c-2872-f30829392219	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55ee-ff4c-8f9a-a5e15175a533	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55ee-ff4c-049a-dfd5d699a57c	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55ee-ff4c-438e-a76a8fe1dd11	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55ee-ff4c-29d2-7475a83d0141	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55ee-ff4c-e196-41ad72b14498	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55ee-ff4c-8ffd-d3b88fc4d4c7	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55ee-ff4c-fa3b-a3f66075627c	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55ee-ff4c-3ee2-56467928db11	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55ee-ff4c-9986-cfbc3a08cf00	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55ee-ff4c-0ff7-3b6826b39d8b	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55ee-ff4c-1392-03b6627c054d	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55ee-ff4c-e0e6-6c9165acb609	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55ee-ff4c-9bbf-9ca4b93505d3	CA	CAN	124	Canada 	Kanada	\N
00040000-55ee-ff4c-db28-69c7e33172c1	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55ee-ff4c-8350-4640e028d6b3	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55ee-ff4c-f855-bce336c7fbd1	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55ee-ff4c-2e7c-edb308e1117d	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55ee-ff4c-968b-37ec293e5f0c	CL	CHL	152	Chile 	Čile	\N
00040000-55ee-ff4c-d356-30985f481a2b	CN	CHN	156	China 	Kitajska	\N
00040000-55ee-ff4c-c105-6b29106abf34	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55ee-ff4c-e959-4fddbb8db756	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55ee-ff4c-815c-96bd7c96e490	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55ee-ff4c-35d5-4f837c051a12	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55ee-ff4c-3156-2db038d66787	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55ee-ff4c-e881-0d16cf487484	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55ee-ff4c-651a-c4629ca82170	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55ee-ff4c-236f-0932360b166a	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55ee-ff4c-fb83-0461737526b0	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55ee-ff4c-6c02-ef2edd5d100b	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55ee-ff4c-9bdd-1d2f750a4993	CU	CUB	192	Cuba 	Kuba	\N
00040000-55ee-ff4c-f2f1-e41da039e55f	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55ee-ff4c-2e8b-c8ae0fe40210	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55ee-ff4c-d1fe-03cf92f7bd79	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55ee-ff4c-3a88-d4321fd38079	DK	DNK	208	Denmark 	Danska	\N
00040000-55ee-ff4c-5705-ba3662a179f0	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55ee-ff4c-bb56-88f84fe710d1	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55ee-ff4c-db30-3a208db3ed6f	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55ee-ff4c-d457-0802ddf89df7	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55ee-ff4c-d63b-49c50a1a2fb4	EG	EGY	818	Egypt 	Egipt	\N
00040000-55ee-ff4c-c246-df0d59b4ca76	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55ee-ff4c-4d72-903bf91c42ac	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55ee-ff4c-94c6-a3610362223f	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55ee-ff4c-fc50-09bb609d6102	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55ee-ff4c-ed04-9d14e7f66391	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55ee-ff4c-4742-ba701f41aa9b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55ee-ff4c-656d-e971ee9680f0	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55ee-ff4c-d996-24924bb451d3	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55ee-ff4c-4a22-980e9dbd6be9	FI	FIN	246	Finland 	Finska	\N
00040000-55ee-ff4c-7637-61d761bae70e	FR	FRA	250	France 	Francija	\N
00040000-55ee-ff4c-190b-783ecff2d375	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55ee-ff4c-f593-c578417f0753	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55ee-ff4c-ce9e-deb6997154db	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55ee-ff4c-927e-b64d39f621f2	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55ee-ff4c-8dd2-a73fed1bc983	GA	GAB	266	Gabon 	Gabon	\N
00040000-55ee-ff4c-e123-1f50f6b814a6	GM	GMB	270	Gambia 	Gambija	\N
00040000-55ee-ff4c-b0cf-c05142827e03	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55ee-ff4c-ed31-8428706480b0	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55ee-ff4c-55a1-0fba177935a1	GH	GHA	288	Ghana 	Gana	\N
00040000-55ee-ff4c-3d99-e0ea5b9dc8e6	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55ee-ff4c-65b4-423ab14f2147	GR	GRC	300	Greece 	Grčija	\N
00040000-55ee-ff4c-8870-6fb40ec2cd27	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55ee-ff4c-cab9-1cdf30202304	GD	GRD	308	Grenada 	Grenada	\N
00040000-55ee-ff4c-eb60-7f79e14e6c1e	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55ee-ff4c-b592-7c5216fd1782	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55ee-ff4c-c67c-5f2d950dd985	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55ee-ff4c-a2f2-33fb19ba5365	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55ee-ff4c-4ff5-9117655060b7	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55ee-ff4c-c868-c20bbce49632	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55ee-ff4c-6974-5427ada97b81	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55ee-ff4c-a7b7-68893500e3d4	HT	HTI	332	Haiti 	Haiti	\N
00040000-55ee-ff4c-0d49-6d46ae7acec5	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55ee-ff4c-1590-93a80da7e634	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55ee-ff4c-1d3c-964d461ad1fa	HN	HND	340	Honduras 	Honduras	\N
00040000-55ee-ff4c-a277-6c5f023162c0	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55ee-ff4c-ab3a-dddc780edb65	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55ee-ff4c-a892-f3f8980f9fd5	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55ee-ff4c-1be2-ebb6d30f77ab	IN	IND	356	India 	Indija	\N
00040000-55ee-ff4c-7bc9-ca6aed9d21b2	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55ee-ff4c-e3ad-12306b7a2243	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55ee-ff4c-c9fa-4bf24cbf3ebf	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55ee-ff4c-4fc9-41d0323e6068	IE	IRL	372	Ireland 	Irska	\N
00040000-55ee-ff4c-8296-7546d6b4a6c8	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55ee-ff4c-ea1e-a1c42820c85b	IL	ISR	376	Israel 	Izrael	\N
00040000-55ee-ff4c-f4de-4ce444e94b46	IT	ITA	380	Italy 	Italija	\N
00040000-55ee-ff4c-9218-f81f483e703d	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55ee-ff4c-ab1f-fff7d3ef4066	JP	JPN	392	Japan 	Japonska	\N
00040000-55ee-ff4c-0bb4-2d6eb4bba1e5	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55ee-ff4c-a307-899767bea487	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55ee-ff4c-99ab-bdb87654cd43	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55ee-ff4c-7812-ba9374d5a2dd	KE	KEN	404	Kenya 	Kenija	\N
00040000-55ee-ff4c-f9e7-52d692e6afa4	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55ee-ff4c-9655-69b971d6eaa2	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55ee-ff4c-ade1-b345ee66bf81	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55ee-ff4c-b1b4-d097c14edef9	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55ee-ff4c-e42b-e83adcbe09c5	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55ee-ff4c-8a4f-9d4fb2e47df9	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55ee-ff4c-5acf-a61880ef26f1	LV	LVA	428	Latvia 	Latvija	\N
00040000-55ee-ff4c-54fd-5478de5c7fce	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55ee-ff4c-81c0-0ffe6d79f79a	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55ee-ff4c-5098-1d37c1b63364	LR	LBR	430	Liberia 	Liberija	\N
00040000-55ee-ff4c-7812-2edb8315d59b	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55ee-ff4c-49df-0d0bb372cb86	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55ee-ff4c-2a22-746efab248ab	LT	LTU	440	Lithuania 	Litva	\N
00040000-55ee-ff4c-f849-20ec47dc2689	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55ee-ff4c-6d27-92d1e6d0c646	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55ee-ff4c-bb0a-14010c2d62f1	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55ee-ff4c-43eb-8edeca5eb9a0	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55ee-ff4c-d4e6-995e6ce3b3bf	MW	MWI	454	Malawi 	Malavi	\N
00040000-55ee-ff4c-8371-a34d3cb9bca0	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55ee-ff4c-4c19-e1fd9f8e19e2	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55ee-ff4c-4895-acda46a3833b	ML	MLI	466	Mali 	Mali	\N
00040000-55ee-ff4c-5571-e80957dbdce1	MT	MLT	470	Malta 	Malta	\N
00040000-55ee-ff4c-9ba9-5c44cf341589	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55ee-ff4c-1419-d95e6734351a	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55ee-ff4c-b46a-6fab4130552c	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55ee-ff4c-9184-aadef8b9d8ff	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55ee-ff4c-fd9f-4e7c30e9f6ab	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55ee-ff4c-31ca-6612c1c4a86d	MX	MEX	484	Mexico 	Mehika	\N
00040000-55ee-ff4c-f6d8-e70093d003ee	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55ee-ff4c-7d9a-7bd55e43ce55	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55ee-ff4c-10f7-6cbfa36bdb00	MC	MCO	492	Monaco 	Monako	\N
00040000-55ee-ff4c-e5ad-f88ad2aaef85	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55ee-ff4c-1143-62a821dc07f0	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55ee-ff4c-db4a-d2a140cd31b2	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55ee-ff4c-148e-132bd1ea5634	MA	MAR	504	Morocco 	Maroko	\N
00040000-55ee-ff4c-515e-38e9dc8a103d	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55ee-ff4c-4ce9-e0d28f531223	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55ee-ff4c-2493-ae2a9f7396de	NA	NAM	516	Namibia 	Namibija	\N
00040000-55ee-ff4c-499b-58873d9f5e04	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55ee-ff4c-74e0-54e7a35468a6	NP	NPL	524	Nepal 	Nepal	\N
00040000-55ee-ff4c-4fc1-23b84e78ea81	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55ee-ff4c-3d2c-c540cb235e58	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55ee-ff4c-e55a-3616fd85c91a	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55ee-ff4c-7c06-ae1854cc7ced	NE	NER	562	Niger 	Niger 	\N
00040000-55ee-ff4c-0e63-1f7d561a7824	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55ee-ff4c-0cde-68ac7fad0fae	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55ee-ff4c-519a-b73c175b9586	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55ee-ff4c-9351-f83d3ed14528	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55ee-ff4c-dad6-29449853137e	NO	NOR	578	Norway 	Norveška	\N
00040000-55ee-ff4c-38ad-779efcdb97be	OM	OMN	512	Oman 	Oman	\N
00040000-55ee-ff4c-8339-f13339a8241b	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55ee-ff4c-0178-0e430cef1274	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55ee-ff4c-a165-960c6a6ebe70	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55ee-ff4c-98fc-d09aa6bfb807	PA	PAN	591	Panama 	Panama	\N
00040000-55ee-ff4c-8e06-dfe1e0612caf	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55ee-ff4c-0351-9003ebf05675	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55ee-ff4c-fdaf-c293018221b6	PE	PER	604	Peru 	Peru	\N
00040000-55ee-ff4c-0d53-d05d345976be	PH	PHL	608	Philippines 	Filipini	\N
00040000-55ee-ff4c-b8ef-94feb101c156	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55ee-ff4c-0708-0853cee12a3a	PL	POL	616	Poland 	Poljska	\N
00040000-55ee-ff4c-1c3e-256601d92ecd	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55ee-ff4c-7996-6a8c27cc83ad	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55ee-ff4c-4881-4e36b11e494e	QA	QAT	634	Qatar 	Katar	\N
00040000-55ee-ff4c-8bf3-67a9b0965ee1	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55ee-ff4c-4910-0bfa4500c5c3	RO	ROU	642	Romania 	Romunija	\N
00040000-55ee-ff4c-f47e-c40eb8625dbc	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55ee-ff4c-b884-1b42a5e9665d	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55ee-ff4c-3288-e98d20a610a6	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55ee-ff4c-76b8-5a6cd5351623	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55ee-ff4c-3c17-c881ad0bdc0f	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55ee-ff4c-6a6c-d0b7c0c10706	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55ee-ff4c-72b6-efed3ee53eb2	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55ee-ff4c-81cc-c6e83c26312a	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55ee-ff4c-f46f-82fef454fad8	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55ee-ff4c-85f6-13cb716566fc	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55ee-ff4c-422c-64bc7f4ae8ce	SM	SMR	674	San Marino 	San Marino	\N
00040000-55ee-ff4c-d39a-0c653511276b	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55ee-ff4c-f71b-df444fd67d87	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55ee-ff4c-aef4-ca8dd7b26be3	SN	SEN	686	Senegal 	Senegal	\N
00040000-55ee-ff4c-7270-0be5fdf34933	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55ee-ff4c-091d-9bf5de32ee8d	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55ee-ff4c-530d-40ff79037980	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55ee-ff4c-2eba-0d615f3d8715	SG	SGP	702	Singapore 	Singapur	\N
00040000-55ee-ff4c-fc07-2544956bf8f2	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55ee-ff4c-7b04-0a3136d07a3e	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55ee-ff4c-2273-d09a84e1cb03	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55ee-ff4c-5e6a-e07b77cf8090	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55ee-ff4c-e33b-af65741b6273	SO	SOM	706	Somalia 	Somalija	\N
00040000-55ee-ff4c-c513-a64695863d21	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55ee-ff4c-e867-015cc42b6502	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55ee-ff4c-4d56-e4d74324085a	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55ee-ff4c-4610-fb528e418f61	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55ee-ff4c-5c9b-84d35ec21972	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55ee-ff4c-9196-052d41b7cb80	SD	SDN	729	Sudan 	Sudan	\N
00040000-55ee-ff4c-1923-e6809b26ab3e	SR	SUR	740	Suriname 	Surinam	\N
00040000-55ee-ff4c-8c62-fc42616fd9a8	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55ee-ff4c-65be-529930658f71	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55ee-ff4c-008e-c932ebb323f3	SE	SWE	752	Sweden 	Švedska	\N
00040000-55ee-ff4c-5e12-4839d1301000	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55ee-ff4c-cac9-f5469cf1b2b4	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55ee-ff4c-d316-7dcdebd4f0e6	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55ee-ff4c-25bf-3b28fc0b02e0	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55ee-ff4c-7a27-92b9389791a0	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55ee-ff4c-032b-0b535537b45b	TH	THA	764	Thailand 	Tajska	\N
00040000-55ee-ff4c-d8da-ebe5daaf0dca	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55ee-ff4c-a2f0-4c9f1f0f58d7	TG	TGO	768	Togo 	Togo	\N
00040000-55ee-ff4c-48a3-ffbc3b8d7edc	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55ee-ff4c-f3e8-2e1c75e7730d	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55ee-ff4c-30fe-c6c628d8c934	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55ee-ff4c-8fc1-7591cc013a94	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55ee-ff4c-1de0-59df3feee510	TR	TUR	792	Turkey 	Turčija	\N
00040000-55ee-ff4c-0c68-a418ae08f3bc	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55ee-ff4c-20b3-eadfa9cb19da	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55ee-ff4c-1382-906f74d87daf	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55ee-ff4c-4d6a-80ea4343e050	UG	UGA	800	Uganda 	Uganda	\N
00040000-55ee-ff4c-a744-58c0b085b258	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55ee-ff4c-b402-fadc46948134	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55ee-ff4c-5cc0-b64bda0787a1	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55ee-ff4c-c23a-4e5f68324a05	US	USA	840	United States 	Združene države Amerike	\N
00040000-55ee-ff4c-d2da-ce69cb2d0dcb	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55ee-ff4c-1a85-4cf2737574e2	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55ee-ff4c-c663-186de7f2226e	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55ee-ff4c-5e15-86dcec98d690	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55ee-ff4c-a827-c02f66f37241	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55ee-ff4c-099a-cc73073eb8e5	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55ee-ff4c-4816-f98ca9b9c1f0	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55ee-ff4c-374f-f5e37d6268a8	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55ee-ff4c-b29a-a8c367cef4db	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55ee-ff4c-97b8-0d1abfc3bc46	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55ee-ff4c-b22c-6ff26d8a84e8	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55ee-ff4c-9ff9-7bff5c3c6259	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55ee-ff4c-7408-a96f812c71bc	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2956 (class 0 OID 18105616)
-- Dependencies: 226
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55ee-ff4d-16cd-9ae0d8930fce	000e0000-55ee-ff4d-f295-a9964d2041f8	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ee-ff4c-fe3b-a75977f5a059	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55ee-ff4d-7f6b-90dbe815a9d1	000e0000-55ee-ff4d-61b6-64e92e6e4051	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ee-ff4c-7cfe-cf7493bd3a19	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55ee-ff4d-a53a-06a7983ad9dc	000e0000-55ee-ff4d-67c1-f355c27daec0	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ee-ff4c-fe3b-a75977f5a059	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55ee-ff4d-150c-e02aaae355ab	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55ee-ff4d-0743-f7b84d8f0cb1	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2942 (class 0 OID 18105426)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55ee-ff4d-f479-0ddd013ae715	000e0000-55ee-ff4d-61b6-64e92e6e4051	000c0000-55ee-ff4d-ba80-da4de5b1ea89	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55ee-ff4c-050f-52bc8dc4a191
000d0000-55ee-ff4d-e82b-2b3d908d6e24	000e0000-55ee-ff4d-61b6-64e92e6e4051	000c0000-55ee-ff4d-2ade-968febc98d7a	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55ee-ff4c-c21e-a86f3840ae57
000d0000-55ee-ff4d-8f5a-b29cefe106a4	000e0000-55ee-ff4d-61b6-64e92e6e4051	000c0000-55ee-ff4d-d850-2d012ecce2de	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55ee-ff4c-5ad1-358dcd237cb9
000d0000-55ee-ff4d-1206-0fe9718038e2	000e0000-55ee-ff4d-61b6-64e92e6e4051	000c0000-55ee-ff4d-5750-697be4decbda	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55ee-ff4c-2141-5cb49ddd196a
000d0000-55ee-ff4d-c56f-0059d1e52fe2	000e0000-55ee-ff4d-61b6-64e92e6e4051	000c0000-55ee-ff4d-7182-96b47b3dc8cc	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55ee-ff4c-2141-5cb49ddd196a
000d0000-55ee-ff4d-4e15-d0c8656c9237	000e0000-55ee-ff4d-61b6-64e92e6e4051	000c0000-55ee-ff4d-60a3-891568cf8d7f	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55ee-ff4c-050f-52bc8dc4a191
000d0000-55ee-ff4d-8a47-1220a9ae54aa	000e0000-55ee-ff4d-61b6-64e92e6e4051	000c0000-55ee-ff4d-d41d-ac54ca62cd51	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55ee-ff4c-050f-52bc8dc4a191
000d0000-55ee-ff4d-ee3c-71e0aaf11264	000e0000-55ee-ff4d-61b6-64e92e6e4051	000c0000-55ee-ff4d-c157-2478e8097499	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55ee-ff4c-b8f0-b9d0157955cb
000d0000-55ee-ff4d-05ef-66afe1514d45	000e0000-55ee-ff4d-61b6-64e92e6e4051	000c0000-55ee-ff4d-49e2-78f9776c8b76	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-55ee-ff4c-7a9e-075a96f6099b
\.


--
-- TOC entry 2922 (class 0 OID 18105241)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 18105222)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55ee-ff4d-5640-f37c1ae73022	00080000-55ee-ff4d-f444-09eac8b1fca0	00090000-55ee-ff4d-22d2-c00f479caf69	AK		igralka
\.


--
-- TOC entry 2931 (class 0 OID 18105340)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 18105808)
-- Dependencies: 236
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 18105820)
-- Dependencies: 237
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 18105842)
-- Dependencies: 239
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 18105365)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2917 (class 0 OID 18105179)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55ee-ff4c-6f4f-50511828f4da	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55ee-ff4c-2dc7-71099485c1fd	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55ee-ff4c-f1ae-789326b2bed0	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55ee-ff4c-1a67-f1ffe9ff14cc	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55ee-ff4c-ad0d-87cc18b611d5	dogodek.status	array	a:7:{i:100;a:1:{s:5:"label";s:11:"Dolgoročno";}i:200;a:1:{s:5:"label";s:9:"Planirano";}i:300;a:1:{s:5:"label";s:8:"Fiksiran";}i:400;a:1:{s:5:"label";s:17:"Potrjen - interno";}i:500;a:1:{s:5:"label";s:15:"Potrjen - javno";}i:600;a:1:{s:5:"label";s:10:"Zaključen";}i:700;a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55ee-ff4c-d113-d0c594135a98	dogodek.razred	array	a:5:{i:100;a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}i:200;a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}i:300;a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}i:400;a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}i:500;a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55ee-ff4c-ea9d-199dfc7a30a6	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55ee-ff4c-99a3-62501cd436e2	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55ee-ff4c-7f67-48a9af75cd1e	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55ee-ff4c-0825-afb259990516	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55ee-ff4c-af1e-4471bee30a91	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55ee-ff4c-3e77-6294c65a54a7	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55ee-ff4c-ee5b-8a90aeb1bd3c	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-55ee-ff4c-0bc3-031652c9de17	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55ee-ff4d-b949-5f6990551463	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55ee-ff4d-f193-0440346f8b6d	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55ee-ff4d-b6d7-9d10054315da	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55ee-ff4d-7ef5-fb05ef6df01c	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55ee-ff4d-4e33-be2640c1226a	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55ee-ff4e-7e3c-84a40d3a07f5	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2911 (class 0 OID 18105093)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55ee-ff4d-7683-f5efd1923d7f	00000000-55ee-ff4d-b949-5f6990551463	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55ee-ff4d-bc16-8a9b10e9d5df	00000000-55ee-ff4d-b949-5f6990551463	00010000-55ee-ff4c-187d-bc340996295f	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55ee-ff4d-8e4c-156adecc83a4	00000000-55ee-ff4d-f193-0440346f8b6d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2912 (class 0 OID 18105104)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55ee-ff4d-9d37-43fb209f923c	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55ee-ff4d-5b07-142af129cc86	00010000-55ee-ff4d-732b-df678ca4cfd7	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55ee-ff4d-7deb-adfc2c9844d0	00010000-55ee-ff4d-e516-303fb8ab784c	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55ee-ff4d-bf8e-4ae377fad588	00010000-55ee-ff4d-8933-4aab918d02f9	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55ee-ff4d-101e-7a7329180474	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55ee-ff4d-3ec8-208f5fc86879	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55ee-ff4d-3c5d-2b8ccd329548	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55ee-ff4d-5e94-936d7aeb8e5d	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55ee-ff4d-22d2-c00f479caf69	00010000-55ee-ff4d-df74-bce503ee338a	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55ee-ff4d-1266-deeb87bbf20f	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55ee-ff4d-b891-89e3223531a1	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55ee-ff4d-029d-8fb874c8dcf0	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55ee-ff4d-ed07-864bc2dd94b7	00010000-55ee-ff4d-bedb-a4112290da57	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2907 (class 0 OID 18105058)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55ee-ff4c-4d2d-ace6d5cceac0	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55ee-ff4c-8281-652563eecac6	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55ee-ff4c-5691-13c7b59f2c40	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55ee-ff4c-034d-61c54f9ea269	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55ee-ff4c-dea9-8a92761aaf2d	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55ee-ff4c-7616-b5cf7d509cb5	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55ee-ff4c-6ed4-8885159ce510	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55ee-ff4c-1d0c-0b039f033b3b	Abonma-read	Abonma - branje	f
00030000-55ee-ff4c-7522-2102ea56f4c2	Abonma-write	Abonma - spreminjanje	f
00030000-55ee-ff4c-4a60-b17764b0d15f	Alternacija-read	Alternacija - branje	f
00030000-55ee-ff4c-00a4-874866f15d96	Alternacija-write	Alternacija - spreminjanje	f
00030000-55ee-ff4c-20ab-b8ec64b6c94b	Arhivalija-read	Arhivalija - branje	f
00030000-55ee-ff4c-667f-487d240df424	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55ee-ff4c-0442-7dd0607ca9d1	Besedilo-read	Besedilo - branje	f
00030000-55ee-ff4c-3ecd-9a1fecdebba2	Besedilo-write	Besedilo - spreminjanje	f
00030000-55ee-ff4c-e930-60290e663171	DogodekIzven-read	DogodekIzven - branje	f
00030000-55ee-ff4c-3e91-a2c7e588ec7b	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55ee-ff4c-9cc6-e778b35aaaed	Dogodek-read	Dogodek - branje	f
00030000-55ee-ff4c-7b79-6c0073d36d27	Dogodek-write	Dogodek - spreminjanje	f
00030000-55ee-ff4c-2df5-b3fafd56ccd0	DrugiVir-read	DrugiVir - branje	f
00030000-55ee-ff4c-d912-4e4f5cba1d10	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55ee-ff4c-a4ef-863fc8fce965	Drzava-read	Drzava - branje	f
00030000-55ee-ff4c-33d8-1aeae427591e	Drzava-write	Drzava - spreminjanje	f
00030000-55ee-ff4c-d17d-4da7e292277e	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55ee-ff4c-0a3e-47feb5ecbf21	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55ee-ff4c-d888-f232a77df95a	Funkcija-read	Funkcija - branje	f
00030000-55ee-ff4c-98a4-63ce1388a0e5	Funkcija-write	Funkcija - spreminjanje	f
00030000-55ee-ff4c-9049-9bed20d89439	Gostovanje-read	Gostovanje - branje	f
00030000-55ee-ff4c-d694-7a091446e05c	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55ee-ff4c-89a2-fd8dd8db1346	Gostujoca-read	Gostujoca - branje	f
00030000-55ee-ff4c-7734-ee402d9f07ee	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55ee-ff4c-e161-5f90c4975bf8	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55ee-ff4c-63f4-cc9128eab44f	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55ee-ff4c-e238-4f2dc5e47b9a	Kupec-read	Kupec - branje	f
00030000-55ee-ff4c-e384-fc8dabc2072e	Kupec-write	Kupec - spreminjanje	f
00030000-55ee-ff4c-a90b-df8d1292661e	NacinPlacina-read	NacinPlacina - branje	f
00030000-55ee-ff4c-b9a6-5a841477898a	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55ee-ff4c-9e5d-2f5ece621640	Option-read	Option - branje	f
00030000-55ee-ff4c-962c-cc6b0882f097	Option-write	Option - spreminjanje	f
00030000-55ee-ff4c-abbc-9a2bebd54e83	OptionValue-read	OptionValue - branje	f
00030000-55ee-ff4c-134f-4911abeba3db	OptionValue-write	OptionValue - spreminjanje	f
00030000-55ee-ff4c-6a3c-d52ae41d869e	Oseba-read	Oseba - branje	f
00030000-55ee-ff4c-51a7-644e0dfbf3c1	Oseba-write	Oseba - spreminjanje	f
00030000-55ee-ff4c-b59d-c3923ca3a641	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55ee-ff4c-888d-40398488579c	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55ee-ff4c-bebe-9ebf7113c4de	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55ee-ff4c-03d8-d464cd5d83be	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55ee-ff4c-7f6e-c7fb62fb87f7	Pogodba-read	Pogodba - branje	f
00030000-55ee-ff4c-7763-82065407f03c	Pogodba-write	Pogodba - spreminjanje	f
00030000-55ee-ff4c-4c92-3c30aa399ad2	Popa-read	Popa - branje	f
00030000-55ee-ff4c-4969-ccd0efffde0f	Popa-write	Popa - spreminjanje	f
00030000-55ee-ff4c-b9b0-9bb340695e67	Posta-read	Posta - branje	f
00030000-55ee-ff4c-d7f1-5bb4f39d9a69	Posta-write	Posta - spreminjanje	f
00030000-55ee-ff4c-a8da-67188fcadf2d	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55ee-ff4c-e0fa-30a0531ce392	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55ee-ff4c-a105-b2fe76891348	PostniNaslov-read	PostniNaslov - branje	f
00030000-55ee-ff4c-92a4-ce8dcd04fd25	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55ee-ff4c-a7e1-7c42d7501c17	Predstava-read	Predstava - branje	f
00030000-55ee-ff4c-6427-a2232fd6ffa7	Predstava-write	Predstava - spreminjanje	f
00030000-55ee-ff4c-0808-04a734ce5cce	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55ee-ff4c-41dd-62eb51337906	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55ee-ff4c-ee85-653fada9b0d4	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55ee-ff4c-874d-c4716b475216	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55ee-ff4c-07f5-bae33719a41b	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55ee-ff4c-fd0d-7947ce3d3144	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55ee-ff4c-fc78-894cfcd13ad7	ProgramDela-read	ProgramDela - branje	f
00030000-55ee-ff4c-1483-9c987af4e04f	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55ee-ff4c-6f0c-798c06089c0b	ProgramFestival-read	ProgramFestival - branje	f
00030000-55ee-ff4c-1659-ba716dc6b513	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55ee-ff4c-e011-a256300190ee	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55ee-ff4c-f5a2-811518e84f6e	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55ee-ff4c-13ad-234b1a246c95	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55ee-ff4c-901b-3ac8d0eacdd3	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55ee-ff4c-7420-aa38d0fda978	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55ee-ff4c-b143-0b72452da32a	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55ee-ff4c-1ddb-209d40a8ca44	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55ee-ff4c-b678-14b110c869c7	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55ee-ff4c-80c6-979dfc41ccac	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55ee-ff4c-0f0d-a82389f7ce33	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55ee-ff4c-225f-782c5db4efc7	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55ee-ff4c-6d43-1822db41ec18	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55ee-ff4c-3a90-c89251ecf00f	ProgramRazno-read	ProgramRazno - branje	f
00030000-55ee-ff4c-2810-4c7bbc90e523	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55ee-ff4c-5df5-507f4c018661	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55ee-ff4c-2730-f9442431df30	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55ee-ff4c-1f4e-ac3b322fd567	Prostor-read	Prostor - branje	f
00030000-55ee-ff4c-f2a2-4ba6decf4d36	Prostor-write	Prostor - spreminjanje	f
00030000-55ee-ff4c-94a6-180a91955d29	Racun-read	Racun - branje	f
00030000-55ee-ff4c-d7fd-ff4c28747176	Racun-write	Racun - spreminjanje	f
00030000-55ee-ff4c-a178-eab1044e520b	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55ee-ff4c-e1ae-1e629e2ba2db	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55ee-ff4c-cb0d-1c256eb67f9f	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55ee-ff4c-6c3c-b9922bfbf5ea	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55ee-ff4c-339f-7d346b113c1d	Rekvizit-read	Rekvizit - branje	f
00030000-55ee-ff4c-5031-2affba64ec90	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55ee-ff4c-d475-8bcf787a4404	Revizija-read	Revizija - branje	f
00030000-55ee-ff4c-3d37-c36d398fadb2	Revizija-write	Revizija - spreminjanje	f
00030000-55ee-ff4c-8378-a4f05824c7ad	Rezervacija-read	Rezervacija - branje	f
00030000-55ee-ff4c-7db2-9d26c19549df	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55ee-ff4c-8ff4-782037887bf2	SedezniRed-read	SedezniRed - branje	f
00030000-55ee-ff4c-6dbf-a53c2ba686a7	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55ee-ff4c-43c6-6bb1d167a6da	Sedez-read	Sedez - branje	f
00030000-55ee-ff4c-1cad-c5c909e034a2	Sedez-write	Sedez - spreminjanje	f
00030000-55ee-ff4c-f6c6-7cd3a0f2b6a5	Sezona-read	Sezona - branje	f
00030000-55ee-ff4c-f6c1-bf3e35521fe2	Sezona-write	Sezona - spreminjanje	f
00030000-55ee-ff4c-f6da-a9f0c957ebdb	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55ee-ff4c-d3ae-f3788c76d55f	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55ee-ff4c-a101-f8d0a0340f49	Stevilcenje-read	Stevilcenje - branje	f
00030000-55ee-ff4c-fd83-84ba91f767f9	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55ee-ff4c-df15-c4ec584bd0ee	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55ee-ff4c-ea84-acbd7a6e042d	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55ee-ff4c-0594-86627df35a62	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55ee-ff4c-2022-0683ac90cccb	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55ee-ff4c-0946-9ba3c1b12f3c	Telefonska-read	Telefonska - branje	f
00030000-55ee-ff4c-9b61-035de7d6cff9	Telefonska-write	Telefonska - spreminjanje	f
00030000-55ee-ff4c-e615-033f6d1992e9	TerminStoritve-read	TerminStoritve - branje	f
00030000-55ee-ff4c-4e2c-d6ea2a22291f	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55ee-ff4c-10fc-96a05fc444a0	TipFunkcije-read	TipFunkcije - branje	f
00030000-55ee-ff4c-f5d7-bfd775ec853d	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55ee-ff4c-e78f-3f39b1de2cca	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55ee-ff4c-6706-e76dc6ddf04c	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55ee-ff4c-345c-2047f163583f	Trr-read	Trr - branje	f
00030000-55ee-ff4c-20dc-0fe85f94cc5b	Trr-write	Trr - spreminjanje	f
00030000-55ee-ff4c-67ef-cd596e846f0b	Uprizoritev-read	Uprizoritev - branje	f
00030000-55ee-ff4c-0317-86afa6a02d08	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55ee-ff4c-07d0-6b2f4f319271	Vaja-read	Vaja - branje	f
00030000-55ee-ff4c-97a0-57c0b6cdc541	Vaja-write	Vaja - spreminjanje	f
00030000-55ee-ff4c-7910-7f42a1532506	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55ee-ff4c-6e61-38c462becb74	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55ee-ff4c-2220-c5a0005a3ba0	VrstaStroska-read	VrstaStroska - branje	f
00030000-55ee-ff4c-7e40-8ea4ac62f91e	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55ee-ff4c-c281-3a8c2cdd7017	Zaposlitev-read	Zaposlitev - branje	f
00030000-55ee-ff4c-509a-3b17616888e6	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55ee-ff4c-302a-43c58794f76d	Zasedenost-read	Zasedenost - branje	f
00030000-55ee-ff4c-a2e2-93732c0547f6	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55ee-ff4c-bf47-08c05dfeb103	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55ee-ff4c-1995-a46777967a71	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55ee-ff4c-c4f9-8dbb1c692677	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55ee-ff4c-1a4b-12e1c128a739	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55ee-ff4c-97e9-8d2c8a403e9b	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55ee-ff4c-c3c5-3e88d3eb2b03	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55ee-ff4c-94e9-4625303d4d52	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55ee-ff4c-91ae-c44f75e1762b	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55ee-ff4c-92fe-6668dd34f900	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55ee-ff4c-1dfb-544ed006fd8a	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55ee-ff4c-d2de-faa1ddf06c86	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55ee-ff4c-8578-77c480d0552e	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55ee-ff4c-e313-f8494aac0f4e	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55ee-ff4c-785d-f13d5ec8dc33	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55ee-ff4c-ea35-684f8d9298db	Datoteka-write	Datoteka - spreminjanje	f
00030000-55ee-ff4c-7eff-8b740c05b362	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2909 (class 0 OID 18105077)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55ee-ff4c-7518-3636966b234d	00030000-55ee-ff4c-8281-652563eecac6
00020000-55ee-ff4c-21a1-a8d295f5e912	00030000-55ee-ff4c-a4ef-863fc8fce965
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-1d0c-0b039f033b3b
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-7522-2102ea56f4c2
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-4a60-b17764b0d15f
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-00a4-874866f15d96
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-20ab-b8ec64b6c94b
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-9cc6-e778b35aaaed
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-034d-61c54f9ea269
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-7b79-6c0073d36d27
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-a4ef-863fc8fce965
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-33d8-1aeae427591e
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-d888-f232a77df95a
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-98a4-63ce1388a0e5
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-9049-9bed20d89439
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-d694-7a091446e05c
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-89a2-fd8dd8db1346
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-7734-ee402d9f07ee
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-e161-5f90c4975bf8
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-63f4-cc9128eab44f
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-9e5d-2f5ece621640
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-abbc-9a2bebd54e83
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-6a3c-d52ae41d869e
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-51a7-644e0dfbf3c1
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-4c92-3c30aa399ad2
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-4969-ccd0efffde0f
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-b9b0-9bb340695e67
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-d7f1-5bb4f39d9a69
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-a105-b2fe76891348
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-92a4-ce8dcd04fd25
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-a7e1-7c42d7501c17
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-6427-a2232fd6ffa7
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-07f5-bae33719a41b
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-fd0d-7947ce3d3144
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-1f4e-ac3b322fd567
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-f2a2-4ba6decf4d36
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-cb0d-1c256eb67f9f
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-6c3c-b9922bfbf5ea
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-339f-7d346b113c1d
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-5031-2affba64ec90
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-f6c6-7cd3a0f2b6a5
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-f6c1-bf3e35521fe2
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-10fc-96a05fc444a0
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-67ef-cd596e846f0b
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-0317-86afa6a02d08
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-07d0-6b2f4f319271
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-97a0-57c0b6cdc541
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-302a-43c58794f76d
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-a2e2-93732c0547f6
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-bf47-08c05dfeb103
00020000-55ee-ff4c-3ac8-f292906a7525	00030000-55ee-ff4c-c4f9-8dbb1c692677
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-1d0c-0b039f033b3b
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-20ab-b8ec64b6c94b
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-9cc6-e778b35aaaed
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-a4ef-863fc8fce965
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-9049-9bed20d89439
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-89a2-fd8dd8db1346
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-e161-5f90c4975bf8
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-63f4-cc9128eab44f
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-9e5d-2f5ece621640
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-abbc-9a2bebd54e83
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-6a3c-d52ae41d869e
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-51a7-644e0dfbf3c1
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-4c92-3c30aa399ad2
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-b9b0-9bb340695e67
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-a105-b2fe76891348
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-92a4-ce8dcd04fd25
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-a7e1-7c42d7501c17
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-1f4e-ac3b322fd567
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-cb0d-1c256eb67f9f
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-339f-7d346b113c1d
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-f6c6-7cd3a0f2b6a5
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-0946-9ba3c1b12f3c
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-9b61-035de7d6cff9
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-345c-2047f163583f
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-20dc-0fe85f94cc5b
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-c281-3a8c2cdd7017
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-509a-3b17616888e6
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-bf47-08c05dfeb103
00020000-55ee-ff4c-e926-dec6221f4ebf	00030000-55ee-ff4c-c4f9-8dbb1c692677
00020000-55ee-ff4c-859c-207c83177b81	00030000-55ee-ff4c-1d0c-0b039f033b3b
00020000-55ee-ff4c-859c-207c83177b81	00030000-55ee-ff4c-4a60-b17764b0d15f
00020000-55ee-ff4c-859c-207c83177b81	00030000-55ee-ff4c-20ab-b8ec64b6c94b
00020000-55ee-ff4c-859c-207c83177b81	00030000-55ee-ff4c-667f-487d240df424
00020000-55ee-ff4c-859c-207c83177b81	00030000-55ee-ff4c-0442-7dd0607ca9d1
00020000-55ee-ff4c-859c-207c83177b81	00030000-55ee-ff4c-e930-60290e663171
00020000-55ee-ff4c-859c-207c83177b81	00030000-55ee-ff4c-9cc6-e778b35aaaed
00020000-55ee-ff4c-859c-207c83177b81	00030000-55ee-ff4c-a4ef-863fc8fce965
00020000-55ee-ff4c-859c-207c83177b81	00030000-55ee-ff4c-d888-f232a77df95a
00020000-55ee-ff4c-859c-207c83177b81	00030000-55ee-ff4c-9049-9bed20d89439
00020000-55ee-ff4c-859c-207c83177b81	00030000-55ee-ff4c-89a2-fd8dd8db1346
00020000-55ee-ff4c-859c-207c83177b81	00030000-55ee-ff4c-e161-5f90c4975bf8
00020000-55ee-ff4c-859c-207c83177b81	00030000-55ee-ff4c-9e5d-2f5ece621640
00020000-55ee-ff4c-859c-207c83177b81	00030000-55ee-ff4c-abbc-9a2bebd54e83
00020000-55ee-ff4c-859c-207c83177b81	00030000-55ee-ff4c-6a3c-d52ae41d869e
00020000-55ee-ff4c-859c-207c83177b81	00030000-55ee-ff4c-4c92-3c30aa399ad2
00020000-55ee-ff4c-859c-207c83177b81	00030000-55ee-ff4c-b9b0-9bb340695e67
00020000-55ee-ff4c-859c-207c83177b81	00030000-55ee-ff4c-a7e1-7c42d7501c17
00020000-55ee-ff4c-859c-207c83177b81	00030000-55ee-ff4c-07f5-bae33719a41b
00020000-55ee-ff4c-859c-207c83177b81	00030000-55ee-ff4c-1f4e-ac3b322fd567
00020000-55ee-ff4c-859c-207c83177b81	00030000-55ee-ff4c-cb0d-1c256eb67f9f
00020000-55ee-ff4c-859c-207c83177b81	00030000-55ee-ff4c-339f-7d346b113c1d
00020000-55ee-ff4c-859c-207c83177b81	00030000-55ee-ff4c-f6c6-7cd3a0f2b6a5
00020000-55ee-ff4c-859c-207c83177b81	00030000-55ee-ff4c-10fc-96a05fc444a0
00020000-55ee-ff4c-859c-207c83177b81	00030000-55ee-ff4c-07d0-6b2f4f319271
00020000-55ee-ff4c-859c-207c83177b81	00030000-55ee-ff4c-302a-43c58794f76d
00020000-55ee-ff4c-859c-207c83177b81	00030000-55ee-ff4c-bf47-08c05dfeb103
00020000-55ee-ff4c-859c-207c83177b81	00030000-55ee-ff4c-c4f9-8dbb1c692677
00020000-55ee-ff4c-28ba-fff5522e66a5	00030000-55ee-ff4c-1d0c-0b039f033b3b
00020000-55ee-ff4c-28ba-fff5522e66a5	00030000-55ee-ff4c-7522-2102ea56f4c2
00020000-55ee-ff4c-28ba-fff5522e66a5	00030000-55ee-ff4c-00a4-874866f15d96
00020000-55ee-ff4c-28ba-fff5522e66a5	00030000-55ee-ff4c-20ab-b8ec64b6c94b
00020000-55ee-ff4c-28ba-fff5522e66a5	00030000-55ee-ff4c-9cc6-e778b35aaaed
00020000-55ee-ff4c-28ba-fff5522e66a5	00030000-55ee-ff4c-a4ef-863fc8fce965
00020000-55ee-ff4c-28ba-fff5522e66a5	00030000-55ee-ff4c-9049-9bed20d89439
00020000-55ee-ff4c-28ba-fff5522e66a5	00030000-55ee-ff4c-89a2-fd8dd8db1346
00020000-55ee-ff4c-28ba-fff5522e66a5	00030000-55ee-ff4c-9e5d-2f5ece621640
00020000-55ee-ff4c-28ba-fff5522e66a5	00030000-55ee-ff4c-abbc-9a2bebd54e83
00020000-55ee-ff4c-28ba-fff5522e66a5	00030000-55ee-ff4c-4c92-3c30aa399ad2
00020000-55ee-ff4c-28ba-fff5522e66a5	00030000-55ee-ff4c-b9b0-9bb340695e67
00020000-55ee-ff4c-28ba-fff5522e66a5	00030000-55ee-ff4c-a7e1-7c42d7501c17
00020000-55ee-ff4c-28ba-fff5522e66a5	00030000-55ee-ff4c-1f4e-ac3b322fd567
00020000-55ee-ff4c-28ba-fff5522e66a5	00030000-55ee-ff4c-cb0d-1c256eb67f9f
00020000-55ee-ff4c-28ba-fff5522e66a5	00030000-55ee-ff4c-339f-7d346b113c1d
00020000-55ee-ff4c-28ba-fff5522e66a5	00030000-55ee-ff4c-f6c6-7cd3a0f2b6a5
00020000-55ee-ff4c-28ba-fff5522e66a5	00030000-55ee-ff4c-10fc-96a05fc444a0
00020000-55ee-ff4c-28ba-fff5522e66a5	00030000-55ee-ff4c-bf47-08c05dfeb103
00020000-55ee-ff4c-28ba-fff5522e66a5	00030000-55ee-ff4c-c4f9-8dbb1c692677
00020000-55ee-ff4c-cfd5-aab47c0826e0	00030000-55ee-ff4c-1d0c-0b039f033b3b
00020000-55ee-ff4c-cfd5-aab47c0826e0	00030000-55ee-ff4c-20ab-b8ec64b6c94b
00020000-55ee-ff4c-cfd5-aab47c0826e0	00030000-55ee-ff4c-9cc6-e778b35aaaed
00020000-55ee-ff4c-cfd5-aab47c0826e0	00030000-55ee-ff4c-a4ef-863fc8fce965
00020000-55ee-ff4c-cfd5-aab47c0826e0	00030000-55ee-ff4c-9049-9bed20d89439
00020000-55ee-ff4c-cfd5-aab47c0826e0	00030000-55ee-ff4c-89a2-fd8dd8db1346
00020000-55ee-ff4c-cfd5-aab47c0826e0	00030000-55ee-ff4c-9e5d-2f5ece621640
00020000-55ee-ff4c-cfd5-aab47c0826e0	00030000-55ee-ff4c-abbc-9a2bebd54e83
00020000-55ee-ff4c-cfd5-aab47c0826e0	00030000-55ee-ff4c-4c92-3c30aa399ad2
00020000-55ee-ff4c-cfd5-aab47c0826e0	00030000-55ee-ff4c-b9b0-9bb340695e67
00020000-55ee-ff4c-cfd5-aab47c0826e0	00030000-55ee-ff4c-a7e1-7c42d7501c17
00020000-55ee-ff4c-cfd5-aab47c0826e0	00030000-55ee-ff4c-1f4e-ac3b322fd567
00020000-55ee-ff4c-cfd5-aab47c0826e0	00030000-55ee-ff4c-cb0d-1c256eb67f9f
00020000-55ee-ff4c-cfd5-aab47c0826e0	00030000-55ee-ff4c-339f-7d346b113c1d
00020000-55ee-ff4c-cfd5-aab47c0826e0	00030000-55ee-ff4c-f6c6-7cd3a0f2b6a5
00020000-55ee-ff4c-cfd5-aab47c0826e0	00030000-55ee-ff4c-e615-033f6d1992e9
00020000-55ee-ff4c-cfd5-aab47c0826e0	00030000-55ee-ff4c-5691-13c7b59f2c40
00020000-55ee-ff4c-cfd5-aab47c0826e0	00030000-55ee-ff4c-10fc-96a05fc444a0
00020000-55ee-ff4c-cfd5-aab47c0826e0	00030000-55ee-ff4c-bf47-08c05dfeb103
00020000-55ee-ff4c-cfd5-aab47c0826e0	00030000-55ee-ff4c-c4f9-8dbb1c692677
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-4d2d-ace6d5cceac0
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-8281-652563eecac6
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-5691-13c7b59f2c40
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-034d-61c54f9ea269
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-dea9-8a92761aaf2d
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-7616-b5cf7d509cb5
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-6ed4-8885159ce510
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-1d0c-0b039f033b3b
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-7522-2102ea56f4c2
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-4a60-b17764b0d15f
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-00a4-874866f15d96
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-20ab-b8ec64b6c94b
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-667f-487d240df424
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-0442-7dd0607ca9d1
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-3ecd-9a1fecdebba2
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-e930-60290e663171
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-3e91-a2c7e588ec7b
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-9cc6-e778b35aaaed
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-7b79-6c0073d36d27
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-a4ef-863fc8fce965
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-33d8-1aeae427591e
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-2df5-b3fafd56ccd0
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-d912-4e4f5cba1d10
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-d17d-4da7e292277e
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-0a3e-47feb5ecbf21
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-d888-f232a77df95a
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-98a4-63ce1388a0e5
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-9049-9bed20d89439
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-d694-7a091446e05c
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-89a2-fd8dd8db1346
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-7734-ee402d9f07ee
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-e161-5f90c4975bf8
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-63f4-cc9128eab44f
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-e238-4f2dc5e47b9a
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-e384-fc8dabc2072e
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-a90b-df8d1292661e
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-b9a6-5a841477898a
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-9e5d-2f5ece621640
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-962c-cc6b0882f097
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-abbc-9a2bebd54e83
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-134f-4911abeba3db
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-6a3c-d52ae41d869e
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-51a7-644e0dfbf3c1
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-b59d-c3923ca3a641
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-888d-40398488579c
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-bebe-9ebf7113c4de
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-03d8-d464cd5d83be
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-7f6e-c7fb62fb87f7
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-7763-82065407f03c
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-4c92-3c30aa399ad2
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-4969-ccd0efffde0f
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-b9b0-9bb340695e67
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-d7f1-5bb4f39d9a69
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-a8da-67188fcadf2d
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-e0fa-30a0531ce392
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-a105-b2fe76891348
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-92a4-ce8dcd04fd25
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-a7e1-7c42d7501c17
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-6427-a2232fd6ffa7
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-0808-04a734ce5cce
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-41dd-62eb51337906
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-ee85-653fada9b0d4
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-874d-c4716b475216
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-07f5-bae33719a41b
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-fd0d-7947ce3d3144
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-fc78-894cfcd13ad7
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-1483-9c987af4e04f
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-6f0c-798c06089c0b
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-1659-ba716dc6b513
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-e011-a256300190ee
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-f5a2-811518e84f6e
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-13ad-234b1a246c95
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-901b-3ac8d0eacdd3
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-7420-aa38d0fda978
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-b143-0b72452da32a
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-1ddb-209d40a8ca44
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-b678-14b110c869c7
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-80c6-979dfc41ccac
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-0f0d-a82389f7ce33
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-225f-782c5db4efc7
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-6d43-1822db41ec18
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-3a90-c89251ecf00f
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-2810-4c7bbc90e523
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-5df5-507f4c018661
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-2730-f9442431df30
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-1f4e-ac3b322fd567
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-f2a2-4ba6decf4d36
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-94a6-180a91955d29
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-d7fd-ff4c28747176
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-a178-eab1044e520b
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-e1ae-1e629e2ba2db
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-cb0d-1c256eb67f9f
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-6c3c-b9922bfbf5ea
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-339f-7d346b113c1d
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-5031-2affba64ec90
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-d475-8bcf787a4404
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-3d37-c36d398fadb2
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-8378-a4f05824c7ad
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-7db2-9d26c19549df
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-8ff4-782037887bf2
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-6dbf-a53c2ba686a7
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-43c6-6bb1d167a6da
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-1cad-c5c909e034a2
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-f6c6-7cd3a0f2b6a5
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-f6c1-bf3e35521fe2
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-f6da-a9f0c957ebdb
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-d3ae-f3788c76d55f
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-a101-f8d0a0340f49
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-fd83-84ba91f767f9
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-df15-c4ec584bd0ee
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-ea84-acbd7a6e042d
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-0594-86627df35a62
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-2022-0683ac90cccb
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-0946-9ba3c1b12f3c
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-9b61-035de7d6cff9
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-e615-033f6d1992e9
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-4e2c-d6ea2a22291f
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-10fc-96a05fc444a0
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-f5d7-bfd775ec853d
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-e78f-3f39b1de2cca
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-6706-e76dc6ddf04c
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-345c-2047f163583f
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-20dc-0fe85f94cc5b
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-67ef-cd596e846f0b
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-0317-86afa6a02d08
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-07d0-6b2f4f319271
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-97a0-57c0b6cdc541
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-7910-7f42a1532506
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-6e61-38c462becb74
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-2220-c5a0005a3ba0
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-7e40-8ea4ac62f91e
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-c281-3a8c2cdd7017
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-509a-3b17616888e6
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-302a-43c58794f76d
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-a2e2-93732c0547f6
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-bf47-08c05dfeb103
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-1995-a46777967a71
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-c4f9-8dbb1c692677
00020000-55ee-ff4d-0e80-c891a2c191fc	00030000-55ee-ff4c-1a4b-12e1c128a739
\.


--
-- TOC entry 2936 (class 0 OID 18105372)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 18105406)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 18105535)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55ee-ff4d-ebcb-12fe74c27ebf	00090000-55ee-ff4d-9d37-43fb209f923c	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55ee-ff4d-12b7-42ea1ac84b42	00090000-55ee-ff4d-3ec8-208f5fc86879	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55ee-ff4d-a5bf-215d7d1f88a6	00090000-55ee-ff4d-ed07-864bc2dd94b7	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
000b0000-55ee-ff4d-b311-c739aae753a6	00090000-55ee-ff4d-1266-deeb87bbf20f	\N	\N	0004	\N	\N	f	f	0.00	2	300.00	30.00	300.00	t	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2914 (class 0 OID 18105137)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55ee-ff4d-f444-09eac8b1fca0	00040000-55ee-ff4c-2273-d09a84e1cb03	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-ff4d-fe48-c02a3ce5c635	00040000-55ee-ff4c-2273-d09a84e1cb03	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55ee-ff4d-45d3-82b301da6dea	00040000-55ee-ff4c-2273-d09a84e1cb03	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-ff4d-9bb1-32ccc35592f5	00040000-55ee-ff4c-2273-d09a84e1cb03	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-ff4d-d07d-1931aeb0e101	00040000-55ee-ff4c-2273-d09a84e1cb03	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-ff4d-05a0-3ea1495111e6	00040000-55ee-ff4c-36de-eaa574b6a855	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-ff4d-aea9-7125b3e5f3fb	00040000-55ee-ff4c-6c02-ef2edd5d100b	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-ff4d-c227-2e28d5187c68	00040000-55ee-ff4c-bada-9e595dba70fa	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-ff4d-619f-66f8f54a85cc	00040000-55ee-ff4c-ed31-8428706480b0	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ee-ff4e-ed9f-338e88f1ab51	00040000-55ee-ff4c-2273-d09a84e1cb03	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2916 (class 0 OID 18105171)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55ee-ff4b-fc80-bb15b1276a03	8341	Adlešiči
00050000-55ee-ff4b-2703-330d68b8cdb1	5270	Ajdovščina
00050000-55ee-ff4b-09e2-560486215466	6280	Ankaran/Ancarano
00050000-55ee-ff4b-3e2e-b31e6f28a0d0	9253	Apače
00050000-55ee-ff4b-7ea0-3da85ffc8607	8253	Artiče
00050000-55ee-ff4b-51c1-4314730a8bbd	4275	Begunje na Gorenjskem
00050000-55ee-ff4b-f772-a910878969c4	1382	Begunje pri Cerknici
00050000-55ee-ff4b-7a2c-ab79df678d66	9231	Beltinci
00050000-55ee-ff4b-313c-f2ff80aa9adb	2234	Benedikt
00050000-55ee-ff4b-8756-9e6b17cceb4c	2345	Bistrica ob Dravi
00050000-55ee-ff4b-0786-a24965753080	3256	Bistrica ob Sotli
00050000-55ee-ff4b-f4f0-aa5ce4b7fb05	8259	Bizeljsko
00050000-55ee-ff4b-37e3-37a7204c41d6	1223	Blagovica
00050000-55ee-ff4b-42ac-76fc9d62ea09	8283	Blanca
00050000-55ee-ff4b-2db9-9cda5bf62d0c	4260	Bled
00050000-55ee-ff4b-f1ef-88dd0f8046b5	4273	Blejska Dobrava
00050000-55ee-ff4b-70ff-068772ade107	9265	Bodonci
00050000-55ee-ff4b-37d0-df8aa3452c5e	9222	Bogojina
00050000-55ee-ff4b-1f35-02e738c83e6e	4263	Bohinjska Bela
00050000-55ee-ff4b-5152-9f5e3b711a5e	4264	Bohinjska Bistrica
00050000-55ee-ff4b-7527-fa33d6e94e4e	4265	Bohinjsko jezero
00050000-55ee-ff4b-f543-2d305726e1cc	1353	Borovnica
00050000-55ee-ff4b-9e78-69232040261c	8294	Boštanj
00050000-55ee-ff4b-48de-ecd56c6cbfda	5230	Bovec
00050000-55ee-ff4b-da0a-a0dad301ff94	5295	Branik
00050000-55ee-ff4b-64c9-231affb5d733	3314	Braslovče
00050000-55ee-ff4b-4501-13f84b87caa6	5223	Breginj
00050000-55ee-ff4b-d212-d4413b68d96f	8280	Brestanica
00050000-55ee-ff4b-ac60-cdb118098d83	2354	Bresternica
00050000-55ee-ff4b-a981-2c075c991e3a	4243	Brezje
00050000-55ee-ff4b-e4d6-1262d3656d0c	1351	Brezovica pri Ljubljani
00050000-55ee-ff4b-7db3-15a22fd926c1	8250	Brežice
00050000-55ee-ff4b-07d9-1b5192674e0c	4210	Brnik - Aerodrom
00050000-55ee-ff4b-218c-b33f31c4793e	8321	Brusnice
00050000-55ee-ff4b-3fbd-c5e5a13790ae	3255	Buče
00050000-55ee-ff4b-77cb-53d1cde85604	8276	Bučka 
00050000-55ee-ff4b-323c-61264ebf2af9	9261	Cankova
00050000-55ee-ff4b-09ac-ea7d13fafaaa	3000	Celje 
00050000-55ee-ff4b-70e5-35ca75e49c1b	3001	Celje - poštni predali
00050000-55ee-ff4b-5d1c-3c14dbc8f9b9	4207	Cerklje na Gorenjskem
00050000-55ee-ff4b-0865-966649e83f46	8263	Cerklje ob Krki
00050000-55ee-ff4b-cb7b-302378980e72	1380	Cerknica
00050000-55ee-ff4b-c01c-d948e69c64a1	5282	Cerkno
00050000-55ee-ff4b-a56f-75da6d41fda4	2236	Cerkvenjak
00050000-55ee-ff4b-d9b5-223bc3311671	2215	Ceršak
00050000-55ee-ff4b-c3f6-0a5630b25098	2326	Cirkovce
00050000-55ee-ff4b-7031-f2ce45514e07	2282	Cirkulane
00050000-55ee-ff4b-71d4-d23435535b6b	5273	Col
00050000-55ee-ff4b-20a2-19db526cba06	8251	Čatež ob Savi
00050000-55ee-ff4b-dd1f-c437d4aaf6a9	1413	Čemšenik
00050000-55ee-ff4b-7d2b-971f355e8f20	5253	Čepovan
00050000-55ee-ff4b-a24f-d0e6183fd55a	9232	Črenšovci
00050000-55ee-ff4b-87e6-322893a8f955	2393	Črna na Koroškem
00050000-55ee-ff4b-5e37-4477c5080041	6275	Črni Kal
00050000-55ee-ff4b-b143-25f9fcf48781	5274	Črni Vrh nad Idrijo
00050000-55ee-ff4b-4bed-78f16d72d4e0	5262	Črniče
00050000-55ee-ff4b-7257-576bfcee16c6	8340	Črnomelj
00050000-55ee-ff4b-d02c-39e6f3b4593e	6271	Dekani
00050000-55ee-ff4b-8048-9d78d260419d	5210	Deskle
00050000-55ee-ff4b-fe93-8b61bb1a3fe0	2253	Destrnik
00050000-55ee-ff4b-3ff4-a36d83dcde18	6215	Divača
00050000-55ee-ff4b-fa5d-764413b8470f	1233	Dob
00050000-55ee-ff4b-cde1-529ebc37084d	3224	Dobje pri Planini
00050000-55ee-ff4b-80db-aee7e6375b1f	8257	Dobova
00050000-55ee-ff4b-a4fb-afa3bb13cb1c	1423	Dobovec
00050000-55ee-ff4b-f86a-c8da9ec42076	5263	Dobravlje
00050000-55ee-ff4b-8990-c8ae43415975	3204	Dobrna
00050000-55ee-ff4b-73f6-c84e3b2931d6	8211	Dobrnič
00050000-55ee-ff4b-7a8d-fa12276b074b	1356	Dobrova
00050000-55ee-ff4b-1ee3-cd2fc24495df	9223	Dobrovnik/Dobronak 
00050000-55ee-ff4b-f2a4-5f1730970613	5212	Dobrovo v Brdih
00050000-55ee-ff4b-e4f9-878cab8c7d96	1431	Dol pri Hrastniku
00050000-55ee-ff4b-4cff-edbffbc519eb	1262	Dol pri Ljubljani
00050000-55ee-ff4b-db10-838402be7406	1273	Dole pri Litiji
00050000-55ee-ff4b-6646-12f1a4a9e2fe	1331	Dolenja vas
00050000-55ee-ff4b-1ff3-de2166d1f247	8350	Dolenjske Toplice
00050000-55ee-ff4b-b914-52ddd67a862e	1230	Domžale
00050000-55ee-ff4b-7bef-0eda48cf3c09	2252	Dornava
00050000-55ee-ff4b-9681-8d4ea82d1d00	5294	Dornberk
00050000-55ee-ff4b-7a12-71a1bfc43625	1319	Draga
00050000-55ee-ff4b-ef6c-c17cb071baeb	8343	Dragatuš
00050000-55ee-ff4b-f541-c426c04b2335	3222	Dramlje
00050000-55ee-ff4b-0276-63c95f6987c9	2370	Dravograd
00050000-55ee-ff4b-b770-bc2eca0737d6	4203	Duplje
00050000-55ee-ff4b-39a5-7215278b9011	6221	Dutovlje
00050000-55ee-ff4b-3150-4fe7f66d5db6	8361	Dvor
00050000-55ee-ff4b-62ef-a508b4009142	2343	Fala
00050000-55ee-ff4b-010d-9af7d297af01	9208	Fokovci
00050000-55ee-ff4b-f685-1a29dcfbbd79	2313	Fram
00050000-55ee-ff4b-f286-6cb7c663d635	3213	Frankolovo
00050000-55ee-ff4b-0460-97dc56ca7705	1274	Gabrovka
00050000-55ee-ff4b-8c1d-49a79cbdd25a	8254	Globoko
00050000-55ee-ff4b-590f-e556e60bda7a	5275	Godovič
00050000-55ee-ff4b-af3b-c021f51a3d5e	4204	Golnik
00050000-55ee-ff4b-9618-19d7d4a55263	3303	Gomilsko
00050000-55ee-ff4b-d2ea-4b15d7edd97a	4224	Gorenja vas
00050000-55ee-ff4b-d478-232fbfe33d10	3263	Gorica pri Slivnici
00050000-55ee-ff4b-0261-736052c1ab5d	2272	Gorišnica
00050000-55ee-ff4b-f221-11182f44bd78	9250	Gornja Radgona
00050000-55ee-ff4b-1716-937aa062f386	3342	Gornji Grad
00050000-55ee-ff4b-c7bb-af7877f515cc	4282	Gozd Martuljek
00050000-55ee-ff4b-af43-6d1614c2530a	6272	Gračišče
00050000-55ee-ff4b-3af2-98c0ce5796ee	9264	Grad
00050000-55ee-ff4b-61af-eee8c6a8e774	8332	Gradac
00050000-55ee-ff4b-afcb-b36e9a49407f	1384	Grahovo
00050000-55ee-ff4b-8cb0-f5934560b27a	5242	Grahovo ob Bači
00050000-55ee-ff4b-0011-7a7402a14931	5251	Grgar
00050000-55ee-ff4b-d243-cbe95d1089f7	3302	Griže
00050000-55ee-ff4b-a01c-a2a4f137c2d6	3231	Grobelno
00050000-55ee-ff4b-38f1-afac709cd26b	1290	Grosuplje
00050000-55ee-ff4b-bf14-a034672ca837	2288	Hajdina
00050000-55ee-ff4b-703b-d6f95ecaccd7	8362	Hinje
00050000-55ee-ff4b-ca9b-7fdfd5e7ef3d	2311	Hoče
00050000-55ee-ff4b-50d2-af385c788f86	9205	Hodoš/Hodos
00050000-55ee-ff4b-0e61-5030a77a5124	1354	Horjul
00050000-55ee-ff4b-a417-de0250e81ce9	1372	Hotedršica
00050000-55ee-ff4b-fd90-86ed4b560ec0	1430	Hrastnik
00050000-55ee-ff4b-873a-2744748301ad	6225	Hruševje
00050000-55ee-ff4b-921d-a7733477f094	4276	Hrušica
00050000-55ee-ff4b-33eb-c3d9222e9416	5280	Idrija
00050000-55ee-ff4b-dd2e-1f1cbb433596	1292	Ig
00050000-55ee-ff4b-80f9-2fbc159de5ce	6250	Ilirska Bistrica
00050000-55ee-ff4b-c60f-54db2819dded	6251	Ilirska Bistrica-Trnovo
00050000-55ee-ff4b-1b74-f45f6ff3cc03	1295	Ivančna Gorica
00050000-55ee-ff4b-a24a-feb5b814ebef	2259	Ivanjkovci
00050000-55ee-ff4b-5fa2-b34479224d18	1411	Izlake
00050000-55ee-ff4b-ced7-0eed3a05c41e	6310	Izola/Isola
00050000-55ee-ff4b-7ace-77fcbd9f4989	2222	Jakobski Dol
00050000-55ee-ff4b-7c4d-a61731d02cc6	2221	Jarenina
00050000-55ee-ff4b-fda3-395a712ecacb	6254	Jelšane
00050000-55ee-ff4b-c1c9-ad877af4a065	4270	Jesenice
00050000-55ee-ff4b-81a0-1afd252755e4	8261	Jesenice na Dolenjskem
00050000-55ee-ff4b-a9e2-6461438a1576	3273	Jurklošter
00050000-55ee-ff4b-4ac3-83a50f0a7497	2223	Jurovski Dol
00050000-55ee-ff4b-f00e-3d5965a68010	2256	Juršinci
00050000-55ee-ff4b-00cb-11d7100ae6c2	5214	Kal nad Kanalom
00050000-55ee-ff4b-eddd-ce3a8a01929b	3233	Kalobje
00050000-55ee-ff4b-1091-da1235007c1d	4246	Kamna Gorica
00050000-55ee-ff4b-e9e4-a06c805a2f4d	2351	Kamnica
00050000-55ee-ff4b-f610-d143b10657d5	1241	Kamnik
00050000-55ee-ff4b-e517-3b8cb5742923	5213	Kanal
00050000-55ee-ff4b-63de-e7aa97907b6b	8258	Kapele
00050000-55ee-ff4b-acad-80e831198eba	2362	Kapla
00050000-55ee-ff4b-4379-ab0749743728	2325	Kidričevo
00050000-55ee-ff4b-172f-823ac0303d9f	1412	Kisovec
00050000-55ee-ff4b-c0d8-9422b6b76eca	6253	Knežak
00050000-55ee-ff4b-5ba3-836391173a4f	5222	Kobarid
00050000-55ee-ff4b-437e-b822da03b8d8	9227	Kobilje
00050000-55ee-ff4b-5096-8cbf00a1806a	1330	Kočevje
00050000-55ee-ff4b-af3c-be28b335cb80	1338	Kočevska Reka
00050000-55ee-ff4b-80a0-8c177b0b047f	2276	Kog
00050000-55ee-ff4b-bd9f-6acde65a6df0	5211	Kojsko
00050000-55ee-ff4b-77f3-aea9868bb470	6223	Komen
00050000-55ee-ff4b-644d-e1d1f6056e63	1218	Komenda
00050000-55ee-ff4b-fff5-52c4debeb125	6000	Koper/Capodistria 
00050000-55ee-ff4b-2bf2-b8e48c3ecfc3	6001	Koper/Capodistria - poštni predali
00050000-55ee-ff4b-1c81-4488a47b00bc	8282	Koprivnica
00050000-55ee-ff4b-9226-805fcdea2954	5296	Kostanjevica na Krasu
00050000-55ee-ff4b-5bc3-583ae06c8a20	8311	Kostanjevica na Krki
00050000-55ee-ff4b-ba3d-c386ad2102ef	1336	Kostel
00050000-55ee-ff4b-085c-fdc99e016489	6256	Košana
00050000-55ee-ff4b-a30a-58e5d16ffece	2394	Kotlje
00050000-55ee-ff4b-c2fa-ed229a425046	6240	Kozina
00050000-55ee-ff4b-7b55-22e6bd3924a4	3260	Kozje
00050000-55ee-ff4b-c4ff-cb1113ed2096	4000	Kranj 
00050000-55ee-ff4b-407d-1e2fdcb40b56	4001	Kranj - poštni predali
00050000-55ee-ff4b-0458-c1032e9298c2	4280	Kranjska Gora
00050000-55ee-ff4b-8ce7-fd8ec9f7a03d	1281	Kresnice
00050000-55ee-ff4b-91de-9ee395a0feb8	4294	Križe
00050000-55ee-ff4b-5353-db111d1311ac	9206	Križevci
00050000-55ee-ff4b-babe-687988ebf656	9242	Križevci pri Ljutomeru
00050000-55ee-ff4b-e137-c6698003893f	1301	Krka
00050000-55ee-ff4b-21e6-aee653eae267	8296	Krmelj
00050000-55ee-ff4b-000f-f731dc460c21	4245	Kropa
00050000-55ee-ff4b-7418-2f0ce04d67ac	8262	Krška vas
00050000-55ee-ff4b-accb-b97d063bbbd3	8270	Krško
00050000-55ee-ff4b-77f2-f49173453d60	9263	Kuzma
00050000-55ee-ff4b-e55c-bf4be06bdb27	2318	Laporje
00050000-55ee-ff4b-935c-0479d7b3ea01	3270	Laško
00050000-55ee-ff4b-a0fc-2a88fde78ba9	1219	Laze v Tuhinju
00050000-55ee-ff4b-fedd-02d9da3ad371	2230	Lenart v Slovenskih goricah
00050000-55ee-ff4b-a970-b1e321d6924b	9220	Lendava/Lendva
00050000-55ee-ff4b-e76d-90729caa20e3	4248	Lesce
00050000-55ee-ff4b-4d62-9e13e3419b4a	3261	Lesično
00050000-55ee-ff4b-c557-3eef00290e33	8273	Leskovec pri Krškem
00050000-55ee-ff4b-e58b-b84da8375238	2372	Libeliče
00050000-55ee-ff4b-bc79-b6307e200b49	2341	Limbuš
00050000-55ee-ff4b-42e3-0cb1f5e60bdc	1270	Litija
00050000-55ee-ff4b-ca6b-ac7d314a3d02	3202	Ljubečna
00050000-55ee-ff4b-90a7-0da2cad62b6e	1000	Ljubljana 
00050000-55ee-ff4b-1eb5-1cc016cbe4af	1001	Ljubljana - poštni predali
00050000-55ee-ff4b-37fa-c47b963ef0da	1231	Ljubljana - Črnuče
00050000-55ee-ff4b-a10c-904db33fabd0	1261	Ljubljana - Dobrunje
00050000-55ee-ff4b-5b62-0a204fdcbe87	1260	Ljubljana - Polje
00050000-55ee-ff4b-f188-68718bb16252	1210	Ljubljana - Šentvid
00050000-55ee-ff4b-8b0c-b54d2ac3221b	1211	Ljubljana - Šmartno
00050000-55ee-ff4b-bc2d-0ea755b3f856	3333	Ljubno ob Savinji
00050000-55ee-ff4b-6dc8-17deb40c770b	9240	Ljutomer
00050000-55ee-ff4b-6585-0c5220d600bd	3215	Loče
00050000-55ee-ff4b-4477-c8f5593c0ed0	5231	Log pod Mangartom
00050000-55ee-ff4b-ddf4-ba3527ecbe29	1358	Log pri Brezovici
00050000-55ee-ff4b-0e17-87aecad709d1	1370	Logatec
00050000-55ee-ff4b-d296-5d99588318fb	1371	Logatec
00050000-55ee-ff4b-301f-d6f254e081c1	1434	Loka pri Zidanem Mostu
00050000-55ee-ff4b-6cf2-0d89d69e6cd8	3223	Loka pri Žusmu
00050000-55ee-ff4b-e2e1-1645d49556b7	6219	Lokev
00050000-55ee-ff4b-8d80-a99bf0344adb	1318	Loški Potok
00050000-55ee-ff4b-8192-67bd93e157cf	2324	Lovrenc na Dravskem polju
00050000-55ee-ff4b-e366-e2bb223fff6b	2344	Lovrenc na Pohorju
00050000-55ee-ff4b-e7eb-3b772d5718a5	3334	Luče
00050000-55ee-ff4b-206e-ca4c8e806be9	1225	Lukovica
00050000-55ee-ff4b-31f4-73fc15d11a94	9202	Mačkovci
00050000-55ee-ff4b-6be2-6f73dc04cd20	2322	Majšperk
00050000-55ee-ff4b-0f5e-d33027846ae9	2321	Makole
00050000-55ee-ff4b-30ff-fd3119a861b8	9243	Mala Nedelja
00050000-55ee-ff4b-6845-0e1f75ab465f	2229	Malečnik
00050000-55ee-ff4b-e2bf-264332bf1a45	6273	Marezige
00050000-55ee-ff4b-4f37-de8d8dabb33a	2000	Maribor 
00050000-55ee-ff4b-d99d-7a355be74d08	2001	Maribor - poštni predali
00050000-55ee-ff4b-bcb3-0b7beb18132a	2206	Marjeta na Dravskem polju
00050000-55ee-ff4b-e0f0-f3a3aba6adff	2281	Markovci
00050000-55ee-ff4b-5fad-bcb6ce500dd5	9221	Martjanci
00050000-55ee-ff4b-4ceb-652b9ee1c10c	6242	Materija
00050000-55ee-ff4b-8a15-38a4ce28da03	4211	Mavčiče
00050000-55ee-ff4b-d3c9-fd601ef5e91e	1215	Medvode
00050000-55ee-ff4b-db7b-9d354afd0f94	1234	Mengeš
00050000-55ee-ff4b-5e23-b058697b40de	8330	Metlika
00050000-55ee-ff4b-0f33-914acea1ac0a	2392	Mežica
00050000-55ee-ff4b-89c3-eb257b60fe8a	2204	Miklavž na Dravskem polju
00050000-55ee-ff4b-f8de-c10b2b7fbafa	2275	Miklavž pri Ormožu
00050000-55ee-ff4b-b4f7-06861b1086ac	5291	Miren
00050000-55ee-ff4b-c723-22800827d1cc	8233	Mirna
00050000-55ee-ff4b-0bb3-616ba66c587f	8216	Mirna Peč
00050000-55ee-ff4b-d3ee-6284a1952fdc	2382	Mislinja
00050000-55ee-ff4b-0f6c-db668f2dc010	4281	Mojstrana
00050000-55ee-ff4b-2e2c-55ee09c73fac	8230	Mokronog
00050000-55ee-ff4b-f02b-aa70e0f764aa	1251	Moravče
00050000-55ee-ff4b-b139-ea49e3c847fd	9226	Moravske Toplice
00050000-55ee-ff4b-10b8-1000ebb461cf	5216	Most na Soči
00050000-55ee-ff4b-879d-82da03325e0c	1221	Motnik
00050000-55ee-ff4b-4728-a36cfd2c92c2	3330	Mozirje
00050000-55ee-ff4b-ac05-b100c22c7a77	9000	Murska Sobota 
00050000-55ee-ff4b-d160-2b19a3dfdfcb	9001	Murska Sobota - poštni predali
00050000-55ee-ff4b-5f41-fae4ad07b2c1	2366	Muta
00050000-55ee-ff4b-c68b-c426f1d35ca9	4202	Naklo
00050000-55ee-ff4b-753b-04313a8ad6ac	3331	Nazarje
00050000-55ee-ff4b-02b9-ffc322176ed6	1357	Notranje Gorice
00050000-55ee-ff4b-1353-72becd27b9a5	3203	Nova Cerkev
00050000-55ee-ff4b-ac4f-2e91dfb6d1fa	5000	Nova Gorica 
00050000-55ee-ff4b-dcf6-b2918648e693	5001	Nova Gorica - poštni predali
00050000-55ee-ff4b-4a52-b9dc994176a4	1385	Nova vas
00050000-55ee-ff4b-f0e4-b06c05dcf99d	8000	Novo mesto
00050000-55ee-ff4b-d226-826d8770ce07	8001	Novo mesto - poštni predali
00050000-55ee-ff4b-c4ff-2e8ae6b17f69	6243	Obrov
00050000-55ee-ff4b-7fc3-ac4103f09a94	9233	Odranci
00050000-55ee-ff4b-c1af-ba9755f600c1	2317	Oplotnica
00050000-55ee-ff4b-2c3a-e9a7158814d3	2312	Orehova vas
00050000-55ee-ff4b-47d8-fa7a3d1dbfc7	2270	Ormož
00050000-55ee-ff4b-f3be-a353a5a12969	1316	Ortnek
00050000-55ee-ff4b-ad40-069dcd909cac	1337	Osilnica
00050000-55ee-ff4b-37dc-26f3fc0937ac	8222	Otočec
00050000-55ee-ff4b-c6cf-4bda219fa23f	2361	Ožbalt
00050000-55ee-ff4b-7bb8-168a481b2be3	2231	Pernica
00050000-55ee-ff4b-5987-6c42d4f1e6f3	2211	Pesnica pri Mariboru
00050000-55ee-ff4b-9dc0-d83562065101	9203	Petrovci
00050000-55ee-ff4b-bf58-0ca6924f2ed7	3301	Petrovče
00050000-55ee-ff4b-b181-aaa1c9282930	6330	Piran/Pirano
00050000-55ee-ff4b-2016-3db78d606421	8255	Pišece
00050000-55ee-ff4b-0006-98b1781f811c	6257	Pivka
00050000-55ee-ff4b-4ace-824d6430ed0c	6232	Planina
00050000-55ee-ff4b-92de-9383de00940b	3225	Planina pri Sevnici
00050000-55ee-ff4b-8528-8826e9a31b3b	6276	Pobegi
00050000-55ee-ff4b-49d9-f408c112f07a	8312	Podbočje
00050000-55ee-ff4b-f37c-d96ad363e5b6	5243	Podbrdo
00050000-55ee-ff4b-35f8-62d18ed09655	3254	Podčetrtek
00050000-55ee-ff4b-23b7-00aadfb46a5b	2273	Podgorci
00050000-55ee-ff4b-b710-cd569427683f	6216	Podgorje
00050000-55ee-ff4b-afee-a43ea249e654	2381	Podgorje pri Slovenj Gradcu
00050000-55ee-ff4b-0532-f151d1e245b8	6244	Podgrad
00050000-55ee-ff4b-02c1-85869a95c4be	1414	Podkum
00050000-55ee-ff4b-315d-d24f4fbac4f1	2286	Podlehnik
00050000-55ee-ff4b-75b7-50d5cd83904c	5272	Podnanos
00050000-55ee-ff4b-a384-6809894a8d62	4244	Podnart
00050000-55ee-ff4b-40d0-bf38f12179b2	3241	Podplat
00050000-55ee-ff4b-43c9-b4257a640fd7	3257	Podsreda
00050000-55ee-ff4b-a664-f94100541dd5	2363	Podvelka
00050000-55ee-ff4b-aaff-5523aa76f4b3	2208	Pohorje
00050000-55ee-ff4b-6274-5e6de2b115a4	2257	Polenšak
00050000-55ee-ff4b-6381-9f5fadf26485	1355	Polhov Gradec
00050000-55ee-ff4b-70c5-3c12d8d98f29	4223	Poljane nad Škofjo Loko
00050000-55ee-ff4b-73f0-6544cd6f2f9c	2319	Poljčane
00050000-55ee-ff4b-231e-7953576bbb1e	1272	Polšnik
00050000-55ee-ff4b-8ab2-719fc23cb515	3313	Polzela
00050000-55ee-ff4b-059b-f093136d0de4	3232	Ponikva
00050000-55ee-ff4b-a285-43c2ccfca1e7	6320	Portorož/Portorose
00050000-55ee-ff4b-8cbf-712d3feacafb	6230	Postojna
00050000-55ee-ff4b-9c82-e1d8ee5c7a7f	2331	Pragersko
00050000-55ee-ff4b-8f04-ec873030d2ad	3312	Prebold
00050000-55ee-ff4b-5731-ff2c2491f48d	4205	Preddvor
00050000-55ee-ff4b-a6ba-39d1b2493226	6255	Prem
00050000-55ee-ff4b-2fe0-5578d22d8e96	1352	Preserje
00050000-55ee-ff4b-5ef5-156dd34f3c6b	6258	Prestranek
00050000-55ee-ff4b-ee32-fca86b898d3e	2391	Prevalje
00050000-55ee-ff4b-c229-dee0e278ab86	3262	Prevorje
00050000-55ee-ff4b-c9dd-f550d9067b26	1276	Primskovo 
00050000-55ee-ff4b-1dc2-3408edd7ff5a	3253	Pristava pri Mestinju
00050000-55ee-ff4b-e42e-996dd4bbaa75	9207	Prosenjakovci/Partosfalva
00050000-55ee-ff4b-96ae-4eced034d962	5297	Prvačina
00050000-55ee-ff4b-8575-450eb3692d9a	2250	Ptuj
00050000-55ee-ff4b-ae56-ff24eaad25e7	2323	Ptujska Gora
00050000-55ee-ff4b-e550-0b3b28c007e6	9201	Puconci
00050000-55ee-ff4b-c9f3-c80c155d8c6c	2327	Rače
00050000-55ee-ff4b-240f-236394430637	1433	Radeče
00050000-55ee-ff4b-ce8d-84a088d5e665	9252	Radenci
00050000-55ee-ff4b-c6ca-6a2948a4a31f	2360	Radlje ob Dravi
00050000-55ee-ff4b-4071-941419321c46	1235	Radomlje
00050000-55ee-ff4b-b82a-eab3d071ef0d	4240	Radovljica
00050000-55ee-ff4b-fe0d-02831e27712f	8274	Raka
00050000-55ee-ff4b-c0f3-60325410017f	1381	Rakek
00050000-55ee-ff4b-e632-1f4e432a07b4	4283	Rateče - Planica
00050000-55ee-ff4b-2fc4-d1c6accb0f6b	2390	Ravne na Koroškem
00050000-55ee-ff4b-1f30-7ea625e83a30	9246	Razkrižje
00050000-55ee-ff4b-381c-8b3a81db129b	3332	Rečica ob Savinji
00050000-55ee-ff4b-dae3-78d65a22a244	5292	Renče
00050000-55ee-ff4b-3543-10fca29a6cd2	1310	Ribnica
00050000-55ee-ff4b-cb00-d43b6eb8dcdf	2364	Ribnica na Pohorju
00050000-55ee-ff4b-a039-1eb40bcaf5d6	3272	Rimske Toplice
00050000-55ee-ff4b-cc97-f09b79f4099d	1314	Rob
00050000-55ee-ff4b-f7a4-11afa66504cf	5215	Ročinj
00050000-55ee-ff4b-4c27-7540cd01fbd4	3250	Rogaška Slatina
00050000-55ee-ff4b-7e52-4cf75f340254	9262	Rogašovci
00050000-55ee-ff4b-49de-93d5825002d9	3252	Rogatec
00050000-55ee-ff4b-d217-73553eca5885	1373	Rovte
00050000-55ee-ff4b-8a7f-7baf337a91d2	2342	Ruše
00050000-55ee-ff4b-3cb9-1e86b59fdeef	1282	Sava
00050000-55ee-ff4b-303d-03998e8a201a	6333	Sečovlje/Sicciole
00050000-55ee-ff4b-e803-6410eccd24a4	4227	Selca
00050000-55ee-ff4b-808d-ad0ec0cd74db	2352	Selnica ob Dravi
00050000-55ee-ff4b-fc3d-31818afaa97d	8333	Semič
00050000-55ee-ff4b-2019-1db7ae1a435f	8281	Senovo
00050000-55ee-ff4b-fedc-f31c065ffbe3	6224	Senožeče
00050000-55ee-ff4b-f5d0-66dee6a6177c	8290	Sevnica
00050000-55ee-ff4b-0a23-968769a7ef59	6210	Sežana
00050000-55ee-ff4b-b0dc-ed222538fb7b	2214	Sladki Vrh
00050000-55ee-ff4b-edbe-b3a18e4b4acb	5283	Slap ob Idrijci
00050000-55ee-ff4b-92cf-7aadb2118606	2380	Slovenj Gradec
00050000-55ee-ff4b-c01e-146cefc0e02b	2310	Slovenska Bistrica
00050000-55ee-ff4b-7e2e-7dfed4054d7c	3210	Slovenske Konjice
00050000-55ee-ff4b-ec4c-e0c5301b1c6e	1216	Smlednik
00050000-55ee-ff4b-52fe-cdf55f2a9634	5232	Soča
00050000-55ee-ff4b-3ff2-c3a0984c5ff8	1317	Sodražica
00050000-55ee-ff4b-2dfd-dd1b5654983f	3335	Solčava
00050000-55ee-ff4b-4407-25996215a7e1	5250	Solkan
00050000-55ee-ff4b-340a-84d8ed515b54	4229	Sorica
00050000-55ee-ff4b-69b6-1232f4476697	4225	Sovodenj
00050000-55ee-ff4b-6a44-26bd95cd9e45	5281	Spodnja Idrija
00050000-55ee-ff4b-bfe3-89ed7ea2fd23	2241	Spodnji Duplek
00050000-55ee-ff4b-28b3-09762c42aea6	9245	Spodnji Ivanjci
00050000-55ee-ff4b-1920-015679762534	2277	Središče ob Dravi
00050000-55ee-ff4b-0ebd-400eb34f4292	4267	Srednja vas v Bohinju
00050000-55ee-ff4b-91b7-817c62bdb290	8256	Sromlje 
00050000-55ee-ff4b-3037-26cc066d06cb	5224	Srpenica
00050000-55ee-ff4b-ceec-4d8d35101f40	1242	Stahovica
00050000-55ee-ff4b-b6e0-b770b703d491	1332	Stara Cerkev
00050000-55ee-ff4b-8074-6130d5ef3b76	8342	Stari trg ob Kolpi
00050000-55ee-ff4b-1e84-d66b30f0b57a	1386	Stari trg pri Ložu
00050000-55ee-ff4b-720e-9fa41c00720d	2205	Starše
00050000-55ee-ff4b-3979-e7567e79f511	2289	Stoperce
00050000-55ee-ff4b-c00c-b2ec3c538f62	8322	Stopiče
00050000-55ee-ff4b-3146-4106364cf752	3206	Stranice
00050000-55ee-ff4b-7540-380c8a1cb36d	8351	Straža
00050000-55ee-ff4b-f631-0e58a4e77851	1313	Struge
00050000-55ee-ff4b-2c5d-7962c003860d	8293	Studenec
00050000-55ee-ff4b-03e1-fa49fe24717e	8331	Suhor
00050000-55ee-ff4b-9109-b461034b8804	2233	Sv. Ana v Slovenskih goricah
00050000-55ee-ff4b-30c7-6a456ac0545b	2235	Sv. Trojica v Slovenskih goricah
00050000-55ee-ff4b-127e-a01f1207305e	2353	Sveti Duh na Ostrem Vrhu
00050000-55ee-ff4b-13b1-c14d1d25d22b	9244	Sveti Jurij ob Ščavnici
00050000-55ee-ff4b-1722-de9f8090e013	3264	Sveti Štefan
00050000-55ee-ff4b-9e2e-c82c73bf836b	2258	Sveti Tomaž
00050000-55ee-ff4b-3a3d-0ffbe7356dfa	9204	Šalovci
00050000-55ee-ff4b-380c-e70b49ca1768	5261	Šempas
00050000-55ee-ff4b-867b-2bc76cd6708f	5290	Šempeter pri Gorici
00050000-55ee-ff4b-4f98-3dbf59ab9174	3311	Šempeter v Savinjski dolini
00050000-55ee-ff4b-57c8-92a998db5848	4208	Šenčur
00050000-55ee-ff4b-3457-229941946f17	2212	Šentilj v Slovenskih goricah
00050000-55ee-ff4b-4b90-952e0b08439d	8297	Šentjanž
00050000-55ee-ff4b-2517-9f5b824b305b	2373	Šentjanž pri Dravogradu
00050000-55ee-ff4b-36c6-79805d3825e3	8310	Šentjernej
00050000-55ee-ff4b-b2ca-1928149fcefc	3230	Šentjur
00050000-55ee-ff4b-a86f-256b28d6a12d	3271	Šentrupert
00050000-55ee-ff4b-52f2-ae513d50e2f3	8232	Šentrupert
00050000-55ee-ff4b-aa88-278b8a4cbe90	1296	Šentvid pri Stični
00050000-55ee-ff4b-09f3-0c3c98a56dcd	8275	Škocjan
00050000-55ee-ff4b-7e5f-ef40ee7a0b98	6281	Škofije
00050000-55ee-ff4b-7391-55525cc294c2	4220	Škofja Loka
00050000-55ee-ff4b-a2ca-12f097438cd0	3211	Škofja vas
00050000-55ee-ff4b-c5d7-53abade06987	1291	Škofljica
00050000-55ee-ff4b-e0ee-046499bc21b8	6274	Šmarje
00050000-55ee-ff4b-f37d-f592ade3840b	1293	Šmarje - Sap
00050000-55ee-ff4b-546e-9d3a06efb0c4	3240	Šmarje pri Jelšah
00050000-55ee-ff4b-6bc6-5a359cd6d97a	8220	Šmarješke Toplice
00050000-55ee-ff4b-a00d-c90e2e9c98bb	2315	Šmartno na Pohorju
00050000-55ee-ff4b-75ab-24b9a9664b06	3341	Šmartno ob Dreti
00050000-55ee-ff4b-8088-bb17bc5bc186	3327	Šmartno ob Paki
00050000-55ee-ff4b-c296-8d63004dcbc4	1275	Šmartno pri Litiji
00050000-55ee-ff4b-25b3-003b7393b719	2383	Šmartno pri Slovenj Gradcu
00050000-55ee-ff4b-76e5-b1be9cd052d0	3201	Šmartno v Rožni dolini
00050000-55ee-ff4b-bc81-5a4eaabf5157	3325	Šoštanj
00050000-55ee-ff4b-69a7-4ccb164bffe5	6222	Štanjel
00050000-55ee-ff4b-4c42-8c4e06334889	3220	Štore
00050000-55ee-ff4b-b467-f6b560db1c1c	3304	Tabor
00050000-55ee-ff4b-cb1e-16ee6603c557	3221	Teharje
00050000-55ee-ff4b-98f5-bed4c5ef4f6c	9251	Tišina
00050000-55ee-ff4b-0408-0a9c8c64f598	5220	Tolmin
00050000-55ee-ff4b-1eda-7744821facd8	3326	Topolšica
00050000-55ee-ff4b-1c4e-1a932893d895	2371	Trbonje
00050000-55ee-ff4b-1011-11c3ba70ec91	1420	Trbovlje
00050000-55ee-ff4b-f4d5-767c13b3e64c	8231	Trebelno 
00050000-55ee-ff4b-77af-038c755e1ab5	8210	Trebnje
00050000-55ee-ff4b-d361-1089a9c784e4	5252	Trnovo pri Gorici
00050000-55ee-ff4b-1743-53500f390a8d	2254	Trnovska vas
00050000-55ee-ff4b-a88a-02f476d95f22	1222	Trojane
00050000-55ee-ff4b-4f4f-de3c8da4e1f9	1236	Trzin
00050000-55ee-ff4b-8ba4-05dc42414321	4290	Tržič
00050000-55ee-ff4b-93b2-2faaaf92bc5b	8295	Tržišče
00050000-55ee-ff4b-4963-24bc1a1863e2	1311	Turjak
00050000-55ee-ff4b-2a52-ccb3103d8f28	9224	Turnišče
00050000-55ee-ff4b-6c89-6b601379240b	8323	Uršna sela
00050000-55ee-ff4b-8def-901e61f3fc27	1252	Vače
00050000-55ee-ff4b-11ea-0521695951eb	3320	Velenje 
00050000-55ee-ff4b-846b-5db4a0195098	3322	Velenje - poštni predali
00050000-55ee-ff4b-e95c-47cee27c0e78	8212	Velika Loka
00050000-55ee-ff4b-d764-3ef4373a7245	2274	Velika Nedelja
00050000-55ee-ff4b-6918-58c4f1a26e1c	9225	Velika Polana
00050000-55ee-ff4b-2b47-a762bf4c9052	1315	Velike Lašče
00050000-55ee-ff4b-da94-7522fba0f7d4	8213	Veliki Gaber
00050000-55ee-ff4b-e04c-f74645260e88	9241	Veržej
00050000-55ee-ff4b-0707-ab7ae640fcdf	1312	Videm - Dobrepolje
00050000-55ee-ff4b-ccab-544952483159	2284	Videm pri Ptuju
00050000-55ee-ff4b-048c-11e4aee79d1e	8344	Vinica
00050000-55ee-ff4b-4259-b30edc377f47	5271	Vipava
00050000-55ee-ff4b-2dc1-df614bc114e0	4212	Visoko
00050000-55ee-ff4b-4db2-756cd1f1d924	1294	Višnja Gora
00050000-55ee-ff4b-7ef2-6239144e7695	3205	Vitanje
00050000-55ee-ff4b-d712-b06b5c702420	2255	Vitomarci
00050000-55ee-ff4b-4d5e-a8e95b53f5db	1217	Vodice
00050000-55ee-ff4b-3fc9-b48b64d7cb27	3212	Vojnik\t
00050000-55ee-ff4b-b901-5d4b49ab9d4c	5293	Volčja Draga
00050000-55ee-ff4b-22cd-eff5fb37fc1d	2232	Voličina
00050000-55ee-ff4b-8f60-649aa2d31618	3305	Vransko
00050000-55ee-ff4b-fcc6-9860a27602f3	6217	Vremski Britof
00050000-55ee-ff4b-590e-97356e3d21dc	1360	Vrhnika
00050000-55ee-ff4b-712c-9e360ced1cc9	2365	Vuhred
00050000-55ee-ff4b-118b-dcc5ab6c30ef	2367	Vuzenica
00050000-55ee-ff4b-9341-ad994f2dbc1a	8292	Zabukovje 
00050000-55ee-ff4b-a8e4-7a2ea294a8ea	1410	Zagorje ob Savi
00050000-55ee-ff4b-dd14-36fc05c55b3a	1303	Zagradec
00050000-55ee-ff4b-24bd-6e9d3cf8ca1f	2283	Zavrč
00050000-55ee-ff4b-51f4-1ea319e1ec10	8272	Zdole 
00050000-55ee-ff4b-fa20-7b505020211d	4201	Zgornja Besnica
00050000-55ee-ff4b-ff4f-ecdbd75d2eba	2242	Zgornja Korena
00050000-55ee-ff4b-2c1a-48e0add33070	2201	Zgornja Kungota
00050000-55ee-ff4b-304e-234c19a94d42	2316	Zgornja Ložnica
00050000-55ee-ff4b-10df-51f1c845b511	2314	Zgornja Polskava
00050000-55ee-ff4b-8a7b-51171b4b2311	2213	Zgornja Velka
00050000-55ee-ff4b-60b0-a5d9ab8416c0	4247	Zgornje Gorje
00050000-55ee-ff4b-e243-80e172e86e2b	4206	Zgornje Jezersko
00050000-55ee-ff4b-b590-e13e4b220f24	2285	Zgornji Leskovec
00050000-55ee-ff4b-d30a-1f94dee9ae6e	1432	Zidani Most
00050000-55ee-ff4b-c60d-61de275cfd1c	3214	Zreče
00050000-55ee-ff4b-a44e-3dc9ed0946c6	4209	Žabnica
00050000-55ee-ff4b-e0a1-b2c00fa5693c	3310	Žalec
00050000-55ee-ff4b-0c3b-326f609edad1	4228	Železniki
00050000-55ee-ff4b-6bee-25d0b18cfc46	2287	Žetale
00050000-55ee-ff4b-8552-a39c1e8e7254	4226	Žiri
00050000-55ee-ff4b-a79e-87ec73a08495	4274	Žirovnica
00050000-55ee-ff4b-8087-c0b9d6ffe9c1	8360	Žužemberk
\.


--
-- TOC entry 2932 (class 0 OID 18105346)
-- Dependencies: 202
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2915 (class 0 OID 18105156)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55ee-ff4d-61f2-bcf3766eabc3	00080000-55ee-ff4d-f444-09eac8b1fca0	\N	00040000-55ee-ff4c-2273-d09a84e1cb03	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55ee-ff4d-9732-68bd2b3f416b	00080000-55ee-ff4d-f444-09eac8b1fca0	\N	00040000-55ee-ff4c-2273-d09a84e1cb03	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55ee-ff4d-ad55-088193d5b016	00080000-55ee-ff4d-fe48-c02a3ce5c635	\N	00040000-55ee-ff4c-2273-d09a84e1cb03	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2921 (class 0 OID 18105234)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 18105358)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 18105714)
-- Dependencies: 228
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 18105724)
-- Dependencies: 229
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55ee-ff4d-5614-af0cc28ab57b	00080000-55ee-ff4d-45d3-82b301da6dea	0987	AK
00190000-55ee-ff4d-63c8-b1fd1b4d1191	00080000-55ee-ff4d-fe48-c02a3ce5c635	0989	AK
00190000-55ee-ff4d-4c6d-fbd118c0d7e9	00080000-55ee-ff4d-9bb1-32ccc35592f5	0986	AK
00190000-55ee-ff4d-1b7b-269c52fce37f	00080000-55ee-ff4d-05a0-3ea1495111e6	0984	AK
00190000-55ee-ff4d-0593-d0d0316dc70f	00080000-55ee-ff4d-aea9-7125b3e5f3fb	0983	AK
00190000-55ee-ff4d-d4d6-aa4ce32665c4	00080000-55ee-ff4d-c227-2e28d5187c68	0982	AK
00190000-55ee-ff4e-15f2-f1b7e6f039aa	00080000-55ee-ff4e-ed9f-338e88f1ab51	1001	AK
\.


--
-- TOC entry 2957 (class 0 OID 18105671)
-- Dependencies: 227
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55ee-ff4d-feb1-0ea62980ca3d	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2960 (class 0 OID 18105732)
-- Dependencies: 230
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2938 (class 0 OID 18105387)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-55ee-ff4d-438c-af3cfe08d84a	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-55ee-ff4d-1180-1c88f94b0d30	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-55ee-ff4d-e5b3-c60eee012bed	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-55ee-ff4d-1a0b-76b4c3c9807d	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-55ee-ff4d-6fb3-10568bf2f769	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-55ee-ff4d-879b-5b23269ca460	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55ee-ff4d-a037-459bcf508eda	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2930 (class 0 OID 18105331)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 18105321)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 18105524)
-- Dependencies: 220
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2945 (class 0 OID 18105461)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 18105029)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55ee-ff4e-ed9f-338e88f1ab51	00010000-55ee-ff4c-7759-163e0d13e5a7	2015-09-08 17:31:26	INS	a:0:{}
2	App\\Entity\\Option	00000000-55ee-ff4e-7e3c-84a40d3a07f5	00010000-55ee-ff4c-7759-163e0d13e5a7	2015-09-08 17:31:26	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55ee-ff4e-15f2-f1b7e6f039aa	00010000-55ee-ff4c-7759-163e0d13e5a7	2015-09-08 17:31:26	INS	a:0:{}
\.


--
-- TOC entry 2978 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2939 (class 0 OID 18105400)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 18105067)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55ee-ff4c-7518-3636966b234d	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55ee-ff4c-21a1-a8d295f5e912	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55ee-ff4c-098f-caf8db69c542	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55ee-ff4c-a84f-5392f09f0daa	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55ee-ff4c-3ac8-f292906a7525	planer	Planer dogodkov v koledarju	t
00020000-55ee-ff4c-e926-dec6221f4ebf	kadrovska	Kadrovska služba	t
00020000-55ee-ff4c-859c-207c83177b81	arhivar	Ažuriranje arhivalij	t
00020000-55ee-ff4c-28ba-fff5522e66a5	igralec	Igralec	t
00020000-55ee-ff4c-cfd5-aab47c0826e0	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55ee-ff4d-0e80-c891a2c191fc	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2906 (class 0 OID 18105051)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55ee-ff4c-187d-bc340996295f	00020000-55ee-ff4c-098f-caf8db69c542
00010000-55ee-ff4c-7759-163e0d13e5a7	00020000-55ee-ff4c-098f-caf8db69c542
00010000-55ee-ff4d-8b0d-f6da6ac65e5b	00020000-55ee-ff4d-0e80-c891a2c191fc
\.


--
-- TOC entry 2941 (class 0 OID 18105414)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 18105352)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 18105298)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 18105016)
-- Dependencies: 172
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55ee-ff4c-6187-ca193b329b8a	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55ee-ff4c-46e8-5da958e7b9af	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55ee-ff4c-a6f8-3d0f6b1f5b91	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55ee-ff4c-541a-5611b98430a7	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55ee-ff4c-0f57-14033e979dc7	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2901 (class 0 OID 18105008)
-- Dependencies: 171
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55ee-ff4c-25d2-84301dd16f26	00230000-55ee-ff4c-541a-5611b98430a7	popa
00240000-55ee-ff4c-93ed-9a9b40704ee0	00230000-55ee-ff4c-541a-5611b98430a7	oseba
00240000-55ee-ff4c-cdde-ba0c3db575be	00230000-55ee-ff4c-541a-5611b98430a7	sezona
00240000-55ee-ff4c-09fb-c98a0ba94da9	00230000-55ee-ff4c-46e8-5da958e7b9af	prostor
00240000-55ee-ff4c-b75f-ef7341736b16	00230000-55ee-ff4c-541a-5611b98430a7	besedilo
00240000-55ee-ff4c-919f-ea8aeed7fe4c	00230000-55ee-ff4c-541a-5611b98430a7	uprizoritev
00240000-55ee-ff4c-7ae7-a282d290db0e	00230000-55ee-ff4c-541a-5611b98430a7	funkcija
00240000-55ee-ff4c-d71b-27e6868a6682	00230000-55ee-ff4c-541a-5611b98430a7	tipfunkcije
00240000-55ee-ff4c-a080-0814d76be855	00230000-55ee-ff4c-541a-5611b98430a7	alternacija
00240000-55ee-ff4c-4e31-a3c6d75c0e0e	00230000-55ee-ff4c-6187-ca193b329b8a	pogodba
00240000-55ee-ff4c-5d35-ce6318652a4c	00230000-55ee-ff4c-541a-5611b98430a7	zaposlitev
00240000-55ee-ff4c-78e5-86d69b346f68	00230000-55ee-ff4c-541a-5611b98430a7	zvrstuprizoritve
00240000-55ee-ff4c-e2db-06a74b4edaff	00230000-55ee-ff4c-6187-ca193b329b8a	programdela
00240000-55ee-ff4c-82e0-2825fc18ed17	00230000-55ee-ff4c-541a-5611b98430a7	zapis
\.


--
-- TOC entry 2900 (class 0 OID 18105003)
-- Dependencies: 170
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
db9ad1f4-fd3b-4d49-8b09-af7c2eda59eb	00240000-55ee-ff4c-25d2-84301dd16f26	0	1001
\.


--
-- TOC entry 2946 (class 0 OID 18105471)
-- Dependencies: 216
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55ee-ff4d-cb29-c3f656a3eb31	000e0000-55ee-ff4d-61b6-64e92e6e4051	00080000-55ee-ff4d-f444-09eac8b1fca0	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55ee-ff4c-958e-4d53ce2a388c
00270000-55ee-ff4d-e9f1-eef5b0951173	000e0000-55ee-ff4d-61b6-64e92e6e4051	00080000-55ee-ff4d-f444-09eac8b1fca0	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55ee-ff4c-958e-4d53ce2a388c
\.


--
-- TOC entry 2913 (class 0 OID 18105129)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 18105308)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55ee-ff4d-5cf3-2f5995e72722	00180000-55ee-ff4d-5916-f32efc0101aa	000c0000-55ee-ff4d-ba80-da4de5b1ea89	00090000-55ee-ff4d-22d2-c00f479caf69	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ee-ff4d-8168-a0ebad7f418e	00180000-55ee-ff4d-5916-f32efc0101aa	000c0000-55ee-ff4d-2ade-968febc98d7a	00090000-55ee-ff4d-1266-deeb87bbf20f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ee-ff4d-9f05-df09a6dc0df5	00180000-55ee-ff4d-5916-f32efc0101aa	000c0000-55ee-ff4d-d850-2d012ecce2de	00090000-55ee-ff4d-7deb-adfc2c9844d0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ee-ff4d-b716-300ea37217f3	00180000-55ee-ff4d-5916-f32efc0101aa	000c0000-55ee-ff4d-5750-697be4decbda	00090000-55ee-ff4d-5b07-142af129cc86	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ee-ff4d-b207-736d064df0d2	00180000-55ee-ff4d-5916-f32efc0101aa	000c0000-55ee-ff4d-7182-96b47b3dc8cc	00090000-55ee-ff4d-029d-8fb874c8dcf0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ee-ff4d-0d53-021df2fb18b8	00180000-55ee-ff4d-9b0c-b477780ecab1	\N	00090000-55ee-ff4d-029d-8fb874c8dcf0	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2949 (class 0 OID 18105512)
-- Dependencies: 219
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55ee-ff4c-7a9e-075a96f6099b	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55ee-ff4c-d0e2-fcc33e0d4e69	02	Priredba	Priredba	Priredba	umetnik
000f0000-55ee-ff4c-e768-630644f9bf9f	03	Prevod	Prevod	Prevod	umetnik
000f0000-55ee-ff4c-c21e-a86f3840ae57	04	Režija	Režija	Režija	umetnik
000f0000-55ee-ff4c-0f44-70634de43497	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55ee-ff4c-3376-018935d1ee76	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55ee-ff4c-ef7b-6946a01ccd6f	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55ee-ff4c-9c95-c8927fd04966	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55ee-ff4c-d289-7d746d6d32e1	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55ee-ff4c-a8c7-aaafd8382660	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55ee-ff4c-b8f0-b9d0157955cb	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55ee-ff4c-d5be-9868e7313221	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55ee-ff4c-8a50-d20d8aece445	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55ee-ff4c-622b-34478dc9b5d8	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55ee-ff4c-050f-52bc8dc4a191	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55ee-ff4c-5f27-93907577e2f3	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55ee-ff4c-2141-5cb49ddd196a	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55ee-ff4c-5ad1-358dcd237cb9	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2961 (class 0 OID 18105742)
-- Dependencies: 231
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55ee-ff4c-7514-2e7f9733fe06	01	Velika predstava	f	1.00	1.00
002b0000-55ee-ff4c-09ac-4e7965e8a5bf	02	Mala predstava	f	0.50	0.50
002b0000-55ee-ff4c-f27c-2ac1bc9257dc	03	Mala koprodukcija	t	0.40	1.00
002b0000-55ee-ff4c-fe3b-a75977f5a059	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55ee-ff4c-7cfe-cf7493bd3a19	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2918 (class 0 OID 18105191)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 18105038)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55ee-ff4c-7759-163e0d13e5a7	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROwxyK0Pk8lobbx1F8FBkLsilN74atuRi	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55ee-ff4d-e516-303fb8ab784c	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55ee-ff4d-732b-df678ca4cfd7	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55ee-ff4d-df74-bce503ee338a	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55ee-ff4d-bedb-a4112290da57	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55ee-ff4d-8933-4aab918d02f9	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55ee-ff4d-3a24-dcbc81738c23	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55ee-ff4d-6479-288993da6bcc	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55ee-ff4d-d1a7-5b8813cbe600	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55ee-ff4d-356d-f5b6c0a8fed9	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55ee-ff4d-8b0d-f6da6ac65e5b	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55ee-ff4c-187d-bc340996295f	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2953 (class 0 OID 18105561)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55ee-ff4d-f295-a9964d2041f8	00160000-55ee-ff4d-76b5-d6b7cd63eb67	\N	00140000-55ee-ff4c-dd1e-2c1fa4f711c5	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55ee-ff4d-6fb3-10568bf2f769
000e0000-55ee-ff4d-61b6-64e92e6e4051	00160000-55ee-ff4d-7414-ddf67a14b3be	\N	00140000-55ee-ff4c-96e3-794ae7f07986	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55ee-ff4d-879b-5b23269ca460
000e0000-55ee-ff4d-67c1-f355c27daec0	\N	\N	00140000-55ee-ff4c-96e3-794ae7f07986	00190000-55ee-ff4d-5614-af0cc28ab57b	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55ee-ff4d-6fb3-10568bf2f769
000e0000-55ee-ff4d-5cb0-dd81e1fb5d40	\N	\N	00140000-55ee-ff4c-96e3-794ae7f07986	00190000-55ee-ff4d-5614-af0cc28ab57b	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55ee-ff4d-6fb3-10568bf2f769
000e0000-55ee-ff4d-546c-dc878d147a79	\N	\N	00140000-55ee-ff4c-96e3-794ae7f07986	00190000-55ee-ff4d-5614-af0cc28ab57b	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55ee-ff4d-438c-af3cfe08d84a
000e0000-55ee-ff4d-2b9f-51c9df5a2e5a	\N	\N	00140000-55ee-ff4c-96e3-794ae7f07986	00190000-55ee-ff4d-5614-af0cc28ab57b	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55ee-ff4d-438c-af3cfe08d84a
\.


--
-- TOC entry 2923 (class 0 OID 18105252)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55ee-ff4d-46b7-948e4574da91	000e0000-55ee-ff4d-61b6-64e92e6e4051	\N	1	
00200000-55ee-ff4d-ecfe-851eaa1acabc	000e0000-55ee-ff4d-61b6-64e92e6e4051	\N	2	
\.


--
-- TOC entry 2937 (class 0 OID 18105379)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 18105485)
-- Dependencies: 217
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55ee-ff4c-af24-bffc8125362d	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55ee-ff4c-512c-6ef9d8b96f5d	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55ee-ff4c-8af5-939ee34db717	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55ee-ff4c-46f1-5f657ebe6551	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55ee-ff4c-b928-7f6b1625db4e	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55ee-ff4c-6a61-8b673e74e095	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55ee-ff4c-7073-48284499086c	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55ee-ff4c-c37f-0957ecea6dbf	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55ee-ff4c-958e-4d53ce2a388c	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55ee-ff4c-0bff-864e4f6410bf	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55ee-ff4c-f720-13be29e783f3	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55ee-ff4c-30a5-9eb216b905b7	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55ee-ff4c-bb49-9be8c7c2150c	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55ee-ff4c-c616-762257a7e927	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55ee-ff4c-372e-e87a512a638b	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55ee-ff4c-7c82-2bfc768ac95a	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55ee-ff4c-28b1-cc00ca14f428	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55ee-ff4c-c537-f80dcb19be63	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55ee-ff4c-f4a2-768ebb2c8679	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55ee-ff4c-ba59-a37d6a50596d	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55ee-ff4c-b40e-a94082ecfeb6	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55ee-ff4c-990e-3f5bc45789b4	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55ee-ff4c-9909-5047149ee3f0	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55ee-ff4c-a6b3-d035de96a016	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55ee-ff4c-70ef-794cbd3d1532	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55ee-ff4c-2650-0ba996b8ac56	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55ee-ff4c-8fd3-6b00a933c91d	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55ee-ff4c-238d-add497836162	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2964 (class 0 OID 18105788)
-- Dependencies: 234
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 18105760)
-- Dependencies: 233
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 18105800)
-- Dependencies: 235
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2944 (class 0 OID 18105451)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55ee-ff4d-ae88-4f063cbd916c	00090000-55ee-ff4d-1266-deeb87bbf20f	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ee-ff4d-e64a-a6d9f1fd460a	00090000-55ee-ff4d-7deb-adfc2c9844d0	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ee-ff4d-e486-4ec232006147	00090000-55ee-ff4d-5e94-936d7aeb8e5d	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ee-ff4d-d913-58df5e497ca3	00090000-55ee-ff4d-bf8e-4ae377fad588	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ee-ff4d-fcca-e3b74c17322a	00090000-55ee-ff4d-22d2-c00f479caf69	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ee-ff4d-1964-6ae99568c5dc	00090000-55ee-ff4d-3c5d-2b8ccd329548	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2925 (class 0 OID 18105288)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 18105551)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55ee-ff4c-dd1e-2c1fa4f711c5	01	Drama	drama (SURS 01)
00140000-55ee-ff4c-9f08-c8cdca989576	02	Opera	opera (SURS 02)
00140000-55ee-ff4c-2bfe-ab5b060971ae	03	Balet	balet (SURS 03)
00140000-55ee-ff4c-6006-f03302a6bb9e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55ee-ff4c-f1f7-661a8ddbef08	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55ee-ff4c-96e3-794ae7f07986	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55ee-ff4c-850b-126e451a887d	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2943 (class 0 OID 18105441)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2457 (class 2606 OID 18105092)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 18105610)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 18105600)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 18105510)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 18105840)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 18105277)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 18105297)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 18105758)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 18105217)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 18105665)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 18105437)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 18105250)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 18105231)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 18105344)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 18105817)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 18105824)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2693 (class 2606 OID 18105848)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 18105371)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 18105189)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 18105101)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 18105125)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 18105081)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2448 (class 2606 OID 18105066)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 18105377)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 18105413)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 18105546)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 18105153)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 18105177)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 18105350)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 18105167)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 18105238)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 18105362)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 18105721)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 18105729)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 18105713)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 18105740)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 18105395)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 18105335)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 18105326)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 18105534)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 18105468)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 18105037)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 18105404)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 18105055)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2450 (class 2606 OID 18105075)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 18105422)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 18105357)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 18105306)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 18105025)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 18105013)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 18105007)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 18105481)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 18105134)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 18105317)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 18105521)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 18105752)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 18105202)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 18105050)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 18105579)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 18105260)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 18105385)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 18105493)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 18105798)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 18105782)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 18105806)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 18105459)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 18105292)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 18105559)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 18105449)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 1259 OID 18105286)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2513 (class 1259 OID 18105287)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2514 (class 1259 OID 18105285)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2515 (class 1259 OID 18105284)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2597 (class 1259 OID 18105482)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2598 (class 1259 OID 18105483)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2599 (class 1259 OID 18105484)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2679 (class 1259 OID 18105819)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2680 (class 1259 OID 18105818)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2471 (class 1259 OID 18105155)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2560 (class 1259 OID 18105378)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2666 (class 1259 OID 18105786)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2667 (class 1259 OID 18105785)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2668 (class 1259 OID 18105787)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2669 (class 1259 OID 18105784)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2670 (class 1259 OID 18105783)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2554 (class 1259 OID 18105364)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2555 (class 1259 OID 18105363)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2507 (class 1259 OID 18105261)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2584 (class 1259 OID 18105438)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2585 (class 1259 OID 18105440)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2586 (class 1259 OID 18105439)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2496 (class 1259 OID 18105233)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2497 (class 1259 OID 18105232)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2658 (class 1259 OID 18105741)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2613 (class 1259 OID 18105548)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2614 (class 1259 OID 18105549)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2615 (class 1259 OID 18105550)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2676 (class 1259 OID 18105807)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2622 (class 1259 OID 18105584)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2623 (class 1259 OID 18105581)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2624 (class 1259 OID 18105585)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2625 (class 1259 OID 18105583)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2626 (class 1259 OID 18105582)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2486 (class 1259 OID 18105204)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2487 (class 1259 OID 18105203)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2462 (class 1259 OID 18105128)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2572 (class 1259 OID 18105405)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2452 (class 1259 OID 18105082)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2453 (class 1259 OID 18105083)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2577 (class 1259 OID 18105425)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2578 (class 1259 OID 18105424)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2579 (class 1259 OID 18105423)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2500 (class 1259 OID 18105239)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2501 (class 1259 OID 18105240)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2432 (class 1259 OID 18105015)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2534 (class 1259 OID 18105330)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2535 (class 1259 OID 18105328)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2536 (class 1259 OID 18105327)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2537 (class 1259 OID 18105329)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2443 (class 1259 OID 18105056)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2444 (class 1259 OID 18105057)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2563 (class 1259 OID 18105386)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2689 (class 1259 OID 18105841)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2690 (class 1259 OID 18105849)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2691 (class 1259 OID 18105850)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2549 (class 1259 OID 18105351)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2593 (class 1259 OID 18105469)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2594 (class 1259 OID 18105470)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2643 (class 1259 OID 18105670)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2644 (class 1259 OID 18105669)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2645 (class 1259 OID 18105666)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2646 (class 1259 OID 18105667)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2647 (class 1259 OID 18105668)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2475 (class 1259 OID 18105169)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2476 (class 1259 OID 18105168)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2477 (class 1259 OID 18105170)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2566 (class 1259 OID 18105399)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2567 (class 1259 OID 18105398)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2650 (class 1259 OID 18105722)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2651 (class 1259 OID 18105723)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2636 (class 1259 OID 18105614)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 18105615)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2638 (class 1259 OID 18105612)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2639 (class 1259 OID 18105613)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2590 (class 1259 OID 18105460)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2540 (class 1259 OID 18105339)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2541 (class 1259 OID 18105338)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2542 (class 1259 OID 18105336)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2543 (class 1259 OID 18105337)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2632 (class 1259 OID 18105602)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2633 (class 1259 OID 18105601)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2506 (class 1259 OID 18105251)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2665 (class 1259 OID 18105759)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2683 (class 1259 OID 18105825)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2684 (class 1259 OID 18105826)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2458 (class 1259 OID 18105103)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2459 (class 1259 OID 18105102)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2467 (class 1259 OID 18105135)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2468 (class 1259 OID 18105136)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2529 (class 1259 OID 18105320)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2530 (class 1259 OID 18105319)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2531 (class 1259 OID 18105318)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2516 (class 1259 OID 18105279)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2517 (class 1259 OID 18105280)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2518 (class 1259 OID 18105278)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2519 (class 1259 OID 18105282)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2520 (class 1259 OID 18105283)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2521 (class 1259 OID 18105281)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2474 (class 1259 OID 18105154)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2492 (class 1259 OID 18105218)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2493 (class 1259 OID 18105220)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2494 (class 1259 OID 18105219)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2495 (class 1259 OID 18105221)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2548 (class 1259 OID 18105345)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2618 (class 1259 OID 18105547)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 18105580)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2609 (class 1259 OID 18105522)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2610 (class 1259 OID 18105523)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2465 (class 1259 OID 18105126)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2466 (class 1259 OID 18105127)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2587 (class 1259 OID 18105450)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2438 (class 1259 OID 18105026)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2485 (class 1259 OID 18105190)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2435 (class 1259 OID 18105014)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2570 (class 1259 OID 18105397)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2571 (class 1259 OID 18105396)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2640 (class 1259 OID 18105611)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 18105178)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2619 (class 1259 OID 18105560)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2673 (class 1259 OID 18105799)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2656 (class 1259 OID 18105730)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2657 (class 1259 OID 18105731)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2606 (class 1259 OID 18105511)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2528 (class 1259 OID 18105307)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2451 (class 1259 OID 18105076)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2722 (class 2606 OID 18105971)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2721 (class 2606 OID 18105976)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2717 (class 2606 OID 18105996)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2723 (class 2606 OID 18105966)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2719 (class 2606 OID 18105986)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2718 (class 2606 OID 18105991)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2720 (class 2606 OID 18105981)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2755 (class 2606 OID 18106146)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2754 (class 2606 OID 18106151)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2753 (class 2606 OID 18106156)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2786 (class 2606 OID 18106316)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2787 (class 2606 OID 18106311)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2705 (class 2606 OID 18105906)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2739 (class 2606 OID 18106076)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2781 (class 2606 OID 18106296)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2782 (class 2606 OID 18106291)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2780 (class 2606 OID 18106301)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2783 (class 2606 OID 18106286)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2784 (class 2606 OID 18106281)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2737 (class 2606 OID 18106071)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2738 (class 2606 OID 18106066)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2716 (class 2606 OID 18105961)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2749 (class 2606 OID 18106116)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2747 (class 2606 OID 18106126)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2748 (class 2606 OID 18106121)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2711 (class 2606 OID 18105941)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2712 (class 2606 OID 18105936)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2735 (class 2606 OID 18106056)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2778 (class 2606 OID 18106271)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2758 (class 2606 OID 18106161)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2757 (class 2606 OID 18106166)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2756 (class 2606 OID 18106171)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2785 (class 2606 OID 18106306)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2760 (class 2606 OID 18106191)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2763 (class 2606 OID 18106176)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2759 (class 2606 OID 18106196)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2761 (class 2606 OID 18106186)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2762 (class 2606 OID 18106181)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2709 (class 2606 OID 18105931)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2710 (class 2606 OID 18105926)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2701 (class 2606 OID 18105891)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2702 (class 2606 OID 18105886)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2743 (class 2606 OID 18106096)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2698 (class 2606 OID 18105866)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2697 (class 2606 OID 18105871)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2744 (class 2606 OID 18106111)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2745 (class 2606 OID 18106106)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2746 (class 2606 OID 18106101)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2714 (class 2606 OID 18105946)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2713 (class 2606 OID 18105951)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2694 (class 2606 OID 18105851)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2727 (class 2606 OID 18106031)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2729 (class 2606 OID 18106021)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2730 (class 2606 OID 18106016)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2728 (class 2606 OID 18106026)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2696 (class 2606 OID 18105856)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2695 (class 2606 OID 18105861)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2740 (class 2606 OID 18106081)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2790 (class 2606 OID 18106331)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2792 (class 2606 OID 18106336)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2791 (class 2606 OID 18106341)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2736 (class 2606 OID 18106061)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2752 (class 2606 OID 18106136)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2751 (class 2606 OID 18106141)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2770 (class 2606 OID 18106251)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2771 (class 2606 OID 18106246)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2774 (class 2606 OID 18106231)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2773 (class 2606 OID 18106236)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2772 (class 2606 OID 18106241)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2707 (class 2606 OID 18105916)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2708 (class 2606 OID 18105911)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2706 (class 2606 OID 18105921)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2741 (class 2606 OID 18106091)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2742 (class 2606 OID 18106086)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2776 (class 2606 OID 18106256)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2775 (class 2606 OID 18106261)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2767 (class 2606 OID 18106221)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2766 (class 2606 OID 18106226)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2769 (class 2606 OID 18106211)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2768 (class 2606 OID 18106216)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2750 (class 2606 OID 18106131)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2731 (class 2606 OID 18106051)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2732 (class 2606 OID 18106046)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2734 (class 2606 OID 18106036)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2733 (class 2606 OID 18106041)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2764 (class 2606 OID 18106206)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2765 (class 2606 OID 18106201)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2715 (class 2606 OID 18105956)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2777 (class 2606 OID 18106266)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2779 (class 2606 OID 18106276)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2789 (class 2606 OID 18106321)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2788 (class 2606 OID 18106326)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2699 (class 2606 OID 18105881)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2700 (class 2606 OID 18105876)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2704 (class 2606 OID 18105896)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2703 (class 2606 OID 18105901)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2724 (class 2606 OID 18106011)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2725 (class 2606 OID 18106006)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2726 (class 2606 OID 18106001)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-08 17:31:27 CEST

--
-- PostgreSQL database dump complete
--

