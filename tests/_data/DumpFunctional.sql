--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-28 10:44:13 CEST

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
-- TOC entry 177 (class 1259 OID 16058920)
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
-- TOC entry 223 (class 1259 OID 16059436)
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
-- TOC entry 222 (class 1259 OID 16059419)
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
-- TOC entry 216 (class 1259 OID 16059329)
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
-- TOC entry 239 (class 1259 OID 16059685)
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
-- TOC entry 191 (class 1259 OID 16059098)
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
-- TOC entry 194 (class 1259 OID 16059132)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 16059587)
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
-- TOC entry 186 (class 1259 OID 16059041)
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
-- TOC entry 224 (class 1259 OID 16059449)
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
-- TOC entry 210 (class 1259 OID 16059264)
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
-- TOC entry 189 (class 1259 OID 16059078)
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
-- TOC entry 193 (class 1259 OID 16059126)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 16059058)
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
-- TOC entry 199 (class 1259 OID 16059179)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 237 (class 1259 OID 16059666)
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
-- TOC entry 238 (class 1259 OID 16059678)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 16059700)
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
-- TOC entry 203 (class 1259 OID 16059204)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 16059015)
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
-- TOC entry 178 (class 1259 OID 16058929)
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
-- TOC entry 179 (class 1259 OID 16058940)
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
-- TOC entry 174 (class 1259 OID 16058894)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 16058913)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 16059211)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 16059244)
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
-- TOC entry 219 (class 1259 OID 16059368)
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
-- TOC entry 181 (class 1259 OID 16058973)
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
-- TOC entry 183 (class 1259 OID 16059007)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 16059185)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 16058992)
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
-- TOC entry 188 (class 1259 OID 16059070)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 16059197)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 16059548)
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
-- TOC entry 227 (class 1259 OID 16059558)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 16059504)
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
-- TOC entry 228 (class 1259 OID 16059566)
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
-- TOC entry 206 (class 1259 OID 16059226)
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
-- TOC entry 198 (class 1259 OID 16059170)
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
-- TOC entry 197 (class 1259 OID 16059160)
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
-- TOC entry 218 (class 1259 OID 16059357)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 16059296)
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
-- TOC entry 171 (class 1259 OID 16058865)
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
-- TOC entry 170 (class 1259 OID 16058863)
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
-- TOC entry 207 (class 1259 OID 16059238)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 16058903)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 16058887)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 16059252)
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
-- TOC entry 201 (class 1259 OID 16059191)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 16059137)
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
-- TOC entry 233 (class 1259 OID 16059607)
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
-- TOC entry 232 (class 1259 OID 16059599)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 16059594)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 16059306)
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
-- TOC entry 180 (class 1259 OID 16058965)
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
-- TOC entry 196 (class 1259 OID 16059147)
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
-- TOC entry 217 (class 1259 OID 16059346)
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
-- TOC entry 229 (class 1259 OID 16059576)
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
-- TOC entry 185 (class 1259 OID 16059027)
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
-- TOC entry 172 (class 1259 OID 16058874)
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
-- TOC entry 221 (class 1259 OID 16059394)
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
-- TOC entry 190 (class 1259 OID 16059089)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 16059218)
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
-- TOC entry 215 (class 1259 OID 16059320)
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
-- TOC entry 235 (class 1259 OID 16059646)
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
-- TOC entry 234 (class 1259 OID 16059618)
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
-- TOC entry 236 (class 1259 OID 16059658)
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
-- TOC entry 212 (class 1259 OID 16059289)
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
-- TOC entry 192 (class 1259 OID 16059121)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 16059384)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 16059279)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 16058868)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2911 (class 0 OID 16058920)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2957 (class 0 OID 16059436)
-- Dependencies: 223
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55e0-1f5c-243e-cb554d6820de	000d0000-55e0-1f5c-12af-45cd7ce82945	\N	00090000-55e0-1f5c-7168-f2ac6a9a9110	000b0000-55e0-1f5c-767d-3a8da0a48889	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55e0-1f5c-7639-7984c433494b	000d0000-55e0-1f5c-74f4-66bb5d0fbbec	00100000-55e0-1f5c-e4d6-63b79daf3c64	00090000-55e0-1f5c-757f-012b69afdb93	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55e0-1f5c-02cc-ca0d6e2190a8	000d0000-55e0-1f5c-e0c6-d80d5b3c9a12	00100000-55e0-1f5c-eba9-f9958d6e0f1b	00090000-55e0-1f5c-2d64-c20ec2155e93	\N	0003	t	\N	2015-08-28	\N	2	\N	\N	f	f
000c0000-55e0-1f5c-6f8c-cb3fce3d4ec9	000d0000-55e0-1f5c-1e2a-ec09a9aeed3e	\N	00090000-55e0-1f5c-b8c6-d9f906698c68	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55e0-1f5c-91dd-5cdf97fc951d	000d0000-55e0-1f5c-9124-918ba492e9a8	\N	00090000-55e0-1f5c-982e-118c3a2c4099	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55e0-1f5c-784a-4be68a43c785	000d0000-55e0-1f5c-6655-b1084adae6c4	\N	00090000-55e0-1f5c-ffc9-a19bed2a0bf3	000b0000-55e0-1f5c-dbb6-447fbb061ee7	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55e0-1f5c-12f3-955bb0eec1c2	000d0000-55e0-1f5c-709b-27c2fe6cb747	00100000-55e0-1f5c-b51c-a80c28614b77	00090000-55e0-1f5c-2a16-69bf252d28fc	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55e0-1f5c-bd6e-59cc12f5740c	000d0000-55e0-1f5c-ef8a-a68315965b37	\N	00090000-55e0-1f5c-c357-913418892f80	000b0000-55e0-1f5c-0a07-385d2a07df68	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55e0-1f5c-0bec-df15103834f8	000d0000-55e0-1f5c-709b-27c2fe6cb747	00100000-55e0-1f5c-3d70-010913e2ecb8	00090000-55e0-1f5c-b483-45c78f8b444b	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55e0-1f5c-392d-5f4676ccccc7	000d0000-55e0-1f5c-709b-27c2fe6cb747	00100000-55e0-1f5c-8c37-444408e56f47	00090000-55e0-1f5c-d6c8-b05db29f1e75	\N	0010	t	\N	2015-08-28	\N	16	\N	\N	f	t
000c0000-55e0-1f5c-5b95-f66825fc9214	000d0000-55e0-1f5c-709b-27c2fe6cb747	00100000-55e0-1f5c-ac07-e87a14e1d0f5	00090000-55e0-1f5c-2812-3d4d03c10bd5	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2956 (class 0 OID 16059419)
-- Dependencies: 222
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 16059329)
-- Dependencies: 216
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55e0-1f5b-888a-3e78e1782f16	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55e0-1f5b-2c3d-21c92deae3cd	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55e0-1f5b-3fb1-e2a7c72175db	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2973 (class 0 OID 16059685)
-- Dependencies: 239
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2925 (class 0 OID 16059098)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55e0-1f5c-bf7d-41743f7e52f3	\N	\N	00200000-55e0-1f5c-456e-0b542ae18031	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55e0-1f5c-7ea2-5e02ee8834b8	\N	\N	00200000-55e0-1f5c-32e3-de8d4b2d6ae8	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55e0-1f5c-e50c-39b39b929f24	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55e0-1f5c-b457-e3c3dfc9233e	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55e0-1f5c-04e7-4fb23c889b18	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2928 (class 0 OID 16059132)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 16059587)
-- Dependencies: 230
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 16059041)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55e0-1f5a-c3ee-a845626b2ede	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55e0-1f5a-e267-e30ba95a0427	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55e0-1f5a-b908-67bb422676e4	AL	ALB	008	Albania 	Albanija	\N
00040000-55e0-1f5a-dac8-48822f3d378a	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55e0-1f5a-3a9a-b47e261562bf	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55e0-1f5a-c2ee-19022fb74563	AD	AND	020	Andorra 	Andora	\N
00040000-55e0-1f5a-ba53-247a2467370d	AO	AGO	024	Angola 	Angola	\N
00040000-55e0-1f5a-d7b1-6343ba43c058	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55e0-1f5a-29fc-d7b406b23fd6	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55e0-1f5a-e0b4-eb85960ad381	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55e0-1f5a-ed12-10700122b401	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55e0-1f5a-8dc1-f18a1380868a	AM	ARM	051	Armenia 	Armenija	\N
00040000-55e0-1f5a-eecc-a0d860e1ca81	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55e0-1f5a-2517-8b5dde28e73e	AU	AUS	036	Australia 	Avstralija	\N
00040000-55e0-1f5a-af5b-e7a1743a3de5	AT	AUT	040	Austria 	Avstrija	\N
00040000-55e0-1f5a-568e-1e6c31a6478e	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55e0-1f5a-32f6-a39dd1169930	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55e0-1f5a-2f7f-1ededca35f96	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55e0-1f5a-a8b5-c0b7a912f0e3	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55e0-1f5a-4afc-0a6733ac88f9	BB	BRB	052	Barbados 	Barbados	\N
00040000-55e0-1f5a-10e5-06798c6c1427	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55e0-1f5a-fb38-177bf8fc5c97	BE	BEL	056	Belgium 	Belgija	\N
00040000-55e0-1f5a-bcd0-746f4824346d	BZ	BLZ	084	Belize 	Belize	\N
00040000-55e0-1f5a-a35e-d0dd2de5ee2c	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55e0-1f5a-71d7-5862c28c2d3d	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55e0-1f5a-9829-71e29c1f696a	BT	BTN	064	Bhutan 	Butan	\N
00040000-55e0-1f5a-6933-dfaf5a674235	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55e0-1f5a-d3af-9e00faea0820	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55e0-1f5a-1687-1a44dfb908b6	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55e0-1f5a-60a4-beb9efc0e081	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55e0-1f5a-7483-b48ced4a6e0e	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55e0-1f5a-2fcc-345eccb118aa	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55e0-1f5a-da8b-efacac0861cb	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55e0-1f5a-395b-0467c217940d	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55e0-1f5a-437d-737e648aaf25	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55e0-1f5a-a0c1-b43c7c449164	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55e0-1f5a-a86c-4ccb987f3572	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55e0-1f5a-4a0c-f64d84546586	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55e0-1f5a-37f3-4977295ec788	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55e0-1f5a-1872-5797dfb68173	CA	CAN	124	Canada 	Kanada	\N
00040000-55e0-1f5a-b970-ddf5483ee7b5	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55e0-1f5a-4409-e483ded798c4	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55e0-1f5a-4386-255e78f6269d	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55e0-1f5a-3333-295b534bbb31	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55e0-1f5a-01eb-3e1a9d05b6e8	CL	CHL	152	Chile 	Čile	\N
00040000-55e0-1f5a-fa35-aa151390444e	CN	CHN	156	China 	Kitajska	\N
00040000-55e0-1f5a-716b-ec6307d6aa95	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55e0-1f5a-122a-41ea5ec5aad3	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55e0-1f5a-e733-757acacb068d	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55e0-1f5a-c5bf-0aff755fd34b	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55e0-1f5a-afbd-f03f7da0193a	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55e0-1f5a-6624-eb3ce11f4a21	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55e0-1f5a-a317-2f50ed018aa5	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55e0-1f5a-6277-73b23311bc2f	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55e0-1f5a-1d62-5b93a5025473	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55e0-1f5a-2030-ae6e3223e8e1	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55e0-1f5a-e9ff-12f950b35da8	CU	CUB	192	Cuba 	Kuba	\N
00040000-55e0-1f5a-2bd9-181ace214d49	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55e0-1f5a-c1ec-dd8dceb08699	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55e0-1f5a-b884-64a70673ba52	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55e0-1f5a-3c19-be627baa9967	DK	DNK	208	Denmark 	Danska	\N
00040000-55e0-1f5a-0448-b2f657a8da5f	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55e0-1f5a-8595-c7f78c1bc347	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55e0-1f5a-ed9a-26baa336d91b	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55e0-1f5a-9b3c-75fa25d968a1	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55e0-1f5a-bd3d-94fff39fc238	EG	EGY	818	Egypt 	Egipt	\N
00040000-55e0-1f5a-c95c-1573c2adc6ab	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55e0-1f5a-23b7-cdfd11e67f2a	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55e0-1f5a-68c6-c9010312748f	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55e0-1f5a-3965-c339fb52f04d	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55e0-1f5a-7413-04f05a699915	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55e0-1f5a-764f-ee3207fe39f7	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55e0-1f5a-743d-9289c883e065	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55e0-1f5a-3f37-dca1ccb21449	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55e0-1f5a-3be5-dc447ee0bea2	FI	FIN	246	Finland 	Finska	\N
00040000-55e0-1f5a-fda1-9ecfa29f3533	FR	FRA	250	France 	Francija	\N
00040000-55e0-1f5a-7d7b-0b5543db8365	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55e0-1f5a-ed4f-e5fce842c045	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55e0-1f5a-0552-eb42c1235eb3	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55e0-1f5a-0c11-2820547b29d3	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55e0-1f5a-3298-b0f4cdbd40ab	GA	GAB	266	Gabon 	Gabon	\N
00040000-55e0-1f5a-a958-21418c2a2543	GM	GMB	270	Gambia 	Gambija	\N
00040000-55e0-1f5a-2249-7c556c083ed7	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55e0-1f5a-b4b3-87bb0e27c7c7	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55e0-1f5a-3d5b-de736611b907	GH	GHA	288	Ghana 	Gana	\N
00040000-55e0-1f5a-3422-ae3c701e5902	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55e0-1f5a-8193-d7872d2ed1ae	GR	GRC	300	Greece 	Grčija	\N
00040000-55e0-1f5a-4b51-8f525aeae592	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55e0-1f5a-ce1c-291da0c4dfc1	GD	GRD	308	Grenada 	Grenada	\N
00040000-55e0-1f5a-fd6b-1368432c9f62	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55e0-1f5a-c131-6d8eab51a94b	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55e0-1f5a-5130-c19b06542fe5	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55e0-1f5a-054d-f6fe2ea58af0	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55e0-1f5a-86e7-d7632d87a65b	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55e0-1f5a-d77e-7bac2d684c52	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55e0-1f5a-6018-a676a1421f54	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55e0-1f5a-80f6-53a43ace9576	HT	HTI	332	Haiti 	Haiti	\N
00040000-55e0-1f5a-148c-f8a030b443e7	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55e0-1f5a-d797-b249385991dc	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55e0-1f5a-30d6-176f80b7c511	HN	HND	340	Honduras 	Honduras	\N
00040000-55e0-1f5a-f780-5748a0a09918	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55e0-1f5a-fecb-7d2a119470d7	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55e0-1f5a-c42c-16995eef0e07	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55e0-1f5a-f2d7-1d073a022adb	IN	IND	356	India 	Indija	\N
00040000-55e0-1f5a-0138-017e87ac8577	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55e0-1f5a-32a8-5ac53fd1ebf7	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55e0-1f5a-cee9-1428369d9e77	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55e0-1f5a-865a-78adc83fe09e	IE	IRL	372	Ireland 	Irska	\N
00040000-55e0-1f5a-d3fc-28b5de8e674a	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55e0-1f5a-f832-7618d39f2610	IL	ISR	376	Israel 	Izrael	\N
00040000-55e0-1f5a-dc59-5fd241edc34f	IT	ITA	380	Italy 	Italija	\N
00040000-55e0-1f5a-4814-1e9e90218941	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55e0-1f5a-a08a-9c640a361bbb	JP	JPN	392	Japan 	Japonska	\N
00040000-55e0-1f5a-6dd5-969656ed2b40	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55e0-1f5a-beb2-9727c5df5602	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55e0-1f5a-f083-1bd93450a689	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55e0-1f5a-7102-534a49ef7c4c	KE	KEN	404	Kenya 	Kenija	\N
00040000-55e0-1f5a-f88e-e1b16f82a8b3	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55e0-1f5a-4938-bed0db5ca9c1	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55e0-1f5a-15b0-50a7259dabed	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55e0-1f5a-9c23-d90987092eda	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55e0-1f5a-14ea-f2be931eddc3	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55e0-1f5a-6743-c84c3eeb7a7e	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55e0-1f5a-f41f-8de7a3772b93	LV	LVA	428	Latvia 	Latvija	\N
00040000-55e0-1f5a-6a74-2e99927984e5	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55e0-1f5a-2e8c-0da39e732916	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55e0-1f5a-3051-df396d8df3bf	LR	LBR	430	Liberia 	Liberija	\N
00040000-55e0-1f5a-356e-94c1daabca3a	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55e0-1f5a-dba1-37e07dae90bf	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55e0-1f5a-cec8-f80f5c71dec1	LT	LTU	440	Lithuania 	Litva	\N
00040000-55e0-1f5a-9613-4df23e3bd1c2	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55e0-1f5a-3733-9cac9ca09e90	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55e0-1f5a-2f04-47ceaf20e2e0	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55e0-1f5a-b7e7-f1d76dd2ede0	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55e0-1f5a-f638-f622fae4fa60	MW	MWI	454	Malawi 	Malavi	\N
00040000-55e0-1f5a-aea8-f22bca291979	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55e0-1f5a-2879-b511ed55c12d	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55e0-1f5a-8869-355ad1be4841	ML	MLI	466	Mali 	Mali	\N
00040000-55e0-1f5a-78cd-c0477c2901b2	MT	MLT	470	Malta 	Malta	\N
00040000-55e0-1f5a-c68d-1587822a6378	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55e0-1f5a-98a8-a7a5f0c47b48	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55e0-1f5a-2393-722a877ce803	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55e0-1f5a-1bee-2f00db9ab239	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55e0-1f5a-1fcc-e332024590e7	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55e0-1f5a-f2f8-b6635ee867ae	MX	MEX	484	Mexico 	Mehika	\N
00040000-55e0-1f5a-40a8-c9569c1c3106	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55e0-1f5a-daee-d8f759f8b5bb	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55e0-1f5a-fd02-9569f89258fa	MC	MCO	492	Monaco 	Monako	\N
00040000-55e0-1f5a-cf35-feca457008dd	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55e0-1f5a-d4fa-a6aa4c81c7f7	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55e0-1f5a-be87-9d345e551e67	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55e0-1f5a-f621-6b6095c74581	MA	MAR	504	Morocco 	Maroko	\N
00040000-55e0-1f5a-37c1-1df7dcccd382	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55e0-1f5a-bc41-77319f2849fa	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55e0-1f5a-6dec-6e47dba7b3f0	NA	NAM	516	Namibia 	Namibija	\N
00040000-55e0-1f5a-d7c5-b2326dfd3941	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55e0-1f5a-dbc9-4e3dabcadc06	NP	NPL	524	Nepal 	Nepal	\N
00040000-55e0-1f5a-e513-e21d42047f1b	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55e0-1f5a-5aee-42350cc4055f	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55e0-1f5a-0e11-73b0012bb0cd	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55e0-1f5a-830a-61d0073d6273	NE	NER	562	Niger 	Niger 	\N
00040000-55e0-1f5a-8a07-b303302935c3	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55e0-1f5a-ecfd-d9253c2ede7c	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55e0-1f5a-d5a7-7b95ad62105e	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55e0-1f5a-f2cb-f6daad804c44	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55e0-1f5a-7c04-7ec32ce00689	NO	NOR	578	Norway 	Norveška	\N
00040000-55e0-1f5a-a074-ae0b26c583ae	OM	OMN	512	Oman 	Oman	\N
00040000-55e0-1f5a-c71e-d06a5a286325	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55e0-1f5a-6d07-0b7db2a8e767	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55e0-1f5a-4493-237644efd03c	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55e0-1f5a-4a56-dc5b5b167af1	PA	PAN	591	Panama 	Panama	\N
00040000-55e0-1f5a-5a2d-9b17d489906d	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55e0-1f5a-d021-0c134deedf5f	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55e0-1f5a-834c-08a56e937fb0	PE	PER	604	Peru 	Peru	\N
00040000-55e0-1f5a-79d2-f544688320ed	PH	PHL	608	Philippines 	Filipini	\N
00040000-55e0-1f5a-ff96-06779f40fc2f	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55e0-1f5a-d139-1b7fac37a58e	PL	POL	616	Poland 	Poljska	\N
00040000-55e0-1f5a-228c-2aad4e4ec8bd	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55e0-1f5a-6fc8-35a7f08a251e	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55e0-1f5a-31e8-06502c47645a	QA	QAT	634	Qatar 	Katar	\N
00040000-55e0-1f5a-b53c-ccd58994f187	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55e0-1f5a-7e6b-a8103316a68b	RO	ROU	642	Romania 	Romunija	\N
00040000-55e0-1f5a-30da-c93db3a84207	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55e0-1f5a-5201-02884aa694df	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55e0-1f5a-96d6-cf39586f6771	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55e0-1f5a-9b0c-759559de8080	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55e0-1f5a-c0d4-d8612c541244	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55e0-1f5a-a8e8-5cca6a997a60	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55e0-1f5a-3f92-e42cb3e92ed4	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55e0-1f5a-0369-2a0d625a8186	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55e0-1f5a-a7ca-93af0b9e3ee1	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55e0-1f5a-0798-0090e1c501b1	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55e0-1f5a-2539-b033d28f72d8	SM	SMR	674	San Marino 	San Marino	\N
00040000-55e0-1f5a-bea9-7fae149b855e	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55e0-1f5a-9a95-b9176a182d0d	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55e0-1f5a-cc5a-fc10767ad116	SN	SEN	686	Senegal 	Senegal	\N
00040000-55e0-1f5a-3305-d1925111a9bf	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55e0-1f5a-3e77-5fa5560590ce	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55e0-1f5a-1fc5-523844adc05d	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55e0-1f5a-72be-67e92fdafc99	SG	SGP	702	Singapore 	Singapur	\N
00040000-55e0-1f5a-9c27-6e2929915c9b	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55e0-1f5a-34ad-247ddd0173c2	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55e0-1f5a-06da-52ce001e25ce	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55e0-1f5a-9634-c9d90bac1b41	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55e0-1f5a-e3db-44d264472059	SO	SOM	706	Somalia 	Somalija	\N
00040000-55e0-1f5a-50ec-6dd7a18e149a	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55e0-1f5a-e6b5-f45dde47735f	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55e0-1f5a-7f3f-19161fd2f2cb	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55e0-1f5a-20f3-47aadccbfe25	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55e0-1f5a-2262-47da9899b2b5	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55e0-1f5a-7865-1e51b214e9d4	SD	SDN	729	Sudan 	Sudan	\N
00040000-55e0-1f5a-e45b-86d9efd6a1ef	SR	SUR	740	Suriname 	Surinam	\N
00040000-55e0-1f5a-5173-79709e703a5a	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55e0-1f5a-1059-43e651e74bc4	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55e0-1f5a-45f2-8b9b2d1b0e8b	SE	SWE	752	Sweden 	Švedska	\N
00040000-55e0-1f5a-2ac8-292439f3e96a	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55e0-1f5a-3b7d-e7c62df1da37	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55e0-1f5a-5afd-51d7840f15d1	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55e0-1f5a-b315-29961234cbdc	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55e0-1f5a-86b0-37a10841abd1	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55e0-1f5a-6e17-428dc281b059	TH	THA	764	Thailand 	Tajska	\N
00040000-55e0-1f5a-5b85-74e504d560a5	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55e0-1f5a-43d5-48071fc215f3	TG	TGO	768	Togo 	Togo	\N
00040000-55e0-1f5a-8111-e9e0ddce7136	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55e0-1f5a-d4ac-0c2b28132395	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55e0-1f5a-3546-63fd4d47da20	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55e0-1f5a-f724-3eee46da7fdf	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55e0-1f5a-1cf6-e8833497c1aa	TR	TUR	792	Turkey 	Turčija	\N
00040000-55e0-1f5a-5122-24c3a8edbd84	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55e0-1f5a-89a6-36709cfe60c2	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55e0-1f5a-85db-04e0c9e2a78c	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55e0-1f5a-4ef8-7ff670510da2	UG	UGA	800	Uganda 	Uganda	\N
00040000-55e0-1f5a-5dd3-2a89d683966f	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55e0-1f5a-d406-4a51f4fa59ff	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55e0-1f5a-844f-dab97191e741	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55e0-1f5a-933e-f70c24a960c1	US	USA	840	United States 	Združene države Amerike	\N
00040000-55e0-1f5a-6e97-2fcc917b4680	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55e0-1f5a-2003-08f7dac0fb8b	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55e0-1f5a-8103-45f3d6404ec8	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55e0-1f5a-4794-4e84188dc8d6	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55e0-1f5a-e96a-43dc20e3e078	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55e0-1f5a-9fb7-e51f8af8bab9	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55e0-1f5a-ccb4-8994a188675f	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55e0-1f5a-2f06-a0efde2c717a	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55e0-1f5a-c8ca-c25fd26bb146	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55e0-1f5a-3ecc-036816b71ef1	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55e0-1f5a-a3db-c33b65428473	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55e0-1f5a-e223-b21a866c967f	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55e0-1f5a-672d-3db6bc2d23f0	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2958 (class 0 OID 16059449)
-- Dependencies: 224
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55e0-1f5c-58ec-de02db141fe4	000e0000-55e0-1f5c-647b-ee51b80c6548	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e0-1f5a-1d44-b8cac428a91a	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55e0-1f5c-b612-da8a1225046e	000e0000-55e0-1f5c-7793-846582519cd8	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e0-1f5a-f0df-15318b45c605	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55e0-1f5c-ffdd-ff9ecd867f1b	000e0000-55e0-1f5c-b041-3c5d80615978	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e0-1f5a-1d44-b8cac428a91a	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55e0-1f5c-6b86-62b5f18b884d	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55e0-1f5c-de56-b2a584add4a6	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2944 (class 0 OID 16059264)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55e0-1f5c-709b-27c2fe6cb747	000e0000-55e0-1f5c-7793-846582519cd8	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55e0-1f5a-1609-1f79deac07c6
000d0000-55e0-1f5c-12af-45cd7ce82945	000e0000-55e0-1f5c-7793-846582519cd8	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55e0-1f5a-1609-1f79deac07c6
000d0000-55e0-1f5c-74f4-66bb5d0fbbec	000e0000-55e0-1f5c-7793-846582519cd8	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55e0-1f5a-db64-942b64e46399
000d0000-55e0-1f5c-e0c6-d80d5b3c9a12	000e0000-55e0-1f5c-7793-846582519cd8	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55e0-1f5a-b437-a26c3529c04d
000d0000-55e0-1f5c-1e2a-ec09a9aeed3e	000e0000-55e0-1f5c-7793-846582519cd8	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55e0-1f5a-18ec-0e3fafc045f5
000d0000-55e0-1f5c-9124-918ba492e9a8	000e0000-55e0-1f5c-7793-846582519cd8	\N	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55e0-1f5a-18ec-0e3fafc045f5
000d0000-55e0-1f5c-6655-b1084adae6c4	000e0000-55e0-1f5c-7793-846582519cd8	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55e0-1f5a-1609-1f79deac07c6
000d0000-55e0-1f5c-ef8a-a68315965b37	000e0000-55e0-1f5c-7793-846582519cd8	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55e0-1f5a-106e-e0997a9e25ff
\.


