--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-25 10:27:57 CEST

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
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 240
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 177 (class 1259 OID 15400363)
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
-- TOC entry 222 (class 1259 OID 15400866)
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
-- TOC entry 221 (class 1259 OID 15400849)
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
-- TOC entry 215 (class 1259 OID 15400761)
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
-- TOC entry 238 (class 1259 OID 15401115)
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
-- TOC entry 191 (class 1259 OID 15400542)
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
-- TOC entry 194 (class 1259 OID 15400576)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 15401017)
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
-- TOC entry 186 (class 1259 OID 15400485)
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
-- TOC entry 223 (class 1259 OID 15400879)
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
-- TOC entry 210 (class 1259 OID 15400706)
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
-- TOC entry 189 (class 1259 OID 15400522)
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
-- TOC entry 193 (class 1259 OID 15400570)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 15400502)
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
-- TOC entry 199 (class 1259 OID 15400623)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 236 (class 1259 OID 15401096)
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
-- TOC entry 237 (class 1259 OID 15401108)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 15401130)
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
-- TOC entry 203 (class 1259 OID 15400648)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 15400459)
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
-- TOC entry 178 (class 1259 OID 15400372)
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
-- TOC entry 179 (class 1259 OID 15400383)
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
-- TOC entry 174 (class 1259 OID 15400337)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 15400356)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 15400655)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 15400686)
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
-- TOC entry 218 (class 1259 OID 15400800)
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
-- TOC entry 181 (class 1259 OID 15400416)
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
-- TOC entry 183 (class 1259 OID 15400451)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 15400629)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 15400436)
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
-- TOC entry 188 (class 1259 OID 15400514)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 15400641)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 15400978)
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
-- TOC entry 226 (class 1259 OID 15400988)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 224 (class 1259 OID 15400934)
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
-- TOC entry 227 (class 1259 OID 15400996)
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
-- TOC entry 206 (class 1259 OID 15400670)
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
-- TOC entry 198 (class 1259 OID 15400614)
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
-- TOC entry 197 (class 1259 OID 15400604)
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
-- TOC entry 217 (class 1259 OID 15400789)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 15400738)
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
-- TOC entry 171 (class 1259 OID 15400308)
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
-- TOC entry 170 (class 1259 OID 15400306)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 207 (class 1259 OID 15400680)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 15400346)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 15400330)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 15400694)
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
-- TOC entry 201 (class 1259 OID 15400635)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 15400581)
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
-- TOC entry 232 (class 1259 OID 15401037)
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
-- TOC entry 231 (class 1259 OID 15401029)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 15401024)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 15400748)
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
-- TOC entry 180 (class 1259 OID 15400408)
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
-- TOC entry 196 (class 1259 OID 15400591)
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
-- TOC entry 216 (class 1259 OID 15400778)
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
-- TOC entry 228 (class 1259 OID 15401006)
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
-- TOC entry 185 (class 1259 OID 15400471)
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
-- TOC entry 172 (class 1259 OID 15400317)
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
-- TOC entry 220 (class 1259 OID 15400826)
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
-- TOC entry 190 (class 1259 OID 15400533)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 15400662)
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
-- TOC entry 234 (class 1259 OID 15401076)
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
-- TOC entry 233 (class 1259 OID 15401048)
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
-- TOC entry 235 (class 1259 OID 15401088)
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
-- TOC entry 212 (class 1259 OID 15400731)
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
-- TOC entry 192 (class 1259 OID 15400565)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 15400816)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 15400721)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2170 (class 2604 OID 15400311)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2896 (class 0 OID 15400363)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2941 (class 0 OID 15400866)
-- Dependencies: 222
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55dc-270b-d7b5-939cb7b3ff89	000d0000-55dc-270b-7efe-5b81e21f9748	\N	00090000-55dc-270b-c7fc-0406923fa6bc	000b0000-55dc-270b-5609-980c234f9e51	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55dc-270b-eb99-47c273946a4e	000d0000-55dc-270b-e941-31f8fe0b64cf	00100000-55dc-270b-bcc4-9eb061ea0dbd	00090000-55dc-270b-e775-a8950efa184e	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55dc-270b-0008-9fbfb78eecce	000d0000-55dc-270b-3022-1c44d65cb9fd	00100000-55dc-270b-3141-c9b93929b1d4	00090000-55dc-270b-d795-90b2ee5714a5	\N	0003	t	\N	2015-08-25	\N	2	\N	\N	f	f
000c0000-55dc-270b-167e-04ff2111c0f1	000d0000-55dc-270b-7389-cb3fc4aac0de	\N	00090000-55dc-270b-3ebd-d2d38a428e81	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55dc-270b-eb8c-8b8e79446b76	000d0000-55dc-270b-0efb-8ff168889390	\N	00090000-55dc-270b-bdc1-a17071f09f3f	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55dc-270b-fa02-027a3a0b998b	000d0000-55dc-270b-bf38-1cbdb6b0b31c	\N	00090000-55dc-270b-096b-b0913025bbf7	000b0000-55dc-270b-2ed0-843ae30bfa54	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55dc-270b-93b0-821ad4fa8967	000d0000-55dc-270b-8813-45a10bc4ea55	00100000-55dc-270b-829c-13143810b483	00090000-55dc-270b-c4fd-94ddfaeda288	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55dc-270b-a8e5-344312b054d3	000d0000-55dc-270b-d353-45a37f743eb3	\N	00090000-55dc-270b-a449-e5edd7ee5b93	000b0000-55dc-270b-a775-4e62c594f065	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55dc-270b-4636-737c2a40f44f	000d0000-55dc-270b-8813-45a10bc4ea55	00100000-55dc-270b-ef42-2bd40ad32cdf	00090000-55dc-270b-ef0b-f6109df378f8	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55dc-270b-19c0-a1fd59667397	000d0000-55dc-270b-8813-45a10bc4ea55	00100000-55dc-270b-4270-89d0d454c4bc	00090000-55dc-270b-924a-031d3a718a17	\N	0010	t	\N	2015-08-25	\N	16	\N	\N	f	t
000c0000-55dc-270b-56a0-e0c211705a82	000d0000-55dc-270b-8813-45a10bc4ea55	00100000-55dc-270b-1f75-d2d774c51fe4	00090000-55dc-270b-4f4b-e99b69b6ff44	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2940 (class 0 OID 15400849)
-- Dependencies: 221
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 15400761)
-- Dependencies: 215
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55dc-270b-63b6-e41805ecbca6	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55dc-270b-c37f-2e5603d0245f	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55dc-270b-7848-d2b82396dac3	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2957 (class 0 OID 15401115)
-- Dependencies: 238
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2910 (class 0 OID 15400542)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55dc-270b-6f6d-c6d425c76eb5	\N	\N	00200000-55dc-270b-b5b7-17bfa9f00c01	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55dc-270b-6bd1-4afa229ac428	\N	\N	00200000-55dc-270b-3c93-30b9a47ce50a	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55dc-270b-d5e6-7f493c14118f	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55dc-270b-9e0e-2dd7bc9e6721	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55dc-270b-93cb-ee43e351d111	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2913 (class 0 OID 15400576)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 15401017)
-- Dependencies: 229
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 15400485)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55dc-2709-f93d-3b619f58cfb2	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55dc-2709-518a-77aa038138c4	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55dc-2709-7fac-55ee30ba79e3	AL	ALB	008	Albania 	Albanija	\N
00040000-55dc-2709-d696-6b28d0f10c5b	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55dc-2709-86ea-066e0f6b866b	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55dc-2709-c3f5-ad127e15f2e7	AD	AND	020	Andorra 	Andora	\N
00040000-55dc-2709-68b4-e1763a1967f2	AO	AGO	024	Angola 	Angola	\N
00040000-55dc-2709-0f22-171c5e950617	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55dc-2709-b40d-125d6604d5fd	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55dc-2709-0312-389fe4fdf6d4	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55dc-2709-15c4-03e5b2b35557	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55dc-2709-1a97-414997e55802	AM	ARM	051	Armenia 	Armenija	\N
00040000-55dc-2709-1adb-80a81b3380e8	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55dc-2709-551a-cb04a4f207ad	AU	AUS	036	Australia 	Avstralija	\N
00040000-55dc-2709-4f76-8c4b35e7d800	AT	AUT	040	Austria 	Avstrija	\N
00040000-55dc-2709-492a-922d0034b189	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55dc-2709-49f8-57cb50e19dbc	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55dc-2709-3366-ae18d54744ad	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55dc-2709-26fe-1c03979b67ac	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55dc-2709-faab-c9e9358a6e5f	BB	BRB	052	Barbados 	Barbados	\N
00040000-55dc-2709-1ebd-8014ff0443a4	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55dc-2709-00ed-0b0488faa5e4	BE	BEL	056	Belgium 	Belgija	\N
00040000-55dc-2709-4a48-f57ba1d29ec0	BZ	BLZ	084	Belize 	Belize	\N
00040000-55dc-2709-0788-db0bbe19aad6	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55dc-2709-284e-0d9dc8a4bca9	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55dc-2709-4e8a-a84edd9395ba	BT	BTN	064	Bhutan 	Butan	\N
00040000-55dc-2709-be22-a58c5f81a395	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55dc-2709-8cf0-c6517106e92e	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55dc-2709-8486-3f2ca8cf3f03	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55dc-2709-1ed6-02fb7cfe748d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55dc-2709-33e5-814bf5fdd905	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55dc-2709-0980-3e458ee9872a	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55dc-2709-85f2-51f499059334	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55dc-2709-ba20-8a8616acd2b0	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55dc-2709-be71-bfc40529cfb0	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55dc-2709-e65c-87a6f3d263b7	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55dc-2709-600d-e30b99349212	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55dc-2709-3767-bfee1e32ed59	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55dc-2709-e8b3-dbbdbac99dfc	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55dc-2709-36fe-dc48c08821c7	CA	CAN	124	Canada 	Kanada	\N
00040000-55dc-2709-3487-1a1cc42b3fa7	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55dc-2709-8279-ef89705a2cb9	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55dc-2709-9680-b03ceb595af7	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55dc-2709-7f56-002cc7956511	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55dc-2709-e248-fcf65dfa53b4	CL	CHL	152	Chile 	Čile	\N
00040000-55dc-2709-a875-c9548343f5b2	CN	CHN	156	China 	Kitajska	\N
00040000-55dc-2709-d762-77f6782b1616	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55dc-2709-4b50-4c6db47e09f7	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55dc-2709-0009-3def96b0acff	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55dc-2709-dcf1-192b691cf2da	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55dc-2709-0655-45b382222fb5	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55dc-2709-639e-a70395e73878	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55dc-2709-8216-7003ec873346	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55dc-2709-f1dd-1c572442f9de	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55dc-2709-9a2c-103ee19258eb	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55dc-2709-2b42-954f28fd3667	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55dc-2709-c97f-8ad9e773da8f	CU	CUB	192	Cuba 	Kuba	\N
00040000-55dc-2709-2515-be6c6c79a775	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55dc-2709-9e58-1c3ef4f527ca	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55dc-2709-be3d-ed1dccd5e2bc	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55dc-2709-670e-a896afdd1ab2	DK	DNK	208	Denmark 	Danska	\N
00040000-55dc-2709-bc76-5dc6264fd484	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55dc-2709-27d5-8ceebe02828a	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55dc-2709-6104-00535407937c	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55dc-2709-bcf8-948e0230289a	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55dc-2709-c8e8-c09ca39e965a	EG	EGY	818	Egypt 	Egipt	\N
00040000-55dc-2709-84a9-763e594174d0	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55dc-2709-be16-711445c0d1a6	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55dc-2709-e56b-73218042234d	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55dc-2709-ffa3-fb591362ba6d	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55dc-2709-4705-31d0fef0e62b	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55dc-2709-b2ab-b032adc644cd	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55dc-2709-5d71-2d87561e6565	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55dc-2709-e353-7790547df37b	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55dc-2709-72f8-541d631220a9	FI	FIN	246	Finland 	Finska	\N
00040000-55dc-2709-2aa7-13373b8b314f	FR	FRA	250	France 	Francija	\N
00040000-55dc-2709-bcd8-3c58e5ad5d27	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55dc-2709-b3f6-c16afbf35b6d	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55dc-2709-3315-50e6f070d87d	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55dc-2709-8861-6090d66d5d18	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55dc-2709-bc58-eec5d8f79ac7	GA	GAB	266	Gabon 	Gabon	\N
00040000-55dc-2709-dbaa-0a7a750d5ec6	GM	GMB	270	Gambia 	Gambija	\N
00040000-55dc-2709-cd7e-3898261582c4	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55dc-2709-d769-267c4a822f82	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55dc-2709-e94b-bbb116f546da	GH	GHA	288	Ghana 	Gana	\N
00040000-55dc-2709-f36e-a46dbca625fe	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55dc-2709-4e54-1dff18e070b1	GR	GRC	300	Greece 	Grčija	\N
00040000-55dc-2709-b33f-8359341c7151	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55dc-2709-bde8-3d0b15d470d1	GD	GRD	308	Grenada 	Grenada	\N
00040000-55dc-2709-84a1-ae0322d4425b	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55dc-2709-6fb5-ddd32d1b4dd5	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55dc-2709-1fcf-e3957607cbcb	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55dc-2709-ddd6-23a1c42a7a03	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55dc-2709-9225-94ce0bf92287	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55dc-2709-2a01-1870bc7abcb9	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55dc-2709-85a9-786551baacbe	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55dc-2709-901a-a00aa8c2cece	HT	HTI	332	Haiti 	Haiti	\N
00040000-55dc-2709-60f5-47c23427e9aa	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55dc-2709-261b-ba60c676b0de	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55dc-2709-d1ff-4e993d828b9c	HN	HND	340	Honduras 	Honduras	\N
00040000-55dc-2709-43e0-7a45272223f4	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55dc-2709-1a39-49fe988c0e16	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55dc-2709-8eb2-7199d02a1c0a	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55dc-2709-c56b-7ad48808568c	IN	IND	356	India 	Indija	\N
00040000-55dc-2709-5177-695849efbd6c	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55dc-2709-d6ed-e46404d4623f	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55dc-2709-4014-3d94b5ea523d	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55dc-2709-7194-f6ff067f0d70	IE	IRL	372	Ireland 	Irska	\N
00040000-55dc-2709-8912-cff3f8e84048	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55dc-2709-338e-33e2e071f805	IL	ISR	376	Israel 	Izrael	\N
00040000-55dc-2709-2d9b-cb59ef4794f2	IT	ITA	380	Italy 	Italija	\N
00040000-55dc-2709-4961-73352ae4b7c7	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55dc-2709-21c6-48e86caf762e	JP	JPN	392	Japan 	Japonska	\N
00040000-55dc-2709-bc84-9a881f2537cd	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55dc-2709-baa8-863266e90c07	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55dc-2709-b536-a40cff8f0985	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55dc-2709-cf6a-b2a2c2ce7ef5	KE	KEN	404	Kenya 	Kenija	\N
00040000-55dc-2709-92c9-4aeb6cef74e3	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55dc-2709-7572-370eec4e2ba0	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55dc-2709-4cc2-98cc4a7b273f	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55dc-2709-ac28-433e59aa19d0	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55dc-2709-2853-09a09375965e	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55dc-2709-e75b-a9e3ee6c5b8a	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55dc-2709-af2e-3293f6616ba6	LV	LVA	428	Latvia 	Latvija	\N
00040000-55dc-2709-d8aa-82e8577d8706	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55dc-2709-a462-f2cccdfedaef	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55dc-2709-8235-a6a2842a59b5	LR	LBR	430	Liberia 	Liberija	\N
00040000-55dc-2709-2efe-bf0714bd4e54	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55dc-2709-945b-93f5e8e5957b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55dc-2709-4af8-038aa588cc3c	LT	LTU	440	Lithuania 	Litva	\N
00040000-55dc-2709-b33f-056c25302fd7	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55dc-2709-207e-887637ac72cf	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55dc-2709-81b5-1505317b17a2	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55dc-2709-0d6c-486d5256aa38	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55dc-2709-e896-c2f68cae804a	MW	MWI	454	Malawi 	Malavi	\N
00040000-55dc-2709-bc5b-949bfc02e33e	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55dc-2709-a129-36e34db8c85b	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55dc-2709-e0b7-d8493e4ea42e	ML	MLI	466	Mali 	Mali	\N
00040000-55dc-2709-ab8d-fc1130291840	MT	MLT	470	Malta 	Malta	\N
00040000-55dc-2709-855b-e40f3a31a838	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55dc-2709-0cbb-8f075b1f7261	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55dc-2709-a7f3-05b9ec794b10	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55dc-2709-64d7-a7dd1e9ca438	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55dc-2709-e459-2073bd93dd95	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55dc-2709-1246-2ad899480bf7	MX	MEX	484	Mexico 	Mehika	\N
00040000-55dc-2709-b5b4-1ab5cff4ed7e	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55dc-2709-bb35-5f4bf10abc46	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55dc-2709-7d00-2c0be0d1fe83	MC	MCO	492	Monaco 	Monako	\N
00040000-55dc-2709-87fe-caccd4f135e5	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55dc-2709-567b-7cf8d5e060e1	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55dc-2709-11c6-037d0b83d1ff	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55dc-2709-701c-9ac411662e85	MA	MAR	504	Morocco 	Maroko	\N
00040000-55dc-2709-bf36-5240b0c76ca8	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55dc-2709-66fe-c662f4549cbb	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55dc-2709-08ce-2f65278f3985	NA	NAM	516	Namibia 	Namibija	\N
00040000-55dc-2709-16bc-4ac0e181e33c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55dc-2709-0798-f9f13017b40e	NP	NPL	524	Nepal 	Nepal	\N
00040000-55dc-2709-642c-4cce6a1ed47b	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55dc-2709-1075-9d997ea52a61	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55dc-2709-8528-3cbd4085063b	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55dc-2709-1a14-0ce9888786de	NE	NER	562	Niger 	Niger 	\N
00040000-55dc-2709-ba87-31dd2361638a	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55dc-2709-caee-3e03052a137d	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55dc-2709-c243-36df897db096	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55dc-2709-3296-48c76e04e554	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55dc-2709-14b5-fd52e5e69c8c	NO	NOR	578	Norway 	Norveška	\N
00040000-55dc-2709-39a4-465ebb2f04fb	OM	OMN	512	Oman 	Oman	\N
00040000-55dc-2709-071d-3ef7571df1d8	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55dc-2709-1b2d-6874059fa2f6	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55dc-2709-1ede-57f014b86a69	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55dc-2709-be9a-d2cbb0e1a566	PA	PAN	591	Panama 	Panama	\N
00040000-55dc-2709-1347-12ac908466c9	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55dc-2709-46c7-ed61c92cb39f	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55dc-2709-f72b-e24dabda9044	PE	PER	604	Peru 	Peru	\N
00040000-55dc-2709-356f-0d081808ec0f	PH	PHL	608	Philippines 	Filipini	\N
00040000-55dc-2709-071f-bfd179f4730c	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55dc-2709-eb15-bf4733f9a01c	PL	POL	616	Poland 	Poljska	\N
00040000-55dc-2709-1069-1706e23d42d1	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55dc-2709-3eb5-b1fefd7d3107	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55dc-2709-086c-f48304a79e9d	QA	QAT	634	Qatar 	Katar	\N
00040000-55dc-2709-5686-d506d6c99781	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55dc-2709-dc94-7204a7f52d19	RO	ROU	642	Romania 	Romunija	\N
00040000-55dc-2709-17c3-ba71384ee3d0	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55dc-2709-4f16-9a17e050cbb5	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55dc-2709-b31a-4242c4efd11c	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55dc-2709-a922-5291dfc83022	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55dc-2709-9aef-3c8ead54dd55	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55dc-2709-fb50-36309e0ca4c7	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55dc-2709-b5c1-17ee5743ef8b	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55dc-2709-d173-8e340cc7165b	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55dc-2709-f359-174e96f5216e	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55dc-2709-c0ed-b298fd15535e	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55dc-2709-e176-c6aeb9ebcfca	SM	SMR	674	San Marino 	San Marino	\N
00040000-55dc-2709-dd30-ded2584eb250	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55dc-2709-58ca-2d2d001b5351	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55dc-2709-87dd-d2f951a00ab1	SN	SEN	686	Senegal 	Senegal	\N
00040000-55dc-2709-1f42-3074142723b1	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55dc-2709-b7c1-96bcaaaafee1	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55dc-2709-7ae6-5df59620049f	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55dc-2709-e3d9-e7cd3a0ad7ca	SG	SGP	702	Singapore 	Singapur	\N
00040000-55dc-2709-653d-d3456805509a	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55dc-2709-e3bc-a35db5f72bcc	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55dc-2709-024c-f860a33c4465	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55dc-2709-e1d1-02d7d42af662	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55dc-2709-b356-f4f7c18d9fae	SO	SOM	706	Somalia 	Somalija	\N
00040000-55dc-2709-5cf4-2035718a90f5	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55dc-2709-43f7-ef1d93f73a82	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55dc-2709-c264-4ec994cc48ae	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55dc-2709-b64f-db10c6f1955c	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55dc-2709-12b0-3842c3eb04cd	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55dc-2709-9b26-765cbfbade24	SD	SDN	729	Sudan 	Sudan	\N
00040000-55dc-2709-de2a-b2f4bd7dd118	SR	SUR	740	Suriname 	Surinam	\N
00040000-55dc-2709-1bfb-45b1019e5101	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55dc-2709-a465-5c71daebf38c	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55dc-2709-e7ad-e7235da06ab8	SE	SWE	752	Sweden 	Švedska	\N
00040000-55dc-2709-145a-5fdc8f61a0ea	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55dc-2709-e5cd-c858503fb06e	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55dc-2709-6bbf-f14d96dae194	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55dc-2709-6f88-54c79cfb7c52	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55dc-2709-2901-74b53d4abe50	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55dc-2709-35a0-3a643f0445a5	TH	THA	764	Thailand 	Tajska	\N
00040000-55dc-2709-7732-c09ad71708f8	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55dc-2709-1959-b20b3fbaf14d	TG	TGO	768	Togo 	Togo	\N
00040000-55dc-2709-b1db-0ff96a0d466c	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55dc-2709-ee71-3374b458b83e	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55dc-2709-71c2-3635985a4481	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55dc-2709-d022-f346fac536cf	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55dc-2709-dc76-9cf6f5cb5fa1	TR	TUR	792	Turkey 	Turčija	\N
00040000-55dc-2709-bf0d-886016e3e394	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55dc-2709-368a-8fabe0483c7b	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55dc-2709-5700-08a6e1a1117c	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55dc-2709-37b1-dd4f5557d2ce	UG	UGA	800	Uganda 	Uganda	\N
00040000-55dc-2709-0d80-116608276ea7	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55dc-2709-3bd7-b4b59fa4b08b	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55dc-2709-7b40-f12052bb6986	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55dc-2709-4e2c-55cc641a337a	US	USA	840	United States 	Združene države Amerike	\N
00040000-55dc-2709-f929-7ad97c9ab5c7	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55dc-2709-a23a-8e31efe1f1f7	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55dc-2709-7362-5d811682f432	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55dc-2709-be0a-34bd61a329d6	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55dc-2709-aa75-c9678c71ffef	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55dc-2709-d435-2272b3a22a59	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55dc-2709-c1ca-7976537da1bf	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55dc-2709-e763-d803e6bddc21	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55dc-2709-5a8d-fdc19fd33d6f	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55dc-2709-0172-4d5798468be1	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55dc-2709-bb87-ea6220c7ae7f	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55dc-2709-daee-2f8923084cef	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55dc-2709-d0ff-c83d390a19e7	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2942 (class 0 OID 15400879)
-- Dependencies: 223
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55dc-270b-60d4-5bbfd979bd9d	000e0000-55dc-270b-7cf5-db3ee38b969f	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55dc-2709-da99-d475828af165	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55dc-270b-09be-936ee35b0d76	000e0000-55dc-270b-a080-6f4fd1aa19cc	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55dc-2709-0ebd-533a400a665c	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55dc-270b-23bf-e7321dfe1db4	000e0000-55dc-270b-dfd6-8de5433fe849	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55dc-2709-da99-d475828af165	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55dc-270b-d5be-9b1922346556	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55dc-270b-4971-999111e838c7	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2929 (class 0 OID 15400706)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55dc-270b-8813-45a10bc4ea55	000e0000-55dc-270b-a080-6f4fd1aa19cc	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55dc-2709-66bf-b238318c4a0a
000d0000-55dc-270b-7efe-5b81e21f9748	000e0000-55dc-270b-a080-6f4fd1aa19cc	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55dc-2709-66bf-b238318c4a0a
000d0000-55dc-270b-e941-31f8fe0b64cf	000e0000-55dc-270b-a080-6f4fd1aa19cc	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55dc-2709-efdf-59bc70d99398
000d0000-55dc-270b-3022-1c44d65cb9fd	000e0000-55dc-270b-a080-6f4fd1aa19cc	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55dc-2709-1963-ad83422ec901
000d0000-55dc-270b-7389-cb3fc4aac0de	000e0000-55dc-270b-a080-6f4fd1aa19cc	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55dc-2709-7640-8bc1aed6292f
000d0000-55dc-270b-0efb-8ff168889390	000e0000-55dc-270b-a080-6f4fd1aa19cc	\N	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55dc-2709-7640-8bc1aed6292f
000d0000-55dc-270b-bf38-1cbdb6b0b31c	000e0000-55dc-270b-a080-6f4fd1aa19cc	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55dc-2709-66bf-b238318c4a0a
000d0000-55dc-270b-d353-45a37f743eb3	000e0000-55dc-270b-a080-6f4fd1aa19cc	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55dc-2709-9f51-e5b61c9848a7
\.


