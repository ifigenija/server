--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-31 13:56:05 CEST

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
-- TOC entry 177 (class 1259 OID 16632446)
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
-- TOC entry 223 (class 1259 OID 16632962)
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
-- TOC entry 222 (class 1259 OID 16632945)
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
-- TOC entry 216 (class 1259 OID 16632855)
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
-- TOC entry 239 (class 1259 OID 16633211)
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
-- TOC entry 191 (class 1259 OID 16632624)
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
-- TOC entry 194 (class 1259 OID 16632658)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 16633113)
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
-- TOC entry 186 (class 1259 OID 16632567)
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
-- TOC entry 224 (class 1259 OID 16632975)
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
-- TOC entry 210 (class 1259 OID 16632790)
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
-- TOC entry 189 (class 1259 OID 16632604)
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
-- TOC entry 193 (class 1259 OID 16632652)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 16632584)
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
-- TOC entry 199 (class 1259 OID 16632705)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 237 (class 1259 OID 16633192)
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
-- TOC entry 238 (class 1259 OID 16633204)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 16633226)
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
-- TOC entry 203 (class 1259 OID 16632730)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 16632541)
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
-- TOC entry 178 (class 1259 OID 16632455)
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
-- TOC entry 179 (class 1259 OID 16632466)
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
-- TOC entry 174 (class 1259 OID 16632420)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 16632439)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 16632737)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 16632770)
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
-- TOC entry 219 (class 1259 OID 16632894)
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
-- TOC entry 181 (class 1259 OID 16632499)
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
-- TOC entry 183 (class 1259 OID 16632533)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 16632711)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 16632518)
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
-- TOC entry 188 (class 1259 OID 16632596)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 16632723)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 16633074)
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
-- TOC entry 227 (class 1259 OID 16633084)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 16633030)
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
-- TOC entry 228 (class 1259 OID 16633092)
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
-- TOC entry 206 (class 1259 OID 16632752)
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
-- TOC entry 198 (class 1259 OID 16632696)
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
-- TOC entry 197 (class 1259 OID 16632686)
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
-- TOC entry 218 (class 1259 OID 16632883)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 16632822)
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
-- TOC entry 171 (class 1259 OID 16632391)
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
-- TOC entry 170 (class 1259 OID 16632389)
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
-- TOC entry 207 (class 1259 OID 16632764)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 16632429)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 16632413)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 16632778)
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
-- TOC entry 201 (class 1259 OID 16632717)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 16632663)
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
-- TOC entry 233 (class 1259 OID 16633133)
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
-- TOC entry 232 (class 1259 OID 16633125)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 16633120)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 16632832)
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
-- TOC entry 180 (class 1259 OID 16632491)
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
-- TOC entry 196 (class 1259 OID 16632673)
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
-- TOC entry 217 (class 1259 OID 16632872)
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
-- TOC entry 229 (class 1259 OID 16633102)
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
-- TOC entry 185 (class 1259 OID 16632553)
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
-- TOC entry 172 (class 1259 OID 16632400)
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
-- TOC entry 221 (class 1259 OID 16632920)
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
-- TOC entry 190 (class 1259 OID 16632615)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 16632744)
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
-- TOC entry 215 (class 1259 OID 16632846)
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
-- TOC entry 235 (class 1259 OID 16633172)
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
-- TOC entry 234 (class 1259 OID 16633144)
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
-- TOC entry 236 (class 1259 OID 16633184)
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
-- TOC entry 212 (class 1259 OID 16632815)
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
-- TOC entry 192 (class 1259 OID 16632647)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 16632910)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 16632805)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 16632394)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2911 (class 0 OID 16632446)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2957 (class 0 OID 16632962)
-- Dependencies: 223
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55e4-40d3-7189-8a297ee5ee7b	000d0000-55e4-40d3-523d-5ba236b0c9da	\N	00090000-55e4-40d3-0aa2-c7a846bd33d2	000b0000-55e4-40d3-79d0-0fce57916b90	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55e4-40d3-833d-6ca0f688ff53	000d0000-55e4-40d3-25a9-b57710e43a0e	00100000-55e4-40d3-0825-922dc4e12dd1	00090000-55e4-40d3-78d7-2881ab7d1d89	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55e4-40d3-7641-0c77f0d0bf1a	000d0000-55e4-40d3-4eee-95edc5db6494	00100000-55e4-40d3-27e3-893667bf5df6	00090000-55e4-40d3-af78-512381ca8e67	\N	0003	t	\N	2015-08-31	\N	2	\N	\N	f	f
000c0000-55e4-40d3-7f1a-6cf33e1fedd1	000d0000-55e4-40d3-0bc4-c549037e0dcb	\N	00090000-55e4-40d3-76ec-f3081a1463f2	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55e4-40d3-da56-c9f68fb41cb1	000d0000-55e4-40d3-d9ab-9f985b7bcced	\N	00090000-55e4-40d3-b013-9cb081832173	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55e4-40d3-d7fa-5c23a1a610af	000d0000-55e4-40d3-9803-4701d21f6238	\N	00090000-55e4-40d3-b33e-90db1a0e518a	000b0000-55e4-40d3-9020-da34cd3fcd18	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55e4-40d3-9322-ee3a6bcecefe	000d0000-55e4-40d3-4e55-e1b6a84d6d3c	00100000-55e4-40d3-7b22-b37d8a22c50d	00090000-55e4-40d3-b0d3-a1a0d20923b0	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55e4-40d3-562a-ac0e82e5f861	000d0000-55e4-40d3-68bb-606a17c40ccb	\N	00090000-55e4-40d3-dc4b-a8df3ebb029c	000b0000-55e4-40d3-81cb-46f3a4dc9197	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55e4-40d3-5b93-d90187a67236	000d0000-55e4-40d3-4e55-e1b6a84d6d3c	00100000-55e4-40d3-c09c-9cd5b6be8937	00090000-55e4-40d3-1b24-1f5597f26ec1	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55e4-40d3-0193-d3c62db88a38	000d0000-55e4-40d3-4e55-e1b6a84d6d3c	00100000-55e4-40d3-6fe0-b114ff1be8a9	00090000-55e4-40d3-12ad-055d8cb07085	\N	0010	t	\N	2015-08-31	\N	16	\N	\N	f	t
000c0000-55e4-40d3-433c-3ff7465e2d5d	000d0000-55e4-40d3-4e55-e1b6a84d6d3c	00100000-55e4-40d3-1407-d5fe61ac66b7	00090000-55e4-40d3-9879-921bf227258f	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2956 (class 0 OID 16632945)
-- Dependencies: 222
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 16632855)
-- Dependencies: 216
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55e4-40d3-7095-36068fc94c27	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55e4-40d3-98b8-a6860ac43145	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55e4-40d3-eb16-8fbdafbc650d	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2973 (class 0 OID 16633211)
-- Dependencies: 239
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2925 (class 0 OID 16632624)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55e4-40d3-449f-a65b5a752367	\N	\N	00200000-55e4-40d3-8af8-c59ed1ba18f2	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55e4-40d3-af6f-2fb161e7d1e4	\N	\N	00200000-55e4-40d3-0d59-611692410d4a	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55e4-40d3-4b73-e7bd71e299b2	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55e4-40d3-c587-8e28d679b239	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55e4-40d3-08ee-3d438c1110f5	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2928 (class 0 OID 16632658)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 16633113)
-- Dependencies: 230
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 16632567)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55e4-40d2-12e0-165c6f70b60e	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55e4-40d2-ed45-c17d867979a6	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55e4-40d2-6481-ca92ae8a4501	AL	ALB	008	Albania 	Albanija	\N
00040000-55e4-40d2-bce5-2f924a27c041	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55e4-40d2-484a-0fa724105112	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55e4-40d2-56ce-ed11dd77398c	AD	AND	020	Andorra 	Andora	\N
00040000-55e4-40d2-d5d4-a0a5f76f2a24	AO	AGO	024	Angola 	Angola	\N
00040000-55e4-40d2-d1cb-b87c3d5e1b9c	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55e4-40d2-434a-93682d940667	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55e4-40d2-a6af-412acbf77051	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55e4-40d2-5967-228819798185	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55e4-40d2-3289-125cb0ea879e	AM	ARM	051	Armenia 	Armenija	\N
00040000-55e4-40d2-78a8-80e69a52a9fa	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55e4-40d2-3e7f-091adfa93123	AU	AUS	036	Australia 	Avstralija	\N
00040000-55e4-40d2-4e15-72c1b47b9ea8	AT	AUT	040	Austria 	Avstrija	\N
00040000-55e4-40d2-172e-e428ec0a81b6	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55e4-40d2-93cb-c27f0cdc3b21	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55e4-40d2-21d3-ef47f0d2244f	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55e4-40d2-941d-d70840dbe33a	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55e4-40d2-29b2-639a3386c8c9	BB	BRB	052	Barbados 	Barbados	\N
00040000-55e4-40d2-3b57-2d1046fb229c	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55e4-40d2-3a7b-ca9dd4402271	BE	BEL	056	Belgium 	Belgija	\N
00040000-55e4-40d2-6095-f379128ee32d	BZ	BLZ	084	Belize 	Belize	\N
00040000-55e4-40d2-58fe-11e9a628455a	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55e4-40d2-2671-9eb75e214664	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55e4-40d2-96d2-971ce8921ed2	BT	BTN	064	Bhutan 	Butan	\N
00040000-55e4-40d2-d88e-7b912de5fa35	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55e4-40d2-d241-6a3e90b52103	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55e4-40d2-670d-7bafd7ef6c7e	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55e4-40d2-cf7d-8c665c2dc4bb	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55e4-40d2-4fc3-eb3b00f5b548	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55e4-40d2-0af0-707791871fee	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55e4-40d2-3ee4-1d1327feb96b	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55e4-40d2-93d1-ad9bb799f52d	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55e4-40d2-e079-7cd15e19dd73	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55e4-40d2-d3f2-76cf81cbe923	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55e4-40d2-5325-c5ea36b42230	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55e4-40d2-cb9a-bf170d7cbc27	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55e4-40d2-d13d-0e20a77d7b49	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55e4-40d2-7ef2-2eb04d9b6bba	CA	CAN	124	Canada 	Kanada	\N
00040000-55e4-40d2-48e8-24e4ab4856fb	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55e4-40d2-16d0-758f2121fae9	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55e4-40d2-6028-aa8b4ec93164	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55e4-40d2-062d-580a627adb03	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55e4-40d2-0194-94d4c4edb6fc	CL	CHL	152	Chile 	Čile	\N
00040000-55e4-40d2-e78c-9a34a751a41e	CN	CHN	156	China 	Kitajska	\N
00040000-55e4-40d2-ed92-76f347b71726	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55e4-40d2-5afe-cf2d20028a51	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55e4-40d2-bb97-3d1ec8773252	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55e4-40d2-cd96-a105a472c71c	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55e4-40d2-7f12-bc5577011ca2	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55e4-40d2-0d82-b2c9152f454c	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55e4-40d2-28ac-6b3041aa4952	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55e4-40d2-790f-a7d2fda82313	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55e4-40d2-d38a-821289433c59	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55e4-40d2-17d8-2b6f209bd07f	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55e4-40d2-69c1-2b6ff6bdc2de	CU	CUB	192	Cuba 	Kuba	\N
00040000-55e4-40d2-0ac6-ce9c4fd6a943	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55e4-40d2-6b7b-662ec210525c	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55e4-40d2-e221-93074d76d481	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55e4-40d2-c395-b942945e142a	DK	DNK	208	Denmark 	Danska	\N
00040000-55e4-40d2-9b92-fd9c4db08e3b	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55e4-40d2-bb48-c04fa5f3417b	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55e4-40d2-8658-2367298a9eb5	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55e4-40d2-3c06-46b9a45c0bc9	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55e4-40d2-3745-9db7a6418f08	EG	EGY	818	Egypt 	Egipt	\N
00040000-55e4-40d2-a17f-86cd0bb3afa2	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55e4-40d2-f6a5-6d222460675b	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55e4-40d2-f320-ca754574b8f9	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55e4-40d2-9d6c-315b864623db	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55e4-40d2-32ec-3701fbeb4aa3	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55e4-40d2-21cb-919cb1f1c25d	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55e4-40d2-929a-e3235ce0f1ed	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55e4-40d2-1337-87cc23b96102	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55e4-40d2-70b5-ef95cbc5afe1	FI	FIN	246	Finland 	Finska	\N
00040000-55e4-40d2-7d37-d4a9eb61cd5a	FR	FRA	250	France 	Francija	\N
00040000-55e4-40d2-92ab-e3d12e4234e3	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55e4-40d2-2ff1-a821c4bed535	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55e4-40d2-3f8e-ad3da5878ae0	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55e4-40d2-a652-2a630f957fb2	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55e4-40d2-f9ca-2a00b7e9ce61	GA	GAB	266	Gabon 	Gabon	\N
00040000-55e4-40d2-ae15-d2810c4c87ce	GM	GMB	270	Gambia 	Gambija	\N
00040000-55e4-40d2-83ac-b828ea68b71b	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55e4-40d2-a594-5ee7fae7be04	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55e4-40d2-8a65-c2cb62f0a35d	GH	GHA	288	Ghana 	Gana	\N
00040000-55e4-40d2-a211-71fea4feec2d	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55e4-40d2-e0aa-ba0ec94587bf	GR	GRC	300	Greece 	Grčija	\N
00040000-55e4-40d2-2328-75a88b13c94b	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55e4-40d2-bf56-0150a85067b1	GD	GRD	308	Grenada 	Grenada	\N
00040000-55e4-40d2-2efb-7a1533a7ebc9	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55e4-40d2-2d6a-084234a7a16c	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55e4-40d2-692d-f70b21304797	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55e4-40d2-3fa0-dc78133ade3e	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55e4-40d2-d2f7-ba2b9b69175f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55e4-40d2-a220-6665f22510b6	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55e4-40d2-3579-4b9b280d0201	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55e4-40d2-68a7-fff1d59bb0d5	HT	HTI	332	Haiti 	Haiti	\N
00040000-55e4-40d2-6d85-728dc7dcf88f	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55e4-40d2-20d0-97a2d5c8ac49	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55e4-40d2-0a5d-a21780a33003	HN	HND	340	Honduras 	Honduras	\N
00040000-55e4-40d2-78cd-e52f36bb88e5	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55e4-40d2-311d-b9e0699ec2a1	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55e4-40d2-9493-644add9e81ab	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55e4-40d2-eb31-2bd7c402c83f	IN	IND	356	India 	Indija	\N
00040000-55e4-40d2-35ac-0f2b1afa687d	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55e4-40d2-94e0-3b0cbd1a24a1	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55e4-40d2-35cc-e7dfb9e18a12	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55e4-40d2-dc8a-861816b08b85	IE	IRL	372	Ireland 	Irska	\N
00040000-55e4-40d2-9004-0d9e09fae593	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55e4-40d2-2170-a093c71171d4	IL	ISR	376	Israel 	Izrael	\N
00040000-55e4-40d2-1198-3564c04f2aa3	IT	ITA	380	Italy 	Italija	\N
00040000-55e4-40d2-36e4-73635a900616	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55e4-40d2-1644-6872d0ed112f	JP	JPN	392	Japan 	Japonska	\N
00040000-55e4-40d2-6154-d82ce5c2eb53	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55e4-40d2-58bb-11f2719cdb97	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55e4-40d2-be5c-446a9e916c4e	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55e4-40d2-a6bd-465c835bbd2c	KE	KEN	404	Kenya 	Kenija	\N
00040000-55e4-40d2-2b12-0f651e049e22	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55e4-40d2-1fc3-66b0b0898b0a	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55e4-40d2-c50b-7d069490e4b0	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55e4-40d2-770e-bac09aebaf24	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55e4-40d2-8e2f-9ec2f3c568e7	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55e4-40d2-76ec-c2f34fc0a45f	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55e4-40d2-efc2-02989dee4b67	LV	LVA	428	Latvia 	Latvija	\N
00040000-55e4-40d2-be2a-6c0a31991180	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55e4-40d2-9d86-2a52595ba8cf	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55e4-40d2-ca09-49f3987c3e8d	LR	LBR	430	Liberia 	Liberija	\N
00040000-55e4-40d2-e7d5-8a7742624f3b	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55e4-40d2-c6b6-5581ab2ef66d	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55e4-40d2-cf13-2101b169e53f	LT	LTU	440	Lithuania 	Litva	\N
00040000-55e4-40d2-4141-3e4807b834cb	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55e4-40d2-7fc6-2ec9b142e903	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55e4-40d2-fd91-a20fbb17787a	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55e4-40d2-d463-2a35739396a8	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55e4-40d2-9093-469bd905eb7e	MW	MWI	454	Malawi 	Malavi	\N
00040000-55e4-40d2-7a94-85dc8231e542	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55e4-40d2-3f11-bb1db3bd7d1f	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55e4-40d2-2f23-0691bcd58389	ML	MLI	466	Mali 	Mali	\N
00040000-55e4-40d2-0f6f-1f1be316da0b	MT	MLT	470	Malta 	Malta	\N
00040000-55e4-40d2-b0c2-0cf9e7cb9046	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55e4-40d2-96c1-466922ce916f	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55e4-40d2-bfc5-dc2133673c05	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55e4-40d2-d587-a1387f978667	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55e4-40d2-621b-e2e79447043a	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55e4-40d2-1bb6-96269cd001f3	MX	MEX	484	Mexico 	Mehika	\N
00040000-55e4-40d2-7efa-1bbaa6888a86	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55e4-40d2-4bb8-ce76ed2e5d2a	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55e4-40d2-82f0-c5e7637d9740	MC	MCO	492	Monaco 	Monako	\N
00040000-55e4-40d2-be31-edf63259bd44	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55e4-40d2-66af-e2c5c604a545	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55e4-40d2-0a74-d396fd797d8c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55e4-40d2-734a-8586c6a72aaa	MA	MAR	504	Morocco 	Maroko	\N
00040000-55e4-40d2-3727-1a8977b8145d	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55e4-40d2-5ba9-dd542d30c335	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55e4-40d2-5cad-709b9205fbd6	NA	NAM	516	Namibia 	Namibija	\N
00040000-55e4-40d2-e9ed-671a0241dd6b	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55e4-40d2-a0da-88e1fb316ad4	NP	NPL	524	Nepal 	Nepal	\N
00040000-55e4-40d2-3070-eb0868b27013	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55e4-40d2-3b38-13747ca4cb2f	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55e4-40d2-6566-687948d78c4c	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55e4-40d2-bd2c-bc844880e63f	NE	NER	562	Niger 	Niger 	\N
00040000-55e4-40d2-183d-aa29385ebbe8	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55e4-40d2-1b2b-a7f842f7870d	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55e4-40d2-579b-3b623a0af5d1	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55e4-40d2-5f58-a4cd2508b902	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55e4-40d2-eec7-96c4c3ceac17	NO	NOR	578	Norway 	Norveška	\N
00040000-55e4-40d2-712a-6964ff5b085b	OM	OMN	512	Oman 	Oman	\N
00040000-55e4-40d2-8e5f-c371f3fe3e56	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55e4-40d2-032e-571a25c34853	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55e4-40d2-ff93-cc292c853b7d	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55e4-40d2-e0cb-66fcff267cd6	PA	PAN	591	Panama 	Panama	\N
00040000-55e4-40d2-f856-f9f53c4c7019	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55e4-40d2-40c4-c62dc544df3d	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55e4-40d2-1a5f-f07a5c8bc706	PE	PER	604	Peru 	Peru	\N
00040000-55e4-40d2-d4f9-a89b1e3f2359	PH	PHL	608	Philippines 	Filipini	\N
00040000-55e4-40d2-7a1f-c93172f01aa3	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55e4-40d2-9047-57a813b44289	PL	POL	616	Poland 	Poljska	\N
00040000-55e4-40d2-001f-e97dd002949a	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55e4-40d2-334d-f09b741e8850	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55e4-40d2-e98f-b709efaf39a0	QA	QAT	634	Qatar 	Katar	\N
00040000-55e4-40d2-87d7-066e39eef91d	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55e4-40d2-b39b-ad196afa0ff0	RO	ROU	642	Romania 	Romunija	\N
00040000-55e4-40d2-34f7-296e841714a8	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55e4-40d2-dca3-9126df6fb3d4	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55e4-40d2-e3e2-cbdcf71f1f47	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55e4-40d2-801e-2401aafdaf91	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55e4-40d2-26d1-39f78e31df3f	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55e4-40d2-5add-b3253b255986	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55e4-40d2-ea43-f41d7b9b4eba	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55e4-40d2-f405-d5cec36a74ec	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55e4-40d2-8e45-6b9a899a3712	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55e4-40d2-77bd-ad60e9bfa153	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55e4-40d2-4bc4-ae8f3808ea5f	SM	SMR	674	San Marino 	San Marino	\N
00040000-55e4-40d2-77a6-e17ed2cdb2b9	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55e4-40d2-7b20-016e0b456220	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55e4-40d2-ba54-df60c1a3e765	SN	SEN	686	Senegal 	Senegal	\N
00040000-55e4-40d2-2d01-a2e1dfc38d87	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55e4-40d2-0b33-da7267c2fb8a	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55e4-40d2-80f2-4e14b6745349	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55e4-40d2-152c-4d02f3b802c5	SG	SGP	702	Singapore 	Singapur	\N
00040000-55e4-40d2-48d4-c3a4e9424daa	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55e4-40d2-17e4-fad21da644a7	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55e4-40d2-5298-3dba115c4899	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55e4-40d2-4bbc-9a35e6e1bada	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55e4-40d2-a384-c3b35a288ce8	SO	SOM	706	Somalia 	Somalija	\N
00040000-55e4-40d2-74aa-d156a672ab6d	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55e4-40d2-c7bd-a98f007376f6	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55e4-40d2-5392-f2e65dde1b62	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55e4-40d2-7a85-8328b3c7a1ba	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55e4-40d2-1673-7a600261b54f	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55e4-40d2-7e68-f44984eb33b7	SD	SDN	729	Sudan 	Sudan	\N
00040000-55e4-40d2-548f-0a4e1ab0504f	SR	SUR	740	Suriname 	Surinam	\N
00040000-55e4-40d2-32b3-91a901a3a330	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55e4-40d2-f55d-4bc5c641af49	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55e4-40d2-4ceb-e88f764310d8	SE	SWE	752	Sweden 	Švedska	\N
00040000-55e4-40d2-2b50-780ba151a858	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55e4-40d2-1409-2ade745ceed1	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55e4-40d2-7a81-bd0f0ae66b0c	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55e4-40d2-9597-d6b1fc77dcd9	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55e4-40d2-f8bf-7218188efdb4	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55e4-40d2-fe85-dae4a5e387e5	TH	THA	764	Thailand 	Tajska	\N
00040000-55e4-40d2-23ab-7eb97b683082	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55e4-40d2-e603-5bcc60d24078	TG	TGO	768	Togo 	Togo	\N
00040000-55e4-40d2-3680-f493c9a1e45f	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55e4-40d2-4330-a32136d48cec	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55e4-40d2-3e3f-bd80c278c0df	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55e4-40d2-389e-c62148a604e4	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55e4-40d2-7383-1c5906c873ac	TR	TUR	792	Turkey 	Turčija	\N
00040000-55e4-40d2-e5cc-e281a8de6233	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55e4-40d2-af83-2cb98aea195c	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55e4-40d2-dc04-2ad485dbfc8c	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55e4-40d2-bbdc-2bebd6536d81	UG	UGA	800	Uganda 	Uganda	\N
00040000-55e4-40d2-79da-b6907a3dce5c	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55e4-40d2-7e53-6dc99e78ed38	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55e4-40d2-c21a-b231d1522e60	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55e4-40d2-92a6-e9adfacf0131	US	USA	840	United States 	Združene države Amerike	\N
00040000-55e4-40d2-5f77-844c16ac8296	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55e4-40d2-b976-407ccf334e45	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55e4-40d2-4a9b-1e9d85346956	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55e4-40d2-d82c-245d668098c6	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55e4-40d2-0943-e5f503730f44	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55e4-40d2-554f-8b1c9e3ea561	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55e4-40d2-aeea-78e2e57602f0	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55e4-40d2-e950-677a668efabc	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55e4-40d2-b478-38184263852b	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55e4-40d2-100d-0fc0464ad843	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55e4-40d2-2253-53293b21090f	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55e4-40d2-857f-4db840c0e202	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55e4-40d2-b5d1-f47453f725e4	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2958 (class 0 OID 16632975)
-- Dependencies: 224
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55e4-40d3-ded3-f41321bf3193	000e0000-55e4-40d3-f192-2da8555938cd	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e4-40d2-7840-88813041d1fc	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55e4-40d3-97f1-a14e7ea6be53	000e0000-55e4-40d3-f55f-b10804a47e5b	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e4-40d2-b264-ae71c78cdec0	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55e4-40d3-acd1-18618a2e1e58	000e0000-55e4-40d3-159f-af0de95acabe	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e4-40d2-7840-88813041d1fc	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55e4-40d3-622d-f250aa954876	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55e4-40d3-b97d-173e7455fc38	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2944 (class 0 OID 16632790)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55e4-40d3-4e55-e1b6a84d6d3c	000e0000-55e4-40d3-f55f-b10804a47e5b	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55e4-40d2-0963-dc00a4d9f54e
000d0000-55e4-40d3-523d-5ba236b0c9da	000e0000-55e4-40d3-f55f-b10804a47e5b	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55e4-40d2-0963-dc00a4d9f54e
000d0000-55e4-40d3-25a9-b57710e43a0e	000e0000-55e4-40d3-f55f-b10804a47e5b	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55e4-40d2-e579-65c5238405d9
000d0000-55e4-40d3-4eee-95edc5db6494	000e0000-55e4-40d3-f55f-b10804a47e5b	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55e4-40d2-4d60-814ca9116572
000d0000-55e4-40d3-0bc4-c549037e0dcb	000e0000-55e4-40d3-f55f-b10804a47e5b	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55e4-40d2-3667-3402704b7f24
000d0000-55e4-40d3-d9ab-9f985b7bcced	000e0000-55e4-40d3-f55f-b10804a47e5b	\N	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55e4-40d2-3667-3402704b7f24
000d0000-55e4-40d3-9803-4701d21f6238	000e0000-55e4-40d3-f55f-b10804a47e5b	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55e4-40d2-0963-dc00a4d9f54e
000d0000-55e4-40d3-68bb-606a17c40ccb	000e0000-55e4-40d3-f55f-b10804a47e5b	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55e4-40d2-9ccc-3d1ed46c396a
\.


