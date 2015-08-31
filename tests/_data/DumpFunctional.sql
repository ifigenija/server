--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-31 16:48:21 CEST

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
-- TOC entry 177 (class 1259 OID 16705771)
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
-- TOC entry 223 (class 1259 OID 16706287)
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
-- TOC entry 222 (class 1259 OID 16706270)
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
-- TOC entry 216 (class 1259 OID 16706180)
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
-- TOC entry 239 (class 1259 OID 16706536)
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
-- TOC entry 191 (class 1259 OID 16705949)
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
-- TOC entry 194 (class 1259 OID 16705983)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 16706438)
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
-- TOC entry 186 (class 1259 OID 16705892)
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
-- TOC entry 224 (class 1259 OID 16706300)
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
-- TOC entry 210 (class 1259 OID 16706115)
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
-- TOC entry 189 (class 1259 OID 16705929)
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
-- TOC entry 193 (class 1259 OID 16705977)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 16705909)
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
-- TOC entry 199 (class 1259 OID 16706030)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 237 (class 1259 OID 16706517)
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
-- TOC entry 238 (class 1259 OID 16706529)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 16706551)
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
-- TOC entry 203 (class 1259 OID 16706055)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 16705866)
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
-- TOC entry 178 (class 1259 OID 16705780)
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
-- TOC entry 179 (class 1259 OID 16705791)
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
-- TOC entry 174 (class 1259 OID 16705745)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 16705764)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 16706062)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 16706095)
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
-- TOC entry 219 (class 1259 OID 16706219)
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
-- TOC entry 181 (class 1259 OID 16705824)
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
-- TOC entry 183 (class 1259 OID 16705858)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 16706036)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 16705843)
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
-- TOC entry 188 (class 1259 OID 16705921)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 16706048)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 16706399)
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
-- TOC entry 227 (class 1259 OID 16706409)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 16706355)
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
-- TOC entry 228 (class 1259 OID 16706417)
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
-- TOC entry 206 (class 1259 OID 16706077)
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
-- TOC entry 198 (class 1259 OID 16706021)
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
-- TOC entry 197 (class 1259 OID 16706011)
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
-- TOC entry 218 (class 1259 OID 16706208)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 16706147)
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
-- TOC entry 171 (class 1259 OID 16705716)
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
-- TOC entry 170 (class 1259 OID 16705714)
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
-- TOC entry 207 (class 1259 OID 16706089)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 16705754)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 16705738)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 16706103)
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
-- TOC entry 201 (class 1259 OID 16706042)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 16705988)
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
-- TOC entry 233 (class 1259 OID 16706458)
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
-- TOC entry 232 (class 1259 OID 16706450)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 16706445)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 16706157)
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
-- TOC entry 180 (class 1259 OID 16705816)
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
-- TOC entry 196 (class 1259 OID 16705998)
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
-- TOC entry 217 (class 1259 OID 16706197)
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
-- TOC entry 229 (class 1259 OID 16706427)
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
-- TOC entry 185 (class 1259 OID 16705878)
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
-- TOC entry 172 (class 1259 OID 16705725)
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
-- TOC entry 221 (class 1259 OID 16706245)
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
-- TOC entry 190 (class 1259 OID 16705940)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 16706069)
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
-- TOC entry 215 (class 1259 OID 16706171)
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
-- TOC entry 235 (class 1259 OID 16706497)
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
-- TOC entry 234 (class 1259 OID 16706469)
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
-- TOC entry 236 (class 1259 OID 16706509)
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
-- TOC entry 212 (class 1259 OID 16706140)
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
-- TOC entry 192 (class 1259 OID 16705972)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 16706235)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 16706130)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 16705719)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2911 (class 0 OID 16705771)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2957 (class 0 OID 16706287)
-- Dependencies: 223
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55e4-6933-8dbd-07502b2da07d	000d0000-55e4-6933-3940-d89326ead6ea	\N	00090000-55e4-6933-34a9-6078060fa4db	000b0000-55e4-6933-95b0-7b481bb97239	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55e4-6933-b575-af9e6b0bf8bd	000d0000-55e4-6933-75bb-902413195fa7	00100000-55e4-6933-ff51-f15e53d9bdc8	00090000-55e4-6933-b2c1-ff37cee934a0	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55e4-6933-8240-db5a73f1f467	000d0000-55e4-6933-7db5-04e2b736120d	00100000-55e4-6933-b3bb-a9656273c02c	00090000-55e4-6933-5ed0-6aead989ad00	\N	0003	t	\N	2015-08-31	\N	2	\N	\N	f	f
000c0000-55e4-6933-c7d8-4aabe10655d7	000d0000-55e4-6933-1b92-10587f072f0f	\N	00090000-55e4-6933-4bfc-ce5b6d48bd42	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55e4-6933-d791-c5886bdbd7bd	000d0000-55e4-6933-f5a2-908283038702	\N	00090000-55e4-6933-28a1-18eda8d59061	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55e4-6933-ed9d-4c39d7dd88f1	000d0000-55e4-6933-c720-0b109f8ead58	\N	00090000-55e4-6933-3219-71c4c4d0a57e	000b0000-55e4-6933-9fd8-d36d3c85040b	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55e4-6933-83c8-508181033071	000d0000-55e4-6933-25b3-fd8e60e24edc	00100000-55e4-6933-6374-885ebb6829d5	00090000-55e4-6933-287a-ac1bfa47c8d2	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55e4-6933-d849-3014d7ed7dea	000d0000-55e4-6933-f596-3ce6e0b81560	\N	00090000-55e4-6933-790f-219e7026afb5	000b0000-55e4-6933-fc3c-2497f219a7b0	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55e4-6933-5fe8-dc35d42b56cd	000d0000-55e4-6933-25b3-fd8e60e24edc	00100000-55e4-6933-8713-fcbc4f8d35f7	00090000-55e4-6933-cdae-0e6f8c7dbbb9	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55e4-6933-93d2-22e33c992217	000d0000-55e4-6933-25b3-fd8e60e24edc	00100000-55e4-6933-73e0-e658b799d998	00090000-55e4-6933-b58d-96abb87a071e	\N	0010	t	\N	2015-08-31	\N	16	\N	\N	f	t
000c0000-55e4-6933-a89a-97c702e7104c	000d0000-55e4-6933-25b3-fd8e60e24edc	00100000-55e4-6933-73cd-8c9a78aaa1a2	00090000-55e4-6933-68c5-8b149789b311	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2956 (class 0 OID 16706270)
-- Dependencies: 222
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 16706180)
-- Dependencies: 216
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55e4-6933-86c2-71a9b1913fab	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55e4-6933-1de7-f58907d356a9	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55e4-6933-7e6d-c390e043ee98	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2973 (class 0 OID 16706536)
-- Dependencies: 239
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2925 (class 0 OID 16705949)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55e4-6933-bb91-57f663f6d017	\N	\N	00200000-55e4-6933-d6bc-c180b3ad6c5c	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55e4-6933-5930-1c179797a806	\N	\N	00200000-55e4-6933-e722-ad3e4532bd24	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55e4-6933-46e1-115bc5c5567c	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55e4-6933-52e3-ddf0a4ea9f6b	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55e4-6933-9370-c47a88dc5882	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2928 (class 0 OID 16705983)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 16706438)
-- Dependencies: 230
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 16705892)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55e4-6932-a61a-70eca81e370d	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55e4-6932-0cbc-81daec2cff37	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55e4-6932-f295-cea637474366	AL	ALB	008	Albania 	Albanija	\N
00040000-55e4-6932-9fb4-513b851807e4	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55e4-6932-3364-cc30e6d7df7f	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55e4-6932-abb3-f57f0034bd93	AD	AND	020	Andorra 	Andora	\N
00040000-55e4-6932-c6a9-9c066f5ab30b	AO	AGO	024	Angola 	Angola	\N
00040000-55e4-6932-2c97-2a7396b72e67	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55e4-6932-ef95-468344ef95d2	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55e4-6932-e022-c306268655d9	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55e4-6932-7923-2d1bbf1d77d4	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55e4-6932-72a4-0c3dac1366c6	AM	ARM	051	Armenia 	Armenija	\N
00040000-55e4-6932-628a-bb095251dcb1	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55e4-6932-ab6c-6a1356c642c4	AU	AUS	036	Australia 	Avstralija	\N
00040000-55e4-6932-0fe1-a970eacac1d4	AT	AUT	040	Austria 	Avstrija	\N
00040000-55e4-6932-60d3-76a0c74a42ef	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55e4-6932-0b6c-eb3e83e253f7	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55e4-6932-ae75-d7c90bb0d551	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55e4-6932-d523-40a6ec25144a	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55e4-6932-e961-aeb209cf5de1	BB	BRB	052	Barbados 	Barbados	\N
00040000-55e4-6932-a403-b91b469aefd2	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55e4-6932-2f66-e99a2328285c	BE	BEL	056	Belgium 	Belgija	\N
00040000-55e4-6932-96d1-59779d9efd5e	BZ	BLZ	084	Belize 	Belize	\N
00040000-55e4-6932-f1c2-68e26a20e48c	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55e4-6932-3b45-1dd269a6f2f3	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55e4-6932-32f3-cb80d62ef122	BT	BTN	064	Bhutan 	Butan	\N
00040000-55e4-6932-1cbc-ac18c7cc4f99	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55e4-6932-ee48-a68bcc0ed6de	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55e4-6932-5cd9-7956f628067a	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55e4-6932-cb5f-25bbe37f83a9	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55e4-6932-e338-de59cdebd1bc	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55e4-6932-24e9-e1e16f433449	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55e4-6932-3f4a-2ef01fcaa769	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55e4-6932-5e74-b73e0c9e3483	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55e4-6932-7441-5ea6f27a3d25	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55e4-6932-1823-24bc7553b01f	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55e4-6932-2331-d77e99e40be6	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55e4-6932-d246-332d11108bb0	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55e4-6932-451b-93d55c9563f6	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55e4-6932-c7d2-6ae4135ee5fb	CA	CAN	124	Canada 	Kanada	\N
00040000-55e4-6932-e59f-5c77dadf1b69	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55e4-6932-f49d-3a28efb2de58	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55e4-6932-7ec9-2e883be641ae	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55e4-6932-d725-8302d5b48ee9	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55e4-6932-c28a-a1d2fda51e92	CL	CHL	152	Chile 	Čile	\N
00040000-55e4-6932-5e7a-520bd3a117c9	CN	CHN	156	China 	Kitajska	\N
00040000-55e4-6932-d940-ebfa54accc70	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55e4-6932-c564-c779ecb0f894	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55e4-6932-30c5-1d91a0206111	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55e4-6932-3893-e88301ac6b43	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55e4-6932-9758-acff9d3e495a	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55e4-6932-e769-8b026f958fd8	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55e4-6932-a9b3-5614948b3005	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55e4-6932-59a3-34b07ed711e7	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55e4-6932-1f71-08bc9efb207a	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55e4-6932-6540-21a1aa4674d6	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55e4-6932-adee-69bf9699be96	CU	CUB	192	Cuba 	Kuba	\N
00040000-55e4-6932-63d7-9e40620de6d9	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55e4-6932-fb97-ba8f9de7ef54	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55e4-6932-9acd-938cab0922e1	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55e4-6932-01f4-65f96cabb3b6	DK	DNK	208	Denmark 	Danska	\N
00040000-55e4-6932-886f-15f9063f3978	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55e4-6932-e1db-857a3ba5550b	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55e4-6932-3975-2812b1be0a8a	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55e4-6932-03e3-ce42cf375c46	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55e4-6932-894d-5f11d07964f2	EG	EGY	818	Egypt 	Egipt	\N
00040000-55e4-6932-b693-b3367a496d2c	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55e4-6932-6246-766e37f23de8	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55e4-6932-1efc-568226cf6d81	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55e4-6932-3164-9000719342ce	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55e4-6932-a3d9-455f2e204c8e	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55e4-6932-1959-81cc2eb26f23	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55e4-6932-6dc3-9ef7c821be6f	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55e4-6932-df98-abffd87c6118	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55e4-6932-7603-4f010850dc33	FI	FIN	246	Finland 	Finska	\N
00040000-55e4-6932-2cad-4d61136859a7	FR	FRA	250	France 	Francija	\N
00040000-55e4-6932-097f-5ae73d27d49e	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55e4-6932-56c4-871fcc7c0ab3	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55e4-6932-c164-4d609efe89e6	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55e4-6932-9e5a-bc1256d2ba93	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55e4-6932-c37c-5f7a57a558b4	GA	GAB	266	Gabon 	Gabon	\N
00040000-55e4-6932-70a2-7f39a6473668	GM	GMB	270	Gambia 	Gambija	\N
00040000-55e4-6932-d0a6-24b7cba978f5	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55e4-6932-b18c-9246c33c860d	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55e4-6932-a959-29c754a2681e	GH	GHA	288	Ghana 	Gana	\N
00040000-55e4-6932-3b36-676c0fa21197	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55e4-6932-e941-bac366f0b404	GR	GRC	300	Greece 	Grčija	\N
00040000-55e4-6932-d4bf-ea800a9be8cc	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55e4-6932-acc3-583ed0c93273	GD	GRD	308	Grenada 	Grenada	\N
00040000-55e4-6932-38ab-8234fdb65eac	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55e4-6932-024f-9dd1a4402d28	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55e4-6932-eac8-208f6935610c	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55e4-6932-35c4-564f2388a9a6	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55e4-6932-7d79-9636313e8532	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55e4-6932-a7a3-f5bf91c27a5b	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55e4-6932-bf69-856bb8aec371	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55e4-6932-7dff-d53e377addc6	HT	HTI	332	Haiti 	Haiti	\N
00040000-55e4-6932-17df-bf8187cb4ffd	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55e4-6932-e445-520d357b2656	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55e4-6932-f56d-5b58520c6783	HN	HND	340	Honduras 	Honduras	\N
00040000-55e4-6932-6ce4-3cca0dc06f9f	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55e4-6932-9af8-796d61ebdcc0	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55e4-6932-735a-2279994322c1	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55e4-6932-93c6-777e7725e54b	IN	IND	356	India 	Indija	\N
00040000-55e4-6932-caeb-2237e6675ca8	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55e4-6932-a024-7cf6d419603b	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55e4-6932-4b04-b58f8672c718	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55e4-6932-e004-5f213ed5720f	IE	IRL	372	Ireland 	Irska	\N
00040000-55e4-6932-99a6-6bb36a40f15c	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55e4-6932-2909-a07d77ee44ff	IL	ISR	376	Israel 	Izrael	\N
00040000-55e4-6932-9215-d844877aba3c	IT	ITA	380	Italy 	Italija	\N
00040000-55e4-6932-1e45-4086509e9ee4	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55e4-6932-bee3-8ba372497c77	JP	JPN	392	Japan 	Japonska	\N
00040000-55e4-6932-150f-ec2dfd82118c	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55e4-6932-82c6-a95a217f7858	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55e4-6932-040b-a88ed917a3a7	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55e4-6932-a017-3abbe2eefe36	KE	KEN	404	Kenya 	Kenija	\N
00040000-55e4-6932-15e2-accb30b59914	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55e4-6932-5dec-aebecb80308d	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55e4-6932-7b25-a78139f7c92d	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55e4-6932-1e55-c483492c13cc	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55e4-6932-ee3a-4b96465cce34	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55e4-6932-056b-ac32f5176339	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55e4-6932-a6f0-cb158c8f5fb6	LV	LVA	428	Latvia 	Latvija	\N
00040000-55e4-6932-6e8f-4a926ac16342	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55e4-6932-3e78-ffb9342757b3	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55e4-6932-4452-705b65dbb36f	LR	LBR	430	Liberia 	Liberija	\N
00040000-55e4-6932-7861-bded352052d5	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55e4-6932-7f11-ba3c11ceabbe	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55e4-6932-1baf-5e3c5f654b31	LT	LTU	440	Lithuania 	Litva	\N
00040000-55e4-6932-e1a8-6d59940d0fe0	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55e4-6932-ff66-006d22f2d097	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55e4-6932-c29c-d934835b4de5	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55e4-6932-6eba-8a24f70e6bf0	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55e4-6932-b456-70921fbdf64b	MW	MWI	454	Malawi 	Malavi	\N
00040000-55e4-6932-dbfb-da5ee62f3e44	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55e4-6932-69f0-d3ab910d366e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55e4-6932-7021-f767aa209e9e	ML	MLI	466	Mali 	Mali	\N
00040000-55e4-6932-a81b-2bd9afc19290	MT	MLT	470	Malta 	Malta	\N
00040000-55e4-6932-3235-e568adaf9817	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55e4-6932-1123-6d0e3ca1c492	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55e4-6932-462c-20efab727a48	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55e4-6932-8b5e-3ef172ba7409	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55e4-6932-dc31-1691688dc694	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55e4-6932-943c-f77b24d9ab57	MX	MEX	484	Mexico 	Mehika	\N
00040000-55e4-6932-3e39-7ee00d24ff68	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55e4-6932-632b-610d01abc4f3	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55e4-6932-749d-0a190113d251	MC	MCO	492	Monaco 	Monako	\N
00040000-55e4-6932-9d51-adab81059ee1	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55e4-6932-fe92-663c9f6f7263	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55e4-6932-2d2a-69113a2b2927	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55e4-6932-5ec3-4e16ab274763	MA	MAR	504	Morocco 	Maroko	\N
00040000-55e4-6932-7420-49ebf01e695b	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55e4-6932-c5c7-c3c4208358fc	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55e4-6932-36d2-be9a4dc3636a	NA	NAM	516	Namibia 	Namibija	\N
00040000-55e4-6932-63dc-9e272ca24713	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55e4-6932-f0b5-a6d510aab3c9	NP	NPL	524	Nepal 	Nepal	\N
00040000-55e4-6932-5d85-5e7f0431f48a	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55e4-6932-4ea0-2ef60d98a866	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55e4-6932-9000-63bfdc75caae	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55e4-6932-8e25-38cc466bd434	NE	NER	562	Niger 	Niger 	\N
00040000-55e4-6932-fd69-9aeb86782852	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55e4-6932-6ffa-3da816c90179	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55e4-6932-d946-97968de8f734	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55e4-6932-77a8-3e8e534b9786	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55e4-6932-2058-b35e30987e63	NO	NOR	578	Norway 	Norveška	\N
00040000-55e4-6932-6943-3e7eaa1a6ca6	OM	OMN	512	Oman 	Oman	\N
00040000-55e4-6932-e69e-44d5b0bbee14	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55e4-6932-c8c6-b36f758ea03a	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55e4-6932-657f-844cdf912b8e	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55e4-6932-0857-43e968339659	PA	PAN	591	Panama 	Panama	\N
00040000-55e4-6932-7af2-6736a582a541	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55e4-6932-d40e-cc2616c6d4dc	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55e4-6932-bca7-cc187a505f74	PE	PER	604	Peru 	Peru	\N
00040000-55e4-6932-783c-841f991b1bbc	PH	PHL	608	Philippines 	Filipini	\N
00040000-55e4-6932-0510-f7a100275abc	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55e4-6932-412c-0d0d249df227	PL	POL	616	Poland 	Poljska	\N
00040000-55e4-6932-1b94-241238e2e535	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55e4-6932-43b5-5fdd0ed953a9	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55e4-6932-03af-04c7e2cdbde7	QA	QAT	634	Qatar 	Katar	\N
00040000-55e4-6932-46ce-297bd1ba8dc1	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55e4-6932-324a-5733908701f8	RO	ROU	642	Romania 	Romunija	\N
00040000-55e4-6932-0a71-56ed38ee391d	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55e4-6932-8757-efa96dfc211e	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55e4-6932-4882-a8964aed7367	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55e4-6932-675b-4776bfd92a9f	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55e4-6932-e160-c2b6c1eb8507	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55e4-6932-1954-9946bf0280f5	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55e4-6932-bf6c-6a4f65b7ce64	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55e4-6932-bbcc-d2e8722bb650	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55e4-6932-c705-70a4c2561e33	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55e4-6932-71bb-6c8461f816cf	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55e4-6932-f6e1-31a9ed9f38c2	SM	SMR	674	San Marino 	San Marino	\N
00040000-55e4-6932-cd90-e8ddbb46b138	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55e4-6932-9852-6eb6bc5faca6	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55e4-6932-63ee-bbf58b31fc60	SN	SEN	686	Senegal 	Senegal	\N
00040000-55e4-6932-107c-407bdebd33f1	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55e4-6932-5387-bac23bdd6bc6	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55e4-6932-afba-1b57a364e20d	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55e4-6932-5598-e7b4a015a117	SG	SGP	702	Singapore 	Singapur	\N
00040000-55e4-6932-8e2f-c02af19f184b	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55e4-6932-9e8c-69f8fceab311	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55e4-6932-9934-20adbc8dbd62	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55e4-6932-32f8-e46f80de515f	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55e4-6932-6e29-420655996eaa	SO	SOM	706	Somalia 	Somalija	\N
00040000-55e4-6932-9a21-34963cdbcd86	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55e4-6932-0903-a69d9612fb0b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55e4-6932-67a2-a79175a74a9d	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55e4-6932-22e3-341ebf0ecb39	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55e4-6932-af1f-bd080bd4ba22	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55e4-6932-4dfd-03f7b1ae2777	SD	SDN	729	Sudan 	Sudan	\N
00040000-55e4-6932-909a-65d556c237f5	SR	SUR	740	Suriname 	Surinam	\N
00040000-55e4-6932-cec6-c8c3fad65800	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55e4-6932-360b-12f06cbf765a	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55e4-6932-2331-4c889d156c2c	SE	SWE	752	Sweden 	Švedska	\N
00040000-55e4-6932-0bbd-f38822ac43b7	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55e4-6932-fc37-f8aafb91e762	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55e4-6932-ee1a-3f624b7214b9	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55e4-6932-dd17-8f097ca1db04	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55e4-6932-72fe-26d7fb97c5ff	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55e4-6932-c07c-7c81ce6ca6f9	TH	THA	764	Thailand 	Tajska	\N
00040000-55e4-6932-dab6-c37ae802c960	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55e4-6932-f91f-cb91c8cb522f	TG	TGO	768	Togo 	Togo	\N
00040000-55e4-6932-033a-e3098cb498ee	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55e4-6932-e135-9b5420ea6569	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55e4-6932-19bc-d354ea853d15	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55e4-6932-f20d-ba1a1af7b395	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55e4-6932-9939-cf5923df8cfe	TR	TUR	792	Turkey 	Turčija	\N
00040000-55e4-6932-ede8-41e7bb6bca49	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55e4-6932-3a57-3606f50914d4	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55e4-6932-cad2-33b112905825	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55e4-6932-2038-d1fe239b2902	UG	UGA	800	Uganda 	Uganda	\N
00040000-55e4-6932-d550-944db8b2c4da	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55e4-6932-8912-b139951b9e9b	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55e4-6932-7f68-6b63c193f52c	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55e4-6932-4f95-05899fc7b4a4	US	USA	840	United States 	Združene države Amerike	\N
00040000-55e4-6932-6074-bc1a4bb2d5a0	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55e4-6932-0c99-4233f9654a6b	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55e4-6932-7937-a7e6d992539e	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55e4-6932-5bfb-29724f6e5869	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55e4-6932-2f2a-9b47156e6d0c	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55e4-6932-c8a8-3dd766d74e74	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55e4-6932-58e0-323bc98c5ff4	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55e4-6932-b2ac-ff0eb90911de	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55e4-6932-037f-3350872d380c	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55e4-6932-499c-9782fbacd378	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55e4-6932-9118-5ff988a6bd2b	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55e4-6932-132d-5f382e7ceda1	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55e4-6932-5524-8a80cc7a1faa	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2958 (class 0 OID 16706300)
-- Dependencies: 224
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55e4-6933-5081-02f7d9a23a3b	000e0000-55e4-6933-19ef-7e6058ef7188	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e4-6931-2ee8-13621d5be01f	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55e4-6933-bc2b-f732c81c9105	000e0000-55e4-6933-f7da-20a322a7c5ef	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e4-6931-1534-c91df8fc60e5	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55e4-6933-ffa7-d33fc52b466e	000e0000-55e4-6933-fca8-166349b4307a	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e4-6931-2ee8-13621d5be01f	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55e4-6933-8080-e188bef17344	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55e4-6933-a295-ada4eb524444	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2944 (class 0 OID 16706115)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55e4-6933-25b3-fd8e60e24edc	000e0000-55e4-6933-f7da-20a322a7c5ef	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55e4-6932-03bf-5a08048894c1
000d0000-55e4-6933-3940-d89326ead6ea	000e0000-55e4-6933-f7da-20a322a7c5ef	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55e4-6932-03bf-5a08048894c1
000d0000-55e4-6933-75bb-902413195fa7	000e0000-55e4-6933-f7da-20a322a7c5ef	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55e4-6932-beb8-c30aa0eed9d8
000d0000-55e4-6933-7db5-04e2b736120d	000e0000-55e4-6933-f7da-20a322a7c5ef	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55e4-6932-4a6c-9d11e6e68e88
000d0000-55e4-6933-1b92-10587f072f0f	000e0000-55e4-6933-f7da-20a322a7c5ef	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55e4-6932-0d96-887f098597e4
000d0000-55e4-6933-f5a2-908283038702	000e0000-55e4-6933-f7da-20a322a7c5ef	\N	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55e4-6932-0d96-887f098597e4
000d0000-55e4-6933-c720-0b109f8ead58	000e0000-55e4-6933-f7da-20a322a7c5ef	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55e4-6932-03bf-5a08048894c1
000d0000-55e4-6933-f596-3ce6e0b81560	000e0000-55e4-6933-f7da-20a322a7c5ef	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55e4-6932-8a96-9fb6773651b4
\.


