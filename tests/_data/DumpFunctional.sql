--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-26 13:00:30 CEST

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
-- TOC entry 177 (class 1259 OID 15618737)
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
-- TOC entry 223 (class 1259 OID 15619251)
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
-- TOC entry 222 (class 1259 OID 15619234)
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
-- TOC entry 216 (class 1259 OID 15619146)
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
-- TOC entry 239 (class 1259 OID 15619500)
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
-- TOC entry 191 (class 1259 OID 15618915)
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
-- TOC entry 194 (class 1259 OID 15618949)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 15619402)
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
-- TOC entry 186 (class 1259 OID 15618858)
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
-- TOC entry 224 (class 1259 OID 15619264)
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
-- TOC entry 210 (class 1259 OID 15619081)
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
-- TOC entry 189 (class 1259 OID 15618895)
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
-- TOC entry 193 (class 1259 OID 15618943)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 15618875)
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
-- TOC entry 199 (class 1259 OID 15618996)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 237 (class 1259 OID 15619481)
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
-- TOC entry 238 (class 1259 OID 15619493)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 15619515)
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
-- TOC entry 203 (class 1259 OID 15619021)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 15618832)
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
-- TOC entry 178 (class 1259 OID 15618746)
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
-- TOC entry 179 (class 1259 OID 15618757)
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
-- TOC entry 174 (class 1259 OID 15618711)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 15618730)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 15619028)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 15619061)
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
-- TOC entry 219 (class 1259 OID 15619185)
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
-- TOC entry 181 (class 1259 OID 15618790)
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
-- TOC entry 183 (class 1259 OID 15618824)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 15619002)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 15618809)
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
-- TOC entry 188 (class 1259 OID 15618887)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 15619014)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 15619363)
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
-- TOC entry 227 (class 1259 OID 15619373)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 15619319)
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
-- TOC entry 228 (class 1259 OID 15619381)
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
-- TOC entry 206 (class 1259 OID 15619043)
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
-- TOC entry 198 (class 1259 OID 15618987)
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
-- TOC entry 197 (class 1259 OID 15618977)
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
-- TOC entry 218 (class 1259 OID 15619174)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 15619113)
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
-- TOC entry 171 (class 1259 OID 15618682)
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
-- TOC entry 170 (class 1259 OID 15618680)
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
-- TOC entry 207 (class 1259 OID 15619055)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 15618720)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 15618704)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 15619069)
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
-- TOC entry 201 (class 1259 OID 15619008)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 15618954)
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
-- TOC entry 233 (class 1259 OID 15619422)
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
-- TOC entry 232 (class 1259 OID 15619414)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 15619409)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 15619123)
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
-- TOC entry 180 (class 1259 OID 15618782)
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
-- TOC entry 196 (class 1259 OID 15618964)
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
-- TOC entry 217 (class 1259 OID 15619163)
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
-- TOC entry 229 (class 1259 OID 15619391)
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
-- TOC entry 185 (class 1259 OID 15618844)
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
-- TOC entry 172 (class 1259 OID 15618691)
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
-- TOC entry 221 (class 1259 OID 15619211)
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
-- TOC entry 190 (class 1259 OID 15618906)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 15619035)
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
-- TOC entry 215 (class 1259 OID 15619137)
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
-- TOC entry 235 (class 1259 OID 15619461)
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
-- TOC entry 234 (class 1259 OID 15619433)
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
-- TOC entry 236 (class 1259 OID 15619473)
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
-- TOC entry 212 (class 1259 OID 15619106)
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
-- TOC entry 192 (class 1259 OID 15618938)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 15619201)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 15619096)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 15618685)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2909 (class 0 OID 15618737)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2955 (class 0 OID 15619251)
-- Dependencies: 223
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55dd-9c4c-b7a8-56f9afc08b6d	000d0000-55dd-9c4c-cc69-2747abfdb190	\N	00090000-55dd-9c4c-140f-cbb6dc445f57	000b0000-55dd-9c4c-988d-f1878e8da246	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55dd-9c4c-9f3a-49f07899ff8d	000d0000-55dd-9c4c-93f8-3dfe225ef1f9	00100000-55dd-9c4c-b33d-84573c9c94ac	00090000-55dd-9c4c-4b4f-ec087d16ecff	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55dd-9c4c-7cd8-4e5fe3455fdb	000d0000-55dd-9c4c-68b1-fd2c44a50c6f	00100000-55dd-9c4c-d612-041994192c50	00090000-55dd-9c4c-e37c-3b9d6276ddaf	\N	0003	t	\N	2015-08-26	\N	2	\N	\N	f	f
000c0000-55dd-9c4c-155a-6876a7abe140	000d0000-55dd-9c4c-cb9e-0ccc2ff97a31	\N	00090000-55dd-9c4c-ef76-ee4e75bc070d	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55dd-9c4c-a8f6-0fc2288b1a94	000d0000-55dd-9c4c-eb56-8fad464fc13f	\N	00090000-55dd-9c4c-bebb-8f3868716818	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55dd-9c4c-f4e2-5e4827c4e431	000d0000-55dd-9c4c-e7d0-b03f17531b15	\N	00090000-55dd-9c4c-4b66-9ca20d3b9c42	000b0000-55dd-9c4c-567b-75157f275485	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55dd-9c4c-5d00-5c2ae708fd0e	000d0000-55dd-9c4c-01b3-fa0dd264d416	00100000-55dd-9c4c-85d1-5926dfadd4da	00090000-55dd-9c4c-d1a2-cfcd755222c4	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55dd-9c4c-df89-212559c7d408	000d0000-55dd-9c4c-a6e1-f6891b18fc90	\N	00090000-55dd-9c4c-9994-040f1135f59b	000b0000-55dd-9c4c-e2ff-ec00fa12752e	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55dd-9c4c-4674-13aa796eb7bc	000d0000-55dd-9c4c-01b3-fa0dd264d416	00100000-55dd-9c4c-ebfc-ca319233ae2a	00090000-55dd-9c4c-17a4-28734af8fc43	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55dd-9c4c-d9d5-9add6d834e50	000d0000-55dd-9c4c-01b3-fa0dd264d416	00100000-55dd-9c4c-d1c4-a4e8a26c4b44	00090000-55dd-9c4c-8ebb-a90941a09181	\N	0010	t	\N	2015-08-26	\N	16	\N	\N	f	t
000c0000-55dd-9c4c-4785-5e6c42fbf84c	000d0000-55dd-9c4c-01b3-fa0dd264d416	00100000-55dd-9c4c-9e81-fe945006cbb9	00090000-55dd-9c4c-5ecb-62cf77bbb458	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2954 (class 0 OID 15619234)
-- Dependencies: 222
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 15619146)
-- Dependencies: 216
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55dd-9c4c-9747-5e1252743fd0	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55dd-9c4c-0fd3-f4fa9cd8a46b	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55dd-9c4c-5de7-3d53e91c9ecd	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2971 (class 0 OID 15619500)
-- Dependencies: 239
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2923 (class 0 OID 15618915)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55dd-9c4c-a548-d9ed2d4359a3	\N	\N	00200000-55dd-9c4c-e943-c3e7abed5482	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55dd-9c4c-79bf-2de72a580733	\N	\N	00200000-55dd-9c4c-fc82-2057d45fe40d	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55dd-9c4c-ba59-b29db7553eae	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55dd-9c4c-4bee-090b232573d5	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55dd-9c4c-459c-6ae9d7e3eef0	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2926 (class 0 OID 15618949)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 15619402)
-- Dependencies: 230
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2918 (class 0 OID 15618858)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55dd-9c4a-969a-45f673dc4c41	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55dd-9c4a-533e-08d93bf61573	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55dd-9c4a-5f43-38a59db3ec80	AL	ALB	008	Albania 	Albanija	\N
00040000-55dd-9c4a-c44d-f32a14d72de2	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55dd-9c4a-4b13-5e9c52e8719d	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55dd-9c4a-29a7-3bf256f2cde2	AD	AND	020	Andorra 	Andora	\N
00040000-55dd-9c4a-7022-9aa7acebca8a	AO	AGO	024	Angola 	Angola	\N
00040000-55dd-9c4a-3dcd-2baec9e16a86	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55dd-9c4a-4a1e-323ae6933ba3	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55dd-9c4a-a17e-44cc20accbc9	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55dd-9c4a-c2aa-9eb102f91b59	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55dd-9c4a-d831-3e52ac0c2fe5	AM	ARM	051	Armenia 	Armenija	\N
00040000-55dd-9c4a-1e39-c7e6179f142b	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55dd-9c4a-19bf-feec56e15529	AU	AUS	036	Australia 	Avstralija	\N
00040000-55dd-9c4a-5527-babec7f5a5cc	AT	AUT	040	Austria 	Avstrija	\N
00040000-55dd-9c4a-c998-c0ed52ba3e6e	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55dd-9c4a-be20-9b7e8d38cca7	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55dd-9c4a-4239-d673e916febe	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55dd-9c4a-5b10-833854ea37a7	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55dd-9c4a-9541-168091d5af41	BB	BRB	052	Barbados 	Barbados	\N
00040000-55dd-9c4a-a3e5-298a108d8ae0	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55dd-9c4a-177c-e01f568938cd	BE	BEL	056	Belgium 	Belgija	\N
00040000-55dd-9c4a-b311-8374ae1235c5	BZ	BLZ	084	Belize 	Belize	\N
00040000-55dd-9c4a-2457-34361cdbb063	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55dd-9c4a-883f-a0bacf6408f1	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55dd-9c4a-9014-263dec73f2a2	BT	BTN	064	Bhutan 	Butan	\N
00040000-55dd-9c4a-e46c-949c2261a878	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55dd-9c4a-f049-472843e4f1ee	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55dd-9c4a-0b5e-deb14c4c080c	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55dd-9c4a-c887-7614119b9e6a	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55dd-9c4a-87f5-3a8d3b797104	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55dd-9c4a-3872-189d5c632fca	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55dd-9c4a-ea22-19a33fcc2ab7	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55dd-9c4a-6f3d-46f5cfd98b09	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55dd-9c4a-8968-a46d5b3b1b93	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55dd-9c4a-30db-343b02218cb4	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55dd-9c4a-e5cd-c7e1a59367b4	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55dd-9c4a-6e89-725bfeea0706	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55dd-9c4a-f3ca-2a09e5ee4ec1	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55dd-9c4a-6554-7089e4597d61	CA	CAN	124	Canada 	Kanada	\N
00040000-55dd-9c4a-60cc-fb8d50c48885	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55dd-9c4a-8946-f0e50b9b30bb	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55dd-9c4a-810d-3e2ea93ab8ce	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55dd-9c4a-4ed4-40bba0edcdc3	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55dd-9c4a-bc64-5e35ca9255aa	CL	CHL	152	Chile 	Čile	\N
00040000-55dd-9c4a-f604-a14ecb83d462	CN	CHN	156	China 	Kitajska	\N
00040000-55dd-9c4a-436d-8dc0d00035dd	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55dd-9c4a-cd99-b55c2b88f9ec	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55dd-9c4a-2203-adff93f6f2cc	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55dd-9c4a-ccfc-6416bb2aa7b5	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55dd-9c4a-5203-b68bcb28ad33	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55dd-9c4a-3893-ecc97cd5c683	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55dd-9c4a-b1e4-ea95de630c0c	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55dd-9c4a-205c-17f7dc7c2b7a	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55dd-9c4a-3741-bc73b8c038fa	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55dd-9c4a-18c8-66e4b0c4ccf4	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55dd-9c4a-98f8-6563a179b1f6	CU	CUB	192	Cuba 	Kuba	\N
00040000-55dd-9c4a-5ce1-b6fb1e0cfd02	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55dd-9c4a-1790-1762a685164f	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55dd-9c4a-c822-9176e59cf414	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55dd-9c4a-b3bc-0f12de5b771e	DK	DNK	208	Denmark 	Danska	\N
00040000-55dd-9c4a-5e60-e4c94ed4eb7d	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55dd-9c4a-6231-e4fca352f97b	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55dd-9c4a-76e0-893ca66e0711	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55dd-9c4a-ca6a-e1b8ce179966	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55dd-9c4a-d998-1c1c0a914db8	EG	EGY	818	Egypt 	Egipt	\N
00040000-55dd-9c4a-46c7-05846d43fa62	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55dd-9c4a-f008-a69e54cd270c	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55dd-9c4a-ff45-e7751caa1bf2	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55dd-9c4a-ddf1-0ec917fabc89	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55dd-9c4a-7ba1-a02e30d6bf80	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55dd-9c4a-e859-36cae04f41f8	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55dd-9c4a-611c-46dc00c9a145	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55dd-9c4a-3dd6-b9097609fa2a	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55dd-9c4a-d1b2-244505173932	FI	FIN	246	Finland 	Finska	\N
00040000-55dd-9c4a-3a6b-88164fc2804f	FR	FRA	250	France 	Francija	\N
00040000-55dd-9c4a-d73e-c218785cf330	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55dd-9c4b-7571-c018b7f9548c	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55dd-9c4a-9266-b3853841a5e1	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55dd-9c4a-80ed-a40319903d17	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55dd-9c4a-5da6-08080b7826f1	GA	GAB	266	Gabon 	Gabon	\N
00040000-55dd-9c4a-f3c3-a7aeabac8b31	GM	GMB	270	Gambia 	Gambija	\N
00040000-55dd-9c4a-b330-35702b9bbb66	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55dd-9c4a-3f08-33d1ab6eaabc	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55dd-9c4a-6b44-7f1941e80df9	GH	GHA	288	Ghana 	Gana	\N
00040000-55dd-9c4a-e0da-286db75e1ed3	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55dd-9c4a-8862-0d871f7a51ca	GR	GRC	300	Greece 	Grčija	\N
00040000-55dd-9c4a-530d-64507e46c288	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55dd-9c4a-3ce8-d698d85d209c	GD	GRD	308	Grenada 	Grenada	\N
00040000-55dd-9c4a-b244-ac629a5a0077	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55dd-9c4a-45bb-c4d8af9ac1e7	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55dd-9c4a-5a3f-0f4fcd805279	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55dd-9c4a-f88d-438e09fdde25	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55dd-9c4a-e816-5bcff168d90c	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55dd-9c4a-00b7-0010ffc14b02	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55dd-9c4a-0c84-3e6da9d0df31	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55dd-9c4a-e049-971207b37b07	HT	HTI	332	Haiti 	Haiti	\N
00040000-55dd-9c4a-6750-bfa05ad0e60f	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55dd-9c4a-d3fe-5910de578ca9	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55dd-9c4a-16fa-4ec45b2ce754	HN	HND	340	Honduras 	Honduras	\N
00040000-55dd-9c4a-e37b-e9644765e0ce	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55dd-9c4a-d2f2-1af376263adb	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55dd-9c4a-45dc-2a7a559d9c3a	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55dd-9c4a-d8b7-4a3b44ced508	IN	IND	356	India 	Indija	\N
00040000-55dd-9c4a-1ae6-70b003b60112	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55dd-9c4a-5792-6364fd4b00b6	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55dd-9c4a-43e9-52869b77c679	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55dd-9c4a-384b-543714fa567c	IE	IRL	372	Ireland 	Irska	\N
00040000-55dd-9c4a-22b8-23a11a7b7706	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55dd-9c4a-9fdd-aa832bafe2c5	IL	ISR	376	Israel 	Izrael	\N
00040000-55dd-9c4b-8c8d-3c188c124b73	IT	ITA	380	Italy 	Italija	\N
00040000-55dd-9c4b-ac1a-ac8977150af4	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55dd-9c4b-7957-1aeae538aca8	JP	JPN	392	Japan 	Japonska	\N
00040000-55dd-9c4b-772e-159837059ff7	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55dd-9c4b-c18b-8f8fbccfe9fe	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55dd-9c4b-0b13-81419f44b452	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55dd-9c4b-e7af-b3ae260fe33c	KE	KEN	404	Kenya 	Kenija	\N
00040000-55dd-9c4b-c5da-9228f06cdf4e	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55dd-9c4b-f46d-b6c6d5c773d9	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55dd-9c4b-f718-5f32e3d0229d	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55dd-9c4b-3470-f426242bf9cd	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55dd-9c4b-ab7c-0e600d5a3ea3	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55dd-9c4b-0fa5-fa0a1ef6f290	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55dd-9c4b-f07d-8bd9498a91fc	LV	LVA	428	Latvia 	Latvija	\N
00040000-55dd-9c4b-f1ce-7c1fcd3d8403	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55dd-9c4b-a585-7e58e3be1a6f	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55dd-9c4b-ecf9-702a8a06b75b	LR	LBR	430	Liberia 	Liberija	\N
00040000-55dd-9c4b-6988-447edafb8f63	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55dd-9c4b-f402-041039e83f57	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55dd-9c4b-f92c-d9ebee99c6bf	LT	LTU	440	Lithuania 	Litva	\N
00040000-55dd-9c4b-dd77-2f0d3ad65203	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55dd-9c4b-d510-33584732a76d	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55dd-9c4b-ae8f-a1a209bf9d78	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55dd-9c4b-0bfb-f72fd09d0525	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55dd-9c4b-eff9-42c471fadc26	MW	MWI	454	Malawi 	Malavi	\N
00040000-55dd-9c4b-e04f-1a0670c54ca1	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55dd-9c4b-b70c-eb2197f622a0	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55dd-9c4b-9652-a1a1b5f1510c	ML	MLI	466	Mali 	Mali	\N
00040000-55dd-9c4b-4dee-287c30987b20	MT	MLT	470	Malta 	Malta	\N
00040000-55dd-9c4b-1333-623059d80a51	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55dd-9c4b-3529-b80e9ddb0f58	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55dd-9c4b-8910-6f5c85e33378	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55dd-9c4b-cd1e-c8772cb8392d	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55dd-9c4b-0131-0881c4341892	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55dd-9c4b-017c-d0add604f79d	MX	MEX	484	Mexico 	Mehika	\N
00040000-55dd-9c4b-f842-3c320ea8a72d	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55dd-9c4b-a6ea-88806fc2c993	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55dd-9c4b-06ca-92a5d4157b33	MC	MCO	492	Monaco 	Monako	\N
00040000-55dd-9c4b-73b0-624065386cbd	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55dd-9c4b-9d3a-0dc9f831435b	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55dd-9c4b-11a4-f74ef837a7d4	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55dd-9c4b-51b7-0d5dcf8ebde3	MA	MAR	504	Morocco 	Maroko	\N
00040000-55dd-9c4b-9cd7-cfd576979742	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55dd-9c4b-ff14-2edc56325e3c	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55dd-9c4b-81ca-a2a302c27a43	NA	NAM	516	Namibia 	Namibija	\N
00040000-55dd-9c4b-a5e5-e2e29c193fc5	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55dd-9c4b-85e5-d50401aef633	NP	NPL	524	Nepal 	Nepal	\N
00040000-55dd-9c4b-836b-7f93371c0a14	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55dd-9c4b-9799-a1695d394b9d	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55dd-9c4b-3c20-0616abf228d9	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55dd-9c4b-2eb5-f8c59dd306aa	NE	NER	562	Niger 	Niger 	\N
00040000-55dd-9c4b-a1ca-677fed0e4945	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55dd-9c4b-4772-831f19dcb660	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55dd-9c4b-c412-78948fde101b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55dd-9c4b-1cca-e8e847735fd4	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55dd-9c4b-d4bd-0e83edcb991c	NO	NOR	578	Norway 	Norveška	\N
00040000-55dd-9c4b-9750-2c24b83c1a7f	OM	OMN	512	Oman 	Oman	\N
00040000-55dd-9c4b-62cd-ac6f24c2fc46	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55dd-9c4b-f51a-31ab4cdfbeab	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55dd-9c4b-4555-22cd7a07fcf9	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55dd-9c4b-7aa8-923b21ed6b8d	PA	PAN	591	Panama 	Panama	\N
00040000-55dd-9c4b-4092-84bec9be3ba8	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55dd-9c4b-f5c6-295bcdf9bef4	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55dd-9c4b-5f8a-4124c40153f5	PE	PER	604	Peru 	Peru	\N
00040000-55dd-9c4b-18a6-58960783da56	PH	PHL	608	Philippines 	Filipini	\N
00040000-55dd-9c4b-9166-7078812e1714	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55dd-9c4b-d4cb-a9731d2d6bf4	PL	POL	616	Poland 	Poljska	\N
00040000-55dd-9c4b-31f9-e6f5803ea584	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55dd-9c4b-54a0-f7ee73d1fd4c	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55dd-9c4b-9c48-c236c44e9464	QA	QAT	634	Qatar 	Katar	\N
00040000-55dd-9c4b-2902-877f8020c0e9	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55dd-9c4b-774d-534a1e497492	RO	ROU	642	Romania 	Romunija	\N
00040000-55dd-9c4b-1b10-8720fed3c98c	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55dd-9c4b-a694-798e1027c2b4	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55dd-9c4b-96a1-d7669dcfbcb8	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55dd-9c4b-9029-6613675c7834	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55dd-9c4b-dd4b-42727f02d42b	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55dd-9c4b-aa1c-7aadc4d7d908	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55dd-9c4b-ca5b-ff64b1980dc3	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55dd-9c4b-dc37-d4b7b1c29270	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55dd-9c4b-80da-f05bbf76d38d	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55dd-9c4b-8a8c-78e0822f1445	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55dd-9c4b-7809-df16276aaf78	SM	SMR	674	San Marino 	San Marino	\N
00040000-55dd-9c4b-e642-a7e5e667d8f1	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55dd-9c4b-0f42-398439b4b549	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55dd-9c4b-7e76-3dcca09ffd0c	SN	SEN	686	Senegal 	Senegal	\N
00040000-55dd-9c4b-eb0e-bd2b0d14bf65	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55dd-9c4b-1667-4b44af568e28	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55dd-9c4b-0660-b8f1eaa053cb	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55dd-9c4b-4aa1-9e489875b466	SG	SGP	702	Singapore 	Singapur	\N
00040000-55dd-9c4b-918c-063d5f8cf8fc	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55dd-9c4b-590d-b30d0972084f	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55dd-9c4b-ed27-aefcdc1800c9	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55dd-9c4b-ff01-8526156cd7e3	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55dd-9c4b-0c4f-2015674a6c4f	SO	SOM	706	Somalia 	Somalija	\N
00040000-55dd-9c4b-14a1-25f42f8047b6	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55dd-9c4b-33db-ba92e06c9f7d	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55dd-9c4b-9343-4a14565a2d14	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55dd-9c4b-b739-8a8ccee45b8c	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55dd-9c4b-a187-64a078f72add	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55dd-9c4b-5e42-20e639c3627a	SD	SDN	729	Sudan 	Sudan	\N
00040000-55dd-9c4b-2379-36bfe5cf2423	SR	SUR	740	Suriname 	Surinam	\N
00040000-55dd-9c4b-e69f-75bcdce120c4	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55dd-9c4b-7374-892887c38347	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55dd-9c4b-6f83-f83bf319c473	SE	SWE	752	Sweden 	Švedska	\N
00040000-55dd-9c4b-f023-24540b21c5d6	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55dd-9c4b-fb6f-a92a44ba454f	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55dd-9c4b-e667-492a1fccc35f	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55dd-9c4b-1761-c86ced45fc65	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55dd-9c4b-4d7d-3b17d639d02f	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55dd-9c4b-0767-69af6c694e25	TH	THA	764	Thailand 	Tajska	\N
00040000-55dd-9c4b-90ef-91a7cc2e9692	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55dd-9c4b-0a9d-dd9863a4cbad	TG	TGO	768	Togo 	Togo	\N
00040000-55dd-9c4b-17ec-2e6876eefd83	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55dd-9c4b-3066-4d27f14c5a25	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55dd-9c4b-6af0-23ed0b959fcc	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55dd-9c4b-6eab-7a4b27c72fb8	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55dd-9c4b-e5e7-1e9a82c1c433	TR	TUR	792	Turkey 	Turčija	\N
00040000-55dd-9c4b-3eb8-771fbf1a3433	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55dd-9c4b-a1b1-1e6feb338203	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55dd-9c4b-d6e9-07623c5c8175	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55dd-9c4b-6769-138f3dc71750	UG	UGA	800	Uganda 	Uganda	\N
00040000-55dd-9c4b-ac0f-3493dd5d362e	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55dd-9c4b-cb38-0c5bce9ed4ed	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55dd-9c4b-562b-f4ca761687cd	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55dd-9c4b-fd40-899afe16798b	US	USA	840	United States 	Združene države Amerike	\N
00040000-55dd-9c4b-1b42-006a2e465599	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55dd-9c4b-2ef7-9da6df58aa41	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55dd-9c4b-68cb-6615a383d467	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55dd-9c4b-7e0c-c243d9ed61fb	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55dd-9c4b-eb57-80389a1a96af	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55dd-9c4b-81d4-5fa9eaf298da	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55dd-9c4b-f077-10fade686d94	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55dd-9c4b-1484-556c10eaf265	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55dd-9c4b-bfd2-93d4eb2028cb	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55dd-9c4b-167b-ca91b8758185	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55dd-9c4b-1717-a440010a2c0a	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55dd-9c4b-e5d4-8e5bbc41a33f	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55dd-9c4b-d4df-82532e42ef40	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2956 (class 0 OID 15619264)
-- Dependencies: 224
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55dd-9c4c-8aa8-056a3959a2c5	000e0000-55dd-9c4c-de90-d9598a10b56a	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55dd-9c4a-65fa-bfba7e9fa95b	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55dd-9c4c-fe4d-a838f3a670b7	000e0000-55dd-9c4c-651c-3aaecbf3ac4a	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55dd-9c4a-0bb2-d3869704f50e	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55dd-9c4c-0e42-fe442812f235	000e0000-55dd-9c4c-8bd5-1694d74e4e4c	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55dd-9c4a-65fa-bfba7e9fa95b	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55dd-9c4c-864b-826e181f2c65	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55dd-9c4c-1d7c-2f25c7d605d8	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2942 (class 0 OID 15619081)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55dd-9c4c-01b3-fa0dd264d416	000e0000-55dd-9c4c-651c-3aaecbf3ac4a	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55dd-9c4a-bff3-feea6311a8e2
000d0000-55dd-9c4c-cc69-2747abfdb190	000e0000-55dd-9c4c-651c-3aaecbf3ac4a	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55dd-9c4a-bff3-feea6311a8e2
000d0000-55dd-9c4c-93f8-3dfe225ef1f9	000e0000-55dd-9c4c-651c-3aaecbf3ac4a	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55dd-9c4a-1d0c-d1a2cfc6cf1c
000d0000-55dd-9c4c-68b1-fd2c44a50c6f	000e0000-55dd-9c4c-651c-3aaecbf3ac4a	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55dd-9c4a-59d7-f7a896025b9f
000d0000-55dd-9c4c-cb9e-0ccc2ff97a31	000e0000-55dd-9c4c-651c-3aaecbf3ac4a	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55dd-9c4a-9d62-b9fafe3482fd
000d0000-55dd-9c4c-eb56-8fad464fc13f	000e0000-55dd-9c4c-651c-3aaecbf3ac4a	\N	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55dd-9c4a-9d62-b9fafe3482fd
000d0000-55dd-9c4c-e7d0-b03f17531b15	000e0000-55dd-9c4c-651c-3aaecbf3ac4a	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55dd-9c4a-bff3-feea6311a8e2
000d0000-55dd-9c4c-a6e1-f6891b18fc90	000e0000-55dd-9c4c-651c-3aaecbf3ac4a	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55dd-9c4a-2188-87cb398d8f6f
\.


