--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-24 12:18:51 CEST

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
-- TOC entry 177 (class 1259 OID 15290869)
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
-- TOC entry 222 (class 1259 OID 15291372)
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
-- TOC entry 221 (class 1259 OID 15291355)
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
-- TOC entry 215 (class 1259 OID 15291267)
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
-- TOC entry 238 (class 1259 OID 15291620)
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
-- TOC entry 191 (class 1259 OID 15291048)
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
-- TOC entry 194 (class 1259 OID 15291082)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 15291522)
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
-- TOC entry 186 (class 1259 OID 15290991)
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
-- TOC entry 223 (class 1259 OID 15291385)
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
-- TOC entry 210 (class 1259 OID 15291212)
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
-- TOC entry 189 (class 1259 OID 15291028)
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
-- TOC entry 193 (class 1259 OID 15291076)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 15291008)
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
-- TOC entry 199 (class 1259 OID 15291129)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 236 (class 1259 OID 15291601)
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
-- TOC entry 237 (class 1259 OID 15291613)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 15291635)
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
-- TOC entry 203 (class 1259 OID 15291154)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 15290965)
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
-- TOC entry 178 (class 1259 OID 15290878)
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
-- TOC entry 179 (class 1259 OID 15290889)
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
-- TOC entry 174 (class 1259 OID 15290843)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 15290862)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 15291161)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 15291192)
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
-- TOC entry 218 (class 1259 OID 15291306)
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
-- TOC entry 181 (class 1259 OID 15290922)
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
-- TOC entry 183 (class 1259 OID 15290957)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 15291135)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 15290942)
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
-- TOC entry 188 (class 1259 OID 15291020)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 15291147)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 15291483)
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
-- TOC entry 226 (class 1259 OID 15291493)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 224 (class 1259 OID 15291439)
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
-- TOC entry 227 (class 1259 OID 15291501)
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
-- TOC entry 206 (class 1259 OID 15291176)
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
-- TOC entry 198 (class 1259 OID 15291120)
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
-- TOC entry 197 (class 1259 OID 15291110)
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
-- TOC entry 217 (class 1259 OID 15291295)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 15291244)
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
-- TOC entry 171 (class 1259 OID 15290814)
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
-- TOC entry 170 (class 1259 OID 15290812)
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
-- TOC entry 207 (class 1259 OID 15291186)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 15290852)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 15290836)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 15291200)
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
-- TOC entry 201 (class 1259 OID 15291141)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 15291087)
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
-- TOC entry 232 (class 1259 OID 15291542)
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
-- TOC entry 231 (class 1259 OID 15291534)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 15291529)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 15291254)
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
-- TOC entry 180 (class 1259 OID 15290914)
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
-- TOC entry 196 (class 1259 OID 15291097)
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
-- TOC entry 216 (class 1259 OID 15291284)
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
-- TOC entry 228 (class 1259 OID 15291511)
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
-- TOC entry 185 (class 1259 OID 15290977)
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
-- TOC entry 172 (class 1259 OID 15290823)
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
-- TOC entry 220 (class 1259 OID 15291332)
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
-- TOC entry 190 (class 1259 OID 15291039)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 15291168)
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
-- TOC entry 234 (class 1259 OID 15291581)
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
-- TOC entry 233 (class 1259 OID 15291553)
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
-- TOC entry 235 (class 1259 OID 15291593)
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
-- TOC entry 212 (class 1259 OID 15291237)
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
-- TOC entry 192 (class 1259 OID 15291071)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 15291322)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 15291227)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2170 (class 2604 OID 15290817)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2895 (class 0 OID 15290869)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 15291372)
-- Dependencies: 222
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55da-ef8a-2aa7-fac947ddea7b	000d0000-55da-ef8a-59ca-942eb36f7a8e	\N	00090000-55da-ef8a-4261-c2751ad06697	000b0000-55da-ef8a-8da6-f625588927e3	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55da-ef8a-4c35-6cf128c25e26	000d0000-55da-ef8a-a755-8584dce2402f	00100000-55da-ef8a-2afb-16d33520d942	00090000-55da-ef8a-9207-202020c5f578	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55da-ef8a-2b72-2685049cc50a	000d0000-55da-ef8a-ec15-3fc828e2f4d1	00100000-55da-ef8a-7c6a-3f069216324c	00090000-55da-ef8a-022b-61b51a145ddf	\N	0003	t	\N	2015-08-24	\N	2	\N	\N	f	f
000c0000-55da-ef8a-ca7f-5cc979c10a96	000d0000-55da-ef8a-a67b-3ce6598108c7	\N	00090000-55da-ef8a-e275-79a54344eea5	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55da-ef8a-f559-d6334dc4e073	000d0000-55da-ef8a-d059-92381a774097	\N	00090000-55da-ef8a-c1dc-4fd3a228f4ee	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55da-ef8a-305e-c586a6bb3efb	000d0000-55da-ef8a-19fc-0163675caf57	\N	00090000-55da-ef8a-3808-d5d5f59464d8	000b0000-55da-ef8a-a413-87cc6ace7104	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55da-ef8a-2551-92eff687426f	000d0000-55da-ef8a-557b-a0869cc43bea	00100000-55da-ef8a-1715-c5b161cd993a	00090000-55da-ef8a-756b-fd9fa981131a	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55da-ef8a-0086-02f41044faec	000d0000-55da-ef8a-920e-ddd7ef5363ab	\N	00090000-55da-ef8a-7a8b-9c558c30042f	000b0000-55da-ef8a-3774-f9b00177b557	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55da-ef8a-c713-d7f2eb65f416	000d0000-55da-ef8a-557b-a0869cc43bea	00100000-55da-ef8a-b20c-6b185701ad95	00090000-55da-ef8a-412e-0650f373392f	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55da-ef8a-1aed-5cef8d7a5f99	000d0000-55da-ef8a-557b-a0869cc43bea	00100000-55da-ef8a-0f89-4a4582ab82f0	00090000-55da-ef8a-845f-df38186192be	\N	0010	t	\N	2015-08-24	\N	16	\N	\N	f	t
000c0000-55da-ef8a-f7a5-f6219feb1333	000d0000-55da-ef8a-557b-a0869cc43bea	00100000-55da-ef8a-8f40-14c39c28e105	00090000-55da-ef8a-2ca9-51f46e054421	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2939 (class 0 OID 15291355)
-- Dependencies: 221
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 15291267)
-- Dependencies: 215
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55da-ef89-7f2d-814fbb7c76f0	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55da-ef89-ebd8-71ed575cce9f	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55da-ef89-a49b-7f48134c0ff5	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2956 (class 0 OID 15291620)
-- Dependencies: 238
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 15291048)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55da-ef8a-4885-e0bfa92b73b2	\N	\N	00200000-55da-ef8a-557a-a5a8a0cf5492	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55da-ef8a-e6e7-c55fa78ef7c2	\N	\N	00200000-55da-ef8a-6f40-1e55ab869753	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55da-ef8a-4574-ccac878c0651	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55da-ef8a-fe1f-64075338b82d	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55da-ef8a-0e83-f54c20f77f37	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2912 (class 0 OID 15291082)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 15291522)
-- Dependencies: 229
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 15290991)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55da-ef87-5efd-6a2ef440b241	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55da-ef87-622d-f3f0348182ae	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55da-ef87-2b6a-c837894ac785	AL	ALB	008	Albania 	Albanija	\N
00040000-55da-ef87-eac9-b9232919137b	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55da-ef87-56e2-300f3f6165dc	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55da-ef87-9985-fd20de5cb602	AD	AND	020	Andorra 	Andora	\N
00040000-55da-ef87-a1c1-cc8d7ddd5ed1	AO	AGO	024	Angola 	Angola	\N
00040000-55da-ef87-c1f0-4977a1643b56	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55da-ef87-7dac-62359de1b9f4	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55da-ef87-7dcb-e18bb9555c4f	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55da-ef87-73d7-555b60bd2896	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55da-ef87-95d2-02332ec152cf	AM	ARM	051	Armenia 	Armenija	\N
00040000-55da-ef87-a273-5cdf5526c1e0	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55da-ef87-f191-1b8a5624c0e6	AU	AUS	036	Australia 	Avstralija	\N
00040000-55da-ef87-94d1-a079f7f7e766	AT	AUT	040	Austria 	Avstrija	\N
00040000-55da-ef87-f582-cdb409581dec	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55da-ef87-9cd7-7da703f99c5a	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55da-ef87-0021-3e1c314c4e49	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55da-ef87-49d0-580b65f89288	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55da-ef87-14f4-16d06071e632	BB	BRB	052	Barbados 	Barbados	\N
00040000-55da-ef87-cf6f-2cdcbea786c5	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55da-ef87-62a0-80db3a07226d	BE	BEL	056	Belgium 	Belgija	\N
00040000-55da-ef87-187d-eda63178881c	BZ	BLZ	084	Belize 	Belize	\N
00040000-55da-ef87-d4ed-defdf2c60d6c	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55da-ef87-63f0-f05feacfb207	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55da-ef87-c1de-651687c9c3d3	BT	BTN	064	Bhutan 	Butan	\N
00040000-55da-ef87-e297-a2f13e0744a9	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55da-ef87-cbaf-0edebb77d4bb	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55da-ef87-6a8a-cb114cff8a99	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55da-ef87-b85c-de15b78014c2	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55da-ef87-9d58-f0f649a4b507	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55da-ef87-0687-5b326dc6a2b9	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55da-ef87-8229-e4bda87564c2	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55da-ef87-93e5-69f5e0a119dd	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55da-ef87-bb09-58eb1210d390	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55da-ef87-2218-44d0213550a6	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55da-ef87-9f24-786e6058652d	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55da-ef87-f26f-fba64876f3f9	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55da-ef87-f774-ab9224dde796	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55da-ef87-b91f-8f1255c3700d	CA	CAN	124	Canada 	Kanada	\N
00040000-55da-ef87-4974-e4b8bc7d49c6	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55da-ef87-0e8e-641cf192c3fb	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55da-ef87-486d-06b22666f300	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55da-ef87-3f2a-523598ad93b1	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55da-ef87-6f0d-109d2f593a9b	CL	CHL	152	Chile 	Čile	\N
00040000-55da-ef87-adbf-de26cb6e06cb	CN	CHN	156	China 	Kitajska	\N
00040000-55da-ef87-3bc1-2febcfa3b903	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55da-ef87-e20f-48423e778bee	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55da-ef87-d033-b7102a656686	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55da-ef87-7649-a4e0361ee7ee	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55da-ef87-ab68-a084484a8d38	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55da-ef87-bc94-461bdec83958	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55da-ef87-df47-602bdfb110d3	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55da-ef87-f579-7a4adae94e18	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55da-ef87-9a52-4c7e502eea21	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55da-ef87-7590-6c3d09f5c868	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55da-ef87-27d7-d3cb4d52f51b	CU	CUB	192	Cuba 	Kuba	\N
00040000-55da-ef87-4309-3ae27d8f7567	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55da-ef87-9e46-bb81826cb62b	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55da-ef87-cc39-0ed89e50133c	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55da-ef87-5048-ea7517d70af0	DK	DNK	208	Denmark 	Danska	\N
00040000-55da-ef87-2f9b-52cb0bda9359	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55da-ef87-ea26-4501687aa206	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55da-ef87-ebe5-e0793fec8303	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55da-ef87-044a-ab6d84a0caf4	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55da-ef87-0df5-6affd272b153	EG	EGY	818	Egypt 	Egipt	\N
00040000-55da-ef87-5540-b703eb29c2e6	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55da-ef87-14ec-d127e324f689	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55da-ef87-b7b7-0b7cf7af7f29	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55da-ef87-d305-abb8bd36721f	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55da-ef87-8350-a16fbbe53011	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55da-ef87-7ceb-e16962827892	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55da-ef87-40ed-c924732a7bbb	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55da-ef87-23ca-6af1b5f381b2	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55da-ef87-0538-c3dbb6bf88c4	FI	FIN	246	Finland 	Finska	\N
00040000-55da-ef87-c3db-c4ca268edc95	FR	FRA	250	France 	Francija	\N
00040000-55da-ef87-1f3b-ef025864297e	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55da-ef87-4f3b-94b0406d5c18	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55da-ef87-af24-419233b7b3b8	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55da-ef87-2b01-77d3d7690c27	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55da-ef87-75e4-b06bbd83b406	GA	GAB	266	Gabon 	Gabon	\N
00040000-55da-ef87-aa1c-fc146b111cb3	GM	GMB	270	Gambia 	Gambija	\N
00040000-55da-ef87-e785-95c0593d2fc4	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55da-ef87-b557-cd49a750ca04	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55da-ef87-c08e-e7f2f504d462	GH	GHA	288	Ghana 	Gana	\N
00040000-55da-ef87-6b35-dbf2db321a80	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55da-ef87-9d88-035d9fa44fbc	GR	GRC	300	Greece 	Grčija	\N
00040000-55da-ef87-b059-736dbbca8517	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55da-ef87-aee5-970da95f56c3	GD	GRD	308	Grenada 	Grenada	\N
00040000-55da-ef87-d191-b99ab8c99d64	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55da-ef87-0f9d-5e2522b03e28	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55da-ef87-fc01-dfafc4cb7301	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55da-ef87-465e-aea6aa4ffa52	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55da-ef87-420e-ce162fa5877e	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55da-ef87-565d-067db3d94209	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55da-ef87-d223-f66303e09dc9	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55da-ef87-78df-8ccef6a129a7	HT	HTI	332	Haiti 	Haiti	\N
00040000-55da-ef87-caa8-041647626183	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55da-ef87-3a54-70e3908c9ec2	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55da-ef87-09c4-335501d04a45	HN	HND	340	Honduras 	Honduras	\N
00040000-55da-ef87-131f-ea5805e90e1d	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55da-ef87-3bed-6cc067ec325d	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55da-ef87-2c34-e27fdce4f1a2	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55da-ef87-4ac5-e358ebe34002	IN	IND	356	India 	Indija	\N
00040000-55da-ef87-aa00-1b0d25e0d503	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55da-ef87-6ca4-126e78be69d4	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55da-ef87-648d-b44e9e850001	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55da-ef87-9d6a-802827f5c505	IE	IRL	372	Ireland 	Irska	\N
00040000-55da-ef87-be8a-68a40a6d1802	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55da-ef87-c222-e456811145fe	IL	ISR	376	Israel 	Izrael	\N
00040000-55da-ef87-0789-e890ba35b300	IT	ITA	380	Italy 	Italija	\N
00040000-55da-ef87-a795-73d93ac5ee6e	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55da-ef87-4d85-a426c8adb3f1	JP	JPN	392	Japan 	Japonska	\N
00040000-55da-ef87-b337-8b42d1c655ab	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55da-ef87-541b-a182aab5258e	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55da-ef87-65de-8c7bbcc642c6	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55da-ef87-36ca-1eab23a4c032	KE	KEN	404	Kenya 	Kenija	\N
00040000-55da-ef87-1dd4-c14ee75d3aac	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55da-ef87-c32c-8b87f8948e92	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55da-ef87-8c31-ce67e3632b83	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55da-ef87-708c-acddb5df5335	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55da-ef87-63f4-39e7dcf8d2f0	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55da-ef87-bf2a-59f8c3be1241	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55da-ef87-e0d5-c65b85bac494	LV	LVA	428	Latvia 	Latvija	\N
00040000-55da-ef87-a0f1-29e275afab23	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55da-ef87-34f6-f7980c7cc06e	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55da-ef87-262e-58482bc2f5e9	LR	LBR	430	Liberia 	Liberija	\N
00040000-55da-ef87-0954-fddcf694608a	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55da-ef87-2499-c9deea6a230a	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55da-ef87-cc3d-f8b6cbd9d9fc	LT	LTU	440	Lithuania 	Litva	\N
00040000-55da-ef87-4652-da703b4180e1	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55da-ef87-ac5b-169e78dea5d5	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55da-ef87-5487-b5cb69dff9c9	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55da-ef87-642d-710e7551d0c3	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55da-ef87-090d-05182971e7e1	MW	MWI	454	Malawi 	Malavi	\N
00040000-55da-ef87-8adb-50468972c8a5	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55da-ef87-20c5-498491c135fe	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55da-ef87-6ac5-f7d397d8f7ed	ML	MLI	466	Mali 	Mali	\N
00040000-55da-ef87-3085-3671ba68c14e	MT	MLT	470	Malta 	Malta	\N
00040000-55da-ef87-9bfa-891803292002	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55da-ef87-1c62-f60cc19e07e5	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55da-ef87-87d5-6c26481e15e2	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55da-ef87-c781-72d7d74317ee	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55da-ef87-ac27-df05707e6ceb	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55da-ef87-159d-557e9c9f618e	MX	MEX	484	Mexico 	Mehika	\N
00040000-55da-ef87-8e4f-fd9c71586cd8	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55da-ef87-9ecd-f9189fc50db1	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55da-ef87-9511-4f014b4b5a0c	MC	MCO	492	Monaco 	Monako	\N
00040000-55da-ef87-711c-e7fe5d0626c2	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55da-ef87-42f2-4d60481008d3	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55da-ef87-e434-963519ee2d1b	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55da-ef87-0856-34c0b5405750	MA	MAR	504	Morocco 	Maroko	\N
00040000-55da-ef87-4e16-5e26d2c43745	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55da-ef87-e8b0-b4a08287e70e	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55da-ef87-2db0-3ead62d0f44a	NA	NAM	516	Namibia 	Namibija	\N
00040000-55da-ef87-73ce-270bac6be123	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55da-ef87-9361-128fa499fdde	NP	NPL	524	Nepal 	Nepal	\N
00040000-55da-ef87-2460-0bbf87dc9012	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55da-ef87-c576-a1335d844de2	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55da-ef87-a10f-2fe32aeb8fac	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55da-ef87-6666-125ee120786d	NE	NER	562	Niger 	Niger 	\N
00040000-55da-ef87-bbac-f61fd014672e	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55da-ef87-0d9d-8e0b0841b300	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55da-ef87-6ca1-6ee8feacef48	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55da-ef87-ff84-0698ce46f8fa	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55da-ef87-e6df-7e3ce60bf594	NO	NOR	578	Norway 	Norveška	\N
00040000-55da-ef87-e2fd-e0a25a16cfd8	OM	OMN	512	Oman 	Oman	\N
00040000-55da-ef87-49ad-44ddf9eff26a	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55da-ef87-2d23-497bb9b8c9e2	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55da-ef87-963a-ab7d9b1a066f	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55da-ef87-208a-7a0ce51459b8	PA	PAN	591	Panama 	Panama	\N
00040000-55da-ef87-1662-388b83b18c8a	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55da-ef87-356c-625ed2723137	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55da-ef87-7b56-0ff545433bc3	PE	PER	604	Peru 	Peru	\N
00040000-55da-ef87-2524-fe350deed639	PH	PHL	608	Philippines 	Filipini	\N
00040000-55da-ef87-fda6-c8c3dcbd26b7	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55da-ef87-be66-86fe6b9e7589	PL	POL	616	Poland 	Poljska	\N
00040000-55da-ef87-1845-5bd85f313e9b	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55da-ef87-366b-bc5566722628	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55da-ef87-a40d-21660860f961	QA	QAT	634	Qatar 	Katar	\N
00040000-55da-ef87-85b3-0b59dc0f4d8a	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55da-ef87-4c46-3816e0d261ac	RO	ROU	642	Romania 	Romunija	\N
00040000-55da-ef87-2d24-234c660c8de3	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55da-ef87-7bcf-cf7e215fbd60	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55da-ef87-e542-8d3b22c1d0f1	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55da-ef87-ba4f-f90909b9874b	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55da-ef87-7fb0-bd519dd9ed39	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55da-ef87-b46c-2b5f40cba9eb	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55da-ef87-5e38-9616787dded4	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55da-ef87-72b9-fafb494b8bb0	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55da-ef87-b7e8-3174f94bc482	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55da-ef87-b867-73f4075c0b52	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55da-ef87-169b-127c134a4bda	SM	SMR	674	San Marino 	San Marino	\N
00040000-55da-ef87-2abe-fc0a9e63a200	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55da-ef87-0f39-b205585763e7	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55da-ef87-abe0-afdf51cd90b6	SN	SEN	686	Senegal 	Senegal	\N
00040000-55da-ef87-3220-12a2b74f3314	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55da-ef87-8d92-927c4f3d82fe	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55da-ef87-a057-3243130b7135	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55da-ef87-a158-fa76b0e8bd90	SG	SGP	702	Singapore 	Singapur	\N
00040000-55da-ef87-4a3f-82034fa4e5cf	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55da-ef87-7a6e-b730d5333a74	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55da-ef87-986d-ead712bdeeb2	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55da-ef87-c1b8-375aa39b185b	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55da-ef87-8dcc-d4d81a716c06	SO	SOM	706	Somalia 	Somalija	\N
00040000-55da-ef87-6889-3010899ce6a0	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55da-ef87-6846-d3be98f779fa	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55da-ef87-5d0c-056ea0ec3f9c	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55da-ef87-036b-f0941b94a5d7	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55da-ef87-d660-4ffd65dc4917	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55da-ef87-b3c7-14b263a3304e	SD	SDN	729	Sudan 	Sudan	\N
00040000-55da-ef87-04bd-348972b53890	SR	SUR	740	Suriname 	Surinam	\N
00040000-55da-ef87-ffe9-de81f618f140	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55da-ef87-b71f-60b583833d99	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55da-ef87-3802-239a5bcb5891	SE	SWE	752	Sweden 	Švedska	\N
00040000-55da-ef87-dab3-384e8869a7b1	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55da-ef87-e1e6-325275d4a645	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55da-ef87-e037-bfa9693b74b7	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55da-ef87-9302-137f03de9c3f	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55da-ef87-4bca-ae094e38851a	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55da-ef87-6fb4-24f3102e6d24	TH	THA	764	Thailand 	Tajska	\N
00040000-55da-ef87-5e9f-4a7d6e3e0413	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55da-ef87-ebea-9d02fd0dd461	TG	TGO	768	Togo 	Togo	\N
00040000-55da-ef88-e862-39d5823d0457	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55da-ef88-6332-a9878d6c8c15	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55da-ef88-b9ba-db942645b4d5	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55da-ef88-ed91-806cf768c4ee	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55da-ef88-7081-9277e397d7d3	TR	TUR	792	Turkey 	Turčija	\N
00040000-55da-ef88-f5bc-4704b4d06909	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55da-ef88-ea91-07ec535176ae	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55da-ef88-8342-3c78d9fdc42f	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55da-ef88-49bf-3eab23959dfc	UG	UGA	800	Uganda 	Uganda	\N
00040000-55da-ef88-ec01-a5ba8202994f	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55da-ef88-73dd-109baf1aac61	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55da-ef88-7cab-acbeb3cc7d67	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55da-ef88-6d9a-f8798ad1f4c4	US	USA	840	United States 	Združene države Amerike	\N
00040000-55da-ef88-65ca-1607ee3df4b1	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55da-ef88-2486-db3255f69c06	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55da-ef88-5f25-3aaa32e07986	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55da-ef88-5d64-27a0aa3c8fc6	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55da-ef88-4c5a-7534bee974f0	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55da-ef88-f11a-ce59c2c22632	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55da-ef88-b1e1-eb92fd706818	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55da-ef88-b14f-29e73200d9c8	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55da-ef88-a4e7-3a4217297a7a	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55da-ef88-4636-5ecb6595dd69	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55da-ef88-00b9-c8b893bc7213	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55da-ef88-80e4-b3b8451263bc	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55da-ef88-91f3-97d26242aa07	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2941 (class 0 OID 15291385)
-- Dependencies: 223
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55da-ef8a-9438-a90dee96d0eb	000e0000-55da-ef8a-ffe7-d32fb89e6aa9	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		\N	002b0000-55da-ef88-5e2d-4f09a611b455	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55da-ef8a-d2a8-b2d994fe914a	000e0000-55da-ef8a-3560-c8d9213e49b6	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		\N	002b0000-55da-ef88-4fc8-4db8a549b049	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55da-ef8a-7d1b-58411ec6dd5d	000e0000-55da-ef8a-e6fb-c37cd845fc5c	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		\N	002b0000-55da-ef88-5e2d-4f09a611b455	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55da-ef8a-50e0-dec814cf8ed8	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55da-ef8a-0fb3-3beea2058a31	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2928 (class 0 OID 15291212)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55da-ef8a-557b-a0869cc43bea	000e0000-55da-ef8a-3560-c8d9213e49b6	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55da-ef88-c44b-898be71b7430
000d0000-55da-ef8a-59ca-942eb36f7a8e	000e0000-55da-ef8a-3560-c8d9213e49b6	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55da-ef88-c44b-898be71b7430
000d0000-55da-ef8a-a755-8584dce2402f	000e0000-55da-ef8a-3560-c8d9213e49b6	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55da-ef88-809d-434a938e0ad0
000d0000-55da-ef8a-ec15-3fc828e2f4d1	000e0000-55da-ef8a-3560-c8d9213e49b6	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55da-ef88-b80f-96bf4c0a8742
000d0000-55da-ef8a-a67b-3ce6598108c7	000e0000-55da-ef8a-3560-c8d9213e49b6	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55da-ef88-fc42-5c0ebd892d44
000d0000-55da-ef8a-d059-92381a774097	000e0000-55da-ef8a-3560-c8d9213e49b6	\N	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55da-ef88-fc42-5c0ebd892d44
000d0000-55da-ef8a-19fc-0163675caf57	000e0000-55da-ef8a-3560-c8d9213e49b6	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55da-ef88-c44b-898be71b7430
000d0000-55da-ef8a-920e-ddd7ef5363ab	000e0000-55da-ef8a-3560-c8d9213e49b6	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55da-ef88-2064-60082c51acec
\.