--
-- TOC entry 2908 (class 0 OID 15400522)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2912 (class 0 OID 15400570)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 15400502)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55dc-270b-08d1-e3c35031bd6d	00080000-55dc-270b-b91e-efafe432b9d9	00090000-55dc-270b-924a-031d3a718a17	AK		
\.


--
-- TOC entry 2918 (class 0 OID 15400623)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2955 (class 0 OID 15401096)
-- Dependencies: 236
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2956 (class 0 OID 15401108)
-- Dependencies: 237
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 15401130)
-- Dependencies: 239
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2922 (class 0 OID 15400648)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 15400459)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55dc-270a-74fc-7e8cebe7236e	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55dc-270a-6432-acc2404a9acc	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55dc-270a-f7f5-928a4d2d8861	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55dc-270a-ba1a-f145e0234d13	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55dc-270a-d7fe-813191560ce7	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55dc-270a-e268-0be2d50ead26	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55dc-270a-5c1b-562f448973bd	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55dc-270a-e643-d795b6124404	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55dc-270a-bba3-cefb5f7d08e9	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55dc-270a-b133-a911e378402e	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55dc-270a-dbd3-62d3d1c2ed8a	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55dc-270a-e7bf-77138b589a66	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55dc-270a-e751-0cf5010c0288	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55dc-270a-d916-cc3e65880e0d	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55dc-270b-3f52-1e22e04748a6	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55dc-270b-5f4f-25c9736e7e45	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55dc-270b-5ef0-ddb1e4838e4a	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55dc-270b-0e42-45d8564bba3d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55dc-270b-2747-f91988ed5566	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55dc-270c-1e24-42f9edd1e7b1	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2897 (class 0 OID 15400372)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55dc-270b-b23d-e7437758688b	00000000-55dc-270b-3f52-1e22e04748a6	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55dc-270b-ecb0-b4e153833f8e	00000000-55dc-270b-3f52-1e22e04748a6	00010000-55dc-270a-f94b-e340ed35b154	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55dc-270b-d139-73f85ec6323a	00000000-55dc-270b-5f4f-25c9736e7e45	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2898 (class 0 OID 15400383)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55dc-270b-c7fc-0406923fa6bc	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55dc-270b-3ebd-d2d38a428e81	00010000-55dc-270b-982d-1c7665276892	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55dc-270b-d795-90b2ee5714a5	00010000-55dc-270b-1c26-ea5d710acfe6	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55dc-270b-ef0b-f6109df378f8	00010000-55dc-270b-2751-01ed8773eecf	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55dc-270b-1d72-c14689dc834f	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55dc-270b-096b-b0913025bbf7	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55dc-270b-4f4b-e99b69b6ff44	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55dc-270b-c4fd-94ddfaeda288	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55dc-270b-924a-031d3a718a17	00010000-55dc-270b-7792-acb7d0309f1a	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55dc-270b-e775-a8950efa184e	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55dc-270b-c64e-b409dc454090	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55dc-270b-bdc1-a17071f09f3f	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55dc-270b-a449-e5edd7ee5b93	00010000-55dc-270b-d2a0-246ad787d3e4	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2893 (class 0 OID 15400337)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55dc-2709-8da7-0c1fa4383846	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55dc-2709-88cf-d476ab2152db	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55dc-2709-4113-f0b21addb265	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55dc-2709-8eeb-be418c8f3026	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55dc-2709-ad77-bdfbc06a90d3	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55dc-2709-acdb-80dcae60a3c6	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55dc-2709-bcc3-4debe68e29da	Abonma-read	Abonma - branje	f
00030000-55dc-2709-c1a4-0ae667eb2310	Abonma-write	Abonma - spreminjanje	f
00030000-55dc-2709-f161-d99bc02f8889	Alternacija-read	Alternacija - branje	f
00030000-55dc-2709-6c8f-3cf383e766fa	Alternacija-write	Alternacija - spreminjanje	f
00030000-55dc-2709-b649-8a04108f3b19	Arhivalija-read	Arhivalija - branje	f
00030000-55dc-2709-5366-1c92d882b956	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55dc-2709-4874-d4b696123aca	Besedilo-read	Besedilo - branje	f
00030000-55dc-2709-1806-af2738fe0ead	Besedilo-write	Besedilo - spreminjanje	f
00030000-55dc-2709-3c49-f6231c6e5791	DogodekIzven-read	DogodekIzven - branje	f
00030000-55dc-2709-a852-944f5d5432b1	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55dc-2709-8230-bf5e26b110bd	Dogodek-read	Dogodek - branje	f
00030000-55dc-2709-5984-43f031979e44	Dogodek-write	Dogodek - spreminjanje	f
00030000-55dc-2709-4282-70e4f73ef35e	DrugiVir-read	DrugiVir - branje	f
00030000-55dc-2709-974d-fbb58c78bf75	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55dc-2709-c169-6aa9d9d9cd9c	Drzava-read	Drzava - branje	f
00030000-55dc-2709-9247-35b8cfcc810b	Drzava-write	Drzava - spreminjanje	f
00030000-55dc-2709-0a28-cc40fc1b87ed	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55dc-2709-9680-b350b6cf4566	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55dc-2709-fd37-7897ef73624e	Funkcija-read	Funkcija - branje	f
00030000-55dc-2709-199b-e33db70dcd65	Funkcija-write	Funkcija - spreminjanje	f
00030000-55dc-2709-f5a0-709bc4c5f8ef	Gostovanje-read	Gostovanje - branje	f
00030000-55dc-2709-5735-2d548d0f9c9e	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55dc-2709-efa6-4eebf912f057	Gostujoca-read	Gostujoca - branje	f
00030000-55dc-2709-cbeb-b9d26a2b2337	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55dc-2709-af99-b75f086fb139	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55dc-2709-9e02-3e2c83d7ad92	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55dc-2709-2b69-87326c10570a	Kupec-read	Kupec - branje	f
00030000-55dc-2709-4786-5942eeaabe16	Kupec-write	Kupec - spreminjanje	f
00030000-55dc-2709-cab7-b4d20004d437	NacinPlacina-read	NacinPlacina - branje	f
00030000-55dc-2709-ef92-d5f2a3bd30ef	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55dc-2709-eb22-2a6ed1aa55aa	Option-read	Option - branje	f
00030000-55dc-2709-e0d8-6e84671e8c35	Option-write	Option - spreminjanje	f
00030000-55dc-2709-bf64-d19012d82453	OptionValue-read	OptionValue - branje	f
00030000-55dc-2709-66e3-326dc88df7e7	OptionValue-write	OptionValue - spreminjanje	f
00030000-55dc-2709-4c6f-f09c958e5a7b	Oseba-read	Oseba - branje	f
00030000-55dc-2709-d50b-4170270440a0	Oseba-write	Oseba - spreminjanje	f
00030000-55dc-2709-caa8-47a7ba741fc7	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55dc-2709-35d3-e9bebc80d92d	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55dc-2709-c66e-b36aaf429cef	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55dc-2709-3759-7c9281214852	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55dc-270a-aaf1-6fa952b88502	Pogodba-read	Pogodba - branje	f
00030000-55dc-270a-0582-959a5525852c	Pogodba-write	Pogodba - spreminjanje	f
00030000-55dc-270a-7de0-bdda1984b5d4	Popa-read	Popa - branje	f
00030000-55dc-270a-e5c4-46ae75fb6ac8	Popa-write	Popa - spreminjanje	f
00030000-55dc-270a-1d26-1c3fb66d8233	Posta-read	Posta - branje	f
00030000-55dc-270a-b4a7-dbb64401c44b	Posta-write	Posta - spreminjanje	f
00030000-55dc-270a-15e3-9c153582554b	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55dc-270a-b23e-69e2488c675f	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55dc-270a-414f-616b4108c91f	PostniNaslov-read	PostniNaslov - branje	f
00030000-55dc-270a-8897-4ee8ae317deb	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55dc-270a-918b-3fe18380bf0c	Predstava-read	Predstava - branje	f
00030000-55dc-270a-c962-1ef05d94047a	Predstava-write	Predstava - spreminjanje	f
00030000-55dc-270a-e0d3-3dd6b9aa5efb	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55dc-270a-f400-0ffa9200d291	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55dc-270a-5857-a25994f8663a	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55dc-270a-16d0-1b4da750f19b	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55dc-270a-496b-8808d4065d4e	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55dc-270a-3644-ac08898f0531	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55dc-270a-46d2-ff41ddb7f6ab	ProgramDela-read	ProgramDela - branje	f
00030000-55dc-270a-21e7-bf110c85758f	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55dc-270a-a829-e132dbf981d1	ProgramFestival-read	ProgramFestival - branje	f
00030000-55dc-270a-a6dd-183fedeef1c9	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55dc-270a-b353-81dc90e7beb0	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55dc-270a-a86e-39be0bd8435e	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55dc-270a-8e1f-c01c2a798f56	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55dc-270a-39b7-35df0cba4eb3	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55dc-270a-a6bb-2bfd5cd214a0	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55dc-270a-8008-696746b8a923	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55dc-270a-7e7d-14c26531ac2d	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55dc-270a-499d-9d652cc2a110	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55dc-270a-e59c-5632c85a792c	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55dc-270a-0460-5a905f152d3b	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55dc-270a-c615-588f4e982a34	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55dc-270a-e279-6a3db52629e8	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55dc-270a-903f-468c34518db6	ProgramRazno-read	ProgramRazno - branje	f
00030000-55dc-270a-51d2-2886a1f68662	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55dc-270a-e00b-55497610ecb0	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55dc-270a-3079-8068e356ae21	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55dc-270a-b234-6940902ee935	Prostor-read	Prostor - branje	f
00030000-55dc-270a-53e5-81ee059d6e24	Prostor-write	Prostor - spreminjanje	f
00030000-55dc-270a-4528-f6b08b82e3c4	Racun-read	Racun - branje	f
00030000-55dc-270a-5ffb-5880c5345a49	Racun-write	Racun - spreminjanje	f
00030000-55dc-270a-51d6-42a8f4d883ee	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55dc-270a-fd47-7c81edf9e552	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55dc-270a-ca2e-06d768173ce9	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55dc-270a-3833-72bf04ce13cd	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55dc-270a-8923-860df409994e	Rekvizit-read	Rekvizit - branje	f
00030000-55dc-270a-3b03-e791489a3b30	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55dc-270a-dfd7-80c9dad0e94d	Revizija-read	Revizija - branje	f
00030000-55dc-270a-36a3-81f68ad80672	Revizija-write	Revizija - spreminjanje	f
00030000-55dc-270a-f377-ad3067434def	Rezervacija-read	Rezervacija - branje	f
00030000-55dc-270a-625d-d0bdf8254ec9	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55dc-270a-f3e1-823c97a6ef24	SedezniRed-read	SedezniRed - branje	f
00030000-55dc-270a-617e-2f2e4427fde1	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55dc-270a-4821-518ae4c8c1c3	Sedez-read	Sedez - branje	f
00030000-55dc-270a-bc8d-abfb489ef429	Sedez-write	Sedez - spreminjanje	f
00030000-55dc-270a-c45b-6b9c607865d8	Sezona-read	Sezona - branje	f
00030000-55dc-270a-7efe-e440c334606a	Sezona-write	Sezona - spreminjanje	f
00030000-55dc-270a-217e-637bf6c850a9	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55dc-270a-e1f2-e96e666821f3	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55dc-270a-b7c9-eae73fec75b7	Stevilcenje-read	Stevilcenje - branje	f
00030000-55dc-270a-78e2-37d1ce6ea493	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55dc-270a-6aa5-35a1e7bfa144	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55dc-270a-f65c-de624e6c2341	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55dc-270a-b164-b3d27b0f9000	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55dc-270a-fa50-40d3009b61d9	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55dc-270a-4799-0bbedb85ad51	Telefonska-read	Telefonska - branje	f
00030000-55dc-270a-e8ab-8cbfe7691fe6	Telefonska-write	Telefonska - spreminjanje	f
00030000-55dc-270a-caaf-fbb764fa8187	TerminStoritve-read	TerminStoritve - branje	f
00030000-55dc-270a-dbfb-8afc3cd72f87	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55dc-270a-1e4a-f3ba33b179ac	TipFunkcije-read	TipFunkcije - branje	f
00030000-55dc-270a-a683-06c591bc4104	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55dc-270a-74b9-8b3c9f1fd963	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55dc-270a-900b-dc5af647ec16	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55dc-270a-2821-e3b8e121be86	Trr-read	Trr - branje	f
00030000-55dc-270a-cd08-91a440353713	Trr-write	Trr - spreminjanje	f
00030000-55dc-270a-736f-8321d8d8584f	Uprizoritev-read	Uprizoritev - branje	f
00030000-55dc-270a-5c6f-1d4777fc6c69	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55dc-270a-b499-cd9866f03ff3	Vaja-read	Vaja - branje	f
00030000-55dc-270a-36ae-e08547b96294	Vaja-write	Vaja - spreminjanje	f
00030000-55dc-270a-60fe-6860d243da43	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55dc-270a-b608-0f9ab1b5f646	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55dc-270a-9c37-afeaa5041c06	Zaposlitev-read	Zaposlitev - branje	f
00030000-55dc-270a-144c-0c9421e4f8cd	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55dc-270a-1e47-d3d19b9008be	Zasedenost-read	Zasedenost - branje	f
00030000-55dc-270a-65f2-cfbc2d8ee8a0	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55dc-270a-c351-314ce546e35d	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55dc-270a-0455-4276f3b269fb	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55dc-270a-175f-c26c1812660e	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55dc-270a-84f3-a4f04e935dd3	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55dc-270a-2fd2-a1fac9023e20	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55dc-270a-7f8a-4f09a5540c12	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55dc-270a-517f-df8f696dff51	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55dc-270a-27d7-54dfebc0c497	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55dc-270a-95f9-d5557b2766f8	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55dc-270a-ecc3-a0692d78edfe	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55dc-270a-8bd1-8f82571aacda	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55dc-270a-efda-b5db799b554f	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55dc-270a-e5ca-e134ca29652e	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55dc-270a-fa66-480856409fb2	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55dc-270a-3951-59d212d0add0	Datoteka-write	Datoteka - spreminjanje	f
00030000-55dc-270a-6263-8b616edd0d46	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2895 (class 0 OID 15400356)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55dc-270a-6f5b-f933f0b022d5	00030000-55dc-2709-88cf-d476ab2152db
00020000-55dc-270a-7810-1bc5d76501c6	00030000-55dc-2709-c169-6aa9d9d9cd9c
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-2709-bcc3-4debe68e29da
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-2709-c1a4-0ae667eb2310
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-2709-f161-d99bc02f8889
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-2709-6c8f-3cf383e766fa
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-2709-b649-8a04108f3b19
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-2709-8230-bf5e26b110bd
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-2709-8eeb-be418c8f3026
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-2709-5984-43f031979e44
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-2709-c169-6aa9d9d9cd9c
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-2709-9247-35b8cfcc810b
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-2709-fd37-7897ef73624e
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-2709-199b-e33db70dcd65
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-2709-f5a0-709bc4c5f8ef
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-2709-5735-2d548d0f9c9e
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-2709-efa6-4eebf912f057
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-2709-cbeb-b9d26a2b2337
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-2709-af99-b75f086fb139
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-2709-9e02-3e2c83d7ad92
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-2709-eb22-2a6ed1aa55aa
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-2709-bf64-d19012d82453
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-2709-4c6f-f09c958e5a7b
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-2709-d50b-4170270440a0
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-270a-7de0-bdda1984b5d4
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-270a-e5c4-46ae75fb6ac8
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-270a-1d26-1c3fb66d8233
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-270a-b4a7-dbb64401c44b
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-270a-414f-616b4108c91f
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-270a-8897-4ee8ae317deb
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-270a-918b-3fe18380bf0c
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-270a-c962-1ef05d94047a
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-270a-496b-8808d4065d4e
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-270a-3644-ac08898f0531
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-270a-b234-6940902ee935
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-270a-53e5-81ee059d6e24
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-270a-ca2e-06d768173ce9
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-270a-3833-72bf04ce13cd
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-270a-8923-860df409994e
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-270a-3b03-e791489a3b30
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-270a-c45b-6b9c607865d8
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-270a-7efe-e440c334606a
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-270a-1e4a-f3ba33b179ac
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-270a-736f-8321d8d8584f
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-270a-5c6f-1d4777fc6c69
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-270a-b499-cd9866f03ff3
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-270a-36ae-e08547b96294
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-270a-1e47-d3d19b9008be
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-270a-65f2-cfbc2d8ee8a0
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-270a-c351-314ce546e35d
00020000-55dc-270a-e7a0-9e45e0231475	00030000-55dc-270a-175f-c26c1812660e
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-2709-bcc3-4debe68e29da
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-2709-b649-8a04108f3b19
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-2709-8230-bf5e26b110bd
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-2709-c169-6aa9d9d9cd9c
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-2709-f5a0-709bc4c5f8ef
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-2709-efa6-4eebf912f057
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-2709-af99-b75f086fb139
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-2709-9e02-3e2c83d7ad92
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-2709-eb22-2a6ed1aa55aa
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-2709-bf64-d19012d82453
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-2709-4c6f-f09c958e5a7b
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-2709-d50b-4170270440a0
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-270a-7de0-bdda1984b5d4
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-270a-1d26-1c3fb66d8233
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-270a-414f-616b4108c91f
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-270a-8897-4ee8ae317deb
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-270a-918b-3fe18380bf0c
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-270a-b234-6940902ee935
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-270a-ca2e-06d768173ce9
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-270a-8923-860df409994e
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-270a-c45b-6b9c607865d8
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-270a-4799-0bbedb85ad51
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-270a-e8ab-8cbfe7691fe6
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-270a-2821-e3b8e121be86
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-270a-cd08-91a440353713
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-270a-9c37-afeaa5041c06
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-270a-144c-0c9421e4f8cd
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-270a-c351-314ce546e35d
00020000-55dc-270a-bcf8-1b360c201ad3	00030000-55dc-270a-175f-c26c1812660e
00020000-55dc-270a-3c10-f37211aa9ca5	00030000-55dc-2709-bcc3-4debe68e29da
00020000-55dc-270a-3c10-f37211aa9ca5	00030000-55dc-2709-f161-d99bc02f8889
00020000-55dc-270a-3c10-f37211aa9ca5	00030000-55dc-2709-b649-8a04108f3b19
00020000-55dc-270a-3c10-f37211aa9ca5	00030000-55dc-2709-5366-1c92d882b956
00020000-55dc-270a-3c10-f37211aa9ca5	00030000-55dc-2709-4874-d4b696123aca
00020000-55dc-270a-3c10-f37211aa9ca5	00030000-55dc-2709-3c49-f6231c6e5791
00020000-55dc-270a-3c10-f37211aa9ca5	00030000-55dc-2709-8230-bf5e26b110bd
00020000-55dc-270a-3c10-f37211aa9ca5	00030000-55dc-2709-c169-6aa9d9d9cd9c
00020000-55dc-270a-3c10-f37211aa9ca5	00030000-55dc-2709-fd37-7897ef73624e
00020000-55dc-270a-3c10-f37211aa9ca5	00030000-55dc-2709-f5a0-709bc4c5f8ef
00020000-55dc-270a-3c10-f37211aa9ca5	00030000-55dc-2709-efa6-4eebf912f057
00020000-55dc-270a-3c10-f37211aa9ca5	00030000-55dc-2709-af99-b75f086fb139
00020000-55dc-270a-3c10-f37211aa9ca5	00030000-55dc-2709-eb22-2a6ed1aa55aa
00020000-55dc-270a-3c10-f37211aa9ca5	00030000-55dc-2709-bf64-d19012d82453
00020000-55dc-270a-3c10-f37211aa9ca5	00030000-55dc-2709-4c6f-f09c958e5a7b
00020000-55dc-270a-3c10-f37211aa9ca5	00030000-55dc-270a-7de0-bdda1984b5d4
00020000-55dc-270a-3c10-f37211aa9ca5	00030000-55dc-270a-1d26-1c3fb66d8233
00020000-55dc-270a-3c10-f37211aa9ca5	00030000-55dc-270a-918b-3fe18380bf0c
00020000-55dc-270a-3c10-f37211aa9ca5	00030000-55dc-270a-496b-8808d4065d4e
00020000-55dc-270a-3c10-f37211aa9ca5	00030000-55dc-270a-b234-6940902ee935
00020000-55dc-270a-3c10-f37211aa9ca5	00030000-55dc-270a-ca2e-06d768173ce9
00020000-55dc-270a-3c10-f37211aa9ca5	00030000-55dc-270a-8923-860df409994e
00020000-55dc-270a-3c10-f37211aa9ca5	00030000-55dc-270a-c45b-6b9c607865d8
00020000-55dc-270a-3c10-f37211aa9ca5	00030000-55dc-270a-1e4a-f3ba33b179ac
00020000-55dc-270a-3c10-f37211aa9ca5	00030000-55dc-270a-b499-cd9866f03ff3
00020000-55dc-270a-3c10-f37211aa9ca5	00030000-55dc-270a-1e47-d3d19b9008be
00020000-55dc-270a-3c10-f37211aa9ca5	00030000-55dc-270a-c351-314ce546e35d
00020000-55dc-270a-3c10-f37211aa9ca5	00030000-55dc-270a-175f-c26c1812660e
00020000-55dc-270a-0066-db0944e09df7	00030000-55dc-2709-bcc3-4debe68e29da
00020000-55dc-270a-0066-db0944e09df7	00030000-55dc-2709-c1a4-0ae667eb2310
00020000-55dc-270a-0066-db0944e09df7	00030000-55dc-2709-6c8f-3cf383e766fa
00020000-55dc-270a-0066-db0944e09df7	00030000-55dc-2709-b649-8a04108f3b19
00020000-55dc-270a-0066-db0944e09df7	00030000-55dc-2709-8230-bf5e26b110bd
00020000-55dc-270a-0066-db0944e09df7	00030000-55dc-2709-c169-6aa9d9d9cd9c
00020000-55dc-270a-0066-db0944e09df7	00030000-55dc-2709-f5a0-709bc4c5f8ef
00020000-55dc-270a-0066-db0944e09df7	00030000-55dc-2709-efa6-4eebf912f057
00020000-55dc-270a-0066-db0944e09df7	00030000-55dc-2709-eb22-2a6ed1aa55aa
00020000-55dc-270a-0066-db0944e09df7	00030000-55dc-2709-bf64-d19012d82453
00020000-55dc-270a-0066-db0944e09df7	00030000-55dc-270a-7de0-bdda1984b5d4
00020000-55dc-270a-0066-db0944e09df7	00030000-55dc-270a-1d26-1c3fb66d8233
00020000-55dc-270a-0066-db0944e09df7	00030000-55dc-270a-918b-3fe18380bf0c
00020000-55dc-270a-0066-db0944e09df7	00030000-55dc-270a-b234-6940902ee935
00020000-55dc-270a-0066-db0944e09df7	00030000-55dc-270a-ca2e-06d768173ce9
00020000-55dc-270a-0066-db0944e09df7	00030000-55dc-270a-8923-860df409994e
00020000-55dc-270a-0066-db0944e09df7	00030000-55dc-270a-c45b-6b9c607865d8
00020000-55dc-270a-0066-db0944e09df7	00030000-55dc-270a-1e4a-f3ba33b179ac
00020000-55dc-270a-0066-db0944e09df7	00030000-55dc-270a-c351-314ce546e35d
00020000-55dc-270a-0066-db0944e09df7	00030000-55dc-270a-175f-c26c1812660e
00020000-55dc-270a-e94c-37ef54b566f8	00030000-55dc-2709-bcc3-4debe68e29da
00020000-55dc-270a-e94c-37ef54b566f8	00030000-55dc-2709-b649-8a04108f3b19
00020000-55dc-270a-e94c-37ef54b566f8	00030000-55dc-2709-8230-bf5e26b110bd
00020000-55dc-270a-e94c-37ef54b566f8	00030000-55dc-2709-c169-6aa9d9d9cd9c
00020000-55dc-270a-e94c-37ef54b566f8	00030000-55dc-2709-f5a0-709bc4c5f8ef
00020000-55dc-270a-e94c-37ef54b566f8	00030000-55dc-2709-efa6-4eebf912f057
00020000-55dc-270a-e94c-37ef54b566f8	00030000-55dc-2709-eb22-2a6ed1aa55aa
00020000-55dc-270a-e94c-37ef54b566f8	00030000-55dc-2709-bf64-d19012d82453
00020000-55dc-270a-e94c-37ef54b566f8	00030000-55dc-270a-7de0-bdda1984b5d4
00020000-55dc-270a-e94c-37ef54b566f8	00030000-55dc-270a-1d26-1c3fb66d8233
00020000-55dc-270a-e94c-37ef54b566f8	00030000-55dc-270a-918b-3fe18380bf0c
00020000-55dc-270a-e94c-37ef54b566f8	00030000-55dc-270a-b234-6940902ee935
00020000-55dc-270a-e94c-37ef54b566f8	00030000-55dc-270a-ca2e-06d768173ce9
00020000-55dc-270a-e94c-37ef54b566f8	00030000-55dc-270a-8923-860df409994e
00020000-55dc-270a-e94c-37ef54b566f8	00030000-55dc-270a-c45b-6b9c607865d8
00020000-55dc-270a-e94c-37ef54b566f8	00030000-55dc-270a-caaf-fbb764fa8187
00020000-55dc-270a-e94c-37ef54b566f8	00030000-55dc-2709-4113-f0b21addb265
00020000-55dc-270a-e94c-37ef54b566f8	00030000-55dc-270a-1e4a-f3ba33b179ac
00020000-55dc-270a-e94c-37ef54b566f8	00030000-55dc-270a-c351-314ce546e35d
00020000-55dc-270a-e94c-37ef54b566f8	00030000-55dc-270a-175f-c26c1812660e
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-8da7-0c1fa4383846
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-88cf-d476ab2152db
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-4113-f0b21addb265
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-8eeb-be418c8f3026
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-ad77-bdfbc06a90d3
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-acdb-80dcae60a3c6
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-bcc3-4debe68e29da
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-c1a4-0ae667eb2310
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-f161-d99bc02f8889
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-6c8f-3cf383e766fa
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-b649-8a04108f3b19
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-5366-1c92d882b956
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-4874-d4b696123aca
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-1806-af2738fe0ead
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-3c49-f6231c6e5791
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-a852-944f5d5432b1
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-8230-bf5e26b110bd
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-5984-43f031979e44
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-c169-6aa9d9d9cd9c
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-9247-35b8cfcc810b
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-4282-70e4f73ef35e
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-974d-fbb58c78bf75
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-0a28-cc40fc1b87ed
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-9680-b350b6cf4566
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-fd37-7897ef73624e
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-199b-e33db70dcd65
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-f5a0-709bc4c5f8ef
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-5735-2d548d0f9c9e
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-efa6-4eebf912f057
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-cbeb-b9d26a2b2337
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-af99-b75f086fb139
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-9e02-3e2c83d7ad92
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-2b69-87326c10570a
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-4786-5942eeaabe16
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-cab7-b4d20004d437
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-ef92-d5f2a3bd30ef
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-eb22-2a6ed1aa55aa
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-e0d8-6e84671e8c35
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-bf64-d19012d82453
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-66e3-326dc88df7e7
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-4c6f-f09c958e5a7b
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-d50b-4170270440a0
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-caa8-47a7ba741fc7
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-35d3-e9bebc80d92d
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-c66e-b36aaf429cef
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-2709-3759-7c9281214852
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-aaf1-6fa952b88502
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-0582-959a5525852c
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-7de0-bdda1984b5d4
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-e5c4-46ae75fb6ac8
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-1d26-1c3fb66d8233
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-b4a7-dbb64401c44b
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-15e3-9c153582554b
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-b23e-69e2488c675f
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-414f-616b4108c91f
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-8897-4ee8ae317deb
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-918b-3fe18380bf0c
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-c962-1ef05d94047a
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-e0d3-3dd6b9aa5efb
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-f400-0ffa9200d291
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-5857-a25994f8663a
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-16d0-1b4da750f19b
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-496b-8808d4065d4e
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-3644-ac08898f0531
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-46d2-ff41ddb7f6ab
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-21e7-bf110c85758f
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-a829-e132dbf981d1
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-a6dd-183fedeef1c9
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-b353-81dc90e7beb0
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-a86e-39be0bd8435e
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-8e1f-c01c2a798f56
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-39b7-35df0cba4eb3
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-a6bb-2bfd5cd214a0
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-8008-696746b8a923
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-7e7d-14c26531ac2d
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-499d-9d652cc2a110
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-e59c-5632c85a792c
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-0460-5a905f152d3b
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-c615-588f4e982a34
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-e279-6a3db52629e8
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-903f-468c34518db6
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-51d2-2886a1f68662
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-e00b-55497610ecb0
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-3079-8068e356ae21
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-b234-6940902ee935
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-53e5-81ee059d6e24
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-4528-f6b08b82e3c4
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-5ffb-5880c5345a49
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-51d6-42a8f4d883ee
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-fd47-7c81edf9e552
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-ca2e-06d768173ce9
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-3833-72bf04ce13cd
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-8923-860df409994e
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-3b03-e791489a3b30
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-dfd7-80c9dad0e94d
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-36a3-81f68ad80672
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-f377-ad3067434def
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-625d-d0bdf8254ec9
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-f3e1-823c97a6ef24
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-617e-2f2e4427fde1
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-4821-518ae4c8c1c3
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-bc8d-abfb489ef429
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-c45b-6b9c607865d8
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-7efe-e440c334606a
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-217e-637bf6c850a9
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-e1f2-e96e666821f3
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-b7c9-eae73fec75b7
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-78e2-37d1ce6ea493
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-6aa5-35a1e7bfa144
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-f65c-de624e6c2341
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-b164-b3d27b0f9000
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-fa50-40d3009b61d9
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-4799-0bbedb85ad51
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-e8ab-8cbfe7691fe6
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-caaf-fbb764fa8187
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-dbfb-8afc3cd72f87
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-1e4a-f3ba33b179ac
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-a683-06c591bc4104
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-74b9-8b3c9f1fd963
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-900b-dc5af647ec16
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-2821-e3b8e121be86
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-cd08-91a440353713
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-736f-8321d8d8584f
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-5c6f-1d4777fc6c69
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-b499-cd9866f03ff3
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-36ae-e08547b96294
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-60fe-6860d243da43
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-b608-0f9ab1b5f646
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-9c37-afeaa5041c06
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-144c-0c9421e4f8cd
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-1e47-d3d19b9008be
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-65f2-cfbc2d8ee8a0
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-c351-314ce546e35d
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-0455-4276f3b269fb
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-175f-c26c1812660e
00020000-55dc-270b-b376-a6a25f4e5d0a	00030000-55dc-270a-84f3-a4f04e935dd3
\.


