--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-04 10:33:36 CEST

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
-- TOC entry 2980 (class 0 OID 0)
-- Dependencies: 241
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 178 (class 1259 OID 17302364)
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
-- TOC entry 223 (class 1259 OID 17302878)
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
-- TOC entry 222 (class 1259 OID 17302861)
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
-- TOC entry 216 (class 1259 OID 17302771)
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
-- TOC entry 239 (class 1259 OID 17303126)
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
-- TOC entry 192 (class 1259 OID 17302542)
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
-- TOC entry 194 (class 1259 OID 17302573)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 17303028)
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
-- TOC entry 187 (class 1259 OID 17302485)
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
-- TOC entry 224 (class 1259 OID 17302891)
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
-- TOC entry 210 (class 1259 OID 17302706)
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
-- TOC entry 190 (class 1259 OID 17302521)
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
-- TOC entry 188 (class 1259 OID 17302502)
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
-- TOC entry 199 (class 1259 OID 17302620)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 237 (class 1259 OID 17303107)
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
-- TOC entry 238 (class 1259 OID 17303119)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 17303141)
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
-- TOC entry 170 (class 1259 OID 16867877)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 203 (class 1259 OID 17302645)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 185 (class 1259 OID 17302459)
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
-- TOC entry 179 (class 1259 OID 17302373)
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
-- TOC entry 180 (class 1259 OID 17302384)
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
-- TOC entry 175 (class 1259 OID 17302338)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 17302357)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 17302652)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 17302686)
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
-- TOC entry 219 (class 1259 OID 17302810)
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
-- TOC entry 182 (class 1259 OID 17302417)
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
-- TOC entry 184 (class 1259 OID 17302451)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 17302626)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 183 (class 1259 OID 17302436)
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
-- TOC entry 189 (class 1259 OID 17302514)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 202 (class 1259 OID 17302638)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 17302989)
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
-- TOC entry 227 (class 1259 OID 17302999)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 17302946)
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
-- TOC entry 228 (class 1259 OID 17303007)
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
-- TOC entry 206 (class 1259 OID 17302667)
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
-- TOC entry 198 (class 1259 OID 17302611)
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
-- TOC entry 197 (class 1259 OID 17302601)
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
-- TOC entry 218 (class 1259 OID 17302799)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 17302738)
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
-- TOC entry 172 (class 1259 OID 17302309)
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
-- TOC entry 171 (class 1259 OID 17302307)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2981 (class 0 OID 0)
-- Dependencies: 171
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 207 (class 1259 OID 17302680)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 176 (class 1259 OID 17302347)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 174 (class 1259 OID 17302331)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 17302694)
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
-- TOC entry 201 (class 1259 OID 17302632)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 17302578)
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
-- TOC entry 233 (class 1259 OID 17303048)
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
-- TOC entry 232 (class 1259 OID 17303040)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 17303035)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 17302748)
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
-- TOC entry 181 (class 1259 OID 17302409)
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
-- TOC entry 196 (class 1259 OID 17302588)
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
-- TOC entry 217 (class 1259 OID 17302788)
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
-- TOC entry 229 (class 1259 OID 17303017)
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
-- TOC entry 186 (class 1259 OID 17302471)
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
-- TOC entry 173 (class 1259 OID 17302318)
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
-- TOC entry 221 (class 1259 OID 17302836)
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
-- TOC entry 191 (class 1259 OID 17302532)
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
-- TOC entry 205 (class 1259 OID 17302659)
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
-- TOC entry 215 (class 1259 OID 17302762)
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
-- TOC entry 235 (class 1259 OID 17303087)
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
-- TOC entry 234 (class 1259 OID 17303059)
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
-- TOC entry 236 (class 1259 OID 17303099)
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
-- TOC entry 212 (class 1259 OID 17302731)
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
-- TOC entry 193 (class 1259 OID 17302568)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 17302826)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 17302721)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 17302312)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2911 (class 0 OID 17302364)
-- Dependencies: 178
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2956 (class 0 OID 17302878)
-- Dependencies: 223
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55e9-575e-4d9b-8d156a69505c	000d0000-55e9-575e-c236-0718eb9f6ad5	\N	00090000-55e9-575e-1377-579176fd1c56	000b0000-55e9-575e-dfc4-ee7ccf4e3e14	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55e9-575e-15b3-41a1704896d8	000d0000-55e9-575e-8c68-dce3099526a8	00100000-55e9-575e-f688-09fd69c8efde	00090000-55e9-575e-bdcc-24bd6d621ecd	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55e9-575e-8e08-4f432425a4f0	000d0000-55e9-575e-9ec5-50f0a74c9318	00100000-55e9-575e-28e7-492ef092d6f9	00090000-55e9-575e-60cd-9d2b40ba86ed	\N	0003	t	\N	2015-09-04	\N	2	t	\N	f	f
000c0000-55e9-575e-c962-3a24116352bd	000d0000-55e9-575e-ded8-1690f67ad61c	\N	00090000-55e9-575e-37fc-66908d39b308	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55e9-575e-3337-a71afd8ec48d	000d0000-55e9-575e-73e8-959e05423758	\N	00090000-55e9-575e-072a-5dd7ac1c2e78	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55e9-575e-57d4-aaddadc9c86c	000d0000-55e9-575e-d013-80f2ddcc7584	\N	00090000-55e9-575e-6a77-f287a97854a5	000b0000-55e9-575e-c10f-cbe96c120dd3	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55e9-575e-88c6-db7512d14a54	000d0000-55e9-575e-6906-57871d0f8260	00100000-55e9-575e-8605-bd78e47f36e9	00090000-55e9-575e-2404-74101c022aea	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55e9-575e-7bb7-71160ff4354c	000d0000-55e9-575e-a1ac-a2a267237fab	\N	00090000-55e9-575e-d91a-51e5cc9b7fcb	000b0000-55e9-575e-b19d-754d60c2d2f6	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55e9-575e-b5e0-fbe7d1d5b2f5	000d0000-55e9-575e-6906-57871d0f8260	00100000-55e9-575e-972c-2e11e76714aa	00090000-55e9-575e-0be0-bcba564e1ffe	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55e9-575e-f301-79ffcde631b0	000d0000-55e9-575e-6906-57871d0f8260	00100000-55e9-575e-b43b-62f4206fa427	00090000-55e9-575e-42b4-14a2068bff8d	\N	0010	t	\N	2015-09-04	\N	16	f	\N	f	t
000c0000-55e9-575e-acaf-6c8b0bb9c7a1	000d0000-55e9-575e-6906-57871d0f8260	00100000-55e9-575e-6c89-71b6ca13d0dc	00090000-55e9-575e-ce7f-b94fff91c06a	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
\.