--
-- TOC entry 2907 (class 0 OID 15291028)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2911 (class 0 OID 15291076)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 15291008)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55da-ef8a-311d-508295483def	00080000-55da-ef89-218e-6c0a1ea03747	00090000-55da-ef8a-845f-df38186192be	AK		
\.


--
-- TOC entry 2917 (class 0 OID 15291129)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 15291601)
-- Dependencies: 236
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2955 (class 0 OID 15291613)
-- Dependencies: 237
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2957 (class 0 OID 15291635)
-- Dependencies: 239
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2921 (class 0 OID 15291154)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 15290965)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55da-ef88-1b00-0d82a40d89a2	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55da-ef88-7beb-3c5de429ccc9	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55da-ef88-0985-97093a44a77e	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55da-ef88-b02f-226d91fd5731	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55da-ef88-547e-dd9adc339432	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55da-ef88-2f43-87984e15c469	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55da-ef88-809a-559671621e6b	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55da-ef88-a9bb-0e739cdf463e	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55da-ef88-c6c1-f9644f986aeb	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55da-ef88-1b64-3f649f983e1f	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55da-ef88-91f2-e9d6b9cff8d1	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55da-ef88-1a26-16391a493bad	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55da-ef88-ccd0-2b7484c108c3	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55da-ef88-8cc6-fcca0f5ec6fa	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55da-ef89-d8fa-ae6d19a5433b	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55da-ef89-5edb-90dee653d52f	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55da-ef89-edad-ea5fdbdb653e	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55da-ef89-c010-4d66f1302ca6	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55da-ef89-e43e-10ed636c679c	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55da-ef89-5b7b-891b54c9c662	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2896 (class 0 OID 15290878)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55da-ef89-8954-d49f78dd7598	00000000-55da-ef89-5edb-90dee653d52f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55da-ef89-324f-d3c258ac2cf6	00000000-55da-ef89-5edb-90dee653d52f	00010000-55da-ef88-ad3e-3bbe021a07e2	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55da-ef89-8809-dce32b1e1568	00000000-55da-ef89-edad-ea5fdbdb653e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2897 (class 0 OID 15290889)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55da-ef8a-4261-c2751ad06697	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55da-ef8a-e275-79a54344eea5	00010000-55da-ef89-d8a1-3e9f1daa507d	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55da-ef8a-022b-61b51a145ddf	00010000-55da-ef89-916a-9591b830f145	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55da-ef8a-412e-0650f373392f	00010000-55da-ef8a-214d-2f60525a0cf6	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55da-ef8a-c4dc-87744e526c41	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55da-ef8a-3808-d5d5f59464d8	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55da-ef8a-2ca9-51f46e054421	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55da-ef8a-756b-fd9fa981131a	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55da-ef8a-845f-df38186192be	00010000-55da-ef8a-d82a-a719f142a3ab	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55da-ef8a-9207-202020c5f578	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55da-ef8a-2891-f0b11a835c9f	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55da-ef8a-c1dc-4fd3a228f4ee	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55da-ef8a-7a8b-9c558c30042f	00010000-55da-ef8a-dbca-f6ff65a00937	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2892 (class 0 OID 15290843)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55da-ef88-7c19-f2053da2e6d3	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55da-ef88-1b3c-9f698930963a	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55da-ef88-bc75-e7b07d650672	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55da-ef88-3dbb-8d229afdff7e	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55da-ef88-df0c-012b5f0901f9	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55da-ef88-6d3a-5a75467f911a	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55da-ef88-4899-24408296d5ab	Abonma-read	Abonma - branje	f
00030000-55da-ef88-ff02-e55b61041530	Abonma-write	Abonma - spreminjanje	f
00030000-55da-ef88-f27c-05d0ac079843	Alternacija-read	Alternacija - branje	f
00030000-55da-ef88-9262-d8746f3a0df2	Alternacija-write	Alternacija - spreminjanje	f
00030000-55da-ef88-9407-ce77d1b19bd0	Arhivalija-read	Arhivalija - branje	f
00030000-55da-ef88-9753-01861c25e84c	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55da-ef88-f42e-3cd7aa757b86	Besedilo-read	Besedilo - branje	f
00030000-55da-ef88-315a-c0d8d5f3da78	Besedilo-write	Besedilo - spreminjanje	f
00030000-55da-ef88-40c5-22cc9a7d05ce	DogodekIzven-read	DogodekIzven - branje	f
00030000-55da-ef88-6b36-f6810b857e82	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55da-ef88-1aed-bcb975fd3f13	Dogodek-read	Dogodek - branje	f
00030000-55da-ef88-7f0c-5f2f372b11ef	Dogodek-write	Dogodek - spreminjanje	f
00030000-55da-ef88-796e-478e66823548	DrugiVir-read	DrugiVir - branje	f
00030000-55da-ef88-5af4-7c8e116db87f	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55da-ef88-3df9-f81487257d54	Drzava-read	Drzava - branje	f
00030000-55da-ef88-9e9b-5e04834b3d79	Drzava-write	Drzava - spreminjanje	f
00030000-55da-ef88-a9c5-ea91d2018764	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55da-ef88-7aea-d5624650350e	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55da-ef88-0d80-f7845092e82b	Funkcija-read	Funkcija - branje	f
00030000-55da-ef88-7d0b-42b8c30d7d12	Funkcija-write	Funkcija - spreminjanje	f
00030000-55da-ef88-053f-f3b0c800facf	Gostovanje-read	Gostovanje - branje	f
00030000-55da-ef88-b943-b98f02dc5e1b	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55da-ef88-ac43-ee14eb0e5374	Gostujoca-read	Gostujoca - branje	f
00030000-55da-ef88-4663-8c1e6f6eb147	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55da-ef88-e03a-9e2438480412	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55da-ef88-17d5-8b7a542d1d56	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55da-ef88-3771-b62ccb36b06d	Kupec-read	Kupec - branje	f
00030000-55da-ef88-409a-59a43084e7cb	Kupec-write	Kupec - spreminjanje	f
00030000-55da-ef88-75dc-0865d9cfd1e3	NacinPlacina-read	NacinPlacina - branje	f
00030000-55da-ef88-acf4-56dd13409c40	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55da-ef88-5466-f51a522926cd	Option-read	Option - branje	f
00030000-55da-ef88-6237-1f5a2baff42a	Option-write	Option - spreminjanje	f
00030000-55da-ef88-e4a3-d3f9732a7562	OptionValue-read	OptionValue - branje	f
00030000-55da-ef88-9030-40b594b222f0	OptionValue-write	OptionValue - spreminjanje	f
00030000-55da-ef88-d5e4-bd8c816d2c00	Oseba-read	Oseba - branje	f
00030000-55da-ef88-8c01-484c961891bf	Oseba-write	Oseba - spreminjanje	f
00030000-55da-ef88-0920-0f5e2e18c3e0	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55da-ef88-ab30-a01f8fdcf956	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55da-ef88-edf1-134c25ca9850	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55da-ef88-326d-9b10a7b2152c	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55da-ef88-eb8a-208b57fd4a1b	Pogodba-read	Pogodba - branje	f
00030000-55da-ef88-3007-4505ef6967c2	Pogodba-write	Pogodba - spreminjanje	f
00030000-55da-ef88-6a4b-687fa40f1620	Popa-read	Popa - branje	f
00030000-55da-ef88-4cdb-61a6bc70c7ba	Popa-write	Popa - spreminjanje	f
00030000-55da-ef88-aee1-b04df153c9d7	Posta-read	Posta - branje	f
00030000-55da-ef88-614a-d3387d393a21	Posta-write	Posta - spreminjanje	f
00030000-55da-ef88-88a8-afa3f2d6fb56	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55da-ef88-8bc7-bf4600311cbd	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55da-ef88-5191-ddd6a5d02b8a	PostniNaslov-read	PostniNaslov - branje	f
00030000-55da-ef88-7c91-599165ae3669	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55da-ef88-b4c0-d696237a794e	Predstava-read	Predstava - branje	f
00030000-55da-ef88-c073-14ac116ccbd1	Predstava-write	Predstava - spreminjanje	f
00030000-55da-ef88-b2e0-0e36450c3689	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55da-ef88-1c61-3b7030422c87	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55da-ef88-e58e-4c6e2d829b4b	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55da-ef88-c9e4-c384a5cd23b9	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55da-ef88-b810-db26e80b4f85	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55da-ef88-4073-9781e1a3f6b4	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55da-ef88-9b89-1adbbe4142e9	ProgramDela-read	ProgramDela - branje	f
00030000-55da-ef88-971f-638668109a1d	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55da-ef88-8ed1-9562ae4c8b83	ProgramFestival-read	ProgramFestival - branje	f
00030000-55da-ef88-e4e9-00118d27f286	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55da-ef88-ffeb-9b629f5c6419	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55da-ef88-7b8b-03b68ce18825	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55da-ef88-2c08-18880a1133a7	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55da-ef88-7af9-1612fdd6eec6	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55da-ef88-a176-5ef270782790	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55da-ef88-0fe8-1e5c506af8f3	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55da-ef88-0af5-5a765c895154	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55da-ef88-cd52-8c59ed3051ea	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55da-ef88-f9ee-18d2e1fdf52c	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55da-ef88-ad36-10b2ebf5df2f	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55da-ef88-7509-96ab8baca18a	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55da-ef88-009b-9203a8f54463	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55da-ef88-5f9a-0e47cc5ee9a4	ProgramRazno-read	ProgramRazno - branje	f
00030000-55da-ef88-fd5f-c460119c4868	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55da-ef88-2b8d-5425e3049109	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55da-ef88-083f-db52e68d053c	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55da-ef88-9e08-666c14c33fd3	Prostor-read	Prostor - branje	f
00030000-55da-ef88-231d-6e43ed71c97f	Prostor-write	Prostor - spreminjanje	f
00030000-55da-ef88-c31b-b7590fb130e4	Racun-read	Racun - branje	f
00030000-55da-ef88-6105-b37178088f81	Racun-write	Racun - spreminjanje	f
00030000-55da-ef88-5ac3-85985f9b362b	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55da-ef88-7d5c-ddf9d58d5f7c	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55da-ef88-4610-23363e459109	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55da-ef88-5937-2320761f0f2f	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55da-ef88-aade-33b403b5cb22	Rekvizit-read	Rekvizit - branje	f
00030000-55da-ef88-6808-0cf22501ef3a	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55da-ef88-c4c9-66199bde34b3	Revizija-read	Revizija - branje	f
00030000-55da-ef88-afac-6a277f171107	Revizija-write	Revizija - spreminjanje	f
00030000-55da-ef88-4528-7425b622b6b0	Rezervacija-read	Rezervacija - branje	f
00030000-55da-ef88-d953-c51fb89e7bed	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55da-ef88-5253-8e29cc00eac0	SedezniRed-read	SedezniRed - branje	f
00030000-55da-ef88-43b1-d280e770296a	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55da-ef88-7c5d-7a88c9641ac3	Sedez-read	Sedez - branje	f
00030000-55da-ef88-196f-f1a0e492d642	Sedez-write	Sedez - spreminjanje	f
00030000-55da-ef88-2929-d2ed1a41cb33	Sezona-read	Sezona - branje	f
00030000-55da-ef88-4dca-bde0e33fe2b5	Sezona-write	Sezona - spreminjanje	f
00030000-55da-ef88-c4f6-b7ffe20b809e	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55da-ef88-0f52-51c93dd343a1	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55da-ef88-974f-a639a6dbfc5d	Stevilcenje-read	Stevilcenje - branje	f
00030000-55da-ef88-e801-9f29edab2054	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55da-ef88-1d7f-4b299c419f7b	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55da-ef88-9067-0b0e0f546a2e	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55da-ef88-28df-cf6ca3d90f44	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55da-ef88-ae1e-cffc5f47266a	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55da-ef88-55ab-42aabfb84b10	Telefonska-read	Telefonska - branje	f
00030000-55da-ef88-b7e6-8967d09f7b3c	Telefonska-write	Telefonska - spreminjanje	f
00030000-55da-ef88-cc82-d224c6cce52e	TerminStoritve-read	TerminStoritve - branje	f
00030000-55da-ef88-1ef3-56d1ef6f38bb	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55da-ef88-625d-0ac2a042890c	TipFunkcije-read	TipFunkcije - branje	f
00030000-55da-ef88-15e9-71b97a56c690	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55da-ef88-c15a-715080108e3d	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55da-ef88-f33b-2a5e87a08312	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55da-ef88-5a52-ecabb25b82ed	Trr-read	Trr - branje	f
00030000-55da-ef88-2f3e-a34b71b55559	Trr-write	Trr - spreminjanje	f
00030000-55da-ef88-8faf-c5d4b6c117b0	Uprizoritev-read	Uprizoritev - branje	f
00030000-55da-ef88-fabb-83629a03f5a6	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55da-ef88-549b-b32a31241d3c	Vaja-read	Vaja - branje	f
00030000-55da-ef88-0d57-42e6e652a598	Vaja-write	Vaja - spreminjanje	f
00030000-55da-ef88-e821-3f4a0fae7a31	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55da-ef88-6517-f742830ece24	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55da-ef88-bc9d-a036c5e9eee6	Zaposlitev-read	Zaposlitev - branje	f
00030000-55da-ef88-dab1-ac44c96370e8	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55da-ef88-f1ef-5ae0204ffb09	Zasedenost-read	Zasedenost - branje	f
00030000-55da-ef88-a350-e4117290a80c	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55da-ef88-f6fe-c73e254774e5	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55da-ef88-b4b9-fda512f6aa81	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55da-ef88-2dc5-ccab2f7ba7b7	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55da-ef88-2f6f-eca8bb730779	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55da-ef88-dec0-50a250319fd6	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55da-ef88-d423-62809013d7a1	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55da-ef88-3147-ca2289cc8ff9	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55da-ef88-d048-47b81e9e3b0e	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55da-ef88-27ae-7bf740848287	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55da-ef88-b577-d2e22604de65	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55da-ef88-ac9e-9a1659a01aa2	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55da-ef88-a067-6dd3816164ba	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55da-ef88-1e41-24ef3a3ce54a	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55da-ef88-2771-006baee573d2	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55da-ef88-77d5-22a714a61866	Datoteka-write	Datoteka - spreminjanje	f
00030000-55da-ef88-babe-19386d2001f2	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2894 (class 0 OID 15290862)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55da-ef88-601f-256b4c0fcb94	00030000-55da-ef88-1b3c-9f698930963a
00020000-55da-ef88-54d7-67d48d6804f0	00030000-55da-ef88-3df9-f81487257d54
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-4899-24408296d5ab
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-ff02-e55b61041530
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-f27c-05d0ac079843
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-9262-d8746f3a0df2
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-9407-ce77d1b19bd0
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-1aed-bcb975fd3f13
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-3dbb-8d229afdff7e
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-7f0c-5f2f372b11ef
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-3df9-f81487257d54
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-9e9b-5e04834b3d79
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-0d80-f7845092e82b
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-7d0b-42b8c30d7d12
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-053f-f3b0c800facf
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-b943-b98f02dc5e1b
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-ac43-ee14eb0e5374
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-4663-8c1e6f6eb147
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-e03a-9e2438480412
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-17d5-8b7a542d1d56
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-5466-f51a522926cd
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-e4a3-d3f9732a7562
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-d5e4-bd8c816d2c00
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-8c01-484c961891bf
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-6a4b-687fa40f1620
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-4cdb-61a6bc70c7ba
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-aee1-b04df153c9d7
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-614a-d3387d393a21
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-5191-ddd6a5d02b8a
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-7c91-599165ae3669
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-b4c0-d696237a794e
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-c073-14ac116ccbd1
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-b810-db26e80b4f85
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-4073-9781e1a3f6b4
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-9e08-666c14c33fd3
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-231d-6e43ed71c97f
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-4610-23363e459109
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-5937-2320761f0f2f
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-aade-33b403b5cb22
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-6808-0cf22501ef3a
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-2929-d2ed1a41cb33
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-4dca-bde0e33fe2b5
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-625d-0ac2a042890c
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-8faf-c5d4b6c117b0
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-fabb-83629a03f5a6
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-549b-b32a31241d3c
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-0d57-42e6e652a598
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-f1ef-5ae0204ffb09
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-a350-e4117290a80c
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-f6fe-c73e254774e5
00020000-55da-ef88-40b4-9111a78478e3	00030000-55da-ef88-2dc5-ccab2f7ba7b7
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-4899-24408296d5ab
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-9407-ce77d1b19bd0
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-1aed-bcb975fd3f13
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-3df9-f81487257d54
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-053f-f3b0c800facf
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-ac43-ee14eb0e5374
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-e03a-9e2438480412
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-17d5-8b7a542d1d56
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-5466-f51a522926cd
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-e4a3-d3f9732a7562
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-d5e4-bd8c816d2c00
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-8c01-484c961891bf
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-6a4b-687fa40f1620
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-aee1-b04df153c9d7
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-5191-ddd6a5d02b8a
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-7c91-599165ae3669
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-b4c0-d696237a794e
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-9e08-666c14c33fd3
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-4610-23363e459109
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-aade-33b403b5cb22
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-2929-d2ed1a41cb33
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-55ab-42aabfb84b10
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-b7e6-8967d09f7b3c
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-5a52-ecabb25b82ed
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-2f3e-a34b71b55559
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-bc9d-a036c5e9eee6
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-dab1-ac44c96370e8
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-f6fe-c73e254774e5
00020000-55da-ef88-8e42-d933478ad085	00030000-55da-ef88-2dc5-ccab2f7ba7b7
00020000-55da-ef88-429a-18b02be44e0f	00030000-55da-ef88-4899-24408296d5ab
00020000-55da-ef88-429a-18b02be44e0f	00030000-55da-ef88-f27c-05d0ac079843
00020000-55da-ef88-429a-18b02be44e0f	00030000-55da-ef88-9407-ce77d1b19bd0
00020000-55da-ef88-429a-18b02be44e0f	00030000-55da-ef88-9753-01861c25e84c
00020000-55da-ef88-429a-18b02be44e0f	00030000-55da-ef88-f42e-3cd7aa757b86
00020000-55da-ef88-429a-18b02be44e0f	00030000-55da-ef88-40c5-22cc9a7d05ce
00020000-55da-ef88-429a-18b02be44e0f	00030000-55da-ef88-1aed-bcb975fd3f13
00020000-55da-ef88-429a-18b02be44e0f	00030000-55da-ef88-3df9-f81487257d54
00020000-55da-ef88-429a-18b02be44e0f	00030000-55da-ef88-0d80-f7845092e82b
00020000-55da-ef88-429a-18b02be44e0f	00030000-55da-ef88-053f-f3b0c800facf
00020000-55da-ef88-429a-18b02be44e0f	00030000-55da-ef88-ac43-ee14eb0e5374
00020000-55da-ef88-429a-18b02be44e0f	00030000-55da-ef88-e03a-9e2438480412
00020000-55da-ef88-429a-18b02be44e0f	00030000-55da-ef88-5466-f51a522926cd
00020000-55da-ef88-429a-18b02be44e0f	00030000-55da-ef88-e4a3-d3f9732a7562
00020000-55da-ef88-429a-18b02be44e0f	00030000-55da-ef88-d5e4-bd8c816d2c00
00020000-55da-ef88-429a-18b02be44e0f	00030000-55da-ef88-6a4b-687fa40f1620
00020000-55da-ef88-429a-18b02be44e0f	00030000-55da-ef88-aee1-b04df153c9d7
00020000-55da-ef88-429a-18b02be44e0f	00030000-55da-ef88-b4c0-d696237a794e
00020000-55da-ef88-429a-18b02be44e0f	00030000-55da-ef88-b810-db26e80b4f85
00020000-55da-ef88-429a-18b02be44e0f	00030000-55da-ef88-9e08-666c14c33fd3
00020000-55da-ef88-429a-18b02be44e0f	00030000-55da-ef88-4610-23363e459109
00020000-55da-ef88-429a-18b02be44e0f	00030000-55da-ef88-aade-33b403b5cb22
00020000-55da-ef88-429a-18b02be44e0f	00030000-55da-ef88-2929-d2ed1a41cb33
00020000-55da-ef88-429a-18b02be44e0f	00030000-55da-ef88-625d-0ac2a042890c
00020000-55da-ef88-429a-18b02be44e0f	00030000-55da-ef88-549b-b32a31241d3c
00020000-55da-ef88-429a-18b02be44e0f	00030000-55da-ef88-f1ef-5ae0204ffb09
00020000-55da-ef88-429a-18b02be44e0f	00030000-55da-ef88-f6fe-c73e254774e5
00020000-55da-ef88-429a-18b02be44e0f	00030000-55da-ef88-2dc5-ccab2f7ba7b7
00020000-55da-ef88-0a5c-9b411616a81f	00030000-55da-ef88-4899-24408296d5ab
00020000-55da-ef88-0a5c-9b411616a81f	00030000-55da-ef88-ff02-e55b61041530
00020000-55da-ef88-0a5c-9b411616a81f	00030000-55da-ef88-9262-d8746f3a0df2
00020000-55da-ef88-0a5c-9b411616a81f	00030000-55da-ef88-9407-ce77d1b19bd0
00020000-55da-ef88-0a5c-9b411616a81f	00030000-55da-ef88-1aed-bcb975fd3f13
00020000-55da-ef88-0a5c-9b411616a81f	00030000-55da-ef88-3df9-f81487257d54
00020000-55da-ef88-0a5c-9b411616a81f	00030000-55da-ef88-053f-f3b0c800facf
00020000-55da-ef88-0a5c-9b411616a81f	00030000-55da-ef88-ac43-ee14eb0e5374
00020000-55da-ef88-0a5c-9b411616a81f	00030000-55da-ef88-5466-f51a522926cd
00020000-55da-ef88-0a5c-9b411616a81f	00030000-55da-ef88-e4a3-d3f9732a7562
00020000-55da-ef88-0a5c-9b411616a81f	00030000-55da-ef88-6a4b-687fa40f1620
00020000-55da-ef88-0a5c-9b411616a81f	00030000-55da-ef88-aee1-b04df153c9d7
00020000-55da-ef88-0a5c-9b411616a81f	00030000-55da-ef88-b4c0-d696237a794e
00020000-55da-ef88-0a5c-9b411616a81f	00030000-55da-ef88-9e08-666c14c33fd3
00020000-55da-ef88-0a5c-9b411616a81f	00030000-55da-ef88-4610-23363e459109
00020000-55da-ef88-0a5c-9b411616a81f	00030000-55da-ef88-aade-33b403b5cb22
00020000-55da-ef88-0a5c-9b411616a81f	00030000-55da-ef88-2929-d2ed1a41cb33
00020000-55da-ef88-0a5c-9b411616a81f	00030000-55da-ef88-625d-0ac2a042890c
00020000-55da-ef88-0a5c-9b411616a81f	00030000-55da-ef88-f6fe-c73e254774e5
00020000-55da-ef88-0a5c-9b411616a81f	00030000-55da-ef88-2dc5-ccab2f7ba7b7
00020000-55da-ef88-2aaa-c048f26c9eb9	00030000-55da-ef88-4899-24408296d5ab
00020000-55da-ef88-2aaa-c048f26c9eb9	00030000-55da-ef88-9407-ce77d1b19bd0
00020000-55da-ef88-2aaa-c048f26c9eb9	00030000-55da-ef88-1aed-bcb975fd3f13
00020000-55da-ef88-2aaa-c048f26c9eb9	00030000-55da-ef88-3df9-f81487257d54
00020000-55da-ef88-2aaa-c048f26c9eb9	00030000-55da-ef88-053f-f3b0c800facf
00020000-55da-ef88-2aaa-c048f26c9eb9	00030000-55da-ef88-ac43-ee14eb0e5374
00020000-55da-ef88-2aaa-c048f26c9eb9	00030000-55da-ef88-5466-f51a522926cd
00020000-55da-ef88-2aaa-c048f26c9eb9	00030000-55da-ef88-e4a3-d3f9732a7562
00020000-55da-ef88-2aaa-c048f26c9eb9	00030000-55da-ef88-6a4b-687fa40f1620
00020000-55da-ef88-2aaa-c048f26c9eb9	00030000-55da-ef88-aee1-b04df153c9d7
00020000-55da-ef88-2aaa-c048f26c9eb9	00030000-55da-ef88-b4c0-d696237a794e
00020000-55da-ef88-2aaa-c048f26c9eb9	00030000-55da-ef88-9e08-666c14c33fd3
00020000-55da-ef88-2aaa-c048f26c9eb9	00030000-55da-ef88-4610-23363e459109
00020000-55da-ef88-2aaa-c048f26c9eb9	00030000-55da-ef88-aade-33b403b5cb22
00020000-55da-ef88-2aaa-c048f26c9eb9	00030000-55da-ef88-2929-d2ed1a41cb33
00020000-55da-ef88-2aaa-c048f26c9eb9	00030000-55da-ef88-cc82-d224c6cce52e
00020000-55da-ef88-2aaa-c048f26c9eb9	00030000-55da-ef88-bc75-e7b07d650672
00020000-55da-ef88-2aaa-c048f26c9eb9	00030000-55da-ef88-625d-0ac2a042890c
00020000-55da-ef88-2aaa-c048f26c9eb9	00030000-55da-ef88-f6fe-c73e254774e5
00020000-55da-ef88-2aaa-c048f26c9eb9	00030000-55da-ef88-2dc5-ccab2f7ba7b7
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-7c19-f2053da2e6d3
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-1b3c-9f698930963a
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-bc75-e7b07d650672
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-3dbb-8d229afdff7e
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-df0c-012b5f0901f9
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-6d3a-5a75467f911a
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-4899-24408296d5ab
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-ff02-e55b61041530
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-f27c-05d0ac079843
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-9262-d8746f3a0df2
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-9407-ce77d1b19bd0
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-9753-01861c25e84c
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-f42e-3cd7aa757b86
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-315a-c0d8d5f3da78
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-40c5-22cc9a7d05ce
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-6b36-f6810b857e82
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-1aed-bcb975fd3f13
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-7f0c-5f2f372b11ef
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-3df9-f81487257d54
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-9e9b-5e04834b3d79
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-796e-478e66823548
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-5af4-7c8e116db87f
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-a9c5-ea91d2018764
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-7aea-d5624650350e
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-0d80-f7845092e82b
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-7d0b-42b8c30d7d12
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-053f-f3b0c800facf
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-b943-b98f02dc5e1b
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-ac43-ee14eb0e5374
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-4663-8c1e6f6eb147
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-e03a-9e2438480412
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-17d5-8b7a542d1d56
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-3771-b62ccb36b06d
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-409a-59a43084e7cb
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-75dc-0865d9cfd1e3
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-acf4-56dd13409c40
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-5466-f51a522926cd
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-6237-1f5a2baff42a
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-e4a3-d3f9732a7562
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-9030-40b594b222f0
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-d5e4-bd8c816d2c00
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-8c01-484c961891bf
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-0920-0f5e2e18c3e0
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-ab30-a01f8fdcf956
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-edf1-134c25ca9850
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-326d-9b10a7b2152c
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-eb8a-208b57fd4a1b
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-3007-4505ef6967c2
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-6a4b-687fa40f1620
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-4cdb-61a6bc70c7ba
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-aee1-b04df153c9d7
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-614a-d3387d393a21
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-88a8-afa3f2d6fb56
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-8bc7-bf4600311cbd
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-5191-ddd6a5d02b8a
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-7c91-599165ae3669
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-b4c0-d696237a794e
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-c073-14ac116ccbd1
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-b2e0-0e36450c3689
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-1c61-3b7030422c87
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-e58e-4c6e2d829b4b
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-c9e4-c384a5cd23b9
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-b810-db26e80b4f85
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-4073-9781e1a3f6b4
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-9b89-1adbbe4142e9
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-971f-638668109a1d
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-8ed1-9562ae4c8b83
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-e4e9-00118d27f286
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-ffeb-9b629f5c6419
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-7b8b-03b68ce18825
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-2c08-18880a1133a7
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-7af9-1612fdd6eec6
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-a176-5ef270782790
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-0fe8-1e5c506af8f3
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-0af5-5a765c895154
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-cd52-8c59ed3051ea
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-f9ee-18d2e1fdf52c
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-ad36-10b2ebf5df2f
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-7509-96ab8baca18a
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-009b-9203a8f54463
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-5f9a-0e47cc5ee9a4
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-fd5f-c460119c4868
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-2b8d-5425e3049109
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-083f-db52e68d053c
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-9e08-666c14c33fd3
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-231d-6e43ed71c97f
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-c31b-b7590fb130e4
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-6105-b37178088f81
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-5ac3-85985f9b362b
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-7d5c-ddf9d58d5f7c
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-4610-23363e459109
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-5937-2320761f0f2f
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-aade-33b403b5cb22
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-6808-0cf22501ef3a
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-c4c9-66199bde34b3
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-afac-6a277f171107
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-4528-7425b622b6b0
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-d953-c51fb89e7bed
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-5253-8e29cc00eac0
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-43b1-d280e770296a
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-7c5d-7a88c9641ac3
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-196f-f1a0e492d642
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-2929-d2ed1a41cb33
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-4dca-bde0e33fe2b5
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-c4f6-b7ffe20b809e
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-0f52-51c93dd343a1
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-974f-a639a6dbfc5d
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-e801-9f29edab2054
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-1d7f-4b299c419f7b
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-9067-0b0e0f546a2e
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-28df-cf6ca3d90f44
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-ae1e-cffc5f47266a
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-55ab-42aabfb84b10
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-b7e6-8967d09f7b3c
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-cc82-d224c6cce52e
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-1ef3-56d1ef6f38bb
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-625d-0ac2a042890c
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-15e9-71b97a56c690
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-c15a-715080108e3d
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-f33b-2a5e87a08312
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-5a52-ecabb25b82ed
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-2f3e-a34b71b55559
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-8faf-c5d4b6c117b0
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-fabb-83629a03f5a6
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-549b-b32a31241d3c
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-0d57-42e6e652a598
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-e821-3f4a0fae7a31
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-6517-f742830ece24
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-bc9d-a036c5e9eee6
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-dab1-ac44c96370e8
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-f1ef-5ae0204ffb09
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-a350-e4117290a80c
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-f6fe-c73e254774e5
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-b4b9-fda512f6aa81
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-2dc5-ccab2f7ba7b7
00020000-55da-ef89-b190-75f6e12bdf1c	00030000-55da-ef88-2f6f-eca8bb730779
\.