--
-- TOC entry 2923 (class 0 OID 16059078)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 16059126)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2921 (class 0 OID 16059058)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55e0-1f5c-1bd9-3f242543f9fa	00080000-55e0-1f5b-338c-ffe74ea693bc	00090000-55e0-1f5c-d6c8-b05db29f1e75	AK		
\.


--
-- TOC entry 2933 (class 0 OID 16059179)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 16059666)
-- Dependencies: 237
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 16059678)
-- Dependencies: 238
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 16059700)
-- Dependencies: 240
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 16059204)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2918 (class 0 OID 16059015)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55e0-1f5b-2b8d-1c24b2b4dc33	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55e0-1f5b-5497-c3ced5fe8869	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55e0-1f5b-9070-935a6f69b8a6	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55e0-1f5b-bbdf-88a449eecd4e	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55e0-1f5b-e2e4-479604861971	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55e0-1f5b-5c29-af3582cac30d	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55e0-1f5b-4d9a-f09f3c1fed28	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55e0-1f5b-c7c0-0582fe436a84	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55e0-1f5b-b1a9-3132d36b621d	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55e0-1f5b-d87b-b4c8a7b3c272	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55e0-1f5b-1439-5b222594df59	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55e0-1f5b-265f-557901730a64	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55e0-1f5b-d3cf-e1e3e0f5130f	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55e0-1f5c-59cd-43a69f883294	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55e0-1f5c-b53b-bc84606d7589	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55e0-1f5c-6450-fcfefd5a73d4	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55e0-1f5c-976b-008338d0ef4a	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55e0-1f5c-1161-b0cdb8fa84e5	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55e0-1f5d-80a7-66f01bd06829	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2912 (class 0 OID 16058929)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55e0-1f5c-b085-edddc331fbdc	00000000-55e0-1f5c-59cd-43a69f883294	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55e0-1f5c-d308-8eb6faef2028	00000000-55e0-1f5c-59cd-43a69f883294	00010000-55e0-1f5b-d517-92acff6d86c9	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55e0-1f5c-bf41-7c03472062d6	00000000-55e0-1f5c-b53b-bc84606d7589	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2913 (class 0 OID 16058940)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55e0-1f5c-7168-f2ac6a9a9110	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55e0-1f5c-b8c6-d9f906698c68	00010000-55e0-1f5c-2678-bf51dfdd16c4	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55e0-1f5c-2d64-c20ec2155e93	00010000-55e0-1f5c-0f07-735cb1d6402b	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55e0-1f5c-b483-45c78f8b444b	00010000-55e0-1f5c-9e87-fe2572863adf	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55e0-1f5c-7a5c-c9db745a2adf	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55e0-1f5c-ffc9-a19bed2a0bf3	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55e0-1f5c-2812-3d4d03c10bd5	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55e0-1f5c-2a16-69bf252d28fc	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55e0-1f5c-d6c8-b05db29f1e75	00010000-55e0-1f5c-2ef9-ec24e1a67c87	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55e0-1f5c-757f-012b69afdb93	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55e0-1f5c-05a7-1c08dccdeb22	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55e0-1f5c-982e-118c3a2c4099	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55e0-1f5c-c357-913418892f80	00010000-55e0-1f5c-44ff-ac0bfb97ed49	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2908 (class 0 OID 16058894)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55e0-1f5a-4231-c8310b67da0a	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55e0-1f5a-f267-76c5a8ee9084	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55e0-1f5a-38d0-2acd460790d2	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55e0-1f5a-6b80-1e3fc3ca06b6	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55e0-1f5a-ef62-a41a234666b1	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55e0-1f5a-710c-03b57a458948	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55e0-1f5a-8c9b-b7358f1af4fb	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55e0-1f5a-c9dd-2d484032e7a0	Abonma-read	Abonma - branje	f
00030000-55e0-1f5a-69a9-ca9cb8e2ffaf	Abonma-write	Abonma - spreminjanje	f
00030000-55e0-1f5a-8c19-e6061ab542e5	Alternacija-read	Alternacija - branje	f
00030000-55e0-1f5a-e316-bed1d3a70973	Alternacija-write	Alternacija - spreminjanje	f
00030000-55e0-1f5a-6dca-992cf48fe46f	Arhivalija-read	Arhivalija - branje	f
00030000-55e0-1f5a-f35f-f91fd09bc118	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55e0-1f5a-d0c5-5e32f559849c	Besedilo-read	Besedilo - branje	f
00030000-55e0-1f5a-1688-4a2a3b067383	Besedilo-write	Besedilo - spreminjanje	f
00030000-55e0-1f5a-89f8-0877c44a9986	DogodekIzven-read	DogodekIzven - branje	f
00030000-55e0-1f5a-8cc3-5e036fca91d2	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55e0-1f5a-c5da-37c633c59bbc	Dogodek-read	Dogodek - branje	f
00030000-55e0-1f5a-278e-3c84b23ac004	Dogodek-write	Dogodek - spreminjanje	f
00030000-55e0-1f5a-2edf-ba85938f7b83	DrugiVir-read	DrugiVir - branje	f
00030000-55e0-1f5a-a5e4-fa082c02e490	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55e0-1f5a-8700-ac59cd02af13	Drzava-read	Drzava - branje	f
00030000-55e0-1f5a-f67d-acef631e8fd4	Drzava-write	Drzava - spreminjanje	f
00030000-55e0-1f5a-ce36-1da5fe343067	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55e0-1f5a-9f60-e2ffa4718b0d	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55e0-1f5a-0c51-61d5747e35e1	Funkcija-read	Funkcija - branje	f
00030000-55e0-1f5a-4464-67c8d513405f	Funkcija-write	Funkcija - spreminjanje	f
00030000-55e0-1f5a-d5ce-f06dc6bf4e86	Gostovanje-read	Gostovanje - branje	f
00030000-55e0-1f5a-5415-332396fa697f	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55e0-1f5a-eb9e-cb5dd217f0f2	Gostujoca-read	Gostujoca - branje	f
00030000-55e0-1f5a-02f2-40840e2b4e35	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55e0-1f5a-ecc7-88d0ed13de06	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55e0-1f5a-d224-526c895f263c	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55e0-1f5a-eae6-78d74fdfa92e	Kupec-read	Kupec - branje	f
00030000-55e0-1f5a-3939-de4d492d6df6	Kupec-write	Kupec - spreminjanje	f
00030000-55e0-1f5a-a2b3-fed1558a3ee8	NacinPlacina-read	NacinPlacina - branje	f
00030000-55e0-1f5a-1cef-49597e119b19	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55e0-1f5a-a93c-2d43670299e4	Option-read	Option - branje	f
00030000-55e0-1f5a-fff4-bd841e128350	Option-write	Option - spreminjanje	f
00030000-55e0-1f5a-4e17-4ce745725f18	OptionValue-read	OptionValue - branje	f
00030000-55e0-1f5a-00e9-53115d5343a4	OptionValue-write	OptionValue - spreminjanje	f
00030000-55e0-1f5a-c9ce-8ada860a5338	Oseba-read	Oseba - branje	f
00030000-55e0-1f5a-9798-8a2ad541a016	Oseba-write	Oseba - spreminjanje	f
00030000-55e0-1f5a-76d2-22a3621c2a64	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55e0-1f5a-a4ea-96a47b151088	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55e0-1f5a-533a-af3fe12b6a1e	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55e0-1f5a-5ab6-44db01aba518	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55e0-1f5a-ee79-37844fba2ae7	Pogodba-read	Pogodba - branje	f
00030000-55e0-1f5a-c995-c4795a3c58c7	Pogodba-write	Pogodba - spreminjanje	f
00030000-55e0-1f5a-8f44-5617dcc19875	Popa-read	Popa - branje	f
00030000-55e0-1f5a-0273-77b1b2ab7217	Popa-write	Popa - spreminjanje	f
00030000-55e0-1f5a-d6e7-b4793cd6986d	Posta-read	Posta - branje	f
00030000-55e0-1f5a-9938-f6b0d9c581e0	Posta-write	Posta - spreminjanje	f
00030000-55e0-1f5a-ed8b-ea0fde193b08	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55e0-1f5a-e159-8b2fca2503a9	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55e0-1f5a-fb2d-dd37ba7dc546	PostniNaslov-read	PostniNaslov - branje	f
00030000-55e0-1f5a-9fbe-83285a0761bb	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55e0-1f5a-23ad-9970700d2e31	Predstava-read	Predstava - branje	f
00030000-55e0-1f5a-ac78-f987d2ac417f	Predstava-write	Predstava - spreminjanje	f
00030000-55e0-1f5a-5553-5bd2a6760f9d	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55e0-1f5a-c903-2640f073d0b9	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55e0-1f5a-90a1-645cc4cc54f9	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55e0-1f5a-1404-f7b259bad9c6	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55e0-1f5a-8757-3564929d5cf7	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55e0-1f5a-74e2-5a4ef6554b67	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55e0-1f5a-1629-7811fab1e54f	ProgramDela-read	ProgramDela - branje	f
00030000-55e0-1f5a-614c-491815f58515	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55e0-1f5a-60e8-38aa555e5b7a	ProgramFestival-read	ProgramFestival - branje	f
00030000-55e0-1f5a-3313-ad86a3a13d70	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55e0-1f5a-76f9-78298c46ceac	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55e0-1f5a-c783-e20c0fe70c92	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55e0-1f5a-ada5-14119c6421d6	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55e0-1f5a-5785-af850f23e71f	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55e0-1f5a-abb1-346308bc4e54	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55e0-1f5a-b335-dde6045a221e	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55e0-1f5a-564c-eddc701fbef7	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55e0-1f5a-09e6-11c3333bb0ef	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55e0-1f5a-e8e2-81cf2510fb70	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55e0-1f5a-1c96-61b92f35a0b4	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55e0-1f5a-cc11-683131483e29	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55e0-1f5a-4434-70b5042f4e95	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55e0-1f5a-8813-0630fecd6bf3	ProgramRazno-read	ProgramRazno - branje	f
00030000-55e0-1f5a-4de5-b7f6270bb580	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55e0-1f5a-7e76-765240a03c2b	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55e0-1f5a-6513-91dba6111e41	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55e0-1f5a-e1c7-caa02cd617ab	Prostor-read	Prostor - branje	f
00030000-55e0-1f5a-a4de-bfdc862773b5	Prostor-write	Prostor - spreminjanje	f
00030000-55e0-1f5a-39a7-13d86040bfce	Racun-read	Racun - branje	f
00030000-55e0-1f5a-8965-bfcf54741df6	Racun-write	Racun - spreminjanje	f
00030000-55e0-1f5a-c9ff-006c267afd43	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55e0-1f5a-7688-a01068f098e1	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55e0-1f5a-472f-b7c795671289	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55e0-1f5a-10eb-a65f73ac8372	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55e0-1f5a-d38a-bac9a8df1dff	Rekvizit-read	Rekvizit - branje	f
00030000-55e0-1f5a-7769-ebcaaf780e77	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55e0-1f5a-851f-3a6307252c05	Revizija-read	Revizija - branje	f
00030000-55e0-1f5a-3974-6bca6ca3cb91	Revizija-write	Revizija - spreminjanje	f
00030000-55e0-1f5a-5de9-298d3df3b497	Rezervacija-read	Rezervacija - branje	f
00030000-55e0-1f5a-43ec-e24e7d0a5922	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55e0-1f5a-42f4-8a8d113d774f	SedezniRed-read	SedezniRed - branje	f
00030000-55e0-1f5a-2577-0f338e6e60e5	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55e0-1f5a-e1ff-e3d7e6607556	Sedez-read	Sedez - branje	f
00030000-55e0-1f5a-28ae-98978b994c3c	Sedez-write	Sedez - spreminjanje	f
00030000-55e0-1f5a-b4f0-e8a970423048	Sezona-read	Sezona - branje	f
00030000-55e0-1f5a-893a-cc3933bf405d	Sezona-write	Sezona - spreminjanje	f
00030000-55e0-1f5a-949b-99f1fe9c5e92	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55e0-1f5a-4fdd-0a89fa7acdd0	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55e0-1f5a-4ede-a6167b8655ca	Stevilcenje-read	Stevilcenje - branje	f
00030000-55e0-1f5a-64be-9c2dd801d484	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55e0-1f5a-eb57-5974e6b41194	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55e0-1f5a-0eb4-f57f18a6d03f	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55e0-1f5a-7e55-0ce0738cb10c	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55e0-1f5a-fac9-c7cec75838c4	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55e0-1f5a-8b3a-4a291541f276	Telefonska-read	Telefonska - branje	f
00030000-55e0-1f5a-4216-9e67bbe3535d	Telefonska-write	Telefonska - spreminjanje	f
00030000-55e0-1f5a-1030-7d07a4533cf1	TerminStoritve-read	TerminStoritve - branje	f
00030000-55e0-1f5a-3eef-2a305a904401	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55e0-1f5a-8587-31b70fbe2bc4	TipFunkcije-read	TipFunkcije - branje	f
00030000-55e0-1f5a-6b67-e042275b1b98	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55e0-1f5a-2d79-7210d1eb094c	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55e0-1f5a-bf6e-c7d44c75ae69	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55e0-1f5a-fbae-2c4bf77ff292	Trr-read	Trr - branje	f
00030000-55e0-1f5a-981f-30d588ccb342	Trr-write	Trr - spreminjanje	f
00030000-55e0-1f5a-f664-0d5ad84c0094	Uprizoritev-read	Uprizoritev - branje	f
00030000-55e0-1f5a-53ba-b864cb2359cf	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55e0-1f5a-89f2-94978fcaac22	Vaja-read	Vaja - branje	f
00030000-55e0-1f5a-ee34-0acb5487f40c	Vaja-write	Vaja - spreminjanje	f
00030000-55e0-1f5a-3850-870eba37658f	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55e0-1f5a-fb7a-7626605d6370	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55e0-1f5a-49e0-50784b6728a6	VrstaStroska-read	VrstaStroska - branje	f
00030000-55e0-1f5a-85c0-6feb8177a7bf	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55e0-1f5a-c451-508b20229081	Zaposlitev-read	Zaposlitev - branje	f
00030000-55e0-1f5a-e284-92a1ca02de67	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55e0-1f5a-5bb4-445649c4333b	Zasedenost-read	Zasedenost - branje	f
00030000-55e0-1f5a-9c75-511fd2dd17da	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55e0-1f5a-48c9-f8a98359747f	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55e0-1f5a-da8b-012d21772f64	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55e0-1f5a-6252-9aca28418d44	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55e0-1f5a-44b5-317048c055fb	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55e0-1f5a-fe10-4f8e93ac0381	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55e0-1f5a-cab3-2037585089c1	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55e0-1f5a-af29-e74182f0f293	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55e0-1f5a-cd46-0135bc4809af	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55e0-1f5a-9eab-fe9cc7b39e50	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55e0-1f5a-e396-5ef337552e5b	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55e0-1f5a-a503-c119ff6e0fbc	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55e0-1f5a-8d98-b29f7effa281	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55e0-1f5a-ccd8-7423bd69d171	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55e0-1f5a-7476-7a36f402da5d	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55e0-1f5a-1694-fe99960141a9	Datoteka-write	Datoteka - spreminjanje	f
00030000-55e0-1f5a-a870-01f27a80c6ec	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2910 (class 0 OID 16058913)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55e0-1f5b-d419-83e6081db4ed	00030000-55e0-1f5a-f267-76c5a8ee9084
00020000-55e0-1f5b-624b-f83b8d537596	00030000-55e0-1f5a-8700-ac59cd02af13
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-c9dd-2d484032e7a0
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-69a9-ca9cb8e2ffaf
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-8c19-e6061ab542e5
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-e316-bed1d3a70973
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-6dca-992cf48fe46f
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-c5da-37c633c59bbc
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-6b80-1e3fc3ca06b6
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-278e-3c84b23ac004
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-8700-ac59cd02af13
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-f67d-acef631e8fd4
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-0c51-61d5747e35e1
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-4464-67c8d513405f
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-d5ce-f06dc6bf4e86
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-5415-332396fa697f
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-eb9e-cb5dd217f0f2
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-02f2-40840e2b4e35
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-ecc7-88d0ed13de06
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-d224-526c895f263c
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-a93c-2d43670299e4
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-4e17-4ce745725f18
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-c9ce-8ada860a5338
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-9798-8a2ad541a016
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-8f44-5617dcc19875
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-0273-77b1b2ab7217
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-d6e7-b4793cd6986d
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-9938-f6b0d9c581e0
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-fb2d-dd37ba7dc546
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-9fbe-83285a0761bb
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-23ad-9970700d2e31
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-ac78-f987d2ac417f
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-8757-3564929d5cf7
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-74e2-5a4ef6554b67
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-e1c7-caa02cd617ab
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-a4de-bfdc862773b5
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-472f-b7c795671289
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-10eb-a65f73ac8372
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-d38a-bac9a8df1dff
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-7769-ebcaaf780e77
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-b4f0-e8a970423048
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-893a-cc3933bf405d
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-8587-31b70fbe2bc4
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-f664-0d5ad84c0094
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-53ba-b864cb2359cf
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-89f2-94978fcaac22
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-ee34-0acb5487f40c
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-5bb4-445649c4333b
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-9c75-511fd2dd17da
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-48c9-f8a98359747f
00020000-55e0-1f5b-e36e-4c6a5d349690	00030000-55e0-1f5a-6252-9aca28418d44
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-c9dd-2d484032e7a0
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-6dca-992cf48fe46f
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-c5da-37c633c59bbc
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-8700-ac59cd02af13
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-d5ce-f06dc6bf4e86
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-eb9e-cb5dd217f0f2
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-ecc7-88d0ed13de06
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-d224-526c895f263c
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-a93c-2d43670299e4
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-4e17-4ce745725f18
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-c9ce-8ada860a5338
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-9798-8a2ad541a016
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-8f44-5617dcc19875
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-d6e7-b4793cd6986d
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-fb2d-dd37ba7dc546
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-9fbe-83285a0761bb
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-23ad-9970700d2e31
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-e1c7-caa02cd617ab
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-472f-b7c795671289
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-d38a-bac9a8df1dff
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-b4f0-e8a970423048
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-8b3a-4a291541f276
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-4216-9e67bbe3535d
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-fbae-2c4bf77ff292
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-981f-30d588ccb342
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-c451-508b20229081
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-e284-92a1ca02de67
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-48c9-f8a98359747f
00020000-55e0-1f5b-2754-1c19d99967e9	00030000-55e0-1f5a-6252-9aca28418d44
00020000-55e0-1f5b-985f-56e10e832dc1	00030000-55e0-1f5a-c9dd-2d484032e7a0
00020000-55e0-1f5b-985f-56e10e832dc1	00030000-55e0-1f5a-8c19-e6061ab542e5
00020000-55e0-1f5b-985f-56e10e832dc1	00030000-55e0-1f5a-6dca-992cf48fe46f
00020000-55e0-1f5b-985f-56e10e832dc1	00030000-55e0-1f5a-f35f-f91fd09bc118
00020000-55e0-1f5b-985f-56e10e832dc1	00030000-55e0-1f5a-d0c5-5e32f559849c
00020000-55e0-1f5b-985f-56e10e832dc1	00030000-55e0-1f5a-89f8-0877c44a9986
00020000-55e0-1f5b-985f-56e10e832dc1	00030000-55e0-1f5a-c5da-37c633c59bbc
00020000-55e0-1f5b-985f-56e10e832dc1	00030000-55e0-1f5a-8700-ac59cd02af13
00020000-55e0-1f5b-985f-56e10e832dc1	00030000-55e0-1f5a-0c51-61d5747e35e1
00020000-55e0-1f5b-985f-56e10e832dc1	00030000-55e0-1f5a-d5ce-f06dc6bf4e86
00020000-55e0-1f5b-985f-56e10e832dc1	00030000-55e0-1f5a-eb9e-cb5dd217f0f2
00020000-55e0-1f5b-985f-56e10e832dc1	00030000-55e0-1f5a-ecc7-88d0ed13de06
00020000-55e0-1f5b-985f-56e10e832dc1	00030000-55e0-1f5a-a93c-2d43670299e4
00020000-55e0-1f5b-985f-56e10e832dc1	00030000-55e0-1f5a-4e17-4ce745725f18
00020000-55e0-1f5b-985f-56e10e832dc1	00030000-55e0-1f5a-c9ce-8ada860a5338
00020000-55e0-1f5b-985f-56e10e832dc1	00030000-55e0-1f5a-8f44-5617dcc19875
00020000-55e0-1f5b-985f-56e10e832dc1	00030000-55e0-1f5a-d6e7-b4793cd6986d
00020000-55e0-1f5b-985f-56e10e832dc1	00030000-55e0-1f5a-23ad-9970700d2e31
00020000-55e0-1f5b-985f-56e10e832dc1	00030000-55e0-1f5a-8757-3564929d5cf7
00020000-55e0-1f5b-985f-56e10e832dc1	00030000-55e0-1f5a-e1c7-caa02cd617ab
00020000-55e0-1f5b-985f-56e10e832dc1	00030000-55e0-1f5a-472f-b7c795671289
00020000-55e0-1f5b-985f-56e10e832dc1	00030000-55e0-1f5a-d38a-bac9a8df1dff
00020000-55e0-1f5b-985f-56e10e832dc1	00030000-55e0-1f5a-b4f0-e8a970423048
00020000-55e0-1f5b-985f-56e10e832dc1	00030000-55e0-1f5a-8587-31b70fbe2bc4
00020000-55e0-1f5b-985f-56e10e832dc1	00030000-55e0-1f5a-89f2-94978fcaac22
00020000-55e0-1f5b-985f-56e10e832dc1	00030000-55e0-1f5a-5bb4-445649c4333b
00020000-55e0-1f5b-985f-56e10e832dc1	00030000-55e0-1f5a-48c9-f8a98359747f
00020000-55e0-1f5b-985f-56e10e832dc1	00030000-55e0-1f5a-6252-9aca28418d44
00020000-55e0-1f5b-d145-3814c541546f	00030000-55e0-1f5a-c9dd-2d484032e7a0
00020000-55e0-1f5b-d145-3814c541546f	00030000-55e0-1f5a-69a9-ca9cb8e2ffaf
00020000-55e0-1f5b-d145-3814c541546f	00030000-55e0-1f5a-e316-bed1d3a70973
00020000-55e0-1f5b-d145-3814c541546f	00030000-55e0-1f5a-6dca-992cf48fe46f
00020000-55e0-1f5b-d145-3814c541546f	00030000-55e0-1f5a-c5da-37c633c59bbc
00020000-55e0-1f5b-d145-3814c541546f	00030000-55e0-1f5a-8700-ac59cd02af13
00020000-55e0-1f5b-d145-3814c541546f	00030000-55e0-1f5a-d5ce-f06dc6bf4e86
00020000-55e0-1f5b-d145-3814c541546f	00030000-55e0-1f5a-eb9e-cb5dd217f0f2
00020000-55e0-1f5b-d145-3814c541546f	00030000-55e0-1f5a-a93c-2d43670299e4
00020000-55e0-1f5b-d145-3814c541546f	00030000-55e0-1f5a-4e17-4ce745725f18
00020000-55e0-1f5b-d145-3814c541546f	00030000-55e0-1f5a-8f44-5617dcc19875
00020000-55e0-1f5b-d145-3814c541546f	00030000-55e0-1f5a-d6e7-b4793cd6986d
00020000-55e0-1f5b-d145-3814c541546f	00030000-55e0-1f5a-23ad-9970700d2e31
00020000-55e0-1f5b-d145-3814c541546f	00030000-55e0-1f5a-e1c7-caa02cd617ab
00020000-55e0-1f5b-d145-3814c541546f	00030000-55e0-1f5a-472f-b7c795671289
00020000-55e0-1f5b-d145-3814c541546f	00030000-55e0-1f5a-d38a-bac9a8df1dff
00020000-55e0-1f5b-d145-3814c541546f	00030000-55e0-1f5a-b4f0-e8a970423048
00020000-55e0-1f5b-d145-3814c541546f	00030000-55e0-1f5a-8587-31b70fbe2bc4
00020000-55e0-1f5b-d145-3814c541546f	00030000-55e0-1f5a-48c9-f8a98359747f
00020000-55e0-1f5b-d145-3814c541546f	00030000-55e0-1f5a-6252-9aca28418d44
00020000-55e0-1f5b-ea54-31fa341cc2f5	00030000-55e0-1f5a-c9dd-2d484032e7a0
00020000-55e0-1f5b-ea54-31fa341cc2f5	00030000-55e0-1f5a-6dca-992cf48fe46f
00020000-55e0-1f5b-ea54-31fa341cc2f5	00030000-55e0-1f5a-c5da-37c633c59bbc
00020000-55e0-1f5b-ea54-31fa341cc2f5	00030000-55e0-1f5a-8700-ac59cd02af13
00020000-55e0-1f5b-ea54-31fa341cc2f5	00030000-55e0-1f5a-d5ce-f06dc6bf4e86
00020000-55e0-1f5b-ea54-31fa341cc2f5	00030000-55e0-1f5a-eb9e-cb5dd217f0f2
00020000-55e0-1f5b-ea54-31fa341cc2f5	00030000-55e0-1f5a-a93c-2d43670299e4
00020000-55e0-1f5b-ea54-31fa341cc2f5	00030000-55e0-1f5a-4e17-4ce745725f18
00020000-55e0-1f5b-ea54-31fa341cc2f5	00030000-55e0-1f5a-8f44-5617dcc19875
00020000-55e0-1f5b-ea54-31fa341cc2f5	00030000-55e0-1f5a-d6e7-b4793cd6986d
00020000-55e0-1f5b-ea54-31fa341cc2f5	00030000-55e0-1f5a-23ad-9970700d2e31
00020000-55e0-1f5b-ea54-31fa341cc2f5	00030000-55e0-1f5a-e1c7-caa02cd617ab
00020000-55e0-1f5b-ea54-31fa341cc2f5	00030000-55e0-1f5a-472f-b7c795671289
00020000-55e0-1f5b-ea54-31fa341cc2f5	00030000-55e0-1f5a-d38a-bac9a8df1dff
00020000-55e0-1f5b-ea54-31fa341cc2f5	00030000-55e0-1f5a-b4f0-e8a970423048
00020000-55e0-1f5b-ea54-31fa341cc2f5	00030000-55e0-1f5a-1030-7d07a4533cf1
00020000-55e0-1f5b-ea54-31fa341cc2f5	00030000-55e0-1f5a-38d0-2acd460790d2
00020000-55e0-1f5b-ea54-31fa341cc2f5	00030000-55e0-1f5a-8587-31b70fbe2bc4
00020000-55e0-1f5b-ea54-31fa341cc2f5	00030000-55e0-1f5a-48c9-f8a98359747f
00020000-55e0-1f5b-ea54-31fa341cc2f5	00030000-55e0-1f5a-6252-9aca28418d44
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-4231-c8310b67da0a
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-f267-76c5a8ee9084
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-38d0-2acd460790d2
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-6b80-1e3fc3ca06b6
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-ef62-a41a234666b1
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-710c-03b57a458948
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-8c9b-b7358f1af4fb
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-c9dd-2d484032e7a0
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-69a9-ca9cb8e2ffaf
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-8c19-e6061ab542e5
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-e316-bed1d3a70973
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-6dca-992cf48fe46f
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-f35f-f91fd09bc118
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-d0c5-5e32f559849c
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-1688-4a2a3b067383
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-89f8-0877c44a9986
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-8cc3-5e036fca91d2
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-c5da-37c633c59bbc
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-278e-3c84b23ac004
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-8700-ac59cd02af13
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-f67d-acef631e8fd4
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-2edf-ba85938f7b83
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-a5e4-fa082c02e490
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-ce36-1da5fe343067
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-9f60-e2ffa4718b0d
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-0c51-61d5747e35e1
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-4464-67c8d513405f
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-d5ce-f06dc6bf4e86
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-5415-332396fa697f
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-eb9e-cb5dd217f0f2
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-02f2-40840e2b4e35
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-ecc7-88d0ed13de06
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-d224-526c895f263c
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-eae6-78d74fdfa92e
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-3939-de4d492d6df6
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-a2b3-fed1558a3ee8
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-1cef-49597e119b19
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-a93c-2d43670299e4
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-fff4-bd841e128350
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-4e17-4ce745725f18
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-00e9-53115d5343a4
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-c9ce-8ada860a5338
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-9798-8a2ad541a016
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-76d2-22a3621c2a64
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-a4ea-96a47b151088
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-533a-af3fe12b6a1e
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-5ab6-44db01aba518
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-ee79-37844fba2ae7
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-c995-c4795a3c58c7
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-8f44-5617dcc19875
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-0273-77b1b2ab7217
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-d6e7-b4793cd6986d
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-9938-f6b0d9c581e0
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-ed8b-ea0fde193b08
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-e159-8b2fca2503a9
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-fb2d-dd37ba7dc546
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-9fbe-83285a0761bb
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-23ad-9970700d2e31
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-ac78-f987d2ac417f
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-5553-5bd2a6760f9d
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-c903-2640f073d0b9
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-90a1-645cc4cc54f9
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-1404-f7b259bad9c6
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-8757-3564929d5cf7
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-74e2-5a4ef6554b67
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-1629-7811fab1e54f
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-614c-491815f58515
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-60e8-38aa555e5b7a
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-3313-ad86a3a13d70
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-76f9-78298c46ceac
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-c783-e20c0fe70c92
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-ada5-14119c6421d6
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-5785-af850f23e71f
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-abb1-346308bc4e54
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-b335-dde6045a221e
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-564c-eddc701fbef7
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-09e6-11c3333bb0ef
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-e8e2-81cf2510fb70
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-1c96-61b92f35a0b4
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-cc11-683131483e29
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-4434-70b5042f4e95
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-8813-0630fecd6bf3
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-4de5-b7f6270bb580
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-7e76-765240a03c2b
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-6513-91dba6111e41
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-e1c7-caa02cd617ab
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-a4de-bfdc862773b5
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-39a7-13d86040bfce
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-8965-bfcf54741df6
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-c9ff-006c267afd43
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-7688-a01068f098e1
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-472f-b7c795671289
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-10eb-a65f73ac8372
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-d38a-bac9a8df1dff
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-7769-ebcaaf780e77
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-851f-3a6307252c05
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-3974-6bca6ca3cb91
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-5de9-298d3df3b497
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-43ec-e24e7d0a5922
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-42f4-8a8d113d774f
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-2577-0f338e6e60e5
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-e1ff-e3d7e6607556
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-28ae-98978b994c3c
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-b4f0-e8a970423048
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-893a-cc3933bf405d
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-949b-99f1fe9c5e92
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-4fdd-0a89fa7acdd0
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-4ede-a6167b8655ca
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-64be-9c2dd801d484
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-eb57-5974e6b41194
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-0eb4-f57f18a6d03f
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-7e55-0ce0738cb10c
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-fac9-c7cec75838c4
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-8b3a-4a291541f276
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-4216-9e67bbe3535d
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-1030-7d07a4533cf1
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-3eef-2a305a904401
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-8587-31b70fbe2bc4
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-6b67-e042275b1b98
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-2d79-7210d1eb094c
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-bf6e-c7d44c75ae69
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-fbae-2c4bf77ff292
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-981f-30d588ccb342
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-f664-0d5ad84c0094
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-53ba-b864cb2359cf
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-89f2-94978fcaac22
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-ee34-0acb5487f40c
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-3850-870eba37658f
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-fb7a-7626605d6370
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-c451-508b20229081
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-e284-92a1ca02de67
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-5bb4-445649c4333b
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-9c75-511fd2dd17da
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-48c9-f8a98359747f
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-da8b-012d21772f64
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-6252-9aca28418d44
00020000-55e0-1f5c-3119-0f9ab5ed4562	00030000-55e0-1f5a-44b5-317048c055fb
\.


