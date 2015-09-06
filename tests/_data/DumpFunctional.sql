--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.0
-- Dumped by pg_dump version 9.4.0
-- Started on 2015-09-06 15:27:49 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 182 (class 1259 OID 1160852)
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
-- TOC entry 214 (class 1259 OID 1161194)
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
-- TOC entry 215 (class 1259 OID 1161207)
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
-- TOC entry 216 (class 1259 OID 1161224)
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
-- TOC entry 235 (class 1259 OID 1161526)
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
-- TOC entry 193 (class 1259 OID 1161002)
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
-- TOC entry 194 (class 1259 OID 1161028)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 1161382)
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
-- TOC entry 183 (class 1259 OID 1160861)
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
-- TOC entry 229 (class 1259 OID 1161389)
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
-- TOC entry 217 (class 1259 OID 1161241)
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
-- TOC entry 195 (class 1259 OID 1161033)
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
-- TOC entry 184 (class 1259 OID 1160878)
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
-- TOC entry 201 (class 1259 OID 1161089)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 236 (class 1259 OID 1161541)
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
-- TOC entry 237 (class 1259 OID 1161553)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 1161560)
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
-- TOC entry 202 (class 1259 OID 1161095)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 185 (class 1259 OID 1160890)
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
-- TOC entry 186 (class 1259 OID 1160902)
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
-- TOC entry 187 (class 1259 OID 1160913)
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
-- TOC entry 175 (class 1259 OID 1160795)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 1160825)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 203 (class 1259 OID 1161102)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 204 (class 1259 OID 1161109)
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
-- TOC entry 218 (class 1259 OID 1161256)
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
-- TOC entry 188 (class 1259 OID 1160938)
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
-- TOC entry 189 (class 1259 OID 1160957)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 205 (class 1259 OID 1161117)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 1160965)
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
-- TOC entry 196 (class 1259 OID 1161044)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 206 (class 1259 OID 1161123)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 1161444)
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
-- TOC entry 231 (class 1259 OID 1161454)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 1161462)
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
-- TOC entry 233 (class 1259 OID 1161505)
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
-- TOC entry 207 (class 1259 OID 1161130)
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
-- TOC entry 208 (class 1259 OID 1161143)
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
-- TOC entry 209 (class 1259 OID 1161152)
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
-- TOC entry 219 (class 1259 OID 1161272)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 220 (class 1259 OID 1161283)
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
-- TOC entry 177 (class 1259 OID 1160806)
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
-- TOC entry 176 (class 1259 OID 1160804)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3260 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 1161162)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 1160815)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 181 (class 1259 OID 1160845)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 1161168)
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
-- TOC entry 212 (class 1259 OID 1161180)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 1161051)
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
-- TOC entry 172 (class 1259 OID 1160771)
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
-- TOC entry 173 (class 1259 OID 1160782)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 174 (class 1259 OID 1160790)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 221 (class 1259 OID 1161293)
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
-- TOC entry 191 (class 1259 OID 1160980)
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
-- TOC entry 200 (class 1259 OID 1161076)
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
-- TOC entry 222 (class 1259 OID 1161307)
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
-- TOC entry 234 (class 1259 OID 1161515)
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
-- TOC entry 192 (class 1259 OID 1160988)
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
-- TOC entry 180 (class 1259 OID 1160832)
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
-- TOC entry 223 (class 1259 OID 1161318)
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
-- TOC entry 198 (class 1259 OID 1161061)
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
-- TOC entry 213 (class 1259 OID 1161186)
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
-- TOC entry 224 (class 1259 OID 1161343)
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
-- TOC entry 239 (class 1259 OID 1161569)
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
-- TOC entry 240 (class 1259 OID 1161581)
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
-- TOC entry 241 (class 1259 OID 1161609)
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
-- TOC entry 225 (class 1259 OID 1161352)
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
-- TOC entry 199 (class 1259 OID 1161071)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 1161362)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 227 (class 1259 OID 1161372)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2463 (class 2604 OID 1160809)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3194 (class 0 OID 1160852)
-- Dependencies: 182
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3226 (class 0 OID 1161194)
-- Dependencies: 214
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55ec-3f4f-5842-386f23a2c0eb	000d0000-55ec-3f4f-4e23-12f79c468d8f	\N	00090000-55ec-3f4e-f05d-4c4fd0c47814	000b0000-55ec-3f4f-c981-3162c98e37a9	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55ec-3f4f-7c9c-85aa429409d3	000d0000-55ec-3f4f-b231-8115ee7c8860	00100000-55ec-3f4e-1687-073771fe3d8e	00090000-55ec-3f4e-7ea6-9ca0ce6d1c80	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55ec-3f4f-1efb-bb3f954dbd12	000d0000-55ec-3f4f-f824-573a48910abc	00100000-55ec-3f4e-d7ec-88ae8882a672	00090000-55ec-3f4e-016c-35c5b29d832a	\N	0003	t	\N	2015-09-06	\N	2	t	\N	f	f
000c0000-55ec-3f4f-22b7-f52d613fcf90	000d0000-55ec-3f4f-dbf6-970c908e260a	\N	00090000-55ec-3f4e-7e6f-2638e0b8bdd3	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55ec-3f4f-2bcf-f91421043d9d	000d0000-55ec-3f4f-df39-6dd50afa60c6	\N	00090000-55ec-3f4e-c630-5d8c9a519d14	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55ec-3f4f-1f75-5d12df288388	000d0000-55ec-3f4f-003c-842577372a1c	\N	00090000-55ec-3f4e-3b7f-469f1ae293e4	000b0000-55ec-3f4f-da67-5296c2e2b643	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55ec-3f4f-d792-04846516e435	000d0000-55ec-3f4f-dfe3-650fc19f091f	00100000-55ec-3f4e-23b5-daa2215889e0	00090000-55ec-3f4e-d60c-29b904465f75	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55ec-3f4f-946f-3231ac224da0	000d0000-55ec-3f4f-969a-4327df68e00f	\N	00090000-55ec-3f4e-dcf7-5691fcf83b6c	000b0000-55ec-3f4f-9433-1d37840354ad	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55ec-3f4f-8fec-1ca5faed671b	000d0000-55ec-3f4f-dfe3-650fc19f091f	00100000-55ec-3f4e-bd9e-09aa5e897e23	00090000-55ec-3f4e-0959-c39f1b3ea9d1	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55ec-3f4f-cd58-9c801741ced2	000d0000-55ec-3f4f-dfe3-650fc19f091f	00100000-55ec-3f4e-d763-0645a2d398cc	00090000-55ec-3f4e-b1df-84e3de7851dc	\N	0010	t	\N	2015-09-06	\N	16	f	\N	f	t
000c0000-55ec-3f4f-734e-56e96196493d	000d0000-55ec-3f4f-dfe3-650fc19f091f	00100000-55ec-3f4e-2d16-df0d1dd0cef6	00090000-55ec-3f4e-b424-4902db12b737	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
\.