--
-- TOC entry 2923 (class 0 OID 16705929)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 16705977)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2921 (class 0 OID 16705909)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55e4-6933-c022-6dfeb6f6446a	00080000-55e4-6933-3377-d617ba7f8edc	00090000-55e4-6933-b58d-96abb87a071e	AK		
\.


--
-- TOC entry 2933 (class 0 OID 16706030)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 16706517)
-- Dependencies: 237
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 16706529)
-- Dependencies: 238
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 16706551)
-- Dependencies: 240
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 16706055)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2918 (class 0 OID 16705866)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55e4-6932-2b4f-c33496365e85	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55e4-6932-363b-4e535b472483	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55e4-6932-8ac7-37c915d4b510	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55e4-6932-cc15-444b05ac4e07	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55e4-6932-8ada-fb81d68daf14	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55e4-6932-58fe-0c0abe8d4890	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55e4-6932-686f-fc025071b2cf	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55e4-6932-db4b-6ac91bf64f9a	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55e4-6932-7a0b-69d020ed4fa3	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55e4-6932-d3e1-a892ebc503df	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55e4-6932-bf53-0bd3153618d7	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55e4-6932-5036-978197815336	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55e4-6932-cc99-5479b388a9e0	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55e4-6933-103e-cc8e98a02af1	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55e4-6933-6eb2-bb4bb9ffec9a	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55e4-6933-2ec7-08811de4de1f	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55e4-6933-28ac-9a40b3f20628	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55e4-6933-62c5-2682efb853ff	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55e4-6934-972e-6e31319069f2	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2912 (class 0 OID 16705780)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55e4-6933-89b4-11c73a81f947	00000000-55e4-6933-103e-cc8e98a02af1	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55e4-6933-3a40-ca0e607e6558	00000000-55e4-6933-103e-cc8e98a02af1	00010000-55e4-6932-39f4-6715501a938a	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55e4-6933-1d92-33f2de29047c	00000000-55e4-6933-6eb2-bb4bb9ffec9a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2913 (class 0 OID 16705791)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55e4-6933-34a9-6078060fa4db	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55e4-6933-4bfc-ce5b6d48bd42	00010000-55e4-6933-ec1c-51eeea08925f	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55e4-6933-5ed0-6aead989ad00	00010000-55e4-6933-20c5-9841bd1664ab	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55e4-6933-cdae-0e6f8c7dbbb9	00010000-55e4-6933-e44d-83e7488bfcfa	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55e4-6933-063c-285b514304da	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55e4-6933-3219-71c4c4d0a57e	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55e4-6933-68c5-8b149789b311	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55e4-6933-287a-ac1bfa47c8d2	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55e4-6933-b58d-96abb87a071e	00010000-55e4-6933-d8a5-bbeba2c83cc0	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55e4-6933-b2c1-ff37cee934a0	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55e4-6933-b2b5-49ad4a617899	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55e4-6933-28a1-18eda8d59061	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55e4-6933-790f-219e7026afb5	00010000-55e4-6933-e904-d24d54d1bdb4	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2908 (class 0 OID 16705745)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55e4-6932-3e72-3b406b75f6de	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55e4-6932-25ed-d69d831e26f9	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55e4-6932-7999-45f0e5ccd5ed	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55e4-6932-ab6a-c66173226c06	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55e4-6932-dbe6-40321e5d2c74	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55e4-6932-8871-1661451c16cf	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55e4-6932-3424-9e09d2b15aaf	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55e4-6932-f44b-7ad2e7274770	Abonma-read	Abonma - branje	f
00030000-55e4-6932-e36e-fc953b3b9110	Abonma-write	Abonma - spreminjanje	f
00030000-55e4-6932-a11f-02f59924cf24	Alternacija-read	Alternacija - branje	f
00030000-55e4-6932-c597-47d9520e3887	Alternacija-write	Alternacija - spreminjanje	f
00030000-55e4-6932-4f09-51594b19baca	Arhivalija-read	Arhivalija - branje	f
00030000-55e4-6932-9230-b893b316b157	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55e4-6932-67fc-663d18c2a881	Besedilo-read	Besedilo - branje	f
00030000-55e4-6932-4295-b13589d5d516	Besedilo-write	Besedilo - spreminjanje	f
00030000-55e4-6932-d688-2b8a22b97b5d	DogodekIzven-read	DogodekIzven - branje	f
00030000-55e4-6932-b744-79cf42008ab7	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55e4-6932-0251-d3816db17f86	Dogodek-read	Dogodek - branje	f
00030000-55e4-6932-e747-8ad84ddc2511	Dogodek-write	Dogodek - spreminjanje	f
00030000-55e4-6932-9494-390f53056ca8	DrugiVir-read	DrugiVir - branje	f
00030000-55e4-6932-b1de-a127606915b2	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55e4-6932-dee3-dd83c38a6244	Drzava-read	Drzava - branje	f
00030000-55e4-6932-2b54-70c690dc7ca7	Drzava-write	Drzava - spreminjanje	f
00030000-55e4-6932-c454-8c304233b5b5	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55e4-6932-03ca-8227b91cdeb8	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55e4-6932-ec60-d61b31786f3f	Funkcija-read	Funkcija - branje	f
00030000-55e4-6932-5299-65ed1d62a189	Funkcija-write	Funkcija - spreminjanje	f
00030000-55e4-6932-dcf6-340fb8c38984	Gostovanje-read	Gostovanje - branje	f
00030000-55e4-6932-3c22-a16f93f02602	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55e4-6932-027e-9e716306fc50	Gostujoca-read	Gostujoca - branje	f
00030000-55e4-6932-4b30-a5da160a077c	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55e4-6932-4235-0ab05a0f04cf	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55e4-6932-2a85-9c49937a6daf	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55e4-6932-b808-286914882f26	Kupec-read	Kupec - branje	f
00030000-55e4-6932-7154-b0541c631572	Kupec-write	Kupec - spreminjanje	f
00030000-55e4-6932-4fa2-4c8eb9665ce1	NacinPlacina-read	NacinPlacina - branje	f
00030000-55e4-6932-5781-4e963a1719de	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55e4-6932-2d1e-08c997500914	Option-read	Option - branje	f
00030000-55e4-6932-24bb-e9cde2b3c93f	Option-write	Option - spreminjanje	f
00030000-55e4-6932-09fb-b37dc289e5f2	OptionValue-read	OptionValue - branje	f
00030000-55e4-6932-a4da-7cf74f21b853	OptionValue-write	OptionValue - spreminjanje	f
00030000-55e4-6932-81c4-3180f44c1d70	Oseba-read	Oseba - branje	f
00030000-55e4-6932-d52b-1d51e245c37b	Oseba-write	Oseba - spreminjanje	f
00030000-55e4-6932-ffa0-019bba686aa4	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55e4-6932-5c80-738db3904d1d	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55e4-6932-f44e-77747d6a4d08	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55e4-6932-10b4-02ce792417c7	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55e4-6932-0021-f69dd4acb9d8	Pogodba-read	Pogodba - branje	f
00030000-55e4-6932-b2ec-b82523ba3bf0	Pogodba-write	Pogodba - spreminjanje	f
00030000-55e4-6932-2c69-2e8578a00466	Popa-read	Popa - branje	f
00030000-55e4-6932-6a3d-ba2497f7d08a	Popa-write	Popa - spreminjanje	f
00030000-55e4-6932-ed53-e8eb11185efe	Posta-read	Posta - branje	f
00030000-55e4-6932-0fb9-fd473562eaab	Posta-write	Posta - spreminjanje	f
00030000-55e4-6932-21dd-8e594ea56a3f	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55e4-6932-1b33-ed44c47de329	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55e4-6932-a86c-72ac66623f17	PostniNaslov-read	PostniNaslov - branje	f
00030000-55e4-6932-b1fa-154006d7bdaf	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55e4-6932-9aa5-7e33761faf71	Predstava-read	Predstava - branje	f
00030000-55e4-6932-98bc-9107efec03ef	Predstava-write	Predstava - spreminjanje	f
00030000-55e4-6932-0c16-1038e5c41d1d	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55e4-6932-ad3d-bb9a2f8c896b	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55e4-6932-5f18-ab52c099cff1	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55e4-6932-ca62-2163e3e1bfcd	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55e4-6932-fe61-f1fe9ad22aed	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55e4-6932-7042-7f109fd3972f	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55e4-6932-71d6-37593e27f2be	ProgramDela-read	ProgramDela - branje	f
00030000-55e4-6932-7173-e38b54dbc42b	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55e4-6932-2942-12688639699e	ProgramFestival-read	ProgramFestival - branje	f
00030000-55e4-6932-0803-504565c4f225	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55e4-6932-09ea-144eb524bc76	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55e4-6932-6005-86b3a06367b6	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55e4-6932-d6df-8383c76c6902	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55e4-6932-d4d5-6efbb6775e38	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55e4-6932-2fd1-161e51865726	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55e4-6932-f82d-d91633342adc	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55e4-6932-981f-6ba378259847	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55e4-6932-a836-4986abb77fba	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55e4-6932-62f7-371ce4d07bde	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55e4-6932-57dc-0687bf0a7df6	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55e4-6932-5485-6ad57cb7c9a5	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55e4-6932-d84c-998abd8eccf2	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55e4-6932-3e12-0096fb34c9b9	ProgramRazno-read	ProgramRazno - branje	f
00030000-55e4-6932-e707-5838b2072c3f	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55e4-6932-60ed-4d7aa9a3e075	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55e4-6932-c568-1d74964be8bc	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55e4-6932-8db9-233595e5395d	Prostor-read	Prostor - branje	f
00030000-55e4-6932-ce18-4a1b4b08888a	Prostor-write	Prostor - spreminjanje	f
00030000-55e4-6932-4a2c-56022901b3f5	Racun-read	Racun - branje	f
00030000-55e4-6932-77f7-75d16a7ffe99	Racun-write	Racun - spreminjanje	f
00030000-55e4-6932-0fa8-9d15d0471623	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55e4-6932-b3f8-a4585c8fd3cd	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55e4-6932-7659-b1b5c7be6fd7	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55e4-6932-8988-f57d1223bc27	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55e4-6932-a2f3-485cad24796c	Rekvizit-read	Rekvizit - branje	f
00030000-55e4-6932-974f-3d63001603e5	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55e4-6932-0b12-fc0a24f6dea6	Revizija-read	Revizija - branje	f
00030000-55e4-6932-4b66-83f2e5d85f9b	Revizija-write	Revizija - spreminjanje	f
00030000-55e4-6932-f1e2-01d02edce719	Rezervacija-read	Rezervacija - branje	f
00030000-55e4-6932-527d-3dbf46f49cb2	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55e4-6932-ccfd-1f69888c989e	SedezniRed-read	SedezniRed - branje	f
00030000-55e4-6932-7fac-93293571b564	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55e4-6932-b2d0-ec2ffe289ad4	Sedez-read	Sedez - branje	f
00030000-55e4-6932-e53f-40f62b2140ad	Sedez-write	Sedez - spreminjanje	f
00030000-55e4-6932-66da-df4efa9e745e	Sezona-read	Sezona - branje	f
00030000-55e4-6932-c586-fa04fea87082	Sezona-write	Sezona - spreminjanje	f
00030000-55e4-6932-8546-1b26c8045ba2	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55e4-6932-2e36-77a2604499c2	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55e4-6932-de46-ae9ff8758459	Stevilcenje-read	Stevilcenje - branje	f
00030000-55e4-6932-41e0-6494e951cbe8	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55e4-6932-02c4-d32ec2a06ed4	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55e4-6932-3437-3283fc5ac1f3	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55e4-6932-517d-838a81cf2d55	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55e4-6932-254c-6c174c32dfed	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55e4-6932-878f-493a7569c1bc	Telefonska-read	Telefonska - branje	f
00030000-55e4-6932-940b-375a1f0084a9	Telefonska-write	Telefonska - spreminjanje	f
00030000-55e4-6932-9168-7b940e14bed7	TerminStoritve-read	TerminStoritve - branje	f
00030000-55e4-6932-54e1-e0f460e479dc	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55e4-6932-3a32-04b9a7c36767	TipFunkcije-read	TipFunkcije - branje	f
00030000-55e4-6932-d045-8b20d1375ace	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55e4-6932-be80-2624ab41f32a	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55e4-6932-9581-5329b58a8dcd	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55e4-6932-60a8-4a902bcd4108	Trr-read	Trr - branje	f
00030000-55e4-6932-9b70-a007e28bf0ba	Trr-write	Trr - spreminjanje	f
00030000-55e4-6932-7a7d-8f2e1c28dae4	Uprizoritev-read	Uprizoritev - branje	f
00030000-55e4-6932-1e6a-06681bbefe51	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55e4-6932-cb64-ec9b4466306b	Vaja-read	Vaja - branje	f
00030000-55e4-6932-2b77-1ad7bdb09d8b	Vaja-write	Vaja - spreminjanje	f
00030000-55e4-6932-2b39-301b15244069	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55e4-6932-05ce-8970d88ad82f	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55e4-6932-3ed0-efd103d681dd	VrstaStroska-read	VrstaStroska - branje	f
00030000-55e4-6932-8aa4-6a53c53d77da	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55e4-6932-d08e-9ec36fc13302	Zaposlitev-read	Zaposlitev - branje	f
00030000-55e4-6932-5732-981b3a706336	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55e4-6932-a8fc-f169385de352	Zasedenost-read	Zasedenost - branje	f
00030000-55e4-6932-874c-616c7138860c	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55e4-6932-a7db-e6cf7e27be40	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55e4-6932-14d8-338566754b08	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55e4-6932-60e6-bcf27cb38b6e	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55e4-6932-971e-a7ec39f56b31	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55e4-6932-0aec-4c00a7b64eea	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55e4-6932-f802-e3e6b8278fd3	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55e4-6932-a50b-3f525d694b6d	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55e4-6932-8d1c-91f6b566f27c	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55e4-6932-9656-3582fb70f618	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55e4-6932-d5ee-5d98a75bcf9b	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55e4-6932-71d1-65e7ab138054	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55e4-6932-be32-7f5082bf6976	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55e4-6932-5319-be2cdecc1f3f	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55e4-6932-61c7-fabe2800e6ae	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55e4-6932-6455-13acbf004e47	Datoteka-write	Datoteka - spreminjanje	f
00030000-55e4-6932-de24-67f5ff9c7289	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2910 (class 0 OID 16705764)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55e4-6932-0c37-478eea01726c	00030000-55e4-6932-25ed-d69d831e26f9
00020000-55e4-6932-e37a-459cf670fd50	00030000-55e4-6932-dee3-dd83c38a6244
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-f44b-7ad2e7274770
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-e36e-fc953b3b9110
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-a11f-02f59924cf24
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-c597-47d9520e3887
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-4f09-51594b19baca
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-0251-d3816db17f86
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-ab6a-c66173226c06
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-e747-8ad84ddc2511
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-dee3-dd83c38a6244
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-2b54-70c690dc7ca7
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-ec60-d61b31786f3f
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-5299-65ed1d62a189
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-dcf6-340fb8c38984
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-3c22-a16f93f02602
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-027e-9e716306fc50
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-4b30-a5da160a077c
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-4235-0ab05a0f04cf
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-2a85-9c49937a6daf
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-2d1e-08c997500914
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-09fb-b37dc289e5f2
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-81c4-3180f44c1d70
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-d52b-1d51e245c37b
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-2c69-2e8578a00466
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-6a3d-ba2497f7d08a
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-ed53-e8eb11185efe
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-0fb9-fd473562eaab
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-a86c-72ac66623f17
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-b1fa-154006d7bdaf
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-9aa5-7e33761faf71
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-98bc-9107efec03ef
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-fe61-f1fe9ad22aed
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-7042-7f109fd3972f
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-8db9-233595e5395d
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-ce18-4a1b4b08888a
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-7659-b1b5c7be6fd7
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-8988-f57d1223bc27
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-a2f3-485cad24796c
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-974f-3d63001603e5
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-66da-df4efa9e745e
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-c586-fa04fea87082
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-3a32-04b9a7c36767
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-7a7d-8f2e1c28dae4
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-1e6a-06681bbefe51
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-cb64-ec9b4466306b
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-2b77-1ad7bdb09d8b
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-a8fc-f169385de352
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-874c-616c7138860c
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-a7db-e6cf7e27be40
00020000-55e4-6932-b8fd-8b9f78576499	00030000-55e4-6932-60e6-bcf27cb38b6e
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-f44b-7ad2e7274770
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-4f09-51594b19baca
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-0251-d3816db17f86
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-dee3-dd83c38a6244
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-dcf6-340fb8c38984
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-027e-9e716306fc50
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-4235-0ab05a0f04cf
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-2a85-9c49937a6daf
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-2d1e-08c997500914
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-09fb-b37dc289e5f2
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-81c4-3180f44c1d70
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-d52b-1d51e245c37b
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-2c69-2e8578a00466
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-ed53-e8eb11185efe
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-a86c-72ac66623f17
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-b1fa-154006d7bdaf
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-9aa5-7e33761faf71
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-8db9-233595e5395d
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-7659-b1b5c7be6fd7
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-a2f3-485cad24796c
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-66da-df4efa9e745e
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-878f-493a7569c1bc
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-940b-375a1f0084a9
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-60a8-4a902bcd4108
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-9b70-a007e28bf0ba
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-d08e-9ec36fc13302
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-5732-981b3a706336
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-a7db-e6cf7e27be40
00020000-55e4-6932-aa21-e9b35cbb16bb	00030000-55e4-6932-60e6-bcf27cb38b6e
00020000-55e4-6932-7d8c-ca693523bd3c	00030000-55e4-6932-f44b-7ad2e7274770
00020000-55e4-6932-7d8c-ca693523bd3c	00030000-55e4-6932-a11f-02f59924cf24
00020000-55e4-6932-7d8c-ca693523bd3c	00030000-55e4-6932-4f09-51594b19baca
00020000-55e4-6932-7d8c-ca693523bd3c	00030000-55e4-6932-9230-b893b316b157
00020000-55e4-6932-7d8c-ca693523bd3c	00030000-55e4-6932-67fc-663d18c2a881
00020000-55e4-6932-7d8c-ca693523bd3c	00030000-55e4-6932-d688-2b8a22b97b5d
00020000-55e4-6932-7d8c-ca693523bd3c	00030000-55e4-6932-0251-d3816db17f86
00020000-55e4-6932-7d8c-ca693523bd3c	00030000-55e4-6932-dee3-dd83c38a6244
00020000-55e4-6932-7d8c-ca693523bd3c	00030000-55e4-6932-ec60-d61b31786f3f
00020000-55e4-6932-7d8c-ca693523bd3c	00030000-55e4-6932-dcf6-340fb8c38984
00020000-55e4-6932-7d8c-ca693523bd3c	00030000-55e4-6932-027e-9e716306fc50
00020000-55e4-6932-7d8c-ca693523bd3c	00030000-55e4-6932-4235-0ab05a0f04cf
00020000-55e4-6932-7d8c-ca693523bd3c	00030000-55e4-6932-2d1e-08c997500914
00020000-55e4-6932-7d8c-ca693523bd3c	00030000-55e4-6932-09fb-b37dc289e5f2
00020000-55e4-6932-7d8c-ca693523bd3c	00030000-55e4-6932-81c4-3180f44c1d70
00020000-55e4-6932-7d8c-ca693523bd3c	00030000-55e4-6932-2c69-2e8578a00466
00020000-55e4-6932-7d8c-ca693523bd3c	00030000-55e4-6932-ed53-e8eb11185efe
00020000-55e4-6932-7d8c-ca693523bd3c	00030000-55e4-6932-9aa5-7e33761faf71
00020000-55e4-6932-7d8c-ca693523bd3c	00030000-55e4-6932-fe61-f1fe9ad22aed
00020000-55e4-6932-7d8c-ca693523bd3c	00030000-55e4-6932-8db9-233595e5395d
00020000-55e4-6932-7d8c-ca693523bd3c	00030000-55e4-6932-7659-b1b5c7be6fd7
00020000-55e4-6932-7d8c-ca693523bd3c	00030000-55e4-6932-a2f3-485cad24796c
00020000-55e4-6932-7d8c-ca693523bd3c	00030000-55e4-6932-66da-df4efa9e745e
00020000-55e4-6932-7d8c-ca693523bd3c	00030000-55e4-6932-3a32-04b9a7c36767
00020000-55e4-6932-7d8c-ca693523bd3c	00030000-55e4-6932-cb64-ec9b4466306b
00020000-55e4-6932-7d8c-ca693523bd3c	00030000-55e4-6932-a8fc-f169385de352
00020000-55e4-6932-7d8c-ca693523bd3c	00030000-55e4-6932-a7db-e6cf7e27be40
00020000-55e4-6932-7d8c-ca693523bd3c	00030000-55e4-6932-60e6-bcf27cb38b6e
00020000-55e4-6932-df7b-cf8d4d8ecfd2	00030000-55e4-6932-f44b-7ad2e7274770
00020000-55e4-6932-df7b-cf8d4d8ecfd2	00030000-55e4-6932-e36e-fc953b3b9110
00020000-55e4-6932-df7b-cf8d4d8ecfd2	00030000-55e4-6932-c597-47d9520e3887
00020000-55e4-6932-df7b-cf8d4d8ecfd2	00030000-55e4-6932-4f09-51594b19baca
00020000-55e4-6932-df7b-cf8d4d8ecfd2	00030000-55e4-6932-0251-d3816db17f86
00020000-55e4-6932-df7b-cf8d4d8ecfd2	00030000-55e4-6932-dee3-dd83c38a6244
00020000-55e4-6932-df7b-cf8d4d8ecfd2	00030000-55e4-6932-dcf6-340fb8c38984
00020000-55e4-6932-df7b-cf8d4d8ecfd2	00030000-55e4-6932-027e-9e716306fc50
00020000-55e4-6932-df7b-cf8d4d8ecfd2	00030000-55e4-6932-2d1e-08c997500914
00020000-55e4-6932-df7b-cf8d4d8ecfd2	00030000-55e4-6932-09fb-b37dc289e5f2
00020000-55e4-6932-df7b-cf8d4d8ecfd2	00030000-55e4-6932-2c69-2e8578a00466
00020000-55e4-6932-df7b-cf8d4d8ecfd2	00030000-55e4-6932-ed53-e8eb11185efe
00020000-55e4-6932-df7b-cf8d4d8ecfd2	00030000-55e4-6932-9aa5-7e33761faf71
00020000-55e4-6932-df7b-cf8d4d8ecfd2	00030000-55e4-6932-8db9-233595e5395d
00020000-55e4-6932-df7b-cf8d4d8ecfd2	00030000-55e4-6932-7659-b1b5c7be6fd7
00020000-55e4-6932-df7b-cf8d4d8ecfd2	00030000-55e4-6932-a2f3-485cad24796c
00020000-55e4-6932-df7b-cf8d4d8ecfd2	00030000-55e4-6932-66da-df4efa9e745e
00020000-55e4-6932-df7b-cf8d4d8ecfd2	00030000-55e4-6932-3a32-04b9a7c36767
00020000-55e4-6932-df7b-cf8d4d8ecfd2	00030000-55e4-6932-a7db-e6cf7e27be40
00020000-55e4-6932-df7b-cf8d4d8ecfd2	00030000-55e4-6932-60e6-bcf27cb38b6e
00020000-55e4-6932-1789-43d117da4152	00030000-55e4-6932-f44b-7ad2e7274770
00020000-55e4-6932-1789-43d117da4152	00030000-55e4-6932-4f09-51594b19baca
00020000-55e4-6932-1789-43d117da4152	00030000-55e4-6932-0251-d3816db17f86
00020000-55e4-6932-1789-43d117da4152	00030000-55e4-6932-dee3-dd83c38a6244
00020000-55e4-6932-1789-43d117da4152	00030000-55e4-6932-dcf6-340fb8c38984
00020000-55e4-6932-1789-43d117da4152	00030000-55e4-6932-027e-9e716306fc50
00020000-55e4-6932-1789-43d117da4152	00030000-55e4-6932-2d1e-08c997500914
00020000-55e4-6932-1789-43d117da4152	00030000-55e4-6932-09fb-b37dc289e5f2
00020000-55e4-6932-1789-43d117da4152	00030000-55e4-6932-2c69-2e8578a00466
00020000-55e4-6932-1789-43d117da4152	00030000-55e4-6932-ed53-e8eb11185efe
00020000-55e4-6932-1789-43d117da4152	00030000-55e4-6932-9aa5-7e33761faf71
00020000-55e4-6932-1789-43d117da4152	00030000-55e4-6932-8db9-233595e5395d
00020000-55e4-6932-1789-43d117da4152	00030000-55e4-6932-7659-b1b5c7be6fd7
00020000-55e4-6932-1789-43d117da4152	00030000-55e4-6932-a2f3-485cad24796c
00020000-55e4-6932-1789-43d117da4152	00030000-55e4-6932-66da-df4efa9e745e
00020000-55e4-6932-1789-43d117da4152	00030000-55e4-6932-9168-7b940e14bed7
00020000-55e4-6932-1789-43d117da4152	00030000-55e4-6932-7999-45f0e5ccd5ed
00020000-55e4-6932-1789-43d117da4152	00030000-55e4-6932-3a32-04b9a7c36767
00020000-55e4-6932-1789-43d117da4152	00030000-55e4-6932-a7db-e6cf7e27be40
00020000-55e4-6932-1789-43d117da4152	00030000-55e4-6932-60e6-bcf27cb38b6e
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-3e72-3b406b75f6de
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-25ed-d69d831e26f9
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-7999-45f0e5ccd5ed
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-ab6a-c66173226c06
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-dbe6-40321e5d2c74
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-8871-1661451c16cf
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-3424-9e09d2b15aaf
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-f44b-7ad2e7274770
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-e36e-fc953b3b9110
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-a11f-02f59924cf24
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-c597-47d9520e3887
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-4f09-51594b19baca
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-9230-b893b316b157
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-67fc-663d18c2a881
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-4295-b13589d5d516
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-d688-2b8a22b97b5d
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-b744-79cf42008ab7
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-0251-d3816db17f86
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-e747-8ad84ddc2511
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-dee3-dd83c38a6244
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-2b54-70c690dc7ca7
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-9494-390f53056ca8
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-b1de-a127606915b2
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-c454-8c304233b5b5
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-03ca-8227b91cdeb8
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-ec60-d61b31786f3f
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-5299-65ed1d62a189
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-dcf6-340fb8c38984
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-3c22-a16f93f02602
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-027e-9e716306fc50
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-4b30-a5da160a077c
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-4235-0ab05a0f04cf
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-2a85-9c49937a6daf
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-b808-286914882f26
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-7154-b0541c631572
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-4fa2-4c8eb9665ce1
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-5781-4e963a1719de
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-2d1e-08c997500914
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-24bb-e9cde2b3c93f
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-09fb-b37dc289e5f2
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-a4da-7cf74f21b853
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-81c4-3180f44c1d70
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-d52b-1d51e245c37b
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-ffa0-019bba686aa4
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-5c80-738db3904d1d
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-f44e-77747d6a4d08
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-10b4-02ce792417c7
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-0021-f69dd4acb9d8
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-b2ec-b82523ba3bf0
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-2c69-2e8578a00466
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-6a3d-ba2497f7d08a
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-ed53-e8eb11185efe
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-0fb9-fd473562eaab
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-21dd-8e594ea56a3f
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-1b33-ed44c47de329
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-a86c-72ac66623f17
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-b1fa-154006d7bdaf
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-9aa5-7e33761faf71
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-98bc-9107efec03ef
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-0c16-1038e5c41d1d
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-ad3d-bb9a2f8c896b
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-5f18-ab52c099cff1
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-ca62-2163e3e1bfcd
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-fe61-f1fe9ad22aed
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-7042-7f109fd3972f
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-71d6-37593e27f2be
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-7173-e38b54dbc42b
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-2942-12688639699e
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-0803-504565c4f225
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-09ea-144eb524bc76
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-6005-86b3a06367b6
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-d6df-8383c76c6902
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-d4d5-6efbb6775e38
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-2fd1-161e51865726
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-f82d-d91633342adc
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-981f-6ba378259847
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-a836-4986abb77fba
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-62f7-371ce4d07bde
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-57dc-0687bf0a7df6
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-5485-6ad57cb7c9a5
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-d84c-998abd8eccf2
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-3e12-0096fb34c9b9
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-e707-5838b2072c3f
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-60ed-4d7aa9a3e075
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-c568-1d74964be8bc
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-8db9-233595e5395d
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-ce18-4a1b4b08888a
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-4a2c-56022901b3f5
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-77f7-75d16a7ffe99
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-0fa8-9d15d0471623
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-b3f8-a4585c8fd3cd
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-7659-b1b5c7be6fd7
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-8988-f57d1223bc27
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-a2f3-485cad24796c
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-974f-3d63001603e5
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-0b12-fc0a24f6dea6
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-4b66-83f2e5d85f9b
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-f1e2-01d02edce719
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-527d-3dbf46f49cb2
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-ccfd-1f69888c989e
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-7fac-93293571b564
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-b2d0-ec2ffe289ad4
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-e53f-40f62b2140ad
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-66da-df4efa9e745e
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-c586-fa04fea87082
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-8546-1b26c8045ba2
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-2e36-77a2604499c2
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-de46-ae9ff8758459
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-41e0-6494e951cbe8
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-02c4-d32ec2a06ed4
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-3437-3283fc5ac1f3
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-517d-838a81cf2d55
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-254c-6c174c32dfed
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-878f-493a7569c1bc
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-940b-375a1f0084a9
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-9168-7b940e14bed7
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-54e1-e0f460e479dc
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-3a32-04b9a7c36767
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-d045-8b20d1375ace
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-be80-2624ab41f32a
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-9581-5329b58a8dcd
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-60a8-4a902bcd4108
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-9b70-a007e28bf0ba
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-7a7d-8f2e1c28dae4
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-1e6a-06681bbefe51
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-cb64-ec9b4466306b
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-2b77-1ad7bdb09d8b
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-2b39-301b15244069
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-05ce-8970d88ad82f
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-3ed0-efd103d681dd
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-8aa4-6a53c53d77da
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-d08e-9ec36fc13302
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-5732-981b3a706336
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-a8fc-f169385de352
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-874c-616c7138860c
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-a7db-e6cf7e27be40
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-14d8-338566754b08
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-60e6-bcf27cb38b6e
00020000-55e4-6933-c55f-cc6dd46cc486	00030000-55e4-6932-971e-a7ec39f56b31
\.