--
-- TOC entry 2923 (class 0 OID 16632604)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 16632652)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2921 (class 0 OID 16632584)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55e4-40d3-953c-f529adc557b7	00080000-55e4-40d3-6498-c6523c082cc2	00090000-55e4-40d3-12ad-055d8cb07085	AK		
\.


--
-- TOC entry 2933 (class 0 OID 16632705)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 16633192)
-- Dependencies: 237
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 16633204)
-- Dependencies: 238
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 16633226)
-- Dependencies: 240
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 16632730)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2918 (class 0 OID 16632541)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55e4-40d2-5999-30eb7b8cea5b	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55e4-40d2-ded6-c3f60118c14b	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55e4-40d2-a3df-318403580ca1	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55e4-40d2-0683-27b913f8a4a5	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55e4-40d2-b9ab-fa2c865f74cd	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55e4-40d2-5173-ad7d8e74f375	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55e4-40d2-4c35-431e1d025297	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55e4-40d2-fcc9-0a3ca1a16899	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55e4-40d2-fc8c-79025f4c3ce2	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55e4-40d2-e986-f58d91cba02f	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55e4-40d2-2728-17b8d3cc7350	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55e4-40d2-8637-d5fc7f9e5d0f	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55e4-40d2-0464-190107b5802d	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55e4-40d3-5eab-2e8fe1d4598e	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55e4-40d3-59b3-13c93e0b6fef	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55e4-40d3-85c6-43364398b9fa	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55e4-40d3-d5e3-add02de6a6bc	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55e4-40d3-fe42-ccd1efeb5b8c	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55e4-40d4-f39b-f12d8b3762d6	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2912 (class 0 OID 16632455)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55e4-40d3-667b-3b5bc085fe59	00000000-55e4-40d3-5eab-2e8fe1d4598e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55e4-40d3-bfaa-fc8c6fe3876d	00000000-55e4-40d3-5eab-2e8fe1d4598e	00010000-55e4-40d2-bfdb-4be54d2d4206	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55e4-40d3-df02-5558e23f3b96	00000000-55e4-40d3-59b3-13c93e0b6fef	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2913 (class 0 OID 16632466)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55e4-40d3-0aa2-c7a846bd33d2	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55e4-40d3-76ec-f3081a1463f2	00010000-55e4-40d3-81fe-8b78d01a11f1	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55e4-40d3-af78-512381ca8e67	00010000-55e4-40d3-547b-9d6602493ba7	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55e4-40d3-1b24-1f5597f26ec1	00010000-55e4-40d3-5091-29e2338e85f6	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55e4-40d3-a76a-8836e054b1fa	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55e4-40d3-b33e-90db1a0e518a	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55e4-40d3-9879-921bf227258f	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55e4-40d3-b0d3-a1a0d20923b0	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55e4-40d3-12ad-055d8cb07085	00010000-55e4-40d3-2c03-50cece322c7c	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55e4-40d3-78d7-2881ab7d1d89	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55e4-40d3-0a29-3c44e68b112d	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55e4-40d3-b013-9cb081832173	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55e4-40d3-dc4b-a8df3ebb029c	00010000-55e4-40d3-e3e0-c9c0a8778616	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2908 (class 0 OID 16632420)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55e4-40d2-70ee-e13421451576	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55e4-40d2-2fe3-73fc08cf15f4	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55e4-40d2-ef1a-3391482d3081	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55e4-40d2-44cd-02d81a04d908	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55e4-40d2-6f96-32b2b41c16d2	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55e4-40d2-244d-3b7f008ba4f0	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55e4-40d2-f629-52ff19903a5e	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55e4-40d2-5e96-33f0ce09f844	Abonma-read	Abonma - branje	f
00030000-55e4-40d2-4972-e082a20143cc	Abonma-write	Abonma - spreminjanje	f
00030000-55e4-40d2-cf2b-72d877acecbd	Alternacija-read	Alternacija - branje	f
00030000-55e4-40d2-ce32-6a99e61bc356	Alternacija-write	Alternacija - spreminjanje	f
00030000-55e4-40d2-2f79-c2fe75dc0918	Arhivalija-read	Arhivalija - branje	f
00030000-55e4-40d2-5625-c32ca9c7b645	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55e4-40d2-0fcf-fb4b1924ba6f	Besedilo-read	Besedilo - branje	f
00030000-55e4-40d2-f807-592bba7f8de6	Besedilo-write	Besedilo - spreminjanje	f
00030000-55e4-40d2-2c63-ec4dcc68ef33	DogodekIzven-read	DogodekIzven - branje	f
00030000-55e4-40d2-c3c6-65bfd822e2b9	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55e4-40d2-2e58-82affd52408f	Dogodek-read	Dogodek - branje	f
00030000-55e4-40d2-bc31-3c60bf5e016b	Dogodek-write	Dogodek - spreminjanje	f
00030000-55e4-40d2-c780-ea622efc99a4	DrugiVir-read	DrugiVir - branje	f
00030000-55e4-40d2-95ad-b06cf6d0592b	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55e4-40d2-b92e-068cac72038b	Drzava-read	Drzava - branje	f
00030000-55e4-40d2-f09d-b9df2c15b6d0	Drzava-write	Drzava - spreminjanje	f
00030000-55e4-40d2-d13d-8ba9091939ac	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55e4-40d2-9932-53bd6309964f	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55e4-40d2-c574-104b2960c83f	Funkcija-read	Funkcija - branje	f
00030000-55e4-40d2-6f1c-7315fa75a0e9	Funkcija-write	Funkcija - spreminjanje	f
00030000-55e4-40d2-c8bf-361fdf87b8f8	Gostovanje-read	Gostovanje - branje	f
00030000-55e4-40d2-7ae1-da7f1ed36c7c	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55e4-40d2-2c6e-1734d07ac8a4	Gostujoca-read	Gostujoca - branje	f
00030000-55e4-40d2-ebdd-29f44855fccf	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55e4-40d2-189d-a94e734b0831	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55e4-40d2-eb83-9c8908eb597d	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55e4-40d2-9593-2f485a87ba36	Kupec-read	Kupec - branje	f
00030000-55e4-40d2-8ec5-ee3c361abf13	Kupec-write	Kupec - spreminjanje	f
00030000-55e4-40d2-4381-d11cce474c40	NacinPlacina-read	NacinPlacina - branje	f
00030000-55e4-40d2-a293-52f093544938	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55e4-40d2-4568-4f0bc5525961	Option-read	Option - branje	f
00030000-55e4-40d2-af46-da3911112584	Option-write	Option - spreminjanje	f
00030000-55e4-40d2-bff8-610f4a55fb81	OptionValue-read	OptionValue - branje	f
00030000-55e4-40d2-f7e4-0aed31c5ae92	OptionValue-write	OptionValue - spreminjanje	f
00030000-55e4-40d2-b4aa-8523e8903685	Oseba-read	Oseba - branje	f
00030000-55e4-40d2-ce18-75f2bb28715c	Oseba-write	Oseba - spreminjanje	f
00030000-55e4-40d2-aef6-2986899f2e90	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55e4-40d2-3877-9b5fe33e1902	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55e4-40d2-46cb-1fe41c16625b	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55e4-40d2-5798-710fd34bf9d3	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55e4-40d2-35a5-c16dbb4f78e3	Pogodba-read	Pogodba - branje	f
00030000-55e4-40d2-ea35-4d25b0199575	Pogodba-write	Pogodba - spreminjanje	f
00030000-55e4-40d2-af0f-5be5219d3ad7	Popa-read	Popa - branje	f
00030000-55e4-40d2-f9c1-c5b960b9af8c	Popa-write	Popa - spreminjanje	f
00030000-55e4-40d2-eb70-700710fc7b59	Posta-read	Posta - branje	f
00030000-55e4-40d2-36e6-caa7e76e6c55	Posta-write	Posta - spreminjanje	f
00030000-55e4-40d2-f176-0ee6524f000a	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55e4-40d2-f243-043612855209	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55e4-40d2-820c-c552629950f9	PostniNaslov-read	PostniNaslov - branje	f
00030000-55e4-40d2-c1b3-00775b98960b	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55e4-40d2-2a33-fc66c6887400	Predstava-read	Predstava - branje	f
00030000-55e4-40d2-200b-344ea136db2c	Predstava-write	Predstava - spreminjanje	f
00030000-55e4-40d2-5038-24fbb3c0aa05	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55e4-40d2-4d14-92b4227a3ee0	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55e4-40d2-2f31-fc5ad952d328	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55e4-40d2-cde7-b72898ed5da2	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55e4-40d2-7478-6cc6c4461e3f	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55e4-40d2-12cc-a702d28c1d06	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55e4-40d2-6dbf-ced377df5b88	ProgramDela-read	ProgramDela - branje	f
00030000-55e4-40d2-55f7-dc326c587425	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55e4-40d2-4520-372295c707ab	ProgramFestival-read	ProgramFestival - branje	f
00030000-55e4-40d2-9167-c34149a19e33	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55e4-40d2-c7c5-60ae25065d95	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55e4-40d2-f954-e4b64c4fe495	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55e4-40d2-ba70-9fbb70e1c328	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55e4-40d2-7457-791c6f95c3a3	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55e4-40d2-14f4-64cbaa64b420	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55e4-40d2-cbbc-b04356a8219f	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55e4-40d2-efb4-f4e043bd9c3c	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55e4-40d2-e98b-96a1b505d6c1	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55e4-40d2-6d24-d97667ca3ad8	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55e4-40d2-c4d7-3999c65571dc	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55e4-40d2-fe44-2a3d09a9c47c	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55e4-40d2-6578-9430b46196b3	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55e4-40d2-dc1d-176f83c463d7	ProgramRazno-read	ProgramRazno - branje	f
00030000-55e4-40d2-8ae6-cc8e4048d572	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55e4-40d2-459f-f42b99c7241b	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55e4-40d2-6557-bbbc885f4b11	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55e4-40d2-35a3-cfbb35c32437	Prostor-read	Prostor - branje	f
00030000-55e4-40d2-12d0-a484e1a95dd6	Prostor-write	Prostor - spreminjanje	f
00030000-55e4-40d2-0b8a-d7e814386c61	Racun-read	Racun - branje	f
00030000-55e4-40d2-b2eb-91f999605e28	Racun-write	Racun - spreminjanje	f
00030000-55e4-40d2-d81f-bb997590af6f	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55e4-40d2-1c86-03eee60b1520	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55e4-40d2-1ff1-68f43aeabf5c	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55e4-40d2-9025-357eff02d7e3	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55e4-40d2-2f40-2ae05fbc782e	Rekvizit-read	Rekvizit - branje	f
00030000-55e4-40d2-ebd3-401d547fc505	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55e4-40d2-07b9-8f7de903bda0	Revizija-read	Revizija - branje	f
00030000-55e4-40d2-8b18-ed7a60f4b21f	Revizija-write	Revizija - spreminjanje	f
00030000-55e4-40d2-51ce-dcd8ba38febd	Rezervacija-read	Rezervacija - branje	f
00030000-55e4-40d2-a731-7228ea09e12d	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55e4-40d2-cdea-a7a3fc93dafb	SedezniRed-read	SedezniRed - branje	f
00030000-55e4-40d2-26c2-0e365d45e22c	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55e4-40d2-ac54-0052664beab8	Sedez-read	Sedez - branje	f
00030000-55e4-40d2-65ff-37015903fda5	Sedez-write	Sedez - spreminjanje	f
00030000-55e4-40d2-e1ab-0a9ea091873f	Sezona-read	Sezona - branje	f
00030000-55e4-40d2-0f72-2be325ffcb1f	Sezona-write	Sezona - spreminjanje	f
00030000-55e4-40d2-3bc1-68923e187777	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55e4-40d2-ddc9-63d7c9936d07	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55e4-40d2-7053-5d61b8fc83e5	Stevilcenje-read	Stevilcenje - branje	f
00030000-55e4-40d2-7a14-2cc894fab266	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55e4-40d2-bdfa-b735d358f67c	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55e4-40d2-02aa-f87b4e378dc6	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55e4-40d2-6ba2-d5a5dea70797	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55e4-40d2-8345-0d5cdf763dba	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55e4-40d2-e21a-265b1ce02e57	Telefonska-read	Telefonska - branje	f
00030000-55e4-40d2-8bcc-951d91ee60f6	Telefonska-write	Telefonska - spreminjanje	f
00030000-55e4-40d2-daaf-482892a72ab1	TerminStoritve-read	TerminStoritve - branje	f
00030000-55e4-40d2-5f30-c358729a99c4	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55e4-40d2-55c8-a300c97343bb	TipFunkcije-read	TipFunkcije - branje	f
00030000-55e4-40d2-383a-cf130730e967	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55e4-40d2-f490-0588169947af	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55e4-40d2-bdb2-1cd89eaf79f3	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55e4-40d2-8bae-a6d3584d8f12	Trr-read	Trr - branje	f
00030000-55e4-40d2-3ce7-005279d21d91	Trr-write	Trr - spreminjanje	f
00030000-55e4-40d2-be22-3e0b64db6cb8	Uprizoritev-read	Uprizoritev - branje	f
00030000-55e4-40d2-197f-6081df077743	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55e4-40d2-31ce-6932fbc7b4ea	Vaja-read	Vaja - branje	f
00030000-55e4-40d2-7e02-be5d3630a426	Vaja-write	Vaja - spreminjanje	f
00030000-55e4-40d2-4218-d7bca8344400	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55e4-40d2-bde9-e69ea1cfb670	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55e4-40d2-51c2-15eefee52005	VrstaStroska-read	VrstaStroska - branje	f
00030000-55e4-40d2-bd8d-3890d2d040f6	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55e4-40d2-61e1-00391fcab778	Zaposlitev-read	Zaposlitev - branje	f
00030000-55e4-40d2-7b10-6e0854c797c5	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55e4-40d2-aaf7-67078c6c0136	Zasedenost-read	Zasedenost - branje	f
00030000-55e4-40d2-7f3f-b21d5b9d5d00	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55e4-40d2-b4fa-f24287ff60d2	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55e4-40d2-7fbc-b21b7ede0b58	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55e4-40d2-91e1-0773d61184ff	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55e4-40d2-1891-9dce54355d66	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55e4-40d2-92e4-af6abd06a087	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55e4-40d2-c88b-2d977b19b293	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55e4-40d2-d613-1a1dfc4881c7	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55e4-40d2-53c8-845542a8442e	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55e4-40d2-c3d1-e124b9d956bb	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55e4-40d2-c2a1-c6e48f09e83b	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55e4-40d2-f4e4-442643dd8a70	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55e4-40d2-2cc5-746cb0a4f373	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55e4-40d2-0e5c-a9a3ef0ca308	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55e4-40d2-297e-bcb19079ba01	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55e4-40d2-35bc-f7c5c97e39ca	Datoteka-write	Datoteka - spreminjanje	f
00030000-55e4-40d2-1530-fe8cfb6a1015	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2910 (class 0 OID 16632439)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55e4-40d2-d6bf-56b6d3b4a98e	00030000-55e4-40d2-2fe3-73fc08cf15f4
00020000-55e4-40d2-838e-5b58904a2922	00030000-55e4-40d2-b92e-068cac72038b
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-5e96-33f0ce09f844
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-4972-e082a20143cc
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-cf2b-72d877acecbd
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-ce32-6a99e61bc356
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-2f79-c2fe75dc0918
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-2e58-82affd52408f
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-44cd-02d81a04d908
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-bc31-3c60bf5e016b
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-b92e-068cac72038b
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-f09d-b9df2c15b6d0
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-c574-104b2960c83f
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-6f1c-7315fa75a0e9
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-c8bf-361fdf87b8f8
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-7ae1-da7f1ed36c7c
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-2c6e-1734d07ac8a4
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-ebdd-29f44855fccf
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-189d-a94e734b0831
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-eb83-9c8908eb597d
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-4568-4f0bc5525961
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-bff8-610f4a55fb81
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-b4aa-8523e8903685
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-ce18-75f2bb28715c
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-af0f-5be5219d3ad7
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-f9c1-c5b960b9af8c
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-eb70-700710fc7b59
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-36e6-caa7e76e6c55
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-820c-c552629950f9
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-c1b3-00775b98960b
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-2a33-fc66c6887400
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-200b-344ea136db2c
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-7478-6cc6c4461e3f
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-12cc-a702d28c1d06
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-35a3-cfbb35c32437
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-12d0-a484e1a95dd6
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-1ff1-68f43aeabf5c
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-9025-357eff02d7e3
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-2f40-2ae05fbc782e
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-ebd3-401d547fc505
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-e1ab-0a9ea091873f
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-0f72-2be325ffcb1f
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-55c8-a300c97343bb
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-be22-3e0b64db6cb8
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-197f-6081df077743
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-31ce-6932fbc7b4ea
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-7e02-be5d3630a426
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-aaf7-67078c6c0136
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-7f3f-b21d5b9d5d00
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-b4fa-f24287ff60d2
00020000-55e4-40d2-9b66-62b98a2d8774	00030000-55e4-40d2-91e1-0773d61184ff
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-5e96-33f0ce09f844
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-2f79-c2fe75dc0918
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-2e58-82affd52408f
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-b92e-068cac72038b
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-c8bf-361fdf87b8f8
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-2c6e-1734d07ac8a4
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-189d-a94e734b0831
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-eb83-9c8908eb597d
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-4568-4f0bc5525961
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-bff8-610f4a55fb81
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-b4aa-8523e8903685
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-ce18-75f2bb28715c
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-af0f-5be5219d3ad7
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-eb70-700710fc7b59
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-820c-c552629950f9
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-c1b3-00775b98960b
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-2a33-fc66c6887400
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-35a3-cfbb35c32437
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-1ff1-68f43aeabf5c
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-2f40-2ae05fbc782e
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-e1ab-0a9ea091873f
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-e21a-265b1ce02e57
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-8bcc-951d91ee60f6
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-8bae-a6d3584d8f12
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-3ce7-005279d21d91
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-61e1-00391fcab778
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-7b10-6e0854c797c5
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-b4fa-f24287ff60d2
00020000-55e4-40d2-eb24-ff58b6517eaa	00030000-55e4-40d2-91e1-0773d61184ff
00020000-55e4-40d2-c873-bdb14b0fe25e	00030000-55e4-40d2-5e96-33f0ce09f844
00020000-55e4-40d2-c873-bdb14b0fe25e	00030000-55e4-40d2-cf2b-72d877acecbd
00020000-55e4-40d2-c873-bdb14b0fe25e	00030000-55e4-40d2-2f79-c2fe75dc0918
00020000-55e4-40d2-c873-bdb14b0fe25e	00030000-55e4-40d2-5625-c32ca9c7b645
00020000-55e4-40d2-c873-bdb14b0fe25e	00030000-55e4-40d2-0fcf-fb4b1924ba6f
00020000-55e4-40d2-c873-bdb14b0fe25e	00030000-55e4-40d2-2c63-ec4dcc68ef33
00020000-55e4-40d2-c873-bdb14b0fe25e	00030000-55e4-40d2-2e58-82affd52408f
00020000-55e4-40d2-c873-bdb14b0fe25e	00030000-55e4-40d2-b92e-068cac72038b
00020000-55e4-40d2-c873-bdb14b0fe25e	00030000-55e4-40d2-c574-104b2960c83f
00020000-55e4-40d2-c873-bdb14b0fe25e	00030000-55e4-40d2-c8bf-361fdf87b8f8
00020000-55e4-40d2-c873-bdb14b0fe25e	00030000-55e4-40d2-2c6e-1734d07ac8a4
00020000-55e4-40d2-c873-bdb14b0fe25e	00030000-55e4-40d2-189d-a94e734b0831
00020000-55e4-40d2-c873-bdb14b0fe25e	00030000-55e4-40d2-4568-4f0bc5525961
00020000-55e4-40d2-c873-bdb14b0fe25e	00030000-55e4-40d2-bff8-610f4a55fb81
00020000-55e4-40d2-c873-bdb14b0fe25e	00030000-55e4-40d2-b4aa-8523e8903685
00020000-55e4-40d2-c873-bdb14b0fe25e	00030000-55e4-40d2-af0f-5be5219d3ad7
00020000-55e4-40d2-c873-bdb14b0fe25e	00030000-55e4-40d2-eb70-700710fc7b59
00020000-55e4-40d2-c873-bdb14b0fe25e	00030000-55e4-40d2-2a33-fc66c6887400
00020000-55e4-40d2-c873-bdb14b0fe25e	00030000-55e4-40d2-7478-6cc6c4461e3f
00020000-55e4-40d2-c873-bdb14b0fe25e	00030000-55e4-40d2-35a3-cfbb35c32437
00020000-55e4-40d2-c873-bdb14b0fe25e	00030000-55e4-40d2-1ff1-68f43aeabf5c
00020000-55e4-40d2-c873-bdb14b0fe25e	00030000-55e4-40d2-2f40-2ae05fbc782e
00020000-55e4-40d2-c873-bdb14b0fe25e	00030000-55e4-40d2-e1ab-0a9ea091873f
00020000-55e4-40d2-c873-bdb14b0fe25e	00030000-55e4-40d2-55c8-a300c97343bb
00020000-55e4-40d2-c873-bdb14b0fe25e	00030000-55e4-40d2-31ce-6932fbc7b4ea
00020000-55e4-40d2-c873-bdb14b0fe25e	00030000-55e4-40d2-aaf7-67078c6c0136
00020000-55e4-40d2-c873-bdb14b0fe25e	00030000-55e4-40d2-b4fa-f24287ff60d2
00020000-55e4-40d2-c873-bdb14b0fe25e	00030000-55e4-40d2-91e1-0773d61184ff
00020000-55e4-40d2-6ebf-9c2b51e79244	00030000-55e4-40d2-5e96-33f0ce09f844
00020000-55e4-40d2-6ebf-9c2b51e79244	00030000-55e4-40d2-4972-e082a20143cc
00020000-55e4-40d2-6ebf-9c2b51e79244	00030000-55e4-40d2-ce32-6a99e61bc356
00020000-55e4-40d2-6ebf-9c2b51e79244	00030000-55e4-40d2-2f79-c2fe75dc0918
00020000-55e4-40d2-6ebf-9c2b51e79244	00030000-55e4-40d2-2e58-82affd52408f
00020000-55e4-40d2-6ebf-9c2b51e79244	00030000-55e4-40d2-b92e-068cac72038b
00020000-55e4-40d2-6ebf-9c2b51e79244	00030000-55e4-40d2-c8bf-361fdf87b8f8
00020000-55e4-40d2-6ebf-9c2b51e79244	00030000-55e4-40d2-2c6e-1734d07ac8a4
00020000-55e4-40d2-6ebf-9c2b51e79244	00030000-55e4-40d2-4568-4f0bc5525961
00020000-55e4-40d2-6ebf-9c2b51e79244	00030000-55e4-40d2-bff8-610f4a55fb81
00020000-55e4-40d2-6ebf-9c2b51e79244	00030000-55e4-40d2-af0f-5be5219d3ad7
00020000-55e4-40d2-6ebf-9c2b51e79244	00030000-55e4-40d2-eb70-700710fc7b59
00020000-55e4-40d2-6ebf-9c2b51e79244	00030000-55e4-40d2-2a33-fc66c6887400
00020000-55e4-40d2-6ebf-9c2b51e79244	00030000-55e4-40d2-35a3-cfbb35c32437
00020000-55e4-40d2-6ebf-9c2b51e79244	00030000-55e4-40d2-1ff1-68f43aeabf5c
00020000-55e4-40d2-6ebf-9c2b51e79244	00030000-55e4-40d2-2f40-2ae05fbc782e
00020000-55e4-40d2-6ebf-9c2b51e79244	00030000-55e4-40d2-e1ab-0a9ea091873f
00020000-55e4-40d2-6ebf-9c2b51e79244	00030000-55e4-40d2-55c8-a300c97343bb
00020000-55e4-40d2-6ebf-9c2b51e79244	00030000-55e4-40d2-b4fa-f24287ff60d2
00020000-55e4-40d2-6ebf-9c2b51e79244	00030000-55e4-40d2-91e1-0773d61184ff
00020000-55e4-40d2-4f1e-db3f421418b6	00030000-55e4-40d2-5e96-33f0ce09f844
00020000-55e4-40d2-4f1e-db3f421418b6	00030000-55e4-40d2-2f79-c2fe75dc0918
00020000-55e4-40d2-4f1e-db3f421418b6	00030000-55e4-40d2-2e58-82affd52408f
00020000-55e4-40d2-4f1e-db3f421418b6	00030000-55e4-40d2-b92e-068cac72038b
00020000-55e4-40d2-4f1e-db3f421418b6	00030000-55e4-40d2-c8bf-361fdf87b8f8
00020000-55e4-40d2-4f1e-db3f421418b6	00030000-55e4-40d2-2c6e-1734d07ac8a4
00020000-55e4-40d2-4f1e-db3f421418b6	00030000-55e4-40d2-4568-4f0bc5525961
00020000-55e4-40d2-4f1e-db3f421418b6	00030000-55e4-40d2-bff8-610f4a55fb81
00020000-55e4-40d2-4f1e-db3f421418b6	00030000-55e4-40d2-af0f-5be5219d3ad7
00020000-55e4-40d2-4f1e-db3f421418b6	00030000-55e4-40d2-eb70-700710fc7b59
00020000-55e4-40d2-4f1e-db3f421418b6	00030000-55e4-40d2-2a33-fc66c6887400
00020000-55e4-40d2-4f1e-db3f421418b6	00030000-55e4-40d2-35a3-cfbb35c32437
00020000-55e4-40d2-4f1e-db3f421418b6	00030000-55e4-40d2-1ff1-68f43aeabf5c
00020000-55e4-40d2-4f1e-db3f421418b6	00030000-55e4-40d2-2f40-2ae05fbc782e
00020000-55e4-40d2-4f1e-db3f421418b6	00030000-55e4-40d2-e1ab-0a9ea091873f
00020000-55e4-40d2-4f1e-db3f421418b6	00030000-55e4-40d2-daaf-482892a72ab1
00020000-55e4-40d2-4f1e-db3f421418b6	00030000-55e4-40d2-ef1a-3391482d3081
00020000-55e4-40d2-4f1e-db3f421418b6	00030000-55e4-40d2-55c8-a300c97343bb
00020000-55e4-40d2-4f1e-db3f421418b6	00030000-55e4-40d2-b4fa-f24287ff60d2
00020000-55e4-40d2-4f1e-db3f421418b6	00030000-55e4-40d2-91e1-0773d61184ff
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-70ee-e13421451576
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-2fe3-73fc08cf15f4
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-ef1a-3391482d3081
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-44cd-02d81a04d908
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-6f96-32b2b41c16d2
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-244d-3b7f008ba4f0
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-f629-52ff19903a5e
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-5e96-33f0ce09f844
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-4972-e082a20143cc
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-cf2b-72d877acecbd
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-ce32-6a99e61bc356
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-2f79-c2fe75dc0918
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-5625-c32ca9c7b645
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-0fcf-fb4b1924ba6f
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-f807-592bba7f8de6
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-2c63-ec4dcc68ef33
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-c3c6-65bfd822e2b9
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-2e58-82affd52408f
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-bc31-3c60bf5e016b
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-b92e-068cac72038b
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-f09d-b9df2c15b6d0
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-c780-ea622efc99a4
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-95ad-b06cf6d0592b
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-d13d-8ba9091939ac
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-9932-53bd6309964f
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-c574-104b2960c83f
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-6f1c-7315fa75a0e9
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-c8bf-361fdf87b8f8
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-7ae1-da7f1ed36c7c
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-2c6e-1734d07ac8a4
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-ebdd-29f44855fccf
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-189d-a94e734b0831
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-eb83-9c8908eb597d
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-9593-2f485a87ba36
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-8ec5-ee3c361abf13
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-4381-d11cce474c40
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-a293-52f093544938
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-4568-4f0bc5525961
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-af46-da3911112584
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-bff8-610f4a55fb81
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-f7e4-0aed31c5ae92
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-b4aa-8523e8903685
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-ce18-75f2bb28715c
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-aef6-2986899f2e90
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-3877-9b5fe33e1902
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-46cb-1fe41c16625b
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-5798-710fd34bf9d3
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-35a5-c16dbb4f78e3
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-ea35-4d25b0199575
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-af0f-5be5219d3ad7
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-f9c1-c5b960b9af8c
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-eb70-700710fc7b59
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-36e6-caa7e76e6c55
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-f176-0ee6524f000a
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-f243-043612855209
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-820c-c552629950f9
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-c1b3-00775b98960b
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-2a33-fc66c6887400
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-200b-344ea136db2c
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-5038-24fbb3c0aa05
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-4d14-92b4227a3ee0
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-2f31-fc5ad952d328
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-cde7-b72898ed5da2
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-7478-6cc6c4461e3f
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-12cc-a702d28c1d06
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-6dbf-ced377df5b88
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-55f7-dc326c587425
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-4520-372295c707ab
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-9167-c34149a19e33
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-c7c5-60ae25065d95
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-f954-e4b64c4fe495
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-ba70-9fbb70e1c328
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-7457-791c6f95c3a3
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-14f4-64cbaa64b420
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-cbbc-b04356a8219f
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-efb4-f4e043bd9c3c
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-e98b-96a1b505d6c1
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-6d24-d97667ca3ad8
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-c4d7-3999c65571dc
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-fe44-2a3d09a9c47c
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-6578-9430b46196b3
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-dc1d-176f83c463d7
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-8ae6-cc8e4048d572
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-459f-f42b99c7241b
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-6557-bbbc885f4b11
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-35a3-cfbb35c32437
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-12d0-a484e1a95dd6
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-0b8a-d7e814386c61
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-b2eb-91f999605e28
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-d81f-bb997590af6f
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-1c86-03eee60b1520
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-1ff1-68f43aeabf5c
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-9025-357eff02d7e3
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-2f40-2ae05fbc782e
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-ebd3-401d547fc505
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-07b9-8f7de903bda0
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-8b18-ed7a60f4b21f
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-51ce-dcd8ba38febd
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-a731-7228ea09e12d
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-cdea-a7a3fc93dafb
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-26c2-0e365d45e22c
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-ac54-0052664beab8
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-65ff-37015903fda5
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-e1ab-0a9ea091873f
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-0f72-2be325ffcb1f
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-3bc1-68923e187777
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-ddc9-63d7c9936d07
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-7053-5d61b8fc83e5
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-7a14-2cc894fab266
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-bdfa-b735d358f67c
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-02aa-f87b4e378dc6
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-6ba2-d5a5dea70797
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-8345-0d5cdf763dba
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-e21a-265b1ce02e57
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-8bcc-951d91ee60f6
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-daaf-482892a72ab1
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-5f30-c358729a99c4
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-55c8-a300c97343bb
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-383a-cf130730e967
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-f490-0588169947af
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-bdb2-1cd89eaf79f3
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-8bae-a6d3584d8f12
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-3ce7-005279d21d91
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-be22-3e0b64db6cb8
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-197f-6081df077743
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-31ce-6932fbc7b4ea
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-7e02-be5d3630a426
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-4218-d7bca8344400
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-bde9-e69ea1cfb670
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-61e1-00391fcab778
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-7b10-6e0854c797c5
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-aaf7-67078c6c0136
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-7f3f-b21d5b9d5d00
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-b4fa-f24287ff60d2
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-7fbc-b21b7ede0b58
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-91e1-0773d61184ff
00020000-55e4-40d3-5b31-cedc8c5fbd90	00030000-55e4-40d2-1891-9dce54355d66
\.


