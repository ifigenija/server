--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.0
-- Dumped by pg_dump version 9.4.0
-- Started on 2015-09-06 20:33:30 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 182 (class 1259 OID 1197298)
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
-- TOC entry 214 (class 1259 OID 1197640)
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
-- TOC entry 215 (class 1259 OID 1197653)
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
-- TOC entry 216 (class 1259 OID 1197670)
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
-- TOC entry 235 (class 1259 OID 1197973)
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
-- TOC entry 193 (class 1259 OID 1197448)
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
-- TOC entry 194 (class 1259 OID 1197474)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 1197829)
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
-- TOC entry 183 (class 1259 OID 1197307)
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
-- TOC entry 229 (class 1259 OID 1197836)
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
-- TOC entry 217 (class 1259 OID 1197687)
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
-- TOC entry 195 (class 1259 OID 1197479)
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
-- TOC entry 184 (class 1259 OID 1197324)
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
-- TOC entry 201 (class 1259 OID 1197535)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 236 (class 1259 OID 1197988)
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
-- TOC entry 237 (class 1259 OID 1198000)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 1198007)
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
-- TOC entry 202 (class 1259 OID 1197541)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 185 (class 1259 OID 1197336)
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
-- TOC entry 186 (class 1259 OID 1197348)
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
-- TOC entry 187 (class 1259 OID 1197359)
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
-- TOC entry 175 (class 1259 OID 1197241)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 1197271)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 203 (class 1259 OID 1197548)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 204 (class 1259 OID 1197555)
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
-- TOC entry 218 (class 1259 OID 1197702)
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
-- TOC entry 188 (class 1259 OID 1197384)
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
-- TOC entry 189 (class 1259 OID 1197403)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 205 (class 1259 OID 1197563)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 1197411)
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
-- TOC entry 196 (class 1259 OID 1197490)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 206 (class 1259 OID 1197569)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 1197891)
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
-- TOC entry 231 (class 1259 OID 1197901)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 1197909)
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
-- TOC entry 233 (class 1259 OID 1197952)
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
-- TOC entry 207 (class 1259 OID 1197576)
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
-- TOC entry 208 (class 1259 OID 1197589)
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
-- TOC entry 209 (class 1259 OID 1197598)
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
-- TOC entry 219 (class 1259 OID 1197718)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 220 (class 1259 OID 1197729)
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
-- TOC entry 177 (class 1259 OID 1197252)
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
-- TOC entry 176 (class 1259 OID 1197250)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3261 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 1197608)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 1197261)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 181 (class 1259 OID 1197291)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 1197614)
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
-- TOC entry 212 (class 1259 OID 1197626)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 1197497)
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
-- TOC entry 172 (class 1259 OID 1197217)
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
-- TOC entry 173 (class 1259 OID 1197228)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 174 (class 1259 OID 1197236)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 221 (class 1259 OID 1197739)
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
-- TOC entry 191 (class 1259 OID 1197426)
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
-- TOC entry 200 (class 1259 OID 1197522)
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
-- TOC entry 222 (class 1259 OID 1197753)
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
-- TOC entry 234 (class 1259 OID 1197962)
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
-- TOC entry 192 (class 1259 OID 1197434)
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
-- TOC entry 180 (class 1259 OID 1197278)
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
-- TOC entry 223 (class 1259 OID 1197765)
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
-- TOC entry 198 (class 1259 OID 1197507)
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
-- TOC entry 213 (class 1259 OID 1197632)
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
-- TOC entry 224 (class 1259 OID 1197790)
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
-- TOC entry 239 (class 1259 OID 1198016)
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
-- TOC entry 240 (class 1259 OID 1198028)
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
-- TOC entry 241 (class 1259 OID 1198056)
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
-- TOC entry 225 (class 1259 OID 1197799)
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
-- TOC entry 199 (class 1259 OID 1197517)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 1197809)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 227 (class 1259 OID 1197819)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2463 (class 2604 OID 1197255)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3195 (class 0 OID 1197298)
-- Dependencies: 182
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3227 (class 0 OID 1197640)
-- Dependencies: 214
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55ec-86e4-c686-d70ee2b39b99	000d0000-55ec-86e4-22a1-55f89370d41e	\N	00090000-55ec-86e4-1b20-664992eac692	000b0000-55ec-86e4-23f1-f214dc56cf8f	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55ec-86e4-caf9-5ee45c30b61d	000d0000-55ec-86e4-b60b-45aa12cf0019	00100000-55ec-86e4-ed44-aa7bd8138dc4	00090000-55ec-86e4-0cb1-1381f3cc9f6a	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55ec-86e4-d2ab-f33ee11cc2ee	000d0000-55ec-86e4-c5c6-2cca7effcca1	00100000-55ec-86e4-9bfd-9ce4969d6f34	00090000-55ec-86e4-f495-e4cc1333eab4	\N	0003	t	\N	2015-09-06	\N	2	t	\N	f	f
000c0000-55ec-86e4-38ab-62b6e2372ca6	000d0000-55ec-86e4-2a50-5b4b2b881dcb	\N	00090000-55ec-86e4-d790-a98c4b784cdd	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55ec-86e4-db9f-207fd0096e9e	000d0000-55ec-86e4-4818-7aa2b63cfd03	\N	00090000-55ec-86e4-ff92-e37738b273b6	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55ec-86e4-a002-6913a099e45c	000d0000-55ec-86e4-08d2-f4fad3ed33d4	\N	00090000-55ec-86e4-d96a-54cc2a37c6de	000b0000-55ec-86e4-04b4-b9e6b6f411ab	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55ec-86e4-6280-0fa8f71b12cb	000d0000-55ec-86e4-0ef3-31e29e961be1	00100000-55ec-86e4-6ff9-2861ac3bbd2d	00090000-55ec-86e4-642a-9d521953298e	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55ec-86e4-69c6-8af40bde33c1	000d0000-55ec-86e4-3be2-ce3ed6ee84ab	\N	00090000-55ec-86e4-d70e-fbdd2cc22433	000b0000-55ec-86e4-d6a9-e5302bc9e4a3	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55ec-86e4-ede4-e87238a3df1b	000d0000-55ec-86e4-0ef3-31e29e961be1	00100000-55ec-86e4-9054-7f7f904f0160	00090000-55ec-86e4-2637-8e0315637d14	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55ec-86e4-a80d-38897a58ce8e	000d0000-55ec-86e4-0ef3-31e29e961be1	00100000-55ec-86e4-0b3a-aa991cce916b	00090000-55ec-86e4-95fe-de67472c42db	\N	0010	t	\N	2015-09-06	\N	16	f	\N	f	t
000c0000-55ec-86e4-0829-4c3bd095d2bf	000d0000-55ec-86e4-0ef3-31e29e961be1	00100000-55ec-86e4-2607-6e0599ef5b21	00090000-55ec-86e4-efe3-823c2bd4f0af	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
\.


