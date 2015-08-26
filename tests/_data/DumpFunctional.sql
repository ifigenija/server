--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-26 15:36:17 CEST

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
-- TOC entry 2979 (class 0 OID 0)
-- Dependencies: 241
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 177 (class 1259 OID 15708687)
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
-- TOC entry 223 (class 1259 OID 15709201)
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
-- TOC entry 222 (class 1259 OID 15709184)
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
-- TOC entry 216 (class 1259 OID 15709096)
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
-- TOC entry 239 (class 1259 OID 15709450)
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
-- TOC entry 191 (class 1259 OID 15708865)
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
-- TOC entry 194 (class 1259 OID 15708899)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 15709352)
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
-- TOC entry 186 (class 1259 OID 15708808)
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
-- TOC entry 224 (class 1259 OID 15709214)
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
-- TOC entry 210 (class 1259 OID 15709031)
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
-- TOC entry 189 (class 1259 OID 15708845)
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
-- TOC entry 193 (class 1259 OID 15708893)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 15708825)
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
-- TOC entry 199 (class 1259 OID 15708946)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 237 (class 1259 OID 15709431)
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
-- TOC entry 238 (class 1259 OID 15709443)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 15709465)
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
-- TOC entry 203 (class 1259 OID 15708971)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 15708782)
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
-- TOC entry 178 (class 1259 OID 15708696)
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
-- TOC entry 179 (class 1259 OID 15708707)
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
-- TOC entry 174 (class 1259 OID 15708661)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 15708680)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 15708978)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 15709011)
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
-- TOC entry 219 (class 1259 OID 15709135)
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
-- TOC entry 181 (class 1259 OID 15708740)
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
-- TOC entry 183 (class 1259 OID 15708774)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 15708952)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 15708759)
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
-- TOC entry 188 (class 1259 OID 15708837)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 15708964)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 15709313)
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
-- TOC entry 227 (class 1259 OID 15709323)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 15709269)
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
-- TOC entry 228 (class 1259 OID 15709331)
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
-- TOC entry 206 (class 1259 OID 15708993)
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
-- TOC entry 198 (class 1259 OID 15708937)
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
-- TOC entry 197 (class 1259 OID 15708927)
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
-- TOC entry 218 (class 1259 OID 15709124)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 15709063)
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
-- TOC entry 171 (class 1259 OID 15708632)
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
-- TOC entry 170 (class 1259 OID 15708630)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2980 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 207 (class 1259 OID 15709005)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 15708670)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 15708654)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 15709019)
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
-- TOC entry 201 (class 1259 OID 15708958)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 15708904)
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
-- TOC entry 233 (class 1259 OID 15709372)
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
-- TOC entry 232 (class 1259 OID 15709364)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 15709359)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 15709073)
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
-- TOC entry 180 (class 1259 OID 15708732)
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
-- TOC entry 196 (class 1259 OID 15708914)
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
-- TOC entry 217 (class 1259 OID 15709113)
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
-- TOC entry 229 (class 1259 OID 15709341)
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
-- TOC entry 185 (class 1259 OID 15708794)
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
-- TOC entry 172 (class 1259 OID 15708641)
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
-- TOC entry 221 (class 1259 OID 15709161)
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
-- TOC entry 190 (class 1259 OID 15708856)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 15708985)
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
-- TOC entry 215 (class 1259 OID 15709087)
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
-- TOC entry 235 (class 1259 OID 15709411)
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
-- TOC entry 234 (class 1259 OID 15709383)
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
-- TOC entry 236 (class 1259 OID 15709423)
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
-- TOC entry 212 (class 1259 OID 15709056)
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
-- TOC entry 192 (class 1259 OID 15708888)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 15709151)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 15709046)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 15708635)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2909 (class 0 OID 15708687)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2955 (class 0 OID 15709201)
-- Dependencies: 223
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55dd-c0cf-5adb-949a1573faa3	000d0000-55dd-c0cf-e8ee-2b1fac8c7708	\N	00090000-55dd-c0cf-a6ac-70d820a69872	000b0000-55dd-c0cf-64fc-a26f269961cd	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55dd-c0cf-30d0-2c8bf7e1f977	000d0000-55dd-c0cf-5a1e-93079afbbb63	00100000-55dd-c0cf-0961-d25f81b72a3f	00090000-55dd-c0cf-ad88-4024e1379328	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55dd-c0cf-9411-7a8ebdaab236	000d0000-55dd-c0cf-1d8a-2e7945485103	00100000-55dd-c0cf-c2f9-e977888575f0	00090000-55dd-c0cf-feed-829abca5c50c	\N	0003	t	\N	2015-08-26	\N	2	\N	\N	f	f
000c0000-55dd-c0cf-83a9-94a91accf587	000d0000-55dd-c0cf-b3e4-53bb2f292dd3	\N	00090000-55dd-c0cf-d2f6-c9f04693ad79	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55dd-c0cf-9e14-75574f278207	000d0000-55dd-c0cf-a173-03ef3eb5455a	\N	00090000-55dd-c0cf-84ef-0194db097fb6	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55dd-c0cf-9e56-614af521e5a6	000d0000-55dd-c0cf-64e4-01208e4ecbcf	\N	00090000-55dd-c0cf-3d69-0c112aa1f233	000b0000-55dd-c0cf-ef4a-19e37be9841e	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55dd-c0cf-8c5d-94e295185be0	000d0000-55dd-c0cf-55fd-89c665a70095	00100000-55dd-c0cf-ab16-b5923e621220	00090000-55dd-c0cf-7070-ceb95f63aa74	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55dd-c0cf-35ec-2e02b7abbdee	000d0000-55dd-c0cf-336d-0a8d6ba8eb56	\N	00090000-55dd-c0cf-c700-c079c6a3bdc8	000b0000-55dd-c0cf-d518-4a7397cd9842	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55dd-c0cf-0286-3af49272b9c1	000d0000-55dd-c0cf-55fd-89c665a70095	00100000-55dd-c0cf-f852-402fb26e3f1b	00090000-55dd-c0cf-1466-eb771067846c	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55dd-c0cf-5534-7978f3c6766c	000d0000-55dd-c0cf-55fd-89c665a70095	00100000-55dd-c0cf-9c4e-a70c84edb175	00090000-55dd-c0cf-3167-b0bd45f97d26	\N	0010	t	\N	2015-08-26	\N	16	\N	\N	f	t
000c0000-55dd-c0cf-9284-3d1deddf47bf	000d0000-55dd-c0cf-55fd-89c665a70095	00100000-55dd-c0cf-44b9-ab20bd1a199e	00090000-55dd-c0cf-7b72-c045c62e8f34	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2954 (class 0 OID 15709184)
-- Dependencies: 222
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 15709096)
-- Dependencies: 216
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55dd-c0cf-2966-e898bff93b11	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55dd-c0cf-f746-559d11ef84c5	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55dd-c0cf-d1ed-d3fd05eab8c5	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2971 (class 0 OID 15709450)
-- Dependencies: 239
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2923 (class 0 OID 15708865)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55dd-c0cf-439f-418dc87caf4f	\N	\N	00200000-55dd-c0cf-161a-80ee64ed1055	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55dd-c0cf-9e08-659f65d3a8e8	\N	\N	00200000-55dd-c0cf-4e62-27cbfa743e77	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55dd-c0cf-21de-606ab631cfb6	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55dd-c0cf-e267-31b86faa7019	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55dd-c0cf-af87-b66d28c24ce7	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2926 (class 0 OID 15708899)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 15709352)
-- Dependencies: 230
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2918 (class 0 OID 15708808)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55dd-c0ce-cff4-781092a4d296	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55dd-c0ce-f1bb-ac094147a741	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55dd-c0ce-33e8-015e353903e1	AL	ALB	008	Albania 	Albanija	\N
00040000-55dd-c0ce-319c-5d88f2e4ff07	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55dd-c0ce-8f22-485805cabb40	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55dd-c0ce-a339-294a108ee9e1	AD	AND	020	Andorra 	Andora	\N
00040000-55dd-c0ce-ecd7-616e64f8ad8e	AO	AGO	024	Angola 	Angola	\N
00040000-55dd-c0ce-0d69-a93824e12112	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55dd-c0ce-6b53-a4044d96f530	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55dd-c0ce-d82d-167cb3e8ab75	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55dd-c0ce-16af-c4264be11bba	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55dd-c0ce-fae7-b1f5cfb83cf7	AM	ARM	051	Armenia 	Armenija	\N
00040000-55dd-c0ce-f951-b2cb06445104	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55dd-c0ce-c4f7-4c9ca5a9e32e	AU	AUS	036	Australia 	Avstralija	\N
00040000-55dd-c0ce-1040-97beb198a28d	AT	AUT	040	Austria 	Avstrija	\N
00040000-55dd-c0ce-8e3b-11c05557419a	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55dd-c0ce-3df6-19b18d2a59a1	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55dd-c0ce-0881-dd13318fe21f	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55dd-c0ce-63cc-66f05e917520	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55dd-c0ce-a97e-f77bfea28cfa	BB	BRB	052	Barbados 	Barbados	\N
00040000-55dd-c0ce-7be0-f2262a942142	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55dd-c0ce-16f1-2fae8fb80792	BE	BEL	056	Belgium 	Belgija	\N
00040000-55dd-c0ce-b919-7c73707ea176	BZ	BLZ	084	Belize 	Belize	\N
00040000-55dd-c0ce-ae98-b0cf15100cd9	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55dd-c0ce-b385-0b951bd3d774	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55dd-c0ce-f61f-4bc4592391b8	BT	BTN	064	Bhutan 	Butan	\N
00040000-55dd-c0ce-6836-5d6b6f478713	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55dd-c0ce-1395-ea5e43b5c164	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55dd-c0ce-2840-b2f5d26eedca	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55dd-c0ce-d753-603878757ad1	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55dd-c0ce-4708-b999c111513e	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55dd-c0ce-4ffd-e001990988b7	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55dd-c0ce-3ccf-adb98d69fcda	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55dd-c0ce-0d9d-fa3c012de209	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55dd-c0ce-7339-040581c4cb68	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55dd-c0ce-95c7-ad6f45e68188	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55dd-c0ce-f4bc-b429dc094226	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55dd-c0ce-90ee-acc94735604c	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55dd-c0ce-f2bd-cfb76ec17160	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55dd-c0ce-18cd-a60760092c88	CA	CAN	124	Canada 	Kanada	\N
00040000-55dd-c0ce-7087-2914d2452297	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55dd-c0ce-12eb-226e15ab6a9c	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55dd-c0ce-5228-cb938a5484ff	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55dd-c0ce-fc4c-a03c176b2496	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55dd-c0ce-2ae6-ef493ecced0f	CL	CHL	152	Chile 	Čile	\N
00040000-55dd-c0ce-f5c4-5243c310c542	CN	CHN	156	China 	Kitajska	\N
00040000-55dd-c0ce-a2d6-ef8d565bdb36	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55dd-c0ce-e837-0e7ac5744c0e	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55dd-c0ce-ebd7-ac775c69b47b	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55dd-c0ce-9e61-6d177fd30cbf	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55dd-c0ce-fcd4-6960639377b3	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55dd-c0ce-7991-683317541925	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55dd-c0ce-a71e-d23d40069a68	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55dd-c0ce-c743-94593c23cfd2	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55dd-c0ce-1a26-00d6628ea00b	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55dd-c0ce-0d9c-419167983989	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55dd-c0ce-21a3-db8bccbffa48	CU	CUB	192	Cuba 	Kuba	\N
00040000-55dd-c0ce-d7d4-413549f874c4	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55dd-c0ce-c588-50b1b5aee706	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55dd-c0ce-0813-bb7bbf6ef508	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55dd-c0ce-012f-073fc92dfe89	DK	DNK	208	Denmark 	Danska	\N
00040000-55dd-c0ce-c1ff-55b02265cfb9	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55dd-c0ce-96e2-1f916772c247	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55dd-c0ce-b19d-e9674caffd2c	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55dd-c0ce-fd75-2d59bebe88bd	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55dd-c0ce-8e9e-5cef47b646c4	EG	EGY	818	Egypt 	Egipt	\N
00040000-55dd-c0ce-d067-1cdcfa0bfefc	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55dd-c0ce-5d97-c30033826453	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55dd-c0ce-eee9-e1ff38537a4b	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55dd-c0ce-7bb4-bf2c87d13597	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55dd-c0ce-f02e-5960879644f9	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55dd-c0ce-5059-e10e12d8d1e0	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55dd-c0ce-8b1a-91bcb7f5420c	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55dd-c0ce-8825-5456eabc4556	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55dd-c0ce-5d22-a9e16dd613eb	FI	FIN	246	Finland 	Finska	\N
00040000-55dd-c0ce-1fbd-322015ee62ba	FR	FRA	250	France 	Francija	\N
00040000-55dd-c0ce-8746-80ff74d7e0d5	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55dd-c0ce-fd8c-f1529061bb69	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55dd-c0ce-e0cf-7fa380b487ef	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55dd-c0ce-bc5a-3fa454baa5b7	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55dd-c0ce-a27c-39d9045b426e	GA	GAB	266	Gabon 	Gabon	\N
00040000-55dd-c0ce-919c-3cb061f45c6a	GM	GMB	270	Gambia 	Gambija	\N
00040000-55dd-c0ce-c198-72f2ff0eb4fc	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55dd-c0ce-31c5-591198edd8b6	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55dd-c0ce-2247-09f07ec9a2bd	GH	GHA	288	Ghana 	Gana	\N
00040000-55dd-c0ce-a215-816b9f0e63d5	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55dd-c0ce-d1e7-c21e4250963a	GR	GRC	300	Greece 	Grčija	\N
00040000-55dd-c0ce-6702-bb419906c960	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55dd-c0ce-c4f9-a6638c5e7e7d	GD	GRD	308	Grenada 	Grenada	\N
00040000-55dd-c0ce-ceb2-7dcb827b4dc2	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55dd-c0ce-a648-89310d155ec6	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55dd-c0ce-dd49-4399bfac3368	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55dd-c0ce-a7d8-d9033490dd00	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55dd-c0ce-dff9-ccbcd16bdbd6	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55dd-c0ce-3042-5eee399e92f6	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55dd-c0ce-3d0a-8e22dba9264d	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55dd-c0ce-9afa-6939088497d7	HT	HTI	332	Haiti 	Haiti	\N
00040000-55dd-c0ce-45d2-05923a58a16c	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55dd-c0ce-684c-5f5c11267767	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55dd-c0ce-175b-0486bc17d0cb	HN	HND	340	Honduras 	Honduras	\N
00040000-55dd-c0ce-9741-3c90583143ca	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55dd-c0ce-2d01-0e2c654ff04a	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55dd-c0ce-978a-8f819b94d057	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55dd-c0ce-3539-323daad45314	IN	IND	356	India 	Indija	\N
00040000-55dd-c0ce-794f-0659954dafad	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55dd-c0ce-1712-7e5b65f7bc11	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55dd-c0ce-13f1-a1356b328207	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55dd-c0ce-f31d-2d9d03590514	IE	IRL	372	Ireland 	Irska	\N
00040000-55dd-c0ce-ed0f-97d62ea2c097	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55dd-c0ce-8ffe-6d03f802f537	IL	ISR	376	Israel 	Izrael	\N
00040000-55dd-c0ce-64b0-2b9960cb6a12	IT	ITA	380	Italy 	Italija	\N
00040000-55dd-c0ce-edd3-e3cabb5981c5	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55dd-c0ce-7614-32e1a6470818	JP	JPN	392	Japan 	Japonska	\N
00040000-55dd-c0ce-2553-992b5d760a14	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55dd-c0ce-b724-ecc47bed1205	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55dd-c0ce-0ad7-0105f8ba008a	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55dd-c0ce-c8fa-4558ad01bdb2	KE	KEN	404	Kenya 	Kenija	\N
00040000-55dd-c0ce-df38-ddea12b6f655	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55dd-c0ce-e636-ea225e9b79b1	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55dd-c0ce-20ab-8bcf421b8e86	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55dd-c0ce-15ea-b5ec2d863e7b	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55dd-c0ce-3beb-8f7546aa80e2	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55dd-c0ce-11c8-572190795cfc	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55dd-c0ce-9b85-f2661d3aefbf	LV	LVA	428	Latvia 	Latvija	\N
00040000-55dd-c0ce-e2fe-31222426a260	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55dd-c0ce-594e-a4c42d90e148	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55dd-c0ce-bea9-099e15ef536d	LR	LBR	430	Liberia 	Liberija	\N
00040000-55dd-c0ce-74c9-8c25d4f3a29b	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55dd-c0ce-0750-db50c8f49dbe	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55dd-c0ce-2383-fab024e5d91a	LT	LTU	440	Lithuania 	Litva	\N
00040000-55dd-c0ce-76e0-0bb60e309ac8	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55dd-c0ce-7d93-0a515eeec56e	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55dd-c0ce-3a0e-132df5e44a26	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55dd-c0ce-0193-b4bfe102d792	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55dd-c0ce-8458-d3e31bf29791	MW	MWI	454	Malawi 	Malavi	\N
00040000-55dd-c0ce-b214-bb9417f859b1	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55dd-c0ce-67da-7030bca1be7a	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55dd-c0ce-f961-d6368acb4e77	ML	MLI	466	Mali 	Mali	\N
00040000-55dd-c0ce-e26c-a96894a46047	MT	MLT	470	Malta 	Malta	\N
00040000-55dd-c0ce-d196-fa62ae624c4b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55dd-c0ce-e3ad-29e3dc862bf5	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55dd-c0ce-b3af-e6114ea97fcd	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55dd-c0ce-6d16-e234622edde1	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55dd-c0ce-8ed8-8b380c0f6c3e	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55dd-c0ce-fca9-4f358fa1ba7d	MX	MEX	484	Mexico 	Mehika	\N
00040000-55dd-c0ce-83df-4b74b8180446	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55dd-c0ce-92e1-3e38f55cfb7a	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55dd-c0ce-afca-695791d55f67	MC	MCO	492	Monaco 	Monako	\N
00040000-55dd-c0ce-1323-c5c013acfd7c	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55dd-c0ce-164e-d5022d869316	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55dd-c0ce-349a-44cdd6c8ee5d	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55dd-c0ce-d4a0-481048d548bf	MA	MAR	504	Morocco 	Maroko	\N
00040000-55dd-c0ce-5072-675ea1b2efa9	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55dd-c0ce-3c99-a617856ad464	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55dd-c0ce-0794-964c77299dc9	NA	NAM	516	Namibia 	Namibija	\N
00040000-55dd-c0ce-358b-ea0725e54cd5	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55dd-c0ce-a628-91dc6d11f839	NP	NPL	524	Nepal 	Nepal	\N
00040000-55dd-c0ce-534d-0e45d0432540	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55dd-c0ce-64db-126944db97c3	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55dd-c0ce-8d13-f79ad6b22781	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55dd-c0ce-d1cd-a1689b974ed7	NE	NER	562	Niger 	Niger 	\N
00040000-55dd-c0ce-0192-a519214bccf8	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55dd-c0ce-f818-82d755972403	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55dd-c0ce-a49e-73d5294c78ed	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55dd-c0ce-78b5-ab5ac4cc5f32	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55dd-c0ce-d77e-d012958e641e	NO	NOR	578	Norway 	Norveška	\N
00040000-55dd-c0ce-0431-3e98da98e83d	OM	OMN	512	Oman 	Oman	\N
00040000-55dd-c0ce-e4b7-a0f14314e011	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55dd-c0ce-2aec-d00b89a9e50e	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55dd-c0ce-52c6-5a0287bad4fa	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55dd-c0ce-a183-efdae63ef55f	PA	PAN	591	Panama 	Panama	\N
00040000-55dd-c0ce-f3cb-523624e28626	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55dd-c0ce-c10d-d023f45e9e7e	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55dd-c0ce-06de-a65dba73d333	PE	PER	604	Peru 	Peru	\N
00040000-55dd-c0ce-54bf-cd2b8956faf4	PH	PHL	608	Philippines 	Filipini	\N
00040000-55dd-c0ce-0532-60994cd1a2f6	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55dd-c0ce-0142-c21746424fb7	PL	POL	616	Poland 	Poljska	\N
00040000-55dd-c0ce-099f-49b39193bf73	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55dd-c0ce-a050-b158658f63a5	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55dd-c0ce-0c0c-abb7a3f26bb2	QA	QAT	634	Qatar 	Katar	\N
00040000-55dd-c0ce-e908-cbb836b6e485	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55dd-c0ce-6665-3de4e8aae396	RO	ROU	642	Romania 	Romunija	\N
00040000-55dd-c0ce-ed52-33ce0eb3eceb	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55dd-c0ce-dd7f-407fc0bd22dc	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55dd-c0ce-5378-cb4b6558fe0f	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55dd-c0ce-2ada-f6c60f59f126	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55dd-c0ce-7445-75767fb98e23	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55dd-c0ce-6335-73826b281fc3	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55dd-c0ce-5f14-00871fa65182	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55dd-c0ce-b9bd-f791315b8aa7	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55dd-c0ce-e1fd-7a38dfd0a67a	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55dd-c0ce-c424-2743dbc293a4	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55dd-c0ce-f0fc-178c23f01a94	SM	SMR	674	San Marino 	San Marino	\N
00040000-55dd-c0ce-9fe1-2f9710fb1d51	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55dd-c0ce-eaf7-32e067cca2d8	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55dd-c0ce-5cd3-561eb2748c95	SN	SEN	686	Senegal 	Senegal	\N
00040000-55dd-c0ce-02b0-0852ebb2f7e8	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55dd-c0ce-8b9e-d3ab67d5de61	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55dd-c0ce-a91a-39d769b326c8	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55dd-c0ce-ac08-844eb67b8b71	SG	SGP	702	Singapore 	Singapur	\N
00040000-55dd-c0ce-3fdc-6a8876bf365e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55dd-c0ce-6e87-7902817ae52d	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55dd-c0ce-8e1f-5a00effcefe5	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55dd-c0ce-720c-7edbf5f3b1bd	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55dd-c0ce-f85e-d5d04b85d71a	SO	SOM	706	Somalia 	Somalija	\N
00040000-55dd-c0ce-c3ff-c51a67d6963f	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55dd-c0ce-4d9e-d3794b018700	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55dd-c0ce-8b00-634cf0edf872	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55dd-c0ce-6259-959d8ee6ff4d	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55dd-c0ce-403b-8a801dc3439e	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55dd-c0ce-fa30-306831c22213	SD	SDN	729	Sudan 	Sudan	\N
00040000-55dd-c0ce-156d-46b08a52a67d	SR	SUR	740	Suriname 	Surinam	\N
00040000-55dd-c0ce-7fbc-e03b8c15cd15	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55dd-c0ce-3fc9-8e8c20284ca4	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55dd-c0ce-2a26-df57b0339c9f	SE	SWE	752	Sweden 	Švedska	\N
00040000-55dd-c0ce-9cfa-16e86129d504	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55dd-c0ce-2648-9ebad0e96426	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55dd-c0ce-3e73-0ef1447d5145	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55dd-c0ce-c929-965d0e08946a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55dd-c0ce-1dc5-c29e132d3a4c	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55dd-c0ce-c302-b3691ba1c3dd	TH	THA	764	Thailand 	Tajska	\N
00040000-55dd-c0ce-defc-371172fee56f	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55dd-c0ce-19f6-ab5e9d24a64d	TG	TGO	768	Togo 	Togo	\N
00040000-55dd-c0ce-0a6a-cc55e5fa408a	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55dd-c0ce-bbe7-b3479f397cd6	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55dd-c0ce-5279-b107ee32b848	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55dd-c0ce-e9e8-1eec433f8d42	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55dd-c0ce-8369-692eb7dae2ea	TR	TUR	792	Turkey 	Turčija	\N
00040000-55dd-c0ce-5f8f-4987050bdf68	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55dd-c0ce-98c4-048fedc55a5b	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55dd-c0ce-85a2-258e3d95e358	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55dd-c0ce-f9c8-c5b12d97b7ae	UG	UGA	800	Uganda 	Uganda	\N
00040000-55dd-c0ce-ddc9-d898af6a0a8c	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55dd-c0ce-fe77-a1cb54a24728	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55dd-c0ce-d673-1105b6c59ad1	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55dd-c0ce-6547-48074b0bdc75	US	USA	840	United States 	Združene države Amerike	\N
00040000-55dd-c0ce-4bc4-f5fa415f1656	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55dd-c0ce-82e4-214562331e15	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55dd-c0ce-fd62-25f5d15f6804	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55dd-c0ce-e1da-3d9f2f92f5cc	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55dd-c0ce-6119-e3b9afdb8089	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55dd-c0ce-07d5-68523e407837	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55dd-c0ce-a8b4-ffc745bf7202	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55dd-c0ce-09ae-883daca1a9b8	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55dd-c0ce-1a5e-868a5fa3c63c	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55dd-c0ce-cffc-e056d7b92afa	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55dd-c0ce-cc9f-06dd4a550048	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55dd-c0ce-6678-7a870e6951e1	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55dd-c0ce-e821-43e645eefeed	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2956 (class 0 OID 15709214)
-- Dependencies: 224
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55dd-c0cf-0c2b-f7a79ce30ca4	000e0000-55dd-c0cf-22e9-913abae6607e	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55dd-c0ce-2177-4d360563dff8	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55dd-c0cf-5f83-2b4bcf5fcbca	000e0000-55dd-c0cf-c2c8-362ea015150d	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55dd-c0ce-f388-2cd64b652eb4	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55dd-c0cf-3298-e85e429b57ef	000e0000-55dd-c0cf-59f8-adc52b887b6c	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55dd-c0ce-2177-4d360563dff8	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55dd-c0cf-af3e-b8cad5b57082	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55dd-c0cf-eda7-10513c9432d8	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2942 (class 0 OID 15709031)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55dd-c0cf-55fd-89c665a70095	000e0000-55dd-c0cf-c2c8-362ea015150d	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55dd-c0ce-1cec-a530291c333e
000d0000-55dd-c0cf-e8ee-2b1fac8c7708	000e0000-55dd-c0cf-c2c8-362ea015150d	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55dd-c0ce-1cec-a530291c333e
000d0000-55dd-c0cf-5a1e-93079afbbb63	000e0000-55dd-c0cf-c2c8-362ea015150d	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55dd-c0ce-5fd0-958d8926deff
000d0000-55dd-c0cf-1d8a-2e7945485103	000e0000-55dd-c0cf-c2c8-362ea015150d	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55dd-c0ce-36cf-d2858f6c7f48
000d0000-55dd-c0cf-b3e4-53bb2f292dd3	000e0000-55dd-c0cf-c2c8-362ea015150d	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55dd-c0ce-2d50-1d28bc68c068
000d0000-55dd-c0cf-a173-03ef3eb5455a	000e0000-55dd-c0cf-c2c8-362ea015150d	\N	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55dd-c0ce-2d50-1d28bc68c068
000d0000-55dd-c0cf-64e4-01208e4ecbcf	000e0000-55dd-c0cf-c2c8-362ea015150d	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55dd-c0ce-1cec-a530291c333e
000d0000-55dd-c0cf-336d-0a8d6ba8eb56	000e0000-55dd-c0cf-c2c8-362ea015150d	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55dd-c0ce-f151-1d3e05a2cbfd
\.