--
-- TOC entry 2938 (class 0 OID 16632737)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2942 (class 0 OID 16632770)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 16632894)
-- Dependencies: 219
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55e4-40d3-79d0-0fce57916b90	00090000-55e4-40d3-0aa2-c7a846bd33d2	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55e4-40d3-9020-da34cd3fcd18	00090000-55e4-40d3-b33e-90db1a0e518a	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55e4-40d3-81cb-46f3a4dc9197	00090000-55e4-40d3-dc4b-a8df3ebb029c	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2915 (class 0 OID 16632499)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55e4-40d3-6498-c6523c082cc2	00040000-55e4-40d2-5298-3dba115c4899	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e4-40d3-93d3-df24a091471e	00040000-55e4-40d2-5298-3dba115c4899	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55e4-40d3-740c-311536fcc1a5	00040000-55e4-40d2-5298-3dba115c4899	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e4-40d3-d6bd-d80e6939c68a	00040000-55e4-40d2-5298-3dba115c4899	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e4-40d3-feeb-5d3b42a848b5	00040000-55e4-40d2-5298-3dba115c4899	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e4-40d3-c060-37005ade9c03	00040000-55e4-40d2-5967-228819798185	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e4-40d3-3108-67e2b1561941	00040000-55e4-40d2-17d8-2b6f209bd07f	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e4-40d3-5879-af6620c1955b	00040000-55e4-40d2-4e15-72c1b47b9ea8	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e4-40d4-5b70-a2d2584b56df	00040000-55e4-40d2-5298-3dba115c4899	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2917 (class 0 OID 16632533)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55e4-40d1-e442-cbbe00f4c87f	8341	Adlešiči
00050000-55e4-40d1-40e3-495bf623af30	5270	Ajdovščina
00050000-55e4-40d1-f94a-088c3760eb52	6280	Ankaran/Ancarano
00050000-55e4-40d1-b094-27208d307625	9253	Apače
00050000-55e4-40d1-910d-75343b66bbfa	8253	Artiče
00050000-55e4-40d1-905b-5e18dbce5309	4275	Begunje na Gorenjskem
00050000-55e4-40d1-285c-43fa14a36c04	1382	Begunje pri Cerknici
00050000-55e4-40d1-11a4-5d6f45b54959	9231	Beltinci
00050000-55e4-40d1-2d32-fcefa55adf42	2234	Benedikt
00050000-55e4-40d1-eb20-cdaf5608253c	2345	Bistrica ob Dravi
00050000-55e4-40d1-2c0d-d74c01d1cb79	3256	Bistrica ob Sotli
00050000-55e4-40d1-d3fd-81c9261be4c4	8259	Bizeljsko
00050000-55e4-40d1-5180-2c63bc761a52	1223	Blagovica
00050000-55e4-40d1-d6fc-29e0147f3f09	8283	Blanca
00050000-55e4-40d1-a242-cefc9d466db7	4260	Bled
00050000-55e4-40d1-8dc6-f0114434cce4	4273	Blejska Dobrava
00050000-55e4-40d1-901a-c90bbcd823b7	9265	Bodonci
00050000-55e4-40d1-ea80-58da3bb96bb3	9222	Bogojina
00050000-55e4-40d1-9783-f27921555fe0	4263	Bohinjska Bela
00050000-55e4-40d1-ad79-36779bf3392e	4264	Bohinjska Bistrica
00050000-55e4-40d1-e03b-d15a7fc07019	4265	Bohinjsko jezero
00050000-55e4-40d1-f82b-acde49cf9953	1353	Borovnica
00050000-55e4-40d1-8469-d800af430de1	8294	Boštanj
00050000-55e4-40d1-7efd-ab253ca88a2e	5230	Bovec
00050000-55e4-40d1-2a2a-d4ebcdae1bb8	5295	Branik
00050000-55e4-40d1-5c77-261f43b92e89	3314	Braslovče
00050000-55e4-40d1-e587-a1c25ee34558	5223	Breginj
00050000-55e4-40d1-fc37-bd53e61b5583	8280	Brestanica
00050000-55e4-40d1-280b-c820c59e1a42	2354	Bresternica
00050000-55e4-40d1-da24-9ef146347c62	4243	Brezje
00050000-55e4-40d1-27e7-a7364d4bb9b6	1351	Brezovica pri Ljubljani
00050000-55e4-40d1-7f57-539fb3e4935e	8250	Brežice
00050000-55e4-40d1-703e-eb05900f87e7	4210	Brnik - Aerodrom
00050000-55e4-40d1-c045-d556a078dd48	8321	Brusnice
00050000-55e4-40d1-0043-77404598caac	3255	Buče
00050000-55e4-40d1-f058-789756a174d9	8276	Bučka 
00050000-55e4-40d1-aa0e-e3ce63335630	9261	Cankova
00050000-55e4-40d1-7fe2-c36f77b73836	3000	Celje 
00050000-55e4-40d1-0b06-28e031ba219f	3001	Celje - poštni predali
00050000-55e4-40d1-a1b0-764f3eb699bd	4207	Cerklje na Gorenjskem
00050000-55e4-40d1-8187-72a2bbbf7fbe	8263	Cerklje ob Krki
00050000-55e4-40d1-6869-b84380af1368	1380	Cerknica
00050000-55e4-40d1-729e-e694463d900f	5282	Cerkno
00050000-55e4-40d1-9593-2c7b734510ff	2236	Cerkvenjak
00050000-55e4-40d1-0380-94ecbbe6f262	2215	Ceršak
00050000-55e4-40d1-2064-40242a0b6ad8	2326	Cirkovce
00050000-55e4-40d1-81d7-a929475dfcb0	2282	Cirkulane
00050000-55e4-40d1-3668-6d3c95a0d85b	5273	Col
00050000-55e4-40d1-dab1-fbaefa50f0b1	8251	Čatež ob Savi
00050000-55e4-40d1-0265-28e18ae880ce	1413	Čemšenik
00050000-55e4-40d1-9faf-ed5b378a3581	5253	Čepovan
00050000-55e4-40d1-1636-f980cc805b9c	9232	Črenšovci
00050000-55e4-40d1-9cd5-7526b84b8c16	2393	Črna na Koroškem
00050000-55e4-40d1-5f5b-8faa1289c8ff	6275	Črni Kal
00050000-55e4-40d1-d1c7-3f704a73b7bd	5274	Črni Vrh nad Idrijo
00050000-55e4-40d1-609a-7891da0fce64	5262	Črniče
00050000-55e4-40d1-29d8-4402648916dd	8340	Črnomelj
00050000-55e4-40d1-d673-60554df0caaf	6271	Dekani
00050000-55e4-40d1-b971-28331ae4271f	5210	Deskle
00050000-55e4-40d1-c05a-7859eee42ef1	2253	Destrnik
00050000-55e4-40d1-7f6d-bc52280bb088	6215	Divača
00050000-55e4-40d1-0b75-4c8bf9f3c1b3	1233	Dob
00050000-55e4-40d1-bdc0-251431957d25	3224	Dobje pri Planini
00050000-55e4-40d1-6b9d-1efb4b9b448a	8257	Dobova
00050000-55e4-40d1-76bb-0b89fd2a7f31	1423	Dobovec
00050000-55e4-40d1-b56a-2ff77dd9f49e	5263	Dobravlje
00050000-55e4-40d1-9264-f232861f99ca	3204	Dobrna
00050000-55e4-40d1-03b0-a2d7ad85872d	8211	Dobrnič
00050000-55e4-40d1-9e7c-e43cd46d74ae	1356	Dobrova
00050000-55e4-40d1-22c2-41bafd9be0ce	9223	Dobrovnik/Dobronak 
00050000-55e4-40d1-4b6e-ef5ecc0e9bdb	5212	Dobrovo v Brdih
00050000-55e4-40d1-a171-5da255cbbd16	1431	Dol pri Hrastniku
00050000-55e4-40d1-f6ca-407ebb196b11	1262	Dol pri Ljubljani
00050000-55e4-40d1-8918-2b29d859df81	1273	Dole pri Litiji
00050000-55e4-40d1-db92-6a081a8d3620	1331	Dolenja vas
00050000-55e4-40d1-0618-602a55fde07b	8350	Dolenjske Toplice
00050000-55e4-40d1-4ff1-8402a6dc3c72	1230	Domžale
00050000-55e4-40d1-e20c-61b8d84e7305	2252	Dornava
00050000-55e4-40d1-e10a-10d8bb49f000	5294	Dornberk
00050000-55e4-40d1-5d5e-60eb1adc28dd	1319	Draga
00050000-55e4-40d1-172a-e6441a09ee55	8343	Dragatuš
00050000-55e4-40d1-7a4e-8d0fa3dae3fc	3222	Dramlje
00050000-55e4-40d1-7bd7-0a4366877553	2370	Dravograd
00050000-55e4-40d1-24b8-1b2004a57b94	4203	Duplje
00050000-55e4-40d1-de47-0aba0acb86aa	6221	Dutovlje
00050000-55e4-40d1-830e-2a96ba491060	8361	Dvor
00050000-55e4-40d1-60d2-d899db5dbd2d	2343	Fala
00050000-55e4-40d1-e0dc-fa6635f18f25	9208	Fokovci
00050000-55e4-40d1-a02b-c7a06cb3e6c0	2313	Fram
00050000-55e4-40d1-5212-b541ad9bb607	3213	Frankolovo
00050000-55e4-40d1-64d4-412ca956469f	1274	Gabrovka
00050000-55e4-40d1-a142-209d83546a7d	8254	Globoko
00050000-55e4-40d1-1067-0bb1d7ced442	5275	Godovič
00050000-55e4-40d1-bce7-739301767a19	4204	Golnik
00050000-55e4-40d1-2fee-66b2fb403b19	3303	Gomilsko
00050000-55e4-40d1-d734-2364a0785f8f	4224	Gorenja vas
00050000-55e4-40d1-9504-11f143ea5741	3263	Gorica pri Slivnici
00050000-55e4-40d1-64b8-32a623f8780e	2272	Gorišnica
00050000-55e4-40d1-3653-5d548b755f4f	9250	Gornja Radgona
00050000-55e4-40d1-1f66-d6cd086f0a08	3342	Gornji Grad
00050000-55e4-40d1-3b40-368e428b9ac0	4282	Gozd Martuljek
00050000-55e4-40d1-7e43-2dda9ec3bfb8	6272	Gračišče
00050000-55e4-40d1-6a1d-ed0d6b0ff4ef	9264	Grad
00050000-55e4-40d1-b9d4-6fa814e7c036	8332	Gradac
00050000-55e4-40d1-5970-239ac9950a68	1384	Grahovo
00050000-55e4-40d1-7f77-8792cdd52c9c	5242	Grahovo ob Bači
00050000-55e4-40d1-6c8c-bfb9824e9a87	5251	Grgar
00050000-55e4-40d1-5f04-272646f95fc1	3302	Griže
00050000-55e4-40d1-8d61-485270241fb0	3231	Grobelno
00050000-55e4-40d1-2b91-bf838cce1e00	1290	Grosuplje
00050000-55e4-40d1-8792-9723efe42a01	2288	Hajdina
00050000-55e4-40d1-2091-4d1a2a0a7666	8362	Hinje
00050000-55e4-40d1-baac-6b75396f247a	2311	Hoče
00050000-55e4-40d1-6a4e-25f6f821b201	9205	Hodoš/Hodos
00050000-55e4-40d1-2de0-d51612e7f93e	1354	Horjul
00050000-55e4-40d1-86e8-a67f66f32d41	1372	Hotedršica
00050000-55e4-40d1-db5a-95d7a2c9c641	1430	Hrastnik
00050000-55e4-40d1-526d-21eafe944401	6225	Hruševje
00050000-55e4-40d1-d7df-f26e2a7d9bda	4276	Hrušica
00050000-55e4-40d1-bde4-8562bca7bfad	5280	Idrija
00050000-55e4-40d1-26db-b3e946e14ac9	1292	Ig
00050000-55e4-40d1-6f75-13752fd10c1d	6250	Ilirska Bistrica
00050000-55e4-40d1-4def-d96694d17dbe	6251	Ilirska Bistrica-Trnovo
00050000-55e4-40d1-ae2c-4e929ca2c7d9	1295	Ivančna Gorica
00050000-55e4-40d1-5c98-e3d5c5289fbc	2259	Ivanjkovci
00050000-55e4-40d1-85de-73c334e6ff6f	1411	Izlake
00050000-55e4-40d1-223c-d3a8f6bb5005	6310	Izola/Isola
00050000-55e4-40d1-dc94-33bd2126ba95	2222	Jakobski Dol
00050000-55e4-40d1-c412-92b79aaa4e73	2221	Jarenina
00050000-55e4-40d1-85f1-d28ba3a3dd8e	6254	Jelšane
00050000-55e4-40d1-2561-4bb45b8e33c2	4270	Jesenice
00050000-55e4-40d1-6906-32b7b2413872	8261	Jesenice na Dolenjskem
00050000-55e4-40d1-1e0f-7ec3401357c6	3273	Jurklošter
00050000-55e4-40d1-220d-5f85e6982768	2223	Jurovski Dol
00050000-55e4-40d1-3915-409ebf2267b7	2256	Juršinci
00050000-55e4-40d1-36d7-0f3847eda693	5214	Kal nad Kanalom
00050000-55e4-40d1-6903-ac814f75d1e2	3233	Kalobje
00050000-55e4-40d1-7698-d4e560ed6a3d	4246	Kamna Gorica
00050000-55e4-40d1-e7fd-c9dce01a450b	2351	Kamnica
00050000-55e4-40d1-ee38-d73cc69fb9c2	1241	Kamnik
00050000-55e4-40d1-2b39-07c603a17ff7	5213	Kanal
00050000-55e4-40d1-3ec2-38521280bb92	8258	Kapele
00050000-55e4-40d1-dd92-cbc0f7e5d963	2362	Kapla
00050000-55e4-40d1-c4be-999ea8350f07	2325	Kidričevo
00050000-55e4-40d1-e085-a046a07cfea8	1412	Kisovec
00050000-55e4-40d1-849a-a3aed6d3f4e8	6253	Knežak
00050000-55e4-40d1-7dd6-913283097129	5222	Kobarid
00050000-55e4-40d1-1857-52fe7b12f3d0	9227	Kobilje
00050000-55e4-40d1-50bc-d666b3f2e8fe	1330	Kočevje
00050000-55e4-40d1-a9f6-a0629c137e03	1338	Kočevska Reka
00050000-55e4-40d1-b8e9-a4f3e853e9c2	2276	Kog
00050000-55e4-40d1-c4c8-d7611d72179a	5211	Kojsko
00050000-55e4-40d1-691e-66d514c08ff2	6223	Komen
00050000-55e4-40d1-5daa-77b3cdf3ce66	1218	Komenda
00050000-55e4-40d1-baf2-53b660e2c8f8	6000	Koper/Capodistria 
00050000-55e4-40d1-6ce4-5bd42a6a4fe4	6001	Koper/Capodistria - poštni predali
00050000-55e4-40d1-1da0-a05030ac99cd	8282	Koprivnica
00050000-55e4-40d1-a57c-cc591c5a68be	5296	Kostanjevica na Krasu
00050000-55e4-40d1-5d49-4fbe52ec23be	8311	Kostanjevica na Krki
00050000-55e4-40d1-397b-3affe8b7bb80	1336	Kostel
00050000-55e4-40d1-5d48-83c7e6cfe130	6256	Košana
00050000-55e4-40d1-55e5-fd05b963ef1f	2394	Kotlje
00050000-55e4-40d1-7eab-2da67d4c9925	6240	Kozina
00050000-55e4-40d1-cece-7e811b91517a	3260	Kozje
00050000-55e4-40d1-18b2-7f535273d088	4000	Kranj 
00050000-55e4-40d1-b573-c40a2a3b8813	4001	Kranj - poštni predali
00050000-55e4-40d1-4a11-3acf547e66e1	4280	Kranjska Gora
00050000-55e4-40d1-deed-07040dc17916	1281	Kresnice
00050000-55e4-40d1-6b6e-97d8c27e3612	4294	Križe
00050000-55e4-40d1-7e56-3b2abd3af141	9206	Križevci
00050000-55e4-40d1-cee2-e479f285217b	9242	Križevci pri Ljutomeru
00050000-55e4-40d1-c49c-70b47cfaeb2d	1301	Krka
00050000-55e4-40d1-632c-6bfa55d2055a	8296	Krmelj
00050000-55e4-40d1-8bf9-0e48acabd362	4245	Kropa
00050000-55e4-40d1-3f62-2db7c5e949b5	8262	Krška vas
00050000-55e4-40d1-9a55-cb37d2c0208f	8270	Krško
00050000-55e4-40d1-60e5-99c347131425	9263	Kuzma
00050000-55e4-40d1-e1a9-c5f4ef76c05c	2318	Laporje
00050000-55e4-40d1-4801-f4919b677c2c	3270	Laško
00050000-55e4-40d1-f64c-865fc4575c6b	1219	Laze v Tuhinju
00050000-55e4-40d1-fd23-72228aab3bba	2230	Lenart v Slovenskih goricah
00050000-55e4-40d1-ad3c-e308bbeeffc7	9220	Lendava/Lendva
00050000-55e4-40d1-2fbd-045709dcfd5a	4248	Lesce
00050000-55e4-40d1-d76c-43a134aa992f	3261	Lesično
00050000-55e4-40d1-afc1-6e97129c60de	8273	Leskovec pri Krškem
00050000-55e4-40d1-49ae-02dbe6e8942b	2372	Libeliče
00050000-55e4-40d1-4e85-307da7938ffc	2341	Limbuš
00050000-55e4-40d1-06a4-33441659bfed	1270	Litija
00050000-55e4-40d1-56c2-4dcbc83b2dc5	3202	Ljubečna
00050000-55e4-40d1-a9c3-9339aca2dd82	1000	Ljubljana 
00050000-55e4-40d1-a5ea-3137d33105fb	1001	Ljubljana - poštni predali
00050000-55e4-40d1-6884-89884f143ae1	1231	Ljubljana - Črnuče
00050000-55e4-40d1-a33d-9f513364dba3	1261	Ljubljana - Dobrunje
00050000-55e4-40d1-6e40-f6f911a880df	1260	Ljubljana - Polje
00050000-55e4-40d1-cbb8-617ea0853b84	1210	Ljubljana - Šentvid
00050000-55e4-40d1-3322-08767cd98494	1211	Ljubljana - Šmartno
00050000-55e4-40d1-4b85-b2e5b3062065	3333	Ljubno ob Savinji
00050000-55e4-40d1-7904-97ad15d72631	9240	Ljutomer
00050000-55e4-40d1-146f-e30aa016e2ca	3215	Loče
00050000-55e4-40d1-46ce-bdf5e7d6c4b9	5231	Log pod Mangartom
00050000-55e4-40d1-bc4d-12dacbb4445d	1358	Log pri Brezovici
00050000-55e4-40d1-6ed9-a04cab8b5b47	1370	Logatec
00050000-55e4-40d1-82fb-eb84c3878cf6	1371	Logatec
00050000-55e4-40d1-a645-92568f5e10b2	1434	Loka pri Zidanem Mostu
00050000-55e4-40d1-5275-4f355261cf27	3223	Loka pri Žusmu
00050000-55e4-40d1-07b8-0df0139e70ce	6219	Lokev
00050000-55e4-40d1-0766-e742e15aa002	1318	Loški Potok
00050000-55e4-40d1-4e09-6ed8927f5ff6	2324	Lovrenc na Dravskem polju
00050000-55e4-40d1-62fa-cfc4c225f828	2344	Lovrenc na Pohorju
00050000-55e4-40d1-d35d-09d831b75962	3334	Luče
00050000-55e4-40d1-0437-af7501d4012c	1225	Lukovica
00050000-55e4-40d1-2835-235c7a964c44	9202	Mačkovci
00050000-55e4-40d1-b96c-f95a15b0ee2c	2322	Majšperk
00050000-55e4-40d1-d6e4-d62c0cd719d9	2321	Makole
00050000-55e4-40d1-0484-8b956a2554e4	9243	Mala Nedelja
00050000-55e4-40d1-db1f-6b9eaffd6eb9	2229	Malečnik
00050000-55e4-40d1-c655-0d66bee7a3a9	6273	Marezige
00050000-55e4-40d1-314c-887b56ef57ee	2000	Maribor 
00050000-55e4-40d1-11ed-a033f528abeb	2001	Maribor - poštni predali
00050000-55e4-40d1-7476-0ed7770c0c7f	2206	Marjeta na Dravskem polju
00050000-55e4-40d1-7096-2e4a219cf8e4	2281	Markovci
00050000-55e4-40d1-46ae-33a5770716fa	9221	Martjanci
00050000-55e4-40d1-0f3a-06d302ccf376	6242	Materija
00050000-55e4-40d1-0261-8c91c96eb2ee	4211	Mavčiče
00050000-55e4-40d1-cf19-28f833e587da	1215	Medvode
00050000-55e4-40d1-cd59-5c1c0b1711c0	1234	Mengeš
00050000-55e4-40d1-919e-d07c0c5177e8	8330	Metlika
00050000-55e4-40d1-144c-efa4dc2b44c6	2392	Mežica
00050000-55e4-40d1-ab52-b9f058cd6666	2204	Miklavž na Dravskem polju
00050000-55e4-40d1-990f-ff04a3c34ca7	2275	Miklavž pri Ormožu
00050000-55e4-40d1-2296-0988a080c9cf	5291	Miren
00050000-55e4-40d1-4b02-2b89059f654a	8233	Mirna
00050000-55e4-40d1-9089-6d240745319e	8216	Mirna Peč
00050000-55e4-40d1-9aa0-110db53482b7	2382	Mislinja
00050000-55e4-40d1-b032-24f6d2214fa8	4281	Mojstrana
00050000-55e4-40d1-3dd6-1da19eff05a7	8230	Mokronog
00050000-55e4-40d1-c7c3-092d719c93e4	1251	Moravče
00050000-55e4-40d1-46d6-b875c9214cab	9226	Moravske Toplice
00050000-55e4-40d1-e992-2195f6d3afb4	5216	Most na Soči
00050000-55e4-40d1-2935-9f7f17d270a0	1221	Motnik
00050000-55e4-40d1-fc39-45d2e894ad10	3330	Mozirje
00050000-55e4-40d1-dc3a-3a98a35ec0b5	9000	Murska Sobota 
00050000-55e4-40d1-b77c-65ca1d15e99c	9001	Murska Sobota - poštni predali
00050000-55e4-40d1-e87a-990e7b750979	2366	Muta
00050000-55e4-40d1-54cc-4399ba67c081	4202	Naklo
00050000-55e4-40d1-af9a-3e9f10a6ce52	3331	Nazarje
00050000-55e4-40d1-ef6b-4ff242f1e466	1357	Notranje Gorice
00050000-55e4-40d1-3f4e-e55169dc04f4	3203	Nova Cerkev
00050000-55e4-40d1-0020-0a84917fde32	5000	Nova Gorica 
00050000-55e4-40d1-2506-58fada9e4b30	5001	Nova Gorica - poštni predali
00050000-55e4-40d1-bffa-93fe8496b697	1385	Nova vas
00050000-55e4-40d1-668d-374ca448ba35	8000	Novo mesto
00050000-55e4-40d1-b2f9-967e3f691d72	8001	Novo mesto - poštni predali
00050000-55e4-40d1-dbb5-3787ab91a88e	6243	Obrov
00050000-55e4-40d1-a941-0edda82ead16	9233	Odranci
00050000-55e4-40d1-692a-6287e0c043c6	2317	Oplotnica
00050000-55e4-40d1-7670-0444b3a19d19	2312	Orehova vas
00050000-55e4-40d1-a800-b0dc4a012c0b	2270	Ormož
00050000-55e4-40d1-c321-7448846ae9fe	1316	Ortnek
00050000-55e4-40d1-0694-debef1176013	1337	Osilnica
00050000-55e4-40d1-8eb5-3ddd19093981	8222	Otočec
00050000-55e4-40d1-107b-e4ef80c30920	2361	Ožbalt
00050000-55e4-40d1-2b9b-ce914e2f76f6	2231	Pernica
00050000-55e4-40d1-0ab1-d6af8ae5cb20	2211	Pesnica pri Mariboru
00050000-55e4-40d1-fddc-ef9d3972f646	9203	Petrovci
00050000-55e4-40d1-1fe8-a6510e5b9e9e	3301	Petrovče
00050000-55e4-40d1-8d12-797db63803c0	6330	Piran/Pirano
00050000-55e4-40d1-5dba-5f1ed97c915c	8255	Pišece
00050000-55e4-40d1-f41b-876f5c1bab9b	6257	Pivka
00050000-55e4-40d1-b63f-d5503cc85f0e	6232	Planina
00050000-55e4-40d1-0ca7-06f299da90cc	3225	Planina pri Sevnici
00050000-55e4-40d1-c138-57f50ccca030	6276	Pobegi
00050000-55e4-40d1-a8df-372c804d49f8	8312	Podbočje
00050000-55e4-40d1-4313-df3bbd0a3129	5243	Podbrdo
00050000-55e4-40d1-1f17-d4bb3ffb1bb6	3254	Podčetrtek
00050000-55e4-40d1-ed31-87ef74038b5f	2273	Podgorci
00050000-55e4-40d1-d10e-037235f59b5e	6216	Podgorje
00050000-55e4-40d1-aa7e-bce961c3d71f	2381	Podgorje pri Slovenj Gradcu
00050000-55e4-40d1-fe41-39724789b56a	6244	Podgrad
00050000-55e4-40d1-de56-2ce14920d2f2	1414	Podkum
00050000-55e4-40d1-4fba-999820351e97	2286	Podlehnik
00050000-55e4-40d1-eabb-94578daada45	5272	Podnanos
00050000-55e4-40d1-e9fb-e6fdb077cdd0	4244	Podnart
00050000-55e4-40d1-1dc0-7fbf7be11ab1	3241	Podplat
00050000-55e4-40d1-16b6-2b601116fb07	3257	Podsreda
00050000-55e4-40d1-194c-ed2620dc3715	2363	Podvelka
00050000-55e4-40d1-9b3f-66fdaae7d884	2208	Pohorje
00050000-55e4-40d1-eefc-f287fb6a1a24	2257	Polenšak
00050000-55e4-40d1-465c-16517aeaf85a	1355	Polhov Gradec
00050000-55e4-40d1-4634-b2fcbb221c08	4223	Poljane nad Škofjo Loko
00050000-55e4-40d1-23e5-9367b8a719cb	2319	Poljčane
00050000-55e4-40d1-364c-8a13383af77e	1272	Polšnik
00050000-55e4-40d1-b598-3840454bbf89	3313	Polzela
00050000-55e4-40d1-9e29-32680d4dc142	3232	Ponikva
00050000-55e4-40d1-7a86-dd8e87a93de7	6320	Portorož/Portorose
00050000-55e4-40d1-c074-585f1e470fd1	6230	Postojna
00050000-55e4-40d1-1ab0-8fe1c40f666a	2331	Pragersko
00050000-55e4-40d1-26dd-460cc875b87a	3312	Prebold
00050000-55e4-40d1-b8f6-76d098c0b75f	4205	Preddvor
00050000-55e4-40d1-0fd9-902aa4c4fabe	6255	Prem
00050000-55e4-40d1-eacb-2d05e83fd9df	1352	Preserje
00050000-55e4-40d1-96ad-fb9f91cf5eb2	6258	Prestranek
00050000-55e4-40d1-79ad-6bc64c0065d0	2391	Prevalje
00050000-55e4-40d1-f980-032c74063601	3262	Prevorje
00050000-55e4-40d1-7a14-a1b28a4a69df	1276	Primskovo 
00050000-55e4-40d1-493b-f95099d2b787	3253	Pristava pri Mestinju
00050000-55e4-40d1-8553-16aacee6834f	9207	Prosenjakovci/Partosfalva
00050000-55e4-40d1-819e-c58ecc39c2c7	5297	Prvačina
00050000-55e4-40d1-c1a6-27b054120719	2250	Ptuj
00050000-55e4-40d1-f05c-dfbd62dfd3f0	2323	Ptujska Gora
00050000-55e4-40d1-a039-681eb6171b9e	9201	Puconci
00050000-55e4-40d1-afb0-3b9bd9c5a784	2327	Rače
00050000-55e4-40d1-4fce-e6e41f9484a3	1433	Radeče
00050000-55e4-40d1-f4c0-7160726a8513	9252	Radenci
00050000-55e4-40d1-bda4-67068cad688a	2360	Radlje ob Dravi
00050000-55e4-40d1-9ccb-7648701b7a53	1235	Radomlje
00050000-55e4-40d1-07de-bb6fa3cb139b	4240	Radovljica
00050000-55e4-40d1-1c3e-ad89d5ee7a1e	8274	Raka
00050000-55e4-40d1-8b9a-520ef1ba3448	1381	Rakek
00050000-55e4-40d1-1793-ba19ffa670db	4283	Rateče - Planica
00050000-55e4-40d1-a5af-436d68b98443	2390	Ravne na Koroškem
00050000-55e4-40d1-6d6b-25ddccfec519	9246	Razkrižje
00050000-55e4-40d1-ee95-3cee705ca702	3332	Rečica ob Savinji
00050000-55e4-40d1-3bb0-1e5577bd8d68	5292	Renče
00050000-55e4-40d1-0664-438b3d34dffb	1310	Ribnica
00050000-55e4-40d1-55e3-92ab3837bcfa	2364	Ribnica na Pohorju
00050000-55e4-40d1-7475-fa572fdc76b7	3272	Rimske Toplice
00050000-55e4-40d1-7990-45c0b66d9603	1314	Rob
00050000-55e4-40d1-2ad6-6ccf43935f1d	5215	Ročinj
00050000-55e4-40d1-645b-18e0d65f966c	3250	Rogaška Slatina
00050000-55e4-40d1-b0cd-22ec7b26f13a	9262	Rogašovci
00050000-55e4-40d1-8a9b-78a3daa1a23f	3252	Rogatec
00050000-55e4-40d1-e150-97c5e0474075	1373	Rovte
00050000-55e4-40d1-3b30-23ecd057437e	2342	Ruše
00050000-55e4-40d1-8a78-a92b247acde2	1282	Sava
00050000-55e4-40d1-04b6-eb8dd9c4aa06	6333	Sečovlje/Sicciole
00050000-55e4-40d1-b0a1-ba07b5c6aae8	4227	Selca
00050000-55e4-40d1-b4b7-bec6788e1d08	2352	Selnica ob Dravi
00050000-55e4-40d1-c4aa-87d979415ee4	8333	Semič
00050000-55e4-40d1-9fab-cfdc32e36750	8281	Senovo
00050000-55e4-40d1-a042-370331cf5e64	6224	Senožeče
00050000-55e4-40d1-8b40-419b588ed733	8290	Sevnica
00050000-55e4-40d1-f39d-15f733ac727b	6210	Sežana
00050000-55e4-40d1-d599-b392e7e3083f	2214	Sladki Vrh
00050000-55e4-40d1-6d9b-b4f0ada3d474	5283	Slap ob Idrijci
00050000-55e4-40d1-e403-940da1c2d727	2380	Slovenj Gradec
00050000-55e4-40d1-a04c-cee3feb66980	2310	Slovenska Bistrica
00050000-55e4-40d1-68a0-b06cbc3dd248	3210	Slovenske Konjice
00050000-55e4-40d1-27fe-49cb76b614b3	1216	Smlednik
00050000-55e4-40d1-3aab-413692ebf2c6	5232	Soča
00050000-55e4-40d1-4427-70bbbe74335f	1317	Sodražica
00050000-55e4-40d1-412b-09ce68f57343	3335	Solčava
00050000-55e4-40d1-09bd-26fcb92599ed	5250	Solkan
00050000-55e4-40d1-7558-6741cbe09bb5	4229	Sorica
00050000-55e4-40d1-72af-932cc7cf27b6	4225	Sovodenj
00050000-55e4-40d1-4300-f6d3b05fb30f	5281	Spodnja Idrija
00050000-55e4-40d1-5414-f179a6d488e9	2241	Spodnji Duplek
00050000-55e4-40d1-d6de-1821edd92b9e	9245	Spodnji Ivanjci
00050000-55e4-40d1-67db-22773b204393	2277	Središče ob Dravi
00050000-55e4-40d1-9484-002e1888a2f5	4267	Srednja vas v Bohinju
00050000-55e4-40d1-09bf-e82d8b2decd6	8256	Sromlje 
00050000-55e4-40d1-164f-0572bc71c9f2	5224	Srpenica
00050000-55e4-40d1-076c-b7b64c524218	1242	Stahovica
00050000-55e4-40d1-bd5f-9d1d1bfb9873	1332	Stara Cerkev
00050000-55e4-40d1-1cbb-e6d0efdb6700	8342	Stari trg ob Kolpi
00050000-55e4-40d1-4dd4-ee7a9417ce9e	1386	Stari trg pri Ložu
00050000-55e4-40d1-12d6-0f2e4d863556	2205	Starše
00050000-55e4-40d1-9b1c-e8803001695a	2289	Stoperce
00050000-55e4-40d1-389f-c0805b820333	8322	Stopiče
00050000-55e4-40d1-3db4-e0eb21e3c928	3206	Stranice
00050000-55e4-40d1-ccde-e5363eed7999	8351	Straža
00050000-55e4-40d1-f7a4-55c4c96dddea	1313	Struge
00050000-55e4-40d1-ffab-859bc69bdef9	8293	Studenec
00050000-55e4-40d1-fc5c-73117f8feea3	8331	Suhor
00050000-55e4-40d1-cd5a-c9935d922c7d	2233	Sv. Ana v Slovenskih goricah
00050000-55e4-40d1-6dd0-cfca85faf684	2235	Sv. Trojica v Slovenskih goricah
00050000-55e4-40d1-c429-be156dc88610	2353	Sveti Duh na Ostrem Vrhu
00050000-55e4-40d1-e7aa-5ed25fb4053e	9244	Sveti Jurij ob Ščavnici
00050000-55e4-40d1-ff79-7266c27a3b7f	3264	Sveti Štefan
00050000-55e4-40d1-e4dd-ad11fdf99213	2258	Sveti Tomaž
00050000-55e4-40d1-a844-898f40bb2405	9204	Šalovci
00050000-55e4-40d1-3594-edb8f0df5a23	5261	Šempas
00050000-55e4-40d1-7d92-b0e466e4a1f1	5290	Šempeter pri Gorici
00050000-55e4-40d1-786f-7efd62a28a46	3311	Šempeter v Savinjski dolini
00050000-55e4-40d1-9cab-6032747c9f75	4208	Šenčur
00050000-55e4-40d1-086b-41ba058939ac	2212	Šentilj v Slovenskih goricah
00050000-55e4-40d1-2f31-aa42707b737d	8297	Šentjanž
00050000-55e4-40d1-0753-803b55817a21	2373	Šentjanž pri Dravogradu
00050000-55e4-40d1-d2f9-38001055c4f5	8310	Šentjernej
00050000-55e4-40d1-442f-f9610d451172	3230	Šentjur
00050000-55e4-40d1-808c-38abeede6e1a	3271	Šentrupert
00050000-55e4-40d1-c3ea-0c778ce759c9	8232	Šentrupert
00050000-55e4-40d1-f622-939e261e5d25	1296	Šentvid pri Stični
00050000-55e4-40d1-b7ea-5d55682ca1a0	8275	Škocjan
00050000-55e4-40d1-8746-6c48f256f8a9	6281	Škofije
00050000-55e4-40d1-247f-322ea1cce377	4220	Škofja Loka
00050000-55e4-40d1-17d2-c58650d27ee0	3211	Škofja vas
00050000-55e4-40d1-0767-2a3be26df1bb	1291	Škofljica
00050000-55e4-40d1-b2da-34612eb7704d	6274	Šmarje
00050000-55e4-40d1-36e8-5c0ecfc42196	1293	Šmarje - Sap
00050000-55e4-40d1-3348-930458169d0d	3240	Šmarje pri Jelšah
00050000-55e4-40d1-3603-036f2323d794	8220	Šmarješke Toplice
00050000-55e4-40d1-4086-70ac03e8c321	2315	Šmartno na Pohorju
00050000-55e4-40d1-0944-4e7a716bd3a3	3341	Šmartno ob Dreti
00050000-55e4-40d1-9c64-69c28aa1471b	3327	Šmartno ob Paki
00050000-55e4-40d1-61c3-3525af52158c	1275	Šmartno pri Litiji
00050000-55e4-40d1-3aa5-9eb1eaa9b27a	2383	Šmartno pri Slovenj Gradcu
00050000-55e4-40d1-d287-a2af941f423c	3201	Šmartno v Rožni dolini
00050000-55e4-40d1-9d94-3d4f87ad465d	3325	Šoštanj
00050000-55e4-40d1-3d72-a966b596d532	6222	Štanjel
00050000-55e4-40d1-7064-bb74d963b8be	3220	Štore
00050000-55e4-40d1-d58c-656a64b06b3c	3304	Tabor
00050000-55e4-40d1-e351-cf4a9d6eaa60	3221	Teharje
00050000-55e4-40d1-6369-abce3341483e	9251	Tišina
00050000-55e4-40d1-f730-86b89337e3ff	5220	Tolmin
00050000-55e4-40d1-7e9a-86e412d1f06e	3326	Topolšica
00050000-55e4-40d1-3219-dc0a2561f544	2371	Trbonje
00050000-55e4-40d1-48d6-71368c094f95	1420	Trbovlje
00050000-55e4-40d1-a613-0523246e46fc	8231	Trebelno 
00050000-55e4-40d1-d890-b91e66fd3d93	8210	Trebnje
00050000-55e4-40d1-cc75-818994cf094a	5252	Trnovo pri Gorici
00050000-55e4-40d1-6b3a-652a3e956e42	2254	Trnovska vas
00050000-55e4-40d1-b3c5-e788499918b3	1222	Trojane
00050000-55e4-40d1-2d54-f6ce5d7a1511	1236	Trzin
00050000-55e4-40d1-2997-98494bcc6d26	4290	Tržič
00050000-55e4-40d1-f7cc-72bec22a0955	8295	Tržišče
00050000-55e4-40d1-d045-2907266c8e09	1311	Turjak
00050000-55e4-40d1-a373-aa745f2d8c97	9224	Turnišče
00050000-55e4-40d1-3f7a-4631bc0838ed	8323	Uršna sela
00050000-55e4-40d1-aa3b-bd19c672b3c0	1252	Vače
00050000-55e4-40d1-73fc-1519cf830a4d	3320	Velenje 
00050000-55e4-40d1-7d85-32513beca90b	3322	Velenje - poštni predali
00050000-55e4-40d1-6531-ddda7263e7e6	8212	Velika Loka
00050000-55e4-40d2-85aa-3b276f15a089	2274	Velika Nedelja
00050000-55e4-40d2-9466-e84895c5519a	9225	Velika Polana
00050000-55e4-40d2-4c34-16d5d64abad5	1315	Velike Lašče
00050000-55e4-40d2-81ba-73ab7e559eee	8213	Veliki Gaber
00050000-55e4-40d2-9023-71a614fe8fb7	9241	Veržej
00050000-55e4-40d2-233e-ae9b67ee2473	1312	Videm - Dobrepolje
00050000-55e4-40d2-7fce-a0b302112af9	2284	Videm pri Ptuju
00050000-55e4-40d2-4608-d5b659184b5e	8344	Vinica
00050000-55e4-40d2-a4d7-f8daa5940aec	5271	Vipava
00050000-55e4-40d2-1dcf-535a000a71c8	4212	Visoko
00050000-55e4-40d2-ffb4-c3164d7db432	1294	Višnja Gora
00050000-55e4-40d2-bea6-fceb5dc42f6e	3205	Vitanje
00050000-55e4-40d2-504a-01e907a5da74	2255	Vitomarci
00050000-55e4-40d2-3bea-d72ce0d2d1a6	1217	Vodice
00050000-55e4-40d2-dcad-3446faa89241	3212	Vojnik\t
00050000-55e4-40d2-e0d3-be28289ec730	5293	Volčja Draga
00050000-55e4-40d2-7d7e-9b50f355db85	2232	Voličina
00050000-55e4-40d2-89a1-96bdb74bfc4c	3305	Vransko
00050000-55e4-40d2-fb8f-8d9fb4f97fea	6217	Vremski Britof
00050000-55e4-40d2-b352-726208572431	1360	Vrhnika
00050000-55e4-40d2-987a-c2c867a71cd1	2365	Vuhred
00050000-55e4-40d2-edad-6beba3187c05	2367	Vuzenica
00050000-55e4-40d2-1df7-b6527ebe081c	8292	Zabukovje 
00050000-55e4-40d2-8ca2-dd55f57c9df5	1410	Zagorje ob Savi
00050000-55e4-40d2-3ad6-d7b77078f828	1303	Zagradec
00050000-55e4-40d2-7ee7-ef30b26eed34	2283	Zavrč
00050000-55e4-40d2-1c6b-d3f8160dfc8d	8272	Zdole 
00050000-55e4-40d2-cfc0-f91ec32f57bc	4201	Zgornja Besnica
00050000-55e4-40d2-ccfe-d75750a5048b	2242	Zgornja Korena
00050000-55e4-40d2-1d34-fbffdd432476	2201	Zgornja Kungota
00050000-55e4-40d2-772c-9381bdef9db8	2316	Zgornja Ložnica
00050000-55e4-40d2-0d5b-fd497bd1f20f	2314	Zgornja Polskava
00050000-55e4-40d2-dcbe-1700a65275bb	2213	Zgornja Velka
00050000-55e4-40d2-66e5-063177ad7af8	4247	Zgornje Gorje
00050000-55e4-40d2-4932-781ef447975a	4206	Zgornje Jezersko
00050000-55e4-40d2-efe5-a073a737cbe0	2285	Zgornji Leskovec
00050000-55e4-40d2-b017-b8e6f63a5338	1432	Zidani Most
00050000-55e4-40d2-203b-dcb6d7c811c0	3214	Zreče
00050000-55e4-40d2-bbc1-7aa1ac4d5824	4209	Žabnica
00050000-55e4-40d2-c187-29707e795192	3310	Žalec
00050000-55e4-40d2-2ed5-d5c98070f6ac	4228	Železniki
00050000-55e4-40d2-3a9e-1899a288be50	2287	Žetale
00050000-55e4-40d2-3991-8e1323e38cdd	4226	Žiri
00050000-55e4-40d2-56ca-557dd5de1226	4274	Žirovnica
00050000-55e4-40d2-9d81-fef664ed7a5a	8360	Žužemberk
\.