--
-- TOC entry 3227 (class 0 OID 1161207)
-- Dependencies: 215
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3228 (class 0 OID 1161224)
-- Dependencies: 216
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55ec-3f4e-d7d4-975572b89b61	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55ec-3f4e-55f0-9f586d853df7	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55ec-3f4e-52b0-2320f29174bc	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3247 (class 0 OID 1161526)
-- Dependencies: 235
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 1161002)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55ec-3f4f-d405-3cd6d5532cef	\N	\N	00200000-55ec-3f4f-6499-4862b603215a	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55ec-3f4f-89f2-2d757cd13836	\N	\N	00200000-55ec-3f4f-1784-60f63da2f15a	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55ec-3f4f-a157-051955acb26e	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55ec-3f4f-5080-7705d05d00fe	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55ec-3f4f-0592-39ea8c79fa08	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 3206 (class 0 OID 1161028)
-- Dependencies: 194
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3240 (class 0 OID 1161382)
-- Dependencies: 228
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3195 (class 0 OID 1160861)
-- Dependencies: 183
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55ec-3f44-36c6-d85695ee11ab	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55ec-3f44-a177-46f0ca9c1f56	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55ec-3f44-4ed2-dc9b45dc2c44	AL	ALB	008	Albania 	Albanija	\N
00040000-55ec-3f44-8554-1348bd18c512	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55ec-3f44-cfbf-91487be9d2e7	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55ec-3f44-f174-a984fba09841	AD	AND	020	Andorra 	Andora	\N
00040000-55ec-3f44-cfdb-b4fcf7562c8f	AO	AGO	024	Angola 	Angola	\N
00040000-55ec-3f44-7dba-240961f2b5f6	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55ec-3f44-3e1e-4f070db9a915	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55ec-3f44-001e-92c34a1f3c3e	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55ec-3f44-e683-83c5d385c5e7	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55ec-3f44-2ec8-24707055cfb7	AM	ARM	051	Armenia 	Armenija	\N
00040000-55ec-3f44-ed7b-1b87da0ac82a	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55ec-3f44-a647-c7894ace2084	AU	AUS	036	Australia 	Avstralija	\N
00040000-55ec-3f44-49c7-c681ea16b42c	AT	AUT	040	Austria 	Avstrija	\N
00040000-55ec-3f44-13e9-a3f05d25ffdb	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55ec-3f44-fcdf-dca4c410dc48	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55ec-3f44-1a36-5ea860c5feb1	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55ec-3f44-39e5-4805d61dbacf	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55ec-3f44-f07f-78f9a104ce6a	BB	BRB	052	Barbados 	Barbados	\N
00040000-55ec-3f44-443d-1bde4ca27509	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55ec-3f44-ec6c-0d8cdcd3b4d7	BE	BEL	056	Belgium 	Belgija	\N
00040000-55ec-3f44-b0cd-13b03a6b74e3	BZ	BLZ	084	Belize 	Belize	\N
00040000-55ec-3f44-5b5d-421887db1654	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55ec-3f44-3b6e-6780ba731743	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55ec-3f44-2d92-5e5748c1fb2f	BT	BTN	064	Bhutan 	Butan	\N
00040000-55ec-3f44-6ffb-aa8e87beb7b5	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55ec-3f44-3067-e05d0f8b074e	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55ec-3f44-6c71-7b847c416081	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55ec-3f44-2d30-731f50c2ac30	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55ec-3f44-68b8-8e082f71ea49	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55ec-3f44-e6e3-5886d5d10aaf	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55ec-3f44-bf36-2f75e4ad126f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55ec-3f44-cf47-4aa7c21659ee	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55ec-3f44-20c1-e0c14a5dd55e	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55ec-3f44-9551-5dc84ed983b0	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55ec-3f44-6873-47b098956e92	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55ec-3f44-d3fa-9f1365f63bae	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55ec-3f44-2449-49d04e1be522	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55ec-3f44-918a-328a80617775	CA	CAN	124	Canada 	Kanada	\N
00040000-55ec-3f44-2e48-bd6b9a9f5839	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55ec-3f44-b000-9ad36abb6ade	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55ec-3f44-a5bd-df9a51ff9539	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55ec-3f44-4166-2b041d8af697	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55ec-3f44-0014-f715ab9b3165	CL	CHL	152	Chile 	Čile	\N
00040000-55ec-3f44-195f-4e9b69d174a8	CN	CHN	156	China 	Kitajska	\N
00040000-55ec-3f44-7a1b-b3d64e49da04	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55ec-3f44-2aa3-c872a4ecd771	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55ec-3f44-e315-6a89050a917f	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55ec-3f44-0c4a-98543f4a542e	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55ec-3f44-4eac-1a969c3cf873	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55ec-3f44-989a-fd6859eea04c	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55ec-3f44-0c1e-a46682a26209	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55ec-3f44-fa9e-a34dc37f40a1	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55ec-3f44-839a-25c673030f2d	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55ec-3f44-4151-e027c25c5033	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55ec-3f44-36c4-ea3f9ee13f2e	CU	CUB	192	Cuba 	Kuba	\N
00040000-55ec-3f44-bf7d-9b828fc8cc0a	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55ec-3f44-fc66-ec0e25082c75	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55ec-3f44-9bd1-3f5ae87d9dc0	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55ec-3f44-a4d7-8006c9d41f44	DK	DNK	208	Denmark 	Danska	\N
00040000-55ec-3f44-d0b6-d74384aac711	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55ec-3f44-9242-cb045f50740d	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55ec-3f44-bae7-3540144f1e9f	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55ec-3f44-3df9-df561db9e158	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55ec-3f44-1bc7-79274a61eb59	EG	EGY	818	Egypt 	Egipt	\N
00040000-55ec-3f44-efbc-c470b47965d3	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55ec-3f44-41cc-da7e0c248eab	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55ec-3f44-4fb5-3912523393aa	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55ec-3f44-13be-53f22f1dae21	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55ec-3f44-a0b1-9afda3e0c341	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55ec-3f44-7937-81cfdfbbe8bd	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55ec-3f44-eb06-7c5e326054db	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55ec-3f44-5811-6bded7b457b9	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55ec-3f44-a82d-9e7939924fdb	FI	FIN	246	Finland 	Finska	\N
00040000-55ec-3f44-1c10-f5bb5d441ac7	FR	FRA	250	France 	Francija	\N
00040000-55ec-3f44-501d-4ee2cde74a05	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55ec-3f44-175e-bbb591088486	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55ec-3f44-f420-313cc2aff43c	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55ec-3f44-2809-b5598dc79f38	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55ec-3f44-7f42-baaae7ac29dd	GA	GAB	266	Gabon 	Gabon	\N
00040000-55ec-3f44-92ed-1682b02e6dea	GM	GMB	270	Gambia 	Gambija	\N
00040000-55ec-3f44-84bc-90145a11e050	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55ec-3f44-02e6-a1cf7b9dbf10	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55ec-3f44-a50d-4a45fec0ae2f	GH	GHA	288	Ghana 	Gana	\N
00040000-55ec-3f44-8b8c-99f5475232e0	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55ec-3f44-faf2-e926bf50ec8f	GR	GRC	300	Greece 	Grčija	\N
00040000-55ec-3f44-28c9-3c831579cd32	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55ec-3f44-65ee-cacc3f22c9b8	GD	GRD	308	Grenada 	Grenada	\N
00040000-55ec-3f44-68cd-48eed63b351f	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55ec-3f44-3440-0125b58b8bd4	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55ec-3f44-a25e-c8dcb7c2cd2d	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55ec-3f44-92e5-a4feb65c6d8c	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55ec-3f44-8947-dc6b08917b7e	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55ec-3f44-ef03-e184ccbf1865	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55ec-3f44-978c-0ad2d00fec96	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55ec-3f44-3916-40db5100fac3	HT	HTI	332	Haiti 	Haiti	\N
00040000-55ec-3f44-3cc2-ada466ef7058	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55ec-3f44-99d7-d2e2dadc6a7f	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55ec-3f44-94d6-7e60b3a4efad	HN	HND	340	Honduras 	Honduras	\N
00040000-55ec-3f44-2db4-785b2c29ef65	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55ec-3f44-8fd7-46d1139f25a8	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55ec-3f44-c31b-42179184f3e6	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55ec-3f44-d53b-bda217efbabd	IN	IND	356	India 	Indija	\N
00040000-55ec-3f44-88ef-923741355cdd	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55ec-3f44-1986-1b1fa23daed5	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55ec-3f44-e79b-f0c157bb0b80	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55ec-3f44-8d82-1f9ac71295d8	IE	IRL	372	Ireland 	Irska	\N
00040000-55ec-3f44-ad02-21928bfecbb0	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55ec-3f44-aad7-36ed24d7e0cf	IL	ISR	376	Israel 	Izrael	\N
00040000-55ec-3f44-399e-7cefde4b4136	IT	ITA	380	Italy 	Italija	\N
00040000-55ec-3f44-6e73-80b1c9af0a18	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55ec-3f44-6a8a-9f7bebecfbe2	JP	JPN	392	Japan 	Japonska	\N
00040000-55ec-3f44-d46c-be34222a5bc8	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55ec-3f44-4f6c-2521feac1bbf	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55ec-3f44-8b7e-a68b2bce8865	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55ec-3f44-d292-169f715189f9	KE	KEN	404	Kenya 	Kenija	\N
00040000-55ec-3f44-5cd4-2a6b527e15b2	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55ec-3f44-0c06-a21d48f321cb	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55ec-3f44-8b20-caa9be2a21fe	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55ec-3f44-bfbb-dde6fdbd0cf8	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55ec-3f44-af75-ca9b18b04fdd	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55ec-3f44-791e-fcb67a7bad45	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55ec-3f44-4be2-32784fc674f2	LV	LVA	428	Latvia 	Latvija	\N
00040000-55ec-3f44-3744-fc8060522d54	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55ec-3f44-c2d8-4ec219983329	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55ec-3f44-366d-fbeb9da80e0f	LR	LBR	430	Liberia 	Liberija	\N
00040000-55ec-3f44-d444-01dff4d32227	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55ec-3f44-0f3d-8412f22b3331	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55ec-3f44-e0c5-d236b3f8539a	LT	LTU	440	Lithuania 	Litva	\N
00040000-55ec-3f44-065c-b289cd328dc1	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55ec-3f44-f23b-dbb1119c8296	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55ec-3f44-eb0b-f45ca85a3ee3	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55ec-3f44-286c-751162ac8d5d	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55ec-3f44-c867-99b4f937f75c	MW	MWI	454	Malawi 	Malavi	\N
00040000-55ec-3f44-3153-5c666f5675e7	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55ec-3f44-fd76-03e0cd9b232c	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55ec-3f44-43fc-f1de6089c881	ML	MLI	466	Mali 	Mali	\N
00040000-55ec-3f44-6bc8-3448f5d1755e	MT	MLT	470	Malta 	Malta	\N
00040000-55ec-3f44-7158-e367f6d42fbf	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55ec-3f44-9dbe-aeb6c86f1f6a	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55ec-3f44-7b8e-c2203aea4921	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55ec-3f44-5bba-bf25d2d0cb50	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55ec-3f44-deeb-2f15e6122df3	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55ec-3f44-a15d-1d80c6286b6f	MX	MEX	484	Mexico 	Mehika	\N
00040000-55ec-3f44-3c43-c3656bfc68fc	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55ec-3f44-8c06-c7227257435e	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55ec-3f44-2422-0dba7cf5b2d1	MC	MCO	492	Monaco 	Monako	\N
00040000-55ec-3f44-8624-a22a9182dd86	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55ec-3f44-6969-d27852f56e09	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55ec-3f44-bba5-8133eea44dab	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55ec-3f44-525a-bd99e0868f1c	MA	MAR	504	Morocco 	Maroko	\N
00040000-55ec-3f44-2773-abd8c8ef5823	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55ec-3f44-902a-df22e8e7be7e	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55ec-3f44-35eb-3d12922d7421	NA	NAM	516	Namibia 	Namibija	\N
00040000-55ec-3f44-1052-46e1ee23038b	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55ec-3f44-4091-f473aa434db5	NP	NPL	524	Nepal 	Nepal	\N
00040000-55ec-3f44-1e44-caadcc4be2ab	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55ec-3f44-979e-e811150366ab	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55ec-3f44-6763-64820e78cfbd	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55ec-3f44-142f-01044ae5e960	NE	NER	562	Niger 	Niger 	\N
00040000-55ec-3f44-3b0b-754944cb283a	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55ec-3f44-d4bb-296cc4c3d7c7	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55ec-3f44-4b49-010ad24afc25	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55ec-3f44-9e77-ef48407ec85b	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55ec-3f44-f9fe-9428764762a1	NO	NOR	578	Norway 	Norveška	\N
00040000-55ec-3f44-b2fc-2ac20521ca86	OM	OMN	512	Oman 	Oman	\N
00040000-55ec-3f44-cd67-bc08961474fc	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55ec-3f44-b7f3-ef1d701c77c4	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55ec-3f44-c494-03b2f7466ba6	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55ec-3f44-fa11-12a1bcd1013e	PA	PAN	591	Panama 	Panama	\N
00040000-55ec-3f44-76fb-be3ba84670dc	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55ec-3f44-e764-c88efb98501b	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55ec-3f44-dea0-579196d8cec1	PE	PER	604	Peru 	Peru	\N
00040000-55ec-3f44-7aa9-5de575415dc6	PH	PHL	608	Philippines 	Filipini	\N
00040000-55ec-3f44-8ddb-eadb334de306	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55ec-3f44-5d46-c9e647fdf7dd	PL	POL	616	Poland 	Poljska	\N
00040000-55ec-3f44-a7d5-914a330cd09c	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55ec-3f44-4379-1c294d6ea162	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55ec-3f44-c771-2d3dcea467aa	QA	QAT	634	Qatar 	Katar	\N
00040000-55ec-3f44-6cf7-10027fa9b74e	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55ec-3f44-3ded-674abe1b830a	RO	ROU	642	Romania 	Romunija	\N
00040000-55ec-3f44-7242-c6be464c9e60	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55ec-3f44-aa1a-0a94294c568a	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55ec-3f44-825f-c425ed77f689	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55ec-3f44-c032-bced6193a0c2	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55ec-3f44-8a88-ac951f187aab	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55ec-3f44-731e-364968a03c3a	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55ec-3f44-e8ab-eb5e313d4564	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55ec-3f44-e3ff-be71cecf2020	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55ec-3f44-0c0c-3f8e3c61b07b	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55ec-3f44-eb2e-b9fc46082e91	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55ec-3f44-7393-1d31d1020cde	SM	SMR	674	San Marino 	San Marino	\N
00040000-55ec-3f44-5f7c-af3333755c84	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55ec-3f44-1536-426d9e85e08f	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55ec-3f44-4a56-b5f40969ee2e	SN	SEN	686	Senegal 	Senegal	\N
00040000-55ec-3f44-acd4-d4bd0c4abf5c	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55ec-3f44-f292-37ce524447f8	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55ec-3f44-6b04-9c7515b365c9	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55ec-3f44-3de6-590d37c3ce88	SG	SGP	702	Singapore 	Singapur	\N
00040000-55ec-3f44-217b-c18ff4786d86	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55ec-3f44-0f54-036216502a22	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55ec-3f44-b17b-0431b0b30b1a	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55ec-3f44-57fa-80fd9bf8d2ea	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55ec-3f44-0603-71c5c47cb9cb	SO	SOM	706	Somalia 	Somalija	\N
00040000-55ec-3f44-f16e-99e2dab38949	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55ec-3f44-62c6-b65841ddd55a	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55ec-3f44-dcb6-f01bc9bb6415	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55ec-3f44-f1b7-081e50fde783	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55ec-3f44-f2ed-b3d38ce17dab	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55ec-3f44-c99c-5aaee103b5a6	SD	SDN	729	Sudan 	Sudan	\N
00040000-55ec-3f44-05f3-84dc80c25b9c	SR	SUR	740	Suriname 	Surinam	\N
00040000-55ec-3f44-74d4-f3b43bd68bb1	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55ec-3f44-3ee6-e3627c328bce	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55ec-3f44-3be0-09e13687851b	SE	SWE	752	Sweden 	Švedska	\N
00040000-55ec-3f44-1871-0434da6bed6b	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55ec-3f44-c821-7ea60d37f1b9	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55ec-3f44-9116-3b76046a0dc7	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55ec-3f44-a4a5-ed960217a32c	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55ec-3f44-8492-406fe6c7010e	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55ec-3f44-6d2c-d746c8296e98	TH	THA	764	Thailand 	Tajska	\N
00040000-55ec-3f44-f5be-09ab541a4859	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55ec-3f44-f068-02bdfffea831	TG	TGO	768	Togo 	Togo	\N
00040000-55ec-3f44-063e-bb8b61889e85	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55ec-3f44-7e60-39131bff2062	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55ec-3f44-3108-3b6309df0400	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55ec-3f44-598c-38782170db24	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55ec-3f44-cbcc-29a6cda80c4f	TR	TUR	792	Turkey 	Turčija	\N
00040000-55ec-3f44-1bbe-69b7b359dfcd	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55ec-3f44-159f-ae683111aaf1	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55ec-3f44-cf8e-bb62b97aedf8	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55ec-3f44-5bb7-41806b7fd95c	UG	UGA	800	Uganda 	Uganda	\N
00040000-55ec-3f44-7224-d496e36db8db	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55ec-3f44-6f1a-5fd604af84f1	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55ec-3f44-85c8-fcb63ed1d34e	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55ec-3f44-54b9-3bae596f3447	US	USA	840	United States 	Združene države Amerike	\N
00040000-55ec-3f44-3ca1-2f1f359235c7	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55ec-3f44-bbde-f8421ed77652	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55ec-3f44-44be-233d94eb7b1d	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55ec-3f44-52e1-5b52e6ce3939	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55ec-3f44-c42d-0fc67b481288	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55ec-3f44-0607-ec1aff34feab	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55ec-3f44-45ac-5b09187db5d8	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55ec-3f44-03d0-0c3519d383b8	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55ec-3f44-bbfb-57c27f0c1e4c	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55ec-3f44-120b-69344f6bcc91	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55ec-3f44-3b71-f8e5b7e466fc	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55ec-3f44-9866-201f206f708c	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55ec-3f44-2ed6-f083eb330466	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3241 (class 0 OID 1161389)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55ec-3f4f-88ae-4d94ff2525b7	000e0000-55ec-3f4e-1d01-304c297b2ab1	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ec-3f45-4569-d8078dea7697	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55ec-3f4f-8b0e-2769f187d094	000e0000-55ec-3f4e-734f-a8a17e0ca15e	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ec-3f45-5176-1fbaf1c7dbed	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55ec-3f4f-e7e6-6582b1845d8d	000e0000-55ec-3f4e-ab90-1cda02727dc8	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ec-3f45-4569-d8078dea7697	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55ec-3f4f-25be-671fdb02c15e	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55ec-3f4f-c20b-3517e92225fc	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3229 (class 0 OID 1161241)
-- Dependencies: 217
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55ec-3f4f-4e23-12f79c468d8f	000e0000-55ec-3f4e-734f-a8a17e0ca15e	000c0000-55ec-3f4f-5842-386f23a2c0eb	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55ec-3f45-bcf5-73246233904d
000d0000-55ec-3f4f-b231-8115ee7c8860	000e0000-55ec-3f4e-734f-a8a17e0ca15e	000c0000-55ec-3f4f-7c9c-85aa429409d3	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55ec-3f45-5e96-d42979de0d0e
000d0000-55ec-3f4f-f824-573a48910abc	000e0000-55ec-3f4e-734f-a8a17e0ca15e	000c0000-55ec-3f4f-1efb-bb3f954dbd12	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55ec-3f45-b0fa-e665c2dd193f
000d0000-55ec-3f4f-dbf6-970c908e260a	000e0000-55ec-3f4e-734f-a8a17e0ca15e	000c0000-55ec-3f4f-22b7-f52d613fcf90	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55ec-3f45-e984-5452ea9b3bcb
000d0000-55ec-3f4f-df39-6dd50afa60c6	000e0000-55ec-3f4e-734f-a8a17e0ca15e	000c0000-55ec-3f4f-2bcf-f91421043d9d	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55ec-3f45-e984-5452ea9b3bcb
000d0000-55ec-3f4f-003c-842577372a1c	000e0000-55ec-3f4e-734f-a8a17e0ca15e	000c0000-55ec-3f4f-1f75-5d12df288388	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55ec-3f45-bcf5-73246233904d
000d0000-55ec-3f4f-dfe3-650fc19f091f	000e0000-55ec-3f4e-734f-a8a17e0ca15e	000c0000-55ec-3f4f-8fec-1ca5faed671b	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55ec-3f45-bcf5-73246233904d
000d0000-55ec-3f4f-969a-4327df68e00f	000e0000-55ec-3f4e-734f-a8a17e0ca15e	000c0000-55ec-3f4f-946f-3231ac224da0	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55ec-3f45-e976-258b190398cc
\.


--
-- TOC entry 3207 (class 0 OID 1161033)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 1160878)
-- Dependencies: 184
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55ec-3f4f-b92b-5afab1e37cdd	00080000-55ec-3f4e-a90e-67d778c55a6e	00090000-55ec-3f4e-b1df-84e3de7851dc	AK		
\.