--
-- TOC entry 2938 (class 0 OID 16059211)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2942 (class 0 OID 16059244)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 16059368)
-- Dependencies: 219
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55e0-1f5c-767d-3a8da0a48889	00090000-55e0-1f5c-7168-f2ac6a9a9110	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55e0-1f5c-dbb6-447fbb061ee7	00090000-55e0-1f5c-ffc9-a19bed2a0bf3	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55e0-1f5c-0a07-385d2a07df68	00090000-55e0-1f5c-c357-913418892f80	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2915 (class 0 OID 16058973)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55e0-1f5b-338c-ffe74ea693bc	00040000-55e0-1f5a-06da-52ce001e25ce	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e0-1f5b-2bd2-88b4142b5d55	00040000-55e0-1f5a-06da-52ce001e25ce	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55e0-1f5b-cfaa-93e9b5b85e26	00040000-55e0-1f5a-06da-52ce001e25ce	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e0-1f5b-7500-476da8199335	00040000-55e0-1f5a-06da-52ce001e25ce	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e0-1f5b-3e85-0a46b4bbf5dc	00040000-55e0-1f5a-06da-52ce001e25ce	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e0-1f5b-9858-f49e32c7743e	00040000-55e0-1f5a-ed12-10700122b401	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e0-1f5b-b0d2-cf3fe91e2cc2	00040000-55e0-1f5a-2030-ae6e3223e8e1	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e0-1f5b-b7a0-38be6ab586ab	00040000-55e0-1f5a-af5b-e7a1743a3de5	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e0-1f5d-533c-256a03869cae	00040000-55e0-1f5a-06da-52ce001e25ce	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2917 (class 0 OID 16059007)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55e0-1f5a-0676-c536f4a0bfa9	8341	Adlešiči
00050000-55e0-1f5a-59d0-1a639d364506	5270	Ajdovščina
00050000-55e0-1f5a-e18b-6646c0ef467e	6280	Ankaran/Ancarano
00050000-55e0-1f5a-6129-74fd3f24232d	9253	Apače
00050000-55e0-1f5a-0623-5e75aac32f29	8253	Artiče
00050000-55e0-1f5a-382c-3c76696eb6ac	4275	Begunje na Gorenjskem
00050000-55e0-1f5a-2b3d-432a207bac34	1382	Begunje pri Cerknici
00050000-55e0-1f5a-5f8a-72da0c4d960e	9231	Beltinci
00050000-55e0-1f5a-8e04-fe8566be07b2	2234	Benedikt
00050000-55e0-1f5a-591a-f74ea4821b4c	2345	Bistrica ob Dravi
00050000-55e0-1f5a-16d6-82703a1c8223	3256	Bistrica ob Sotli
00050000-55e0-1f5a-2051-d7c851d323e2	8259	Bizeljsko
00050000-55e0-1f5a-da09-cf9fa577c8c2	1223	Blagovica
00050000-55e0-1f5a-42a9-efe8caf56a69	8283	Blanca
00050000-55e0-1f5a-93c9-66334064e0f3	4260	Bled
00050000-55e0-1f5a-228f-932a02d264cb	4273	Blejska Dobrava
00050000-55e0-1f5a-f6f7-5cfe9b39e410	9265	Bodonci
00050000-55e0-1f5a-5f65-2d50ad0ca02f	9222	Bogojina
00050000-55e0-1f5a-e06d-315d64f35ab1	4263	Bohinjska Bela
00050000-55e0-1f5a-b22d-9fc20bfbd3ef	4264	Bohinjska Bistrica
00050000-55e0-1f5a-fa86-be025845d5a7	4265	Bohinjsko jezero
00050000-55e0-1f5a-58c2-8527cd5462d4	1353	Borovnica
00050000-55e0-1f5a-4b72-4fb9c1412a54	8294	Boštanj
00050000-55e0-1f5a-693e-ae415725baa5	5230	Bovec
00050000-55e0-1f5a-e5c7-57ac39f25d93	5295	Branik
00050000-55e0-1f5a-72ca-e0d7d7602f0a	3314	Braslovče
00050000-55e0-1f5a-0c54-3014237be951	5223	Breginj
00050000-55e0-1f5a-51e1-15317929a95d	8280	Brestanica
00050000-55e0-1f5a-fb85-22c587aecb04	2354	Bresternica
00050000-55e0-1f5a-1ee1-0e08044127a6	4243	Brezje
00050000-55e0-1f5a-6a5d-db5a95c5a3fd	1351	Brezovica pri Ljubljani
00050000-55e0-1f5a-1f36-4e0c752f480e	8250	Brežice
00050000-55e0-1f5a-4b18-75e39115689a	4210	Brnik - Aerodrom
00050000-55e0-1f5a-7cbf-5997e21a0958	8321	Brusnice
00050000-55e0-1f5a-9a1e-6ede058ea934	3255	Buče
00050000-55e0-1f5a-1e78-053e7b6eab44	8276	Bučka 
00050000-55e0-1f5a-7b16-2c0eff6b1182	9261	Cankova
00050000-55e0-1f5a-2a9e-2b39433556bd	3000	Celje 
00050000-55e0-1f5a-0ea3-e9a03f1994cc	3001	Celje - poštni predali
00050000-55e0-1f5a-1ef4-b67fc7fae597	4207	Cerklje na Gorenjskem
00050000-55e0-1f5a-643d-45ae2d13f337	8263	Cerklje ob Krki
00050000-55e0-1f5a-befa-5e4a467ef3d6	1380	Cerknica
00050000-55e0-1f5a-9254-c3bba45e12fd	5282	Cerkno
00050000-55e0-1f5a-f3ad-b91463646fae	2236	Cerkvenjak
00050000-55e0-1f5a-5496-81dafa94cf5b	2215	Ceršak
00050000-55e0-1f5a-fc60-df419378d4b4	2326	Cirkovce
00050000-55e0-1f5a-92fe-a915fbf140b1	2282	Cirkulane
00050000-55e0-1f5a-1d58-16338d075219	5273	Col
00050000-55e0-1f5a-40ec-83992a16fb89	8251	Čatež ob Savi
00050000-55e0-1f5a-1a82-f1ebd0097f3b	1413	Čemšenik
00050000-55e0-1f5a-c94f-77433ff9843f	5253	Čepovan
00050000-55e0-1f5a-fbdb-70a0ea55408d	9232	Črenšovci
00050000-55e0-1f5a-a770-db4862db2d77	2393	Črna na Koroškem
00050000-55e0-1f5a-e982-b3c63ab74769	6275	Črni Kal
00050000-55e0-1f5a-2ec7-bd02115e91bb	5274	Črni Vrh nad Idrijo
00050000-55e0-1f5a-1c86-98946e81b22e	5262	Črniče
00050000-55e0-1f5a-e92c-1fd5a9e8f15e	8340	Črnomelj
00050000-55e0-1f5a-659c-bb29d5dae132	6271	Dekani
00050000-55e0-1f5a-7ead-1a18ae916fb8	5210	Deskle
00050000-55e0-1f5a-2212-71da52e0ad9c	2253	Destrnik
00050000-55e0-1f5a-961b-98007488ad23	6215	Divača
00050000-55e0-1f5a-4ef9-f9236e8d97b3	1233	Dob
00050000-55e0-1f5a-80e3-7709ef064e63	3224	Dobje pri Planini
00050000-55e0-1f5a-d99b-ffecc8cf1ae9	8257	Dobova
00050000-55e0-1f5a-518d-16c0ebe2838e	1423	Dobovec
00050000-55e0-1f5a-3c57-a7d74598eb31	5263	Dobravlje
00050000-55e0-1f5a-20f8-9e9c1e5c4f57	3204	Dobrna
00050000-55e0-1f5a-2595-518d8a2cf2b1	8211	Dobrnič
00050000-55e0-1f5a-74b8-60be396ad5fd	1356	Dobrova
00050000-55e0-1f5a-a464-098e97cd4a4c	9223	Dobrovnik/Dobronak 
00050000-55e0-1f5a-d122-2baee6c31ed8	5212	Dobrovo v Brdih
00050000-55e0-1f5a-9d56-dfa28e1ba2c7	1431	Dol pri Hrastniku
00050000-55e0-1f5a-ca85-c673091203c1	1262	Dol pri Ljubljani
00050000-55e0-1f5a-7907-fb39d76d0b4b	1273	Dole pri Litiji
00050000-55e0-1f5a-d795-27a579001795	1331	Dolenja vas
00050000-55e0-1f5a-66ad-ee8bed4d40e1	8350	Dolenjske Toplice
00050000-55e0-1f5a-b369-33b6965a03c4	1230	Domžale
00050000-55e0-1f5a-0c48-dbe34afc5dbc	2252	Dornava
00050000-55e0-1f5a-3d3b-1df551f3ba83	5294	Dornberk
00050000-55e0-1f5a-f66b-02b80fba56ae	1319	Draga
00050000-55e0-1f5a-4bd7-6a325a26bd68	8343	Dragatuš
00050000-55e0-1f5a-d5dd-189de3e8633a	3222	Dramlje
00050000-55e0-1f5a-eb0f-77768d86ce65	2370	Dravograd
00050000-55e0-1f5a-1bfa-9c40ffb30c69	4203	Duplje
00050000-55e0-1f5a-e0f0-78a7014f5446	6221	Dutovlje
00050000-55e0-1f5a-b909-9a35962b4abe	8361	Dvor
00050000-55e0-1f5a-dbb0-83c36b9ac5a1	2343	Fala
00050000-55e0-1f5a-49fc-a05c0036ccfb	9208	Fokovci
00050000-55e0-1f5a-3534-9d11f4d53a14	2313	Fram
00050000-55e0-1f5a-144f-8270ae210d1e	3213	Frankolovo
00050000-55e0-1f5a-436d-e687138cd511	1274	Gabrovka
00050000-55e0-1f5a-f550-fedc6a052bd1	8254	Globoko
00050000-55e0-1f5a-3d51-5a3915367524	5275	Godovič
00050000-55e0-1f5a-a67c-6bfbca484590	4204	Golnik
00050000-55e0-1f5a-d5bc-08651156bebf	3303	Gomilsko
00050000-55e0-1f5a-1cd7-2a77b97c68b9	4224	Gorenja vas
00050000-55e0-1f5a-fdc1-ebda26e3fd96	3263	Gorica pri Slivnici
00050000-55e0-1f5a-d3e4-c65b35cfa4a2	2272	Gorišnica
00050000-55e0-1f5a-47a4-d6b0ac68554f	9250	Gornja Radgona
00050000-55e0-1f5a-b4bc-cc6d68dd68b1	3342	Gornji Grad
00050000-55e0-1f5a-02e6-7279c8d7eb38	4282	Gozd Martuljek
00050000-55e0-1f5a-47ce-9e5d9997fcaa	6272	Gračišče
00050000-55e0-1f5a-0632-41cea40ac3eb	9264	Grad
00050000-55e0-1f5a-0a28-7c3d3d7b9b2d	8332	Gradac
00050000-55e0-1f5a-39e0-2948c6d71627	1384	Grahovo
00050000-55e0-1f5a-fedb-6f31d35268f8	5242	Grahovo ob Bači
00050000-55e0-1f5a-c065-7ac5ef4ff022	5251	Grgar
00050000-55e0-1f5a-93c6-55f0bc623f17	3302	Griže
00050000-55e0-1f5a-c4f1-7fd14c0e6825	3231	Grobelno
00050000-55e0-1f5a-2576-6b33997f9b15	1290	Grosuplje
00050000-55e0-1f5a-0d53-0ad07240c7f4	2288	Hajdina
00050000-55e0-1f5a-c864-d09b14e1dd7e	8362	Hinje
00050000-55e0-1f5a-796b-a249b175062f	2311	Hoče
00050000-55e0-1f5a-8b1f-4f72cdf66ad5	9205	Hodoš/Hodos
00050000-55e0-1f5a-91d8-5ef101c63cca	1354	Horjul
00050000-55e0-1f5a-31d4-30b3e9e603b4	1372	Hotedršica
00050000-55e0-1f5a-eb1c-e3e071d3c19c	1430	Hrastnik
00050000-55e0-1f5a-9b80-6ec83d1c745f	6225	Hruševje
00050000-55e0-1f5a-d7da-eeb99f9d3f2a	4276	Hrušica
00050000-55e0-1f5a-19b2-c838a5ed3aa1	5280	Idrija
00050000-55e0-1f5a-321e-c67acd35ad5d	1292	Ig
00050000-55e0-1f5a-b521-9f6097cc02b7	6250	Ilirska Bistrica
00050000-55e0-1f5a-f023-8398e4c83b62	6251	Ilirska Bistrica-Trnovo
00050000-55e0-1f5a-7160-373ade2a0923	1295	Ivančna Gorica
00050000-55e0-1f5a-e19f-7e9d95f2f5ad	2259	Ivanjkovci
00050000-55e0-1f5a-f94b-4181259c961c	1411	Izlake
00050000-55e0-1f5a-c9bb-a517158da12d	6310	Izola/Isola
00050000-55e0-1f5a-4be3-f60d33557ee7	2222	Jakobski Dol
00050000-55e0-1f5a-743c-763a642e9439	2221	Jarenina
00050000-55e0-1f5a-7e50-654d82e48caa	6254	Jelšane
00050000-55e0-1f5a-3dda-5b055c938869	4270	Jesenice
00050000-55e0-1f5a-961c-fd74a1256837	8261	Jesenice na Dolenjskem
00050000-55e0-1f5a-d951-8e420280540c	3273	Jurklošter
00050000-55e0-1f5a-bd79-66a18b1260b4	2223	Jurovski Dol
00050000-55e0-1f5a-fe2d-55f406bcb8d0	2256	Juršinci
00050000-55e0-1f5a-f761-3f1d4c954df5	5214	Kal nad Kanalom
00050000-55e0-1f5a-5232-df43adaad6e5	3233	Kalobje
00050000-55e0-1f5a-29cf-6986ecb4d424	4246	Kamna Gorica
00050000-55e0-1f5a-e63f-2413ad95c2a6	2351	Kamnica
00050000-55e0-1f5a-c4dd-22043dcf96dc	1241	Kamnik
00050000-55e0-1f5a-fc69-0d46106e0b3c	5213	Kanal
00050000-55e0-1f5a-c335-09986d79b39f	8258	Kapele
00050000-55e0-1f5a-222f-0f175431861e	2362	Kapla
00050000-55e0-1f5a-866c-7ddd2a257ea1	2325	Kidričevo
00050000-55e0-1f5a-8b84-10dffd725e29	1412	Kisovec
00050000-55e0-1f5a-f145-f78d805f8e1a	6253	Knežak
00050000-55e0-1f5a-2ce6-c7f52b1f47ec	5222	Kobarid
00050000-55e0-1f5a-17d1-c81ea11204b3	9227	Kobilje
00050000-55e0-1f5a-16b6-082fefa91448	1330	Kočevje
00050000-55e0-1f5a-67d5-0e6f0dc34953	1338	Kočevska Reka
00050000-55e0-1f5a-3343-61af0af928c0	2276	Kog
00050000-55e0-1f5a-71d4-097b6af3ea4a	5211	Kojsko
00050000-55e0-1f5a-657c-e082fa99c486	6223	Komen
00050000-55e0-1f5a-08a7-fb453ecee0c5	1218	Komenda
00050000-55e0-1f5a-9171-c7537039c51b	6000	Koper/Capodistria 
00050000-55e0-1f5a-cd5d-3fd4ca000a67	6001	Koper/Capodistria - poštni predali
00050000-55e0-1f5a-0618-d6e78daa1065	8282	Koprivnica
00050000-55e0-1f5a-233c-e65673aa9a41	5296	Kostanjevica na Krasu
00050000-55e0-1f5a-29cf-6bc51e8684d8	8311	Kostanjevica na Krki
00050000-55e0-1f5a-70ac-8208c335b720	1336	Kostel
00050000-55e0-1f5a-9e53-316f4cb8aae7	6256	Košana
00050000-55e0-1f5a-d99c-264a018bf2dd	2394	Kotlje
00050000-55e0-1f5a-ee43-a0648e3da583	6240	Kozina
00050000-55e0-1f5a-5b20-65d67ea9cefc	3260	Kozje
00050000-55e0-1f5a-5f06-9dd94af70ddc	4000	Kranj 
00050000-55e0-1f5a-7861-1a63598946d7	4001	Kranj - poštni predali
00050000-55e0-1f5a-9fd8-b0fd633760ec	4280	Kranjska Gora
00050000-55e0-1f5a-4a58-4874de8572f8	1281	Kresnice
00050000-55e0-1f5a-8d07-94fb3ae77564	4294	Križe
00050000-55e0-1f5a-64d8-9b54c85a79c0	9206	Križevci
00050000-55e0-1f5a-a901-b2e1607bc970	9242	Križevci pri Ljutomeru
00050000-55e0-1f5a-b831-98b6e64056fa	1301	Krka
00050000-55e0-1f5a-ff8e-ec9978cb7251	8296	Krmelj
00050000-55e0-1f5a-cea7-f4c3fbc41758	4245	Kropa
00050000-55e0-1f5a-13c6-da0844332139	8262	Krška vas
00050000-55e0-1f5a-9c40-56cb649538af	8270	Krško
00050000-55e0-1f5a-9fba-6f2ad9a10286	9263	Kuzma
00050000-55e0-1f5a-b84b-c4f4909d4ad5	2318	Laporje
00050000-55e0-1f5a-917f-9a4c977d5023	3270	Laško
00050000-55e0-1f5a-569b-33b2dfa61112	1219	Laze v Tuhinju
00050000-55e0-1f5a-0801-4500494132cf	2230	Lenart v Slovenskih goricah
00050000-55e0-1f5a-877c-a40a27f999d5	9220	Lendava/Lendva
00050000-55e0-1f5a-1536-a37b356b6e9a	4248	Lesce
00050000-55e0-1f5a-63ae-cf052cc97483	3261	Lesično
00050000-55e0-1f5a-5358-3323d3d6ec9f	8273	Leskovec pri Krškem
00050000-55e0-1f5a-e8aa-e5a7053c9a77	2372	Libeliče
00050000-55e0-1f5a-348a-53f842ff1b92	2341	Limbuš
00050000-55e0-1f5a-5f7c-df1c39a16aa4	1270	Litija
00050000-55e0-1f5a-f717-9e24b89e7065	3202	Ljubečna
00050000-55e0-1f5a-5966-23cbfd6c0807	1000	Ljubljana 
00050000-55e0-1f5a-9add-f1101665c039	1001	Ljubljana - poštni predali
00050000-55e0-1f5a-4a44-762f8cbd75ff	1231	Ljubljana - Črnuče
00050000-55e0-1f5a-5892-054ce1a6f0b8	1261	Ljubljana - Dobrunje
00050000-55e0-1f5a-424d-fc65e9e1c159	1260	Ljubljana - Polje
00050000-55e0-1f5a-09da-76c03e56d636	1210	Ljubljana - Šentvid
00050000-55e0-1f5a-e6bd-bbdf63c25bc1	1211	Ljubljana - Šmartno
00050000-55e0-1f5a-4dad-fab44eef3ae1	3333	Ljubno ob Savinji
00050000-55e0-1f5a-a334-3b075d64cf50	9240	Ljutomer
00050000-55e0-1f5a-b09c-e8455620a783	3215	Loče
00050000-55e0-1f5a-0985-e36d76b482da	5231	Log pod Mangartom
00050000-55e0-1f5a-bf3a-9126230ce8f3	1358	Log pri Brezovici
00050000-55e0-1f5a-daa5-26eff3c21fb2	1370	Logatec
00050000-55e0-1f5a-b5c3-7eae7d23caf2	1371	Logatec
00050000-55e0-1f5a-d3d2-0cad98251316	1434	Loka pri Zidanem Mostu
00050000-55e0-1f5a-c7ea-2a8e3aed1cff	3223	Loka pri Žusmu
00050000-55e0-1f5a-b0cf-b623bf798647	6219	Lokev
00050000-55e0-1f5a-6b95-f6821725832e	1318	Loški Potok
00050000-55e0-1f5a-5fcf-f102110e227e	2324	Lovrenc na Dravskem polju
00050000-55e0-1f5a-f65d-c75bc83b0c4f	2344	Lovrenc na Pohorju
00050000-55e0-1f5a-ab7a-65d29726dc29	3334	Luče
00050000-55e0-1f5a-4f36-780cc0b4ba60	1225	Lukovica
00050000-55e0-1f5a-6d51-1339b21bcb2f	9202	Mačkovci
00050000-55e0-1f5a-dbcd-f49ef840c04a	2322	Majšperk
00050000-55e0-1f5a-e7fe-a2bace7fb849	2321	Makole
00050000-55e0-1f5a-8044-355e998fe680	9243	Mala Nedelja
00050000-55e0-1f5a-df63-ec9acd61b0e9	2229	Malečnik
00050000-55e0-1f5a-ea75-bf2df800733b	6273	Marezige
00050000-55e0-1f5a-fb0c-642f21981e26	2000	Maribor 
00050000-55e0-1f5a-be40-23227b60635f	2001	Maribor - poštni predali
00050000-55e0-1f5a-6273-16eff806d66a	2206	Marjeta na Dravskem polju
00050000-55e0-1f5a-97d7-44b9d2fe3b83	2281	Markovci
00050000-55e0-1f5a-ebd9-6ff8042ff943	9221	Martjanci
00050000-55e0-1f5a-81ca-d540b8858f78	6242	Materija
00050000-55e0-1f5a-491f-14c8507f5055	4211	Mavčiče
00050000-55e0-1f5a-0e52-2c589e27d740	1215	Medvode
00050000-55e0-1f5a-b0bd-3ad1e8ca686d	1234	Mengeš
00050000-55e0-1f5a-57b5-686fff751468	8330	Metlika
00050000-55e0-1f5a-f21d-79a553f2f9bf	2392	Mežica
00050000-55e0-1f5a-546c-dd44c66248e4	2204	Miklavž na Dravskem polju
00050000-55e0-1f5a-26b7-8d877f1e9738	2275	Miklavž pri Ormožu
00050000-55e0-1f5a-7d09-73d49e59b5e3	5291	Miren
00050000-55e0-1f5a-5486-51c4599e494f	8233	Mirna
00050000-55e0-1f5a-7a3d-6a4ad179e353	8216	Mirna Peč
00050000-55e0-1f5a-1198-80baeedd1ba6	2382	Mislinja
00050000-55e0-1f5a-9e11-da49abe86818	4281	Mojstrana
00050000-55e0-1f5a-f2c3-2657db21fc55	8230	Mokronog
00050000-55e0-1f5a-d68e-8ea5dfc35c87	1251	Moravče
00050000-55e0-1f5a-8fb9-65f368392867	9226	Moravske Toplice
00050000-55e0-1f5a-108a-aff1dd227929	5216	Most na Soči
00050000-55e0-1f5a-77d8-6dd93451177a	1221	Motnik
00050000-55e0-1f5a-06dd-0b0d65bb0ce2	3330	Mozirje
00050000-55e0-1f5a-782c-17ea5bb13eac	9000	Murska Sobota 
00050000-55e0-1f5a-161a-4e9f35d90452	9001	Murska Sobota - poštni predali
00050000-55e0-1f5a-61b5-e91bd175a13e	2366	Muta
00050000-55e0-1f5a-50d0-f19f47a98e23	4202	Naklo
00050000-55e0-1f5a-e29d-0b772fd3df6d	3331	Nazarje
00050000-55e0-1f5a-90e1-6a08fbc6e145	1357	Notranje Gorice
00050000-55e0-1f5a-a740-17ce563df79c	3203	Nova Cerkev
00050000-55e0-1f5a-c8eb-248ced3aa5ef	5000	Nova Gorica 
00050000-55e0-1f5a-2ad9-9993f6c4ba58	5001	Nova Gorica - poštni predali
00050000-55e0-1f5a-b0ab-7c3d834f058b	1385	Nova vas
00050000-55e0-1f5a-1514-b5d8145dfec9	8000	Novo mesto
00050000-55e0-1f5a-e983-7d909604e595	8001	Novo mesto - poštni predali
00050000-55e0-1f5a-adfd-a8ff274a863f	6243	Obrov
00050000-55e0-1f5a-65e3-efbcc9fdcbdd	9233	Odranci
00050000-55e0-1f5a-7591-c0206b38d6fb	2317	Oplotnica
00050000-55e0-1f5a-6eec-c1a43edde0d8	2312	Orehova vas
00050000-55e0-1f5a-d709-aef87ba2928f	2270	Ormož
00050000-55e0-1f5a-85c8-315ed0f71d8a	1316	Ortnek
00050000-55e0-1f5a-5630-4936688d7419	1337	Osilnica
00050000-55e0-1f5a-a324-da14f8aa800c	8222	Otočec
00050000-55e0-1f5a-50a2-1b6260bec9ba	2361	Ožbalt
00050000-55e0-1f5a-3c17-f63f3cb6f1e3	2231	Pernica
00050000-55e0-1f5a-1a90-cad4499da64e	2211	Pesnica pri Mariboru
00050000-55e0-1f5a-5fd3-6e340998607e	9203	Petrovci
00050000-55e0-1f5a-cf11-20c1314d94c1	3301	Petrovče
00050000-55e0-1f5a-cb1f-b08a72b876a7	6330	Piran/Pirano
00050000-55e0-1f5a-7888-dd1475dce6ac	8255	Pišece
00050000-55e0-1f5a-0fcf-a01a9dd833a6	6257	Pivka
00050000-55e0-1f5a-e54b-cfa9698a5a3d	6232	Planina
00050000-55e0-1f5a-c93c-9c335488062d	3225	Planina pri Sevnici
00050000-55e0-1f5a-aca2-e554e9231e3d	6276	Pobegi
00050000-55e0-1f5a-2286-68d49d6d13f7	8312	Podbočje
00050000-55e0-1f5a-6be1-90ae8ac4c4b1	5243	Podbrdo
00050000-55e0-1f5a-c4a4-e27cdee63011	3254	Podčetrtek
00050000-55e0-1f5a-b446-ee45627ca1ce	2273	Podgorci
00050000-55e0-1f5a-9be8-d1d94d4f89ba	6216	Podgorje
00050000-55e0-1f5a-dd80-f0432cd63348	2381	Podgorje pri Slovenj Gradcu
00050000-55e0-1f5a-45e4-3c18dfe5bf81	6244	Podgrad
00050000-55e0-1f5a-84fc-e2ba727cb133	1414	Podkum
00050000-55e0-1f5a-5f7f-126c0f4f44cc	2286	Podlehnik
00050000-55e0-1f5a-1601-8b84a810b307	5272	Podnanos
00050000-55e0-1f5a-ee93-cdae722ea740	4244	Podnart
00050000-55e0-1f5a-c247-b44627f0207c	3241	Podplat
00050000-55e0-1f5a-be1a-29900a4b6876	3257	Podsreda
00050000-55e0-1f5a-d55b-c1345e81ed9a	2363	Podvelka
00050000-55e0-1f5a-7391-0302d6a7db57	2208	Pohorje
00050000-55e0-1f5a-4634-3da505e9f0fc	2257	Polenšak
00050000-55e0-1f5a-f971-85836313c7f9	1355	Polhov Gradec
00050000-55e0-1f5a-5901-685fb305d146	4223	Poljane nad Škofjo Loko
00050000-55e0-1f5a-a6d5-b4de5cc20a68	2319	Poljčane
00050000-55e0-1f5a-2247-6374d0216d2a	1272	Polšnik
00050000-55e0-1f5a-f377-ab4dcb2ee160	3313	Polzela
00050000-55e0-1f5a-513a-c8b4b36a904f	3232	Ponikva
00050000-55e0-1f5a-b159-b56b8e7a16c2	6320	Portorož/Portorose
00050000-55e0-1f5a-2b52-7b689c9a68e0	6230	Postojna
00050000-55e0-1f5a-9e42-b9db29367a9d	2331	Pragersko
00050000-55e0-1f5a-e623-78053c26ebb3	3312	Prebold
00050000-55e0-1f5a-a594-f98d581bc055	4205	Preddvor
00050000-55e0-1f5a-66c7-2c5054acddff	6255	Prem
00050000-55e0-1f5a-a62c-841dab3192dd	1352	Preserje
00050000-55e0-1f5a-1ed7-b7b36d183694	6258	Prestranek
00050000-55e0-1f5a-72d3-2e16659f4275	2391	Prevalje
00050000-55e0-1f5a-422a-bf8d5ddbfabc	3262	Prevorje
00050000-55e0-1f5a-cc0c-8d305493cc83	1276	Primskovo 
00050000-55e0-1f5a-bfb5-381c61e24e71	3253	Pristava pri Mestinju
00050000-55e0-1f5a-4532-664cd8c22f9c	9207	Prosenjakovci/Partosfalva
00050000-55e0-1f5a-0647-083401da0e7b	5297	Prvačina
00050000-55e0-1f5a-6d0b-7debdeed54fd	2250	Ptuj
00050000-55e0-1f5a-cc5b-a43e0feab591	2323	Ptujska Gora
00050000-55e0-1f5a-26fb-fcbbd8a481d7	9201	Puconci
00050000-55e0-1f5a-06a7-5f0f19e62279	2327	Rače
00050000-55e0-1f5a-b51b-c1bc190f0c94	1433	Radeče
00050000-55e0-1f5a-5391-29a2b312503e	9252	Radenci
00050000-55e0-1f5a-1687-3bf7c5e4da63	2360	Radlje ob Dravi
00050000-55e0-1f5a-c43e-2dc4885ca61f	1235	Radomlje
00050000-55e0-1f5a-7627-9bc55f1e0897	4240	Radovljica
00050000-55e0-1f5a-6a3c-b420d989a57d	8274	Raka
00050000-55e0-1f5a-a0e7-521d8d376e4c	1381	Rakek
00050000-55e0-1f5a-691c-268a6087aea5	4283	Rateče - Planica
00050000-55e0-1f5a-57d4-466629e179e7	2390	Ravne na Koroškem
00050000-55e0-1f5a-efe4-f882b9896f24	9246	Razkrižje
00050000-55e0-1f5a-1d02-be4cd2b1298d	3332	Rečica ob Savinji
00050000-55e0-1f5a-b870-9481b7839de7	5292	Renče
00050000-55e0-1f5a-51c5-0210c72fc930	1310	Ribnica
00050000-55e0-1f5a-84d7-6ff3277e1366	2364	Ribnica na Pohorju
00050000-55e0-1f5a-9390-6fe0b46c3bc4	3272	Rimske Toplice
00050000-55e0-1f5a-6641-82664cca7a09	1314	Rob
00050000-55e0-1f5a-3daa-f4d989e85ca4	5215	Ročinj
00050000-55e0-1f5a-2fbb-9f6d51f34d71	3250	Rogaška Slatina
00050000-55e0-1f5a-1a90-c4bd3ad2bdb4	9262	Rogašovci
00050000-55e0-1f5a-cdc8-ee0d5f3a96bd	3252	Rogatec
00050000-55e0-1f5a-08a7-829e584377e3	1373	Rovte
00050000-55e0-1f5a-7f22-925838873b8a	2342	Ruše
00050000-55e0-1f5a-1633-f911541ab88e	1282	Sava
00050000-55e0-1f5a-43e5-266326939169	6333	Sečovlje/Sicciole
00050000-55e0-1f5a-68f6-f009821ff096	4227	Selca
00050000-55e0-1f5a-8b22-7f148ef54516	2352	Selnica ob Dravi
00050000-55e0-1f5a-ea12-30fd76b87766	8333	Semič
00050000-55e0-1f5a-ff94-50887d764187	8281	Senovo
00050000-55e0-1f5a-9c1d-1c7ec5db753a	6224	Senožeče
00050000-55e0-1f5a-c218-1b8a809defe6	8290	Sevnica
00050000-55e0-1f5a-fc3f-e6e2094543f0	6210	Sežana
00050000-55e0-1f5a-c091-40b5a2db0268	2214	Sladki Vrh
00050000-55e0-1f5a-60cf-24bf9b8b283b	5283	Slap ob Idrijci
00050000-55e0-1f5a-ec48-de200e10ddf3	2380	Slovenj Gradec
00050000-55e0-1f5a-7336-7dfac232a276	2310	Slovenska Bistrica
00050000-55e0-1f5a-d949-808ea1781fb3	3210	Slovenske Konjice
00050000-55e0-1f5a-6d73-16035b40862e	1216	Smlednik
00050000-55e0-1f5a-a6b6-3d5a8ab6f74f	5232	Soča
00050000-55e0-1f5a-96af-080bcaf2624e	1317	Sodražica
00050000-55e0-1f5a-8063-96a44190f34d	3335	Solčava
00050000-55e0-1f5a-581f-59331562434d	5250	Solkan
00050000-55e0-1f5a-7c07-2fb22f0b35d5	4229	Sorica
00050000-55e0-1f5a-90aa-0e8788d8a33c	4225	Sovodenj
00050000-55e0-1f5a-2ced-8add0e03debf	5281	Spodnja Idrija
00050000-55e0-1f5a-5b34-8356b5676adf	2241	Spodnji Duplek
00050000-55e0-1f5a-4be3-46504617cc7c	9245	Spodnji Ivanjci
00050000-55e0-1f5a-bd2d-dcecbd6fb585	2277	Središče ob Dravi
00050000-55e0-1f5a-648b-2a2572a76a45	4267	Srednja vas v Bohinju
00050000-55e0-1f5a-acd3-5f835bbdda8f	8256	Sromlje 
00050000-55e0-1f5a-45b2-05afeb8bf9e3	5224	Srpenica
00050000-55e0-1f5a-d19b-664eaec421b9	1242	Stahovica
00050000-55e0-1f5a-2aa7-4e54cbeb4e7e	1332	Stara Cerkev
00050000-55e0-1f5a-7cc7-50974b358d3b	8342	Stari trg ob Kolpi
00050000-55e0-1f5a-bc1e-921931838a22	1386	Stari trg pri Ložu
00050000-55e0-1f5a-5f54-4aa56629b2e6	2205	Starše
00050000-55e0-1f5a-acce-2f9032140405	2289	Stoperce
00050000-55e0-1f5a-a73f-fbcc5b5057b5	8322	Stopiče
00050000-55e0-1f5a-5746-e40139103680	3206	Stranice
00050000-55e0-1f5a-becd-9d98f6dd8696	8351	Straža
00050000-55e0-1f5a-4012-5a2cb02970b1	1313	Struge
00050000-55e0-1f5a-9a56-d8f4c6be37b8	8293	Studenec
00050000-55e0-1f5a-71cc-ea093f3fa055	8331	Suhor
00050000-55e0-1f5a-5bb6-2ade3ed468fe	2233	Sv. Ana v Slovenskih goricah
00050000-55e0-1f5a-b712-b3639bf8d372	2235	Sv. Trojica v Slovenskih goricah
00050000-55e0-1f5a-f05e-26817ac2a732	2353	Sveti Duh na Ostrem Vrhu
00050000-55e0-1f5a-c42c-1a4eecee9ad1	9244	Sveti Jurij ob Ščavnici
00050000-55e0-1f5a-a5c6-0d83a2d0eb17	3264	Sveti Štefan
00050000-55e0-1f5a-21a1-aa05505b0e01	2258	Sveti Tomaž
00050000-55e0-1f5a-0208-4931cad3c7c4	9204	Šalovci
00050000-55e0-1f5a-3a89-a4858aea272e	5261	Šempas
00050000-55e0-1f5a-5315-1ade3a733f64	5290	Šempeter pri Gorici
00050000-55e0-1f5a-b4b0-bc29ac9adbb0	3311	Šempeter v Savinjski dolini
00050000-55e0-1f5a-03ec-54efbed5718a	4208	Šenčur
00050000-55e0-1f5a-ca43-4682d0a4b31d	2212	Šentilj v Slovenskih goricah
00050000-55e0-1f5a-8708-6eeb1023f19c	8297	Šentjanž
00050000-55e0-1f5a-49d7-857cbe06772f	2373	Šentjanž pri Dravogradu
00050000-55e0-1f5a-9fac-ad45b8b6f214	8310	Šentjernej
00050000-55e0-1f5a-35bf-abf29a7cb75e	3230	Šentjur
00050000-55e0-1f5a-5630-065778f30004	3271	Šentrupert
00050000-55e0-1f5a-5c90-2b5176ad271e	8232	Šentrupert
00050000-55e0-1f5a-2f07-6f125599f57e	1296	Šentvid pri Stični
00050000-55e0-1f5a-510e-1bd97c41c3b5	8275	Škocjan
00050000-55e0-1f5a-26b6-d8952a905057	6281	Škofije
00050000-55e0-1f5a-3375-05e6eb25ab1f	4220	Škofja Loka
00050000-55e0-1f5a-d6e8-fefe9d280bbf	3211	Škofja vas
00050000-55e0-1f5a-a6de-e05bc7c8cab8	1291	Škofljica
00050000-55e0-1f5a-51c3-1c3312b445c5	6274	Šmarje
00050000-55e0-1f5a-792a-a87602ebe7eb	1293	Šmarje - Sap
00050000-55e0-1f5a-6011-443057b67556	3240	Šmarje pri Jelšah
00050000-55e0-1f5a-58ab-b1b0b660688e	8220	Šmarješke Toplice
00050000-55e0-1f5a-2fec-12d3b853745a	2315	Šmartno na Pohorju
00050000-55e0-1f5a-e550-e29b630e5277	3341	Šmartno ob Dreti
00050000-55e0-1f5a-3d67-4246f5b983ef	3327	Šmartno ob Paki
00050000-55e0-1f5a-766c-9decbec378ec	1275	Šmartno pri Litiji
00050000-55e0-1f5a-18e2-90f40ae22922	2383	Šmartno pri Slovenj Gradcu
00050000-55e0-1f5a-a731-59a5edb9f534	3201	Šmartno v Rožni dolini
00050000-55e0-1f5a-27f2-60df6f3251b1	3325	Šoštanj
00050000-55e0-1f5a-54f6-e70829ee9548	6222	Štanjel
00050000-55e0-1f5a-8190-4384f4f66f8f	3220	Štore
00050000-55e0-1f5a-fd1c-175e2a2480cb	3304	Tabor
00050000-55e0-1f5a-5206-1242d4091dbd	3221	Teharje
00050000-55e0-1f5a-3ffb-733bd9be52b5	9251	Tišina
00050000-55e0-1f5a-0231-9ce449be9e18	5220	Tolmin
00050000-55e0-1f5a-541e-829ddcd41332	3326	Topolšica
00050000-55e0-1f5a-96ff-40766f0ee166	2371	Trbonje
00050000-55e0-1f5a-9855-a94fef66a613	1420	Trbovlje
00050000-55e0-1f5a-8142-00c91a564974	8231	Trebelno 
00050000-55e0-1f5a-04b6-07d1f6f491d6	8210	Trebnje
00050000-55e0-1f5a-9055-e8ae475000fd	5252	Trnovo pri Gorici
00050000-55e0-1f5a-8803-522622900e26	2254	Trnovska vas
00050000-55e0-1f5a-bf76-ebccae93ce02	1222	Trojane
00050000-55e0-1f5a-8270-aae6287d8803	1236	Trzin
00050000-55e0-1f5a-c683-52b55b328ba4	4290	Tržič
00050000-55e0-1f5a-9842-0467e88551b5	8295	Tržišče
00050000-55e0-1f5a-2ee6-0451d3217e33	1311	Turjak
00050000-55e0-1f5a-cdbb-0c8ff0750c26	9224	Turnišče
00050000-55e0-1f5a-34fb-5a0d80f97855	8323	Uršna sela
00050000-55e0-1f5a-dda2-8bfb5301d994	1252	Vače
00050000-55e0-1f5a-e445-0ecdfe1e989b	3320	Velenje 
00050000-55e0-1f5a-a407-3729de218576	3322	Velenje - poštni predali
00050000-55e0-1f5a-5b97-5d7ba7ba1d19	8212	Velika Loka
00050000-55e0-1f5a-0b1d-517e9d178eb7	2274	Velika Nedelja
00050000-55e0-1f5a-4e98-660901e0b341	9225	Velika Polana
00050000-55e0-1f5a-267d-38e5834281aa	1315	Velike Lašče
00050000-55e0-1f5a-fd01-a1e11c2cc20d	8213	Veliki Gaber
00050000-55e0-1f5a-b9a8-f5d060ab71ee	9241	Veržej
00050000-55e0-1f5a-fadd-e8839bc71bce	1312	Videm - Dobrepolje
00050000-55e0-1f5a-cd59-827149f82c9c	2284	Videm pri Ptuju
00050000-55e0-1f5a-b0f5-96d3c1590172	8344	Vinica
00050000-55e0-1f5a-e37f-4fe32c13ada8	5271	Vipava
00050000-55e0-1f5a-79e3-52d4ba955425	4212	Visoko
00050000-55e0-1f5a-6028-7dccca791841	1294	Višnja Gora
00050000-55e0-1f5a-b520-762354038745	3205	Vitanje
00050000-55e0-1f5a-a0cd-112555aeb82b	2255	Vitomarci
00050000-55e0-1f5a-caa2-e25474af8501	1217	Vodice
00050000-55e0-1f5a-a63b-601a5a461440	3212	Vojnik\t
00050000-55e0-1f5a-7340-75d2ab00ad69	5293	Volčja Draga
00050000-55e0-1f5a-6855-232697f69138	2232	Voličina
00050000-55e0-1f5a-e9de-e1f0651ab7d4	3305	Vransko
00050000-55e0-1f5a-fc0d-9b413093894e	6217	Vremski Britof
00050000-55e0-1f5a-d13a-cf1c81e0ee53	1360	Vrhnika
00050000-55e0-1f5a-3c25-a170caec9cbf	2365	Vuhred
00050000-55e0-1f5a-3d60-d45883d527cd	2367	Vuzenica
00050000-55e0-1f5a-3e7c-295036e7c8b8	8292	Zabukovje 
00050000-55e0-1f5a-f0a2-66be018262ef	1410	Zagorje ob Savi
00050000-55e0-1f5a-a7d1-6892353b90fa	1303	Zagradec
00050000-55e0-1f5a-5f3a-dcda849aad26	2283	Zavrč
00050000-55e0-1f5a-a098-01ce8f0f1c56	8272	Zdole 
00050000-55e0-1f5a-299b-2f0bfa3fdcfc	4201	Zgornja Besnica
00050000-55e0-1f5a-7f23-fab3f537d1b1	2242	Zgornja Korena
00050000-55e0-1f5a-f8c3-f8a525a8060f	2201	Zgornja Kungota
00050000-55e0-1f5a-305a-0ea4a19f7244	2316	Zgornja Ložnica
00050000-55e0-1f5a-7ae3-e4e2c747761b	2314	Zgornja Polskava
00050000-55e0-1f5a-2997-341405e5bb7e	2213	Zgornja Velka
00050000-55e0-1f5a-deac-13476feb2aa9	4247	Zgornje Gorje
00050000-55e0-1f5a-d1b5-cda014a4f557	4206	Zgornje Jezersko
00050000-55e0-1f5a-991e-c69a891c5a22	2285	Zgornji Leskovec
00050000-55e0-1f5a-2605-ec98713becd2	1432	Zidani Most
00050000-55e0-1f5a-2b19-9625483ea3fc	3214	Zreče
00050000-55e0-1f5a-343a-a03e977c3bfc	4209	Žabnica
00050000-55e0-1f5a-01d2-10792b37f080	3310	Žalec
00050000-55e0-1f5a-2b7a-f8bc92b9f4ee	4228	Železniki
00050000-55e0-1f5a-31ee-b003eb04cc21	2287	Žetale
00050000-55e0-1f5a-3a31-5c6d17985a9c	4226	Žiri
00050000-55e0-1f5a-c821-821fdb1a68f8	4274	Žirovnica
00050000-55e0-1f5a-a23c-c81099c1ad74	8360	Žužemberk
\.