--
-- TOC entry 3228 (class 0 OID 1197653)
-- Dependencies: 215
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3229 (class 0 OID 1197670)
-- Dependencies: 216
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55ec-86e4-a643-efe7ed68c64a	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55ec-86e4-4bb2-067d7ad15e5b	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55ec-86e4-43a8-feb4faf2b193	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 3248 (class 0 OID 1197973)
-- Dependencies: 235
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 1197448)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55ec-86e4-1b7f-6fe5a9afa0b7	\N	\N	00200000-55ec-86e4-370a-ae857499c2a9	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55ec-86e4-aa49-9c364ac0f072	\N	\N	00200000-55ec-86e4-7b41-e13391ec4ec9	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55ec-86e4-644d-0e595e1e1f2a	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55ec-86e4-e7fa-aefe030048af	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55ec-86e4-200a-9a99efeee032	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 3207 (class 0 OID 1197474)
-- Dependencies: 194
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3241 (class 0 OID 1197829)
-- Dependencies: 228
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 1197307)
-- Dependencies: 183
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55ec-86a5-e847-d5d307ef584e	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55ec-86a5-201f-4aa704bbad9b	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55ec-86a5-cd87-5506470ee275	AL	ALB	008	Albania 	Albanija	\N
00040000-55ec-86a5-c598-b96ba1443f4b	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55ec-86a5-f29b-cd56bf16a648	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55ec-86a5-faec-f5ec4b5b9800	AD	AND	020	Andorra 	Andora	\N
00040000-55ec-86a5-6831-b83d4206be0e	AO	AGO	024	Angola 	Angola	\N
00040000-55ec-86a5-c492-aa491d9913f9	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55ec-86a5-fe26-cd7cc58b7122	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55ec-86a5-d410-461793906f36	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55ec-86a5-b9a0-d8687666210a	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55ec-86a5-f8ca-f9fcae0bb24b	AM	ARM	051	Armenia 	Armenija	\N
00040000-55ec-86a5-c15f-1ae930bc344b	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55ec-86a5-c4bb-888dfc66d291	AU	AUS	036	Australia 	Avstralija	\N
00040000-55ec-86a5-9fd3-38d3500e41a6	AT	AUT	040	Austria 	Avstrija	\N
00040000-55ec-86a5-3f95-ccce3003c646	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55ec-86a5-8c89-ca4ed35cf6fb	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55ec-86a5-5937-33fffead1107	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55ec-86a5-5429-c53f469832ec	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55ec-86a5-b5db-c537ec1417bb	BB	BRB	052	Barbados 	Barbados	\N
00040000-55ec-86a5-53a1-1e7d0877a22a	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55ec-86a5-b946-ba8aa989ad83	BE	BEL	056	Belgium 	Belgija	\N
00040000-55ec-86a5-986c-7b89d0d91e75	BZ	BLZ	084	Belize 	Belize	\N
00040000-55ec-86a5-9de7-fc9d6ff3ef07	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55ec-86a5-4285-690ada01af11	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55ec-86a5-c36c-d5ea6b8528cb	BT	BTN	064	Bhutan 	Butan	\N
00040000-55ec-86a5-0c48-9b0f0da64c74	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55ec-86a5-9ebc-d255efe7310d	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55ec-86a5-8e74-2448f1bdee66	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55ec-86a5-ef7a-23c72b15a0e7	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55ec-86a5-8438-7cbddd92b78a	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55ec-86a5-6b3b-b1e539fd2fd2	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55ec-86a5-8479-a57dad5d06b9	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55ec-86a5-d206-54e03894ff4a	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55ec-86a5-05df-d159c249ed0e	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55ec-86a5-612c-8a6468d1a110	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55ec-86a5-4173-3a8bebe2b281	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55ec-86a5-9582-4ebbbc1666f3	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55ec-86a5-eda1-575496f46945	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55ec-86a5-dc56-81455d496895	CA	CAN	124	Canada 	Kanada	\N
00040000-55ec-86a5-1395-77cbf4a1b72b	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55ec-86a5-4d38-0ea91560f632	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55ec-86a5-b0c5-8309c8d6f175	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55ec-86a5-c765-e2a7c9514bad	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55ec-86a5-1ccf-59b7326d3cea	CL	CHL	152	Chile 	Čile	\N
00040000-55ec-86a5-6a95-b24780795e1e	CN	CHN	156	China 	Kitajska	\N
00040000-55ec-86a5-8add-31a3511c9442	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55ec-86a5-0ad7-db3effa0e268	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55ec-86a5-818c-bece6850629f	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55ec-86a5-fdc9-d1a9dee9c1b2	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55ec-86a5-f4f9-32a5b4280699	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55ec-86a5-4ae4-bc2b8d2195a3	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55ec-86a5-d758-7d38580df0b8	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55ec-86a5-15a9-4bd6e494e97b	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55ec-86a5-eb77-80e757127852	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55ec-86a5-f45c-1a3ecae2a954	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55ec-86a5-8210-fcbb6ad901e4	CU	CUB	192	Cuba 	Kuba	\N
00040000-55ec-86a5-cd51-7fe62809be62	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55ec-86a5-7b56-7eb3f05d2035	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55ec-86a5-b413-755141d5d2a8	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55ec-86a5-1619-8ec2d8baad25	DK	DNK	208	Denmark 	Danska	\N
00040000-55ec-86a5-86a3-48e43a713e41	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55ec-86a5-8f50-5ae62c39cc6e	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55ec-86a5-8c9a-297fcbcbb49a	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55ec-86a5-a05c-8a1b32f456ec	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55ec-86a5-a971-6f5f8cf3db01	EG	EGY	818	Egypt 	Egipt	\N
00040000-55ec-86a5-d4d8-67b67319c163	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55ec-86a5-ae1f-f7efb48c3073	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55ec-86a5-0e4f-ae9705f5ca86	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55ec-86a5-121f-86078ecba0e1	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55ec-86a5-7b3a-b5462204739c	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55ec-86a5-73b4-872dcc80aeee	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55ec-86a5-3d4d-5dec4c4f1bea	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55ec-86a5-bea2-65b866d9886f	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55ec-86a5-08ea-6d0f80758ca0	FI	FIN	246	Finland 	Finska	\N
00040000-55ec-86a5-473c-586b95232573	FR	FRA	250	France 	Francija	\N
00040000-55ec-86a5-25a2-f15d11084c54	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55ec-86a5-632c-100b54506cb6	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55ec-86a5-d1c4-5690160358e3	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55ec-86a5-b690-2eb35fa0e86b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55ec-86a5-e88d-172077c581f3	GA	GAB	266	Gabon 	Gabon	\N
00040000-55ec-86a5-cb71-49ee1e1440bf	GM	GMB	270	Gambia 	Gambija	\N
00040000-55ec-86a5-4073-383f25f9b3ef	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55ec-86a5-14b0-321ace99f676	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55ec-86a5-61eb-7034f0b1fca4	GH	GHA	288	Ghana 	Gana	\N
00040000-55ec-86a5-8845-7b0461e7cdcb	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55ec-86a5-dc28-fd749333abdc	GR	GRC	300	Greece 	Grčija	\N
00040000-55ec-86a5-3c40-1559f0fd8ba1	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55ec-86a5-75b6-268b7cf81b25	GD	GRD	308	Grenada 	Grenada	\N
00040000-55ec-86a5-647c-5ece8c88c216	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55ec-86a5-275c-30416e8bf7d3	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55ec-86a5-bad4-787f7d28d683	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55ec-86a5-7b98-97a429db63b5	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55ec-86a5-5122-881bba6ad9e6	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55ec-86a5-c3b0-1a11d6d5b120	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55ec-86a5-09d3-c9139c4b293e	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55ec-86a5-4232-c314fe8a9a0d	HT	HTI	332	Haiti 	Haiti	\N
00040000-55ec-86a5-18e4-5058a798a4e3	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55ec-86a5-cc7f-db01aea5c54e	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55ec-86a5-220f-6b43f18e4a75	HN	HND	340	Honduras 	Honduras	\N
00040000-55ec-86a5-f518-8bf0d63350d2	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55ec-86a5-b3f0-dcc36bc43e80	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55ec-86a5-8305-5c1d7c4aafb0	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55ec-86a5-e594-0bd2bd3d632a	IN	IND	356	India 	Indija	\N
00040000-55ec-86a5-96e4-1e7bf459fa9e	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55ec-86a5-6e97-c68604048116	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55ec-86a5-4c1a-67719593f8e4	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55ec-86a5-c3ca-4551409e885e	IE	IRL	372	Ireland 	Irska	\N
00040000-55ec-86a5-1e1a-9e7dbdb9b37b	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55ec-86a5-fea2-6020a2361e6b	IL	ISR	376	Israel 	Izrael	\N
00040000-55ec-86a5-df49-2f79fa5460fe	IT	ITA	380	Italy 	Italija	\N
00040000-55ec-86a5-c1fc-e13cfb936c0c	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55ec-86a5-70dd-f264c5a1aa6f	JP	JPN	392	Japan 	Japonska	\N
00040000-55ec-86a5-b8d1-b157325fb9e0	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55ec-86a5-8632-8eb7de8fe391	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55ec-86a5-fd8c-7f083507fc9f	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55ec-86a5-923b-fdf9552064a1	KE	KEN	404	Kenya 	Kenija	\N
00040000-55ec-86a5-8d31-482652e26c3b	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55ec-86a5-8b3a-f4c5b7ab5cb6	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55ec-86a5-390d-f0d336ff9853	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55ec-86a5-0b5f-427bf78fad72	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55ec-86a5-2b84-60eadff33f9d	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55ec-86a5-822f-671c5c1702b3	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55ec-86a5-3f3e-71ff56e4451f	LV	LVA	428	Latvia 	Latvija	\N
00040000-55ec-86a5-6395-30dee09412f3	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55ec-86a5-6f96-58a32c7bb787	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55ec-86a5-4bcf-12a37d9a1dce	LR	LBR	430	Liberia 	Liberija	\N
00040000-55ec-86a5-6fbe-9153ea21ee36	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55ec-86a5-e489-34180a56f757	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55ec-86a5-514d-6d46a5a6605b	LT	LTU	440	Lithuania 	Litva	\N
00040000-55ec-86a5-d5c8-cff0cd3dc7b2	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55ec-86a5-a257-ed117a7f0759	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55ec-86a5-d9f6-c4ee9c3ceeba	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55ec-86a5-4265-afcfe4399df7	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55ec-86a5-1808-49b841dca3d2	MW	MWI	454	Malawi 	Malavi	\N
00040000-55ec-86a5-f931-073251116e81	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55ec-86a5-998e-d0ebae1b924b	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55ec-86a5-f2ba-d8b230b8dff9	ML	MLI	466	Mali 	Mali	\N
00040000-55ec-86a5-6f1f-10155e5a9da2	MT	MLT	470	Malta 	Malta	\N
00040000-55ec-86a5-f53f-a94b37caeb07	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55ec-86a5-11f1-779474ab7de8	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55ec-86a5-7799-9efdc3d01d4a	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55ec-86a5-50e7-e3f203334d6a	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55ec-86a5-4809-16ba38d4123e	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55ec-86a5-97dd-ac8c87912a34	MX	MEX	484	Mexico 	Mehika	\N
00040000-55ec-86a5-dfe4-62d3f9a30533	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55ec-86a5-dd36-332248e03d46	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55ec-86a5-edc4-8e5836e78476	MC	MCO	492	Monaco 	Monako	\N
00040000-55ec-86a5-8220-3f264b1075ef	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55ec-86a5-0f39-2682341a6d62	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55ec-86a5-72c1-7ba705829065	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55ec-86a5-a7b7-dbe213a8f402	MA	MAR	504	Morocco 	Maroko	\N
00040000-55ec-86a5-72ee-58532a4503b0	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55ec-86a5-9a12-aba7b1ebdbce	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55ec-86a5-c750-9d2936fbe98e	NA	NAM	516	Namibia 	Namibija	\N
00040000-55ec-86a5-1c79-8b1976b3a5c0	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55ec-86a5-5e46-0207d8b31e94	NP	NPL	524	Nepal 	Nepal	\N
00040000-55ec-86a5-e90e-2f78641b6030	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55ec-86a5-f9b6-a4dd21302563	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55ec-86a5-7ddb-b41a7d2cfeba	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55ec-86a5-5125-eb6811aabec9	NE	NER	562	Niger 	Niger 	\N
00040000-55ec-86a5-aee7-41a9c86f3470	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55ec-86a5-978c-8cae862b2be5	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55ec-86a5-413f-e43ec1b0d151	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55ec-86a5-c706-2eb785ee9d32	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55ec-86a5-e7d1-6720ccf88951	NO	NOR	578	Norway 	Norveška	\N
00040000-55ec-86a5-198c-011b2345a44f	OM	OMN	512	Oman 	Oman	\N
00040000-55ec-86a5-8cc3-2b7dc24caa96	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55ec-86a5-acd1-712da27c1019	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55ec-86a5-e286-66aae82a86a3	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55ec-86a5-cf96-a8ae173ba2d8	PA	PAN	591	Panama 	Panama	\N
00040000-55ec-86a5-dabe-274f2a2eb79a	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55ec-86a5-ccab-192746c9e8fa	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55ec-86a5-3299-332bed9251be	PE	PER	604	Peru 	Peru	\N
00040000-55ec-86a5-08b8-6f6fd5df2a29	PH	PHL	608	Philippines 	Filipini	\N
00040000-55ec-86a5-6949-ed3e0ca00c1e	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55ec-86a5-965f-dd16f42bc74a	PL	POL	616	Poland 	Poljska	\N
00040000-55ec-86a5-fb94-dda29aa3b4a4	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55ec-86a5-ccb9-ba20bbf4503c	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55ec-86a5-ed26-c3ca35152d31	QA	QAT	634	Qatar 	Katar	\N
00040000-55ec-86a5-cd5d-3e87718f5f68	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55ec-86a5-eda1-362fdbc79a27	RO	ROU	642	Romania 	Romunija	\N
00040000-55ec-86a5-9a7f-e88c3203407f	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55ec-86a5-e24a-f6d1c7a98d37	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55ec-86a5-1ad9-fd51b25b08a3	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55ec-86a5-f8b5-31c5b94f2044	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55ec-86a5-3e74-c34bb0863edb	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55ec-86a5-3808-45d9a6c408c0	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55ec-86a5-4c7d-6e3f3ed9170d	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55ec-86a5-6ed0-2623e1a89b74	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55ec-86a5-b8d0-0ad5c9dc48f1	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55ec-86a5-9b53-795e2f6b3065	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55ec-86a5-1595-645eed341d89	SM	SMR	674	San Marino 	San Marino	\N
00040000-55ec-86a5-d669-0aac732eeca1	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55ec-86a5-b165-bfc64f7e89fc	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55ec-86a5-3767-96ecb7e453b0	SN	SEN	686	Senegal 	Senegal	\N
00040000-55ec-86a5-ef42-afc0506f57dc	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55ec-86a5-1a71-4b6f07de258b	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55ec-86a5-a6e7-ba0ad4878289	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55ec-86a5-1c5c-96b0fc60f116	SG	SGP	702	Singapore 	Singapur	\N
00040000-55ec-86a5-6ae7-654d6c786651	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55ec-86a5-aae4-54b0e301875d	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55ec-86a5-629e-91914bab27f9	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55ec-86a5-1948-13941a66733d	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55ec-86a5-d4d7-d126768e083c	SO	SOM	706	Somalia 	Somalija	\N
00040000-55ec-86a5-0f9e-9eee04db2a27	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55ec-86a5-8fa2-5c62ade85ec6	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55ec-86a5-e94a-dc9888798b70	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55ec-86a5-de55-78e8938ba78e	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55ec-86a5-bd19-c1bafe2e5ef9	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55ec-86a5-4ee9-efd1a68592ad	SD	SDN	729	Sudan 	Sudan	\N
00040000-55ec-86a5-2eb3-440766f3309d	SR	SUR	740	Suriname 	Surinam	\N
00040000-55ec-86a5-4860-f99016c5b211	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55ec-86a5-e26a-2fbae0159c8c	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55ec-86a5-5370-43762eb0e489	SE	SWE	752	Sweden 	Švedska	\N
00040000-55ec-86a5-7f66-79be61352b37	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55ec-86a5-0c2a-8e48b990a947	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55ec-86a5-29ce-fcbec91a9923	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55ec-86a5-5698-c77ad4c240d1	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55ec-86a5-c5ab-76c8356c41f8	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55ec-86a5-1e33-810b33f3c12c	TH	THA	764	Thailand 	Tajska	\N
00040000-55ec-86a5-1062-4a9f282b8c9f	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55ec-86a5-6775-2cb083ccd74f	TG	TGO	768	Togo 	Togo	\N
00040000-55ec-86a5-7691-03f2af381557	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55ec-86a5-c385-f7609ab78bdd	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55ec-86a5-32fa-55d1431255cd	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55ec-86a5-1abe-bb9f187ac5ce	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55ec-86a5-f5ca-1fb89846b5b4	TR	TUR	792	Turkey 	Turčija	\N
00040000-55ec-86a5-04db-cef3fd7c9b09	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55ec-86a5-2b83-5afd56a438ae	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55ec-86a5-bb56-891b2ce3fd06	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55ec-86a5-8ee5-338ae2cf563f	UG	UGA	800	Uganda 	Uganda	\N
00040000-55ec-86a5-ad4e-97a7b4d37854	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55ec-86a5-0a33-0409b4117b2f	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55ec-86a5-f7f7-1109d8760bf3	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55ec-86a5-7ebe-9cc372298a3a	US	USA	840	United States 	Združene države Amerike	\N
00040000-55ec-86a5-d832-ab13941831c5	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55ec-86a5-190b-f45534d4f8b6	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55ec-86a5-de0b-0cca6fa7619c	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55ec-86a5-cde0-9b7095705715	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55ec-86a5-a963-b6327c7c2ca3	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55ec-86a5-a9b0-f3fb29bd3137	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55ec-86a5-940d-1c833c12cdc0	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55ec-86a5-ea0b-8dd3f6f78002	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55ec-86a5-b389-09a19e4cce34	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55ec-86a5-b512-33e68b8fa7b5	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55ec-86a5-67f4-e883802058d0	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55ec-86a5-b18f-1a0581ffc1c6	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55ec-86a5-564f-af4b65db0ebb	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3242 (class 0 OID 1197836)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55ec-86e4-f66f-1183699a360e	000e0000-55ec-86e4-b8e0-97ffea9d8388	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ec-86a6-6ef7-c8ca536ee714	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55ec-86e4-42bf-7dca3aa6a45e	000e0000-55ec-86e4-1e02-4f0ff1f82398	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ec-86a6-a983-a55609f8011c	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55ec-86e4-aa01-08bdd59c69ca	000e0000-55ec-86e4-b973-626c965d69dd	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55ec-86a6-6ef7-c8ca536ee714	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55ec-86e4-eaf9-8382304e6374	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55ec-86e4-0c34-3e5cafff82b6	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3230 (class 0 OID 1197687)
-- Dependencies: 217
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55ec-86e4-22a1-55f89370d41e	000e0000-55ec-86e4-1e02-4f0ff1f82398	000c0000-55ec-86e4-c686-d70ee2b39b99	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55ec-86a6-1da5-d72b1d21453e
000d0000-55ec-86e4-b60b-45aa12cf0019	000e0000-55ec-86e4-1e02-4f0ff1f82398	000c0000-55ec-86e4-caf9-5ee45c30b61d	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55ec-86a6-128b-b0158d1bd694
000d0000-55ec-86e4-c5c6-2cca7effcca1	000e0000-55ec-86e4-1e02-4f0ff1f82398	000c0000-55ec-86e4-d2ab-f33ee11cc2ee	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55ec-86a6-2716-6a2d57c2155b
000d0000-55ec-86e4-2a50-5b4b2b881dcb	000e0000-55ec-86e4-1e02-4f0ff1f82398	000c0000-55ec-86e4-38ab-62b6e2372ca6	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55ec-86a6-743c-7ea2823a17ce
000d0000-55ec-86e4-4818-7aa2b63cfd03	000e0000-55ec-86e4-1e02-4f0ff1f82398	000c0000-55ec-86e4-db9f-207fd0096e9e	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55ec-86a6-743c-7ea2823a17ce
000d0000-55ec-86e4-08d2-f4fad3ed33d4	000e0000-55ec-86e4-1e02-4f0ff1f82398	000c0000-55ec-86e4-a002-6913a099e45c	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55ec-86a6-1da5-d72b1d21453e
000d0000-55ec-86e4-0ef3-31e29e961be1	000e0000-55ec-86e4-1e02-4f0ff1f82398	000c0000-55ec-86e4-ede4-e87238a3df1b	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55ec-86a6-1da5-d72b1d21453e
000d0000-55ec-86e4-3be2-ce3ed6ee84ab	000e0000-55ec-86e4-1e02-4f0ff1f82398	000c0000-55ec-86e4-69c6-8af40bde33c1	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55ec-86a6-fc9f-e1a15ac88fde
\.


--
-- TOC entry 3208 (class 0 OID 1197479)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 1197324)
-- Dependencies: 184
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55ec-86e4-6a65-dedb8a7575b7	00080000-55ec-86e4-5055-8cb6402a4b89	00090000-55ec-86e4-95fe-de67472c42db	AK		
\.