--
-- TOC entry 3213 (class 0 OID 1161089)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3248 (class 0 OID 1161541)
-- Dependencies: 236
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3249 (class 0 OID 1161553)
-- Dependencies: 237
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3250 (class 0 OID 1161560)
-- Dependencies: 238
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3214 (class 0 OID 1161095)
-- Dependencies: 202
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 1160890)
-- Dependencies: 185
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55ec-3f44-1506-db1032fdd540	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55ec-3f44-4430-2f973eec5644	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55ec-3f44-4c2c-0ae87fbd432e	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55ec-3f44-15aa-2ab35aff8efd	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55ec-3f44-aa08-663c91f12175	dogodek.status	array	a:7:{i:100;a:1:{s:5:"label";s:11:"Dolgoročno";}i:200;a:1:{s:5:"label";s:9:"Planirano";}i:300;a:1:{s:5:"label";s:8:"Fiksiran";}i:400;a:1:{s:5:"label";s:17:"Potrjen - interno";}i:500;a:1:{s:5:"label";s:15:"Potrjen - javno";}i:600;a:1:{s:5:"label";s:10:"Zaključen";}i:700;a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55ec-3f44-0a94-fd69ec491b45	dogodek.razred	array	a:5:{i:100;a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}i:200;a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}i:300;a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}i:400;a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}i:500;a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55ec-3f44-e87d-d5ae84878518	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55ec-3f44-4419-d5cc60818f3b	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55ec-3f44-ac11-7aed778b4b94	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55ec-3f44-f7e3-1d1564192555	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55ec-3f44-4fcb-1fc15afe35a8	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55ec-3f44-6944-f5f6d9d2d53f	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55ec-3f44-1315-1dc8adaedea5	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55ec-3f44-15dc-07f16ae78c46	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55ec-3f4e-b4e2-de295cb9957a	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55ec-3f4e-6d1f-1582ecc4ee3d	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55ec-3f4e-f32f-aa7ed2cd0f82	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55ec-3f4e-344e-ecdd3e2518cc	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55ec-3f4e-1874-bb0294480376	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 3198 (class 0 OID 1160902)
-- Dependencies: 186
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55ec-3f4e-8e36-7d4adcb31062	00000000-55ec-3f4e-b4e2-de295cb9957a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55ec-3f4e-0a61-911780cac317	00000000-55ec-3f4e-b4e2-de295cb9957a	00010000-55ec-3f44-0964-3273bf93b64d	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55ec-3f4e-d10c-23b683c27236	00000000-55ec-3f4e-6d1f-1582ecc4ee3d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3199 (class 0 OID 1160913)
-- Dependencies: 187
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55ec-3f4e-f05d-4c4fd0c47814	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55ec-3f4e-7e6f-2638e0b8bdd3	00010000-55ec-3f4e-b4e6-87e917425a96	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55ec-3f4e-016c-35c5b29d832a	00010000-55ec-3f4e-dd49-cc3b82a4522e	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55ec-3f4e-0959-c39f1b3ea9d1	00010000-55ec-3f4e-9e35-589524b783e1	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55ec-3f4e-c771-b4068cc8f5da	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55ec-3f4e-3b7f-469f1ae293e4	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55ec-3f4e-b424-4902db12b737	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55ec-3f4e-d60c-29b904465f75	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55ec-3f4e-b1df-84e3de7851dc	00010000-55ec-3f4e-ec0c-a31b5062409c	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55ec-3f4e-7ea6-9ca0ce6d1c80	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55ec-3f4e-5a70-637c411a04a7	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55ec-3f4e-c630-5d8c9a519d14	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55ec-3f4e-dcf7-5691fcf83b6c	00010000-55ec-3f4e-56c3-dbcf5cb0b3e6	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 3187 (class 0 OID 1160795)
-- Dependencies: 175
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55ec-3f44-1b71-b893532aceed	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55ec-3f44-fd41-655d19edc818	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55ec-3f44-9f36-e2f75cd4a488	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55ec-3f44-6aa9-f0a5c2e5bb2a	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55ec-3f44-d476-52c16d3ec3b3	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55ec-3f44-2c50-9ce8887b5646	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55ec-3f44-1f86-1540ab5f81ec	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55ec-3f44-d96a-728915c154d2	Abonma-read	Abonma - branje	f
00030000-55ec-3f44-e11a-1ed2426efa42	Abonma-write	Abonma - spreminjanje	f
00030000-55ec-3f44-4002-9227ee9bba72	Alternacija-read	Alternacija - branje	f
00030000-55ec-3f44-0839-9c77b39d51f6	Alternacija-write	Alternacija - spreminjanje	f
00030000-55ec-3f44-a3ed-33a5c1f33dd1	Arhivalija-read	Arhivalija - branje	f
00030000-55ec-3f44-4873-ab72f0452801	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55ec-3f44-3966-eb76f310cc4f	Besedilo-read	Besedilo - branje	f
00030000-55ec-3f44-6ea8-6f1f9a7c492c	Besedilo-write	Besedilo - spreminjanje	f
00030000-55ec-3f44-b305-08e7dde8cda6	DogodekIzven-read	DogodekIzven - branje	f
00030000-55ec-3f44-c1a9-90ecf615eeef	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55ec-3f44-e12d-a1c13d38b883	Dogodek-read	Dogodek - branje	f
00030000-55ec-3f44-a2b4-acd4eb1f3b4f	Dogodek-write	Dogodek - spreminjanje	f
00030000-55ec-3f44-e2e9-f3151d3c7285	DrugiVir-read	DrugiVir - branje	f
00030000-55ec-3f44-e3ea-79c0bb149783	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55ec-3f44-4a4f-04884b347fca	Drzava-read	Drzava - branje	f
00030000-55ec-3f44-5531-bca454eabfa2	Drzava-write	Drzava - spreminjanje	f
00030000-55ec-3f44-cb9f-5766ee3bc1e0	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55ec-3f44-6b42-71285c2eb549	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55ec-3f44-336b-788162a46c51	Funkcija-read	Funkcija - branje	f
00030000-55ec-3f44-cbcb-dd98d037bf28	Funkcija-write	Funkcija - spreminjanje	f
00030000-55ec-3f44-105d-f7a4d47306e9	Gostovanje-read	Gostovanje - branje	f
00030000-55ec-3f44-e3b2-bf605b678392	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55ec-3f44-5966-0067c7091e67	Gostujoca-read	Gostujoca - branje	f
00030000-55ec-3f44-90db-d37424fe0149	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55ec-3f44-dbd6-9688c10538ef	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55ec-3f44-5c3c-df14c846748a	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55ec-3f44-c895-9276b9f400d7	Kupec-read	Kupec - branje	f
00030000-55ec-3f44-6f21-215c7e645570	Kupec-write	Kupec - spreminjanje	f
00030000-55ec-3f44-f42a-e0617e22ee8f	NacinPlacina-read	NacinPlacina - branje	f
00030000-55ec-3f44-0f77-2b238929d285	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55ec-3f44-109e-06dbec2a7972	Option-read	Option - branje	f
00030000-55ec-3f44-a46f-fc0c39940454	Option-write	Option - spreminjanje	f
00030000-55ec-3f44-5b59-1e6644f672d4	OptionValue-read	OptionValue - branje	f
00030000-55ec-3f44-14a2-e12e2528718a	OptionValue-write	OptionValue - spreminjanje	f
00030000-55ec-3f44-3b8e-cf60fa45cbb6	Oseba-read	Oseba - branje	f
00030000-55ec-3f44-e37a-b975c5dde761	Oseba-write	Oseba - spreminjanje	f
00030000-55ec-3f44-90a9-de0c827516d7	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55ec-3f44-c089-013ec5b56a20	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55ec-3f44-cb71-0016e6656dfa	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55ec-3f44-7b78-8c5751ac004d	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55ec-3f44-b58d-d336e2520b02	Pogodba-read	Pogodba - branje	f
00030000-55ec-3f44-e42e-a9d19d9ea3f8	Pogodba-write	Pogodba - spreminjanje	f
00030000-55ec-3f44-b959-183447fee793	Popa-read	Popa - branje	f
00030000-55ec-3f44-a2f8-765831b80d11	Popa-write	Popa - spreminjanje	f
00030000-55ec-3f44-63db-04e5afc0532e	Posta-read	Posta - branje	f
00030000-55ec-3f44-dfc2-ca71af0a4505	Posta-write	Posta - spreminjanje	f
00030000-55ec-3f44-65cc-ceefb924d985	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55ec-3f44-8558-b8a00b0131e3	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55ec-3f44-ccbb-a4ebbf11f41f	PostniNaslov-read	PostniNaslov - branje	f
00030000-55ec-3f44-265f-3d875f856ad7	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55ec-3f44-92a5-3dbe84ea790f	Predstava-read	Predstava - branje	f
00030000-55ec-3f44-95f1-3e9da24397a7	Predstava-write	Predstava - spreminjanje	f
00030000-55ec-3f44-5617-9a27e5161bd0	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55ec-3f44-bec9-c54b0788ba21	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55ec-3f44-0309-6020a1217ea4	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55ec-3f44-f02d-c1bc15adf2b5	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55ec-3f44-e2ad-c292fb892722	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55ec-3f44-2dbd-ea4fad2f5fea	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55ec-3f44-e3a9-9f24207c248d	ProgramDela-read	ProgramDela - branje	f
00030000-55ec-3f44-b3ae-b580badb4553	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55ec-3f44-b093-dc18e2c00c9c	ProgramFestival-read	ProgramFestival - branje	f
00030000-55ec-3f44-2972-7c007352df50	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55ec-3f44-782d-f02bea7d0c93	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55ec-3f44-5954-7f63b2378620	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55ec-3f44-6b9f-de9fbdef2e70	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55ec-3f44-ce3e-f76845e0339e	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55ec-3f44-0405-cbe80b25d3e7	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55ec-3f44-a587-0231314e59b7	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55ec-3f44-9035-59ceeb8acae3	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55ec-3f44-0533-dd25e5cb86de	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55ec-3f44-7178-e282f3b3c7da	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55ec-3f44-16cd-e3eab93db4a9	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55ec-3f44-fc73-79e9bd135d20	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55ec-3f44-ff5c-86ad8929ac5c	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55ec-3f44-a853-31143ddc1c60	ProgramRazno-read	ProgramRazno - branje	f
00030000-55ec-3f44-c842-e480650d28ac	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55ec-3f44-b808-b155a44ae235	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55ec-3f44-4bd8-f1c765605efc	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55ec-3f44-d741-e54259ec5680	Prostor-read	Prostor - branje	f
00030000-55ec-3f44-985c-6efc27320f03	Prostor-write	Prostor - spreminjanje	f
00030000-55ec-3f44-ef95-e19fefce699e	Racun-read	Racun - branje	f
00030000-55ec-3f44-6bc5-d3fda430e1a8	Racun-write	Racun - spreminjanje	f
00030000-55ec-3f44-69d7-a218352e6d69	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55ec-3f44-9a3e-fa5ad152b0ab	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55ec-3f44-405d-5333e49cf2b5	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55ec-3f44-4c07-438daf8bad6f	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55ec-3f44-65ff-311d256b79ae	Rekvizit-read	Rekvizit - branje	f
00030000-55ec-3f44-a018-553a8358a400	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55ec-3f44-76d9-b7fc6f379354	Revizija-read	Revizija - branje	f
00030000-55ec-3f44-2926-61b729fbbf76	Revizija-write	Revizija - spreminjanje	f
00030000-55ec-3f44-49d9-ff724426ba1f	Rezervacija-read	Rezervacija - branje	f
00030000-55ec-3f44-9f33-9faeb9ae7b9f	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55ec-3f44-eceb-96d58ea69294	SedezniRed-read	SedezniRed - branje	f
00030000-55ec-3f44-a452-5cb5ccd552cd	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55ec-3f44-f262-f2981f9cbf01	Sedez-read	Sedez - branje	f
00030000-55ec-3f44-62be-ce533c16f4f8	Sedez-write	Sedez - spreminjanje	f
00030000-55ec-3f44-9ae6-35bea8a670f5	Sezona-read	Sezona - branje	f
00030000-55ec-3f44-f8fd-e509dfcd5003	Sezona-write	Sezona - spreminjanje	f
00030000-55ec-3f44-eff4-d531a940b243	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55ec-3f44-6d75-8875077fbd5d	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55ec-3f44-24c6-3ad63e3d25c6	Stevilcenje-read	Stevilcenje - branje	f
00030000-55ec-3f44-4f80-2839bd03b81c	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55ec-3f44-16c9-cfdda1b5915e	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55ec-3f44-f291-ecce7917e5bc	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55ec-3f44-5a45-09f2a6b7e027	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55ec-3f44-823d-2ad200d685d2	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55ec-3f44-7be3-e83743b23f19	Telefonska-read	Telefonska - branje	f
00030000-55ec-3f44-7a48-784797b5efcc	Telefonska-write	Telefonska - spreminjanje	f
00030000-55ec-3f44-de6a-13f0930436d1	TerminStoritve-read	TerminStoritve - branje	f
00030000-55ec-3f44-2365-5102a80c1c1e	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55ec-3f44-d029-0a2085d6b390	TipFunkcije-read	TipFunkcije - branje	f
00030000-55ec-3f44-58e8-aa89f0b4bd19	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55ec-3f44-1720-6715aa229c03	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55ec-3f44-fcd3-f95f3323d661	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55ec-3f44-b663-cfef34583b9c	Trr-read	Trr - branje	f
00030000-55ec-3f44-2a8b-af1544fd857c	Trr-write	Trr - spreminjanje	f
00030000-55ec-3f44-bc19-a24e9c9e5763	Uprizoritev-read	Uprizoritev - branje	f
00030000-55ec-3f44-2183-8d6d8da44c1f	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55ec-3f44-cea9-775e76310312	Vaja-read	Vaja - branje	f
00030000-55ec-3f44-ff1a-5a9c40a9d16a	Vaja-write	Vaja - spreminjanje	f
00030000-55ec-3f44-edf5-724da1b9e010	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55ec-3f44-2477-c22154126489	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55ec-3f44-c5c1-1f4bcc803c83	VrstaStroska-read	VrstaStroska - branje	f
00030000-55ec-3f44-63e0-8416e0815de7	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55ec-3f44-10f2-294fa73bab99	Zaposlitev-read	Zaposlitev - branje	f
00030000-55ec-3f44-e0a6-a1741b4c8898	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55ec-3f44-502d-d8779a980e0b	Zasedenost-read	Zasedenost - branje	f
00030000-55ec-3f44-fe60-392b7ec5e6b1	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55ec-3f44-56e5-7de41f811c8d	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55ec-3f44-9e3b-08b1ba7ab2a7	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55ec-3f44-937e-228072b50cd9	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55ec-3f44-658b-99611ea86e8a	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55ec-3f44-fda3-7ea2e60fb44d	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55ec-3f44-feab-9719652b348c	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55ec-3f44-bf11-e4ca38906f94	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55ec-3f44-539e-c474032127af	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55ec-3f44-95cb-61077169a1d0	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55ec-3f44-f0cc-b1def02a7188	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55ec-3f44-f680-7bb2e96f573a	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55ec-3f44-c3b5-b4b16c0554fa	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55ec-3f44-7280-ed93d0252a73	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55ec-3f44-28ed-9305765ea026	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55ec-3f44-d8b8-53fb2f97a38a	Datoteka-write	Datoteka - spreminjanje	f
00030000-55ec-3f44-8f48-ba82ed8ae500	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3191 (class 0 OID 1160825)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55ec-3f44-1ac8-f925ec106cb9	00030000-55ec-3f44-fd41-655d19edc818
00020000-55ec-3f44-5551-4c9ae7929c98	00030000-55ec-3f44-4a4f-04884b347fca
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-d96a-728915c154d2
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-e11a-1ed2426efa42
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-4002-9227ee9bba72
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-0839-9c77b39d51f6
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-a3ed-33a5c1f33dd1
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-e12d-a1c13d38b883
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-6aa9-f0a5c2e5bb2a
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-a2b4-acd4eb1f3b4f
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-4a4f-04884b347fca
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-5531-bca454eabfa2
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-336b-788162a46c51
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-cbcb-dd98d037bf28
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-105d-f7a4d47306e9
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-e3b2-bf605b678392
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-5966-0067c7091e67
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-90db-d37424fe0149
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-dbd6-9688c10538ef
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-5c3c-df14c846748a
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-109e-06dbec2a7972
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-5b59-1e6644f672d4
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-3b8e-cf60fa45cbb6
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-e37a-b975c5dde761
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-b959-183447fee793
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-a2f8-765831b80d11
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-63db-04e5afc0532e
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-dfc2-ca71af0a4505
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-ccbb-a4ebbf11f41f
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-265f-3d875f856ad7
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-92a5-3dbe84ea790f
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-95f1-3e9da24397a7
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-e2ad-c292fb892722
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-2dbd-ea4fad2f5fea
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-d741-e54259ec5680
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-985c-6efc27320f03
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-405d-5333e49cf2b5
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-4c07-438daf8bad6f
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-65ff-311d256b79ae
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-a018-553a8358a400
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-9ae6-35bea8a670f5
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-f8fd-e509dfcd5003
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-d029-0a2085d6b390
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-bc19-a24e9c9e5763
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-2183-8d6d8da44c1f
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-cea9-775e76310312
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-ff1a-5a9c40a9d16a
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-502d-d8779a980e0b
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-fe60-392b7ec5e6b1
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-56e5-7de41f811c8d
00020000-55ec-3f44-bbaf-e5602f198fb7	00030000-55ec-3f44-937e-228072b50cd9
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-d96a-728915c154d2
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-a3ed-33a5c1f33dd1
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-e12d-a1c13d38b883
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-4a4f-04884b347fca
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-105d-f7a4d47306e9
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-5966-0067c7091e67
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-dbd6-9688c10538ef
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-5c3c-df14c846748a
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-109e-06dbec2a7972
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-5b59-1e6644f672d4
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-3b8e-cf60fa45cbb6
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-e37a-b975c5dde761
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-b959-183447fee793
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-63db-04e5afc0532e
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-ccbb-a4ebbf11f41f
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-265f-3d875f856ad7
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-92a5-3dbe84ea790f
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-d741-e54259ec5680
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-405d-5333e49cf2b5
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-65ff-311d256b79ae
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-9ae6-35bea8a670f5
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-7be3-e83743b23f19
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-7a48-784797b5efcc
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-b663-cfef34583b9c
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-2a8b-af1544fd857c
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-10f2-294fa73bab99
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-e0a6-a1741b4c8898
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-56e5-7de41f811c8d
00020000-55ec-3f44-ec7d-02b88e44d47c	00030000-55ec-3f44-937e-228072b50cd9
00020000-55ec-3f44-3b06-6c7a482020b1	00030000-55ec-3f44-d96a-728915c154d2
00020000-55ec-3f44-3b06-6c7a482020b1	00030000-55ec-3f44-4002-9227ee9bba72
00020000-55ec-3f44-3b06-6c7a482020b1	00030000-55ec-3f44-a3ed-33a5c1f33dd1
00020000-55ec-3f44-3b06-6c7a482020b1	00030000-55ec-3f44-4873-ab72f0452801
00020000-55ec-3f44-3b06-6c7a482020b1	00030000-55ec-3f44-3966-eb76f310cc4f
00020000-55ec-3f44-3b06-6c7a482020b1	00030000-55ec-3f44-b305-08e7dde8cda6
00020000-55ec-3f44-3b06-6c7a482020b1	00030000-55ec-3f44-e12d-a1c13d38b883
00020000-55ec-3f44-3b06-6c7a482020b1	00030000-55ec-3f44-4a4f-04884b347fca
00020000-55ec-3f44-3b06-6c7a482020b1	00030000-55ec-3f44-336b-788162a46c51
00020000-55ec-3f44-3b06-6c7a482020b1	00030000-55ec-3f44-105d-f7a4d47306e9
00020000-55ec-3f44-3b06-6c7a482020b1	00030000-55ec-3f44-5966-0067c7091e67
00020000-55ec-3f44-3b06-6c7a482020b1	00030000-55ec-3f44-dbd6-9688c10538ef
00020000-55ec-3f44-3b06-6c7a482020b1	00030000-55ec-3f44-109e-06dbec2a7972
00020000-55ec-3f44-3b06-6c7a482020b1	00030000-55ec-3f44-5b59-1e6644f672d4
00020000-55ec-3f44-3b06-6c7a482020b1	00030000-55ec-3f44-3b8e-cf60fa45cbb6
00020000-55ec-3f44-3b06-6c7a482020b1	00030000-55ec-3f44-b959-183447fee793
00020000-55ec-3f44-3b06-6c7a482020b1	00030000-55ec-3f44-63db-04e5afc0532e
00020000-55ec-3f44-3b06-6c7a482020b1	00030000-55ec-3f44-92a5-3dbe84ea790f
00020000-55ec-3f44-3b06-6c7a482020b1	00030000-55ec-3f44-e2ad-c292fb892722
00020000-55ec-3f44-3b06-6c7a482020b1	00030000-55ec-3f44-d741-e54259ec5680
00020000-55ec-3f44-3b06-6c7a482020b1	00030000-55ec-3f44-405d-5333e49cf2b5
00020000-55ec-3f44-3b06-6c7a482020b1	00030000-55ec-3f44-65ff-311d256b79ae
00020000-55ec-3f44-3b06-6c7a482020b1	00030000-55ec-3f44-9ae6-35bea8a670f5
00020000-55ec-3f44-3b06-6c7a482020b1	00030000-55ec-3f44-d029-0a2085d6b390
00020000-55ec-3f44-3b06-6c7a482020b1	00030000-55ec-3f44-cea9-775e76310312
00020000-55ec-3f44-3b06-6c7a482020b1	00030000-55ec-3f44-502d-d8779a980e0b
00020000-55ec-3f44-3b06-6c7a482020b1	00030000-55ec-3f44-56e5-7de41f811c8d
00020000-55ec-3f44-3b06-6c7a482020b1	00030000-55ec-3f44-937e-228072b50cd9
00020000-55ec-3f44-d975-6048781b1594	00030000-55ec-3f44-d96a-728915c154d2
00020000-55ec-3f44-d975-6048781b1594	00030000-55ec-3f44-e11a-1ed2426efa42
00020000-55ec-3f44-d975-6048781b1594	00030000-55ec-3f44-0839-9c77b39d51f6
00020000-55ec-3f44-d975-6048781b1594	00030000-55ec-3f44-a3ed-33a5c1f33dd1
00020000-55ec-3f44-d975-6048781b1594	00030000-55ec-3f44-e12d-a1c13d38b883
00020000-55ec-3f44-d975-6048781b1594	00030000-55ec-3f44-4a4f-04884b347fca
00020000-55ec-3f44-d975-6048781b1594	00030000-55ec-3f44-105d-f7a4d47306e9
00020000-55ec-3f44-d975-6048781b1594	00030000-55ec-3f44-5966-0067c7091e67
00020000-55ec-3f44-d975-6048781b1594	00030000-55ec-3f44-109e-06dbec2a7972
00020000-55ec-3f44-d975-6048781b1594	00030000-55ec-3f44-5b59-1e6644f672d4
00020000-55ec-3f44-d975-6048781b1594	00030000-55ec-3f44-b959-183447fee793
00020000-55ec-3f44-d975-6048781b1594	00030000-55ec-3f44-63db-04e5afc0532e
00020000-55ec-3f44-d975-6048781b1594	00030000-55ec-3f44-92a5-3dbe84ea790f
00020000-55ec-3f44-d975-6048781b1594	00030000-55ec-3f44-d741-e54259ec5680
00020000-55ec-3f44-d975-6048781b1594	00030000-55ec-3f44-405d-5333e49cf2b5
00020000-55ec-3f44-d975-6048781b1594	00030000-55ec-3f44-65ff-311d256b79ae
00020000-55ec-3f44-d975-6048781b1594	00030000-55ec-3f44-9ae6-35bea8a670f5
00020000-55ec-3f44-d975-6048781b1594	00030000-55ec-3f44-d029-0a2085d6b390
00020000-55ec-3f44-d975-6048781b1594	00030000-55ec-3f44-56e5-7de41f811c8d
00020000-55ec-3f44-d975-6048781b1594	00030000-55ec-3f44-937e-228072b50cd9
00020000-55ec-3f44-8236-8a25e2ca830a	00030000-55ec-3f44-d96a-728915c154d2
00020000-55ec-3f44-8236-8a25e2ca830a	00030000-55ec-3f44-a3ed-33a5c1f33dd1
00020000-55ec-3f44-8236-8a25e2ca830a	00030000-55ec-3f44-e12d-a1c13d38b883
00020000-55ec-3f44-8236-8a25e2ca830a	00030000-55ec-3f44-4a4f-04884b347fca
00020000-55ec-3f44-8236-8a25e2ca830a	00030000-55ec-3f44-105d-f7a4d47306e9
00020000-55ec-3f44-8236-8a25e2ca830a	00030000-55ec-3f44-5966-0067c7091e67
00020000-55ec-3f44-8236-8a25e2ca830a	00030000-55ec-3f44-109e-06dbec2a7972
00020000-55ec-3f44-8236-8a25e2ca830a	00030000-55ec-3f44-5b59-1e6644f672d4
00020000-55ec-3f44-8236-8a25e2ca830a	00030000-55ec-3f44-b959-183447fee793
00020000-55ec-3f44-8236-8a25e2ca830a	00030000-55ec-3f44-63db-04e5afc0532e
00020000-55ec-3f44-8236-8a25e2ca830a	00030000-55ec-3f44-92a5-3dbe84ea790f
00020000-55ec-3f44-8236-8a25e2ca830a	00030000-55ec-3f44-d741-e54259ec5680
00020000-55ec-3f44-8236-8a25e2ca830a	00030000-55ec-3f44-405d-5333e49cf2b5
00020000-55ec-3f44-8236-8a25e2ca830a	00030000-55ec-3f44-65ff-311d256b79ae
00020000-55ec-3f44-8236-8a25e2ca830a	00030000-55ec-3f44-9ae6-35bea8a670f5
00020000-55ec-3f44-8236-8a25e2ca830a	00030000-55ec-3f44-de6a-13f0930436d1
00020000-55ec-3f44-8236-8a25e2ca830a	00030000-55ec-3f44-9f36-e2f75cd4a488
00020000-55ec-3f44-8236-8a25e2ca830a	00030000-55ec-3f44-d029-0a2085d6b390
00020000-55ec-3f44-8236-8a25e2ca830a	00030000-55ec-3f44-56e5-7de41f811c8d
00020000-55ec-3f44-8236-8a25e2ca830a	00030000-55ec-3f44-937e-228072b50cd9
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-1b71-b893532aceed
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-fd41-655d19edc818
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-9f36-e2f75cd4a488
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-6aa9-f0a5c2e5bb2a
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-d476-52c16d3ec3b3
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-2c50-9ce8887b5646
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-1f86-1540ab5f81ec
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-d96a-728915c154d2
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-e11a-1ed2426efa42
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-4002-9227ee9bba72
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-0839-9c77b39d51f6
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-a3ed-33a5c1f33dd1
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-4873-ab72f0452801
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-3966-eb76f310cc4f
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-6ea8-6f1f9a7c492c
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-b305-08e7dde8cda6
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-c1a9-90ecf615eeef
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-e12d-a1c13d38b883
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-a2b4-acd4eb1f3b4f
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-4a4f-04884b347fca
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-5531-bca454eabfa2
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-e2e9-f3151d3c7285
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-e3ea-79c0bb149783
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-cb9f-5766ee3bc1e0
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-6b42-71285c2eb549
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-336b-788162a46c51
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-cbcb-dd98d037bf28
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-105d-f7a4d47306e9
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-e3b2-bf605b678392
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-5966-0067c7091e67
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-90db-d37424fe0149
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-dbd6-9688c10538ef
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-5c3c-df14c846748a
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-c895-9276b9f400d7
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-6f21-215c7e645570
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-f42a-e0617e22ee8f
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-0f77-2b238929d285
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-109e-06dbec2a7972
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-a46f-fc0c39940454
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-5b59-1e6644f672d4
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-14a2-e12e2528718a
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-3b8e-cf60fa45cbb6
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-e37a-b975c5dde761
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-90a9-de0c827516d7
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-c089-013ec5b56a20
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-cb71-0016e6656dfa
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-7b78-8c5751ac004d
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-b58d-d336e2520b02
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-e42e-a9d19d9ea3f8
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-b959-183447fee793
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-a2f8-765831b80d11
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-63db-04e5afc0532e
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-dfc2-ca71af0a4505
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-65cc-ceefb924d985
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-8558-b8a00b0131e3
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-ccbb-a4ebbf11f41f
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-265f-3d875f856ad7
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-92a5-3dbe84ea790f
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-95f1-3e9da24397a7
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-5617-9a27e5161bd0
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-bec9-c54b0788ba21
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-0309-6020a1217ea4
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-f02d-c1bc15adf2b5
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-e2ad-c292fb892722
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-2dbd-ea4fad2f5fea
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-e3a9-9f24207c248d
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-b3ae-b580badb4553
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-b093-dc18e2c00c9c
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-2972-7c007352df50
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-782d-f02bea7d0c93
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-5954-7f63b2378620
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-6b9f-de9fbdef2e70
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-ce3e-f76845e0339e
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-0405-cbe80b25d3e7
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-a587-0231314e59b7
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-9035-59ceeb8acae3
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-0533-dd25e5cb86de
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-7178-e282f3b3c7da
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-16cd-e3eab93db4a9
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-fc73-79e9bd135d20
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-ff5c-86ad8929ac5c
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-a853-31143ddc1c60
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-c842-e480650d28ac
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-b808-b155a44ae235
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-4bd8-f1c765605efc
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-d741-e54259ec5680
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-985c-6efc27320f03
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-ef95-e19fefce699e
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-6bc5-d3fda430e1a8
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-69d7-a218352e6d69
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-9a3e-fa5ad152b0ab
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-405d-5333e49cf2b5
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-4c07-438daf8bad6f
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-65ff-311d256b79ae
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-a018-553a8358a400
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-76d9-b7fc6f379354
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-2926-61b729fbbf76
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-49d9-ff724426ba1f
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-9f33-9faeb9ae7b9f
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-eceb-96d58ea69294
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-a452-5cb5ccd552cd
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-f262-f2981f9cbf01
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-62be-ce533c16f4f8
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-9ae6-35bea8a670f5
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-f8fd-e509dfcd5003
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-eff4-d531a940b243
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-6d75-8875077fbd5d
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-24c6-3ad63e3d25c6
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-4f80-2839bd03b81c
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-16c9-cfdda1b5915e
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-f291-ecce7917e5bc
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-5a45-09f2a6b7e027
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-823d-2ad200d685d2
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-7be3-e83743b23f19
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-7a48-784797b5efcc
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-de6a-13f0930436d1
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-2365-5102a80c1c1e
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-d029-0a2085d6b390
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-58e8-aa89f0b4bd19
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-1720-6715aa229c03
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-fcd3-f95f3323d661
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-b663-cfef34583b9c
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-2a8b-af1544fd857c
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-bc19-a24e9c9e5763
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-2183-8d6d8da44c1f
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-cea9-775e76310312
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-ff1a-5a9c40a9d16a
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-edf5-724da1b9e010
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-2477-c22154126489
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-c5c1-1f4bcc803c83
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-63e0-8416e0815de7
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-10f2-294fa73bab99
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-e0a6-a1741b4c8898
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-502d-d8779a980e0b
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-fe60-392b7ec5e6b1
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-56e5-7de41f811c8d
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-9e3b-08b1ba7ab2a7
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-937e-228072b50cd9
00020000-55ec-3f4e-75c7-d673342f7153	00030000-55ec-3f44-658b-99611ea86e8a
\.