--
-- TOC entry 2934 (class 0 OID 16059185)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 16058992)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55e0-1f5c-122e-7b05cdc659d2	00080000-55e0-1f5b-338c-ffe74ea693bc	\N	00040000-55e0-1f5a-06da-52ce001e25ce	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55e0-1f5c-289b-a7a32fc80e2a	00080000-55e0-1f5b-338c-ffe74ea693bc	\N	00040000-55e0-1f5a-06da-52ce001e25ce		\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55e0-1f5c-4f12-d5b90742dc5e	00080000-55e0-1f5b-2bd2-88b4142b5d55	\N	00040000-55e0-1f5a-06da-52ce001e25ce		\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2922 (class 0 OID 16059070)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 16059197)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2960 (class 0 OID 16059548)
-- Dependencies: 226
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 16059558)
-- Dependencies: 227
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55e0-1f5c-53ab-c3bd4a0b5452	00080000-55e0-1f5b-cfaa-93e9b5b85e26	0987	AK
00190000-55e0-1f5c-cade-e5689397cc86	00080000-55e0-1f5b-2bd2-88b4142b5d55	0989	AK
00190000-55e0-1f5c-ba52-bb0cba11f885	00080000-55e0-1f5b-7500-476da8199335	0986	AK
00190000-55e0-1f5c-6294-2ad5d450997c	00080000-55e0-1f5b-9858-f49e32c7743e	0984	AK
00190000-55e0-1f5c-009e-670f6f823ef7	00080000-55e0-1f5b-b0d2-cf3fe91e2cc2	0983	AK
00190000-55e0-1f5c-9a40-26ffc65424ef	00080000-55e0-1f5b-b7a0-38be6ab586ab	0982	AK
00190000-55e0-1f5d-7d5d-c5e272cfd187	00080000-55e0-1f5d-533c-256a03869cae	1001	AK
\.