--
-- TOC entry 2922 (class 0 OID 15291161)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2926 (class 0 OID 15291192)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 15291306)
-- Dependencies: 218
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55da-ef8a-8da6-f625588927e3	00090000-55da-ef8a-4261-c2751ad06697	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55da-ef8a-a413-87cc6ace7104	00090000-55da-ef8a-3808-d5d5f59464d8	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55da-ef8a-3774-f9b00177b557	00090000-55da-ef8a-7a8b-9c558c30042f	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2899 (class 0 OID 15290922)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55da-ef89-218e-6c0a1ea03747	00040000-55da-ef87-986d-ead712bdeeb2	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55da-ef89-96b2-cfe2e43bd2bb	00040000-55da-ef87-986d-ead712bdeeb2	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55da-ef89-af6b-5bd1397b18e0	00040000-55da-ef87-986d-ead712bdeeb2	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55da-ef89-4291-b13cb15e3904	00040000-55da-ef87-986d-ead712bdeeb2	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55da-ef89-7de8-5fd11accf236	00040000-55da-ef87-986d-ead712bdeeb2	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55da-ef89-fc89-63b9be01beb6	00040000-55da-ef87-73d7-555b60bd2896	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55da-ef89-5fe7-e42b7e44e745	00040000-55da-ef87-7590-6c3d09f5c868	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55da-ef89-c63a-fb02d250fcf9	00040000-55da-ef87-94d1-a079f7f7e766	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55da-ef8a-74c0-af6de3456136	00040000-55da-ef87-986d-ead712bdeeb2	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2901 (class 0 OID 15290957)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55da-ef88-8037-09105c5094cd	8341	Adlešiči
00050000-55da-ef88-ffca-e28768faba38	5270	Ajdovščina
00050000-55da-ef88-5d5f-fa23858ee7e1	6280	Ankaran/Ancarano
00050000-55da-ef88-3783-0e91fc709e18	9253	Apače
00050000-55da-ef88-c7dc-f217c7ea810b	8253	Artiče
00050000-55da-ef88-fa14-a4cfc3389972	4275	Begunje na Gorenjskem
00050000-55da-ef88-349c-b5d87bb43f15	1382	Begunje pri Cerknici
00050000-55da-ef88-10c1-29c59e500b8c	9231	Beltinci
00050000-55da-ef88-1b9f-7a6e2ed5fdf1	2234	Benedikt
00050000-55da-ef88-7a29-1b85402e9f72	2345	Bistrica ob Dravi
00050000-55da-ef88-5199-89a1af3b3f4f	3256	Bistrica ob Sotli
00050000-55da-ef88-5f7d-61877e0a6598	8259	Bizeljsko
00050000-55da-ef88-6911-7aa4c22db823	1223	Blagovica
00050000-55da-ef88-ce72-d18d66601aa7	8283	Blanca
00050000-55da-ef88-c93d-83cdd3d1da5a	4260	Bled
00050000-55da-ef88-b643-cfff2edcbd09	4273	Blejska Dobrava
00050000-55da-ef88-fecd-1a24036643a1	9265	Bodonci
00050000-55da-ef88-732e-4ca4b50dd858	9222	Bogojina
00050000-55da-ef88-2027-ac280d1c5812	4263	Bohinjska Bela
00050000-55da-ef88-e34f-6fb619b8eada	4264	Bohinjska Bistrica
00050000-55da-ef88-9fa7-b17e4481dc5b	4265	Bohinjsko jezero
00050000-55da-ef88-b034-51a5482c3778	1353	Borovnica
00050000-55da-ef88-b4e3-95507a20d3c2	8294	Boštanj
00050000-55da-ef88-ba47-767084e13971	5230	Bovec
00050000-55da-ef88-2d71-577217ad7d1d	5295	Branik
00050000-55da-ef88-6eb0-9679018e89f7	3314	Braslovče
00050000-55da-ef88-56a0-8b25aa128fdb	5223	Breginj
00050000-55da-ef88-42d6-45c16ddd51da	8280	Brestanica
00050000-55da-ef88-7278-d8b56b0dc126	2354	Bresternica
00050000-55da-ef88-3c1d-b5006b516398	4243	Brezje
00050000-55da-ef88-a44f-816c5d4f7855	1351	Brezovica pri Ljubljani
00050000-55da-ef88-6a89-20affca0866a	8250	Brežice
00050000-55da-ef88-1602-230d80632593	4210	Brnik - Aerodrom
00050000-55da-ef88-94f4-d22fda0ffde4	8321	Brusnice
00050000-55da-ef88-d842-5b41bf5593c7	3255	Buče
00050000-55da-ef88-183d-b0fd007a7e6b	8276	Bučka 
00050000-55da-ef88-8e1a-a83cdb4d66b7	9261	Cankova
00050000-55da-ef88-25c6-d7c4b8fb3c2c	3000	Celje 
00050000-55da-ef88-f2e0-d9e1c3c06139	3001	Celje - poštni predali
00050000-55da-ef88-a4da-91ecf4762e0c	4207	Cerklje na Gorenjskem
00050000-55da-ef88-9185-75f556ad8946	8263	Cerklje ob Krki
00050000-55da-ef88-26f1-c831a6ebec60	1380	Cerknica
00050000-55da-ef88-ddcc-861b11c7a1df	5282	Cerkno
00050000-55da-ef88-4a18-161f77c806c5	2236	Cerkvenjak
00050000-55da-ef88-16ce-77cddacaad0e	2215	Ceršak
00050000-55da-ef88-c4d0-70297009ba17	2326	Cirkovce
00050000-55da-ef88-d99a-f3a3f9c677df	2282	Cirkulane
00050000-55da-ef88-df40-483c08851c9e	5273	Col
00050000-55da-ef88-b8a5-057d79cb9125	8251	Čatež ob Savi
00050000-55da-ef88-bdf4-b2ac20db19ad	1413	Čemšenik
00050000-55da-ef88-4d2e-7e72ba4fca9b	5253	Čepovan
00050000-55da-ef88-20b2-b38cff992041	9232	Črenšovci
00050000-55da-ef88-590f-9b45ebec9a07	2393	Črna na Koroškem
00050000-55da-ef88-35fa-e3b1be0cec8b	6275	Črni Kal
00050000-55da-ef88-aa69-861dba38c1da	5274	Črni Vrh nad Idrijo
00050000-55da-ef88-8904-0ae2fc2b162f	5262	Črniče
00050000-55da-ef88-efa5-ba99a6fd2ce0	8340	Črnomelj
00050000-55da-ef88-7050-39311ca8c5f2	6271	Dekani
00050000-55da-ef88-f3d4-065fea47e226	5210	Deskle
00050000-55da-ef88-e29e-a89c75cc917a	2253	Destrnik
00050000-55da-ef88-af02-c61ccadcb249	6215	Divača
00050000-55da-ef88-2a0c-832e9436b256	1233	Dob
00050000-55da-ef88-c196-01481fb5fa06	3224	Dobje pri Planini
00050000-55da-ef88-10c4-ffd3dac07825	8257	Dobova
00050000-55da-ef88-4ce4-7ed5cbbce8fa	1423	Dobovec
00050000-55da-ef88-8b12-6927b946f9b6	5263	Dobravlje
00050000-55da-ef88-fb14-53e8ad6ea1ff	3204	Dobrna
00050000-55da-ef88-aec5-1ca38b3cbea1	8211	Dobrnič
00050000-55da-ef88-a372-ef55092c172e	1356	Dobrova
00050000-55da-ef88-8e35-878b06ed4758	9223	Dobrovnik/Dobronak 
00050000-55da-ef88-f3bb-cc91254b6229	5212	Dobrovo v Brdih
00050000-55da-ef88-6f8e-8707200a2dda	1431	Dol pri Hrastniku
00050000-55da-ef88-6b7c-9579ee129acf	1262	Dol pri Ljubljani
00050000-55da-ef88-d23d-60355cbadf41	1273	Dole pri Litiji
00050000-55da-ef88-7b10-6d03cc187d99	1331	Dolenja vas
00050000-55da-ef88-630b-84957fbe4f51	8350	Dolenjske Toplice
00050000-55da-ef88-f16c-d42375883195	1230	Domžale
00050000-55da-ef88-ee8f-ad28b40084e6	2252	Dornava
00050000-55da-ef88-a4c6-8bf005b88ede	5294	Dornberk
00050000-55da-ef88-6f69-399f8f06268b	1319	Draga
00050000-55da-ef88-dfc9-379cf6b28c6d	8343	Dragatuš
00050000-55da-ef88-3819-61092558142e	3222	Dramlje
00050000-55da-ef88-5f7c-719e7d2cfcad	2370	Dravograd
00050000-55da-ef88-59a4-4a1ff2adabaf	4203	Duplje
00050000-55da-ef88-5b77-9c7e574218c6	6221	Dutovlje
00050000-55da-ef88-2cbf-f6ac7992ce3d	8361	Dvor
00050000-55da-ef88-2ffc-6c333a28a1e6	2343	Fala
00050000-55da-ef88-13e6-ad09a77f60ff	9208	Fokovci
00050000-55da-ef88-4bee-d14673499138	2313	Fram
00050000-55da-ef88-2d71-02166257b077	3213	Frankolovo
00050000-55da-ef88-d29c-3f39e24fc9a8	1274	Gabrovka
00050000-55da-ef88-3c09-cc14fbbef650	8254	Globoko
00050000-55da-ef88-056f-3fdfa9860d17	5275	Godovič
00050000-55da-ef88-011e-8ae6a57e7783	4204	Golnik
00050000-55da-ef88-5c1a-50545ffe18ab	3303	Gomilsko
00050000-55da-ef88-a732-9d5f12508cad	4224	Gorenja vas
00050000-55da-ef88-19ea-4b28f331899e	3263	Gorica pri Slivnici
00050000-55da-ef88-d7d3-6b0afd59ce60	2272	Gorišnica
00050000-55da-ef88-6923-df23e80de330	9250	Gornja Radgona
00050000-55da-ef88-af20-3408056f7962	3342	Gornji Grad
00050000-55da-ef88-e8a4-23c19c6a09c8	4282	Gozd Martuljek
00050000-55da-ef88-775d-f8133a9157c5	6272	Gračišče
00050000-55da-ef88-6d31-8cdc32931292	9264	Grad
00050000-55da-ef88-c531-86a38569cf03	8332	Gradac
00050000-55da-ef88-6dd8-f736f47aa0e1	1384	Grahovo
00050000-55da-ef88-6a12-4889d407ab74	5242	Grahovo ob Bači
00050000-55da-ef88-8597-e3c4486c0a27	5251	Grgar
00050000-55da-ef88-8672-750761e44b47	3302	Griže
00050000-55da-ef88-c4ed-5e0aea684c35	3231	Grobelno
00050000-55da-ef88-13cd-34072cf2a132	1290	Grosuplje
00050000-55da-ef88-2230-77d7a5f29454	2288	Hajdina
00050000-55da-ef88-5eff-af6abb07acfa	8362	Hinje
00050000-55da-ef88-0f82-e3b124c73e76	2311	Hoče
00050000-55da-ef88-bcf4-565303ee767d	9205	Hodoš/Hodos
00050000-55da-ef88-4a3a-94496918d5a7	1354	Horjul
00050000-55da-ef88-ec6f-f05bb6f267d7	1372	Hotedršica
00050000-55da-ef88-9de0-fd538c665b53	1430	Hrastnik
00050000-55da-ef88-49a9-7ed89283e6d1	6225	Hruševje
00050000-55da-ef88-93f8-da0d04b076ef	4276	Hrušica
00050000-55da-ef88-209c-e9e0b3562cd4	5280	Idrija
00050000-55da-ef88-c36e-00e9b40a4021	1292	Ig
00050000-55da-ef88-339d-127395b9efd3	6250	Ilirska Bistrica
00050000-55da-ef88-d563-8bd7d5a6973a	6251	Ilirska Bistrica-Trnovo
00050000-55da-ef88-baeb-28c82cfcbf5a	1295	Ivančna Gorica
00050000-55da-ef88-ae01-ffde0392a1dc	2259	Ivanjkovci
00050000-55da-ef88-eb64-a95f719b0699	1411	Izlake
00050000-55da-ef88-cc0f-3c7ae619e955	6310	Izola/Isola
00050000-55da-ef88-b4eb-a05c78126096	2222	Jakobski Dol
00050000-55da-ef88-8df9-298312247ba7	2221	Jarenina
00050000-55da-ef88-67fe-1a6c79e7ab50	6254	Jelšane
00050000-55da-ef88-f88a-de48ef8c877b	4270	Jesenice
00050000-55da-ef88-bc9a-17d96457a816	8261	Jesenice na Dolenjskem
00050000-55da-ef88-7017-8dac3c8d7800	3273	Jurklošter
00050000-55da-ef88-267c-ad5b4b355959	2223	Jurovski Dol
00050000-55da-ef88-81c7-565d5fea3760	2256	Juršinci
00050000-55da-ef88-76ed-675b438b81b2	5214	Kal nad Kanalom
00050000-55da-ef88-6b28-29ebfb67e8d6	3233	Kalobje
00050000-55da-ef88-8627-ee6d04a22d45	4246	Kamna Gorica
00050000-55da-ef88-11d9-f80731178443	2351	Kamnica
00050000-55da-ef88-3e47-e15596c3a059	1241	Kamnik
00050000-55da-ef88-606b-3703bebf7513	5213	Kanal
00050000-55da-ef88-36d4-25bb0c95a62b	8258	Kapele
00050000-55da-ef88-94d9-147640e8f621	2362	Kapla
00050000-55da-ef88-2b93-a9ce59e16344	2325	Kidričevo
00050000-55da-ef88-e374-6529fc02461e	1412	Kisovec
00050000-55da-ef88-bb8a-0b126e6244bd	6253	Knežak
00050000-55da-ef88-54f1-4f60bb3169fc	5222	Kobarid
00050000-55da-ef88-bb51-bd286fc099a4	9227	Kobilje
00050000-55da-ef88-1a62-32c7528b721b	1330	Kočevje
00050000-55da-ef88-11d5-6a601b9d2184	1338	Kočevska Reka
00050000-55da-ef88-87bb-5e19663372d2	2276	Kog
00050000-55da-ef88-8ea5-f0ce769deced	5211	Kojsko
00050000-55da-ef88-83af-7b60df228a8d	6223	Komen
00050000-55da-ef88-ccc8-2397fc8fc9d5	1218	Komenda
00050000-55da-ef88-7ed2-0db3e379737e	6000	Koper/Capodistria 
00050000-55da-ef88-97d1-acf588d06517	6001	Koper/Capodistria - poštni predali
00050000-55da-ef88-9316-579154f5ce8a	8282	Koprivnica
00050000-55da-ef88-aa8f-40b7c2e8143e	5296	Kostanjevica na Krasu
00050000-55da-ef88-f35d-30691e99a9cd	8311	Kostanjevica na Krki
00050000-55da-ef88-1329-05d8c383e9ff	1336	Kostel
00050000-55da-ef88-79a7-2af5487f8bc3	6256	Košana
00050000-55da-ef88-6216-e182446188a6	2394	Kotlje
00050000-55da-ef88-9e2b-f2d4d9107fac	6240	Kozina
00050000-55da-ef88-fd6f-6d1540acb81e	3260	Kozje
00050000-55da-ef88-1593-2d80b1f6deae	4000	Kranj 
00050000-55da-ef88-1cdd-62597d9f2661	4001	Kranj - poštni predali
00050000-55da-ef88-2794-ae04d2c329fd	4280	Kranjska Gora
00050000-55da-ef88-f50e-79ccdc2de1d0	1281	Kresnice
00050000-55da-ef88-a1bc-954b52864ac8	4294	Križe
00050000-55da-ef88-4aba-d523d8442a1a	9206	Križevci
00050000-55da-ef88-a45a-f59f6584f5b4	9242	Križevci pri Ljutomeru
00050000-55da-ef88-1b23-5cdd759be862	1301	Krka
00050000-55da-ef88-7483-c0b48062226f	8296	Krmelj
00050000-55da-ef88-f8b1-d613c9536b85	4245	Kropa
00050000-55da-ef88-e2c3-a1a0dc4b2c06	8262	Krška vas
00050000-55da-ef88-dee5-4089edb1b8d4	8270	Krško
00050000-55da-ef88-b71a-c1edb7705f37	9263	Kuzma
00050000-55da-ef88-8c3e-d895db220c9a	2318	Laporje
00050000-55da-ef88-199e-b237fa5370a3	3270	Laško
00050000-55da-ef88-819e-6555af7aa143	1219	Laze v Tuhinju
00050000-55da-ef88-34f0-feaa1018aacf	2230	Lenart v Slovenskih goricah
00050000-55da-ef88-80dc-e2bb395891fd	9220	Lendava/Lendva
00050000-55da-ef88-229e-51f84ae039bb	4248	Lesce
00050000-55da-ef88-3c01-3096b2c41389	3261	Lesično
00050000-55da-ef88-7a47-2d3fe521ed25	8273	Leskovec pri Krškem
00050000-55da-ef88-f93d-0a9cc88afc21	2372	Libeliče
00050000-55da-ef88-f84c-0ddeb5eef34d	2341	Limbuš
00050000-55da-ef88-535a-527f5cd6d1a0	1270	Litija
00050000-55da-ef88-4925-f403733aa916	3202	Ljubečna
00050000-55da-ef88-28ad-3ef264d7e66c	1000	Ljubljana 
00050000-55da-ef88-737c-9910aaa4d99e	1001	Ljubljana - poštni predali
00050000-55da-ef88-10ba-5155adf324fc	1231	Ljubljana - Črnuče
00050000-55da-ef88-0716-316dd8617dbc	1261	Ljubljana - Dobrunje
00050000-55da-ef88-276a-82d5a9db3d40	1260	Ljubljana - Polje
00050000-55da-ef88-c786-97815a4364ea	1210	Ljubljana - Šentvid
00050000-55da-ef88-ae17-0b026cf43074	1211	Ljubljana - Šmartno
00050000-55da-ef88-9a2c-3b4e99b19e50	3333	Ljubno ob Savinji
00050000-55da-ef88-1087-c1c6d1ca5551	9240	Ljutomer
00050000-55da-ef88-36ff-64c32f89289d	3215	Loče
00050000-55da-ef88-8cc1-136dd603aa1b	5231	Log pod Mangartom
00050000-55da-ef88-716a-ea68619c413d	1358	Log pri Brezovici
00050000-55da-ef88-cbb7-72d6537a597e	1370	Logatec
00050000-55da-ef88-1c04-85473edf2f85	1371	Logatec
00050000-55da-ef88-b4a4-f88ff1157c00	1434	Loka pri Zidanem Mostu
00050000-55da-ef88-dee8-9e2acac509f2	3223	Loka pri Žusmu
00050000-55da-ef88-ba2c-ac2acce9d83c	6219	Lokev
00050000-55da-ef88-8518-396b256a5b28	1318	Loški Potok
00050000-55da-ef88-dc04-531b7c0b26db	2324	Lovrenc na Dravskem polju
00050000-55da-ef88-7b36-58484e7de767	2344	Lovrenc na Pohorju
00050000-55da-ef88-d960-3b34ef3f9016	3334	Luče
00050000-55da-ef88-69fc-d358a7096e26	1225	Lukovica
00050000-55da-ef88-b82c-5127698df4f4	9202	Mačkovci
00050000-55da-ef88-a054-9efd5843360e	2322	Majšperk
00050000-55da-ef88-d527-2653cf6fc7a6	2321	Makole
00050000-55da-ef88-d062-0bc7f2651d73	9243	Mala Nedelja
00050000-55da-ef88-ff4a-5ae46c04aa9d	2229	Malečnik
00050000-55da-ef88-f95e-bb47589a5e79	6273	Marezige
00050000-55da-ef88-099b-07a6acda2968	2000	Maribor 
00050000-55da-ef88-a068-64299045e881	2001	Maribor - poštni predali
00050000-55da-ef88-2b7f-3cc53cf4b894	2206	Marjeta na Dravskem polju
00050000-55da-ef88-4ceb-990b364295a4	2281	Markovci
00050000-55da-ef88-2311-45706605be0a	9221	Martjanci
00050000-55da-ef88-2341-cdd35466198f	6242	Materija
00050000-55da-ef88-1547-3a127e737305	4211	Mavčiče
00050000-55da-ef88-a76f-58251ed3f56d	1215	Medvode
00050000-55da-ef88-a359-9171ffda7ef4	1234	Mengeš
00050000-55da-ef88-d90b-489e75e078cc	8330	Metlika
00050000-55da-ef88-a087-a26d5e873244	2392	Mežica
00050000-55da-ef88-7e1a-6309596760c5	2204	Miklavž na Dravskem polju
00050000-55da-ef88-69b6-12f5dec7e8a9	2275	Miklavž pri Ormožu
00050000-55da-ef88-d563-7bb77d994670	5291	Miren
00050000-55da-ef88-c280-f51e51640d26	8233	Mirna
00050000-55da-ef88-8f14-180490189b35	8216	Mirna Peč
00050000-55da-ef88-b6df-55b44f2e9c03	2382	Mislinja
00050000-55da-ef88-ae44-dafd580fdd94	4281	Mojstrana
00050000-55da-ef88-71e1-237edabde7ee	8230	Mokronog
00050000-55da-ef88-9feb-ac18fbcd6c0b	1251	Moravče
00050000-55da-ef88-3afd-4294575d360a	9226	Moravske Toplice
00050000-55da-ef88-94cc-68fed608988a	5216	Most na Soči
00050000-55da-ef88-4e8a-a737b5198da0	1221	Motnik
00050000-55da-ef88-7bf9-16e364b67f42	3330	Mozirje
00050000-55da-ef88-3ef7-35f201061fff	9000	Murska Sobota 
00050000-55da-ef88-357a-1f999eaa90a0	9001	Murska Sobota - poštni predali
00050000-55da-ef88-095f-7c7e72d417da	2366	Muta
00050000-55da-ef88-1ff6-237ac8f208f4	4202	Naklo
00050000-55da-ef88-0707-698e1c79231f	3331	Nazarje
00050000-55da-ef88-c545-0e52a499eabc	1357	Notranje Gorice
00050000-55da-ef88-78f8-1956b60fad24	3203	Nova Cerkev
00050000-55da-ef88-3dc1-759aa23f8d0c	5000	Nova Gorica 
00050000-55da-ef88-9614-da2648ffd8af	5001	Nova Gorica - poštni predali
00050000-55da-ef88-5756-28e262af7115	1385	Nova vas
00050000-55da-ef88-fd0b-23550d5e67ff	8000	Novo mesto
00050000-55da-ef88-d986-ee61998c24d2	8001	Novo mesto - poštni predali
00050000-55da-ef88-efb0-bddfbd10b401	6243	Obrov
00050000-55da-ef88-52d3-4d52d4ee5d65	9233	Odranci
00050000-55da-ef88-737b-43cc4a26aff4	2317	Oplotnica
00050000-55da-ef88-e61b-026ad1ec593d	2312	Orehova vas
00050000-55da-ef88-7901-0cb6ab71a23f	2270	Ormož
00050000-55da-ef88-f805-555e91b6c592	1316	Ortnek
00050000-55da-ef88-acb1-1c0fa2e16fb1	1337	Osilnica
00050000-55da-ef88-7ba1-881d528da59f	8222	Otočec
00050000-55da-ef88-bafe-e84c05c272e9	2361	Ožbalt
00050000-55da-ef88-a5e8-7f9955bec992	2231	Pernica
00050000-55da-ef88-61d0-10a055b09c7d	2211	Pesnica pri Mariboru
00050000-55da-ef88-e569-f260f4a0301b	9203	Petrovci
00050000-55da-ef88-9a2b-8f1cba67bc58	3301	Petrovče
00050000-55da-ef88-4a2f-dfe84f3b191b	6330	Piran/Pirano
00050000-55da-ef88-a676-01375bdb7238	8255	Pišece
00050000-55da-ef88-6927-3e5d9af12bb2	6257	Pivka
00050000-55da-ef88-a454-4b70200cccf8	6232	Planina
00050000-55da-ef88-96a1-2d333c7fc471	3225	Planina pri Sevnici
00050000-55da-ef88-4e8c-fe92f58abaa3	6276	Pobegi
00050000-55da-ef88-efff-e8de1699fcae	8312	Podbočje
00050000-55da-ef88-62dc-888684021fe5	5243	Podbrdo
00050000-55da-ef88-cccc-f69d77753abc	3254	Podčetrtek
00050000-55da-ef88-2b1b-e3d3a7141d3f	2273	Podgorci
00050000-55da-ef88-bdfc-319902c11bb0	6216	Podgorje
00050000-55da-ef88-ca95-c83576591c61	2381	Podgorje pri Slovenj Gradcu
00050000-55da-ef88-733c-834c5b85f0c6	6244	Podgrad
00050000-55da-ef88-489b-22281db666b7	1414	Podkum
00050000-55da-ef88-89e2-d00ca63dc71f	2286	Podlehnik
00050000-55da-ef88-7e8c-ac045a17ff2c	5272	Podnanos
00050000-55da-ef88-c704-eeb530021984	4244	Podnart
00050000-55da-ef88-3283-2829dd34b92d	3241	Podplat
00050000-55da-ef88-50d8-c04c7a1f4ba1	3257	Podsreda
00050000-55da-ef88-3393-06d4e4568ea3	2363	Podvelka
00050000-55da-ef88-790d-e976b9cb1422	2208	Pohorje
00050000-55da-ef88-1109-dec17ab46e4b	2257	Polenšak
00050000-55da-ef88-b825-380552e0ee84	1355	Polhov Gradec
00050000-55da-ef88-9da5-dc7b3b2aa86f	4223	Poljane nad Škofjo Loko
00050000-55da-ef88-1a0a-9f3ee5a73d9e	2319	Poljčane
00050000-55da-ef88-c6ab-7b6674e453bc	1272	Polšnik
00050000-55da-ef88-05e8-850f51765905	3313	Polzela
00050000-55da-ef88-5658-6284b47468ef	3232	Ponikva
00050000-55da-ef88-e65f-d1805c3c4b45	6320	Portorož/Portorose
00050000-55da-ef88-7aae-3c44a5a7a9bb	6230	Postojna
00050000-55da-ef88-c4f4-ead660c42c9a	2331	Pragersko
00050000-55da-ef88-1d65-d9915b8b7f3b	3312	Prebold
00050000-55da-ef88-2234-ca02111f84b3	4205	Preddvor
00050000-55da-ef88-3d9e-bd68eeacb26d	6255	Prem
00050000-55da-ef88-7e61-7ec46c7820e2	1352	Preserje
00050000-55da-ef88-cf77-aad5e0317b11	6258	Prestranek
00050000-55da-ef88-25df-e702e7611080	2391	Prevalje
00050000-55da-ef88-488b-18d77b2e9bd4	3262	Prevorje
00050000-55da-ef88-8c9e-0f55cad6f0dd	1276	Primskovo 
00050000-55da-ef88-0e79-9e45f0176c4e	3253	Pristava pri Mestinju
00050000-55da-ef88-3bcb-ae0c57869b5b	9207	Prosenjakovci/Partosfalva
00050000-55da-ef88-4f99-9a5fc0a0355d	5297	Prvačina
00050000-55da-ef88-632d-f71b57c78f20	2250	Ptuj
00050000-55da-ef88-c8db-d1428c23af96	2323	Ptujska Gora
00050000-55da-ef88-fe91-f62b746db75c	9201	Puconci
00050000-55da-ef88-8b1b-1fe18f8725ad	2327	Rače
00050000-55da-ef88-11b3-7f708dbb44df	1433	Radeče
00050000-55da-ef88-0cc0-49064fd8b3e4	9252	Radenci
00050000-55da-ef88-91f5-7749b3fd849c	2360	Radlje ob Dravi
00050000-55da-ef88-d62b-632b4574e863	1235	Radomlje
00050000-55da-ef88-cf3a-b9e90ae0868a	4240	Radovljica
00050000-55da-ef88-d862-5c6d4b7674c2	8274	Raka
00050000-55da-ef88-866a-15b674517eb8	1381	Rakek
00050000-55da-ef88-739c-d108efe83b72	4283	Rateče - Planica
00050000-55da-ef88-4fee-40a7b7cf7e0f	2390	Ravne na Koroškem
00050000-55da-ef88-fbe1-313b91ef48c4	9246	Razkrižje
00050000-55da-ef88-3906-7deedce49190	3332	Rečica ob Savinji
00050000-55da-ef88-7e02-d08a965518de	5292	Renče
00050000-55da-ef88-4f3a-afbe751fbab8	1310	Ribnica
00050000-55da-ef88-910e-70d56c82d3cf	2364	Ribnica na Pohorju
00050000-55da-ef88-7a4d-1bf0b3b01e2f	3272	Rimske Toplice
00050000-55da-ef88-36ac-a4fd119ae758	1314	Rob
00050000-55da-ef88-e501-50e92f5595f2	5215	Ročinj
00050000-55da-ef88-a7aa-d7a344554b12	3250	Rogaška Slatina
00050000-55da-ef88-7629-d0646f6f9867	9262	Rogašovci
00050000-55da-ef88-c768-6567f32f77f2	3252	Rogatec
00050000-55da-ef88-918c-9908f9230bea	1373	Rovte
00050000-55da-ef88-a0ae-c412548b2f82	2342	Ruše
00050000-55da-ef88-a559-ed7d3b1a0a1d	1282	Sava
00050000-55da-ef88-9ffa-10c87aa466ac	6333	Sečovlje/Sicciole
00050000-55da-ef88-4dbe-c9f70356e812	4227	Selca
00050000-55da-ef88-7165-a8db689c4693	2352	Selnica ob Dravi
00050000-55da-ef88-7e27-f566a8e99a45	8333	Semič
00050000-55da-ef88-bce1-bd72160d9870	8281	Senovo
00050000-55da-ef88-8371-5dec6988fea3	6224	Senožeče
00050000-55da-ef88-fed6-3e604b63f266	8290	Sevnica
00050000-55da-ef88-4759-93d1994a43e1	6210	Sežana
00050000-55da-ef88-f5a1-5d6982c39bcc	2214	Sladki Vrh
00050000-55da-ef88-0a33-acb973e84e60	5283	Slap ob Idrijci
00050000-55da-ef88-57aa-97a4bd31dd0d	2380	Slovenj Gradec
00050000-55da-ef88-62a7-fc1d8bab75ec	2310	Slovenska Bistrica
00050000-55da-ef88-a37f-cedab8875a89	3210	Slovenske Konjice
00050000-55da-ef88-a07f-607d23134ce4	1216	Smlednik
00050000-55da-ef88-9903-6ea65e950086	5232	Soča
00050000-55da-ef88-4d4d-a26da8a7bfe3	1317	Sodražica
00050000-55da-ef88-038b-5777c6c419ed	3335	Solčava
00050000-55da-ef88-995c-ce62c97bc01a	5250	Solkan
00050000-55da-ef88-a5ec-bef3c4407fd1	4229	Sorica
00050000-55da-ef88-bd4e-a681d2eac611	4225	Sovodenj
00050000-55da-ef88-e496-b24805dccc6d	5281	Spodnja Idrija
00050000-55da-ef88-1fcb-f47650a48a46	2241	Spodnji Duplek
00050000-55da-ef88-aadf-4267df993c9b	9245	Spodnji Ivanjci
00050000-55da-ef88-75d6-9235f7419518	2277	Središče ob Dravi
00050000-55da-ef88-15e4-03753b8e1c9f	4267	Srednja vas v Bohinju
00050000-55da-ef88-2fdd-b08999095caa	8256	Sromlje 
00050000-55da-ef88-4fe2-beca05f84e98	5224	Srpenica
00050000-55da-ef88-0e37-95b9966f2e10	1242	Stahovica
00050000-55da-ef88-8034-9a5309ae0614	1332	Stara Cerkev
00050000-55da-ef88-9490-25917b54bb90	8342	Stari trg ob Kolpi
00050000-55da-ef88-2c66-276f25ad6498	1386	Stari trg pri Ložu
00050000-55da-ef88-2b70-caad5e7bda93	2205	Starše
00050000-55da-ef88-92b9-04e05ad9aa8d	2289	Stoperce
00050000-55da-ef88-47bb-b169d1eec636	8322	Stopiče
00050000-55da-ef88-71bb-b97648b23911	3206	Stranice
00050000-55da-ef88-c43a-49eb13ab81d9	8351	Straža
00050000-55da-ef88-ace1-b5bfc46d5053	1313	Struge
00050000-55da-ef88-c59a-ed5ae011c07d	8293	Studenec
00050000-55da-ef88-6528-c7d184fe014c	8331	Suhor
00050000-55da-ef88-8164-d9f51e7d7567	2233	Sv. Ana v Slovenskih goricah
00050000-55da-ef88-ae3f-a47a94256d05	2235	Sv. Trojica v Slovenskih goricah
00050000-55da-ef88-b33d-7d8dc84db438	2353	Sveti Duh na Ostrem Vrhu
00050000-55da-ef88-8249-90dc60f6ad3e	9244	Sveti Jurij ob Ščavnici
00050000-55da-ef88-e945-fab5374da2e7	3264	Sveti Štefan
00050000-55da-ef88-2b42-2a451a3b58fa	2258	Sveti Tomaž
00050000-55da-ef88-9ef5-112f359f65da	9204	Šalovci
00050000-55da-ef88-6c11-0863fd71236f	5261	Šempas
00050000-55da-ef88-ba06-dea1950d6819	5290	Šempeter pri Gorici
00050000-55da-ef88-1f4c-ace9143f06a7	3311	Šempeter v Savinjski dolini
00050000-55da-ef88-5759-c803a809ba28	4208	Šenčur
00050000-55da-ef88-8446-05d0ad0c5194	2212	Šentilj v Slovenskih goricah
00050000-55da-ef88-9f8c-0dd7ff74633f	8297	Šentjanž
00050000-55da-ef88-8f2f-541561ebecc7	2373	Šentjanž pri Dravogradu
00050000-55da-ef88-92c2-29cc025ea5a7	8310	Šentjernej
00050000-55da-ef88-0dba-7adb5b00159e	3230	Šentjur
00050000-55da-ef88-b36d-a854745f9c6f	3271	Šentrupert
00050000-55da-ef88-8650-9dd5a9600616	8232	Šentrupert
00050000-55da-ef88-5898-1b73bfe16036	1296	Šentvid pri Stični
00050000-55da-ef88-147d-901b9c2f12ba	8275	Škocjan
00050000-55da-ef88-e7c5-c664577ce90f	6281	Škofije
00050000-55da-ef88-a0d5-80e853a5f7e1	4220	Škofja Loka
00050000-55da-ef88-a89d-e2d6d9c6e0ac	3211	Škofja vas
00050000-55da-ef88-49ad-a5da1a96ec65	1291	Škofljica
00050000-55da-ef88-9151-51add2d77669	6274	Šmarje
00050000-55da-ef88-242e-ebd51cc63b5d	1293	Šmarje - Sap
00050000-55da-ef88-8fb2-bb7a5e294572	3240	Šmarje pri Jelšah
00050000-55da-ef88-db2c-eb9415b90d11	8220	Šmarješke Toplice
00050000-55da-ef88-b697-109e830795e1	2315	Šmartno na Pohorju
00050000-55da-ef88-724d-1fb6ff4824d7	3341	Šmartno ob Dreti
00050000-55da-ef88-951c-0ebc5bf6ff2e	3327	Šmartno ob Paki
00050000-55da-ef88-1de7-86aa502d4f7f	1275	Šmartno pri Litiji
00050000-55da-ef88-af63-9f4e5f77fcde	2383	Šmartno pri Slovenj Gradcu
00050000-55da-ef88-05db-775173384970	3201	Šmartno v Rožni dolini
00050000-55da-ef88-69a0-3012186276ac	3325	Šoštanj
00050000-55da-ef88-82db-b8b8158a12c1	6222	Štanjel
00050000-55da-ef88-47d5-e92d1a1d8b86	3220	Štore
00050000-55da-ef88-ce8d-25b4df50df77	3304	Tabor
00050000-55da-ef88-4dcf-0ea8ce285321	3221	Teharje
00050000-55da-ef88-f403-40aebf96c0b6	9251	Tišina
00050000-55da-ef88-49e1-f6cb93af5c78	5220	Tolmin
00050000-55da-ef88-e869-f5c7504f8576	3326	Topolšica
00050000-55da-ef88-e9eb-cf600f579449	2371	Trbonje
00050000-55da-ef88-6e42-8f888a95ad8a	1420	Trbovlje
00050000-55da-ef88-f54d-cae50df20d55	8231	Trebelno 
00050000-55da-ef88-0066-049b27b9421b	8210	Trebnje
00050000-55da-ef88-92f6-90003f1a0fa6	5252	Trnovo pri Gorici
00050000-55da-ef88-a3d1-c78855917a9e	2254	Trnovska vas
00050000-55da-ef88-cfcf-81fdfb9798ab	1222	Trojane
00050000-55da-ef88-fd77-b4da48f096f0	1236	Trzin
00050000-55da-ef88-89e0-05a3773b1888	4290	Tržič
00050000-55da-ef88-eaa9-75b3175cb560	8295	Tržišče
00050000-55da-ef88-bb67-2bcc5084f64e	1311	Turjak
00050000-55da-ef88-e53b-1e611652367a	9224	Turnišče
00050000-55da-ef88-76f0-95fd37411378	8323	Uršna sela
00050000-55da-ef88-3c68-9d1d7dd01470	1252	Vače
00050000-55da-ef88-229f-6fe6b64964ac	3320	Velenje 
00050000-55da-ef88-2419-9aa929be507b	3322	Velenje - poštni predali
00050000-55da-ef88-bd97-954dc608162a	8212	Velika Loka
00050000-55da-ef88-ac41-e9682e0b8747	2274	Velika Nedelja
00050000-55da-ef88-ea70-813007200a9a	9225	Velika Polana
00050000-55da-ef88-c2f0-ee506400b503	1315	Velike Lašče
00050000-55da-ef88-2de8-126438528b06	8213	Veliki Gaber
00050000-55da-ef88-b4ce-2871b06926ff	9241	Veržej
00050000-55da-ef88-f645-bf6a6cc412a3	1312	Videm - Dobrepolje
00050000-55da-ef88-5af4-d57a1c81b654	2284	Videm pri Ptuju
00050000-55da-ef88-65f5-a48ac09729ea	8344	Vinica
00050000-55da-ef88-2fb8-f7c1bbe73e74	5271	Vipava
00050000-55da-ef88-4f6a-bb88ef48244e	4212	Visoko
00050000-55da-ef88-f7e5-d0b9d25a60c9	1294	Višnja Gora
00050000-55da-ef88-1307-61c695df69cd	3205	Vitanje
00050000-55da-ef88-9128-cf4f3f54bc82	2255	Vitomarci
00050000-55da-ef88-ab64-9b14721497cd	1217	Vodice
00050000-55da-ef88-2509-a55ff7437119	3212	Vojnik\t
00050000-55da-ef88-0bce-5e23edd40ee1	5293	Volčja Draga
00050000-55da-ef88-61d9-cc034cf60d88	2232	Voličina
00050000-55da-ef88-1ef2-e60c46998a88	3305	Vransko
00050000-55da-ef88-4223-16cd87cd3ee8	6217	Vremski Britof
00050000-55da-ef88-29bd-acb6ad16e8ad	1360	Vrhnika
00050000-55da-ef88-e0e1-22bcfe60796a	2365	Vuhred
00050000-55da-ef88-4517-2d3cfa6bb4ea	2367	Vuzenica
00050000-55da-ef88-37bf-fb24a10a70c3	8292	Zabukovje 
00050000-55da-ef88-da75-1dfd6777cecf	1410	Zagorje ob Savi
00050000-55da-ef88-dc0f-ca08b2226383	1303	Zagradec
00050000-55da-ef88-a96c-d4261881dda8	2283	Zavrč
00050000-55da-ef88-c150-f1ff6d1cc216	8272	Zdole 
00050000-55da-ef88-443d-405138af361e	4201	Zgornja Besnica
00050000-55da-ef88-d96f-e2850419098e	2242	Zgornja Korena
00050000-55da-ef88-4a75-70a033549bd4	2201	Zgornja Kungota
00050000-55da-ef88-b49f-3754a19c3415	2316	Zgornja Ložnica
00050000-55da-ef88-1aa2-2cc6d6890189	2314	Zgornja Polskava
00050000-55da-ef88-a57a-e9eddf4958a0	2213	Zgornja Velka
00050000-55da-ef88-0270-be7b1d591d2c	4247	Zgornje Gorje
00050000-55da-ef88-53a4-d4106e806abe	4206	Zgornje Jezersko
00050000-55da-ef88-726a-ef622ab910e2	2285	Zgornji Leskovec
00050000-55da-ef88-8c40-e339f9dc050f	1432	Zidani Most
00050000-55da-ef88-8e30-53800145cb54	3214	Zreče
00050000-55da-ef88-4a97-786ee5a003e3	4209	Žabnica
00050000-55da-ef88-dedf-aba053b516ed	3310	Žalec
00050000-55da-ef88-7804-16c9ca72a9a1	4228	Železniki
00050000-55da-ef88-247c-cc7887a8e6c9	2287	Žetale
00050000-55da-ef88-afee-17338369ffd1	4226	Žiri
00050000-55da-ef88-b15a-e2afbd256192	4274	Žirovnica
00050000-55da-ef88-db17-e6871e390224	8360	Žužemberk
\.