--
-- TOC entry 3215 (class 0 OID 1161102)
-- Dependencies: 203
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 1161109)
-- Dependencies: 204
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3230 (class 0 OID 1161256)
-- Dependencies: 218
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55ec-3f4f-c981-3162c98e37a9	00090000-55ec-3f4e-f05d-4c4fd0c47814	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55ec-3f4f-da67-5296c2e2b643	00090000-55ec-3f4e-3b7f-469f1ae293e4	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55ec-3f4f-9433-1d37840354ad	00090000-55ec-3f4e-dcf7-5691fcf83b6c	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 3200 (class 0 OID 1160938)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55ec-3f4e-a90e-67d778c55a6e	00040000-55ec-3f44-b17b-0431b0b30b1a	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ec-3f4e-2983-74d0a9b53b3f	00040000-55ec-3f44-b17b-0431b0b30b1a	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55ec-3f4e-c38f-c8505c0e7a9e	00040000-55ec-3f44-b17b-0431b0b30b1a	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ec-3f4e-0f56-b238d4c67476	00040000-55ec-3f44-b17b-0431b0b30b1a	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ec-3f4e-e331-7906d801a19b	00040000-55ec-3f44-b17b-0431b0b30b1a	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ec-3f4e-e55f-c4b943775278	00040000-55ec-3f44-e683-83c5d385c5e7	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ec-3f4e-8185-3bfeef0abdcf	00040000-55ec-3f44-4151-e027c25c5033	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ec-3f4e-5c1f-4e070c551207	00040000-55ec-3f44-49c7-c681ea16b42c	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3201 (class 0 OID 1160957)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55ec-3f44-2893-ebfecafd1f20	8341	Adlešiči
00050000-55ec-3f44-1877-85f0d3abfecb	5270	Ajdovščina
00050000-55ec-3f44-e20b-c4570aad1b36	6280	Ankaran/Ancarano
00050000-55ec-3f44-6755-ba1dfbd69788	9253	Apače
00050000-55ec-3f44-bd84-4605c1924953	8253	Artiče
00050000-55ec-3f44-4d14-79a2d0d36de3	4275	Begunje na Gorenjskem
00050000-55ec-3f44-fc72-c478f0083ef0	1382	Begunje pri Cerknici
00050000-55ec-3f44-68c6-10cc2883659b	9231	Beltinci
00050000-55ec-3f44-b39b-cee7406ac2d8	2234	Benedikt
00050000-55ec-3f44-f04e-32e49cfe2c2a	2345	Bistrica ob Dravi
00050000-55ec-3f44-84de-3ecff264ffac	3256	Bistrica ob Sotli
00050000-55ec-3f44-8d77-145080d4dc10	8259	Bizeljsko
00050000-55ec-3f44-d8d9-2cdbd9a4454f	1223	Blagovica
00050000-55ec-3f44-dfc5-5ff4184525ec	8283	Blanca
00050000-55ec-3f44-3794-a0f6e6819dbe	4260	Bled
00050000-55ec-3f44-d7c4-38e8a496d548	4273	Blejska Dobrava
00050000-55ec-3f44-0b20-9a334a31e832	9265	Bodonci
00050000-55ec-3f44-3815-19f93b7ba866	9222	Bogojina
00050000-55ec-3f44-a733-16984095f333	4263	Bohinjska Bela
00050000-55ec-3f44-e049-181c09b275b9	4264	Bohinjska Bistrica
00050000-55ec-3f44-1fb3-9baf546c5802	4265	Bohinjsko jezero
00050000-55ec-3f44-8f19-786eb17a78f1	1353	Borovnica
00050000-55ec-3f44-3408-83fb130fd567	8294	Boštanj
00050000-55ec-3f44-17af-39f1f9ebdf28	5230	Bovec
00050000-55ec-3f44-87e4-366c0462f833	5295	Branik
00050000-55ec-3f44-b3e4-63076f0f8102	3314	Braslovče
00050000-55ec-3f44-9310-0fd70b12ced7	5223	Breginj
00050000-55ec-3f44-3b0f-1068eea7cfe0	8280	Brestanica
00050000-55ec-3f44-9801-5fdf1440b113	2354	Bresternica
00050000-55ec-3f44-215c-f538df7166e4	4243	Brezje
00050000-55ec-3f44-e276-8eb5ad8b4708	1351	Brezovica pri Ljubljani
00050000-55ec-3f44-dc1e-7a3ab0f48e4c	8250	Brežice
00050000-55ec-3f44-a698-a413abd941d2	4210	Brnik - Aerodrom
00050000-55ec-3f44-34c3-2851eb56f955	8321	Brusnice
00050000-55ec-3f44-90a0-08c53a73ab0f	3255	Buče
00050000-55ec-3f44-c360-c0b8efd26fcc	8276	Bučka 
00050000-55ec-3f44-de33-1ee646f66e36	9261	Cankova
00050000-55ec-3f44-217e-476528380bc2	3000	Celje 
00050000-55ec-3f44-4aa9-04b7f08874e8	3001	Celje - poštni predali
00050000-55ec-3f44-f536-93ee0ff5566f	4207	Cerklje na Gorenjskem
00050000-55ec-3f44-241c-a19e492ea5d4	8263	Cerklje ob Krki
00050000-55ec-3f44-b373-5cf35b1398af	1380	Cerknica
00050000-55ec-3f44-89cd-b52447c5029d	5282	Cerkno
00050000-55ec-3f44-542d-69ba999ed3ef	2236	Cerkvenjak
00050000-55ec-3f44-1e83-f582cd4c77a6	2215	Ceršak
00050000-55ec-3f44-eb62-7040bb17492a	2326	Cirkovce
00050000-55ec-3f44-b255-4f499b4b5e2b	2282	Cirkulane
00050000-55ec-3f44-d975-29e9d9c3804e	5273	Col
00050000-55ec-3f44-aa68-52e63aed85b7	8251	Čatež ob Savi
00050000-55ec-3f44-f74b-9bbc0769ad23	1413	Čemšenik
00050000-55ec-3f44-c399-29c49bc9eff6	5253	Čepovan
00050000-55ec-3f44-b264-e7c15fe811a5	9232	Črenšovci
00050000-55ec-3f44-9260-d68809c372ce	2393	Črna na Koroškem
00050000-55ec-3f44-77a7-d09eb58acabd	6275	Črni Kal
00050000-55ec-3f44-9016-85d7805f4a4e	5274	Črni Vrh nad Idrijo
00050000-55ec-3f44-6548-a9cb8b9d27fe	5262	Črniče
00050000-55ec-3f44-c7cf-ecb30e43ff08	8340	Črnomelj
00050000-55ec-3f44-068c-35b462efe76e	6271	Dekani
00050000-55ec-3f44-8a9d-9fe7116f0f37	5210	Deskle
00050000-55ec-3f44-eb37-8b0fc51eb345	2253	Destrnik
00050000-55ec-3f44-c85b-55f0a59b28b8	6215	Divača
00050000-55ec-3f44-e4e1-691283816304	1233	Dob
00050000-55ec-3f44-93ea-06bc0e52bdbf	3224	Dobje pri Planini
00050000-55ec-3f44-d453-2b78f7492357	8257	Dobova
00050000-55ec-3f44-144c-613cae4257eb	1423	Dobovec
00050000-55ec-3f44-afcf-b7e3062e24e2	5263	Dobravlje
00050000-55ec-3f44-6ff0-52ba03981576	3204	Dobrna
00050000-55ec-3f44-5100-05af802aa7a8	8211	Dobrnič
00050000-55ec-3f44-d82f-0164a8356dc0	1356	Dobrova
00050000-55ec-3f44-f46f-178792fd2786	9223	Dobrovnik/Dobronak 
00050000-55ec-3f44-38e5-a2214f8d38e5	5212	Dobrovo v Brdih
00050000-55ec-3f44-8c2b-babe10074acf	1431	Dol pri Hrastniku
00050000-55ec-3f44-b7c1-f40d2dd63080	1262	Dol pri Ljubljani
00050000-55ec-3f44-aa63-3329fb2855c5	1273	Dole pri Litiji
00050000-55ec-3f44-6d1e-6f4b36d7b65d	1331	Dolenja vas
00050000-55ec-3f44-14ed-1f993463f21a	8350	Dolenjske Toplice
00050000-55ec-3f44-8366-fa0d261df09f	1230	Domžale
00050000-55ec-3f44-1411-0017653f1d02	2252	Dornava
00050000-55ec-3f44-3026-574d58f29293	5294	Dornberk
00050000-55ec-3f44-90cd-7dc4832bcece	1319	Draga
00050000-55ec-3f44-ff13-46c893ab8330	8343	Dragatuš
00050000-55ec-3f44-4e3d-0cbb0b980e49	3222	Dramlje
00050000-55ec-3f44-06fd-85b9997dc669	2370	Dravograd
00050000-55ec-3f44-b1f4-a6b4f6a58f31	4203	Duplje
00050000-55ec-3f44-9bf8-34ffb68faed7	6221	Dutovlje
00050000-55ec-3f44-ffb7-01d85a4224fc	8361	Dvor
00050000-55ec-3f44-12be-9ef0a037be33	2343	Fala
00050000-55ec-3f44-2bee-100dfa747571	9208	Fokovci
00050000-55ec-3f44-d180-7dd561e9ac60	2313	Fram
00050000-55ec-3f44-ac97-157bfc2b918d	3213	Frankolovo
00050000-55ec-3f44-70e1-8a976b51f1f5	1274	Gabrovka
00050000-55ec-3f44-dbd8-9811f385e7ed	8254	Globoko
00050000-55ec-3f44-eae9-6bbcc19647c8	5275	Godovič
00050000-55ec-3f44-c747-e208122f798c	4204	Golnik
00050000-55ec-3f44-1513-904b1489fbdd	3303	Gomilsko
00050000-55ec-3f44-c250-71c636c218b8	4224	Gorenja vas
00050000-55ec-3f44-8c1a-a0817fccb2a1	3263	Gorica pri Slivnici
00050000-55ec-3f44-18b0-2f72d4ec57a9	2272	Gorišnica
00050000-55ec-3f44-8a94-f570f887bf1c	9250	Gornja Radgona
00050000-55ec-3f44-7248-9be6696c927a	3342	Gornji Grad
00050000-55ec-3f44-f8bc-a417652870ec	4282	Gozd Martuljek
00050000-55ec-3f44-ec2a-025c7d756d9b	6272	Gračišče
00050000-55ec-3f44-b0e7-0e3c720b274e	9264	Grad
00050000-55ec-3f44-7bfd-2811ca64cd7c	8332	Gradac
00050000-55ec-3f44-00f0-25f62aea2bcd	1384	Grahovo
00050000-55ec-3f44-0d67-62abe0cb701a	5242	Grahovo ob Bači
00050000-55ec-3f44-3c31-658f84c5f4a6	5251	Grgar
00050000-55ec-3f44-647a-30ee0f68185f	3302	Griže
00050000-55ec-3f44-6c0b-ec121d46c1dd	3231	Grobelno
00050000-55ec-3f44-023a-ed8b1e2f9d13	1290	Grosuplje
00050000-55ec-3f44-fdfa-832aae2b4127	2288	Hajdina
00050000-55ec-3f44-4242-7d802c6b4bab	8362	Hinje
00050000-55ec-3f44-b5f8-0a95576d7959	2311	Hoče
00050000-55ec-3f44-4e3c-8b6037ae2e6b	9205	Hodoš/Hodos
00050000-55ec-3f44-70ec-b3eb797fb125	1354	Horjul
00050000-55ec-3f44-6bde-38d89d6242c4	1372	Hotedršica
00050000-55ec-3f44-c2f0-0c7e2828e459	1430	Hrastnik
00050000-55ec-3f44-39c9-b36c38ee621f	6225	Hruševje
00050000-55ec-3f44-f758-85060b6b43e8	4276	Hrušica
00050000-55ec-3f44-a698-01c505d9d4df	5280	Idrija
00050000-55ec-3f44-2c5f-5dfafbf97b0e	1292	Ig
00050000-55ec-3f44-0a5b-bf36629cde90	6250	Ilirska Bistrica
00050000-55ec-3f44-7ea4-dd8a05d8120c	6251	Ilirska Bistrica-Trnovo
00050000-55ec-3f44-fb99-17fb87f3e59b	1295	Ivančna Gorica
00050000-55ec-3f44-2a3f-58cf82cf1ba0	2259	Ivanjkovci
00050000-55ec-3f44-82d4-0bef71345e2b	1411	Izlake
00050000-55ec-3f44-5492-51e8ea541f3b	6310	Izola/Isola
00050000-55ec-3f44-819b-73b1eaab31a6	2222	Jakobski Dol
00050000-55ec-3f44-4d54-7a25f2f617f6	2221	Jarenina
00050000-55ec-3f44-8209-89e06736a22a	6254	Jelšane
00050000-55ec-3f44-f99c-5d90fd75a1bf	4270	Jesenice
00050000-55ec-3f44-e404-11707c886718	8261	Jesenice na Dolenjskem
00050000-55ec-3f44-6b33-6cf295d79e18	3273	Jurklošter
00050000-55ec-3f44-94dd-0c66f21a3da9	2223	Jurovski Dol
00050000-55ec-3f44-ad56-48bbe84345a5	2256	Juršinci
00050000-55ec-3f44-e5a7-b18f44698263	5214	Kal nad Kanalom
00050000-55ec-3f44-7646-21afea6c5c1a	3233	Kalobje
00050000-55ec-3f44-edbb-99a2a6295613	4246	Kamna Gorica
00050000-55ec-3f44-cf74-1244c521e5c0	2351	Kamnica
00050000-55ec-3f44-1807-d148fbde7da5	1241	Kamnik
00050000-55ec-3f44-62ee-de41d70ffc09	5213	Kanal
00050000-55ec-3f44-0374-cec0c02da675	8258	Kapele
00050000-55ec-3f44-043d-8bb5d17e9f0d	2362	Kapla
00050000-55ec-3f44-8e0c-8e2ba25a7384	2325	Kidričevo
00050000-55ec-3f44-91d4-1757d97cd2dc	1412	Kisovec
00050000-55ec-3f44-d489-0bd4b939655d	6253	Knežak
00050000-55ec-3f44-7758-14cabd73ead4	5222	Kobarid
00050000-55ec-3f44-9605-1d40296154ac	9227	Kobilje
00050000-55ec-3f44-eee4-7a7746906342	1330	Kočevje
00050000-55ec-3f44-e381-ddc092d68293	1338	Kočevska Reka
00050000-55ec-3f44-e2e9-354b4bf3def3	2276	Kog
00050000-55ec-3f44-4486-b22c4cdb63b0	5211	Kojsko
00050000-55ec-3f44-8e05-53c9170d6267	6223	Komen
00050000-55ec-3f44-6ca7-2b3142b10188	1218	Komenda
00050000-55ec-3f44-cab9-d4042b8ee464	6000	Koper/Capodistria 
00050000-55ec-3f44-b16f-69de6df34d4d	6001	Koper/Capodistria - poštni predali
00050000-55ec-3f44-72c9-cc678fdcfeb2	8282	Koprivnica
00050000-55ec-3f44-91e0-37bb1f3d2b1b	5296	Kostanjevica na Krasu
00050000-55ec-3f44-ada6-3ba7ca5b4370	8311	Kostanjevica na Krki
00050000-55ec-3f44-b69e-1a96efaa2ba4	1336	Kostel
00050000-55ec-3f44-9794-6684e423ba75	6256	Košana
00050000-55ec-3f44-6606-de67404ba217	2394	Kotlje
00050000-55ec-3f44-460c-1225018c926c	6240	Kozina
00050000-55ec-3f44-b957-932d5e466eee	3260	Kozje
00050000-55ec-3f44-a253-388c41a2c393	4000	Kranj 
00050000-55ec-3f44-5a82-0f0031a01ffe	4001	Kranj - poštni predali
00050000-55ec-3f44-aa8c-bbd50ef4bb68	4280	Kranjska Gora
00050000-55ec-3f44-5a2d-d8a3342452c5	1281	Kresnice
00050000-55ec-3f44-1942-e9c290c1547e	4294	Križe
00050000-55ec-3f44-3728-b80c2492e753	9206	Križevci
00050000-55ec-3f44-9f47-7da1b21d8cd5	9242	Križevci pri Ljutomeru
00050000-55ec-3f44-1b02-b8051c8f0644	1301	Krka
00050000-55ec-3f44-eaf2-7ff8fbe26e82	8296	Krmelj
00050000-55ec-3f44-f478-fcd0b373d6fc	4245	Kropa
00050000-55ec-3f44-483a-141340e823f3	8262	Krška vas
00050000-55ec-3f44-1593-edd6d6ca0e3b	8270	Krško
00050000-55ec-3f44-72b2-dd30e6b68792	9263	Kuzma
00050000-55ec-3f44-4ba3-884c48106fc2	2318	Laporje
00050000-55ec-3f44-6f31-abb8fbc4a61e	3270	Laško
00050000-55ec-3f44-cfb7-d91e1ebbb1a2	1219	Laze v Tuhinju
00050000-55ec-3f44-cfc2-b04edeb1fa1f	2230	Lenart v Slovenskih goricah
00050000-55ec-3f44-e15c-867c938fa912	9220	Lendava/Lendva
00050000-55ec-3f44-b655-3ec956d06a18	4248	Lesce
00050000-55ec-3f44-133e-518910a6ece6	3261	Lesično
00050000-55ec-3f44-e91c-27a5ff27805e	8273	Leskovec pri Krškem
00050000-55ec-3f44-9dfa-b7c03d0ff17d	2372	Libeliče
00050000-55ec-3f44-1b8e-0f4ceae475cd	2341	Limbuš
00050000-55ec-3f44-24d8-5658de8e7af7	1270	Litija
00050000-55ec-3f44-4516-1aae2d7e7047	3202	Ljubečna
00050000-55ec-3f44-00fb-db110b712ba8	1000	Ljubljana 
00050000-55ec-3f44-9462-6505ce5b2903	1001	Ljubljana - poštni predali
00050000-55ec-3f44-3445-abad568d317d	1231	Ljubljana - Črnuče
00050000-55ec-3f44-2e73-998d65bc1a2c	1261	Ljubljana - Dobrunje
00050000-55ec-3f44-1bf7-40b15156d61d	1260	Ljubljana - Polje
00050000-55ec-3f44-0f46-4228705e1a49	1210	Ljubljana - Šentvid
00050000-55ec-3f44-d2f4-9a657c0023fe	1211	Ljubljana - Šmartno
00050000-55ec-3f44-8f61-b774d0806271	3333	Ljubno ob Savinji
00050000-55ec-3f44-7ec6-ae4dbfcbc8e2	9240	Ljutomer
00050000-55ec-3f44-8727-79c149fd4065	3215	Loče
00050000-55ec-3f44-a088-8e24aa56adcd	5231	Log pod Mangartom
00050000-55ec-3f44-2ddb-2ca81a1048cb	1358	Log pri Brezovici
00050000-55ec-3f44-0094-366016e99c66	1370	Logatec
00050000-55ec-3f44-8afa-a39f83533888	1371	Logatec
00050000-55ec-3f44-64c3-4f794fff18c9	1434	Loka pri Zidanem Mostu
00050000-55ec-3f44-b2e7-1e6abd782733	3223	Loka pri Žusmu
00050000-55ec-3f44-d219-20140af260ce	6219	Lokev
00050000-55ec-3f44-cbca-a67c3b4380ad	1318	Loški Potok
00050000-55ec-3f44-cfcd-c60b2fa2b7ab	2324	Lovrenc na Dravskem polju
00050000-55ec-3f44-6b21-cf7d98b5916f	2344	Lovrenc na Pohorju
00050000-55ec-3f44-3236-4c4372220964	3334	Luče
00050000-55ec-3f44-0b4e-71006be7b502	1225	Lukovica
00050000-55ec-3f44-39d6-4945345d1aa3	9202	Mačkovci
00050000-55ec-3f44-d30a-debf8d3a2f94	2322	Majšperk
00050000-55ec-3f44-2b11-bb4007308223	2321	Makole
00050000-55ec-3f44-7d9a-6dd86496dd88	9243	Mala Nedelja
00050000-55ec-3f44-2dcb-9f0454b5705f	2229	Malečnik
00050000-55ec-3f44-b003-8431606d2e96	6273	Marezige
00050000-55ec-3f44-0d53-2a3dc2fe4c58	2000	Maribor 
00050000-55ec-3f44-e383-64dfdae41ca8	2001	Maribor - poštni predali
00050000-55ec-3f44-1d11-4de18d779abb	2206	Marjeta na Dravskem polju
00050000-55ec-3f44-7109-6bcb0cae42dc	2281	Markovci
00050000-55ec-3f44-6ae8-b77b44415a0b	9221	Martjanci
00050000-55ec-3f44-a2d0-d595aa85fe2f	6242	Materija
00050000-55ec-3f44-c864-e6540b6836b5	4211	Mavčiče
00050000-55ec-3f44-f694-255a74806543	1215	Medvode
00050000-55ec-3f44-831d-5c45ecc761ad	1234	Mengeš
00050000-55ec-3f44-7f7f-acaae956eef8	8330	Metlika
00050000-55ec-3f44-97c0-1fa2f376a5a5	2392	Mežica
00050000-55ec-3f44-acac-34bd62dec6d0	2204	Miklavž na Dravskem polju
00050000-55ec-3f44-64b0-80cb81129395	2275	Miklavž pri Ormožu
00050000-55ec-3f44-5f27-d897891ca4ff	5291	Miren
00050000-55ec-3f44-28d6-a95944909f78	8233	Mirna
00050000-55ec-3f44-736a-7aac31a190ca	8216	Mirna Peč
00050000-55ec-3f44-b407-8e6666b3df4f	2382	Mislinja
00050000-55ec-3f44-e416-0a716bc6b524	4281	Mojstrana
00050000-55ec-3f44-8db4-6897796698e8	8230	Mokronog
00050000-55ec-3f44-d398-ab790da95a6f	1251	Moravče
00050000-55ec-3f44-8ef9-58289785fb54	9226	Moravske Toplice
00050000-55ec-3f44-488b-a4860be03bc6	5216	Most na Soči
00050000-55ec-3f44-84f9-54ed3e787ab5	1221	Motnik
00050000-55ec-3f44-559d-b5462f640f2c	3330	Mozirje
00050000-55ec-3f44-82d6-0d0580095f7c	9000	Murska Sobota 
00050000-55ec-3f44-113d-3f72b27eb59c	9001	Murska Sobota - poštni predali
00050000-55ec-3f44-a870-0bc82ea685d9	2366	Muta
00050000-55ec-3f44-4d8e-f3937eacc4f8	4202	Naklo
00050000-55ec-3f44-129f-50fb7d89e649	3331	Nazarje
00050000-55ec-3f44-2a7a-a30c3214f630	1357	Notranje Gorice
00050000-55ec-3f44-5ff6-4f9806024050	3203	Nova Cerkev
00050000-55ec-3f44-fbb3-a7b5304d52d6	5000	Nova Gorica 
00050000-55ec-3f44-e705-dd2f39aae016	5001	Nova Gorica - poštni predali
00050000-55ec-3f44-1484-fac1ddacb10c	1385	Nova vas
00050000-55ec-3f44-5c49-93f673b29866	8000	Novo mesto
00050000-55ec-3f44-beb8-e1b4c1dd7095	8001	Novo mesto - poštni predali
00050000-55ec-3f44-2351-a0aeefa9a461	6243	Obrov
00050000-55ec-3f44-3545-9bbd65622e20	9233	Odranci
00050000-55ec-3f44-7081-082351951d44	2317	Oplotnica
00050000-55ec-3f44-2ff6-377fa8a86d25	2312	Orehova vas
00050000-55ec-3f44-0b41-0e62a330076e	2270	Ormož
00050000-55ec-3f44-0a70-8e9e71f6724c	1316	Ortnek
00050000-55ec-3f44-db15-e4c73f97c2d7	1337	Osilnica
00050000-55ec-3f44-5c32-232a2f22d0b8	8222	Otočec
00050000-55ec-3f44-5ba7-23f9b7c67647	2361	Ožbalt
00050000-55ec-3f44-5264-7afe8b05b337	2231	Pernica
00050000-55ec-3f44-2587-c6e7d745838f	2211	Pesnica pri Mariboru
00050000-55ec-3f44-24ce-c436ccab718f	9203	Petrovci
00050000-55ec-3f44-cc6d-729ced65e3ef	3301	Petrovče
00050000-55ec-3f44-44c5-7edacfc3f419	6330	Piran/Pirano
00050000-55ec-3f44-4778-79216da176a4	8255	Pišece
00050000-55ec-3f44-2f23-0d7fda4bba2a	6257	Pivka
00050000-55ec-3f44-46cb-4c253cbc1160	6232	Planina
00050000-55ec-3f44-5b3d-8de2d9ade455	3225	Planina pri Sevnici
00050000-55ec-3f44-43ea-4da19a78c22d	6276	Pobegi
00050000-55ec-3f44-09d8-08d9f9e8a5e6	8312	Podbočje
00050000-55ec-3f44-5a31-cb56e3de102c	5243	Podbrdo
00050000-55ec-3f44-d342-62c5398c4d1b	3254	Podčetrtek
00050000-55ec-3f44-8fe7-63f746b8eb0b	2273	Podgorci
00050000-55ec-3f44-8ec7-24881983768c	6216	Podgorje
00050000-55ec-3f44-1add-8f624b0ebc44	2381	Podgorje pri Slovenj Gradcu
00050000-55ec-3f44-15af-936f8bad3c73	6244	Podgrad
00050000-55ec-3f44-de95-c5d432be09a5	1414	Podkum
00050000-55ec-3f44-23a6-17dcb665dffc	2286	Podlehnik
00050000-55ec-3f44-00a9-901b0f47a393	5272	Podnanos
00050000-55ec-3f44-c6bf-013696fe115d	4244	Podnart
00050000-55ec-3f44-5ea6-80451e7e02d7	3241	Podplat
00050000-55ec-3f44-9e03-35a9efdad8ad	3257	Podsreda
00050000-55ec-3f44-67e7-337a5cb079e6	2363	Podvelka
00050000-55ec-3f44-9a98-b7375b1ac9ef	2208	Pohorje
00050000-55ec-3f44-b1df-0529da0e16cb	2257	Polenšak
00050000-55ec-3f44-9b72-871b39487a62	1355	Polhov Gradec
00050000-55ec-3f44-32fa-f38b83d58fa9	4223	Poljane nad Škofjo Loko
00050000-55ec-3f44-4159-594020318608	2319	Poljčane
00050000-55ec-3f44-769d-57b8c4e4b33e	1272	Polšnik
00050000-55ec-3f44-a08a-6c358b98af20	3313	Polzela
00050000-55ec-3f44-a922-0f8f70b4e14d	3232	Ponikva
00050000-55ec-3f44-467c-7972b609bc6b	6320	Portorož/Portorose
00050000-55ec-3f44-2514-ad6bfa765599	6230	Postojna
00050000-55ec-3f44-3d69-7482e7bf04f4	2331	Pragersko
00050000-55ec-3f44-c455-7924372a5b87	3312	Prebold
00050000-55ec-3f44-4133-87c6c2b41c29	4205	Preddvor
00050000-55ec-3f44-add4-387f0a7b1f3e	6255	Prem
00050000-55ec-3f44-9393-5f83ff4c620a	1352	Preserje
00050000-55ec-3f44-996c-677a81379e21	6258	Prestranek
00050000-55ec-3f44-139a-dc8b973464e3	2391	Prevalje
00050000-55ec-3f44-5ee8-1513b248d059	3262	Prevorje
00050000-55ec-3f44-d735-9c5bead56dad	1276	Primskovo 
00050000-55ec-3f44-2e39-1a1fe18b60f2	3253	Pristava pri Mestinju
00050000-55ec-3f44-b057-d8a65a205caf	9207	Prosenjakovci/Partosfalva
00050000-55ec-3f44-fa5f-9baeaac60237	5297	Prvačina
00050000-55ec-3f44-2670-2c2e57e24dd1	2250	Ptuj
00050000-55ec-3f44-b42b-4b52577eb429	2323	Ptujska Gora
00050000-55ec-3f44-edac-c0022540e7a8	9201	Puconci
00050000-55ec-3f44-934b-982a46d5a366	2327	Rače
00050000-55ec-3f44-7222-762f8d333827	1433	Radeče
00050000-55ec-3f44-f3ec-8301829f7391	9252	Radenci
00050000-55ec-3f44-6709-3038dc3bf177	2360	Radlje ob Dravi
00050000-55ec-3f44-6d46-9f8ebf4a0372	1235	Radomlje
00050000-55ec-3f44-07bd-6f2288d7af24	4240	Radovljica
00050000-55ec-3f44-0e34-fc1611f46f2a	8274	Raka
00050000-55ec-3f44-d9e3-a1a3b3e1a7ba	1381	Rakek
00050000-55ec-3f44-a2fe-769b67079809	4283	Rateče - Planica
00050000-55ec-3f44-1bcc-0cfb50c5a496	2390	Ravne na Koroškem
00050000-55ec-3f44-d617-94dc1c8adeaf	9246	Razkrižje
00050000-55ec-3f44-2633-c0f8794cee0c	3332	Rečica ob Savinji
00050000-55ec-3f44-6421-003b153825be	5292	Renče
00050000-55ec-3f44-f3f9-dfd0a78025fb	1310	Ribnica
00050000-55ec-3f44-d69a-800f2519794a	2364	Ribnica na Pohorju
00050000-55ec-3f44-4b40-0e7eb0a4f686	3272	Rimske Toplice
00050000-55ec-3f44-c00a-626c35610ff1	1314	Rob
00050000-55ec-3f44-46b7-e20f87c42fed	5215	Ročinj
00050000-55ec-3f44-21c1-dcda5804a335	3250	Rogaška Slatina
00050000-55ec-3f44-ddbf-3534da097cf7	9262	Rogašovci
00050000-55ec-3f44-396a-4cadfe31d6f9	3252	Rogatec
00050000-55ec-3f44-be8b-547090896c19	1373	Rovte
00050000-55ec-3f44-6942-113b21ff594a	2342	Ruše
00050000-55ec-3f44-5acd-10b4b8a14cff	1282	Sava
00050000-55ec-3f44-8aa0-b73f2deb6dd6	6333	Sečovlje/Sicciole
00050000-55ec-3f44-a8eb-62017687f269	4227	Selca
00050000-55ec-3f44-1df6-1f299b613c29	2352	Selnica ob Dravi
00050000-55ec-3f44-550f-222bf64830d6	8333	Semič
00050000-55ec-3f44-a484-2f311cbaa31d	8281	Senovo
00050000-55ec-3f44-354d-28cf2a0f9cb3	6224	Senožeče
00050000-55ec-3f44-f339-ee46b5a80aaf	8290	Sevnica
00050000-55ec-3f44-6028-1da010d397d9	6210	Sežana
00050000-55ec-3f44-6046-97f2df5074bb	2214	Sladki Vrh
00050000-55ec-3f44-bf65-a5b68c42ad05	5283	Slap ob Idrijci
00050000-55ec-3f44-07e1-8fe0feb94dac	2380	Slovenj Gradec
00050000-55ec-3f44-1659-f79163a49654	2310	Slovenska Bistrica
00050000-55ec-3f44-a6ea-e7015b066a5e	3210	Slovenske Konjice
00050000-55ec-3f44-4d48-d5782258f1eb	1216	Smlednik
00050000-55ec-3f44-2f92-4b04f597516d	5232	Soča
00050000-55ec-3f44-dcd9-af13545637d7	1317	Sodražica
00050000-55ec-3f44-6f50-83c6f4ec2fa8	3335	Solčava
00050000-55ec-3f44-4e8a-73cfe5cab2a8	5250	Solkan
00050000-55ec-3f44-ae1c-0b3d63dee94d	4229	Sorica
00050000-55ec-3f44-e535-4618dec4972d	4225	Sovodenj
00050000-55ec-3f44-356e-be74105e2e82	5281	Spodnja Idrija
00050000-55ec-3f44-0211-95679b40ebbe	2241	Spodnji Duplek
00050000-55ec-3f44-15eb-3176066a10dc	9245	Spodnji Ivanjci
00050000-55ec-3f44-5ec5-1f4c14df6d55	2277	Središče ob Dravi
00050000-55ec-3f44-c1d0-55aa8aeb48f9	4267	Srednja vas v Bohinju
00050000-55ec-3f44-616a-58cee6f9ab58	8256	Sromlje 
00050000-55ec-3f44-b1c4-c78ec18c4d5e	5224	Srpenica
00050000-55ec-3f44-1937-09baba22d5ee	1242	Stahovica
00050000-55ec-3f44-41f7-723d29725194	1332	Stara Cerkev
00050000-55ec-3f44-3079-b5f789395d83	8342	Stari trg ob Kolpi
00050000-55ec-3f44-d2c7-f41b924a1312	1386	Stari trg pri Ložu
00050000-55ec-3f44-ba0a-2257f5cf27de	2205	Starše
00050000-55ec-3f44-4e06-accdc207efad	2289	Stoperce
00050000-55ec-3f44-43e7-ff19c56f78f8	8322	Stopiče
00050000-55ec-3f44-fb17-4b9cf02ab07e	3206	Stranice
00050000-55ec-3f44-fca7-c590a4234692	8351	Straža
00050000-55ec-3f44-be84-eecca9b53625	1313	Struge
00050000-55ec-3f44-c955-3d2992126b46	8293	Studenec
00050000-55ec-3f44-98de-5e5ec0e980a5	8331	Suhor
00050000-55ec-3f44-631d-fa90cf2c8f36	2233	Sv. Ana v Slovenskih goricah
00050000-55ec-3f44-22d8-e07d1957fe2e	2235	Sv. Trojica v Slovenskih goricah
00050000-55ec-3f44-09fb-f5fd18a2f435	2353	Sveti Duh na Ostrem Vrhu
00050000-55ec-3f44-8728-22b23b427f8a	9244	Sveti Jurij ob Ščavnici
00050000-55ec-3f44-d43c-d6a8de4ed4b7	3264	Sveti Štefan
00050000-55ec-3f44-d6d2-213237e50f71	2258	Sveti Tomaž
00050000-55ec-3f44-5465-8e3c570b0b0e	9204	Šalovci
00050000-55ec-3f44-ed26-813980602909	5261	Šempas
00050000-55ec-3f44-5039-056c1990dffc	5290	Šempeter pri Gorici
00050000-55ec-3f44-db76-4626c51be5a5	3311	Šempeter v Savinjski dolini
00050000-55ec-3f44-8063-64c0e3f9d6c5	4208	Šenčur
00050000-55ec-3f44-85ff-dd77d0580fe0	2212	Šentilj v Slovenskih goricah
00050000-55ec-3f44-2344-f1d035c55269	8297	Šentjanž
00050000-55ec-3f44-1605-ef6bd7c4b0db	2373	Šentjanž pri Dravogradu
00050000-55ec-3f44-1484-fe0cd2700ca3	8310	Šentjernej
00050000-55ec-3f44-14cf-4ca08bdb206a	3230	Šentjur
00050000-55ec-3f44-adc0-d703e8143503	3271	Šentrupert
00050000-55ec-3f44-2caf-32d581b7c878	8232	Šentrupert
00050000-55ec-3f44-c6d8-06c381c52ea7	1296	Šentvid pri Stični
00050000-55ec-3f44-e79d-f13151a75050	8275	Škocjan
00050000-55ec-3f44-f3ef-b348601b1306	6281	Škofije
00050000-55ec-3f44-81ad-3eede3bb70ae	4220	Škofja Loka
00050000-55ec-3f44-ea54-72cedbfb5b51	3211	Škofja vas
00050000-55ec-3f44-ecf4-c3a6523fedf5	1291	Škofljica
00050000-55ec-3f44-ba2a-1f5f8c20b3f9	6274	Šmarje
00050000-55ec-3f44-97bf-70691224774e	1293	Šmarje - Sap
00050000-55ec-3f44-4111-a0aaa1cc1580	3240	Šmarje pri Jelšah
00050000-55ec-3f44-c766-9e9a8fe941f5	8220	Šmarješke Toplice
00050000-55ec-3f44-2060-8d933b08e344	2315	Šmartno na Pohorju
00050000-55ec-3f44-416e-4f30ef18330f	3341	Šmartno ob Dreti
00050000-55ec-3f44-56dc-36cffea382a2	3327	Šmartno ob Paki
00050000-55ec-3f44-37a6-47caeb1e5048	1275	Šmartno pri Litiji
00050000-55ec-3f44-d877-068a03b1678d	2383	Šmartno pri Slovenj Gradcu
00050000-55ec-3f44-0bb3-fe92bae49c07	3201	Šmartno v Rožni dolini
00050000-55ec-3f44-bb44-be17a49a916c	3325	Šoštanj
00050000-55ec-3f44-d3c8-d9670a080b66	6222	Štanjel
00050000-55ec-3f44-cab5-581e00050d4b	3220	Štore
00050000-55ec-3f44-43d0-0a8c9b1c44dd	3304	Tabor
00050000-55ec-3f44-7489-30e8d4f9cf9c	3221	Teharje
00050000-55ec-3f44-a53f-eda50503d3b8	9251	Tišina
00050000-55ec-3f44-9388-c86641ad2d7c	5220	Tolmin
00050000-55ec-3f44-bc23-af05488c5d35	3326	Topolšica
00050000-55ec-3f44-83ea-d946eee7b368	2371	Trbonje
00050000-55ec-3f44-29ad-962d1128041b	1420	Trbovlje
00050000-55ec-3f44-0c70-da5787f429e3	8231	Trebelno 
00050000-55ec-3f44-fe75-8fc692c01a79	8210	Trebnje
00050000-55ec-3f44-60d4-2b65ce5b395b	5252	Trnovo pri Gorici
00050000-55ec-3f44-1a09-157e76eabe6d	2254	Trnovska vas
00050000-55ec-3f44-f352-304ecbf35aac	1222	Trojane
00050000-55ec-3f44-c64d-5b954d5bf72e	1236	Trzin
00050000-55ec-3f44-912f-c4738fd57de5	4290	Tržič
00050000-55ec-3f44-7ff7-95dbeb409612	8295	Tržišče
00050000-55ec-3f44-727f-2fd39feda01c	1311	Turjak
00050000-55ec-3f44-7ca0-85957abd97bf	9224	Turnišče
00050000-55ec-3f44-e633-a2251d5cbed0	8323	Uršna sela
00050000-55ec-3f44-ee9b-7cff8c924f0d	1252	Vače
00050000-55ec-3f44-4f5e-694fb430de7f	3320	Velenje 
00050000-55ec-3f44-87de-a90753ed8261	3322	Velenje - poštni predali
00050000-55ec-3f44-53fd-004c5e0cd6e5	8212	Velika Loka
00050000-55ec-3f44-9313-59069f5fc386	2274	Velika Nedelja
00050000-55ec-3f44-bfb9-3e083d3ba210	9225	Velika Polana
00050000-55ec-3f44-df22-0c9817c73d4a	1315	Velike Lašče
00050000-55ec-3f44-5d4d-a6f63022e712	8213	Veliki Gaber
00050000-55ec-3f44-2fb8-269277d07e1e	9241	Veržej
00050000-55ec-3f44-bdc2-4f6c45782755	1312	Videm - Dobrepolje
00050000-55ec-3f44-1e5c-9c9b477a5e2c	2284	Videm pri Ptuju
00050000-55ec-3f44-d5f0-0c3fb14f0285	8344	Vinica
00050000-55ec-3f44-5b82-247092eb0505	5271	Vipava
00050000-55ec-3f44-27f5-fffb9a6f262a	4212	Visoko
00050000-55ec-3f44-774a-abb7e21744c9	1294	Višnja Gora
00050000-55ec-3f44-dd05-a4ca4d6e18a1	3205	Vitanje
00050000-55ec-3f44-4b0c-45e9a460e012	2255	Vitomarci
00050000-55ec-3f44-e075-ec51258247c9	1217	Vodice
00050000-55ec-3f44-22de-af457b5cccb8	3212	Vojnik\t
00050000-55ec-3f44-895a-ec5f5af7431e	5293	Volčja Draga
00050000-55ec-3f44-8c52-64a4f6b09991	2232	Voličina
00050000-55ec-3f44-48bc-beeffffebe4c	3305	Vransko
00050000-55ec-3f44-a440-b1495096d890	6217	Vremski Britof
00050000-55ec-3f44-1280-fadd7a1952cc	1360	Vrhnika
00050000-55ec-3f44-7f37-470531253d03	2365	Vuhred
00050000-55ec-3f44-feae-fe5974bf7deb	2367	Vuzenica
00050000-55ec-3f44-a86d-f10211e9ba0b	8292	Zabukovje 
00050000-55ec-3f44-405b-df202ddadcee	1410	Zagorje ob Savi
00050000-55ec-3f44-eb29-9fb898968bc1	1303	Zagradec
00050000-55ec-3f44-0f92-d4e5ee95d11f	2283	Zavrč
00050000-55ec-3f44-a9a3-f739968772c4	8272	Zdole 
00050000-55ec-3f44-0cf5-7b56f7146b59	4201	Zgornja Besnica
00050000-55ec-3f44-9313-8322712b81a3	2242	Zgornja Korena
00050000-55ec-3f44-4517-17e4c4caaf94	2201	Zgornja Kungota
00050000-55ec-3f44-d7b9-d1bcb0ef3743	2316	Zgornja Ložnica
00050000-55ec-3f44-9331-5cda421f5075	2314	Zgornja Polskava
00050000-55ec-3f44-5181-dc2089a3306f	2213	Zgornja Velka
00050000-55ec-3f44-8ecd-b35fde278967	4247	Zgornje Gorje
00050000-55ec-3f44-508e-2e6f47c57d6d	4206	Zgornje Jezersko
00050000-55ec-3f44-b69c-957419dd6cee	2285	Zgornji Leskovec
00050000-55ec-3f44-5659-7542fd526dc0	1432	Zidani Most
00050000-55ec-3f44-8ac7-d819b6b251fc	3214	Zreče
00050000-55ec-3f44-6294-452692f81cf3	4209	Žabnica
00050000-55ec-3f44-3202-23fd0f52510a	3310	Žalec
00050000-55ec-3f44-f675-e9c75c30284d	4228	Železniki
00050000-55ec-3f44-b2de-11ca261be87d	2287	Žetale
00050000-55ec-3f44-1386-cb44463f7ecb	4226	Žiri
00050000-55ec-3f44-b778-610305746921	4274	Žirovnica
00050000-55ec-3f44-34d3-d4165958987e	8360	Žužemberk
\.