--
-- TOC entry 2921 (class 0 OID 15708845)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2925 (class 0 OID 15708893)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2919 (class 0 OID 15708825)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55dd-c0cf-3de1-33679295ece6	00080000-55dd-c0cf-1230-f608884bbf0c	00090000-55dd-c0cf-3167-b0bd45f97d26	AK		
\.


--
-- TOC entry 2931 (class 0 OID 15708946)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 15709431)
-- Dependencies: 237
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 15709443)
-- Dependencies: 238
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 15709465)
-- Dependencies: 240
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 15708971)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 15708782)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55dd-c0ce-0d45-8b8f7f38eb90	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55dd-c0ce-5ab0-dbba24d376a7	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55dd-c0ce-14f7-1f818a79514a	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55dd-c0ce-a633-345f867bd49b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55dd-c0ce-34ca-f4ef7a69e8f3	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55dd-c0ce-5999-bc2b28d524a0	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55dd-c0ce-118b-0be197389634	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55dd-c0ce-0f50-5a7fe223f8d2	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55dd-c0ce-208c-6108db5d2c6e	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55dd-c0ce-6f30-601b28390cf0	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55dd-c0ce-19d7-eb66bd5b2c19	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55dd-c0ce-5cdd-e99ea71679b9	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55dd-c0ce-b9a7-1407c98c3efc	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55dd-c0cf-7a10-f101c9a9878b	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55dd-c0cf-89b1-fd3268fae2d7	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55dd-c0cf-0e3f-a5275e59a3ef	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55dd-c0cf-ce80-6b22cc8ecb35	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55dd-c0cf-8f06-cb699903f778	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55dd-c0d0-784d-7fd45ec55a56	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2910 (class 0 OID 15708696)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55dd-c0cf-9c6d-744907e9c8b9	00000000-55dd-c0cf-7a10-f101c9a9878b	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55dd-c0cf-1f58-decc9a99d857	00000000-55dd-c0cf-7a10-f101c9a9878b	00010000-55dd-c0ce-0a0d-f4a2ca51f40c	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55dd-c0cf-1783-5207b5252234	00000000-55dd-c0cf-89b1-fd3268fae2d7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2911 (class 0 OID 15708707)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55dd-c0cf-a6ac-70d820a69872	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55dd-c0cf-d2f6-c9f04693ad79	00010000-55dd-c0cf-4e89-56c8673b11e5	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55dd-c0cf-feed-829abca5c50c	00010000-55dd-c0cf-8c39-eca6c363dd40	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55dd-c0cf-1466-eb771067846c	00010000-55dd-c0cf-9326-3289c55c104c	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55dd-c0cf-7f4e-4d4bda75068c	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55dd-c0cf-3d69-0c112aa1f233	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55dd-c0cf-7b72-c045c62e8f34	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55dd-c0cf-7070-ceb95f63aa74	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55dd-c0cf-3167-b0bd45f97d26	00010000-55dd-c0cf-536b-9b66b00d290f	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55dd-c0cf-ad88-4024e1379328	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55dd-c0cf-6013-f1b86a9180fc	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55dd-c0cf-84ef-0194db097fb6	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55dd-c0cf-c700-c079c6a3bdc8	00010000-55dd-c0cf-125e-e2d03e53c0cb	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2906 (class 0 OID 15708661)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55dd-c0ce-0add-ae1768c912f3	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55dd-c0ce-3673-bde14f7017f0	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55dd-c0ce-58d9-61aeab8a9cbd	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55dd-c0ce-dac2-9d85eac6cfc1	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55dd-c0ce-ee1f-e37b258097c3	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55dd-c0ce-2f08-257c370ad0fa	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55dd-c0ce-12a0-f5f51f9363cd	Abonma-read	Abonma - branje	f
00030000-55dd-c0ce-c1f3-3d92a0271712	Abonma-write	Abonma - spreminjanje	f
00030000-55dd-c0ce-819e-1d14de527b17	Alternacija-read	Alternacija - branje	f
00030000-55dd-c0ce-6e19-98a9a72053c0	Alternacija-write	Alternacija - spreminjanje	f
00030000-55dd-c0ce-cb76-9af3020fb409	Arhivalija-read	Arhivalija - branje	f
00030000-55dd-c0ce-f855-f96fa80d2dc6	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55dd-c0ce-dc83-5489145c81e2	Besedilo-read	Besedilo - branje	f
00030000-55dd-c0ce-cb69-988ac61440db	Besedilo-write	Besedilo - spreminjanje	f
00030000-55dd-c0ce-609c-e7c7d9019a1c	DogodekIzven-read	DogodekIzven - branje	f
00030000-55dd-c0ce-c9da-35682bb94d13	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55dd-c0ce-0109-821bcea030c2	Dogodek-read	Dogodek - branje	f
00030000-55dd-c0ce-a315-b3d0d6aa4530	Dogodek-write	Dogodek - spreminjanje	f
00030000-55dd-c0ce-32bb-c9f409a2ca94	DrugiVir-read	DrugiVir - branje	f
00030000-55dd-c0ce-fa1e-7acfecd3e50a	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55dd-c0ce-cc51-ca22c0319b3a	Drzava-read	Drzava - branje	f
00030000-55dd-c0ce-2db6-d123fe65a00c	Drzava-write	Drzava - spreminjanje	f
00030000-55dd-c0ce-bd79-5d6f3581a0fb	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55dd-c0ce-9ab0-a03af9743626	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55dd-c0ce-f983-34758fb263cf	Funkcija-read	Funkcija - branje	f
00030000-55dd-c0ce-017d-70f9dfe3ad6d	Funkcija-write	Funkcija - spreminjanje	f
00030000-55dd-c0ce-048c-e607c9db7c9d	Gostovanje-read	Gostovanje - branje	f
00030000-55dd-c0ce-6103-7a80daee6f6c	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55dd-c0ce-d202-2926dfa1ecdf	Gostujoca-read	Gostujoca - branje	f
00030000-55dd-c0ce-84e6-e4b594cc6095	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55dd-c0ce-f08f-b450c4d181ea	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55dd-c0ce-0711-da81090bb903	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55dd-c0ce-96dd-4c80fef5804c	Kupec-read	Kupec - branje	f
00030000-55dd-c0ce-2096-41b41b8ae22b	Kupec-write	Kupec - spreminjanje	f
00030000-55dd-c0ce-1a2b-b7c38b7fd621	NacinPlacina-read	NacinPlacina - branje	f
00030000-55dd-c0ce-c53c-5009e204ff3e	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55dd-c0ce-074b-24b760131f48	Option-read	Option - branje	f
00030000-55dd-c0ce-a79a-6f5e57da921b	Option-write	Option - spreminjanje	f
00030000-55dd-c0ce-e10f-0e3894e7aaed	OptionValue-read	OptionValue - branje	f
00030000-55dd-c0ce-21ef-f89ebf76003a	OptionValue-write	OptionValue - spreminjanje	f
00030000-55dd-c0ce-a21c-a0f46e0f0778	Oseba-read	Oseba - branje	f
00030000-55dd-c0ce-6f97-c19493c23ce5	Oseba-write	Oseba - spreminjanje	f
00030000-55dd-c0ce-bef9-aded1a580aae	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55dd-c0ce-3871-2f96863b957d	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55dd-c0ce-53dc-9bd16da617e6	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55dd-c0ce-9c7b-6365288fba9d	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55dd-c0ce-83e1-2ed0fdcffe14	Pogodba-read	Pogodba - branje	f
00030000-55dd-c0ce-5ac3-e230a7963aba	Pogodba-write	Pogodba - spreminjanje	f
00030000-55dd-c0ce-2f22-36f001552c00	Popa-read	Popa - branje	f
00030000-55dd-c0ce-7458-d01e558c2b99	Popa-write	Popa - spreminjanje	f
00030000-55dd-c0ce-a794-c44545b066b3	Posta-read	Posta - branje	f
00030000-55dd-c0ce-a368-94318d95cb6c	Posta-write	Posta - spreminjanje	f
00030000-55dd-c0ce-1511-ea1c1e92d71d	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55dd-c0ce-9437-127bf5d6f5d9	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55dd-c0ce-be59-7d4b40c84646	PostniNaslov-read	PostniNaslov - branje	f
00030000-55dd-c0ce-6a44-a766e978be3d	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55dd-c0ce-8c88-079c9ae1c25d	Predstava-read	Predstava - branje	f
00030000-55dd-c0ce-c7c3-b2330c6a877a	Predstava-write	Predstava - spreminjanje	f
00030000-55dd-c0ce-714f-30a892cedbdc	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55dd-c0ce-885c-b842d96d5c76	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55dd-c0ce-d50f-1de20e84d295	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55dd-c0ce-66e6-55e8faeb1ab2	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55dd-c0ce-a651-b429caa44782	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55dd-c0ce-684b-3a39d4082e52	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55dd-c0ce-4ea2-2564081cec34	ProgramDela-read	ProgramDela - branje	f
00030000-55dd-c0ce-ee87-72a54232503e	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55dd-c0ce-3d57-8d83ba5050ed	ProgramFestival-read	ProgramFestival - branje	f
00030000-55dd-c0ce-9351-fc329721ec19	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55dd-c0ce-6f14-3a09986cd227	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55dd-c0ce-e4ea-9a6eca8f2d2e	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55dd-c0ce-7f05-d16faa4de595	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55dd-c0ce-4d14-4144b9cff202	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55dd-c0ce-b2ae-a45f674acc1c	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55dd-c0ce-0f2b-65b002ad6590	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55dd-c0ce-ab96-340091c5eaad	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55dd-c0ce-4bbf-646a570b0741	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55dd-c0ce-cb6b-62ddab958dc7	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55dd-c0ce-ab52-fe7da4c3d414	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55dd-c0ce-ac94-59c14df4f348	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55dd-c0ce-dec0-a54fc11a1def	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55dd-c0ce-87c9-925adbc4bc4c	ProgramRazno-read	ProgramRazno - branje	f
00030000-55dd-c0ce-318b-4a3a834c9d6e	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55dd-c0ce-467f-b256e6367367	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55dd-c0ce-1f79-ecc1da92b6ca	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55dd-c0ce-d847-03c0535f4d08	Prostor-read	Prostor - branje	f
00030000-55dd-c0ce-980a-b3d842396807	Prostor-write	Prostor - spreminjanje	f
00030000-55dd-c0ce-f77a-bb71afca66ce	Racun-read	Racun - branje	f
00030000-55dd-c0ce-1bda-8c83c0d66815	Racun-write	Racun - spreminjanje	f
00030000-55dd-c0ce-8cb4-15c7e6c7bf45	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55dd-c0ce-6353-f6accff29d49	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55dd-c0ce-5f04-e9a51174db45	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55dd-c0ce-c135-1180f68f0da6	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55dd-c0ce-1671-ef2451afdd6b	Rekvizit-read	Rekvizit - branje	f
00030000-55dd-c0ce-e50d-c07779fa3b1e	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55dd-c0ce-b94b-515ad08477ca	Revizija-read	Revizija - branje	f
00030000-55dd-c0ce-a842-3a7b6f94832d	Revizija-write	Revizija - spreminjanje	f
00030000-55dd-c0ce-3a99-30676c855397	Rezervacija-read	Rezervacija - branje	f
00030000-55dd-c0ce-5911-4e2feed5665b	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55dd-c0ce-2111-268ed9eddb3f	SedezniRed-read	SedezniRed - branje	f
00030000-55dd-c0ce-7cec-559971a3ab52	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55dd-c0ce-8a94-7d9a4a25a900	Sedez-read	Sedez - branje	f
00030000-55dd-c0ce-f004-47ef81338eca	Sedez-write	Sedez - spreminjanje	f
00030000-55dd-c0ce-5031-9237499043d3	Sezona-read	Sezona - branje	f
00030000-55dd-c0ce-f168-e8edeaf9f043	Sezona-write	Sezona - spreminjanje	f
00030000-55dd-c0ce-4c11-53d7d0a412ec	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55dd-c0ce-246f-edbe903dfc89	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55dd-c0ce-e2ae-4e2b4bbfc1bf	Stevilcenje-read	Stevilcenje - branje	f
00030000-55dd-c0ce-03f4-0c26075d90c2	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55dd-c0ce-9fac-0bc3e3d458c3	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55dd-c0ce-be4d-e56156be4fa9	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55dd-c0ce-dac2-2dc51030fb88	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55dd-c0ce-0204-08fdbe915a14	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55dd-c0ce-cc15-edd6eb0c79e0	Telefonska-read	Telefonska - branje	f
00030000-55dd-c0ce-3a17-e972597a286c	Telefonska-write	Telefonska - spreminjanje	f
00030000-55dd-c0ce-796a-73238c887651	TerminStoritve-read	TerminStoritve - branje	f
00030000-55dd-c0ce-e41f-3adf00f6dae1	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55dd-c0ce-6550-b12d59915cfa	TipFunkcije-read	TipFunkcije - branje	f
00030000-55dd-c0ce-a7db-330cdd694bf2	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55dd-c0ce-9188-2b5ea2ba7a39	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55dd-c0ce-e3d2-6faa98d6c4e7	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55dd-c0ce-d339-9c6cf30d404e	Trr-read	Trr - branje	f
00030000-55dd-c0ce-4a7a-537820af4063	Trr-write	Trr - spreminjanje	f
00030000-55dd-c0ce-3dce-765eacc93e6b	Uprizoritev-read	Uprizoritev - branje	f
00030000-55dd-c0ce-6e53-98e57bd09ed9	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55dd-c0ce-983f-1d54aaeef102	Vaja-read	Vaja - branje	f
00030000-55dd-c0ce-57f0-1bc6977b0b01	Vaja-write	Vaja - spreminjanje	f
00030000-55dd-c0ce-5b6e-2d4e5f282748	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55dd-c0ce-4793-811e0689fd7e	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55dd-c0ce-1ccc-cdd8bc55a5a4	VrstaStroska-read	VrstaStroska - branje	f
00030000-55dd-c0ce-dced-e8cab80c66d8	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55dd-c0ce-20e3-ef5150300fc9	Zaposlitev-read	Zaposlitev - branje	f
00030000-55dd-c0ce-faf2-69e7287ffdd3	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55dd-c0ce-8d38-330de6718a63	Zasedenost-read	Zasedenost - branje	f
00030000-55dd-c0ce-210c-435a89d7ab19	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55dd-c0ce-b05c-f4c7e40ee347	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55dd-c0ce-cd7f-9c62f3b96294	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55dd-c0ce-d2c9-820e044359eb	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55dd-c0ce-737f-54ca66fb852d	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55dd-c0ce-8b55-b9f5bf1ecb66	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55dd-c0ce-a0a5-344d2ff60423	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55dd-c0ce-77ce-e9dc4211cc9a	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55dd-c0ce-f7a0-67b4f613a498	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55dd-c0ce-7884-321e8875cc34	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55dd-c0ce-c012-4ef2d62ef542	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55dd-c0ce-4c3f-7c9ac9b1adbf	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55dd-c0ce-b4b8-42921cd4bf26	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55dd-c0ce-d71c-6bd1ef4ed663	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55dd-c0ce-a50e-dd8d624c2acc	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55dd-c0ce-dfc1-9c240c559172	Datoteka-write	Datoteka - spreminjanje	f
00030000-55dd-c0ce-2a86-d0e69c8437a0	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2908 (class 0 OID 15708680)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55dd-c0ce-5d97-4b0cddd32e5e	00030000-55dd-c0ce-3673-bde14f7017f0
00020000-55dd-c0ce-b492-daa0b6f487fa	00030000-55dd-c0ce-cc51-ca22c0319b3a
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-12a0-f5f51f9363cd
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-c1f3-3d92a0271712
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-819e-1d14de527b17
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-6e19-98a9a72053c0
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-cb76-9af3020fb409
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-0109-821bcea030c2
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-dac2-9d85eac6cfc1
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-a315-b3d0d6aa4530
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-cc51-ca22c0319b3a
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-2db6-d123fe65a00c
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-f983-34758fb263cf
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-017d-70f9dfe3ad6d
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-048c-e607c9db7c9d
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-6103-7a80daee6f6c
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-d202-2926dfa1ecdf
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-84e6-e4b594cc6095
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-f08f-b450c4d181ea
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-0711-da81090bb903
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-074b-24b760131f48
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-e10f-0e3894e7aaed
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-a21c-a0f46e0f0778
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-6f97-c19493c23ce5
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-2f22-36f001552c00
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-7458-d01e558c2b99
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-a794-c44545b066b3
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-a368-94318d95cb6c
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-be59-7d4b40c84646
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-6a44-a766e978be3d
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-8c88-079c9ae1c25d
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-c7c3-b2330c6a877a
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-a651-b429caa44782
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-684b-3a39d4082e52
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-d847-03c0535f4d08
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-980a-b3d842396807
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-5f04-e9a51174db45
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-c135-1180f68f0da6
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-1671-ef2451afdd6b
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-e50d-c07779fa3b1e
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-5031-9237499043d3
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-f168-e8edeaf9f043
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-6550-b12d59915cfa
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-3dce-765eacc93e6b
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-6e53-98e57bd09ed9
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-983f-1d54aaeef102
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-57f0-1bc6977b0b01
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-8d38-330de6718a63
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-210c-435a89d7ab19
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-b05c-f4c7e40ee347
00020000-55dd-c0ce-5661-4e3a1db73e8c	00030000-55dd-c0ce-d2c9-820e044359eb
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-12a0-f5f51f9363cd
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-cb76-9af3020fb409
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-0109-821bcea030c2
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-cc51-ca22c0319b3a
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-048c-e607c9db7c9d
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-d202-2926dfa1ecdf
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-f08f-b450c4d181ea
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-0711-da81090bb903
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-074b-24b760131f48
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-e10f-0e3894e7aaed
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-a21c-a0f46e0f0778
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-6f97-c19493c23ce5
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-2f22-36f001552c00
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-a794-c44545b066b3
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-be59-7d4b40c84646
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-6a44-a766e978be3d
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-8c88-079c9ae1c25d
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-d847-03c0535f4d08
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-5f04-e9a51174db45
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-1671-ef2451afdd6b
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-5031-9237499043d3
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-cc15-edd6eb0c79e0
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-3a17-e972597a286c
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-d339-9c6cf30d404e
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-4a7a-537820af4063
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-20e3-ef5150300fc9
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-faf2-69e7287ffdd3
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-b05c-f4c7e40ee347
00020000-55dd-c0ce-4e90-6d1b0caee08a	00030000-55dd-c0ce-d2c9-820e044359eb
00020000-55dd-c0ce-2956-7f1253defaf1	00030000-55dd-c0ce-12a0-f5f51f9363cd
00020000-55dd-c0ce-2956-7f1253defaf1	00030000-55dd-c0ce-819e-1d14de527b17
00020000-55dd-c0ce-2956-7f1253defaf1	00030000-55dd-c0ce-cb76-9af3020fb409
00020000-55dd-c0ce-2956-7f1253defaf1	00030000-55dd-c0ce-f855-f96fa80d2dc6
00020000-55dd-c0ce-2956-7f1253defaf1	00030000-55dd-c0ce-dc83-5489145c81e2
00020000-55dd-c0ce-2956-7f1253defaf1	00030000-55dd-c0ce-609c-e7c7d9019a1c
00020000-55dd-c0ce-2956-7f1253defaf1	00030000-55dd-c0ce-0109-821bcea030c2
00020000-55dd-c0ce-2956-7f1253defaf1	00030000-55dd-c0ce-cc51-ca22c0319b3a
00020000-55dd-c0ce-2956-7f1253defaf1	00030000-55dd-c0ce-f983-34758fb263cf
00020000-55dd-c0ce-2956-7f1253defaf1	00030000-55dd-c0ce-048c-e607c9db7c9d
00020000-55dd-c0ce-2956-7f1253defaf1	00030000-55dd-c0ce-d202-2926dfa1ecdf
00020000-55dd-c0ce-2956-7f1253defaf1	00030000-55dd-c0ce-f08f-b450c4d181ea
00020000-55dd-c0ce-2956-7f1253defaf1	00030000-55dd-c0ce-074b-24b760131f48
00020000-55dd-c0ce-2956-7f1253defaf1	00030000-55dd-c0ce-e10f-0e3894e7aaed
00020000-55dd-c0ce-2956-7f1253defaf1	00030000-55dd-c0ce-a21c-a0f46e0f0778
00020000-55dd-c0ce-2956-7f1253defaf1	00030000-55dd-c0ce-2f22-36f001552c00
00020000-55dd-c0ce-2956-7f1253defaf1	00030000-55dd-c0ce-a794-c44545b066b3
00020000-55dd-c0ce-2956-7f1253defaf1	00030000-55dd-c0ce-8c88-079c9ae1c25d
00020000-55dd-c0ce-2956-7f1253defaf1	00030000-55dd-c0ce-a651-b429caa44782
00020000-55dd-c0ce-2956-7f1253defaf1	00030000-55dd-c0ce-d847-03c0535f4d08
00020000-55dd-c0ce-2956-7f1253defaf1	00030000-55dd-c0ce-5f04-e9a51174db45
00020000-55dd-c0ce-2956-7f1253defaf1	00030000-55dd-c0ce-1671-ef2451afdd6b
00020000-55dd-c0ce-2956-7f1253defaf1	00030000-55dd-c0ce-5031-9237499043d3
00020000-55dd-c0ce-2956-7f1253defaf1	00030000-55dd-c0ce-6550-b12d59915cfa
00020000-55dd-c0ce-2956-7f1253defaf1	00030000-55dd-c0ce-983f-1d54aaeef102
00020000-55dd-c0ce-2956-7f1253defaf1	00030000-55dd-c0ce-8d38-330de6718a63
00020000-55dd-c0ce-2956-7f1253defaf1	00030000-55dd-c0ce-b05c-f4c7e40ee347
00020000-55dd-c0ce-2956-7f1253defaf1	00030000-55dd-c0ce-d2c9-820e044359eb
00020000-55dd-c0ce-3214-059a957a0036	00030000-55dd-c0ce-12a0-f5f51f9363cd
00020000-55dd-c0ce-3214-059a957a0036	00030000-55dd-c0ce-c1f3-3d92a0271712
00020000-55dd-c0ce-3214-059a957a0036	00030000-55dd-c0ce-6e19-98a9a72053c0
00020000-55dd-c0ce-3214-059a957a0036	00030000-55dd-c0ce-cb76-9af3020fb409
00020000-55dd-c0ce-3214-059a957a0036	00030000-55dd-c0ce-0109-821bcea030c2
00020000-55dd-c0ce-3214-059a957a0036	00030000-55dd-c0ce-cc51-ca22c0319b3a
00020000-55dd-c0ce-3214-059a957a0036	00030000-55dd-c0ce-048c-e607c9db7c9d
00020000-55dd-c0ce-3214-059a957a0036	00030000-55dd-c0ce-d202-2926dfa1ecdf
00020000-55dd-c0ce-3214-059a957a0036	00030000-55dd-c0ce-074b-24b760131f48
00020000-55dd-c0ce-3214-059a957a0036	00030000-55dd-c0ce-e10f-0e3894e7aaed
00020000-55dd-c0ce-3214-059a957a0036	00030000-55dd-c0ce-2f22-36f001552c00
00020000-55dd-c0ce-3214-059a957a0036	00030000-55dd-c0ce-a794-c44545b066b3
00020000-55dd-c0ce-3214-059a957a0036	00030000-55dd-c0ce-8c88-079c9ae1c25d
00020000-55dd-c0ce-3214-059a957a0036	00030000-55dd-c0ce-d847-03c0535f4d08
00020000-55dd-c0ce-3214-059a957a0036	00030000-55dd-c0ce-5f04-e9a51174db45
00020000-55dd-c0ce-3214-059a957a0036	00030000-55dd-c0ce-1671-ef2451afdd6b
00020000-55dd-c0ce-3214-059a957a0036	00030000-55dd-c0ce-5031-9237499043d3
00020000-55dd-c0ce-3214-059a957a0036	00030000-55dd-c0ce-6550-b12d59915cfa
00020000-55dd-c0ce-3214-059a957a0036	00030000-55dd-c0ce-b05c-f4c7e40ee347
00020000-55dd-c0ce-3214-059a957a0036	00030000-55dd-c0ce-d2c9-820e044359eb
00020000-55dd-c0ce-3d71-7b662ba70d9c	00030000-55dd-c0ce-12a0-f5f51f9363cd
00020000-55dd-c0ce-3d71-7b662ba70d9c	00030000-55dd-c0ce-cb76-9af3020fb409
00020000-55dd-c0ce-3d71-7b662ba70d9c	00030000-55dd-c0ce-0109-821bcea030c2
00020000-55dd-c0ce-3d71-7b662ba70d9c	00030000-55dd-c0ce-cc51-ca22c0319b3a
00020000-55dd-c0ce-3d71-7b662ba70d9c	00030000-55dd-c0ce-048c-e607c9db7c9d
00020000-55dd-c0ce-3d71-7b662ba70d9c	00030000-55dd-c0ce-d202-2926dfa1ecdf
00020000-55dd-c0ce-3d71-7b662ba70d9c	00030000-55dd-c0ce-074b-24b760131f48
00020000-55dd-c0ce-3d71-7b662ba70d9c	00030000-55dd-c0ce-e10f-0e3894e7aaed
00020000-55dd-c0ce-3d71-7b662ba70d9c	00030000-55dd-c0ce-2f22-36f001552c00
00020000-55dd-c0ce-3d71-7b662ba70d9c	00030000-55dd-c0ce-a794-c44545b066b3
00020000-55dd-c0ce-3d71-7b662ba70d9c	00030000-55dd-c0ce-8c88-079c9ae1c25d
00020000-55dd-c0ce-3d71-7b662ba70d9c	00030000-55dd-c0ce-d847-03c0535f4d08
00020000-55dd-c0ce-3d71-7b662ba70d9c	00030000-55dd-c0ce-5f04-e9a51174db45
00020000-55dd-c0ce-3d71-7b662ba70d9c	00030000-55dd-c0ce-1671-ef2451afdd6b
00020000-55dd-c0ce-3d71-7b662ba70d9c	00030000-55dd-c0ce-5031-9237499043d3
00020000-55dd-c0ce-3d71-7b662ba70d9c	00030000-55dd-c0ce-796a-73238c887651
00020000-55dd-c0ce-3d71-7b662ba70d9c	00030000-55dd-c0ce-58d9-61aeab8a9cbd
00020000-55dd-c0ce-3d71-7b662ba70d9c	00030000-55dd-c0ce-6550-b12d59915cfa
00020000-55dd-c0ce-3d71-7b662ba70d9c	00030000-55dd-c0ce-b05c-f4c7e40ee347
00020000-55dd-c0ce-3d71-7b662ba70d9c	00030000-55dd-c0ce-d2c9-820e044359eb
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-0add-ae1768c912f3
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-3673-bde14f7017f0
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-58d9-61aeab8a9cbd
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-dac2-9d85eac6cfc1
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-ee1f-e37b258097c3
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-2f08-257c370ad0fa
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-12a0-f5f51f9363cd
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-c1f3-3d92a0271712
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-819e-1d14de527b17
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-6e19-98a9a72053c0
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-cb76-9af3020fb409
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-f855-f96fa80d2dc6
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-dc83-5489145c81e2
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-cb69-988ac61440db
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-609c-e7c7d9019a1c
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-c9da-35682bb94d13
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-0109-821bcea030c2
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-a315-b3d0d6aa4530
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-cc51-ca22c0319b3a
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-2db6-d123fe65a00c
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-32bb-c9f409a2ca94
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-fa1e-7acfecd3e50a
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-bd79-5d6f3581a0fb
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-9ab0-a03af9743626
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-f983-34758fb263cf
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-017d-70f9dfe3ad6d
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-048c-e607c9db7c9d
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-6103-7a80daee6f6c
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-d202-2926dfa1ecdf
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-84e6-e4b594cc6095
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-f08f-b450c4d181ea
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-0711-da81090bb903
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-96dd-4c80fef5804c
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-2096-41b41b8ae22b
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-1a2b-b7c38b7fd621
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-c53c-5009e204ff3e
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-074b-24b760131f48
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-a79a-6f5e57da921b
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-e10f-0e3894e7aaed
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-21ef-f89ebf76003a
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-a21c-a0f46e0f0778
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-6f97-c19493c23ce5
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-bef9-aded1a580aae
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-3871-2f96863b957d
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-53dc-9bd16da617e6
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-9c7b-6365288fba9d
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-83e1-2ed0fdcffe14
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-5ac3-e230a7963aba
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-2f22-36f001552c00
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-7458-d01e558c2b99
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-a794-c44545b066b3
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-a368-94318d95cb6c
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-1511-ea1c1e92d71d
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-9437-127bf5d6f5d9
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-be59-7d4b40c84646
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-6a44-a766e978be3d
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-8c88-079c9ae1c25d
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-c7c3-b2330c6a877a
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-714f-30a892cedbdc
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-885c-b842d96d5c76
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-d50f-1de20e84d295
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-66e6-55e8faeb1ab2
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-a651-b429caa44782
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-684b-3a39d4082e52
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-4ea2-2564081cec34
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-ee87-72a54232503e
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-3d57-8d83ba5050ed
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-9351-fc329721ec19
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-6f14-3a09986cd227
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-e4ea-9a6eca8f2d2e
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-7f05-d16faa4de595
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-4d14-4144b9cff202
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-b2ae-a45f674acc1c
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-0f2b-65b002ad6590
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-ab96-340091c5eaad
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-4bbf-646a570b0741
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-cb6b-62ddab958dc7
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-ab52-fe7da4c3d414
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-ac94-59c14df4f348
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-dec0-a54fc11a1def
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-87c9-925adbc4bc4c
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-318b-4a3a834c9d6e
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-467f-b256e6367367
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-1f79-ecc1da92b6ca
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-d847-03c0535f4d08
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-980a-b3d842396807
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-f77a-bb71afca66ce
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-1bda-8c83c0d66815
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-8cb4-15c7e6c7bf45
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-6353-f6accff29d49
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-5f04-e9a51174db45
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-c135-1180f68f0da6
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-1671-ef2451afdd6b
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-e50d-c07779fa3b1e
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-b94b-515ad08477ca
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-a842-3a7b6f94832d
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-3a99-30676c855397
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-5911-4e2feed5665b
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-2111-268ed9eddb3f
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-7cec-559971a3ab52
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-8a94-7d9a4a25a900
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-f004-47ef81338eca
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-5031-9237499043d3
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-f168-e8edeaf9f043
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-4c11-53d7d0a412ec
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-246f-edbe903dfc89
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-e2ae-4e2b4bbfc1bf
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-03f4-0c26075d90c2
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-9fac-0bc3e3d458c3
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-be4d-e56156be4fa9
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-dac2-2dc51030fb88
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-0204-08fdbe915a14
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-cc15-edd6eb0c79e0
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-3a17-e972597a286c
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-796a-73238c887651
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-e41f-3adf00f6dae1
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-6550-b12d59915cfa
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-a7db-330cdd694bf2
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-9188-2b5ea2ba7a39
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-e3d2-6faa98d6c4e7
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-d339-9c6cf30d404e
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-4a7a-537820af4063
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-3dce-765eacc93e6b
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-6e53-98e57bd09ed9
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-983f-1d54aaeef102
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-57f0-1bc6977b0b01
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-5b6e-2d4e5f282748
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-4793-811e0689fd7e
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-20e3-ef5150300fc9
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-faf2-69e7287ffdd3
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-8d38-330de6718a63
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-210c-435a89d7ab19
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-b05c-f4c7e40ee347
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-cd7f-9c62f3b96294
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-d2c9-820e044359eb
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	00030000-55dd-c0ce-737f-54ca66fb852d
\.