--
-- TOC entry 2955 (class 0 OID 17302861)
-- Dependencies: 222
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 17302771)
-- Dependencies: 216
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55e9-575e-5387-b6075b3f7b5c	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55e9-575e-623b-2f0793a40657	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55e9-575e-b030-7d62b48fd2ec	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2972 (class 0 OID 17303126)
-- Dependencies: 239
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2925 (class 0 OID 17302542)
-- Dependencies: 192
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55e9-575e-30e0-453d9a8de1e7	\N	\N	00200000-55e9-575e-bcbc-aff89cda6967	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55e9-575e-4753-5fe542b77e93	\N	\N	00200000-55e9-575e-2271-37441312850c	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55e9-575e-de06-2740d0f7f680	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55e9-575e-493e-8c82c2df07bf	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55e9-575e-13cc-60310cec2001	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2927 (class 0 OID 17302573)
-- Dependencies: 194
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 17303028)
-- Dependencies: 230
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 17302485)
-- Dependencies: 187
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55e9-575c-6db1-801ce95cc35c	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55e9-575c-facc-c0ab50d397a5	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55e9-575c-e0b1-e762e3dcd922	AL	ALB	008	Albania 	Albanija	\N
00040000-55e9-575c-dd17-0622664fb3a6	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55e9-575c-2b76-9328e2bfce7b	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55e9-575c-34ac-93d9d4382c6d	AD	AND	020	Andorra 	Andora	\N
00040000-55e9-575c-c0f3-829ad6a4bf31	AO	AGO	024	Angola 	Angola	\N
00040000-55e9-575c-2ee0-f6bac7f2319e	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55e9-575c-2c31-6ebed17d54c5	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55e9-575c-8fca-772e49f75c3a	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55e9-575c-b962-35078e5bd759	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55e9-575c-4b0a-314fe079da1f	AM	ARM	051	Armenia 	Armenija	\N
00040000-55e9-575c-b862-96a68e8ceac2	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55e9-575c-bb4c-d1a52c7126aa	AU	AUS	036	Australia 	Avstralija	\N
00040000-55e9-575c-16bc-9f7374f79bfc	AT	AUT	040	Austria 	Avstrija	\N
00040000-55e9-575c-5b82-6612b37844b5	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55e9-575c-984c-1ef77786adad	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55e9-575c-9577-ebdeeb94803f	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55e9-575c-50c3-374e28f3f00a	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55e9-575c-2b0c-39225c3e187a	BB	BRB	052	Barbados 	Barbados	\N
00040000-55e9-575c-c84d-2f5859aaab3f	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55e9-575c-b2ff-1a1c3d27349b	BE	BEL	056	Belgium 	Belgija	\N
00040000-55e9-575c-4a12-2b9f27720574	BZ	BLZ	084	Belize 	Belize	\N
00040000-55e9-575c-ca3c-92d9f6a950ce	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55e9-575c-0583-f6bd181b2381	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55e9-575c-71e6-c5bcec41bfd0	BT	BTN	064	Bhutan 	Butan	\N
00040000-55e9-575c-4391-9306ff3141a8	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55e9-575c-6152-63b3fd76a93a	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55e9-575c-1338-68227150b7f2	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55e9-575c-033b-42d208ab61fa	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55e9-575c-8c3a-0acebe4ecb84	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55e9-575c-1fc8-cd666ab4b9ed	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55e9-575c-1adc-a1c1422f70f5	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55e9-575c-c66e-55ea3d057989	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55e9-575c-428f-dfd70a2505c2	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55e9-575c-9064-60df29c683d8	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55e9-575c-9aae-e2f412a3f546	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55e9-575c-81a5-def9799b897c	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55e9-575c-a73d-b29bc3c7abe5	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55e9-575c-b110-73c119092c7e	CA	CAN	124	Canada 	Kanada	\N
00040000-55e9-575c-6eea-b5fe16d69579	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55e9-575c-4064-bb8b3ea37273	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55e9-575c-c593-25cd72be56fe	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55e9-575c-0fd2-f5d335f121fa	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55e9-575c-ab70-480005f0ea3e	CL	CHL	152	Chile 	Čile	\N
00040000-55e9-575c-b076-5d9a9983bce8	CN	CHN	156	China 	Kitajska	\N
00040000-55e9-575c-ae96-2995a6889cb5	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55e9-575c-c044-8f3c58564b01	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55e9-575c-f70e-41bfff5ff490	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55e9-575c-b33a-40e86c05bc8c	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55e9-575c-3fef-d3781e676984	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55e9-575c-1656-bb5b6db4ba99	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55e9-575c-3afa-eb5b6bcfb6b2	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55e9-575c-91ba-c1bfd00ed744	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55e9-575c-87e4-57abbd85b125	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55e9-575c-1cf9-72ea30c2976c	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55e9-575c-7c3a-75c47b860131	CU	CUB	192	Cuba 	Kuba	\N
00040000-55e9-575c-7f4b-f14cf3d93f17	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55e9-575c-ea69-780d9c6f5470	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55e9-575c-a151-e5a654037823	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55e9-575c-3c6d-4b2c0b7d674b	DK	DNK	208	Denmark 	Danska	\N
00040000-55e9-575c-4da8-9763e91123ec	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55e9-575c-61d9-6f56ca0a95f6	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55e9-575c-255a-69a5d7b97f40	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55e9-575c-8454-7b5471b14699	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55e9-575c-0a2a-72dbe01746b8	EG	EGY	818	Egypt 	Egipt	\N
00040000-55e9-575c-0730-d085c8c857da	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55e9-575c-64d9-1657323cc695	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55e9-575c-7566-21e040654a47	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55e9-575c-11a1-bdaefa8f66b7	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55e9-575c-76f2-ab1a42bd4590	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55e9-575c-7708-2b505047ba09	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55e9-575c-a7d8-cc19a490521c	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55e9-575c-69eb-bdbb56d5b108	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55e9-575c-be31-0c0c9b80591c	FI	FIN	246	Finland 	Finska	\N
00040000-55e9-575c-e147-b9d5b52b82e6	FR	FRA	250	France 	Francija	\N
00040000-55e9-575c-b655-711fcaaaaf2a	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55e9-575c-e3e2-e66322e14915	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55e9-575c-5005-ec20bca56e32	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55e9-575c-c39e-f0e39196a626	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55e9-575c-eaa7-1b33bc36a8d9	GA	GAB	266	Gabon 	Gabon	\N
00040000-55e9-575c-0b99-50fbb0ede10e	GM	GMB	270	Gambia 	Gambija	\N
00040000-55e9-575c-492d-2446fe8e0f37	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55e9-575c-46cf-cbea4c3f9a73	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55e9-575c-0b74-06f1922ae45f	GH	GHA	288	Ghana 	Gana	\N
00040000-55e9-575c-827b-0af1120c0ad2	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55e9-575c-707a-6c38d1f319a5	GR	GRC	300	Greece 	Grčija	\N
00040000-55e9-575c-eacc-a198d8f61d7c	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55e9-575c-1a07-5a3903830c50	GD	GRD	308	Grenada 	Grenada	\N
00040000-55e9-575c-1f9d-605985974b14	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55e9-575c-7546-dc59b64bcbe7	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55e9-575c-3dc5-8de1e325c12f	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55e9-575c-e3f1-fa8acc76bdf8	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55e9-575c-d394-c9aacb01a74e	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55e9-575c-3fd7-fa70a4beabe0	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55e9-575c-b49f-e58f1b5f8a71	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55e9-575c-5d65-231917fd8d94	HT	HTI	332	Haiti 	Haiti	\N
00040000-55e9-575c-8660-a87d81b06b5c	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55e9-575c-276b-c855945e542e	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55e9-575c-ac8b-75b51d10ed5e	HN	HND	340	Honduras 	Honduras	\N
00040000-55e9-575c-d3e8-62d6df96ea31	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55e9-575c-f169-25c652f8345c	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55e9-575c-f1a7-54af2bce265b	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55e9-575c-e3e3-789a48e85314	IN	IND	356	India 	Indija	\N
00040000-55e9-575c-7a7e-472b7725b394	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55e9-575c-9f83-d747b47c9506	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55e9-575c-bef3-0efabac716f4	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55e9-575c-48a4-e8f0c8e976d3	IE	IRL	372	Ireland 	Irska	\N
00040000-55e9-575c-3107-2f2a13204002	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55e9-575c-d4b6-6c1c9b4b54ae	IL	ISR	376	Israel 	Izrael	\N
00040000-55e9-575c-54a4-dbbd233d5a89	IT	ITA	380	Italy 	Italija	\N
00040000-55e9-575c-3860-c4751371df8b	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55e9-575c-2a77-11c1a239bdee	JP	JPN	392	Japan 	Japonska	\N
00040000-55e9-575c-a6d8-5bb87bea9739	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55e9-575c-3bfb-f014bb1ffde1	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55e9-575c-77dd-80d587d866c9	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55e9-575c-56dc-f75525233aa8	KE	KEN	404	Kenya 	Kenija	\N
00040000-55e9-575c-1502-730592c935c6	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55e9-575c-31b6-a377214145fd	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55e9-575c-5c33-c69b8ad9a877	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55e9-575c-3730-456b98fc2eb1	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55e9-575c-e455-0f67998d06ef	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55e9-575c-4d45-f5acebfc734b	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55e9-575c-f323-06cfa4b287ef	LV	LVA	428	Latvia 	Latvija	\N
00040000-55e9-575c-2d66-44989830932c	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55e9-575c-cea3-67501ea89a0a	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55e9-575c-9203-e39f7416a293	LR	LBR	430	Liberia 	Liberija	\N
00040000-55e9-575c-2528-ab2667618f03	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55e9-575c-bbe6-842235e5472c	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55e9-575c-3663-f20247c08122	LT	LTU	440	Lithuania 	Litva	\N
00040000-55e9-575c-c21d-d2282a538baa	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55e9-575c-4692-591a764f71bc	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55e9-575c-bd24-ad59e6b4714f	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55e9-575c-c8b2-40d1b376fa58	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55e9-575c-aa41-47a9220e2b95	MW	MWI	454	Malawi 	Malavi	\N
00040000-55e9-575c-7226-6ba73a891aed	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55e9-575c-15dc-b713a244b7cc	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55e9-575c-ec73-d0d085b5d2ac	ML	MLI	466	Mali 	Mali	\N
00040000-55e9-575c-05d3-65926d20c84b	MT	MLT	470	Malta 	Malta	\N
00040000-55e9-575c-487c-a5763d3cff28	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55e9-575c-d767-f51deb055c6a	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55e9-575c-12e7-225c8d2c5220	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55e9-575c-ce60-5cbae7c2a686	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55e9-575c-4a6f-33c6231eeded	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55e9-575c-c08c-e63b51d1e05e	MX	MEX	484	Mexico 	Mehika	\N
00040000-55e9-575c-b3b5-2f7c25a7a4c4	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55e9-575c-1a7b-89d2b0289072	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55e9-575c-f378-df5475e32726	MC	MCO	492	Monaco 	Monako	\N
00040000-55e9-575c-938c-e2d20188bbb0	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55e9-575c-390b-5c9a050d0c3f	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55e9-575c-63bd-4375ff918e87	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55e9-575c-30bb-705cf25e8639	MA	MAR	504	Morocco 	Maroko	\N
00040000-55e9-575c-373c-3ccffd606617	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55e9-575c-13a2-2482692a10e1	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55e9-575c-b6aa-07b880b657e9	NA	NAM	516	Namibia 	Namibija	\N
00040000-55e9-575c-3e7e-86bc930f9af4	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55e9-575c-489b-03faa2e13e6e	NP	NPL	524	Nepal 	Nepal	\N
00040000-55e9-575c-a67d-da968f7a5ae2	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55e9-575c-b10f-527da9f86e57	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55e9-575c-f5d5-4a4cdbc2b86b	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55e9-575c-6b8c-1fb808a9e6a0	NE	NER	562	Niger 	Niger 	\N
00040000-55e9-575c-727c-41cf0a46d0b5	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55e9-575c-0af9-35300ff21cf8	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55e9-575c-46ba-61e26667c091	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55e9-575c-01c8-125f03c64a2b	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55e9-575c-ee5b-48941ad634a4	NO	NOR	578	Norway 	Norveška	\N
00040000-55e9-575c-f1b4-b0f56cef7931	OM	OMN	512	Oman 	Oman	\N
00040000-55e9-575c-3af5-721bb929158b	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55e9-575c-f6fb-118ff68f2ae4	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55e9-575c-0da4-d0049126f597	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55e9-575c-7afa-b7572b6d4c0a	PA	PAN	591	Panama 	Panama	\N
00040000-55e9-575c-2453-e859be87f328	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55e9-575c-5e43-6fd562e1a2d8	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55e9-575c-a092-a4a97cbea955	PE	PER	604	Peru 	Peru	\N
00040000-55e9-575c-d87f-1d4a499bee2c	PH	PHL	608	Philippines 	Filipini	\N
00040000-55e9-575c-2801-dafe2f6bf544	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55e9-575c-d2d8-dcacb9734467	PL	POL	616	Poland 	Poljska	\N
00040000-55e9-575c-b595-322455976a2c	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55e9-575c-e582-3ff757631505	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55e9-575c-09f8-7ecf7b4f1763	QA	QAT	634	Qatar 	Katar	\N
00040000-55e9-575c-61c2-ae3900aec38a	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55e9-575c-c908-5677f3d9ea03	RO	ROU	642	Romania 	Romunija	\N
00040000-55e9-575c-86aa-ae32a88c517e	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55e9-575c-a3f8-1ab0de460661	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55e9-575c-b121-e1db5e0108c5	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55e9-575c-f6a6-f987c90088b3	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55e9-575c-7cef-65cdcfe68e69	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55e9-575c-5189-1335fb0c437c	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55e9-575c-acfb-76828952bccb	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55e9-575c-cb41-2373fd56f888	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55e9-575c-74d6-67a105aa2cad	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55e9-575c-1f89-3beb0fadfe1f	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55e9-575c-2f40-fab29bab5a2b	SM	SMR	674	San Marino 	San Marino	\N
00040000-55e9-575c-a6d7-575bab40092c	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55e9-575c-bdf0-d6266d6ab940	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55e9-575c-1068-282d1bfd17a1	SN	SEN	686	Senegal 	Senegal	\N
00040000-55e9-575c-eecc-7ed229f7c502	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55e9-575c-9c77-3c7483810d70	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55e9-575c-b0aa-93a422cd8ded	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55e9-575c-8f8e-bd22e03c17d8	SG	SGP	702	Singapore 	Singapur	\N
00040000-55e9-575c-57fe-2fd92affc2ec	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55e9-575c-9859-d3f73c726b12	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55e9-575c-e2d1-c858e9aff85e	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55e9-575c-4f26-147018fa614c	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55e9-575c-828b-f9f3f2c4b356	SO	SOM	706	Somalia 	Somalija	\N
00040000-55e9-575c-530c-b8c1c9882540	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55e9-575c-0921-719e29b8f894	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55e9-575c-3d1b-4781cbf8b277	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55e9-575c-f179-f2bd45266417	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55e9-575c-e354-d29f7968c69f	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55e9-575c-042a-c767a088dbb0	SD	SDN	729	Sudan 	Sudan	\N
00040000-55e9-575c-6fb4-00587c209fce	SR	SUR	740	Suriname 	Surinam	\N
00040000-55e9-575c-7a44-d40f892ba676	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55e9-575c-4450-f82cb2b965ab	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55e9-575c-801b-d4ee32a5bf15	SE	SWE	752	Sweden 	Švedska	\N
00040000-55e9-575c-cf4a-5827179f2eff	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55e9-575c-bce7-fb2604adec99	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55e9-575c-2038-edc230dc307b	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55e9-575c-03b1-37f806d061df	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55e9-575c-0529-2621c2f1ff04	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55e9-575c-a54b-9757656e6db3	TH	THA	764	Thailand 	Tajska	\N
00040000-55e9-575c-4274-0000f18b76f7	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55e9-575c-8b1b-44b51e574e22	TG	TGO	768	Togo 	Togo	\N
00040000-55e9-575c-5ade-9937887a8458	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55e9-575c-aae7-6eec25893c51	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55e9-575c-3378-0b1a6c8cfc96	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55e9-575c-41be-8dc1beaa5d4a	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55e9-575c-7711-e5e2e528ed52	TR	TUR	792	Turkey 	Turčija	\N
00040000-55e9-575c-2d9e-bd4addcf86c1	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55e9-575c-06f8-b89d71eee565	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55e9-575c-76a1-88c3b23b3e0c	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55e9-575c-d4cf-8e79f273b804	UG	UGA	800	Uganda 	Uganda	\N
00040000-55e9-575c-ba20-e02c3273592d	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55e9-575c-86fc-d9d5f4f7dbeb	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55e9-575c-90c3-b3e46c87a3d0	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55e9-575c-2844-e71f24e2c204	US	USA	840	United States 	Združene države Amerike	\N
00040000-55e9-575c-19ac-a155976036bf	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55e9-575c-e8a4-f3cbcc5939c1	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55e9-575c-325d-db2f74c4130d	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55e9-575c-4252-2b94fed7473c	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55e9-575c-d3dc-c60be478d714	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55e9-575c-2bc4-f3c868586840	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55e9-575c-adfd-242516235ff4	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55e9-575c-9b5f-9051d49105b0	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55e9-575c-3c9b-b0e4ec2618da	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55e9-575c-8a4e-592f253e5b4f	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55e9-575c-e8bf-2ddbca866872	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55e9-575c-428a-c892ffd128b8	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55e9-575c-ec92-90f92fbee796	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2957 (class 0 OID 17302891)
-- Dependencies: 224
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55e9-575e-b7dc-b8dca3422e9a	000e0000-55e9-575e-6e05-a004274f73a5	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e9-575c-5541-4eb60ae35982	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55e9-575e-ba68-f9dbeb551e4a	000e0000-55e9-575e-f27a-9975671ea120	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e9-575c-5b5b-ab9545d01a72	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55e9-575e-3666-5bcf005b6733	000e0000-55e9-575e-60c1-2887d5f8dd33	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e9-575c-5541-4eb60ae35982	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55e9-575e-1e07-7585a84aa320	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55e9-575e-ab6f-95f1f7e34c65	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2943 (class 0 OID 17302706)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55e9-575e-c236-0718eb9f6ad5	000e0000-55e9-575e-f27a-9975671ea120	000c0000-55e9-575e-4d9b-8d156a69505c	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55e9-575c-3b98-5a84fcf1e746
000d0000-55e9-575e-8c68-dce3099526a8	000e0000-55e9-575e-f27a-9975671ea120	000c0000-55e9-575e-15b3-41a1704896d8	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55e9-575c-2f4f-be96b6ab5fb1
000d0000-55e9-575e-9ec5-50f0a74c9318	000e0000-55e9-575e-f27a-9975671ea120	000c0000-55e9-575e-8e08-4f432425a4f0	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55e9-575c-22f8-e3b00f1e008b
000d0000-55e9-575e-ded8-1690f67ad61c	000e0000-55e9-575e-f27a-9975671ea120	000c0000-55e9-575e-c962-3a24116352bd	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55e9-575c-be31-eccedc816861
000d0000-55e9-575e-73e8-959e05423758	000e0000-55e9-575e-f27a-9975671ea120	000c0000-55e9-575e-3337-a71afd8ec48d	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55e9-575c-be31-eccedc816861
000d0000-55e9-575e-d013-80f2ddcc7584	000e0000-55e9-575e-f27a-9975671ea120	000c0000-55e9-575e-57d4-aaddadc9c86c	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55e9-575c-3b98-5a84fcf1e746
000d0000-55e9-575e-6906-57871d0f8260	000e0000-55e9-575e-f27a-9975671ea120	000c0000-55e9-575e-b5e0-fbe7d1d5b2f5	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55e9-575c-3b98-5a84fcf1e746
000d0000-55e9-575e-a1ac-a2a267237fab	000e0000-55e9-575e-f27a-9975671ea120	000c0000-55e9-575e-7bb7-71160ff4354c	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55e9-575c-f59b-fb2563444bd8
\.


--
-- TOC entry 2923 (class 0 OID 17302521)
-- Dependencies: 190
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2921 (class 0 OID 17302502)
-- Dependencies: 188
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55e9-575e-8132-1192f8d8547f	00080000-55e9-575e-fd4b-fd5700d80146	00090000-55e9-575e-42b4-14a2068bff8d	AK		
\.


--
-- TOC entry 2932 (class 0 OID 17302620)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 17303107)
-- Dependencies: 237
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 17303119)
-- Dependencies: 238
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2973 (class 0 OID 17303141)
-- Dependencies: 240
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 16867877)
-- Dependencies: 170
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY migrations (version) FROM stdin;
20150824004401
20150826210511
20150827174118
20150831215248
\.