--
-- TOC entry 3217 (class 0 OID 1161117)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3202 (class 0 OID 1160965)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55ec-3f4e-c788-1bb6329f772e	00080000-55ec-3f4e-a90e-67d778c55a6e	\N	00040000-55ec-3f44-b17b-0431b0b30b1a	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55ec-3f4e-acdc-4054ce77386e	00080000-55ec-3f4e-a90e-67d778c55a6e	\N	00040000-55ec-3f44-b17b-0431b0b30b1a		\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55ec-3f4e-d5cf-7109ab2f36f6	00080000-55ec-3f4e-2983-74d0a9b53b3f	\N	00040000-55ec-3f44-b17b-0431b0b30b1a		\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3208 (class 0 OID 1161044)
-- Dependencies: 196
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 3218 (class 0 OID 1161123)
-- Dependencies: 206
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3242 (class 0 OID 1161444)
-- Dependencies: 230
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3243 (class 0 OID 1161454)
-- Dependencies: 231
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55ec-3f4e-4da4-3165022af715	00080000-55ec-3f4e-c38f-c8505c0e7a9e	0987	AK
00190000-55ec-3f4e-16fe-9f2ad4bfb40a	00080000-55ec-3f4e-2983-74d0a9b53b3f	0989	AK
00190000-55ec-3f4e-dbca-f9e4f87ba4af	00080000-55ec-3f4e-0f56-b238d4c67476	0986	AK
00190000-55ec-3f4e-9db4-d61f1aaf7eea	00080000-55ec-3f4e-e55f-c4b943775278	0984	AK
00190000-55ec-3f4e-e9eb-e2b483ee54fd	00080000-55ec-3f4e-8185-3bfeef0abdcf	0983	AK
00190000-55ec-3f4e-8b44-c873d58b88af	00080000-55ec-3f4e-5c1f-4e070c551207	0982	AK
\.