--
-- TOC entry 2938 (class 0 OID 16706062)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2942 (class 0 OID 16706095)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 16706219)
-- Dependencies: 219
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55e4-6933-95b0-7b481bb97239	00090000-55e4-6933-34a9-6078060fa4db	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55e4-6933-9fd8-d36d3c85040b	00090000-55e4-6933-3219-71c4c4d0a57e	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55e4-6933-fc3c-2497f219a7b0	00090000-55e4-6933-790f-219e7026afb5	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2915 (class 0 OID 16705824)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55e4-6933-3377-d617ba7f8edc	00040000-55e4-6932-9934-20adbc8dbd62	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e4-6933-d449-1c43f7d012fc	00040000-55e4-6932-9934-20adbc8dbd62	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55e4-6933-a262-f8d7710647ad	00040000-55e4-6932-9934-20adbc8dbd62	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e4-6933-5106-aadda1a9a115	00040000-55e4-6932-9934-20adbc8dbd62	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e4-6933-d0c8-fd250a30f64c	00040000-55e4-6932-9934-20adbc8dbd62	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e4-6933-3ff1-d8922dfce883	00040000-55e4-6932-7923-2d1bbf1d77d4	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e4-6933-2d30-6ed9005e4188	00040000-55e4-6932-6540-21a1aa4674d6	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e4-6933-85dc-89f2517b277f	00040000-55e4-6932-0fe1-a970eacac1d4	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e4-6934-bf24-46a9b702b03b	00040000-55e4-6932-9934-20adbc8dbd62	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2917 (class 0 OID 16705858)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55e4-6931-b1c6-7f9bf6983b4d	8341	Adlešiči
00050000-55e4-6931-8610-512f92b33e0e	5270	Ajdovščina
00050000-55e4-6931-ba67-3be8fe2cb77c	6280	Ankaran/Ancarano
00050000-55e4-6931-8c68-91a7197c0a29	9253	Apače
00050000-55e4-6931-c7fa-aa5916a307c1	8253	Artiče
00050000-55e4-6931-775d-519dc1c5ba9b	4275	Begunje na Gorenjskem
00050000-55e4-6931-4fa7-3109919d70cd	1382	Begunje pri Cerknici
00050000-55e4-6931-7642-15148cd2b868	9231	Beltinci
00050000-55e4-6931-9046-36422b3161fb	2234	Benedikt
00050000-55e4-6931-2e2f-8b8b2d38b0b5	2345	Bistrica ob Dravi
00050000-55e4-6931-1d43-b8e293d406f5	3256	Bistrica ob Sotli
00050000-55e4-6931-5214-55eb0d1f17c4	8259	Bizeljsko
00050000-55e4-6931-c839-86a69b26871a	1223	Blagovica
00050000-55e4-6931-33f1-fe8b7b9ff367	8283	Blanca
00050000-55e4-6931-6d07-0bac270f27af	4260	Bled
00050000-55e4-6931-ad17-9641cbc0cb6e	4273	Blejska Dobrava
00050000-55e4-6931-f370-cdb8e06bd15a	9265	Bodonci
00050000-55e4-6931-600b-d6056b68aa60	9222	Bogojina
00050000-55e4-6931-ecb3-aa6a7820c6f6	4263	Bohinjska Bela
00050000-55e4-6931-a64d-23655567abc9	4264	Bohinjska Bistrica
00050000-55e4-6931-569e-b0505cebfca0	4265	Bohinjsko jezero
00050000-55e4-6931-b1ee-44ff17ac7ba9	1353	Borovnica
00050000-55e4-6931-1bdb-3393a9bbdc14	8294	Boštanj
00050000-55e4-6931-2c48-4cbd838f8443	5230	Bovec
00050000-55e4-6931-64c8-cf06fc94ee3f	5295	Branik
00050000-55e4-6931-aed9-dff2ebfc586f	3314	Braslovče
00050000-55e4-6931-96e4-dbce1843193c	5223	Breginj
00050000-55e4-6931-3e05-f7b4af5644cd	8280	Brestanica
00050000-55e4-6931-dc84-e110f1ac01bb	2354	Bresternica
00050000-55e4-6931-13c3-488e45188751	4243	Brezje
00050000-55e4-6931-8aaf-ad7588114037	1351	Brezovica pri Ljubljani
00050000-55e4-6931-6a0c-1c1fe6afb234	8250	Brežice
00050000-55e4-6931-8e44-0ca1e80e090a	4210	Brnik - Aerodrom
00050000-55e4-6931-29be-6dd26be4cf9d	8321	Brusnice
00050000-55e4-6931-15e1-7462ec4f76c5	3255	Buče
00050000-55e4-6931-3fa8-e123d8f4d9a7	8276	Bučka 
00050000-55e4-6931-9a12-78c3bdbaf7a4	9261	Cankova
00050000-55e4-6931-7de0-8cf182f10e2d	3000	Celje 
00050000-55e4-6931-e0da-43798b3c8c15	3001	Celje - poštni predali
00050000-55e4-6931-cd4e-beee5032ccd2	4207	Cerklje na Gorenjskem
00050000-55e4-6931-a35e-8913ebdff557	8263	Cerklje ob Krki
00050000-55e4-6931-2565-05b2eba95b64	1380	Cerknica
00050000-55e4-6931-05de-606471d459c7	5282	Cerkno
00050000-55e4-6931-7d47-d44693956754	2236	Cerkvenjak
00050000-55e4-6931-2f73-86f5e1bc5fbb	2215	Ceršak
00050000-55e4-6931-e916-a9420cc2a0a9	2326	Cirkovce
00050000-55e4-6931-7f42-daa8f49eb812	2282	Cirkulane
00050000-55e4-6931-bf47-eb7d308f82af	5273	Col
00050000-55e4-6931-331b-134a3c40cc9f	8251	Čatež ob Savi
00050000-55e4-6931-4df9-ddf38a8781dd	1413	Čemšenik
00050000-55e4-6931-c046-e1be3c0a27ae	5253	Čepovan
00050000-55e4-6931-ac63-caab7f5a1ffb	9232	Črenšovci
00050000-55e4-6931-7117-69f94ec58bf2	2393	Črna na Koroškem
00050000-55e4-6931-f0ec-5238db9be06a	6275	Črni Kal
00050000-55e4-6931-d28d-51c65edf81f4	5274	Črni Vrh nad Idrijo
00050000-55e4-6931-13ac-86bfeaf84ca9	5262	Črniče
00050000-55e4-6931-1676-53a66df88f26	8340	Črnomelj
00050000-55e4-6931-4266-ab63a8b86934	6271	Dekani
00050000-55e4-6931-d0a8-1af5c49170af	5210	Deskle
00050000-55e4-6931-af21-82a16b9ef8c1	2253	Destrnik
00050000-55e4-6931-eb7a-22c60d52169c	6215	Divača
00050000-55e4-6931-3a27-e83c8c09f179	1233	Dob
00050000-55e4-6931-b8af-905d540c2e81	3224	Dobje pri Planini
00050000-55e4-6931-82fc-d86b26cecf4e	8257	Dobova
00050000-55e4-6931-4ac8-d9a52dd3950f	1423	Dobovec
00050000-55e4-6931-319b-2203374e4b95	5263	Dobravlje
00050000-55e4-6931-872a-06f5a907e15c	3204	Dobrna
00050000-55e4-6931-e1c3-215679fb27ba	8211	Dobrnič
00050000-55e4-6931-0c22-2e37f37f6a23	1356	Dobrova
00050000-55e4-6931-deda-6a34f1a44f45	9223	Dobrovnik/Dobronak 
00050000-55e4-6931-5a0c-fbc346eec1f0	5212	Dobrovo v Brdih
00050000-55e4-6931-2e55-e2f276881a0e	1431	Dol pri Hrastniku
00050000-55e4-6931-3a09-adbdfe48acd3	1262	Dol pri Ljubljani
00050000-55e4-6931-7663-02544004fa85	1273	Dole pri Litiji
00050000-55e4-6931-05f2-90e79aaf2f67	1331	Dolenja vas
00050000-55e4-6931-5c75-4e25b73eabe9	8350	Dolenjske Toplice
00050000-55e4-6931-3a4f-c33ca9953e16	1230	Domžale
00050000-55e4-6931-20de-18ad971aca38	2252	Dornava
00050000-55e4-6931-f988-60ab6df490ca	5294	Dornberk
00050000-55e4-6931-fe2f-b5f9e41ee62b	1319	Draga
00050000-55e4-6931-1783-591906c567c7	8343	Dragatuš
00050000-55e4-6931-5996-c992ce692c8c	3222	Dramlje
00050000-55e4-6931-0278-c4d5dae08691	2370	Dravograd
00050000-55e4-6931-0926-75e32093a2a8	4203	Duplje
00050000-55e4-6931-c301-8dc929ae14e0	6221	Dutovlje
00050000-55e4-6931-692a-07a96392cb6e	8361	Dvor
00050000-55e4-6931-322e-12c8873accde	2343	Fala
00050000-55e4-6931-ceca-1256d73c0d96	9208	Fokovci
00050000-55e4-6931-f37b-0628c51e1f7c	2313	Fram
00050000-55e4-6931-72b1-3a210a9ff865	3213	Frankolovo
00050000-55e4-6931-77dc-3643c3e64d03	1274	Gabrovka
00050000-55e4-6931-4115-31def691844e	8254	Globoko
00050000-55e4-6931-2019-29ccc3d6ab94	5275	Godovič
00050000-55e4-6931-4c4c-8bda0e030a87	4204	Golnik
00050000-55e4-6931-2a91-82d0d7c87fe6	3303	Gomilsko
00050000-55e4-6931-bd11-429abd790abe	4224	Gorenja vas
00050000-55e4-6931-6e20-004f9d39267e	3263	Gorica pri Slivnici
00050000-55e4-6931-a119-4b48eb913a9a	2272	Gorišnica
00050000-55e4-6931-08c0-fad938ff3d21	9250	Gornja Radgona
00050000-55e4-6931-18e9-df8b050179b9	3342	Gornji Grad
00050000-55e4-6931-bc84-d43a01aa39ba	4282	Gozd Martuljek
00050000-55e4-6931-3faf-9562f96c0d20	6272	Gračišče
00050000-55e4-6931-e13c-4c931b1e005c	9264	Grad
00050000-55e4-6931-ef03-86c462956180	8332	Gradac
00050000-55e4-6931-0cc4-7b9576a03fa6	1384	Grahovo
00050000-55e4-6931-e2bb-c2f976c59e9d	5242	Grahovo ob Bači
00050000-55e4-6931-f118-6951d4b8534e	5251	Grgar
00050000-55e4-6931-91be-06d8dff869f2	3302	Griže
00050000-55e4-6931-80bb-afa7c8d48170	3231	Grobelno
00050000-55e4-6931-337a-0b0989de2f47	1290	Grosuplje
00050000-55e4-6931-cc7f-58ad5f9e6c58	2288	Hajdina
00050000-55e4-6931-a508-69d4155048e1	8362	Hinje
00050000-55e4-6931-00fd-f24c783d4212	2311	Hoče
00050000-55e4-6931-b40f-a56e6576a13a	9205	Hodoš/Hodos
00050000-55e4-6931-780f-b8db245b52c0	1354	Horjul
00050000-55e4-6931-0b65-c83c77a0fdf8	1372	Hotedršica
00050000-55e4-6931-de0a-e07d9d86bfd1	1430	Hrastnik
00050000-55e4-6931-45d1-0d006eca0b91	6225	Hruševje
00050000-55e4-6931-ae99-2d7c7b8c7f56	4276	Hrušica
00050000-55e4-6931-5837-c316980744d7	5280	Idrija
00050000-55e4-6931-7d2f-519ecb057666	1292	Ig
00050000-55e4-6931-7b6f-ae2ad66214ce	6250	Ilirska Bistrica
00050000-55e4-6931-a105-4abcd1784011	6251	Ilirska Bistrica-Trnovo
00050000-55e4-6931-e8d4-3cac9bc7f375	1295	Ivančna Gorica
00050000-55e4-6931-cc66-feebd4710474	2259	Ivanjkovci
00050000-55e4-6931-7b78-6208c6ceb671	1411	Izlake
00050000-55e4-6931-660f-4b80bf885f69	6310	Izola/Isola
00050000-55e4-6931-b259-3a89933505bd	2222	Jakobski Dol
00050000-55e4-6931-1cbc-f4df085325ce	2221	Jarenina
00050000-55e4-6931-4655-046fab1067f3	6254	Jelšane
00050000-55e4-6931-7547-c3960965195c	4270	Jesenice
00050000-55e4-6931-b052-101449a427e6	8261	Jesenice na Dolenjskem
00050000-55e4-6931-8670-8ddd85b7f3fb	3273	Jurklošter
00050000-55e4-6931-d9b8-55b4311e6ace	2223	Jurovski Dol
00050000-55e4-6931-a574-1e5784705580	2256	Juršinci
00050000-55e4-6931-52ab-73ef60754a97	5214	Kal nad Kanalom
00050000-55e4-6931-350f-4c98e2732f95	3233	Kalobje
00050000-55e4-6931-381a-f4d91d780f80	4246	Kamna Gorica
00050000-55e4-6931-f8b9-220e2cf458aa	2351	Kamnica
00050000-55e4-6931-aba7-4cd723001db5	1241	Kamnik
00050000-55e4-6931-65db-35c6ce5fa5a5	5213	Kanal
00050000-55e4-6931-f1cb-f1201e7386fd	8258	Kapele
00050000-55e4-6931-c927-770f8e3496ea	2362	Kapla
00050000-55e4-6931-501e-614ccb70f00c	2325	Kidričevo
00050000-55e4-6931-592a-bb41361be46d	1412	Kisovec
00050000-55e4-6931-dbba-0f41b9629852	6253	Knežak
00050000-55e4-6931-8806-2de65654a94b	5222	Kobarid
00050000-55e4-6931-da2b-3073c04efc28	9227	Kobilje
00050000-55e4-6931-b09a-f6c168477077	1330	Kočevje
00050000-55e4-6931-9a49-2a1a961578dc	1338	Kočevska Reka
00050000-55e4-6931-49d6-1eb47c8a420d	2276	Kog
00050000-55e4-6931-64f6-5dfce5e6b543	5211	Kojsko
00050000-55e4-6931-0e51-36d396c50261	6223	Komen
00050000-55e4-6931-dee4-9b3dfdd54b1f	1218	Komenda
00050000-55e4-6931-7bc2-4d8b688c9329	6000	Koper/Capodistria 
00050000-55e4-6931-4649-3874fd8e5da0	6001	Koper/Capodistria - poštni predali
00050000-55e4-6931-74a8-db66f7ca347f	8282	Koprivnica
00050000-55e4-6931-547b-b7cd77129d36	5296	Kostanjevica na Krasu
00050000-55e4-6931-03ee-ea75f73368be	8311	Kostanjevica na Krki
00050000-55e4-6931-3549-0e430b7b5209	1336	Kostel
00050000-55e4-6931-6896-a1b07b5e53bf	6256	Košana
00050000-55e4-6931-aa6a-db61e604df91	2394	Kotlje
00050000-55e4-6931-510c-3b8af942ac7d	6240	Kozina
00050000-55e4-6931-5340-dd4f118736eb	3260	Kozje
00050000-55e4-6931-c607-6c8617fbb7f3	4000	Kranj 
00050000-55e4-6931-c1d5-80a53ebd0e73	4001	Kranj - poštni predali
00050000-55e4-6931-6b34-c17c8c5310ce	4280	Kranjska Gora
00050000-55e4-6931-0c36-fe4f49f63143	1281	Kresnice
00050000-55e4-6931-c593-8ec5774c37e1	4294	Križe
00050000-55e4-6931-5c9a-135bf0217d21	9206	Križevci
00050000-55e4-6931-9ec3-cb52c3318d60	9242	Križevci pri Ljutomeru
00050000-55e4-6931-d730-bba0576587eb	1301	Krka
00050000-55e4-6931-4999-df3121fae321	8296	Krmelj
00050000-55e4-6931-1f13-4dd2abb4888a	4245	Kropa
00050000-55e4-6931-8d77-1311c1b1d180	8262	Krška vas
00050000-55e4-6931-3a54-aeacad6ae485	8270	Krško
00050000-55e4-6931-299e-af587ec27565	9263	Kuzma
00050000-55e4-6931-5bdb-77949d61818f	2318	Laporje
00050000-55e4-6931-3c84-3ca8d6cd96c2	3270	Laško
00050000-55e4-6931-f3a3-08ca1c10c89b	1219	Laze v Tuhinju
00050000-55e4-6931-5c3a-a13c72e02d56	2230	Lenart v Slovenskih goricah
00050000-55e4-6931-760b-1e4771a9b18f	9220	Lendava/Lendva
00050000-55e4-6931-1906-5265fc02f561	4248	Lesce
00050000-55e4-6931-3e7f-183708684956	3261	Lesično
00050000-55e4-6931-d418-25c6ff5cf723	8273	Leskovec pri Krškem
00050000-55e4-6931-d23e-5a16a38c27db	2372	Libeliče
00050000-55e4-6931-6563-54639d6b07f3	2341	Limbuš
00050000-55e4-6931-c344-0cfff01a03b0	1270	Litija
00050000-55e4-6931-547a-7ad70b494d81	3202	Ljubečna
00050000-55e4-6931-4afa-c301faa38bb5	1000	Ljubljana 
00050000-55e4-6931-a45d-a99774f6dec7	1001	Ljubljana - poštni predali
00050000-55e4-6931-02e5-cdef34bbff0c	1231	Ljubljana - Črnuče
00050000-55e4-6931-36f4-934d323528dc	1261	Ljubljana - Dobrunje
00050000-55e4-6931-8be3-e6a424006034	1260	Ljubljana - Polje
00050000-55e4-6931-641e-9b4d69a3e1d2	1210	Ljubljana - Šentvid
00050000-55e4-6931-17d1-7b583496d30d	1211	Ljubljana - Šmartno
00050000-55e4-6931-8560-83bcf48e0eac	3333	Ljubno ob Savinji
00050000-55e4-6931-d9de-0e949eb718c2	9240	Ljutomer
00050000-55e4-6931-2d6e-d51c62969f37	3215	Loče
00050000-55e4-6931-63f4-9295e8fdb0be	5231	Log pod Mangartom
00050000-55e4-6931-8358-be87d76ffdc5	1358	Log pri Brezovici
00050000-55e4-6931-83d5-a742f8055ff2	1370	Logatec
00050000-55e4-6931-08ef-bbe7f9581381	1371	Logatec
00050000-55e4-6931-aa07-20343cce6d7d	1434	Loka pri Zidanem Mostu
00050000-55e4-6931-7fcf-e320c4da1381	3223	Loka pri Žusmu
00050000-55e4-6931-05be-e940c41c2cf2	6219	Lokev
00050000-55e4-6931-6f98-9de27df86afe	1318	Loški Potok
00050000-55e4-6931-f92a-bd811545e6b2	2324	Lovrenc na Dravskem polju
00050000-55e4-6931-42a3-d249fe437003	2344	Lovrenc na Pohorju
00050000-55e4-6931-31ae-d807b74661b0	3334	Luče
00050000-55e4-6931-4e09-1caa63512130	1225	Lukovica
00050000-55e4-6931-eaab-8477abaaafe7	9202	Mačkovci
00050000-55e4-6931-dbf8-f669f3f81d26	2322	Majšperk
00050000-55e4-6931-1f0e-2354c5f02400	2321	Makole
00050000-55e4-6931-124c-8077e1404b02	9243	Mala Nedelja
00050000-55e4-6931-97ca-02ca385811f4	2229	Malečnik
00050000-55e4-6931-1cfb-430e2620cef3	6273	Marezige
00050000-55e4-6931-d0b2-71023fcd42af	2000	Maribor 
00050000-55e4-6931-773a-12744f58a35c	2001	Maribor - poštni predali
00050000-55e4-6931-99c7-d53dbf366d09	2206	Marjeta na Dravskem polju
00050000-55e4-6931-4f41-85c341e3ba03	2281	Markovci
00050000-55e4-6931-7039-ad995d6f3328	9221	Martjanci
00050000-55e4-6931-59c5-03914cd62378	6242	Materija
00050000-55e4-6931-91c8-616387c40c4c	4211	Mavčiče
00050000-55e4-6931-7188-d9f1084bc1bd	1215	Medvode
00050000-55e4-6931-169b-f23c2a9a46ce	1234	Mengeš
00050000-55e4-6931-64df-fe74ebafb1cc	8330	Metlika
00050000-55e4-6931-8871-7c7b17380099	2392	Mežica
00050000-55e4-6931-d2bd-f36ba03f5aa7	2204	Miklavž na Dravskem polju
00050000-55e4-6931-40ac-03e84a8df09d	2275	Miklavž pri Ormožu
00050000-55e4-6931-700d-e9ab8b31d6f7	5291	Miren
00050000-55e4-6931-0c2b-3828f20d3d01	8233	Mirna
00050000-55e4-6931-3d86-2b627450e045	8216	Mirna Peč
00050000-55e4-6931-5c4d-2042782aab0b	2382	Mislinja
00050000-55e4-6931-78b3-f6198347d156	4281	Mojstrana
00050000-55e4-6931-e870-582334fafb7e	8230	Mokronog
00050000-55e4-6931-4ef2-33706ba5385a	1251	Moravče
00050000-55e4-6931-4741-923ef2111e4a	9226	Moravske Toplice
00050000-55e4-6931-7c1a-e6ef4c72cde6	5216	Most na Soči
00050000-55e4-6931-ca40-39986f3e5277	1221	Motnik
00050000-55e4-6931-f0ed-107bbf20bce6	3330	Mozirje
00050000-55e4-6931-b7ff-4dee6636258a	9000	Murska Sobota 
00050000-55e4-6931-3da4-e017fe279121	9001	Murska Sobota - poštni predali
00050000-55e4-6931-d4ca-6885163e06ac	2366	Muta
00050000-55e4-6931-0941-807f67f1cbb5	4202	Naklo
00050000-55e4-6931-86a7-2a4be382d471	3331	Nazarje
00050000-55e4-6931-f373-54401c612ea5	1357	Notranje Gorice
00050000-55e4-6931-72e5-f6d32489bd66	3203	Nova Cerkev
00050000-55e4-6931-4b3f-2be293a0d619	5000	Nova Gorica 
00050000-55e4-6931-6561-80a63b9a13df	5001	Nova Gorica - poštni predali
00050000-55e4-6931-1742-db40f65a0fa6	1385	Nova vas
00050000-55e4-6931-ecfe-94d74ff4baaa	8000	Novo mesto
00050000-55e4-6931-ea02-8cce3a861b07	8001	Novo mesto - poštni predali
00050000-55e4-6931-292f-310feeeab44d	6243	Obrov
00050000-55e4-6931-b1a4-417ef4b0b110	9233	Odranci
00050000-55e4-6931-ac00-c864ed05444c	2317	Oplotnica
00050000-55e4-6931-1c09-4b1e9453f520	2312	Orehova vas
00050000-55e4-6931-c962-51a5ab091ba5	2270	Ormož
00050000-55e4-6931-633d-038c4fdaf96b	1316	Ortnek
00050000-55e4-6931-45b3-ea89e84b5eb2	1337	Osilnica
00050000-55e4-6931-db84-e5770fbb0d28	8222	Otočec
00050000-55e4-6931-371f-f308e4f26e10	2361	Ožbalt
00050000-55e4-6931-794d-4e512fd253c3	2231	Pernica
00050000-55e4-6931-db7b-938b2f91643f	2211	Pesnica pri Mariboru
00050000-55e4-6931-8bd8-9dd03b114d42	9203	Petrovci
00050000-55e4-6931-89ac-4de7b15b8f83	3301	Petrovče
00050000-55e4-6931-505a-456fa4c14222	6330	Piran/Pirano
00050000-55e4-6931-8074-8ea2f6b0b560	8255	Pišece
00050000-55e4-6931-e17f-dcb4ae28df06	6257	Pivka
00050000-55e4-6931-30f5-fc2caeaab2b1	6232	Planina
00050000-55e4-6931-c6ff-fc85c6854ea5	3225	Planina pri Sevnici
00050000-55e4-6931-dc92-663a24b9188b	6276	Pobegi
00050000-55e4-6931-d35c-9d331a6342c6	8312	Podbočje
00050000-55e4-6931-7ae1-742881ba9c36	5243	Podbrdo
00050000-55e4-6931-798e-56413bea091d	3254	Podčetrtek
00050000-55e4-6931-56e4-221d6efe3b12	2273	Podgorci
00050000-55e4-6931-1263-c5a826805cc6	6216	Podgorje
00050000-55e4-6931-717f-aaad6c787433	2381	Podgorje pri Slovenj Gradcu
00050000-55e4-6931-9b81-9cf8e2de1ba4	6244	Podgrad
00050000-55e4-6931-d875-3438269a73e2	1414	Podkum
00050000-55e4-6931-0a8c-d38c7e2696d7	2286	Podlehnik
00050000-55e4-6931-46b7-79352bc0bd13	5272	Podnanos
00050000-55e4-6931-6f36-08b85cea8828	4244	Podnart
00050000-55e4-6931-fad1-f1ccd1c53590	3241	Podplat
00050000-55e4-6931-0bd5-1714b5ebff91	3257	Podsreda
00050000-55e4-6931-d268-6bb4efde6e66	2363	Podvelka
00050000-55e4-6931-e2a0-03ab620b926e	2208	Pohorje
00050000-55e4-6931-1e95-5ea64e19fbd0	2257	Polenšak
00050000-55e4-6931-d778-61fbd0b1757a	1355	Polhov Gradec
00050000-55e4-6931-75db-40fed89757ca	4223	Poljane nad Škofjo Loko
00050000-55e4-6931-c5d4-d0be07728379	2319	Poljčane
00050000-55e4-6931-5da6-e7b596845a53	1272	Polšnik
00050000-55e4-6931-757b-191fce306fbd	3313	Polzela
00050000-55e4-6931-3324-c9304794fd2b	3232	Ponikva
00050000-55e4-6931-b21d-e32b25b617e6	6320	Portorož/Portorose
00050000-55e4-6931-de87-0cd83a3f5ec0	6230	Postojna
00050000-55e4-6931-f2ea-379f2bc598e9	2331	Pragersko
00050000-55e4-6931-930d-65e76f0fe262	3312	Prebold
00050000-55e4-6931-3131-2b8fd2ab7480	4205	Preddvor
00050000-55e4-6931-588f-11402615bbdd	6255	Prem
00050000-55e4-6931-9a99-792702f72708	1352	Preserje
00050000-55e4-6931-9866-6884c4931b7a	6258	Prestranek
00050000-55e4-6931-eb6c-b367e824c374	2391	Prevalje
00050000-55e4-6931-e516-ee8baadbdaf3	3262	Prevorje
00050000-55e4-6931-9f12-d472bfaa9c5b	1276	Primskovo 
00050000-55e4-6931-86a8-1f9ad156bc3a	3253	Pristava pri Mestinju
00050000-55e4-6931-7eba-c628af87df8e	9207	Prosenjakovci/Partosfalva
00050000-55e4-6931-201b-1c898a12eae1	5297	Prvačina
00050000-55e4-6931-77c0-58df11be8a35	2250	Ptuj
00050000-55e4-6931-3249-f79e24ae485a	2323	Ptujska Gora
00050000-55e4-6931-fe26-801e66ea9ae9	9201	Puconci
00050000-55e4-6931-02ab-0391f740f38f	2327	Rače
00050000-55e4-6931-ad57-b2125c2eaf81	1433	Radeče
00050000-55e4-6931-8f13-ceb3650784e8	9252	Radenci
00050000-55e4-6931-3d87-f5ea9350b5a5	2360	Radlje ob Dravi
00050000-55e4-6931-c885-6d902a8544e7	1235	Radomlje
00050000-55e4-6931-7302-85cbf816a61d	4240	Radovljica
00050000-55e4-6931-a6d8-a6fa68816114	8274	Raka
00050000-55e4-6931-fc49-33db6fd6ea69	1381	Rakek
00050000-55e4-6931-bae4-953e6e720d39	4283	Rateče - Planica
00050000-55e4-6931-3a20-7decb124d27a	2390	Ravne na Koroškem
00050000-55e4-6931-1fc9-e140e9382510	9246	Razkrižje
00050000-55e4-6931-20ba-cabf4fda1e23	3332	Rečica ob Savinji
00050000-55e4-6931-2fdc-5779d1525470	5292	Renče
00050000-55e4-6931-d0d2-aa89b5488d7d	1310	Ribnica
00050000-55e4-6931-0ff8-01cf233c4260	2364	Ribnica na Pohorju
00050000-55e4-6931-a02e-d18bb58a6e05	3272	Rimske Toplice
00050000-55e4-6931-fbea-1c3ed9ad79ec	1314	Rob
00050000-55e4-6931-c6bf-4ce2943966e2	5215	Ročinj
00050000-55e4-6931-8230-ec3655918f4d	3250	Rogaška Slatina
00050000-55e4-6931-3070-e36096eda37a	9262	Rogašovci
00050000-55e4-6931-ac89-60fd198542c0	3252	Rogatec
00050000-55e4-6931-f818-8938debc4cc7	1373	Rovte
00050000-55e4-6931-ddb2-0b12ae2f1c8a	2342	Ruše
00050000-55e4-6931-bc04-f9685ddad64d	1282	Sava
00050000-55e4-6931-ec2a-1a572ebce3d0	6333	Sečovlje/Sicciole
00050000-55e4-6931-e53b-702df7fdf42d	4227	Selca
00050000-55e4-6931-3981-c43ea1603f9b	2352	Selnica ob Dravi
00050000-55e4-6931-deab-9c2248b33406	8333	Semič
00050000-55e4-6931-8828-6e376039fae1	8281	Senovo
00050000-55e4-6931-7482-f6e3c7c93586	6224	Senožeče
00050000-55e4-6931-f80d-35f64a0e47b1	8290	Sevnica
00050000-55e4-6931-e6f3-8e0e182dff56	6210	Sežana
00050000-55e4-6931-ceb7-53a501af9739	2214	Sladki Vrh
00050000-55e4-6931-b6f4-784a299d2831	5283	Slap ob Idrijci
00050000-55e4-6931-65d2-e775e7107832	2380	Slovenj Gradec
00050000-55e4-6931-3a12-717478d26e0c	2310	Slovenska Bistrica
00050000-55e4-6931-a7f9-1d0a1dd78469	3210	Slovenske Konjice
00050000-55e4-6931-8511-8e3e69ec5fe9	1216	Smlednik
00050000-55e4-6931-2da5-f48f52f809e1	5232	Soča
00050000-55e4-6931-7538-9992cff51bf3	1317	Sodražica
00050000-55e4-6931-79ae-60fe3fe69d54	3335	Solčava
00050000-55e4-6931-c6b9-bc5ad4cba449	5250	Solkan
00050000-55e4-6931-9493-ec2c88f5a1c7	4229	Sorica
00050000-55e4-6931-a6a5-b27a5e38de8f	4225	Sovodenj
00050000-55e4-6931-e6b0-ef0e3e75a632	5281	Spodnja Idrija
00050000-55e4-6931-200a-5939cbcc87ec	2241	Spodnji Duplek
00050000-55e4-6931-b5d0-d3b840a570f7	9245	Spodnji Ivanjci
00050000-55e4-6931-9e3e-c791661d554e	2277	Središče ob Dravi
00050000-55e4-6931-b036-a6322bb6cc97	4267	Srednja vas v Bohinju
00050000-55e4-6931-6e5c-78a01af9c6d2	8256	Sromlje 
00050000-55e4-6931-e7c8-dc4ccbf5e22d	5224	Srpenica
00050000-55e4-6931-ce6a-5ff77aed0023	1242	Stahovica
00050000-55e4-6931-4bac-3b075e83336a	1332	Stara Cerkev
00050000-55e4-6931-c807-01d703d37e29	8342	Stari trg ob Kolpi
00050000-55e4-6931-7602-587d6c0bef8c	1386	Stari trg pri Ložu
00050000-55e4-6931-5fc1-2a41125fb7a6	2205	Starše
00050000-55e4-6931-a58d-781d91013612	2289	Stoperce
00050000-55e4-6931-5db5-c4fe3d08889e	8322	Stopiče
00050000-55e4-6931-9f3f-9fcaaf666564	3206	Stranice
00050000-55e4-6931-fc0d-e5bdaf15ee5b	8351	Straža
00050000-55e4-6931-82a4-9e9b1dbe2920	1313	Struge
00050000-55e4-6931-654b-edab1ef98b9c	8293	Studenec
00050000-55e4-6931-4f6b-615f9363ec20	8331	Suhor
00050000-55e4-6931-2fb9-fe7a7018ebf4	2233	Sv. Ana v Slovenskih goricah
00050000-55e4-6931-97af-4c38a63a71aa	2235	Sv. Trojica v Slovenskih goricah
00050000-55e4-6931-351b-9d950b8c4a6e	2353	Sveti Duh na Ostrem Vrhu
00050000-55e4-6931-45f7-5d6cfef084c1	9244	Sveti Jurij ob Ščavnici
00050000-55e4-6931-8cc4-2f74d24fbc35	3264	Sveti Štefan
00050000-55e4-6931-120d-29fff7d56d0f	2258	Sveti Tomaž
00050000-55e4-6931-725c-509bedea0180	9204	Šalovci
00050000-55e4-6931-30eb-966bf9c3fb63	5261	Šempas
00050000-55e4-6931-377c-d257aa32ba73	5290	Šempeter pri Gorici
00050000-55e4-6931-4686-6730c91423a0	3311	Šempeter v Savinjski dolini
00050000-55e4-6931-7b89-e600ae08cde1	4208	Šenčur
00050000-55e4-6931-f033-cd995f8b8042	2212	Šentilj v Slovenskih goricah
00050000-55e4-6931-823e-ede7b7717dbf	8297	Šentjanž
00050000-55e4-6931-3582-3290ddfacbb1	2373	Šentjanž pri Dravogradu
00050000-55e4-6931-6fb1-7fc1ef020275	8310	Šentjernej
00050000-55e4-6931-2229-bb724794db45	3230	Šentjur
00050000-55e4-6931-35f3-ef6ff7452cf7	3271	Šentrupert
00050000-55e4-6931-f7d8-0e9ca39f0324	8232	Šentrupert
00050000-55e4-6931-b772-1ff0ae92bb89	1296	Šentvid pri Stični
00050000-55e4-6931-e7b3-921c79e129d8	8275	Škocjan
00050000-55e4-6931-f538-5034a4f62b84	6281	Škofije
00050000-55e4-6931-f746-65f829d15242	4220	Škofja Loka
00050000-55e4-6931-5dd5-38a09a8b7dd8	3211	Škofja vas
00050000-55e4-6931-273f-51b7037f7490	1291	Škofljica
00050000-55e4-6931-27ee-860e40ce7dfd	6274	Šmarje
00050000-55e4-6931-f084-5057efe2c2ac	1293	Šmarje - Sap
00050000-55e4-6931-fd15-94c773758cb7	3240	Šmarje pri Jelšah
00050000-55e4-6931-c72c-83b1d76e9efe	8220	Šmarješke Toplice
00050000-55e4-6931-2e80-9fa2fd02350a	2315	Šmartno na Pohorju
00050000-55e4-6931-16f2-d26b30092fd4	3341	Šmartno ob Dreti
00050000-55e4-6931-51f4-d8bfb6f56d6d	3327	Šmartno ob Paki
00050000-55e4-6931-bfd2-a3c3e2e1d89d	1275	Šmartno pri Litiji
00050000-55e4-6931-785e-5fefe476c0c1	2383	Šmartno pri Slovenj Gradcu
00050000-55e4-6931-38dd-b9a9dfdcce1b	3201	Šmartno v Rožni dolini
00050000-55e4-6931-3f62-73139024ddd0	3325	Šoštanj
00050000-55e4-6931-9808-98d73e359086	6222	Štanjel
00050000-55e4-6931-8c99-3f36970a6221	3220	Štore
00050000-55e4-6931-56df-53b9042a2a2c	3304	Tabor
00050000-55e4-6931-93a5-be02f87de5e8	3221	Teharje
00050000-55e4-6931-ab70-7b168de469c8	9251	Tišina
00050000-55e4-6931-9b48-54002a95309d	5220	Tolmin
00050000-55e4-6931-48f7-2986b13b292e	3326	Topolšica
00050000-55e4-6931-4f78-01a4814272f5	2371	Trbonje
00050000-55e4-6931-2fca-34082d412d77	1420	Trbovlje
00050000-55e4-6931-14fe-f72e6120ddfe	8231	Trebelno 
00050000-55e4-6931-e9e6-f3bc62e1939a	8210	Trebnje
00050000-55e4-6931-cac6-d59b4f948e23	5252	Trnovo pri Gorici
00050000-55e4-6931-f443-c78c1abd2838	2254	Trnovska vas
00050000-55e4-6931-bb08-d6d6bc4dd0c1	1222	Trojane
00050000-55e4-6931-b91e-ac737960c182	1236	Trzin
00050000-55e4-6931-7ac5-c599d98afc5f	4290	Tržič
00050000-55e4-6931-4b27-63fad9a991e0	8295	Tržišče
00050000-55e4-6931-5d7f-3eefa526e85d	1311	Turjak
00050000-55e4-6931-fec5-9ccd6b622bea	9224	Turnišče
00050000-55e4-6931-005b-8b266033d7ab	8323	Uršna sela
00050000-55e4-6931-b895-1efbbe084c8d	1252	Vače
00050000-55e4-6931-52f6-181c0da4f096	3320	Velenje 
00050000-55e4-6931-31de-7cac8f745d84	3322	Velenje - poštni predali
00050000-55e4-6931-dc31-bf91a66c9c9a	8212	Velika Loka
00050000-55e4-6931-08fc-21c49c5a1ccf	2274	Velika Nedelja
00050000-55e4-6931-158a-557eed14a47b	9225	Velika Polana
00050000-55e4-6931-96c4-a1c7af27d5ff	1315	Velike Lašče
00050000-55e4-6931-54c4-471c43d7e5c0	8213	Veliki Gaber
00050000-55e4-6931-d471-24a68af10cc8	9241	Veržej
00050000-55e4-6931-2513-2cbe15347d04	1312	Videm - Dobrepolje
00050000-55e4-6931-ff09-744300ec7415	2284	Videm pri Ptuju
00050000-55e4-6931-ea38-e8d93bcb4064	8344	Vinica
00050000-55e4-6931-d5a7-f8f5734e5499	5271	Vipava
00050000-55e4-6931-75d2-7cbbfcd3d18a	4212	Visoko
00050000-55e4-6931-d80f-b7a3c5968f98	1294	Višnja Gora
00050000-55e4-6931-58bd-54abecc9e172	3205	Vitanje
00050000-55e4-6931-c5e3-2d6dd096fbb9	2255	Vitomarci
00050000-55e4-6931-9e14-b37b38b4e71d	1217	Vodice
00050000-55e4-6931-c89a-2e232a173b4c	3212	Vojnik\t
00050000-55e4-6931-b632-4a2adc56a7fe	5293	Volčja Draga
00050000-55e4-6931-e384-4594be362dcd	2232	Voličina
00050000-55e4-6931-dc59-1c154cfd0535	3305	Vransko
00050000-55e4-6931-fda9-c22674cce95f	6217	Vremski Britof
00050000-55e4-6931-7a73-ad6d987ca1da	1360	Vrhnika
00050000-55e4-6931-78c8-082839954759	2365	Vuhred
00050000-55e4-6931-848d-d3c060364cba	2367	Vuzenica
00050000-55e4-6931-9f01-75ad30f80548	8292	Zabukovje 
00050000-55e4-6931-d467-8d07d50fa483	1410	Zagorje ob Savi
00050000-55e4-6931-78af-54bc092d1661	1303	Zagradec
00050000-55e4-6931-cfff-2a2dc5bdcaf2	2283	Zavrč
00050000-55e4-6931-7c0d-ff88b88774af	8272	Zdole 
00050000-55e4-6931-763e-1b912d4fd2ac	4201	Zgornja Besnica
00050000-55e4-6931-d268-02bd4d008a33	2242	Zgornja Korena
00050000-55e4-6931-d7cf-2c4fd52800a3	2201	Zgornja Kungota
00050000-55e4-6931-11ca-bb9871d58570	2316	Zgornja Ložnica
00050000-55e4-6931-6abd-1269e9c62865	2314	Zgornja Polskava
00050000-55e4-6931-e897-34eb9f9662ef	2213	Zgornja Velka
00050000-55e4-6931-207b-f669657391e2	4247	Zgornje Gorje
00050000-55e4-6931-68cf-068a17f5886a	4206	Zgornje Jezersko
00050000-55e4-6931-0738-483414159a1c	2285	Zgornji Leskovec
00050000-55e4-6931-6909-0aa4bd77959c	1432	Zidani Most
00050000-55e4-6931-1c50-2fa85f33245d	3214	Zreče
00050000-55e4-6931-1566-8e6353b23f33	4209	Žabnica
00050000-55e4-6931-77c8-af1817c693bf	3310	Žalec
00050000-55e4-6931-2ce3-8101e16c5f1e	4228	Železniki
00050000-55e4-6931-445a-47ec78b0b5f0	2287	Žetale
00050000-55e4-6931-328a-5acbfbeefc8c	4226	Žiri
00050000-55e4-6931-c377-ff29175e8dca	4274	Žirovnica
00050000-55e4-6931-f859-e467c3c5a5dc	8360	Žužemberk
\.