--
-- TOC entry 2934 (class 0 OID 16632711)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 16632518)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55e4-40d3-1453-12db68652c0e	00080000-55e4-40d3-6498-c6523c082cc2	\N	00040000-55e4-40d2-5298-3dba115c4899	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55e4-40d3-24e2-96b1b256b645	00080000-55e4-40d3-6498-c6523c082cc2	\N	00040000-55e4-40d2-5298-3dba115c4899		\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55e4-40d3-2457-6afddecc67fc	00080000-55e4-40d3-93d3-df24a091471e	\N	00040000-55e4-40d2-5298-3dba115c4899		\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2922 (class 0 OID 16632596)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 16632723)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2960 (class 0 OID 16633074)
-- Dependencies: 226
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 16633084)
-- Dependencies: 227
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55e4-40d3-b5ad-21fd67493dd3	00080000-55e4-40d3-740c-311536fcc1a5	0987	AK
00190000-55e4-40d3-ad45-37daee9554fb	00080000-55e4-40d3-93d3-df24a091471e	0989	AK
00190000-55e4-40d3-9089-2bef9b6b3b2c	00080000-55e4-40d3-d6bd-d80e6939c68a	0986	AK
00190000-55e4-40d3-93ae-d0d602e03b3a	00080000-55e4-40d3-c060-37005ade9c03	0984	AK
00190000-55e4-40d3-f416-c85bcc16b1c7	00080000-55e4-40d3-3108-67e2b1561941	0983	AK
00190000-55e4-40d3-5d85-7dad66e8b75a	00080000-55e4-40d3-5879-af6620c1955b	0982	AK
00190000-55e4-40d4-078e-0e7c30ff1e83	00080000-55e4-40d4-5b70-a2d2584b56df	1001	AK
\.


