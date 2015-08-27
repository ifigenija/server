--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-27 14:12:44 CEST

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
-- TOC entry 177 (class 1259 OID 15906520)
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
-- TOC entry 223 (class 1259 OID 15907036)
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
-- TOC entry 222 (class 1259 OID 15907019)
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
-- TOC entry 216 (class 1259 OID 15906929)
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
-- TOC entry 239 (class 1259 OID 15907285)
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
-- TOC entry 191 (class 1259 OID 15906698)
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
-- TOC entry 194 (class 1259 OID 15906732)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 15907187)
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
-- TOC entry 186 (class 1259 OID 15906641)
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
-- TOC entry 224 (class 1259 OID 15907049)
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
-- TOC entry 210 (class 1259 OID 15906864)
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
-- TOC entry 189 (class 1259 OID 15906678)
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
-- TOC entry 193 (class 1259 OID 15906726)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 15906658)
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
-- TOC entry 199 (class 1259 OID 15906779)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 237 (class 1259 OID 15907266)
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
-- TOC entry 238 (class 1259 OID 15907278)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 15907300)
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
-- TOC entry 203 (class 1259 OID 15906804)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 15906615)
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
-- TOC entry 178 (class 1259 OID 15906529)
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
-- TOC entry 179 (class 1259 OID 15906540)
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
-- TOC entry 174 (class 1259 OID 15906494)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 15906513)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 15906811)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 15906844)
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
-- TOC entry 219 (class 1259 OID 15906968)
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
-- TOC entry 181 (class 1259 OID 15906573)
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
-- TOC entry 183 (class 1259 OID 15906607)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 15906785)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 15906592)
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
-- TOC entry 188 (class 1259 OID 15906670)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 15906797)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 15907148)
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
-- TOC entry 227 (class 1259 OID 15907158)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 15907104)
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
-- TOC entry 228 (class 1259 OID 15907166)
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
-- TOC entry 206 (class 1259 OID 15906826)
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
-- TOC entry 198 (class 1259 OID 15906770)
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
-- TOC entry 197 (class 1259 OID 15906760)
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
-- TOC entry 218 (class 1259 OID 15906957)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 15906896)
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
-- TOC entry 171 (class 1259 OID 15906465)
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
-- TOC entry 170 (class 1259 OID 15906463)
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
-- TOC entry 207 (class 1259 OID 15906838)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 15906503)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 15906487)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 15906852)
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
-- TOC entry 201 (class 1259 OID 15906791)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 15906737)
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
-- TOC entry 233 (class 1259 OID 15907207)
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
-- TOC entry 232 (class 1259 OID 15907199)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 15907194)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 15906906)
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
-- TOC entry 180 (class 1259 OID 15906565)
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
-- TOC entry 196 (class 1259 OID 15906747)
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
-- TOC entry 217 (class 1259 OID 15906946)
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
-- TOC entry 229 (class 1259 OID 15907176)
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
-- TOC entry 185 (class 1259 OID 15906627)
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
-- TOC entry 172 (class 1259 OID 15906474)
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
-- TOC entry 221 (class 1259 OID 15906994)
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
-- TOC entry 190 (class 1259 OID 15906689)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 15906818)
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
-- TOC entry 215 (class 1259 OID 15906920)
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
-- TOC entry 235 (class 1259 OID 15907246)
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
-- TOC entry 234 (class 1259 OID 15907218)
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
-- TOC entry 236 (class 1259 OID 15907258)
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
-- TOC entry 212 (class 1259 OID 15906889)
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
-- TOC entry 192 (class 1259 OID 15906721)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 15906984)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 15906879)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 15906468)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2911 (class 0 OID 15906520)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2957 (class 0 OID 15907036)
-- Dependencies: 223
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55de-febb-517c-758d46460de5	000d0000-55de-febb-9e1e-6e687855059c	\N	00090000-55de-feba-c374-4e6215f983c4	000b0000-55de-febb-6943-b2911d38ccd5	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55de-febb-ff8a-bb090aed330d	000d0000-55de-febb-1800-98c4479fbe9e	00100000-55de-febb-7f0d-6b33b33f73d9	00090000-55de-feba-859a-6ee7fe87d0d6	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55de-febb-c3ce-7927fcc33d1e	000d0000-55de-febb-7190-5cffeb94d51c	00100000-55de-febb-c30b-270c50709629	00090000-55de-feba-c998-2ba6a8639108	\N	0003	t	\N	2015-08-27	\N	2	\N	\N	f	f
000c0000-55de-febb-9138-0d768fee0c0f	000d0000-55de-febb-04e7-0b47a6b00d53	\N	00090000-55de-feba-3e2c-9498d8e28a24	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55de-febb-b5dc-e3d990c6b689	000d0000-55de-febb-f9fc-9b4778685bdc	\N	00090000-55de-feba-3afe-fe024f8d82f8	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55de-febb-e7ee-d3d39bb0acd2	000d0000-55de-febb-8949-a82f091c95f4	\N	00090000-55de-feba-ffa4-6f04fbc838b9	000b0000-55de-febb-8550-42b400062115	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55de-febb-3a17-214484d9df4d	000d0000-55de-febb-4895-0118e10395e2	00100000-55de-febb-e9b7-8309c4f398b9	00090000-55de-feba-7442-d79937e8a638	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55de-febb-3e50-6976d37778ef	000d0000-55de-febb-fab4-a20b5dbf6d6c	\N	00090000-55de-feba-272a-f946224d18f6	000b0000-55de-febb-b477-65956df5bf70	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55de-febb-e60d-c11566bda2d0	000d0000-55de-febb-4895-0118e10395e2	00100000-55de-febb-a992-dc690f5ead24	00090000-55de-feba-4356-e2b16cb3aa2e	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55de-febb-1e96-0c6fadf16202	000d0000-55de-febb-4895-0118e10395e2	00100000-55de-febb-6bf9-f7348a38308a	00090000-55de-feba-f00e-4b442c22642f	\N	0010	t	\N	2015-08-27	\N	16	\N	\N	f	t
000c0000-55de-febb-f622-67af29664e00	000d0000-55de-febb-4895-0118e10395e2	00100000-55de-febb-ddc2-87b3ebdd3a12	00090000-55de-feba-b211-3682be19e752	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2956 (class 0 OID 15907019)
-- Dependencies: 222
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 15906929)
-- Dependencies: 216
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55de-feba-c4f3-0a58d50ae0a4	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55de-feba-7360-69f65203fbde	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55de-feba-9b7b-8b2471967574	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2973 (class 0 OID 15907285)
-- Dependencies: 239
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2925 (class 0 OID 15906698)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55de-febb-86ea-c2a2c04fa3aa	\N	\N	00200000-55de-febb-51e2-640d8e4438f8	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55de-febb-6257-4ff90e248a91	\N	\N	00200000-55de-febb-b709-7d752f0b98ae	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55de-febb-ca54-ffdf59a4a053	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55de-febb-8d41-c622544e8694	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55de-febb-ba55-c62ccc2a965e	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2928 (class 0 OID 15906732)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 15907187)
-- Dependencies: 230
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 15906641)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55de-feb9-d0e7-155b1abca781	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55de-feb9-d1d9-e3ee7bc1aea6	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55de-feb9-ac11-a1899f2b9022	AL	ALB	008	Albania 	Albanija	\N
00040000-55de-feb9-27ba-e3c7f7ff5189	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55de-feb9-e8f1-8ff4b06f7211	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55de-feb9-46b7-c317f0712ed2	AD	AND	020	Andorra 	Andora	\N
00040000-55de-feb9-4ac6-4f1550483dae	AO	AGO	024	Angola 	Angola	\N
00040000-55de-feb9-e782-3277e25d86b5	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55de-feb9-6846-e48be50b85d4	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55de-feb9-7826-d512f718064e	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55de-feb9-9983-07fdbce9656a	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55de-feb9-b92b-9eb4ec743ad9	AM	ARM	051	Armenia 	Armenija	\N
00040000-55de-feb9-154f-945283ddb17d	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55de-feb9-6c18-bad6a84206a4	AU	AUS	036	Australia 	Avstralija	\N
00040000-55de-feb9-8c4f-a216f1150ab4	AT	AUT	040	Austria 	Avstrija	\N
00040000-55de-feb9-4f01-9b1c77779a95	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55de-feb9-0962-36e4f52b198c	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55de-feb9-589c-6c6440e4fd41	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55de-feb9-3bef-a2ad05671bd2	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55de-feb9-8457-1319949d29ff	BB	BRB	052	Barbados 	Barbados	\N
00040000-55de-feb9-3289-35e17fad0f7d	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55de-feb9-8cbb-ca4c2782d98b	BE	BEL	056	Belgium 	Belgija	\N
00040000-55de-feb9-e17a-0aebacc9ca22	BZ	BLZ	084	Belize 	Belize	\N
00040000-55de-feb9-c09b-5773129607ea	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55de-feb9-bdde-47009766b42a	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55de-feb9-d89e-5edbd2952e03	BT	BTN	064	Bhutan 	Butan	\N
00040000-55de-feb9-b743-a3805568f8a0	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55de-feb9-9e1c-8635c6c223f6	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55de-feb9-116b-64378d173bb5	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55de-feb9-ff8c-bee0fa26f2c7	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55de-feb9-f151-9192f8c7ca76	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55de-feb9-73ca-a19b178d100c	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55de-feb9-2a16-6118c5632a6f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55de-feb9-dbe8-f2260794f267	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55de-feb9-e73c-8484c9875329	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55de-feb9-8918-4f566daeb346	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55de-feb9-cca7-cb110b6a0bb1	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55de-feb9-72ec-a061711f05d7	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55de-feb9-61f1-f466c006e184	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55de-feb9-b80f-127c822c572e	CA	CAN	124	Canada 	Kanada	\N
00040000-55de-feb9-d781-1bb4835f0263	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55de-feb9-d3ce-6b62ccf7d3d3	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55de-feb9-e6e9-c55dab61d4a5	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55de-feb9-8ad8-6fedff87cdb0	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55de-feb9-5491-f94f9d60219d	CL	CHL	152	Chile 	Čile	\N
00040000-55de-feb9-0341-7c3efd219018	CN	CHN	156	China 	Kitajska	\N
00040000-55de-feb9-16bc-e2b2c09b68aa	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55de-feb9-68b6-ee6da4984410	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55de-feb9-4efb-389d7f527768	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55de-feb9-05ae-8a81118b682b	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55de-feb9-c33d-e09a2cc52bf7	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55de-feb9-85c1-7b77c73e8f46	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55de-feb9-7579-50c9ac025983	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55de-feb9-917b-1db77f11eced	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55de-feb9-88b3-48acfdfa9835	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55de-feb9-797b-8312c067a0a0	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55de-feb9-4e64-4bb8a2e2772d	CU	CUB	192	Cuba 	Kuba	\N
00040000-55de-feb9-fd1a-ac75b31148a3	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55de-feb9-5e25-080705c6d2c7	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55de-feb9-e3d0-0cc04bb810a5	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55de-feb9-f6d6-33c78aec8a62	DK	DNK	208	Denmark 	Danska	\N
00040000-55de-feb9-06e6-2b51d697b6fe	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55de-feb9-4f0b-29af6484f98b	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55de-feb9-5e39-f770e179266b	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55de-feb9-4931-7276123e658e	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55de-feb9-95f6-dedc59622c54	EG	EGY	818	Egypt 	Egipt	\N
00040000-55de-feb9-1b95-eb7e69c382e1	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55de-feb9-7f2d-9870aa30c12c	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55de-feb9-24a2-57ae33caa80d	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55de-feb9-4c8f-04f82071fd22	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55de-feb9-80cb-6da08d95913c	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55de-feb9-6706-ab7dcab029c8	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55de-feb9-5099-90f8ed0942b1	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55de-feb9-e538-e88abf8b465a	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55de-feb9-c845-4c70c2c06f6e	FI	FIN	246	Finland 	Finska	\N
00040000-55de-feb9-e65c-a3835e0a67aa	FR	FRA	250	France 	Francija	\N
00040000-55de-feb9-9c33-ebea3ebcf14a	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55de-feb9-9a0c-651a6ea2c0d2	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55de-feb9-6ef4-55b9ce0d7bb6	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55de-feb9-10aa-ea923fc33835	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55de-feb9-e6a7-30f103c5742b	GA	GAB	266	Gabon 	Gabon	\N
00040000-55de-feb9-3dda-f4ae4c52addc	GM	GMB	270	Gambia 	Gambija	\N
00040000-55de-feb9-fbcf-e2b1ecde7ed3	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55de-feb9-0618-e97d604a913d	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55de-feb9-21d9-583d94cbaf83	GH	GHA	288	Ghana 	Gana	\N
00040000-55de-feb9-b12e-7448c5532c79	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55de-feb9-9855-35777bba815c	GR	GRC	300	Greece 	Grčija	\N
00040000-55de-feb9-3f21-2ba2743d13ef	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55de-feb9-6db9-ffb2313a3530	GD	GRD	308	Grenada 	Grenada	\N
00040000-55de-feb9-3ec6-abc1ec9ed8c9	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55de-feb9-1182-bc593363817a	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55de-feb9-5435-514e496e90aa	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55de-feb9-5a77-e90b3035fa30	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55de-feb9-427c-c500c596f188	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55de-feb9-40c3-532d0d6c517f	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55de-feb9-1da3-13fa5208397a	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55de-feb9-6f56-d9ce1d668209	HT	HTI	332	Haiti 	Haiti	\N
00040000-55de-feb9-7ba0-9d11ea805b46	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55de-feb9-0e71-68e390f4c8e5	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55de-feb9-acb3-58d103e0f4f5	HN	HND	340	Honduras 	Honduras	\N
00040000-55de-feb9-0d34-ba973bbe4c9a	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55de-feb9-a536-f575090109e3	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55de-feb9-7e86-4649ef576e15	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55de-feb9-fcf7-3507d922e437	IN	IND	356	India 	Indija	\N
00040000-55de-feb9-42cd-d4e5550bb407	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55de-feb9-41ca-16dfccef4e55	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55de-feb9-3a21-cb5b1bd66832	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55de-feb9-44e8-e714adf44a1a	IE	IRL	372	Ireland 	Irska	\N
00040000-55de-feb9-c932-8e7ea1a6b491	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55de-feb9-126b-736d173b6d4e	IL	ISR	376	Israel 	Izrael	\N
00040000-55de-feb9-e4cd-f8215a308ecc	IT	ITA	380	Italy 	Italija	\N
00040000-55de-feb9-3fc9-1a8c53acedca	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55de-feb9-2613-2d218b61ee0c	JP	JPN	392	Japan 	Japonska	\N
00040000-55de-feb9-5a72-807b5d53dd05	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55de-feb9-296e-d5d029cbc08c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55de-feb9-6646-d1f63f27012e	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55de-feb9-c3db-fa64b1f8d60e	KE	KEN	404	Kenya 	Kenija	\N
00040000-55de-feb9-4ef9-51833e0250a8	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55de-feb9-738d-915084d2498d	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55de-feb9-430a-06d896532280	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55de-feb9-1b8b-cf5a4e3289e8	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55de-feb9-b703-cd28ba5ffeab	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55de-feb9-1570-86399ec37308	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55de-feb9-9014-8dd49c06bcd8	LV	LVA	428	Latvia 	Latvija	\N
00040000-55de-feb9-e2a0-9f6932d788ed	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55de-feb9-52bd-d8b1f5140b70	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55de-feb9-f4d0-128265247228	LR	LBR	430	Liberia 	Liberija	\N
00040000-55de-feb9-ec77-a3123c07b3f6	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55de-feb9-7fa4-0db44a4a2f57	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55de-feb9-c06b-b8150d8cfe8d	LT	LTU	440	Lithuania 	Litva	\N
00040000-55de-feb9-8101-6cdffdd75654	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55de-feb9-f04f-a7dbae3c1603	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55de-feb9-14be-f602486f3a56	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55de-feb9-34fc-1c9289ffcb72	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55de-feb9-d841-adfb5569ead9	MW	MWI	454	Malawi 	Malavi	\N
00040000-55de-feb9-aae9-cb1c0508f736	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55de-feb9-44cc-ef6ac9cef4d9	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55de-feb9-ad3e-058722d153c1	ML	MLI	466	Mali 	Mali	\N
00040000-55de-feb9-9838-900b01fa79e1	MT	MLT	470	Malta 	Malta	\N
00040000-55de-feb9-ce56-a16ea9d007d4	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55de-feb9-554b-3b9cbba5ee44	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55de-feb9-c415-fad6d51a2055	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55de-feb9-6e79-186e7ad1719d	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55de-feb9-563f-c1d489ee9a89	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55de-feb9-c68d-e5a38876e779	MX	MEX	484	Mexico 	Mehika	\N
00040000-55de-feb9-43d6-1e71e084e5cc	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55de-feb9-9eb2-7e71b276b6ae	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55de-feb9-34c0-fc7496438db2	MC	MCO	492	Monaco 	Monako	\N
00040000-55de-feb9-c25e-beba37f06160	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55de-feb9-6270-bc3a6f245ae7	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55de-feb9-48ef-e3cbee7ce8f3	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55de-feb9-8bfd-edb8f88927f0	MA	MAR	504	Morocco 	Maroko	\N
00040000-55de-feb9-f260-abd8cfc506d1	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55de-feb9-a111-cdb1900257c6	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55de-feb9-0999-31e6796db97c	NA	NAM	516	Namibia 	Namibija	\N
00040000-55de-feb9-406f-bc975a015350	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55de-feb9-26eb-dab38e0c7485	NP	NPL	524	Nepal 	Nepal	\N
00040000-55de-feb9-ef23-97ed42ac5d2f	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55de-feb9-3e49-b1553b38fe07	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55de-feb9-65d9-aaf343bbab15	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55de-feb9-c247-1abaaf118d12	NE	NER	562	Niger 	Niger 	\N
00040000-55de-feb9-22a1-9289f57bd33c	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55de-feb9-01b6-34285d91a30f	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55de-feb9-9693-0c3d28135105	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55de-feb9-92d4-1c2889f2f5b1	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55de-feb9-db83-156585d4bf5d	NO	NOR	578	Norway 	Norveška	\N
00040000-55de-feb9-8655-18d098eea5bd	OM	OMN	512	Oman 	Oman	\N
00040000-55de-feb9-1d9a-75efcd85cc92	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55de-feb9-4ca6-2e0089c57f52	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55de-feb9-d489-f30448192c54	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55de-feb9-6bff-dceed619ddae	PA	PAN	591	Panama 	Panama	\N
00040000-55de-feb9-f68e-61e151c5d70f	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55de-feb9-264b-72429b797912	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55de-feb9-f691-cd37cac3c2d6	PE	PER	604	Peru 	Peru	\N
00040000-55de-feb9-3fc8-4ada4c35fb60	PH	PHL	608	Philippines 	Filipini	\N
00040000-55de-feb9-309b-a0c54c13d28b	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55de-feb9-b377-ee77f160648b	PL	POL	616	Poland 	Poljska	\N
00040000-55de-feb9-1968-8bf9cc35fdfa	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55de-feb9-8191-6671d2fbcf50	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55de-feb9-247e-ee6c10c85500	QA	QAT	634	Qatar 	Katar	\N
00040000-55de-feb9-7239-57d6a7503c4f	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55de-feb9-fcc8-b46b091b1b6c	RO	ROU	642	Romania 	Romunija	\N
00040000-55de-feb9-695c-d539b4ecd1ab	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55de-feb9-d80d-903648170f13	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55de-feb9-12a9-e413183e738e	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55de-feb9-09c7-61f769beddb8	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55de-feb9-6822-8c222bc6db8a	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55de-feb9-e289-477a6bc0e520	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55de-feb9-f72a-75afcc896511	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55de-feb9-2f33-a4e865f20be7	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55de-feb9-13cd-8044e65020f8	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55de-feb9-10f6-d97476eb1d95	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55de-feb9-5a1e-0e5ff2606fa0	SM	SMR	674	San Marino 	San Marino	\N
00040000-55de-feb9-b46d-c4dd43e83923	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55de-feb9-e3b2-6d97e01c9964	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55de-feb9-1f4d-db236fb9613a	SN	SEN	686	Senegal 	Senegal	\N
00040000-55de-feb9-8d4e-817d51593268	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55de-feb9-49ff-c8450ff18c50	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55de-feb9-28e0-0982469fb3e7	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55de-feb9-fcbc-ed551519d905	SG	SGP	702	Singapore 	Singapur	\N
00040000-55de-feb9-1c60-a44600a41f39	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55de-feb9-0192-38cb717c7080	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55de-feb9-1354-3770e572c8b5	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55de-feb9-1423-ec5f000857fe	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55de-feb9-9648-59d471149d5c	SO	SOM	706	Somalia 	Somalija	\N
00040000-55de-feb9-3dbd-2a556eeaad28	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55de-feb9-5849-8ba823ba7417	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55de-feb9-7b79-a9daab3c0c7b	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55de-feb9-e50a-51e71941f564	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55de-feb9-5caf-6e291ce49ab1	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55de-feb9-24a3-de3a10a32ec9	SD	SDN	729	Sudan 	Sudan	\N
00040000-55de-feb9-6cb6-106f951e3c8f	SR	SUR	740	Suriname 	Surinam	\N
00040000-55de-feb9-c967-55b4f8634fc7	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55de-feb9-1b06-ae60b6721135	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55de-feb9-040e-4233ab2a3ff0	SE	SWE	752	Sweden 	Švedska	\N
00040000-55de-feb9-36c0-4747a0968789	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55de-feb9-7d7c-f23027022533	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55de-feb9-2c24-18583ca943c5	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55de-feb9-ed4b-2888b3170a2b	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55de-feb9-8aa1-c0706d3c4cbe	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55de-feb9-4a8b-53dfeb55439f	TH	THA	764	Thailand 	Tajska	\N
00040000-55de-feb9-f28f-b050e1abe3c6	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55de-feb9-b6c7-52a44711fe15	TG	TGO	768	Togo 	Togo	\N
00040000-55de-feb9-28cf-1462942fc5c1	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55de-feb9-02c2-61a0b4add2e9	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55de-feb9-c7ae-d985b8b5d325	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55de-feb9-4eb5-5f3a00f7ff66	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55de-feb9-afb1-574c8e076105	TR	TUR	792	Turkey 	Turčija	\N
00040000-55de-feb9-7637-c2e02b63a67c	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55de-feb9-c794-43204dfc94a1	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55de-feb9-3c5e-c7ffc048d062	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55de-feb9-f3f7-c40beae2786a	UG	UGA	800	Uganda 	Uganda	\N
00040000-55de-feb9-9468-16b8777520c6	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55de-feb9-03fd-dbcc6f6cf4d0	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55de-feb9-c73a-e16fbd0461ad	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55de-feb9-1ad1-c36d382011fb	US	USA	840	United States 	Združene države Amerike	\N
00040000-55de-feb9-8a82-0b6ce9624d98	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55de-feb9-9826-837de894f09d	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55de-feb9-b15f-7172d37ede9a	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55de-feb9-1919-63767f52b64c	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55de-feb9-234d-b4f8e0f339c4	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55de-feb9-5b08-af5179104171	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55de-feb9-5dc6-f703d8585afb	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55de-feb9-658a-dd4b1113c8e9	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55de-feb9-9a76-51674a154f78	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55de-feb9-710a-ba391f251384	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55de-feb9-c1ae-8469af5a0780	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55de-feb9-e4ca-cbd4ad5a980a	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55de-feb9-2c52-fe117529695c	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2958 (class 0 OID 15907049)
-- Dependencies: 224
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55de-febb-bf13-8bf46f3ac7fb	000e0000-55de-feba-b68d-7aa5e18661a7	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55de-feb9-6a0a-3fa405d5aa04	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55de-febb-b116-3311635b27cf	000e0000-55de-feba-dcdf-dd3ee9a1e5a3	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55de-feb9-1974-bd42679bcc13	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55de-febb-656e-33bb07f51236	000e0000-55de-feba-adad-2ca3f9196ef6	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55de-feb9-6a0a-3fa405d5aa04	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55de-febb-88e4-b71b54299bdd	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55de-febb-6918-daf377e05ff1	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2944 (class 0 OID 15906864)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55de-febb-4895-0118e10395e2	000e0000-55de-feba-dcdf-dd3ee9a1e5a3	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55de-feb9-5a80-85ce15fcd2a0
000d0000-55de-febb-9e1e-6e687855059c	000e0000-55de-feba-dcdf-dd3ee9a1e5a3	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55de-feb9-5a80-85ce15fcd2a0
000d0000-55de-febb-1800-98c4479fbe9e	000e0000-55de-feba-dcdf-dd3ee9a1e5a3	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55de-feb9-e27e-638d0020dca9
000d0000-55de-febb-7190-5cffeb94d51c	000e0000-55de-feba-dcdf-dd3ee9a1e5a3	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55de-feb9-4418-cfc2ef1ff7f6
000d0000-55de-febb-04e7-0b47a6b00d53	000e0000-55de-feba-dcdf-dd3ee9a1e5a3	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55de-feb9-098c-fe022b13d9c4
000d0000-55de-febb-f9fc-9b4778685bdc	000e0000-55de-feba-dcdf-dd3ee9a1e5a3	\N	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55de-feb9-098c-fe022b13d9c4
000d0000-55de-febb-8949-a82f091c95f4	000e0000-55de-feba-dcdf-dd3ee9a1e5a3	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55de-feb9-5a80-85ce15fcd2a0
000d0000-55de-febb-fab4-a20b5dbf6d6c	000e0000-55de-feba-dcdf-dd3ee9a1e5a3	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55de-feb9-1fbb-bdf784073582
\.