--
-- TOC entry 2936 (class 0 OID 17302645)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2918 (class 0 OID 17302459)
-- Dependencies: 185
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55e9-575d-10ac-3ddf9ec332c4	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55e9-575d-6c80-2adb8d11672d	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55e9-575d-fbde-be374a8949a6	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55e9-575d-c70e-28e4f0984b23	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55e9-575d-f002-5498301bf299	dogodek.status	array	a:7:{i:100;a:1:{s:5:"label";s:11:"Dolgoročno";}i:200;a:1:{s:5:"label";s:9:"Planirano";}i:300;a:1:{s:5:"label";s:8:"Fiksiran";}i:400;a:1:{s:5:"label";s:17:"Potrjen - interno";}i:500;a:1:{s:5:"label";s:15:"Potrjen - javno";}i:600;a:1:{s:5:"label";s:10:"Zaključen";}i:700;a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55e9-575d-11b0-1aa1ea31a1f2	dogodek.razred	array	a:5:{i:100;a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}i:200;a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}i:300;a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}i:400;a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}i:500;a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55e9-575d-de33-8bed55c6de49	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55e9-575d-2328-9066f5acb391	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55e9-575d-9f46-611ae30e57e3	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55e9-575d-1a4d-b583763eb999	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55e9-575d-22f3-2a7409190806	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55e9-575d-44c4-339cbc293fa6	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55e9-575d-bdd8-8f2134d9ed0a	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55e9-575d-6043-57b3ce58305b	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55e9-575e-e10e-a18b14392799	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55e9-575e-efa0-3c55d93229ae	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55e9-575e-980f-ddf2c90725b3	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55e9-575e-4be0-1837ababd670	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55e9-575e-213a-fb673e8cff20	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55e9-575f-9936-5da49359090d	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2912 (class 0 OID 17302373)
-- Dependencies: 179
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55e9-575e-f933-07f6161ba67d	00000000-55e9-575e-e10e-a18b14392799	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55e9-575e-8164-82dbfdb70366	00000000-55e9-575e-e10e-a18b14392799	00010000-55e9-575d-a7c5-3d639824fbfa	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55e9-575e-3678-912ace0c5cf8	00000000-55e9-575e-efa0-3c55d93229ae	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2913 (class 0 OID 17302384)
-- Dependencies: 180
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55e9-575e-1377-579176fd1c56	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55e9-575e-37fc-66908d39b308	00010000-55e9-575e-7f9c-0865528b9b6e	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55e9-575e-60cd-9d2b40ba86ed	00010000-55e9-575e-18fa-4f497f40f736	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55e9-575e-0be0-bcba564e1ffe	00010000-55e9-575e-aed2-55e7d23519bf	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55e9-575e-5424-b18d329bb2d2	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55e9-575e-6a77-f287a97854a5	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55e9-575e-ce7f-b94fff91c06a	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55e9-575e-2404-74101c022aea	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55e9-575e-42b4-14a2068bff8d	00010000-55e9-575e-4ede-2d0c822df31f	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55e9-575e-bdcc-24bd6d621ecd	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55e9-575e-7db1-e932cfde2133	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55e9-575e-072a-5dd7ac1c2e78	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55e9-575e-d91a-51e5cc9b7fcb	00010000-55e9-575e-fe49-b1439fa21ccd	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2908 (class 0 OID 17302338)
-- Dependencies: 175
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55e9-575d-c511-b1c7a1d88897	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55e9-575d-8391-5fc99d5f067f	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55e9-575d-68a5-fba5a42c168d	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55e9-575d-8d69-d5151a6088a8	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55e9-575d-15ad-898ea12f4a17	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55e9-575d-4f69-f28f2d343bb0	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55e9-575d-2f35-690216fd0b96	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55e9-575d-1131-82e28d52f988	Abonma-read	Abonma - branje	f
00030000-55e9-575d-286c-995295e57a35	Abonma-write	Abonma - spreminjanje	f
00030000-55e9-575d-64ca-ed60fefb4ca9	Alternacija-read	Alternacija - branje	f
00030000-55e9-575d-d12b-72adb31c82ae	Alternacija-write	Alternacija - spreminjanje	f
00030000-55e9-575d-d6d3-196498a61126	Arhivalija-read	Arhivalija - branje	f
00030000-55e9-575d-cd5b-70bb9dac3927	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55e9-575d-9dd7-9bb52a0ab999	Besedilo-read	Besedilo - branje	f
00030000-55e9-575d-9dd1-a4d653314017	Besedilo-write	Besedilo - spreminjanje	f
00030000-55e9-575d-0729-568744a51218	DogodekIzven-read	DogodekIzven - branje	f
00030000-55e9-575d-2949-a7607e72d6b2	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55e9-575d-d625-8f72c359be20	Dogodek-read	Dogodek - branje	f
00030000-55e9-575d-b82f-58e28796c246	Dogodek-write	Dogodek - spreminjanje	f
00030000-55e9-575d-3c6f-d5ed6dd37e87	DrugiVir-read	DrugiVir - branje	f
00030000-55e9-575d-ccf2-d584df3c2164	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55e9-575d-09ac-357393ded755	Drzava-read	Drzava - branje	f
00030000-55e9-575d-d9c7-8b237af8e2c4	Drzava-write	Drzava - spreminjanje	f
00030000-55e9-575d-aca8-f84feed57bee	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55e9-575d-3f62-5f8932e21443	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55e9-575d-c4c8-cc0ea1e74673	Funkcija-read	Funkcija - branje	f
00030000-55e9-575d-07db-61095470a456	Funkcija-write	Funkcija - spreminjanje	f
00030000-55e9-575d-2f24-d72cf70d91ba	Gostovanje-read	Gostovanje - branje	f
00030000-55e9-575d-afa8-7ac4c01a7959	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55e9-575d-66cb-d22c6b43b8ad	Gostujoca-read	Gostujoca - branje	f
00030000-55e9-575d-891b-c99d3a54d8e1	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55e9-575d-6732-032927b2c5dd	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55e9-575d-a5b8-aa2b18359fe0	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55e9-575d-4c00-c38b7bd95648	Kupec-read	Kupec - branje	f
00030000-55e9-575d-3ae1-8ee8be6ea525	Kupec-write	Kupec - spreminjanje	f
00030000-55e9-575d-accb-369889bbdc49	NacinPlacina-read	NacinPlacina - branje	f
00030000-55e9-575d-d79d-953ec029cc81	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55e9-575d-5750-00c658930537	Option-read	Option - branje	f
00030000-55e9-575d-3fec-46fed7c28cf5	Option-write	Option - spreminjanje	f
00030000-55e9-575d-bbf2-eb308df64b45	OptionValue-read	OptionValue - branje	f
00030000-55e9-575d-6c3b-d17af3879c9c	OptionValue-write	OptionValue - spreminjanje	f
00030000-55e9-575d-e681-2db6092b7cfe	Oseba-read	Oseba - branje	f
00030000-55e9-575d-b43d-41b21bb06fb8	Oseba-write	Oseba - spreminjanje	f
00030000-55e9-575d-2d33-46afc4a08ca3	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55e9-575d-d045-ee42930d552e	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55e9-575d-8705-2d6464f863c8	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55e9-575d-964d-b9ab7112626e	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55e9-575d-9d12-617fdf6b1fac	Pogodba-read	Pogodba - branje	f
00030000-55e9-575d-fab7-d0ad7be6e8f3	Pogodba-write	Pogodba - spreminjanje	f
00030000-55e9-575d-5e18-9096b777d830	Popa-read	Popa - branje	f
00030000-55e9-575d-d503-cb118aabc64a	Popa-write	Popa - spreminjanje	f
00030000-55e9-575d-30fa-6f81ac0ed428	Posta-read	Posta - branje	f
00030000-55e9-575d-3976-e95ffa885fd6	Posta-write	Posta - spreminjanje	f
00030000-55e9-575d-3ec7-daa7c8155db6	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55e9-575d-313b-9a6a6daff7ec	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55e9-575d-ad8c-44a06e892918	PostniNaslov-read	PostniNaslov - branje	f
00030000-55e9-575d-9ff6-e30bf7075b9e	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55e9-575d-d072-204b3ae75e52	Predstava-read	Predstava - branje	f
00030000-55e9-575d-bce2-a554d32bcebb	Predstava-write	Predstava - spreminjanje	f
00030000-55e9-575d-5f10-0e7cd0d4eddd	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55e9-575d-5432-1146e2345750	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55e9-575d-b5d1-1cd2b22780f2	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55e9-575d-8389-68079796c389	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55e9-575d-d547-effce1db7878	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55e9-575d-b3c3-a692e6851d0a	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55e9-575d-72cf-db125ec4cb36	ProgramDela-read	ProgramDela - branje	f
00030000-55e9-575d-35da-8cac8d315a11	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55e9-575d-12b7-2d58c20272a9	ProgramFestival-read	ProgramFestival - branje	f
00030000-55e9-575d-2edf-4e7e51dc6abb	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55e9-575d-d11e-37324a276dcb	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55e9-575d-f819-ba8d5106abaa	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55e9-575d-c90e-5746daac805d	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55e9-575d-c692-86e53c90c446	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55e9-575d-30a9-fc1255cb9696	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55e9-575d-3d76-98b311c28d97	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55e9-575d-242d-2201c13b303f	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55e9-575d-dd68-876b3eae24fb	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55e9-575d-36cc-d1d6a82abc86	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55e9-575d-6a01-b97336b9e16e	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55e9-575d-c562-9c00cda79de8	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55e9-575d-b070-60888d407659	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55e9-575d-902d-2eb75b61a372	ProgramRazno-read	ProgramRazno - branje	f
00030000-55e9-575d-9173-50bd3a6ccc58	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55e9-575d-7cb6-66f50881920b	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55e9-575d-d3fc-49454f86de8f	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55e9-575d-bd5a-962f4696dc7c	Prostor-read	Prostor - branje	f
00030000-55e9-575d-8500-bb4d529272e1	Prostor-write	Prostor - spreminjanje	f
00030000-55e9-575d-7537-46113b5dc3c2	Racun-read	Racun - branje	f
00030000-55e9-575d-c8c0-42b5dfe3188e	Racun-write	Racun - spreminjanje	f
00030000-55e9-575d-5928-404062e8c01e	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55e9-575d-0a3b-d3f60278c6fa	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55e9-575d-58a4-f0952c181d69	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55e9-575d-eca2-0b07b5f4889e	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55e9-575d-ddc9-009c234cc385	Rekvizit-read	Rekvizit - branje	f
00030000-55e9-575d-3eea-34a862ebcd38	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55e9-575d-488d-b6f63b4f247e	Revizija-read	Revizija - branje	f
00030000-55e9-575d-d44f-263e6f22b745	Revizija-write	Revizija - spreminjanje	f
00030000-55e9-575d-bae8-ab2672fe0fab	Rezervacija-read	Rezervacija - branje	f
00030000-55e9-575d-3941-1d3068147f83	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55e9-575d-6334-05453db17454	SedezniRed-read	SedezniRed - branje	f
00030000-55e9-575d-70b9-f8ca0b6f39dd	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55e9-575d-90ee-84fde83a5151	Sedez-read	Sedez - branje	f
00030000-55e9-575d-4394-59391d7c4699	Sedez-write	Sedez - spreminjanje	f
00030000-55e9-575d-8ff5-32678880ede3	Sezona-read	Sezona - branje	f
00030000-55e9-575d-c465-cc5d3288b438	Sezona-write	Sezona - spreminjanje	f
00030000-55e9-575d-662f-55894d11fd9f	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55e9-575d-d121-40b17df243db	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55e9-575d-9ae3-9b8692216a56	Stevilcenje-read	Stevilcenje - branje	f
00030000-55e9-575d-d148-641a68f927cd	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55e9-575d-893c-6b51772aa333	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55e9-575d-8c32-a90559010ddf	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55e9-575d-77c4-df61ad4a50d0	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55e9-575d-243d-0c751a9b9247	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55e9-575d-e5c1-fb5df3ab6f73	Telefonska-read	Telefonska - branje	f
00030000-55e9-575d-3b7c-b8efbdc8e610	Telefonska-write	Telefonska - spreminjanje	f
00030000-55e9-575d-f8c9-354c68a86ff9	TerminStoritve-read	TerminStoritve - branje	f
00030000-55e9-575d-0d4a-9fb8efa57ae8	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55e9-575d-3fce-13d00622dc22	TipFunkcije-read	TipFunkcije - branje	f
00030000-55e9-575d-5623-867dd9648d90	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55e9-575d-7561-4bf6ad6258f6	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55e9-575d-f861-f62517a3dd0f	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55e9-575d-f621-e35ff63fdcf4	Trr-read	Trr - branje	f
00030000-55e9-575d-c26d-832c1643f1cd	Trr-write	Trr - spreminjanje	f
00030000-55e9-575d-1123-72716431a919	Uprizoritev-read	Uprizoritev - branje	f
00030000-55e9-575d-e4e5-5388c68bcba5	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55e9-575d-71af-a5c8da261fde	Vaja-read	Vaja - branje	f
00030000-55e9-575d-d80e-5cd79b7ce2a1	Vaja-write	Vaja - spreminjanje	f
00030000-55e9-575d-c75a-b112379c33e3	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55e9-575d-4c74-2c7b07b65da4	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55e9-575d-bcb3-b732ee0ed019	VrstaStroska-read	VrstaStroska - branje	f
00030000-55e9-575d-baf1-2c0f98d29d88	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55e9-575d-05d4-2d95e005b63b	Zaposlitev-read	Zaposlitev - branje	f
00030000-55e9-575d-78a9-47839fb4a84c	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55e9-575d-bf79-db77689f99eb	Zasedenost-read	Zasedenost - branje	f
00030000-55e9-575d-58d1-6792ab7a4ffd	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55e9-575d-da0f-0a9f4f7b427d	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55e9-575d-af2c-d3deb7a78462	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55e9-575d-ee19-e943db55bfc8	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55e9-575d-4c2f-b01bae5d2966	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55e9-575d-088a-777e3bf0df9c	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55e9-575d-f9d8-a3151da919a3	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55e9-575d-3040-06628f939bbd	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55e9-575d-6570-3b13dd7321d2	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55e9-575d-517d-c7974c7153e9	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55e9-575d-1e02-539bec57b935	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55e9-575d-a7f1-d8041cdd5fa9	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55e9-575d-2b64-908c493e8eb3	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55e9-575d-a735-b64a25059e73	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55e9-575d-a405-4a2da3882617	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55e9-575d-5db1-9e7dc0d34bba	Datoteka-write	Datoteka - spreminjanje	f
00030000-55e9-575d-bc05-76678d69fe4c	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2910 (class 0 OID 17302357)
-- Dependencies: 177
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55e9-575d-cf74-b18c776ec426	00030000-55e9-575d-8391-5fc99d5f067f
00020000-55e9-575d-acea-c3a45b530919	00030000-55e9-575d-09ac-357393ded755
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-1131-82e28d52f988
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-286c-995295e57a35
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-64ca-ed60fefb4ca9
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-d12b-72adb31c82ae
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-d6d3-196498a61126
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-d625-8f72c359be20
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-8d69-d5151a6088a8
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-b82f-58e28796c246
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-09ac-357393ded755
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-d9c7-8b237af8e2c4
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-c4c8-cc0ea1e74673
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-07db-61095470a456
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-2f24-d72cf70d91ba
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-afa8-7ac4c01a7959
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-66cb-d22c6b43b8ad
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-891b-c99d3a54d8e1
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-6732-032927b2c5dd
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-a5b8-aa2b18359fe0
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-5750-00c658930537
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-bbf2-eb308df64b45
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-e681-2db6092b7cfe
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-b43d-41b21bb06fb8
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-5e18-9096b777d830
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-d503-cb118aabc64a
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-30fa-6f81ac0ed428
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-3976-e95ffa885fd6
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-ad8c-44a06e892918
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-9ff6-e30bf7075b9e
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-d072-204b3ae75e52
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-bce2-a554d32bcebb
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-d547-effce1db7878
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-b3c3-a692e6851d0a
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-bd5a-962f4696dc7c
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-8500-bb4d529272e1
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-58a4-f0952c181d69
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-eca2-0b07b5f4889e
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-ddc9-009c234cc385
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-3eea-34a862ebcd38
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-8ff5-32678880ede3
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-c465-cc5d3288b438
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-3fce-13d00622dc22
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-1123-72716431a919
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-e4e5-5388c68bcba5
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-71af-a5c8da261fde
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-d80e-5cd79b7ce2a1
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-bf79-db77689f99eb
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-58d1-6792ab7a4ffd
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-da0f-0a9f4f7b427d
00020000-55e9-575d-a214-a2403eefac73	00030000-55e9-575d-ee19-e943db55bfc8
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-1131-82e28d52f988
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-d6d3-196498a61126
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-d625-8f72c359be20
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-09ac-357393ded755
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-2f24-d72cf70d91ba
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-66cb-d22c6b43b8ad
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-6732-032927b2c5dd
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-a5b8-aa2b18359fe0
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-5750-00c658930537
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-bbf2-eb308df64b45
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-e681-2db6092b7cfe
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-b43d-41b21bb06fb8
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-5e18-9096b777d830
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-30fa-6f81ac0ed428
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-ad8c-44a06e892918
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-9ff6-e30bf7075b9e
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-d072-204b3ae75e52
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-bd5a-962f4696dc7c
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-58a4-f0952c181d69
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-ddc9-009c234cc385
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-8ff5-32678880ede3
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-e5c1-fb5df3ab6f73
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-3b7c-b8efbdc8e610
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-f621-e35ff63fdcf4
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-c26d-832c1643f1cd
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-05d4-2d95e005b63b
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-78a9-47839fb4a84c
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-da0f-0a9f4f7b427d
00020000-55e9-575d-5436-6caac1bd0cf0	00030000-55e9-575d-ee19-e943db55bfc8
00020000-55e9-575d-c339-4846f01196f3	00030000-55e9-575d-1131-82e28d52f988
00020000-55e9-575d-c339-4846f01196f3	00030000-55e9-575d-64ca-ed60fefb4ca9
00020000-55e9-575d-c339-4846f01196f3	00030000-55e9-575d-d6d3-196498a61126
00020000-55e9-575d-c339-4846f01196f3	00030000-55e9-575d-cd5b-70bb9dac3927
00020000-55e9-575d-c339-4846f01196f3	00030000-55e9-575d-9dd7-9bb52a0ab999
00020000-55e9-575d-c339-4846f01196f3	00030000-55e9-575d-0729-568744a51218
00020000-55e9-575d-c339-4846f01196f3	00030000-55e9-575d-d625-8f72c359be20
00020000-55e9-575d-c339-4846f01196f3	00030000-55e9-575d-09ac-357393ded755
00020000-55e9-575d-c339-4846f01196f3	00030000-55e9-575d-c4c8-cc0ea1e74673
00020000-55e9-575d-c339-4846f01196f3	00030000-55e9-575d-2f24-d72cf70d91ba
00020000-55e9-575d-c339-4846f01196f3	00030000-55e9-575d-66cb-d22c6b43b8ad
00020000-55e9-575d-c339-4846f01196f3	00030000-55e9-575d-6732-032927b2c5dd
00020000-55e9-575d-c339-4846f01196f3	00030000-55e9-575d-5750-00c658930537
00020000-55e9-575d-c339-4846f01196f3	00030000-55e9-575d-bbf2-eb308df64b45
00020000-55e9-575d-c339-4846f01196f3	00030000-55e9-575d-e681-2db6092b7cfe
00020000-55e9-575d-c339-4846f01196f3	00030000-55e9-575d-5e18-9096b777d830
00020000-55e9-575d-c339-4846f01196f3	00030000-55e9-575d-30fa-6f81ac0ed428
00020000-55e9-575d-c339-4846f01196f3	00030000-55e9-575d-d072-204b3ae75e52
00020000-55e9-575d-c339-4846f01196f3	00030000-55e9-575d-d547-effce1db7878
00020000-55e9-575d-c339-4846f01196f3	00030000-55e9-575d-bd5a-962f4696dc7c
00020000-55e9-575d-c339-4846f01196f3	00030000-55e9-575d-58a4-f0952c181d69
00020000-55e9-575d-c339-4846f01196f3	00030000-55e9-575d-ddc9-009c234cc385
00020000-55e9-575d-c339-4846f01196f3	00030000-55e9-575d-8ff5-32678880ede3
00020000-55e9-575d-c339-4846f01196f3	00030000-55e9-575d-3fce-13d00622dc22
00020000-55e9-575d-c339-4846f01196f3	00030000-55e9-575d-71af-a5c8da261fde
00020000-55e9-575d-c339-4846f01196f3	00030000-55e9-575d-bf79-db77689f99eb
00020000-55e9-575d-c339-4846f01196f3	00030000-55e9-575d-da0f-0a9f4f7b427d
00020000-55e9-575d-c339-4846f01196f3	00030000-55e9-575d-ee19-e943db55bfc8
00020000-55e9-575d-45a6-2dd866642d1d	00030000-55e9-575d-1131-82e28d52f988
00020000-55e9-575d-45a6-2dd866642d1d	00030000-55e9-575d-286c-995295e57a35
00020000-55e9-575d-45a6-2dd866642d1d	00030000-55e9-575d-d12b-72adb31c82ae
00020000-55e9-575d-45a6-2dd866642d1d	00030000-55e9-575d-d6d3-196498a61126
00020000-55e9-575d-45a6-2dd866642d1d	00030000-55e9-575d-d625-8f72c359be20
00020000-55e9-575d-45a6-2dd866642d1d	00030000-55e9-575d-09ac-357393ded755
00020000-55e9-575d-45a6-2dd866642d1d	00030000-55e9-575d-2f24-d72cf70d91ba
00020000-55e9-575d-45a6-2dd866642d1d	00030000-55e9-575d-66cb-d22c6b43b8ad
00020000-55e9-575d-45a6-2dd866642d1d	00030000-55e9-575d-5750-00c658930537
00020000-55e9-575d-45a6-2dd866642d1d	00030000-55e9-575d-bbf2-eb308df64b45
00020000-55e9-575d-45a6-2dd866642d1d	00030000-55e9-575d-5e18-9096b777d830
00020000-55e9-575d-45a6-2dd866642d1d	00030000-55e9-575d-30fa-6f81ac0ed428
00020000-55e9-575d-45a6-2dd866642d1d	00030000-55e9-575d-d072-204b3ae75e52
00020000-55e9-575d-45a6-2dd866642d1d	00030000-55e9-575d-bd5a-962f4696dc7c
00020000-55e9-575d-45a6-2dd866642d1d	00030000-55e9-575d-58a4-f0952c181d69
00020000-55e9-575d-45a6-2dd866642d1d	00030000-55e9-575d-ddc9-009c234cc385
00020000-55e9-575d-45a6-2dd866642d1d	00030000-55e9-575d-8ff5-32678880ede3
00020000-55e9-575d-45a6-2dd866642d1d	00030000-55e9-575d-3fce-13d00622dc22
00020000-55e9-575d-45a6-2dd866642d1d	00030000-55e9-575d-da0f-0a9f4f7b427d
00020000-55e9-575d-45a6-2dd866642d1d	00030000-55e9-575d-ee19-e943db55bfc8
00020000-55e9-575d-e39e-3a596d103625	00030000-55e9-575d-1131-82e28d52f988
00020000-55e9-575d-e39e-3a596d103625	00030000-55e9-575d-d6d3-196498a61126
00020000-55e9-575d-e39e-3a596d103625	00030000-55e9-575d-d625-8f72c359be20
00020000-55e9-575d-e39e-3a596d103625	00030000-55e9-575d-09ac-357393ded755
00020000-55e9-575d-e39e-3a596d103625	00030000-55e9-575d-2f24-d72cf70d91ba
00020000-55e9-575d-e39e-3a596d103625	00030000-55e9-575d-66cb-d22c6b43b8ad
00020000-55e9-575d-e39e-3a596d103625	00030000-55e9-575d-5750-00c658930537
00020000-55e9-575d-e39e-3a596d103625	00030000-55e9-575d-bbf2-eb308df64b45
00020000-55e9-575d-e39e-3a596d103625	00030000-55e9-575d-5e18-9096b777d830
00020000-55e9-575d-e39e-3a596d103625	00030000-55e9-575d-30fa-6f81ac0ed428
00020000-55e9-575d-e39e-3a596d103625	00030000-55e9-575d-d072-204b3ae75e52
00020000-55e9-575d-e39e-3a596d103625	00030000-55e9-575d-bd5a-962f4696dc7c
00020000-55e9-575d-e39e-3a596d103625	00030000-55e9-575d-58a4-f0952c181d69
00020000-55e9-575d-e39e-3a596d103625	00030000-55e9-575d-ddc9-009c234cc385
00020000-55e9-575d-e39e-3a596d103625	00030000-55e9-575d-8ff5-32678880ede3
00020000-55e9-575d-e39e-3a596d103625	00030000-55e9-575d-f8c9-354c68a86ff9
00020000-55e9-575d-e39e-3a596d103625	00030000-55e9-575d-68a5-fba5a42c168d
00020000-55e9-575d-e39e-3a596d103625	00030000-55e9-575d-3fce-13d00622dc22
00020000-55e9-575d-e39e-3a596d103625	00030000-55e9-575d-da0f-0a9f4f7b427d
00020000-55e9-575d-e39e-3a596d103625	00030000-55e9-575d-ee19-e943db55bfc8
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-c511-b1c7a1d88897
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-8391-5fc99d5f067f
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-68a5-fba5a42c168d
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-8d69-d5151a6088a8
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-15ad-898ea12f4a17
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-4f69-f28f2d343bb0
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-2f35-690216fd0b96
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-1131-82e28d52f988
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-286c-995295e57a35
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-64ca-ed60fefb4ca9
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-d12b-72adb31c82ae
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-d6d3-196498a61126
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-cd5b-70bb9dac3927
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-9dd7-9bb52a0ab999
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-9dd1-a4d653314017
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-0729-568744a51218
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-2949-a7607e72d6b2
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-d625-8f72c359be20
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-b82f-58e28796c246
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-09ac-357393ded755
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-d9c7-8b237af8e2c4
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-3c6f-d5ed6dd37e87
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-ccf2-d584df3c2164
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-aca8-f84feed57bee
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-3f62-5f8932e21443
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-c4c8-cc0ea1e74673
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-07db-61095470a456
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-2f24-d72cf70d91ba
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-afa8-7ac4c01a7959
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-66cb-d22c6b43b8ad
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-891b-c99d3a54d8e1
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-6732-032927b2c5dd
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-a5b8-aa2b18359fe0
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-4c00-c38b7bd95648
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-3ae1-8ee8be6ea525
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-accb-369889bbdc49
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-d79d-953ec029cc81
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-5750-00c658930537
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-3fec-46fed7c28cf5
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-bbf2-eb308df64b45
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-6c3b-d17af3879c9c
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-e681-2db6092b7cfe
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-b43d-41b21bb06fb8
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-2d33-46afc4a08ca3
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-d045-ee42930d552e
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-8705-2d6464f863c8
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-964d-b9ab7112626e
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-9d12-617fdf6b1fac
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-fab7-d0ad7be6e8f3
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-5e18-9096b777d830
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-d503-cb118aabc64a
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-30fa-6f81ac0ed428
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-3976-e95ffa885fd6
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-3ec7-daa7c8155db6
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-313b-9a6a6daff7ec
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-ad8c-44a06e892918
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-9ff6-e30bf7075b9e
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-d072-204b3ae75e52
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-bce2-a554d32bcebb
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-5f10-0e7cd0d4eddd
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-5432-1146e2345750
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-b5d1-1cd2b22780f2
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-8389-68079796c389
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-d547-effce1db7878
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-b3c3-a692e6851d0a
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-72cf-db125ec4cb36
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-35da-8cac8d315a11
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-12b7-2d58c20272a9
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-2edf-4e7e51dc6abb
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-d11e-37324a276dcb
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-f819-ba8d5106abaa
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-c90e-5746daac805d
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-c692-86e53c90c446
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-30a9-fc1255cb9696
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-3d76-98b311c28d97
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-242d-2201c13b303f
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-dd68-876b3eae24fb
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-36cc-d1d6a82abc86
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-6a01-b97336b9e16e
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-c562-9c00cda79de8
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-b070-60888d407659
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-902d-2eb75b61a372
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-9173-50bd3a6ccc58
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-7cb6-66f50881920b
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-d3fc-49454f86de8f
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-bd5a-962f4696dc7c
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-8500-bb4d529272e1
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-7537-46113b5dc3c2
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-c8c0-42b5dfe3188e
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-5928-404062e8c01e
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-0a3b-d3f60278c6fa
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-58a4-f0952c181d69
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-eca2-0b07b5f4889e
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-ddc9-009c234cc385
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-3eea-34a862ebcd38
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-488d-b6f63b4f247e
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-d44f-263e6f22b745
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-bae8-ab2672fe0fab
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-3941-1d3068147f83
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-6334-05453db17454
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-70b9-f8ca0b6f39dd
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-90ee-84fde83a5151
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-4394-59391d7c4699
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-8ff5-32678880ede3
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-c465-cc5d3288b438
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-662f-55894d11fd9f
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-d121-40b17df243db
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-9ae3-9b8692216a56
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-d148-641a68f927cd
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-893c-6b51772aa333
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-8c32-a90559010ddf
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-77c4-df61ad4a50d0
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-243d-0c751a9b9247
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-e5c1-fb5df3ab6f73
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-3b7c-b8efbdc8e610
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-f8c9-354c68a86ff9
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-0d4a-9fb8efa57ae8
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-3fce-13d00622dc22
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-5623-867dd9648d90
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-7561-4bf6ad6258f6
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-f861-f62517a3dd0f
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-f621-e35ff63fdcf4
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-c26d-832c1643f1cd
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-1123-72716431a919
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-e4e5-5388c68bcba5
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-71af-a5c8da261fde
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-d80e-5cd79b7ce2a1
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-c75a-b112379c33e3
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-4c74-2c7b07b65da4
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-bcb3-b732ee0ed019
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-baf1-2c0f98d29d88
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-05d4-2d95e005b63b
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-78a9-47839fb4a84c
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-bf79-db77689f99eb
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-58d1-6792ab7a4ffd
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-da0f-0a9f4f7b427d
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-af2c-d3deb7a78462
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-ee19-e943db55bfc8
00020000-55e9-575e-2f16-ea58fac866c1	00030000-55e9-575d-4c2f-b01bae5d2966
\.