--
-- TOC entry 2923 (class 0 OID 15400655)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 15400686)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 15400800)
-- Dependencies: 218
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55dc-270b-5609-980c234f9e51	00090000-55dc-270b-c7fc-0406923fa6bc	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55dc-270b-2ed0-843ae30bfa54	00090000-55dc-270b-096b-b0913025bbf7	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55dc-270b-a775-4e62c594f065	00090000-55dc-270b-a449-e5edd7ee5b93	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2900 (class 0 OID 15400416)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55dc-270b-b91e-efafe432b9d9	00040000-55dc-2709-024c-f860a33c4465	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dc-270b-d821-83a91766e0d8	00040000-55dc-2709-024c-f860a33c4465	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55dc-270b-257a-8ef8b6814a39	00040000-55dc-2709-024c-f860a33c4465	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dc-270b-fb1c-1b30762b71fe	00040000-55dc-2709-024c-f860a33c4465	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dc-270b-8712-17136078a502	00040000-55dc-2709-024c-f860a33c4465	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dc-270b-b206-f8bd5137fa08	00040000-55dc-2709-15c4-03e5b2b35557	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dc-270b-1a98-27c0d60e054f	00040000-55dc-2709-2b42-954f28fd3667	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dc-270b-5fd7-04ba2588cf00	00040000-55dc-2709-4f76-8c4b35e7d800	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dc-270c-c4da-a969e896e0a5	00040000-55dc-2709-024c-f860a33c4465	1001	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2902 (class 0 OID 15400451)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55dc-2709-4d7c-9e48433157cf	8341	Adlešiči
00050000-55dc-2709-765d-b8c6c2bacbd7	5270	Ajdovščina
00050000-55dc-2709-95d1-925fea5a01b7	6280	Ankaran/Ancarano
00050000-55dc-2709-a539-0605b0e9c836	9253	Apače
00050000-55dc-2709-35fd-03bea239f88c	8253	Artiče
00050000-55dc-2709-0a52-511bf811739e	4275	Begunje na Gorenjskem
00050000-55dc-2709-18fa-cc3ed8f0d4dc	1382	Begunje pri Cerknici
00050000-55dc-2709-e3eb-ba87623108cb	9231	Beltinci
00050000-55dc-2709-3f56-e0dc11ca18f5	2234	Benedikt
00050000-55dc-2709-3894-c3b341307173	2345	Bistrica ob Dravi
00050000-55dc-2709-7f8e-4e981c0608a4	3256	Bistrica ob Sotli
00050000-55dc-2709-bafb-af12dcc0bba2	8259	Bizeljsko
00050000-55dc-2709-8b64-3c34e523b861	1223	Blagovica
00050000-55dc-2709-906d-65755b512bd5	8283	Blanca
00050000-55dc-2709-af2f-b8b3edfc1ec8	4260	Bled
00050000-55dc-2709-77c1-43f12d6058b2	4273	Blejska Dobrava
00050000-55dc-2709-1d21-1f29a52d3980	9265	Bodonci
00050000-55dc-2709-2a06-e8dbd61e6eac	9222	Bogojina
00050000-55dc-2709-7eac-25bd9d18ff09	4263	Bohinjska Bela
00050000-55dc-2709-d595-7d783c0c7abf	4264	Bohinjska Bistrica
00050000-55dc-2709-f770-c8e7dcfe2d7e	4265	Bohinjsko jezero
00050000-55dc-2709-ee28-82a9a2841413	1353	Borovnica
00050000-55dc-2709-40de-44de37410fd0	8294	Boštanj
00050000-55dc-2709-931f-34f418481349	5230	Bovec
00050000-55dc-2709-484b-1b834148f072	5295	Branik
00050000-55dc-2709-2c70-feef0c38b3d1	3314	Braslovče
00050000-55dc-2709-f41a-4ff05c73edda	5223	Breginj
00050000-55dc-2709-4cc3-e1a99fd1a2b6	8280	Brestanica
00050000-55dc-2709-eb19-2c66f9c66fae	2354	Bresternica
00050000-55dc-2709-0274-526b57d54619	4243	Brezje
00050000-55dc-2709-5c96-13c62beaf5ed	1351	Brezovica pri Ljubljani
00050000-55dc-2709-b12f-48c120a5dec8	8250	Brežice
00050000-55dc-2709-6355-b69c9b8dbe54	4210	Brnik - Aerodrom
00050000-55dc-2709-0709-43d1970a792c	8321	Brusnice
00050000-55dc-2709-68ce-b1c803521f88	3255	Buče
00050000-55dc-2709-a5d4-fa35343c5309	8276	Bučka 
00050000-55dc-2709-9552-113733a30c46	9261	Cankova
00050000-55dc-2709-6d15-01f6e3fe1600	3000	Celje 
00050000-55dc-2709-9c6b-dfe9d9103c6b	3001	Celje - poštni predali
00050000-55dc-2709-14f3-3df31e849500	4207	Cerklje na Gorenjskem
00050000-55dc-2709-d984-9db99c10ecee	8263	Cerklje ob Krki
00050000-55dc-2709-e39c-615b2bdf4444	1380	Cerknica
00050000-55dc-2709-944b-303d1aea5394	5282	Cerkno
00050000-55dc-2709-e785-a124e286d404	2236	Cerkvenjak
00050000-55dc-2709-2232-aedd43831b0f	2215	Ceršak
00050000-55dc-2709-297e-8002936f646c	2326	Cirkovce
00050000-55dc-2709-b05c-03f8c26596af	2282	Cirkulane
00050000-55dc-2709-90b9-2f253bad2f49	5273	Col
00050000-55dc-2709-f166-c115f514a87e	8251	Čatež ob Savi
00050000-55dc-2709-fe46-d6a3f1ef1b2c	1413	Čemšenik
00050000-55dc-2709-891d-cbd469e487c4	5253	Čepovan
00050000-55dc-2709-8ad3-6f403806cffe	9232	Črenšovci
00050000-55dc-2709-9883-c59a9a747b5b	2393	Črna na Koroškem
00050000-55dc-2709-4aad-1bbbd3f0f03b	6275	Črni Kal
00050000-55dc-2709-3b75-4b6cbc96d29b	5274	Črni Vrh nad Idrijo
00050000-55dc-2709-7f51-02d6bf0ef196	5262	Črniče
00050000-55dc-2709-5dbd-5257484e50c7	8340	Črnomelj
00050000-55dc-2709-7701-a9c4dbdc3edc	6271	Dekani
00050000-55dc-2709-dab9-2398195da56b	5210	Deskle
00050000-55dc-2709-821d-66a1b20ae901	2253	Destrnik
00050000-55dc-2709-0e1c-e645e7965d6d	6215	Divača
00050000-55dc-2709-7d1b-14526a96f033	1233	Dob
00050000-55dc-2709-4f1f-ba1b56262a15	3224	Dobje pri Planini
00050000-55dc-2709-c800-caf698b4292f	8257	Dobova
00050000-55dc-2709-d8b9-479ea2818ca7	1423	Dobovec
00050000-55dc-2709-b36c-453e620ac3f9	5263	Dobravlje
00050000-55dc-2709-201a-d3fcf4cab5df	3204	Dobrna
00050000-55dc-2709-1b62-4ac394038c30	8211	Dobrnič
00050000-55dc-2709-b243-87e403c89367	1356	Dobrova
00050000-55dc-2709-9d7e-dac4e19b0075	9223	Dobrovnik/Dobronak 
00050000-55dc-2709-16c6-eb5049a15504	5212	Dobrovo v Brdih
00050000-55dc-2709-89f7-e6639141a698	1431	Dol pri Hrastniku
00050000-55dc-2709-0b7b-ea805f3bef0c	1262	Dol pri Ljubljani
00050000-55dc-2709-680d-7dc412b67f2b	1273	Dole pri Litiji
00050000-55dc-2709-3a9e-a42949b82fd7	1331	Dolenja vas
00050000-55dc-2709-212e-7341c81405d1	8350	Dolenjske Toplice
00050000-55dc-2709-2aef-a51ee2975c21	1230	Domžale
00050000-55dc-2709-ccd3-7f5f1bbd3751	2252	Dornava
00050000-55dc-2709-8504-4b585de7ff15	5294	Dornberk
00050000-55dc-2709-a3ec-38366b2582be	1319	Draga
00050000-55dc-2709-871b-f2b8006e5b26	8343	Dragatuš
00050000-55dc-2709-c99d-84fea805ec44	3222	Dramlje
00050000-55dc-2709-9d3f-0d2cb36e03fa	2370	Dravograd
00050000-55dc-2709-28c7-7336f905cd45	4203	Duplje
00050000-55dc-2709-0f86-1541e370c6b6	6221	Dutovlje
00050000-55dc-2709-0e7e-49aece42c27d	8361	Dvor
00050000-55dc-2709-9b8d-c84b8e23906f	2343	Fala
00050000-55dc-2709-2da7-544fd86d2b14	9208	Fokovci
00050000-55dc-2709-ed42-f9c84a58394b	2313	Fram
00050000-55dc-2709-93a1-8004eec44cfc	3213	Frankolovo
00050000-55dc-2709-98d2-c844e3bd97b7	1274	Gabrovka
00050000-55dc-2709-48eb-9498eda85fa1	8254	Globoko
00050000-55dc-2709-24b3-f33d2a829ca1	5275	Godovič
00050000-55dc-2709-6d1c-d3a8e59f39f8	4204	Golnik
00050000-55dc-2709-6f3f-7106f6258b7c	3303	Gomilsko
00050000-55dc-2709-2613-feabd32eebc4	4224	Gorenja vas
00050000-55dc-2709-56ed-283cb47ef6dc	3263	Gorica pri Slivnici
00050000-55dc-2709-cd04-460ae07694b0	2272	Gorišnica
00050000-55dc-2709-a38e-0382f731498e	9250	Gornja Radgona
00050000-55dc-2709-243d-e7e97e8c289f	3342	Gornji Grad
00050000-55dc-2709-81e2-e68c15dacb26	4282	Gozd Martuljek
00050000-55dc-2709-ddc3-8af5d721d86f	6272	Gračišče
00050000-55dc-2709-b6a2-d5064f800622	9264	Grad
00050000-55dc-2709-7185-efa7ba3b3c13	8332	Gradac
00050000-55dc-2709-d72c-f7efeb290c31	1384	Grahovo
00050000-55dc-2709-6c54-4a85a22a5a0c	5242	Grahovo ob Bači
00050000-55dc-2709-7cb8-51cae9079575	5251	Grgar
00050000-55dc-2709-6cfc-cdebdd3074de	3302	Griže
00050000-55dc-2709-6db3-7ab0bb073374	3231	Grobelno
00050000-55dc-2709-a9a4-f1a241293de1	1290	Grosuplje
00050000-55dc-2709-019d-889d4f0d5da0	2288	Hajdina
00050000-55dc-2709-e143-4df1b339b7aa	8362	Hinje
00050000-55dc-2709-c18b-b4791e0b0533	2311	Hoče
00050000-55dc-2709-dc83-f3653f3d38cc	9205	Hodoš/Hodos
00050000-55dc-2709-c904-d876bf0329bc	1354	Horjul
00050000-55dc-2709-d159-d80c765f10dd	1372	Hotedršica
00050000-55dc-2709-1db3-0fd93c93e6fd	1430	Hrastnik
00050000-55dc-2709-21fb-cb76b0c22360	6225	Hruševje
00050000-55dc-2709-a87f-6e0980f50239	4276	Hrušica
00050000-55dc-2709-dadc-8366696fb013	5280	Idrija
00050000-55dc-2709-5d06-79f896fb122f	1292	Ig
00050000-55dc-2709-2b01-f5915ba0b41a	6250	Ilirska Bistrica
00050000-55dc-2709-0759-790caea83a9f	6251	Ilirska Bistrica-Trnovo
00050000-55dc-2709-3304-4d022a1733bb	1295	Ivančna Gorica
00050000-55dc-2709-5712-696ce11ca9e5	2259	Ivanjkovci
00050000-55dc-2709-9b45-d38a997e7d43	1411	Izlake
00050000-55dc-2709-1c02-ff0377ea3276	6310	Izola/Isola
00050000-55dc-2709-4141-89aa94421f9c	2222	Jakobski Dol
00050000-55dc-2709-6bc4-c17ae67d0286	2221	Jarenina
00050000-55dc-2709-586a-0ab90a9509b4	6254	Jelšane
00050000-55dc-2709-9401-ca8c8af35efe	4270	Jesenice
00050000-55dc-2709-5bfb-4865373566fd	8261	Jesenice na Dolenjskem
00050000-55dc-2709-5517-d01c89e689ac	3273	Jurklošter
00050000-55dc-2709-fb8b-340e8b6de03f	2223	Jurovski Dol
00050000-55dc-2709-ed13-9bf849f300ac	2256	Juršinci
00050000-55dc-2709-e744-c88bd3160efa	5214	Kal nad Kanalom
00050000-55dc-2709-4386-f376ba9e21ca	3233	Kalobje
00050000-55dc-2709-66da-686f63878422	4246	Kamna Gorica
00050000-55dc-2709-5da0-8a4058efc5b2	2351	Kamnica
00050000-55dc-2709-83a3-a3d0b21de625	1241	Kamnik
00050000-55dc-2709-0a23-b723d8e109ec	5213	Kanal
00050000-55dc-2709-b9f9-6817efb5dceb	8258	Kapele
00050000-55dc-2709-fa40-16884eeb63f5	2362	Kapla
00050000-55dc-2709-2394-6afbd78415d5	2325	Kidričevo
00050000-55dc-2709-acea-3851fd1eb54b	1412	Kisovec
00050000-55dc-2709-4116-525d04e8c6a7	6253	Knežak
00050000-55dc-2709-7011-7f8fd30bde2d	5222	Kobarid
00050000-55dc-2709-2420-9e0e86f59412	9227	Kobilje
00050000-55dc-2709-cf05-2209c961cec9	1330	Kočevje
00050000-55dc-2709-4570-2c032a7861bb	1338	Kočevska Reka
00050000-55dc-2709-de1e-17fde8d3bf05	2276	Kog
00050000-55dc-2709-973a-3f97d9fa464e	5211	Kojsko
00050000-55dc-2709-0ffc-d3f6aa9f2e4d	6223	Komen
00050000-55dc-2709-4034-064f83fb1854	1218	Komenda
00050000-55dc-2709-63be-a2dd238cf835	6000	Koper/Capodistria 
00050000-55dc-2709-fce7-4e4786f4bc31	6001	Koper/Capodistria - poštni predali
00050000-55dc-2709-8e23-4eac941359f7	8282	Koprivnica
00050000-55dc-2709-911a-d87b72401cae	5296	Kostanjevica na Krasu
00050000-55dc-2709-b855-119b7088cd50	8311	Kostanjevica na Krki
00050000-55dc-2709-2ef8-1b31ea29a8f3	1336	Kostel
00050000-55dc-2709-b9fb-85d7c1cfa987	6256	Košana
00050000-55dc-2709-a2c1-95be4fe7b1fd	2394	Kotlje
00050000-55dc-2709-c46e-e5b90bcbb59c	6240	Kozina
00050000-55dc-2709-abac-8fce47b0dad5	3260	Kozje
00050000-55dc-2709-381e-c384d285e986	4000	Kranj 
00050000-55dc-2709-2664-8ac16ac999e7	4001	Kranj - poštni predali
00050000-55dc-2709-6e40-760fb6f05f84	4280	Kranjska Gora
00050000-55dc-2709-0915-001209e0c429	1281	Kresnice
00050000-55dc-2709-b2ae-f5ebeb65b1e2	4294	Križe
00050000-55dc-2709-66b7-a0fbc6f38b6c	9206	Križevci
00050000-55dc-2709-059c-609744e45ed5	9242	Križevci pri Ljutomeru
00050000-55dc-2709-f94e-9685c2da43ba	1301	Krka
00050000-55dc-2709-0779-b7781bc4595f	8296	Krmelj
00050000-55dc-2709-d5fd-2e6f32344b24	4245	Kropa
00050000-55dc-2709-f1b7-b1d8e15e6f7a	8262	Krška vas
00050000-55dc-2709-82a4-161e7c3c48ee	8270	Krško
00050000-55dc-2709-5b46-cbdbe11fc38a	9263	Kuzma
00050000-55dc-2709-52f9-e4bfe89bb09f	2318	Laporje
00050000-55dc-2709-8e35-4af6036706e9	3270	Laško
00050000-55dc-2709-d1aa-13b5c2c83e8c	1219	Laze v Tuhinju
00050000-55dc-2709-849e-1209a3ccf057	2230	Lenart v Slovenskih goricah
00050000-55dc-2709-cc2d-b4428068013e	9220	Lendava/Lendva
00050000-55dc-2709-9850-faedab18b9e0	4248	Lesce
00050000-55dc-2709-f557-8c9c73105877	3261	Lesično
00050000-55dc-2709-09fc-924961573dad	8273	Leskovec pri Krškem
00050000-55dc-2709-a195-f26c13f85b55	2372	Libeliče
00050000-55dc-2709-c348-841ec4aba2d9	2341	Limbuš
00050000-55dc-2709-6aed-1c23d1755c77	1270	Litija
00050000-55dc-2709-9b8b-a88641339c02	3202	Ljubečna
00050000-55dc-2709-cac4-1cc3cedc8cf5	1000	Ljubljana 
00050000-55dc-2709-91cd-c2744fddb05e	1001	Ljubljana - poštni predali
00050000-55dc-2709-5ed9-d8630288b2f5	1231	Ljubljana - Črnuče
00050000-55dc-2709-940f-85d4fc37fc7b	1261	Ljubljana - Dobrunje
00050000-55dc-2709-3760-396863f5d28f	1260	Ljubljana - Polje
00050000-55dc-2709-a95a-25a6b81656b8	1210	Ljubljana - Šentvid
00050000-55dc-2709-71c3-9042b77d7ed4	1211	Ljubljana - Šmartno
00050000-55dc-2709-a586-8020b3d32984	3333	Ljubno ob Savinji
00050000-55dc-2709-3992-958d9db3ad93	9240	Ljutomer
00050000-55dc-2709-05a4-f93d43900631	3215	Loče
00050000-55dc-2709-673a-18c482dd1993	5231	Log pod Mangartom
00050000-55dc-2709-3483-74d07dd7063e	1358	Log pri Brezovici
00050000-55dc-2709-100d-4fb865bd8e63	1370	Logatec
00050000-55dc-2709-37b1-25cee08dfc16	1371	Logatec
00050000-55dc-2709-b215-c6b8933ff2c7	1434	Loka pri Zidanem Mostu
00050000-55dc-2709-a0b8-b51d77b11f75	3223	Loka pri Žusmu
00050000-55dc-2709-fb8a-3d66d60ad430	6219	Lokev
00050000-55dc-2709-deb3-64149325eb8a	1318	Loški Potok
00050000-55dc-2709-44fd-b12717309f9e	2324	Lovrenc na Dravskem polju
00050000-55dc-2709-f967-cefb9c7075d4	2344	Lovrenc na Pohorju
00050000-55dc-2709-9e9d-ba549e9157e6	3334	Luče
00050000-55dc-2709-3bd4-35b0f389bbbc	1225	Lukovica
00050000-55dc-2709-0da4-0386cab38660	9202	Mačkovci
00050000-55dc-2709-7db4-2fd725e44c5e	2322	Majšperk
00050000-55dc-2709-64c7-e4760f7163c2	2321	Makole
00050000-55dc-2709-44c9-be8b9ee12ee1	9243	Mala Nedelja
00050000-55dc-2709-9693-d3bded911776	2229	Malečnik
00050000-55dc-2709-a9f2-a83d6ecdb498	6273	Marezige
00050000-55dc-2709-382f-388067cc5a7a	2000	Maribor 
00050000-55dc-2709-6dcb-e7d30d04f6ce	2001	Maribor - poštni predali
00050000-55dc-2709-1a24-82e9e9a03edf	2206	Marjeta na Dravskem polju
00050000-55dc-2709-fb97-77d8dec49964	2281	Markovci
00050000-55dc-2709-e05b-e873a68454fe	9221	Martjanci
00050000-55dc-2709-b4bf-7a05c3287099	6242	Materija
00050000-55dc-2709-95b6-a76d32f5c399	4211	Mavčiče
00050000-55dc-2709-efe9-11a4a0175e58	1215	Medvode
00050000-55dc-2709-105d-eb1dc6ee3afb	1234	Mengeš
00050000-55dc-2709-3de3-3d12409a252b	8330	Metlika
00050000-55dc-2709-2733-ed76bb9d20c2	2392	Mežica
00050000-55dc-2709-b776-93cb08224806	2204	Miklavž na Dravskem polju
00050000-55dc-2709-576e-de66d679c544	2275	Miklavž pri Ormožu
00050000-55dc-2709-7677-ad56ede035d5	5291	Miren
00050000-55dc-2709-19d9-2605e715d701	8233	Mirna
00050000-55dc-2709-61b5-fe6083344d1b	8216	Mirna Peč
00050000-55dc-2709-4cc3-344b9b3f05b7	2382	Mislinja
00050000-55dc-2709-129b-627783d234aa	4281	Mojstrana
00050000-55dc-2709-ff46-0b7fbf691cc6	8230	Mokronog
00050000-55dc-2709-1892-c3a605a4a3f0	1251	Moravče
00050000-55dc-2709-d8b1-929c570719fc	9226	Moravske Toplice
00050000-55dc-2709-97ce-76d1de75ad43	5216	Most na Soči
00050000-55dc-2709-9ad7-fdd9876aa8d3	1221	Motnik
00050000-55dc-2709-2c69-9e21406a0f05	3330	Mozirje
00050000-55dc-2709-2d99-c656f0154f15	9000	Murska Sobota 
00050000-55dc-2709-ff5e-f9cb22729914	9001	Murska Sobota - poštni predali
00050000-55dc-2709-0031-2b3d82ca8c70	2366	Muta
00050000-55dc-2709-0d95-c4b9a62f2982	4202	Naklo
00050000-55dc-2709-f158-1f6c816ae025	3331	Nazarje
00050000-55dc-2709-396c-1841c0e7a463	1357	Notranje Gorice
00050000-55dc-2709-a21e-0c851e1a506b	3203	Nova Cerkev
00050000-55dc-2709-9c85-927a5aa26cd8	5000	Nova Gorica 
00050000-55dc-2709-fc2d-4bc600917e68	5001	Nova Gorica - poštni predali
00050000-55dc-2709-06a9-deb5158c1840	1385	Nova vas
00050000-55dc-2709-bce7-1030b0f9f0d6	8000	Novo mesto
00050000-55dc-2709-93a6-d91606cf6f73	8001	Novo mesto - poštni predali
00050000-55dc-2709-9bc5-c444a120e2cf	6243	Obrov
00050000-55dc-2709-b985-86bb2fdfefe6	9233	Odranci
00050000-55dc-2709-17e2-41ca26e300da	2317	Oplotnica
00050000-55dc-2709-2c11-65e16674b01c	2312	Orehova vas
00050000-55dc-2709-472c-7c498b5dca0e	2270	Ormož
00050000-55dc-2709-60c8-4c32e31ca6ff	1316	Ortnek
00050000-55dc-2709-e6bd-d5af6c158602	1337	Osilnica
00050000-55dc-2709-dcad-37bf976d1480	8222	Otočec
00050000-55dc-2709-0332-1ddf82512462	2361	Ožbalt
00050000-55dc-2709-7a5e-993ff46f484a	2231	Pernica
00050000-55dc-2709-8a04-a8584b45f810	2211	Pesnica pri Mariboru
00050000-55dc-2709-f17a-b176c7d60a4c	9203	Petrovci
00050000-55dc-2709-2f69-dd6fabc46368	3301	Petrovče
00050000-55dc-2709-bc80-baec42aede4f	6330	Piran/Pirano
00050000-55dc-2709-5b0d-c8de191691ff	8255	Pišece
00050000-55dc-2709-a8d0-9a4b4656613d	6257	Pivka
00050000-55dc-2709-2403-3befdc99b67b	6232	Planina
00050000-55dc-2709-87fc-3c65d6db40e1	3225	Planina pri Sevnici
00050000-55dc-2709-82d1-2d1e0447c6c4	6276	Pobegi
00050000-55dc-2709-3c9e-ff4bff19c8be	8312	Podbočje
00050000-55dc-2709-79e2-64e17b45c005	5243	Podbrdo
00050000-55dc-2709-53d9-be038085d523	3254	Podčetrtek
00050000-55dc-2709-ed87-593774946e5f	2273	Podgorci
00050000-55dc-2709-4c76-6d2fe7c33537	6216	Podgorje
00050000-55dc-2709-63c5-29e58f77cdc3	2381	Podgorje pri Slovenj Gradcu
00050000-55dc-2709-6da5-aafe58cf764e	6244	Podgrad
00050000-55dc-2709-87b0-56941f86a7b3	1414	Podkum
00050000-55dc-2709-caaf-62108e502811	2286	Podlehnik
00050000-55dc-2709-94e1-7aabf038adba	5272	Podnanos
00050000-55dc-2709-a4b8-24eb1fe5d422	4244	Podnart
00050000-55dc-2709-0693-9ba1f329ec32	3241	Podplat
00050000-55dc-2709-bb1c-5292ab0e0749	3257	Podsreda
00050000-55dc-2709-7d48-b0fdff1cbcdf	2363	Podvelka
00050000-55dc-2709-086f-fe6dbde9afea	2208	Pohorje
00050000-55dc-2709-ef7e-b2aa7f572a5d	2257	Polenšak
00050000-55dc-2709-6426-652815d24245	1355	Polhov Gradec
00050000-55dc-2709-361a-1d7c0fad172b	4223	Poljane nad Škofjo Loko
00050000-55dc-2709-0cbf-2cffee469d2c	2319	Poljčane
00050000-55dc-2709-8a2e-e65a1d208511	1272	Polšnik
00050000-55dc-2709-2928-a6a988a06366	3313	Polzela
00050000-55dc-2709-a727-ee430667eeac	3232	Ponikva
00050000-55dc-2709-42e6-167d6178f469	6320	Portorož/Portorose
00050000-55dc-2709-94f0-6b67667d144f	6230	Postojna
00050000-55dc-2709-0ee4-05a5dbc59d54	2331	Pragersko
00050000-55dc-2709-b3ab-d35a719fc8b7	3312	Prebold
00050000-55dc-2709-0785-f0482a3197b3	4205	Preddvor
00050000-55dc-2709-deb9-d0e55a1c937f	6255	Prem
00050000-55dc-2709-2c82-ecefc8804a23	1352	Preserje
00050000-55dc-2709-9328-1f68e6f9b667	6258	Prestranek
00050000-55dc-2709-6098-a85f31298525	2391	Prevalje
00050000-55dc-2709-5b84-62255c074743	3262	Prevorje
00050000-55dc-2709-8e9b-c7ddce24dc8f	1276	Primskovo 
00050000-55dc-2709-984a-0b2d5d8bba50	3253	Pristava pri Mestinju
00050000-55dc-2709-912d-801026771bbe	9207	Prosenjakovci/Partosfalva
00050000-55dc-2709-1449-18179f7679f6	5297	Prvačina
00050000-55dc-2709-e493-20f0e54da1f5	2250	Ptuj
00050000-55dc-2709-ad3c-6861ec1b1b62	2323	Ptujska Gora
00050000-55dc-2709-71eb-97aa718f059e	9201	Puconci
00050000-55dc-2709-c307-dc63d4c76185	2327	Rače
00050000-55dc-2709-4f63-537f54656950	1433	Radeče
00050000-55dc-2709-a396-4a506201d55c	9252	Radenci
00050000-55dc-2709-5864-c19380df5bb9	2360	Radlje ob Dravi
00050000-55dc-2709-1e7f-b6b6c8f7312e	1235	Radomlje
00050000-55dc-2709-bc85-beaa2aeeeced	4240	Radovljica
00050000-55dc-2709-5edc-009cbd49e5f1	8274	Raka
00050000-55dc-2709-97ff-a02bb36eb2c4	1381	Rakek
00050000-55dc-2709-e478-627ef511c877	4283	Rateče - Planica
00050000-55dc-2709-434e-5778d70e4cdc	2390	Ravne na Koroškem
00050000-55dc-2709-3ee2-f412cfdc5afe	9246	Razkrižje
00050000-55dc-2709-4a58-c737b550390c	3332	Rečica ob Savinji
00050000-55dc-2709-4e5b-e98fcb3ab5c5	5292	Renče
00050000-55dc-2709-34d7-a05928e00d4e	1310	Ribnica
00050000-55dc-2709-2853-9ea2b69993b5	2364	Ribnica na Pohorju
00050000-55dc-2709-533e-a0cea577c6bf	3272	Rimske Toplice
00050000-55dc-2709-e906-806b89fabfa1	1314	Rob
00050000-55dc-2709-13c7-185f8b196b9a	5215	Ročinj
00050000-55dc-2709-c02b-27ab6c851a0d	3250	Rogaška Slatina
00050000-55dc-2709-fa8b-9dd33e871186	9262	Rogašovci
00050000-55dc-2709-2d0d-18aba22ff371	3252	Rogatec
00050000-55dc-2709-82b3-0192250cbf1b	1373	Rovte
00050000-55dc-2709-fcb7-1cdff5841aea	2342	Ruše
00050000-55dc-2709-2020-7f6e5d2502f0	1282	Sava
00050000-55dc-2709-eafa-286a29a51f47	6333	Sečovlje/Sicciole
00050000-55dc-2709-dd76-bdfff3c03b21	4227	Selca
00050000-55dc-2709-77f2-eaba391840e0	2352	Selnica ob Dravi
00050000-55dc-2709-757e-becc1f4a5f66	8333	Semič
00050000-55dc-2709-2683-1f49d1aeff85	8281	Senovo
00050000-55dc-2709-1893-df876be38d9b	6224	Senožeče
00050000-55dc-2709-e4ab-f7cc7f263f72	8290	Sevnica
00050000-55dc-2709-fd17-1fb360ba12b9	6210	Sežana
00050000-55dc-2709-1cf1-7b1d432ed0f4	2214	Sladki Vrh
00050000-55dc-2709-f6fa-e763d2e16c7e	5283	Slap ob Idrijci
00050000-55dc-2709-6c04-f8efed18b5ee	2380	Slovenj Gradec
00050000-55dc-2709-e5b4-fb5b9e755218	2310	Slovenska Bistrica
00050000-55dc-2709-c332-9b6e7792d391	3210	Slovenske Konjice
00050000-55dc-2709-ad97-9ed269749c93	1216	Smlednik
00050000-55dc-2709-e7a1-341f854eec11	5232	Soča
00050000-55dc-2709-7f1c-c0e779b233a8	1317	Sodražica
00050000-55dc-2709-1bfa-b1442e7d3314	3335	Solčava
00050000-55dc-2709-da19-1a5c44f5b2da	5250	Solkan
00050000-55dc-2709-53b6-6c3110daa565	4229	Sorica
00050000-55dc-2709-6dde-0795c6143623	4225	Sovodenj
00050000-55dc-2709-ef50-d40d52335745	5281	Spodnja Idrija
00050000-55dc-2709-e133-4c52eaddd600	2241	Spodnji Duplek
00050000-55dc-2709-148b-1b44b35a08e6	9245	Spodnji Ivanjci
00050000-55dc-2709-c584-73bd9d0ff281	2277	Središče ob Dravi
00050000-55dc-2709-88e5-fe46d24c7fab	4267	Srednja vas v Bohinju
00050000-55dc-2709-7336-b39fad3c7b60	8256	Sromlje 
00050000-55dc-2709-7296-d161cbe68096	5224	Srpenica
00050000-55dc-2709-276a-b4055d89d423	1242	Stahovica
00050000-55dc-2709-218f-2f43bdb91663	1332	Stara Cerkev
00050000-55dc-2709-314e-62044d6babab	8342	Stari trg ob Kolpi
00050000-55dc-2709-3ce7-eefa07d8120e	1386	Stari trg pri Ložu
00050000-55dc-2709-e71a-c9b95c90c68f	2205	Starše
00050000-55dc-2709-0558-e53c38059a4e	2289	Stoperce
00050000-55dc-2709-5c9f-461f017511d6	8322	Stopiče
00050000-55dc-2709-c44c-716207848e0c	3206	Stranice
00050000-55dc-2709-bfc4-1f33c50abdf9	8351	Straža
00050000-55dc-2709-b13d-2ab5a36cbb4d	1313	Struge
00050000-55dc-2709-67c2-05365eb28c9b	8293	Studenec
00050000-55dc-2709-4fe3-84d536944d70	8331	Suhor
00050000-55dc-2709-a5e8-2cccf5395aba	2233	Sv. Ana v Slovenskih goricah
00050000-55dc-2709-3a6c-861a65a0430c	2235	Sv. Trojica v Slovenskih goricah
00050000-55dc-2709-745e-b711a9f2934c	2353	Sveti Duh na Ostrem Vrhu
00050000-55dc-2709-9bda-81ec16c48b8c	9244	Sveti Jurij ob Ščavnici
00050000-55dc-2709-404b-fddd057f4ba1	3264	Sveti Štefan
00050000-55dc-2709-15b4-a287ef346fe4	2258	Sveti Tomaž
00050000-55dc-2709-dede-bb8e72f217e7	9204	Šalovci
00050000-55dc-2709-2ce9-9a64ca750421	5261	Šempas
00050000-55dc-2709-aa42-f1583f3d5b7f	5290	Šempeter pri Gorici
00050000-55dc-2709-d0c8-e26e7196489f	3311	Šempeter v Savinjski dolini
00050000-55dc-2709-90de-f2153a11b7f9	4208	Šenčur
00050000-55dc-2709-7a73-e598d1ff6f71	2212	Šentilj v Slovenskih goricah
00050000-55dc-2709-08d4-4a4166a54a46	8297	Šentjanž
00050000-55dc-2709-7b2e-5401038ebab0	2373	Šentjanž pri Dravogradu
00050000-55dc-2709-0d2c-3e33cdea777c	8310	Šentjernej
00050000-55dc-2709-16da-4864c0221d61	3230	Šentjur
00050000-55dc-2709-29b6-430d7352ffdb	3271	Šentrupert
00050000-55dc-2709-57bc-68c4a0d01a27	8232	Šentrupert
00050000-55dc-2709-3e44-308c45716e27	1296	Šentvid pri Stični
00050000-55dc-2709-0107-2026f88289e1	8275	Škocjan
00050000-55dc-2709-cb6a-8327529172ed	6281	Škofije
00050000-55dc-2709-822e-f8dd9a4bb8f5	4220	Škofja Loka
00050000-55dc-2709-6568-6e74f05576d8	3211	Škofja vas
00050000-55dc-2709-6cf4-b7a306e0ed82	1291	Škofljica
00050000-55dc-2709-da49-4d9ea708ed2e	6274	Šmarje
00050000-55dc-2709-7bbd-3073dcf16eb3	1293	Šmarje - Sap
00050000-55dc-2709-915c-162741c3ffb6	3240	Šmarje pri Jelšah
00050000-55dc-2709-e19e-54456ef3c8fb	8220	Šmarješke Toplice
00050000-55dc-2709-6d76-2b19fe80f169	2315	Šmartno na Pohorju
00050000-55dc-2709-67e6-c16b433fb632	3341	Šmartno ob Dreti
00050000-55dc-2709-3a74-3941efb8ed65	3327	Šmartno ob Paki
00050000-55dc-2709-b123-3e5605e66a2b	1275	Šmartno pri Litiji
00050000-55dc-2709-4d12-3669b6bb64a0	2383	Šmartno pri Slovenj Gradcu
00050000-55dc-2709-1831-ee19cb145874	3201	Šmartno v Rožni dolini
00050000-55dc-2709-a10e-de869c475804	3325	Šoštanj
00050000-55dc-2709-47a5-a660124e6763	6222	Štanjel
00050000-55dc-2709-ba9b-2999ad2306c3	3220	Štore
00050000-55dc-2709-cf1a-5907034b2ba5	3304	Tabor
00050000-55dc-2709-bb7b-e4bc1e95efd1	3221	Teharje
00050000-55dc-2709-3a5e-2aa4bd760d22	9251	Tišina
00050000-55dc-2709-5035-265ce6504edb	5220	Tolmin
00050000-55dc-2709-fff4-c90f1f8d117e	3326	Topolšica
00050000-55dc-2709-3250-a83baa9e6f71	2371	Trbonje
00050000-55dc-2709-c0ad-8dfb36172612	1420	Trbovlje
00050000-55dc-2709-b5a7-d887381f4969	8231	Trebelno 
00050000-55dc-2709-ad03-89ae83b57fd6	8210	Trebnje
00050000-55dc-2709-4327-3de6f8c84477	5252	Trnovo pri Gorici
00050000-55dc-2709-b766-b6b7d63efa60	2254	Trnovska vas
00050000-55dc-2709-0cf4-b8a047935c65	1222	Trojane
00050000-55dc-2709-6497-77a2a6c410b7	1236	Trzin
00050000-55dc-2709-bd3b-2f60887175ad	4290	Tržič
00050000-55dc-2709-147b-6b6c8419b9e3	8295	Tržišče
00050000-55dc-2709-9436-accc9e4c674f	1311	Turjak
00050000-55dc-2709-4fe6-57fb8e61c331	9224	Turnišče
00050000-55dc-2709-23c4-46f16a059d08	8323	Uršna sela
00050000-55dc-2709-735b-00bce78b66c1	1252	Vače
00050000-55dc-2709-af21-6a0f65639b48	3320	Velenje 
00050000-55dc-2709-9856-21c19071c4b5	3322	Velenje - poštni predali
00050000-55dc-2709-1a32-3e7964844ade	8212	Velika Loka
00050000-55dc-2709-8d25-b0399180f919	2274	Velika Nedelja
00050000-55dc-2709-9f26-919ca2ed9a80	9225	Velika Polana
00050000-55dc-2709-9674-ea435ada1af9	1315	Velike Lašče
00050000-55dc-2709-a9f3-9916ba3a851b	8213	Veliki Gaber
00050000-55dc-2709-35e6-5aa91037cedc	9241	Veržej
00050000-55dc-2709-21c1-60e0b8feb7bb	1312	Videm - Dobrepolje
00050000-55dc-2709-33d1-6f4959b17328	2284	Videm pri Ptuju
00050000-55dc-2709-389e-571dfd4c4b1e	8344	Vinica
00050000-55dc-2709-b812-2d64220be993	5271	Vipava
00050000-55dc-2709-ba35-42e9b89251ad	4212	Visoko
00050000-55dc-2709-cbf8-122a7ee470aa	1294	Višnja Gora
00050000-55dc-2709-fda9-7e3c02cef420	3205	Vitanje
00050000-55dc-2709-e95d-0df769f4cdc7	2255	Vitomarci
00050000-55dc-2709-d745-badd3a08f78e	1217	Vodice
00050000-55dc-2709-e9de-42fcc5877a72	3212	Vojnik\t
00050000-55dc-2709-a206-5087715e6f16	5293	Volčja Draga
00050000-55dc-2709-44a6-51b351c829f1	2232	Voličina
00050000-55dc-2709-026f-ed42f6d12237	3305	Vransko
00050000-55dc-2709-fa00-be6f775530c7	6217	Vremski Britof
00050000-55dc-2709-e4b5-292474b4c760	1360	Vrhnika
00050000-55dc-2709-cc47-fb8217936577	2365	Vuhred
00050000-55dc-2709-f491-fe4a99258050	2367	Vuzenica
00050000-55dc-2709-e79f-66250a272acd	8292	Zabukovje 
00050000-55dc-2709-55a2-7c59e38f2e55	1410	Zagorje ob Savi
00050000-55dc-2709-7a79-398dc9b50e21	1303	Zagradec
00050000-55dc-2709-ce5d-2973f3ed65b8	2283	Zavrč
00050000-55dc-2709-dab4-5fd5ff0ff177	8272	Zdole 
00050000-55dc-2709-797c-7f6e965e7447	4201	Zgornja Besnica
00050000-55dc-2709-cfd3-82038e70fed4	2242	Zgornja Korena
00050000-55dc-2709-d397-1ca67cb3304b	2201	Zgornja Kungota
00050000-55dc-2709-244e-d3ab5fbb80c0	2316	Zgornja Ložnica
00050000-55dc-2709-ecee-b1d353ab85c2	2314	Zgornja Polskava
00050000-55dc-2709-ec9f-211c20913431	2213	Zgornja Velka
00050000-55dc-2709-893a-2641f6eae028	4247	Zgornje Gorje
00050000-55dc-2709-68c0-88a0d995d756	4206	Zgornje Jezersko
00050000-55dc-2709-561c-050dd0cd5641	2285	Zgornji Leskovec
00050000-55dc-2709-032e-f6ab7b9a2666	1432	Zidani Most
00050000-55dc-2709-de4a-73286c43ee6a	3214	Zreče
00050000-55dc-2709-26cc-3242d4965e41	4209	Žabnica
00050000-55dc-2709-55b8-5b6b824ba849	3310	Žalec
00050000-55dc-2709-5b72-f40e1fee6f71	4228	Železniki
00050000-55dc-2709-0040-0a13cff0aa73	2287	Žetale
00050000-55dc-2709-acee-7a49b03ec56e	4226	Žiri
00050000-55dc-2709-c4f4-47509da0b65b	4274	Žirovnica
00050000-55dc-2709-5f26-ae342711d35d	8360	Žužemberk
\.