--
-- TOC entry 2934 (class 0 OID 16706036)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 16705843)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55e4-6933-a026-a0e894adc00f	00080000-55e4-6933-3377-d617ba7f8edc	\N	00040000-55e4-6932-9934-20adbc8dbd62	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55e4-6933-2979-1d87408773f9	00080000-55e4-6933-3377-d617ba7f8edc	\N	00040000-55e4-6932-9934-20adbc8dbd62		\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55e4-6933-1e8c-da580651c817	00080000-55e4-6933-d449-1c43f7d012fc	\N	00040000-55e4-6932-9934-20adbc8dbd62		\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2922 (class 0 OID 16705921)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 16706048)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2960 (class 0 OID 16706399)
-- Dependencies: 226
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 16706409)
-- Dependencies: 227
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55e4-6933-fcb5-93d1997401f3	00080000-55e4-6933-a262-f8d7710647ad	0987	AK
00190000-55e4-6933-53c4-2ea5ef7f1edb	00080000-55e4-6933-d449-1c43f7d012fc	0989	AK
00190000-55e4-6933-4ed5-0c2fdf8a0caa	00080000-55e4-6933-5106-aadda1a9a115	0986	AK
00190000-55e4-6933-ba0f-081d010f7d23	00080000-55e4-6933-3ff1-d8922dfce883	0984	AK
00190000-55e4-6933-3c42-a0d4299543e0	00080000-55e4-6933-2d30-6ed9005e4188	0983	AK
00190000-55e4-6933-a8bc-95f320fc24f4	00080000-55e4-6933-85dc-89f2517b277f	0982	AK
00190000-55e4-6934-fe02-0d063c13b82c	00080000-55e4-6934-bf24-46a9b702b03b	1001	AK
\.