--
-- TOC entry 2937 (class 0 OID 17302652)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2941 (class 0 OID 17302686)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 17302810)
-- Dependencies: 219
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55e9-575e-dfc4-ee7ccf4e3e14	00090000-55e9-575e-1377-579176fd1c56	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55e9-575e-c10f-cbe96c120dd3	00090000-55e9-575e-6a77-f287a97854a5	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55e9-575e-b19d-754d60c2d2f6	00090000-55e9-575e-d91a-51e5cc9b7fcb	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2915 (class 0 OID 17302417)
-- Dependencies: 182
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55e9-575e-fd4b-fd5700d80146	00040000-55e9-575c-e2d1-c858e9aff85e	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e9-575e-13b5-c99516efac6d	00040000-55e9-575c-e2d1-c858e9aff85e	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55e9-575e-7d41-7f0afb648070	00040000-55e9-575c-e2d1-c858e9aff85e	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e9-575e-cf06-27c2e3ba4afe	00040000-55e9-575c-e2d1-c858e9aff85e	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e9-575e-51c9-13ae1a8b319c	00040000-55e9-575c-e2d1-c858e9aff85e	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e9-575e-a0e9-7e69b9577d85	00040000-55e9-575c-b962-35078e5bd759	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e9-575e-a274-58a764fbef60	00040000-55e9-575c-1cf9-72ea30c2976c	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e9-575e-c3dc-c91bf15fcd3e	00040000-55e9-575c-16bc-9f7374f79bfc	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e9-575f-4c2c-85e4c8678a8c	00040000-55e9-575c-e2d1-c858e9aff85e	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2917 (class 0 OID 17302451)
-- Dependencies: 184
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55e9-575c-bc92-412d47f7c785	8341	Adlešiči
00050000-55e9-575c-e37e-c63b87cb2c11	5270	Ajdovščina
00050000-55e9-575c-5fc2-b9ca222e6a38	6280	Ankaran/Ancarano
00050000-55e9-575c-b135-c2fb5f9b5814	9253	Apače
00050000-55e9-575c-7301-6dcd7a6601a3	8253	Artiče
00050000-55e9-575c-db4d-8449c58c5af6	4275	Begunje na Gorenjskem
00050000-55e9-575c-081c-8eb3e9dfdc14	1382	Begunje pri Cerknici
00050000-55e9-575c-99b3-86881d1c4bfa	9231	Beltinci
00050000-55e9-575c-f740-10d609aa529e	2234	Benedikt
00050000-55e9-575c-68de-bbaad2cecace	2345	Bistrica ob Dravi
00050000-55e9-575c-98df-8401fb28ee8b	3256	Bistrica ob Sotli
00050000-55e9-575c-64fd-d35c0d459532	8259	Bizeljsko
00050000-55e9-575c-030d-ae210703e8f9	1223	Blagovica
00050000-55e9-575c-dea9-fb93816e688a	8283	Blanca
00050000-55e9-575c-033c-bb81af3e13b7	4260	Bled
00050000-55e9-575c-d3a4-7e39f7665234	4273	Blejska Dobrava
00050000-55e9-575c-7f1c-8d1d0c886c27	9265	Bodonci
00050000-55e9-575c-f1aa-bc90058f7681	9222	Bogojina
00050000-55e9-575c-ef2b-b9b0118e20f9	4263	Bohinjska Bela
00050000-55e9-575c-7f67-36f810fc50a7	4264	Bohinjska Bistrica
00050000-55e9-575c-84f5-15eb61ca51c8	4265	Bohinjsko jezero
00050000-55e9-575c-18ab-f76df42892c2	1353	Borovnica
00050000-55e9-575c-fd23-616de9fe69ae	8294	Boštanj
00050000-55e9-575c-7e8c-fb33ab13624f	5230	Bovec
00050000-55e9-575c-3f52-9b07ef84e416	5295	Branik
00050000-55e9-575c-489c-3d9da3b52ddd	3314	Braslovče
00050000-55e9-575c-1e5f-c09ef152c68c	5223	Breginj
00050000-55e9-575c-6ee8-855d163a7777	8280	Brestanica
00050000-55e9-575c-bf7f-549cac369649	2354	Bresternica
00050000-55e9-575c-f61a-829b7238e807	4243	Brezje
00050000-55e9-575c-a5a3-96c8b675ab03	1351	Brezovica pri Ljubljani
00050000-55e9-575c-9628-91cb2e2f93cd	8250	Brežice
00050000-55e9-575c-48e3-849926aefe3a	4210	Brnik - Aerodrom
00050000-55e9-575c-25e8-2b6066773a46	8321	Brusnice
00050000-55e9-575c-ff22-e716026fa19d	3255	Buče
00050000-55e9-575c-e8ed-5034f5319d88	8276	Bučka 
00050000-55e9-575c-1bf8-3bf6699a1c8d	9261	Cankova
00050000-55e9-575c-59c6-ba255b411379	3000	Celje 
00050000-55e9-575c-d780-5b47d1d5e5e4	3001	Celje - poštni predali
00050000-55e9-575c-d492-1706fbb5fe09	4207	Cerklje na Gorenjskem
00050000-55e9-575c-782e-9e1c1305f54b	8263	Cerklje ob Krki
00050000-55e9-575c-4bf8-7ff131be474b	1380	Cerknica
00050000-55e9-575c-1a20-041aa6da8a90	5282	Cerkno
00050000-55e9-575c-97b7-7fa89da2b919	2236	Cerkvenjak
00050000-55e9-575c-9de8-9103b5870f6c	2215	Ceršak
00050000-55e9-575c-106f-27256d10b7c6	2326	Cirkovce
00050000-55e9-575c-4713-29dbc621f220	2282	Cirkulane
00050000-55e9-575c-81e5-fcb6a42606c6	5273	Col
00050000-55e9-575c-38ef-a59e7d602e65	8251	Čatež ob Savi
00050000-55e9-575c-c4a9-170dcea14e60	1413	Čemšenik
00050000-55e9-575c-3673-38019408df41	5253	Čepovan
00050000-55e9-575c-2b3b-c13e1e836149	9232	Črenšovci
00050000-55e9-575c-5624-f366ea3981b9	2393	Črna na Koroškem
00050000-55e9-575c-d9b9-267ddd65435f	6275	Črni Kal
00050000-55e9-575c-6b51-3601ebf3d5ef	5274	Črni Vrh nad Idrijo
00050000-55e9-575c-5e8c-504ad6a4a6d9	5262	Črniče
00050000-55e9-575c-9db0-d87f4655e77e	8340	Črnomelj
00050000-55e9-575c-2173-0a886a376d8c	6271	Dekani
00050000-55e9-575c-fd09-8f3707954887	5210	Deskle
00050000-55e9-575c-3f03-62e7e6d24c9c	2253	Destrnik
00050000-55e9-575c-c42a-d6068f0b9dff	6215	Divača
00050000-55e9-575c-2ec0-fc2c716e00a2	1233	Dob
00050000-55e9-575c-ab73-729d7bd74c4a	3224	Dobje pri Planini
00050000-55e9-575c-cd75-84bf1378ed62	8257	Dobova
00050000-55e9-575c-df1a-a3ca4efa7b70	1423	Dobovec
00050000-55e9-575c-b455-c462d2de65ab	5263	Dobravlje
00050000-55e9-575c-ee11-e2cb2eaabdfe	3204	Dobrna
00050000-55e9-575c-b2b0-655468294727	8211	Dobrnič
00050000-55e9-575c-1f8a-aa6e4b4a6f27	1356	Dobrova
00050000-55e9-575c-63d3-feddc25c6096	9223	Dobrovnik/Dobronak 
00050000-55e9-575c-676a-9fa69e034ac7	5212	Dobrovo v Brdih
00050000-55e9-575c-77d8-ad0b462538d3	1431	Dol pri Hrastniku
00050000-55e9-575c-03d3-79f3e6b588a5	1262	Dol pri Ljubljani
00050000-55e9-575c-0372-19694653c994	1273	Dole pri Litiji
00050000-55e9-575c-5a3f-5dcf9215c0dd	1331	Dolenja vas
00050000-55e9-575c-7b4b-3ee026616746	8350	Dolenjske Toplice
00050000-55e9-575c-c768-92da541cc91f	1230	Domžale
00050000-55e9-575c-2735-d95255b41edd	2252	Dornava
00050000-55e9-575c-ddf0-bd4f6e51bbe9	5294	Dornberk
00050000-55e9-575c-7195-d440494d2009	1319	Draga
00050000-55e9-575c-faac-be2c2e3af16f	8343	Dragatuš
00050000-55e9-575c-7e47-87717f514ee2	3222	Dramlje
00050000-55e9-575c-f027-234caa791967	2370	Dravograd
00050000-55e9-575c-0e1d-40ca620095ec	4203	Duplje
00050000-55e9-575c-a5a2-40dcb0f06b71	6221	Dutovlje
00050000-55e9-575c-f3ab-de6db0310e0f	8361	Dvor
00050000-55e9-575c-a720-cc20c35e2bb9	2343	Fala
00050000-55e9-575c-cb8f-abbfdde413e4	9208	Fokovci
00050000-55e9-575c-8c75-c1d715db1748	2313	Fram
00050000-55e9-575c-5629-49e402f95396	3213	Frankolovo
00050000-55e9-575c-2687-477a39c675fa	1274	Gabrovka
00050000-55e9-575c-9e26-c64f92582ac5	8254	Globoko
00050000-55e9-575c-54d2-7e71511a2f80	5275	Godovič
00050000-55e9-575c-b32a-1a2de54163ae	4204	Golnik
00050000-55e9-575c-e018-2b1c041f952a	3303	Gomilsko
00050000-55e9-575c-e00a-b0dbb3275cd4	4224	Gorenja vas
00050000-55e9-575c-f1f0-4d140929b2c3	3263	Gorica pri Slivnici
00050000-55e9-575c-be53-7a7d870e023b	2272	Gorišnica
00050000-55e9-575c-2294-442fd483a645	9250	Gornja Radgona
00050000-55e9-575c-98fa-cd311eed696f	3342	Gornji Grad
00050000-55e9-575c-46b2-f89bece7d2f2	4282	Gozd Martuljek
00050000-55e9-575c-60b7-97c2407e3274	6272	Gračišče
00050000-55e9-575c-da2e-3b0a36f01fcc	9264	Grad
00050000-55e9-575c-0edf-005fc3393858	8332	Gradac
00050000-55e9-575c-0afc-1194b588df0d	1384	Grahovo
00050000-55e9-575c-a2b1-31a5878e9e74	5242	Grahovo ob Bači
00050000-55e9-575c-185f-6cd3918d2fa1	5251	Grgar
00050000-55e9-575c-673c-56f76779715f	3302	Griže
00050000-55e9-575c-5dce-aa6b626bb4d3	3231	Grobelno
00050000-55e9-575c-26fb-d81ec549b1ca	1290	Grosuplje
00050000-55e9-575c-5afd-1fd44103d1fb	2288	Hajdina
00050000-55e9-575c-6ef5-d1d55cc49666	8362	Hinje
00050000-55e9-575c-9c9b-21b541294d11	2311	Hoče
00050000-55e9-575c-f5f0-4328b7fc8abd	9205	Hodoš/Hodos
00050000-55e9-575c-1697-c470e0a9d44d	1354	Horjul
00050000-55e9-575c-dda8-2c029ca270ff	1372	Hotedršica
00050000-55e9-575c-d8be-8ac8d2888ef3	1430	Hrastnik
00050000-55e9-575c-202e-61559aed4942	6225	Hruševje
00050000-55e9-575c-e296-752f4d7a02de	4276	Hrušica
00050000-55e9-575c-c32c-0bc653dc731a	5280	Idrija
00050000-55e9-575c-4f02-92f20829bbd9	1292	Ig
00050000-55e9-575c-06ac-b7179ccaffed	6250	Ilirska Bistrica
00050000-55e9-575c-c151-a7010e41337c	6251	Ilirska Bistrica-Trnovo
00050000-55e9-575c-d189-a662c23e6aa0	1295	Ivančna Gorica
00050000-55e9-575c-9003-ea5d51fdaa95	2259	Ivanjkovci
00050000-55e9-575c-b4d8-9d059336757c	1411	Izlake
00050000-55e9-575c-430c-9fb2d83b33e0	6310	Izola/Isola
00050000-55e9-575c-0ec7-93f5199e0764	2222	Jakobski Dol
00050000-55e9-575c-dc3c-9d8991d59dc8	2221	Jarenina
00050000-55e9-575c-c544-97be2d7d8fa5	6254	Jelšane
00050000-55e9-575c-4d42-e0cebe6a53a5	4270	Jesenice
00050000-55e9-575c-bd31-62e90fe74b5d	8261	Jesenice na Dolenjskem
00050000-55e9-575c-1103-37e6da183b9c	3273	Jurklošter
00050000-55e9-575c-3e78-7453b59c56aa	2223	Jurovski Dol
00050000-55e9-575c-a032-e11c8c950b8b	2256	Juršinci
00050000-55e9-575c-89cf-ef523673bb81	5214	Kal nad Kanalom
00050000-55e9-575c-bf39-8f15d6edca5d	3233	Kalobje
00050000-55e9-575c-5131-d4c12c8e8f55	4246	Kamna Gorica
00050000-55e9-575c-8ad8-9357f44a97c6	2351	Kamnica
00050000-55e9-575c-b026-fa91f6a46f8c	1241	Kamnik
00050000-55e9-575c-6e8f-8aab2b73ab48	5213	Kanal
00050000-55e9-575c-8988-9263ecb992d8	8258	Kapele
00050000-55e9-575c-f984-a3e1f1c2ecb6	2362	Kapla
00050000-55e9-575c-5a5c-62226ce11e62	2325	Kidričevo
00050000-55e9-575c-7db2-921e4ee2ec7c	1412	Kisovec
00050000-55e9-575c-417e-36eff1045116	6253	Knežak
00050000-55e9-575c-057e-bc7e940f65e1	5222	Kobarid
00050000-55e9-575c-8f29-07564001ab7f	9227	Kobilje
00050000-55e9-575c-f07c-5914375af92f	1330	Kočevje
00050000-55e9-575c-7bc1-cfa60e14be93	1338	Kočevska Reka
00050000-55e9-575c-febd-4a5a0489be3f	2276	Kog
00050000-55e9-575c-31f4-f78062d3e407	5211	Kojsko
00050000-55e9-575c-3bc7-998fd75a9ce6	6223	Komen
00050000-55e9-575c-c10c-7141372f422c	1218	Komenda
00050000-55e9-575c-8c20-f027d029144e	6000	Koper/Capodistria 
00050000-55e9-575c-3b79-19dd0042e474	6001	Koper/Capodistria - poštni predali
00050000-55e9-575c-b9ba-a9d1d9bcbbd4	8282	Koprivnica
00050000-55e9-575c-e7c1-ec8dddf0b27b	5296	Kostanjevica na Krasu
00050000-55e9-575c-bb0a-25ee5df83604	8311	Kostanjevica na Krki
00050000-55e9-575c-13e3-c87a3edfdd2b	1336	Kostel
00050000-55e9-575c-4609-5d2ec59580f7	6256	Košana
00050000-55e9-575c-6a60-b7e3ddddfe7a	2394	Kotlje
00050000-55e9-575c-c35a-71751987976c	6240	Kozina
00050000-55e9-575c-9a6e-24ea577b0d48	3260	Kozje
00050000-55e9-575c-6e7a-e57fbe9d58a3	4000	Kranj 
00050000-55e9-575c-4749-c478e88fe3f9	4001	Kranj - poštni predali
00050000-55e9-575c-cc81-24a086f2e527	4280	Kranjska Gora
00050000-55e9-575c-28ac-5a39309ba12b	1281	Kresnice
00050000-55e9-575c-6e59-b16f771bd2d3	4294	Križe
00050000-55e9-575c-59b9-af7a78a08a15	9206	Križevci
00050000-55e9-575c-f7eb-8cb65af3e0b8	9242	Križevci pri Ljutomeru
00050000-55e9-575c-59f6-cb83b9b49e1f	1301	Krka
00050000-55e9-575c-6003-c8eb7f9070e7	8296	Krmelj
00050000-55e9-575c-e238-2c9cb830bf5a	4245	Kropa
00050000-55e9-575c-b620-f03be7b621d8	8262	Krška vas
00050000-55e9-575c-8c2c-6386f7cf6080	8270	Krško
00050000-55e9-575c-142a-5af128de53c5	9263	Kuzma
00050000-55e9-575c-088b-a4cfbb040245	2318	Laporje
00050000-55e9-575c-fe91-cb4815754bc1	3270	Laško
00050000-55e9-575c-79ca-7c880f0bdafb	1219	Laze v Tuhinju
00050000-55e9-575c-eeb1-d131e760051a	2230	Lenart v Slovenskih goricah
00050000-55e9-575c-652d-39a429486839	9220	Lendava/Lendva
00050000-55e9-575c-6a68-1d2cb849c0ef	4248	Lesce
00050000-55e9-575c-3201-4676387846b6	3261	Lesično
00050000-55e9-575c-4887-9198f50dd11c	8273	Leskovec pri Krškem
00050000-55e9-575c-0c8a-64b0abf5e3df	2372	Libeliče
00050000-55e9-575c-2f91-2ae70296aef3	2341	Limbuš
00050000-55e9-575c-3838-a7312c429525	1270	Litija
00050000-55e9-575c-a620-0a6d21b0cbf2	3202	Ljubečna
00050000-55e9-575c-a9ed-48447f7ab3ce	1000	Ljubljana 
00050000-55e9-575c-7f66-e3997f82c9e0	1001	Ljubljana - poštni predali
00050000-55e9-575c-c697-7e32381ae6d1	1231	Ljubljana - Črnuče
00050000-55e9-575c-f645-a247964e0cd4	1261	Ljubljana - Dobrunje
00050000-55e9-575c-e53a-b3e174ece7d9	1260	Ljubljana - Polje
00050000-55e9-575c-1b2a-9a1e05cebb9d	1210	Ljubljana - Šentvid
00050000-55e9-575c-6156-f178a6832642	1211	Ljubljana - Šmartno
00050000-55e9-575c-1ca3-d64b657f7f97	3333	Ljubno ob Savinji
00050000-55e9-575c-c99c-e853ef23bb28	9240	Ljutomer
00050000-55e9-575c-b5f9-3d719a1f6e08	3215	Loče
00050000-55e9-575c-00ff-243101dc9da3	5231	Log pod Mangartom
00050000-55e9-575c-01bd-1ae356c58ba9	1358	Log pri Brezovici
00050000-55e9-575c-eec9-7639aee88b75	1370	Logatec
00050000-55e9-575c-85b5-e91982f487a8	1371	Logatec
00050000-55e9-575c-30ff-e5df583c178b	1434	Loka pri Zidanem Mostu
00050000-55e9-575c-fde6-7b0c62bc9a4e	3223	Loka pri Žusmu
00050000-55e9-575c-8f13-7cac5069d6ce	6219	Lokev
00050000-55e9-575c-bb2d-9b346d922912	1318	Loški Potok
00050000-55e9-575c-4db0-046813f90dd2	2324	Lovrenc na Dravskem polju
00050000-55e9-575c-f979-578de3389a7f	2344	Lovrenc na Pohorju
00050000-55e9-575c-2e83-f3d647dee355	3334	Luče
00050000-55e9-575c-564c-a19746ea48bb	1225	Lukovica
00050000-55e9-575c-24e6-dd85d3376b70	9202	Mačkovci
00050000-55e9-575c-f744-dbc5c21a2133	2322	Majšperk
00050000-55e9-575c-aad0-a4e193906afa	2321	Makole
00050000-55e9-575c-b43d-f1789ba8605f	9243	Mala Nedelja
00050000-55e9-575c-b1b8-f8feacc1f8b9	2229	Malečnik
00050000-55e9-575c-8fe9-3cdc746bddb6	6273	Marezige
00050000-55e9-575c-3740-07cafa812a8e	2000	Maribor 
00050000-55e9-575c-1571-66792841fb4f	2001	Maribor - poštni predali
00050000-55e9-575c-ba91-8fc417840142	2206	Marjeta na Dravskem polju
00050000-55e9-575c-0989-21aab60c8c0d	2281	Markovci
00050000-55e9-575c-e94b-be98478f738a	9221	Martjanci
00050000-55e9-575c-155b-ed880bf967c5	6242	Materija
00050000-55e9-575c-3321-071e3764c8f9	4211	Mavčiče
00050000-55e9-575c-c671-0e6bf33ef9eb	1215	Medvode
00050000-55e9-575c-4d02-e1d6e43b4484	1234	Mengeš
00050000-55e9-575c-4666-834661d32d0a	8330	Metlika
00050000-55e9-575c-d00c-55f0f1b97c3b	2392	Mežica
00050000-55e9-575c-c312-8b64cb27ff0b	2204	Miklavž na Dravskem polju
00050000-55e9-575c-e444-fb719ec59c5f	2275	Miklavž pri Ormožu
00050000-55e9-575c-e576-aa366a388595	5291	Miren
00050000-55e9-575c-3ae3-4e88c3c6a724	8233	Mirna
00050000-55e9-575c-aee5-1a3675940f56	8216	Mirna Peč
00050000-55e9-575c-69ce-bece1d77baec	2382	Mislinja
00050000-55e9-575c-91e4-1411f0e5cc92	4281	Mojstrana
00050000-55e9-575c-0480-625f20dda5bc	8230	Mokronog
00050000-55e9-575c-04bf-0b31d74aa346	1251	Moravče
00050000-55e9-575c-fc70-ce24490b9d4a	9226	Moravske Toplice
00050000-55e9-575c-b893-fedb4551c2df	5216	Most na Soči
00050000-55e9-575c-5eb8-be218fba96f2	1221	Motnik
00050000-55e9-575c-5a73-22d2ffad9450	3330	Mozirje
00050000-55e9-575c-f373-1e0371106d8c	9000	Murska Sobota 
00050000-55e9-575c-4644-ab09fad92bda	9001	Murska Sobota - poštni predali
00050000-55e9-575c-e320-3a12c576519a	2366	Muta
00050000-55e9-575c-4182-0b1dec13bd35	4202	Naklo
00050000-55e9-575c-6c69-ce23020f2604	3331	Nazarje
00050000-55e9-575c-1c28-fa1da44f70be	1357	Notranje Gorice
00050000-55e9-575c-1d9d-478074d2463c	3203	Nova Cerkev
00050000-55e9-575c-51d3-f208f7a5abae	5000	Nova Gorica 
00050000-55e9-575c-d2bb-ec47c7365aaa	5001	Nova Gorica - poštni predali
00050000-55e9-575c-3f7a-62e026025d0d	1385	Nova vas
00050000-55e9-575c-5a36-07588419010e	8000	Novo mesto
00050000-55e9-575c-bd0e-0525964156b4	8001	Novo mesto - poštni predali
00050000-55e9-575c-8c63-1447d855cd2e	6243	Obrov
00050000-55e9-575c-3985-e9fb55a62443	9233	Odranci
00050000-55e9-575c-2e44-87d71703b219	2317	Oplotnica
00050000-55e9-575c-b554-aad2871de3dd	2312	Orehova vas
00050000-55e9-575c-4fdd-54eadb65cbc6	2270	Ormož
00050000-55e9-575c-3473-0585c7795520	1316	Ortnek
00050000-55e9-575c-3797-3322efa353fc	1337	Osilnica
00050000-55e9-575c-e225-6295d015f2f9	8222	Otočec
00050000-55e9-575c-25f2-64d35417353e	2361	Ožbalt
00050000-55e9-575c-b5b7-81d7c0f766f8	2231	Pernica
00050000-55e9-575c-0a45-c9fd11492a2f	2211	Pesnica pri Mariboru
00050000-55e9-575c-8823-185e6e4c8bfa	9203	Petrovci
00050000-55e9-575c-b97f-9d3a8badca17	3301	Petrovče
00050000-55e9-575c-fafc-9aeae530bbad	6330	Piran/Pirano
00050000-55e9-575c-1f53-90103ff3eb3a	8255	Pišece
00050000-55e9-575c-bb30-7b01eff55520	6257	Pivka
00050000-55e9-575c-4fdd-42746e688b54	6232	Planina
00050000-55e9-575c-d4bb-b496ce3ca75d	3225	Planina pri Sevnici
00050000-55e9-575c-cfd7-85d41fe4a2c5	6276	Pobegi
00050000-55e9-575c-ff29-613374a79c09	8312	Podbočje
00050000-55e9-575c-c3ff-32aee1aa882b	5243	Podbrdo
00050000-55e9-575c-1411-fe08ad7678af	3254	Podčetrtek
00050000-55e9-575c-9f1e-23b9173c916d	2273	Podgorci
00050000-55e9-575c-422c-9f1f84f3093c	6216	Podgorje
00050000-55e9-575c-d08f-f8b4812d4d3b	2381	Podgorje pri Slovenj Gradcu
00050000-55e9-575c-9fbf-c768cb73ea34	6244	Podgrad
00050000-55e9-575c-c67d-b61ad5a49d1b	1414	Podkum
00050000-55e9-575c-b22d-4c2f6b7aa237	2286	Podlehnik
00050000-55e9-575c-4d7d-7c4da1090efc	5272	Podnanos
00050000-55e9-575c-7623-f030b4bc4784	4244	Podnart
00050000-55e9-575c-e163-a51fe635398b	3241	Podplat
00050000-55e9-575c-ce6d-a43e6cd93918	3257	Podsreda
00050000-55e9-575c-5ed6-b8eb314c79d7	2363	Podvelka
00050000-55e9-575c-27a5-2bb83a30888a	2208	Pohorje
00050000-55e9-575c-87b8-93fdaed4bb22	2257	Polenšak
00050000-55e9-575c-446e-f12efd1e121e	1355	Polhov Gradec
00050000-55e9-575c-303b-bed01bb05f18	4223	Poljane nad Škofjo Loko
00050000-55e9-575c-3649-b427bd96a388	2319	Poljčane
00050000-55e9-575c-4982-1796e0d36ae6	1272	Polšnik
00050000-55e9-575c-f342-264af479d85a	3313	Polzela
00050000-55e9-575c-b797-b3fd94c4f1dd	3232	Ponikva
00050000-55e9-575c-b753-2dfd4cee2c18	6320	Portorož/Portorose
00050000-55e9-575c-be2b-356c0053e4ed	6230	Postojna
00050000-55e9-575c-9ac8-cf99074125b4	2331	Pragersko
00050000-55e9-575c-af14-7f84499d34b7	3312	Prebold
00050000-55e9-575c-d539-1bacad33748b	4205	Preddvor
00050000-55e9-575c-8adc-978d3cffcd91	6255	Prem
00050000-55e9-575c-dd29-4292fc8df24f	1352	Preserje
00050000-55e9-575c-7a3c-1f938b51cb24	6258	Prestranek
00050000-55e9-575c-a220-371fabd31bb3	2391	Prevalje
00050000-55e9-575c-d462-8204365c6854	3262	Prevorje
00050000-55e9-575c-6c35-aa6a2eaca1a9	1276	Primskovo 
00050000-55e9-575c-ac12-3511c6396847	3253	Pristava pri Mestinju
00050000-55e9-575c-747f-09af10d03628	9207	Prosenjakovci/Partosfalva
00050000-55e9-575c-d464-d2028789cff9	5297	Prvačina
00050000-55e9-575c-ac63-1cbd063ae501	2250	Ptuj
00050000-55e9-575c-bf06-d2594b3c7e60	2323	Ptujska Gora
00050000-55e9-575c-6021-dea987ab029f	9201	Puconci
00050000-55e9-575c-74f1-8e8b7bfc124a	2327	Rače
00050000-55e9-575c-10c7-511c12a78a28	1433	Radeče
00050000-55e9-575c-e113-2c96a7fd032d	9252	Radenci
00050000-55e9-575c-1775-d9b1ac1c87fb	2360	Radlje ob Dravi
00050000-55e9-575c-78ab-07289c735aec	1235	Radomlje
00050000-55e9-575c-df95-4c9f65f28843	4240	Radovljica
00050000-55e9-575c-8a36-fb9cd2b0ad6e	8274	Raka
00050000-55e9-575c-f5a8-bf220f14c37b	1381	Rakek
00050000-55e9-575c-d953-1b3a9df6a068	4283	Rateče - Planica
00050000-55e9-575c-5b78-0204cbe781bf	2390	Ravne na Koroškem
00050000-55e9-575c-1c88-95497ef64366	9246	Razkrižje
00050000-55e9-575c-50ac-7279cc93fa8a	3332	Rečica ob Savinji
00050000-55e9-575c-00b6-38a20cb94d9d	5292	Renče
00050000-55e9-575c-f3e1-f47a8edbd4c0	1310	Ribnica
00050000-55e9-575c-601a-d21289faa970	2364	Ribnica na Pohorju
00050000-55e9-575c-e262-2eee6b7e61f6	3272	Rimske Toplice
00050000-55e9-575c-8043-9833ef96a55f	1314	Rob
00050000-55e9-575c-d355-9607e20b377a	5215	Ročinj
00050000-55e9-575c-173a-017db2aa1be5	3250	Rogaška Slatina
00050000-55e9-575c-4223-0f854514b317	9262	Rogašovci
00050000-55e9-575c-fc8e-3e4a6bc133bd	3252	Rogatec
00050000-55e9-575c-84c8-cf8c685de3c8	1373	Rovte
00050000-55e9-575c-ca03-f2a87a92337c	2342	Ruše
00050000-55e9-575c-1b42-736e45c4f88d	1282	Sava
00050000-55e9-575c-b112-29e57403fdaf	6333	Sečovlje/Sicciole
00050000-55e9-575c-c377-2c6a1c73fd59	4227	Selca
00050000-55e9-575c-cfc3-51743612d49d	2352	Selnica ob Dravi
00050000-55e9-575c-4347-003d71ccfbc9	8333	Semič
00050000-55e9-575c-b773-1f4538c21957	8281	Senovo
00050000-55e9-575c-c14c-b55366bb6aa9	6224	Senožeče
00050000-55e9-575c-db79-a358e2a7403c	8290	Sevnica
00050000-55e9-575c-b689-6527b4add12f	6210	Sežana
00050000-55e9-575c-3cb2-14616a6bcefa	2214	Sladki Vrh
00050000-55e9-575c-b61e-364b52cb7281	5283	Slap ob Idrijci
00050000-55e9-575c-7f45-3a2abc9e7a0d	2380	Slovenj Gradec
00050000-55e9-575c-a1fa-e4bae859661b	2310	Slovenska Bistrica
00050000-55e9-575c-6d40-9aee43286fb2	3210	Slovenske Konjice
00050000-55e9-575c-0232-3bf4272a0f1f	1216	Smlednik
00050000-55e9-575c-7dab-d82831da37a5	5232	Soča
00050000-55e9-575c-4b97-bc4950019d8e	1317	Sodražica
00050000-55e9-575c-8bf5-4023703b0262	3335	Solčava
00050000-55e9-575c-e657-f4c9bb7dfc97	5250	Solkan
00050000-55e9-575c-fc4d-80f28eda70ff	4229	Sorica
00050000-55e9-575c-9b9c-4da42da2bbf5	4225	Sovodenj
00050000-55e9-575c-98a5-acd4d971f61f	5281	Spodnja Idrija
00050000-55e9-575c-c9a6-3ed2befb0695	2241	Spodnji Duplek
00050000-55e9-575c-24e4-65ee048ce4f9	9245	Spodnji Ivanjci
00050000-55e9-575c-52cf-5399fb28d5ea	2277	Središče ob Dravi
00050000-55e9-575c-27b0-98558fb0705c	4267	Srednja vas v Bohinju
00050000-55e9-575c-f45c-b54ecd192a30	8256	Sromlje 
00050000-55e9-575c-5860-eeade50fa652	5224	Srpenica
00050000-55e9-575c-5db9-82b8200f0b21	1242	Stahovica
00050000-55e9-575c-9aee-5edb07e18ace	1332	Stara Cerkev
00050000-55e9-575c-00b5-ab070bf704c0	8342	Stari trg ob Kolpi
00050000-55e9-575c-aa63-8ad8f12c3de9	1386	Stari trg pri Ložu
00050000-55e9-575c-b63b-3757aeadad3b	2205	Starše
00050000-55e9-575c-d4ce-1d719a2dba1e	2289	Stoperce
00050000-55e9-575c-c160-4b826c7dac2d	8322	Stopiče
00050000-55e9-575c-986d-6976f9ddd3a0	3206	Stranice
00050000-55e9-575c-06f1-3d8cffee4156	8351	Straža
00050000-55e9-575c-67c9-ee8baee0626e	1313	Struge
00050000-55e9-575c-435b-f5cf17652235	8293	Studenec
00050000-55e9-575c-1b19-d6772bc5bd1b	8331	Suhor
00050000-55e9-575c-e349-5010db469b46	2233	Sv. Ana v Slovenskih goricah
00050000-55e9-575c-279d-7a5da2d8c4c7	2235	Sv. Trojica v Slovenskih goricah
00050000-55e9-575c-3c8e-8db0fe1eaf51	2353	Sveti Duh na Ostrem Vrhu
00050000-55e9-575c-f182-47cad9d10533	9244	Sveti Jurij ob Ščavnici
00050000-55e9-575c-3fbc-c3b892f56a8f	3264	Sveti Štefan
00050000-55e9-575c-e3a6-15053dfb1df2	2258	Sveti Tomaž
00050000-55e9-575c-e8ed-b5a80130954b	9204	Šalovci
00050000-55e9-575c-1706-8d00da8e9b48	5261	Šempas
00050000-55e9-575c-9766-b4a55b4b7487	5290	Šempeter pri Gorici
00050000-55e9-575c-31bf-85135b064620	3311	Šempeter v Savinjski dolini
00050000-55e9-575c-cbaf-3b4f710981df	4208	Šenčur
00050000-55e9-575c-cca7-fcb13558c9ca	2212	Šentilj v Slovenskih goricah
00050000-55e9-575c-518f-a33c1d5c419e	8297	Šentjanž
00050000-55e9-575c-4f2b-ea79ca4be961	2373	Šentjanž pri Dravogradu
00050000-55e9-575c-fd3b-3c6235f73ea6	8310	Šentjernej
00050000-55e9-575c-3475-bb76de9da900	3230	Šentjur
00050000-55e9-575c-e407-70d42a084f9b	3271	Šentrupert
00050000-55e9-575c-4e53-cf27cfa1ce00	8232	Šentrupert
00050000-55e9-575c-b96a-bd2382a0f191	1296	Šentvid pri Stični
00050000-55e9-575c-c7d8-f8de33d87832	8275	Škocjan
00050000-55e9-575c-349a-3e61bcbbd255	6281	Škofije
00050000-55e9-575c-43bd-11c7e7b4b8ef	4220	Škofja Loka
00050000-55e9-575c-b603-3132d1d3d178	3211	Škofja vas
00050000-55e9-575c-63a5-f80a40892ca8	1291	Škofljica
00050000-55e9-575c-36a5-13da8bfce8f6	6274	Šmarje
00050000-55e9-575c-572e-9c5d6c389123	1293	Šmarje - Sap
00050000-55e9-575c-638a-ff6edceb1c86	3240	Šmarje pri Jelšah
00050000-55e9-575c-19b3-94bf9331a0c6	8220	Šmarješke Toplice
00050000-55e9-575c-8e2b-e482ad2ce563	2315	Šmartno na Pohorju
00050000-55e9-575c-2e9a-9fab370849ce	3341	Šmartno ob Dreti
00050000-55e9-575c-9cfb-257fbe14bf05	3327	Šmartno ob Paki
00050000-55e9-575c-ab79-13a5c25bed40	1275	Šmartno pri Litiji
00050000-55e9-575c-c75c-8adf9f78b267	2383	Šmartno pri Slovenj Gradcu
00050000-55e9-575c-5136-996513a51781	3201	Šmartno v Rožni dolini
00050000-55e9-575c-96bd-aa6f6040aeec	3325	Šoštanj
00050000-55e9-575c-3ca5-4bf3c6eb168e	6222	Štanjel
00050000-55e9-575c-9661-b5246e35a31c	3220	Štore
00050000-55e9-575c-170e-2f96e390c34c	3304	Tabor
00050000-55e9-575c-89a0-ed9f5a44ebf7	3221	Teharje
00050000-55e9-575c-fa10-d412db68d7ca	9251	Tišina
00050000-55e9-575c-a241-37aa4b739935	5220	Tolmin
00050000-55e9-575c-1d39-8ed43dfd096c	3326	Topolšica
00050000-55e9-575c-f3d7-5a740b2cabce	2371	Trbonje
00050000-55e9-575c-896e-b10ddaf14587	1420	Trbovlje
00050000-55e9-575c-f2f1-1c2223b0deee	8231	Trebelno 
00050000-55e9-575c-3b1c-3168d9c850cc	8210	Trebnje
00050000-55e9-575c-f601-c69a86992d17	5252	Trnovo pri Gorici
00050000-55e9-575c-1f78-3e8506f0b741	2254	Trnovska vas
00050000-55e9-575c-8964-1f3f6ad93113	1222	Trojane
00050000-55e9-575c-3e3a-23d529bc3997	1236	Trzin
00050000-55e9-575c-edd5-4412981be7ff	4290	Tržič
00050000-55e9-575c-7a8d-fd9f2a750415	8295	Tržišče
00050000-55e9-575c-9eac-939ff150a27e	1311	Turjak
00050000-55e9-575c-91d0-9c6a3d2cc3ca	9224	Turnišče
00050000-55e9-575c-2382-5b69393c611a	8323	Uršna sela
00050000-55e9-575c-e4a6-5333cf61f49b	1252	Vače
00050000-55e9-575c-cdc5-53fd9e7e0c9c	3320	Velenje 
00050000-55e9-575c-b7f5-987c1dfac196	3322	Velenje - poštni predali
00050000-55e9-575c-826a-4ef3ac3909a4	8212	Velika Loka
00050000-55e9-575c-5d51-be870911e09c	2274	Velika Nedelja
00050000-55e9-575c-ab8a-e819e09a673e	9225	Velika Polana
00050000-55e9-575c-472d-e79e7c3fc301	1315	Velike Lašče
00050000-55e9-575c-078d-66e5ef388ac6	8213	Veliki Gaber
00050000-55e9-575c-602c-f777b910b8c3	9241	Veržej
00050000-55e9-575c-870a-e213f983ad28	1312	Videm - Dobrepolje
00050000-55e9-575c-af14-91619db31d63	2284	Videm pri Ptuju
00050000-55e9-575c-c6ec-998705826e50	8344	Vinica
00050000-55e9-575c-c8c4-8154dc6b4a0b	5271	Vipava
00050000-55e9-575c-7b63-92fca16ab974	4212	Visoko
00050000-55e9-575c-7e9a-ba4ef68b31e6	1294	Višnja Gora
00050000-55e9-575c-880e-76edbeffeab4	3205	Vitanje
00050000-55e9-575c-42aa-4a2a0376bd38	2255	Vitomarci
00050000-55e9-575c-4dfa-9a19d865339b	1217	Vodice
00050000-55e9-575c-79c7-9544fa928146	3212	Vojnik\t
00050000-55e9-575c-5830-6c40e091d7f5	5293	Volčja Draga
00050000-55e9-575c-4bc9-8e68690549e1	2232	Voličina
00050000-55e9-575c-5376-3729e707f144	3305	Vransko
00050000-55e9-575c-9265-57c884132f4c	6217	Vremski Britof
00050000-55e9-575c-2d61-9cd975700279	1360	Vrhnika
00050000-55e9-575c-ecbc-43a68297950c	2365	Vuhred
00050000-55e9-575c-d143-e66b5d3cf81f	2367	Vuzenica
00050000-55e9-575c-d438-c076f92f7648	8292	Zabukovje 
00050000-55e9-575c-d22d-eee7fe38c211	1410	Zagorje ob Savi
00050000-55e9-575c-8eb4-b32b9b201823	1303	Zagradec
00050000-55e9-575c-b645-d6b6857ddc8f	2283	Zavrč
00050000-55e9-575c-16eb-ebf70a3e27b2	8272	Zdole 
00050000-55e9-575c-4219-0d7a038c33b8	4201	Zgornja Besnica
00050000-55e9-575c-a1af-9d4f6dbd46c8	2242	Zgornja Korena
00050000-55e9-575c-c1e0-dfab514cd2c6	2201	Zgornja Kungota
00050000-55e9-575c-5549-fbada4920b62	2316	Zgornja Ložnica
00050000-55e9-575c-f367-15b97ddb609c	2314	Zgornja Polskava
00050000-55e9-575c-7edb-e9582f24abe3	2213	Zgornja Velka
00050000-55e9-575c-636e-e1cbaf95e1ba	4247	Zgornje Gorje
00050000-55e9-575c-2f10-de9b6b484162	4206	Zgornje Jezersko
00050000-55e9-575c-4ba6-1cabb064be28	2285	Zgornji Leskovec
00050000-55e9-575c-7c54-c123a2ead175	1432	Zidani Most
00050000-55e9-575c-b528-7127e81715ea	3214	Zreče
00050000-55e9-575c-6a45-5eeef02a0416	4209	Žabnica
00050000-55e9-575c-bde0-58de8eb0137c	3310	Žalec
00050000-55e9-575c-9729-240226301f4e	4228	Železniki
00050000-55e9-575c-e2a2-444f70d0cf97	2287	Žetale
00050000-55e9-575c-0e92-87bd5ce9632e	4226	Žiri
00050000-55e9-575c-25d3-95bc59af17e7	4274	Žirovnica
00050000-55e9-575c-813b-e81f457a1f39	8360	Žužemberk
\.