--
-- TOC entry 2936 (class 0 OID 15708978)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 15709011)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 15709135)
-- Dependencies: 219
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55dd-c0cf-64fc-a26f269961cd	00090000-55dd-c0cf-a6ac-70d820a69872	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55dd-c0cf-ef4a-19e37be9841e	00090000-55dd-c0cf-3d69-0c112aa1f233	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55dd-c0cf-d518-4a7397cd9842	00090000-55dd-c0cf-c700-c079c6a3bdc8	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2913 (class 0 OID 15708740)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55dd-c0cf-1230-f608884bbf0c	00040000-55dd-c0ce-8e1f-5a00effcefe5	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-c0cf-7e73-a0c2452c06b2	00040000-55dd-c0ce-8e1f-5a00effcefe5	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55dd-c0cf-fbc5-7fd3211c36ce	00040000-55dd-c0ce-8e1f-5a00effcefe5	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-c0cf-d269-42dfb8f65b55	00040000-55dd-c0ce-8e1f-5a00effcefe5	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-c0cf-488e-fe0c1e221a02	00040000-55dd-c0ce-8e1f-5a00effcefe5	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-c0cf-56fd-bd53af5ca3de	00040000-55dd-c0ce-16af-c4264be11bba	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-c0cf-7896-770149e165db	00040000-55dd-c0ce-0d9c-419167983989	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-c0cf-1775-c2353e16a633	00040000-55dd-c0ce-1040-97beb198a28d	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-c0d0-b410-d90c5c66e2a4	00040000-55dd-c0ce-8e1f-5a00effcefe5	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2915 (class 0 OID 15708774)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55dd-c0cd-e780-3cbed6326bac	8341	Adlešiči
00050000-55dd-c0cd-2949-08f182cef58c	5270	Ajdovščina
00050000-55dd-c0cd-37ab-6637d6069b66	6280	Ankaran/Ancarano
00050000-55dd-c0cd-ba0c-fff428d78107	9253	Apače
00050000-55dd-c0cd-bd70-0e20924824c4	8253	Artiče
00050000-55dd-c0cd-38ab-5246489ac72a	4275	Begunje na Gorenjskem
00050000-55dd-c0cd-1858-9e3730e7dd1c	1382	Begunje pri Cerknici
00050000-55dd-c0cd-a8da-83dcc7835e3d	9231	Beltinci
00050000-55dd-c0cd-1791-c6615547f93c	2234	Benedikt
00050000-55dd-c0cd-21cf-b1d88a1cedbd	2345	Bistrica ob Dravi
00050000-55dd-c0cd-9dfa-ac284f98e004	3256	Bistrica ob Sotli
00050000-55dd-c0cd-cadf-dca6e3ccf849	8259	Bizeljsko
00050000-55dd-c0cd-9e4a-1c423a453cca	1223	Blagovica
00050000-55dd-c0cd-093d-1487426850f6	8283	Blanca
00050000-55dd-c0cd-a6cf-91ec9a40b600	4260	Bled
00050000-55dd-c0cd-2e13-e05c7249a0d8	4273	Blejska Dobrava
00050000-55dd-c0cd-1c01-c61803c5a5e3	9265	Bodonci
00050000-55dd-c0cd-0208-7c7ee0a2a850	9222	Bogojina
00050000-55dd-c0cd-68d6-5f2d40ccfc3a	4263	Bohinjska Bela
00050000-55dd-c0cd-32fc-2e423f63e8fb	4264	Bohinjska Bistrica
00050000-55dd-c0cd-7d16-a024d7c3ba2a	4265	Bohinjsko jezero
00050000-55dd-c0cd-6de4-c89eb77602fa	1353	Borovnica
00050000-55dd-c0cd-acaa-886f29f085ed	8294	Boštanj
00050000-55dd-c0cd-d115-f27a80643cd4	5230	Bovec
00050000-55dd-c0cd-aa14-ab030bfd62d5	5295	Branik
00050000-55dd-c0cd-6e92-bb4ca65f1694	3314	Braslovče
00050000-55dd-c0cd-42f6-a0e0e10f3d52	5223	Breginj
00050000-55dd-c0cd-6c13-3945f5c2dcd4	8280	Brestanica
00050000-55dd-c0cd-907c-cc80d262af53	2354	Bresternica
00050000-55dd-c0cd-ada8-5b686590072c	4243	Brezje
00050000-55dd-c0cd-3f97-f0ea53104b89	1351	Brezovica pri Ljubljani
00050000-55dd-c0cd-0e42-a1c20375bef8	8250	Brežice
00050000-55dd-c0cd-3a07-878532bebe6a	4210	Brnik - Aerodrom
00050000-55dd-c0cd-384d-1680fd927110	8321	Brusnice
00050000-55dd-c0cd-4b48-157d6932cbf1	3255	Buče
00050000-55dd-c0cd-1167-1445fba6280a	8276	Bučka 
00050000-55dd-c0cd-701f-58f556596799	9261	Cankova
00050000-55dd-c0cd-613f-43b36608350b	3000	Celje 
00050000-55dd-c0cd-6815-fe65dbd4ad5b	3001	Celje - poštni predali
00050000-55dd-c0cd-8819-2f12b4c9553f	4207	Cerklje na Gorenjskem
00050000-55dd-c0cd-8c46-a44ffa18d3af	8263	Cerklje ob Krki
00050000-55dd-c0cd-4f27-4f2ae5dec03d	1380	Cerknica
00050000-55dd-c0cd-ca53-6d80c6811424	5282	Cerkno
00050000-55dd-c0cd-8b9f-a193089c01ba	2236	Cerkvenjak
00050000-55dd-c0cd-5ef5-f18e4edc444a	2215	Ceršak
00050000-55dd-c0cd-27e6-2807cbeb6047	2326	Cirkovce
00050000-55dd-c0cd-8e31-c64c3199f473	2282	Cirkulane
00050000-55dd-c0cd-c12f-dabd3d6aedad	5273	Col
00050000-55dd-c0cd-b5e0-28709c477e96	8251	Čatež ob Savi
00050000-55dd-c0cd-f652-6e165a01d4c8	1413	Čemšenik
00050000-55dd-c0cd-f3a0-ae20885e6ff9	5253	Čepovan
00050000-55dd-c0cd-cc0e-fc9c8df8d1e4	9232	Črenšovci
00050000-55dd-c0cd-9327-e02d1bb79667	2393	Črna na Koroškem
00050000-55dd-c0cd-ce72-d223fc8be5aa	6275	Črni Kal
00050000-55dd-c0cd-ef8f-7637ab77ce6c	5274	Črni Vrh nad Idrijo
00050000-55dd-c0cd-652b-17aff32bd2a7	5262	Črniče
00050000-55dd-c0cd-53f1-83d0a95f9590	8340	Črnomelj
00050000-55dd-c0cd-4add-1212ac0f6040	6271	Dekani
00050000-55dd-c0cd-97cf-913df8b5b8a5	5210	Deskle
00050000-55dd-c0cd-435e-ae067b448ed1	2253	Destrnik
00050000-55dd-c0cd-32f7-1f996c53c5f7	6215	Divača
00050000-55dd-c0cd-f5ad-2c49e13bb878	1233	Dob
00050000-55dd-c0cd-9aa3-1557b3e4b282	3224	Dobje pri Planini
00050000-55dd-c0cd-7d8b-5c5eeee2f8c2	8257	Dobova
00050000-55dd-c0cd-1ce4-c68afda279f1	1423	Dobovec
00050000-55dd-c0cd-f3d7-95d5957d0745	5263	Dobravlje
00050000-55dd-c0cd-c972-de0cf0ff4572	3204	Dobrna
00050000-55dd-c0cd-1099-098fcd64065f	8211	Dobrnič
00050000-55dd-c0cd-b493-b06758b39f43	1356	Dobrova
00050000-55dd-c0cd-501a-fb8eed2d3423	9223	Dobrovnik/Dobronak 
00050000-55dd-c0cd-354d-fb01e89bfc16	5212	Dobrovo v Brdih
00050000-55dd-c0cd-ee10-9587619d2000	1431	Dol pri Hrastniku
00050000-55dd-c0cd-556f-cfa6e55a9620	1262	Dol pri Ljubljani
00050000-55dd-c0cd-c4a9-500ce0932dff	1273	Dole pri Litiji
00050000-55dd-c0cd-1ca2-202329c417b5	1331	Dolenja vas
00050000-55dd-c0cd-f877-1354c4943f31	8350	Dolenjske Toplice
00050000-55dd-c0cd-ab2c-0ec4287cdc5b	1230	Domžale
00050000-55dd-c0cd-d9d6-fd5ad65d7454	2252	Dornava
00050000-55dd-c0cd-f7ac-73c3b2fc7fa0	5294	Dornberk
00050000-55dd-c0cd-d5f9-ce8d05441178	1319	Draga
00050000-55dd-c0cd-dd16-a94c107569e9	8343	Dragatuš
00050000-55dd-c0cd-cc2c-c2e8976c81d9	3222	Dramlje
00050000-55dd-c0cd-f979-ba1910f0ee8e	2370	Dravograd
00050000-55dd-c0cd-f274-627bcfa68149	4203	Duplje
00050000-55dd-c0cd-5b86-82079844d042	6221	Dutovlje
00050000-55dd-c0cd-cff7-5c8047d30504	8361	Dvor
00050000-55dd-c0cd-7241-83a03b648f61	2343	Fala
00050000-55dd-c0cd-2981-abcf97557574	9208	Fokovci
00050000-55dd-c0cd-6bf5-64498a23c0b0	2313	Fram
00050000-55dd-c0cd-5a77-437b90f2dd0f	3213	Frankolovo
00050000-55dd-c0cd-3dc1-9d8289270dd6	1274	Gabrovka
00050000-55dd-c0cd-18fe-a97a9205d968	8254	Globoko
00050000-55dd-c0cd-6cc0-61d3255af772	5275	Godovič
00050000-55dd-c0cd-4722-8a182c3884ce	4204	Golnik
00050000-55dd-c0cd-9ac0-ba8edb3180ad	3303	Gomilsko
00050000-55dd-c0cd-8a88-963055346245	4224	Gorenja vas
00050000-55dd-c0cd-433a-ef192df8827b	3263	Gorica pri Slivnici
00050000-55dd-c0cd-2101-ea4a04311885	2272	Gorišnica
00050000-55dd-c0cd-0af4-5fbaeaa96a11	9250	Gornja Radgona
00050000-55dd-c0cd-9018-7325d9f86d3f	3342	Gornji Grad
00050000-55dd-c0cd-95e2-58cabe4b199f	4282	Gozd Martuljek
00050000-55dd-c0cd-1a59-08be418b967b	6272	Gračišče
00050000-55dd-c0cd-309e-d930025b42ed	9264	Grad
00050000-55dd-c0cd-458d-70f471ca90f1	8332	Gradac
00050000-55dd-c0cd-ebe8-39a126440007	1384	Grahovo
00050000-55dd-c0cd-c29f-0277e63dd911	5242	Grahovo ob Bači
00050000-55dd-c0cd-8048-686b005116ac	5251	Grgar
00050000-55dd-c0cd-0ed5-65c80b25c51f	3302	Griže
00050000-55dd-c0cd-138d-cacd482bad7b	3231	Grobelno
00050000-55dd-c0cd-f24a-6da6b0f73e90	1290	Grosuplje
00050000-55dd-c0cd-1e50-b1c2d42e9448	2288	Hajdina
00050000-55dd-c0cd-230f-a3ccd413a151	8362	Hinje
00050000-55dd-c0cd-3795-e45dffede1e0	2311	Hoče
00050000-55dd-c0cd-82f9-4cac4b2ccb18	9205	Hodoš/Hodos
00050000-55dd-c0cd-729f-e5dc73a986c6	1354	Horjul
00050000-55dd-c0cd-eeb8-e5a5b8cc9e99	1372	Hotedršica
00050000-55dd-c0cd-d5b9-bfaf8cc75df8	1430	Hrastnik
00050000-55dd-c0cd-9679-2440edab7fe9	6225	Hruševje
00050000-55dd-c0cd-ff7b-9c5d9533d225	4276	Hrušica
00050000-55dd-c0cd-11bb-8edb5c250f16	5280	Idrija
00050000-55dd-c0cd-de07-e570e890eff6	1292	Ig
00050000-55dd-c0cd-2f31-48207ede33cb	6250	Ilirska Bistrica
00050000-55dd-c0cd-cf4a-3c78dd5780e9	6251	Ilirska Bistrica-Trnovo
00050000-55dd-c0cd-cf63-b184f323474a	1295	Ivančna Gorica
00050000-55dd-c0cd-dd0f-b6e9b22386c7	2259	Ivanjkovci
00050000-55dd-c0cd-303e-9f63cba9dc7a	1411	Izlake
00050000-55dd-c0cd-d61b-804e37f1d09f	6310	Izola/Isola
00050000-55dd-c0cd-bf31-8fd124eb4155	2222	Jakobski Dol
00050000-55dd-c0cd-9b49-1230fcb06f76	2221	Jarenina
00050000-55dd-c0cd-f55d-36ab3ff4511b	6254	Jelšane
00050000-55dd-c0cd-afb8-ec69c5ca920f	4270	Jesenice
00050000-55dd-c0cd-a486-8d73f7eb03b6	8261	Jesenice na Dolenjskem
00050000-55dd-c0cd-67e6-859949f6ea78	3273	Jurklošter
00050000-55dd-c0cd-9812-7ad95e627de4	2223	Jurovski Dol
00050000-55dd-c0cd-ce06-4ed05df84fbf	2256	Juršinci
00050000-55dd-c0cd-e51d-7436d4b49442	5214	Kal nad Kanalom
00050000-55dd-c0cd-d1bf-073a0725751d	3233	Kalobje
00050000-55dd-c0cd-d623-edc723889027	4246	Kamna Gorica
00050000-55dd-c0cd-6c0b-d1fc680f7984	2351	Kamnica
00050000-55dd-c0cd-a4e2-6344b841c788	1241	Kamnik
00050000-55dd-c0cd-30c9-9e1aaad59ef4	5213	Kanal
00050000-55dd-c0cd-97ec-8808afe3aff2	8258	Kapele
00050000-55dd-c0cd-002a-5435ae5bea83	2362	Kapla
00050000-55dd-c0cd-0016-3484237751c8	2325	Kidričevo
00050000-55dd-c0cd-0a5f-d74775db2945	1412	Kisovec
00050000-55dd-c0cd-2e74-b9208a36f84b	6253	Knežak
00050000-55dd-c0cd-d0f7-ce90d3bd4b4b	5222	Kobarid
00050000-55dd-c0cd-2b88-1d15b30646fa	9227	Kobilje
00050000-55dd-c0cd-0e33-d81f37bd1a48	1330	Kočevje
00050000-55dd-c0cd-3adc-8cb9b738a876	1338	Kočevska Reka
00050000-55dd-c0cd-fc6d-6bc28fd67277	2276	Kog
00050000-55dd-c0cd-0263-9168133dbef9	5211	Kojsko
00050000-55dd-c0cd-6c79-0f714dc87ae4	6223	Komen
00050000-55dd-c0cd-e08d-09f6fd0378c2	1218	Komenda
00050000-55dd-c0cd-4679-dbbe50a67c3a	6000	Koper/Capodistria 
00050000-55dd-c0cd-0c24-184600c583cb	6001	Koper/Capodistria - poštni predali
00050000-55dd-c0cd-6cdd-e980e643c6f0	8282	Koprivnica
00050000-55dd-c0cd-e050-1eb247f90a24	5296	Kostanjevica na Krasu
00050000-55dd-c0cd-0cd4-f0be9f72bcd6	8311	Kostanjevica na Krki
00050000-55dd-c0cd-1f49-e1f7ae10c52a	1336	Kostel
00050000-55dd-c0cd-3212-032bcd065794	6256	Košana
00050000-55dd-c0cd-803a-5f8fe0b34e79	2394	Kotlje
00050000-55dd-c0cd-bacb-8177352a06d8	6240	Kozina
00050000-55dd-c0cd-031b-49c8d02aba94	3260	Kozje
00050000-55dd-c0cd-719d-14b1386037ce	4000	Kranj 
00050000-55dd-c0cd-3437-0c14aa1069c7	4001	Kranj - poštni predali
00050000-55dd-c0cd-21a4-577bb70520b2	4280	Kranjska Gora
00050000-55dd-c0cd-4804-ee305c402ed1	1281	Kresnice
00050000-55dd-c0cd-c209-35d40f7ea44f	4294	Križe
00050000-55dd-c0cd-cf76-1355f55ce42d	9206	Križevci
00050000-55dd-c0cd-e3bb-1723ea0136cd	9242	Križevci pri Ljutomeru
00050000-55dd-c0cd-9835-35dd14503d10	1301	Krka
00050000-55dd-c0cd-85c3-9ac44ee01b65	8296	Krmelj
00050000-55dd-c0cd-6c15-10a6258178e3	4245	Kropa
00050000-55dd-c0cd-74a9-0d5927a91757	8262	Krška vas
00050000-55dd-c0cd-524f-147a733e6318	8270	Krško
00050000-55dd-c0cd-1534-ca1c81e00028	9263	Kuzma
00050000-55dd-c0cd-d38c-5bb5407f3bd9	2318	Laporje
00050000-55dd-c0cd-184b-6ade20b7a100	3270	Laško
00050000-55dd-c0cd-0d96-9e6c66b696c8	1219	Laze v Tuhinju
00050000-55dd-c0cd-ade4-fa92effbfb4b	2230	Lenart v Slovenskih goricah
00050000-55dd-c0cd-65c0-7a8aec500443	9220	Lendava/Lendva
00050000-55dd-c0cd-7ff7-a25da6df0421	4248	Lesce
00050000-55dd-c0cd-216f-42b9dbcc4a8c	3261	Lesično
00050000-55dd-c0cd-0489-f9488c9bb697	8273	Leskovec pri Krškem
00050000-55dd-c0cd-f072-7e8dd2b40532	2372	Libeliče
00050000-55dd-c0cd-4c5d-d8a805d534ca	2341	Limbuš
00050000-55dd-c0cd-daab-c32ec4e0de39	1270	Litija
00050000-55dd-c0cd-e96f-95751a77aca9	3202	Ljubečna
00050000-55dd-c0cd-2421-1f62171f592a	1000	Ljubljana 
00050000-55dd-c0cd-052f-33b7830108a0	1001	Ljubljana - poštni predali
00050000-55dd-c0cd-cd08-a90121ae3b9f	1231	Ljubljana - Črnuče
00050000-55dd-c0cd-600e-b9693c96a5ca	1261	Ljubljana - Dobrunje
00050000-55dd-c0cd-48c0-91552e753076	1260	Ljubljana - Polje
00050000-55dd-c0cd-a6af-ed6a2944aab8	1210	Ljubljana - Šentvid
00050000-55dd-c0cd-1c6a-94d195c505ad	1211	Ljubljana - Šmartno
00050000-55dd-c0cd-b144-05fc96a0ea47	3333	Ljubno ob Savinji
00050000-55dd-c0cd-22df-7763b4fdbb4d	9240	Ljutomer
00050000-55dd-c0cd-7937-96274a59bc7e	3215	Loče
00050000-55dd-c0cd-af63-857f017989e4	5231	Log pod Mangartom
00050000-55dd-c0cd-8f12-2aa5d03c3758	1358	Log pri Brezovici
00050000-55dd-c0cd-beef-ceb0a24408c1	1370	Logatec
00050000-55dd-c0cd-5eea-935756d20a78	1371	Logatec
00050000-55dd-c0cd-684d-b427ebe1a4c2	1434	Loka pri Zidanem Mostu
00050000-55dd-c0cd-5b87-46180c426242	3223	Loka pri Žusmu
00050000-55dd-c0cd-4908-0dce8443aed7	6219	Lokev
00050000-55dd-c0cd-0440-820b938c4287	1318	Loški Potok
00050000-55dd-c0cd-5ce9-93d470dea685	2324	Lovrenc na Dravskem polju
00050000-55dd-c0cd-ca80-574cbe86c23f	2344	Lovrenc na Pohorju
00050000-55dd-c0cd-7ea6-79c51662b72a	3334	Luče
00050000-55dd-c0cd-53af-cfffb4925561	1225	Lukovica
00050000-55dd-c0cd-7517-f1c57e6a90c0	9202	Mačkovci
00050000-55dd-c0cd-5d1b-6f631a44e927	2322	Majšperk
00050000-55dd-c0cd-1181-447c1865798f	2321	Makole
00050000-55dd-c0cd-0a84-ed42b7942d0a	9243	Mala Nedelja
00050000-55dd-c0cd-a74e-7522526d9f77	2229	Malečnik
00050000-55dd-c0cd-1966-6e3a00d4e3ad	6273	Marezige
00050000-55dd-c0cd-7b28-f309e13e83b2	2000	Maribor 
00050000-55dd-c0cd-878e-a31bcd45366c	2001	Maribor - poštni predali
00050000-55dd-c0cd-c361-d89f102fa5ee	2206	Marjeta na Dravskem polju
00050000-55dd-c0cd-eddd-b944c9c1b6ab	2281	Markovci
00050000-55dd-c0cd-e6d9-42bf121ccd92	9221	Martjanci
00050000-55dd-c0cd-b523-17d0055663d0	6242	Materija
00050000-55dd-c0cd-e7ee-6d0c8250eb4e	4211	Mavčiče
00050000-55dd-c0cd-e33e-45a98e2cf292	1215	Medvode
00050000-55dd-c0cd-1cd2-a354903c8e76	1234	Mengeš
00050000-55dd-c0cd-9ae4-55394ec0a338	8330	Metlika
00050000-55dd-c0cd-64e6-a90dd45ac624	2392	Mežica
00050000-55dd-c0cd-2d96-29c903181aa9	2204	Miklavž na Dravskem polju
00050000-55dd-c0cd-ea0a-1a3977c89e9f	2275	Miklavž pri Ormožu
00050000-55dd-c0cd-eab0-82f3e96f47e5	5291	Miren
00050000-55dd-c0cd-440c-ab022029bae9	8233	Mirna
00050000-55dd-c0cd-8499-78237686f8a1	8216	Mirna Peč
00050000-55dd-c0cd-65eb-e324d57fc78f	2382	Mislinja
00050000-55dd-c0cd-d31d-504497b4df61	4281	Mojstrana
00050000-55dd-c0cd-764d-6fe4b1f03ba3	8230	Mokronog
00050000-55dd-c0cd-1b9a-fb0cff9f0adc	1251	Moravče
00050000-55dd-c0cd-7a8e-80c73c6ca726	9226	Moravske Toplice
00050000-55dd-c0cd-f018-a0391bffa887	5216	Most na Soči
00050000-55dd-c0cd-c886-fe78e374db43	1221	Motnik
00050000-55dd-c0cd-a6d6-6c5650793228	3330	Mozirje
00050000-55dd-c0cd-6c56-c2b85a685b9a	9000	Murska Sobota 
00050000-55dd-c0cd-773a-a6324e519dfa	9001	Murska Sobota - poštni predali
00050000-55dd-c0cd-01d7-c79afbd31413	2366	Muta
00050000-55dd-c0cd-9675-eb6d9c66f49a	4202	Naklo
00050000-55dd-c0cd-8684-e143cd1f3c4f	3331	Nazarje
00050000-55dd-c0cd-3812-84a4a956f7fd	1357	Notranje Gorice
00050000-55dd-c0cd-08fa-ea3df49eaed4	3203	Nova Cerkev
00050000-55dd-c0cd-645c-9f20666c2477	5000	Nova Gorica 
00050000-55dd-c0cd-239e-8ecedc21a998	5001	Nova Gorica - poštni predali
00050000-55dd-c0cd-e1df-e1a31b394f81	1385	Nova vas
00050000-55dd-c0cd-bb9b-c8cf08d3778c	8000	Novo mesto
00050000-55dd-c0cd-fc33-f3cf48fa460c	8001	Novo mesto - poštni predali
00050000-55dd-c0cd-f372-36474c864984	6243	Obrov
00050000-55dd-c0cd-80a0-38a41066d02a	9233	Odranci
00050000-55dd-c0cd-80b0-347d7568cf77	2317	Oplotnica
00050000-55dd-c0cd-5038-8d4613bb22fb	2312	Orehova vas
00050000-55dd-c0cd-53ae-2360da4d848e	2270	Ormož
00050000-55dd-c0cd-d302-2c82d56d732b	1316	Ortnek
00050000-55dd-c0cd-9460-ef838b13fbc2	1337	Osilnica
00050000-55dd-c0cd-c7db-f84468edf9e9	8222	Otočec
00050000-55dd-c0cd-2ffc-f7a036c42fff	2361	Ožbalt
00050000-55dd-c0cd-97a3-78746baead0c	2231	Pernica
00050000-55dd-c0cd-c7e2-112a682fed48	2211	Pesnica pri Mariboru
00050000-55dd-c0cd-e46d-13468355f552	9203	Petrovci
00050000-55dd-c0cd-89d3-5c9635ad74e1	3301	Petrovče
00050000-55dd-c0cd-8a03-a90716fffe47	6330	Piran/Pirano
00050000-55dd-c0cd-c27f-08777a279687	8255	Pišece
00050000-55dd-c0cd-1fe8-305b3ad95658	6257	Pivka
00050000-55dd-c0cd-fcbe-a4bad27acada	6232	Planina
00050000-55dd-c0cd-0a65-76f8088cb0ba	3225	Planina pri Sevnici
00050000-55dd-c0cd-634f-e6f736cd44a5	6276	Pobegi
00050000-55dd-c0cd-8dfa-b3a114bd4c5c	8312	Podbočje
00050000-55dd-c0cd-1d0e-37d5b7240268	5243	Podbrdo
00050000-55dd-c0cd-e7ad-04a8f9fe23b4	3254	Podčetrtek
00050000-55dd-c0cd-6c66-85818360b82f	2273	Podgorci
00050000-55dd-c0cd-0742-ac706eb14a87	6216	Podgorje
00050000-55dd-c0cd-277a-231113fdbd25	2381	Podgorje pri Slovenj Gradcu
00050000-55dd-c0cd-ee79-d3620fa6d421	6244	Podgrad
00050000-55dd-c0cd-dac6-9c4965e78bd8	1414	Podkum
00050000-55dd-c0cd-d002-9c4b6acedb84	2286	Podlehnik
00050000-55dd-c0cd-9923-8a16e196f452	5272	Podnanos
00050000-55dd-c0cd-5d07-0db8f7045ab2	4244	Podnart
00050000-55dd-c0cd-7593-ae818413eaef	3241	Podplat
00050000-55dd-c0cd-a8f0-6c49bfa2a5f0	3257	Podsreda
00050000-55dd-c0cd-43b9-ea96aeb8c31e	2363	Podvelka
00050000-55dd-c0cd-7397-27606f422b21	2208	Pohorje
00050000-55dd-c0cd-fe85-c9b5f2752cb0	2257	Polenšak
00050000-55dd-c0cd-4390-6d5cdda96419	1355	Polhov Gradec
00050000-55dd-c0cd-025f-521717e7c12d	4223	Poljane nad Škofjo Loko
00050000-55dd-c0cd-6263-e8912345051f	2319	Poljčane
00050000-55dd-c0cd-650e-5379c897cabd	1272	Polšnik
00050000-55dd-c0cd-f42b-7a3b27ac42d8	3313	Polzela
00050000-55dd-c0cd-5ec9-2e8f42099388	3232	Ponikva
00050000-55dd-c0cd-163f-75774368fa1b	6320	Portorož/Portorose
00050000-55dd-c0cd-9d05-f9cab7adb572	6230	Postojna
00050000-55dd-c0cd-f9eb-56786868bcfe	2331	Pragersko
00050000-55dd-c0cd-2dcb-83ab609c3fec	3312	Prebold
00050000-55dd-c0cd-4b3f-bf288f619887	4205	Preddvor
00050000-55dd-c0cd-8b4e-45b817375188	6255	Prem
00050000-55dd-c0cd-297b-253c20488e0c	1352	Preserje
00050000-55dd-c0cd-3d53-0b64cb64d7f2	6258	Prestranek
00050000-55dd-c0cd-c6d6-ddf0780a01cf	2391	Prevalje
00050000-55dd-c0cd-9c00-e966284e0aa1	3262	Prevorje
00050000-55dd-c0cd-655f-5471f8231fdd	1276	Primskovo 
00050000-55dd-c0cd-78d2-cdf860a2dd6a	3253	Pristava pri Mestinju
00050000-55dd-c0cd-2dcd-7c95f05bf4ac	9207	Prosenjakovci/Partosfalva
00050000-55dd-c0cd-63ba-c9379a32e2d0	5297	Prvačina
00050000-55dd-c0cd-8550-2430645de701	2250	Ptuj
00050000-55dd-c0cd-9dab-d46f4038c129	2323	Ptujska Gora
00050000-55dd-c0cd-e9d8-be126cc2e966	9201	Puconci
00050000-55dd-c0cd-0725-63fe9aa89e8e	2327	Rače
00050000-55dd-c0cd-3bd4-c6b9ec1daf4d	1433	Radeče
00050000-55dd-c0cd-6ea3-2831c0965bb8	9252	Radenci
00050000-55dd-c0cd-1a60-89c80dfaed2f	2360	Radlje ob Dravi
00050000-55dd-c0cd-fbeb-bf47a4eb91df	1235	Radomlje
00050000-55dd-c0cd-e7bc-e885e0eb42e8	4240	Radovljica
00050000-55dd-c0cd-3694-cf1f871a9e0b	8274	Raka
00050000-55dd-c0cd-f6ef-0c5eeeb5488a	1381	Rakek
00050000-55dd-c0cd-436f-c747976e64cf	4283	Rateče - Planica
00050000-55dd-c0cd-874c-e693d1451406	2390	Ravne na Koroškem
00050000-55dd-c0cd-5a88-a43eeb24df49	9246	Razkrižje
00050000-55dd-c0cd-f9e5-c54caf2d67fa	3332	Rečica ob Savinji
00050000-55dd-c0cd-c803-5822122a478f	5292	Renče
00050000-55dd-c0cd-7bd3-843fb47090a5	1310	Ribnica
00050000-55dd-c0cd-d1f9-ebd0e82ac5fe	2364	Ribnica na Pohorju
00050000-55dd-c0cd-7f0a-52421033e3a0	3272	Rimske Toplice
00050000-55dd-c0cd-9af9-4f384d28aacd	1314	Rob
00050000-55dd-c0cd-e571-040c974c7394	5215	Ročinj
00050000-55dd-c0cd-f4b3-b31f8dd462a6	3250	Rogaška Slatina
00050000-55dd-c0cd-7fe6-e51de3ae7499	9262	Rogašovci
00050000-55dd-c0cd-ca98-42ee3e030a59	3252	Rogatec
00050000-55dd-c0cd-2aef-4e605b6f94a1	1373	Rovte
00050000-55dd-c0cd-1c00-c62447f766b9	2342	Ruše
00050000-55dd-c0cd-7b37-5b7f1822b4af	1282	Sava
00050000-55dd-c0cd-7e43-5bc51fe5e9b9	6333	Sečovlje/Sicciole
00050000-55dd-c0cd-a259-099023d6fa93	4227	Selca
00050000-55dd-c0cd-e2a8-fb09784e9ca8	2352	Selnica ob Dravi
00050000-55dd-c0cd-ced4-d2af555b434f	8333	Semič
00050000-55dd-c0cd-bf54-e723ec081aa4	8281	Senovo
00050000-55dd-c0cd-82bc-41c8c926b2d3	6224	Senožeče
00050000-55dd-c0cd-d647-3242aba60977	8290	Sevnica
00050000-55dd-c0cd-da48-aac7379c8075	6210	Sežana
00050000-55dd-c0cd-de3c-9de0617ff012	2214	Sladki Vrh
00050000-55dd-c0cd-416b-77bc327b6802	5283	Slap ob Idrijci
00050000-55dd-c0cd-5474-1df17f64f9e1	2380	Slovenj Gradec
00050000-55dd-c0cd-c59d-4da6ba932e9c	2310	Slovenska Bistrica
00050000-55dd-c0cd-1dd8-0e679897d468	3210	Slovenske Konjice
00050000-55dd-c0cd-36d4-eeb962f2598f	1216	Smlednik
00050000-55dd-c0cd-8b5a-a346207f1a17	5232	Soča
00050000-55dd-c0cd-e74c-005c45fa1a0b	1317	Sodražica
00050000-55dd-c0cd-e5c7-8d14ae6e7c14	3335	Solčava
00050000-55dd-c0cd-0732-17f0a0dd5d7a	5250	Solkan
00050000-55dd-c0cd-dabd-92b2b8248270	4229	Sorica
00050000-55dd-c0cd-bce6-7ddd302b134c	4225	Sovodenj
00050000-55dd-c0cd-ceef-be57e09a38db	5281	Spodnja Idrija
00050000-55dd-c0cd-b24e-96c6c9d93388	2241	Spodnji Duplek
00050000-55dd-c0cd-ce5a-f4c526319370	9245	Spodnji Ivanjci
00050000-55dd-c0cd-6169-897d560bb786	2277	Središče ob Dravi
00050000-55dd-c0cd-59ec-000a6bed1ea0	4267	Srednja vas v Bohinju
00050000-55dd-c0cd-11cb-c467113b5256	8256	Sromlje 
00050000-55dd-c0cd-b4f2-7a10d247d2e1	5224	Srpenica
00050000-55dd-c0cd-7700-02a4c39db028	1242	Stahovica
00050000-55dd-c0cd-e4da-5309e8034aa2	1332	Stara Cerkev
00050000-55dd-c0cd-e1af-cde8218cc1bf	8342	Stari trg ob Kolpi
00050000-55dd-c0cd-5390-b67b431e749b	1386	Stari trg pri Ložu
00050000-55dd-c0cd-09a8-a02fbd3cb4e8	2205	Starše
00050000-55dd-c0cd-bf35-17393d562192	2289	Stoperce
00050000-55dd-c0cd-543c-a48211918a01	8322	Stopiče
00050000-55dd-c0cd-1032-d21c93b42d20	3206	Stranice
00050000-55dd-c0cd-5dfb-8adcf36040fc	8351	Straža
00050000-55dd-c0cd-ae9c-1d724e05ca2e	1313	Struge
00050000-55dd-c0cd-64fa-214919476fd6	8293	Studenec
00050000-55dd-c0cd-e9a9-46692d4df9e5	8331	Suhor
00050000-55dd-c0cd-8684-3ad9b453c08a	2233	Sv. Ana v Slovenskih goricah
00050000-55dd-c0cd-8c22-c43951ee1389	2235	Sv. Trojica v Slovenskih goricah
00050000-55dd-c0cd-95cd-8e15721fccd8	2353	Sveti Duh na Ostrem Vrhu
00050000-55dd-c0cd-dfaf-1e8d6f72ea9b	9244	Sveti Jurij ob Ščavnici
00050000-55dd-c0cd-2cdc-4cceb14e6830	3264	Sveti Štefan
00050000-55dd-c0cd-1a9c-4cfb1523d027	2258	Sveti Tomaž
00050000-55dd-c0cd-749d-9451e9a32613	9204	Šalovci
00050000-55dd-c0cd-1a5b-edc71991e854	5261	Šempas
00050000-55dd-c0cd-880f-c600a5589416	5290	Šempeter pri Gorici
00050000-55dd-c0cd-e603-b9a26ce643f0	3311	Šempeter v Savinjski dolini
00050000-55dd-c0cd-a089-1f089df5e676	4208	Šenčur
00050000-55dd-c0cd-0ca1-959e14edfca9	2212	Šentilj v Slovenskih goricah
00050000-55dd-c0cd-8464-e40908b0c2db	8297	Šentjanž
00050000-55dd-c0cd-a4ef-de2dcfcfeb5e	2373	Šentjanž pri Dravogradu
00050000-55dd-c0cd-4929-1aa75f41c61a	8310	Šentjernej
00050000-55dd-c0cd-7c5c-ae5077dc6808	3230	Šentjur
00050000-55dd-c0cd-9fc7-20adb79dfb68	3271	Šentrupert
00050000-55dd-c0cd-3ee5-b4f2e8feb7b4	8232	Šentrupert
00050000-55dd-c0cd-ad8e-ce25a0532844	1296	Šentvid pri Stični
00050000-55dd-c0cd-500e-25c694d481ed	8275	Škocjan
00050000-55dd-c0cd-b23d-0e9387890f6e	6281	Škofije
00050000-55dd-c0cd-b718-165f127c587c	4220	Škofja Loka
00050000-55dd-c0cd-4bbd-4bd8888f609e	3211	Škofja vas
00050000-55dd-c0cd-9925-d4de2843557d	1291	Škofljica
00050000-55dd-c0cd-66cc-c2dd0a334615	6274	Šmarje
00050000-55dd-c0cd-440c-78ba7977d737	1293	Šmarje - Sap
00050000-55dd-c0cd-de0b-3e68ab4970ad	3240	Šmarje pri Jelšah
00050000-55dd-c0ce-ef60-1d59254fe002	8220	Šmarješke Toplice
00050000-55dd-c0ce-9f83-cec407d5d42b	2315	Šmartno na Pohorju
00050000-55dd-c0ce-2e73-4bf44658d33c	3341	Šmartno ob Dreti
00050000-55dd-c0ce-f233-962812aa6d28	3327	Šmartno ob Paki
00050000-55dd-c0ce-4e24-9efa283c55be	1275	Šmartno pri Litiji
00050000-55dd-c0ce-6465-3ea7cccd69c3	2383	Šmartno pri Slovenj Gradcu
00050000-55dd-c0ce-1789-1dec18605b1f	3201	Šmartno v Rožni dolini
00050000-55dd-c0ce-dfa5-96ededdbe1c6	3325	Šoštanj
00050000-55dd-c0ce-e162-8319a73a5cc6	6222	Štanjel
00050000-55dd-c0ce-b58a-d09819ad5230	3220	Štore
00050000-55dd-c0ce-1e64-cabf35e63feb	3304	Tabor
00050000-55dd-c0ce-4208-3419b80868ec	3221	Teharje
00050000-55dd-c0ce-957b-f4c45ca7abce	9251	Tišina
00050000-55dd-c0ce-6068-fc26a5c8c02b	5220	Tolmin
00050000-55dd-c0ce-5c56-733c7e5ba498	3326	Topolšica
00050000-55dd-c0ce-b0cf-7ab13c0d5075	2371	Trbonje
00050000-55dd-c0ce-ccf0-a9ee0dace626	1420	Trbovlje
00050000-55dd-c0ce-dfeb-47277870a17b	8231	Trebelno 
00050000-55dd-c0ce-09de-4b0f047559d5	8210	Trebnje
00050000-55dd-c0ce-e57f-3ee54423a3ba	5252	Trnovo pri Gorici
00050000-55dd-c0ce-f801-a7cd671a3d72	2254	Trnovska vas
00050000-55dd-c0ce-ed8d-62ebdc76b597	1222	Trojane
00050000-55dd-c0ce-a65a-30fc9e200fe1	1236	Trzin
00050000-55dd-c0ce-d469-97c24af09826	4290	Tržič
00050000-55dd-c0ce-22fc-a09ed23cae33	8295	Tržišče
00050000-55dd-c0ce-3e89-e61a93023e8f	1311	Turjak
00050000-55dd-c0ce-cfff-dc7e3471e935	9224	Turnišče
00050000-55dd-c0ce-31c6-c176f1d5c971	8323	Uršna sela
00050000-55dd-c0ce-7276-ebf0474275b6	1252	Vače
00050000-55dd-c0ce-22ad-f54cdfebe049	3320	Velenje 
00050000-55dd-c0ce-e90d-f6f10a5dbeeb	3322	Velenje - poštni predali
00050000-55dd-c0ce-5dc2-0c968ca130e5	8212	Velika Loka
00050000-55dd-c0ce-41dc-2a28e22ae9b7	2274	Velika Nedelja
00050000-55dd-c0ce-a10e-ac1ce9e66bdd	9225	Velika Polana
00050000-55dd-c0ce-04a3-16fce2134862	1315	Velike Lašče
00050000-55dd-c0ce-ad50-68e3a52cb15b	8213	Veliki Gaber
00050000-55dd-c0ce-0349-c8bc35e81f4f	9241	Veržej
00050000-55dd-c0ce-ac31-93a1eb9c58bc	1312	Videm - Dobrepolje
00050000-55dd-c0ce-2c51-15572aa31300	2284	Videm pri Ptuju
00050000-55dd-c0ce-bdd5-917cf132a71c	8344	Vinica
00050000-55dd-c0ce-bd7a-9f6ee0aaa5b9	5271	Vipava
00050000-55dd-c0ce-7f17-db4c6fd36942	4212	Visoko
00050000-55dd-c0ce-090a-9463491383f3	1294	Višnja Gora
00050000-55dd-c0ce-2627-af94feb8a07a	3205	Vitanje
00050000-55dd-c0ce-37df-4aa27c64e4b1	2255	Vitomarci
00050000-55dd-c0ce-5214-62ec46c9efa1	1217	Vodice
00050000-55dd-c0ce-7da0-2ea47c7a96ed	3212	Vojnik\t
00050000-55dd-c0ce-b906-11bb6dc703cc	5293	Volčja Draga
00050000-55dd-c0ce-0c9f-ccddb56feed6	2232	Voličina
00050000-55dd-c0ce-8601-c7f9ef4da6c0	3305	Vransko
00050000-55dd-c0ce-8993-f67ac4ff8c74	6217	Vremski Britof
00050000-55dd-c0ce-58fb-920375af69fb	1360	Vrhnika
00050000-55dd-c0ce-59da-38573138d105	2365	Vuhred
00050000-55dd-c0ce-c32a-62ad91a05456	2367	Vuzenica
00050000-55dd-c0ce-f91d-997d32bc1bef	8292	Zabukovje 
00050000-55dd-c0ce-f6a2-4c7bdb6f2a3f	1410	Zagorje ob Savi
00050000-55dd-c0ce-a968-c0aaacd0b9c6	1303	Zagradec
00050000-55dd-c0ce-6a4d-4c84f877d300	2283	Zavrč
00050000-55dd-c0ce-5b35-3ba9d2f64a2b	8272	Zdole 
00050000-55dd-c0ce-c3b7-e85a5a804a47	4201	Zgornja Besnica
00050000-55dd-c0ce-7b63-992035edc493	2242	Zgornja Korena
00050000-55dd-c0ce-1c23-9148572750c2	2201	Zgornja Kungota
00050000-55dd-c0ce-ac0a-1a448d889ee5	2316	Zgornja Ložnica
00050000-55dd-c0ce-0b4c-4cd0ee6b3c5a	2314	Zgornja Polskava
00050000-55dd-c0ce-6c7d-f98ccb442968	2213	Zgornja Velka
00050000-55dd-c0ce-a778-48606208045d	4247	Zgornje Gorje
00050000-55dd-c0ce-2c86-ffaeabd90f4e	4206	Zgornje Jezersko
00050000-55dd-c0ce-cdcf-e2e3dfbf281c	2285	Zgornji Leskovec
00050000-55dd-c0ce-bc41-5bb41afc296e	1432	Zidani Most
00050000-55dd-c0ce-c14c-35b11fd56672	3214	Zreče
00050000-55dd-c0ce-4d13-c51f66350743	4209	Žabnica
00050000-55dd-c0ce-36c8-7a983c2b5a76	3310	Žalec
00050000-55dd-c0ce-a9fa-4a4c6d2041cd	4228	Železniki
00050000-55dd-c0ce-99d2-deebc354cfb5	2287	Žetale
00050000-55dd-c0ce-b180-0ce15b01c420	4226	Žiri
00050000-55dd-c0ce-f482-81375992e180	4274	Žirovnica
00050000-55dd-c0ce-1efe-bfd75d455555	8360	Žužemberk
\.