--
-- TOC entry 2959 (class 0 OID 16706355)
-- Dependencies: 225
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55e4-6933-d217-de5f42ef57ce	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2962 (class 0 OID 16706417)
-- Dependencies: 228
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 16706077)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55e4-6933-7dae-510e32fbb657	\N	\N	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55e4-6933-414f-d0b3d9b070a0	\N	\N	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55e4-6933-7faa-c89631112e80	\N	\N	0003	Kazinska	t	84	Kazinska dvorana
00220000-55e4-6933-5b56-14949347ea84	\N	\N	0004	Mali oder	t	24	Mali oder 
00220000-55e4-6933-9bc6-b1033b6f7a0e	\N	\N	0005	Komorni oder	t	15	Komorni oder
00220000-55e4-6933-fe8d-f56d7aa5cfb5	\N	\N	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55e4-6933-e2fb-ef803eaad824	\N	\N	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2932 (class 0 OID 16706021)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 16706011)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 16706208)
-- Dependencies: 218
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 16706147)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 16705716)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55e4-6934-bf24-46a9b702b03b	00010000-55e4-6932-fe49-e78d8b0fa0ae	2015-08-31 16:48:20	INS	a:0:{}
2	App\\Entity\\Option	00000000-55e4-6934-972e-6e31319069f2	00010000-55e4-6932-fe49-e78d8b0fa0ae	2015-08-31 16:48:20	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55e4-6934-fe02-0d063c13b82c	00010000-55e4-6932-fe49-e78d8b0fa0ae	2015-08-31 16:48:20	INS	a:0:{}
\.