--
-- TOC entry 2919 (class 0 OID 15400629)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 15400436)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 15400514)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2921 (class 0 OID 15400641)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2944 (class 0 OID 15400978)
-- Dependencies: 225
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2945 (class 0 OID 15400988)
-- Dependencies: 226
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55dc-270b-8860-b93f93e188e2	00080000-55dc-270b-257a-8ef8b6814a39	0987	AK
00190000-55dc-270b-64e0-4d4553f905ae	00080000-55dc-270b-d821-83a91766e0d8	0989	AK
00190000-55dc-270b-c7b0-1de66bec937a	00080000-55dc-270b-fb1c-1b30762b71fe	0986	AK
00190000-55dc-270b-cd4f-3e980116d1d9	00080000-55dc-270b-b206-f8bd5137fa08	0984	AK
00190000-55dc-270b-238f-2f24f6db4103	00080000-55dc-270b-1a98-27c0d60e054f	0983	AK
00190000-55dc-270b-c742-3f6a3129d6bb	00080000-55dc-270b-5fd7-04ba2588cf00	0982	AK
00190000-55dc-270c-ea16-c28adc5f1781	00080000-55dc-270c-c4da-a969e896e0a5	1001	AK
\.


--
-- TOC entry 2943 (class 0 OID 15400934)
-- Dependencies: 224
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55dc-270b-6180-7fc158c19ff1	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2946 (class 0 OID 15400996)
-- Dependencies: 227
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2925 (class 0 OID 15400670)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55dc-270b-382a-ed408f143248	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55dc-270b-463e-ec024ffaea9e	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55dc-270b-5132-b3920a72bfd7	0003	Kazinska	t	84	Kazinska dvorana
00220000-55dc-270b-ccd2-6133442c1b9b	0004	Mali oder	t	24	Mali oder 
00220000-55dc-270b-c536-361f0951f594	0005	Komorni oder	t	15	Komorni oder
00220000-55dc-270b-8043-73c1caf13339	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55dc-270b-9175-7d70dd6954fc	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2917 (class 0 OID 15400614)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 15400604)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 15400789)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 15400738)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 15400308)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55dc-270c-c4da-a969e896e0a5	00010000-55dc-270a-ad1a-c9eeff560d59	2015-08-25 10:27:56	INS	a:0:{}
2	App\\Entity\\Option	00000000-55dc-270c-1e24-42f9edd1e7b1	00010000-55dc-270a-ad1a-c9eeff560d59	2015-08-25 10:27:56	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55dc-270c-ea16-c28adc5f1781	00010000-55dc-270a-ad1a-c9eeff560d59	2015-08-25 10:27:56	INS	a:0:{}
\.