--
-- TOC entry 2932 (class 0 OID 15708952)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2914 (class 0 OID 15708759)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55dd-c0cf-be05-d149b1edfddb	00080000-55dd-c0cf-1230-f608884bbf0c	\N	00040000-55dd-c0ce-8e1f-5a00effcefe5	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55dd-c0cf-642f-9cc19b4445f9	00080000-55dd-c0cf-1230-f608884bbf0c	\N	00040000-55dd-c0ce-8e1f-5a00effcefe5		\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55dd-c0cf-bb27-5713aa45a26a	00080000-55dd-c0cf-7e73-a0c2452c06b2	\N	00040000-55dd-c0ce-8e1f-5a00effcefe5		\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2920 (class 0 OID 15708837)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 15708964)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 15709313)
-- Dependencies: 226
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 15709323)
-- Dependencies: 227
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55dd-c0cf-a1ca-eb9258fc63f9	00080000-55dd-c0cf-fbc5-7fd3211c36ce	0987	AK
00190000-55dd-c0cf-1c12-fcb3ef762890	00080000-55dd-c0cf-7e73-a0c2452c06b2	0989	AK
00190000-55dd-c0cf-dbbe-aaf23c2b4d03	00080000-55dd-c0cf-d269-42dfb8f65b55	0986	AK
00190000-55dd-c0cf-906c-baa71480889e	00080000-55dd-c0cf-56fd-bd53af5ca3de	0984	AK
00190000-55dd-c0cf-bf2b-64a0a53c87a2	00080000-55dd-c0cf-7896-770149e165db	0983	AK
00190000-55dd-c0cf-c97d-883840bd0133	00080000-55dd-c0cf-1775-c2353e16a633	0982	AK
00190000-55dd-c0d0-fc28-24fba2ed9a6a	00080000-55dd-c0d0-b410-d90c5c66e2a4	1001	AK
\.