--
-- TOC entry 2921 (class 0 OID 15618895)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2925 (class 0 OID 15618943)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2919 (class 0 OID 15618875)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55dd-9c4c-b9ff-1136c7cf0f52	00080000-55dd-9c4c-27da-8e526173a2b7	00090000-55dd-9c4c-8ebb-a90941a09181	AK		
\.


--
-- TOC entry 2931 (class 0 OID 15618996)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 15619481)
-- Dependencies: 237
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 15619493)
-- Dependencies: 238
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 15619515)
-- Dependencies: 240
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 15619021)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 15618832)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55dd-9c4b-0dc7-56a9f98a48e7	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55dd-9c4b-c21e-1f01c58fb688	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55dd-9c4b-5278-545abed2fed5	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55dd-9c4b-1aa0-d597952e01d4	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55dd-9c4b-c234-32c9be881040	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55dd-9c4b-954c-0e8d3abe7b62	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55dd-9c4b-4bb5-3113d66855c5	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55dd-9c4b-cdaa-c1635fc3f26d	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55dd-9c4b-a9b6-ee5463bb3d2b	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55dd-9c4b-a170-f9a97ec21f11	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55dd-9c4b-24c1-1c6d35ac378b	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55dd-9c4b-5ff5-264e410f209b	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55dd-9c4b-6d0c-dc0b10ec9241	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55dd-9c4c-900d-392316a09611	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55dd-9c4c-0e1e-b626175b2fbf	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55dd-9c4c-9c81-08e3c9b9a705	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55dd-9c4c-b484-fabd8a557d61	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55dd-9c4c-679a-ecb7495f9ccf	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55dd-9c4d-ca68-d63f74cf0f45	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2910 (class 0 OID 15618746)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55dd-9c4c-aa1c-8d0b6e620734	00000000-55dd-9c4c-900d-392316a09611	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55dd-9c4c-9ece-b91c9e7e3b49	00000000-55dd-9c4c-900d-392316a09611	00010000-55dd-9c4b-ffc2-97d7755907f0	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55dd-9c4c-36fd-204076b6fca1	00000000-55dd-9c4c-0e1e-b626175b2fbf	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2911 (class 0 OID 15618757)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55dd-9c4c-140f-cbb6dc445f57	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55dd-9c4c-ef76-ee4e75bc070d	00010000-55dd-9c4c-7c2f-19636aae4a66	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55dd-9c4c-e37c-3b9d6276ddaf	00010000-55dd-9c4c-bcaa-a3475ea6d07e	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55dd-9c4c-17a4-28734af8fc43	00010000-55dd-9c4c-9c80-b28642161f76	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55dd-9c4c-3be7-bc4d164be8ce	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55dd-9c4c-4b66-9ca20d3b9c42	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55dd-9c4c-5ecb-62cf77bbb458	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55dd-9c4c-d1a2-cfcd755222c4	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55dd-9c4c-8ebb-a90941a09181	00010000-55dd-9c4c-8063-d0b6f25168f1	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55dd-9c4c-4b4f-ec087d16ecff	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55dd-9c4c-8f05-30735312c203	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55dd-9c4c-bebb-8f3868716818	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55dd-9c4c-9994-040f1135f59b	00010000-55dd-9c4c-0838-3541809ee009	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2906 (class 0 OID 15618711)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55dd-9c4b-2807-4d3acfae529d	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55dd-9c4b-8562-ff4fb35c8f6a	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55dd-9c4b-6500-d59b2e3dab2f	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55dd-9c4b-2c12-eb858353d62e	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55dd-9c4b-0a08-b18e9182b44d	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55dd-9c4b-93c5-4375f58310ff	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55dd-9c4b-058c-160c14538336	Abonma-read	Abonma - branje	f
00030000-55dd-9c4b-ca4c-bac1e966af84	Abonma-write	Abonma - spreminjanje	f
00030000-55dd-9c4b-9698-fa2c625cc936	Alternacija-read	Alternacija - branje	f
00030000-55dd-9c4b-b41e-72f404a73f4c	Alternacija-write	Alternacija - spreminjanje	f
00030000-55dd-9c4b-7f7d-7ac23bba85b8	Arhivalija-read	Arhivalija - branje	f
00030000-55dd-9c4b-6e43-cd2beba65b1f	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55dd-9c4b-e7b8-3ceb22cbd3fa	Besedilo-read	Besedilo - branje	f
00030000-55dd-9c4b-06a1-e7283a2648a2	Besedilo-write	Besedilo - spreminjanje	f
00030000-55dd-9c4b-5ab7-3a50b1895f74	DogodekIzven-read	DogodekIzven - branje	f
00030000-55dd-9c4b-aee0-a5f8de22e0bc	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55dd-9c4b-eaf6-753fb4e008d1	Dogodek-read	Dogodek - branje	f
00030000-55dd-9c4b-b3ba-cfd60ac8873c	Dogodek-write	Dogodek - spreminjanje	f
00030000-55dd-9c4b-f2c9-9f5857400b20	DrugiVir-read	DrugiVir - branje	f
00030000-55dd-9c4b-f8f7-766a4a3ecd79	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55dd-9c4b-62cd-94d1cc54386e	Drzava-read	Drzava - branje	f
00030000-55dd-9c4b-c273-fedda1db412f	Drzava-write	Drzava - spreminjanje	f
00030000-55dd-9c4b-6ec4-7b0013b53889	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55dd-9c4b-441d-40d723fca0c6	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55dd-9c4b-82cc-ce6e10dfcc98	Funkcija-read	Funkcija - branje	f
00030000-55dd-9c4b-6428-a0e4b9382f91	Funkcija-write	Funkcija - spreminjanje	f
00030000-55dd-9c4b-c7aa-6a8ec5f28ba8	Gostovanje-read	Gostovanje - branje	f
00030000-55dd-9c4b-4bd1-4004423d8ddc	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55dd-9c4b-d85a-980acea0c320	Gostujoca-read	Gostujoca - branje	f
00030000-55dd-9c4b-9fca-ede7123bc900	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55dd-9c4b-fbb0-cb67c4149824	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55dd-9c4b-d9be-ab9ae8780ddf	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55dd-9c4b-a208-20a6f2e8060c	Kupec-read	Kupec - branje	f
00030000-55dd-9c4b-4dbd-3782cc6873d0	Kupec-write	Kupec - spreminjanje	f
00030000-55dd-9c4b-f231-fefd31a72877	NacinPlacina-read	NacinPlacina - branje	f
00030000-55dd-9c4b-6cd2-b58f2458400e	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55dd-9c4b-c2bf-df703f7dd78c	Option-read	Option - branje	f
00030000-55dd-9c4b-d48a-ed3e033b055e	Option-write	Option - spreminjanje	f
00030000-55dd-9c4b-0c4a-8b855a548ef3	OptionValue-read	OptionValue - branje	f
00030000-55dd-9c4b-56a4-4582445aa3d8	OptionValue-write	OptionValue - spreminjanje	f
00030000-55dd-9c4b-b9c0-e0c784c6b04d	Oseba-read	Oseba - branje	f
00030000-55dd-9c4b-bbeb-c7b3ed080805	Oseba-write	Oseba - spreminjanje	f
00030000-55dd-9c4b-c0e1-c505f09c7fbd	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55dd-9c4b-1162-47f9f1c8bccc	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55dd-9c4b-c76c-3401abfae51e	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55dd-9c4b-c551-ce8188a717c5	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55dd-9c4b-d6de-0dbe0c8f877e	Pogodba-read	Pogodba - branje	f
00030000-55dd-9c4b-b136-c05006d8e3a0	Pogodba-write	Pogodba - spreminjanje	f
00030000-55dd-9c4b-b444-3367e07ec9a3	Popa-read	Popa - branje	f
00030000-55dd-9c4b-c05d-3f8bb8f11e27	Popa-write	Popa - spreminjanje	f
00030000-55dd-9c4b-a6fa-42b2e6b4db9c	Posta-read	Posta - branje	f
00030000-55dd-9c4b-c1de-353a03fdff7e	Posta-write	Posta - spreminjanje	f
00030000-55dd-9c4b-a068-9e5747f419f5	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55dd-9c4b-b2b0-cc67511b32d7	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55dd-9c4b-40c1-ce6e8148cd74	PostniNaslov-read	PostniNaslov - branje	f
00030000-55dd-9c4b-fec5-6637ea1daf4a	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55dd-9c4b-17e4-d208d132d8c7	Predstava-read	Predstava - branje	f
00030000-55dd-9c4b-beeb-6e2ba4a28117	Predstava-write	Predstava - spreminjanje	f
00030000-55dd-9c4b-811b-4ad8441dc261	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55dd-9c4b-fa4f-9ceab72a8673	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55dd-9c4b-55fb-28c3e7fe375c	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55dd-9c4b-65ce-7fbba315fce1	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55dd-9c4b-cdab-74280b90e9e3	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55dd-9c4b-f6c7-537da85d1f15	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55dd-9c4b-fac0-ba98ac841da5	ProgramDela-read	ProgramDela - branje	f
00030000-55dd-9c4b-2ae3-b93a12d8e1a7	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55dd-9c4b-28b9-bd984659a9ac	ProgramFestival-read	ProgramFestival - branje	f
00030000-55dd-9c4b-26cd-2e142a5e1dad	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55dd-9c4b-3f9f-c6558f14c327	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55dd-9c4b-2b43-58b389f54ae2	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55dd-9c4b-3d58-3052af2c5ddc	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55dd-9c4b-6c46-995873359688	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55dd-9c4b-9131-11d939217fb8	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55dd-9c4b-e243-30431e8cdc62	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55dd-9c4b-4564-12c3a824e7a8	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55dd-9c4b-d7ca-dc8b21c1a84f	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55dd-9c4b-2b8d-e0b3df563278	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55dd-9c4b-c91a-292ed13a8789	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55dd-9c4b-22fd-10a9a08bf1e6	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55dd-9c4b-63ae-e5ee63b91e0a	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55dd-9c4b-317f-bf7a6dbabbfc	ProgramRazno-read	ProgramRazno - branje	f
00030000-55dd-9c4b-f59d-8ecfac44088a	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55dd-9c4b-9ae4-0cfe1740d924	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55dd-9c4b-163c-2f35daa127d6	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55dd-9c4b-cf7b-902703e541d7	Prostor-read	Prostor - branje	f
00030000-55dd-9c4b-a492-72cc084d5fed	Prostor-write	Prostor - spreminjanje	f
00030000-55dd-9c4b-3dc3-1f26c54835f0	Racun-read	Racun - branje	f
00030000-55dd-9c4b-66a2-2edad433677a	Racun-write	Racun - spreminjanje	f
00030000-55dd-9c4b-7853-0898bace3f18	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55dd-9c4b-7c6d-1c3bf63c5849	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55dd-9c4b-ea94-cc2b72dd6f6a	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55dd-9c4b-05d5-687a1a005380	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55dd-9c4b-17a1-29f233566068	Rekvizit-read	Rekvizit - branje	f
00030000-55dd-9c4b-3fa4-a525984bba36	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55dd-9c4b-9a36-253d582c4a44	Revizija-read	Revizija - branje	f
00030000-55dd-9c4b-7593-d4ce7d2d5ab4	Revizija-write	Revizija - spreminjanje	f
00030000-55dd-9c4b-be5b-3d125cc39ea7	Rezervacija-read	Rezervacija - branje	f
00030000-55dd-9c4b-bd47-1f1bae92ff77	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55dd-9c4b-3ff5-19fde3f5e603	SedezniRed-read	SedezniRed - branje	f
00030000-55dd-9c4b-ebd9-577f8822671d	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55dd-9c4b-83a3-73e8e80ca5ed	Sedez-read	Sedez - branje	f
00030000-55dd-9c4b-565b-780a77dc4131	Sedez-write	Sedez - spreminjanje	f
00030000-55dd-9c4b-cd5f-437a535d639c	Sezona-read	Sezona - branje	f
00030000-55dd-9c4b-08d8-60d2688cd125	Sezona-write	Sezona - spreminjanje	f
00030000-55dd-9c4b-6f1a-9119a45c4c28	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55dd-9c4b-cf89-2f83d2b8eba6	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55dd-9c4b-000f-5e15b51dc30f	Stevilcenje-read	Stevilcenje - branje	f
00030000-55dd-9c4b-c1b3-6739ce4af7e0	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55dd-9c4b-dbfc-3b07605e0fc0	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55dd-9c4b-bc70-c067e7ad239f	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55dd-9c4b-05e1-87836d27813e	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55dd-9c4b-6671-f88e45dc9b38	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55dd-9c4b-c9f4-e25887cb971b	Telefonska-read	Telefonska - branje	f
00030000-55dd-9c4b-2b33-37f3276772ca	Telefonska-write	Telefonska - spreminjanje	f
00030000-55dd-9c4b-d9e9-e5dd928b89aa	TerminStoritve-read	TerminStoritve - branje	f
00030000-55dd-9c4b-2d1f-57cb9af48d39	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55dd-9c4b-2f83-be519224f703	TipFunkcije-read	TipFunkcije - branje	f
00030000-55dd-9c4b-2a03-31d90c89758a	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55dd-9c4b-8830-15de91537404	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55dd-9c4b-0968-1aae23395774	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55dd-9c4b-a402-732277040c7b	Trr-read	Trr - branje	f
00030000-55dd-9c4b-d70f-88fd3f3cbfd7	Trr-write	Trr - spreminjanje	f
00030000-55dd-9c4b-9f28-252d3240f183	Uprizoritev-read	Uprizoritev - branje	f
00030000-55dd-9c4b-af28-bfcb70e04b88	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55dd-9c4b-f66f-0c6ad941ef1b	Vaja-read	Vaja - branje	f
00030000-55dd-9c4b-0725-a5afe6e4ef67	Vaja-write	Vaja - spreminjanje	f
00030000-55dd-9c4b-18f2-5e18e07fcfe5	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55dd-9c4b-49ee-e43210e2052f	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55dd-9c4b-e51d-98bb8173e59a	VrstaStroska-read	VrstaStroska - branje	f
00030000-55dd-9c4b-ad6d-53b61770b7b1	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55dd-9c4b-b440-d2641ff30543	Zaposlitev-read	Zaposlitev - branje	f
00030000-55dd-9c4b-fc36-c7344c1f4df0	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55dd-9c4b-a25c-5e4718b8e5b8	Zasedenost-read	Zasedenost - branje	f
00030000-55dd-9c4b-d0b8-c20bd929d968	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55dd-9c4b-fb51-5f9639bb2daf	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55dd-9c4b-ca81-58c2ae67fc22	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55dd-9c4b-6fe1-a51d35dc47bc	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55dd-9c4b-24fb-c593501accdb	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55dd-9c4b-7a23-d5d09228c6cd	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55dd-9c4b-6e4b-d5348dbd75c1	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55dd-9c4b-56dd-980e83c4b663	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55dd-9c4b-e4b1-23a576af18f1	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55dd-9c4b-2633-72020453e7cd	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55dd-9c4b-7c1e-5fab222debad	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55dd-9c4b-b43c-42fba4719d13	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55dd-9c4b-248b-f36e56b5477e	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55dd-9c4b-b225-835d6b552191	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55dd-9c4b-c8d5-a91b89448774	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55dd-9c4b-3549-15e5e75fce03	Datoteka-write	Datoteka - spreminjanje	f
00030000-55dd-9c4b-2260-f95ae38217e8	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2908 (class 0 OID 15618730)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55dd-9c4b-e796-1477ba465607	00030000-55dd-9c4b-8562-ff4fb35c8f6a
00020000-55dd-9c4b-72c6-1d06645feb2c	00030000-55dd-9c4b-62cd-94d1cc54386e
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-058c-160c14538336
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-ca4c-bac1e966af84
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-9698-fa2c625cc936
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-b41e-72f404a73f4c
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-7f7d-7ac23bba85b8
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-eaf6-753fb4e008d1
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-2c12-eb858353d62e
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-b3ba-cfd60ac8873c
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-62cd-94d1cc54386e
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-c273-fedda1db412f
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-82cc-ce6e10dfcc98
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-6428-a0e4b9382f91
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-c7aa-6a8ec5f28ba8
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-4bd1-4004423d8ddc
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-d85a-980acea0c320
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-9fca-ede7123bc900
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-fbb0-cb67c4149824
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-d9be-ab9ae8780ddf
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-c2bf-df703f7dd78c
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-0c4a-8b855a548ef3
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-b9c0-e0c784c6b04d
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-bbeb-c7b3ed080805
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-b444-3367e07ec9a3
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-c05d-3f8bb8f11e27
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-a6fa-42b2e6b4db9c
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-c1de-353a03fdff7e
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-40c1-ce6e8148cd74
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-fec5-6637ea1daf4a
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-17e4-d208d132d8c7
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-beeb-6e2ba4a28117
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-cdab-74280b90e9e3
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-f6c7-537da85d1f15
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-cf7b-902703e541d7
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-a492-72cc084d5fed
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-ea94-cc2b72dd6f6a
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-05d5-687a1a005380
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-17a1-29f233566068
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-3fa4-a525984bba36
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-cd5f-437a535d639c
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-08d8-60d2688cd125
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-2f83-be519224f703
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-9f28-252d3240f183
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-af28-bfcb70e04b88
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-f66f-0c6ad941ef1b
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-0725-a5afe6e4ef67
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-a25c-5e4718b8e5b8
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-d0b8-c20bd929d968
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-fb51-5f9639bb2daf
00020000-55dd-9c4b-6376-dcc820557b0c	00030000-55dd-9c4b-6fe1-a51d35dc47bc
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-058c-160c14538336
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-7f7d-7ac23bba85b8
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-eaf6-753fb4e008d1
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-62cd-94d1cc54386e
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-c7aa-6a8ec5f28ba8
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-d85a-980acea0c320
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-fbb0-cb67c4149824
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-d9be-ab9ae8780ddf
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-c2bf-df703f7dd78c
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-0c4a-8b855a548ef3
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-b9c0-e0c784c6b04d
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-bbeb-c7b3ed080805
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-b444-3367e07ec9a3
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-a6fa-42b2e6b4db9c
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-40c1-ce6e8148cd74
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-fec5-6637ea1daf4a
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-17e4-d208d132d8c7
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-cf7b-902703e541d7
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-ea94-cc2b72dd6f6a
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-17a1-29f233566068
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-cd5f-437a535d639c
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-c9f4-e25887cb971b
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-2b33-37f3276772ca
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-a402-732277040c7b
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-d70f-88fd3f3cbfd7
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-b440-d2641ff30543
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-fc36-c7344c1f4df0
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-fb51-5f9639bb2daf
00020000-55dd-9c4b-8ed9-97d21733e5fa	00030000-55dd-9c4b-6fe1-a51d35dc47bc
00020000-55dd-9c4b-ad66-f4924532da86	00030000-55dd-9c4b-058c-160c14538336
00020000-55dd-9c4b-ad66-f4924532da86	00030000-55dd-9c4b-9698-fa2c625cc936
00020000-55dd-9c4b-ad66-f4924532da86	00030000-55dd-9c4b-7f7d-7ac23bba85b8
00020000-55dd-9c4b-ad66-f4924532da86	00030000-55dd-9c4b-6e43-cd2beba65b1f
00020000-55dd-9c4b-ad66-f4924532da86	00030000-55dd-9c4b-e7b8-3ceb22cbd3fa
00020000-55dd-9c4b-ad66-f4924532da86	00030000-55dd-9c4b-5ab7-3a50b1895f74
00020000-55dd-9c4b-ad66-f4924532da86	00030000-55dd-9c4b-eaf6-753fb4e008d1
00020000-55dd-9c4b-ad66-f4924532da86	00030000-55dd-9c4b-62cd-94d1cc54386e
00020000-55dd-9c4b-ad66-f4924532da86	00030000-55dd-9c4b-82cc-ce6e10dfcc98
00020000-55dd-9c4b-ad66-f4924532da86	00030000-55dd-9c4b-c7aa-6a8ec5f28ba8
00020000-55dd-9c4b-ad66-f4924532da86	00030000-55dd-9c4b-d85a-980acea0c320
00020000-55dd-9c4b-ad66-f4924532da86	00030000-55dd-9c4b-fbb0-cb67c4149824
00020000-55dd-9c4b-ad66-f4924532da86	00030000-55dd-9c4b-c2bf-df703f7dd78c
00020000-55dd-9c4b-ad66-f4924532da86	00030000-55dd-9c4b-0c4a-8b855a548ef3
00020000-55dd-9c4b-ad66-f4924532da86	00030000-55dd-9c4b-b9c0-e0c784c6b04d
00020000-55dd-9c4b-ad66-f4924532da86	00030000-55dd-9c4b-b444-3367e07ec9a3
00020000-55dd-9c4b-ad66-f4924532da86	00030000-55dd-9c4b-a6fa-42b2e6b4db9c
00020000-55dd-9c4b-ad66-f4924532da86	00030000-55dd-9c4b-17e4-d208d132d8c7
00020000-55dd-9c4b-ad66-f4924532da86	00030000-55dd-9c4b-cdab-74280b90e9e3
00020000-55dd-9c4b-ad66-f4924532da86	00030000-55dd-9c4b-cf7b-902703e541d7
00020000-55dd-9c4b-ad66-f4924532da86	00030000-55dd-9c4b-ea94-cc2b72dd6f6a
00020000-55dd-9c4b-ad66-f4924532da86	00030000-55dd-9c4b-17a1-29f233566068
00020000-55dd-9c4b-ad66-f4924532da86	00030000-55dd-9c4b-cd5f-437a535d639c
00020000-55dd-9c4b-ad66-f4924532da86	00030000-55dd-9c4b-2f83-be519224f703
00020000-55dd-9c4b-ad66-f4924532da86	00030000-55dd-9c4b-f66f-0c6ad941ef1b
00020000-55dd-9c4b-ad66-f4924532da86	00030000-55dd-9c4b-a25c-5e4718b8e5b8
00020000-55dd-9c4b-ad66-f4924532da86	00030000-55dd-9c4b-fb51-5f9639bb2daf
00020000-55dd-9c4b-ad66-f4924532da86	00030000-55dd-9c4b-6fe1-a51d35dc47bc
00020000-55dd-9c4b-7dea-f32dd2315218	00030000-55dd-9c4b-058c-160c14538336
00020000-55dd-9c4b-7dea-f32dd2315218	00030000-55dd-9c4b-ca4c-bac1e966af84
00020000-55dd-9c4b-7dea-f32dd2315218	00030000-55dd-9c4b-b41e-72f404a73f4c
00020000-55dd-9c4b-7dea-f32dd2315218	00030000-55dd-9c4b-7f7d-7ac23bba85b8
00020000-55dd-9c4b-7dea-f32dd2315218	00030000-55dd-9c4b-eaf6-753fb4e008d1
00020000-55dd-9c4b-7dea-f32dd2315218	00030000-55dd-9c4b-62cd-94d1cc54386e
00020000-55dd-9c4b-7dea-f32dd2315218	00030000-55dd-9c4b-c7aa-6a8ec5f28ba8
00020000-55dd-9c4b-7dea-f32dd2315218	00030000-55dd-9c4b-d85a-980acea0c320
00020000-55dd-9c4b-7dea-f32dd2315218	00030000-55dd-9c4b-c2bf-df703f7dd78c
00020000-55dd-9c4b-7dea-f32dd2315218	00030000-55dd-9c4b-0c4a-8b855a548ef3
00020000-55dd-9c4b-7dea-f32dd2315218	00030000-55dd-9c4b-b444-3367e07ec9a3
00020000-55dd-9c4b-7dea-f32dd2315218	00030000-55dd-9c4b-a6fa-42b2e6b4db9c
00020000-55dd-9c4b-7dea-f32dd2315218	00030000-55dd-9c4b-17e4-d208d132d8c7
00020000-55dd-9c4b-7dea-f32dd2315218	00030000-55dd-9c4b-cf7b-902703e541d7
00020000-55dd-9c4b-7dea-f32dd2315218	00030000-55dd-9c4b-ea94-cc2b72dd6f6a
00020000-55dd-9c4b-7dea-f32dd2315218	00030000-55dd-9c4b-17a1-29f233566068
00020000-55dd-9c4b-7dea-f32dd2315218	00030000-55dd-9c4b-cd5f-437a535d639c
00020000-55dd-9c4b-7dea-f32dd2315218	00030000-55dd-9c4b-2f83-be519224f703
00020000-55dd-9c4b-7dea-f32dd2315218	00030000-55dd-9c4b-fb51-5f9639bb2daf
00020000-55dd-9c4b-7dea-f32dd2315218	00030000-55dd-9c4b-6fe1-a51d35dc47bc
00020000-55dd-9c4b-aceb-526dea3012d2	00030000-55dd-9c4b-058c-160c14538336
00020000-55dd-9c4b-aceb-526dea3012d2	00030000-55dd-9c4b-7f7d-7ac23bba85b8
00020000-55dd-9c4b-aceb-526dea3012d2	00030000-55dd-9c4b-eaf6-753fb4e008d1
00020000-55dd-9c4b-aceb-526dea3012d2	00030000-55dd-9c4b-62cd-94d1cc54386e
00020000-55dd-9c4b-aceb-526dea3012d2	00030000-55dd-9c4b-c7aa-6a8ec5f28ba8
00020000-55dd-9c4b-aceb-526dea3012d2	00030000-55dd-9c4b-d85a-980acea0c320
00020000-55dd-9c4b-aceb-526dea3012d2	00030000-55dd-9c4b-c2bf-df703f7dd78c
00020000-55dd-9c4b-aceb-526dea3012d2	00030000-55dd-9c4b-0c4a-8b855a548ef3
00020000-55dd-9c4b-aceb-526dea3012d2	00030000-55dd-9c4b-b444-3367e07ec9a3
00020000-55dd-9c4b-aceb-526dea3012d2	00030000-55dd-9c4b-a6fa-42b2e6b4db9c
00020000-55dd-9c4b-aceb-526dea3012d2	00030000-55dd-9c4b-17e4-d208d132d8c7
00020000-55dd-9c4b-aceb-526dea3012d2	00030000-55dd-9c4b-cf7b-902703e541d7
00020000-55dd-9c4b-aceb-526dea3012d2	00030000-55dd-9c4b-ea94-cc2b72dd6f6a
00020000-55dd-9c4b-aceb-526dea3012d2	00030000-55dd-9c4b-17a1-29f233566068
00020000-55dd-9c4b-aceb-526dea3012d2	00030000-55dd-9c4b-cd5f-437a535d639c
00020000-55dd-9c4b-aceb-526dea3012d2	00030000-55dd-9c4b-d9e9-e5dd928b89aa
00020000-55dd-9c4b-aceb-526dea3012d2	00030000-55dd-9c4b-6500-d59b2e3dab2f
00020000-55dd-9c4b-aceb-526dea3012d2	00030000-55dd-9c4b-2f83-be519224f703
00020000-55dd-9c4b-aceb-526dea3012d2	00030000-55dd-9c4b-fb51-5f9639bb2daf
00020000-55dd-9c4b-aceb-526dea3012d2	00030000-55dd-9c4b-6fe1-a51d35dc47bc
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-2807-4d3acfae529d
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-8562-ff4fb35c8f6a
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-6500-d59b2e3dab2f
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-2c12-eb858353d62e
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-0a08-b18e9182b44d
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-93c5-4375f58310ff
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-058c-160c14538336
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-ca4c-bac1e966af84
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-9698-fa2c625cc936
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-b41e-72f404a73f4c
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-7f7d-7ac23bba85b8
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-6e43-cd2beba65b1f
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-e7b8-3ceb22cbd3fa
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-06a1-e7283a2648a2
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-5ab7-3a50b1895f74
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-aee0-a5f8de22e0bc
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-eaf6-753fb4e008d1
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-b3ba-cfd60ac8873c
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-62cd-94d1cc54386e
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-c273-fedda1db412f
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-f2c9-9f5857400b20
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-f8f7-766a4a3ecd79
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-6ec4-7b0013b53889
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-441d-40d723fca0c6
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-82cc-ce6e10dfcc98
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-6428-a0e4b9382f91
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-c7aa-6a8ec5f28ba8
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-4bd1-4004423d8ddc
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-d85a-980acea0c320
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-9fca-ede7123bc900
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-fbb0-cb67c4149824
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-d9be-ab9ae8780ddf
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-a208-20a6f2e8060c
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-4dbd-3782cc6873d0
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-f231-fefd31a72877
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-6cd2-b58f2458400e
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-c2bf-df703f7dd78c
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-d48a-ed3e033b055e
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-0c4a-8b855a548ef3
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-56a4-4582445aa3d8
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-b9c0-e0c784c6b04d
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-bbeb-c7b3ed080805
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-c0e1-c505f09c7fbd
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-1162-47f9f1c8bccc
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-c76c-3401abfae51e
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-c551-ce8188a717c5
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-d6de-0dbe0c8f877e
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-b136-c05006d8e3a0
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-b444-3367e07ec9a3
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-c05d-3f8bb8f11e27
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-a6fa-42b2e6b4db9c
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-c1de-353a03fdff7e
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-a068-9e5747f419f5
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-b2b0-cc67511b32d7
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-40c1-ce6e8148cd74
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-fec5-6637ea1daf4a
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-17e4-d208d132d8c7
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-beeb-6e2ba4a28117
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-811b-4ad8441dc261
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-fa4f-9ceab72a8673
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-55fb-28c3e7fe375c
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-65ce-7fbba315fce1
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-cdab-74280b90e9e3
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-f6c7-537da85d1f15
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-fac0-ba98ac841da5
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-2ae3-b93a12d8e1a7
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-28b9-bd984659a9ac
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-26cd-2e142a5e1dad
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-3f9f-c6558f14c327
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-2b43-58b389f54ae2
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-3d58-3052af2c5ddc
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-6c46-995873359688
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-9131-11d939217fb8
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-e243-30431e8cdc62
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-4564-12c3a824e7a8
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-d7ca-dc8b21c1a84f
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-2b8d-e0b3df563278
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-c91a-292ed13a8789
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-22fd-10a9a08bf1e6
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-63ae-e5ee63b91e0a
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-317f-bf7a6dbabbfc
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-f59d-8ecfac44088a
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-9ae4-0cfe1740d924
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-163c-2f35daa127d6
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-cf7b-902703e541d7
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-a492-72cc084d5fed
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-3dc3-1f26c54835f0
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-66a2-2edad433677a
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-7853-0898bace3f18
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-7c6d-1c3bf63c5849
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-ea94-cc2b72dd6f6a
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-05d5-687a1a005380
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-17a1-29f233566068
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-3fa4-a525984bba36
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-9a36-253d582c4a44
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-7593-d4ce7d2d5ab4
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-be5b-3d125cc39ea7
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-bd47-1f1bae92ff77
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-3ff5-19fde3f5e603
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-ebd9-577f8822671d
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-83a3-73e8e80ca5ed
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-565b-780a77dc4131
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-cd5f-437a535d639c
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-08d8-60d2688cd125
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-6f1a-9119a45c4c28
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-cf89-2f83d2b8eba6
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-000f-5e15b51dc30f
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-c1b3-6739ce4af7e0
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-dbfc-3b07605e0fc0
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-bc70-c067e7ad239f
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-05e1-87836d27813e
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-6671-f88e45dc9b38
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-c9f4-e25887cb971b
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-2b33-37f3276772ca
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-d9e9-e5dd928b89aa
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-2d1f-57cb9af48d39
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-2f83-be519224f703
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-2a03-31d90c89758a
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-8830-15de91537404
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-0968-1aae23395774
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-a402-732277040c7b
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-d70f-88fd3f3cbfd7
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-9f28-252d3240f183
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-af28-bfcb70e04b88
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-f66f-0c6ad941ef1b
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-0725-a5afe6e4ef67
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-18f2-5e18e07fcfe5
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-49ee-e43210e2052f
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-b440-d2641ff30543
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-fc36-c7344c1f4df0
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-a25c-5e4718b8e5b8
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-d0b8-c20bd929d968
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-fb51-5f9639bb2daf
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-ca81-58c2ae67fc22
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-6fe1-a51d35dc47bc
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	00030000-55dd-9c4b-24fb-c593501accdb
\.