--
-- TOC entry 2918 (class 0 OID 15291135)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 15290942)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 15291020)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 15291147)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2943 (class 0 OID 15291483)
-- Dependencies: 225
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2944 (class 0 OID 15291493)
-- Dependencies: 226
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55da-ef8a-9c53-799cc17d5e19	00080000-55da-ef8a-74c0-af6de3456136	0900	AK
00190000-55da-ef8a-e71e-736fdfdf1a2f	00080000-55da-ef89-af6b-5bd1397b18e0	0987	AK
00190000-55da-ef8a-05b7-25222d3e4d6a	00080000-55da-ef89-96b2-cfe2e43bd2bb	0989	AK
00190000-55da-ef8a-9ef3-3b05571ad368	00080000-55da-ef89-4291-b13cb15e3904	0986	AK
00190000-55da-ef8a-46fa-254c5be1e1ea	00080000-55da-ef89-fc89-63b9be01beb6	0984	AK
00190000-55da-ef8a-f7ff-88923244296d	00080000-55da-ef89-5fe7-e42b7e44e745	0983	AK
00190000-55da-ef8a-6042-75168a90e375	00080000-55da-ef89-c63a-fb02d250fcf9	0982	AK
\.


--
-- TOC entry 2942 (class 0 OID 15291439)
-- Dependencies: 224
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55da-ef8a-b8f2-e4c2e3b7db19	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2945 (class 0 OID 15291501)
-- Dependencies: 227
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2924 (class 0 OID 15291176)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55da-ef89-c4d4-4af2f4dbc902	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55da-ef89-6274-fa3bfbfb7bf5	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55da-ef89-1c3e-7adade2ec841	0003	Kazinska	t	84	Kazinska dvorana
00220000-55da-ef89-ac71-68594d2997ee	0004	Mali oder	t	24	Mali oder 
00220000-55da-ef89-dc5e-927ef6264459	0005	Komorni oder	t	15	Komorni oder
00220000-55da-ef89-e136-0a326679c2e6	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55da-ef89-f170-113bf41782d9	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2916 (class 0 OID 15291120)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2915 (class 0 OID 15291110)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 15291295)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 15291244)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 15290814)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2925 (class 0 OID 15291186)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 15290852)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55da-ef88-601f-256b4c0fcb94	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55da-ef88-54d7-67d48d6804f0	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55da-ef88-26f5-f32cf7795c2f	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55da-ef88-ce53-27cac8555a6d	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55da-ef88-40b4-9111a78478e3	planer	Planer dogodkov v koledarju	t
00020000-55da-ef88-8e42-d933478ad085	kadrovska	Kadrovska služba	t
00020000-55da-ef88-429a-18b02be44e0f	arhivar	Ažuriranje arhivalij	t
00020000-55da-ef88-0a5c-9b411616a81f	igralec	Igralec	t
00020000-55da-ef88-2aaa-c048f26c9eb9	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55da-ef89-b190-75f6e12bdf1c	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2891 (class 0 OID 15290836)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55da-ef88-ad3e-3bbe021a07e2	00020000-55da-ef88-26f5-f32cf7795c2f
00010000-55da-ef88-731c-6a83a3cf5d19	00020000-55da-ef88-26f5-f32cf7795c2f
00010000-55da-ef8a-8330-48d96fe2c00c	00020000-55da-ef89-b190-75f6e12bdf1c
\.