--
-- TOC entry 2923 (class 0 OID 15906678)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 15906726)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2921 (class 0 OID 15906658)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55de-febb-621f-095425b6e238	00080000-55de-feba-574d-aa9272a65b41	00090000-55de-feba-f00e-4b442c22642f	AK		
\.


--
-- TOC entry 2933 (class 0 OID 15906779)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 15907266)
-- Dependencies: 237
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 15907278)
-- Dependencies: 238
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 15907300)
-- Dependencies: 240
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 15906804)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2918 (class 0 OID 15906615)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55de-feb9-d942-fc043cbafb35	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55de-feb9-d17f-1644d2a71e98	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55de-feb9-b1bd-993217f544b8	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55de-feb9-4193-80bc58ea120e	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55de-feb9-7b4d-6035d05f547b	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55de-feb9-686f-7ab29e83bff8	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55de-feb9-4d37-3e4a02d23711	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55de-feb9-e079-8e9ce4da43d4	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55de-feb9-fdbe-2088ec1c777f	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55de-feb9-09e6-a0d0fc9a95e7	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55de-feb9-7fcf-df4fa8e99c3d	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55de-feb9-28d4-b8f3e22fd464	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55de-feb9-260c-08f2c561fafa	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55de-feba-5220-fcb4bd0b97a6	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55de-feba-2eb5-4d1b30b58a15	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55de-feba-de1c-4a10cb62b65e	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55de-feba-c90f-5fdaa1b61e91	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55de-feba-f12c-f30949924a8b	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55de-febb-d321-d619bba789dd	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2912 (class 0 OID 15906529)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55de-feba-df32-f2953c8b422b	00000000-55de-feba-5220-fcb4bd0b97a6	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55de-feba-8461-ed943ff212fa	00000000-55de-feba-5220-fcb4bd0b97a6	00010000-55de-feb9-6d6f-8ce3b7dc4f24	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55de-feba-07ba-527f44824b5c	00000000-55de-feba-2eb5-4d1b30b58a15	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2913 (class 0 OID 15906540)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55de-feba-c374-4e6215f983c4	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55de-feba-3e2c-9498d8e28a24	00010000-55de-feba-09e9-b8194a9731fb	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55de-feba-c998-2ba6a8639108	00010000-55de-feba-0dba-bbeeb18c4c42	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55de-feba-4356-e2b16cb3aa2e	00010000-55de-feba-195c-818b099a8534	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55de-feba-3333-17a7b59f45c1	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55de-feba-ffa4-6f04fbc838b9	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55de-feba-b211-3682be19e752	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55de-feba-7442-d79937e8a638	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55de-feba-f00e-4b442c22642f	00010000-55de-feba-a6d5-2880f25eaab7	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55de-feba-859a-6ee7fe87d0d6	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55de-feba-f9fe-8c693ce4296c	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55de-feba-3afe-fe024f8d82f8	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55de-feba-272a-f946224d18f6	00010000-55de-feba-8113-b86b30702f1f	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2908 (class 0 OID 15906494)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55de-feb9-f22a-1661789696f2	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55de-feb9-17f6-9ebf7e23dfac	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55de-feb9-a2db-790cef5ca83d	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55de-feb9-4483-c92bf3872597	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55de-feb9-603e-5eef9dd556fb	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55de-feb9-f365-b2313df4e660	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55de-feb9-c4a1-33c104f2891a	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55de-feb9-2b22-32e24242809c	Abonma-read	Abonma - branje	f
00030000-55de-feb9-8e27-2875bb550850	Abonma-write	Abonma - spreminjanje	f
00030000-55de-feb9-7336-bd6e88ce06b2	Alternacija-read	Alternacija - branje	f
00030000-55de-feb9-28cb-5f1825d62d77	Alternacija-write	Alternacija - spreminjanje	f
00030000-55de-feb9-0659-a85a296cc844	Arhivalija-read	Arhivalija - branje	f
00030000-55de-feb9-5f0d-d4617a6bd028	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55de-feb9-df6c-e7fe45aae1cc	Besedilo-read	Besedilo - branje	f
00030000-55de-feb9-7450-de4a81b4a6f7	Besedilo-write	Besedilo - spreminjanje	f
00030000-55de-feb9-bba0-f537044d7aea	DogodekIzven-read	DogodekIzven - branje	f
00030000-55de-feb9-dad9-4fd2cfcb733b	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55de-feb9-d087-f52152991313	Dogodek-read	Dogodek - branje	f
00030000-55de-feb9-df3c-8b0dfac40b7c	Dogodek-write	Dogodek - spreminjanje	f
00030000-55de-feb9-2c52-4000be87344d	DrugiVir-read	DrugiVir - branje	f
00030000-55de-feb9-3ec4-4c306c049dc0	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55de-feb9-0744-43c6dc3d2986	Drzava-read	Drzava - branje	f
00030000-55de-feb9-f287-beb81197c7dd	Drzava-write	Drzava - spreminjanje	f
00030000-55de-feb9-be41-05be7f80c5fd	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55de-feb9-c193-ce3a6f277946	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55de-feb9-ca89-d168faab40dd	Funkcija-read	Funkcija - branje	f
00030000-55de-feb9-2caa-0fdf202047e0	Funkcija-write	Funkcija - spreminjanje	f
00030000-55de-feb9-5735-9cb8404f986b	Gostovanje-read	Gostovanje - branje	f
00030000-55de-feb9-c6d0-9afd0ea13bd8	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55de-feb9-1d02-6aa3203d2db1	Gostujoca-read	Gostujoca - branje	f
00030000-55de-feb9-ab37-c869f8aaffc3	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55de-feb9-e31f-9e28fe6b5cc0	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55de-feb9-4316-b2d9babd32ec	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55de-feb9-0cc3-7c61a51b8fb5	Kupec-read	Kupec - branje	f
00030000-55de-feb9-bbec-1f287c295711	Kupec-write	Kupec - spreminjanje	f
00030000-55de-feb9-8aa9-e29fccf6e98a	NacinPlacina-read	NacinPlacina - branje	f
00030000-55de-feb9-9a7a-97681db8bba8	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55de-feb9-9cd2-7af13d71afb4	Option-read	Option - branje	f
00030000-55de-feb9-297e-f2cc97cc9016	Option-write	Option - spreminjanje	f
00030000-55de-feb9-8489-9924e58b152d	OptionValue-read	OptionValue - branje	f
00030000-55de-feb9-9f82-dbffa5a5b74e	OptionValue-write	OptionValue - spreminjanje	f
00030000-55de-feb9-0795-55d989848d05	Oseba-read	Oseba - branje	f
00030000-55de-feb9-050b-c8ce552fe706	Oseba-write	Oseba - spreminjanje	f
00030000-55de-feb9-32c8-ef0dfbe98709	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55de-feb9-8e43-9a53c3c85400	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55de-feb9-b9d3-eb033852a096	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55de-feb9-23af-28c706218ad2	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55de-feb9-b185-354aa2b67e49	Pogodba-read	Pogodba - branje	f
00030000-55de-feb9-9c7a-743deb4134cd	Pogodba-write	Pogodba - spreminjanje	f
00030000-55de-feb9-814c-a826f8eec514	Popa-read	Popa - branje	f
00030000-55de-feb9-9625-477e35cc56c0	Popa-write	Popa - spreminjanje	f
00030000-55de-feb9-a766-4f5f93ae3c42	Posta-read	Posta - branje	f
00030000-55de-feb9-d579-f018d658d70e	Posta-write	Posta - spreminjanje	f
00030000-55de-feb9-4266-15d67bafc145	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55de-feb9-1193-667610c7e4a3	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55de-feb9-7682-00ff3e2c6351	PostniNaslov-read	PostniNaslov - branje	f
00030000-55de-feb9-596f-dcf6195e2849	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55de-feb9-1b65-e1df36ae7b23	Predstava-read	Predstava - branje	f
00030000-55de-feb9-7db6-7d12ba07edfc	Predstava-write	Predstava - spreminjanje	f
00030000-55de-feb9-caa3-8be81d696830	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55de-feb9-3743-f0b68098b0fe	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55de-feb9-f1a2-9dea0201cbc5	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55de-feb9-5dd3-1b211cb345fa	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55de-feb9-09ef-8bdd6e8ecc43	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55de-feb9-f640-1fe9502bef56	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55de-feb9-8cba-aa64272762fe	ProgramDela-read	ProgramDela - branje	f
00030000-55de-feb9-a208-b1cdc176d00b	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55de-feb9-db3d-d6b18d6b4a42	ProgramFestival-read	ProgramFestival - branje	f
00030000-55de-feb9-e276-5edac983263c	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55de-feb9-b4d4-41cf947ddc22	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55de-feb9-a42a-8d51e0d8ce15	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55de-feb9-8e87-8729eccc45fa	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55de-feb9-464e-f6f92a19babd	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55de-feb9-bc27-f801cd93fa0d	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55de-feb9-3d7e-371992da15b1	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55de-feb9-0eab-3dde77a14b7b	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55de-feb9-c1af-d187a71cbf0e	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55de-feb9-b2e8-9a42ea89f986	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55de-feb9-ea8e-f63798e13aac	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55de-feb9-51ac-ec40883b0126	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55de-feb9-4b9c-37f070e76019	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55de-feb9-d2ae-09ef1c6721da	ProgramRazno-read	ProgramRazno - branje	f
00030000-55de-feb9-4ab6-08b2050831dc	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55de-feb9-7b03-5479110fa895	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55de-feb9-5240-08f4d8f1d536	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55de-feb9-2d0c-75dea4fa04d9	Prostor-read	Prostor - branje	f
00030000-55de-feb9-be6c-4c35534f4f68	Prostor-write	Prostor - spreminjanje	f
00030000-55de-feb9-4708-3115d24fd8b9	Racun-read	Racun - branje	f
00030000-55de-feb9-aa59-ba776ad57467	Racun-write	Racun - spreminjanje	f
00030000-55de-feb9-f466-b313ca162b59	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55de-feb9-717f-8e084caedda3	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55de-feb9-0202-b6455859c9c1	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55de-feb9-69ba-d7d4b2ed056d	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55de-feb9-ea0b-b4028c488fc6	Rekvizit-read	Rekvizit - branje	f
00030000-55de-feb9-69df-15b2a423a1e1	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55de-feb9-e221-2bdbd6fb8edc	Revizija-read	Revizija - branje	f
00030000-55de-feb9-56b3-7cd26af7229d	Revizija-write	Revizija - spreminjanje	f
00030000-55de-feb9-c460-b495eeb2214e	Rezervacija-read	Rezervacija - branje	f
00030000-55de-feb9-7c9a-d0877b01aff6	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55de-feb9-4df6-f36be0db5f39	SedezniRed-read	SedezniRed - branje	f
00030000-55de-feb9-5f39-041a02d3bc7e	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55de-feb9-a015-cbdc89a9c621	Sedez-read	Sedez - branje	f
00030000-55de-feb9-e06a-d64abb50f400	Sedez-write	Sedez - spreminjanje	f
00030000-55de-feb9-acd6-2320ed0a977b	Sezona-read	Sezona - branje	f
00030000-55de-feb9-eb41-3164436e0b1f	Sezona-write	Sezona - spreminjanje	f
00030000-55de-feb9-daab-78464c5b3892	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55de-feb9-3b0b-2e8327bd76b9	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55de-feb9-1a69-b807a69b95af	Stevilcenje-read	Stevilcenje - branje	f
00030000-55de-feb9-9cc1-d3e0d34b5801	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55de-feb9-d23f-d25cb78ad677	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55de-feb9-eb88-d7f9abfac4d5	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55de-feb9-5624-5da29f7e4ea8	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55de-feb9-ad84-7f2b2b78c11b	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55de-feb9-e7f5-5d7c3a284050	Telefonska-read	Telefonska - branje	f
00030000-55de-feb9-7349-d4cd74ef198e	Telefonska-write	Telefonska - spreminjanje	f
00030000-55de-feb9-0805-6f7fd3c76528	TerminStoritve-read	TerminStoritve - branje	f
00030000-55de-feb9-b8a4-89c27d532360	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55de-feb9-76da-14f5ae554fe7	TipFunkcije-read	TipFunkcije - branje	f
00030000-55de-feb9-6b53-05cf765720e7	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55de-feb9-a9d4-c073e56a50dc	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55de-feb9-a64b-f54b95cdf0fb	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55de-feb9-eb88-f55960a4fb0d	Trr-read	Trr - branje	f
00030000-55de-feb9-ebe1-5dc3c42652a3	Trr-write	Trr - spreminjanje	f
00030000-55de-feb9-cbb1-aae2ac0b127b	Uprizoritev-read	Uprizoritev - branje	f
00030000-55de-feb9-7d94-f3010e215c13	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55de-feb9-6e60-c4148e41e41b	Vaja-read	Vaja - branje	f
00030000-55de-feb9-7768-241d43dfe927	Vaja-write	Vaja - spreminjanje	f
00030000-55de-feb9-3261-7f231ec592b8	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55de-feb9-31bb-4d6a698f6053	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55de-feb9-f7a2-e8d651790ab5	VrstaStroska-read	VrstaStroska - branje	f
00030000-55de-feb9-e7bf-ee656790038b	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55de-feb9-c83a-8b6a0d7ff541	Zaposlitev-read	Zaposlitev - branje	f
00030000-55de-feb9-48a0-8853439486cf	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55de-feb9-9198-ea68e5f06e43	Zasedenost-read	Zasedenost - branje	f
00030000-55de-feb9-a0ad-c4debb6ff210	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55de-feb9-81ca-08ab4e8fa9b7	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55de-feb9-9d1b-038f0e96cf16	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55de-feb9-4a8c-4b562a818d59	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55de-feb9-f57f-d749f152a5c8	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55de-feb9-62bc-13b13ab1dcf6	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55de-feb9-c7a9-2f2bb733f1b5	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55de-feb9-0438-3192c7bfff34	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55de-feb9-f6a8-e92cdfc26f7a	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55de-feb9-4470-e35b1f804913	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55de-feb9-d31f-77fb57af7880	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55de-feb9-5d2d-63cfd44d7b7c	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55de-feb9-59b3-3da2dd0a7391	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55de-feb9-c865-472d86603356	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55de-feb9-2bd0-0ba88c5da250	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55de-feb9-5c49-d82cce1fa391	Datoteka-write	Datoteka - spreminjanje	f
00030000-55de-feb9-fe03-a1149426806b	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2910 (class 0 OID 15906513)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55de-feb9-8319-54af529c04cf	00030000-55de-feb9-17f6-9ebf7e23dfac
00020000-55de-feb9-222d-fe86f3862314	00030000-55de-feb9-0744-43c6dc3d2986
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-2b22-32e24242809c
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-8e27-2875bb550850
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-7336-bd6e88ce06b2
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-28cb-5f1825d62d77
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-0659-a85a296cc844
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-d087-f52152991313
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-4483-c92bf3872597
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-df3c-8b0dfac40b7c
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-0744-43c6dc3d2986
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-f287-beb81197c7dd
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-ca89-d168faab40dd
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-2caa-0fdf202047e0
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-5735-9cb8404f986b
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-c6d0-9afd0ea13bd8
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-1d02-6aa3203d2db1
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-ab37-c869f8aaffc3
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-e31f-9e28fe6b5cc0
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-4316-b2d9babd32ec
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-9cd2-7af13d71afb4
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-8489-9924e58b152d
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-0795-55d989848d05
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-050b-c8ce552fe706
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-814c-a826f8eec514
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-9625-477e35cc56c0
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-a766-4f5f93ae3c42
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-d579-f018d658d70e
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-7682-00ff3e2c6351
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-596f-dcf6195e2849
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-1b65-e1df36ae7b23
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-7db6-7d12ba07edfc
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-09ef-8bdd6e8ecc43
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-f640-1fe9502bef56
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-2d0c-75dea4fa04d9
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-be6c-4c35534f4f68
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-0202-b6455859c9c1
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-69ba-d7d4b2ed056d
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-ea0b-b4028c488fc6
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-69df-15b2a423a1e1
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-acd6-2320ed0a977b
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-eb41-3164436e0b1f
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-76da-14f5ae554fe7
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-cbb1-aae2ac0b127b
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-7d94-f3010e215c13
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-6e60-c4148e41e41b
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-7768-241d43dfe927
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-9198-ea68e5f06e43
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-a0ad-c4debb6ff210
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-81ca-08ab4e8fa9b7
00020000-55de-feb9-3e75-3e578b3d9b05	00030000-55de-feb9-4a8c-4b562a818d59
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-2b22-32e24242809c
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-0659-a85a296cc844
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-d087-f52152991313
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-0744-43c6dc3d2986
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-5735-9cb8404f986b
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-1d02-6aa3203d2db1
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-e31f-9e28fe6b5cc0
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-4316-b2d9babd32ec
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-9cd2-7af13d71afb4
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-8489-9924e58b152d
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-0795-55d989848d05
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-050b-c8ce552fe706
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-814c-a826f8eec514
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-a766-4f5f93ae3c42
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-7682-00ff3e2c6351
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-596f-dcf6195e2849
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-1b65-e1df36ae7b23
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-2d0c-75dea4fa04d9
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-0202-b6455859c9c1
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-ea0b-b4028c488fc6
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-acd6-2320ed0a977b
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-e7f5-5d7c3a284050
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-7349-d4cd74ef198e
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-eb88-f55960a4fb0d
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-ebe1-5dc3c42652a3
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-c83a-8b6a0d7ff541
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-48a0-8853439486cf
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-81ca-08ab4e8fa9b7
00020000-55de-feb9-8f90-2c0acb3385db	00030000-55de-feb9-4a8c-4b562a818d59
00020000-55de-feb9-c159-3ae7c8b00b5e	00030000-55de-feb9-2b22-32e24242809c
00020000-55de-feb9-c159-3ae7c8b00b5e	00030000-55de-feb9-7336-bd6e88ce06b2
00020000-55de-feb9-c159-3ae7c8b00b5e	00030000-55de-feb9-0659-a85a296cc844
00020000-55de-feb9-c159-3ae7c8b00b5e	00030000-55de-feb9-5f0d-d4617a6bd028
00020000-55de-feb9-c159-3ae7c8b00b5e	00030000-55de-feb9-df6c-e7fe45aae1cc
00020000-55de-feb9-c159-3ae7c8b00b5e	00030000-55de-feb9-bba0-f537044d7aea
00020000-55de-feb9-c159-3ae7c8b00b5e	00030000-55de-feb9-d087-f52152991313
00020000-55de-feb9-c159-3ae7c8b00b5e	00030000-55de-feb9-0744-43c6dc3d2986
00020000-55de-feb9-c159-3ae7c8b00b5e	00030000-55de-feb9-ca89-d168faab40dd
00020000-55de-feb9-c159-3ae7c8b00b5e	00030000-55de-feb9-5735-9cb8404f986b
00020000-55de-feb9-c159-3ae7c8b00b5e	00030000-55de-feb9-1d02-6aa3203d2db1
00020000-55de-feb9-c159-3ae7c8b00b5e	00030000-55de-feb9-e31f-9e28fe6b5cc0
00020000-55de-feb9-c159-3ae7c8b00b5e	00030000-55de-feb9-9cd2-7af13d71afb4
00020000-55de-feb9-c159-3ae7c8b00b5e	00030000-55de-feb9-8489-9924e58b152d
00020000-55de-feb9-c159-3ae7c8b00b5e	00030000-55de-feb9-0795-55d989848d05
00020000-55de-feb9-c159-3ae7c8b00b5e	00030000-55de-feb9-814c-a826f8eec514
00020000-55de-feb9-c159-3ae7c8b00b5e	00030000-55de-feb9-a766-4f5f93ae3c42
00020000-55de-feb9-c159-3ae7c8b00b5e	00030000-55de-feb9-1b65-e1df36ae7b23
00020000-55de-feb9-c159-3ae7c8b00b5e	00030000-55de-feb9-09ef-8bdd6e8ecc43
00020000-55de-feb9-c159-3ae7c8b00b5e	00030000-55de-feb9-2d0c-75dea4fa04d9
00020000-55de-feb9-c159-3ae7c8b00b5e	00030000-55de-feb9-0202-b6455859c9c1
00020000-55de-feb9-c159-3ae7c8b00b5e	00030000-55de-feb9-ea0b-b4028c488fc6
00020000-55de-feb9-c159-3ae7c8b00b5e	00030000-55de-feb9-acd6-2320ed0a977b
00020000-55de-feb9-c159-3ae7c8b00b5e	00030000-55de-feb9-76da-14f5ae554fe7
00020000-55de-feb9-c159-3ae7c8b00b5e	00030000-55de-feb9-6e60-c4148e41e41b
00020000-55de-feb9-c159-3ae7c8b00b5e	00030000-55de-feb9-9198-ea68e5f06e43
00020000-55de-feb9-c159-3ae7c8b00b5e	00030000-55de-feb9-81ca-08ab4e8fa9b7
00020000-55de-feb9-c159-3ae7c8b00b5e	00030000-55de-feb9-4a8c-4b562a818d59
00020000-55de-feb9-dca2-254270ecfb66	00030000-55de-feb9-2b22-32e24242809c
00020000-55de-feb9-dca2-254270ecfb66	00030000-55de-feb9-8e27-2875bb550850
00020000-55de-feb9-dca2-254270ecfb66	00030000-55de-feb9-28cb-5f1825d62d77
00020000-55de-feb9-dca2-254270ecfb66	00030000-55de-feb9-0659-a85a296cc844
00020000-55de-feb9-dca2-254270ecfb66	00030000-55de-feb9-d087-f52152991313
00020000-55de-feb9-dca2-254270ecfb66	00030000-55de-feb9-0744-43c6dc3d2986
00020000-55de-feb9-dca2-254270ecfb66	00030000-55de-feb9-5735-9cb8404f986b
00020000-55de-feb9-dca2-254270ecfb66	00030000-55de-feb9-1d02-6aa3203d2db1
00020000-55de-feb9-dca2-254270ecfb66	00030000-55de-feb9-9cd2-7af13d71afb4
00020000-55de-feb9-dca2-254270ecfb66	00030000-55de-feb9-8489-9924e58b152d
00020000-55de-feb9-dca2-254270ecfb66	00030000-55de-feb9-814c-a826f8eec514
00020000-55de-feb9-dca2-254270ecfb66	00030000-55de-feb9-a766-4f5f93ae3c42
00020000-55de-feb9-dca2-254270ecfb66	00030000-55de-feb9-1b65-e1df36ae7b23
00020000-55de-feb9-dca2-254270ecfb66	00030000-55de-feb9-2d0c-75dea4fa04d9
00020000-55de-feb9-dca2-254270ecfb66	00030000-55de-feb9-0202-b6455859c9c1
00020000-55de-feb9-dca2-254270ecfb66	00030000-55de-feb9-ea0b-b4028c488fc6
00020000-55de-feb9-dca2-254270ecfb66	00030000-55de-feb9-acd6-2320ed0a977b
00020000-55de-feb9-dca2-254270ecfb66	00030000-55de-feb9-76da-14f5ae554fe7
00020000-55de-feb9-dca2-254270ecfb66	00030000-55de-feb9-81ca-08ab4e8fa9b7
00020000-55de-feb9-dca2-254270ecfb66	00030000-55de-feb9-4a8c-4b562a818d59
00020000-55de-feb9-daac-03f3955201f3	00030000-55de-feb9-2b22-32e24242809c
00020000-55de-feb9-daac-03f3955201f3	00030000-55de-feb9-0659-a85a296cc844
00020000-55de-feb9-daac-03f3955201f3	00030000-55de-feb9-d087-f52152991313
00020000-55de-feb9-daac-03f3955201f3	00030000-55de-feb9-0744-43c6dc3d2986
00020000-55de-feb9-daac-03f3955201f3	00030000-55de-feb9-5735-9cb8404f986b
00020000-55de-feb9-daac-03f3955201f3	00030000-55de-feb9-1d02-6aa3203d2db1
00020000-55de-feb9-daac-03f3955201f3	00030000-55de-feb9-9cd2-7af13d71afb4
00020000-55de-feb9-daac-03f3955201f3	00030000-55de-feb9-8489-9924e58b152d
00020000-55de-feb9-daac-03f3955201f3	00030000-55de-feb9-814c-a826f8eec514
00020000-55de-feb9-daac-03f3955201f3	00030000-55de-feb9-a766-4f5f93ae3c42
00020000-55de-feb9-daac-03f3955201f3	00030000-55de-feb9-1b65-e1df36ae7b23
00020000-55de-feb9-daac-03f3955201f3	00030000-55de-feb9-2d0c-75dea4fa04d9
00020000-55de-feb9-daac-03f3955201f3	00030000-55de-feb9-0202-b6455859c9c1
00020000-55de-feb9-daac-03f3955201f3	00030000-55de-feb9-ea0b-b4028c488fc6
00020000-55de-feb9-daac-03f3955201f3	00030000-55de-feb9-acd6-2320ed0a977b
00020000-55de-feb9-daac-03f3955201f3	00030000-55de-feb9-0805-6f7fd3c76528
00020000-55de-feb9-daac-03f3955201f3	00030000-55de-feb9-a2db-790cef5ca83d
00020000-55de-feb9-daac-03f3955201f3	00030000-55de-feb9-76da-14f5ae554fe7
00020000-55de-feb9-daac-03f3955201f3	00030000-55de-feb9-81ca-08ab4e8fa9b7
00020000-55de-feb9-daac-03f3955201f3	00030000-55de-feb9-4a8c-4b562a818d59
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-f22a-1661789696f2
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-17f6-9ebf7e23dfac
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-a2db-790cef5ca83d
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-4483-c92bf3872597
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-603e-5eef9dd556fb
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-f365-b2313df4e660
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-c4a1-33c104f2891a
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-2b22-32e24242809c
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-8e27-2875bb550850
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-7336-bd6e88ce06b2
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-28cb-5f1825d62d77
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-0659-a85a296cc844
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-5f0d-d4617a6bd028
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-df6c-e7fe45aae1cc
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-7450-de4a81b4a6f7
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-bba0-f537044d7aea
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-dad9-4fd2cfcb733b
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-d087-f52152991313
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-df3c-8b0dfac40b7c
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-0744-43c6dc3d2986
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-f287-beb81197c7dd
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-2c52-4000be87344d
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-3ec4-4c306c049dc0
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-be41-05be7f80c5fd
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-c193-ce3a6f277946
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-ca89-d168faab40dd
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-2caa-0fdf202047e0
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-5735-9cb8404f986b
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-c6d0-9afd0ea13bd8
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-1d02-6aa3203d2db1
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-ab37-c869f8aaffc3
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-e31f-9e28fe6b5cc0
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-4316-b2d9babd32ec
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-0cc3-7c61a51b8fb5
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-bbec-1f287c295711
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-8aa9-e29fccf6e98a
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-9a7a-97681db8bba8
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-9cd2-7af13d71afb4
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-297e-f2cc97cc9016
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-8489-9924e58b152d
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-9f82-dbffa5a5b74e
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-0795-55d989848d05
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-050b-c8ce552fe706
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-32c8-ef0dfbe98709
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-8e43-9a53c3c85400
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-b9d3-eb033852a096
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-23af-28c706218ad2
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-b185-354aa2b67e49
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-9c7a-743deb4134cd
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-814c-a826f8eec514
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-9625-477e35cc56c0
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-a766-4f5f93ae3c42
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-d579-f018d658d70e
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-4266-15d67bafc145
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-1193-667610c7e4a3
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-7682-00ff3e2c6351
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-596f-dcf6195e2849
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-1b65-e1df36ae7b23
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-7db6-7d12ba07edfc
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-caa3-8be81d696830
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-3743-f0b68098b0fe
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-f1a2-9dea0201cbc5
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-5dd3-1b211cb345fa
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-09ef-8bdd6e8ecc43
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-f640-1fe9502bef56
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-8cba-aa64272762fe
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-a208-b1cdc176d00b
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-db3d-d6b18d6b4a42
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-e276-5edac983263c
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-b4d4-41cf947ddc22
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-a42a-8d51e0d8ce15
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-8e87-8729eccc45fa
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-464e-f6f92a19babd
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-bc27-f801cd93fa0d
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-3d7e-371992da15b1
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-0eab-3dde77a14b7b
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-c1af-d187a71cbf0e
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-b2e8-9a42ea89f986
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-ea8e-f63798e13aac
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-51ac-ec40883b0126
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-4b9c-37f070e76019
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-d2ae-09ef1c6721da
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-4ab6-08b2050831dc
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-7b03-5479110fa895
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-5240-08f4d8f1d536
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-2d0c-75dea4fa04d9
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-be6c-4c35534f4f68
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-4708-3115d24fd8b9
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-aa59-ba776ad57467
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-f466-b313ca162b59
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-717f-8e084caedda3
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-0202-b6455859c9c1
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-69ba-d7d4b2ed056d
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-ea0b-b4028c488fc6
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-69df-15b2a423a1e1
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-e221-2bdbd6fb8edc
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-56b3-7cd26af7229d
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-c460-b495eeb2214e
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-7c9a-d0877b01aff6
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-4df6-f36be0db5f39
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-5f39-041a02d3bc7e
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-a015-cbdc89a9c621
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-e06a-d64abb50f400
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-acd6-2320ed0a977b
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-eb41-3164436e0b1f
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-daab-78464c5b3892
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-3b0b-2e8327bd76b9
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-1a69-b807a69b95af
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-9cc1-d3e0d34b5801
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-d23f-d25cb78ad677
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-eb88-d7f9abfac4d5
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-5624-5da29f7e4ea8
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-ad84-7f2b2b78c11b
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-e7f5-5d7c3a284050
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-7349-d4cd74ef198e
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-0805-6f7fd3c76528
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-b8a4-89c27d532360
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-76da-14f5ae554fe7
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-6b53-05cf765720e7
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-a9d4-c073e56a50dc
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-a64b-f54b95cdf0fb
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-eb88-f55960a4fb0d
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-ebe1-5dc3c42652a3
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-cbb1-aae2ac0b127b
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-7d94-f3010e215c13
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-6e60-c4148e41e41b
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-7768-241d43dfe927
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-3261-7f231ec592b8
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-31bb-4d6a698f6053
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-c83a-8b6a0d7ff541
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-48a0-8853439486cf
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-9198-ea68e5f06e43
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-a0ad-c4debb6ff210
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-81ca-08ab4e8fa9b7
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-9d1b-038f0e96cf16
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-4a8c-4b562a818d59
00020000-55de-feba-cc7f-6968a403cdae	00030000-55de-feb9-f57f-d749f152a5c8
\.