--
-- TOC entry 3244 (class 0 OID 1161462)
-- Dependencies: 232
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55ec-3f4f-97aa-5c8db7cadb83	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3245 (class 0 OID 1161505)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3219 (class 0 OID 1161130)
-- Dependencies: 207
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, seplanira, kapaciteta, opis) FROM stdin;
00220000-55ec-3f4e-820e-a4581270b66a	\N	\N	0001	Poskusna 1	f	t	8	Poskusna učilnica v prvem
00220000-55ec-3f4e-064c-6b1e272c3338	\N	\N	0002	Poskusna 3	f	f	34	Poskusna učilnica v tretjem
00220000-55ec-3f4e-c5f8-2df693da174b	\N	\N	0003	Kazinska	t	t	84	Kazinska dvorana
00220000-55ec-3f4e-237d-cf7b20d46958	\N	\N	0004	Mali oder	t	t	24	Mali oder 
00220000-55ec-3f4e-921e-c0f2d038364c	\N	\N	0005	Komorni oder	t	t	15	Komorni oder
00220000-55ec-3f4e-8ddc-eaad140b50fb	\N	\N	0006	Stara dvorana	t	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55ec-3f4e-a809-21fe7a24708f	\N	\N	0007	Velika dvorana	t	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3220 (class 0 OID 1161143)
-- Dependencies: 208
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3221 (class 0 OID 1161152)
-- Dependencies: 209
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3231 (class 0 OID 1161272)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3232 (class 0 OID 1161283)
-- Dependencies: 220
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 1160806)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 3261 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 3222 (class 0 OID 1161162)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 1160815)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55ec-3f44-1ac8-f925ec106cb9	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55ec-3f44-5551-4c9ae7929c98	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55ec-3f44-ab33-305ad64fae13	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55ec-3f44-8ff9-7f66cbc3e450	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55ec-3f44-bbaf-e5602f198fb7	planer	Planer dogodkov v koledarju	t
00020000-55ec-3f44-ec7d-02b88e44d47c	kadrovska	Kadrovska služba	t
00020000-55ec-3f44-3b06-6c7a482020b1	arhivar	Ažuriranje arhivalij	t
00020000-55ec-3f44-d975-6048781b1594	igralec	Igralec	t
00020000-55ec-3f44-8236-8a25e2ca830a	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55ec-3f4e-75c7-d673342f7153	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3193 (class 0 OID 1160845)
-- Dependencies: 181
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55ec-3f44-0964-3273bf93b64d	00020000-55ec-3f44-ab33-305ad64fae13
00010000-55ec-3f44-42e6-713332ab5413	00020000-55ec-3f44-ab33-305ad64fae13
00010000-55ec-3f4e-196d-a0af57d1f652	00020000-55ec-3f4e-75c7-d673342f7153
\.