--
-- TOC entry 2927 (class 0 OID 15291200)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2919 (class 0 OID 15291141)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2913 (class 0 OID 15291087)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 15291542)
-- Dependencies: 232
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55da-ef88-4d31-03f845464016	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55da-ef88-99f2-f145f4322b8d	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55da-ef88-5d9c-f8dd1c64174a	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55da-ef88-3f5c-bb1ebf55147d	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55da-ef88-f51b-59da58c85e9d	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2949 (class 0 OID 15291534)
-- Dependencies: 231
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55da-ef88-2259-3b64f0a9c922	00230000-55da-ef88-3f5c-bb1ebf55147d	popa
00240000-55da-ef88-07cb-c1e9e5af933a	00230000-55da-ef88-3f5c-bb1ebf55147d	oseba
00240000-55da-ef88-72a7-48552e1928c0	00230000-55da-ef88-3f5c-bb1ebf55147d	sezona
00240000-55da-ef88-9901-a3c7aad6431d	00230000-55da-ef88-99f2-f145f4322b8d	prostor
00240000-55da-ef88-d50f-4ba38f6e4976	00230000-55da-ef88-3f5c-bb1ebf55147d	besedilo
00240000-55da-ef88-0e8a-81042b92bd03	00230000-55da-ef88-3f5c-bb1ebf55147d	uprizoritev
00240000-55da-ef88-7a9b-9bee37345e14	00230000-55da-ef88-3f5c-bb1ebf55147d	funkcija
00240000-55da-ef88-6341-dafd31c0d08d	00230000-55da-ef88-3f5c-bb1ebf55147d	tipfunkcije
00240000-55da-ef88-6ff9-a9c80f9df59d	00230000-55da-ef88-3f5c-bb1ebf55147d	alternacija
00240000-55da-ef88-368a-079094d6bd94	00230000-55da-ef88-4d31-03f845464016	pogodba
00240000-55da-ef88-a472-7d525821beb8	00230000-55da-ef88-3f5c-bb1ebf55147d	zaposlitev
00240000-55da-ef88-8779-0950017dbb54	00230000-55da-ef88-4d31-03f845464016	programdela
00240000-55da-ef88-cf4e-ac7a3266c668	00230000-55da-ef88-3f5c-bb1ebf55147d	zapis
\.