--
-- TOC entry 2938 (class 0 OID 15906811)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2942 (class 0 OID 15906844)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 15906968)
-- Dependencies: 219
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55de-febb-6943-b2911d38ccd5	00090000-55de-feba-c374-4e6215f983c4	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55de-febb-8550-42b400062115	00090000-55de-feba-ffa4-6f04fbc838b9	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55de-febb-b477-65956df5bf70	00090000-55de-feba-272a-f946224d18f6	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2915 (class 0 OID 15906573)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55de-feba-574d-aa9272a65b41	00040000-55de-feb9-1354-3770e572c8b5	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55de-feba-be12-4bb2e89dee56	00040000-55de-feb9-1354-3770e572c8b5	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55de-feba-e373-9771bafe79e5	00040000-55de-feb9-1354-3770e572c8b5	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55de-feba-4cc2-6b19d9347368	00040000-55de-feb9-1354-3770e572c8b5	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55de-feba-f1bb-926aa29a1f67	00040000-55de-feb9-1354-3770e572c8b5	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55de-feba-88d7-ae51ed331095	00040000-55de-feb9-9983-07fdbce9656a	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55de-feba-78e9-ad2f7d5b6a83	00040000-55de-feb9-797b-8312c067a0a0	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55de-feba-71ca-5518e5622269	00040000-55de-feb9-8c4f-a216f1150ab4	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55de-febb-9395-cd8e143d741e	00040000-55de-feb9-1354-3770e572c8b5	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2917 (class 0 OID 15906607)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55de-feb9-e58a-b64c8c8d659b	8341	Adlešiči
00050000-55de-feb9-5198-6cfd6630e1e2	5270	Ajdovščina
00050000-55de-feb9-c06b-f66cd3d2e305	6280	Ankaran/Ancarano
00050000-55de-feb9-0107-cc4cc109c6f3	9253	Apače
00050000-55de-feb9-9427-c431e3806b26	8253	Artiče
00050000-55de-feb9-a7d2-1f89eac3624d	4275	Begunje na Gorenjskem
00050000-55de-feb9-08f4-541d3c174125	1382	Begunje pri Cerknici
00050000-55de-feb9-4264-cd959678e395	9231	Beltinci
00050000-55de-feb9-77d9-11bb9f9cc361	2234	Benedikt
00050000-55de-feb9-d598-78082d2ee5b9	2345	Bistrica ob Dravi
00050000-55de-feb9-7932-60e15a3189d6	3256	Bistrica ob Sotli
00050000-55de-feb9-acdc-4316eb4a2eb4	8259	Bizeljsko
00050000-55de-feb9-a91e-c76e737e32c5	1223	Blagovica
00050000-55de-feb9-28dd-a9dcf7e69661	8283	Blanca
00050000-55de-feb9-8b2b-d06d20ac4286	4260	Bled
00050000-55de-feb9-3101-7608e3227e57	4273	Blejska Dobrava
00050000-55de-feb9-da20-d61f9b159852	9265	Bodonci
00050000-55de-feb9-15b0-f06d8fb12b56	9222	Bogojina
00050000-55de-feb9-e3a7-3fb7a4d79888	4263	Bohinjska Bela
00050000-55de-feb9-4b74-c70a3fe9feab	4264	Bohinjska Bistrica
00050000-55de-feb9-0121-41adbe9c89bc	4265	Bohinjsko jezero
00050000-55de-feb9-0ae0-2d23dc783fe3	1353	Borovnica
00050000-55de-feb9-25ac-ac779f9fc183	8294	Boštanj
00050000-55de-feb9-f8a9-cd0e9167536f	5230	Bovec
00050000-55de-feb9-9b50-1b5978ac27d3	5295	Branik
00050000-55de-feb9-a3c7-6f4fbbdc9f41	3314	Braslovče
00050000-55de-feb9-dbf5-ca0ce7ddfc77	5223	Breginj
00050000-55de-feb9-10d7-9a4c4e0dea40	8280	Brestanica
00050000-55de-feb9-b98f-e90a374d25bb	2354	Bresternica
00050000-55de-feb9-661b-f81139bf145f	4243	Brezje
00050000-55de-feb9-6d4b-321d80896761	1351	Brezovica pri Ljubljani
00050000-55de-feb9-1286-0750561cf037	8250	Brežice
00050000-55de-feb9-f795-f98c3a591882	4210	Brnik - Aerodrom
00050000-55de-feb9-2a6f-c1e7f5db096d	8321	Brusnice
00050000-55de-feb9-f1cd-2ea902f61fd9	3255	Buče
00050000-55de-feb9-b3e2-15627b5672e4	8276	Bučka 
00050000-55de-feb9-9d27-c504e444bcee	9261	Cankova
00050000-55de-feb9-6c12-5719cd9b394a	3000	Celje 
00050000-55de-feb9-09ab-1beae9a918c5	3001	Celje - poštni predali
00050000-55de-feb9-9b8d-7155ff1c80bf	4207	Cerklje na Gorenjskem
00050000-55de-feb9-84fd-bb8a051084dd	8263	Cerklje ob Krki
00050000-55de-feb9-fcc9-5d5a4c5ef167	1380	Cerknica
00050000-55de-feb9-25cd-14bb82119f32	5282	Cerkno
00050000-55de-feb9-cc9a-6aa12c3ad292	2236	Cerkvenjak
00050000-55de-feb9-b3d5-69e5699bfcd9	2215	Ceršak
00050000-55de-feb9-f934-b9b75662635d	2326	Cirkovce
00050000-55de-feb9-252c-23344486761c	2282	Cirkulane
00050000-55de-feb9-d2dc-c05154c19835	5273	Col
00050000-55de-feb9-a4ed-bca25010368c	8251	Čatež ob Savi
00050000-55de-feb9-c1fb-5ee248b2cec5	1413	Čemšenik
00050000-55de-feb9-0a76-c34db242444f	5253	Čepovan
00050000-55de-feb9-7f19-1cfdf157e4ed	9232	Črenšovci
00050000-55de-feb9-397f-4522097c1a2f	2393	Črna na Koroškem
00050000-55de-feb9-ffbb-ffb6f7874018	6275	Črni Kal
00050000-55de-feb9-b21b-d5055d029da5	5274	Črni Vrh nad Idrijo
00050000-55de-feb9-cd64-c26d118c91fc	5262	Črniče
00050000-55de-feb9-fb7c-6fde1cc60c56	8340	Črnomelj
00050000-55de-feb9-5984-1ac9b9b7cc04	6271	Dekani
00050000-55de-feb9-68e4-d69ce45a9fe3	5210	Deskle
00050000-55de-feb9-8532-75dfcbec50ca	2253	Destrnik
00050000-55de-feb9-2238-b1922096e66a	6215	Divača
00050000-55de-feb9-1256-053dda5397b9	1233	Dob
00050000-55de-feb9-71c6-e51a4ea78568	3224	Dobje pri Planini
00050000-55de-feb9-2e4c-df1384eb4c5d	8257	Dobova
00050000-55de-feb9-da34-6ba7afd21762	1423	Dobovec
00050000-55de-feb9-3441-4a336363fe35	5263	Dobravlje
00050000-55de-feb9-b7e2-a6b5b52be033	3204	Dobrna
00050000-55de-feb9-6a8c-ebc6f4aa12a9	8211	Dobrnič
00050000-55de-feb9-c68a-9f4420750173	1356	Dobrova
00050000-55de-feb9-b364-08dfe00fa2cc	9223	Dobrovnik/Dobronak 
00050000-55de-feb9-1107-4af00eda8cfc	5212	Dobrovo v Brdih
00050000-55de-feb9-c095-f901dd6c0898	1431	Dol pri Hrastniku
00050000-55de-feb9-cbfa-7e45e56a867e	1262	Dol pri Ljubljani
00050000-55de-feb9-c158-a22ac31d7a02	1273	Dole pri Litiji
00050000-55de-feb9-d375-7e5954a1b024	1331	Dolenja vas
00050000-55de-feb9-71a2-cf4423b352da	8350	Dolenjske Toplice
00050000-55de-feb9-2ed8-51a8bb6dd1ff	1230	Domžale
00050000-55de-feb9-e2b4-205d28595f6a	2252	Dornava
00050000-55de-feb9-359d-bc1e8198dad5	5294	Dornberk
00050000-55de-feb9-a85b-d61a811ad1d3	1319	Draga
00050000-55de-feb9-68e5-066210f69748	8343	Dragatuš
00050000-55de-feb9-13e4-20067668a618	3222	Dramlje
00050000-55de-feb9-0701-6cce4ef3a03e	2370	Dravograd
00050000-55de-feb9-5486-00a7e5033997	4203	Duplje
00050000-55de-feb9-bbde-a84bb3ef3495	6221	Dutovlje
00050000-55de-feb9-8d91-22f0a395599a	8361	Dvor
00050000-55de-feb9-8109-2faacb8b1f8f	2343	Fala
00050000-55de-feb9-387f-14ba77694f98	9208	Fokovci
00050000-55de-feb9-4208-811d01709de9	2313	Fram
00050000-55de-feb9-1f26-029d08348c17	3213	Frankolovo
00050000-55de-feb9-a6bd-351a11b773ad	1274	Gabrovka
00050000-55de-feb9-08e0-7e086469d087	8254	Globoko
00050000-55de-feb9-55fe-7a504cc879ec	5275	Godovič
00050000-55de-feb9-8794-548bb332674c	4204	Golnik
00050000-55de-feb9-2ca4-b663ffc5de14	3303	Gomilsko
00050000-55de-feb9-664e-a6df7a3afa53	4224	Gorenja vas
00050000-55de-feb9-be82-bfa477e6199a	3263	Gorica pri Slivnici
00050000-55de-feb9-2d71-32abcaec461c	2272	Gorišnica
00050000-55de-feb9-1d06-163419b075c2	9250	Gornja Radgona
00050000-55de-feb9-fcd0-cc5669d8b737	3342	Gornji Grad
00050000-55de-feb9-c06e-b39b7113bbdf	4282	Gozd Martuljek
00050000-55de-feb9-64ea-debc954dbef5	6272	Gračišče
00050000-55de-feb9-55ca-c12ccecfb787	9264	Grad
00050000-55de-feb9-5187-bbbd4a1e35df	8332	Gradac
00050000-55de-feb9-047d-5719c5d0181b	1384	Grahovo
00050000-55de-feb9-8d31-af821df8e118	5242	Grahovo ob Bači
00050000-55de-feb9-4731-ff1796983fda	5251	Grgar
00050000-55de-feb9-4258-b10e6e348dce	3302	Griže
00050000-55de-feb9-92d6-a343ddf9e62f	3231	Grobelno
00050000-55de-feb9-fc1c-5a0014889927	1290	Grosuplje
00050000-55de-feb9-baab-3c888c0c3438	2288	Hajdina
00050000-55de-feb9-45a0-e197a1ad781d	8362	Hinje
00050000-55de-feb9-7582-aa1f3d770aa7	2311	Hoče
00050000-55de-feb9-f718-512048147eb9	9205	Hodoš/Hodos
00050000-55de-feb9-386b-19766cc0f754	1354	Horjul
00050000-55de-feb9-8221-d232c33a67d3	1372	Hotedršica
00050000-55de-feb9-efc0-76033dc7b25a	1430	Hrastnik
00050000-55de-feb9-4c9f-7ba54ec8a84f	6225	Hruševje
00050000-55de-feb9-2400-e6e8a72c82a4	4276	Hrušica
00050000-55de-feb9-ffd3-2828937c4eb3	5280	Idrija
00050000-55de-feb9-2efd-f658fb9e9918	1292	Ig
00050000-55de-feb9-a746-06c815d98358	6250	Ilirska Bistrica
00050000-55de-feb9-1927-7f77dfc4dee9	6251	Ilirska Bistrica-Trnovo
00050000-55de-feb9-53c6-4aa06464eb1d	1295	Ivančna Gorica
00050000-55de-feb9-bac1-df75a6579752	2259	Ivanjkovci
00050000-55de-feb9-1cb1-27915c39b654	1411	Izlake
00050000-55de-feb9-c9b6-478a6fed5d79	6310	Izola/Isola
00050000-55de-feb9-c1b5-ea393b2eaa92	2222	Jakobski Dol
00050000-55de-feb9-867c-5aa6b720c79e	2221	Jarenina
00050000-55de-feb9-9348-16b50f209763	6254	Jelšane
00050000-55de-feb9-93bf-9c8e4fc360f5	4270	Jesenice
00050000-55de-feb9-0563-f1ed709517cd	8261	Jesenice na Dolenjskem
00050000-55de-feb9-e0d4-2c242ad78a98	3273	Jurklošter
00050000-55de-feb9-673e-350c784112cc	2223	Jurovski Dol
00050000-55de-feb9-4578-0f2c617b592c	2256	Juršinci
00050000-55de-feb9-df06-7eae32e02add	5214	Kal nad Kanalom
00050000-55de-feb9-ef90-3df83741cf35	3233	Kalobje
00050000-55de-feb9-381b-a16d79018f72	4246	Kamna Gorica
00050000-55de-feb9-eeed-590b6ab4f203	2351	Kamnica
00050000-55de-feb9-11f8-e89b27a34791	1241	Kamnik
00050000-55de-feb9-7f1c-0681f4e6829b	5213	Kanal
00050000-55de-feb9-cf2b-a25fc0276b0f	8258	Kapele
00050000-55de-feb9-b587-9292717dd651	2362	Kapla
00050000-55de-feb9-60de-083450393f99	2325	Kidričevo
00050000-55de-feb9-b5b4-fe813b762543	1412	Kisovec
00050000-55de-feb9-1c40-ef1d601a64d4	6253	Knežak
00050000-55de-feb9-8b41-f14f4d8b9581	5222	Kobarid
00050000-55de-feb9-792c-dfd76c4b7829	9227	Kobilje
00050000-55de-feb9-87b4-600b59da40f9	1330	Kočevje
00050000-55de-feb9-8f48-098a38c40812	1338	Kočevska Reka
00050000-55de-feb9-1e5b-2ab4398df25a	2276	Kog
00050000-55de-feb9-005e-c8ae8010fc90	5211	Kojsko
00050000-55de-feb9-4c86-9966e9c14a2e	6223	Komen
00050000-55de-feb9-6319-7856257ac93a	1218	Komenda
00050000-55de-feb9-5924-70314283d43a	6000	Koper/Capodistria 
00050000-55de-feb9-4395-e74bba941982	6001	Koper/Capodistria - poštni predali
00050000-55de-feb9-c93a-8d5275b83b23	8282	Koprivnica
00050000-55de-feb9-9970-983ec88686e0	5296	Kostanjevica na Krasu
00050000-55de-feb9-ee90-e0ad30c66cda	8311	Kostanjevica na Krki
00050000-55de-feb9-28b0-e91c5c885a83	1336	Kostel
00050000-55de-feb9-a267-71887af4869a	6256	Košana
00050000-55de-feb9-79b3-cb2d61bb7a50	2394	Kotlje
00050000-55de-feb9-edaa-fb8f6ac96256	6240	Kozina
00050000-55de-feb9-361b-11bfe6edc1be	3260	Kozje
00050000-55de-feb9-fc2e-5be1aa650ff8	4000	Kranj 
00050000-55de-feb9-38ca-feccf4d7f1a2	4001	Kranj - poštni predali
00050000-55de-feb9-6133-065279d830e5	4280	Kranjska Gora
00050000-55de-feb9-2b48-473c8bf9bf39	1281	Kresnice
00050000-55de-feb9-de87-cca2b333f1bc	4294	Križe
00050000-55de-feb9-f84e-b0e84a1ae084	9206	Križevci
00050000-55de-feb9-a6ab-4ea7cbdbefaa	9242	Križevci pri Ljutomeru
00050000-55de-feb9-8227-6d88167bc5f1	1301	Krka
00050000-55de-feb9-e9b1-b51b9315bf68	8296	Krmelj
00050000-55de-feb9-a6f3-1d673dc7c584	4245	Kropa
00050000-55de-feb9-03e0-1e438fedca9f	8262	Krška vas
00050000-55de-feb9-ec99-3ac146d14a06	8270	Krško
00050000-55de-feb9-a018-3133c38416bf	9263	Kuzma
00050000-55de-feb9-fd57-015a3dbe63e8	2318	Laporje
00050000-55de-feb9-ae6f-69f67915894e	3270	Laško
00050000-55de-feb9-600b-36ba83971bf2	1219	Laze v Tuhinju
00050000-55de-feb9-7c70-2b69fc815107	2230	Lenart v Slovenskih goricah
00050000-55de-feb9-8038-3f814d9ef511	9220	Lendava/Lendva
00050000-55de-feb9-2b20-602fef738811	4248	Lesce
00050000-55de-feb9-a2c7-256a074ae2e7	3261	Lesično
00050000-55de-feb9-7883-e68c287a4ade	8273	Leskovec pri Krškem
00050000-55de-feb9-b844-e5f1ea17558e	2372	Libeliče
00050000-55de-feb9-a4aa-94175facd521	2341	Limbuš
00050000-55de-feb9-4bc2-33ab9ce8ffb1	1270	Litija
00050000-55de-feb9-ee33-47ef5266de0c	3202	Ljubečna
00050000-55de-feb9-e472-264a8a1a900e	1000	Ljubljana 
00050000-55de-feb9-f134-f68fe8f1e3d2	1001	Ljubljana - poštni predali
00050000-55de-feb9-a0f2-3ac8153ef5a4	1231	Ljubljana - Črnuče
00050000-55de-feb9-7bf1-464187408dab	1261	Ljubljana - Dobrunje
00050000-55de-feb9-05ea-0eccb4241520	1260	Ljubljana - Polje
00050000-55de-feb9-a2c6-231b29172658	1210	Ljubljana - Šentvid
00050000-55de-feb9-6c0c-4750d5fc6ff2	1211	Ljubljana - Šmartno
00050000-55de-feb9-123e-4c89d7d71cb1	3333	Ljubno ob Savinji
00050000-55de-feb9-e8d6-10649443333d	9240	Ljutomer
00050000-55de-feb9-b70d-f7a4570aad4c	3215	Loče
00050000-55de-feb9-48b7-603fb03b1711	5231	Log pod Mangartom
00050000-55de-feb9-0e15-2dd5d744db1b	1358	Log pri Brezovici
00050000-55de-feb9-d815-7ea5ff39ca71	1370	Logatec
00050000-55de-feb9-302e-8ff4ec09544c	1371	Logatec
00050000-55de-feb9-ce9a-ad6c45c82b9b	1434	Loka pri Zidanem Mostu
00050000-55de-feb9-63c5-07b4ab938fd8	3223	Loka pri Žusmu
00050000-55de-feb9-3e24-f308aef2862c	6219	Lokev
00050000-55de-feb9-9950-b5f6afc6c7c0	1318	Loški Potok
00050000-55de-feb9-13a5-135be11f513c	2324	Lovrenc na Dravskem polju
00050000-55de-feb9-93e1-e425c64a9dbe	2344	Lovrenc na Pohorju
00050000-55de-feb9-dba8-ce94c15a4d8a	3334	Luče
00050000-55de-feb9-6be1-ca354577b354	1225	Lukovica
00050000-55de-feb9-cb0e-2e835631c37e	9202	Mačkovci
00050000-55de-feb9-11d4-23dbf213145a	2322	Majšperk
00050000-55de-feb9-4edd-0c376fa9d942	2321	Makole
00050000-55de-feb9-2b2e-6a0636bdb4c0	9243	Mala Nedelja
00050000-55de-feb9-570f-e22dde1296d3	2229	Malečnik
00050000-55de-feb9-984a-3e969327d0a2	6273	Marezige
00050000-55de-feb9-e924-98da6d213fb0	2000	Maribor 
00050000-55de-feb9-bd8d-b8ff54677d18	2001	Maribor - poštni predali
00050000-55de-feb9-4055-ee41096c0a36	2206	Marjeta na Dravskem polju
00050000-55de-feb9-54dc-2692f9d90f26	2281	Markovci
00050000-55de-feb9-2539-b6e81bb161b5	9221	Martjanci
00050000-55de-feb9-d2b0-47694cfec158	6242	Materija
00050000-55de-feb9-44ed-b3e939636c52	4211	Mavčiče
00050000-55de-feb9-9b14-ef0a4a16a4b1	1215	Medvode
00050000-55de-feb9-a5a2-9773b6192417	1234	Mengeš
00050000-55de-feb9-96ac-be7269a29f11	8330	Metlika
00050000-55de-feb9-d157-37f563251d87	2392	Mežica
00050000-55de-feb9-cd58-3ca9a03170f8	2204	Miklavž na Dravskem polju
00050000-55de-feb9-b317-cdd14c805c99	2275	Miklavž pri Ormožu
00050000-55de-feb9-de4d-5b106aff3797	5291	Miren
00050000-55de-feb9-8b18-4368b877b7cf	8233	Mirna
00050000-55de-feb9-5840-8b2a7e5b408a	8216	Mirna Peč
00050000-55de-feb9-40ce-ff97f0e3190a	2382	Mislinja
00050000-55de-feb9-6856-42a92d18e5fe	4281	Mojstrana
00050000-55de-feb9-d07e-3789ac074888	8230	Mokronog
00050000-55de-feb9-14f0-2f7668b83d76	1251	Moravče
00050000-55de-feb9-fa4d-36d0d0b06259	9226	Moravske Toplice
00050000-55de-feb9-1a0e-530d8642e8f7	5216	Most na Soči
00050000-55de-feb9-17f9-f67c05bad42e	1221	Motnik
00050000-55de-feb9-d8ab-6e7e5969414b	3330	Mozirje
00050000-55de-feb9-57ed-f61098375c47	9000	Murska Sobota 
00050000-55de-feb9-de50-84798407abd3	9001	Murska Sobota - poštni predali
00050000-55de-feb9-284d-2634d01baf0d	2366	Muta
00050000-55de-feb9-fd4a-85393bbf56aa	4202	Naklo
00050000-55de-feb9-918e-3225c9198785	3331	Nazarje
00050000-55de-feb9-4fe5-148c7080e81e	1357	Notranje Gorice
00050000-55de-feb9-15ef-a01d85bd5de6	3203	Nova Cerkev
00050000-55de-feb9-3d0f-4ced90339df5	5000	Nova Gorica 
00050000-55de-feb9-0410-2f9caee2defe	5001	Nova Gorica - poštni predali
00050000-55de-feb9-ced5-14514d8351be	1385	Nova vas
00050000-55de-feb9-7dc4-d070454f4df3	8000	Novo mesto
00050000-55de-feb9-3777-64387fa66dbe	8001	Novo mesto - poštni predali
00050000-55de-feb9-fca7-a22d6127b071	6243	Obrov
00050000-55de-feb9-a602-757778dde2d7	9233	Odranci
00050000-55de-feb9-c686-db38a8b6c828	2317	Oplotnica
00050000-55de-feb9-3db8-eaa800dc0ef5	2312	Orehova vas
00050000-55de-feb9-15f9-68a187d9cca8	2270	Ormož
00050000-55de-feb9-b4e5-651ddaa0a753	1316	Ortnek
00050000-55de-feb9-4fc9-be1e351599de	1337	Osilnica
00050000-55de-feb9-c217-7b017158f87d	8222	Otočec
00050000-55de-feb9-108f-88a2451e0628	2361	Ožbalt
00050000-55de-feb9-97bc-7b2879d8d38d	2231	Pernica
00050000-55de-feb9-254a-136365958303	2211	Pesnica pri Mariboru
00050000-55de-feb9-6ff9-8f17dddea1a7	9203	Petrovci
00050000-55de-feb9-49b2-f8493215c941	3301	Petrovče
00050000-55de-feb9-b706-ab0687c9d616	6330	Piran/Pirano
00050000-55de-feb9-b0d1-46f779572c83	8255	Pišece
00050000-55de-feb9-ddc1-06b6e53d2ace	6257	Pivka
00050000-55de-feb9-3c12-c3d5b809eddc	6232	Planina
00050000-55de-feb9-2747-780c42f5606c	3225	Planina pri Sevnici
00050000-55de-feb9-bf46-191b578c4dc0	6276	Pobegi
00050000-55de-feb9-8cc8-5713ae201999	8312	Podbočje
00050000-55de-feb9-595b-9ee49f713760	5243	Podbrdo
00050000-55de-feb9-3597-809a09908886	3254	Podčetrtek
00050000-55de-feb9-03ae-63ccb927564a	2273	Podgorci
00050000-55de-feb9-0ea1-717c6f7cce47	6216	Podgorje
00050000-55de-feb9-85d8-010cae3c3d9e	2381	Podgorje pri Slovenj Gradcu
00050000-55de-feb9-844a-197f659f67b3	6244	Podgrad
00050000-55de-feb9-3325-5fa7ee06649a	1414	Podkum
00050000-55de-feb9-1de0-e81011b20165	2286	Podlehnik
00050000-55de-feb9-ac35-cb194dc5d75e	5272	Podnanos
00050000-55de-feb9-0d83-a72fb7f4d3a8	4244	Podnart
00050000-55de-feb9-3bc9-1790c58006a8	3241	Podplat
00050000-55de-feb9-b6f6-81d7777ce3af	3257	Podsreda
00050000-55de-feb9-e0ac-0d74f3fe7324	2363	Podvelka
00050000-55de-feb9-21fa-c487b3e619da	2208	Pohorje
00050000-55de-feb9-622d-76aa29e6ba6b	2257	Polenšak
00050000-55de-feb9-1904-a87de6777ce5	1355	Polhov Gradec
00050000-55de-feb9-db19-af103317a389	4223	Poljane nad Škofjo Loko
00050000-55de-feb9-9649-78560f07624f	2319	Poljčane
00050000-55de-feb9-d3bd-ed561f95d6ed	1272	Polšnik
00050000-55de-feb9-6e11-073822f6cbca	3313	Polzela
00050000-55de-feb9-5649-7e36852a615f	3232	Ponikva
00050000-55de-feb9-d109-c59f04045de7	6320	Portorož/Portorose
00050000-55de-feb9-5ad0-1504efb3a595	6230	Postojna
00050000-55de-feb9-7a20-abf0af0baa01	2331	Pragersko
00050000-55de-feb9-6887-e3273cce0db9	3312	Prebold
00050000-55de-feb9-7ed5-b1621325fba0	4205	Preddvor
00050000-55de-feb9-4f71-d7e430a52c3c	6255	Prem
00050000-55de-feb9-3116-940e251cdd8b	1352	Preserje
00050000-55de-feb9-0386-6498cd97eeeb	6258	Prestranek
00050000-55de-feb9-8bde-48cea996988a	2391	Prevalje
00050000-55de-feb9-1327-5892052b0612	3262	Prevorje
00050000-55de-feb9-0651-270c0f62ec72	1276	Primskovo 
00050000-55de-feb9-2c3b-60f7a22753ca	3253	Pristava pri Mestinju
00050000-55de-feb9-aafc-0772a8eccf5a	9207	Prosenjakovci/Partosfalva
00050000-55de-feb9-b3eb-1e7e932354c7	5297	Prvačina
00050000-55de-feb9-8196-0e675bc420c0	2250	Ptuj
00050000-55de-feb9-7156-82b2bb084fe9	2323	Ptujska Gora
00050000-55de-feb9-7dea-12ae517f9e60	9201	Puconci
00050000-55de-feb9-f020-37f5237e6a22	2327	Rače
00050000-55de-feb9-1f3e-86e1620db669	1433	Radeče
00050000-55de-feb9-c06a-7bbeafbabe45	9252	Radenci
00050000-55de-feb9-f5a5-1512a8d883b0	2360	Radlje ob Dravi
00050000-55de-feb9-f206-242c9e1d1e71	1235	Radomlje
00050000-55de-feb9-fbf0-9272b03ec391	4240	Radovljica
00050000-55de-feb9-7438-2a2ed7024b23	8274	Raka
00050000-55de-feb9-35d1-e9d83deb57ea	1381	Rakek
00050000-55de-feb9-4325-a79eca2c50bc	4283	Rateče - Planica
00050000-55de-feb9-5250-83eafa744e36	2390	Ravne na Koroškem
00050000-55de-feb9-4abe-434006994472	9246	Razkrižje
00050000-55de-feb9-ac53-deb4e483c067	3332	Rečica ob Savinji
00050000-55de-feb9-4023-3443dede02e5	5292	Renče
00050000-55de-feb9-276b-60c1e78e2123	1310	Ribnica
00050000-55de-feb9-fa36-259fdf239ead	2364	Ribnica na Pohorju
00050000-55de-feb9-0977-aae098e558c7	3272	Rimske Toplice
00050000-55de-feb9-7f51-0121e59d82f9	1314	Rob
00050000-55de-feb9-feab-f97896e629a7	5215	Ročinj
00050000-55de-feb9-0f75-57409c7a082e	3250	Rogaška Slatina
00050000-55de-feb9-ece5-093360b754ef	9262	Rogašovci
00050000-55de-feb9-1ebf-1e49ac0c7705	3252	Rogatec
00050000-55de-feb9-a73d-6bb7dc43846c	1373	Rovte
00050000-55de-feb9-4ee2-fcc4c3a9d648	2342	Ruše
00050000-55de-feb9-eaf9-a8a30cd2191d	1282	Sava
00050000-55de-feb9-dc7b-977a117354a5	6333	Sečovlje/Sicciole
00050000-55de-feb9-4ca2-110efb01b865	4227	Selca
00050000-55de-feb9-df90-ee332fdc286a	2352	Selnica ob Dravi
00050000-55de-feb9-4b4f-94e740688310	8333	Semič
00050000-55de-feb9-035e-82e821dbd316	8281	Senovo
00050000-55de-feb9-91cc-63dfe95b0f56	6224	Senožeče
00050000-55de-feb9-ee26-b75cd69dc0e1	8290	Sevnica
00050000-55de-feb9-82f1-b87326b0c300	6210	Sežana
00050000-55de-feb9-969b-37f0770383d4	2214	Sladki Vrh
00050000-55de-feb9-ffe9-b37590130c17	5283	Slap ob Idrijci
00050000-55de-feb9-0dc3-b6ac718627aa	2380	Slovenj Gradec
00050000-55de-feb9-0f73-c329ac089ff7	2310	Slovenska Bistrica
00050000-55de-feb9-be4b-fd9b1d1c9004	3210	Slovenske Konjice
00050000-55de-feb9-8843-14ae4f3cc977	1216	Smlednik
00050000-55de-feb9-c31a-d327c3dd1ade	5232	Soča
00050000-55de-feb9-5dc8-8a18a458a367	1317	Sodražica
00050000-55de-feb9-c7e9-eaa138a6c398	3335	Solčava
00050000-55de-feb9-abb9-7dfa9aba0573	5250	Solkan
00050000-55de-feb9-953c-36f27fd376eb	4229	Sorica
00050000-55de-feb9-6332-7568f9b8e7ec	4225	Sovodenj
00050000-55de-feb9-feae-9ee9d57ada52	5281	Spodnja Idrija
00050000-55de-feb9-48cf-929ce348a34f	2241	Spodnji Duplek
00050000-55de-feb9-97fa-de5cb7cc132e	9245	Spodnji Ivanjci
00050000-55de-feb9-2d11-09c887401744	2277	Središče ob Dravi
00050000-55de-feb9-0b55-fd7650af0d88	4267	Srednja vas v Bohinju
00050000-55de-feb9-63ca-6ea44f9f3452	8256	Sromlje 
00050000-55de-feb9-fd0b-1e2718860d20	5224	Srpenica
00050000-55de-feb9-0422-544c4c16cb77	1242	Stahovica
00050000-55de-feb9-a101-a19c0d2b8aef	1332	Stara Cerkev
00050000-55de-feb9-7b2d-9a2937a940a8	8342	Stari trg ob Kolpi
00050000-55de-feb9-2f40-674474a0b039	1386	Stari trg pri Ložu
00050000-55de-feb9-09a7-2fb56965c0c8	2205	Starše
00050000-55de-feb9-6872-7151413408d3	2289	Stoperce
00050000-55de-feb9-b834-89a92ad1dd77	8322	Stopiče
00050000-55de-feb9-ad86-9f875738ae8f	3206	Stranice
00050000-55de-feb9-3ad8-6cde96b53872	8351	Straža
00050000-55de-feb9-384e-1319df0e0cdf	1313	Struge
00050000-55de-feb9-23a0-1c76da2d0d70	8293	Studenec
00050000-55de-feb9-1ca7-37eedc126144	8331	Suhor
00050000-55de-feb9-0feb-eddc7a01335c	2233	Sv. Ana v Slovenskih goricah
00050000-55de-feb9-4f8f-789e6ae1eb93	2235	Sv. Trojica v Slovenskih goricah
00050000-55de-feb9-b57f-e9b124dfdddb	2353	Sveti Duh na Ostrem Vrhu
00050000-55de-feb9-048d-aa44f940f7bf	9244	Sveti Jurij ob Ščavnici
00050000-55de-feb9-7c86-f613525be148	3264	Sveti Štefan
00050000-55de-feb9-ccd7-f7d3899c2ecf	2258	Sveti Tomaž
00050000-55de-feb9-5f8b-4907112b6dcc	9204	Šalovci
00050000-55de-feb9-cae9-eeff41f9651a	5261	Šempas
00050000-55de-feb9-23b8-2d6ea206bd1a	5290	Šempeter pri Gorici
00050000-55de-feb9-6941-712594031722	3311	Šempeter v Savinjski dolini
00050000-55de-feb9-ae30-cc5d12717d09	4208	Šenčur
00050000-55de-feb9-b1c7-ff52be26ab1f	2212	Šentilj v Slovenskih goricah
00050000-55de-feb9-a07a-2deade64d1d7	8297	Šentjanž
00050000-55de-feb9-72f6-3ad830a3d9a4	2373	Šentjanž pri Dravogradu
00050000-55de-feb9-082f-b41d81167d04	8310	Šentjernej
00050000-55de-feb9-4668-bb90cd9238d2	3230	Šentjur
00050000-55de-feb9-3ff5-e0faeab0691d	3271	Šentrupert
00050000-55de-feb9-c6e8-bb131c00dcdb	8232	Šentrupert
00050000-55de-feb9-d3db-ffc2d24068b8	1296	Šentvid pri Stični
00050000-55de-feb9-80e0-93cd14f8677b	8275	Škocjan
00050000-55de-feb9-c05f-0c88deffa8b5	6281	Škofije
00050000-55de-feb9-85c6-edd93c995e61	4220	Škofja Loka
00050000-55de-feb9-0b1c-719cc2368bdb	3211	Škofja vas
00050000-55de-feb9-fb42-2bb355f855c5	1291	Škofljica
00050000-55de-feb9-5f20-7bbb0bcd43e7	6274	Šmarje
00050000-55de-feb9-d58b-99f421364fb9	1293	Šmarje - Sap
00050000-55de-feb9-697b-7c96591f51e1	3240	Šmarje pri Jelšah
00050000-55de-feb9-590e-d29b70e24dc0	8220	Šmarješke Toplice
00050000-55de-feb9-5f23-902007a3a194	2315	Šmartno na Pohorju
00050000-55de-feb9-d89b-be562f399d25	3341	Šmartno ob Dreti
00050000-55de-feb9-b559-0aed077ed52b	3327	Šmartno ob Paki
00050000-55de-feb9-6ce5-80f3ce2304c1	1275	Šmartno pri Litiji
00050000-55de-feb9-566b-88a7aec08778	2383	Šmartno pri Slovenj Gradcu
00050000-55de-feb9-5967-d020cf43b701	3201	Šmartno v Rožni dolini
00050000-55de-feb9-8670-f71c7f09c33b	3325	Šoštanj
00050000-55de-feb9-0c92-1809f8ab7545	6222	Štanjel
00050000-55de-feb9-7054-f3cd3d99ccba	3220	Štore
00050000-55de-feb9-9f90-98495a354373	3304	Tabor
00050000-55de-feb9-d739-cb3b45f4204c	3221	Teharje
00050000-55de-feb9-f520-7b25180dbffe	9251	Tišina
00050000-55de-feb9-14b3-c891062d1c90	5220	Tolmin
00050000-55de-feb9-1bfa-9ad3cef082ff	3326	Topolšica
00050000-55de-feb9-d029-a3ff3eda0ba2	2371	Trbonje
00050000-55de-feb9-e5a3-8e7b003fe776	1420	Trbovlje
00050000-55de-feb9-755d-21bfe0c28cbe	8231	Trebelno 
00050000-55de-feb9-f8e2-6cd66bdec125	8210	Trebnje
00050000-55de-feb9-1e2a-b7d9c8ec652f	5252	Trnovo pri Gorici
00050000-55de-feb9-f568-fc5e2ad1ac71	2254	Trnovska vas
00050000-55de-feb9-28ec-288b43fad362	1222	Trojane
00050000-55de-feb9-2448-f8b8995aa532	1236	Trzin
00050000-55de-feb9-174f-9492f8ea2f42	4290	Tržič
00050000-55de-feb9-d8e9-daf5f0f47e12	8295	Tržišče
00050000-55de-feb9-625a-a841f8504d13	1311	Turjak
00050000-55de-feb9-e1ed-f089ab243bf4	9224	Turnišče
00050000-55de-feb9-cb4b-8ad2ba751531	8323	Uršna sela
00050000-55de-feb9-1ed9-5399d7f0c38c	1252	Vače
00050000-55de-feb9-be97-4f8abd3a0f56	3320	Velenje 
00050000-55de-feb9-4abb-bbc9f287115d	3322	Velenje - poštni predali
00050000-55de-feb9-ec92-ee9e46b96792	8212	Velika Loka
00050000-55de-feb9-8d0a-6fc92f66388d	2274	Velika Nedelja
00050000-55de-feb9-10a9-2e1a2a9e6069	9225	Velika Polana
00050000-55de-feb9-d364-f005d53dd91f	1315	Velike Lašče
00050000-55de-feb9-cbe8-8b983bf030d5	8213	Veliki Gaber
00050000-55de-feb9-210a-eac4a2006e1e	9241	Veržej
00050000-55de-feb9-bce9-f3a159da34ca	1312	Videm - Dobrepolje
00050000-55de-feb9-ea57-e6ce30a988a1	2284	Videm pri Ptuju
00050000-55de-feb9-9387-ba671979f76a	8344	Vinica
00050000-55de-feb9-0732-5e8d7ba507af	5271	Vipava
00050000-55de-feb9-244d-306f85ce9943	4212	Visoko
00050000-55de-feb9-4195-9aa98c1f55b8	1294	Višnja Gora
00050000-55de-feb9-d023-854639a9b6c6	3205	Vitanje
00050000-55de-feb9-44c2-27c6deaa24c1	2255	Vitomarci
00050000-55de-feb9-b64a-964b2b48add8	1217	Vodice
00050000-55de-feb9-c49f-17bbf5fb4edb	3212	Vojnik\t
00050000-55de-feb9-2e40-cdf9b551f1ed	5293	Volčja Draga
00050000-55de-feb9-c2a9-be5d768e083f	2232	Voličina
00050000-55de-feb9-5241-691382a436d2	3305	Vransko
00050000-55de-feb9-7517-2a8f4c94c4ec	6217	Vremski Britof
00050000-55de-feb9-3f42-e7788f2da197	1360	Vrhnika
00050000-55de-feb9-0074-8728971328ae	2365	Vuhred
00050000-55de-feb9-83f7-785a7587d150	2367	Vuzenica
00050000-55de-feb9-5750-673b05c2cb4b	8292	Zabukovje 
00050000-55de-feb9-093e-f4b7d1f8e8fe	1410	Zagorje ob Savi
00050000-55de-feb9-9961-578a886a8e5d	1303	Zagradec
00050000-55de-feb9-69ae-1dbec5661f95	2283	Zavrč
00050000-55de-feb9-f9aa-4bcc2b58531a	8272	Zdole 
00050000-55de-feb9-57b4-9f535b43d5c5	4201	Zgornja Besnica
00050000-55de-feb9-a092-86a8d2f05a85	2242	Zgornja Korena
00050000-55de-feb9-3a4a-3c6283d0a28f	2201	Zgornja Kungota
00050000-55de-feb9-de88-e800cea62bdb	2316	Zgornja Ložnica
00050000-55de-feb9-feb6-85811b603916	2314	Zgornja Polskava
00050000-55de-feb9-39d2-3de4b268a03b	2213	Zgornja Velka
00050000-55de-feb9-3a74-fcee53f4656b	4247	Zgornje Gorje
00050000-55de-feb9-6f61-7edc1377f325	4206	Zgornje Jezersko
00050000-55de-feb9-9a01-48ef58a68f47	2285	Zgornji Leskovec
00050000-55de-feb9-29cf-de10787a34aa	1432	Zidani Most
00050000-55de-feb9-1bae-0f68222d3b6a	3214	Zreče
00050000-55de-feb9-78f5-82a4d1b1058d	4209	Žabnica
00050000-55de-feb9-38ad-674164ba7ef5	3310	Žalec
00050000-55de-feb9-82dc-d8de8695f1a8	4228	Železniki
00050000-55de-feb9-ab8c-aa1cc6ad5e80	2287	Žetale
00050000-55de-feb9-1d3f-043b29a660e6	4226	Žiri
00050000-55de-feb9-0156-2e7c8f4801cc	4274	Žirovnica
00050000-55de-feb9-7387-ab94e5e5d1b3	8360	Žužemberk
\.