--
-- TOC entry 2959 (class 0 OID 16059504)
-- Dependencies: 225
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55e0-1f5c-1a50-a91353760118	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2962 (class 0 OID 16059566)
-- Dependencies: 228
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 16059226)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55e0-1f5b-5947-811dcb2ff8dd	\N	\N	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55e0-1f5b-24a8-fde0dc08c431	\N	\N	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55e0-1f5b-abc0-930d1127bc0e	\N	\N	0003	Kazinska	t	84	Kazinska dvorana
00220000-55e0-1f5b-2d12-7456b793cf63	\N	\N	0004	Mali oder	t	24	Mali oder 
00220000-55e0-1f5b-2813-1f26f3012f36	\N	\N	0005	Komorni oder	t	15	Komorni oder
00220000-55e0-1f5b-50e2-0ab67850715e	\N	\N	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55e0-1f5b-5fa5-f73e33cc3e23	\N	\N	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2932 (class 0 OID 16059170)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 16059160)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 16059357)
-- Dependencies: 218
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 16059296)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 16058865)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55e0-1f5d-533c-256a03869cae	00010000-55e0-1f5b-d68a-18280ed7aefe	2015-08-28 10:44:13	INS	a:0:{}
2	App\\Entity\\Option	00000000-55e0-1f5d-80a7-66f01bd06829	00010000-55e0-1f5b-d68a-18280ed7aefe	2015-08-28 10:44:13	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55e0-1f5d-7d5d-c5e272cfd187	00010000-55e0-1f5b-d68a-18280ed7aefe	2015-08-28 10:44:13	INS	a:0:{}
\.