--
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2941 (class 0 OID 16706089)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 16705754)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55e4-6932-0c37-478eea01726c	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55e4-6932-e37a-459cf670fd50	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55e4-6932-da8b-4f09f470c955	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55e4-6932-19e0-e5c658c72028	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55e4-6932-b8fd-8b9f78576499	planer	Planer dogodkov v koledarju	t
00020000-55e4-6932-aa21-e9b35cbb16bb	kadrovska	Kadrovska služba	t
00020000-55e4-6932-7d8c-ca693523bd3c	arhivar	Ažuriranje arhivalij	t
00020000-55e4-6932-df7b-cf8d4d8ecfd2	igralec	Igralec	t
00020000-55e4-6932-1789-43d117da4152	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55e4-6933-c55f-cc6dd46cc486	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2907 (class 0 OID 16705738)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55e4-6932-39f4-6715501a938a	00020000-55e4-6932-da8b-4f09f470c955
00010000-55e4-6932-fe49-e78d8b0fa0ae	00020000-55e4-6932-da8b-4f09f470c955
00010000-55e4-6933-06e0-1c03eb1cd159	00020000-55e4-6933-c55f-cc6dd46cc486
\.


--
-- TOC entry 2943 (class 0 OID 16706103)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 16706042)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 16705988)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 16706458)
-- Dependencies: 233
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55e4-6932-4ceb-25e8fd4bb6aa	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55e4-6932-5061-09e46a9a62e4	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55e4-6932-618d-622fe388c9a3	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55e4-6932-a37e-04bddba9e73a	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55e4-6932-f9f5-98e1c8329cb0	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2966 (class 0 OID 16706450)
-- Dependencies: 232
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55e4-6932-b3f3-fefd4f4efa3b	00230000-55e4-6932-a37e-04bddba9e73a	popa
00240000-55e4-6932-a8d0-ccb04c2ddd89	00230000-55e4-6932-a37e-04bddba9e73a	oseba
00240000-55e4-6932-81ab-47f29ed1b960	00230000-55e4-6932-a37e-04bddba9e73a	sezona
00240000-55e4-6932-5009-17e0cda3eecc	00230000-55e4-6932-5061-09e46a9a62e4	prostor
00240000-55e4-6932-9d56-6a98c6c6b6f7	00230000-55e4-6932-a37e-04bddba9e73a	besedilo
00240000-55e4-6932-b520-8465bf5e7bae	00230000-55e4-6932-a37e-04bddba9e73a	uprizoritev
00240000-55e4-6932-e7ad-607d1d9ae4cd	00230000-55e4-6932-a37e-04bddba9e73a	funkcija
00240000-55e4-6932-262c-608218f258aa	00230000-55e4-6932-a37e-04bddba9e73a	tipfunkcije
00240000-55e4-6932-360f-899a7f251162	00230000-55e4-6932-a37e-04bddba9e73a	alternacija
00240000-55e4-6932-78cb-988f7003f484	00230000-55e4-6932-4ceb-25e8fd4bb6aa	pogodba
00240000-55e4-6932-f550-6dd6d4141820	00230000-55e4-6932-a37e-04bddba9e73a	zaposlitev
00240000-55e4-6932-c58e-5be166447745	00230000-55e4-6932-4ceb-25e8fd4bb6aa	programdela
00240000-55e4-6932-a6e1-d325e8cd1f8f	00230000-55e4-6932-a37e-04bddba9e73a	zapis
\.