--
-- TOC entry 3223 (class 0 OID 1161168)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3224 (class 0 OID 1161180)
-- Dependencies: 212
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3209 (class 0 OID 1161051)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 1160771)
-- Dependencies: 172
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55ec-3f44-d7cb-5889e1b71845	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55ec-3f45-35b3-feab5ace0e15	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55ec-3f45-86f3-0c59299fe9ad	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55ec-3f45-3eda-d8f2908a121d	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55ec-3f45-0e06-bf686fbf8d45	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3185 (class 0 OID 1160782)
-- Dependencies: 173
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55ec-3f45-1e7f-0aca0adeebca	00230000-55ec-3f45-3eda-d8f2908a121d	popa
00240000-55ec-3f45-5974-73f5b9f476eb	00230000-55ec-3f45-3eda-d8f2908a121d	oseba
00240000-55ec-3f45-7966-ec1dcdbd718c	00230000-55ec-3f45-3eda-d8f2908a121d	sezona
00240000-55ec-3f45-6f03-de679fe2ee10	00230000-55ec-3f45-35b3-feab5ace0e15	prostor
00240000-55ec-3f45-810b-2de74dd2eca6	00230000-55ec-3f45-3eda-d8f2908a121d	besedilo
00240000-55ec-3f45-39ac-570f3e43886a	00230000-55ec-3f45-3eda-d8f2908a121d	uprizoritev
00240000-55ec-3f45-528e-fc68d0d974d1	00230000-55ec-3f45-3eda-d8f2908a121d	funkcija
00240000-55ec-3f45-38b8-b838f5618b71	00230000-55ec-3f45-3eda-d8f2908a121d	tipfunkcije
00240000-55ec-3f45-9a63-c2866fafae02	00230000-55ec-3f45-3eda-d8f2908a121d	alternacija
00240000-55ec-3f45-9efa-6e536be03e6e	00230000-55ec-3f44-d7cb-5889e1b71845	pogodba
00240000-55ec-3f45-9fe9-0b4ac4e29ef2	00230000-55ec-3f45-3eda-d8f2908a121d	zaposlitev
00240000-55ec-3f45-b44b-a9ed07677d6b	00230000-55ec-3f45-3eda-d8f2908a121d	zvrstuprizoritve
00240000-55ec-3f45-5528-0f62c0f6d8b3	00230000-55ec-3f44-d7cb-5889e1b71845	programdela
00240000-55ec-3f45-93ed-f597386bcca3	00230000-55ec-3f45-3eda-d8f2908a121d	zapis
\.


--
-- TOC entry 3186 (class 0 OID 1160790)
-- Dependencies: 174
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3233 (class 0 OID 1161293)
-- Dependencies: 221
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55ec-3f4f-c25a-58f988561b5a	000e0000-55ec-3f4e-734f-a8a17e0ca15e	00080000-55ec-3f4e-a90e-67d778c55a6e	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55ec-3f45-cecc-b46191a804fc
00270000-55ec-3f4f-c8e8-498643f4748f	000e0000-55ec-3f4e-734f-a8a17e0ca15e	00080000-55ec-3f4e-a90e-67d778c55a6e	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55ec-3f45-cecc-b46191a804fc
00270000-55ec-3f4f-d21c-ad9694a061d8	000e0000-55ec-3f4e-734f-a8a17e0ca15e	00080000-55ec-3f4e-e331-7906d801a19b	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4	\N
\.


--
-- TOC entry 3203 (class 0 OID 1160980)
-- Dependencies: 191
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 1161076)
-- Dependencies: 200
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55ec-3f4f-a7ef-228f37900592	00180000-55ec-3f4f-d405-3cd6d5532cef	000c0000-55ec-3f4f-5842-386f23a2c0eb	00090000-55ec-3f4e-b1df-84e3de7851dc	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ec-3f4f-7237-839a8e02daed	00180000-55ec-3f4f-d405-3cd6d5532cef	000c0000-55ec-3f4f-7c9c-85aa429409d3	00090000-55ec-3f4e-7ea6-9ca0ce6d1c80	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ec-3f4f-3acf-94790acd05ff	00180000-55ec-3f4f-d405-3cd6d5532cef	000c0000-55ec-3f4f-1efb-bb3f954dbd12	00090000-55ec-3f4e-016c-35c5b29d832a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ec-3f4f-70f4-1c86daf71f28	00180000-55ec-3f4f-d405-3cd6d5532cef	000c0000-55ec-3f4f-22b7-f52d613fcf90	00090000-55ec-3f4e-7e6f-2638e0b8bdd3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ec-3f4f-4932-0fe07127c921	00180000-55ec-3f4f-d405-3cd6d5532cef	000c0000-55ec-3f4f-2bcf-f91421043d9d	00090000-55ec-3f4e-c630-5d8c9a519d14	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ec-3f4f-dcee-89e3931451b4	00180000-55ec-3f4f-a157-051955acb26e	\N	00090000-55ec-3f4e-c630-5d8c9a519d14	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3234 (class 0 OID 1161307)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55ec-3f45-00ac-efef2bc5dbf1	Avtor	Avtorji	Avtorka	umetnik
000f0000-55ec-3f45-98ca-4698759e1c73	Priredba	Priredba	Priredba	umetnik
000f0000-55ec-3f45-ca83-323fa13409a9	Prevod	Prevod	Prevod	umetnik
000f0000-55ec-3f45-5e96-d42979de0d0e	Režija	Režija	Režija	umetnik
000f0000-55ec-3f45-2ea3-34cf5cc89216	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55ec-3f45-ce11-13cf8f5904ae	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55ec-3f45-c90b-2fcb3e010afa	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55ec-3f45-b6f3-be4e237e3335	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55ec-3f45-2e43-a9f051547603	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55ec-3f45-44a4-fc9e24849f12	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55ec-3f45-e976-258b190398cc	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55ec-3f45-f73d-31e8763acca7	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55ec-3f45-4b9e-539ae9b23ad2	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55ec-3f45-f570-8400ad9e0fdb	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55ec-3f45-bcf5-73246233904d	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55ec-3f45-962d-cacb5148e1fe	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55ec-3f45-e984-5452ea9b3bcb	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55ec-3f45-b0fa-e665c2dd193f	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3246 (class 0 OID 1161515)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55ec-3f45-7858-e63ca253499f	01	Velika predstava	f	1.00	1.00
002b0000-55ec-3f45-6abe-7bf9efce0dc8	02	Mala predstava	f	0.50	0.50
002b0000-55ec-3f45-6747-cd78dbc41589	03	Mala koprodukcija	t	0.40	1.00
002b0000-55ec-3f45-4569-d8078dea7697	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55ec-3f45-5176-1fbaf1c7dbed	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3204 (class 0 OID 1160988)
-- Dependencies: 192
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3192 (class 0 OID 1160832)
-- Dependencies: 180
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55ec-3f44-42e6-713332ab5413	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROp/MZMfja0DSgtjoKy8RUCEmLB6Ksmv6	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55ec-3f44-0964-3273bf93b64d	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
00010000-55ec-3f4e-dd49-cc3b82a4522e	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55ec-3f4e-b4e6-87e917425a96	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55ec-3f4e-ec0c-a31b5062409c	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55ec-3f4e-56c3-dbcf5cb0b3e6	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55ec-3f4e-9e35-589524b783e1	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55ec-3f4e-8b57-750632587837	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55ec-3f4e-0c67-30e4368d7611	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55ec-3f4e-a561-6b9f0bf85b87	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55ec-3f4e-673e-3c8182bd64ae	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55ec-3f4e-196d-a0af57d1f652	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3235 (class 0 OID 1161318)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55ec-3f4e-1d01-304c297b2ab1	00160000-55ec-3f4e-d7d4-975572b89b61	\N	00140000-55ec-3f45-52f3-01060cc6c7f5	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55ec-3f4e-921e-c0f2d038364c
000e0000-55ec-3f4e-734f-a8a17e0ca15e	00160000-55ec-3f4e-52b0-2320f29174bc	\N	00140000-55ec-3f45-0fe2-3e95dddda5d2	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55ec-3f4e-8ddc-eaad140b50fb
000e0000-55ec-3f4e-ab90-1cda02727dc8	\N	\N	00140000-55ec-3f45-0fe2-3e95dddda5d2	00190000-55ec-3f4e-4da4-3165022af715	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55ec-3f4e-921e-c0f2d038364c
000e0000-55ec-3f4e-f0fd-dd94809ac353	\N	\N	00140000-55ec-3f45-0fe2-3e95dddda5d2	00190000-55ec-3f4e-4da4-3165022af715	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55ec-3f4e-921e-c0f2d038364c
000e0000-55ec-3f4e-f5c1-1e4d083cedc8	\N	\N	00140000-55ec-3f45-0fe2-3e95dddda5d2	00190000-55ec-3f4e-4da4-3165022af715	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55ec-3f4e-820e-a4581270b66a
000e0000-55ec-3f4e-31af-d2e638d71bd0	\N	\N	00140000-55ec-3f45-0fe2-3e95dddda5d2	00190000-55ec-3f4e-4da4-3165022af715	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55ec-3f4e-820e-a4581270b66a
\.