--
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2941 (class 0 OID 16059238)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 16058903)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55e0-1f5b-d419-83e6081db4ed	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55e0-1f5b-624b-f83b8d537596	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55e0-1f5b-77ea-b79b5819207f	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55e0-1f5b-4915-df84c65d07dd	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55e0-1f5b-e36e-4c6a5d349690	planer	Planer dogodkov v koledarju	t
00020000-55e0-1f5b-2754-1c19d99967e9	kadrovska	Kadrovska služba	t
00020000-55e0-1f5b-985f-56e10e832dc1	arhivar	Ažuriranje arhivalij	t
00020000-55e0-1f5b-d145-3814c541546f	igralec	Igralec	t
00020000-55e0-1f5b-ea54-31fa341cc2f5	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55e0-1f5c-3119-0f9ab5ed4562	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2907 (class 0 OID 16058887)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55e0-1f5b-d517-92acff6d86c9	00020000-55e0-1f5b-77ea-b79b5819207f
00010000-55e0-1f5b-d68a-18280ed7aefe	00020000-55e0-1f5b-77ea-b79b5819207f
00010000-55e0-1f5c-48be-62b62b97a5a8	00020000-55e0-1f5c-3119-0f9ab5ed4562
\.


--
-- TOC entry 2943 (class 0 OID 16059252)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 16059191)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 16059137)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 16059607)
-- Dependencies: 233
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55e0-1f5a-8004-bb5174bb5978	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55e0-1f5a-c2c5-8097d35f7413	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55e0-1f5a-1766-7f145b85f7d6	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55e0-1f5a-4ea6-bfae11601a88	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55e0-1f5a-e379-13f22196b6d3	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2966 (class 0 OID 16059599)
-- Dependencies: 232
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55e0-1f5a-caff-c31f8a622e2d	00230000-55e0-1f5a-4ea6-bfae11601a88	popa
00240000-55e0-1f5a-1706-5f4ddf820374	00230000-55e0-1f5a-4ea6-bfae11601a88	oseba
00240000-55e0-1f5a-96ed-f26e6ef3809c	00230000-55e0-1f5a-4ea6-bfae11601a88	sezona
00240000-55e0-1f5a-3551-93692e4dbb84	00230000-55e0-1f5a-c2c5-8097d35f7413	prostor
00240000-55e0-1f5a-4eef-169780982b11	00230000-55e0-1f5a-4ea6-bfae11601a88	besedilo
00240000-55e0-1f5a-115c-f685e333df5b	00230000-55e0-1f5a-4ea6-bfae11601a88	uprizoritev
00240000-55e0-1f5a-13e2-71d9b3d26572	00230000-55e0-1f5a-4ea6-bfae11601a88	funkcija
00240000-55e0-1f5a-425b-2082618c3bb1	00230000-55e0-1f5a-4ea6-bfae11601a88	tipfunkcije
00240000-55e0-1f5a-514c-ab87157aeeed	00230000-55e0-1f5a-4ea6-bfae11601a88	alternacija
00240000-55e0-1f5a-2ed5-6ce13a4f4263	00230000-55e0-1f5a-8004-bb5174bb5978	pogodba
00240000-55e0-1f5a-3dc3-a0b4c08a35a3	00230000-55e0-1f5a-4ea6-bfae11601a88	zaposlitev
00240000-55e0-1f5a-ac62-37fe320e4a2c	00230000-55e0-1f5a-8004-bb5174bb5978	programdela
00240000-55e0-1f5a-7945-31405cf2ebd2	00230000-55e0-1f5a-4ea6-bfae11601a88	zapis
\.