--
-- TOC entry 2957 (class 0 OID 15709269)
-- Dependencies: 225
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55dd-c0cf-65f1-b064d096a8f4	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2960 (class 0 OID 15709331)
-- Dependencies: 228
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2938 (class 0 OID 15708993)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55dd-c0cf-97b1-53361acff5da	\N	\N	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55dd-c0cf-69c5-579a61113fce	\N	\N	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55dd-c0cf-7665-190b657db050	\N	\N	0003	Kazinska	t	84	Kazinska dvorana
00220000-55dd-c0cf-2d27-59d6f8c2b1b3	\N	\N	0004	Mali oder	t	24	Mali oder 
00220000-55dd-c0cf-409e-b75b2551a086	\N	\N	0005	Komorni oder	t	15	Komorni oder
00220000-55dd-c0cf-ebbe-bf14871b8e7f	\N	\N	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55dd-c0cf-545f-c40e8ca89bd3	\N	\N	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2930 (class 0 OID 15708937)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 15708927)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 15709124)
-- Dependencies: 218
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2945 (class 0 OID 15709063)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 15708632)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55dd-c0d0-b410-d90c5c66e2a4	00010000-55dd-c0ce-9e4e-e76091d624c3	2015-08-26 15:36:16	INS	a:0:{}
2	App\\Entity\\Option	00000000-55dd-c0d0-784d-7fd45ec55a56	00010000-55dd-c0ce-9e4e-e76091d624c3	2015-08-26 15:36:16	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55dd-c0d0-fc28-24fba2ed9a6a	00010000-55dd-c0ce-9e4e-e76091d624c3	2015-08-26 15:36:16	INS	a:0:{}
\.