--
-- TOC entry 2933 (class 0 OID 17302626)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 17302436)
-- Dependencies: 183
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55e9-575e-efcf-718cd494ac16	00080000-55e9-575e-fd4b-fd5700d80146	\N	00040000-55e9-575c-e2d1-c858e9aff85e	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55e9-575e-e2dd-95aca87b0899	00080000-55e9-575e-fd4b-fd5700d80146	\N	00040000-55e9-575c-e2d1-c858e9aff85e		\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55e9-575e-7096-fe25f0557134	00080000-55e9-575e-13b5-c99516efac6d	\N	00040000-55e9-575c-e2d1-c858e9aff85e		\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2922 (class 0 OID 17302514)
-- Dependencies: 189
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 17302638)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 17302989)
-- Dependencies: 226
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2960 (class 0 OID 17302999)
-- Dependencies: 227
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55e9-575e-0c2b-e10f8861f21f	00080000-55e9-575e-7d41-7f0afb648070	0987	AK
00190000-55e9-575e-2f6a-6db8142d45fb	00080000-55e9-575e-13b5-c99516efac6d	0989	AK
00190000-55e9-575e-dcfe-0689b09099d9	00080000-55e9-575e-cf06-27c2e3ba4afe	0986	AK
00190000-55e9-575e-c488-1342415162eb	00080000-55e9-575e-a0e9-7e69b9577d85	0984	AK
00190000-55e9-575e-5c9f-03258b2e6086	00080000-55e9-575e-a274-58a764fbef60	0983	AK
00190000-55e9-575e-e342-c388d0193776	00080000-55e9-575e-c3dc-c91bf15fcd3e	0982	AK
00190000-55e9-575f-e5ba-371de1a47c5b	00080000-55e9-575f-4c2c-85e4c8678a8c	1001	AK
\.