--
-- TOC entry 2948 (class 0 OID 15291529)
-- Dependencies: 230
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 15291254)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55da-ef8a-43e1-0c9ccb6896f2	000e0000-55da-ef8a-3560-c8d9213e49b6	00080000-55da-ef89-218e-6c0a1ea03747	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55da-ef8a-650b-9bb27c65d9db	000e0000-55da-ef8a-3560-c8d9213e49b6	00080000-55da-ef89-218e-6c0a1ea03747	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55da-ef8a-63d2-25f7aee2c783	000e0000-55da-ef8a-3560-c8d9213e49b6	00080000-55da-ef89-7de8-5fd11accf236	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2898 (class 0 OID 15290914)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2914 (class 0 OID 15291097)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55da-ef8a-8262-4ad7ba26c8b1	00180000-55da-ef8a-4885-e0bfa92b73b2	000c0000-55da-ef8a-2aa7-fac947ddea7b	00090000-55da-ef8a-845f-df38186192be	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55da-ef8a-88df-572d26fba6b0	00180000-55da-ef8a-4885-e0bfa92b73b2	000c0000-55da-ef8a-4c35-6cf128c25e26	00090000-55da-ef8a-9207-202020c5f578	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55da-ef8a-31d3-e0b37fa7f467	00180000-55da-ef8a-4885-e0bfa92b73b2	000c0000-55da-ef8a-2b72-2685049cc50a	00090000-55da-ef8a-022b-61b51a145ddf	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55da-ef8a-9332-03c9cb7b69e0	00180000-55da-ef8a-4885-e0bfa92b73b2	000c0000-55da-ef8a-ca7f-5cc979c10a96	00090000-55da-ef8a-e275-79a54344eea5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55da-ef8a-8bfa-a69d97a48f0d	00180000-55da-ef8a-4885-e0bfa92b73b2	000c0000-55da-ef8a-f559-d6334dc4e073	00090000-55da-ef8a-c1dc-4fd3a228f4ee	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55da-ef8a-6244-ffcd04967eeb	00180000-55da-ef8a-4574-ccac878c0651	\N	00090000-55da-ef8a-c1dc-4fd3a228f4ee	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2934 (class 0 OID 15291284)
-- Dependencies: 216
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55da-ef88-f35d-fd364da3e639	Avtor	Avtorji	Avtorka	umetnik
000f0000-55da-ef88-6934-1545393ebcfe	Priredba	Priredba	Priredba	umetnik
000f0000-55da-ef88-3d32-29f2fe390b6d	Prevod	Prevod	Prevod	umetnik
000f0000-55da-ef88-809d-434a938e0ad0	Režija	Režija	Režija	umetnik
000f0000-55da-ef88-f201-9348c0485c58	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55da-ef88-d5b3-88359244729c	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55da-ef88-1ff5-5062e8b72317	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55da-ef88-6844-6c29bbcaa4ab	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55da-ef88-1327-a6800ba4b200	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55da-ef88-2526-7940c3d3d316	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55da-ef88-2064-60082c51acec	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55da-ef88-4b9e-7bd049b7e396	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55da-ef88-54d6-c24685065cd4	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55da-ef88-c30d-162847ef0d0e	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55da-ef88-c44b-898be71b7430	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55da-ef88-52eb-6e51eecf1eeb	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55da-ef88-fc42-5c0ebd892d44	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55da-ef88-b80f-96bf4c0a8742	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2946 (class 0 OID 15291511)
-- Dependencies: 228
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55da-ef88-a457-d49080645d67	01	Velika predstava	f	1.00	1.00
002b0000-55da-ef88-86f6-1ba38326333a	02	Mala predstava	f	0.50	0.50
002b0000-55da-ef88-ad1d-3fb274835d82	03	Mala koprodukcija	t	0.40	1.00
002b0000-55da-ef88-5e2d-4f09a611b455	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55da-ef88-4fc8-4db8a549b049	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2903 (class 0 OID 15290977)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 15290823)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55da-ef88-731c-6a83a3cf5d19	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROCLd4kodAL9qnfEsU8cMfh8WvZPcIUk6	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55da-ef89-916a-9591b830f145	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55da-ef89-d8a1-3e9f1daa507d	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55da-ef8a-d82a-a719f142a3ab	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55da-ef8a-dbca-f6ff65a00937	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55da-ef8a-214d-2f60525a0cf6	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55da-ef8a-20fc-78576e836dbf	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55da-ef8a-1b33-a0593aa0bb0d	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55da-ef8a-8e95-0aa7bf9ccf0d	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55da-ef8a-b7a1-f56a23743d9f	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55da-ef8a-8330-48d96fe2c00c	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55da-ef88-ad3e-3bbe021a07e2	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2938 (class 0 OID 15291332)
-- Dependencies: 220
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55da-ef8a-ffe7-d32fb89e6aa9	00160000-55da-ef89-7f2d-814fbb7c76f0	00150000-55da-ef88-4c70-3bbf4f60b4a6	00140000-55da-ef87-ea45-f685a2ba390a	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55da-ef89-dc5e-927ef6264459
000e0000-55da-ef8a-3560-c8d9213e49b6	00160000-55da-ef89-a49b-7f48134c0ff5	00150000-55da-ef88-74b5-8db2536d7d3c	00140000-55da-ef87-2253-2e5be5866b20	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55da-ef89-e136-0a326679c2e6
000e0000-55da-ef8a-e6fb-c37cd845fc5c	\N	00150000-55da-ef88-74b5-8db2536d7d3c	00140000-55da-ef87-2253-2e5be5866b20	00190000-55da-ef8a-e71e-736fdfdf1a2f	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55da-ef89-dc5e-927ef6264459
000e0000-55da-ef8a-a78c-031eaf12e97d	\N	00150000-55da-ef88-74b5-8db2536d7d3c	00140000-55da-ef87-2253-2e5be5866b20	00190000-55da-ef8a-e71e-736fdfdf1a2f	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55da-ef89-dc5e-927ef6264459
000e0000-55da-ef8a-d860-a32edab33584	\N	00150000-55da-ef88-74b5-8db2536d7d3c	00140000-55da-ef87-2253-2e5be5866b20	00190000-55da-ef8a-e71e-736fdfdf1a2f	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55da-ef89-c4d4-4af2f4dbc902
000e0000-55da-ef8a-bf46-254298dd4641	\N	00150000-55da-ef88-74b5-8db2536d7d3c	00140000-55da-ef87-2253-2e5be5866b20	00190000-55da-ef8a-e71e-736fdfdf1a2f	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f		00220000-55da-ef89-c4d4-4af2f4dbc902
\.