--
-- TOC entry 3210 (class 0 OID 1161061)
-- Dependencies: 198
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55ec-3f4f-6499-4862b603215a	000e0000-55ec-3f4e-734f-a8a17e0ca15e	\N	1	
00200000-55ec-3f4f-1784-60f63da2f15a	000e0000-55ec-3f4e-734f-a8a17e0ca15e	\N	2	
\.


--
-- TOC entry 3225 (class 0 OID 1161186)
-- Dependencies: 213
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3236 (class 0 OID 1161343)
-- Dependencies: 224
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55ec-3f45-876e-7bf1f9d7859d	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55ec-3f45-1398-0c537b8cb138	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55ec-3f45-3185-c9b0f5ce08e0	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55ec-3f45-1b7e-bdceff4be071	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55ec-3f45-79e2-df56c04811ea	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55ec-3f45-f79d-93ef3f9ee056	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55ec-3f45-27dc-2686e40136b8	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55ec-3f45-e3fc-500dd9ca29f9	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55ec-3f45-cecc-b46191a804fc	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55ec-3f45-d598-9dd42c7b57c3	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55ec-3f45-9483-288e22d16b35	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55ec-3f45-8195-43e0ed64a19a	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55ec-3f45-6f0d-1f195bc36a08	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55ec-3f45-6826-cbbaf74035d3	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55ec-3f45-abea-4dc11e51108b	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55ec-3f45-a1b4-aadb65c11534	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55ec-3f45-b96c-f0462fbc1883	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55ec-3f45-bce4-01aeff545aff	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55ec-3f45-6208-d1499c76bdf6	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55ec-3f45-2652-b1d8e168c58a	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55ec-3f45-c91b-95aeeabd253e	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55ec-3f45-5dfe-cca215a2a382	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55ec-3f45-9749-19eac89d45b8	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55ec-3f45-4069-2036672df150	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55ec-3f45-0d5a-04216e9c2be5	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55ec-3f45-99cb-3dae5d70e0d6	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55ec-3f45-b8ba-d65c298d380a	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55ec-3f45-2556-dc33cbafa6c3	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3251 (class 0 OID 1161569)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3252 (class 0 OID 1161581)
-- Dependencies: 240
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3253 (class 0 OID 1161609)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3237 (class 0 OID 1161352)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55ec-3f4e-1687-073771fe3d8e	00090000-55ec-3f4e-7ea6-9ca0ce6d1c80	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ec-3f4e-d7ec-88ae8882a672	00090000-55ec-3f4e-016c-35c5b29d832a	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ec-3f4e-23b5-daa2215889e0	00090000-55ec-3f4e-d60c-29b904465f75	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ec-3f4e-bd9e-09aa5e897e23	00090000-55ec-3f4e-0959-c39f1b3ea9d1	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ec-3f4e-d763-0645a2d398cc	00090000-55ec-3f4e-b1df-84e3de7851dc	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ec-3f4e-2d16-df0d1dd0cef6	00090000-55ec-3f4e-b424-4902db12b737	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 3211 (class 0 OID 1161071)
-- Dependencies: 199
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3238 (class 0 OID 1161362)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55ec-3f45-52f3-01060cc6c7f5	01	Drama	drama (SURS 01)
00140000-55ec-3f45-d404-18e712d7b2b6	02	Opera	opera (SURS 02)
00140000-55ec-3f45-f2d0-25ec99e0d10e	03	Balet	balet (SURS 03)
00140000-55ec-3f45-95b5-62732ff32cb5	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55ec-3f45-65f9-09c2a9fbaff0	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55ec-3f45-0fe2-3e95dddda5d2	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55ec-3f45-a92f-9b1e691e4038	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3239 (class 0 OID 1161372)
-- Dependencies: 227
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2742 (class 2606 OID 1160860)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2868 (class 2606 OID 1161201)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 1161221)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 1161240)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2949 (class 2606 OID 1161539)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 1161017)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 1161032)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2924 (class 2606 OID 1161387)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 1160873)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2927 (class 2606 OID 1161438)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2881 (class 2606 OID 1161252)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 1161042)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 1160887)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 1161093)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2954 (class 2606 OID 1161550)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2958 (class 2606 OID 1161557)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2962 (class 2606 OID 1161566)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 1161101)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 1160900)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 1160910)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 1160934)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 1160829)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2725 (class 2606 OID 1160803)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 1161107)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 1161116)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2889 (class 2606 OID 1161267)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 1160954)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 1160963)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 1161121)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 1160976)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 1161048)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 1161127)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2936 (class 2606 OID 1161451)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2938 (class 2606 OID 1161459)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2942 (class 2606 OID 1161504)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2945 (class 2606 OID 1161513)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 1161138)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 1161147)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 1161157)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2892 (class 2606 OID 1161282)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2896 (class 2606 OID 1161290)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 1160814)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 1161166)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 1160849)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2729 (class 2606 OID 1160823)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 1161176)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 1161185)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 1161059)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 1160780)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 1160787)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 1160794)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 1161303)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 1160985)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2818 (class 2606 OID 1161085)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 1161317)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2947 (class 2606 OID 1161525)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 1160999)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 1160844)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2911 (class 2606 OID 1161336)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2811 (class 2606 OID 1161069)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 1161192)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2913 (class 2606 OID 1161351)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2965 (class 2606 OID 1161579)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2972 (class 2606 OID 1161603)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2975 (class 2606 OID 1161615)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2916 (class 2606 OID 1161360)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 1161075)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2919 (class 2606 OID 1161370)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2922 (class 2606 OID 1161380)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2787 (class 1259 OID 1161026)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2788 (class 1259 OID 1161027)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2789 (class 1259 OID 1161025)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2790 (class 1259 OID 1161024)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2897 (class 1259 OID 1161304)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2898 (class 1259 OID 1161305)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2899 (class 1259 OID 1161306)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2951 (class 1259 OID 1161552)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2952 (class 1259 OID 1161551)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2765 (class 1259 OID 1160956)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2824 (class 1259 OID 1161108)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2966 (class 1259 OID 1161607)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2967 (class 1259 OID 1161606)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2968 (class 1259 OID 1161608)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2969 (class 1259 OID 1161605)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2970 (class 1259 OID 1161604)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2832 (class 1259 OID 1161129)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2833 (class 1259 OID 1161128)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2809 (class 1259 OID 1161070)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2882 (class 1259 OID 1161253)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2883 (class 1259 OID 1161255)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2884 (class 1259 OID 1161254)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2749 (class 1259 OID 1160889)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2750 (class 1259 OID 1160888)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2943 (class 1259 OID 1161514)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2885 (class 1259 OID 1161269)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2886 (class 1259 OID 1161270)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2887 (class 1259 OID 1161271)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2973 (class 1259 OID 1161616)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2904 (class 1259 OID 1161341)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2905 (class 1259 OID 1161338)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2906 (class 1259 OID 1161342)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2907 (class 1259 OID 1161340)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2908 (class 1259 OID 1161339)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2781 (class 1259 OID 1161001)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2782 (class 1259 OID 1161000)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2760 (class 1259 OID 1160937)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2854 (class 1259 OID 1161167)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2731 (class 1259 OID 1160830)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2732 (class 1259 OID 1160831)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2857 (class 1259 OID 1161179)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2858 (class 1259 OID 1161178)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2859 (class 1259 OID 1161177)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2802 (class 1259 OID 1161049)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2803 (class 1259 OID 1161050)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2718 (class 1259 OID 1160789)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2848 (class 1259 OID 1161161)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2849 (class 1259 OID 1161159)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2850 (class 1259 OID 1161158)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2851 (class 1259 OID 1161160)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2737 (class 1259 OID 1160850)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2738 (class 1259 OID 1160851)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2864 (class 1259 OID 1161193)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2950 (class 1259 OID 1161540)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2959 (class 1259 OID 1161567)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2960 (class 1259 OID 1161568)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2829 (class 1259 OID 1161122)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2893 (class 1259 OID 1161291)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2894 (class 1259 OID 1161292)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2928 (class 1259 OID 1161443)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2929 (class 1259 OID 1161442)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2930 (class 1259 OID 1161439)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2931 (class 1259 OID 1161440)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2932 (class 1259 OID 1161441)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2772 (class 1259 OID 1160978)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2773 (class 1259 OID 1160977)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2774 (class 1259 OID 1160979)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2836 (class 1259 OID 1161142)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2837 (class 1259 OID 1161141)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2933 (class 1259 OID 1161452)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2934 (class 1259 OID 1161453)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2869 (class 1259 OID 1161205)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2870 (class 1259 OID 1161206)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2871 (class 1259 OID 1161203)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2872 (class 1259 OID 1161204)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2914 (class 1259 OID 1161361)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2842 (class 1259 OID 1161151)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2843 (class 1259 OID 1161150)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2844 (class 1259 OID 1161148)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2845 (class 1259 OID 1161149)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2876 (class 1259 OID 1161223)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2877 (class 1259 OID 1161222)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2801 (class 1259 OID 1161043)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2925 (class 1259 OID 1161388)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2955 (class 1259 OID 1161558)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2956 (class 1259 OID 1161559)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2756 (class 1259 OID 1160912)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2757 (class 1259 OID 1160911)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2777 (class 1259 OID 1160986)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2778 (class 1259 OID 1160987)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2814 (class 1259 OID 1161088)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2815 (class 1259 OID 1161087)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2816 (class 1259 OID 1161086)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2791 (class 1259 OID 1161019)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2792 (class 1259 OID 1161020)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2793 (class 1259 OID 1161018)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2794 (class 1259 OID 1161022)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2795 (class 1259 OID 1161023)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2796 (class 1259 OID 1161021)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2768 (class 1259 OID 1160955)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2745 (class 1259 OID 1160874)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2746 (class 1259 OID 1160876)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2747 (class 1259 OID 1160875)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2748 (class 1259 OID 1160877)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2821 (class 1259 OID 1161094)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2890 (class 1259 OID 1161268)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2909 (class 1259 OID 1161337)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2763 (class 1259 OID 1160935)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2764 (class 1259 OID 1160936)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2920 (class 1259 OID 1161381)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2717 (class 1259 OID 1160781)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2755 (class 1259 OID 1160901)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2721 (class 1259 OID 1160788)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2840 (class 1259 OID 1161140)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2841 (class 1259 OID 1161139)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2873 (class 1259 OID 1161202)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2771 (class 1259 OID 1160964)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2917 (class 1259 OID 1161371)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2963 (class 1259 OID 1161580)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2939 (class 1259 OID 1161460)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2940 (class 1259 OID 1161461)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2808 (class 1259 OID 1161060)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2730 (class 1259 OID 1160824)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 3000 (class 2606 OID 1161717)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2999 (class 2606 OID 1161722)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2995 (class 2606 OID 1161742)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 3001 (class 2606 OID 1161712)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2997 (class 2606 OID 1161732)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2996 (class 2606 OID 1161737)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2998 (class 2606 OID 1161727)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 3045 (class 2606 OID 1161952)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 3044 (class 2606 OID 1161957)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3043 (class 2606 OID 1161962)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3063 (class 2606 OID 1162057)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3064 (class 2606 OID 1162052)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2987 (class 2606 OID 1161672)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 3010 (class 2606 OID 1161787)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3070 (class 2606 OID 1162097)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3071 (class 2606 OID 1162092)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3069 (class 2606 OID 1162102)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3072 (class 2606 OID 1162087)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3073 (class 2606 OID 1162082)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 3012 (class 2606 OID 1161802)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 3013 (class 2606 OID 1161797)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 3005 (class 2606 OID 1161762)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3037 (class 2606 OID 1161912)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3035 (class 2606 OID 1161922)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 3036 (class 2606 OID 1161917)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2981 (class 2606 OID 1161647)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2982 (class 2606 OID 1161642)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 1161782)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3061 (class 2606 OID 1162042)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3040 (class 2606 OID 1161927)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 3039 (class 2606 OID 1161932)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3038 (class 2606 OID 1161937)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3074 (class 2606 OID 1162107)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 3047 (class 2606 OID 1161982)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 3050 (class 2606 OID 1161967)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 3046 (class 2606 OID 1161987)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 3048 (class 2606 OID 1161977)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 3049 (class 2606 OID 1161972)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2993 (class 2606 OID 1161707)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2994 (class 2606 OID 1161702)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2985 (class 2606 OID 1161667)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2986 (class 2606 OID 1161662)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 3024 (class 2606 OID 1161857)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2978 (class 2606 OID 1161622)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2977 (class 2606 OID 1161627)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 3025 (class 2606 OID 1161872)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3026 (class 2606 OID 1161867)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 3027 (class 2606 OID 1161862)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 3004 (class 2606 OID 1161752)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3003 (class 2606 OID 1161757)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2976 (class 2606 OID 1161617)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 3020 (class 2606 OID 1161852)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 3022 (class 2606 OID 1161842)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 3023 (class 2606 OID 1161837)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 3021 (class 2606 OID 1161847)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2980 (class 2606 OID 1161632)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2979 (class 2606 OID 1161637)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 3028 (class 2606 OID 1161877)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3062 (class 2606 OID 1162047)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 3068 (class 2606 OID 1162072)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3067 (class 2606 OID 1162077)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 3011 (class 2606 OID 1161792)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 3042 (class 2606 OID 1161942)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 3041 (class 2606 OID 1161947)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3053 (class 2606 OID 1162022)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3054 (class 2606 OID 1162017)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3057 (class 2606 OID 1162002)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3056 (class 2606 OID 1162007)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3055 (class 2606 OID 1162012)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2989 (class 2606 OID 1161682)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2990 (class 2606 OID 1161677)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2988 (class 2606 OID 1161687)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 3014 (class 2606 OID 1161812)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 3015 (class 2606 OID 1161807)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3059 (class 2606 OID 1162027)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3058 (class 2606 OID 1162032)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 3030 (class 2606 OID 1161892)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 3029 (class 2606 OID 1161897)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 3032 (class 2606 OID 1161882)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 3031 (class 2606 OID 1161887)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 3051 (class 2606 OID 1161992)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 3016 (class 2606 OID 1161832)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 3017 (class 2606 OID 1161827)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3019 (class 2606 OID 1161817)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 3018 (class 2606 OID 1161822)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 3033 (class 2606 OID 1161907)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3034 (class 2606 OID 1161902)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 3002 (class 2606 OID 1161747)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 3060 (class 2606 OID 1162037)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3052 (class 2606 OID 1161997)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3066 (class 2606 OID 1162062)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3065 (class 2606 OID 1162067)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2983 (class 2606 OID 1161657)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2984 (class 2606 OID 1161652)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2992 (class 2606 OID 1161692)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2991 (class 2606 OID 1161697)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 1161777)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 3007 (class 2606 OID 1161772)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 3008 (class 2606 OID 1161767)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-06 15:27:49 CEST

--
-- PostgreSQL database dump complete
--