--
-- TOC entry 2934 (class 0 OID 15906785)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 15906592)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55de-feba-22fe-7022f31e0ab5	00080000-55de-feba-574d-aa9272a65b41	\N	00040000-55de-feb9-1354-3770e572c8b5	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55de-feba-9714-73f4d35bfa2d	00080000-55de-feba-574d-aa9272a65b41	\N	00040000-55de-feb9-1354-3770e572c8b5		\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55de-feba-b188-a4b8c485eb02	00080000-55de-feba-be12-4bb2e89dee56	\N	00040000-55de-feb9-1354-3770e572c8b5		\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2922 (class 0 OID 15906670)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 15906797)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2960 (class 0 OID 15907148)
-- Dependencies: 226
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 15907158)
-- Dependencies: 227
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55de-feba-5d33-b1bf52f9b785	00080000-55de-feba-e373-9771bafe79e5	0987	AK
00190000-55de-feba-75e3-3c643562d198	00080000-55de-feba-be12-4bb2e89dee56	0989	AK
00190000-55de-feba-590c-b8e296e7b299	00080000-55de-feba-4cc2-6b19d9347368	0986	AK
00190000-55de-feba-7487-6c32db05d439	00080000-55de-feba-88d7-ae51ed331095	0984	AK
00190000-55de-feba-dbb7-cb68bd6a7340	00080000-55de-feba-78e9-ad2f7d5b6a83	0983	AK
00190000-55de-feba-7700-07e0c8a8a0b9	00080000-55de-feba-71ca-5518e5622269	0982	AK
00190000-55de-febb-3baf-7a40648ad06f	00080000-55de-febb-9395-cd8e143d741e	1001	AK
\.