--
-- TOC entry 2958 (class 0 OID 17302946)
-- Dependencies: 225
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55e9-575e-ab8f-4ee73cd3b09b	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2961 (class 0 OID 17303007)
-- Dependencies: 228
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 17302667)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, seplanira, kapaciteta, opis) FROM stdin;
00220000-55e9-575e-a69b-ea229d388029	\N	\N	0001	Poskusna 1	f	t	8	Poskusna učilnica v prvem
00220000-55e9-575e-09c4-ee9926ac9199	\N	\N	0002	Poskusna 3	f	f	34	Poskusna učilnica v tretjem
00220000-55e9-575e-d1b2-fda2da52ee47	\N	\N	0003	Kazinska	t	t	84	Kazinska dvorana
00220000-55e9-575e-ad44-331f7ec19da9	\N	\N	0004	Mali oder	t	t	24	Mali oder 
00220000-55e9-575e-f02f-01274915079c	\N	\N	0005	Komorni oder	t	t	15	Komorni oder
00220000-55e9-575e-3239-f519ce4a94c4	\N	\N	0006	Stara dvorana	t	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55e9-575e-7f9f-aed33f159631	\N	\N	0007	Velika dvorana	t	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2931 (class 0 OID 17302611)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 17302601)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 17302799)
-- Dependencies: 218
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 17302738)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 17302309)
-- Dependencies: 172
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55e9-575f-4c2c-85e4c8678a8c	00010000-55e9-575d-e460-1e40cfe72e12	2015-09-04 10:33:35	INS	a:0:{}
2	App\\Entity\\Option	00000000-55e9-575f-9936-5da49359090d	00010000-55e9-575d-e460-1e40cfe72e12	2015-09-04 10:33:35	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55e9-575f-e5ba-371de1a47c5b	00010000-55e9-575d-e460-1e40cfe72e12	2015-09-04 10:33:35	INS	a:0:{}
\.