--
-- TOC entry 2959 (class 0 OID 16633030)
-- Dependencies: 225
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55e4-40d3-5822-f58928cc3070	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2962 (class 0 OID 16633092)
-- Dependencies: 228
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 16632752)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55e4-40d3-5d69-d83e39485a6d	\N	\N	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55e4-40d3-947e-e6d703757a91	\N	\N	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55e4-40d3-23cd-21fd51695f00	\N	\N	0003	Kazinska	t	84	Kazinska dvorana
00220000-55e4-40d3-9387-ce2debc0d50d	\N	\N	0004	Mali oder	t	24	Mali oder 
00220000-55e4-40d3-607f-018afa9cdda9	\N	\N	0005	Komorni oder	t	15	Komorni oder
00220000-55e4-40d3-c1ea-225754e38a03	\N	\N	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55e4-40d3-7898-94ec701b69eb	\N	\N	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2932 (class 0 OID 16632696)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 16632686)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 16632883)
-- Dependencies: 218
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 16632822)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 16632391)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55e4-40d4-5b70-a2d2584b56df	00010000-55e4-40d2-c212-7b27dcbf386e	2015-08-31 13:56:04	INS	a:0:{}
2	App\\Entity\\Option	00000000-55e4-40d4-f39b-f12d8b3762d6	00010000-55e4-40d2-c212-7b27dcbf386e	2015-08-31 13:56:04	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55e4-40d4-078e-0e7c30ff1e83	00010000-55e4-40d2-c212-7b27dcbf386e	2015-08-31 13:56:04	INS	a:0:{}
\.