--
-- TOC entry 2959 (class 0 OID 15907104)
-- Dependencies: 225
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55de-febb-0fde-cc8e79acc335	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2962 (class 0 OID 15907166)
-- Dependencies: 228
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 15906826)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55de-feba-0ada-ed81a0247904	\N	\N	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55de-feba-bfee-5aa0f9eef60b	\N	\N	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55de-feba-4634-aae366ba7f43	\N	\N	0003	Kazinska	t	84	Kazinska dvorana
00220000-55de-feba-af6f-b9ea8d264233	\N	\N	0004	Mali oder	t	24	Mali oder 
00220000-55de-feba-282b-dcce7f1808a9	\N	\N	0005	Komorni oder	t	15	Komorni oder
00220000-55de-feba-7947-bb90c7951482	\N	\N	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55de-feba-e1d0-b5dd328faed5	\N	\N	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2932 (class 0 OID 15906770)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 15906760)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 15906957)
-- Dependencies: 218
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 15906896)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 15906465)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55de-febb-9395-cd8e143d741e	00010000-55de-feb9-8a19-7ad4c8cadf87	2015-08-27 14:12:43	INS	a:0:{}
2	App\\Entity\\Option	00000000-55de-febb-d321-d619bba789dd	00010000-55de-feb9-8a19-7ad4c8cadf87	2015-08-27 14:12:43	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55de-febb-3baf-7a40648ad06f	00010000-55de-feb9-8a19-7ad4c8cadf87	2015-08-27 14:12:43	INS	a:0:{}
\.