--
-- TOC entry 2981 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2939 (class 0 OID 15709005)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 15708670)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55dd-c0ce-5d97-4b0cddd32e5e	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55dd-c0ce-b492-daa0b6f487fa	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55dd-c0ce-871e-b13faab87328	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55dd-c0ce-059c-5674975faa6f	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55dd-c0ce-5661-4e3a1db73e8c	planer	Planer dogodkov v koledarju	t
00020000-55dd-c0ce-4e90-6d1b0caee08a	kadrovska	Kadrovska služba	t
00020000-55dd-c0ce-2956-7f1253defaf1	arhivar	Ažuriranje arhivalij	t
00020000-55dd-c0ce-3214-059a957a0036	igralec	Igralec	t
00020000-55dd-c0ce-3d71-7b662ba70d9c	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55dd-c0cf-7a94-5dd41d4fd9b1	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2905 (class 0 OID 15708654)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55dd-c0ce-0a0d-f4a2ca51f40c	00020000-55dd-c0ce-871e-b13faab87328
00010000-55dd-c0ce-9e4e-e76091d624c3	00020000-55dd-c0ce-871e-b13faab87328
00010000-55dd-c0cf-ef48-eb78ee6a5ff3	00020000-55dd-c0cf-7a94-5dd41d4fd9b1
\.