--
-- TOC entry 3214 (class 0 OID 1197535)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3249 (class 0 OID 1197988)
-- Dependencies: 236
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3250 (class 0 OID 1198000)
-- Dependencies: 237
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3251 (class 0 OID 1198007)
-- Dependencies: 238
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3215 (class 0 OID 1197541)
-- Dependencies: 202
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 1197336)
-- Dependencies: 185
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55ec-86a6-29f6-ecb349e68738	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55ec-86a6-b91f-4657aa28b6d2	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55ec-86a6-1a14-5cdbe6ea3e67	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55ec-86a6-4d9a-c5c5e6e5626f	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55ec-86a6-d87a-00aeb2f68ed6	dogodek.status	array	a:7:{i:100;a:1:{s:5:"label";s:11:"Dolgoročno";}i:200;a:1:{s:5:"label";s:9:"Planirano";}i:300;a:1:{s:5:"label";s:8:"Fiksiran";}i:400;a:1:{s:5:"label";s:17:"Potrjen - interno";}i:500;a:1:{s:5:"label";s:15:"Potrjen - javno";}i:600;a:1:{s:5:"label";s:10:"Zaključen";}i:700;a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55ec-86a6-e74c-50409e1c2371	dogodek.razred	array	a:5:{i:100;a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}i:200;a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}i:300;a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}i:400;a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}i:500;a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55ec-86a6-b0ce-b5b8584af5bd	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55ec-86a6-c7c3-b388d000ec70	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55ec-86a6-6a6a-08d629075b14	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55ec-86a6-2d23-80efcb818fda	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55ec-86a6-218a-1806a9f02449	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55ec-86a6-2b2f-f64572b86024	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55ec-86a6-e644-64ceee180191	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55ec-86a6-4fc0-2469e7f89dc0	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55ec-86e4-842e-50e58aac7d53	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55ec-86e4-0c2b-7391f53bc1da	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55ec-86e4-61be-cb39d5ef50d7	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55ec-86e4-b246-a6c2bb967946	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55ec-86e4-a9ea-9f59bb902cd5	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 3199 (class 0 OID 1197348)
-- Dependencies: 186
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55ec-86e4-526d-03048718d618	00000000-55ec-86e4-842e-50e58aac7d53	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55ec-86e4-ccb0-016355128261	00000000-55ec-86e4-842e-50e58aac7d53	00010000-55ec-86a6-3e54-cfe758d2262b	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55ec-86e4-8f08-f2698d9f5113	00000000-55ec-86e4-0c2b-7391f53bc1da	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3200 (class 0 OID 1197359)
-- Dependencies: 187
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55ec-86e4-1b20-664992eac692	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55ec-86e4-d790-a98c4b784cdd	00010000-55ec-86e4-595e-604aa0a1fea5	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55ec-86e4-f495-e4cc1333eab4	00010000-55ec-86e4-218c-9cf499616619	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55ec-86e4-2637-8e0315637d14	00010000-55ec-86e4-f88f-ff7b4cf055ef	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55ec-86e4-779d-1f8ccf56d2af	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55ec-86e4-d96a-54cc2a37c6de	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55ec-86e4-efe3-823c2bd4f0af	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55ec-86e4-642a-9d521953298e	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55ec-86e4-95fe-de67472c42db	00010000-55ec-86e4-ccf2-eb36ade6652c	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55ec-86e4-0cb1-1381f3cc9f6a	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55ec-86e4-adfa-29b70f3fe987	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55ec-86e4-ff92-e37738b273b6	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55ec-86e4-d70e-fbdd2cc22433	00010000-55ec-86e4-c35b-bb0b32e8958b	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 3188 (class 0 OID 1197241)
-- Dependencies: 175
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55ec-86a6-d863-b86feff2555f	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55ec-86a6-2de1-9e2c0c80cccb	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55ec-86a6-2ed8-5d6f41e40647	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55ec-86a6-d715-abec81d9431f	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55ec-86a6-6947-8687578711ba	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55ec-86a6-d956-754eec6c3d9f	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55ec-86a6-bb73-76c8860805be	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55ec-86a6-c413-b300467aaae0	Abonma-read	Abonma - branje	f
00030000-55ec-86a6-e940-b3b058cc1220	Abonma-write	Abonma - spreminjanje	f
00030000-55ec-86a6-d0a0-34374e7a7002	Alternacija-read	Alternacija - branje	f
00030000-55ec-86a6-9ed0-c78467fde176	Alternacija-write	Alternacija - spreminjanje	f
00030000-55ec-86a6-13a5-dd0400e941db	Arhivalija-read	Arhivalija - branje	f
00030000-55ec-86a6-3541-e6561a0f631a	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55ec-86a6-3d62-a65dc5089be8	Besedilo-read	Besedilo - branje	f
00030000-55ec-86a6-3382-5636d98427b5	Besedilo-write	Besedilo - spreminjanje	f
00030000-55ec-86a6-fb7c-f49c697d5018	DogodekIzven-read	DogodekIzven - branje	f
00030000-55ec-86a6-e209-31f09a0bd1ae	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55ec-86a6-4a4b-670648126659	Dogodek-read	Dogodek - branje	f
00030000-55ec-86a6-fcb1-0a7b1b7fd384	Dogodek-write	Dogodek - spreminjanje	f
00030000-55ec-86a6-541c-8b5a7f56a808	DrugiVir-read	DrugiVir - branje	f
00030000-55ec-86a6-2f20-b6ee5f62181d	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55ec-86a6-5896-d0db31a0d379	Drzava-read	Drzava - branje	f
00030000-55ec-86a6-e2af-332900ad7e74	Drzava-write	Drzava - spreminjanje	f
00030000-55ec-86a6-72fa-729a4eabd08f	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55ec-86a6-6c57-40a44e35145c	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55ec-86a6-2b49-9996cd692818	Funkcija-read	Funkcija - branje	f
00030000-55ec-86a6-c764-da2100d03bc5	Funkcija-write	Funkcija - spreminjanje	f
00030000-55ec-86a6-1ecb-66b891869099	Gostovanje-read	Gostovanje - branje	f
00030000-55ec-86a6-9fee-1782874825f9	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55ec-86a6-93b5-358c1bb99943	Gostujoca-read	Gostujoca - branje	f
00030000-55ec-86a6-dac1-ba7534f93f95	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55ec-86a6-a38e-3f8e57832355	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55ec-86a6-5233-17a75c1f4b1a	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55ec-86a6-6c84-da8a28556047	Kupec-read	Kupec - branje	f
00030000-55ec-86a6-68e1-f27735b9d31f	Kupec-write	Kupec - spreminjanje	f
00030000-55ec-86a6-116e-46b11600b91c	NacinPlacina-read	NacinPlacina - branje	f
00030000-55ec-86a6-f376-5ef5253b3ee2	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55ec-86a6-0e7e-e00aae60c533	Option-read	Option - branje	f
00030000-55ec-86a6-960f-f4b424d60d89	Option-write	Option - spreminjanje	f
00030000-55ec-86a6-3cd5-30905465a3b7	OptionValue-read	OptionValue - branje	f
00030000-55ec-86a6-4839-5c54a7c42e1e	OptionValue-write	OptionValue - spreminjanje	f
00030000-55ec-86a6-8352-41e8f9fb70ad	Oseba-read	Oseba - branje	f
00030000-55ec-86a6-9a81-78d5cc051c27	Oseba-write	Oseba - spreminjanje	f
00030000-55ec-86a6-a0de-d54dffb50f19	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55ec-86a6-c7d4-c1bfd8372a29	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55ec-86a6-183b-4aab2ab5defe	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55ec-86a6-c999-290a7dd7220e	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55ec-86a6-e462-8b7ba0242a5d	Pogodba-read	Pogodba - branje	f
00030000-55ec-86a6-6f27-a07d635915f2	Pogodba-write	Pogodba - spreminjanje	f
00030000-55ec-86a6-9ac6-495ba3a5d934	Popa-read	Popa - branje	f
00030000-55ec-86a6-3250-d002379c4a8d	Popa-write	Popa - spreminjanje	f
00030000-55ec-86a6-d7e7-b1c7ecbfd813	Posta-read	Posta - branje	f
00030000-55ec-86a6-cd5a-c441bdc1f0f6	Posta-write	Posta - spreminjanje	f
00030000-55ec-86a6-bd09-03f5f21f9df3	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55ec-86a6-5b73-17aaec26f37d	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55ec-86a6-5f8e-26cd076066c9	PostniNaslov-read	PostniNaslov - branje	f
00030000-55ec-86a6-0110-409e03b437de	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55ec-86a6-c25f-fbd7af3f8b81	Predstava-read	Predstava - branje	f
00030000-55ec-86a6-9d27-06d2831b7c2f	Predstava-write	Predstava - spreminjanje	f
00030000-55ec-86a6-d0ad-72971caa1e6a	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55ec-86a6-2e86-8a1c5205c3f9	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55ec-86a6-9534-3a28f608f04d	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55ec-86a6-9865-e1f29fc81400	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55ec-86a6-f04a-eb16c96c3499	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55ec-86a6-4696-c230baba7dd9	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55ec-86a6-2cd3-2190b0b5e845	ProgramDela-read	ProgramDela - branje	f
00030000-55ec-86a6-71bd-235710216a39	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55ec-86a6-9902-db6df86d0453	ProgramFestival-read	ProgramFestival - branje	f
00030000-55ec-86a6-c7f2-7d1219c7e4c1	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55ec-86a6-8349-4c127b36d6de	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55ec-86a6-c8c3-020994121b60	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55ec-86a6-c6ff-0cd9b735986e	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55ec-86a6-7c7f-67f1d3abca9b	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55ec-86a6-51f0-9f3f2ea1ce2f	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55ec-86a6-2e43-f0110b259bc1	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55ec-86a6-1b14-be938ba881e7	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55ec-86a6-b795-37acdd6d0f86	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55ec-86a6-f769-3d5092bd7389	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55ec-86a6-a165-50185d1c8852	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55ec-86a6-574e-d3138d284c3b	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55ec-86a6-7b71-d32aca5b23a1	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55ec-86a6-8a07-c9ac044b3962	ProgramRazno-read	ProgramRazno - branje	f
00030000-55ec-86a6-5553-578fd6b80fd5	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55ec-86a6-5fab-33a5ac31cd76	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55ec-86a6-06db-6153f0bf4d69	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55ec-86a6-cae3-8d3f103982f4	Prostor-read	Prostor - branje	f
00030000-55ec-86a6-29c7-4eba735d548d	Prostor-write	Prostor - spreminjanje	f
00030000-55ec-86a6-74dd-0d66b25e0abe	Racun-read	Racun - branje	f
00030000-55ec-86a6-c905-e610329bd787	Racun-write	Racun - spreminjanje	f
00030000-55ec-86a6-9e86-22ad64a3148f	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55ec-86a6-60d7-edcfda73a22f	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55ec-86a6-5fec-ecd3c8641ae1	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55ec-86a6-113c-af718262367d	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55ec-86a6-1912-99685b13f4ed	Rekvizit-read	Rekvizit - branje	f
00030000-55ec-86a6-e438-3d2f1b9d7b52	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55ec-86a6-c92b-d41dd2c91ec5	Revizija-read	Revizija - branje	f
00030000-55ec-86a6-e3d2-767bcccb310c	Revizija-write	Revizija - spreminjanje	f
00030000-55ec-86a6-9e98-15629161f63d	Rezervacija-read	Rezervacija - branje	f
00030000-55ec-86a6-cc7d-1792ef7114c8	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55ec-86a6-cca5-35d770f9d948	SedezniRed-read	SedezniRed - branje	f
00030000-55ec-86a6-f687-4a77e078caff	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55ec-86a6-d977-c07e8f69f833	Sedez-read	Sedez - branje	f
00030000-55ec-86a6-1075-3648b9a367f9	Sedez-write	Sedez - spreminjanje	f
00030000-55ec-86a6-59a1-f57cd770568d	Sezona-read	Sezona - branje	f
00030000-55ec-86a6-ef65-32f16198e40e	Sezona-write	Sezona - spreminjanje	f
00030000-55ec-86a6-017f-a76fb11f5ea9	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55ec-86a6-7c08-4018b90c9c63	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55ec-86a6-07c6-f3d37397a64c	Stevilcenje-read	Stevilcenje - branje	f
00030000-55ec-86a6-5735-315c19d4201e	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55ec-86a6-c9da-dfb56be011d6	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55ec-86a6-fd08-17c11fba9e3c	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55ec-86a6-596a-235b482e3963	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55ec-86a6-ea16-fc5e04474500	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55ec-86a6-aec1-bbff7ff9af86	Telefonska-read	Telefonska - branje	f
00030000-55ec-86a6-6db3-44b3877d155a	Telefonska-write	Telefonska - spreminjanje	f
00030000-55ec-86a6-ab50-c119105eab02	TerminStoritve-read	TerminStoritve - branje	f
00030000-55ec-86a6-f128-aac26dbd1e6b	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55ec-86a6-da6f-d8fd4d3fbc53	TipFunkcije-read	TipFunkcije - branje	f
00030000-55ec-86a6-cac9-ddb8571b12b5	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55ec-86a6-cd40-e5a21e72180a	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55ec-86a6-bd75-52a7c4434f29	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55ec-86a6-0162-ba16ae344488	Trr-read	Trr - branje	f
00030000-55ec-86a6-c932-50ff6a3bca54	Trr-write	Trr - spreminjanje	f
00030000-55ec-86a6-e265-6468b1549c04	Uprizoritev-read	Uprizoritev - branje	f
00030000-55ec-86a6-1b63-e6b7c1e18a2c	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55ec-86a6-15db-c07d61cbb47b	Vaja-read	Vaja - branje	f
00030000-55ec-86a6-c7ee-4451e2366c9d	Vaja-write	Vaja - spreminjanje	f
00030000-55ec-86a6-2007-ccb3c9ad5b85	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55ec-86a6-c605-2f3059b99726	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55ec-86a6-2c19-8ed3ca9d81aa	VrstaStroska-read	VrstaStroska - branje	f
00030000-55ec-86a6-33d5-72c811b59bad	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55ec-86a6-559a-3faaa91ca734	Zaposlitev-read	Zaposlitev - branje	f
00030000-55ec-86a6-d975-bda5bb3be457	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55ec-86a6-b310-a9f40da0db9c	Zasedenost-read	Zasedenost - branje	f
00030000-55ec-86a6-8ee3-fe7497b40b78	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55ec-86a6-6ff6-94b96cc73fb6	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55ec-86a6-f6cf-571fc4b75378	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55ec-86a6-ff48-11d2174f0ddc	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55ec-86a6-2c62-dc7565fac790	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55ec-86a6-2969-772c6073b443	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55ec-86a6-718f-b74aa676a970	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55ec-86a6-886b-4bfcb8ed5947	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55ec-86a6-e2d8-89f013710677	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55ec-86a6-f882-82eb8eb7f854	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55ec-86a6-8751-1b97f1008f75	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55ec-86a6-d3d8-ed35836eff87	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55ec-86a6-0d10-5657cd667b40	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55ec-86a6-8745-179fd3edbbf4	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55ec-86a6-ca18-edc808b372b2	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55ec-86a6-fe25-85d1551d18bb	Datoteka-write	Datoteka - spreminjanje	f
00030000-55ec-86a6-498d-e24faab67c6a	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 3192 (class 0 OID 1197271)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55ec-86a6-9ef1-5c3a42a73845	00030000-55ec-86a6-2de1-9e2c0c80cccb
00020000-55ec-86a6-8e29-fdbbb426c82f	00030000-55ec-86a6-5896-d0db31a0d379
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-c413-b300467aaae0
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-e940-b3b058cc1220
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-d0a0-34374e7a7002
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-9ed0-c78467fde176
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-13a5-dd0400e941db
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-4a4b-670648126659
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-d715-abec81d9431f
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-fcb1-0a7b1b7fd384
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-5896-d0db31a0d379
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-e2af-332900ad7e74
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-2b49-9996cd692818
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-c764-da2100d03bc5
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-1ecb-66b891869099
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-9fee-1782874825f9
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-93b5-358c1bb99943
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-dac1-ba7534f93f95
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-a38e-3f8e57832355
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-5233-17a75c1f4b1a
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-0e7e-e00aae60c533
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-3cd5-30905465a3b7
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-8352-41e8f9fb70ad
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-9a81-78d5cc051c27
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-9ac6-495ba3a5d934
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-3250-d002379c4a8d
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-d7e7-b1c7ecbfd813
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-cd5a-c441bdc1f0f6
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-5f8e-26cd076066c9
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-0110-409e03b437de
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-c25f-fbd7af3f8b81
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-9d27-06d2831b7c2f
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-f04a-eb16c96c3499
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-4696-c230baba7dd9
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-cae3-8d3f103982f4
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-29c7-4eba735d548d
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-5fec-ecd3c8641ae1
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-113c-af718262367d
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-1912-99685b13f4ed
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-e438-3d2f1b9d7b52
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-59a1-f57cd770568d
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-ef65-32f16198e40e
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-da6f-d8fd4d3fbc53
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-e265-6468b1549c04
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-1b63-e6b7c1e18a2c
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-15db-c07d61cbb47b
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-c7ee-4451e2366c9d
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-b310-a9f40da0db9c
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-8ee3-fe7497b40b78
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-6ff6-94b96cc73fb6
00020000-55ec-86a6-6a2b-01b640658838	00030000-55ec-86a6-ff48-11d2174f0ddc
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-c413-b300467aaae0
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-13a5-dd0400e941db
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-4a4b-670648126659
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-5896-d0db31a0d379
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-1ecb-66b891869099
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-93b5-358c1bb99943
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-a38e-3f8e57832355
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-5233-17a75c1f4b1a
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-0e7e-e00aae60c533
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-3cd5-30905465a3b7
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-8352-41e8f9fb70ad
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-9a81-78d5cc051c27
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-9ac6-495ba3a5d934
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-d7e7-b1c7ecbfd813
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-5f8e-26cd076066c9
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-0110-409e03b437de
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-c25f-fbd7af3f8b81
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-cae3-8d3f103982f4
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-5fec-ecd3c8641ae1
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-1912-99685b13f4ed
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-59a1-f57cd770568d
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-aec1-bbff7ff9af86
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-6db3-44b3877d155a
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-0162-ba16ae344488
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-c932-50ff6a3bca54
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-559a-3faaa91ca734
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-d975-bda5bb3be457
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-6ff6-94b96cc73fb6
00020000-55ec-86a6-15b1-25094143347d	00030000-55ec-86a6-ff48-11d2174f0ddc
00020000-55ec-86a6-b424-fb6de2256604	00030000-55ec-86a6-c413-b300467aaae0
00020000-55ec-86a6-b424-fb6de2256604	00030000-55ec-86a6-d0a0-34374e7a7002
00020000-55ec-86a6-b424-fb6de2256604	00030000-55ec-86a6-13a5-dd0400e941db
00020000-55ec-86a6-b424-fb6de2256604	00030000-55ec-86a6-3541-e6561a0f631a
00020000-55ec-86a6-b424-fb6de2256604	00030000-55ec-86a6-3d62-a65dc5089be8
00020000-55ec-86a6-b424-fb6de2256604	00030000-55ec-86a6-fb7c-f49c697d5018
00020000-55ec-86a6-b424-fb6de2256604	00030000-55ec-86a6-4a4b-670648126659
00020000-55ec-86a6-b424-fb6de2256604	00030000-55ec-86a6-5896-d0db31a0d379
00020000-55ec-86a6-b424-fb6de2256604	00030000-55ec-86a6-2b49-9996cd692818
00020000-55ec-86a6-b424-fb6de2256604	00030000-55ec-86a6-1ecb-66b891869099
00020000-55ec-86a6-b424-fb6de2256604	00030000-55ec-86a6-93b5-358c1bb99943
00020000-55ec-86a6-b424-fb6de2256604	00030000-55ec-86a6-a38e-3f8e57832355
00020000-55ec-86a6-b424-fb6de2256604	00030000-55ec-86a6-0e7e-e00aae60c533
00020000-55ec-86a6-b424-fb6de2256604	00030000-55ec-86a6-3cd5-30905465a3b7
00020000-55ec-86a6-b424-fb6de2256604	00030000-55ec-86a6-8352-41e8f9fb70ad
00020000-55ec-86a6-b424-fb6de2256604	00030000-55ec-86a6-9ac6-495ba3a5d934
00020000-55ec-86a6-b424-fb6de2256604	00030000-55ec-86a6-d7e7-b1c7ecbfd813
00020000-55ec-86a6-b424-fb6de2256604	00030000-55ec-86a6-c25f-fbd7af3f8b81
00020000-55ec-86a6-b424-fb6de2256604	00030000-55ec-86a6-f04a-eb16c96c3499
00020000-55ec-86a6-b424-fb6de2256604	00030000-55ec-86a6-cae3-8d3f103982f4
00020000-55ec-86a6-b424-fb6de2256604	00030000-55ec-86a6-5fec-ecd3c8641ae1
00020000-55ec-86a6-b424-fb6de2256604	00030000-55ec-86a6-1912-99685b13f4ed
00020000-55ec-86a6-b424-fb6de2256604	00030000-55ec-86a6-59a1-f57cd770568d
00020000-55ec-86a6-b424-fb6de2256604	00030000-55ec-86a6-da6f-d8fd4d3fbc53
00020000-55ec-86a6-b424-fb6de2256604	00030000-55ec-86a6-15db-c07d61cbb47b
00020000-55ec-86a6-b424-fb6de2256604	00030000-55ec-86a6-b310-a9f40da0db9c
00020000-55ec-86a6-b424-fb6de2256604	00030000-55ec-86a6-6ff6-94b96cc73fb6
00020000-55ec-86a6-b424-fb6de2256604	00030000-55ec-86a6-ff48-11d2174f0ddc
00020000-55ec-86a6-3eed-4c2e5c651284	00030000-55ec-86a6-c413-b300467aaae0
00020000-55ec-86a6-3eed-4c2e5c651284	00030000-55ec-86a6-e940-b3b058cc1220
00020000-55ec-86a6-3eed-4c2e5c651284	00030000-55ec-86a6-9ed0-c78467fde176
00020000-55ec-86a6-3eed-4c2e5c651284	00030000-55ec-86a6-13a5-dd0400e941db
00020000-55ec-86a6-3eed-4c2e5c651284	00030000-55ec-86a6-4a4b-670648126659
00020000-55ec-86a6-3eed-4c2e5c651284	00030000-55ec-86a6-5896-d0db31a0d379
00020000-55ec-86a6-3eed-4c2e5c651284	00030000-55ec-86a6-1ecb-66b891869099
00020000-55ec-86a6-3eed-4c2e5c651284	00030000-55ec-86a6-93b5-358c1bb99943
00020000-55ec-86a6-3eed-4c2e5c651284	00030000-55ec-86a6-0e7e-e00aae60c533
00020000-55ec-86a6-3eed-4c2e5c651284	00030000-55ec-86a6-3cd5-30905465a3b7
00020000-55ec-86a6-3eed-4c2e5c651284	00030000-55ec-86a6-9ac6-495ba3a5d934
00020000-55ec-86a6-3eed-4c2e5c651284	00030000-55ec-86a6-d7e7-b1c7ecbfd813
00020000-55ec-86a6-3eed-4c2e5c651284	00030000-55ec-86a6-c25f-fbd7af3f8b81
00020000-55ec-86a6-3eed-4c2e5c651284	00030000-55ec-86a6-cae3-8d3f103982f4
00020000-55ec-86a6-3eed-4c2e5c651284	00030000-55ec-86a6-5fec-ecd3c8641ae1
00020000-55ec-86a6-3eed-4c2e5c651284	00030000-55ec-86a6-1912-99685b13f4ed
00020000-55ec-86a6-3eed-4c2e5c651284	00030000-55ec-86a6-59a1-f57cd770568d
00020000-55ec-86a6-3eed-4c2e5c651284	00030000-55ec-86a6-da6f-d8fd4d3fbc53
00020000-55ec-86a6-3eed-4c2e5c651284	00030000-55ec-86a6-6ff6-94b96cc73fb6
00020000-55ec-86a6-3eed-4c2e5c651284	00030000-55ec-86a6-ff48-11d2174f0ddc
00020000-55ec-86a6-3aa8-7df96c7d20a3	00030000-55ec-86a6-c413-b300467aaae0
00020000-55ec-86a6-3aa8-7df96c7d20a3	00030000-55ec-86a6-13a5-dd0400e941db
00020000-55ec-86a6-3aa8-7df96c7d20a3	00030000-55ec-86a6-4a4b-670648126659
00020000-55ec-86a6-3aa8-7df96c7d20a3	00030000-55ec-86a6-5896-d0db31a0d379
00020000-55ec-86a6-3aa8-7df96c7d20a3	00030000-55ec-86a6-1ecb-66b891869099
00020000-55ec-86a6-3aa8-7df96c7d20a3	00030000-55ec-86a6-93b5-358c1bb99943
00020000-55ec-86a6-3aa8-7df96c7d20a3	00030000-55ec-86a6-0e7e-e00aae60c533
00020000-55ec-86a6-3aa8-7df96c7d20a3	00030000-55ec-86a6-3cd5-30905465a3b7
00020000-55ec-86a6-3aa8-7df96c7d20a3	00030000-55ec-86a6-9ac6-495ba3a5d934
00020000-55ec-86a6-3aa8-7df96c7d20a3	00030000-55ec-86a6-d7e7-b1c7ecbfd813
00020000-55ec-86a6-3aa8-7df96c7d20a3	00030000-55ec-86a6-c25f-fbd7af3f8b81
00020000-55ec-86a6-3aa8-7df96c7d20a3	00030000-55ec-86a6-cae3-8d3f103982f4
00020000-55ec-86a6-3aa8-7df96c7d20a3	00030000-55ec-86a6-5fec-ecd3c8641ae1
00020000-55ec-86a6-3aa8-7df96c7d20a3	00030000-55ec-86a6-1912-99685b13f4ed
00020000-55ec-86a6-3aa8-7df96c7d20a3	00030000-55ec-86a6-59a1-f57cd770568d
00020000-55ec-86a6-3aa8-7df96c7d20a3	00030000-55ec-86a6-ab50-c119105eab02
00020000-55ec-86a6-3aa8-7df96c7d20a3	00030000-55ec-86a6-2ed8-5d6f41e40647
00020000-55ec-86a6-3aa8-7df96c7d20a3	00030000-55ec-86a6-da6f-d8fd4d3fbc53
00020000-55ec-86a6-3aa8-7df96c7d20a3	00030000-55ec-86a6-6ff6-94b96cc73fb6
00020000-55ec-86a6-3aa8-7df96c7d20a3	00030000-55ec-86a6-ff48-11d2174f0ddc
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-d863-b86feff2555f
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-2de1-9e2c0c80cccb
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-2ed8-5d6f41e40647
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-d715-abec81d9431f
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-6947-8687578711ba
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-d956-754eec6c3d9f
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-bb73-76c8860805be
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-c413-b300467aaae0
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-e940-b3b058cc1220
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-d0a0-34374e7a7002
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-9ed0-c78467fde176
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-13a5-dd0400e941db
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-3541-e6561a0f631a
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-3d62-a65dc5089be8
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-3382-5636d98427b5
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-fb7c-f49c697d5018
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-e209-31f09a0bd1ae
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-4a4b-670648126659
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-fcb1-0a7b1b7fd384
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-5896-d0db31a0d379
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-e2af-332900ad7e74
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-541c-8b5a7f56a808
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-2f20-b6ee5f62181d
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-72fa-729a4eabd08f
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-6c57-40a44e35145c
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-2b49-9996cd692818
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-c764-da2100d03bc5
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-1ecb-66b891869099
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-9fee-1782874825f9
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-93b5-358c1bb99943
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-dac1-ba7534f93f95
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-a38e-3f8e57832355
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-5233-17a75c1f4b1a
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-6c84-da8a28556047
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-68e1-f27735b9d31f
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-116e-46b11600b91c
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-f376-5ef5253b3ee2
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-0e7e-e00aae60c533
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-960f-f4b424d60d89
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-3cd5-30905465a3b7
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-4839-5c54a7c42e1e
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-8352-41e8f9fb70ad
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-9a81-78d5cc051c27
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-a0de-d54dffb50f19
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-c7d4-c1bfd8372a29
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-183b-4aab2ab5defe
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-c999-290a7dd7220e
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-e462-8b7ba0242a5d
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-6f27-a07d635915f2
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-9ac6-495ba3a5d934
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-3250-d002379c4a8d
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-d7e7-b1c7ecbfd813
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-cd5a-c441bdc1f0f6
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-bd09-03f5f21f9df3
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-5b73-17aaec26f37d
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-5f8e-26cd076066c9
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-0110-409e03b437de
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-c25f-fbd7af3f8b81
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-9d27-06d2831b7c2f
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-d0ad-72971caa1e6a
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-2e86-8a1c5205c3f9
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-9534-3a28f608f04d
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-9865-e1f29fc81400
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-f04a-eb16c96c3499
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-4696-c230baba7dd9
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-2cd3-2190b0b5e845
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-71bd-235710216a39
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-9902-db6df86d0453
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-c7f2-7d1219c7e4c1
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-8349-4c127b36d6de
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-c8c3-020994121b60
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-c6ff-0cd9b735986e
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-7c7f-67f1d3abca9b
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-51f0-9f3f2ea1ce2f
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-2e43-f0110b259bc1
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-1b14-be938ba881e7
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-b795-37acdd6d0f86
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-f769-3d5092bd7389
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-a165-50185d1c8852
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-574e-d3138d284c3b
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-7b71-d32aca5b23a1
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-8a07-c9ac044b3962
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-5553-578fd6b80fd5
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-5fab-33a5ac31cd76
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-06db-6153f0bf4d69
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-cae3-8d3f103982f4
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-29c7-4eba735d548d
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-74dd-0d66b25e0abe
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-c905-e610329bd787
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-9e86-22ad64a3148f
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-60d7-edcfda73a22f
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-5fec-ecd3c8641ae1
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-113c-af718262367d
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-1912-99685b13f4ed
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-e438-3d2f1b9d7b52
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-c92b-d41dd2c91ec5
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-e3d2-767bcccb310c
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-9e98-15629161f63d
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-cc7d-1792ef7114c8
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-cca5-35d770f9d948
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-f687-4a77e078caff
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-d977-c07e8f69f833
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-1075-3648b9a367f9
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-59a1-f57cd770568d
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-ef65-32f16198e40e
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-017f-a76fb11f5ea9
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-7c08-4018b90c9c63
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-07c6-f3d37397a64c
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-5735-315c19d4201e
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-c9da-dfb56be011d6
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-fd08-17c11fba9e3c
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-596a-235b482e3963
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-ea16-fc5e04474500
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-aec1-bbff7ff9af86
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-6db3-44b3877d155a
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-ab50-c119105eab02
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-f128-aac26dbd1e6b
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-da6f-d8fd4d3fbc53
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-cac9-ddb8571b12b5
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-cd40-e5a21e72180a
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-bd75-52a7c4434f29
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-0162-ba16ae344488
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-c932-50ff6a3bca54
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-e265-6468b1549c04
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-1b63-e6b7c1e18a2c
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-15db-c07d61cbb47b
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-c7ee-4451e2366c9d
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-2007-ccb3c9ad5b85
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-c605-2f3059b99726
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-2c19-8ed3ca9d81aa
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-33d5-72c811b59bad
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-559a-3faaa91ca734
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-d975-bda5bb3be457
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-b310-a9f40da0db9c
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-8ee3-fe7497b40b78
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-6ff6-94b96cc73fb6
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-f6cf-571fc4b75378
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-ff48-11d2174f0ddc
00020000-55ec-86e4-97bd-5e6d76c4890d	00030000-55ec-86a6-2c62-dc7565fac790
\.