--
-- TOC entry 2936 (class 0 OID 15619028)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 15619061)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 15619185)
-- Dependencies: 219
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55dd-9c4c-988d-f1878e8da246	00090000-55dd-9c4c-140f-cbb6dc445f57	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55dd-9c4c-567b-75157f275485	00090000-55dd-9c4c-4b66-9ca20d3b9c42	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55dd-9c4c-e2ff-ec00fa12752e	00090000-55dd-9c4c-9994-040f1135f59b	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2913 (class 0 OID 15618790)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55dd-9c4c-27da-8e526173a2b7	00040000-55dd-9c4b-ed27-aefcdc1800c9	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-9c4c-cad9-a7178c926235	00040000-55dd-9c4b-ed27-aefcdc1800c9	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55dd-9c4c-caca-8d604651c9bc	00040000-55dd-9c4b-ed27-aefcdc1800c9	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-9c4c-e5d8-c3d258ce5c15	00040000-55dd-9c4b-ed27-aefcdc1800c9	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-9c4c-14d0-cc3d874d782f	00040000-55dd-9c4b-ed27-aefcdc1800c9	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-9c4c-7d73-214448ac7433	00040000-55dd-9c4a-c2aa-9eb102f91b59	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-9c4c-e089-aa32f07c10e2	00040000-55dd-9c4a-18c8-66e4b0c4ccf4	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-9c4c-d28b-e7bdc0a13b98	00040000-55dd-9c4a-5527-babec7f5a5cc	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dd-9c4d-afa7-ca69745f810d	00040000-55dd-9c4b-ed27-aefcdc1800c9	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2915 (class 0 OID 15618824)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55dd-9c4a-6f1a-70a761b51f3c	8341	Adlešiči
00050000-55dd-9c4a-2c30-0dab8f2679b9	5270	Ajdovščina
00050000-55dd-9c4a-a649-25555695b725	6280	Ankaran/Ancarano
00050000-55dd-9c4a-68fe-fe438df25647	9253	Apače
00050000-55dd-9c4a-1e75-72033ebfcc6e	8253	Artiče
00050000-55dd-9c4a-e0f3-df2583c3d015	4275	Begunje na Gorenjskem
00050000-55dd-9c4a-58ae-9d16181a403e	1382	Begunje pri Cerknici
00050000-55dd-9c4a-c061-3bbb738ca4bb	9231	Beltinci
00050000-55dd-9c4a-a37d-0ec7fdd75748	2234	Benedikt
00050000-55dd-9c4a-5725-dba1e6be9dae	2345	Bistrica ob Dravi
00050000-55dd-9c4a-43ed-a6decccece26	3256	Bistrica ob Sotli
00050000-55dd-9c4a-481a-13971e27c0c3	8259	Bizeljsko
00050000-55dd-9c4a-f9a4-28e7a12f45d7	1223	Blagovica
00050000-55dd-9c4a-32ea-9457870c4855	8283	Blanca
00050000-55dd-9c4a-1982-9e26d35108c1	4260	Bled
00050000-55dd-9c4a-8978-84f239d7ca57	4273	Blejska Dobrava
00050000-55dd-9c4a-7106-a9cb2eedf7af	9265	Bodonci
00050000-55dd-9c4a-b12f-e58140a635d2	9222	Bogojina
00050000-55dd-9c4a-7e9c-3a320e5c0458	4263	Bohinjska Bela
00050000-55dd-9c4a-1fe7-f77093f81320	4264	Bohinjska Bistrica
00050000-55dd-9c4a-515d-15d7d176b5e5	4265	Bohinjsko jezero
00050000-55dd-9c4a-c23e-cf345c8ae7e5	1353	Borovnica
00050000-55dd-9c4a-7852-e37524d01f83	8294	Boštanj
00050000-55dd-9c4a-d5dd-7815aa87c4c8	5230	Bovec
00050000-55dd-9c4a-dda1-a2cc437a9239	5295	Branik
00050000-55dd-9c4a-d643-f1636e683ad0	3314	Braslovče
00050000-55dd-9c4a-4f70-0dc4f62ebfd9	5223	Breginj
00050000-55dd-9c4a-4e95-e9cc1657a469	8280	Brestanica
00050000-55dd-9c4a-51c8-4eb844368899	2354	Bresternica
00050000-55dd-9c4a-a2b9-1262ef5fa895	4243	Brezje
00050000-55dd-9c4a-8571-644e5c30ee13	1351	Brezovica pri Ljubljani
00050000-55dd-9c4a-9471-b2615405e2f6	8250	Brežice
00050000-55dd-9c4a-0bb3-b7e8fa5f6397	4210	Brnik - Aerodrom
00050000-55dd-9c4a-40f6-e8d297b20b6e	8321	Brusnice
00050000-55dd-9c4a-4858-16e9f9fe0c1b	3255	Buče
00050000-55dd-9c4a-9f9b-fb75631f47aa	8276	Bučka 
00050000-55dd-9c4a-877e-0ba08bba85c1	9261	Cankova
00050000-55dd-9c4a-3c4c-e27fd726afad	3000	Celje 
00050000-55dd-9c4a-80ee-bc97f93f2114	3001	Celje - poštni predali
00050000-55dd-9c4a-c632-33a8c4c873b9	4207	Cerklje na Gorenjskem
00050000-55dd-9c4a-ffc2-c4a5742a3a66	8263	Cerklje ob Krki
00050000-55dd-9c4a-9075-b1de2b321c1f	1380	Cerknica
00050000-55dd-9c4a-0860-882e25087753	5282	Cerkno
00050000-55dd-9c4a-4c02-4982ff218869	2236	Cerkvenjak
00050000-55dd-9c4a-19fe-a182d63528d1	2215	Ceršak
00050000-55dd-9c4a-936e-1c893b0dc178	2326	Cirkovce
00050000-55dd-9c4a-7a07-934ec09c0213	2282	Cirkulane
00050000-55dd-9c4a-d16c-d86642a376b2	5273	Col
00050000-55dd-9c4a-4c61-795cf4338710	8251	Čatež ob Savi
00050000-55dd-9c4a-5d38-926e125f99ac	1413	Čemšenik
00050000-55dd-9c4a-284c-c6e64c8b3c11	5253	Čepovan
00050000-55dd-9c4a-9cf2-4a1512b1cab7	9232	Črenšovci
00050000-55dd-9c4a-fb5b-2979ae2f0df5	2393	Črna na Koroškem
00050000-55dd-9c4a-1b06-fccaf89693fc	6275	Črni Kal
00050000-55dd-9c4a-4f5a-33c5fec77585	5274	Črni Vrh nad Idrijo
00050000-55dd-9c4a-930e-5e6ba0a6effb	5262	Črniče
00050000-55dd-9c4a-1d18-77250eb74fc4	8340	Črnomelj
00050000-55dd-9c4a-613b-a2b17e06a3ea	6271	Dekani
00050000-55dd-9c4a-2ade-fa86983c60dd	5210	Deskle
00050000-55dd-9c4a-083d-a363af811669	2253	Destrnik
00050000-55dd-9c4a-5d0d-40180eaafd3e	6215	Divača
00050000-55dd-9c4a-f86f-4a30f858a866	1233	Dob
00050000-55dd-9c4a-04e0-01d26c9066ed	3224	Dobje pri Planini
00050000-55dd-9c4a-23dd-fda561c555eb	8257	Dobova
00050000-55dd-9c4a-117d-031b9dab9f99	1423	Dobovec
00050000-55dd-9c4a-c5b8-ff39bc16d43c	5263	Dobravlje
00050000-55dd-9c4a-6450-aaedd981ab5b	3204	Dobrna
00050000-55dd-9c4a-a5ac-f2c24b270115	8211	Dobrnič
00050000-55dd-9c4a-4a94-c403881a21b1	1356	Dobrova
00050000-55dd-9c4a-f74f-ec3c1b37c2f8	9223	Dobrovnik/Dobronak 
00050000-55dd-9c4a-4158-ecc2344ef763	5212	Dobrovo v Brdih
00050000-55dd-9c4a-fae3-549f1d836a1d	1431	Dol pri Hrastniku
00050000-55dd-9c4a-9624-24206bb78531	1262	Dol pri Ljubljani
00050000-55dd-9c4a-3a4f-f15395929c4a	1273	Dole pri Litiji
00050000-55dd-9c4a-e3d3-71a2f091f2f9	1331	Dolenja vas
00050000-55dd-9c4a-a447-2cee23803872	8350	Dolenjske Toplice
00050000-55dd-9c4a-59c9-141a310553b9	1230	Domžale
00050000-55dd-9c4a-975f-18f6b55589a4	2252	Dornava
00050000-55dd-9c4a-4bcd-deb074033182	5294	Dornberk
00050000-55dd-9c4a-33c0-1ff8637efb96	1319	Draga
00050000-55dd-9c4a-d4f2-a60df2751db5	8343	Dragatuš
00050000-55dd-9c4a-d857-a36b5581a207	3222	Dramlje
00050000-55dd-9c4a-c70c-e1f580a8c735	2370	Dravograd
00050000-55dd-9c4a-24f4-b3fb755e9941	4203	Duplje
00050000-55dd-9c4a-88ef-df6b1424c387	6221	Dutovlje
00050000-55dd-9c4a-4169-00ae9794ea90	8361	Dvor
00050000-55dd-9c4a-59e0-da0b2dd9dfbc	2343	Fala
00050000-55dd-9c4a-8d2c-23b9e4c7787e	9208	Fokovci
00050000-55dd-9c4a-e84e-5c93812dfb14	2313	Fram
00050000-55dd-9c4a-7058-447bab05172c	3213	Frankolovo
00050000-55dd-9c4a-d010-c8f44d5f5d65	1274	Gabrovka
00050000-55dd-9c4a-bbca-8146c7a1a0e6	8254	Globoko
00050000-55dd-9c4a-daa2-5f60327c81e7	5275	Godovič
00050000-55dd-9c4a-1d66-67cac4d5c3d3	4204	Golnik
00050000-55dd-9c4a-4ee8-ce60f3e5f7e3	3303	Gomilsko
00050000-55dd-9c4a-d5c2-d151a9d8cdc6	4224	Gorenja vas
00050000-55dd-9c4a-78ec-a4f63d274d4f	3263	Gorica pri Slivnici
00050000-55dd-9c4a-3c90-3a2987a04678	2272	Gorišnica
00050000-55dd-9c4a-964b-0a2615aaf8b5	9250	Gornja Radgona
00050000-55dd-9c4a-9466-1d29193ebe0e	3342	Gornji Grad
00050000-55dd-9c4a-75c0-2efe47c7bd9c	4282	Gozd Martuljek
00050000-55dd-9c4a-3c5f-92bbafeed22f	6272	Gračišče
00050000-55dd-9c4a-714b-29b6b43e1ec9	9264	Grad
00050000-55dd-9c4a-b6fd-d2dddadb64f6	8332	Gradac
00050000-55dd-9c4a-08a8-24fd921bcfc2	1384	Grahovo
00050000-55dd-9c4a-4d0e-f549bcc9afaa	5242	Grahovo ob Bači
00050000-55dd-9c4a-b236-126e39495d03	5251	Grgar
00050000-55dd-9c4a-bf46-4a1c816496a9	3302	Griže
00050000-55dd-9c4a-e97a-d29a8e524f59	3231	Grobelno
00050000-55dd-9c4a-807f-bbb7dc96d28b	1290	Grosuplje
00050000-55dd-9c4a-1dc8-08bce428bec8	2288	Hajdina
00050000-55dd-9c4a-fed3-9d36fc9a66a2	8362	Hinje
00050000-55dd-9c4a-15c0-7849a676fbe2	2311	Hoče
00050000-55dd-9c4a-8c58-1d31c4f234e4	9205	Hodoš/Hodos
00050000-55dd-9c4a-946a-5d7967043126	1354	Horjul
00050000-55dd-9c4a-43a0-7dc827d638b0	1372	Hotedršica
00050000-55dd-9c4a-0aa8-226b40ac0bfd	1430	Hrastnik
00050000-55dd-9c4a-528b-10224ea224b8	6225	Hruševje
00050000-55dd-9c4a-c5fd-6744efdcace1	4276	Hrušica
00050000-55dd-9c4a-7ec8-bdfefc900d75	5280	Idrija
00050000-55dd-9c4a-0fff-5e5dbd86bfe1	1292	Ig
00050000-55dd-9c4a-b9ad-914a9380560a	6250	Ilirska Bistrica
00050000-55dd-9c4a-c945-08f7ed802e4f	6251	Ilirska Bistrica-Trnovo
00050000-55dd-9c4a-63a4-97dcb5d2becb	1295	Ivančna Gorica
00050000-55dd-9c4a-b901-da207c892696	2259	Ivanjkovci
00050000-55dd-9c4a-f81b-6811669c9b88	1411	Izlake
00050000-55dd-9c4a-9701-52cd196d9678	6310	Izola/Isola
00050000-55dd-9c4a-ef9d-d8185a6f9955	2222	Jakobski Dol
00050000-55dd-9c4a-d885-e1572697eb69	2221	Jarenina
00050000-55dd-9c4a-ad0c-4562a838e988	6254	Jelšane
00050000-55dd-9c4a-4d80-6cc87a34d1d3	4270	Jesenice
00050000-55dd-9c4a-f5b8-cb7c5f395d97	8261	Jesenice na Dolenjskem
00050000-55dd-9c4a-1c53-9ac18bd37e2b	3273	Jurklošter
00050000-55dd-9c4a-78ca-03c108d04e24	2223	Jurovski Dol
00050000-55dd-9c4a-39d9-4b871ed31b4d	2256	Juršinci
00050000-55dd-9c4a-6cbc-74a29c0e5286	5214	Kal nad Kanalom
00050000-55dd-9c4a-6509-431515b01f6e	3233	Kalobje
00050000-55dd-9c4a-fdd4-447d60ec35de	4246	Kamna Gorica
00050000-55dd-9c4a-4228-01a628cc1549	2351	Kamnica
00050000-55dd-9c4a-5172-2c9ffab7f4db	1241	Kamnik
00050000-55dd-9c4a-07c0-5f2a867c162d	5213	Kanal
00050000-55dd-9c4a-490a-a12767a6823b	8258	Kapele
00050000-55dd-9c4a-cdd8-e417898d95b7	2362	Kapla
00050000-55dd-9c4a-e548-4119fc5ea490	2325	Kidričevo
00050000-55dd-9c4a-c36f-306f7a4cd13f	1412	Kisovec
00050000-55dd-9c4a-79c5-5776892a0aa8	6253	Knežak
00050000-55dd-9c4a-2290-a85ad66a5826	5222	Kobarid
00050000-55dd-9c4a-872e-22bf4d1bb7c7	9227	Kobilje
00050000-55dd-9c4a-567f-5f4d2fabde7f	1330	Kočevje
00050000-55dd-9c4a-7938-8c4b3b40fbb7	1338	Kočevska Reka
00050000-55dd-9c4a-cceb-ff4a5183fff6	2276	Kog
00050000-55dd-9c4a-cd59-6f9efaa7d92d	5211	Kojsko
00050000-55dd-9c4a-4a51-485d302b3b56	6223	Komen
00050000-55dd-9c4a-3a62-076a97268e7e	1218	Komenda
00050000-55dd-9c4a-c359-d166a800ba6f	6000	Koper/Capodistria 
00050000-55dd-9c4a-41d1-d95fb30fc09a	6001	Koper/Capodistria - poštni predali
00050000-55dd-9c4a-e950-82cc3dfa6a42	8282	Koprivnica
00050000-55dd-9c4a-afc3-fb8fe801e446	5296	Kostanjevica na Krasu
00050000-55dd-9c4a-c226-bd6232077451	8311	Kostanjevica na Krki
00050000-55dd-9c4a-3515-4d72f70b435e	1336	Kostel
00050000-55dd-9c4a-78b6-40dc621c8791	6256	Košana
00050000-55dd-9c4a-29f2-d15d9d474ac5	2394	Kotlje
00050000-55dd-9c4a-826e-72d5aab11b95	6240	Kozina
00050000-55dd-9c4a-97ad-56061858d9d0	3260	Kozje
00050000-55dd-9c4a-903d-1258c8a9b542	4000	Kranj 
00050000-55dd-9c4a-c67d-4001a6c096eb	4001	Kranj - poštni predali
00050000-55dd-9c4a-edeb-2e9f8e04584b	4280	Kranjska Gora
00050000-55dd-9c4a-4037-c9313b978169	1281	Kresnice
00050000-55dd-9c4a-302e-cbd855bedff6	4294	Križe
00050000-55dd-9c4a-912d-e5062e385d67	9206	Križevci
00050000-55dd-9c4a-a8a0-454dc713fbf7	9242	Križevci pri Ljutomeru
00050000-55dd-9c4a-ab20-8896bbaa4af7	1301	Krka
00050000-55dd-9c4a-d33a-d91038128f3d	8296	Krmelj
00050000-55dd-9c4a-0f61-c5f4f33e2a44	4245	Kropa
00050000-55dd-9c4a-9962-e1b2895e061b	8262	Krška vas
00050000-55dd-9c4a-3104-2c803ddcf8d7	8270	Krško
00050000-55dd-9c4a-af21-17a18835f93f	9263	Kuzma
00050000-55dd-9c4a-0f93-457e97373a0d	2318	Laporje
00050000-55dd-9c4a-53e3-31f5b5ba47b5	3270	Laško
00050000-55dd-9c4a-4783-da7f7410bd48	1219	Laze v Tuhinju
00050000-55dd-9c4a-aeca-0077b37bbd35	2230	Lenart v Slovenskih goricah
00050000-55dd-9c4a-0f13-d9b760dff6b6	9220	Lendava/Lendva
00050000-55dd-9c4a-3e75-8bb15d4e7b2a	4248	Lesce
00050000-55dd-9c4a-d0ec-e2a2a9417be7	3261	Lesično
00050000-55dd-9c4a-c6d6-ce75c3323f18	8273	Leskovec pri Krškem
00050000-55dd-9c4a-cee1-858126adfb8c	2372	Libeliče
00050000-55dd-9c4a-bbf8-8ba26a3588fe	2341	Limbuš
00050000-55dd-9c4a-de1f-4517f0e579d9	1270	Litija
00050000-55dd-9c4a-7e2d-3ac174f5c6fd	3202	Ljubečna
00050000-55dd-9c4a-98b5-92910e7781e0	1000	Ljubljana 
00050000-55dd-9c4a-9d07-221a9c6349e8	1001	Ljubljana - poštni predali
00050000-55dd-9c4a-c2e6-0c4d0828e1be	1231	Ljubljana - Črnuče
00050000-55dd-9c4a-dce0-64e58a0f0cdd	1261	Ljubljana - Dobrunje
00050000-55dd-9c4a-6f81-d54cb04648be	1260	Ljubljana - Polje
00050000-55dd-9c4a-bf5d-3043abf9abf0	1210	Ljubljana - Šentvid
00050000-55dd-9c4a-a695-41c853334493	1211	Ljubljana - Šmartno
00050000-55dd-9c4a-5abf-94844a9d8091	3333	Ljubno ob Savinji
00050000-55dd-9c4a-352c-f6cbd04699d9	9240	Ljutomer
00050000-55dd-9c4a-a72c-b3133b5ff4ce	3215	Loče
00050000-55dd-9c4a-6ae5-f9ba72ca518d	5231	Log pod Mangartom
00050000-55dd-9c4a-004e-5ae670c1f231	1358	Log pri Brezovici
00050000-55dd-9c4a-a6a5-d82e091abf54	1370	Logatec
00050000-55dd-9c4a-4b42-236264ebc00d	1371	Logatec
00050000-55dd-9c4a-9d09-17cd870a8af0	1434	Loka pri Zidanem Mostu
00050000-55dd-9c4a-1db0-3fab87e85b7e	3223	Loka pri Žusmu
00050000-55dd-9c4a-3e46-899387941ef3	6219	Lokev
00050000-55dd-9c4a-1bf7-e35ba70f7df1	1318	Loški Potok
00050000-55dd-9c4a-9b76-c096374e2fa0	2324	Lovrenc na Dravskem polju
00050000-55dd-9c4a-ee61-8d858773e00b	2344	Lovrenc na Pohorju
00050000-55dd-9c4a-499f-aa8a91ea4575	3334	Luče
00050000-55dd-9c4a-3899-ba742fc7a2d8	1225	Lukovica
00050000-55dd-9c4a-c751-21ef8f9c4c18	9202	Mačkovci
00050000-55dd-9c4a-3399-31fc62273344	2322	Majšperk
00050000-55dd-9c4a-f5fd-1f2a95bf35c6	2321	Makole
00050000-55dd-9c4a-4054-78b5fedccbe1	9243	Mala Nedelja
00050000-55dd-9c4a-ad7f-d68ed788a1ee	2229	Malečnik
00050000-55dd-9c4a-77e6-e7ab9c80aba6	6273	Marezige
00050000-55dd-9c4a-651e-8042980543d5	2000	Maribor 
00050000-55dd-9c4a-86d3-277bf56dfa0a	2001	Maribor - poštni predali
00050000-55dd-9c4a-f883-3be4f1dd334b	2206	Marjeta na Dravskem polju
00050000-55dd-9c4a-8421-308ab5b3fe9c	2281	Markovci
00050000-55dd-9c4a-8dc7-6cdd8095e850	9221	Martjanci
00050000-55dd-9c4a-d164-8a5822f7807d	6242	Materija
00050000-55dd-9c4a-8fb4-3f632aa3abb3	4211	Mavčiče
00050000-55dd-9c4a-213b-65bfc0bf782b	1215	Medvode
00050000-55dd-9c4a-921b-539f1e939f49	1234	Mengeš
00050000-55dd-9c4a-eee9-bd0af1282fd1	8330	Metlika
00050000-55dd-9c4a-138d-4a8059f25d2e	2392	Mežica
00050000-55dd-9c4a-ac04-985a61282ea1	2204	Miklavž na Dravskem polju
00050000-55dd-9c4a-5d76-04a64d8ba7e9	2275	Miklavž pri Ormožu
00050000-55dd-9c4a-da6e-e5d99998cf30	5291	Miren
00050000-55dd-9c4a-3564-aeecc8c9ed29	8233	Mirna
00050000-55dd-9c4a-4d50-c55322180b8a	8216	Mirna Peč
00050000-55dd-9c4a-de10-8fbe7f5e3c17	2382	Mislinja
00050000-55dd-9c4a-f803-35beafca1705	4281	Mojstrana
00050000-55dd-9c4a-9987-91209fa399e0	8230	Mokronog
00050000-55dd-9c4a-b778-bef612382c74	1251	Moravče
00050000-55dd-9c4a-f191-f01fd7ae57e9	9226	Moravske Toplice
00050000-55dd-9c4a-8f33-bb246f3f0a3f	5216	Most na Soči
00050000-55dd-9c4a-6912-a33f80fa533a	1221	Motnik
00050000-55dd-9c4a-190c-53fa254897ab	3330	Mozirje
00050000-55dd-9c4a-85c5-aa3bdb5bb40f	9000	Murska Sobota 
00050000-55dd-9c4a-74da-68dad14e85e5	9001	Murska Sobota - poštni predali
00050000-55dd-9c4a-fbe6-f11fdb630664	2366	Muta
00050000-55dd-9c4a-8512-e8773cfa80bd	4202	Naklo
00050000-55dd-9c4a-736a-6ca1efd42ea2	3331	Nazarje
00050000-55dd-9c4a-c059-f8ea92721dee	1357	Notranje Gorice
00050000-55dd-9c4a-24a7-8b9ac6c7b539	3203	Nova Cerkev
00050000-55dd-9c4a-f4f0-c56d2b76e791	5000	Nova Gorica 
00050000-55dd-9c4a-7075-39948f5c2b19	5001	Nova Gorica - poštni predali
00050000-55dd-9c4a-38a1-3af3745fba8b	1385	Nova vas
00050000-55dd-9c4a-de4c-1fcd96cbc9f6	8000	Novo mesto
00050000-55dd-9c4a-e988-56561011a5a4	8001	Novo mesto - poštni predali
00050000-55dd-9c4a-cadc-dbafd1cc86ad	6243	Obrov
00050000-55dd-9c4a-afdb-853c0ec3f2cb	9233	Odranci
00050000-55dd-9c4a-7e5b-44a122f44495	2317	Oplotnica
00050000-55dd-9c4a-8d67-588d7603b247	2312	Orehova vas
00050000-55dd-9c4a-000f-d0c59a607da0	2270	Ormož
00050000-55dd-9c4a-df64-95f33caa0bfb	1316	Ortnek
00050000-55dd-9c4a-d1a3-027c5f25377a	1337	Osilnica
00050000-55dd-9c4a-915f-6de41a299499	8222	Otočec
00050000-55dd-9c4a-9286-4d2ce5e4454b	2361	Ožbalt
00050000-55dd-9c4a-37f9-b2e248fec7de	2231	Pernica
00050000-55dd-9c4a-e446-aa5e8b070b88	2211	Pesnica pri Mariboru
00050000-55dd-9c4a-2e9d-97f9e08a8920	9203	Petrovci
00050000-55dd-9c4a-929d-4b79fb3d6182	3301	Petrovče
00050000-55dd-9c4a-2346-98cd7bc89d8d	6330	Piran/Pirano
00050000-55dd-9c4a-6172-cd9a8e3cb230	8255	Pišece
00050000-55dd-9c4a-74b2-de86538258df	6257	Pivka
00050000-55dd-9c4a-0d9c-02ae0f198192	6232	Planina
00050000-55dd-9c4a-ee6b-cd13294b2fd1	3225	Planina pri Sevnici
00050000-55dd-9c4a-5824-0a639e684a90	6276	Pobegi
00050000-55dd-9c4a-b7b9-9c1ea586f553	8312	Podbočje
00050000-55dd-9c4a-bdec-f297adf1199b	5243	Podbrdo
00050000-55dd-9c4a-8102-136c30e58cca	3254	Podčetrtek
00050000-55dd-9c4a-5a8d-d7ce84fd6363	2273	Podgorci
00050000-55dd-9c4a-86d6-2538ded3bedf	6216	Podgorje
00050000-55dd-9c4a-3a5a-0da0d7c43753	2381	Podgorje pri Slovenj Gradcu
00050000-55dd-9c4a-27fb-f9e74a6cd025	6244	Podgrad
00050000-55dd-9c4a-dea2-47d3d8d4671f	1414	Podkum
00050000-55dd-9c4a-e12e-03ee341a42c3	2286	Podlehnik
00050000-55dd-9c4a-696f-00b785243cf6	5272	Podnanos
00050000-55dd-9c4a-4cf7-7ecc23a0cbdb	4244	Podnart
00050000-55dd-9c4a-5faa-217760ed390c	3241	Podplat
00050000-55dd-9c4a-41c3-39fac927d33b	3257	Podsreda
00050000-55dd-9c4a-277a-c70769d49f61	2363	Podvelka
00050000-55dd-9c4a-963c-d6d3b1402987	2208	Pohorje
00050000-55dd-9c4a-5bf1-bd89c92412d9	2257	Polenšak
00050000-55dd-9c4a-aaf9-3ef385838967	1355	Polhov Gradec
00050000-55dd-9c4a-603f-cac6f601083f	4223	Poljane nad Škofjo Loko
00050000-55dd-9c4a-3a05-d31241973439	2319	Poljčane
00050000-55dd-9c4a-bac7-dfb6839d174e	1272	Polšnik
00050000-55dd-9c4a-6456-b525d419a880	3313	Polzela
00050000-55dd-9c4a-7244-9c2a6f932616	3232	Ponikva
00050000-55dd-9c4a-2ff0-1b37e932a2b6	6320	Portorož/Portorose
00050000-55dd-9c4a-098a-89f4dcb370a5	6230	Postojna
00050000-55dd-9c4a-e0ca-35c4a1cb102e	2331	Pragersko
00050000-55dd-9c4a-2528-0548bfbbe330	3312	Prebold
00050000-55dd-9c4a-721a-1fdea725fbd7	4205	Preddvor
00050000-55dd-9c4a-9f7c-47c625cb7f16	6255	Prem
00050000-55dd-9c4a-7724-f4f087a0416c	1352	Preserje
00050000-55dd-9c4a-087c-17a6385b296a	6258	Prestranek
00050000-55dd-9c4a-08fb-003b1649c5e4	2391	Prevalje
00050000-55dd-9c4a-cf37-aa5df3e8d662	3262	Prevorje
00050000-55dd-9c4a-54b6-8b1dcab48024	1276	Primskovo 
00050000-55dd-9c4a-fc52-59e41048a126	3253	Pristava pri Mestinju
00050000-55dd-9c4a-3dba-ccda90ead2bc	9207	Prosenjakovci/Partosfalva
00050000-55dd-9c4a-36d1-c9ced3298902	5297	Prvačina
00050000-55dd-9c4a-0037-1613997f6d04	2250	Ptuj
00050000-55dd-9c4a-32aa-73ba1a189504	2323	Ptujska Gora
00050000-55dd-9c4a-c040-527df05e11cb	9201	Puconci
00050000-55dd-9c4a-33c3-2d3e56521f56	2327	Rače
00050000-55dd-9c4a-8baf-1f91eff95e3d	1433	Radeče
00050000-55dd-9c4a-5db5-53b76c29ce57	9252	Radenci
00050000-55dd-9c4a-52e5-b763d3b53d72	2360	Radlje ob Dravi
00050000-55dd-9c4a-15c5-ae7226199f88	1235	Radomlje
00050000-55dd-9c4a-492b-742ec7e781ce	4240	Radovljica
00050000-55dd-9c4a-b0c3-bb3468740519	8274	Raka
00050000-55dd-9c4a-0fff-481eeca59c86	1381	Rakek
00050000-55dd-9c4a-f938-52367d24ee8c	4283	Rateče - Planica
00050000-55dd-9c4a-ebe2-ed9518b76733	2390	Ravne na Koroškem
00050000-55dd-9c4a-1f01-bd223e02e026	9246	Razkrižje
00050000-55dd-9c4a-311a-e2ec5269b699	3332	Rečica ob Savinji
00050000-55dd-9c4a-2e39-e01da47d5e4f	5292	Renče
00050000-55dd-9c4a-3407-629eb97cd365	1310	Ribnica
00050000-55dd-9c4a-6f55-668788a43c85	2364	Ribnica na Pohorju
00050000-55dd-9c4a-3523-6836c55e16f4	3272	Rimske Toplice
00050000-55dd-9c4a-c9d1-54c9ebf209c1	1314	Rob
00050000-55dd-9c4a-7beb-4d9095df5553	5215	Ročinj
00050000-55dd-9c4a-758f-3e61349b59a9	3250	Rogaška Slatina
00050000-55dd-9c4a-96bb-4213135bdf22	9262	Rogašovci
00050000-55dd-9c4a-66f2-24d7cacbff61	3252	Rogatec
00050000-55dd-9c4a-6ffa-3543b394bb8e	1373	Rovte
00050000-55dd-9c4a-43ff-1f844211ea85	2342	Ruše
00050000-55dd-9c4a-cff7-87ea8928494a	1282	Sava
00050000-55dd-9c4a-c7e3-b9902d9f60db	6333	Sečovlje/Sicciole
00050000-55dd-9c4a-486a-994bd7aef9f1	4227	Selca
00050000-55dd-9c4a-672e-d3d0c906cfca	2352	Selnica ob Dravi
00050000-55dd-9c4a-5d78-bdf27fc8520f	8333	Semič
00050000-55dd-9c4a-08db-8d1721bb609a	8281	Senovo
00050000-55dd-9c4a-5c1c-330b33f17135	6224	Senožeče
00050000-55dd-9c4a-1a01-32295374bcca	8290	Sevnica
00050000-55dd-9c4a-e424-166df34dabeb	6210	Sežana
00050000-55dd-9c4a-4ce6-30d4a4f8e3c1	2214	Sladki Vrh
00050000-55dd-9c4a-0aa7-37f7e87d697c	5283	Slap ob Idrijci
00050000-55dd-9c4a-03bf-e35016c264df	2380	Slovenj Gradec
00050000-55dd-9c4a-43ef-0677f22f4737	2310	Slovenska Bistrica
00050000-55dd-9c4a-2194-47009ccedde5	3210	Slovenske Konjice
00050000-55dd-9c4a-0a4e-1e1b54a6ef01	1216	Smlednik
00050000-55dd-9c4a-d94e-6f1510fb6b4e	5232	Soča
00050000-55dd-9c4a-dc3a-1fefbe070504	1317	Sodražica
00050000-55dd-9c4a-3205-68076e2f30b7	3335	Solčava
00050000-55dd-9c4a-b7f2-f989cff535e9	5250	Solkan
00050000-55dd-9c4a-9fd1-57d74d4ebeae	4229	Sorica
00050000-55dd-9c4a-fec1-1d49c140fcf4	4225	Sovodenj
00050000-55dd-9c4a-9b6a-b2ccbcc70f60	5281	Spodnja Idrija
00050000-55dd-9c4a-6662-9dad2d0d8d09	2241	Spodnji Duplek
00050000-55dd-9c4a-c62e-fad63749dc32	9245	Spodnji Ivanjci
00050000-55dd-9c4a-454f-667f81eb96f9	2277	Središče ob Dravi
00050000-55dd-9c4a-2c33-083f365ff4e4	4267	Srednja vas v Bohinju
00050000-55dd-9c4a-6146-cf4cd2820efb	8256	Sromlje 
00050000-55dd-9c4a-6f5a-8e0cdd15df7e	5224	Srpenica
00050000-55dd-9c4a-5581-b6aafbe0d8bd	1242	Stahovica
00050000-55dd-9c4a-9e17-f1a33b1006d2	1332	Stara Cerkev
00050000-55dd-9c4a-7642-1cc990b7674d	8342	Stari trg ob Kolpi
00050000-55dd-9c4a-380a-7bbd421f68f3	1386	Stari trg pri Ložu
00050000-55dd-9c4a-d585-bc2f49fe86fc	2205	Starše
00050000-55dd-9c4a-c0b9-f2b28f541dd1	2289	Stoperce
00050000-55dd-9c4a-4f0a-626d0e8644d8	8322	Stopiče
00050000-55dd-9c4a-9df1-6a991919f2e3	3206	Stranice
00050000-55dd-9c4a-f20e-037bb46bc5f4	8351	Straža
00050000-55dd-9c4a-abd0-196d71fad177	1313	Struge
00050000-55dd-9c4a-429d-ec0074b6da69	8293	Studenec
00050000-55dd-9c4a-fd3c-e66265936e82	8331	Suhor
00050000-55dd-9c4a-4601-da97dceee14a	2233	Sv. Ana v Slovenskih goricah
00050000-55dd-9c4a-b6df-db9ccfa682c6	2235	Sv. Trojica v Slovenskih goricah
00050000-55dd-9c4a-4201-bde710e5e752	2353	Sveti Duh na Ostrem Vrhu
00050000-55dd-9c4a-8b30-88cefa469bb2	9244	Sveti Jurij ob Ščavnici
00050000-55dd-9c4a-fade-31651bd27d8f	3264	Sveti Štefan
00050000-55dd-9c4a-581d-5bd474666572	2258	Sveti Tomaž
00050000-55dd-9c4a-c054-985b0c716b63	9204	Šalovci
00050000-55dd-9c4a-e488-327f0842f0cb	5261	Šempas
00050000-55dd-9c4a-1901-d86835f41205	5290	Šempeter pri Gorici
00050000-55dd-9c4a-740b-e76a46d260bc	3311	Šempeter v Savinjski dolini
00050000-55dd-9c4a-5d9c-05c079f3cf30	4208	Šenčur
00050000-55dd-9c4a-daac-c38fd76a6c4c	2212	Šentilj v Slovenskih goricah
00050000-55dd-9c4a-027d-33c486c24fb6	8297	Šentjanž
00050000-55dd-9c4a-5734-3111eb3359d3	2373	Šentjanž pri Dravogradu
00050000-55dd-9c4a-37f6-7a65080ff32b	8310	Šentjernej
00050000-55dd-9c4a-d3cc-295cdc0cedc2	3230	Šentjur
00050000-55dd-9c4a-d920-73ffd3b7ad6a	3271	Šentrupert
00050000-55dd-9c4a-7e87-6e9a6c22e0ad	8232	Šentrupert
00050000-55dd-9c4a-2361-11c597381919	1296	Šentvid pri Stični
00050000-55dd-9c4a-eabb-a543d1cd6217	8275	Škocjan
00050000-55dd-9c4a-83f3-f9515ef18d9e	6281	Škofije
00050000-55dd-9c4a-373c-e8b2a06f9732	4220	Škofja Loka
00050000-55dd-9c4a-74c2-9cf219ad9e47	3211	Škofja vas
00050000-55dd-9c4a-6dfd-11e514ae9c18	1291	Škofljica
00050000-55dd-9c4a-3229-33da9ec40177	6274	Šmarje
00050000-55dd-9c4a-ea6f-f501834a6aa8	1293	Šmarje - Sap
00050000-55dd-9c4a-ae33-79b2f27df559	3240	Šmarje pri Jelšah
00050000-55dd-9c4a-7640-1a6e1d373af8	8220	Šmarješke Toplice
00050000-55dd-9c4a-662d-0ca5e58c955e	2315	Šmartno na Pohorju
00050000-55dd-9c4a-77a1-d551bd634f8e	3341	Šmartno ob Dreti
00050000-55dd-9c4a-934b-34761d66f3f0	3327	Šmartno ob Paki
00050000-55dd-9c4a-acc5-adf13e443bf2	1275	Šmartno pri Litiji
00050000-55dd-9c4a-07a9-9f198a1e1f85	2383	Šmartno pri Slovenj Gradcu
00050000-55dd-9c4a-1bca-a92d0e0c9c28	3201	Šmartno v Rožni dolini
00050000-55dd-9c4a-8d06-d6f6a4c3c058	3325	Šoštanj
00050000-55dd-9c4a-55cc-89d4881e45ce	6222	Štanjel
00050000-55dd-9c4a-65a8-2c017167f521	3220	Štore
00050000-55dd-9c4a-f7c9-11ac9b73cc0e	3304	Tabor
00050000-55dd-9c4a-5bb0-f6926b293a16	3221	Teharje
00050000-55dd-9c4a-3290-60e999281208	9251	Tišina
00050000-55dd-9c4a-c1fa-6e7daa2efa7b	5220	Tolmin
00050000-55dd-9c4a-9894-b6e261aae835	3326	Topolšica
00050000-55dd-9c4a-f0c2-06e6a30b57ff	2371	Trbonje
00050000-55dd-9c4a-18e1-90b605c6bc38	1420	Trbovlje
00050000-55dd-9c4a-4e6f-44aba351db81	8231	Trebelno 
00050000-55dd-9c4a-be57-be110bcc21a3	8210	Trebnje
00050000-55dd-9c4a-ca96-8c6acb846b9b	5252	Trnovo pri Gorici
00050000-55dd-9c4a-283d-e539c9af9034	2254	Trnovska vas
00050000-55dd-9c4a-8018-dcd7ca21abeb	1222	Trojane
00050000-55dd-9c4a-21fa-f133c3453a37	1236	Trzin
00050000-55dd-9c4a-29d6-990ffefadef2	4290	Tržič
00050000-55dd-9c4a-8ba7-b19b7e443b33	8295	Tržišče
00050000-55dd-9c4a-1796-e1b7ba90bd91	1311	Turjak
00050000-55dd-9c4a-d838-a03074a23732	9224	Turnišče
00050000-55dd-9c4a-97b3-12a1ef3dbd3a	8323	Uršna sela
00050000-55dd-9c4a-ee6a-7afbb231d5d9	1252	Vače
00050000-55dd-9c4a-81f9-e67b9415d0f9	3320	Velenje 
00050000-55dd-9c4a-7989-3d8959b556a7	3322	Velenje - poštni predali
00050000-55dd-9c4a-6c15-09f37bc26771	8212	Velika Loka
00050000-55dd-9c4a-75b8-f490249c7c9b	2274	Velika Nedelja
00050000-55dd-9c4a-57dd-b83bb384e7d9	9225	Velika Polana
00050000-55dd-9c4a-20c1-4ce22109ff14	1315	Velike Lašče
00050000-55dd-9c4a-a5be-3bfebb8ac00c	8213	Veliki Gaber
00050000-55dd-9c4a-4666-b05ab00e1dab	9241	Veržej
00050000-55dd-9c4a-3d76-2380598dc91f	1312	Videm - Dobrepolje
00050000-55dd-9c4a-c0f7-bfec236ca4ba	2284	Videm pri Ptuju
00050000-55dd-9c4a-24ef-0df42c6e091c	8344	Vinica
00050000-55dd-9c4a-831c-add0f966a319	5271	Vipava
00050000-55dd-9c4a-23ea-61f7ef2af5b8	4212	Visoko
00050000-55dd-9c4a-d23e-7356727e1156	1294	Višnja Gora
00050000-55dd-9c4a-5d2b-758966a0dd2a	3205	Vitanje
00050000-55dd-9c4a-79c1-26b18de2374a	2255	Vitomarci
00050000-55dd-9c4a-c3be-f45235e65a5c	1217	Vodice
00050000-55dd-9c4a-953e-a2985d600c9f	3212	Vojnik\t
00050000-55dd-9c4a-77f8-13d12a2a1b1f	5293	Volčja Draga
00050000-55dd-9c4a-6809-3bff4419f6fa	2232	Voličina
00050000-55dd-9c4a-1e44-55693cb6f4eb	3305	Vransko
00050000-55dd-9c4a-85c9-48fa254a624b	6217	Vremski Britof
00050000-55dd-9c4a-da69-c4c0fbb2e75f	1360	Vrhnika
00050000-55dd-9c4a-924f-a5152bb3d848	2365	Vuhred
00050000-55dd-9c4a-99ed-b0ff7bb1d046	2367	Vuzenica
00050000-55dd-9c4a-df50-60cbbbfb1f8e	8292	Zabukovje 
00050000-55dd-9c4a-3a81-07bc4d9879c0	1410	Zagorje ob Savi
00050000-55dd-9c4a-5090-e149920ffcd5	1303	Zagradec
00050000-55dd-9c4a-d129-37a018a7d5a2	2283	Zavrč
00050000-55dd-9c4a-f364-c83a8c923da6	8272	Zdole 
00050000-55dd-9c4a-8478-72d7db5f2c52	4201	Zgornja Besnica
00050000-55dd-9c4a-98b6-b97ea828bb67	2242	Zgornja Korena
00050000-55dd-9c4a-b747-a4a79ee0e55d	2201	Zgornja Kungota
00050000-55dd-9c4a-e227-74335d3cbae9	2316	Zgornja Ložnica
00050000-55dd-9c4a-89b0-bf875d001bee	2314	Zgornja Polskava
00050000-55dd-9c4a-db0e-93949034fe24	2213	Zgornja Velka
00050000-55dd-9c4a-dd2b-40bdcf1501fb	4247	Zgornje Gorje
00050000-55dd-9c4a-8f52-39c68b512fe0	4206	Zgornje Jezersko
00050000-55dd-9c4a-24df-ff6722a143bb	2285	Zgornji Leskovec
00050000-55dd-9c4a-79f4-a14a48d3987e	1432	Zidani Most
00050000-55dd-9c4a-6548-6df22e68b220	3214	Zreče
00050000-55dd-9c4a-4d8a-336f3f0f5030	4209	Žabnica
00050000-55dd-9c4a-c2bd-165d869d9627	3310	Žalec
00050000-55dd-9c4a-80d4-e937dd10b9be	4228	Železniki
00050000-55dd-9c4a-fc20-c3876cf095b7	2287	Žetale
00050000-55dd-9c4a-f406-97847a3ad027	4226	Žiri
00050000-55dd-9c4a-d6f4-3e23678f572d	4274	Žirovnica
00050000-55dd-9c4a-5aaf-1c602250b421	8360	Žužemberk
\.