--
-- TOC entry 2982 (class 0 OID 0)
-- Dependencies: 171
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2940 (class 0 OID 17302680)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 17302347)
-- Dependencies: 176
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55e9-575d-cf74-b18c776ec426	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55e9-575d-acea-c3a45b530919	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55e9-575d-4766-44439c649070	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55e9-575d-8702-dc40f1b4b5e3	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55e9-575d-a214-a2403eefac73	planer	Planer dogodkov v koledarju	t
00020000-55e9-575d-5436-6caac1bd0cf0	kadrovska	Kadrovska služba	t
00020000-55e9-575d-c339-4846f01196f3	arhivar	Ažuriranje arhivalij	t
00020000-55e9-575d-45a6-2dd866642d1d	igralec	Igralec	t
00020000-55e9-575d-e39e-3a596d103625	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55e9-575e-2f16-ea58fac866c1	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2907 (class 0 OID 17302331)
-- Dependencies: 174
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55e9-575d-a7c5-3d639824fbfa	00020000-55e9-575d-4766-44439c649070
00010000-55e9-575d-e460-1e40cfe72e12	00020000-55e9-575d-4766-44439c649070
00010000-55e9-575e-12aa-5b3325fa6d93	00020000-55e9-575e-2f16-ea58fac866c1
\.


--
-- TOC entry 2942 (class 0 OID 17302694)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 17302632)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 17302578)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 17303048)
-- Dependencies: 233
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55e9-575c-b524-d4231bca8301	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55e9-575c-7a9b-7418d3df4d86	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55e9-575c-2737-a489f3bd5564	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55e9-575c-11da-49b2abc2fd3a	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-55e9-575c-9bdf-40c2d0309493	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2965 (class 0 OID 17303040)
-- Dependencies: 232
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55e9-575c-0bbb-c7eef24c4d0e	00230000-55e9-575c-11da-49b2abc2fd3a	popa
00240000-55e9-575c-f100-ef67d96a44bf	00230000-55e9-575c-11da-49b2abc2fd3a	oseba
00240000-55e9-575c-94db-452b0d850aeb	00230000-55e9-575c-11da-49b2abc2fd3a	sezona
00240000-55e9-575c-562a-3c1b9806c6ea	00230000-55e9-575c-7a9b-7418d3df4d86	prostor
00240000-55e9-575c-48ab-c686830c97e3	00230000-55e9-575c-11da-49b2abc2fd3a	besedilo
00240000-55e9-575c-a6a8-0fc25782f900	00230000-55e9-575c-11da-49b2abc2fd3a	uprizoritev
00240000-55e9-575c-6916-77896e0053f8	00230000-55e9-575c-11da-49b2abc2fd3a	funkcija
00240000-55e9-575c-1e46-f9bc4b1143aa	00230000-55e9-575c-11da-49b2abc2fd3a	tipfunkcije
00240000-55e9-575c-6058-0f4714172d9f	00230000-55e9-575c-11da-49b2abc2fd3a	alternacija
00240000-55e9-575c-31b4-144dd242d7d0	00230000-55e9-575c-b524-d4231bca8301	pogodba
00240000-55e9-575c-d22a-1b9654205780	00230000-55e9-575c-11da-49b2abc2fd3a	zaposlitev
00240000-55e9-575c-d644-16da5902590a	00230000-55e9-575c-11da-49b2abc2fd3a	zvrstuprizoritve
00240000-55e9-575c-2980-d7497d96b360	00230000-55e9-575c-b524-d4231bca8301	programdela
00240000-55e9-575c-4352-ba4df81def7e	00230000-55e9-575c-11da-49b2abc2fd3a	zapis
\.


--
-- TOC entry 2964 (class 0 OID 17303035)
-- Dependencies: 231
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
d0999aaf-cbbe-445c-b98e-9ea36d95347a	00240000-55e9-575c-0bbb-c7eef24c4d0e	0	1001
\.


--
-- TOC entry 2947 (class 0 OID 17302748)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55e9-575e-da30-126f30ef6349	000e0000-55e9-575e-f27a-9975671ea120	00080000-55e9-575e-fd4b-fd5700d80146	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55e9-575d-df2c-1115280a6886
00270000-55e9-575e-284c-25438467401e	000e0000-55e9-575e-f27a-9975671ea120	00080000-55e9-575e-fd4b-fd5700d80146	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55e9-575d-df2c-1115280a6886
00270000-55e9-575e-e7aa-cbc540187ff0	000e0000-55e9-575e-f27a-9975671ea120	00080000-55e9-575e-51c9-13ae1a8b319c	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4	\N
\.


--
-- TOC entry 2914 (class 0 OID 17302409)
-- Dependencies: 181
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 17302588)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55e9-575e-c6e0-31b3775e2b08	00180000-55e9-575e-30e0-453d9a8de1e7	000c0000-55e9-575e-4d9b-8d156a69505c	00090000-55e9-575e-42b4-14a2068bff8d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e9-575e-4c6c-f47c31a938ca	00180000-55e9-575e-30e0-453d9a8de1e7	000c0000-55e9-575e-15b3-41a1704896d8	00090000-55e9-575e-bdcc-24bd6d621ecd	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e9-575e-8948-a770f7f03701	00180000-55e9-575e-30e0-453d9a8de1e7	000c0000-55e9-575e-8e08-4f432425a4f0	00090000-55e9-575e-60cd-9d2b40ba86ed	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e9-575e-a2a1-15d0bda81042	00180000-55e9-575e-30e0-453d9a8de1e7	000c0000-55e9-575e-c962-3a24116352bd	00090000-55e9-575e-37fc-66908d39b308	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e9-575e-9479-18428f7672b3	00180000-55e9-575e-30e0-453d9a8de1e7	000c0000-55e9-575e-3337-a71afd8ec48d	00090000-55e9-575e-072a-5dd7ac1c2e78	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e9-575e-4a15-02b36b9aa5b2	00180000-55e9-575e-de06-2740d0f7f680	\N	00090000-55e9-575e-072a-5dd7ac1c2e78	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2950 (class 0 OID 17302788)
-- Dependencies: 217
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55e9-575c-f07e-d34ba2c78861	Avtor	Avtorji	Avtorka	umetnik
000f0000-55e9-575c-16e8-3a7976b702cb	Priredba	Priredba	Priredba	umetnik
000f0000-55e9-575c-404b-5ec2ec5f6920	Prevod	Prevod	Prevod	umetnik
000f0000-55e9-575c-2f4f-be96b6ab5fb1	Režija	Režija	Režija	umetnik
000f0000-55e9-575c-84aa-a80ca3a398ca	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55e9-575c-f662-2793c920b558	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55e9-575c-9066-6b5bef503569	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55e9-575c-e304-14e810763be9	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55e9-575c-8082-89c5843e369b	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55e9-575c-f6a7-bacb767aa075	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55e9-575c-f59b-fb2563444bd8	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55e9-575c-152a-a8d525bce4f2	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55e9-575c-676c-33facc7b79bf	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55e9-575c-3603-cdfa72b1ef7a	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55e9-575c-3b98-5a84fcf1e746	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55e9-575c-fbf1-9e5f050487d0	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55e9-575c-be31-eccedc816861	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55e9-575c-22f8-e3b00f1e008b	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2962 (class 0 OID 17303017)
-- Dependencies: 229
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55e9-575c-f561-bc89d8d3b2c7	01	Velika predstava	f	1.00	1.00
002b0000-55e9-575c-6e2d-1d36d128e856	02	Mala predstava	f	0.50	0.50
002b0000-55e9-575c-6eb7-5d709b92c96d	03	Mala koprodukcija	t	0.40	1.00
002b0000-55e9-575c-5541-4eb60ae35982	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55e9-575c-5b5b-ab9545d01a72	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2919 (class 0 OID 17302471)
-- Dependencies: 186
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 17302318)
-- Dependencies: 173
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55e9-575d-e460-1e40cfe72e12	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROg7sLJBkiqSodQfpsb8IVzJdHlBGxWEe	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55e9-575e-18fa-4f497f40f736	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55e9-575e-7f9c-0865528b9b6e	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55e9-575e-4ede-2d0c822df31f	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55e9-575e-fe49-b1439fa21ccd	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55e9-575e-aed2-55e7d23519bf	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55e9-575e-37a7-e365e293d0a1	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55e9-575e-6651-217c4e23698b	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55e9-575e-74d1-ae814a7d37f6	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55e9-575e-7475-05550436440e	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55e9-575e-12aa-5b3325fa6d93	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55e9-575d-a7c5-3d639824fbfa	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2954 (class 0 OID 17302836)
-- Dependencies: 221
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55e9-575e-6e05-a004274f73a5	00160000-55e9-575e-5387-b6075b3f7b5c	\N	00140000-55e9-575c-a1b5-c048885e2683	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55e9-575e-f02f-01274915079c
000e0000-55e9-575e-f27a-9975671ea120	00160000-55e9-575e-b030-7d62b48fd2ec	\N	00140000-55e9-575c-2112-e53129fe0d8f	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55e9-575e-3239-f519ce4a94c4
000e0000-55e9-575e-60c1-2887d5f8dd33	\N	\N	00140000-55e9-575c-2112-e53129fe0d8f	00190000-55e9-575e-0c2b-e10f8861f21f	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55e9-575e-f02f-01274915079c
000e0000-55e9-575e-71df-4520024c793c	\N	\N	00140000-55e9-575c-2112-e53129fe0d8f	00190000-55e9-575e-0c2b-e10f8861f21f	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55e9-575e-f02f-01274915079c
000e0000-55e9-575e-6e2c-539fa7ef075e	\N	\N	00140000-55e9-575c-2112-e53129fe0d8f	00190000-55e9-575e-0c2b-e10f8861f21f	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55e9-575e-a69b-ea229d388029
000e0000-55e9-575e-db9f-0ceb55c61fd8	\N	\N	00140000-55e9-575c-2112-e53129fe0d8f	00190000-55e9-575e-0c2b-e10f8861f21f	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55e9-575e-a69b-ea229d388029
\.