--
-- TOC entry 3216 (class 0 OID 1197548)
-- Dependencies: 203
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3217 (class 0 OID 1197555)
-- Dependencies: 204
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3231 (class 0 OID 1197702)
-- Dependencies: 218
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55ec-86e4-23f1-f214dc56cf8f	00090000-55ec-86e4-1b20-664992eac692	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55ec-86e4-04b4-b9e6b6f411ab	00090000-55ec-86e4-d96a-54cc2a37c6de	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55ec-86e4-d6a9-e5302bc9e4a3	00090000-55ec-86e4-d70e-fbdd2cc22433	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 3201 (class 0 OID 1197384)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55ec-86e4-5055-8cb6402a4b89	00040000-55ec-86a5-629e-91914bab27f9	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ec-86e4-a6b3-7a3929941aff	00040000-55ec-86a5-629e-91914bab27f9	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55ec-86e4-8b34-dda389d3589b	00040000-55ec-86a5-629e-91914bab27f9	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ec-86e4-db95-6ebb1684d3cf	00040000-55ec-86a5-629e-91914bab27f9	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ec-86e4-ae05-7d61e7ab3560	00040000-55ec-86a5-629e-91914bab27f9	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ec-86e4-3847-f0d38249a8e4	00040000-55ec-86a5-b9a0-d8687666210a	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ec-86e4-34e6-8d66a4cb29bb	00040000-55ec-86a5-f45c-1a3ecae2a954	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55ec-86e4-4172-5179e16fbc39	00040000-55ec-86a5-9fd3-38d3500e41a6	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3202 (class 0 OID 1197403)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55ec-86a5-8b14-dfc575806a84	8341	Adlešiči
00050000-55ec-86a5-0fea-5fe1c08c4ed7	5270	Ajdovščina
00050000-55ec-86a5-38b8-e58435dfeab9	6280	Ankaran/Ancarano
00050000-55ec-86a5-a82a-28244e38a186	9253	Apače
00050000-55ec-86a5-074a-db49d877c892	8253	Artiče
00050000-55ec-86a5-7033-2b64038d28f6	4275	Begunje na Gorenjskem
00050000-55ec-86a5-2096-311cdd3e1f6b	1382	Begunje pri Cerknici
00050000-55ec-86a5-50ed-42cdb7f87b4c	9231	Beltinci
00050000-55ec-86a5-8547-21f6a1c3674b	2234	Benedikt
00050000-55ec-86a5-44ed-fc0a377c003e	2345	Bistrica ob Dravi
00050000-55ec-86a5-39de-54b989e31a72	3256	Bistrica ob Sotli
00050000-55ec-86a5-51c8-b818930ca12e	8259	Bizeljsko
00050000-55ec-86a5-29d4-fdc8ac5b70af	1223	Blagovica
00050000-55ec-86a5-b005-114b89f62463	8283	Blanca
00050000-55ec-86a5-9d98-eafcad5d6e43	4260	Bled
00050000-55ec-86a5-e268-7ccf0f2b2bc9	4273	Blejska Dobrava
00050000-55ec-86a5-f64e-c3b7970e21db	9265	Bodonci
00050000-55ec-86a5-30d5-fc222a54be59	9222	Bogojina
00050000-55ec-86a5-a627-fba4582127ba	4263	Bohinjska Bela
00050000-55ec-86a5-e1e1-c26531b5c558	4264	Bohinjska Bistrica
00050000-55ec-86a5-6607-59f755d0356d	4265	Bohinjsko jezero
00050000-55ec-86a5-f494-67914d878df0	1353	Borovnica
00050000-55ec-86a5-616c-0edd99998e6b	8294	Boštanj
00050000-55ec-86a5-9aac-f0401295292d	5230	Bovec
00050000-55ec-86a5-9992-8c74fa20a9a5	5295	Branik
00050000-55ec-86a5-3a17-d5ec72092986	3314	Braslovče
00050000-55ec-86a5-001a-544899103955	5223	Breginj
00050000-55ec-86a5-5609-c12b153d1d6b	8280	Brestanica
00050000-55ec-86a5-7619-47d98386de75	2354	Bresternica
00050000-55ec-86a5-c8f6-050a52133810	4243	Brezje
00050000-55ec-86a5-4e38-73843f9821e9	1351	Brezovica pri Ljubljani
00050000-55ec-86a5-8fcf-bc6b93625bb5	8250	Brežice
00050000-55ec-86a5-bd12-142d82a67ce0	4210	Brnik - Aerodrom
00050000-55ec-86a5-ee52-55a55387aad8	8321	Brusnice
00050000-55ec-86a5-68bb-900d78de1a91	3255	Buče
00050000-55ec-86a5-7cd4-2cdb0121b226	8276	Bučka 
00050000-55ec-86a5-8e13-9342dc89d6cb	9261	Cankova
00050000-55ec-86a5-a758-8a97e087162e	3000	Celje 
00050000-55ec-86a5-9940-be0797744340	3001	Celje - poštni predali
00050000-55ec-86a5-61ac-c7c1d5d917bb	4207	Cerklje na Gorenjskem
00050000-55ec-86a5-9ddc-2475b8934b42	8263	Cerklje ob Krki
00050000-55ec-86a5-3918-deadc8e18b30	1380	Cerknica
00050000-55ec-86a5-eb1a-c1ee057853e3	5282	Cerkno
00050000-55ec-86a5-cb1f-5bebf9f7746e	2236	Cerkvenjak
00050000-55ec-86a5-1512-78506b8cb28b	2215	Ceršak
00050000-55ec-86a5-fb75-6dc9a3a5e3bc	2326	Cirkovce
00050000-55ec-86a5-8f94-8e926c9caf6f	2282	Cirkulane
00050000-55ec-86a5-c974-744242aa0061	5273	Col
00050000-55ec-86a5-a63e-1f4d55e5b171	8251	Čatež ob Savi
00050000-55ec-86a5-02fa-d241122a03a9	1413	Čemšenik
00050000-55ec-86a5-d6b3-ae6226246bd5	5253	Čepovan
00050000-55ec-86a5-c262-7d608440649c	9232	Črenšovci
00050000-55ec-86a5-932f-3655fb402359	2393	Črna na Koroškem
00050000-55ec-86a5-b782-ab354022c5d9	6275	Črni Kal
00050000-55ec-86a5-ba77-3da22810518e	5274	Črni Vrh nad Idrijo
00050000-55ec-86a5-0962-5c535779ceb9	5262	Črniče
00050000-55ec-86a5-8391-ee1cc64769fc	8340	Črnomelj
00050000-55ec-86a5-b0dc-2122db59d030	6271	Dekani
00050000-55ec-86a5-768f-aa69c96eef9d	5210	Deskle
00050000-55ec-86a5-77a8-5accc6bfca1a	2253	Destrnik
00050000-55ec-86a5-c350-7795ecbbdc00	6215	Divača
00050000-55ec-86a5-f005-ac567693fe5f	1233	Dob
00050000-55ec-86a5-b197-ef3d27df305d	3224	Dobje pri Planini
00050000-55ec-86a5-6a51-012dc4f977f7	8257	Dobova
00050000-55ec-86a5-e37e-2587607e6ed8	1423	Dobovec
00050000-55ec-86a5-0741-5ed00d6a13aa	5263	Dobravlje
00050000-55ec-86a5-b215-aa33828951f8	3204	Dobrna
00050000-55ec-86a5-e8b8-964987c58528	8211	Dobrnič
00050000-55ec-86a5-1eef-f9e09efccbec	1356	Dobrova
00050000-55ec-86a5-a9f0-2bc597eefc53	9223	Dobrovnik/Dobronak 
00050000-55ec-86a5-90bd-8c6b54cb6450	5212	Dobrovo v Brdih
00050000-55ec-86a5-ba02-37c9aac2d340	1431	Dol pri Hrastniku
00050000-55ec-86a5-8b18-6c47caa5103c	1262	Dol pri Ljubljani
00050000-55ec-86a5-415d-8a80d8e73993	1273	Dole pri Litiji
00050000-55ec-86a5-e18d-357cabe44708	1331	Dolenja vas
00050000-55ec-86a5-5884-9656162227c5	8350	Dolenjske Toplice
00050000-55ec-86a5-6481-b2b8c96e9fcb	1230	Domžale
00050000-55ec-86a5-a78e-286732b3e081	2252	Dornava
00050000-55ec-86a5-6422-35f5eb05b86b	5294	Dornberk
00050000-55ec-86a5-5e9f-129d19c1959b	1319	Draga
00050000-55ec-86a5-9d71-138be13b317a	8343	Dragatuš
00050000-55ec-86a5-c001-80a7d89ca973	3222	Dramlje
00050000-55ec-86a5-68e2-0fa1f63b48ca	2370	Dravograd
00050000-55ec-86a5-989c-9d18f0d1f274	4203	Duplje
00050000-55ec-86a5-f8e4-bb97834f0791	6221	Dutovlje
00050000-55ec-86a5-7d21-2d762f1be47f	8361	Dvor
00050000-55ec-86a5-a6ce-f1ffb4d45d2b	2343	Fala
00050000-55ec-86a5-0503-f39e48c3bf8d	9208	Fokovci
00050000-55ec-86a5-5ec9-ce7e810b991c	2313	Fram
00050000-55ec-86a5-e8d0-d305ba2b7f2f	3213	Frankolovo
00050000-55ec-86a5-baff-2b4396854961	1274	Gabrovka
00050000-55ec-86a5-3a6c-9f6dfe2a03b1	8254	Globoko
00050000-55ec-86a5-ea79-a2a339ee51f2	5275	Godovič
00050000-55ec-86a5-3db0-fc5e8fdf4e69	4204	Golnik
00050000-55ec-86a5-32d7-3aba0af65fa1	3303	Gomilsko
00050000-55ec-86a5-baf1-81523254a7cd	4224	Gorenja vas
00050000-55ec-86a5-80fa-cb3fd01cbc53	3263	Gorica pri Slivnici
00050000-55ec-86a5-579e-fb804d6dacd3	2272	Gorišnica
00050000-55ec-86a5-1b56-5d7e675c1197	9250	Gornja Radgona
00050000-55ec-86a5-5b65-d6958bbb12b9	3342	Gornji Grad
00050000-55ec-86a5-e218-38ed30dc24c0	4282	Gozd Martuljek
00050000-55ec-86a5-fe8b-180c74dd6922	6272	Gračišče
00050000-55ec-86a5-63ba-e05b44114524	9264	Grad
00050000-55ec-86a5-dad2-b0832e60a6e5	8332	Gradac
00050000-55ec-86a5-a1f6-dd3c2cd60014	1384	Grahovo
00050000-55ec-86a5-9e17-8b32ea7ab8d3	5242	Grahovo ob Bači
00050000-55ec-86a5-00ce-81765466fc29	5251	Grgar
00050000-55ec-86a5-769b-3af1c7c67aa8	3302	Griže
00050000-55ec-86a5-8731-ce112a56346d	3231	Grobelno
00050000-55ec-86a5-e373-d24c1ec7ea10	1290	Grosuplje
00050000-55ec-86a5-78b4-4a921770564b	2288	Hajdina
00050000-55ec-86a5-1d86-59a044b4cec5	8362	Hinje
00050000-55ec-86a5-0478-43628dec3e3e	2311	Hoče
00050000-55ec-86a5-5145-3d50fb772b5a	9205	Hodoš/Hodos
00050000-55ec-86a5-b4ef-fb227e2b7e1c	1354	Horjul
00050000-55ec-86a5-fad7-a79067c48ad1	1372	Hotedršica
00050000-55ec-86a5-5c36-cf45fa382634	1430	Hrastnik
00050000-55ec-86a5-e54a-61f04477dcea	6225	Hruševje
00050000-55ec-86a5-addf-9c800c4ec812	4276	Hrušica
00050000-55ec-86a5-e456-c8dbda8f54ae	5280	Idrija
00050000-55ec-86a5-18ab-e22f9a2bbbcf	1292	Ig
00050000-55ec-86a5-e384-a7e4e9ae82eb	6250	Ilirska Bistrica
00050000-55ec-86a5-c8b4-53c6a54e0714	6251	Ilirska Bistrica-Trnovo
00050000-55ec-86a5-57da-b5c9406ce5bd	1295	Ivančna Gorica
00050000-55ec-86a5-96e0-71333d343040	2259	Ivanjkovci
00050000-55ec-86a5-82fd-f9338eb3c979	1411	Izlake
00050000-55ec-86a5-9548-a844cec02911	6310	Izola/Isola
00050000-55ec-86a5-ed81-e4c7d17ba153	2222	Jakobski Dol
00050000-55ec-86a5-808d-aa6925419ed0	2221	Jarenina
00050000-55ec-86a5-1c5f-e45da434056d	6254	Jelšane
00050000-55ec-86a5-9ac5-d42e0de8e501	4270	Jesenice
00050000-55ec-86a5-5229-62a2c4a8194b	8261	Jesenice na Dolenjskem
00050000-55ec-86a5-8fc5-c3e5e67cda07	3273	Jurklošter
00050000-55ec-86a5-1ef5-c24736da7a93	2223	Jurovski Dol
00050000-55ec-86a5-2888-5ae862c07ae3	2256	Juršinci
00050000-55ec-86a5-4476-c189f0df8da1	5214	Kal nad Kanalom
00050000-55ec-86a5-d43d-d273b45f6b4a	3233	Kalobje
00050000-55ec-86a5-f0d8-ed6d86cc274d	4246	Kamna Gorica
00050000-55ec-86a5-b238-65c9bcc1203e	2351	Kamnica
00050000-55ec-86a5-c207-11dd4e26ac13	1241	Kamnik
00050000-55ec-86a5-ac96-970351f787dc	5213	Kanal
00050000-55ec-86a5-8cea-e0440bbd3d81	8258	Kapele
00050000-55ec-86a5-cb83-03c02f9a72c8	2362	Kapla
00050000-55ec-86a5-680d-254f1c1cd71b	2325	Kidričevo
00050000-55ec-86a5-7b44-2d06ff2f064f	1412	Kisovec
00050000-55ec-86a5-1a9a-c03b2e8fe3b8	6253	Knežak
00050000-55ec-86a5-f8ef-e0287f901550	5222	Kobarid
00050000-55ec-86a5-ab8b-10c3ee33b7b0	9227	Kobilje
00050000-55ec-86a5-bcb4-7ac803da8483	1330	Kočevje
00050000-55ec-86a5-c13a-75e2d8e7917a	1338	Kočevska Reka
00050000-55ec-86a5-8bf9-b7249f595a34	2276	Kog
00050000-55ec-86a5-29d9-d78e39d3dd7f	5211	Kojsko
00050000-55ec-86a5-7007-ee2970541398	6223	Komen
00050000-55ec-86a5-fd74-57162237e924	1218	Komenda
00050000-55ec-86a5-351d-8027302f9de0	6000	Koper/Capodistria 
00050000-55ec-86a5-bff5-d874185d6f77	6001	Koper/Capodistria - poštni predali
00050000-55ec-86a5-18ab-a1558cb55c25	8282	Koprivnica
00050000-55ec-86a5-f0a2-80562b0ca1a4	5296	Kostanjevica na Krasu
00050000-55ec-86a5-0931-0fd922ce0f46	8311	Kostanjevica na Krki
00050000-55ec-86a5-23da-a4a4481f7af4	1336	Kostel
00050000-55ec-86a5-5e80-91d8ae0c73b0	6256	Košana
00050000-55ec-86a5-0dc8-c9d2c00b34b9	2394	Kotlje
00050000-55ec-86a5-be9b-34b13f52e83c	6240	Kozina
00050000-55ec-86a5-cf82-251dfa8b1ec4	3260	Kozje
00050000-55ec-86a5-eb84-882ab475d2d6	4000	Kranj 
00050000-55ec-86a5-5868-699d2e33cd00	4001	Kranj - poštni predali
00050000-55ec-86a5-954d-6468b4380dba	4280	Kranjska Gora
00050000-55ec-86a5-c20d-dd6e0023364d	1281	Kresnice
00050000-55ec-86a5-2645-927260d4e560	4294	Križe
00050000-55ec-86a5-067b-7dd931f65223	9206	Križevci
00050000-55ec-86a5-9393-3c683f1d1ba6	9242	Križevci pri Ljutomeru
00050000-55ec-86a5-ace8-3aca1d751780	1301	Krka
00050000-55ec-86a5-b6cc-d8a5e064a4c0	8296	Krmelj
00050000-55ec-86a5-1bd0-d7dab049bab4	4245	Kropa
00050000-55ec-86a5-bb9a-322730d0ab02	8262	Krška vas
00050000-55ec-86a5-7689-7ca3ee0001ea	8270	Krško
00050000-55ec-86a5-eb69-444425557650	9263	Kuzma
00050000-55ec-86a5-b815-bd1a3c497bc9	2318	Laporje
00050000-55ec-86a5-f079-61dc9d5ce241	3270	Laško
00050000-55ec-86a5-5a28-211ea0ba8317	1219	Laze v Tuhinju
00050000-55ec-86a5-f37a-e5b8b982c6b0	2230	Lenart v Slovenskih goricah
00050000-55ec-86a5-2c4a-d3adeea504f8	9220	Lendava/Lendva
00050000-55ec-86a5-1491-4e7aee29242a	4248	Lesce
00050000-55ec-86a5-89f2-7bc7e391da36	3261	Lesično
00050000-55ec-86a5-0164-5844150c2274	8273	Leskovec pri Krškem
00050000-55ec-86a5-a5bf-3e9230b39f59	2372	Libeliče
00050000-55ec-86a5-5c95-29468a1a79e9	2341	Limbuš
00050000-55ec-86a5-dc93-f719846f6775	1270	Litija
00050000-55ec-86a5-4729-9bb0e44d92d7	3202	Ljubečna
00050000-55ec-86a5-05f0-9ce2811b4fbe	1000	Ljubljana 
00050000-55ec-86a5-4a29-6025a02f62ae	1001	Ljubljana - poštni predali
00050000-55ec-86a5-4ebc-007e7781a8aa	1231	Ljubljana - Črnuče
00050000-55ec-86a5-a07f-992952912622	1261	Ljubljana - Dobrunje
00050000-55ec-86a5-681d-71322f1729d7	1260	Ljubljana - Polje
00050000-55ec-86a5-46b9-5dde1f53d37e	1210	Ljubljana - Šentvid
00050000-55ec-86a5-3924-3d3ffa899e22	1211	Ljubljana - Šmartno
00050000-55ec-86a5-7274-9b7a301896ae	3333	Ljubno ob Savinji
00050000-55ec-86a5-d7b7-7461f67dd4c7	9240	Ljutomer
00050000-55ec-86a5-a962-a0f5dd5bfcf1	3215	Loče
00050000-55ec-86a5-9013-59eba7b9613a	5231	Log pod Mangartom
00050000-55ec-86a5-b4d2-d61ff57c0c75	1358	Log pri Brezovici
00050000-55ec-86a5-cbf6-699fade4e03f	1370	Logatec
00050000-55ec-86a5-ce4a-d7de435d848f	1371	Logatec
00050000-55ec-86a5-fecd-5c2152eb5406	1434	Loka pri Zidanem Mostu
00050000-55ec-86a5-740b-663a0faa29aa	3223	Loka pri Žusmu
00050000-55ec-86a5-8bb0-21524b32d214	6219	Lokev
00050000-55ec-86a5-2eaa-76c6f3e212b8	1318	Loški Potok
00050000-55ec-86a5-dce1-73184a6e1f64	2324	Lovrenc na Dravskem polju
00050000-55ec-86a5-1086-f54651744c4d	2344	Lovrenc na Pohorju
00050000-55ec-86a5-756c-4db465953be0	3334	Luče
00050000-55ec-86a5-1c40-b80c6f8c47ed	1225	Lukovica
00050000-55ec-86a5-aef6-467edaea413d	9202	Mačkovci
00050000-55ec-86a5-85f7-74b6b4056823	2322	Majšperk
00050000-55ec-86a5-ecd5-766a0181575a	2321	Makole
00050000-55ec-86a5-0b92-9a7265df574b	9243	Mala Nedelja
00050000-55ec-86a5-01e2-cfc3ae6dab8b	2229	Malečnik
00050000-55ec-86a5-8160-e922c6ebead7	6273	Marezige
00050000-55ec-86a5-9932-dd6b21593344	2000	Maribor 
00050000-55ec-86a5-3cde-5de0d7befbd0	2001	Maribor - poštni predali
00050000-55ec-86a5-9303-a1da411e13cf	2206	Marjeta na Dravskem polju
00050000-55ec-86a5-27b7-d89d93a58908	2281	Markovci
00050000-55ec-86a5-6de4-efb8b8975357	9221	Martjanci
00050000-55ec-86a5-4fe7-85bc4e8e23df	6242	Materija
00050000-55ec-86a5-77b5-afc80ba30608	4211	Mavčiče
00050000-55ec-86a5-cbc9-07f059cec900	1215	Medvode
00050000-55ec-86a5-fb03-76e9b82b3ace	1234	Mengeš
00050000-55ec-86a5-de65-204aec966dc7	8330	Metlika
00050000-55ec-86a5-1899-f8da21b7a1a1	2392	Mežica
00050000-55ec-86a5-5792-53cc7f9fbae8	2204	Miklavž na Dravskem polju
00050000-55ec-86a5-8eac-55d058bf29f2	2275	Miklavž pri Ormožu
00050000-55ec-86a5-a91d-6fd0e3be868d	5291	Miren
00050000-55ec-86a5-bc33-25fd16522326	8233	Mirna
00050000-55ec-86a5-76a4-fa1790b9811b	8216	Mirna Peč
00050000-55ec-86a5-b31b-c416c67cf612	2382	Mislinja
00050000-55ec-86a5-e58b-b0c33e753f93	4281	Mojstrana
00050000-55ec-86a5-ba8d-b7f0bee6865a	8230	Mokronog
00050000-55ec-86a5-df8e-f35bf2d38ece	1251	Moravče
00050000-55ec-86a5-8ffd-88fa42b58c74	9226	Moravske Toplice
00050000-55ec-86a5-86aa-b999fe49c954	5216	Most na Soči
00050000-55ec-86a5-52b4-8082fae71e62	1221	Motnik
00050000-55ec-86a5-c2f4-b92923985862	3330	Mozirje
00050000-55ec-86a5-cfbb-c1d97796a011	9000	Murska Sobota 
00050000-55ec-86a5-b11b-f03936c8b023	9001	Murska Sobota - poštni predali
00050000-55ec-86a5-b8d0-2f32a3813caf	2366	Muta
00050000-55ec-86a5-c09b-76aad6a1d0db	4202	Naklo
00050000-55ec-86a5-64d0-469501a7567a	3331	Nazarje
00050000-55ec-86a5-bda4-688a13c0477e	1357	Notranje Gorice
00050000-55ec-86a5-4703-946fafd410a9	3203	Nova Cerkev
00050000-55ec-86a5-1711-9e7d51a34af4	5000	Nova Gorica 
00050000-55ec-86a5-4503-42a5e3c4a6b7	5001	Nova Gorica - poštni predali
00050000-55ec-86a5-9c32-8bec8e0a0cfe	1385	Nova vas
00050000-55ec-86a5-175d-7c1d5df634b0	8000	Novo mesto
00050000-55ec-86a5-d403-69242753b1b6	8001	Novo mesto - poštni predali
00050000-55ec-86a5-0daf-0df1be3078ac	6243	Obrov
00050000-55ec-86a5-d2c4-cadc9459b6b4	9233	Odranci
00050000-55ec-86a5-b593-61512a847a16	2317	Oplotnica
00050000-55ec-86a5-e2fe-2fe0b04c72fb	2312	Orehova vas
00050000-55ec-86a5-224a-33f83166f5ff	2270	Ormož
00050000-55ec-86a5-2dd0-71e529eacdd6	1316	Ortnek
00050000-55ec-86a5-1a4a-d8a39aaf3efd	1337	Osilnica
00050000-55ec-86a5-80ed-7e7c20ac955d	8222	Otočec
00050000-55ec-86a5-0048-bc618643e2b7	2361	Ožbalt
00050000-55ec-86a5-13ec-b9268fbdd377	2231	Pernica
00050000-55ec-86a5-7b1f-9285d3f23044	2211	Pesnica pri Mariboru
00050000-55ec-86a5-05dc-464ef07d18d6	9203	Petrovci
00050000-55ec-86a5-9d94-888229d1b88f	3301	Petrovče
00050000-55ec-86a5-38cc-ae14df771252	6330	Piran/Pirano
00050000-55ec-86a5-c406-06bee0387046	8255	Pišece
00050000-55ec-86a5-cc73-dc947b712527	6257	Pivka
00050000-55ec-86a5-61da-64aa5c5efe08	6232	Planina
00050000-55ec-86a5-b165-b88b45687ad7	3225	Planina pri Sevnici
00050000-55ec-86a5-f3f6-3d8f4da3228d	6276	Pobegi
00050000-55ec-86a5-3e6f-455aeac31a82	8312	Podbočje
00050000-55ec-86a5-d3da-862dbe7ff41f	5243	Podbrdo
00050000-55ec-86a5-75c4-e4ca7214935f	3254	Podčetrtek
00050000-55ec-86a5-c224-ba3bf4db6349	2273	Podgorci
00050000-55ec-86a5-54f9-5d3579a3a131	6216	Podgorje
00050000-55ec-86a5-cfb6-f3e93a7cc468	2381	Podgorje pri Slovenj Gradcu
00050000-55ec-86a5-172f-150b5a8aff72	6244	Podgrad
00050000-55ec-86a5-a86e-cc7f6d63d6b5	1414	Podkum
00050000-55ec-86a5-a4fb-046d05e9947d	2286	Podlehnik
00050000-55ec-86a5-9ad1-c12834c9558d	5272	Podnanos
00050000-55ec-86a5-7222-c0494476360e	4244	Podnart
00050000-55ec-86a5-6283-072f875170f3	3241	Podplat
00050000-55ec-86a5-fa6a-d7d3a5ade953	3257	Podsreda
00050000-55ec-86a5-3422-6560c37c979c	2363	Podvelka
00050000-55ec-86a5-8c6f-fb525422bf57	2208	Pohorje
00050000-55ec-86a5-7548-7b7abb617d10	2257	Polenšak
00050000-55ec-86a5-7fe1-e92a7206f601	1355	Polhov Gradec
00050000-55ec-86a5-c94d-67c2c879c768	4223	Poljane nad Škofjo Loko
00050000-55ec-86a5-bd23-797550ca86c3	2319	Poljčane
00050000-55ec-86a5-df96-0b2bbdb84ce6	1272	Polšnik
00050000-55ec-86a5-5449-4a47ec1c4c09	3313	Polzela
00050000-55ec-86a5-48b6-a3c8cb4de7a9	3232	Ponikva
00050000-55ec-86a5-ffd8-14b2b709f97d	6320	Portorož/Portorose
00050000-55ec-86a5-948c-774c85506f7c	6230	Postojna
00050000-55ec-86a5-c3a2-371914b50b41	2331	Pragersko
00050000-55ec-86a5-dfc3-61e46be81634	3312	Prebold
00050000-55ec-86a5-1e63-68215295f2ff	4205	Preddvor
00050000-55ec-86a5-647e-7cc6fd78f042	6255	Prem
00050000-55ec-86a5-ce43-116901870ea8	1352	Preserje
00050000-55ec-86a5-f116-ac569266dbd2	6258	Prestranek
00050000-55ec-86a5-7543-845c9c7da972	2391	Prevalje
00050000-55ec-86a5-08b3-121517cc23ba	3262	Prevorje
00050000-55ec-86a5-49ef-da85a4aa2797	1276	Primskovo 
00050000-55ec-86a5-0901-b6309d55039a	3253	Pristava pri Mestinju
00050000-55ec-86a5-ed52-beb6e9a4a73c	9207	Prosenjakovci/Partosfalva
00050000-55ec-86a5-5999-304aaa5e705a	5297	Prvačina
00050000-55ec-86a5-9fd1-acf2a26d27f4	2250	Ptuj
00050000-55ec-86a5-1a8a-79a76787b004	2323	Ptujska Gora
00050000-55ec-86a5-7b4d-456c40bd1ae5	9201	Puconci
00050000-55ec-86a5-ce33-fcdd2d86b49e	2327	Rače
00050000-55ec-86a5-21b7-fbe6059da355	1433	Radeče
00050000-55ec-86a5-5610-95969e3a3689	9252	Radenci
00050000-55ec-86a5-f816-accaa5d655d2	2360	Radlje ob Dravi
00050000-55ec-86a5-da21-4816f3bd76ff	1235	Radomlje
00050000-55ec-86a5-4179-064c5d52bb74	4240	Radovljica
00050000-55ec-86a5-de1e-e1f3ed02770c	8274	Raka
00050000-55ec-86a5-8594-1f0b522537fb	1381	Rakek
00050000-55ec-86a5-5921-d768fe28a17f	4283	Rateče - Planica
00050000-55ec-86a5-4e24-ed33af047d71	2390	Ravne na Koroškem
00050000-55ec-86a5-606a-777ceb8bfd38	9246	Razkrižje
00050000-55ec-86a5-6c48-cac8c38337fa	3332	Rečica ob Savinji
00050000-55ec-86a5-ebcc-e6a65047252e	5292	Renče
00050000-55ec-86a5-7a3c-a2b634fcdd4c	1310	Ribnica
00050000-55ec-86a5-b7f6-6c94f210d540	2364	Ribnica na Pohorju
00050000-55ec-86a5-9539-306acd07e84b	3272	Rimske Toplice
00050000-55ec-86a5-5bbf-58f1d84a3705	1314	Rob
00050000-55ec-86a5-43f8-817c28c8a326	5215	Ročinj
00050000-55ec-86a5-54cf-b6e28558f3ec	3250	Rogaška Slatina
00050000-55ec-86a5-d64a-701ce01c3114	9262	Rogašovci
00050000-55ec-86a5-9cf6-6f1654745daa	3252	Rogatec
00050000-55ec-86a5-02b1-93dfa675b8b5	1373	Rovte
00050000-55ec-86a5-0c04-23a23d1907c7	2342	Ruše
00050000-55ec-86a5-04ef-60ff6d290290	1282	Sava
00050000-55ec-86a5-100d-bf9b4c41186d	6333	Sečovlje/Sicciole
00050000-55ec-86a5-bd1b-b85ed10ef9cd	4227	Selca
00050000-55ec-86a5-5c5e-5ba4a311ebee	2352	Selnica ob Dravi
00050000-55ec-86a5-9b45-a34579aa5e95	8333	Semič
00050000-55ec-86a5-c5ba-b23cd91cecd3	8281	Senovo
00050000-55ec-86a5-cb31-c3bb8a70718a	6224	Senožeče
00050000-55ec-86a5-3be9-17d4ac295fad	8290	Sevnica
00050000-55ec-86a5-857b-06ea27d732ae	6210	Sežana
00050000-55ec-86a5-0895-1224d1f2378e	2214	Sladki Vrh
00050000-55ec-86a5-9f0d-b23939049dcc	5283	Slap ob Idrijci
00050000-55ec-86a5-db88-c79c87d88ebb	2380	Slovenj Gradec
00050000-55ec-86a5-646f-0c0dc383f101	2310	Slovenska Bistrica
00050000-55ec-86a5-fd29-38984f13b9b2	3210	Slovenske Konjice
00050000-55ec-86a5-a3e8-adb9d3a24e4a	1216	Smlednik
00050000-55ec-86a5-030e-559b9211f344	5232	Soča
00050000-55ec-86a5-bb0d-4b02951eacd5	1317	Sodražica
00050000-55ec-86a5-45d2-7bfcd1062659	3335	Solčava
00050000-55ec-86a5-6d52-effd8954cfb4	5250	Solkan
00050000-55ec-86a5-cf60-e051c4420170	4229	Sorica
00050000-55ec-86a5-8170-14b26c5206f2	4225	Sovodenj
00050000-55ec-86a5-ad13-54ebe59389d9	5281	Spodnja Idrija
00050000-55ec-86a5-8152-1cc9986393f9	2241	Spodnji Duplek
00050000-55ec-86a5-e94d-bd12721923ce	9245	Spodnji Ivanjci
00050000-55ec-86a5-9ccd-abd1ac85987e	2277	Središče ob Dravi
00050000-55ec-86a5-b2ce-749378d7c2dd	4267	Srednja vas v Bohinju
00050000-55ec-86a5-146c-a9bb7bb51644	8256	Sromlje 
00050000-55ec-86a5-f87c-693767bf5de8	5224	Srpenica
00050000-55ec-86a5-3a41-2034eb79e030	1242	Stahovica
00050000-55ec-86a5-aeb6-c2a68abb02c7	1332	Stara Cerkev
00050000-55ec-86a5-e52f-f75a7a964731	8342	Stari trg ob Kolpi
00050000-55ec-86a5-7bf0-25365ba3534d	1386	Stari trg pri Ložu
00050000-55ec-86a5-4385-e272e7d85e1e	2205	Starše
00050000-55ec-86a5-9e9b-721f2e30d03c	2289	Stoperce
00050000-55ec-86a5-15b2-13ee300d5b16	8322	Stopiče
00050000-55ec-86a5-a23f-9b3d3a726bdc	3206	Stranice
00050000-55ec-86a5-908e-0e5da0198823	8351	Straža
00050000-55ec-86a5-e2a9-f8a2a7ec233f	1313	Struge
00050000-55ec-86a5-1eb3-c70cdbbafd35	8293	Studenec
00050000-55ec-86a5-54ee-3ea4039e690c	8331	Suhor
00050000-55ec-86a5-bea3-8b160a8f213a	2233	Sv. Ana v Slovenskih goricah
00050000-55ec-86a5-806a-5b72a356e664	2235	Sv. Trojica v Slovenskih goricah
00050000-55ec-86a5-592e-5bbd31cd86a6	2353	Sveti Duh na Ostrem Vrhu
00050000-55ec-86a5-1ae5-a957b839dec4	9244	Sveti Jurij ob Ščavnici
00050000-55ec-86a5-3e81-3002e2b8e7f8	3264	Sveti Štefan
00050000-55ec-86a5-7409-12153f8e0192	2258	Sveti Tomaž
00050000-55ec-86a5-418d-d7f3db0b9403	9204	Šalovci
00050000-55ec-86a5-611d-f797a8918705	5261	Šempas
00050000-55ec-86a5-dad6-a1f570674495	5290	Šempeter pri Gorici
00050000-55ec-86a5-79ab-5c89da7b2db6	3311	Šempeter v Savinjski dolini
00050000-55ec-86a5-f70a-542769a317f0	4208	Šenčur
00050000-55ec-86a5-18a9-99aef52b0469	2212	Šentilj v Slovenskih goricah
00050000-55ec-86a5-76ee-c866eca772aa	8297	Šentjanž
00050000-55ec-86a5-c02b-35e03739bcae	2373	Šentjanž pri Dravogradu
00050000-55ec-86a5-34b8-e55962f54d61	8310	Šentjernej
00050000-55ec-86a5-4abe-a6515287c633	3230	Šentjur
00050000-55ec-86a5-35e5-c50b15051c3f	3271	Šentrupert
00050000-55ec-86a5-091e-c97ccad8c461	8232	Šentrupert
00050000-55ec-86a5-cd18-eb0523519b9b	1296	Šentvid pri Stični
00050000-55ec-86a5-a0de-c50a6dd1c4ed	8275	Škocjan
00050000-55ec-86a5-d67c-87171cb23cf2	6281	Škofije
00050000-55ec-86a5-988d-ac6880b4fc65	4220	Škofja Loka
00050000-55ec-86a5-a397-82e3225e6da8	3211	Škofja vas
00050000-55ec-86a5-3a7b-d46311cfb87d	1291	Škofljica
00050000-55ec-86a5-ce06-31629e7ec9ae	6274	Šmarje
00050000-55ec-86a5-1de0-edd4a5f3cb5e	1293	Šmarje - Sap
00050000-55ec-86a5-9021-cfbe2fc9cd16	3240	Šmarje pri Jelšah
00050000-55ec-86a5-7c72-215f46ef0cf9	8220	Šmarješke Toplice
00050000-55ec-86a5-7976-b1c4258ad48b	2315	Šmartno na Pohorju
00050000-55ec-86a5-9a6f-15296bf75aad	3341	Šmartno ob Dreti
00050000-55ec-86a5-c49d-e2e1961a5d1b	3327	Šmartno ob Paki
00050000-55ec-86a5-c4e7-ebed26d2154d	1275	Šmartno pri Litiji
00050000-55ec-86a5-9a5a-0a81296917cc	2383	Šmartno pri Slovenj Gradcu
00050000-55ec-86a5-6ef4-c7fc71656ec9	3201	Šmartno v Rožni dolini
00050000-55ec-86a5-8b78-9a203446d053	3325	Šoštanj
00050000-55ec-86a5-63ff-43dad5074210	6222	Štanjel
00050000-55ec-86a5-7c39-72174216dbd2	3220	Štore
00050000-55ec-86a5-f611-96f886a782ca	3304	Tabor
00050000-55ec-86a5-d762-844b40891039	3221	Teharje
00050000-55ec-86a5-2cca-f653216c113f	9251	Tišina
00050000-55ec-86a5-c04a-d217e4947350	5220	Tolmin
00050000-55ec-86a5-faec-2ec7c33b3d26	3326	Topolšica
00050000-55ec-86a6-70bf-7954322fcee2	2371	Trbonje
00050000-55ec-86a6-0c05-43497b288962	1420	Trbovlje
00050000-55ec-86a6-862c-d3c622cb387a	8231	Trebelno 
00050000-55ec-86a6-cff8-da118f59fc15	8210	Trebnje
00050000-55ec-86a6-a5ac-87e935530dde	5252	Trnovo pri Gorici
00050000-55ec-86a6-b6c7-274cfd02f44f	2254	Trnovska vas
00050000-55ec-86a6-df7e-4a038d6aef4a	1222	Trojane
00050000-55ec-86a6-88b0-a446215cf85f	1236	Trzin
00050000-55ec-86a6-31d3-ebd1c0cc3698	4290	Tržič
00050000-55ec-86a6-c681-1cb7866c34cc	8295	Tržišče
00050000-55ec-86a6-c935-a56be9567b58	1311	Turjak
00050000-55ec-86a6-51fb-98146c56d234	9224	Turnišče
00050000-55ec-86a6-cd98-de5cce51ae60	8323	Uršna sela
00050000-55ec-86a6-7133-c8e51cda9a1c	1252	Vače
00050000-55ec-86a6-b99a-d14379c7d154	3320	Velenje 
00050000-55ec-86a6-0fc6-71c714b6be7e	3322	Velenje - poštni predali
00050000-55ec-86a6-d5c5-d180e4e2ecc2	8212	Velika Loka
00050000-55ec-86a6-304c-05d49f843e1c	2274	Velika Nedelja
00050000-55ec-86a6-0469-997c4ddba703	9225	Velika Polana
00050000-55ec-86a6-e867-4ccf6dc634c7	1315	Velike Lašče
00050000-55ec-86a6-53da-7b3c994f4237	8213	Veliki Gaber
00050000-55ec-86a6-164b-9204a95fc467	9241	Veržej
00050000-55ec-86a6-81d0-510e446551fc	1312	Videm - Dobrepolje
00050000-55ec-86a6-1daa-fc0c8212bf44	2284	Videm pri Ptuju
00050000-55ec-86a6-6bdd-5ae7abff63d5	8344	Vinica
00050000-55ec-86a6-ca9f-7ed21beb6c07	5271	Vipava
00050000-55ec-86a6-a1d6-f8426950486e	4212	Visoko
00050000-55ec-86a6-8053-012027c6cfe9	1294	Višnja Gora
00050000-55ec-86a6-e81b-6d06ee33b72d	3205	Vitanje
00050000-55ec-86a6-c22d-b9931d79e137	2255	Vitomarci
00050000-55ec-86a6-a814-50399398f5ab	1217	Vodice
00050000-55ec-86a6-1982-0c52260f4096	3212	Vojnik\t
00050000-55ec-86a6-fdfc-98571cccd2bd	5293	Volčja Draga
00050000-55ec-86a6-8433-2ad8f9a5529d	2232	Voličina
00050000-55ec-86a6-57d2-d9b45120eb87	3305	Vransko
00050000-55ec-86a6-95f2-e952cedad426	6217	Vremski Britof
00050000-55ec-86a6-4ac2-97af22512abf	1360	Vrhnika
00050000-55ec-86a6-2d5a-fd2d4a93bbc1	2365	Vuhred
00050000-55ec-86a6-0dc6-eb27ed73026a	2367	Vuzenica
00050000-55ec-86a6-f33a-e33ccd1997de	8292	Zabukovje 
00050000-55ec-86a6-e32c-a4a6016f9e34	1410	Zagorje ob Savi
00050000-55ec-86a6-6894-a712da9084ac	1303	Zagradec
00050000-55ec-86a6-6e9d-91de6fd7fbe5	2283	Zavrč
00050000-55ec-86a6-e999-a15477b3e384	8272	Zdole 
00050000-55ec-86a6-9a9c-04e63be812de	4201	Zgornja Besnica
00050000-55ec-86a6-f7cf-a4afd0683b06	2242	Zgornja Korena
00050000-55ec-86a6-3542-f63c877c1215	2201	Zgornja Kungota
00050000-55ec-86a6-c0e0-81aa0a77b8b7	2316	Zgornja Ložnica
00050000-55ec-86a6-6e93-0065574c6dbd	2314	Zgornja Polskava
00050000-55ec-86a6-54b6-b6e5635d56e3	2213	Zgornja Velka
00050000-55ec-86a6-c759-dcb7d262bf27	4247	Zgornje Gorje
00050000-55ec-86a6-e6cc-fc309d2b31cd	4206	Zgornje Jezersko
00050000-55ec-86a6-f549-5d8ab94688d9	2285	Zgornji Leskovec
00050000-55ec-86a6-7ef3-59c559eec31e	1432	Zidani Most
00050000-55ec-86a6-10c7-227d800b5f0d	3214	Zreče
00050000-55ec-86a6-e827-6731daab44a8	4209	Žabnica
00050000-55ec-86a6-20c4-1f4c4c5f02f4	3310	Žalec
00050000-55ec-86a6-ee14-93a8a9cd41da	4228	Železniki
00050000-55ec-86a6-167b-87d962c322b4	2287	Žetale
00050000-55ec-86a6-1b55-7929840775f7	4226	Žiri
00050000-55ec-86a6-bc24-9aaf5e74547e	4274	Žirovnica
00050000-55ec-86a6-335e-985b38713956	8360	Žužemberk
\.