--
-- TOC entry 2941 (class 0 OID 15709019)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 15708958)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 15708904)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 15709372)
-- Dependencies: 233
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55dd-c0ce-49a8-9df16075ecf4	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55dd-c0ce-89ec-b90809755cc4	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55dd-c0ce-3289-a74a5fdf8a2c	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55dd-c0ce-bf18-76e2255160fd	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55dd-c0ce-0158-a442ce92ca98	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2964 (class 0 OID 15709364)
-- Dependencies: 232
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55dd-c0ce-dddb-bf704b156edd	00230000-55dd-c0ce-bf18-76e2255160fd	popa
00240000-55dd-c0ce-a61e-10ea78123a50	00230000-55dd-c0ce-bf18-76e2255160fd	oseba
00240000-55dd-c0ce-c3c2-c83a646988d6	00230000-55dd-c0ce-bf18-76e2255160fd	sezona
00240000-55dd-c0ce-68dd-3395f110158e	00230000-55dd-c0ce-89ec-b90809755cc4	prostor
00240000-55dd-c0ce-d3d4-31c7de9e0fc4	00230000-55dd-c0ce-bf18-76e2255160fd	besedilo
00240000-55dd-c0ce-4217-7a6c46658dfa	00230000-55dd-c0ce-bf18-76e2255160fd	uprizoritev
00240000-55dd-c0ce-b5c7-600bd6d90e15	00230000-55dd-c0ce-bf18-76e2255160fd	funkcija
00240000-55dd-c0ce-b827-a2d89ce31577	00230000-55dd-c0ce-bf18-76e2255160fd	tipfunkcije
00240000-55dd-c0ce-169a-2ffbce5adfe5	00230000-55dd-c0ce-bf18-76e2255160fd	alternacija
00240000-55dd-c0ce-df0b-b59fab6e419e	00230000-55dd-c0ce-49a8-9df16075ecf4	pogodba
00240000-55dd-c0ce-34be-9801f5e53bf8	00230000-55dd-c0ce-bf18-76e2255160fd	zaposlitev
00240000-55dd-c0ce-43b5-96227150d1ac	00230000-55dd-c0ce-49a8-9df16075ecf4	programdela
00240000-55dd-c0ce-c4ef-0a44a5de9d52	00230000-55dd-c0ce-bf18-76e2255160fd	zapis
\.


--
-- TOC entry 2963 (class 0 OID 15709359)
-- Dependencies: 231
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
ee9f36d1-ef66-4182-986e-12060d98cf69	00230000-55dd-c0ce-bf18-76e2255160fd	0	1001
\.


--
-- TOC entry 2946 (class 0 OID 15709073)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55dd-c0cf-8dc1-8007c6de82fe	000e0000-55dd-c0cf-c2c8-362ea015150d	00080000-55dd-c0cf-1230-f608884bbf0c	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55dd-c0ce-8957-816e7d13925a
00270000-55dd-c0cf-30de-208779c687b6	000e0000-55dd-c0cf-c2c8-362ea015150d	00080000-55dd-c0cf-1230-f608884bbf0c	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55dd-c0ce-8957-816e7d13925a
00270000-55dd-c0cf-c53a-68d42b3a7ec4	000e0000-55dd-c0cf-c2c8-362ea015150d	00080000-55dd-c0cf-488e-fe0c1e221a02	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4	\N
\.


--
-- TOC entry 2912 (class 0 OID 15708732)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 15708914)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55dd-c0cf-81a9-0ff892ae5d67	00180000-55dd-c0cf-439f-418dc87caf4f	000c0000-55dd-c0cf-5adb-949a1573faa3	00090000-55dd-c0cf-3167-b0bd45f97d26	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dd-c0cf-9ff8-9da5addee35d	00180000-55dd-c0cf-439f-418dc87caf4f	000c0000-55dd-c0cf-30d0-2c8bf7e1f977	00090000-55dd-c0cf-ad88-4024e1379328	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dd-c0cf-9e9b-db551408a052	00180000-55dd-c0cf-439f-418dc87caf4f	000c0000-55dd-c0cf-9411-7a8ebdaab236	00090000-55dd-c0cf-feed-829abca5c50c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dd-c0cf-67d2-c591c2801ae5	00180000-55dd-c0cf-439f-418dc87caf4f	000c0000-55dd-c0cf-83a9-94a91accf587	00090000-55dd-c0cf-d2f6-c9f04693ad79	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dd-c0cf-22ea-0af77186b418	00180000-55dd-c0cf-439f-418dc87caf4f	000c0000-55dd-c0cf-9e14-75574f278207	00090000-55dd-c0cf-84ef-0194db097fb6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dd-c0cf-46f7-896e68483d86	00180000-55dd-c0cf-21de-606ab631cfb6	\N	00090000-55dd-c0cf-84ef-0194db097fb6	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2949 (class 0 OID 15709113)
-- Dependencies: 217
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55dd-c0ce-6928-b6cc7cbd0f70	Avtor	Avtorji	Avtorka	umetnik
000f0000-55dd-c0ce-c004-88c9be28054c	Priredba	Priredba	Priredba	umetnik
000f0000-55dd-c0ce-69fb-aa140af119f2	Prevod	Prevod	Prevod	umetnik
000f0000-55dd-c0ce-5fd0-958d8926deff	Režija	Režija	Režija	umetnik
000f0000-55dd-c0ce-ea9f-e146e839c6c7	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55dd-c0ce-f638-293d37b726f2	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55dd-c0ce-210d-54dbd027cc02	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55dd-c0ce-348b-21fc87563c6f	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55dd-c0ce-88a8-c9b5bec8ca73	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55dd-c0ce-4a4e-9052313f3318	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55dd-c0ce-f151-1d3e05a2cbfd	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55dd-c0ce-bdd9-5153b335cbc9	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55dd-c0ce-758e-17eadfe1b805	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55dd-c0ce-eb84-c3e2acecee3b	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55dd-c0ce-1cec-a530291c333e	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55dd-c0ce-176e-546ba7bb1d46	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55dd-c0ce-2d50-1d28bc68c068	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55dd-c0ce-36cf-d2858f6c7f48	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2961 (class 0 OID 15709341)
-- Dependencies: 229
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55dd-c0ce-509b-a083c7d38c7e	01	Velika predstava	f	1.00	1.00
002b0000-55dd-c0ce-096f-8e738c2ddee6	02	Mala predstava	f	0.50	0.50
002b0000-55dd-c0ce-b541-bfabb91ecbee	03	Mala koprodukcija	t	0.40	1.00
002b0000-55dd-c0ce-2177-4d360563dff8	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55dd-c0ce-f388-2cd64b652eb4	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2917 (class 0 OID 15708794)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 15708641)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55dd-c0ce-9e4e-e76091d624c3	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROzWJLmN4jjxQUUi8wmuuuMwvPrRh6e5e	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55dd-c0cf-8c39-eca6c363dd40	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55dd-c0cf-4e89-56c8673b11e5	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55dd-c0cf-536b-9b66b00d290f	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55dd-c0cf-125e-e2d03e53c0cb	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55dd-c0cf-9326-3289c55c104c	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55dd-c0cf-7794-9094216615b1	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55dd-c0cf-e5bc-306540113795	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55dd-c0cf-5702-53abd08b6647	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55dd-c0cf-385c-a20f684482ed	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55dd-c0cf-ef48-eb78ee6a5ff3	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55dd-c0ce-0a0d-f4a2ca51f40c	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2953 (class 0 OID 15709161)
-- Dependencies: 221
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55dd-c0cf-22e9-913abae6607e	00160000-55dd-c0cf-2966-e898bff93b11	\N	00140000-55dd-c0ce-eb06-75601eddb2f4	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55dd-c0cf-409e-b75b2551a086
000e0000-55dd-c0cf-c2c8-362ea015150d	00160000-55dd-c0cf-d1ed-d3fd05eab8c5	\N	00140000-55dd-c0ce-8591-a52fb94642c1	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55dd-c0cf-ebbe-bf14871b8e7f
000e0000-55dd-c0cf-59f8-adc52b887b6c	\N	\N	00140000-55dd-c0ce-8591-a52fb94642c1	00190000-55dd-c0cf-a1ca-eb9258fc63f9	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55dd-c0cf-409e-b75b2551a086
000e0000-55dd-c0cf-0eda-31145ed7a043	\N	\N	00140000-55dd-c0ce-8591-a52fb94642c1	00190000-55dd-c0cf-a1ca-eb9258fc63f9	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55dd-c0cf-409e-b75b2551a086
000e0000-55dd-c0cf-4caa-995e80aa46aa	\N	\N	00140000-55dd-c0ce-8591-a52fb94642c1	00190000-55dd-c0cf-a1ca-eb9258fc63f9	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55dd-c0cf-97b1-53361acff5da
000e0000-55dd-c0cf-ea72-8ecd00c5557c	\N	\N	00140000-55dd-c0ce-8591-a52fb94642c1	00190000-55dd-c0cf-a1ca-eb9258fc63f9	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f		00220000-55dd-c0cf-97b1-53361acff5da
\.