--
-- TOC entry 2932 (class 0 OID 15619002)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2914 (class 0 OID 15618809)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 15618887)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 15619014)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 15619363)
-- Dependencies: 226
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 15619373)
-- Dependencies: 227
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55dd-9c4c-e082-f3c0617b04a8	00080000-55dd-9c4c-caca-8d604651c9bc	0987	AK
00190000-55dd-9c4c-7b8e-bbc736076ee1	00080000-55dd-9c4c-cad9-a7178c926235	0989	AK
00190000-55dd-9c4c-bf98-33076fd7b2a5	00080000-55dd-9c4c-e5d8-c3d258ce5c15	0986	AK
00190000-55dd-9c4c-8802-179f9786a7a1	00080000-55dd-9c4c-7d73-214448ac7433	0984	AK
00190000-55dd-9c4c-0328-6a517afb8612	00080000-55dd-9c4c-e089-aa32f07c10e2	0983	AK
00190000-55dd-9c4c-c569-c22403ebf5d9	00080000-55dd-9c4c-d28b-e7bdc0a13b98	0982	AK
00190000-55dd-9c4d-0803-40ca6d5b6453	00080000-55dd-9c4d-afa7-ca69745f810d	1001	AK
\.


--
-- TOC entry 2957 (class 0 OID 15619319)
-- Dependencies: 225
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55dd-9c4c-6d6b-2601475cc4b4	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2960 (class 0 OID 15619381)
-- Dependencies: 228
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2938 (class 0 OID 15619043)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55dd-9c4c-5c44-bc25b3f45c3b	\N	\N	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55dd-9c4c-6cb5-b195f866f9ff	\N	\N	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55dd-9c4c-264e-852bf50a13eb	\N	\N	0003	Kazinska	t	84	Kazinska dvorana
00220000-55dd-9c4c-f978-3ef02b78d4c4	\N	\N	0004	Mali oder	t	24	Mali oder 
00220000-55dd-9c4c-2643-e554cbc3bf9b	\N	\N	0005	Komorni oder	t	15	Komorni oder
00220000-55dd-9c4c-8556-1def8b68c751	\N	\N	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55dd-9c4c-cdd9-6a38c9e2fb22	\N	\N	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2930 (class 0 OID 15618987)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 15618977)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 15619174)
-- Dependencies: 218
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2945 (class 0 OID 15619113)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 15618682)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55dd-9c4d-afa7-ca69745f810d	00010000-55dd-9c4b-c8e1-9abaa810898a	2015-08-26 13:00:29	INS	a:0:{}
2	App\\Entity\\Option	00000000-55dd-9c4d-ca68-d63f74cf0f45	00010000-55dd-9c4b-c8e1-9abaa810898a	2015-08-26 13:00:29	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55dd-9c4d-0803-40ca6d5b6453	00010000-55dd-9c4b-c8e1-9abaa810898a	2015-08-26 13:00:29	INS	a:0:{}
\.