--
-- TOC entry 3218 (class 0 OID 1197563)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3203 (class 0 OID 1197411)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55ec-86e4-1574-f811600a1739	00080000-55ec-86e4-5055-8cb6402a4b89	\N	00040000-55ec-86a5-629e-91914bab27f9	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55ec-86e4-ad9f-1179f4f27cd1	00080000-55ec-86e4-5055-8cb6402a4b89	\N	00040000-55ec-86a5-629e-91914bab27f9		\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55ec-86e4-d476-b6316e6e0c46	00080000-55ec-86e4-a6b3-7a3929941aff	\N	00040000-55ec-86a5-629e-91914bab27f9		\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3209 (class 0 OID 1197490)
-- Dependencies: 196
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 3219 (class 0 OID 1197569)
-- Dependencies: 206
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3243 (class 0 OID 1197891)
-- Dependencies: 230
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3244 (class 0 OID 1197901)
-- Dependencies: 231
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55ec-86e4-fd31-faf5006e94ce	00080000-55ec-86e4-8b34-dda389d3589b	0987	AK
00190000-55ec-86e4-0e59-fbc9c0ff673e	00080000-55ec-86e4-a6b3-7a3929941aff	0989	AK
00190000-55ec-86e4-39d0-1687507f5488	00080000-55ec-86e4-db95-6ebb1684d3cf	0986	AK
00190000-55ec-86e4-78fd-083fd58ac397	00080000-55ec-86e4-3847-f0d38249a8e4	0984	AK
00190000-55ec-86e4-7d6e-3ba3f303d4b0	00080000-55ec-86e4-34e6-8d66a4cb29bb	0983	AK
00190000-55ec-86e4-fb42-124df2de34f5	00080000-55ec-86e4-4172-5179e16fbc39	0982	AK
\.