--
-- TOC entry 2967 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2926 (class 0 OID 15400680)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2894 (class 0 OID 15400346)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55dc-270a-6f5b-f933f0b022d5	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55dc-270a-7810-1bc5d76501c6	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55dc-270a-ffb0-3b24f13938d3	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55dc-270a-5a5a-4a9eef932f62	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55dc-270a-e7a0-9e45e0231475	planer	Planer dogodkov v koledarju	t
00020000-55dc-270a-bcf8-1b360c201ad3	kadrovska	Kadrovska služba	t
00020000-55dc-270a-3c10-f37211aa9ca5	arhivar	Ažuriranje arhivalij	t
00020000-55dc-270a-0066-db0944e09df7	igralec	Igralec	t
00020000-55dc-270a-e94c-37ef54b566f8	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55dc-270b-b376-a6a25f4e5d0a	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2892 (class 0 OID 15400330)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55dc-270a-f94b-e340ed35b154	00020000-55dc-270a-ffb0-3b24f13938d3
00010000-55dc-270a-ad1a-c9eeff560d59	00020000-55dc-270a-ffb0-3b24f13938d3
00010000-55dc-270b-45e4-25dff48046e5	00020000-55dc-270b-b376-a6a25f4e5d0a
\.


--
-- TOC entry 2928 (class 0 OID 15400694)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 15400635)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2914 (class 0 OID 15400581)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 15401037)
-- Dependencies: 232
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55dc-2709-e593-dffba99b3752	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55dc-2709-3d6e-84b5ad762c7c	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55dc-2709-0642-529f2d21713f	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55dc-2709-cfd3-39f1ae489ccf	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55dc-2709-4c4d-5f40124bff97	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2950 (class 0 OID 15401029)
-- Dependencies: 231
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55dc-2709-8063-8ad67e1095dd	00230000-55dc-2709-cfd3-39f1ae489ccf	popa
00240000-55dc-2709-df35-6ba6d3dcc2a2	00230000-55dc-2709-cfd3-39f1ae489ccf	oseba
00240000-55dc-2709-ef8c-ec05bcb59fc8	00230000-55dc-2709-cfd3-39f1ae489ccf	sezona
00240000-55dc-2709-ddd2-96c6f7de7db2	00230000-55dc-2709-3d6e-84b5ad762c7c	prostor
00240000-55dc-2709-3b9c-516e7d791409	00230000-55dc-2709-cfd3-39f1ae489ccf	besedilo
00240000-55dc-2709-0abf-408f931d1350	00230000-55dc-2709-cfd3-39f1ae489ccf	uprizoritev
00240000-55dc-2709-0ed4-e046037a2a7b	00230000-55dc-2709-cfd3-39f1ae489ccf	funkcija
00240000-55dc-2709-c5cb-104895e24991	00230000-55dc-2709-cfd3-39f1ae489ccf	tipfunkcije
00240000-55dc-2709-6b3c-515a1a3b5aee	00230000-55dc-2709-cfd3-39f1ae489ccf	alternacija
00240000-55dc-2709-4a24-75933064c062	00230000-55dc-2709-e593-dffba99b3752	pogodba
00240000-55dc-2709-90a3-cbc0ad655fd6	00230000-55dc-2709-cfd3-39f1ae489ccf	zaposlitev
00240000-55dc-2709-cf3d-b018b32f6ee1	00230000-55dc-2709-e593-dffba99b3752	programdela
00240000-55dc-2709-b68e-d37279f26520	00230000-55dc-2709-cfd3-39f1ae489ccf	zapis
\.