--
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2941 (class 0 OID 15906838)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 15906503)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55de-feb9-8319-54af529c04cf	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55de-feb9-222d-fe86f3862314	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55de-feb9-4400-fc02319a15c5	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55de-feb9-aa7d-d02db1eff572	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55de-feb9-3e75-3e578b3d9b05	planer	Planer dogodkov v koledarju	t
00020000-55de-feb9-8f90-2c0acb3385db	kadrovska	Kadrovska služba	t
00020000-55de-feb9-c159-3ae7c8b00b5e	arhivar	Ažuriranje arhivalij	t
00020000-55de-feb9-dca2-254270ecfb66	igralec	Igralec	t
00020000-55de-feb9-daac-03f3955201f3	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55de-feba-cc7f-6968a403cdae	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2907 (class 0 OID 15906487)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55de-feb9-6d6f-8ce3b7dc4f24	00020000-55de-feb9-4400-fc02319a15c5
00010000-55de-feb9-8a19-7ad4c8cadf87	00020000-55de-feb9-4400-fc02319a15c5
00010000-55de-feba-1d81-fbadbb25280a	00020000-55de-feba-cc7f-6968a403cdae
\.


--
-- TOC entry 2943 (class 0 OID 15906852)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 15906791)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 15906737)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 15907207)
-- Dependencies: 233
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55de-feb9-0ff5-7a63c428f8db	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55de-feb9-c082-5104b5593b64	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55de-feb9-cafb-39e269c00c08	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55de-feb9-93a5-4f9f2fb96323	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55de-feb9-b36d-12cbea323f12	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2966 (class 0 OID 15907199)
-- Dependencies: 232
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55de-feb9-8a2b-41791770b529	00230000-55de-feb9-93a5-4f9f2fb96323	popa
00240000-55de-feb9-e55b-d446cbc24d42	00230000-55de-feb9-93a5-4f9f2fb96323	oseba
00240000-55de-feb9-8b55-d8dcfda430ee	00230000-55de-feb9-93a5-4f9f2fb96323	sezona
00240000-55de-feb9-9562-ed1d40fbdd9e	00230000-55de-feb9-c082-5104b5593b64	prostor
00240000-55de-feb9-e5de-7b63d7b607b3	00230000-55de-feb9-93a5-4f9f2fb96323	besedilo
00240000-55de-feb9-db51-e2042e46c038	00230000-55de-feb9-93a5-4f9f2fb96323	uprizoritev
00240000-55de-feb9-bac1-8b3995cdddce	00230000-55de-feb9-93a5-4f9f2fb96323	funkcija
00240000-55de-feb9-b744-98d98ae49128	00230000-55de-feb9-93a5-4f9f2fb96323	tipfunkcije
00240000-55de-feb9-484e-01a34f021c92	00230000-55de-feb9-93a5-4f9f2fb96323	alternacija
00240000-55de-feb9-f4a0-43464c175d7e	00230000-55de-feb9-0ff5-7a63c428f8db	pogodba
00240000-55de-feb9-a29c-76bd8776a073	00230000-55de-feb9-93a5-4f9f2fb96323	zaposlitev
00240000-55de-feb9-7d49-32948961ee7d	00230000-55de-feb9-0ff5-7a63c428f8db	programdela
00240000-55de-feb9-00e7-d9fbce4a25f3	00230000-55de-feb9-93a5-4f9f2fb96323	zapis
\.