--
-- TOC entry 2965 (class 0 OID 16706445)
-- Dependencies: 231
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
9f977ee4-0282-4f52-844d-ce60f21c1183	00230000-55e4-6932-a37e-04bddba9e73a	0	1001
\.


--
-- TOC entry 2948 (class 0 OID 16706157)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55e4-6933-cc85-db9288278d0b	000e0000-55e4-6933-f7da-20a322a7c5ef	00080000-55e4-6933-3377-d617ba7f8edc	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55e4-6932-3b06-12f66415c9f5
00270000-55e4-6933-f5b5-c62339c45d6e	000e0000-55e4-6933-f7da-20a322a7c5ef	00080000-55e4-6933-3377-d617ba7f8edc	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55e4-6932-3b06-12f66415c9f5
00270000-55e4-6933-a873-ab3a16b9432e	000e0000-55e4-6933-f7da-20a322a7c5ef	00080000-55e4-6933-d0c8-fd250a30f64c	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4	\N
\.


--
-- TOC entry 2914 (class 0 OID 16705816)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 16705998)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55e4-6933-4dbf-bf7674cbc441	00180000-55e4-6933-bb91-57f663f6d017	000c0000-55e4-6933-8dbd-07502b2da07d	00090000-55e4-6933-b58d-96abb87a071e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e4-6933-581d-1a09924db864	00180000-55e4-6933-bb91-57f663f6d017	000c0000-55e4-6933-b575-af9e6b0bf8bd	00090000-55e4-6933-b2c1-ff37cee934a0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e4-6933-8e04-5025fc57c556	00180000-55e4-6933-bb91-57f663f6d017	000c0000-55e4-6933-8240-db5a73f1f467	00090000-55e4-6933-5ed0-6aead989ad00	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e4-6933-2b12-98de27fa8c44	00180000-55e4-6933-bb91-57f663f6d017	000c0000-55e4-6933-c7d8-4aabe10655d7	00090000-55e4-6933-4bfc-ce5b6d48bd42	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e4-6933-e4b9-e836ff668d44	00180000-55e4-6933-bb91-57f663f6d017	000c0000-55e4-6933-d791-c5886bdbd7bd	00090000-55e4-6933-28a1-18eda8d59061	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e4-6933-f9df-7660ebdca796	00180000-55e4-6933-46e1-115bc5c5567c	\N	00090000-55e4-6933-28a1-18eda8d59061	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2951 (class 0 OID 16706197)
-- Dependencies: 217
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55e4-6931-4070-8b3fe059e98a	Avtor	Avtorji	Avtorka	umetnik
000f0000-55e4-6931-fc89-ca826870f105	Priredba	Priredba	Priredba	umetnik
000f0000-55e4-6932-8233-b75e6f1ec554	Prevod	Prevod	Prevod	umetnik
000f0000-55e4-6932-beb8-c30aa0eed9d8	Režija	Režija	Režija	umetnik
000f0000-55e4-6932-0072-a784e7d179e9	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55e4-6932-58b3-e79b87c95965	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55e4-6932-ed69-b08d7d5683f4	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55e4-6932-5f26-3fac0a9df863	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55e4-6932-a387-c959b11196ff	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55e4-6932-d39d-d63cc27c6fbf	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55e4-6932-8a96-9fb6773651b4	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55e4-6932-3ef3-4eec7ec5724f	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55e4-6932-27bc-577b9d4ef220	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55e4-6932-f1f4-45d547cf63ff	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55e4-6932-03bf-5a08048894c1	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55e4-6932-e8ce-b4d745532e90	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55e4-6932-0d96-887f098597e4	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55e4-6932-4a6c-9d11e6e68e88	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2963 (class 0 OID 16706427)
-- Dependencies: 229
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55e4-6931-db4e-f9cfadd42c07	01	Velika predstava	f	1.00	1.00
002b0000-55e4-6931-c8e1-6df4f1b76fc7	02	Mala predstava	f	0.50	0.50
002b0000-55e4-6931-1cfe-52f42fb55c74	03	Mala koprodukcija	t	0.40	1.00
002b0000-55e4-6931-2ee8-13621d5be01f	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55e4-6931-1534-c91df8fc60e5	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2919 (class 0 OID 16705878)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 16705725)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55e4-6932-fe49-e78d8b0fa0ae	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROnqB8RQJLOx9LI0YRrcH2l1GF2vSu3gu	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55e4-6933-20c5-9841bd1664ab	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55e4-6933-ec1c-51eeea08925f	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55e4-6933-d8a5-bbeba2c83cc0	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55e4-6933-e904-d24d54d1bdb4	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55e4-6933-e44d-83e7488bfcfa	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55e4-6933-5cb5-a4145acbf8e3	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55e4-6933-13b7-d91259523bc2	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55e4-6933-f150-378577e54847	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55e4-6933-c3aa-f1eb8c8525ff	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55e4-6933-06e0-1c03eb1cd159	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55e4-6932-39f4-6715501a938a	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2955 (class 0 OID 16706245)
-- Dependencies: 221
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55e4-6933-19ef-7e6058ef7188	00160000-55e4-6933-86c2-71a9b1913fab	\N	00140000-55e4-6932-4787-c8c50e3ad5f4	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55e4-6933-9bc6-b1033b6f7a0e
000e0000-55e4-6933-f7da-20a322a7c5ef	00160000-55e4-6933-7e6d-c390e043ee98	\N	00140000-55e4-6932-9174-08b8b6f39283	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55e4-6933-fe8d-f56d7aa5cfb5
000e0000-55e4-6933-fca8-166349b4307a	\N	\N	00140000-55e4-6932-9174-08b8b6f39283	00190000-55e4-6933-fcb5-93d1997401f3	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55e4-6933-9bc6-b1033b6f7a0e
000e0000-55e4-6933-bbad-50fdfad40d01	\N	\N	00140000-55e4-6932-9174-08b8b6f39283	00190000-55e4-6933-fcb5-93d1997401f3	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55e4-6933-9bc6-b1033b6f7a0e
000e0000-55e4-6933-f44e-e1ae7d87dd91	\N	\N	00140000-55e4-6932-9174-08b8b6f39283	00190000-55e4-6933-fcb5-93d1997401f3	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55e4-6933-7dae-510e32fbb657
000e0000-55e4-6933-4764-76d87e32298e	\N	\N	00140000-55e4-6932-9174-08b8b6f39283	00190000-55e4-6933-fcb5-93d1997401f3	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55e4-6933-7dae-510e32fbb657
\.