--
-- TOC entry 3245 (class 0 OID 1197909)
-- Dependencies: 232
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55ec-86e4-80ec-4f5c7571adcb	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3246 (class 0 OID 1197952)
-- Dependencies: 233
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3220 (class 0 OID 1197576)
-- Dependencies: 207
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, seplanira, kapaciteta, opis) FROM stdin;
00220000-55ec-86e4-7211-57137a5fa39c	\N	\N	0001	Poskusna 1	f	t	8	Poskusna učilnica v prvem
00220000-55ec-86e4-4c1a-ecc2ac198622	\N	\N	0002	Poskusna 3	f	f	34	Poskusna učilnica v tretjem
00220000-55ec-86e4-ba17-43b03f637d79	\N	\N	0003	Kazinska	t	t	84	Kazinska dvorana
00220000-55ec-86e4-69ec-7ed0e26ba99c	\N	\N	0004	Mali oder	t	t	24	Mali oder 
00220000-55ec-86e4-378c-e34a3ee0ee0b	\N	\N	0005	Komorni oder	t	t	15	Komorni oder
00220000-55ec-86e4-7d71-76c19b1b11e2	\N	\N	0006	Stara dvorana	t	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55ec-86e4-1df9-68b7d68cb29e	\N	\N	0007	Velika dvorana	t	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3221 (class 0 OID 1197589)
-- Dependencies: 208
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3222 (class 0 OID 1197598)
-- Dependencies: 209
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3232 (class 0 OID 1197718)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3233 (class 0 OID 1197729)
-- Dependencies: 220
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 1197252)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 3262 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 3223 (class 0 OID 1197608)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3191 (class 0 OID 1197261)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55ec-86a6-9ef1-5c3a42a73845	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55ec-86a6-8e29-fdbbb426c82f	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55ec-86a6-c658-29b36067d6fb	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55ec-86a6-c311-0da4a4c068e4	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55ec-86a6-6a2b-01b640658838	planer	Planer dogodkov v koledarju	t
00020000-55ec-86a6-15b1-25094143347d	kadrovska	Kadrovska služba	t
00020000-55ec-86a6-b424-fb6de2256604	arhivar	Ažuriranje arhivalij	t
00020000-55ec-86a6-3eed-4c2e5c651284	igralec	Igralec	t
00020000-55ec-86a6-3aa8-7df96c7d20a3	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55ec-86e4-97bd-5e6d76c4890d	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3194 (class 0 OID 1197291)
-- Dependencies: 181
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55ec-86a6-3e54-cfe758d2262b	00020000-55ec-86a6-c658-29b36067d6fb
00010000-55ec-86a6-f186-3c2357d4b25b	00020000-55ec-86a6-c658-29b36067d6fb
00010000-55ec-86e4-f922-c85c708b0b21	00020000-55ec-86e4-97bd-5e6d76c4890d
\.