--
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2941 (class 0 OID 16632764)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 16632429)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55e4-40d2-d6bf-56b6d3b4a98e	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55e4-40d2-838e-5b58904a2922	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55e4-40d2-3708-55c2b11155e0	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55e4-40d2-4f9f-231a10aa6a19	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55e4-40d2-9b66-62b98a2d8774	planer	Planer dogodkov v koledarju	t
00020000-55e4-40d2-eb24-ff58b6517eaa	kadrovska	Kadrovska služba	t
00020000-55e4-40d2-c873-bdb14b0fe25e	arhivar	Ažuriranje arhivalij	t
00020000-55e4-40d2-6ebf-9c2b51e79244	igralec	Igralec	t
00020000-55e4-40d2-4f1e-db3f421418b6	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55e4-40d3-5b31-cedc8c5fbd90	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2907 (class 0 OID 16632413)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55e4-40d2-bfdb-4be54d2d4206	00020000-55e4-40d2-3708-55c2b11155e0
00010000-55e4-40d2-c212-7b27dcbf386e	00020000-55e4-40d2-3708-55c2b11155e0
00010000-55e4-40d3-3b9f-9359768aac21	00020000-55e4-40d3-5b31-cedc8c5fbd90
\.


--
-- TOC entry 2943 (class 0 OID 16632778)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 16632717)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 16632663)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 16633133)
-- Dependencies: 233
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55e4-40d2-11d2-3f6076caccf8	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55e4-40d2-c472-219bcb611f62	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55e4-40d2-f4f6-dcdc345ba035	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55e4-40d2-3e62-4cf748a0a80c	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55e4-40d2-9cc6-3ee5e2875104	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2966 (class 0 OID 16633125)
-- Dependencies: 232
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55e4-40d2-cdbd-d0ed55fcb686	00230000-55e4-40d2-3e62-4cf748a0a80c	popa
00240000-55e4-40d2-c74b-d4043ed6144d	00230000-55e4-40d2-3e62-4cf748a0a80c	oseba
00240000-55e4-40d2-8c7d-ff393fd5020f	00230000-55e4-40d2-3e62-4cf748a0a80c	sezona
00240000-55e4-40d2-fd3a-8effc750ba8d	00230000-55e4-40d2-c472-219bcb611f62	prostor
00240000-55e4-40d2-f20c-fa1ea7e667d8	00230000-55e4-40d2-3e62-4cf748a0a80c	besedilo
00240000-55e4-40d2-6b4f-631263ca62c9	00230000-55e4-40d2-3e62-4cf748a0a80c	uprizoritev
00240000-55e4-40d2-f1a0-e2cfd4faa97c	00230000-55e4-40d2-3e62-4cf748a0a80c	funkcija
00240000-55e4-40d2-7fbe-0a63b6a29ecb	00230000-55e4-40d2-3e62-4cf748a0a80c	tipfunkcije
00240000-55e4-40d2-e24e-ba89a692bd58	00230000-55e4-40d2-3e62-4cf748a0a80c	alternacija
00240000-55e4-40d2-0c7f-6118eb501521	00230000-55e4-40d2-11d2-3f6076caccf8	pogodba
00240000-55e4-40d2-adb6-274c27b94060	00230000-55e4-40d2-3e62-4cf748a0a80c	zaposlitev
00240000-55e4-40d2-2c1a-8535c96ea58f	00230000-55e4-40d2-11d2-3f6076caccf8	programdela
00240000-55e4-40d2-fe74-5c7b8383dcc0	00230000-55e4-40d2-3e62-4cf748a0a80c	zapis
\.