--
-- TOC entry 2924 (class 0 OID 16705940)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55e4-6933-d6bc-c180b3ad6c5c	000e0000-55e4-6933-f7da-20a322a7c5ef	1	
00200000-55e4-6933-e722-ad3e4532bd24	000e0000-55e4-6933-f7da-20a322a7c5ef	2	
\.


--
-- TOC entry 2939 (class 0 OID 16706069)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 16706171)
-- Dependencies: 215
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55e4-6932-090f-8abc82f7a9d9	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55e4-6932-e0a0-2591f23b39eb	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55e4-6932-5c6d-14268c1ad11a	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55e4-6932-3d93-b2c61ea48980	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55e4-6932-cb62-5f2d78b9a787	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55e4-6932-bcf5-f8c6101e7dd2	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55e4-6932-8cd4-b97dcf1d7cf3	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55e4-6932-b5b7-1c99f3730ec5	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55e4-6932-3b06-12f66415c9f5	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55e4-6932-a335-b90c3e4fc185	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55e4-6932-daaa-73f131bd67a4	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55e4-6932-5c97-ded86f67ffcc	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55e4-6932-1d8b-2488e22ab728	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55e4-6932-aeec-f38a09533cef	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55e4-6932-1f24-9763367bdb03	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55e4-6932-dc55-2773f12280e0	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55e4-6932-43ab-8dc0a08ea4ae	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55e4-6932-4334-510fbfba972d	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55e4-6932-4924-34bd45dac2db	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55e4-6932-a7eb-1c3988aeb9c8	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55e4-6932-a55b-2c473b2b21d5	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55e4-6932-161c-cfc83d2e0033	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55e4-6932-41ed-7ff9ba7a389a	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55e4-6932-b0b3-0c21c604452e	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55e4-6932-b0de-387f8436e50f	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55e4-6932-8f15-c92b6e970c3b	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55e4-6932-0e39-997d3a7d43c8	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55e4-6932-43e2-2af5ced00a08	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2969 (class 0 OID 16706497)
-- Dependencies: 235
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 16706469)
-- Dependencies: 234
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 16706509)
-- Dependencies: 236
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 16706140)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55e4-6933-ff51-f15e53d9bdc8	00090000-55e4-6933-b2c1-ff37cee934a0	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e4-6933-b3bb-a9656273c02c	00090000-55e4-6933-5ed0-6aead989ad00	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e4-6933-6374-885ebb6829d5	00090000-55e4-6933-287a-ac1bfa47c8d2	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e4-6933-8713-fcbc4f8d35f7	00090000-55e4-6933-cdae-0e6f8c7dbbb9	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e4-6933-73e0-e658b799d998	00090000-55e4-6933-b58d-96abb87a071e	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e4-6933-73cd-8c9a78aaa1a2	00090000-55e4-6933-68c5-8b149789b311	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2926 (class 0 OID 16705972)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 16706235)
-- Dependencies: 220
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55e4-6932-4787-c8c50e3ad5f4	01	Drama	drama (SURS 01)
00140000-55e4-6932-f6aa-1a62a57dec44	02	Opera	opera (SURS 02)
00140000-55e4-6932-5c4c-05f830bdc4d4	03	Balet	balet (SURS 03)
00140000-55e4-6932-8bab-a2df63a8b10f	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55e4-6932-f88f-0dc4632b023b	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55e4-6932-9174-08b8b6f39283	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55e4-6932-defb-846c6dd99988	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2945 (class 0 OID 16706130)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2448 (class 2606 OID 16705779)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 16706294)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 16706284)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 16706196)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 16706549)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 16705962)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 16705987)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 16706443)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 16705904)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 16706349)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 16706126)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 16705938)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 16705981)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 16705918)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 16706034)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 16706526)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 16706533)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2694 (class 2606 OID 16706557)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 16706061)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 16705876)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 16705788)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 16705812)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 16705768)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2439 (class 2606 OID 16705753)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 16706067)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 16706102)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 16706230)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 16705840)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 16705864)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 16706040)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 16705854)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 16705925)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 16706052)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 16706406)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 16706414)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 16706397)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 16706425)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 16706084)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 16706025)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 16706016)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 16706218)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 16706154)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 16705724)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 16706093)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 16705742)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2441 (class 2606 OID 16705762)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 16706111)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 16706047)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 16705996)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 16706467)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 16706455)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 16706449)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 16706167)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 16705821)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 16706007)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 16706207)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 16706437)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 16705889)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 16705737)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 16706263)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 16705947)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 16706075)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 16706179)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 16706507)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 16706491)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 16706515)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 16706145)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 16705976)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 16706243)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 16706138)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 1259 OID 16705969)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2591 (class 1259 OID 16706168)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2592 (class 1259 OID 16706169)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2593 (class 1259 OID 16706170)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2680 (class 1259 OID 16706528)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2681 (class 1259 OID 16706527)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2462 (class 1259 OID 16705842)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2554 (class 1259 OID 16706068)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2667 (class 1259 OID 16706495)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2668 (class 1259 OID 16706494)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2669 (class 1259 OID 16706496)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2670 (class 1259 OID 16706493)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2671 (class 1259 OID 16706492)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2548 (class 1259 OID 16706054)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2549 (class 1259 OID 16706053)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2499 (class 1259 OID 16705948)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2578 (class 1259 OID 16706127)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2579 (class 1259 OID 16706129)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2580 (class 1259 OID 16706128)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2487 (class 1259 OID 16705920)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2488 (class 1259 OID 16705919)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2650 (class 1259 OID 16706426)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2604 (class 1259 OID 16706232)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2605 (class 1259 OID 16706233)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2606 (class 1259 OID 16706234)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2677 (class 1259 OID 16706516)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2613 (class 1259 OID 16706268)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2614 (class 1259 OID 16706265)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2615 (class 1259 OID 16706269)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2616 (class 1259 OID 16706267)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2617 (class 1259 OID 16706266)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2477 (class 1259 OID 16705891)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2478 (class 1259 OID 16705890)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2453 (class 1259 OID 16705815)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2566 (class 1259 OID 16706094)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2517 (class 1259 OID 16705982)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2443 (class 1259 OID 16705769)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2444 (class 1259 OID 16705770)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2571 (class 1259 OID 16706114)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2572 (class 1259 OID 16706113)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2573 (class 1259 OID 16706112)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2491 (class 1259 OID 16705926)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2492 (class 1259 OID 16705928)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2493 (class 1259 OID 16705927)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2660 (class 1259 OID 16706457)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2528 (class 1259 OID 16706020)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2529 (class 1259 OID 16706018)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2530 (class 1259 OID 16706017)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2531 (class 1259 OID 16706019)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2434 (class 1259 OID 16705743)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2435 (class 1259 OID 16705744)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2557 (class 1259 OID 16706076)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2690 (class 1259 OID 16706550)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2691 (class 1259 OID 16706558)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2692 (class 1259 OID 16706559)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2543 (class 1259 OID 16706041)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2587 (class 1259 OID 16706155)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2588 (class 1259 OID 16706156)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2634 (class 1259 OID 16706354)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2635 (class 1259 OID 16706353)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2636 (class 1259 OID 16706350)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2637 (class 1259 OID 16706351)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2638 (class 1259 OID 16706352)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2466 (class 1259 OID 16705856)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2467 (class 1259 OID 16705855)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2468 (class 1259 OID 16705857)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2560 (class 1259 OID 16706088)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2561 (class 1259 OID 16706087)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2642 (class 1259 OID 16706407)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2643 (class 1259 OID 16706408)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2627 (class 1259 OID 16706298)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2628 (class 1259 OID 16706299)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2629 (class 1259 OID 16706296)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2630 (class 1259 OID 16706297)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2584 (class 1259 OID 16706146)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2534 (class 1259 OID 16706029)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2535 (class 1259 OID 16706028)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2536 (class 1259 OID 16706026)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2537 (class 1259 OID 16706027)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2623 (class 1259 OID 16706286)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2624 (class 1259 OID 16706285)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2639 (class 1259 OID 16706398)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2498 (class 1259 OID 16705939)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2657 (class 1259 OID 16706444)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2684 (class 1259 OID 16706534)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2685 (class 1259 OID 16706535)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2449 (class 1259 OID 16705790)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2450 (class 1259 OID 16705789)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2458 (class 1259 OID 16705822)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2459 (class 1259 OID 16705823)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2523 (class 1259 OID 16706010)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2524 (class 1259 OID 16706009)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2525 (class 1259 OID 16706008)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2505 (class 1259 OID 16705971)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2506 (class 1259 OID 16705967)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2507 (class 1259 OID 16705964)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2508 (class 1259 OID 16705965)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2509 (class 1259 OID 16705963)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2510 (class 1259 OID 16705968)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2511 (class 1259 OID 16705966)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2465 (class 1259 OID 16705841)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2483 (class 1259 OID 16705905)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2484 (class 1259 OID 16705907)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2485 (class 1259 OID 16705906)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2486 (class 1259 OID 16705908)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2542 (class 1259 OID 16706035)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2609 (class 1259 OID 16706231)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2618 (class 1259 OID 16706264)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2456 (class 1259 OID 16705813)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2457 (class 1259 OID 16705814)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2581 (class 1259 OID 16706139)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2666 (class 1259 OID 16706468)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 16705877)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2663 (class 1259 OID 16706456)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2564 (class 1259 OID 16706086)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2565 (class 1259 OID 16706085)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2631 (class 1259 OID 16706295)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2473 (class 1259 OID 16705865)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2610 (class 1259 OID 16706244)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2674 (class 1259 OID 16706508)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2648 (class 1259 OID 16706415)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 16706416)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2522 (class 1259 OID 16705997)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2442 (class 1259 OID 16705763)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2512 (class 1259 OID 16705970)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2720 (class 2606 OID 16706695)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2723 (class 2606 OID 16706680)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2722 (class 2606 OID 16706685)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2718 (class 2606 OID 16706705)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2724 (class 2606 OID 16706675)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2719 (class 2606 OID 16706700)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2721 (class 2606 OID 16706690)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2757 (class 2606 OID 16706860)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2756 (class 2606 OID 16706865)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2755 (class 2606 OID 16706870)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2790 (class 2606 OID 16707040)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2791 (class 2606 OID 16707035)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2705 (class 2606 OID 16706610)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2741 (class 2606 OID 16706790)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2785 (class 2606 OID 16707020)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2786 (class 2606 OID 16707015)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2784 (class 2606 OID 16707025)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2787 (class 2606 OID 16707010)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2788 (class 2606 OID 16707005)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2739 (class 2606 OID 16706785)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2740 (class 2606 OID 16706780)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2717 (class 2606 OID 16706670)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2751 (class 2606 OID 16706830)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2749 (class 2606 OID 16706840)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2750 (class 2606 OID 16706835)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2711 (class 2606 OID 16706645)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2712 (class 2606 OID 16706640)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2737 (class 2606 OID 16706770)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2781 (class 2606 OID 16706990)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2760 (class 2606 OID 16706875)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2759 (class 2606 OID 16706880)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2758 (class 2606 OID 16706885)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2789 (class 2606 OID 16707030)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2762 (class 2606 OID 16706905)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2765 (class 2606 OID 16706890)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2761 (class 2606 OID 16706910)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2763 (class 2606 OID 16706900)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2764 (class 2606 OID 16706895)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2709 (class 2606 OID 16706635)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2710 (class 2606 OID 16706630)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2701 (class 2606 OID 16706595)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2702 (class 2606 OID 16706590)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2745 (class 2606 OID 16706810)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2725 (class 2606 OID 16706710)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2698 (class 2606 OID 16706570)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2697 (class 2606 OID 16706575)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2746 (class 2606 OID 16706825)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2747 (class 2606 OID 16706820)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2748 (class 2606 OID 16706815)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2715 (class 2606 OID 16706650)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2713 (class 2606 OID 16706660)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2714 (class 2606 OID 16706655)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2783 (class 2606 OID 16707000)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2729 (class 2606 OID 16706745)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2731 (class 2606 OID 16706735)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2732 (class 2606 OID 16706730)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2730 (class 2606 OID 16706740)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2696 (class 2606 OID 16706560)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2695 (class 2606 OID 16706565)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2742 (class 2606 OID 16706795)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2794 (class 2606 OID 16707055)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2796 (class 2606 OID 16707060)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2795 (class 2606 OID 16707065)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2738 (class 2606 OID 16706775)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2754 (class 2606 OID 16706850)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2753 (class 2606 OID 16706855)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2772 (class 2606 OID 16706965)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2773 (class 2606 OID 16706960)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2776 (class 2606 OID 16706945)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2775 (class 2606 OID 16706950)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2774 (class 2606 OID 16706955)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2707 (class 2606 OID 16706620)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2708 (class 2606 OID 16706615)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2706 (class 2606 OID 16706625)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2743 (class 2606 OID 16706805)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2744 (class 2606 OID 16706800)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2779 (class 2606 OID 16706975)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2778 (class 2606 OID 16706980)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2769 (class 2606 OID 16706935)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2768 (class 2606 OID 16706940)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2771 (class 2606 OID 16706925)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2770 (class 2606 OID 16706930)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2752 (class 2606 OID 16706845)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2733 (class 2606 OID 16706765)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2734 (class 2606 OID 16706760)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2736 (class 2606 OID 16706750)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2735 (class 2606 OID 16706755)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2766 (class 2606 OID 16706920)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2767 (class 2606 OID 16706915)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2777 (class 2606 OID 16706970)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2716 (class 2606 OID 16706665)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2780 (class 2606 OID 16706985)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2782 (class 2606 OID 16706995)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2793 (class 2606 OID 16707045)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2792 (class 2606 OID 16707050)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2699 (class 2606 OID 16706585)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2700 (class 2606 OID 16706580)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2704 (class 2606 OID 16706600)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2703 (class 2606 OID 16706605)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2726 (class 2606 OID 16706725)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2727 (class 2606 OID 16706720)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2728 (class 2606 OID 16706715)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-31 16:48:21 CEST

--
-- PostgreSQL database dump complete
--