--
-- TOC entry 2965 (class 0 OID 15907194)
-- Dependencies: 231
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
f013812f-e538-41f2-8c10-8bec95e13a9a	00230000-55de-feb9-93a5-4f9f2fb96323	0	1001
\.


--
-- TOC entry 2948 (class 0 OID 15906906)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55de-febb-4d44-83e1365af6cc	000e0000-55de-feba-dcdf-dd3ee9a1e5a3	00080000-55de-feba-574d-aa9272a65b41	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55de-feb9-a6c0-97b197ec31f5
00270000-55de-febb-9900-376e836218e0	000e0000-55de-feba-dcdf-dd3ee9a1e5a3	00080000-55de-feba-574d-aa9272a65b41	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55de-feb9-a6c0-97b197ec31f5
00270000-55de-febb-7709-a02eed1a983b	000e0000-55de-feba-dcdf-dd3ee9a1e5a3	00080000-55de-feba-f1bb-926aa29a1f67	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4	\N
\.


--
-- TOC entry 2914 (class 0 OID 15906565)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 15906747)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55de-febb-d695-0426312f42ce	00180000-55de-febb-86ea-c2a2c04fa3aa	000c0000-55de-febb-517c-758d46460de5	00090000-55de-feba-f00e-4b442c22642f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55de-febb-455b-f8b0f36ae842	00180000-55de-febb-86ea-c2a2c04fa3aa	000c0000-55de-febb-ff8a-bb090aed330d	00090000-55de-feba-859a-6ee7fe87d0d6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55de-febb-f384-8b285be8379d	00180000-55de-febb-86ea-c2a2c04fa3aa	000c0000-55de-febb-c3ce-7927fcc33d1e	00090000-55de-feba-c998-2ba6a8639108	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55de-febb-2d13-aa9be7a80c33	00180000-55de-febb-86ea-c2a2c04fa3aa	000c0000-55de-febb-9138-0d768fee0c0f	00090000-55de-feba-3e2c-9498d8e28a24	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55de-febb-6e7e-30e4706229f7	00180000-55de-febb-86ea-c2a2c04fa3aa	000c0000-55de-febb-b5dc-e3d990c6b689	00090000-55de-feba-3afe-fe024f8d82f8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55de-febb-59c1-01b5184f44e5	00180000-55de-febb-ca54-ffdf59a4a053	\N	00090000-55de-feba-3afe-fe024f8d82f8	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2951 (class 0 OID 15906946)
-- Dependencies: 217
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55de-feb9-721b-71301d423099	Avtor	Avtorji	Avtorka	umetnik
000f0000-55de-feb9-1379-2f2bd0aed9ef	Priredba	Priredba	Priredba	umetnik
000f0000-55de-feb9-3e7e-2b5f089e1b3a	Prevod	Prevod	Prevod	umetnik
000f0000-55de-feb9-e27e-638d0020dca9	Režija	Režija	Režija	umetnik
000f0000-55de-feb9-1ff7-8bd9481a1d6a	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55de-feb9-74d9-5514cb964067	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55de-feb9-e896-03d3d954801f	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55de-feb9-d7c2-15ad825a1f74	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55de-feb9-fe6a-bbe9d78550a0	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55de-feb9-25c6-954a6e37202f	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55de-feb9-1fbb-bdf784073582	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55de-feb9-2aee-40ffae3ad846	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55de-feb9-8e88-f7471460b46b	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55de-feb9-347a-94606bf5a823	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55de-feb9-5a80-85ce15fcd2a0	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55de-feb9-bb6a-79c6c9b6a315	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55de-feb9-098c-fe022b13d9c4	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55de-feb9-4418-cfc2ef1ff7f6	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2963 (class 0 OID 15907176)
-- Dependencies: 229
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55de-feb9-4802-c49008ff9642	01	Velika predstava	f	1.00	1.00
002b0000-55de-feb9-4f55-80462ba3af95	02	Mala predstava	f	0.50	0.50
002b0000-55de-feb9-4a18-90d979690edb	03	Mala koprodukcija	t	0.40	1.00
002b0000-55de-feb9-6a0a-3fa405d5aa04	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55de-feb9-1974-bd42679bcc13	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2919 (class 0 OID 15906627)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 15906474)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55de-feb9-8a19-7ad4c8cadf87	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO4I1Qa3DZpQ/fARtNYfCz8MvwrXLJhai	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55de-feba-0dba-bbeeb18c4c42	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55de-feba-09e9-b8194a9731fb	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55de-feba-a6d5-2880f25eaab7	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55de-feba-8113-b86b30702f1f	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55de-feba-195c-818b099a8534	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55de-feba-a27c-79abe644edd6	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55de-feba-b2b8-ab1d958c1975	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55de-feba-d1a6-e74b79a6cd9f	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55de-feba-218b-062f6a90b96e	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55de-feba-1d81-fbadbb25280a	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55de-feb9-6d6f-8ce3b7dc4f24	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2955 (class 0 OID 15906994)
-- Dependencies: 221
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55de-feba-b68d-7aa5e18661a7	00160000-55de-feba-c4f3-0a58d50ae0a4	\N	00140000-55de-feb9-ab71-fffe791911c4	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55de-feba-282b-dcce7f1808a9
000e0000-55de-feba-dcdf-dd3ee9a1e5a3	00160000-55de-feba-9b7b-8b2471967574	\N	00140000-55de-feb9-3a62-7cfbd7e16c01	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55de-feba-7947-bb90c7951482
000e0000-55de-feba-adad-2ca3f9196ef6	\N	\N	00140000-55de-feb9-3a62-7cfbd7e16c01	00190000-55de-feba-5d33-b1bf52f9b785	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55de-feba-282b-dcce7f1808a9
000e0000-55de-febb-b5b6-5ffbeecf5baf	\N	\N	00140000-55de-feb9-3a62-7cfbd7e16c01	00190000-55de-feba-5d33-b1bf52f9b785	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55de-feba-282b-dcce7f1808a9
000e0000-55de-febb-d9d7-f49168452ced	\N	\N	00140000-55de-feb9-3a62-7cfbd7e16c01	00190000-55de-feba-5d33-b1bf52f9b785	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55de-feba-0ada-ed81a0247904
000e0000-55de-febb-ab30-f73540a708cc	\N	\N	00140000-55de-feb9-3a62-7cfbd7e16c01	00190000-55de-feba-5d33-b1bf52f9b785	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55de-feba-0ada-ed81a0247904
\.