--
-- TOC entry 2981 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2939 (class 0 OID 15619055)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 15618720)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55dd-9c4b-e796-1477ba465607	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55dd-9c4b-72c6-1d06645feb2c	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55dd-9c4b-bd03-01b6706f3f3f	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55dd-9c4b-2de1-216c2eded967	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55dd-9c4b-6376-dcc820557b0c	planer	Planer dogodkov v koledarju	t
00020000-55dd-9c4b-8ed9-97d21733e5fa	kadrovska	Kadrovska služba	t
00020000-55dd-9c4b-ad66-f4924532da86	arhivar	Ažuriranje arhivalij	t
00020000-55dd-9c4b-7dea-f32dd2315218	igralec	Igralec	t
00020000-55dd-9c4b-aceb-526dea3012d2	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55dd-9c4c-2296-5c9dfbf4fc6e	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2905 (class 0 OID 15618704)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55dd-9c4b-ffc2-97d7755907f0	00020000-55dd-9c4b-bd03-01b6706f3f3f
00010000-55dd-9c4b-c8e1-9abaa810898a	00020000-55dd-9c4b-bd03-01b6706f3f3f
00010000-55dd-9c4c-b19c-a931c97c79c8	00020000-55dd-9c4c-2296-5c9dfbf4fc6e
\.