--
-- TOC entry 2949 (class 0 OID 15401024)
-- Dependencies: 230
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
9951240f-f29c-438a-b005-d67d88a2730a	00230000-55dc-2709-cfd3-39f1ae489ccf	0	1001
\.


--
-- TOC entry 2933 (class 0 OID 15400748)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55dc-270b-5258-e766a801e87b	000e0000-55dc-270b-a080-6f4fd1aa19cc	00080000-55dc-270b-b91e-efafe432b9d9	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55dc-270b-9ee8-c5754129bda8	000e0000-55dc-270b-a080-6f4fd1aa19cc	00080000-55dc-270b-b91e-efafe432b9d9	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55dc-270b-562a-5b0e4d0aa45b	000e0000-55dc-270b-a080-6f4fd1aa19cc	00080000-55dc-270b-8712-17136078a502	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2899 (class 0 OID 15400408)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2915 (class 0 OID 15400591)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55dc-270b-7588-e449a3955f5d	00180000-55dc-270b-6f6d-c6d425c76eb5	000c0000-55dc-270b-d7b5-939cb7b3ff89	00090000-55dc-270b-924a-031d3a718a17	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dc-270b-d099-338ec590bcf0	00180000-55dc-270b-6f6d-c6d425c76eb5	000c0000-55dc-270b-eb99-47c273946a4e	00090000-55dc-270b-e775-a8950efa184e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dc-270b-88b5-7078716c54b4	00180000-55dc-270b-6f6d-c6d425c76eb5	000c0000-55dc-270b-0008-9fbfb78eecce	00090000-55dc-270b-d795-90b2ee5714a5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dc-270b-819e-3976041d6585	00180000-55dc-270b-6f6d-c6d425c76eb5	000c0000-55dc-270b-167e-04ff2111c0f1	00090000-55dc-270b-3ebd-d2d38a428e81	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dc-270b-93e3-afb0d0f0f431	00180000-55dc-270b-6f6d-c6d425c76eb5	000c0000-55dc-270b-eb8c-8b8e79446b76	00090000-55dc-270b-bdc1-a17071f09f3f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dc-270b-65d4-e5a410574c99	00180000-55dc-270b-d5e6-7f493c14118f	\N	00090000-55dc-270b-bdc1-a17071f09f3f	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2935 (class 0 OID 15400778)
-- Dependencies: 216
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55dc-2709-3793-85a8221e2476	Avtor	Avtorji	Avtorka	umetnik
000f0000-55dc-2709-665b-9f6945fd51b6	Priredba	Priredba	Priredba	umetnik
000f0000-55dc-2709-24fc-e7a8f530801a	Prevod	Prevod	Prevod	umetnik
000f0000-55dc-2709-efdf-59bc70d99398	Režija	Režija	Režija	umetnik
000f0000-55dc-2709-42b1-5f5b4520a068	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55dc-2709-5362-ec60b3b84283	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55dc-2709-ae70-da5d537cfabc	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55dc-2709-e6b2-0ffba732fb87	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55dc-2709-ab35-7048664a11a8	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55dc-2709-6a5f-82b01c19770c	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55dc-2709-9f51-e5b61c9848a7	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55dc-2709-97e0-87b88842d977	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55dc-2709-116f-d5ecdfbe9c95	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55dc-2709-6a37-9e8ea3fe9858	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55dc-2709-66bf-b238318c4a0a	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55dc-2709-42b3-2fab8ba7610c	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55dc-2709-7640-8bc1aed6292f	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55dc-2709-1963-ad83422ec901	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2947 (class 0 OID 15401006)
-- Dependencies: 228
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55dc-2709-0368-40415dfaf833	01	Velika predstava	f	1.00	1.00
002b0000-55dc-2709-4c3f-7362a526ba79	02	Mala predstava	f	0.50	0.50
002b0000-55dc-2709-0c75-bbffca86e398	03	Mala koprodukcija	t	0.40	1.00
002b0000-55dc-2709-da99-d475828af165	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55dc-2709-0ebd-533a400a665c	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2904 (class 0 OID 15400471)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 15400317)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55dc-270a-ad1a-c9eeff560d59	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO9CWafH8glUWOMHbaH0nc64iDFnYv9rC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55dc-270b-1c26-ea5d710acfe6	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55dc-270b-982d-1c7665276892	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55dc-270b-7792-acb7d0309f1a	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55dc-270b-d2a0-246ad787d3e4	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55dc-270b-2751-01ed8773eecf	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55dc-270b-b91d-2a5842b66fa1	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55dc-270b-a777-18fbe7bdc110	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55dc-270b-5b05-95960d178c33	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55dc-270b-6734-1935ba38c2da	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55dc-270b-45e4-25dff48046e5	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55dc-270a-f94b-e340ed35b154	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2939 (class 0 OID 15400826)
-- Dependencies: 220
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55dc-270b-7cf5-db3ee38b969f	00160000-55dc-270b-63b6-e41805ecbca6	00150000-55dc-2709-49ec-09cdccc0044a	00140000-55dc-2709-c36c-438f486d9c50	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55dc-270b-c536-361f0951f594
000e0000-55dc-270b-a080-6f4fd1aa19cc	00160000-55dc-270b-7848-d2b82396dac3	00150000-55dc-2709-d5c7-712b2e21e222	00140000-55dc-2709-d608-15157f04d6f7	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55dc-270b-8043-73c1caf13339
000e0000-55dc-270b-dfd6-8de5433fe849	\N	00150000-55dc-2709-d5c7-712b2e21e222	00140000-55dc-2709-d608-15157f04d6f7	00190000-55dc-270b-8860-b93f93e188e2	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55dc-270b-c536-361f0951f594
000e0000-55dc-270b-78e8-d5ace2c92f22	\N	00150000-55dc-2709-d5c7-712b2e21e222	00140000-55dc-2709-d608-15157f04d6f7	00190000-55dc-270b-8860-b93f93e188e2	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55dc-270b-c536-361f0951f594
000e0000-55dc-270b-4723-0290ff296a95	\N	00150000-55dc-2709-d5c7-712b2e21e222	00140000-55dc-2709-d608-15157f04d6f7	00190000-55dc-270b-8860-b93f93e188e2	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55dc-270b-382a-ed408f143248
000e0000-55dc-270b-642f-c4b736a20722	\N	00150000-55dc-2709-d5c7-712b2e21e222	00140000-55dc-2709-d608-15157f04d6f7	00190000-55dc-270b-8860-b93f93e188e2	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f		00220000-55dc-270b-382a-ed408f143248
\.