--
-- TOC entry 2924 (class 0 OID 17302532)
-- Dependencies: 191
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55e9-575e-bcbc-aff89cda6967	000e0000-55e9-575e-f27a-9975671ea120	\N	1	
00200000-55e9-575e-2271-37441312850c	000e0000-55e9-575e-f27a-9975671ea120	\N	2	
\.


--
-- TOC entry 2938 (class 0 OID 17302659)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 17302762)
-- Dependencies: 215
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55e9-575d-645c-6844d13bb40f	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55e9-575d-8564-403f5b98f5c0	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55e9-575d-df5c-6323741faf27	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55e9-575d-f96a-267c1832625d	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55e9-575d-f149-01ab2355c010	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55e9-575d-b917-7816d3468984	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55e9-575d-6fc7-de752c1e8fd2	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55e9-575d-d3e7-b2d5dcef88c5	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55e9-575d-df2c-1115280a6886	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55e9-575d-2251-2ab7b6536587	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55e9-575d-c658-f9ab12f404cb	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55e9-575d-bb1a-a92ffe6fb79d	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55e9-575d-d99b-d5a21b475a04	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55e9-575d-e0a9-b939136b820a	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55e9-575d-4cd2-d7ac4525c273	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55e9-575d-413c-c0afc9b304da	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55e9-575d-f1b1-a01af6a65a73	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55e9-575d-c571-516afa3bccdf	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55e9-575d-d052-d8f98c2eb5f2	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55e9-575d-f9ab-03e6f4cf1d96	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55e9-575d-3dcd-405fc8ffad36	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55e9-575d-69c6-94122c1b8d4c	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55e9-575d-0753-2d6231ea32cf	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55e9-575d-5c8e-2746ee38d1ac	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55e9-575d-c394-5eb246dd4e66	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55e9-575d-ef7a-273a4d97dc75	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55e9-575d-2a0f-a7e4b6822fe1	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55e9-575d-ceff-b11ad5c46417	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2968 (class 0 OID 17303087)
-- Dependencies: 235
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 17303059)
-- Dependencies: 234
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 17303099)
-- Dependencies: 236
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2945 (class 0 OID 17302731)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55e9-575e-f688-09fd69c8efde	00090000-55e9-575e-bdcc-24bd6d621ecd	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e9-575e-28e7-492ef092d6f9	00090000-55e9-575e-60cd-9d2b40ba86ed	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e9-575e-8605-bd78e47f36e9	00090000-55e9-575e-2404-74101c022aea	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e9-575e-972c-2e11e76714aa	00090000-55e9-575e-0be0-bcba564e1ffe	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e9-575e-b43b-62f4206fa427	00090000-55e9-575e-42b4-14a2068bff8d	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e9-575e-6c89-71b6ca13d0dc	00090000-55e9-575e-ce7f-b94fff91c06a	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2926 (class 0 OID 17302568)
-- Dependencies: 193
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 17302826)
-- Dependencies: 220
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55e9-575c-a1b5-c048885e2683	01	Drama	drama (SURS 01)
00140000-55e9-575c-83ec-421eb7512e14	02	Opera	opera (SURS 02)
00140000-55e9-575c-9cbe-829c6f1ca7cd	03	Balet	balet (SURS 03)
00140000-55e9-575c-4abe-b4f89453ad91	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55e9-575c-a626-0c9efd0da651	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55e9-575c-2112-e53129fe0d8f	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55e9-575c-13f5-501bfb28e3a6	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2944 (class 0 OID 17302721)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2454 (class 2606 OID 17302372)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 17302885)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 17302875)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 17302787)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 17303139)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 17302557)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 17302577)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 17303033)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 17302497)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 17302940)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 17302717)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 17302530)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 17302511)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 17302624)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 17303116)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 17303123)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2696 (class 2606 OID 17303147)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 16867881)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2556 (class 2606 OID 17302651)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 17302469)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 17302381)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 17302405)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 17302361)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2445 (class 2606 OID 17302346)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 17302657)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 17302693)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 17302821)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 17302433)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 17302457)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 17302630)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 17302447)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 17302518)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 17302642)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 17302996)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 17303004)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 17302988)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 17303015)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 17302675)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 17302615)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 17302606)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 17302809)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 17302745)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 17302317)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 17302684)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 17302335)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2447 (class 2606 OID 17302355)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 17302702)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 17302637)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 17302586)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 17303057)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 17303045)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 17303039)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 17302758)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 17302414)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 17302597)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 17302798)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 17303027)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 17302482)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 17302330)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 17302854)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 17302540)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 17302665)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 17302770)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 17303097)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 17303081)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 17303105)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 17302736)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 17302572)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 17302834)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 17302729)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 1259 OID 17302566)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2510 (class 1259 OID 17302567)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2511 (class 1259 OID 17302565)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2512 (class 1259 OID 17302564)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2594 (class 1259 OID 17302759)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2595 (class 1259 OID 17302760)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2596 (class 1259 OID 17302761)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2682 (class 1259 OID 17303118)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2683 (class 1259 OID 17303117)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2468 (class 1259 OID 17302435)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2557 (class 1259 OID 17302658)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2669 (class 1259 OID 17303085)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2670 (class 1259 OID 17303084)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2671 (class 1259 OID 17303086)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2672 (class 1259 OID 17303083)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2673 (class 1259 OID 17303082)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2551 (class 1259 OID 17302644)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2552 (class 1259 OID 17302643)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2504 (class 1259 OID 17302541)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 17302718)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2582 (class 1259 OID 17302720)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2583 (class 1259 OID 17302719)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2493 (class 1259 OID 17302513)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2494 (class 1259 OID 17302512)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2652 (class 1259 OID 17303016)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2607 (class 1259 OID 17302823)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2608 (class 1259 OID 17302824)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2609 (class 1259 OID 17302825)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2679 (class 1259 OID 17303106)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2616 (class 1259 OID 17302859)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2617 (class 1259 OID 17302856)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2618 (class 1259 OID 17302860)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2619 (class 1259 OID 17302858)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2620 (class 1259 OID 17302857)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2483 (class 1259 OID 17302484)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2484 (class 1259 OID 17302483)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2459 (class 1259 OID 17302408)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2569 (class 1259 OID 17302685)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2449 (class 1259 OID 17302362)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2450 (class 1259 OID 17302363)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2574 (class 1259 OID 17302705)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2575 (class 1259 OID 17302704)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2576 (class 1259 OID 17302703)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2497 (class 1259 OID 17302519)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2498 (class 1259 OID 17302520)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2662 (class 1259 OID 17303047)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2531 (class 1259 OID 17302610)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2532 (class 1259 OID 17302608)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2533 (class 1259 OID 17302607)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2534 (class 1259 OID 17302609)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2440 (class 1259 OID 17302336)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2441 (class 1259 OID 17302337)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2560 (class 1259 OID 17302666)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2692 (class 1259 OID 17303140)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2693 (class 1259 OID 17303148)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2694 (class 1259 OID 17303149)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2546 (class 1259 OID 17302631)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2590 (class 1259 OID 17302746)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2591 (class 1259 OID 17302747)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2637 (class 1259 OID 17302945)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2638 (class 1259 OID 17302944)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2639 (class 1259 OID 17302941)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2640 (class 1259 OID 17302942)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2641 (class 1259 OID 17302943)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2472 (class 1259 OID 17302449)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2473 (class 1259 OID 17302448)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2474 (class 1259 OID 17302450)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2563 (class 1259 OID 17302679)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2564 (class 1259 OID 17302678)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2644 (class 1259 OID 17302997)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2645 (class 1259 OID 17302998)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2630 (class 1259 OID 17302889)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 17302890)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2632 (class 1259 OID 17302887)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2633 (class 1259 OID 17302888)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2587 (class 1259 OID 17302737)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2537 (class 1259 OID 17302619)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2538 (class 1259 OID 17302618)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2539 (class 1259 OID 17302616)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2540 (class 1259 OID 17302617)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2626 (class 1259 OID 17302877)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2627 (class 1259 OID 17302876)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2503 (class 1259 OID 17302531)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2659 (class 1259 OID 17303034)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2686 (class 1259 OID 17303124)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2687 (class 1259 OID 17303125)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2455 (class 1259 OID 17302383)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2456 (class 1259 OID 17302382)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2464 (class 1259 OID 17302415)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 17302416)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2526 (class 1259 OID 17302600)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2527 (class 1259 OID 17302599)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2528 (class 1259 OID 17302598)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2513 (class 1259 OID 17302559)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2514 (class 1259 OID 17302560)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2515 (class 1259 OID 17302558)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2516 (class 1259 OID 17302562)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2517 (class 1259 OID 17302563)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2518 (class 1259 OID 17302561)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2471 (class 1259 OID 17302434)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2489 (class 1259 OID 17302498)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2490 (class 1259 OID 17302500)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2491 (class 1259 OID 17302499)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2492 (class 1259 OID 17302501)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2545 (class 1259 OID 17302625)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2612 (class 1259 OID 17302822)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 17302855)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2462 (class 1259 OID 17302406)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2463 (class 1259 OID 17302407)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2584 (class 1259 OID 17302730)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2668 (class 1259 OID 17303058)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 17302470)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2665 (class 1259 OID 17303046)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2567 (class 1259 OID 17302677)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2568 (class 1259 OID 17302676)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2634 (class 1259 OID 17302886)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2479 (class 1259 OID 17302458)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 17302835)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2676 (class 1259 OID 17303098)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2650 (class 1259 OID 17303005)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2651 (class 1259 OID 17303006)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2525 (class 1259 OID 17302587)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2448 (class 1259 OID 17302356)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2724 (class 2606 OID 17303265)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2723 (class 2606 OID 17303270)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2719 (class 2606 OID 17303290)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2725 (class 2606 OID 17303260)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2721 (class 2606 OID 17303280)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2720 (class 2606 OID 17303285)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2722 (class 2606 OID 17303275)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2757 (class 2606 OID 17303440)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2756 (class 2606 OID 17303445)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2755 (class 2606 OID 17303450)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2789 (class 2606 OID 17303615)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2790 (class 2606 OID 17303610)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2707 (class 2606 OID 17303200)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2741 (class 2606 OID 17303370)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2784 (class 2606 OID 17303595)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2785 (class 2606 OID 17303590)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2783 (class 2606 OID 17303600)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2786 (class 2606 OID 17303585)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2787 (class 2606 OID 17303580)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2739 (class 2606 OID 17303365)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2740 (class 2606 OID 17303360)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2718 (class 2606 OID 17303255)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2751 (class 2606 OID 17303410)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2749 (class 2606 OID 17303420)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2750 (class 2606 OID 17303415)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2713 (class 2606 OID 17303235)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2714 (class 2606 OID 17303230)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2737 (class 2606 OID 17303350)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2780 (class 2606 OID 17303565)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2760 (class 2606 OID 17303455)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2759 (class 2606 OID 17303460)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2758 (class 2606 OID 17303465)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2788 (class 2606 OID 17303605)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2762 (class 2606 OID 17303485)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2765 (class 2606 OID 17303470)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2761 (class 2606 OID 17303490)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2763 (class 2606 OID 17303480)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2764 (class 2606 OID 17303475)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2711 (class 2606 OID 17303225)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2712 (class 2606 OID 17303220)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2703 (class 2606 OID 17303185)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2704 (class 2606 OID 17303180)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2745 (class 2606 OID 17303390)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2700 (class 2606 OID 17303160)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2699 (class 2606 OID 17303165)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2746 (class 2606 OID 17303405)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2747 (class 2606 OID 17303400)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2748 (class 2606 OID 17303395)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2716 (class 2606 OID 17303240)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2715 (class 2606 OID 17303245)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2782 (class 2606 OID 17303575)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2729 (class 2606 OID 17303325)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2731 (class 2606 OID 17303315)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2732 (class 2606 OID 17303310)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2730 (class 2606 OID 17303320)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2698 (class 2606 OID 17303150)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2697 (class 2606 OID 17303155)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2742 (class 2606 OID 17303375)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2793 (class 2606 OID 17303630)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2795 (class 2606 OID 17303635)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2794 (class 2606 OID 17303640)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2738 (class 2606 OID 17303355)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2754 (class 2606 OID 17303430)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2753 (class 2606 OID 17303435)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2772 (class 2606 OID 17303545)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2773 (class 2606 OID 17303540)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2776 (class 2606 OID 17303525)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2775 (class 2606 OID 17303530)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2774 (class 2606 OID 17303535)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2709 (class 2606 OID 17303210)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2710 (class 2606 OID 17303205)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2708 (class 2606 OID 17303215)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2743 (class 2606 OID 17303385)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2744 (class 2606 OID 17303380)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2778 (class 2606 OID 17303550)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2777 (class 2606 OID 17303555)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2769 (class 2606 OID 17303515)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2768 (class 2606 OID 17303520)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2771 (class 2606 OID 17303505)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2770 (class 2606 OID 17303510)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2752 (class 2606 OID 17303425)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2733 (class 2606 OID 17303345)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2734 (class 2606 OID 17303340)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2736 (class 2606 OID 17303330)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2735 (class 2606 OID 17303335)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2766 (class 2606 OID 17303500)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2767 (class 2606 OID 17303495)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2717 (class 2606 OID 17303250)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2779 (class 2606 OID 17303560)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2781 (class 2606 OID 17303570)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2792 (class 2606 OID 17303620)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2791 (class 2606 OID 17303625)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2701 (class 2606 OID 17303175)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2702 (class 2606 OID 17303170)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2706 (class 2606 OID 17303190)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2705 (class 2606 OID 17303195)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2726 (class 2606 OID 17303305)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2727 (class 2606 OID 17303300)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2728 (class 2606 OID 17303295)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-04 10:33:36 CEST

--
-- PostgreSQL database dump complete
--