--
-- TOC entry 3224 (class 0 OID 1197614)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3225 (class 0 OID 1197626)
-- Dependencies: 212
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 1197497)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 1197217)
-- Dependencies: 172
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55ec-86a6-d16e-a25c58323222	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55ec-86a6-21df-4dd618ebcc77	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55ec-86a6-e3b1-de39864d7e48	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55ec-86a6-0c01-afe8afb2ce66	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55ec-86a6-6b1f-5cc48df21ef2	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3186 (class 0 OID 1197228)
-- Dependencies: 173
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55ec-86a6-063b-808eb2a206dd	00230000-55ec-86a6-0c01-afe8afb2ce66	popa
00240000-55ec-86a6-36b5-15e0ae5635e0	00230000-55ec-86a6-0c01-afe8afb2ce66	oseba
00240000-55ec-86a6-842d-3af9b32a3d5d	00230000-55ec-86a6-0c01-afe8afb2ce66	sezona
00240000-55ec-86a6-9131-f7a60bc065d3	00230000-55ec-86a6-21df-4dd618ebcc77	prostor
00240000-55ec-86a6-c278-0d72cfcf77e5	00230000-55ec-86a6-0c01-afe8afb2ce66	besedilo
00240000-55ec-86a6-120f-b624c96c77d0	00230000-55ec-86a6-0c01-afe8afb2ce66	uprizoritev
00240000-55ec-86a6-f2d2-d9c7a1d4be01	00230000-55ec-86a6-0c01-afe8afb2ce66	funkcija
00240000-55ec-86a6-5f9f-9b46c5f2baf2	00230000-55ec-86a6-0c01-afe8afb2ce66	tipfunkcije
00240000-55ec-86a6-06ab-7bdffe8d8aff	00230000-55ec-86a6-0c01-afe8afb2ce66	alternacija
00240000-55ec-86a6-8a6f-91304cc4d4ba	00230000-55ec-86a6-d16e-a25c58323222	pogodba
00240000-55ec-86a6-1221-03f4e564f7c3	00230000-55ec-86a6-0c01-afe8afb2ce66	zaposlitev
00240000-55ec-86a6-5752-a6a8b3babcbe	00230000-55ec-86a6-0c01-afe8afb2ce66	zvrstuprizoritve
00240000-55ec-86a6-1648-b2cab7c6da09	00230000-55ec-86a6-d16e-a25c58323222	programdela
00240000-55ec-86a6-61f3-383eb87f7b97	00230000-55ec-86a6-0c01-afe8afb2ce66	zapis
\.


--
-- TOC entry 3187 (class 0 OID 1197236)
-- Dependencies: 174
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 3234 (class 0 OID 1197739)
-- Dependencies: 221
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55ec-86e4-70d6-9b9c805d341f	000e0000-55ec-86e4-1e02-4f0ff1f82398	00080000-55ec-86e4-5055-8cb6402a4b89	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55ec-86a6-dee0-52cc495d57cc
00270000-55ec-86e4-d015-ee9b7bb5336c	000e0000-55ec-86e4-1e02-4f0ff1f82398	00080000-55ec-86e4-5055-8cb6402a4b89	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55ec-86a6-dee0-52cc495d57cc
00270000-55ec-86e4-b9fd-108ddc5efa00	000e0000-55ec-86e4-1e02-4f0ff1f82398	00080000-55ec-86e4-ae05-7d61e7ab3560	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4	\N
\.


--
-- TOC entry 3204 (class 0 OID 1197426)
-- Dependencies: 191
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 1197522)
-- Dependencies: 200
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55ec-86e4-b017-a08698bf9ac6	00180000-55ec-86e4-1b7f-6fe5a9afa0b7	000c0000-55ec-86e4-c686-d70ee2b39b99	00090000-55ec-86e4-95fe-de67472c42db	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ec-86e4-7cef-d201422900f3	00180000-55ec-86e4-1b7f-6fe5a9afa0b7	000c0000-55ec-86e4-caf9-5ee45c30b61d	00090000-55ec-86e4-0cb1-1381f3cc9f6a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ec-86e4-aa0b-3e10c5ea9f06	00180000-55ec-86e4-1b7f-6fe5a9afa0b7	000c0000-55ec-86e4-d2ab-f33ee11cc2ee	00090000-55ec-86e4-f495-e4cc1333eab4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ec-86e4-199e-a02c78644af3	00180000-55ec-86e4-1b7f-6fe5a9afa0b7	000c0000-55ec-86e4-38ab-62b6e2372ca6	00090000-55ec-86e4-d790-a98c4b784cdd	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ec-86e4-a981-c9ec58f6d5c2	00180000-55ec-86e4-1b7f-6fe5a9afa0b7	000c0000-55ec-86e4-db9f-207fd0096e9e	00090000-55ec-86e4-ff92-e37738b273b6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55ec-86e4-df74-3c287b178427	00180000-55ec-86e4-644d-0e595e1e1f2a	\N	00090000-55ec-86e4-ff92-e37738b273b6	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3235 (class 0 OID 1197753)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55ec-86a6-8ea7-ffea29f13ea1	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-55ec-86a6-3efc-f574af1aea90	02	Priredba	Priredba	Priredba	umetnik
000f0000-55ec-86a6-fc32-c444dff145e4	03	Prevod	Prevod	Prevod	umetnik
000f0000-55ec-86a6-128b-b0158d1bd694	04	Režija	Režija	Režija	umetnik
000f0000-55ec-86a6-261a-b3b608e9eee0	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55ec-86a6-31a4-372f2ee9a5ec	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55ec-86a6-7300-599adc44bf8d	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55ec-86a6-dd50-adf5be7a9dfa	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55ec-86a6-bdc9-f2354473a3d8	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55ec-86a6-553b-676db18b363b	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55ec-86a6-fc9f-e1a15ac88fde	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55ec-86a6-d5e3-56894bf4f819	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55ec-86a6-ea59-39e1fedc45f1	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55ec-86a6-c525-38eafbc632d0	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55ec-86a6-1da5-d72b1d21453e	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55ec-86a6-4440-e0e6cc564dc7	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55ec-86a6-743c-7ea2823a17ce	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55ec-86a6-2716-6a2d57c2155b	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3247 (class 0 OID 1197962)
-- Dependencies: 234
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55ec-86a6-03ce-6b0e8d576143	01	Velika predstava	f	1.00	1.00
002b0000-55ec-86a6-1d2c-29ddd962cf19	02	Mala predstava	f	0.50	0.50
002b0000-55ec-86a6-c991-6e95c530329f	03	Mala koprodukcija	t	0.40	1.00
002b0000-55ec-86a6-6ef7-c8ca536ee714	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55ec-86a6-a983-a55609f8011c	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3205 (class 0 OID 1197434)
-- Dependencies: 192
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 1197278)
-- Dependencies: 180
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55ec-86a6-f186-3c2357d4b25b	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROnPRR2LG4v3gc2eaWo4o/6/ypXy4RIHm	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55ec-86a6-3e54-cfe758d2262b	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
00010000-55ec-86e4-218c-9cf499616619	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55ec-86e4-595e-604aa0a1fea5	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55ec-86e4-ccf2-eb36ade6652c	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55ec-86e4-c35b-bb0b32e8958b	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55ec-86e4-f88f-ff7b4cf055ef	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55ec-86e4-25b1-eff5caf98414	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55ec-86e4-0f98-7639ac459789	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55ec-86e4-88b2-1551709eee9f	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55ec-86e4-32c6-221a6cffd752	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55ec-86e4-f922-c85c708b0b21	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3236 (class 0 OID 1197765)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55ec-86e4-b8e0-97ffea9d8388	00160000-55ec-86e4-a643-efe7ed68c64a	\N	00140000-55ec-86a6-9c90-c4d26a374a82	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55ec-86e4-378c-e34a3ee0ee0b
000e0000-55ec-86e4-1e02-4f0ff1f82398	00160000-55ec-86e4-43a8-feb4faf2b193	\N	00140000-55ec-86a6-1251-ed94205faab4	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55ec-86e4-7d71-76c19b1b11e2
000e0000-55ec-86e4-b973-626c965d69dd	\N	\N	00140000-55ec-86a6-1251-ed94205faab4	00190000-55ec-86e4-fd31-faf5006e94ce	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55ec-86e4-378c-e34a3ee0ee0b
000e0000-55ec-86e4-d15d-cd3a6b9ddf9c	\N	\N	00140000-55ec-86a6-1251-ed94205faab4	00190000-55ec-86e4-fd31-faf5006e94ce	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55ec-86e4-378c-e34a3ee0ee0b
000e0000-55ec-86e4-95af-e39b919e1398	\N	\N	00140000-55ec-86a6-1251-ed94205faab4	00190000-55ec-86e4-fd31-faf5006e94ce	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55ec-86e4-7211-57137a5fa39c
000e0000-55ec-86e4-3a7a-0f560aa943d6	\N	\N	00140000-55ec-86a6-1251-ed94205faab4	00190000-55ec-86e4-fd31-faf5006e94ce	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55ec-86e4-7211-57137a5fa39c
\.