--
-- TOC entry 2965 (class 0 OID 16059594)
-- Dependencies: 231
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
55f68afa-65ec-4aa3-8584-98fd125ffbb8	00230000-55e0-1f5a-4ea6-bfae11601a88	0	1001
\.


--
-- TOC entry 2948 (class 0 OID 16059306)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55e0-1f5c-e3a4-f36a3bccd3f3	000e0000-55e0-1f5c-7793-846582519cd8	00080000-55e0-1f5b-338c-ffe74ea693bc	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55e0-1f5a-fbab-45b58a740068
00270000-55e0-1f5c-276a-706e7f5cb461	000e0000-55e0-1f5c-7793-846582519cd8	00080000-55e0-1f5b-338c-ffe74ea693bc	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55e0-1f5a-fbab-45b58a740068
00270000-55e0-1f5c-7840-b771fbece3b7	000e0000-55e0-1f5c-7793-846582519cd8	00080000-55e0-1f5b-3e85-0a46b4bbf5dc	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4	\N
\.


--
-- TOC entry 2914 (class 0 OID 16058965)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 16059147)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55e0-1f5c-1465-9303f12b0080	00180000-55e0-1f5c-bf7d-41743f7e52f3	000c0000-55e0-1f5c-243e-cb554d6820de	00090000-55e0-1f5c-d6c8-b05db29f1e75	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e0-1f5c-cd46-a56d322868c1	00180000-55e0-1f5c-bf7d-41743f7e52f3	000c0000-55e0-1f5c-7639-7984c433494b	00090000-55e0-1f5c-757f-012b69afdb93	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e0-1f5c-e095-bab7387f0396	00180000-55e0-1f5c-bf7d-41743f7e52f3	000c0000-55e0-1f5c-02cc-ca0d6e2190a8	00090000-55e0-1f5c-2d64-c20ec2155e93	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e0-1f5c-07b6-c57a3412efa9	00180000-55e0-1f5c-bf7d-41743f7e52f3	000c0000-55e0-1f5c-6f8c-cb3fce3d4ec9	00090000-55e0-1f5c-b8c6-d9f906698c68	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e0-1f5c-8094-00c5717da2d1	00180000-55e0-1f5c-bf7d-41743f7e52f3	000c0000-55e0-1f5c-91dd-5cdf97fc951d	00090000-55e0-1f5c-982e-118c3a2c4099	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e0-1f5c-acec-e7bbb1f71640	00180000-55e0-1f5c-e50c-39b39b929f24	\N	00090000-55e0-1f5c-982e-118c3a2c4099	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2951 (class 0 OID 16059346)
-- Dependencies: 217
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55e0-1f5a-933f-4bd29ede86b0	Avtor	Avtorji	Avtorka	umetnik
000f0000-55e0-1f5a-3df4-f95107965e50	Priredba	Priredba	Priredba	umetnik
000f0000-55e0-1f5a-b8e0-3be9908f124b	Prevod	Prevod	Prevod	umetnik
000f0000-55e0-1f5a-db64-942b64e46399	Režija	Režija	Režija	umetnik
000f0000-55e0-1f5a-ae6f-0f374726741a	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55e0-1f5a-3683-ebbde4c3ce15	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55e0-1f5a-7724-a6b61d073db6	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55e0-1f5a-e37f-e59f822711c9	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55e0-1f5a-069d-dc98d226a779	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55e0-1f5a-7b4c-9fac7d92af17	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55e0-1f5a-106e-e0997a9e25ff	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55e0-1f5a-fbe4-941d208709fe	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55e0-1f5a-f957-e39708eba4d4	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55e0-1f5a-3104-a62f0b3e61ed	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55e0-1f5a-1609-1f79deac07c6	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55e0-1f5a-8501-3a9198c666aa	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55e0-1f5a-18ec-0e3fafc045f5	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55e0-1f5a-b437-a26c3529c04d	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2963 (class 0 OID 16059576)
-- Dependencies: 229
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55e0-1f5a-59a3-20317b1f0c2f	01	Velika predstava	f	1.00	1.00
002b0000-55e0-1f5a-a2ca-bcbe1d57a4ff	02	Mala predstava	f	0.50	0.50
002b0000-55e0-1f5a-d597-4fed118c583a	03	Mala koprodukcija	t	0.40	1.00
002b0000-55e0-1f5a-1d44-b8cac428a91a	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55e0-1f5a-f0df-15318b45c605	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2919 (class 0 OID 16059027)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 16058874)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55e0-1f5b-d68a-18280ed7aefe	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROCi/9VbUqVibqk0iltY0iLCo.9ig4sCi	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55e0-1f5c-0f07-735cb1d6402b	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55e0-1f5c-2678-bf51dfdd16c4	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55e0-1f5c-2ef9-ec24e1a67c87	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55e0-1f5c-44ff-ac0bfb97ed49	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55e0-1f5c-9e87-fe2572863adf	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55e0-1f5c-8960-16696b677c47	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55e0-1f5c-cfd6-1d6efae4ba1b	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55e0-1f5c-759e-1a34773dfa56	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55e0-1f5c-94be-1eee7135db3a	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55e0-1f5c-48be-62b62b97a5a8	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55e0-1f5b-d517-92acff6d86c9	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2955 (class 0 OID 16059394)
-- Dependencies: 221
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55e0-1f5c-647b-ee51b80c6548	00160000-55e0-1f5b-888a-3e78e1782f16	\N	00140000-55e0-1f5a-4a0c-da1c602e6656	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55e0-1f5b-2813-1f26f3012f36
000e0000-55e0-1f5c-7793-846582519cd8	00160000-55e0-1f5b-3fb1-e2a7c72175db	\N	00140000-55e0-1f5a-40ef-c4d892fc826e	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55e0-1f5b-50e2-0ab67850715e
000e0000-55e0-1f5c-b041-3c5d80615978	\N	\N	00140000-55e0-1f5a-40ef-c4d892fc826e	00190000-55e0-1f5c-53ab-c3bd4a0b5452	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55e0-1f5b-2813-1f26f3012f36
000e0000-55e0-1f5c-0c27-54984f733086	\N	\N	00140000-55e0-1f5a-40ef-c4d892fc826e	00190000-55e0-1f5c-53ab-c3bd4a0b5452	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55e0-1f5b-2813-1f26f3012f36
000e0000-55e0-1f5c-a3d8-8dea2c84ca3c	\N	\N	00140000-55e0-1f5a-40ef-c4d892fc826e	00190000-55e0-1f5c-53ab-c3bd4a0b5452	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55e0-1f5b-5947-811dcb2ff8dd
000e0000-55e0-1f5c-82b9-3c89ea860b4d	\N	\N	00140000-55e0-1f5a-40ef-c4d892fc826e	00190000-55e0-1f5c-53ab-c3bd4a0b5452	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55e0-1f5b-5947-811dcb2ff8dd
\.