--
-- TOC entry 2965 (class 0 OID 16633120)
-- Dependencies: 231
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
6aac7269-e24d-4ee3-b361-e35a28d20f46	00230000-55e4-40d2-3e62-4cf748a0a80c	0	1001
\.


--
-- TOC entry 2948 (class 0 OID 16632832)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55e4-40d3-6647-fdf68a9f2e7f	000e0000-55e4-40d3-f55f-b10804a47e5b	00080000-55e4-40d3-6498-c6523c082cc2	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55e4-40d2-2590-8177176c7612
00270000-55e4-40d3-ed82-fab02d8cbaec	000e0000-55e4-40d3-f55f-b10804a47e5b	00080000-55e4-40d3-6498-c6523c082cc2	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55e4-40d2-2590-8177176c7612
00270000-55e4-40d3-1273-e79224f3ce70	000e0000-55e4-40d3-f55f-b10804a47e5b	00080000-55e4-40d3-feeb-5d3b42a848b5	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4	\N
\.


--
-- TOC entry 2914 (class 0 OID 16632491)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 16632673)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55e4-40d3-bae9-6a3ba983a30a	00180000-55e4-40d3-449f-a65b5a752367	000c0000-55e4-40d3-7189-8a297ee5ee7b	00090000-55e4-40d3-12ad-055d8cb07085	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e4-40d3-b7d5-088039d06b23	00180000-55e4-40d3-449f-a65b5a752367	000c0000-55e4-40d3-833d-6ca0f688ff53	00090000-55e4-40d3-78d7-2881ab7d1d89	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e4-40d3-5f12-577659162d37	00180000-55e4-40d3-449f-a65b5a752367	000c0000-55e4-40d3-7641-0c77f0d0bf1a	00090000-55e4-40d3-af78-512381ca8e67	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e4-40d3-e038-dcc32d65ff26	00180000-55e4-40d3-449f-a65b5a752367	000c0000-55e4-40d3-7f1a-6cf33e1fedd1	00090000-55e4-40d3-76ec-f3081a1463f2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e4-40d3-0f68-5476ff796f82	00180000-55e4-40d3-449f-a65b5a752367	000c0000-55e4-40d3-da56-c9f68fb41cb1	00090000-55e4-40d3-b013-9cb081832173	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e4-40d3-7803-1381af7c6c52	00180000-55e4-40d3-4b73-e7bd71e299b2	\N	00090000-55e4-40d3-b013-9cb081832173	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2951 (class 0 OID 16632872)
-- Dependencies: 217
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55e4-40d2-317c-e20f6372e406	Avtor	Avtorji	Avtorka	umetnik
000f0000-55e4-40d2-c15b-c93aec55f817	Priredba	Priredba	Priredba	umetnik
000f0000-55e4-40d2-8627-20d1072af760	Prevod	Prevod	Prevod	umetnik
000f0000-55e4-40d2-e579-65c5238405d9	Režija	Režija	Režija	umetnik
000f0000-55e4-40d2-d71d-c464ceeaccb7	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55e4-40d2-456c-f9f8727bb829	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55e4-40d2-0cdb-4ff04e9c7940	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55e4-40d2-0bac-eb529befa958	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55e4-40d2-4187-fa88fc07d65e	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55e4-40d2-c419-3d2e2a30cb8b	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55e4-40d2-9ccc-3d1ed46c396a	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55e4-40d2-f79b-65dc0a0e7e7a	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55e4-40d2-e89a-5baf76f7be87	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55e4-40d2-afd7-0d58413905c1	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55e4-40d2-0963-dc00a4d9f54e	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55e4-40d2-09d5-7b5eee66e44d	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55e4-40d2-3667-3402704b7f24	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55e4-40d2-4d60-814ca9116572	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2963 (class 0 OID 16633102)
-- Dependencies: 229
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55e4-40d2-a897-180fd146ae7b	01	Velika predstava	f	1.00	1.00
002b0000-55e4-40d2-5634-fb86112e4555	02	Mala predstava	f	0.50	0.50
002b0000-55e4-40d2-6371-ae7408071449	03	Mala koprodukcija	t	0.40	1.00
002b0000-55e4-40d2-7840-88813041d1fc	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55e4-40d2-b264-ae71c78cdec0	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2919 (class 0 OID 16632553)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 16632400)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55e4-40d2-c212-7b27dcbf386e	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROxL/.w9SV3lLunM9KcGTvUQdOQoWQxlG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55e4-40d3-547b-9d6602493ba7	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55e4-40d3-81fe-8b78d01a11f1	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55e4-40d3-2c03-50cece322c7c	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55e4-40d3-e3e0-c9c0a8778616	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55e4-40d3-5091-29e2338e85f6	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55e4-40d3-0a1c-30a9d3a4fef6	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55e4-40d3-d08a-e1b888e09980	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55e4-40d3-d33c-922b26d744d2	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55e4-40d3-6347-834679638dc1	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55e4-40d3-3b9f-9359768aac21	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55e4-40d2-bfdb-4be54d2d4206	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2955 (class 0 OID 16632920)
-- Dependencies: 221
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55e4-40d3-f192-2da8555938cd	00160000-55e4-40d3-7095-36068fc94c27	\N	00140000-55e4-40d2-8020-a1c2f2e632a5	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55e4-40d3-607f-018afa9cdda9
000e0000-55e4-40d3-f55f-b10804a47e5b	00160000-55e4-40d3-eb16-8fbdafbc650d	\N	00140000-55e4-40d2-5d4a-9dae19d69dda	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55e4-40d3-c1ea-225754e38a03
000e0000-55e4-40d3-159f-af0de95acabe	\N	\N	00140000-55e4-40d2-5d4a-9dae19d69dda	00190000-55e4-40d3-b5ad-21fd67493dd3	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55e4-40d3-607f-018afa9cdda9
000e0000-55e4-40d3-e7bc-f153a952d1f4	\N	\N	00140000-55e4-40d2-5d4a-9dae19d69dda	00190000-55e4-40d3-b5ad-21fd67493dd3	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55e4-40d3-607f-018afa9cdda9
000e0000-55e4-40d3-ce81-3ab8ea5a4ae8	\N	\N	00140000-55e4-40d2-5d4a-9dae19d69dda	00190000-55e4-40d3-b5ad-21fd67493dd3	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55e4-40d3-5d69-d83e39485a6d
000e0000-55e4-40d3-3097-be02000c97ca	\N	\N	00140000-55e4-40d2-5d4a-9dae19d69dda	00190000-55e4-40d3-b5ad-21fd67493dd3	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55e4-40d3-5d69-d83e39485a6d
\.