--
-- TOC entry 3211 (class 0 OID 1197507)
-- Dependencies: 198
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55ec-86e4-370a-ae857499c2a9	000e0000-55ec-86e4-1e02-4f0ff1f82398	\N	1	
00200000-55ec-86e4-7b41-e13391ec4ec9	000e0000-55ec-86e4-1e02-4f0ff1f82398	\N	2	
\.


--
-- TOC entry 3226 (class 0 OID 1197632)
-- Dependencies: 213
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3237 (class 0 OID 1197790)
-- Dependencies: 224
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55ec-86a6-706b-ca9aec8b5a13	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55ec-86a6-0eff-561210af9192	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55ec-86a6-6c34-8f748686e87c	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55ec-86a6-dad7-911c387ee707	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55ec-86a6-7e08-2d2282280792	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55ec-86a6-d17e-fe8931493604	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55ec-86a6-7832-f18088a2835f	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55ec-86a6-9ae6-6bea2954a13a	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55ec-86a6-dee0-52cc495d57cc	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55ec-86a6-89c0-f7b53fb7bb05	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55ec-86a6-ef49-02a038f5fdbc	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55ec-86a6-afe3-8bfcb8ea6b0f	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55ec-86a6-7a45-370a7d7ba228	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55ec-86a6-11c3-86f07b286a82	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55ec-86a6-e11f-5c08c79a6336	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55ec-86a6-fb09-dbefac368d5f	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55ec-86a6-26b9-871db7b9f492	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55ec-86a6-f58f-79355baee0c6	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55ec-86a6-c41e-c1ef92c87647	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55ec-86a6-ddfb-16f17987554c	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55ec-86a6-d4eb-be4db4bd5f11	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55ec-86a6-e989-bb012f380ea4	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55ec-86a6-983a-2fdc5650de30	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55ec-86a6-1ebd-b91e7380f762	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55ec-86a6-6678-aa1ace6e0585	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55ec-86a6-cab3-17c74366f2bc	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55ec-86a6-a576-82fc5d9667df	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55ec-86a6-5e36-286594eeba67	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3252 (class 0 OID 1198016)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3253 (class 0 OID 1198028)
-- Dependencies: 240
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3254 (class 0 OID 1198056)
-- Dependencies: 241
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3238 (class 0 OID 1197799)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55ec-86e4-ed44-aa7bd8138dc4	00090000-55ec-86e4-0cb1-1381f3cc9f6a	01	A	Mojster	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ec-86e4-9bfd-9ce4969d6f34	00090000-55ec-86e4-f495-e4cc1333eab4	02	A	Igralec	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ec-86e4-6ff9-2861ac3bbd2d	00090000-55ec-86e4-642a-9d521953298e	03	A	Natakar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ec-86e4-9054-7f7f904f0160	00090000-55ec-86e4-2637-8e0315637d14	04	A	Mizar	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ec-86e4-0b3a-aa991cce916b	00090000-55ec-86e4-95fe-de67472c42db	05	A	Šivilja	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55ec-86e4-2607-6e0599ef5b21	00090000-55ec-86e4-efe3-823c2bd4f0af	06	A	Inšpicient	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 3212 (class 0 OID 1197517)
-- Dependencies: 199
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 3239 (class 0 OID 1197809)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55ec-86a6-9c90-c4d26a374a82	01	Drama	drama (SURS 01)
00140000-55ec-86a6-e26b-8a384a84c721	02	Opera	opera (SURS 02)
00140000-55ec-86a6-2ad4-b43b1231246a	03	Balet	balet (SURS 03)
00140000-55ec-86a6-a77e-869f1b8ebd79	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55ec-86a6-a247-cb6e0d8be5f2	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55ec-86a6-1251-ed94205faab4	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55ec-86a6-27cf-41a50cce9e32	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3240 (class 0 OID 1197819)
-- Dependencies: 227
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2741 (class 2606 OID 1197306)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 1197647)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 1197667)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2878 (class 2606 OID 1197686)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2950 (class 2606 OID 1197986)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 1197463)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 1197478)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2925 (class 2606 OID 1197834)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 1197319)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2928 (class 2606 OID 1197885)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2880 (class 2606 OID 1197698)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 1197488)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2751 (class 2606 OID 1197333)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2819 (class 2606 OID 1197539)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2955 (class 2606 OID 1197997)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2959 (class 2606 OID 1198004)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2963 (class 2606 OID 1198013)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2822 (class 2606 OID 1197547)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 1197346)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 1197356)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 1197380)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 1197275)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2724 (class 2606 OID 1197249)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2825 (class 2606 OID 1197553)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 1197562)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2888 (class 2606 OID 1197713)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 1197400)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 1197409)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 1197567)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 1197422)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 1197494)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 1197573)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2937 (class 2606 OID 1197898)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2939 (class 2606 OID 1197906)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2943 (class 2606 OID 1197951)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2946 (class 2606 OID 1197960)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2838 (class 2606 OID 1197584)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 1197593)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2852 (class 2606 OID 1197603)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2891 (class 2606 OID 1197728)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2895 (class 2606 OID 1197736)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 1197260)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2855 (class 2606 OID 1197612)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 1197295)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2728 (class 2606 OID 1197269)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 1197622)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 1197631)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 1197505)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 1197226)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 1197233)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 1197240)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2900 (class 2606 OID 1197749)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 1197431)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 1197531)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2902 (class 2606 OID 1197762)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2948 (class 2606 OID 1197972)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 1197445)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 1197290)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2912 (class 2606 OID 1197783)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2810 (class 2606 OID 1197515)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2865 (class 2606 OID 1197638)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2914 (class 2606 OID 1197798)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2966 (class 2606 OID 1198026)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2973 (class 2606 OID 1198050)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2976 (class 2606 OID 1198062)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2917 (class 2606 OID 1197807)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2812 (class 2606 OID 1197521)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2920 (class 2606 OID 1197817)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2923 (class 2606 OID 1197827)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 1259 OID 1197472)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2787 (class 1259 OID 1197473)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2788 (class 1259 OID 1197471)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2789 (class 1259 OID 1197470)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2896 (class 1259 OID 1197750)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2897 (class 1259 OID 1197751)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2898 (class 1259 OID 1197752)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2952 (class 1259 OID 1197999)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2953 (class 1259 OID 1197998)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2764 (class 1259 OID 1197402)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2823 (class 1259 OID 1197554)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2967 (class 1259 OID 1198054)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2968 (class 1259 OID 1198053)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2969 (class 1259 OID 1198055)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2970 (class 1259 OID 1198052)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2971 (class 1259 OID 1198051)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2831 (class 1259 OID 1197575)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2832 (class 1259 OID 1197574)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2808 (class 1259 OID 1197516)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2881 (class 1259 OID 1197699)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2882 (class 1259 OID 1197701)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2883 (class 1259 OID 1197700)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2748 (class 1259 OID 1197335)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2749 (class 1259 OID 1197334)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2944 (class 1259 OID 1197961)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2884 (class 1259 OID 1197715)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2885 (class 1259 OID 1197716)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2886 (class 1259 OID 1197717)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2974 (class 1259 OID 1198063)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2905 (class 1259 OID 1197788)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2906 (class 1259 OID 1197785)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2907 (class 1259 OID 1197789)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2908 (class 1259 OID 1197787)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2909 (class 1259 OID 1197786)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2780 (class 1259 OID 1197447)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2781 (class 1259 OID 1197446)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2759 (class 1259 OID 1197383)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2853 (class 1259 OID 1197613)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2730 (class 1259 OID 1197276)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2731 (class 1259 OID 1197277)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2856 (class 1259 OID 1197625)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2857 (class 1259 OID 1197624)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2858 (class 1259 OID 1197623)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2801 (class 1259 OID 1197495)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2802 (class 1259 OID 1197496)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2717 (class 1259 OID 1197235)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2847 (class 1259 OID 1197607)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2848 (class 1259 OID 1197605)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2849 (class 1259 OID 1197604)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2850 (class 1259 OID 1197606)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2736 (class 1259 OID 1197296)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2737 (class 1259 OID 1197297)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2863 (class 1259 OID 1197639)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2951 (class 1259 OID 1197987)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2960 (class 1259 OID 1198014)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2961 (class 1259 OID 1198015)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2828 (class 1259 OID 1197568)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2892 (class 1259 OID 1197737)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2893 (class 1259 OID 1197738)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2929 (class 1259 OID 1197890)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2930 (class 1259 OID 1197889)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2931 (class 1259 OID 1197886)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2932 (class 1259 OID 1197887)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2933 (class 1259 OID 1197888)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2771 (class 1259 OID 1197424)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2772 (class 1259 OID 1197423)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2773 (class 1259 OID 1197425)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2835 (class 1259 OID 1197588)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2836 (class 1259 OID 1197587)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2934 (class 1259 OID 1197899)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2935 (class 1259 OID 1197900)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2868 (class 1259 OID 1197651)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2869 (class 1259 OID 1197652)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2870 (class 1259 OID 1197649)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2871 (class 1259 OID 1197650)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2915 (class 1259 OID 1197808)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2841 (class 1259 OID 1197597)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2842 (class 1259 OID 1197596)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2843 (class 1259 OID 1197594)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2844 (class 1259 OID 1197595)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2875 (class 1259 OID 1197669)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2876 (class 1259 OID 1197668)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2800 (class 1259 OID 1197489)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2926 (class 1259 OID 1197835)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2956 (class 1259 OID 1198005)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2957 (class 1259 OID 1198006)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2755 (class 1259 OID 1197358)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2756 (class 1259 OID 1197357)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2776 (class 1259 OID 1197432)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2777 (class 1259 OID 1197433)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2813 (class 1259 OID 1197534)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2814 (class 1259 OID 1197533)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2815 (class 1259 OID 1197532)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2790 (class 1259 OID 1197465)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2791 (class 1259 OID 1197466)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2792 (class 1259 OID 1197464)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2793 (class 1259 OID 1197468)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2794 (class 1259 OID 1197469)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2795 (class 1259 OID 1197467)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2767 (class 1259 OID 1197401)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2744 (class 1259 OID 1197320)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2745 (class 1259 OID 1197322)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2746 (class 1259 OID 1197321)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2747 (class 1259 OID 1197323)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2820 (class 1259 OID 1197540)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2889 (class 1259 OID 1197714)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2910 (class 1259 OID 1197784)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2903 (class 1259 OID 1197763)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2904 (class 1259 OID 1197764)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2762 (class 1259 OID 1197381)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2763 (class 1259 OID 1197382)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2921 (class 1259 OID 1197828)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2716 (class 1259 OID 1197227)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2754 (class 1259 OID 1197347)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2720 (class 1259 OID 1197234)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2839 (class 1259 OID 1197586)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2840 (class 1259 OID 1197585)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2872 (class 1259 OID 1197648)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2770 (class 1259 OID 1197410)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2918 (class 1259 OID 1197818)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2964 (class 1259 OID 1198027)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2940 (class 1259 OID 1197907)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2941 (class 1259 OID 1197908)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2807 (class 1259 OID 1197506)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2729 (class 1259 OID 1197270)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2997 (class 2606 OID 1198164)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2998 (class 2606 OID 1198169)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 3002 (class 2606 OID 1198189)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2996 (class 2606 OID 1198159)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 3000 (class 2606 OID 1198179)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 3001 (class 2606 OID 1198184)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2999 (class 2606 OID 1198174)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 3044 (class 2606 OID 1198399)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 3045 (class 2606 OID 1198404)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3046 (class 2606 OID 1198409)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3065 (class 2606 OID 1198504)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3064 (class 2606 OID 1198499)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2988 (class 2606 OID 1198119)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 3011 (class 2606 OID 1198234)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3073 (class 2606 OID 1198544)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3072 (class 2606 OID 1198539)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3074 (class 2606 OID 1198549)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3071 (class 2606 OID 1198534)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3070 (class 2606 OID 1198529)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 3014 (class 2606 OID 1198249)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 3013 (class 2606 OID 1198244)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 3006 (class 2606 OID 1198209)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3036 (class 2606 OID 1198359)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3038 (class 2606 OID 1198369)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 3037 (class 2606 OID 1198364)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2983 (class 2606 OID 1198094)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2982 (class 2606 OID 1198089)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3010 (class 2606 OID 1198229)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3062 (class 2606 OID 1198489)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3039 (class 2606 OID 1198374)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 3040 (class 2606 OID 1198379)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3041 (class 2606 OID 1198384)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3075 (class 2606 OID 1198554)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 3050 (class 2606 OID 1198429)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 3047 (class 2606 OID 1198414)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 3051 (class 2606 OID 1198434)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 3049 (class 2606 OID 1198424)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 3048 (class 2606 OID 1198419)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2995 (class 2606 OID 1198154)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2994 (class 2606 OID 1198149)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2987 (class 2606 OID 1198114)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2986 (class 2606 OID 1198109)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 3025 (class 2606 OID 1198304)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2978 (class 2606 OID 1198069)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2979 (class 2606 OID 1198074)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 3028 (class 2606 OID 1198319)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3027 (class 2606 OID 1198314)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 3026 (class 2606 OID 1198309)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 3004 (class 2606 OID 1198199)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3005 (class 2606 OID 1198204)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2977 (class 2606 OID 1198064)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 3024 (class 2606 OID 1198299)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 3022 (class 2606 OID 1198289)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 3021 (class 2606 OID 1198284)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 3023 (class 2606 OID 1198294)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2980 (class 2606 OID 1198079)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2981 (class 2606 OID 1198084)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 3029 (class 2606 OID 1198324)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3063 (class 2606 OID 1198494)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 3068 (class 2606 OID 1198519)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3069 (class 2606 OID 1198524)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 3012 (class 2606 OID 1198239)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 3042 (class 2606 OID 1198389)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 3043 (class 2606 OID 1198394)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3058 (class 2606 OID 1198469)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3057 (class 2606 OID 1198464)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3054 (class 2606 OID 1198449)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3055 (class 2606 OID 1198454)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3056 (class 2606 OID 1198459)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2990 (class 2606 OID 1198129)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2989 (class 2606 OID 1198124)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2991 (class 2606 OID 1198134)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 3016 (class 2606 OID 1198259)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 3015 (class 2606 OID 1198254)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3059 (class 2606 OID 1198474)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3060 (class 2606 OID 1198479)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 3032 (class 2606 OID 1198339)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 3033 (class 2606 OID 1198344)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 3030 (class 2606 OID 1198329)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 3031 (class 2606 OID 1198334)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 3052 (class 2606 OID 1198439)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 3020 (class 2606 OID 1198279)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 3019 (class 2606 OID 1198274)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3017 (class 2606 OID 1198264)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 3018 (class 2606 OID 1198269)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 3035 (class 2606 OID 1198354)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3034 (class 2606 OID 1198349)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 3003 (class 2606 OID 1198194)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 3061 (class 2606 OID 1198484)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3053 (class 2606 OID 1198444)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3066 (class 2606 OID 1198509)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3067 (class 2606 OID 1198514)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2985 (class 2606 OID 1198104)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2984 (class 2606 OID 1198099)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2992 (class 2606 OID 1198139)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2993 (class 2606 OID 1198144)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 1198224)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 3008 (class 2606 OID 1198219)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 3007 (class 2606 OID 1198214)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-06 20:33:31 CEST

--
-- PostgreSQL database dump complete
--