--
-- TOC entry 2924 (class 0 OID 16059089)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55e0-1f5c-456e-0b542ae18031	000e0000-55e0-1f5c-7793-846582519cd8	1	
00200000-55e0-1f5c-32e3-de8d4b2d6ae8	000e0000-55e0-1f5c-7793-846582519cd8	2	
\.


--
-- TOC entry 2939 (class 0 OID 16059218)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 16059320)
-- Dependencies: 215
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55e0-1f5a-94f8-eb076140391b	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55e0-1f5a-76d4-e346ad7cc799	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55e0-1f5a-575e-1dde8f900f32	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55e0-1f5a-53f1-5f9645b9ac7c	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55e0-1f5a-e004-8f1ff198cd74	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55e0-1f5a-4aa5-aaef8706bc1a	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55e0-1f5a-db6f-926406469293	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55e0-1f5a-8f16-12f4b3c58a43	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55e0-1f5a-fbab-45b58a740068	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55e0-1f5a-df29-60380db62b01	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55e0-1f5a-2c75-e3cea322ffe8	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55e0-1f5a-4079-e56ad61940be	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55e0-1f5a-47d9-536bfa644a50	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55e0-1f5a-af67-b364d9d99ff1	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55e0-1f5a-5dd9-a0218bdf9ed8	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55e0-1f5a-5dc5-0c3dc3b4fba4	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55e0-1f5a-9bc6-8512311906fe	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55e0-1f5a-bdaa-ed7394f0170e	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55e0-1f5a-82b0-a165da01879c	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55e0-1f5a-b6ec-15707fe06e94	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55e0-1f5a-78e9-e07ec2c3474b	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55e0-1f5a-5fa1-c99ffc5f88b0	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55e0-1f5a-5b15-a5afc618825a	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55e0-1f5a-af73-3c3034ba207f	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55e0-1f5a-2855-84bf7473fd9f	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55e0-1f5a-cdd2-9b4e91c4ab20	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55e0-1f5a-934e-73be99a4adf6	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55e0-1f5a-6211-226bda7b53c8	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2969 (class 0 OID 16059646)
-- Dependencies: 235
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 16059618)
-- Dependencies: 234
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 16059658)
-- Dependencies: 236
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 16059289)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55e0-1f5c-e4d6-63b79daf3c64	00090000-55e0-1f5c-757f-012b69afdb93	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e0-1f5c-eba9-f9958d6e0f1b	00090000-55e0-1f5c-2d64-c20ec2155e93	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e0-1f5c-b51c-a80c28614b77	00090000-55e0-1f5c-2a16-69bf252d28fc	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e0-1f5c-3d70-010913e2ecb8	00090000-55e0-1f5c-b483-45c78f8b444b	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e0-1f5c-8c37-444408e56f47	00090000-55e0-1f5c-d6c8-b05db29f1e75	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e0-1f5c-ac07-e87a14e1d0f5	00090000-55e0-1f5c-2812-3d4d03c10bd5	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2926 (class 0 OID 16059121)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 16059384)
-- Dependencies: 220
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55e0-1f5a-4a0c-da1c602e6656	01	Drama	drama (SURS 01)
00140000-55e0-1f5a-9e26-249f0cd7e1a4	02	Opera	opera (SURS 02)
00140000-55e0-1f5a-0dfb-50901058ebdc	03	Balet	balet (SURS 03)
00140000-55e0-1f5a-387f-1db9326ea7ab	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55e0-1f5a-cb71-70e8667b75b7	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55e0-1f5a-40ef-c4d892fc826e	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55e0-1f5a-171b-4e435affb3d4	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2945 (class 0 OID 16059279)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2448 (class 2606 OID 16058928)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 16059443)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 16059433)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 16059345)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 16059698)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 16059111)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 16059136)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 16059592)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 16059053)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 16059498)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 16059275)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 16059087)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 16059130)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 16059067)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 16059183)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 16059675)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 16059682)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2694 (class 2606 OID 16059706)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 16059210)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 16059025)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 16058937)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 16058961)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 16058917)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2439 (class 2606 OID 16058902)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 16059216)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 16059251)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 16059379)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 16058989)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 16059013)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 16059189)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 16059003)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 16059074)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 16059201)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 16059555)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 16059563)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 16059546)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 16059574)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 16059233)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 16059174)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 16059165)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 16059367)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 16059303)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 16058873)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 16059242)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 16058891)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2441 (class 2606 OID 16058911)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 16059260)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 16059196)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 16059145)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 16059616)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 16059604)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 16059598)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 16059316)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 16058970)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 16059156)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 16059356)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 16059586)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 16059038)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 16058886)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 16059412)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 16059096)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 16059224)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 16059328)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 16059656)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 16059640)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 16059664)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 16059294)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 16059125)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 16059392)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 16059287)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 1259 OID 16059118)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2591 (class 1259 OID 16059317)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2592 (class 1259 OID 16059318)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2593 (class 1259 OID 16059319)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2680 (class 1259 OID 16059677)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2681 (class 1259 OID 16059676)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2462 (class 1259 OID 16058991)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2554 (class 1259 OID 16059217)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2667 (class 1259 OID 16059644)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2668 (class 1259 OID 16059643)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2669 (class 1259 OID 16059645)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2670 (class 1259 OID 16059642)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2671 (class 1259 OID 16059641)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2548 (class 1259 OID 16059203)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2549 (class 1259 OID 16059202)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2499 (class 1259 OID 16059097)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2578 (class 1259 OID 16059276)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2579 (class 1259 OID 16059278)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2580 (class 1259 OID 16059277)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2487 (class 1259 OID 16059069)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2488 (class 1259 OID 16059068)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2650 (class 1259 OID 16059575)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2604 (class 1259 OID 16059381)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2605 (class 1259 OID 16059382)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2606 (class 1259 OID 16059383)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2677 (class 1259 OID 16059665)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2613 (class 1259 OID 16059417)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2614 (class 1259 OID 16059414)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2615 (class 1259 OID 16059418)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2616 (class 1259 OID 16059416)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2617 (class 1259 OID 16059415)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2477 (class 1259 OID 16059040)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2478 (class 1259 OID 16059039)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2453 (class 1259 OID 16058964)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2566 (class 1259 OID 16059243)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2517 (class 1259 OID 16059131)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2443 (class 1259 OID 16058918)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2444 (class 1259 OID 16058919)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2571 (class 1259 OID 16059263)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2572 (class 1259 OID 16059262)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2573 (class 1259 OID 16059261)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2491 (class 1259 OID 16059075)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2492 (class 1259 OID 16059077)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2493 (class 1259 OID 16059076)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2660 (class 1259 OID 16059606)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2528 (class 1259 OID 16059169)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2529 (class 1259 OID 16059167)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2530 (class 1259 OID 16059166)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2531 (class 1259 OID 16059168)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2434 (class 1259 OID 16058892)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2435 (class 1259 OID 16058893)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2557 (class 1259 OID 16059225)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2690 (class 1259 OID 16059699)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2691 (class 1259 OID 16059707)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2692 (class 1259 OID 16059708)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2543 (class 1259 OID 16059190)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2587 (class 1259 OID 16059304)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2588 (class 1259 OID 16059305)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2634 (class 1259 OID 16059503)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2635 (class 1259 OID 16059502)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2636 (class 1259 OID 16059499)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2637 (class 1259 OID 16059500)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2638 (class 1259 OID 16059501)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2466 (class 1259 OID 16059005)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2467 (class 1259 OID 16059004)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2468 (class 1259 OID 16059006)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2560 (class 1259 OID 16059237)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2561 (class 1259 OID 16059236)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2642 (class 1259 OID 16059556)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2643 (class 1259 OID 16059557)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2627 (class 1259 OID 16059447)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2628 (class 1259 OID 16059448)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2629 (class 1259 OID 16059445)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2630 (class 1259 OID 16059446)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2584 (class 1259 OID 16059295)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2534 (class 1259 OID 16059178)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2535 (class 1259 OID 16059177)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2536 (class 1259 OID 16059175)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2537 (class 1259 OID 16059176)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2623 (class 1259 OID 16059435)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2624 (class 1259 OID 16059434)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2639 (class 1259 OID 16059547)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2498 (class 1259 OID 16059088)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2657 (class 1259 OID 16059593)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2684 (class 1259 OID 16059683)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2685 (class 1259 OID 16059684)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2449 (class 1259 OID 16058939)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2450 (class 1259 OID 16058938)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2458 (class 1259 OID 16058971)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2459 (class 1259 OID 16058972)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2523 (class 1259 OID 16059159)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2524 (class 1259 OID 16059158)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2525 (class 1259 OID 16059157)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2505 (class 1259 OID 16059120)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2506 (class 1259 OID 16059116)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2507 (class 1259 OID 16059113)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2508 (class 1259 OID 16059114)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2509 (class 1259 OID 16059112)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2510 (class 1259 OID 16059117)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2511 (class 1259 OID 16059115)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2465 (class 1259 OID 16058990)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2483 (class 1259 OID 16059054)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2484 (class 1259 OID 16059056)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2485 (class 1259 OID 16059055)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2486 (class 1259 OID 16059057)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2542 (class 1259 OID 16059184)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2609 (class 1259 OID 16059380)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2618 (class 1259 OID 16059413)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2456 (class 1259 OID 16058962)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2457 (class 1259 OID 16058963)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2581 (class 1259 OID 16059288)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2666 (class 1259 OID 16059617)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 16059026)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2663 (class 1259 OID 16059605)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2564 (class 1259 OID 16059235)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2565 (class 1259 OID 16059234)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2631 (class 1259 OID 16059444)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2473 (class 1259 OID 16059014)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2610 (class 1259 OID 16059393)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2674 (class 1259 OID 16059657)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2648 (class 1259 OID 16059564)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 16059565)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2522 (class 1259 OID 16059146)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2442 (class 1259 OID 16058912)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2512 (class 1259 OID 16059119)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2722 (class 2606 OID 16059844)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2719 (class 2606 OID 16059829)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2720 (class 2606 OID 16059834)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2724 (class 2606 OID 16059854)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2718 (class 2606 OID 16059824)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2723 (class 2606 OID 16059849)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2721 (class 2606 OID 16059839)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2755 (class 2606 OID 16060009)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2756 (class 2606 OID 16060014)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2757 (class 2606 OID 16060019)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2791 (class 2606 OID 16060189)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2790 (class 2606 OID 16060184)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2705 (class 2606 OID 16059759)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2741 (class 2606 OID 16059939)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2787 (class 2606 OID 16060169)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2786 (class 2606 OID 16060164)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2788 (class 2606 OID 16060174)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2785 (class 2606 OID 16060159)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2784 (class 2606 OID 16060154)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2740 (class 2606 OID 16059934)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2739 (class 2606 OID 16059929)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2717 (class 2606 OID 16059819)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2749 (class 2606 OID 16059979)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2751 (class 2606 OID 16059989)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2750 (class 2606 OID 16059984)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2712 (class 2606 OID 16059794)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2711 (class 2606 OID 16059789)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2737 (class 2606 OID 16059919)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2781 (class 2606 OID 16060139)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2758 (class 2606 OID 16060024)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2759 (class 2606 OID 16060029)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2760 (class 2606 OID 16060034)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2789 (class 2606 OID 16060179)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2764 (class 2606 OID 16060054)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2761 (class 2606 OID 16060039)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2765 (class 2606 OID 16060059)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2763 (class 2606 OID 16060049)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2762 (class 2606 OID 16060044)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2710 (class 2606 OID 16059784)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2709 (class 2606 OID 16059779)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2702 (class 2606 OID 16059744)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2701 (class 2606 OID 16059739)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2745 (class 2606 OID 16059959)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2725 (class 2606 OID 16059859)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2697 (class 2606 OID 16059719)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2698 (class 2606 OID 16059724)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2748 (class 2606 OID 16059974)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2747 (class 2606 OID 16059969)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2746 (class 2606 OID 16059964)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2713 (class 2606 OID 16059799)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2715 (class 2606 OID 16059809)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2714 (class 2606 OID 16059804)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2783 (class 2606 OID 16060149)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2732 (class 2606 OID 16059894)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2730 (class 2606 OID 16059884)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2729 (class 2606 OID 16059879)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2731 (class 2606 OID 16059889)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2695 (class 2606 OID 16059709)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2696 (class 2606 OID 16059714)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2742 (class 2606 OID 16059944)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2794 (class 2606 OID 16060204)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2795 (class 2606 OID 16060209)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2796 (class 2606 OID 16060214)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2738 (class 2606 OID 16059924)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2753 (class 2606 OID 16059999)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2754 (class 2606 OID 16060004)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2776 (class 2606 OID 16060114)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2775 (class 2606 OID 16060109)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2772 (class 2606 OID 16060094)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2773 (class 2606 OID 16060099)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2774 (class 2606 OID 16060104)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2707 (class 2606 OID 16059769)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2706 (class 2606 OID 16059764)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2708 (class 2606 OID 16059774)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2744 (class 2606 OID 16059954)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2743 (class 2606 OID 16059949)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2778 (class 2606 OID 16060124)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2779 (class 2606 OID 16060129)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2770 (class 2606 OID 16060084)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2771 (class 2606 OID 16060089)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2768 (class 2606 OID 16060074)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2769 (class 2606 OID 16060079)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2752 (class 2606 OID 16059994)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2736 (class 2606 OID 16059914)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2735 (class 2606 OID 16059909)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2733 (class 2606 OID 16059899)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2734 (class 2606 OID 16059904)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2767 (class 2606 OID 16060069)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2766 (class 2606 OID 16060064)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2777 (class 2606 OID 16060119)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2716 (class 2606 OID 16059814)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2780 (class 2606 OID 16060134)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2782 (class 2606 OID 16060144)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2792 (class 2606 OID 16060194)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2793 (class 2606 OID 16060199)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2700 (class 2606 OID 16059734)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2699 (class 2606 OID 16059729)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2703 (class 2606 OID 16059749)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2704 (class 2606 OID 16059754)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2728 (class 2606 OID 16059874)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2727 (class 2606 OID 16059869)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2726 (class 2606 OID 16059864)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-28 10:44:14 CEST

--
-- PostgreSQL database dump complete
--