--
-- TOC entry 2924 (class 0 OID 16632615)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55e4-40d3-8af8-c59ed1ba18f2	000e0000-55e4-40d3-f55f-b10804a47e5b	1	
00200000-55e4-40d3-0d59-611692410d4a	000e0000-55e4-40d3-f55f-b10804a47e5b	2	
\.


--
-- TOC entry 2939 (class 0 OID 16632744)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 16632846)
-- Dependencies: 215
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55e4-40d2-0725-783c62daf3c3	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55e4-40d2-6fe9-8a0d1c6837a6	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55e4-40d2-cd15-58d2daa04201	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55e4-40d2-bc05-3270f749ee4c	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55e4-40d2-5370-5f7b54c8662a	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55e4-40d2-d79c-7078fb6af28b	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55e4-40d2-d610-dc5975258e99	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55e4-40d2-640f-bfafbaa229c7	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55e4-40d2-2590-8177176c7612	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55e4-40d2-c71a-9379c1d889dd	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55e4-40d2-d8ac-722e132ba525	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55e4-40d2-fdd4-f234bb63904d	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55e4-40d2-a6a6-3118ab370dfe	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55e4-40d2-ccf4-564a96456c7f	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55e4-40d2-7ca8-7ab2eb234cfa	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55e4-40d2-adf0-f54dd8955668	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55e4-40d2-cdca-5c40daf8a3d9	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55e4-40d2-d3c6-3b673f113b07	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55e4-40d2-62d0-8f3dc6a41878	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55e4-40d2-cbf2-1b8ccf184ad0	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55e4-40d2-c6bc-a153f2ef0d68	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55e4-40d2-6ab1-ad1acc8da346	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55e4-40d2-a9f1-eebffe2f376b	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55e4-40d2-481a-9ea0f4e3f7a7	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55e4-40d2-9b76-e5927fc5502c	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55e4-40d2-a0aa-eb5726238517	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55e4-40d2-e285-738899e201a7	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55e4-40d2-239a-586affa6891f	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2969 (class 0 OID 16633172)
-- Dependencies: 235
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 16633144)
-- Dependencies: 234
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 16633184)
-- Dependencies: 236
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 16632815)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55e4-40d3-0825-922dc4e12dd1	00090000-55e4-40d3-78d7-2881ab7d1d89	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e4-40d3-27e3-893667bf5df6	00090000-55e4-40d3-af78-512381ca8e67	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e4-40d3-7b22-b37d8a22c50d	00090000-55e4-40d3-b0d3-a1a0d20923b0	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e4-40d3-c09c-9cd5b6be8937	00090000-55e4-40d3-1b24-1f5597f26ec1	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e4-40d3-6fe0-b114ff1be8a9	00090000-55e4-40d3-12ad-055d8cb07085	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e4-40d3-1407-d5fe61ac66b7	00090000-55e4-40d3-9879-921bf227258f	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2926 (class 0 OID 16632647)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 16632910)
-- Dependencies: 220
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55e4-40d2-8020-a1c2f2e632a5	01	Drama	drama (SURS 01)
00140000-55e4-40d2-bc4c-70eb0af322e8	02	Opera	opera (SURS 02)
00140000-55e4-40d2-ea7d-9bc4cc9f7464	03	Balet	balet (SURS 03)
00140000-55e4-40d2-b520-e696fa84a205	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55e4-40d2-085d-f5f1ed21af87	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55e4-40d2-5d4a-9dae19d69dda	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55e4-40d2-b8c4-dc53bacfe4b1	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2945 (class 0 OID 16632805)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2448 (class 2606 OID 16632454)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 16632969)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 16632959)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 16632871)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 16633224)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 16632637)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 16632662)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 16633118)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 16632579)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 16633024)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 16632801)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 16632613)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 16632656)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 16632593)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 16632709)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 16633201)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 16633208)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2694 (class 2606 OID 16633232)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 16632736)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 16632551)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 16632463)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 16632487)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 16632443)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2439 (class 2606 OID 16632428)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 16632742)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 16632777)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 16632905)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 16632515)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 16632539)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 16632715)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 16632529)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 16632600)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 16632727)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 16633081)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 16633089)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 16633072)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 16633100)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 16632759)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 16632700)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 16632691)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 16632893)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 16632829)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 16632399)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 16632768)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 16632417)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2441 (class 2606 OID 16632437)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 16632786)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 16632722)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 16632671)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 16633142)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 16633130)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 16633124)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 16632842)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 16632496)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 16632682)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 16632882)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 16633112)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 16632564)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 16632412)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 16632938)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 16632622)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 16632750)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 16632854)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 16633182)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 16633166)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 16633190)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 16632820)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 16632651)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 16632918)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 16632813)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 1259 OID 16632644)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2591 (class 1259 OID 16632843)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2592 (class 1259 OID 16632844)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2593 (class 1259 OID 16632845)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2680 (class 1259 OID 16633203)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2681 (class 1259 OID 16633202)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2462 (class 1259 OID 16632517)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2554 (class 1259 OID 16632743)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2667 (class 1259 OID 16633170)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2668 (class 1259 OID 16633169)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2669 (class 1259 OID 16633171)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2670 (class 1259 OID 16633168)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2671 (class 1259 OID 16633167)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2548 (class 1259 OID 16632729)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2549 (class 1259 OID 16632728)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2499 (class 1259 OID 16632623)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2578 (class 1259 OID 16632802)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2579 (class 1259 OID 16632804)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2580 (class 1259 OID 16632803)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2487 (class 1259 OID 16632595)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2488 (class 1259 OID 16632594)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2650 (class 1259 OID 16633101)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2604 (class 1259 OID 16632907)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2605 (class 1259 OID 16632908)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2606 (class 1259 OID 16632909)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2677 (class 1259 OID 16633191)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2613 (class 1259 OID 16632943)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2614 (class 1259 OID 16632940)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2615 (class 1259 OID 16632944)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2616 (class 1259 OID 16632942)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2617 (class 1259 OID 16632941)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2477 (class 1259 OID 16632566)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2478 (class 1259 OID 16632565)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2453 (class 1259 OID 16632490)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2566 (class 1259 OID 16632769)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2517 (class 1259 OID 16632657)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2443 (class 1259 OID 16632444)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2444 (class 1259 OID 16632445)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2571 (class 1259 OID 16632789)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2572 (class 1259 OID 16632788)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2573 (class 1259 OID 16632787)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2491 (class 1259 OID 16632601)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2492 (class 1259 OID 16632603)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2493 (class 1259 OID 16632602)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2660 (class 1259 OID 16633132)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2528 (class 1259 OID 16632695)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2529 (class 1259 OID 16632693)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2530 (class 1259 OID 16632692)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2531 (class 1259 OID 16632694)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2434 (class 1259 OID 16632418)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2435 (class 1259 OID 16632419)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2557 (class 1259 OID 16632751)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2690 (class 1259 OID 16633225)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2691 (class 1259 OID 16633233)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2692 (class 1259 OID 16633234)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2543 (class 1259 OID 16632716)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2587 (class 1259 OID 16632830)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2588 (class 1259 OID 16632831)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2634 (class 1259 OID 16633029)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2635 (class 1259 OID 16633028)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2636 (class 1259 OID 16633025)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2637 (class 1259 OID 16633026)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2638 (class 1259 OID 16633027)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2466 (class 1259 OID 16632531)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2467 (class 1259 OID 16632530)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2468 (class 1259 OID 16632532)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2560 (class 1259 OID 16632763)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2561 (class 1259 OID 16632762)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2642 (class 1259 OID 16633082)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2643 (class 1259 OID 16633083)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2627 (class 1259 OID 16632973)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2628 (class 1259 OID 16632974)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2629 (class 1259 OID 16632971)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2630 (class 1259 OID 16632972)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2584 (class 1259 OID 16632821)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2534 (class 1259 OID 16632704)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2535 (class 1259 OID 16632703)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2536 (class 1259 OID 16632701)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2537 (class 1259 OID 16632702)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2623 (class 1259 OID 16632961)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2624 (class 1259 OID 16632960)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2639 (class 1259 OID 16633073)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2498 (class 1259 OID 16632614)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2657 (class 1259 OID 16633119)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2684 (class 1259 OID 16633209)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2685 (class 1259 OID 16633210)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2449 (class 1259 OID 16632465)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2450 (class 1259 OID 16632464)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2458 (class 1259 OID 16632497)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2459 (class 1259 OID 16632498)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2523 (class 1259 OID 16632685)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2524 (class 1259 OID 16632684)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2525 (class 1259 OID 16632683)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2505 (class 1259 OID 16632646)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2506 (class 1259 OID 16632642)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2507 (class 1259 OID 16632639)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2508 (class 1259 OID 16632640)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2509 (class 1259 OID 16632638)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2510 (class 1259 OID 16632643)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2511 (class 1259 OID 16632641)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2465 (class 1259 OID 16632516)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2483 (class 1259 OID 16632580)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2484 (class 1259 OID 16632582)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2485 (class 1259 OID 16632581)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2486 (class 1259 OID 16632583)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2542 (class 1259 OID 16632710)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2609 (class 1259 OID 16632906)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2618 (class 1259 OID 16632939)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2456 (class 1259 OID 16632488)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2457 (class 1259 OID 16632489)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2581 (class 1259 OID 16632814)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2666 (class 1259 OID 16633143)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 16632552)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2663 (class 1259 OID 16633131)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2564 (class 1259 OID 16632761)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2565 (class 1259 OID 16632760)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2631 (class 1259 OID 16632970)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2473 (class 1259 OID 16632540)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2610 (class 1259 OID 16632919)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2674 (class 1259 OID 16633183)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2648 (class 1259 OID 16633090)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 16633091)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2522 (class 1259 OID 16632672)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2442 (class 1259 OID 16632438)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2512 (class 1259 OID 16632645)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2722 (class 2606 OID 16633370)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2719 (class 2606 OID 16633355)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2720 (class 2606 OID 16633360)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2724 (class 2606 OID 16633380)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2718 (class 2606 OID 16633350)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2723 (class 2606 OID 16633375)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2721 (class 2606 OID 16633365)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2755 (class 2606 OID 16633535)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2756 (class 2606 OID 16633540)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2757 (class 2606 OID 16633545)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2791 (class 2606 OID 16633715)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2790 (class 2606 OID 16633710)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2705 (class 2606 OID 16633285)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2741 (class 2606 OID 16633465)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2787 (class 2606 OID 16633695)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2786 (class 2606 OID 16633690)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2788 (class 2606 OID 16633700)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2785 (class 2606 OID 16633685)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2784 (class 2606 OID 16633680)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2740 (class 2606 OID 16633460)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2739 (class 2606 OID 16633455)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2717 (class 2606 OID 16633345)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2749 (class 2606 OID 16633505)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2751 (class 2606 OID 16633515)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2750 (class 2606 OID 16633510)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2712 (class 2606 OID 16633320)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2711 (class 2606 OID 16633315)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2737 (class 2606 OID 16633445)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2781 (class 2606 OID 16633665)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2758 (class 2606 OID 16633550)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2759 (class 2606 OID 16633555)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2760 (class 2606 OID 16633560)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2789 (class 2606 OID 16633705)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2764 (class 2606 OID 16633580)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2761 (class 2606 OID 16633565)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2765 (class 2606 OID 16633585)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2763 (class 2606 OID 16633575)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2762 (class 2606 OID 16633570)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2710 (class 2606 OID 16633310)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2709 (class 2606 OID 16633305)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2702 (class 2606 OID 16633270)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2701 (class 2606 OID 16633265)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2745 (class 2606 OID 16633485)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2725 (class 2606 OID 16633385)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2697 (class 2606 OID 16633245)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2698 (class 2606 OID 16633250)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2748 (class 2606 OID 16633500)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2747 (class 2606 OID 16633495)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2746 (class 2606 OID 16633490)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2713 (class 2606 OID 16633325)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2715 (class 2606 OID 16633335)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2714 (class 2606 OID 16633330)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2783 (class 2606 OID 16633675)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2732 (class 2606 OID 16633420)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2730 (class 2606 OID 16633410)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2729 (class 2606 OID 16633405)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2731 (class 2606 OID 16633415)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2695 (class 2606 OID 16633235)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2696 (class 2606 OID 16633240)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2742 (class 2606 OID 16633470)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2794 (class 2606 OID 16633730)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2795 (class 2606 OID 16633735)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2796 (class 2606 OID 16633740)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2738 (class 2606 OID 16633450)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2753 (class 2606 OID 16633525)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2754 (class 2606 OID 16633530)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2776 (class 2606 OID 16633640)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2775 (class 2606 OID 16633635)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2772 (class 2606 OID 16633620)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2773 (class 2606 OID 16633625)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2774 (class 2606 OID 16633630)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2707 (class 2606 OID 16633295)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2706 (class 2606 OID 16633290)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2708 (class 2606 OID 16633300)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2744 (class 2606 OID 16633480)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2743 (class 2606 OID 16633475)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2778 (class 2606 OID 16633650)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2779 (class 2606 OID 16633655)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2770 (class 2606 OID 16633610)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2771 (class 2606 OID 16633615)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2768 (class 2606 OID 16633600)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2769 (class 2606 OID 16633605)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2752 (class 2606 OID 16633520)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2736 (class 2606 OID 16633440)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2735 (class 2606 OID 16633435)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2733 (class 2606 OID 16633425)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2734 (class 2606 OID 16633430)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2767 (class 2606 OID 16633595)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2766 (class 2606 OID 16633590)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2777 (class 2606 OID 16633645)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2716 (class 2606 OID 16633340)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2780 (class 2606 OID 16633660)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2782 (class 2606 OID 16633670)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2792 (class 2606 OID 16633720)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2793 (class 2606 OID 16633725)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2700 (class 2606 OID 16633260)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2699 (class 2606 OID 16633255)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2703 (class 2606 OID 16633275)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2704 (class 2606 OID 16633280)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2728 (class 2606 OID 16633400)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2727 (class 2606 OID 16633395)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2726 (class 2606 OID 16633390)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-31 13:56:05 CEST

--
-- PostgreSQL database dump complete
--