--
-- TOC entry 2922 (class 0 OID 15708856)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55dd-c0cf-161a-80ee64ed1055	000e0000-55dd-c0cf-c2c8-362ea015150d	1	
00200000-55dd-c0cf-4e62-27cbfa743e77	000e0000-55dd-c0cf-c2c8-362ea015150d	2	
\.


--
-- TOC entry 2937 (class 0 OID 15708985)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 15709087)
-- Dependencies: 215
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55dd-c0ce-2596-85c76ca831fb	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55dd-c0ce-cf1b-b90934f05977	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55dd-c0ce-04c9-2c2d895865b0	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55dd-c0ce-41a8-a276b6512f3d	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55dd-c0ce-d784-bd5c1af64fd4	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55dd-c0ce-3598-d8999c6ce862	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55dd-c0ce-d624-9f30c287eda6	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55dd-c0ce-9410-a55f1a6bed9a	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55dd-c0ce-8957-816e7d13925a	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55dd-c0ce-43d6-abd713bdcd92	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55dd-c0ce-d02c-eed1a9277d73	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55dd-c0ce-6059-d2f52a400d7f	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55dd-c0ce-ec55-c48d0acd33e0	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55dd-c0ce-62d7-be551414cecd	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55dd-c0ce-5668-0340babc277c	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55dd-c0ce-3644-85c519c34984	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55dd-c0ce-deee-d848cd0f02e3	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55dd-c0ce-b4f0-ffd40db24f99	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55dd-c0ce-a50c-5a02afc4e381	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55dd-c0ce-a1c9-fa88103f440e	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55dd-c0ce-3750-14a7a968a25c	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55dd-c0ce-0333-182574bb2407	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55dd-c0ce-ab7c-7265296d1c59	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55dd-c0ce-453f-9c547a87d707	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2967 (class 0 OID 15709411)
-- Dependencies: 235
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 15709383)
-- Dependencies: 234
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 15709423)
-- Dependencies: 236
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2944 (class 0 OID 15709056)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55dd-c0cf-0961-d25f81b72a3f	00090000-55dd-c0cf-ad88-4024e1379328	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dd-c0cf-c2f9-e977888575f0	00090000-55dd-c0cf-feed-829abca5c50c	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dd-c0cf-ab16-b5923e621220	00090000-55dd-c0cf-7070-ceb95f63aa74	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dd-c0cf-f852-402fb26e3f1b	00090000-55dd-c0cf-1466-eb771067846c	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dd-c0cf-9c4e-a70c84edb175	00090000-55dd-c0cf-3167-b0bd45f97d26	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dd-c0cf-44b9-ab20bd1a199e	00090000-55dd-c0cf-7b72-c045c62e8f34	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2924 (class 0 OID 15708888)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 15709151)
-- Dependencies: 220
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55dd-c0ce-eb06-75601eddb2f4	01	Drama	drama (SURS 01)
00140000-55dd-c0ce-a97e-85df1d4abb3f	02	Opera	opera (SURS 02)
00140000-55dd-c0ce-da6b-982b10fecfd6	03	Balet	balet (SURS 03)
00140000-55dd-c0ce-cf00-8366a6bde229	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55dd-c0ce-097a-a271e42f616a	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55dd-c0ce-8591-a52fb94642c1	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55dd-c0ce-e527-74ea3af4a1c4	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2943 (class 0 OID 15709046)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2446 (class 2606 OID 15708695)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 15709208)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 15709198)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 15709112)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 15709463)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 15708878)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 15708903)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 15709357)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 15708820)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 15709263)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 15709042)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 15708854)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 15708897)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 15708834)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 15708950)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 15709440)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 15709447)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2692 (class 2606 OID 15709471)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 15708977)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 15708792)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 15708704)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2453 (class 2606 OID 15708728)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2444 (class 2606 OID 15708684)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2437 (class 2606 OID 15708669)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 15708983)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 15709018)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 15709146)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 15708756)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 15708780)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 15708956)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 15708770)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 15708841)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 15708968)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 15709320)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 15709328)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 15709311)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 15709339)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 15709000)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 15708941)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 15708932)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 15709134)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 15709070)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 15708640)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 15709009)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 15708658)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2439 (class 2606 OID 15708678)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 15709027)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 15708963)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 15708912)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 15709381)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 15709369)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 15709363)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 15709083)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 15708737)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 15708923)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 15709123)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 15709351)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 15708805)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 15708653)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 15709177)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 15708863)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 15708991)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 15709095)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 15709421)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 15709405)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 15709429)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 15709061)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 15708892)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 15709159)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 15709054)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 1259 OID 15708885)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2589 (class 1259 OID 15709084)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2590 (class 1259 OID 15709085)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2591 (class 1259 OID 15709086)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2678 (class 1259 OID 15709442)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2679 (class 1259 OID 15709441)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2460 (class 1259 OID 15708758)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2552 (class 1259 OID 15708984)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2665 (class 1259 OID 15709409)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2666 (class 1259 OID 15709408)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2667 (class 1259 OID 15709410)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2668 (class 1259 OID 15709407)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2669 (class 1259 OID 15709406)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2546 (class 1259 OID 15708970)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2547 (class 1259 OID 15708969)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2497 (class 1259 OID 15708864)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2576 (class 1259 OID 15709043)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2577 (class 1259 OID 15709045)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2578 (class 1259 OID 15709044)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2485 (class 1259 OID 15708836)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2486 (class 1259 OID 15708835)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2648 (class 1259 OID 15709340)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2602 (class 1259 OID 15709148)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2603 (class 1259 OID 15709149)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2604 (class 1259 OID 15709150)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2675 (class 1259 OID 15709430)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2611 (class 1259 OID 15709182)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2612 (class 1259 OID 15709179)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2613 (class 1259 OID 15709183)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2614 (class 1259 OID 15709181)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2615 (class 1259 OID 15709180)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2475 (class 1259 OID 15708807)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2476 (class 1259 OID 15708806)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2451 (class 1259 OID 15708731)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2564 (class 1259 OID 15709010)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2515 (class 1259 OID 15708898)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2441 (class 1259 OID 15708685)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2442 (class 1259 OID 15708686)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2569 (class 1259 OID 15709030)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2570 (class 1259 OID 15709029)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2571 (class 1259 OID 15709028)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2489 (class 1259 OID 15708842)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2490 (class 1259 OID 15708844)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2491 (class 1259 OID 15708843)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2658 (class 1259 OID 15709371)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2526 (class 1259 OID 15708936)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2527 (class 1259 OID 15708934)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2528 (class 1259 OID 15708933)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2529 (class 1259 OID 15708935)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2432 (class 1259 OID 15708659)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2433 (class 1259 OID 15708660)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2555 (class 1259 OID 15708992)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2688 (class 1259 OID 15709464)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2689 (class 1259 OID 15709472)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2690 (class 1259 OID 15709473)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2541 (class 1259 OID 15708957)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2585 (class 1259 OID 15709071)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2586 (class 1259 OID 15709072)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2632 (class 1259 OID 15709268)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2633 (class 1259 OID 15709267)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2634 (class 1259 OID 15709264)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2635 (class 1259 OID 15709265)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2636 (class 1259 OID 15709266)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2464 (class 1259 OID 15708772)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 15708771)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2466 (class 1259 OID 15708773)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2558 (class 1259 OID 15709004)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2559 (class 1259 OID 15709003)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2640 (class 1259 OID 15709321)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2641 (class 1259 OID 15709322)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2625 (class 1259 OID 15709212)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2626 (class 1259 OID 15709213)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2627 (class 1259 OID 15709210)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2628 (class 1259 OID 15709211)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2582 (class 1259 OID 15709062)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2532 (class 1259 OID 15708945)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2533 (class 1259 OID 15708944)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2534 (class 1259 OID 15708942)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2535 (class 1259 OID 15708943)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2621 (class 1259 OID 15709200)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2622 (class 1259 OID 15709199)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2637 (class 1259 OID 15709312)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2496 (class 1259 OID 15708855)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2655 (class 1259 OID 15709358)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2682 (class 1259 OID 15709448)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2683 (class 1259 OID 15709449)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2447 (class 1259 OID 15708706)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2448 (class 1259 OID 15708705)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2456 (class 1259 OID 15708738)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2457 (class 1259 OID 15708739)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2521 (class 1259 OID 15708926)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2522 (class 1259 OID 15708925)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2523 (class 1259 OID 15708924)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2503 (class 1259 OID 15708887)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2504 (class 1259 OID 15708883)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2505 (class 1259 OID 15708880)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2506 (class 1259 OID 15708881)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2507 (class 1259 OID 15708879)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2508 (class 1259 OID 15708884)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2509 (class 1259 OID 15708882)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2463 (class 1259 OID 15708757)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2481 (class 1259 OID 15708821)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 15708823)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2483 (class 1259 OID 15708822)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2484 (class 1259 OID 15708824)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2540 (class 1259 OID 15708951)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2607 (class 1259 OID 15709147)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2616 (class 1259 OID 15709178)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2454 (class 1259 OID 15708729)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2455 (class 1259 OID 15708730)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2579 (class 1259 OID 15709055)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2664 (class 1259 OID 15709382)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2474 (class 1259 OID 15708793)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2661 (class 1259 OID 15709370)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2562 (class 1259 OID 15709002)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2563 (class 1259 OID 15709001)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2629 (class 1259 OID 15709209)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2471 (class 1259 OID 15708781)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2608 (class 1259 OID 15709160)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2672 (class 1259 OID 15709422)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2646 (class 1259 OID 15709329)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2647 (class 1259 OID 15709330)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2520 (class 1259 OID 15708913)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2440 (class 1259 OID 15708679)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2510 (class 1259 OID 15708886)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2718 (class 2606 OID 15709609)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2721 (class 2606 OID 15709594)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2720 (class 2606 OID 15709599)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2716 (class 2606 OID 15709619)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2722 (class 2606 OID 15709589)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2717 (class 2606 OID 15709614)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2719 (class 2606 OID 15709604)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2755 (class 2606 OID 15709774)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2754 (class 2606 OID 15709779)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2753 (class 2606 OID 15709784)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2788 (class 2606 OID 15709954)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2789 (class 2606 OID 15709949)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2703 (class 2606 OID 15709524)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2739 (class 2606 OID 15709704)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2783 (class 2606 OID 15709934)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2784 (class 2606 OID 15709929)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2782 (class 2606 OID 15709939)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2785 (class 2606 OID 15709924)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2786 (class 2606 OID 15709919)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2737 (class 2606 OID 15709699)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2738 (class 2606 OID 15709694)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2715 (class 2606 OID 15709584)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2749 (class 2606 OID 15709744)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2747 (class 2606 OID 15709754)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2748 (class 2606 OID 15709749)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2709 (class 2606 OID 15709559)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2710 (class 2606 OID 15709554)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2735 (class 2606 OID 15709684)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2779 (class 2606 OID 15709904)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2758 (class 2606 OID 15709789)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2757 (class 2606 OID 15709794)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2756 (class 2606 OID 15709799)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2787 (class 2606 OID 15709944)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2760 (class 2606 OID 15709819)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2763 (class 2606 OID 15709804)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2759 (class 2606 OID 15709824)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2761 (class 2606 OID 15709814)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2762 (class 2606 OID 15709809)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2707 (class 2606 OID 15709549)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2708 (class 2606 OID 15709544)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2699 (class 2606 OID 15709509)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2700 (class 2606 OID 15709504)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2743 (class 2606 OID 15709724)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2723 (class 2606 OID 15709624)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2696 (class 2606 OID 15709484)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2695 (class 2606 OID 15709489)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2744 (class 2606 OID 15709739)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2745 (class 2606 OID 15709734)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2746 (class 2606 OID 15709729)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2713 (class 2606 OID 15709564)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2711 (class 2606 OID 15709574)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2712 (class 2606 OID 15709569)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2781 (class 2606 OID 15709914)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2727 (class 2606 OID 15709659)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2729 (class 2606 OID 15709649)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2730 (class 2606 OID 15709644)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2728 (class 2606 OID 15709654)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2694 (class 2606 OID 15709474)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2693 (class 2606 OID 15709479)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2740 (class 2606 OID 15709709)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2792 (class 2606 OID 15709969)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2794 (class 2606 OID 15709974)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2793 (class 2606 OID 15709979)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2736 (class 2606 OID 15709689)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2752 (class 2606 OID 15709764)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2751 (class 2606 OID 15709769)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2770 (class 2606 OID 15709879)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2771 (class 2606 OID 15709874)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2774 (class 2606 OID 15709859)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2773 (class 2606 OID 15709864)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2772 (class 2606 OID 15709869)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2705 (class 2606 OID 15709534)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2706 (class 2606 OID 15709529)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2704 (class 2606 OID 15709539)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2741 (class 2606 OID 15709719)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2742 (class 2606 OID 15709714)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2777 (class 2606 OID 15709889)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2776 (class 2606 OID 15709894)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2767 (class 2606 OID 15709849)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2766 (class 2606 OID 15709854)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2769 (class 2606 OID 15709839)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2768 (class 2606 OID 15709844)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2750 (class 2606 OID 15709759)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2731 (class 2606 OID 15709679)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2732 (class 2606 OID 15709674)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2734 (class 2606 OID 15709664)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2733 (class 2606 OID 15709669)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2764 (class 2606 OID 15709834)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2765 (class 2606 OID 15709829)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2775 (class 2606 OID 15709884)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2714 (class 2606 OID 15709579)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2778 (class 2606 OID 15709899)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2780 (class 2606 OID 15709909)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2791 (class 2606 OID 15709959)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2790 (class 2606 OID 15709964)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2697 (class 2606 OID 15709499)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2698 (class 2606 OID 15709494)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2702 (class 2606 OID 15709514)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2701 (class 2606 OID 15709519)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2724 (class 2606 OID 15709639)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2725 (class 2606 OID 15709634)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2726 (class 2606 OID 15709629)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-26 15:36:17 CEST

--
-- PostgreSQL database dump complete
--