--
-- TOC entry 2909 (class 0 OID 15400533)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55dc-270b-b5b7-17bfa9f00c01	000e0000-55dc-270b-a080-6f4fd1aa19cc	1	
00200000-55dc-270b-3c93-30b9a47ce50a	000e0000-55dc-270b-a080-6f4fd1aa19cc	2	
\.


--
-- TOC entry 2924 (class 0 OID 15400662)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 15401076)
-- Dependencies: 234
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 15401048)
-- Dependencies: 233
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 15401088)
-- Dependencies: 235
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 15400731)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55dc-270b-bcc4-9eb061ea0dbd	00090000-55dc-270b-e775-a8950efa184e	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dc-270b-3141-c9b93929b1d4	00090000-55dc-270b-d795-90b2ee5714a5	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dc-270b-829c-13143810b483	00090000-55dc-270b-c4fd-94ddfaeda288	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dc-270b-ef42-2bd40ad32cdf	00090000-55dc-270b-ef0b-f6109df378f8	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dc-270b-4270-89d0d454c4bc	00090000-55dc-270b-924a-031d3a718a17	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dc-270b-1f75-d2d774c51fe4	00090000-55dc-270b-4f4b-e99b69b6ff44	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2911 (class 0 OID 15400565)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2938 (class 0 OID 15400816)
-- Dependencies: 219
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55dc-2709-c36c-438f486d9c50	01	Drama	drama (SURS 01)
00140000-55dc-2709-3585-60538e92b7a9	02	Opera	opera (SURS 02)
00140000-55dc-2709-4482-7b5052923b9b	03	Balet	balet (SURS 03)
00140000-55dc-2709-c751-350aa0c02206	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55dc-2709-a161-cb8997f6703e	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55dc-2709-d608-15157f04d6f7	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55dc-2709-e56e-136b984ed080	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2930 (class 0 OID 15400721)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55dc-2709-7ab9-86703f8d7789	01	Opera	opera
00150000-55dc-2709-7d42-bfd9d205c734	02	Opereta	opereta
00150000-55dc-2709-753a-4f8e8b56fe17	03	Balet	balet
00150000-55dc-2709-5e22-ac806bda944b	04	Plesne prireditve	plesne prireditve
00150000-55dc-2709-3f0c-63f18f6d2830	05	Lutkovno gledališče	lutkovno gledališče
00150000-55dc-2709-9893-f904ef885f81	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55dc-2709-e76a-b561ac4ecc20	07	Biografska drama	biografska drama
00150000-55dc-2709-49ec-09cdccc0044a	08	Komedija	komedija
00150000-55dc-2709-ac69-e05be614e947	09	Črna komedija	črna komedija
00150000-55dc-2709-91a1-21497e16f033	10	E-igra	E-igra
00150000-55dc-2709-d5c7-712b2e21e222	11	Kriminalka	kriminalka
00150000-55dc-2709-5922-ccc49414245a	12	Musical	musical
\.