--
-- TOC entry 2941 (class 0 OID 15619069)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 15619008)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 15618954)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 15619422)
-- Dependencies: 233
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55dd-9c4a-5db8-f00f49daef2b	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55dd-9c4a-2b58-c824a4adf610	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55dd-9c4a-e8fa-5ab7c328d6ad	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55dd-9c4a-50c7-d6b151fdc8ed	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55dd-9c4a-5887-d8c6a42e08f0	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2964 (class 0 OID 15619414)
-- Dependencies: 232
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55dd-9c4a-5b31-3300a37a7eb7	00230000-55dd-9c4a-50c7-d6b151fdc8ed	popa
00240000-55dd-9c4a-7ef2-7baf9ac17f7b	00230000-55dd-9c4a-50c7-d6b151fdc8ed	oseba
00240000-55dd-9c4a-35e7-41cfae89526b	00230000-55dd-9c4a-50c7-d6b151fdc8ed	sezona
00240000-55dd-9c4a-e7db-459b8c5c1f1d	00230000-55dd-9c4a-2b58-c824a4adf610	prostor
00240000-55dd-9c4a-a4f1-7bfc6502819b	00230000-55dd-9c4a-50c7-d6b151fdc8ed	besedilo
00240000-55dd-9c4a-97e4-283b02525a56	00230000-55dd-9c4a-50c7-d6b151fdc8ed	uprizoritev
00240000-55dd-9c4a-ae04-c77a6e62016a	00230000-55dd-9c4a-50c7-d6b151fdc8ed	funkcija
00240000-55dd-9c4a-c72b-fcff2a3078dd	00230000-55dd-9c4a-50c7-d6b151fdc8ed	tipfunkcije
00240000-55dd-9c4a-0701-5bdf3e35002a	00230000-55dd-9c4a-50c7-d6b151fdc8ed	alternacija
00240000-55dd-9c4a-2d69-3f653c3c47fb	00230000-55dd-9c4a-5db8-f00f49daef2b	pogodba
00240000-55dd-9c4a-fbc1-f925d4769af2	00230000-55dd-9c4a-50c7-d6b151fdc8ed	zaposlitev
00240000-55dd-9c4a-fe76-4729cf9ecfe3	00230000-55dd-9c4a-5db8-f00f49daef2b	programdela
00240000-55dd-9c4a-1134-53089d305ab9	00230000-55dd-9c4a-50c7-d6b151fdc8ed	zapis
\.