--
-- TOC entry 2908 (class 0 OID 15291039)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55da-ef8a-557a-a5a8a0cf5492	000e0000-55da-ef8a-3560-c8d9213e49b6	1	
00200000-55da-ef8a-6f40-1e55ab869753	000e0000-55da-ef8a-3560-c8d9213e49b6	2	
\.


--
-- TOC entry 2923 (class 0 OID 15291168)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 15291581)
-- Dependencies: 234
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 15291553)
-- Dependencies: 233
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 15291593)
-- Dependencies: 235
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 15291237)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55da-ef8a-2afb-16d33520d942	00090000-55da-ef8a-9207-202020c5f578	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55da-ef8a-7c6a-3f069216324c	00090000-55da-ef8a-022b-61b51a145ddf	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55da-ef8a-1715-c5b161cd993a	00090000-55da-ef8a-756b-fd9fa981131a	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55da-ef8a-b20c-6b185701ad95	00090000-55da-ef8a-412e-0650f373392f	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55da-ef8a-0f89-4a4582ab82f0	00090000-55da-ef8a-845f-df38186192be	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55da-ef8a-8f40-14c39c28e105	00090000-55da-ef8a-2ca9-51f46e054421	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2910 (class 0 OID 15291071)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 15291322)
-- Dependencies: 219
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55da-ef87-ea45-f685a2ba390a	01	Drama	drama (SURS 01)
00140000-55da-ef87-c1f4-5df5318cc4e4	02	Opera	opera (SURS 02)
00140000-55da-ef87-10c9-2ab6e23b5750	03	Balet	balet (SURS 03)
00140000-55da-ef87-8caa-d028f3005ab7	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55da-ef87-a8b7-a1335ef51014	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55da-ef87-2253-2e5be5866b20	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55da-ef87-1a2d-55fbd5bb0be0	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2929 (class 0 OID 15291227)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55da-ef88-657d-1c2acedab5b1	01	Opera	opera
00150000-55da-ef88-5f95-cb441470a6ca	02	Opereta	opereta
00150000-55da-ef88-4ddd-008d568e815b	03	Balet	balet
00150000-55da-ef88-0b18-c2f5fff07ed2	04	Plesne prireditve	plesne prireditve
00150000-55da-ef88-bf82-32b808fdbdaa	05	Lutkovno gledališče	lutkovno gledališče
00150000-55da-ef88-9dbf-3df7009aae59	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55da-ef88-5efd-81e3bd06efeb	07	Biografska drama	biografska drama
00150000-55da-ef88-4c70-3bbf4f60b4a6	08	Komedija	komedija
00150000-55da-ef88-543a-19f25608d25e	09	Črna komedija	črna komedija
00150000-55da-ef88-7302-7668e6f9526a	10	E-igra	E-igra
00150000-55da-ef88-74b5-8db2536d7d3c	11	Kriminalka	kriminalka
00150000-55da-ef88-dfb4-e51572c096ef	12	Musical	musical
\.