--
-- TOC entry 2924 (class 0 OID 15906689)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55de-febb-51e2-640d8e4438f8	000e0000-55de-feba-dcdf-dd3ee9a1e5a3	1	
00200000-55de-febb-b709-7d752f0b98ae	000e0000-55de-feba-dcdf-dd3ee9a1e5a3	2	
\.


--
-- TOC entry 2939 (class 0 OID 15906818)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 15906920)
-- Dependencies: 215
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55de-feb9-319b-f8d3e2d904e0	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55de-feb9-077d-96d3ca066beb	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55de-feb9-c06f-ccf273fd5452	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55de-feb9-9cdc-8421e3d8f25b	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55de-feb9-7076-99506ce44bbe	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55de-feb9-a014-abee96bcc909	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55de-feb9-a47b-cb52635b9b49	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55de-feb9-e6c7-899d2ea8814c	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55de-feb9-a6c0-97b197ec31f5	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55de-feb9-a19c-4a694974668c	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55de-feb9-f0f9-2980e7f10013	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55de-feb9-5505-7b70a7bd6d9a	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55de-feb9-236f-1e4b3b07a07f	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55de-feb9-4616-aec6b9db5f0f	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55de-feb9-cd67-02c9cffa5184	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55de-feb9-2960-1fae10693462	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55de-feb9-e540-d3c5e5767d9c	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55de-feb9-72bf-ddb48e444de0	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55de-feb9-12fb-2eee47e685db	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55de-feb9-c166-e8a47138dbe6	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55de-feb9-efea-9091aecb1bb3	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55de-feb9-ba48-ac8ff366d312	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55de-feb9-5520-2511fed2e873	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55de-feb9-33ee-5b494babe9b4	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55de-feb9-f593-77cbc82e593d	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55de-feb9-8288-0ef90c4321ee	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55de-feb9-baab-4a6cd82384af	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55de-feb9-5ef9-634d74833656	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2969 (class 0 OID 15907246)
-- Dependencies: 235
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 15907218)
-- Dependencies: 234
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 15907258)
-- Dependencies: 236
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 15906889)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55de-febb-7f0d-6b33b33f73d9	00090000-55de-feba-859a-6ee7fe87d0d6	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55de-febb-c30b-270c50709629	00090000-55de-feba-c998-2ba6a8639108	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55de-febb-e9b7-8309c4f398b9	00090000-55de-feba-7442-d79937e8a638	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55de-febb-a992-dc690f5ead24	00090000-55de-feba-4356-e2b16cb3aa2e	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55de-febb-6bf9-f7348a38308a	00090000-55de-feba-f00e-4b442c22642f	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55de-febb-ddc2-87b3ebdd3a12	00090000-55de-feba-b211-3682be19e752	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2926 (class 0 OID 15906721)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 15906984)
-- Dependencies: 220
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55de-feb9-ab71-fffe791911c4	01	Drama	drama (SURS 01)
00140000-55de-feb9-a2f3-d23d35bd5c5a	02	Opera	opera (SURS 02)
00140000-55de-feb9-7012-714b1fda8c49	03	Balet	balet (SURS 03)
00140000-55de-feb9-c391-7ed749558a3c	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55de-feb9-8093-4bbb26d0805a	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55de-feb9-3a62-7cfbd7e16c01	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55de-feb9-eae0-7775eb902412	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2945 (class 0 OID 15906879)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2448 (class 2606 OID 15906528)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 15907043)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 15907033)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 15906945)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 15907298)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 15906711)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 15906736)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 15907192)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 15906653)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 15907098)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 15906875)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 15906687)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 15906730)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 15906667)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 15906783)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 15907275)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 15907282)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2694 (class 2606 OID 15907306)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 15906810)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 15906625)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 15906537)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 15906561)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 15906517)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2439 (class 2606 OID 15906502)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 15906816)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 15906851)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 15906979)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 15906589)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 15906613)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 15906789)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 15906603)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 15906674)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 15906801)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 15907155)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 15907163)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 15907146)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 15907174)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 15906833)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 15906774)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 15906765)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 15906967)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 15906903)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 15906473)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 15906842)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 15906491)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2441 (class 2606 OID 15906511)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 15906860)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 15906796)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 15906745)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 15907216)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 15907204)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 15907198)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 15906916)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 15906570)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 15906756)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 15906956)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 15907186)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 15906638)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 15906486)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 15907012)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 15906696)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 15906824)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 15906928)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 15907256)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 15907240)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 15907264)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 15906894)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 15906725)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 15906992)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 15906887)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 1259 OID 15906718)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2591 (class 1259 OID 15906917)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2592 (class 1259 OID 15906918)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2593 (class 1259 OID 15906919)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2680 (class 1259 OID 15907277)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2681 (class 1259 OID 15907276)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2462 (class 1259 OID 15906591)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2554 (class 1259 OID 15906817)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2667 (class 1259 OID 15907244)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2668 (class 1259 OID 15907243)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2669 (class 1259 OID 15907245)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2670 (class 1259 OID 15907242)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2671 (class 1259 OID 15907241)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2548 (class 1259 OID 15906803)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2549 (class 1259 OID 15906802)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2499 (class 1259 OID 15906697)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2578 (class 1259 OID 15906876)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2579 (class 1259 OID 15906878)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2580 (class 1259 OID 15906877)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2487 (class 1259 OID 15906669)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2488 (class 1259 OID 15906668)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2650 (class 1259 OID 15907175)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2604 (class 1259 OID 15906981)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2605 (class 1259 OID 15906982)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2606 (class 1259 OID 15906983)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2677 (class 1259 OID 15907265)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2613 (class 1259 OID 15907017)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2614 (class 1259 OID 15907014)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2615 (class 1259 OID 15907018)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2616 (class 1259 OID 15907016)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2617 (class 1259 OID 15907015)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2477 (class 1259 OID 15906640)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2478 (class 1259 OID 15906639)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2453 (class 1259 OID 15906564)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2566 (class 1259 OID 15906843)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2517 (class 1259 OID 15906731)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2443 (class 1259 OID 15906518)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2444 (class 1259 OID 15906519)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2571 (class 1259 OID 15906863)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2572 (class 1259 OID 15906862)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2573 (class 1259 OID 15906861)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2491 (class 1259 OID 15906675)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2492 (class 1259 OID 15906677)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2493 (class 1259 OID 15906676)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2660 (class 1259 OID 15907206)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2528 (class 1259 OID 15906769)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2529 (class 1259 OID 15906767)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2530 (class 1259 OID 15906766)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2531 (class 1259 OID 15906768)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2434 (class 1259 OID 15906492)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2435 (class 1259 OID 15906493)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2557 (class 1259 OID 15906825)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2690 (class 1259 OID 15907299)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2691 (class 1259 OID 15907307)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2692 (class 1259 OID 15907308)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2543 (class 1259 OID 15906790)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2587 (class 1259 OID 15906904)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2588 (class 1259 OID 15906905)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2634 (class 1259 OID 15907103)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2635 (class 1259 OID 15907102)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2636 (class 1259 OID 15907099)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2637 (class 1259 OID 15907100)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2638 (class 1259 OID 15907101)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2466 (class 1259 OID 15906605)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2467 (class 1259 OID 15906604)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2468 (class 1259 OID 15906606)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2560 (class 1259 OID 15906837)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2561 (class 1259 OID 15906836)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2642 (class 1259 OID 15907156)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2643 (class 1259 OID 15907157)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2627 (class 1259 OID 15907047)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2628 (class 1259 OID 15907048)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2629 (class 1259 OID 15907045)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2630 (class 1259 OID 15907046)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2584 (class 1259 OID 15906895)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2534 (class 1259 OID 15906778)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2535 (class 1259 OID 15906777)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2536 (class 1259 OID 15906775)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2537 (class 1259 OID 15906776)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2623 (class 1259 OID 15907035)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2624 (class 1259 OID 15907034)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2639 (class 1259 OID 15907147)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2498 (class 1259 OID 15906688)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2657 (class 1259 OID 15907193)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2684 (class 1259 OID 15907283)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2685 (class 1259 OID 15907284)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2449 (class 1259 OID 15906539)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2450 (class 1259 OID 15906538)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2458 (class 1259 OID 15906571)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2459 (class 1259 OID 15906572)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2523 (class 1259 OID 15906759)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2524 (class 1259 OID 15906758)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2525 (class 1259 OID 15906757)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2505 (class 1259 OID 15906720)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2506 (class 1259 OID 15906716)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2507 (class 1259 OID 15906713)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2508 (class 1259 OID 15906714)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2509 (class 1259 OID 15906712)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2510 (class 1259 OID 15906717)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2511 (class 1259 OID 15906715)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2465 (class 1259 OID 15906590)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2483 (class 1259 OID 15906654)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2484 (class 1259 OID 15906656)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2485 (class 1259 OID 15906655)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2486 (class 1259 OID 15906657)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2542 (class 1259 OID 15906784)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2609 (class 1259 OID 15906980)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2618 (class 1259 OID 15907013)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2456 (class 1259 OID 15906562)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2457 (class 1259 OID 15906563)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2581 (class 1259 OID 15906888)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2666 (class 1259 OID 15907217)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 15906626)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2663 (class 1259 OID 15907205)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2564 (class 1259 OID 15906835)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2565 (class 1259 OID 15906834)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2631 (class 1259 OID 15907044)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2473 (class 1259 OID 15906614)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2610 (class 1259 OID 15906993)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2674 (class 1259 OID 15907257)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2648 (class 1259 OID 15907164)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 15907165)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2522 (class 1259 OID 15906746)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2442 (class 1259 OID 15906512)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2512 (class 1259 OID 15906719)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2720 (class 2606 OID 15907444)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2723 (class 2606 OID 15907429)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2722 (class 2606 OID 15907434)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2718 (class 2606 OID 15907454)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2724 (class 2606 OID 15907424)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2719 (class 2606 OID 15907449)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2721 (class 2606 OID 15907439)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2757 (class 2606 OID 15907609)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2756 (class 2606 OID 15907614)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2755 (class 2606 OID 15907619)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2790 (class 2606 OID 15907789)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2791 (class 2606 OID 15907784)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2705 (class 2606 OID 15907359)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2741 (class 2606 OID 15907539)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2785 (class 2606 OID 15907769)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2786 (class 2606 OID 15907764)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2784 (class 2606 OID 15907774)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2787 (class 2606 OID 15907759)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2788 (class 2606 OID 15907754)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2739 (class 2606 OID 15907534)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2740 (class 2606 OID 15907529)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2717 (class 2606 OID 15907419)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2751 (class 2606 OID 15907579)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2749 (class 2606 OID 15907589)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2750 (class 2606 OID 15907584)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2711 (class 2606 OID 15907394)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2712 (class 2606 OID 15907389)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2737 (class 2606 OID 15907519)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2781 (class 2606 OID 15907739)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2760 (class 2606 OID 15907624)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2759 (class 2606 OID 15907629)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2758 (class 2606 OID 15907634)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2789 (class 2606 OID 15907779)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2762 (class 2606 OID 15907654)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2765 (class 2606 OID 15907639)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2761 (class 2606 OID 15907659)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2763 (class 2606 OID 15907649)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2764 (class 2606 OID 15907644)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2709 (class 2606 OID 15907384)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2710 (class 2606 OID 15907379)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2701 (class 2606 OID 15907344)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2702 (class 2606 OID 15907339)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2745 (class 2606 OID 15907559)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2725 (class 2606 OID 15907459)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2698 (class 2606 OID 15907319)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2697 (class 2606 OID 15907324)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2746 (class 2606 OID 15907574)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2747 (class 2606 OID 15907569)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2748 (class 2606 OID 15907564)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2715 (class 2606 OID 15907399)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2713 (class 2606 OID 15907409)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2714 (class 2606 OID 15907404)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2783 (class 2606 OID 15907749)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2729 (class 2606 OID 15907494)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2731 (class 2606 OID 15907484)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2732 (class 2606 OID 15907479)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2730 (class 2606 OID 15907489)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2696 (class 2606 OID 15907309)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2695 (class 2606 OID 15907314)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2742 (class 2606 OID 15907544)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2794 (class 2606 OID 15907804)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2796 (class 2606 OID 15907809)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2795 (class 2606 OID 15907814)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2738 (class 2606 OID 15907524)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2754 (class 2606 OID 15907599)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2753 (class 2606 OID 15907604)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2772 (class 2606 OID 15907714)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2773 (class 2606 OID 15907709)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2776 (class 2606 OID 15907694)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2775 (class 2606 OID 15907699)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2774 (class 2606 OID 15907704)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2707 (class 2606 OID 15907369)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2708 (class 2606 OID 15907364)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2706 (class 2606 OID 15907374)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2743 (class 2606 OID 15907554)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2744 (class 2606 OID 15907549)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2779 (class 2606 OID 15907724)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2778 (class 2606 OID 15907729)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2769 (class 2606 OID 15907684)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2768 (class 2606 OID 15907689)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2771 (class 2606 OID 15907674)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2770 (class 2606 OID 15907679)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2752 (class 2606 OID 15907594)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2733 (class 2606 OID 15907514)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2734 (class 2606 OID 15907509)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2736 (class 2606 OID 15907499)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2735 (class 2606 OID 15907504)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2766 (class 2606 OID 15907669)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2767 (class 2606 OID 15907664)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2777 (class 2606 OID 15907719)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2716 (class 2606 OID 15907414)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2780 (class 2606 OID 15907734)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2782 (class 2606 OID 15907744)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2793 (class 2606 OID 15907794)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2792 (class 2606 OID 15907799)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2699 (class 2606 OID 15907334)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2700 (class 2606 OID 15907329)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2704 (class 2606 OID 15907349)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2703 (class 2606 OID 15907354)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2726 (class 2606 OID 15907474)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2727 (class 2606 OID 15907469)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2728 (class 2606 OID 15907464)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-27 14:12:44 CEST

--
-- PostgreSQL database dump complete
--