--
-- TOC entry 2963 (class 0 OID 15619409)
-- Dependencies: 231
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
d915754d-18e4-4305-ae78-4af3ce72edde	00230000-55dd-9c4a-50c7-d6b151fdc8ed	0	1001
\.


--
-- TOC entry 2946 (class 0 OID 15619123)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55dd-9c4c-c706-619c035bb1cf	000e0000-55dd-9c4c-651c-3aaecbf3ac4a	00080000-55dd-9c4c-27da-8e526173a2b7	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55dd-9c4b-9a36-83a992d0a945
00270000-55dd-9c4c-4dec-847708eab011	000e0000-55dd-9c4c-651c-3aaecbf3ac4a	00080000-55dd-9c4c-27da-8e526173a2b7	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55dd-9c4b-9a36-83a992d0a945
00270000-55dd-9c4c-0e8e-6e0aa5ad7328	000e0000-55dd-9c4c-651c-3aaecbf3ac4a	00080000-55dd-9c4c-14d0-cc3d874d782f	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4	\N
\.


--
-- TOC entry 2912 (class 0 OID 15618782)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 15618964)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55dd-9c4c-2cbd-611dba05f0fe	00180000-55dd-9c4c-a548-d9ed2d4359a3	000c0000-55dd-9c4c-b7a8-56f9afc08b6d	00090000-55dd-9c4c-8ebb-a90941a09181	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dd-9c4c-a4ac-1cf0abc74b69	00180000-55dd-9c4c-a548-d9ed2d4359a3	000c0000-55dd-9c4c-9f3a-49f07899ff8d	00090000-55dd-9c4c-4b4f-ec087d16ecff	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dd-9c4c-eec8-b39eefe3c876	00180000-55dd-9c4c-a548-d9ed2d4359a3	000c0000-55dd-9c4c-7cd8-4e5fe3455fdb	00090000-55dd-9c4c-e37c-3b9d6276ddaf	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dd-9c4c-b6a4-3fc6712647a1	00180000-55dd-9c4c-a548-d9ed2d4359a3	000c0000-55dd-9c4c-155a-6876a7abe140	00090000-55dd-9c4c-ef76-ee4e75bc070d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dd-9c4c-111c-fe725552387d	00180000-55dd-9c4c-a548-d9ed2d4359a3	000c0000-55dd-9c4c-a8f6-0fc2288b1a94	00090000-55dd-9c4c-bebb-8f3868716818	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dd-9c4c-a4bb-b7aadf262971	00180000-55dd-9c4c-ba59-b29db7553eae	\N	00090000-55dd-9c4c-bebb-8f3868716818	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2949 (class 0 OID 15619163)
-- Dependencies: 217
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55dd-9c4a-a3cc-ac0722b4fd0e	Avtor	Avtorji	Avtorka	umetnik
000f0000-55dd-9c4a-929b-331cf285acd4	Priredba	Priredba	Priredba	umetnik
000f0000-55dd-9c4a-effa-8e3cf6fdb54d	Prevod	Prevod	Prevod	umetnik
000f0000-55dd-9c4a-1d0c-d1a2cfc6cf1c	Režija	Režija	Režija	umetnik
000f0000-55dd-9c4a-62d6-68702edd4e65	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55dd-9c4a-bb8c-52259471eead	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55dd-9c4a-787d-987cac85cdbc	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55dd-9c4a-6698-84484d7eeed5	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55dd-9c4a-d2db-c7672a017641	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55dd-9c4a-6b08-677d36293896	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55dd-9c4a-2188-87cb398d8f6f	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55dd-9c4a-434c-53babc83beb8	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55dd-9c4a-6249-11757f2e5b5e	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55dd-9c4a-d7e5-972dbdb11779	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55dd-9c4a-bff3-feea6311a8e2	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55dd-9c4a-f873-8cf974dc49a4	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55dd-9c4a-9d62-b9fafe3482fd	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55dd-9c4a-59d7-f7a896025b9f	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2961 (class 0 OID 15619391)
-- Dependencies: 229
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55dd-9c4a-3980-b8ca4cbb4ce8	01	Velika predstava	f	1.00	1.00
002b0000-55dd-9c4a-04ca-55dd2c8e9f96	02	Mala predstava	f	0.50	0.50
002b0000-55dd-9c4a-1b6c-2a1ab4af6d12	03	Mala koprodukcija	t	0.40	1.00
002b0000-55dd-9c4a-65fa-bfba7e9fa95b	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55dd-9c4a-0bb2-d3869704f50e	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2917 (class 0 OID 15618844)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 15618691)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55dd-9c4b-c8e1-9abaa810898a	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRObIxudkgb1bqnTEPjMG62Yh6YhdgQy8u	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55dd-9c4c-bcaa-a3475ea6d07e	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55dd-9c4c-7c2f-19636aae4a66	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55dd-9c4c-8063-d0b6f25168f1	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55dd-9c4c-0838-3541809ee009	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55dd-9c4c-9c80-b28642161f76	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55dd-9c4c-4d06-c65ac1eef44c	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55dd-9c4c-1d78-d81ce11dc6e4	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55dd-9c4c-5c06-f7eea0581b77	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55dd-9c4c-e3f7-183789dae5cb	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55dd-9c4c-b19c-a931c97c79c8	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55dd-9c4b-ffc2-97d7755907f0	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2953 (class 0 OID 15619211)
-- Dependencies: 221
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55dd-9c4c-de90-d9598a10b56a	00160000-55dd-9c4c-9747-5e1252743fd0	00150000-55dd-9c4a-5956-2ffe0f2a95eb	00140000-55dd-9c4a-b4d7-3f4184f002d1	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55dd-9c4c-2643-e554cbc3bf9b
000e0000-55dd-9c4c-651c-3aaecbf3ac4a	00160000-55dd-9c4c-5de7-3d53e91c9ecd	00150000-55dd-9c4a-6b69-d5db31b2fa92	00140000-55dd-9c4a-e8ac-23eb19c67d4f	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55dd-9c4c-8556-1def8b68c751
000e0000-55dd-9c4c-8bd5-1694d74e4e4c	\N	00150000-55dd-9c4a-6b69-d5db31b2fa92	00140000-55dd-9c4a-e8ac-23eb19c67d4f	00190000-55dd-9c4c-e082-f3c0617b04a8	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55dd-9c4c-2643-e554cbc3bf9b
000e0000-55dd-9c4c-9739-06c78d7c574d	\N	00150000-55dd-9c4a-6b69-d5db31b2fa92	00140000-55dd-9c4a-e8ac-23eb19c67d4f	00190000-55dd-9c4c-e082-f3c0617b04a8	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55dd-9c4c-2643-e554cbc3bf9b
000e0000-55dd-9c4c-67d9-e8448428707f	\N	00150000-55dd-9c4a-6b69-d5db31b2fa92	00140000-55dd-9c4a-e8ac-23eb19c67d4f	00190000-55dd-9c4c-e082-f3c0617b04a8	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55dd-9c4c-5c44-bc25b3f45c3b
000e0000-55dd-9c4c-e809-35d93beceada	\N	00150000-55dd-9c4a-6b69-d5db31b2fa92	00140000-55dd-9c4a-e8ac-23eb19c67d4f	00190000-55dd-9c4c-e082-f3c0617b04a8	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f		00220000-55dd-9c4c-5c44-bc25b3f45c3b
\.