--
-- TOC entry 2441 (class 2606 OID 15400371)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 15400873)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 15400863)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 15400777)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 15401128)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 15400555)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 15400580)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 15401022)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 15400497)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 15400928)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 15400717)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 15400531)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 15400574)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 15400511)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 15400627)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 15401105)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 15401112)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2682 (class 2606 OID 15401136)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 15400654)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 15400469)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 15400380)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 15400404)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 15400360)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2432 (class 2606 OID 15400345)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 15400660)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 15400693)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 15400811)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 15400433)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 15400457)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 15400633)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 15400447)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 15400518)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 15400645)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 15400985)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 15400993)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 15400976)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 15401004)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 15400677)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 15400618)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 15400609)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 15400799)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 15400745)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 15400316)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 15400684)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 15400334)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2434 (class 2606 OID 15400354)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 15400702)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 15400640)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 15400589)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 15401046)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 15401034)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 15401028)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 15400758)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 15400413)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 15400600)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 15400788)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 15401016)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 15400482)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 15400329)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 15400842)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 15400540)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 15400668)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 15401086)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 15401070)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 15401094)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 15400736)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 15400569)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 15400824)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 15400729)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 1259 OID 15400562)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2582 (class 1259 OID 15400759)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2583 (class 1259 OID 15400760)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2668 (class 1259 OID 15401107)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2669 (class 1259 OID 15401106)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2455 (class 1259 OID 15400435)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2547 (class 1259 OID 15400661)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2655 (class 1259 OID 15401074)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2656 (class 1259 OID 15401073)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2657 (class 1259 OID 15401075)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2658 (class 1259 OID 15401072)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2659 (class 1259 OID 15401071)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2541 (class 1259 OID 15400647)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2542 (class 1259 OID 15400646)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2492 (class 1259 OID 15400541)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 15400718)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2570 (class 1259 OID 15400720)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2571 (class 1259 OID 15400719)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2480 (class 1259 OID 15400513)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2481 (class 1259 OID 15400512)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2638 (class 1259 OID 15401005)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2592 (class 1259 OID 15400813)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2593 (class 1259 OID 15400814)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2594 (class 1259 OID 15400815)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2665 (class 1259 OID 15401095)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2601 (class 1259 OID 15400847)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2602 (class 1259 OID 15400844)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2603 (class 1259 OID 15400848)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2604 (class 1259 OID 15400846)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2605 (class 1259 OID 15400845)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2470 (class 1259 OID 15400484)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2471 (class 1259 OID 15400483)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2446 (class 1259 OID 15400407)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2557 (class 1259 OID 15400685)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2510 (class 1259 OID 15400575)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2436 (class 1259 OID 15400361)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2437 (class 1259 OID 15400362)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2562 (class 1259 OID 15400705)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2563 (class 1259 OID 15400704)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2564 (class 1259 OID 15400703)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2484 (class 1259 OID 15400519)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2485 (class 1259 OID 15400521)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2486 (class 1259 OID 15400520)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2648 (class 1259 OID 15401036)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2521 (class 1259 OID 15400613)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2522 (class 1259 OID 15400611)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2523 (class 1259 OID 15400610)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2524 (class 1259 OID 15400612)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2427 (class 1259 OID 15400335)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 15400336)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2550 (class 1259 OID 15400669)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2678 (class 1259 OID 15401129)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2679 (class 1259 OID 15401137)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2680 (class 1259 OID 15401138)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2536 (class 1259 OID 15400634)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2578 (class 1259 OID 15400746)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2579 (class 1259 OID 15400747)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2622 (class 1259 OID 15400933)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2623 (class 1259 OID 15400932)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2624 (class 1259 OID 15400929)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2625 (class 1259 OID 15400930)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2626 (class 1259 OID 15400931)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2459 (class 1259 OID 15400449)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2460 (class 1259 OID 15400448)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2461 (class 1259 OID 15400450)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2630 (class 1259 OID 15400986)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2631 (class 1259 OID 15400987)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2615 (class 1259 OID 15400877)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2616 (class 1259 OID 15400878)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2617 (class 1259 OID 15400875)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2618 (class 1259 OID 15400876)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2575 (class 1259 OID 15400737)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2527 (class 1259 OID 15400622)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2528 (class 1259 OID 15400621)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2529 (class 1259 OID 15400619)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2530 (class 1259 OID 15400620)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2611 (class 1259 OID 15400865)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2612 (class 1259 OID 15400864)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2627 (class 1259 OID 15400977)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2491 (class 1259 OID 15400532)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2645 (class 1259 OID 15401023)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2672 (class 1259 OID 15401113)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2673 (class 1259 OID 15401114)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2442 (class 1259 OID 15400382)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2443 (class 1259 OID 15400381)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2451 (class 1259 OID 15400414)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2452 (class 1259 OID 15400415)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2516 (class 1259 OID 15400603)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2517 (class 1259 OID 15400602)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2518 (class 1259 OID 15400601)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2498 (class 1259 OID 15400564)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2499 (class 1259 OID 15400560)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2500 (class 1259 OID 15400557)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2501 (class 1259 OID 15400558)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2502 (class 1259 OID 15400556)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2503 (class 1259 OID 15400561)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2504 (class 1259 OID 15400559)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2458 (class 1259 OID 15400434)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 15400498)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2477 (class 1259 OID 15400500)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2478 (class 1259 OID 15400499)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2479 (class 1259 OID 15400501)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2535 (class 1259 OID 15400628)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 15400812)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2606 (class 1259 OID 15400843)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2449 (class 1259 OID 15400405)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2450 (class 1259 OID 15400406)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2572 (class 1259 OID 15400730)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2654 (class 1259 OID 15401047)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 15400470)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2651 (class 1259 OID 15401035)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2555 (class 1259 OID 15400679)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2556 (class 1259 OID 15400678)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2619 (class 1259 OID 15400874)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2466 (class 1259 OID 15400458)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 15400825)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2662 (class 1259 OID 15401087)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2636 (class 1259 OID 15400994)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 15400995)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2515 (class 1259 OID 15400590)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2435 (class 1259 OID 15400355)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2505 (class 1259 OID 15400563)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2708 (class 2606 OID 15401274)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2711 (class 2606 OID 15401259)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2710 (class 2606 OID 15401264)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2706 (class 2606 OID 15401284)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2712 (class 2606 OID 15401254)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2707 (class 2606 OID 15401279)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2709 (class 2606 OID 15401269)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2742 (class 2606 OID 15401429)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2741 (class 2606 OID 15401434)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2775 (class 2606 OID 15401604)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2776 (class 2606 OID 15401599)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2693 (class 2606 OID 15401189)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2729 (class 2606 OID 15401369)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2770 (class 2606 OID 15401584)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2771 (class 2606 OID 15401579)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2769 (class 2606 OID 15401589)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2772 (class 2606 OID 15401574)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2773 (class 2606 OID 15401569)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2727 (class 2606 OID 15401364)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2728 (class 2606 OID 15401359)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2705 (class 2606 OID 15401249)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2737 (class 2606 OID 15401399)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2735 (class 2606 OID 15401409)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2736 (class 2606 OID 15401404)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2699 (class 2606 OID 15401224)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2700 (class 2606 OID 15401219)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2725 (class 2606 OID 15401349)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2766 (class 2606 OID 15401554)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2745 (class 2606 OID 15401439)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2744 (class 2606 OID 15401444)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2743 (class 2606 OID 15401449)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2774 (class 2606 OID 15401594)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2747 (class 2606 OID 15401469)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2750 (class 2606 OID 15401454)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2746 (class 2606 OID 15401474)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2748 (class 2606 OID 15401464)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2749 (class 2606 OID 15401459)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2697 (class 2606 OID 15401214)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2698 (class 2606 OID 15401209)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2689 (class 2606 OID 15401174)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2690 (class 2606 OID 15401169)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2731 (class 2606 OID 15401379)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2713 (class 2606 OID 15401289)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2686 (class 2606 OID 15401149)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2685 (class 2606 OID 15401154)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2732 (class 2606 OID 15401394)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2733 (class 2606 OID 15401389)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2734 (class 2606 OID 15401384)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2703 (class 2606 OID 15401229)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2701 (class 2606 OID 15401239)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2702 (class 2606 OID 15401234)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2768 (class 2606 OID 15401564)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2717 (class 2606 OID 15401324)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2719 (class 2606 OID 15401314)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2720 (class 2606 OID 15401309)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2718 (class 2606 OID 15401319)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2684 (class 2606 OID 15401139)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2683 (class 2606 OID 15401144)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2730 (class 2606 OID 15401374)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2779 (class 2606 OID 15401619)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2781 (class 2606 OID 15401624)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2780 (class 2606 OID 15401629)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2726 (class 2606 OID 15401354)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2740 (class 2606 OID 15401419)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2739 (class 2606 OID 15401424)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2757 (class 2606 OID 15401529)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2758 (class 2606 OID 15401524)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2761 (class 2606 OID 15401509)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2760 (class 2606 OID 15401514)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2759 (class 2606 OID 15401519)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2695 (class 2606 OID 15401199)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2696 (class 2606 OID 15401194)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2694 (class 2606 OID 15401204)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2764 (class 2606 OID 15401539)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2763 (class 2606 OID 15401544)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2754 (class 2606 OID 15401499)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2753 (class 2606 OID 15401504)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2756 (class 2606 OID 15401489)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2755 (class 2606 OID 15401494)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2738 (class 2606 OID 15401414)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2721 (class 2606 OID 15401344)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2722 (class 2606 OID 15401339)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2724 (class 2606 OID 15401329)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2723 (class 2606 OID 15401334)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2751 (class 2606 OID 15401484)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2752 (class 2606 OID 15401479)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2762 (class 2606 OID 15401534)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2704 (class 2606 OID 15401244)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2765 (class 2606 OID 15401549)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2767 (class 2606 OID 15401559)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2778 (class 2606 OID 15401609)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2777 (class 2606 OID 15401614)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2687 (class 2606 OID 15401164)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2688 (class 2606 OID 15401159)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2692 (class 2606 OID 15401179)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2691 (class 2606 OID 15401184)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2714 (class 2606 OID 15401304)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2715 (class 2606 OID 15401299)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2716 (class 2606 OID 15401294)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-25 10:27:57 CEST

--
-- PostgreSQL database dump complete
--