--
-- TOC entry 2440 (class 2606 OID 15290877)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 15291379)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 15291369)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 15291283)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 15291633)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 15291061)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 15291086)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 15291527)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 15291003)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 15291433)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 15291223)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 15291037)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 15291080)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 15291017)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 15291133)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 15291610)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 15291617)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2681 (class 2606 OID 15291641)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 15291160)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 15290975)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2444 (class 2606 OID 15290886)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2447 (class 2606 OID 15290910)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 15290866)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2431 (class 2606 OID 15290851)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 15291166)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 15291199)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 15291317)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 15290939)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 15290963)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 15291139)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 15290953)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 15291024)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 15291151)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 15291490)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 15291498)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 15291481)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 15291509)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 15291183)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 15291124)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 15291115)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 15291305)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 15291251)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 15290822)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 15291190)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 15290840)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2433 (class 2606 OID 15290860)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 15291208)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 15291146)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 15291095)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 15291551)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 15291539)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 15291533)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 15291264)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2453 (class 2606 OID 15290919)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 15291106)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 15291294)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 15291521)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 15290988)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 15290835)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 15291348)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 15291046)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 15291174)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 15291591)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 15291575)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 15291599)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 15291242)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 15291075)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 15291330)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 15291235)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 1259 OID 15291068)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2581 (class 1259 OID 15291265)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2582 (class 1259 OID 15291266)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2667 (class 1259 OID 15291612)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2668 (class 1259 OID 15291611)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2454 (class 1259 OID 15290941)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2546 (class 1259 OID 15291167)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2654 (class 1259 OID 15291579)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2655 (class 1259 OID 15291578)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2656 (class 1259 OID 15291580)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2657 (class 1259 OID 15291577)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2658 (class 1259 OID 15291576)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2540 (class 1259 OID 15291153)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2541 (class 1259 OID 15291152)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2491 (class 1259 OID 15291047)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2568 (class 1259 OID 15291224)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 15291226)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2570 (class 1259 OID 15291225)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2479 (class 1259 OID 15291019)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2480 (class 1259 OID 15291018)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2637 (class 1259 OID 15291510)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2591 (class 1259 OID 15291319)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2592 (class 1259 OID 15291320)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 15291321)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2664 (class 1259 OID 15291600)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2600 (class 1259 OID 15291353)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2601 (class 1259 OID 15291350)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2602 (class 1259 OID 15291354)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2603 (class 1259 OID 15291352)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2604 (class 1259 OID 15291351)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2469 (class 1259 OID 15290990)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2470 (class 1259 OID 15290989)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2445 (class 1259 OID 15290913)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2556 (class 1259 OID 15291191)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2509 (class 1259 OID 15291081)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2435 (class 1259 OID 15290867)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2436 (class 1259 OID 15290868)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2561 (class 1259 OID 15291211)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2562 (class 1259 OID 15291210)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2563 (class 1259 OID 15291209)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2483 (class 1259 OID 15291025)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2484 (class 1259 OID 15291027)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2485 (class 1259 OID 15291026)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2647 (class 1259 OID 15291541)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2520 (class 1259 OID 15291119)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2521 (class 1259 OID 15291117)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2522 (class 1259 OID 15291116)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2523 (class 1259 OID 15291118)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2426 (class 1259 OID 15290841)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2427 (class 1259 OID 15290842)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2549 (class 1259 OID 15291175)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2677 (class 1259 OID 15291634)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2678 (class 1259 OID 15291642)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2679 (class 1259 OID 15291643)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2535 (class 1259 OID 15291140)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2577 (class 1259 OID 15291252)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2578 (class 1259 OID 15291253)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2621 (class 1259 OID 15291438)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2622 (class 1259 OID 15291437)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2623 (class 1259 OID 15291434)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2624 (class 1259 OID 15291435)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2625 (class 1259 OID 15291436)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2458 (class 1259 OID 15290955)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2459 (class 1259 OID 15290954)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2460 (class 1259 OID 15290956)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2629 (class 1259 OID 15291491)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2630 (class 1259 OID 15291492)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2614 (class 1259 OID 15291383)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2615 (class 1259 OID 15291384)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2616 (class 1259 OID 15291381)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2617 (class 1259 OID 15291382)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2574 (class 1259 OID 15291243)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 15291128)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2527 (class 1259 OID 15291127)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2528 (class 1259 OID 15291125)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2529 (class 1259 OID 15291126)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2610 (class 1259 OID 15291371)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2611 (class 1259 OID 15291370)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2626 (class 1259 OID 15291482)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2490 (class 1259 OID 15291038)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2644 (class 1259 OID 15291528)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2671 (class 1259 OID 15291618)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2672 (class 1259 OID 15291619)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2441 (class 1259 OID 15290888)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2442 (class 1259 OID 15290887)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2450 (class 1259 OID 15290920)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2451 (class 1259 OID 15290921)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2515 (class 1259 OID 15291109)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 15291108)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2517 (class 1259 OID 15291107)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2497 (class 1259 OID 15291070)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2498 (class 1259 OID 15291066)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2499 (class 1259 OID 15291063)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2500 (class 1259 OID 15291064)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2501 (class 1259 OID 15291062)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2502 (class 1259 OID 15291067)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2503 (class 1259 OID 15291065)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2457 (class 1259 OID 15290940)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2475 (class 1259 OID 15291004)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 15291006)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2477 (class 1259 OID 15291005)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2478 (class 1259 OID 15291007)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2534 (class 1259 OID 15291134)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2596 (class 1259 OID 15291318)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 15291349)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2448 (class 1259 OID 15290911)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2449 (class 1259 OID 15290912)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2571 (class 1259 OID 15291236)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2653 (class 1259 OID 15291552)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2468 (class 1259 OID 15290976)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 15291540)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2554 (class 1259 OID 15291185)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2555 (class 1259 OID 15291184)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2618 (class 1259 OID 15291380)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2465 (class 1259 OID 15290964)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 15291331)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 15291592)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2635 (class 1259 OID 15291499)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2636 (class 1259 OID 15291500)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2514 (class 1259 OID 15291096)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2434 (class 1259 OID 15290861)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2504 (class 1259 OID 15291069)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2707 (class 2606 OID 15291779)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2710 (class 2606 OID 15291764)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2709 (class 2606 OID 15291769)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2705 (class 2606 OID 15291789)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2711 (class 2606 OID 15291759)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2706 (class 2606 OID 15291784)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2708 (class 2606 OID 15291774)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2741 (class 2606 OID 15291934)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2740 (class 2606 OID 15291939)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2774 (class 2606 OID 15292109)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2775 (class 2606 OID 15292104)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2692 (class 2606 OID 15291694)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2728 (class 2606 OID 15291874)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2769 (class 2606 OID 15292089)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2770 (class 2606 OID 15292084)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2768 (class 2606 OID 15292094)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2771 (class 2606 OID 15292079)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2772 (class 2606 OID 15292074)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2726 (class 2606 OID 15291869)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2727 (class 2606 OID 15291864)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2704 (class 2606 OID 15291754)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2736 (class 2606 OID 15291904)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2734 (class 2606 OID 15291914)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2735 (class 2606 OID 15291909)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2698 (class 2606 OID 15291729)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2699 (class 2606 OID 15291724)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2724 (class 2606 OID 15291854)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2765 (class 2606 OID 15292059)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2744 (class 2606 OID 15291944)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2743 (class 2606 OID 15291949)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2742 (class 2606 OID 15291954)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2773 (class 2606 OID 15292099)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2746 (class 2606 OID 15291974)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2749 (class 2606 OID 15291959)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2745 (class 2606 OID 15291979)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2747 (class 2606 OID 15291969)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2748 (class 2606 OID 15291964)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2696 (class 2606 OID 15291719)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2697 (class 2606 OID 15291714)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2688 (class 2606 OID 15291679)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2689 (class 2606 OID 15291674)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2730 (class 2606 OID 15291884)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2712 (class 2606 OID 15291794)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2685 (class 2606 OID 15291654)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2684 (class 2606 OID 15291659)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2731 (class 2606 OID 15291899)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2732 (class 2606 OID 15291894)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2733 (class 2606 OID 15291889)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2702 (class 2606 OID 15291734)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2700 (class 2606 OID 15291744)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2701 (class 2606 OID 15291739)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2767 (class 2606 OID 15292069)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2716 (class 2606 OID 15291829)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2718 (class 2606 OID 15291819)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2719 (class 2606 OID 15291814)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2717 (class 2606 OID 15291824)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2683 (class 2606 OID 15291644)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2682 (class 2606 OID 15291649)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2729 (class 2606 OID 15291879)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2778 (class 2606 OID 15292124)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2780 (class 2606 OID 15292129)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2779 (class 2606 OID 15292134)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2725 (class 2606 OID 15291859)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2739 (class 2606 OID 15291924)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2738 (class 2606 OID 15291929)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2756 (class 2606 OID 15292034)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2757 (class 2606 OID 15292029)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2760 (class 2606 OID 15292014)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2759 (class 2606 OID 15292019)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2758 (class 2606 OID 15292024)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2694 (class 2606 OID 15291704)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2695 (class 2606 OID 15291699)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2693 (class 2606 OID 15291709)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2763 (class 2606 OID 15292044)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2762 (class 2606 OID 15292049)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2753 (class 2606 OID 15292004)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2752 (class 2606 OID 15292009)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2755 (class 2606 OID 15291994)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2754 (class 2606 OID 15291999)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2737 (class 2606 OID 15291919)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2720 (class 2606 OID 15291849)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2721 (class 2606 OID 15291844)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2723 (class 2606 OID 15291834)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2722 (class 2606 OID 15291839)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2750 (class 2606 OID 15291989)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2751 (class 2606 OID 15291984)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2761 (class 2606 OID 15292039)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2703 (class 2606 OID 15291749)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2764 (class 2606 OID 15292054)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2766 (class 2606 OID 15292064)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2777 (class 2606 OID 15292114)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2776 (class 2606 OID 15292119)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2686 (class 2606 OID 15291669)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2687 (class 2606 OID 15291664)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2691 (class 2606 OID 15291684)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2690 (class 2606 OID 15291689)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2713 (class 2606 OID 15291809)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2714 (class 2606 OID 15291804)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2715 (class 2606 OID 15291799)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-24 12:18:51 CEST

--
-- PostgreSQL database dump complete
--