--
-- TOC entry 2922 (class 0 OID 15618906)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55dd-9c4c-e943-c3e7abed5482	000e0000-55dd-9c4c-651c-3aaecbf3ac4a	1	
00200000-55dd-9c4c-fc82-2057d45fe40d	000e0000-55dd-9c4c-651c-3aaecbf3ac4a	2	
\.


--
-- TOC entry 2937 (class 0 OID 15619035)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 15619137)
-- Dependencies: 215
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55dd-9c4b-aab6-43e967b645f7	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55dd-9c4b-82c0-de7e3e236df3	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55dd-9c4b-4d3d-3e17c9bf0054	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55dd-9c4b-7ddc-6d2ada31c619	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55dd-9c4b-bcae-9771eba92e2a	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55dd-9c4b-aaa7-19f73e52d49e	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55dd-9c4b-b558-4b8642a0133b	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55dd-9c4b-a822-5fe40f90004f	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55dd-9c4b-9a36-83a992d0a945	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55dd-9c4b-4322-5932914f39fc	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55dd-9c4b-9b2f-6523687ee13a	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55dd-9c4b-9dfd-f65fc42bfd76	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55dd-9c4b-a3a4-ba6971beb868	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55dd-9c4b-37ba-78bbc5acfca5	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55dd-9c4b-2c0e-80c3289f37db	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55dd-9c4b-48ac-acc74837018c	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55dd-9c4b-444a-e7a9152b7ca1	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55dd-9c4b-b74c-069a4e60f355	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55dd-9c4b-9252-bf3bb727dab3	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55dd-9c4b-fcf2-234deb4d061a	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55dd-9c4b-54b7-489ca31497e4	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55dd-9c4b-560b-6018e5918066	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55dd-9c4b-a16a-22573276542c	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55dd-9c4b-9fd0-6970200aa9da	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2967 (class 0 OID 15619461)
-- Dependencies: 235
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 15619433)
-- Dependencies: 234
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 15619473)
-- Dependencies: 236
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2944 (class 0 OID 15619106)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55dd-9c4c-b33d-84573c9c94ac	00090000-55dd-9c4c-4b4f-ec087d16ecff	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dd-9c4c-d612-041994192c50	00090000-55dd-9c4c-e37c-3b9d6276ddaf	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dd-9c4c-85d1-5926dfadd4da	00090000-55dd-9c4c-d1a2-cfcd755222c4	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dd-9c4c-ebfc-ca319233ae2a	00090000-55dd-9c4c-17a4-28734af8fc43	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dd-9c4c-d1c4-a4e8a26c4b44	00090000-55dd-9c4c-8ebb-a90941a09181	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dd-9c4c-9e81-fe945006cbb9	00090000-55dd-9c4c-5ecb-62cf77bbb458	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2924 (class 0 OID 15618938)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 15619201)
-- Dependencies: 220
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55dd-9c4a-b4d7-3f4184f002d1	01	Drama	drama (SURS 01)
00140000-55dd-9c4a-f241-c7e8cf9349cb	02	Opera	opera (SURS 02)
00140000-55dd-9c4a-6f03-a2d560add27e	03	Balet	balet (SURS 03)
00140000-55dd-9c4a-3244-678a9c1a9e35	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55dd-9c4a-626f-2b394dbcb2dd	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55dd-9c4a-e8ac-23eb19c67d4f	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55dd-9c4a-6087-050abc605667	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2943 (class 0 OID 15619096)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55dd-9c4a-277c-58364353a444	01	Opera	opera
00150000-55dd-9c4a-491f-cbb52d6b6214	02	Opereta	opereta
00150000-55dd-9c4a-3582-b4bf72313fb0	03	Balet	balet
00150000-55dd-9c4a-8ea6-b0cc7b50554f	04	Plesne prireditve	plesne prireditve
00150000-55dd-9c4a-3635-0f37c4d36629	05	Lutkovno gledališče	lutkovno gledališče
00150000-55dd-9c4a-fcc7-989416283535	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55dd-9c4a-88e8-28c9740546d6	07	Biografska drama	biografska drama
00150000-55dd-9c4a-5956-2ffe0f2a95eb	08	Komedija	komedija
00150000-55dd-9c4a-1b43-fac337f8e6fb	09	Črna komedija	črna komedija
00150000-55dd-9c4a-67eb-9c7ab0d3e6e9	10	E-igra	E-igra
00150000-55dd-9c4a-6b69-d5db31b2fa92	11	Kriminalka	kriminalka
00150000-55dd-9c4a-5590-f6d1212674e7	12	Musical	musical
\.


--
-- TOC entry 2446 (class 2606 OID 15618745)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 15619258)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 15619248)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 15619162)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 15619513)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 15618928)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 15618953)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 15619407)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 15618870)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 15619313)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 15619092)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 15618904)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 15618947)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 15618884)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 15619000)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 15619490)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 15619497)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2692 (class 2606 OID 15619521)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 15619027)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 15618842)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 15618754)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2453 (class 2606 OID 15618778)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2444 (class 2606 OID 15618734)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2437 (class 2606 OID 15618719)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 15619033)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 15619068)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 15619196)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 15618806)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 15618830)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 15619006)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 15618820)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 15618891)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 15619018)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 15619370)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 15619378)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 15619361)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 15619389)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 15619050)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 15618991)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 15618982)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 15619184)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 15619120)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 15618690)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 15619059)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 15618708)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2439 (class 2606 OID 15618728)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 15619077)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 15619013)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 15618962)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 15619431)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 15619419)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 15619413)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 15619133)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 15618787)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 15618973)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 15619173)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 15619401)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 15618855)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 15618703)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 15619227)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 15618913)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 15619041)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 15619145)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 15619471)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 15619455)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 15619479)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 15619111)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 15618942)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 15619209)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 15619104)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 1259 OID 15618935)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2589 (class 1259 OID 15619134)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2590 (class 1259 OID 15619135)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2591 (class 1259 OID 15619136)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2678 (class 1259 OID 15619492)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2679 (class 1259 OID 15619491)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2460 (class 1259 OID 15618808)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2552 (class 1259 OID 15619034)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2665 (class 1259 OID 15619459)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2666 (class 1259 OID 15619458)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2667 (class 1259 OID 15619460)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2668 (class 1259 OID 15619457)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2669 (class 1259 OID 15619456)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2546 (class 1259 OID 15619020)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2547 (class 1259 OID 15619019)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2497 (class 1259 OID 15618914)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2576 (class 1259 OID 15619093)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2577 (class 1259 OID 15619095)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2578 (class 1259 OID 15619094)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2485 (class 1259 OID 15618886)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2486 (class 1259 OID 15618885)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2648 (class 1259 OID 15619390)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2602 (class 1259 OID 15619198)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2603 (class 1259 OID 15619199)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2604 (class 1259 OID 15619200)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2675 (class 1259 OID 15619480)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2611 (class 1259 OID 15619232)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2612 (class 1259 OID 15619229)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2613 (class 1259 OID 15619233)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2614 (class 1259 OID 15619231)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2615 (class 1259 OID 15619230)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2475 (class 1259 OID 15618857)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2476 (class 1259 OID 15618856)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2451 (class 1259 OID 15618781)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2564 (class 1259 OID 15619060)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2515 (class 1259 OID 15618948)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2441 (class 1259 OID 15618735)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2442 (class 1259 OID 15618736)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2569 (class 1259 OID 15619080)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2570 (class 1259 OID 15619079)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2571 (class 1259 OID 15619078)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2489 (class 1259 OID 15618892)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2490 (class 1259 OID 15618894)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2491 (class 1259 OID 15618893)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2658 (class 1259 OID 15619421)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2526 (class 1259 OID 15618986)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2527 (class 1259 OID 15618984)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2528 (class 1259 OID 15618983)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2529 (class 1259 OID 15618985)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2432 (class 1259 OID 15618709)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2433 (class 1259 OID 15618710)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2555 (class 1259 OID 15619042)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2688 (class 1259 OID 15619514)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2689 (class 1259 OID 15619522)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2690 (class 1259 OID 15619523)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2541 (class 1259 OID 15619007)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2585 (class 1259 OID 15619121)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2586 (class 1259 OID 15619122)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2632 (class 1259 OID 15619318)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2633 (class 1259 OID 15619317)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2634 (class 1259 OID 15619314)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2635 (class 1259 OID 15619315)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2636 (class 1259 OID 15619316)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2464 (class 1259 OID 15618822)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 15618821)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2466 (class 1259 OID 15618823)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2558 (class 1259 OID 15619054)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2559 (class 1259 OID 15619053)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2640 (class 1259 OID 15619371)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2641 (class 1259 OID 15619372)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2625 (class 1259 OID 15619262)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2626 (class 1259 OID 15619263)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2627 (class 1259 OID 15619260)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2628 (class 1259 OID 15619261)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2582 (class 1259 OID 15619112)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2532 (class 1259 OID 15618995)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2533 (class 1259 OID 15618994)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2534 (class 1259 OID 15618992)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2535 (class 1259 OID 15618993)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2621 (class 1259 OID 15619250)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2622 (class 1259 OID 15619249)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2637 (class 1259 OID 15619362)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2496 (class 1259 OID 15618905)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2655 (class 1259 OID 15619408)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2682 (class 1259 OID 15619498)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2683 (class 1259 OID 15619499)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2447 (class 1259 OID 15618756)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2448 (class 1259 OID 15618755)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2456 (class 1259 OID 15618788)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2457 (class 1259 OID 15618789)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2521 (class 1259 OID 15618976)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2522 (class 1259 OID 15618975)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2523 (class 1259 OID 15618974)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2503 (class 1259 OID 15618937)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2504 (class 1259 OID 15618933)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2505 (class 1259 OID 15618930)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2506 (class 1259 OID 15618931)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2507 (class 1259 OID 15618929)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2508 (class 1259 OID 15618934)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2509 (class 1259 OID 15618932)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2463 (class 1259 OID 15618807)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2481 (class 1259 OID 15618871)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 15618873)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2483 (class 1259 OID 15618872)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2484 (class 1259 OID 15618874)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2540 (class 1259 OID 15619001)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2607 (class 1259 OID 15619197)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2616 (class 1259 OID 15619228)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2454 (class 1259 OID 15618779)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2455 (class 1259 OID 15618780)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2579 (class 1259 OID 15619105)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2664 (class 1259 OID 15619432)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2474 (class 1259 OID 15618843)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2661 (class 1259 OID 15619420)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2562 (class 1259 OID 15619052)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2563 (class 1259 OID 15619051)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2629 (class 1259 OID 15619259)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2471 (class 1259 OID 15618831)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2608 (class 1259 OID 15619210)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2672 (class 1259 OID 15619472)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2646 (class 1259 OID 15619379)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2647 (class 1259 OID 15619380)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2520 (class 1259 OID 15618963)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2440 (class 1259 OID 15618729)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2510 (class 1259 OID 15618936)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2718 (class 2606 OID 15619659)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2721 (class 2606 OID 15619644)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2720 (class 2606 OID 15619649)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2716 (class 2606 OID 15619669)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2722 (class 2606 OID 15619639)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2717 (class 2606 OID 15619664)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2719 (class 2606 OID 15619654)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2755 (class 2606 OID 15619824)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2754 (class 2606 OID 15619829)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2753 (class 2606 OID 15619834)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2788 (class 2606 OID 15620004)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2789 (class 2606 OID 15619999)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2703 (class 2606 OID 15619574)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2739 (class 2606 OID 15619754)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2783 (class 2606 OID 15619984)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2784 (class 2606 OID 15619979)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2782 (class 2606 OID 15619989)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2785 (class 2606 OID 15619974)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2786 (class 2606 OID 15619969)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2737 (class 2606 OID 15619749)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2738 (class 2606 OID 15619744)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2715 (class 2606 OID 15619634)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2749 (class 2606 OID 15619794)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2747 (class 2606 OID 15619804)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2748 (class 2606 OID 15619799)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2709 (class 2606 OID 15619609)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2710 (class 2606 OID 15619604)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2735 (class 2606 OID 15619734)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2779 (class 2606 OID 15619954)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2758 (class 2606 OID 15619839)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2757 (class 2606 OID 15619844)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2756 (class 2606 OID 15619849)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2787 (class 2606 OID 15619994)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2760 (class 2606 OID 15619869)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2763 (class 2606 OID 15619854)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2759 (class 2606 OID 15619874)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2761 (class 2606 OID 15619864)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2762 (class 2606 OID 15619859)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2707 (class 2606 OID 15619599)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2708 (class 2606 OID 15619594)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2699 (class 2606 OID 15619559)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2700 (class 2606 OID 15619554)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2743 (class 2606 OID 15619774)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2723 (class 2606 OID 15619674)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2696 (class 2606 OID 15619534)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2695 (class 2606 OID 15619539)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2744 (class 2606 OID 15619789)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2745 (class 2606 OID 15619784)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2746 (class 2606 OID 15619779)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2713 (class 2606 OID 15619614)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2711 (class 2606 OID 15619624)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2712 (class 2606 OID 15619619)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2781 (class 2606 OID 15619964)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2727 (class 2606 OID 15619709)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2729 (class 2606 OID 15619699)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2730 (class 2606 OID 15619694)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2728 (class 2606 OID 15619704)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2694 (class 2606 OID 15619524)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2693 (class 2606 OID 15619529)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2740 (class 2606 OID 15619759)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2792 (class 2606 OID 15620019)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2794 (class 2606 OID 15620024)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2793 (class 2606 OID 15620029)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2736 (class 2606 OID 15619739)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2752 (class 2606 OID 15619814)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2751 (class 2606 OID 15619819)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2770 (class 2606 OID 15619929)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2771 (class 2606 OID 15619924)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2774 (class 2606 OID 15619909)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2773 (class 2606 OID 15619914)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2772 (class 2606 OID 15619919)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2705 (class 2606 OID 15619584)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2706 (class 2606 OID 15619579)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2704 (class 2606 OID 15619589)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2741 (class 2606 OID 15619769)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2742 (class 2606 OID 15619764)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2777 (class 2606 OID 15619939)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2776 (class 2606 OID 15619944)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2767 (class 2606 OID 15619899)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2766 (class 2606 OID 15619904)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2769 (class 2606 OID 15619889)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2768 (class 2606 OID 15619894)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2750 (class 2606 OID 15619809)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2731 (class 2606 OID 15619729)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2732 (class 2606 OID 15619724)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2734 (class 2606 OID 15619714)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2733 (class 2606 OID 15619719)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2764 (class 2606 OID 15619884)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2765 (class 2606 OID 15619879)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2775 (class 2606 OID 15619934)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2714 (class 2606 OID 15619629)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2778 (class 2606 OID 15619949)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2780 (class 2606 OID 15619959)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2791 (class 2606 OID 15620009)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2790 (class 2606 OID 15620014)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2697 (class 2606 OID 15619549)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2698 (class 2606 OID 15619544)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2702 (class 2606 OID 15619564)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2701 (class 2606 OID 15619569)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2724 (class 2606 OID 15619689)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2725 (class 2606 OID 15619684)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2726 (class 2606 OID 15619679)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-26 13:00:30 CEST

--
-- PostgreSQL database dump complete
--

