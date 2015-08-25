--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-25 11:45:36 CEST

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
-- TOC entry 177 (class 1259 OID 15483180)
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
-- TOC entry 222 (class 1259 OID 15483682)
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
-- TOC entry 221 (class 1259 OID 15483665)
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
-- TOC entry 215 (class 1259 OID 15483577)
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
-- TOC entry 238 (class 1259 OID 15483931)
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
-- TOC entry 191 (class 1259 OID 15483358)
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
-- TOC entry 194 (class 1259 OID 15483392)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 15483833)
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
-- TOC entry 186 (class 1259 OID 15483301)
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
-- TOC entry 223 (class 1259 OID 15483695)
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
-- TOC entry 210 (class 1259 OID 15483522)
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
-- TOC entry 189 (class 1259 OID 15483338)
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
-- TOC entry 193 (class 1259 OID 15483386)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 15483318)
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
-- TOC entry 199 (class 1259 OID 15483439)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 236 (class 1259 OID 15483912)
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
-- TOC entry 237 (class 1259 OID 15483924)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 15483946)
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
-- TOC entry 203 (class 1259 OID 15483464)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 15483275)
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
-- TOC entry 178 (class 1259 OID 15483189)
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
-- TOC entry 179 (class 1259 OID 15483200)
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
-- TOC entry 174 (class 1259 OID 15483154)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 15483173)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 15483471)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 15483502)
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
-- TOC entry 218 (class 1259 OID 15483616)
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
-- TOC entry 181 (class 1259 OID 15483233)
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
-- TOC entry 183 (class 1259 OID 15483267)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 15483445)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 15483252)
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
-- TOC entry 188 (class 1259 OID 15483330)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 15483457)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 15483794)
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
-- TOC entry 226 (class 1259 OID 15483804)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 224 (class 1259 OID 15483750)
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
-- TOC entry 227 (class 1259 OID 15483812)
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
-- TOC entry 206 (class 1259 OID 15483486)
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
-- TOC entry 198 (class 1259 OID 15483430)
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
-- TOC entry 197 (class 1259 OID 15483420)
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
-- TOC entry 217 (class 1259 OID 15483605)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 15483554)
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
-- TOC entry 171 (class 1259 OID 15483125)
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
-- TOC entry 170 (class 1259 OID 15483123)
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
-- TOC entry 207 (class 1259 OID 15483496)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 15483163)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 15483147)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 15483510)
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
-- TOC entry 201 (class 1259 OID 15483451)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 15483397)
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
-- TOC entry 232 (class 1259 OID 15483853)
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
-- TOC entry 231 (class 1259 OID 15483845)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 15483840)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 15483564)
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
-- TOC entry 180 (class 1259 OID 15483225)
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
-- TOC entry 196 (class 1259 OID 15483407)
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
-- TOC entry 216 (class 1259 OID 15483594)
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
-- TOC entry 228 (class 1259 OID 15483822)
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
-- TOC entry 185 (class 1259 OID 15483287)
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
-- TOC entry 172 (class 1259 OID 15483134)
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
-- TOC entry 220 (class 1259 OID 15483642)
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
-- TOC entry 190 (class 1259 OID 15483349)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 15483478)
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
-- TOC entry 234 (class 1259 OID 15483892)
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
-- TOC entry 233 (class 1259 OID 15483864)
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
-- TOC entry 235 (class 1259 OID 15483904)
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
-- TOC entry 212 (class 1259 OID 15483547)
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
-- TOC entry 192 (class 1259 OID 15483381)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 15483632)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 15483537)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2170 (class 2604 OID 15483128)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2895 (class 0 OID 15483180)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 15483682)
-- Dependencies: 222
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55dc-393e-b934-43c16d039301	000d0000-55dc-393e-8a79-3f35311a468f	\N	00090000-55dc-393e-7283-a98881d18072	000b0000-55dc-393e-5032-7ccb0853234c	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55dc-393e-3ef7-9e03b3bfcbb2	000d0000-55dc-393e-c226-525a542a6acd	00100000-55dc-393e-8c25-b978e4378907	00090000-55dc-393e-2f16-b1a96cddddc3	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55dc-393e-1be8-1a6c5a61b349	000d0000-55dc-393e-2b50-69e8fe6b2b82	00100000-55dc-393e-4fa0-ae6d1d6953b1	00090000-55dc-393e-2c2a-5a1487575e98	\N	0003	t	\N	2015-08-25	\N	2	\N	\N	f	f
000c0000-55dc-393e-6604-fe8bc1cb97e2	000d0000-55dc-393e-0cac-daa1b7af4354	\N	00090000-55dc-393e-19df-926a146ea070	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55dc-393e-11be-4ec8bc185b3f	000d0000-55dc-393e-ab3e-7dd4ac6398e6	\N	00090000-55dc-393e-0c07-167c549d5c2b	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55dc-393e-01b0-890cea6181c3	000d0000-55dc-393e-9b2c-8740afb66eeb	\N	00090000-55dc-393e-414a-2e80fc219275	000b0000-55dc-393e-3034-01c9fcf191bb	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55dc-393e-d934-043ec4316465	000d0000-55dc-393e-a683-ff1bb3a4a557	00100000-55dc-393e-f777-aafae6f7afb6	00090000-55dc-393e-abcf-0f9b0b7f2705	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55dc-393e-e02d-18fec49a3f13	000d0000-55dc-393e-7fae-6d732d55846e	\N	00090000-55dc-393e-d734-2c68a23314db	000b0000-55dc-393e-7a05-6248ccfcf165	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55dc-393e-abeb-dfb9635c944d	000d0000-55dc-393e-a683-ff1bb3a4a557	00100000-55dc-393e-378b-7fd6bb87bd38	00090000-55dc-393e-17c4-15b1cbec5f82	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55dc-393e-6223-8b66c7901a20	000d0000-55dc-393e-a683-ff1bb3a4a557	00100000-55dc-393e-2439-71e873ffbf28	00090000-55dc-393e-3b57-0f422bad5b92	\N	0010	t	\N	2015-08-25	\N	16	\N	\N	f	t
000c0000-55dc-393e-8c8c-8d08dea90744	000d0000-55dc-393e-a683-ff1bb3a4a557	00100000-55dc-393e-ed4b-9c2c65058fce	00090000-55dc-393e-d381-d2e29aee8136	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2939 (class 0 OID 15483665)
-- Dependencies: 221
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 15483577)
-- Dependencies: 215
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55dc-393e-83f1-1edaf44c28c1	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55dc-393e-e9ae-699688ed5675	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55dc-393e-b4fa-11f5518553d9	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2956 (class 0 OID 15483931)
-- Dependencies: 238
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 15483358)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55dc-393e-275f-c8edf7020d07	\N	\N	00200000-55dc-393e-8af8-7ca0c554c88b	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55dc-393e-2dbe-8d87ddc2989c	\N	\N	00200000-55dc-393e-00d9-cc94541e6ab6	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55dc-393e-f534-f1e651bdc6c4	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55dc-393e-05f0-222094e5ff37	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55dc-393e-0bdb-ebb3131f5db1	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2912 (class 0 OID 15483392)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 15483833)
-- Dependencies: 229
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 15483301)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55dc-393d-2cf7-3c0b596c44d8	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55dc-393d-ee9b-a9181e4df486	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55dc-393d-c2e1-e0683675420f	AL	ALB	008	Albania 	Albanija	\N
00040000-55dc-393d-4863-44e2b693b55e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55dc-393d-6bf8-480323f2b4cc	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55dc-393d-5bd5-0fee9f28fe79	AD	AND	020	Andorra 	Andora	\N
00040000-55dc-393d-9d7b-9cc712944a6a	AO	AGO	024	Angola 	Angola	\N
00040000-55dc-393d-b878-793722ac4771	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55dc-393d-d827-c2f06211ef94	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55dc-393d-16f6-0dab20f2472c	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55dc-393d-4c2c-4202d98b700f	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55dc-393d-ff4c-87c7679a25eb	AM	ARM	051	Armenia 	Armenija	\N
00040000-55dc-393d-66af-b218ccdcfe90	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55dc-393d-4568-83256e157a8c	AU	AUS	036	Australia 	Avstralija	\N
00040000-55dc-393d-166e-2c47ec96ee89	AT	AUT	040	Austria 	Avstrija	\N
00040000-55dc-393d-39f7-4d450e338911	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55dc-393d-33f9-9b7261fb40fc	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55dc-393d-82f8-2d21f5fb5668	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55dc-393d-6baf-0bb11788e961	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55dc-393d-ff41-a912eee12601	BB	BRB	052	Barbados 	Barbados	\N
00040000-55dc-393d-34ac-2783e70ec7ca	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55dc-393d-063a-3831416dabde	BE	BEL	056	Belgium 	Belgija	\N
00040000-55dc-393d-d87a-bef4bbfdf651	BZ	BLZ	084	Belize 	Belize	\N
00040000-55dc-393d-cce9-da3032e157f1	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55dc-393d-69e6-174d2e0d0e48	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55dc-393d-2499-82afc9c7f842	BT	BTN	064	Bhutan 	Butan	\N
00040000-55dc-393d-8040-70c2c8576a52	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55dc-393d-c2e2-b8a9338f6c6d	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55dc-393d-e031-4861fd283563	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55dc-393d-7819-0f49d0785221	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55dc-393d-e853-c7eef1fdbf2d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55dc-393d-c6a1-b978d42281ae	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55dc-393d-b6df-ea5d0d33a0f4	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55dc-393d-a00b-f1b1f4c7fd0d	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55dc-393d-ef3d-8e87109ffe8f	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55dc-393d-7f5d-9d0a66db7075	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55dc-393d-ebd7-54491527e147	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55dc-393d-d4e7-d27fe92e3c58	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55dc-393d-8b2c-eb274586894a	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55dc-393d-e0fc-1190a3286a65	CA	CAN	124	Canada 	Kanada	\N
00040000-55dc-393d-2526-c922f786bde0	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55dc-393d-0bb9-840c6e75082b	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55dc-393d-c670-9abaf0e17dcb	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55dc-393d-7e75-b1d319e85d39	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55dc-393d-e062-648ad6970219	CL	CHL	152	Chile 	Čile	\N
00040000-55dc-393d-92b4-5d3a909d676f	CN	CHN	156	China 	Kitajska	\N
00040000-55dc-393d-f954-24807fe79c9b	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55dc-393d-e3c1-0490e2b9f1b5	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55dc-393d-398b-7ce20087507b	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55dc-393d-6369-c48086ec8f1b	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55dc-393d-eeae-6cd124c893b0	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55dc-393d-c65b-cd3cabec6992	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55dc-393d-89cf-77f0d1d51d83	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55dc-393d-87b1-0b07d8cfbd5c	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55dc-393d-7b21-4801685af74d	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55dc-393d-259c-fa6fd36c1872	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55dc-393d-f4e2-a88ddeb504c5	CU	CUB	192	Cuba 	Kuba	\N
00040000-55dc-393d-e98c-b08f337c9a9d	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55dc-393d-6cf9-ab7374a67ffd	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55dc-393d-767b-71dd50667046	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55dc-393d-20f3-6993f044ad35	DK	DNK	208	Denmark 	Danska	\N
00040000-55dc-393d-3b70-7233df6ba486	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55dc-393d-9b03-72f8e331605f	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55dc-393d-922b-827ed0b67318	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55dc-393d-a0db-8b7e7ef078f9	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55dc-393d-5d4c-a68fda560b8a	EG	EGY	818	Egypt 	Egipt	\N
00040000-55dc-393d-97a6-867b4ea27318	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55dc-393d-e8b0-15aa34f79190	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55dc-393d-c4f6-42feeb049d17	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55dc-393d-2c8c-ad3ec620dddf	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55dc-393d-574f-87ca56cabea2	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55dc-393d-8a75-1e7e375bafcb	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55dc-393d-61d7-414a24109901	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55dc-393d-aef9-70400e808324	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55dc-393d-da1d-d3b5552a2d27	FI	FIN	246	Finland 	Finska	\N
00040000-55dc-393d-b38d-83812c09ac53	FR	FRA	250	France 	Francija	\N
00040000-55dc-393d-01bf-9580263bd203	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55dc-393d-39be-d3b66e20f939	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55dc-393d-70e3-dd79f3f12a90	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55dc-393d-7037-0dd4124be369	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55dc-393d-dc01-74eda767645d	GA	GAB	266	Gabon 	Gabon	\N
00040000-55dc-393d-1293-08ce22cf5920	GM	GMB	270	Gambia 	Gambija	\N
00040000-55dc-393d-c76b-22a300c301f1	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55dc-393d-9364-92a1a32a9c4c	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55dc-393d-1ce7-702dc97392b8	GH	GHA	288	Ghana 	Gana	\N
00040000-55dc-393d-2429-3e2ca1b542af	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55dc-393d-9615-10be0e088f1a	GR	GRC	300	Greece 	Grčija	\N
00040000-55dc-393d-3231-ed1ea1b04d6f	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55dc-393d-48e3-21ce16bed4f2	GD	GRD	308	Grenada 	Grenada	\N
00040000-55dc-393d-62e3-d1ae68a41365	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55dc-393d-d1a7-cc43f030654e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55dc-393d-1de9-43aa2e564c4c	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55dc-393d-9361-249dbe02ce98	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55dc-393d-ab37-9065a5d92a4e	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55dc-393d-d8b5-a235ae7c2efa	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55dc-393d-c7da-6b71f484ee88	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55dc-393d-af83-3d96c35ba289	HT	HTI	332	Haiti 	Haiti	\N
00040000-55dc-393d-aad2-43668060ee83	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55dc-393d-9bfc-bc064bf7ccda	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55dc-393d-7df6-de7dab28c85c	HN	HND	340	Honduras 	Honduras	\N
00040000-55dc-393d-5c91-de1c2e159d8c	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55dc-393d-4131-bf360f0f5f51	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55dc-393d-b900-5c8a46bc6446	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55dc-393d-9607-8c02ef59941c	IN	IND	356	India 	Indija	\N
00040000-55dc-393d-c2ef-01b2f1a6be12	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55dc-393d-e913-88d992e1a28b	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55dc-393d-effc-ad5d54dae680	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55dc-393d-f3da-72f3c2858b6b	IE	IRL	372	Ireland 	Irska	\N
00040000-55dc-393d-4dec-4d9b002dcacc	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55dc-393d-b8f2-0031bd36ff76	IL	ISR	376	Israel 	Izrael	\N
00040000-55dc-393d-3bfc-27f02b4c12f6	IT	ITA	380	Italy 	Italija	\N
00040000-55dc-393d-41ac-41ca90c1fa0e	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55dc-393d-c53b-d357e0e96375	JP	JPN	392	Japan 	Japonska	\N
00040000-55dc-393d-195c-f4e1c26f13fb	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55dc-393d-27ae-600c3ef72a11	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55dc-393d-be98-1107cadaedad	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55dc-393d-231d-ee1c86e095dc	KE	KEN	404	Kenya 	Kenija	\N
00040000-55dc-393d-098c-e46e3d3f572a	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55dc-393d-93fa-1f46d5a0550d	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55dc-393d-517d-01892978ad0b	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55dc-393d-488d-2205d15edfeb	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55dc-393d-9692-14813dcab591	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55dc-393d-0fa5-e7526354ad86	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55dc-393d-0201-f1d0b36bffc3	LV	LVA	428	Latvia 	Latvija	\N
00040000-55dc-393d-94c3-4636045ea5a6	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55dc-393d-a769-7cc62989530d	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55dc-393d-7fee-5acb6d7dc50f	LR	LBR	430	Liberia 	Liberija	\N
00040000-55dc-393d-42d4-5ca067fc472c	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55dc-393d-5680-3bb82cd2f11f	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55dc-393d-ddba-c4ce898ee629	LT	LTU	440	Lithuania 	Litva	\N
00040000-55dc-393d-389a-306774a2d072	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55dc-393d-21e4-070f3d4c7cdb	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55dc-393d-7c41-3c41ff8b57ae	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55dc-393d-39e7-2a8a7e1e476e	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55dc-393d-abb0-8de940e4afe0	MW	MWI	454	Malawi 	Malavi	\N
00040000-55dc-393d-e332-601e7c362dea	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55dc-393d-2388-beb0933035d1	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55dc-393d-4201-9af8918ceca7	ML	MLI	466	Mali 	Mali	\N
00040000-55dc-393d-3991-cac43f436503	MT	MLT	470	Malta 	Malta	\N
00040000-55dc-393d-a53b-0ecab78aa605	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55dc-393d-77ca-14fabc04b348	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55dc-393d-de6a-3f792c56cc45	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55dc-393d-d40b-3c411a3c6c41	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55dc-393d-1b1f-7f783214c137	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55dc-393d-3346-eb9a9e6eee01	MX	MEX	484	Mexico 	Mehika	\N
00040000-55dc-393d-0954-1d6b379aead6	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55dc-393d-aa3a-2bf03c6ac886	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55dc-393d-5a27-4de1787c5e5c	MC	MCO	492	Monaco 	Monako	\N
00040000-55dc-393d-39b3-0200c435657d	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55dc-393d-1266-9d415ecc9561	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55dc-393d-35ef-ec7f497c620f	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55dc-393d-ea4d-d0f0ec89cfe0	MA	MAR	504	Morocco 	Maroko	\N
00040000-55dc-393d-c382-e774c6df8be0	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55dc-393d-57c0-34d49d0808a9	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55dc-393d-91ef-4a7d918e89e5	NA	NAM	516	Namibia 	Namibija	\N
00040000-55dc-393d-543b-cfa02890b0ac	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55dc-393d-caec-090c44967a87	NP	NPL	524	Nepal 	Nepal	\N
00040000-55dc-393d-e9a1-2f13cd4c96a6	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55dc-393d-0a62-ba88eb1ad81e	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55dc-393d-adba-7614b5212328	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55dc-393d-b4f6-e56f5fe01e34	NE	NER	562	Niger 	Niger 	\N
00040000-55dc-393d-7ffb-fec2ca17d6c0	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55dc-393d-a016-3d2220505fe6	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55dc-393d-b912-925e2e3997b4	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55dc-393d-4b87-92cbd3a57daf	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55dc-393d-cea1-3925c1178891	NO	NOR	578	Norway 	Norveška	\N
00040000-55dc-393d-c069-ac78ea9fb60e	OM	OMN	512	Oman 	Oman	\N
00040000-55dc-393d-ece2-b9bfee09dc46	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55dc-393d-cc76-c98fec1e9b5e	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55dc-393d-d76c-a889169e6ed5	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55dc-393d-6989-50db858cb7b5	PA	PAN	591	Panama 	Panama	\N
00040000-55dc-393d-b0ab-05a9d1811b7f	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55dc-393d-8bf4-ba3a3ae60a63	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55dc-393d-9958-f288f7a2ea1d	PE	PER	604	Peru 	Peru	\N
00040000-55dc-393d-483b-8cd381e0bd6a	PH	PHL	608	Philippines 	Filipini	\N
00040000-55dc-393d-8805-80852caf384f	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55dc-393d-483a-031e29185446	PL	POL	616	Poland 	Poljska	\N
00040000-55dc-393d-447c-858175360dee	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55dc-393d-7d1d-7e6294c3f059	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55dc-393d-1991-6d8d7c510daf	QA	QAT	634	Qatar 	Katar	\N
00040000-55dc-393d-5c45-449d20a18abd	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55dc-393d-1e04-8d66d9398307	RO	ROU	642	Romania 	Romunija	\N
00040000-55dc-393d-037c-07361f3e47a9	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55dc-393d-dbe9-f5de18ad0b36	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55dc-393d-e99e-5a394acae2a3	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55dc-393d-1c4b-7215ded368ad	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55dc-393d-7e7b-6b51c5999a0f	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55dc-393d-498b-d79a71c2b107	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55dc-393d-e153-72ca95057919	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55dc-393d-af93-e41474fe9ec3	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55dc-393d-bbc9-4f9e330998ce	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55dc-393d-fd30-008ce1235a9b	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55dc-393d-e6ff-ab887c373472	SM	SMR	674	San Marino 	San Marino	\N
00040000-55dc-393d-052b-c3bb50f4963d	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55dc-393d-c898-0e9b2707556e	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55dc-393d-9a6a-7693517a1844	SN	SEN	686	Senegal 	Senegal	\N
00040000-55dc-393d-4b9c-f37ad2c1646a	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55dc-393d-2ce2-d8db33a237b9	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55dc-393d-94e4-024f3721aa7a	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55dc-393d-a2a0-9aa0ee8a363f	SG	SGP	702	Singapore 	Singapur	\N
00040000-55dc-393d-e755-ffe3f7db3a98	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55dc-393d-9fc5-d750bc4be179	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55dc-393d-44e6-8a5cbcda7499	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55dc-393d-8a5d-b300cea36c9a	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55dc-393d-f422-bbbdaf3a6fb0	SO	SOM	706	Somalia 	Somalija	\N
00040000-55dc-393d-0044-114267be537e	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55dc-393d-d38a-7e8bd4169094	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55dc-393d-19fb-5f4ed5281e5b	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55dc-393d-2133-46f040974962	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55dc-393d-3064-7453e74ee6b4	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55dc-393d-841b-ac9e6531a8b3	SD	SDN	729	Sudan 	Sudan	\N
00040000-55dc-393d-4ff2-4ca73f027f72	SR	SUR	740	Suriname 	Surinam	\N
00040000-55dc-393d-effd-562820c333b4	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55dc-393d-b534-130044be7d83	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55dc-393d-4663-4127d956c77b	SE	SWE	752	Sweden 	Švedska	\N
00040000-55dc-393d-b57d-d5d3a64ba05f	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55dc-393d-e4e5-20fc4b554d89	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55dc-393d-90a1-bea89b798718	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55dc-393d-3f81-2f391857c393	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55dc-393d-5093-7ab07dad89e2	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55dc-393d-bae6-6e27022f5f74	TH	THA	764	Thailand 	Tajska	\N
00040000-55dc-393d-eb12-66a3aee46b4d	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55dc-393d-6bb2-87dc844a50c8	TG	TGO	768	Togo 	Togo	\N
00040000-55dc-393d-7b1b-f43d7bec3740	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55dc-393d-0de4-c60ea09aef18	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55dc-393d-8c3b-7f6e9a09758f	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55dc-393d-77b4-bd5445451bea	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55dc-393d-ce5e-e23ccde013ab	TR	TUR	792	Turkey 	Turčija	\N
00040000-55dc-393d-ef93-8bcc08b8fe9d	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55dc-393d-4bb4-6fbddea97116	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55dc-393d-769b-40a8e4fdfe05	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55dc-393d-ed15-b30f6fe4a2e3	UG	UGA	800	Uganda 	Uganda	\N
00040000-55dc-393d-2ce5-14bebadc94fa	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55dc-393d-bcce-2dc93d64b7a9	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55dc-393d-4701-214fe035f381	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55dc-393d-2521-c7ea5ddb8da6	US	USA	840	United States 	Združene države Amerike	\N
00040000-55dc-393d-cd8d-2a9130c18b64	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55dc-393d-dd52-1746229c6614	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55dc-393d-7953-fc194b32049d	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55dc-393d-8705-4a35e4a62f52	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55dc-393d-0140-712f7e375f0b	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55dc-393d-0042-807cf0021d0a	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55dc-393d-b293-daf6ab346638	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55dc-393d-315c-f3c6cbe7f00e	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55dc-393d-a01b-9d1636a923d4	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55dc-393d-6ec2-ffa86724b067	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55dc-393d-48a9-287395142ab0	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55dc-393d-287d-71433971456d	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55dc-393d-57f8-6279621a8b61	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2941 (class 0 OID 15483695)
-- Dependencies: 223
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55dc-393e-23b8-79920e50a99e	000e0000-55dc-393e-8378-5ee89082bcae	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55dc-393d-e64d-426c65718018	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55dc-393e-dfe7-214b7d8f6045	000e0000-55dc-393e-5252-7474630bb73c	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55dc-393d-0412-5783b9e83e8b	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55dc-393e-2c97-6ea0de84ab91	000e0000-55dc-393e-99e1-c689205d4cf4	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55dc-393d-e64d-426c65718018	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55dc-393e-ef20-a0c479f5b1ee	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55dc-393e-4fc1-144cd68a6f85	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2928 (class 0 OID 15483522)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55dc-393e-a683-ff1bb3a4a557	000e0000-55dc-393e-5252-7474630bb73c	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55dc-393d-8e78-31715077268b
000d0000-55dc-393e-8a79-3f35311a468f	000e0000-55dc-393e-5252-7474630bb73c	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55dc-393d-8e78-31715077268b
000d0000-55dc-393e-c226-525a542a6acd	000e0000-55dc-393e-5252-7474630bb73c	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55dc-393d-abda-691dcfee4fa9
000d0000-55dc-393e-2b50-69e8fe6b2b82	000e0000-55dc-393e-5252-7474630bb73c	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55dc-393d-c6c4-ac17ce94ba14
000d0000-55dc-393e-0cac-daa1b7af4354	000e0000-55dc-393e-5252-7474630bb73c	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55dc-393d-5174-c16843e76540
000d0000-55dc-393e-ab3e-7dd4ac6398e6	000e0000-55dc-393e-5252-7474630bb73c	\N	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55dc-393d-5174-c16843e76540
000d0000-55dc-393e-9b2c-8740afb66eeb	000e0000-55dc-393e-5252-7474630bb73c	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55dc-393d-8e78-31715077268b
000d0000-55dc-393e-7fae-6d732d55846e	000e0000-55dc-393e-5252-7474630bb73c	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55dc-393d-fbaa-03294c90e42a
\.


--
-- TOC entry 2907 (class 0 OID 15483338)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2911 (class 0 OID 15483386)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 15483318)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55dc-393e-a63d-16fa87ac07fb	00080000-55dc-393e-0f1d-e1a53c3b7e48	00090000-55dc-393e-3b57-0f422bad5b92	AK		
\.


--
-- TOC entry 2917 (class 0 OID 15483439)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 15483912)
-- Dependencies: 236
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2955 (class 0 OID 15483924)
-- Dependencies: 237
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2957 (class 0 OID 15483946)
-- Dependencies: 239
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2921 (class 0 OID 15483464)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 15483275)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55dc-393d-da03-e4e199d5a282	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55dc-393d-395e-dbf2f58c2421	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55dc-393d-df19-f6126aa15d24	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55dc-393d-8315-e975fa995f2e	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55dc-393d-f95c-09c63bf1e502	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55dc-393d-8e77-0ef158dc87fb	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55dc-393d-fda2-90c1dd8ec46f	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55dc-393d-04ba-7539e77706ca	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55dc-393d-7816-961883567099	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55dc-393d-3de1-0e83420538be	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55dc-393d-80e7-520416d6fb8e	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55dc-393d-0a26-c2fb5256c63c	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55dc-393d-1e02-deedd0ac554a	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55dc-393e-049e-d74e5f3a290f	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55dc-393e-e353-856223d9c8c1	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55dc-393e-c3e7-85a0ee0ddc76	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55dc-393e-6fb1-7c9a37d7fe09	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55dc-393e-46cd-694cbd3e30a7	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55dc-393f-9dd0-63aebf5847c0	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2896 (class 0 OID 15483189)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55dc-393e-8fcd-3704d9d95ba5	00000000-55dc-393e-049e-d74e5f3a290f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55dc-393e-2d15-a975ce3e26b0	00000000-55dc-393e-049e-d74e5f3a290f	00010000-55dc-393d-e7dd-556d16cb7c5f	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55dc-393e-35a3-d9ae12b293cc	00000000-55dc-393e-e353-856223d9c8c1	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2897 (class 0 OID 15483200)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55dc-393e-7283-a98881d18072	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55dc-393e-19df-926a146ea070	00010000-55dc-393e-d7b2-5ee401da7beb	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55dc-393e-2c2a-5a1487575e98	00010000-55dc-393e-480e-bafcee9901e2	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55dc-393e-17c4-15b1cbec5f82	00010000-55dc-393e-5f51-7f6d725c62c4	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55dc-393e-a9a5-fb00a30e41f0	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55dc-393e-414a-2e80fc219275	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55dc-393e-d381-d2e29aee8136	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55dc-393e-abcf-0f9b0b7f2705	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55dc-393e-3b57-0f422bad5b92	00010000-55dc-393e-14e7-5b7c348ac79b	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55dc-393e-2f16-b1a96cddddc3	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55dc-393e-1c6c-75c2a1bb4cf6	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55dc-393e-0c07-167c549d5c2b	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55dc-393e-d734-2c68a23314db	00010000-55dc-393e-6b05-81f81f596450	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2892 (class 0 OID 15483154)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55dc-393d-a2f3-c393fe992a1c	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55dc-393d-818d-a25cb896c968	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55dc-393d-656d-e3108dcb742c	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55dc-393d-1bb3-d416dd52ba69	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55dc-393d-47f2-cea3a7d9e8d0	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55dc-393d-8f9a-525f602f0c77	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55dc-393d-6fd6-a352aeae8d4c	Abonma-read	Abonma - branje	f
00030000-55dc-393d-2094-dd7584270ebb	Abonma-write	Abonma - spreminjanje	f
00030000-55dc-393d-62ee-81ae49bc75fb	Alternacija-read	Alternacija - branje	f
00030000-55dc-393d-0865-cdfee4d3272d	Alternacija-write	Alternacija - spreminjanje	f
00030000-55dc-393d-0fd6-771109451129	Arhivalija-read	Arhivalija - branje	f
00030000-55dc-393d-5182-a1b22f44de95	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55dc-393d-b226-39a1f18e155d	Besedilo-read	Besedilo - branje	f
00030000-55dc-393d-be1c-1848a23cab16	Besedilo-write	Besedilo - spreminjanje	f
00030000-55dc-393d-551f-10fc66bc39b5	DogodekIzven-read	DogodekIzven - branje	f
00030000-55dc-393d-108d-820845d4b049	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55dc-393d-c8d5-91866aa63fe7	Dogodek-read	Dogodek - branje	f
00030000-55dc-393d-98a2-3f198ca521c2	Dogodek-write	Dogodek - spreminjanje	f
00030000-55dc-393d-a1b5-15f8c7776437	DrugiVir-read	DrugiVir - branje	f
00030000-55dc-393d-461b-196ba89ba471	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55dc-393d-ffc9-30279d64b1fe	Drzava-read	Drzava - branje	f
00030000-55dc-393d-286a-d52f364d6ca5	Drzava-write	Drzava - spreminjanje	f
00030000-55dc-393d-a21e-4c4a5a755122	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55dc-393d-cbfe-ec3669d26ac8	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55dc-393d-35d7-ae1a9a4b70fd	Funkcija-read	Funkcija - branje	f
00030000-55dc-393d-c56b-4156267a5521	Funkcija-write	Funkcija - spreminjanje	f
00030000-55dc-393d-bdf0-1ad951d94803	Gostovanje-read	Gostovanje - branje	f
00030000-55dc-393d-6b0c-27e93d911dbb	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55dc-393d-31aa-11d8df95b95a	Gostujoca-read	Gostujoca - branje	f
00030000-55dc-393d-074e-2bfe74848c4a	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55dc-393d-8797-bb0630671189	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55dc-393d-3250-a83d79641fb6	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55dc-393d-27ba-a81faa4e98f4	Kupec-read	Kupec - branje	f
00030000-55dc-393d-7509-d4e6e1208ef1	Kupec-write	Kupec - spreminjanje	f
00030000-55dc-393d-223d-6c4e6b2d5765	NacinPlacina-read	NacinPlacina - branje	f
00030000-55dc-393d-45c3-9c2dc5431460	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55dc-393d-6ebb-a8eb18974691	Option-read	Option - branje	f
00030000-55dc-393d-e6b5-38dfe978fed8	Option-write	Option - spreminjanje	f
00030000-55dc-393d-abad-b8728b4e6c3b	OptionValue-read	OptionValue - branje	f
00030000-55dc-393d-62d3-a4f4530166f2	OptionValue-write	OptionValue - spreminjanje	f
00030000-55dc-393d-7491-8f03ade9f4a7	Oseba-read	Oseba - branje	f
00030000-55dc-393d-e872-f9a4286fde10	Oseba-write	Oseba - spreminjanje	f
00030000-55dc-393d-cf0f-a2264b0d01ab	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55dc-393d-4469-e1c348775b81	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55dc-393d-6900-a80783c75baa	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55dc-393d-f201-e0cfd39eeec6	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55dc-393d-cfd2-fb27a5a787a7	Pogodba-read	Pogodba - branje	f
00030000-55dc-393d-26d5-e0edb5b524b3	Pogodba-write	Pogodba - spreminjanje	f
00030000-55dc-393d-09cd-41fbd87d5a13	Popa-read	Popa - branje	f
00030000-55dc-393d-9bf1-89d42e59b239	Popa-write	Popa - spreminjanje	f
00030000-55dc-393d-ec88-f857df911271	Posta-read	Posta - branje	f
00030000-55dc-393d-4ed7-1927368f8ad3	Posta-write	Posta - spreminjanje	f
00030000-55dc-393d-1e4b-e20714ac4b10	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55dc-393d-5ab0-8f7dc0e0920e	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55dc-393d-0468-fa3935b6dc95	PostniNaslov-read	PostniNaslov - branje	f
00030000-55dc-393d-a595-4532276fffd3	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55dc-393d-95b8-d25a35144f43	Predstava-read	Predstava - branje	f
00030000-55dc-393d-b14c-b2d9dfd786c4	Predstava-write	Predstava - spreminjanje	f
00030000-55dc-393d-31d9-2de9cf3addc9	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55dc-393d-5abb-1c61917e9269	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55dc-393d-ae41-ca8cdac25d55	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55dc-393d-1018-01af8812e766	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55dc-393d-076d-a0774ece4c42	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55dc-393d-8abb-a9da3c2d6cbd	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55dc-393d-fd89-24ed1a468ed4	ProgramDela-read	ProgramDela - branje	f
00030000-55dc-393d-df5b-d48c098226f7	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55dc-393d-940f-10456a4995ec	ProgramFestival-read	ProgramFestival - branje	f
00030000-55dc-393d-16fa-de1449d5c144	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55dc-393d-c29e-9dac29f59e78	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55dc-393d-51a7-b487eeebe5dc	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55dc-393d-90c9-6a8eb999771f	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55dc-393d-1913-310fe18fe79c	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55dc-393d-67d9-0e5f6071aa22	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55dc-393d-98e3-ce949cabe5b5	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55dc-393d-403c-e5a979f09350	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55dc-393d-3691-0774ff1f3ba6	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55dc-393d-7931-edaad525dcc3	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55dc-393d-a8e2-4afec2225364	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55dc-393d-1dc7-4e4db19731c6	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55dc-393d-9e83-cacb2191cd12	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55dc-393d-ffec-e45d0c63296b	ProgramRazno-read	ProgramRazno - branje	f
00030000-55dc-393d-85ed-ea99a090ff70	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55dc-393d-cf29-ad30e706f517	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55dc-393d-1432-9f27d51593d9	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55dc-393d-c41c-ebd9f1923041	Prostor-read	Prostor - branje	f
00030000-55dc-393d-3e66-231d17896879	Prostor-write	Prostor - spreminjanje	f
00030000-55dc-393d-4df9-c6be1aeca1fb	Racun-read	Racun - branje	f
00030000-55dc-393d-4033-cf92fca9319e	Racun-write	Racun - spreminjanje	f
00030000-55dc-393d-5eee-407fff0a6f47	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55dc-393d-5c69-e3761dfe3e3e	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55dc-393d-0fda-c9c446274ed6	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55dc-393d-4d4a-0df59532e79c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55dc-393d-b2ba-9d9818cd7a8d	Rekvizit-read	Rekvizit - branje	f
00030000-55dc-393d-db87-fe200af94578	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55dc-393d-7635-a0bb418c7333	Revizija-read	Revizija - branje	f
00030000-55dc-393d-fbc5-04eecb2e65b3	Revizija-write	Revizija - spreminjanje	f
00030000-55dc-393d-78de-3a8df0cad392	Rezervacija-read	Rezervacija - branje	f
00030000-55dc-393d-9341-268177a91e8e	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55dc-393d-a3e3-ab676f0de089	SedezniRed-read	SedezniRed - branje	f
00030000-55dc-393d-557a-9ecd42673e3b	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55dc-393d-7de6-33c311f0e35d	Sedez-read	Sedez - branje	f
00030000-55dc-393d-2523-753a173e3522	Sedez-write	Sedez - spreminjanje	f
00030000-55dc-393d-ff15-6d7237bc936a	Sezona-read	Sezona - branje	f
00030000-55dc-393d-6372-1585166bfa7d	Sezona-write	Sezona - spreminjanje	f
00030000-55dc-393d-4cc0-89112e5dd97e	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55dc-393d-b6db-edfa48acec3b	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55dc-393d-40c5-60b7bcfc633c	Stevilcenje-read	Stevilcenje - branje	f
00030000-55dc-393d-edf2-490d2458b223	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55dc-393d-384e-4d0e8025379c	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55dc-393d-a860-d0700b1d6d0c	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55dc-393d-4b01-5bcfe5ab07de	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55dc-393d-49ab-7c7bd4190184	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55dc-393d-46cf-1e769b1a8ab9	Telefonska-read	Telefonska - branje	f
00030000-55dc-393d-f742-43f4349e6d2a	Telefonska-write	Telefonska - spreminjanje	f
00030000-55dc-393d-4c8b-a25bf896724b	TerminStoritve-read	TerminStoritve - branje	f
00030000-55dc-393d-d5a8-ef61c6a4c570	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55dc-393d-8297-9f82ab0b2798	TipFunkcije-read	TipFunkcije - branje	f
00030000-55dc-393d-ccc2-c702b723d12b	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55dc-393d-3759-7f503ba5852c	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55dc-393d-6e1c-fc7b4415eafc	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55dc-393d-8d57-63b25422cdad	Trr-read	Trr - branje	f
00030000-55dc-393d-c1fc-38c884310b05	Trr-write	Trr - spreminjanje	f
00030000-55dc-393d-21e6-bcbcf9332dc9	Uprizoritev-read	Uprizoritev - branje	f
00030000-55dc-393d-bfb8-e1b92ee3f2a6	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55dc-393d-87bb-ddcf858da6e2	Vaja-read	Vaja - branje	f
00030000-55dc-393d-102d-92dca46f80da	Vaja-write	Vaja - spreminjanje	f
00030000-55dc-393d-0d13-9c587d24b134	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55dc-393d-a02c-80f901329e99	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55dc-393d-013e-4c180c563dfd	Zaposlitev-read	Zaposlitev - branje	f
00030000-55dc-393d-688a-7becb49c7724	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55dc-393d-3fbd-2592613cb262	Zasedenost-read	Zasedenost - branje	f
00030000-55dc-393d-65aa-9b1afabcdeb1	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55dc-393d-0ec3-a904b6bb7a40	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55dc-393d-f628-cd7a7d8113ed	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55dc-393d-5d36-4440402eb66e	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55dc-393d-829e-0f86bc7707c9	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55dc-393d-2f9c-f1ef99d8368e	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55dc-393d-c304-79b587ae15e5	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55dc-393d-3b19-5ad281072419	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55dc-393d-cebf-f1eea5d88a30	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55dc-393d-7563-f003d264f40a	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55dc-393d-78f1-fa0cfd3c89b9	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55dc-393d-a239-b77872059e74	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55dc-393d-cb08-1b068f0738dd	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55dc-393d-6504-77a48ca37fdf	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55dc-393d-f48c-0e77d863b754	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55dc-393d-34d4-3c39eb450354	Datoteka-write	Datoteka - spreminjanje	f
00030000-55dc-393d-e9c2-3dbb1c6547bd	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2894 (class 0 OID 15483173)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55dc-393d-88a1-09fa7737634d	00030000-55dc-393d-818d-a25cb896c968
00020000-55dc-393d-a0f5-dc770ad9a8d5	00030000-55dc-393d-ffc9-30279d64b1fe
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-6fd6-a352aeae8d4c
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-2094-dd7584270ebb
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-62ee-81ae49bc75fb
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-0865-cdfee4d3272d
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-0fd6-771109451129
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-c8d5-91866aa63fe7
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-1bb3-d416dd52ba69
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-98a2-3f198ca521c2
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-ffc9-30279d64b1fe
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-286a-d52f364d6ca5
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-35d7-ae1a9a4b70fd
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-c56b-4156267a5521
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-bdf0-1ad951d94803
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-6b0c-27e93d911dbb
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-31aa-11d8df95b95a
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-074e-2bfe74848c4a
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-8797-bb0630671189
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-3250-a83d79641fb6
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-6ebb-a8eb18974691
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-abad-b8728b4e6c3b
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-7491-8f03ade9f4a7
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-e872-f9a4286fde10
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-09cd-41fbd87d5a13
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-9bf1-89d42e59b239
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-ec88-f857df911271
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-4ed7-1927368f8ad3
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-0468-fa3935b6dc95
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-a595-4532276fffd3
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-95b8-d25a35144f43
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-b14c-b2d9dfd786c4
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-076d-a0774ece4c42
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-8abb-a9da3c2d6cbd
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-c41c-ebd9f1923041
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-3e66-231d17896879
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-0fda-c9c446274ed6
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-4d4a-0df59532e79c
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-b2ba-9d9818cd7a8d
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-db87-fe200af94578
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-ff15-6d7237bc936a
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-6372-1585166bfa7d
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-8297-9f82ab0b2798
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-21e6-bcbcf9332dc9
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-bfb8-e1b92ee3f2a6
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-87bb-ddcf858da6e2
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-102d-92dca46f80da
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-3fbd-2592613cb262
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-65aa-9b1afabcdeb1
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-0ec3-a904b6bb7a40
00020000-55dc-393d-a81d-49075d0a78c8	00030000-55dc-393d-5d36-4440402eb66e
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-6fd6-a352aeae8d4c
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-0fd6-771109451129
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-c8d5-91866aa63fe7
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-ffc9-30279d64b1fe
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-bdf0-1ad951d94803
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-31aa-11d8df95b95a
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-8797-bb0630671189
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-3250-a83d79641fb6
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-6ebb-a8eb18974691
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-abad-b8728b4e6c3b
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-7491-8f03ade9f4a7
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-e872-f9a4286fde10
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-09cd-41fbd87d5a13
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-ec88-f857df911271
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-0468-fa3935b6dc95
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-a595-4532276fffd3
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-95b8-d25a35144f43
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-c41c-ebd9f1923041
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-0fda-c9c446274ed6
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-b2ba-9d9818cd7a8d
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-ff15-6d7237bc936a
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-46cf-1e769b1a8ab9
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-f742-43f4349e6d2a
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-8d57-63b25422cdad
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-c1fc-38c884310b05
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-013e-4c180c563dfd
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-688a-7becb49c7724
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-0ec3-a904b6bb7a40
00020000-55dc-393d-19c9-1196aaa3c7e8	00030000-55dc-393d-5d36-4440402eb66e
00020000-55dc-393d-5661-b74f6967329c	00030000-55dc-393d-6fd6-a352aeae8d4c
00020000-55dc-393d-5661-b74f6967329c	00030000-55dc-393d-62ee-81ae49bc75fb
00020000-55dc-393d-5661-b74f6967329c	00030000-55dc-393d-0fd6-771109451129
00020000-55dc-393d-5661-b74f6967329c	00030000-55dc-393d-5182-a1b22f44de95
00020000-55dc-393d-5661-b74f6967329c	00030000-55dc-393d-b226-39a1f18e155d
00020000-55dc-393d-5661-b74f6967329c	00030000-55dc-393d-551f-10fc66bc39b5
00020000-55dc-393d-5661-b74f6967329c	00030000-55dc-393d-c8d5-91866aa63fe7
00020000-55dc-393d-5661-b74f6967329c	00030000-55dc-393d-ffc9-30279d64b1fe
00020000-55dc-393d-5661-b74f6967329c	00030000-55dc-393d-35d7-ae1a9a4b70fd
00020000-55dc-393d-5661-b74f6967329c	00030000-55dc-393d-bdf0-1ad951d94803
00020000-55dc-393d-5661-b74f6967329c	00030000-55dc-393d-31aa-11d8df95b95a
00020000-55dc-393d-5661-b74f6967329c	00030000-55dc-393d-8797-bb0630671189
00020000-55dc-393d-5661-b74f6967329c	00030000-55dc-393d-6ebb-a8eb18974691
00020000-55dc-393d-5661-b74f6967329c	00030000-55dc-393d-abad-b8728b4e6c3b
00020000-55dc-393d-5661-b74f6967329c	00030000-55dc-393d-7491-8f03ade9f4a7
00020000-55dc-393d-5661-b74f6967329c	00030000-55dc-393d-09cd-41fbd87d5a13
00020000-55dc-393d-5661-b74f6967329c	00030000-55dc-393d-ec88-f857df911271
00020000-55dc-393d-5661-b74f6967329c	00030000-55dc-393d-95b8-d25a35144f43
00020000-55dc-393d-5661-b74f6967329c	00030000-55dc-393d-076d-a0774ece4c42
00020000-55dc-393d-5661-b74f6967329c	00030000-55dc-393d-c41c-ebd9f1923041
00020000-55dc-393d-5661-b74f6967329c	00030000-55dc-393d-0fda-c9c446274ed6
00020000-55dc-393d-5661-b74f6967329c	00030000-55dc-393d-b2ba-9d9818cd7a8d
00020000-55dc-393d-5661-b74f6967329c	00030000-55dc-393d-ff15-6d7237bc936a
00020000-55dc-393d-5661-b74f6967329c	00030000-55dc-393d-8297-9f82ab0b2798
00020000-55dc-393d-5661-b74f6967329c	00030000-55dc-393d-87bb-ddcf858da6e2
00020000-55dc-393d-5661-b74f6967329c	00030000-55dc-393d-3fbd-2592613cb262
00020000-55dc-393d-5661-b74f6967329c	00030000-55dc-393d-0ec3-a904b6bb7a40
00020000-55dc-393d-5661-b74f6967329c	00030000-55dc-393d-5d36-4440402eb66e
00020000-55dc-393d-c4a8-a3fe1c8062d5	00030000-55dc-393d-6fd6-a352aeae8d4c
00020000-55dc-393d-c4a8-a3fe1c8062d5	00030000-55dc-393d-2094-dd7584270ebb
00020000-55dc-393d-c4a8-a3fe1c8062d5	00030000-55dc-393d-0865-cdfee4d3272d
00020000-55dc-393d-c4a8-a3fe1c8062d5	00030000-55dc-393d-0fd6-771109451129
00020000-55dc-393d-c4a8-a3fe1c8062d5	00030000-55dc-393d-c8d5-91866aa63fe7
00020000-55dc-393d-c4a8-a3fe1c8062d5	00030000-55dc-393d-ffc9-30279d64b1fe
00020000-55dc-393d-c4a8-a3fe1c8062d5	00030000-55dc-393d-bdf0-1ad951d94803
00020000-55dc-393d-c4a8-a3fe1c8062d5	00030000-55dc-393d-31aa-11d8df95b95a
00020000-55dc-393d-c4a8-a3fe1c8062d5	00030000-55dc-393d-6ebb-a8eb18974691
00020000-55dc-393d-c4a8-a3fe1c8062d5	00030000-55dc-393d-abad-b8728b4e6c3b
00020000-55dc-393d-c4a8-a3fe1c8062d5	00030000-55dc-393d-09cd-41fbd87d5a13
00020000-55dc-393d-c4a8-a3fe1c8062d5	00030000-55dc-393d-ec88-f857df911271
00020000-55dc-393d-c4a8-a3fe1c8062d5	00030000-55dc-393d-95b8-d25a35144f43
00020000-55dc-393d-c4a8-a3fe1c8062d5	00030000-55dc-393d-c41c-ebd9f1923041
00020000-55dc-393d-c4a8-a3fe1c8062d5	00030000-55dc-393d-0fda-c9c446274ed6
00020000-55dc-393d-c4a8-a3fe1c8062d5	00030000-55dc-393d-b2ba-9d9818cd7a8d
00020000-55dc-393d-c4a8-a3fe1c8062d5	00030000-55dc-393d-ff15-6d7237bc936a
00020000-55dc-393d-c4a8-a3fe1c8062d5	00030000-55dc-393d-8297-9f82ab0b2798
00020000-55dc-393d-c4a8-a3fe1c8062d5	00030000-55dc-393d-0ec3-a904b6bb7a40
00020000-55dc-393d-c4a8-a3fe1c8062d5	00030000-55dc-393d-5d36-4440402eb66e
00020000-55dc-393d-8837-094ee9de0e8a	00030000-55dc-393d-6fd6-a352aeae8d4c
00020000-55dc-393d-8837-094ee9de0e8a	00030000-55dc-393d-0fd6-771109451129
00020000-55dc-393d-8837-094ee9de0e8a	00030000-55dc-393d-c8d5-91866aa63fe7
00020000-55dc-393d-8837-094ee9de0e8a	00030000-55dc-393d-ffc9-30279d64b1fe
00020000-55dc-393d-8837-094ee9de0e8a	00030000-55dc-393d-bdf0-1ad951d94803
00020000-55dc-393d-8837-094ee9de0e8a	00030000-55dc-393d-31aa-11d8df95b95a
00020000-55dc-393d-8837-094ee9de0e8a	00030000-55dc-393d-6ebb-a8eb18974691
00020000-55dc-393d-8837-094ee9de0e8a	00030000-55dc-393d-abad-b8728b4e6c3b
00020000-55dc-393d-8837-094ee9de0e8a	00030000-55dc-393d-09cd-41fbd87d5a13
00020000-55dc-393d-8837-094ee9de0e8a	00030000-55dc-393d-ec88-f857df911271
00020000-55dc-393d-8837-094ee9de0e8a	00030000-55dc-393d-95b8-d25a35144f43
00020000-55dc-393d-8837-094ee9de0e8a	00030000-55dc-393d-c41c-ebd9f1923041
00020000-55dc-393d-8837-094ee9de0e8a	00030000-55dc-393d-0fda-c9c446274ed6
00020000-55dc-393d-8837-094ee9de0e8a	00030000-55dc-393d-b2ba-9d9818cd7a8d
00020000-55dc-393d-8837-094ee9de0e8a	00030000-55dc-393d-ff15-6d7237bc936a
00020000-55dc-393d-8837-094ee9de0e8a	00030000-55dc-393d-4c8b-a25bf896724b
00020000-55dc-393d-8837-094ee9de0e8a	00030000-55dc-393d-656d-e3108dcb742c
00020000-55dc-393d-8837-094ee9de0e8a	00030000-55dc-393d-8297-9f82ab0b2798
00020000-55dc-393d-8837-094ee9de0e8a	00030000-55dc-393d-0ec3-a904b6bb7a40
00020000-55dc-393d-8837-094ee9de0e8a	00030000-55dc-393d-5d36-4440402eb66e
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-a2f3-c393fe992a1c
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-818d-a25cb896c968
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-656d-e3108dcb742c
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-1bb3-d416dd52ba69
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-47f2-cea3a7d9e8d0
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-8f9a-525f602f0c77
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-6fd6-a352aeae8d4c
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-2094-dd7584270ebb
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-62ee-81ae49bc75fb
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-0865-cdfee4d3272d
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-0fd6-771109451129
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-5182-a1b22f44de95
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-b226-39a1f18e155d
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-be1c-1848a23cab16
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-551f-10fc66bc39b5
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-108d-820845d4b049
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-c8d5-91866aa63fe7
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-98a2-3f198ca521c2
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-ffc9-30279d64b1fe
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-286a-d52f364d6ca5
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-a1b5-15f8c7776437
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-461b-196ba89ba471
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-a21e-4c4a5a755122
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-cbfe-ec3669d26ac8
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-35d7-ae1a9a4b70fd
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-c56b-4156267a5521
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-bdf0-1ad951d94803
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-6b0c-27e93d911dbb
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-31aa-11d8df95b95a
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-074e-2bfe74848c4a
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-8797-bb0630671189
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-3250-a83d79641fb6
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-27ba-a81faa4e98f4
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-7509-d4e6e1208ef1
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-223d-6c4e6b2d5765
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-45c3-9c2dc5431460
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-6ebb-a8eb18974691
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-e6b5-38dfe978fed8
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-abad-b8728b4e6c3b
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-62d3-a4f4530166f2
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-7491-8f03ade9f4a7
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-e872-f9a4286fde10
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-cf0f-a2264b0d01ab
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-4469-e1c348775b81
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-6900-a80783c75baa
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-f201-e0cfd39eeec6
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-cfd2-fb27a5a787a7
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-26d5-e0edb5b524b3
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-09cd-41fbd87d5a13
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-9bf1-89d42e59b239
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-ec88-f857df911271
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-4ed7-1927368f8ad3
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-1e4b-e20714ac4b10
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-5ab0-8f7dc0e0920e
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-0468-fa3935b6dc95
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-a595-4532276fffd3
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-95b8-d25a35144f43
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-b14c-b2d9dfd786c4
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-31d9-2de9cf3addc9
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-5abb-1c61917e9269
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-ae41-ca8cdac25d55
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-1018-01af8812e766
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-076d-a0774ece4c42
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-8abb-a9da3c2d6cbd
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-fd89-24ed1a468ed4
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-df5b-d48c098226f7
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-940f-10456a4995ec
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-16fa-de1449d5c144
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-c29e-9dac29f59e78
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-51a7-b487eeebe5dc
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-90c9-6a8eb999771f
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-1913-310fe18fe79c
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-67d9-0e5f6071aa22
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-98e3-ce949cabe5b5
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-403c-e5a979f09350
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-3691-0774ff1f3ba6
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-7931-edaad525dcc3
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-a8e2-4afec2225364
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-1dc7-4e4db19731c6
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-9e83-cacb2191cd12
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-ffec-e45d0c63296b
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-85ed-ea99a090ff70
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-cf29-ad30e706f517
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-1432-9f27d51593d9
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-c41c-ebd9f1923041
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-3e66-231d17896879
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-4df9-c6be1aeca1fb
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-4033-cf92fca9319e
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-5eee-407fff0a6f47
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-5c69-e3761dfe3e3e
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-0fda-c9c446274ed6
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-4d4a-0df59532e79c
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-b2ba-9d9818cd7a8d
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-db87-fe200af94578
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-7635-a0bb418c7333
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-fbc5-04eecb2e65b3
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-78de-3a8df0cad392
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-9341-268177a91e8e
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-a3e3-ab676f0de089
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-557a-9ecd42673e3b
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-7de6-33c311f0e35d
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-2523-753a173e3522
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-ff15-6d7237bc936a
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-6372-1585166bfa7d
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-4cc0-89112e5dd97e
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-b6db-edfa48acec3b
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-40c5-60b7bcfc633c
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-edf2-490d2458b223
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-384e-4d0e8025379c
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-a860-d0700b1d6d0c
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-4b01-5bcfe5ab07de
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-49ab-7c7bd4190184
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-46cf-1e769b1a8ab9
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-f742-43f4349e6d2a
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-4c8b-a25bf896724b
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-d5a8-ef61c6a4c570
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-8297-9f82ab0b2798
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-ccc2-c702b723d12b
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-3759-7f503ba5852c
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-6e1c-fc7b4415eafc
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-8d57-63b25422cdad
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-c1fc-38c884310b05
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-21e6-bcbcf9332dc9
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-bfb8-e1b92ee3f2a6
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-87bb-ddcf858da6e2
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-102d-92dca46f80da
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-0d13-9c587d24b134
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-a02c-80f901329e99
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-013e-4c180c563dfd
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-688a-7becb49c7724
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-3fbd-2592613cb262
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-65aa-9b1afabcdeb1
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-0ec3-a904b6bb7a40
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-f628-cd7a7d8113ed
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-5d36-4440402eb66e
00020000-55dc-393e-dd6d-81285a5a4adf	00030000-55dc-393d-829e-0f86bc7707c9
\.


--
-- TOC entry 2922 (class 0 OID 15483471)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2926 (class 0 OID 15483502)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 15483616)
-- Dependencies: 218
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55dc-393e-5032-7ccb0853234c	00090000-55dc-393e-7283-a98881d18072	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55dc-393e-3034-01c9fcf191bb	00090000-55dc-393e-414a-2e80fc219275	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55dc-393e-7a05-6248ccfcf165	00090000-55dc-393e-d734-2c68a23314db	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2899 (class 0 OID 15483233)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55dc-393e-0f1d-e1a53c3b7e48	00040000-55dc-393d-44e6-8a5cbcda7499	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dc-393e-57d7-aaea11f22b06	00040000-55dc-393d-44e6-8a5cbcda7499	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55dc-393e-5fe3-444ff45f7b85	00040000-55dc-393d-44e6-8a5cbcda7499	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dc-393e-8aad-be5872b275ba	00040000-55dc-393d-44e6-8a5cbcda7499	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dc-393e-5764-46651c5461d6	00040000-55dc-393d-44e6-8a5cbcda7499	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dc-393e-8c08-25254db0d1ca	00040000-55dc-393d-4c2c-4202d98b700f	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dc-393e-8d45-821d0eb1b200	00040000-55dc-393d-259c-fa6fd36c1872	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dc-393e-f4dc-a22f8aa4af06	00040000-55dc-393d-166e-2c47ec96ee89	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dc-393f-a8a8-4b5b9672b397	00040000-55dc-393d-44e6-8a5cbcda7499	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2901 (class 0 OID 15483267)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55dc-393c-cf6d-4d9a9bc1efe8	8341	Adlešiči
00050000-55dc-393c-c2f4-131e5185e832	5270	Ajdovščina
00050000-55dc-393c-1e3a-e6e5c3cdcd4e	6280	Ankaran/Ancarano
00050000-55dc-393c-4855-09f1c8d879eb	9253	Apače
00050000-55dc-393c-f301-f90c07389fe9	8253	Artiče
00050000-55dc-393c-0d21-350972c7e721	4275	Begunje na Gorenjskem
00050000-55dc-393c-3e64-83cef85e28d4	1382	Begunje pri Cerknici
00050000-55dc-393c-560c-3f1c974f8b36	9231	Beltinci
00050000-55dc-393c-1fd4-a3e7cc5c60a3	2234	Benedikt
00050000-55dc-393c-d1e9-458a8805ad79	2345	Bistrica ob Dravi
00050000-55dc-393c-1c25-60a75019b706	3256	Bistrica ob Sotli
00050000-55dc-393c-7281-e6a41adb3a1e	8259	Bizeljsko
00050000-55dc-393c-9eaa-e6123d731475	1223	Blagovica
00050000-55dc-393c-ee4a-249c11a6ca04	8283	Blanca
00050000-55dc-393c-957a-e7ca681cab9e	4260	Bled
00050000-55dc-393c-0b02-4d4f234d39ae	4273	Blejska Dobrava
00050000-55dc-393c-105a-7c707ec7b89d	9265	Bodonci
00050000-55dc-393c-0072-65a2ecace885	9222	Bogojina
00050000-55dc-393c-4ef6-6538d2ec01bf	4263	Bohinjska Bela
00050000-55dc-393c-fb77-998ed11322b9	4264	Bohinjska Bistrica
00050000-55dc-393c-7b9e-93920d7c4502	4265	Bohinjsko jezero
00050000-55dc-393c-4286-ab342180628a	1353	Borovnica
00050000-55dc-393c-f80b-22fb670a50b8	8294	Boštanj
00050000-55dc-393c-6615-92f3ac302bd2	5230	Bovec
00050000-55dc-393c-3785-42f05048f8d3	5295	Branik
00050000-55dc-393c-ef8d-cc205e243f27	3314	Braslovče
00050000-55dc-393c-a09e-8cefdeff829d	5223	Breginj
00050000-55dc-393c-997c-5691a6a26b17	8280	Brestanica
00050000-55dc-393c-c448-72c2f88e933e	2354	Bresternica
00050000-55dc-393c-bcfb-76e8b4d8b96f	4243	Brezje
00050000-55dc-393c-3d57-545bbcbc4689	1351	Brezovica pri Ljubljani
00050000-55dc-393c-1bc3-acc99dbc210b	8250	Brežice
00050000-55dc-393c-ed87-be980fce163f	4210	Brnik - Aerodrom
00050000-55dc-393c-7d77-9dcedb7d7c9f	8321	Brusnice
00050000-55dc-393c-a361-98849eb24672	3255	Buče
00050000-55dc-393c-abc1-31b656faba9e	8276	Bučka 
00050000-55dc-393c-9111-c3424f137d96	9261	Cankova
00050000-55dc-393c-e400-e03af4be85cd	3000	Celje 
00050000-55dc-393c-d5c4-3095e9e1f2cb	3001	Celje - poštni predali
00050000-55dc-393c-5cea-9dc2cba936d6	4207	Cerklje na Gorenjskem
00050000-55dc-393c-b192-7033b9c0df71	8263	Cerklje ob Krki
00050000-55dc-393c-2261-f37c65620816	1380	Cerknica
00050000-55dc-393c-490b-dbebe78efe7d	5282	Cerkno
00050000-55dc-393c-5268-f329aa6e6bff	2236	Cerkvenjak
00050000-55dc-393c-6db6-cc6d3f511305	2215	Ceršak
00050000-55dc-393c-addc-2a14733d5450	2326	Cirkovce
00050000-55dc-393c-89e0-d019ec1a6480	2282	Cirkulane
00050000-55dc-393c-0cf7-f3eb016dd46a	5273	Col
00050000-55dc-393c-80ec-f6fce6f246ec	8251	Čatež ob Savi
00050000-55dc-393c-0ccf-5fb86c77dff4	1413	Čemšenik
00050000-55dc-393c-8d61-7d9aa534fa35	5253	Čepovan
00050000-55dc-393c-ea98-d97bf8b51e04	9232	Črenšovci
00050000-55dc-393c-d431-cd47206614ed	2393	Črna na Koroškem
00050000-55dc-393c-3f60-6551acf060fa	6275	Črni Kal
00050000-55dc-393c-4a83-86234aadad7a	5274	Črni Vrh nad Idrijo
00050000-55dc-393c-ee2a-de4ad29228e4	5262	Črniče
00050000-55dc-393c-f684-43242dfbf73b	8340	Črnomelj
00050000-55dc-393c-1f7f-83fbc6f463be	6271	Dekani
00050000-55dc-393c-5088-976b3afe9e5f	5210	Deskle
00050000-55dc-393c-0c89-a29d3f569838	2253	Destrnik
00050000-55dc-393c-868f-9abc4348bde3	6215	Divača
00050000-55dc-393c-126a-e2ea00a8fd71	1233	Dob
00050000-55dc-393c-2ff6-e279376b5c5f	3224	Dobje pri Planini
00050000-55dc-393c-13d2-7e3c633b10b0	8257	Dobova
00050000-55dc-393c-09a0-92c4b0f118e6	1423	Dobovec
00050000-55dc-393c-72a1-18250b46c8e9	5263	Dobravlje
00050000-55dc-393c-d6d7-c6c737e164b5	3204	Dobrna
00050000-55dc-393c-130f-b4e2c1034e16	8211	Dobrnič
00050000-55dc-393c-dc41-a50e7d45c66b	1356	Dobrova
00050000-55dc-393c-0baa-4a76df9c8bde	9223	Dobrovnik/Dobronak 
00050000-55dc-393c-8fd5-7fc21134f0db	5212	Dobrovo v Brdih
00050000-55dc-393c-a69d-3c9fdbd00fc1	1431	Dol pri Hrastniku
00050000-55dc-393c-ef3f-05f806a882c7	1262	Dol pri Ljubljani
00050000-55dc-393c-08c0-0e3251d323ce	1273	Dole pri Litiji
00050000-55dc-393c-f09b-16caac42cdab	1331	Dolenja vas
00050000-55dc-393c-b645-a2719a4dbb5b	8350	Dolenjske Toplice
00050000-55dc-393c-d4b9-3a806d561e1e	1230	Domžale
00050000-55dc-393c-dc12-b23c338e0c49	2252	Dornava
00050000-55dc-393c-9e49-d74921445315	5294	Dornberk
00050000-55dc-393c-a9a6-05b07f243513	1319	Draga
00050000-55dc-393c-84b6-741a5634b0b4	8343	Dragatuš
00050000-55dc-393c-3c4e-ec8e3a1c459b	3222	Dramlje
00050000-55dc-393c-1f42-44da6c8a4c03	2370	Dravograd
00050000-55dc-393c-e408-63ad54b3bc10	4203	Duplje
00050000-55dc-393c-9db5-9d7cfe37a21f	6221	Dutovlje
00050000-55dc-393c-af96-7ef5676baa23	8361	Dvor
00050000-55dc-393c-4f6d-ffd12aa9e881	2343	Fala
00050000-55dc-393c-11f9-c849a231a897	9208	Fokovci
00050000-55dc-393c-e1de-c05a918e56bf	2313	Fram
00050000-55dc-393c-301f-86ad1ab2fa7f	3213	Frankolovo
00050000-55dc-393c-daf3-e0c064ac2d9c	1274	Gabrovka
00050000-55dc-393c-e911-4267566f82a3	8254	Globoko
00050000-55dc-393c-063c-d645dc53cbcb	5275	Godovič
00050000-55dc-393c-8187-38da6562a82e	4204	Golnik
00050000-55dc-393c-4c52-1a3f38718c69	3303	Gomilsko
00050000-55dc-393c-94f2-bcda7c34ca38	4224	Gorenja vas
00050000-55dc-393c-5c7e-83fad2ff3ca2	3263	Gorica pri Slivnici
00050000-55dc-393c-af1b-a97f9a59ad13	2272	Gorišnica
00050000-55dc-393c-d677-61afe39f8b17	9250	Gornja Radgona
00050000-55dc-393c-8fd3-49f3627ea05e	3342	Gornji Grad
00050000-55dc-393c-3782-bc1b8b29dc74	4282	Gozd Martuljek
00050000-55dc-393c-3f3d-3e77696603f0	6272	Gračišče
00050000-55dc-393c-54eb-a0666b6a5b66	9264	Grad
00050000-55dc-393c-a099-d800550fdd14	8332	Gradac
00050000-55dc-393c-c025-1da0ae5c899f	1384	Grahovo
00050000-55dc-393c-886f-ea9ec1ad279e	5242	Grahovo ob Bači
00050000-55dc-393c-87ad-e6c8bf14c6d2	5251	Grgar
00050000-55dc-393c-8d02-2253f31dde7f	3302	Griže
00050000-55dc-393c-5133-066209838bbe	3231	Grobelno
00050000-55dc-393c-4aa0-9c8131eb4542	1290	Grosuplje
00050000-55dc-393c-1cb4-b7014dbe134b	2288	Hajdina
00050000-55dc-393c-79ac-014766d5f614	8362	Hinje
00050000-55dc-393c-cbcb-86c7db43ac5c	2311	Hoče
00050000-55dc-393c-2b59-ea4d7d5b9aff	9205	Hodoš/Hodos
00050000-55dc-393c-a9e0-1ff2b4f0f90a	1354	Horjul
00050000-55dc-393c-4a92-95ac7b5aec40	1372	Hotedršica
00050000-55dc-393c-ba24-c053d2bc4200	1430	Hrastnik
00050000-55dc-393c-7baf-878853e6957f	6225	Hruševje
00050000-55dc-393c-8a08-e764f7a4470b	4276	Hrušica
00050000-55dc-393c-a052-06299743300f	5280	Idrija
00050000-55dc-393c-eba1-46c685b0e264	1292	Ig
00050000-55dc-393c-a159-c1c0e3b2779a	6250	Ilirska Bistrica
00050000-55dc-393c-0b15-6a06215c60b2	6251	Ilirska Bistrica-Trnovo
00050000-55dc-393c-023e-3381f0269236	1295	Ivančna Gorica
00050000-55dc-393c-3526-6a71d889effe	2259	Ivanjkovci
00050000-55dc-393c-fed8-9964e3fa6ce7	1411	Izlake
00050000-55dc-393c-42bf-d84a5cf590da	6310	Izola/Isola
00050000-55dc-393c-3e6f-b1dda890dad2	2222	Jakobski Dol
00050000-55dc-393c-fc28-ac693acd02b8	2221	Jarenina
00050000-55dc-393c-307c-485bcff8b710	6254	Jelšane
00050000-55dc-393c-a09a-9cab900cc7ac	4270	Jesenice
00050000-55dc-393c-01aa-4ecedb1c2155	8261	Jesenice na Dolenjskem
00050000-55dc-393c-8902-094a7bd5fd87	3273	Jurklošter
00050000-55dc-393c-8d21-39fc502b046c	2223	Jurovski Dol
00050000-55dc-393c-75fc-3b5d42f8d949	2256	Juršinci
00050000-55dc-393c-7268-f6986497d8fc	5214	Kal nad Kanalom
00050000-55dc-393c-60a3-fd321287ee37	3233	Kalobje
00050000-55dc-393c-e37b-bc995c080ae5	4246	Kamna Gorica
00050000-55dc-393c-9091-7df58431042f	2351	Kamnica
00050000-55dc-393c-5657-36621fd87854	1241	Kamnik
00050000-55dc-393c-4566-6aadc5d2ee16	5213	Kanal
00050000-55dc-393c-c3c1-a6ab5287c394	8258	Kapele
00050000-55dc-393c-4da3-2590e6f96354	2362	Kapla
00050000-55dc-393c-d6bc-dbab0b43c7b0	2325	Kidričevo
00050000-55dc-393c-37ec-2b430e3cae6c	1412	Kisovec
00050000-55dc-393c-7c3b-3ac9b0dd8898	6253	Knežak
00050000-55dc-393c-19a9-9cafa28bca3d	5222	Kobarid
00050000-55dc-393c-a106-ca54d1e8f539	9227	Kobilje
00050000-55dc-393c-7aab-e2480fb8563f	1330	Kočevje
00050000-55dc-393c-75dd-dac5907e810a	1338	Kočevska Reka
00050000-55dc-393c-9795-de2d56faf0b0	2276	Kog
00050000-55dc-393c-4aa1-01eff11f4cc0	5211	Kojsko
00050000-55dc-393c-d56c-71d4dd9abe56	6223	Komen
00050000-55dc-393c-5df5-8ae39d8ab86d	1218	Komenda
00050000-55dc-393c-bcb2-8ec7b9803a89	6000	Koper/Capodistria 
00050000-55dc-393c-9d8b-183af123128a	6001	Koper/Capodistria - poštni predali
00050000-55dc-393c-4967-0dde7c6b1182	8282	Koprivnica
00050000-55dc-393c-22bc-f2a1af8361c6	5296	Kostanjevica na Krasu
00050000-55dc-393c-ed45-0900a15faef4	8311	Kostanjevica na Krki
00050000-55dc-393c-7b8b-3293e3e23a5a	1336	Kostel
00050000-55dc-393c-e5d3-b2fd79628b70	6256	Košana
00050000-55dc-393c-50b4-1c6b81f8ae3b	2394	Kotlje
00050000-55dc-393c-e1d0-dc45a69db8fe	6240	Kozina
00050000-55dc-393c-53d0-cbdfd8811af7	3260	Kozje
00050000-55dc-393c-b62a-551d6dbfb42b	4000	Kranj 
00050000-55dc-393c-0104-487b35c75cf4	4001	Kranj - poštni predali
00050000-55dc-393c-cbab-35ae5ce661dc	4280	Kranjska Gora
00050000-55dc-393c-442c-93407a3b750b	1281	Kresnice
00050000-55dc-393c-b0c9-c78c0cac01d6	4294	Križe
00050000-55dc-393c-d31b-a1e26695bac4	9206	Križevci
00050000-55dc-393c-7ffa-1fc5f9fcc409	9242	Križevci pri Ljutomeru
00050000-55dc-393c-b104-ede848227982	1301	Krka
00050000-55dc-393c-afc4-16ffd480e55b	8296	Krmelj
00050000-55dc-393c-60d4-cc733247a75e	4245	Kropa
00050000-55dc-393c-c694-14ea42314d96	8262	Krška vas
00050000-55dc-393c-e85e-e5540e6cdf9f	8270	Krško
00050000-55dc-393c-97ea-3ae9be08c805	9263	Kuzma
00050000-55dc-393c-3b2d-2b1f6ac5b7aa	2318	Laporje
00050000-55dc-393c-ba37-ff275e5eebed	3270	Laško
00050000-55dc-393c-7772-db781528d540	1219	Laze v Tuhinju
00050000-55dc-393c-f6e0-74de2a482291	2230	Lenart v Slovenskih goricah
00050000-55dc-393c-1df6-31a0eb65b7f5	9220	Lendava/Lendva
00050000-55dc-393c-8f23-fda155e4776b	4248	Lesce
00050000-55dc-393c-ef5f-55f3d698052d	3261	Lesično
00050000-55dc-393c-0968-79fbaa89d0c5	8273	Leskovec pri Krškem
00050000-55dc-393c-6763-80d40c5f3850	2372	Libeliče
00050000-55dc-393c-c51e-4ed19c23281b	2341	Limbuš
00050000-55dc-393c-9de6-27ea95507ab4	1270	Litija
00050000-55dc-393c-82c1-a0af6bc60e80	3202	Ljubečna
00050000-55dc-393c-abc6-9ca5844f043f	1000	Ljubljana 
00050000-55dc-393c-e84b-b20409557ed0	1001	Ljubljana - poštni predali
00050000-55dc-393c-be7a-c8c0a9c46cf1	1231	Ljubljana - Črnuče
00050000-55dc-393c-121a-a8a0c591b470	1261	Ljubljana - Dobrunje
00050000-55dc-393c-b81d-7bdbcde89d7c	1260	Ljubljana - Polje
00050000-55dc-393c-59e0-8004ce60a557	1210	Ljubljana - Šentvid
00050000-55dc-393c-8f20-43e0d4de64e5	1211	Ljubljana - Šmartno
00050000-55dc-393c-245c-02ecd67c9151	3333	Ljubno ob Savinji
00050000-55dc-393c-1a7b-4e569f4db72d	9240	Ljutomer
00050000-55dc-393c-ba05-7eab4a4abd64	3215	Loče
00050000-55dc-393c-ad5d-51099a95f858	5231	Log pod Mangartom
00050000-55dc-393c-d45f-2c395bafed18	1358	Log pri Brezovici
00050000-55dc-393c-28fa-30438e629f06	1370	Logatec
00050000-55dc-393c-4c67-011a90ff7f0d	1371	Logatec
00050000-55dc-393c-8af4-fb8a884b148f	1434	Loka pri Zidanem Mostu
00050000-55dc-393c-5873-e2823de63057	3223	Loka pri Žusmu
00050000-55dc-393c-6e72-975fcb1065ac	6219	Lokev
00050000-55dc-393c-02e5-b20de535267b	1318	Loški Potok
00050000-55dc-393c-78bd-6004183619d7	2324	Lovrenc na Dravskem polju
00050000-55dc-393c-014d-ffba6b7ca0eb	2344	Lovrenc na Pohorju
00050000-55dc-393c-66ed-28c29c057a74	3334	Luče
00050000-55dc-393c-3c2a-d3c716555a9f	1225	Lukovica
00050000-55dc-393c-6db6-9df077a12d0e	9202	Mačkovci
00050000-55dc-393c-a1c4-23cff2d802f0	2322	Majšperk
00050000-55dc-393c-8398-d039cc5171cc	2321	Makole
00050000-55dc-393c-8ce1-a29f221a8467	9243	Mala Nedelja
00050000-55dc-393c-1afe-dc60ebf7fff9	2229	Malečnik
00050000-55dc-393c-3195-e14331152474	6273	Marezige
00050000-55dc-393c-5fc6-bda3939844e9	2000	Maribor 
00050000-55dc-393c-3b59-102ccaf6c25d	2001	Maribor - poštni predali
00050000-55dc-393c-fc54-bdcfa347b6ff	2206	Marjeta na Dravskem polju
00050000-55dc-393c-1d83-c91b70802130	2281	Markovci
00050000-55dc-393c-ac67-e4807f9404dc	9221	Martjanci
00050000-55dc-393c-a7ce-0304eef38a9f	6242	Materija
00050000-55dc-393c-9a76-e4bace6aa3b2	4211	Mavčiče
00050000-55dc-393c-6d2a-61de207746d4	1215	Medvode
00050000-55dc-393c-fcf6-7340a76631fd	1234	Mengeš
00050000-55dc-393c-a85c-e588058c1a62	8330	Metlika
00050000-55dc-393c-b986-1239c0c61011	2392	Mežica
00050000-55dc-393c-1450-a3f9c8faee79	2204	Miklavž na Dravskem polju
00050000-55dc-393c-ed95-1820e28c922a	2275	Miklavž pri Ormožu
00050000-55dc-393c-7135-2d6115b375ad	5291	Miren
00050000-55dc-393c-aef6-5e28225b79a4	8233	Mirna
00050000-55dc-393c-15bb-c0e07d6c0412	8216	Mirna Peč
00050000-55dc-393c-d32a-029de199c9cd	2382	Mislinja
00050000-55dc-393c-cf78-d51c41a8f97d	4281	Mojstrana
00050000-55dc-393c-0675-57988042dd73	8230	Mokronog
00050000-55dc-393c-d104-e3887cbb4238	1251	Moravče
00050000-55dc-393c-00ea-f82d901b5674	9226	Moravske Toplice
00050000-55dc-393c-5df2-37d64747c935	5216	Most na Soči
00050000-55dc-393c-52eb-552947fcc261	1221	Motnik
00050000-55dc-393c-26dd-cd8473496fe8	3330	Mozirje
00050000-55dc-393c-f22a-c3357dec4910	9000	Murska Sobota 
00050000-55dc-393d-8f8f-b863f0023c98	9001	Murska Sobota - poštni predali
00050000-55dc-393d-0f90-0f471578dd5c	2366	Muta
00050000-55dc-393d-279d-c1d699c33744	4202	Naklo
00050000-55dc-393d-affa-fd6e0c23bfca	3331	Nazarje
00050000-55dc-393d-4617-d5f23bb905ea	1357	Notranje Gorice
00050000-55dc-393d-f358-1e6311e55eaa	3203	Nova Cerkev
00050000-55dc-393d-1c7a-962d01b3ec9b	5000	Nova Gorica 
00050000-55dc-393d-7def-123af52b1009	5001	Nova Gorica - poštni predali
00050000-55dc-393d-d722-c0e4e04238d3	1385	Nova vas
00050000-55dc-393d-1a72-f2cd2a3f0201	8000	Novo mesto
00050000-55dc-393d-0c54-df90704b20da	8001	Novo mesto - poštni predali
00050000-55dc-393d-50cc-1a5528302be1	6243	Obrov
00050000-55dc-393d-1856-9387d5bacbf3	9233	Odranci
00050000-55dc-393d-e4f1-b8f4b95fb679	2317	Oplotnica
00050000-55dc-393d-0a6e-3844aa0ec5ad	2312	Orehova vas
00050000-55dc-393d-ac3a-8307882b664a	2270	Ormož
00050000-55dc-393d-41cc-36f90264481e	1316	Ortnek
00050000-55dc-393d-a909-29f1fbb12652	1337	Osilnica
00050000-55dc-393d-4045-9e180a7729b6	8222	Otočec
00050000-55dc-393d-29f2-9a045931e7b5	2361	Ožbalt
00050000-55dc-393d-d910-eb2e04e316ac	2231	Pernica
00050000-55dc-393d-882c-7ee84f599981	2211	Pesnica pri Mariboru
00050000-55dc-393d-eaeb-3da14336e06d	9203	Petrovci
00050000-55dc-393d-29a7-c83bd97147c4	3301	Petrovče
00050000-55dc-393d-17bb-a58527e9e341	6330	Piran/Pirano
00050000-55dc-393d-61dd-5c8449bf1ec5	8255	Pišece
00050000-55dc-393d-93a4-f41aa7b21ea6	6257	Pivka
00050000-55dc-393d-c380-9a05bbed7378	6232	Planina
00050000-55dc-393d-dada-41cca787d865	3225	Planina pri Sevnici
00050000-55dc-393d-1bf5-e2bbb92dd51c	6276	Pobegi
00050000-55dc-393d-695b-f879238733fb	8312	Podbočje
00050000-55dc-393d-ec5f-8e503ff8a001	5243	Podbrdo
00050000-55dc-393d-d799-e8ac50911c13	3254	Podčetrtek
00050000-55dc-393d-2327-d28a9d739530	2273	Podgorci
00050000-55dc-393d-47cb-5f56577f6e22	6216	Podgorje
00050000-55dc-393d-0891-59d1c113e96b	2381	Podgorje pri Slovenj Gradcu
00050000-55dc-393d-4796-14bb1525a824	6244	Podgrad
00050000-55dc-393d-91f0-b99bdd5d5019	1414	Podkum
00050000-55dc-393d-1869-1b429ca1d7b4	2286	Podlehnik
00050000-55dc-393d-2813-2865500a7749	5272	Podnanos
00050000-55dc-393d-7344-50839d68974b	4244	Podnart
00050000-55dc-393d-947b-2539c9c5f9a8	3241	Podplat
00050000-55dc-393d-ba4c-d40cb5146a7e	3257	Podsreda
00050000-55dc-393d-fb70-19eac913e345	2363	Podvelka
00050000-55dc-393d-9c90-d35f00420092	2208	Pohorje
00050000-55dc-393d-ea8e-c8e3da92103c	2257	Polenšak
00050000-55dc-393d-d191-7eb158a2df75	1355	Polhov Gradec
00050000-55dc-393d-50fc-985dff4fc02c	4223	Poljane nad Škofjo Loko
00050000-55dc-393d-8f63-3c64706701d9	2319	Poljčane
00050000-55dc-393d-e3d9-9d31be8163cb	1272	Polšnik
00050000-55dc-393d-cba7-2296756b1f61	3313	Polzela
00050000-55dc-393d-5ba1-cad7b486957f	3232	Ponikva
00050000-55dc-393d-fbdb-b6f528ba8fea	6320	Portorož/Portorose
00050000-55dc-393d-323f-1ea897fbaa2a	6230	Postojna
00050000-55dc-393d-3a18-133a315d28fb	2331	Pragersko
00050000-55dc-393d-c340-3bef6e7cb267	3312	Prebold
00050000-55dc-393d-2e76-ead0b680b476	4205	Preddvor
00050000-55dc-393d-1c14-5bb298c0b1e2	6255	Prem
00050000-55dc-393d-760a-89252a44838a	1352	Preserje
00050000-55dc-393d-31a1-197ab115864f	6258	Prestranek
00050000-55dc-393d-7760-bea8195aa776	2391	Prevalje
00050000-55dc-393d-45f7-df2e2cc9a3fe	3262	Prevorje
00050000-55dc-393d-25b4-4ee2bd7fb9e6	1276	Primskovo 
00050000-55dc-393d-acd9-2baca38bd780	3253	Pristava pri Mestinju
00050000-55dc-393d-b0ab-83dada34cbcf	9207	Prosenjakovci/Partosfalva
00050000-55dc-393d-3324-f709818c5956	5297	Prvačina
00050000-55dc-393d-88f7-bde664c762e3	2250	Ptuj
00050000-55dc-393d-6b57-b79b4a057524	2323	Ptujska Gora
00050000-55dc-393d-2d7f-6a01d4464b45	9201	Puconci
00050000-55dc-393d-a80b-e488d09ae573	2327	Rače
00050000-55dc-393d-6637-666a95e9c918	1433	Radeče
00050000-55dc-393d-da5c-ad077a015f82	9252	Radenci
00050000-55dc-393d-3dec-7a91db97d1c8	2360	Radlje ob Dravi
00050000-55dc-393d-1921-f953066f9c98	1235	Radomlje
00050000-55dc-393d-ec00-5ce73c542664	4240	Radovljica
00050000-55dc-393d-2185-98091a42b063	8274	Raka
00050000-55dc-393d-5ed4-ec320622452b	1381	Rakek
00050000-55dc-393d-d38a-a3a8c641fa00	4283	Rateče - Planica
00050000-55dc-393d-8ba6-0ef04d75814d	2390	Ravne na Koroškem
00050000-55dc-393d-e401-df45db7dc394	9246	Razkrižje
00050000-55dc-393d-7520-56bf1e610ebd	3332	Rečica ob Savinji
00050000-55dc-393d-de05-bd423fc9f5d5	5292	Renče
00050000-55dc-393d-d3ce-8f15905dd25e	1310	Ribnica
00050000-55dc-393d-9121-a374ecd1a2d0	2364	Ribnica na Pohorju
00050000-55dc-393d-fcd4-0ffad53923d0	3272	Rimske Toplice
00050000-55dc-393d-91bc-9219f5d46b9f	1314	Rob
00050000-55dc-393d-a24f-a55601ac2640	5215	Ročinj
00050000-55dc-393d-6432-8aa670da803a	3250	Rogaška Slatina
00050000-55dc-393d-8714-f4bca00ea45b	9262	Rogašovci
00050000-55dc-393d-d758-303e5bee7482	3252	Rogatec
00050000-55dc-393d-5006-1ae971e2c9f7	1373	Rovte
00050000-55dc-393d-5ec5-1d3d18d275f2	2342	Ruše
00050000-55dc-393d-b1b2-1113cf590f15	1282	Sava
00050000-55dc-393d-33b4-a089251419d0	6333	Sečovlje/Sicciole
00050000-55dc-393d-4bd2-e716315aa2f2	4227	Selca
00050000-55dc-393d-8b2b-9e9f8d55009c	2352	Selnica ob Dravi
00050000-55dc-393d-9c83-d9a82e9cd703	8333	Semič
00050000-55dc-393d-75da-61267eda7e6e	8281	Senovo
00050000-55dc-393d-9c4b-31d7fcf8ae31	6224	Senožeče
00050000-55dc-393d-4805-242d96a9503b	8290	Sevnica
00050000-55dc-393d-5c0d-fcba0f9187ef	6210	Sežana
00050000-55dc-393d-3146-c4da59ff9205	2214	Sladki Vrh
00050000-55dc-393d-57b2-35cb8baed7f2	5283	Slap ob Idrijci
00050000-55dc-393d-cba8-912f10c20d1f	2380	Slovenj Gradec
00050000-55dc-393d-a73b-1fe190f531ac	2310	Slovenska Bistrica
00050000-55dc-393d-a906-2703354e135b	3210	Slovenske Konjice
00050000-55dc-393d-d123-cb6dff96bf7b	1216	Smlednik
00050000-55dc-393d-e7f4-1edd632223f2	5232	Soča
00050000-55dc-393d-cfc6-da553fd170bb	1317	Sodražica
00050000-55dc-393d-5d2a-c3805331e041	3335	Solčava
00050000-55dc-393d-c638-7ed2eb0a3177	5250	Solkan
00050000-55dc-393d-e304-420948a0a374	4229	Sorica
00050000-55dc-393d-1232-52e7cefa6b34	4225	Sovodenj
00050000-55dc-393d-34c5-f21e85695fe7	5281	Spodnja Idrija
00050000-55dc-393d-77dc-3520b86b7b94	2241	Spodnji Duplek
00050000-55dc-393d-c959-6955dc0771fa	9245	Spodnji Ivanjci
00050000-55dc-393d-989c-990127c69cd5	2277	Središče ob Dravi
00050000-55dc-393d-271c-da6b355038b0	4267	Srednja vas v Bohinju
00050000-55dc-393d-0c84-7abfb454aaa9	8256	Sromlje 
00050000-55dc-393d-b133-b6b5d9da4273	5224	Srpenica
00050000-55dc-393d-fa1a-e17a17496f4d	1242	Stahovica
00050000-55dc-393d-623f-b42447a41db0	1332	Stara Cerkev
00050000-55dc-393d-4514-856b04545bca	8342	Stari trg ob Kolpi
00050000-55dc-393d-392f-0379aa9e504a	1386	Stari trg pri Ložu
00050000-55dc-393d-a624-10a6f113d20f	2205	Starše
00050000-55dc-393d-108f-87c3c03456c7	2289	Stoperce
00050000-55dc-393d-70e3-090435d888b0	8322	Stopiče
00050000-55dc-393d-e067-4564efe1569a	3206	Stranice
00050000-55dc-393d-22a3-62823e1d1d00	8351	Straža
00050000-55dc-393d-fe92-4580514edacf	1313	Struge
00050000-55dc-393d-cf53-32177945821b	8293	Studenec
00050000-55dc-393d-5ad4-a58342f9eba5	8331	Suhor
00050000-55dc-393d-e90f-5a5ba4e2dcd0	2233	Sv. Ana v Slovenskih goricah
00050000-55dc-393d-28ec-73dcb893a211	2235	Sv. Trojica v Slovenskih goricah
00050000-55dc-393d-d47c-116be81ae4f1	2353	Sveti Duh na Ostrem Vrhu
00050000-55dc-393d-a44d-8968fbc22fe6	9244	Sveti Jurij ob Ščavnici
00050000-55dc-393d-481c-92b143d01b21	3264	Sveti Štefan
00050000-55dc-393d-4811-47c0cb0c33fa	2258	Sveti Tomaž
00050000-55dc-393d-417c-004963da0a0c	9204	Šalovci
00050000-55dc-393d-0043-1f87674d10ca	5261	Šempas
00050000-55dc-393d-56b3-f93c813b82ec	5290	Šempeter pri Gorici
00050000-55dc-393d-a653-7b68d9e34f17	3311	Šempeter v Savinjski dolini
00050000-55dc-393d-6bde-18cc0819551d	4208	Šenčur
00050000-55dc-393d-f754-83a4f156abfd	2212	Šentilj v Slovenskih goricah
00050000-55dc-393d-498f-527dd983d3d8	8297	Šentjanž
00050000-55dc-393d-3a1a-688625bb81e7	2373	Šentjanž pri Dravogradu
00050000-55dc-393d-726f-a0ee2e961de3	8310	Šentjernej
00050000-55dc-393d-a17f-72ba4b5472e8	3230	Šentjur
00050000-55dc-393d-3547-b257b071768f	3271	Šentrupert
00050000-55dc-393d-e9f6-b76b54d32501	8232	Šentrupert
00050000-55dc-393d-00a6-2660efdef03f	1296	Šentvid pri Stični
00050000-55dc-393d-6516-3c4f4b204ded	8275	Škocjan
00050000-55dc-393d-966f-4806db24293e	6281	Škofije
00050000-55dc-393d-e26c-3baecdb1e760	4220	Škofja Loka
00050000-55dc-393d-79f9-71556d37ea5b	3211	Škofja vas
00050000-55dc-393d-b422-e369ea6f1fa6	1291	Škofljica
00050000-55dc-393d-4b35-c8cad919463b	6274	Šmarje
00050000-55dc-393d-d2bd-d1b65f4d9331	1293	Šmarje - Sap
00050000-55dc-393d-a228-4150cc53853b	3240	Šmarje pri Jelšah
00050000-55dc-393d-dab9-1360cca91a2e	8220	Šmarješke Toplice
00050000-55dc-393d-4160-48abb85989d0	2315	Šmartno na Pohorju
00050000-55dc-393d-c4dd-e1cb8fc6277d	3341	Šmartno ob Dreti
00050000-55dc-393d-558e-e01a4969b559	3327	Šmartno ob Paki
00050000-55dc-393d-2fb5-ba0ccd2b9bc3	1275	Šmartno pri Litiji
00050000-55dc-393d-44d2-c6f9c27c8f6e	2383	Šmartno pri Slovenj Gradcu
00050000-55dc-393d-90d1-c4ddd9b65c06	3201	Šmartno v Rožni dolini
00050000-55dc-393d-f289-f95c17c9ffde	3325	Šoštanj
00050000-55dc-393d-201d-47adf7a56cd3	6222	Štanjel
00050000-55dc-393d-26ad-916145ac771d	3220	Štore
00050000-55dc-393d-ba64-5da65a8add27	3304	Tabor
00050000-55dc-393d-2187-6a4d66f9ba48	3221	Teharje
00050000-55dc-393d-b422-f564d4ad32cf	9251	Tišina
00050000-55dc-393d-d9dc-edfefee5352d	5220	Tolmin
00050000-55dc-393d-1c66-8a39385e7e2e	3326	Topolšica
00050000-55dc-393d-131c-e8a24b22983e	2371	Trbonje
00050000-55dc-393d-1f09-a4ac6cae4db4	1420	Trbovlje
00050000-55dc-393d-7b0a-490a714071ee	8231	Trebelno 
00050000-55dc-393d-b115-7bbf0dd90980	8210	Trebnje
00050000-55dc-393d-0910-dee95994a149	5252	Trnovo pri Gorici
00050000-55dc-393d-8f24-44047fb35877	2254	Trnovska vas
00050000-55dc-393d-ac35-b4cd0ec699c2	1222	Trojane
00050000-55dc-393d-b975-129c38fe7211	1236	Trzin
00050000-55dc-393d-ce5d-024cb7c39ce2	4290	Tržič
00050000-55dc-393d-a1a9-af052063afd2	8295	Tržišče
00050000-55dc-393d-5988-7ea611ca8949	1311	Turjak
00050000-55dc-393d-91ae-c20a93e348f9	9224	Turnišče
00050000-55dc-393d-2184-e6e6f54dd8b0	8323	Uršna sela
00050000-55dc-393d-9fd9-d5e734f80527	1252	Vače
00050000-55dc-393d-d0b5-90a85534eeca	3320	Velenje 
00050000-55dc-393d-d4b2-66d2b511800e	3322	Velenje - poštni predali
00050000-55dc-393d-f3a6-b1be641593e9	8212	Velika Loka
00050000-55dc-393d-6a6a-c6245cc0bb68	2274	Velika Nedelja
00050000-55dc-393d-6b4f-d11feb1f5602	9225	Velika Polana
00050000-55dc-393d-9150-fb0535bc2647	1315	Velike Lašče
00050000-55dc-393d-9f4b-b80663a1f840	8213	Veliki Gaber
00050000-55dc-393d-bc14-2dfed7277fb3	9241	Veržej
00050000-55dc-393d-a88d-cc027e6c8049	1312	Videm - Dobrepolje
00050000-55dc-393d-1980-3f8ea1f9a637	2284	Videm pri Ptuju
00050000-55dc-393d-deb9-e3973b1295de	8344	Vinica
00050000-55dc-393d-ab8c-0ce6dd653b4c	5271	Vipava
00050000-55dc-393d-9a5f-4a1444320dee	4212	Visoko
00050000-55dc-393d-87b8-03201b68b5b5	1294	Višnja Gora
00050000-55dc-393d-8a60-b6086da49c53	3205	Vitanje
00050000-55dc-393d-8c89-e5679dcd4681	2255	Vitomarci
00050000-55dc-393d-1f3b-d40dafbb1e41	1217	Vodice
00050000-55dc-393d-bfa8-d96848b3af3e	3212	Vojnik\t
00050000-55dc-393d-28f9-1e2bcb3078ef	5293	Volčja Draga
00050000-55dc-393d-8214-ba7eae99c9f0	2232	Voličina
00050000-55dc-393d-6550-91f1fea861de	3305	Vransko
00050000-55dc-393d-4c73-fbb801945e7a	6217	Vremski Britof
00050000-55dc-393d-eed8-0b8ee2b3e6b0	1360	Vrhnika
00050000-55dc-393d-5b7b-69ae4a6172c1	2365	Vuhred
00050000-55dc-393d-f5df-90f7486bcc3f	2367	Vuzenica
00050000-55dc-393d-206e-875d90c97f22	8292	Zabukovje 
00050000-55dc-393d-944d-fbc03e2ede37	1410	Zagorje ob Savi
00050000-55dc-393d-c039-9f7b9d0b9242	1303	Zagradec
00050000-55dc-393d-58d2-d6d83d92485e	2283	Zavrč
00050000-55dc-393d-e87a-29a60f1d4bb2	8272	Zdole 
00050000-55dc-393d-4f47-c4cfbad12405	4201	Zgornja Besnica
00050000-55dc-393d-493a-2c07e914339e	2242	Zgornja Korena
00050000-55dc-393d-49f3-0aa66a0fadbc	2201	Zgornja Kungota
00050000-55dc-393d-12ba-0316acad14ba	2316	Zgornja Ložnica
00050000-55dc-393d-79de-8816ef21c2ea	2314	Zgornja Polskava
00050000-55dc-393d-3756-8c0507af0764	2213	Zgornja Velka
00050000-55dc-393d-abb2-e18b378e52a6	4247	Zgornje Gorje
00050000-55dc-393d-9a5e-ee83c47288d9	4206	Zgornje Jezersko
00050000-55dc-393d-03b9-3bfac2f31892	2285	Zgornji Leskovec
00050000-55dc-393d-847a-6e15a4256f92	1432	Zidani Most
00050000-55dc-393d-7d3f-5f471334c7f7	3214	Zreče
00050000-55dc-393d-e7ae-80ac07127c53	4209	Žabnica
00050000-55dc-393d-a616-6f98317a4f21	3310	Žalec
00050000-55dc-393d-27bb-2ba71086332f	4228	Železniki
00050000-55dc-393d-e0ad-7af4e3b30c6e	2287	Žetale
00050000-55dc-393d-bd16-bf2adf261a04	4226	Žiri
00050000-55dc-393d-517c-126f19cf432a	4274	Žirovnica
00050000-55dc-393d-d0b1-840d2e8b33f7	8360	Žužemberk
\.


--
-- TOC entry 2918 (class 0 OID 15483445)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 15483252)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 15483330)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 15483457)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2943 (class 0 OID 15483794)
-- Dependencies: 225
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2944 (class 0 OID 15483804)
-- Dependencies: 226
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55dc-393e-208c-cf40881e9958	00080000-55dc-393e-5fe3-444ff45f7b85	0987	AK
00190000-55dc-393e-7817-ae478d01465c	00080000-55dc-393e-57d7-aaea11f22b06	0989	AK
00190000-55dc-393e-71f2-0dfbb2d16a69	00080000-55dc-393e-8aad-be5872b275ba	0986	AK
00190000-55dc-393e-48d7-3f1225d35f50	00080000-55dc-393e-8c08-25254db0d1ca	0984	AK
00190000-55dc-393e-3e3f-cab99332843c	00080000-55dc-393e-8d45-821d0eb1b200	0983	AK
00190000-55dc-393e-998c-377e59afa317	00080000-55dc-393e-f4dc-a22f8aa4af06	0982	AK
00190000-55dc-393f-6c19-3070256435e7	00080000-55dc-393f-a8a8-4b5b9672b397	1001	AK
\.


--
-- TOC entry 2942 (class 0 OID 15483750)
-- Dependencies: 224
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55dc-393e-e321-471d91815de6	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2945 (class 0 OID 15483812)
-- Dependencies: 227
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2924 (class 0 OID 15483486)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55dc-393e-080b-02834377af2e	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55dc-393e-2d9a-83a1969b9313	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55dc-393e-09ea-76f6f6c0f256	0003	Kazinska	t	84	Kazinska dvorana
00220000-55dc-393e-7484-e1d070dd5470	0004	Mali oder	t	24	Mali oder 
00220000-55dc-393e-e5bd-c73c6f607cde	0005	Komorni oder	t	15	Komorni oder
00220000-55dc-393e-872c-f765c27c8abd	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55dc-393e-b62c-325448af8bda	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2916 (class 0 OID 15483430)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2915 (class 0 OID 15483420)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 15483605)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 15483554)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 15483125)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55dc-393f-a8a8-4b5b9672b397	00010000-55dc-393d-7bd9-87ea711c181f	2015-08-25 11:45:35	INS	a:0:{}
2	App\\Entity\\Option	00000000-55dc-393f-9dd0-63aebf5847c0	00010000-55dc-393d-7bd9-87ea711c181f	2015-08-25 11:45:35	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55dc-393f-6c19-3070256435e7	00010000-55dc-393d-7bd9-87ea711c181f	2015-08-25 11:45:35	INS	a:0:{}
\.


--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2925 (class 0 OID 15483496)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 15483163)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55dc-393d-88a1-09fa7737634d	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55dc-393d-a0f5-dc770ad9a8d5	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55dc-393d-6f5b-6391cdfeabf2	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55dc-393d-74de-93aaf21615ee	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55dc-393d-a81d-49075d0a78c8	planer	Planer dogodkov v koledarju	t
00020000-55dc-393d-19c9-1196aaa3c7e8	kadrovska	Kadrovska služba	t
00020000-55dc-393d-5661-b74f6967329c	arhivar	Ažuriranje arhivalij	t
00020000-55dc-393d-c4a8-a3fe1c8062d5	igralec	Igralec	t
00020000-55dc-393d-8837-094ee9de0e8a	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55dc-393e-dd6d-81285a5a4adf	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2891 (class 0 OID 15483147)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55dc-393d-e7dd-556d16cb7c5f	00020000-55dc-393d-6f5b-6391cdfeabf2
00010000-55dc-393d-7bd9-87ea711c181f	00020000-55dc-393d-6f5b-6391cdfeabf2
00010000-55dc-393e-5092-00feb45598d6	00020000-55dc-393e-dd6d-81285a5a4adf
\.


--
-- TOC entry 2927 (class 0 OID 15483510)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2919 (class 0 OID 15483451)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2913 (class 0 OID 15483397)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 15483853)
-- Dependencies: 232
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55dc-393d-d09c-01bc7768c19f	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55dc-393d-2662-8785e5e18f2e	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55dc-393d-6f47-2920028318b5	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55dc-393d-aea1-b7f342a37b56	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55dc-393d-cbac-50851528ac33	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2949 (class 0 OID 15483845)
-- Dependencies: 231
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55dc-393d-acfe-fb320b8f27c0	00230000-55dc-393d-aea1-b7f342a37b56	popa
00240000-55dc-393d-8d08-835fb6175547	00230000-55dc-393d-aea1-b7f342a37b56	oseba
00240000-55dc-393d-e446-dcf5993586ad	00230000-55dc-393d-aea1-b7f342a37b56	sezona
00240000-55dc-393d-9521-c56743f67061	00230000-55dc-393d-2662-8785e5e18f2e	prostor
00240000-55dc-393d-3421-6f36e1ec19f6	00230000-55dc-393d-aea1-b7f342a37b56	besedilo
00240000-55dc-393d-931d-0a425578f8e4	00230000-55dc-393d-aea1-b7f342a37b56	uprizoritev
00240000-55dc-393d-0d2a-5de920fb457b	00230000-55dc-393d-aea1-b7f342a37b56	funkcija
00240000-55dc-393d-684e-868a270cfa50	00230000-55dc-393d-aea1-b7f342a37b56	tipfunkcije
00240000-55dc-393d-9128-f61766acd00d	00230000-55dc-393d-aea1-b7f342a37b56	alternacija
00240000-55dc-393d-3116-f1b3b4188f0b	00230000-55dc-393d-d09c-01bc7768c19f	pogodba
00240000-55dc-393d-be37-9fcf1bcbc1b5	00230000-55dc-393d-aea1-b7f342a37b56	zaposlitev
00240000-55dc-393d-ce7a-3371e666fa00	00230000-55dc-393d-d09c-01bc7768c19f	programdela
00240000-55dc-393d-0b6e-d5e129b6977f	00230000-55dc-393d-aea1-b7f342a37b56	zapis
\.


--
-- TOC entry 2948 (class 0 OID 15483840)
-- Dependencies: 230
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
a39f7bb1-7a45-4503-806c-bbac74c8d646	00230000-55dc-393d-aea1-b7f342a37b56	0	1001
\.


--
-- TOC entry 2932 (class 0 OID 15483564)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55dc-393e-7924-b2bfe783096d	000e0000-55dc-393e-5252-7474630bb73c	00080000-55dc-393e-0f1d-e1a53c3b7e48	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55dc-393e-daca-1a38f7ddf146	000e0000-55dc-393e-5252-7474630bb73c	00080000-55dc-393e-0f1d-e1a53c3b7e48	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55dc-393e-a4f3-c6f746b34f53	000e0000-55dc-393e-5252-7474630bb73c	00080000-55dc-393e-5764-46651c5461d6	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2898 (class 0 OID 15483225)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2914 (class 0 OID 15483407)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55dc-393e-b1e0-ae03a073f4af	00180000-55dc-393e-275f-c8edf7020d07	000c0000-55dc-393e-b934-43c16d039301	00090000-55dc-393e-3b57-0f422bad5b92	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dc-393e-9e79-174fc6758e51	00180000-55dc-393e-275f-c8edf7020d07	000c0000-55dc-393e-3ef7-9e03b3bfcbb2	00090000-55dc-393e-2f16-b1a96cddddc3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dc-393e-9a75-901d9f2d3cbd	00180000-55dc-393e-275f-c8edf7020d07	000c0000-55dc-393e-1be8-1a6c5a61b349	00090000-55dc-393e-2c2a-5a1487575e98	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dc-393e-1e8d-f6803c3d9472	00180000-55dc-393e-275f-c8edf7020d07	000c0000-55dc-393e-6604-fe8bc1cb97e2	00090000-55dc-393e-19df-926a146ea070	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dc-393e-7c9e-4a0e2d4ee769	00180000-55dc-393e-275f-c8edf7020d07	000c0000-55dc-393e-11be-4ec8bc185b3f	00090000-55dc-393e-0c07-167c549d5c2b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dc-393e-b38d-9af7c70c526d	00180000-55dc-393e-f534-f1e651bdc6c4	\N	00090000-55dc-393e-0c07-167c549d5c2b	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2934 (class 0 OID 15483594)
-- Dependencies: 216
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55dc-393d-64ea-1ed6909cfeea	Avtor	Avtorji	Avtorka	umetnik
000f0000-55dc-393d-f00d-50cec64c8908	Priredba	Priredba	Priredba	umetnik
000f0000-55dc-393d-3905-bc6d1f50aa2c	Prevod	Prevod	Prevod	umetnik
000f0000-55dc-393d-abda-691dcfee4fa9	Režija	Režija	Režija	umetnik
000f0000-55dc-393d-0883-00b2ffec852c	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55dc-393d-cb3d-f4fd30b52f6d	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55dc-393d-605c-f68a57b98dc8	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55dc-393d-8f56-c8b5de1dae2c	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55dc-393d-50b2-a8acc2eed26c	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55dc-393d-baa2-425687743880	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55dc-393d-fbaa-03294c90e42a	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55dc-393d-0c12-5465a2d75fea	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55dc-393d-1793-440a8b60ed2e	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55dc-393d-f9e2-6959da1b8da3	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55dc-393d-8e78-31715077268b	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55dc-393d-4061-a86556d35362	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55dc-393d-5174-c16843e76540	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55dc-393d-c6c4-ac17ce94ba14	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2946 (class 0 OID 15483822)
-- Dependencies: 228
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55dc-393d-4028-2b376178ad6f	01	Velika predstava	f	1.00	1.00
002b0000-55dc-393d-2235-6887a11f74c0	02	Mala predstava	f	0.50	0.50
002b0000-55dc-393d-a6ac-17c29d9cb962	03	Mala koprodukcija	t	0.40	1.00
002b0000-55dc-393d-e64d-426c65718018	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55dc-393d-0412-5783b9e83e8b	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2903 (class 0 OID 15483287)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 15483134)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55dc-393d-7bd9-87ea711c181f	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROthk3bHX3cxkOn0ViWCVfPA/vKFbH0PW	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55dc-393e-480e-bafcee9901e2	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55dc-393e-d7b2-5ee401da7beb	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55dc-393e-14e7-5b7c348ac79b	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55dc-393e-6b05-81f81f596450	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55dc-393e-5f51-7f6d725c62c4	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55dc-393e-a548-812bc11f0142	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55dc-393e-31ab-244f3f8aeedb	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55dc-393e-68c7-cab6cf0da21a	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55dc-393e-25b4-810d347f794e	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55dc-393e-5092-00feb45598d6	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55dc-393d-e7dd-556d16cb7c5f	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2938 (class 0 OID 15483642)
-- Dependencies: 220
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55dc-393e-8378-5ee89082bcae	00160000-55dc-393e-83f1-1edaf44c28c1	00150000-55dc-393d-3310-86c03934553a	00140000-55dc-393d-5760-d595303c31f4	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55dc-393e-e5bd-c73c6f607cde
000e0000-55dc-393e-5252-7474630bb73c	00160000-55dc-393e-b4fa-11f5518553d9	00150000-55dc-393d-42fb-86693819f2e5	00140000-55dc-393d-72ca-6f07386a5168	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55dc-393e-872c-f765c27c8abd
000e0000-55dc-393e-99e1-c689205d4cf4	\N	00150000-55dc-393d-42fb-86693819f2e5	00140000-55dc-393d-72ca-6f07386a5168	00190000-55dc-393e-208c-cf40881e9958	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55dc-393e-e5bd-c73c6f607cde
000e0000-55dc-393e-d5f1-214e262734b7	\N	00150000-55dc-393d-42fb-86693819f2e5	00140000-55dc-393d-72ca-6f07386a5168	00190000-55dc-393e-208c-cf40881e9958	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55dc-393e-e5bd-c73c6f607cde
000e0000-55dc-393e-2a4d-c0784775f546	\N	00150000-55dc-393d-42fb-86693819f2e5	00140000-55dc-393d-72ca-6f07386a5168	00190000-55dc-393e-208c-cf40881e9958	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55dc-393e-080b-02834377af2e
000e0000-55dc-393e-2887-753c157338f9	\N	00150000-55dc-393d-42fb-86693819f2e5	00140000-55dc-393d-72ca-6f07386a5168	00190000-55dc-393e-208c-cf40881e9958	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f		00220000-55dc-393e-080b-02834377af2e
\.


--
-- TOC entry 2908 (class 0 OID 15483349)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55dc-393e-8af8-7ca0c554c88b	000e0000-55dc-393e-5252-7474630bb73c	1	
00200000-55dc-393e-00d9-cc94541e6ab6	000e0000-55dc-393e-5252-7474630bb73c	2	
\.


--
-- TOC entry 2923 (class 0 OID 15483478)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 15483892)
-- Dependencies: 234
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 15483864)
-- Dependencies: 233
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 15483904)
-- Dependencies: 235
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 15483547)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55dc-393e-8c25-b978e4378907	00090000-55dc-393e-2f16-b1a96cddddc3	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dc-393e-4fa0-ae6d1d6953b1	00090000-55dc-393e-2c2a-5a1487575e98	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dc-393e-f777-aafae6f7afb6	00090000-55dc-393e-abcf-0f9b0b7f2705	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dc-393e-378b-7fd6bb87bd38	00090000-55dc-393e-17c4-15b1cbec5f82	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dc-393e-2439-71e873ffbf28	00090000-55dc-393e-3b57-0f422bad5b92	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dc-393e-ed4b-9c2c65058fce	00090000-55dc-393e-d381-d2e29aee8136	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2910 (class 0 OID 15483381)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 15483632)
-- Dependencies: 219
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55dc-393d-5760-d595303c31f4	01	Drama	drama (SURS 01)
00140000-55dc-393d-43dc-5335c1c68945	02	Opera	opera (SURS 02)
00140000-55dc-393d-4354-60de9039ca62	03	Balet	balet (SURS 03)
00140000-55dc-393d-8536-bd590b422f80	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55dc-393d-8959-3ece8b2314b2	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55dc-393d-72ca-6f07386a5168	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55dc-393d-e5bf-8fb20596cde0	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2929 (class 0 OID 15483537)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55dc-393d-925d-efd89c00690c	01	Opera	opera
00150000-55dc-393d-cf45-d01d5b2c30e7	02	Opereta	opereta
00150000-55dc-393d-9fa6-8c7095419bc6	03	Balet	balet
00150000-55dc-393d-1405-ed08dc09ca21	04	Plesne prireditve	plesne prireditve
00150000-55dc-393d-6d75-7e5f969065b0	05	Lutkovno gledališče	lutkovno gledališče
00150000-55dc-393d-de67-42ade96dfb16	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55dc-393d-054c-55c4c4dd944b	07	Biografska drama	biografska drama
00150000-55dc-393d-3310-86c03934553a	08	Komedija	komedija
00150000-55dc-393d-dc40-769d0550ab46	09	Črna komedija	črna komedija
00150000-55dc-393d-b113-009fbe29d6de	10	E-igra	E-igra
00150000-55dc-393d-42fb-86693819f2e5	11	Kriminalka	kriminalka
00150000-55dc-393d-fe2c-d4caec3da2dc	12	Musical	musical
\.


--
-- TOC entry 2440 (class 2606 OID 15483188)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 15483689)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 15483679)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 15483593)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 15483944)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 15483371)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 15483396)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 15483838)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 15483313)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 15483744)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 15483533)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 15483347)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 15483390)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 15483327)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 15483443)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 15483921)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 15483928)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2681 (class 2606 OID 15483952)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 15483470)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 15483285)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2444 (class 2606 OID 15483197)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2447 (class 2606 OID 15483221)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 15483177)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2431 (class 2606 OID 15483162)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 15483476)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 15483509)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 15483627)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 15483249)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 15483273)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 15483449)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 15483263)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 15483334)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 15483461)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 15483801)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 15483809)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 15483792)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 15483820)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 15483493)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 15483434)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 15483425)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 15483615)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 15483561)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 15483133)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 15483500)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 15483151)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2433 (class 2606 OID 15483171)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 15483518)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 15483456)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 15483405)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 15483862)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 15483850)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 15483844)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 15483574)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2453 (class 2606 OID 15483230)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 15483416)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 15483604)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 15483832)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 15483298)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 15483146)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 15483658)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 15483356)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 15483484)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 15483902)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 15483886)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 15483910)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 15483552)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 15483385)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 15483640)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 15483545)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 1259 OID 15483378)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2581 (class 1259 OID 15483575)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2582 (class 1259 OID 15483576)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2667 (class 1259 OID 15483923)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2668 (class 1259 OID 15483922)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2454 (class 1259 OID 15483251)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2546 (class 1259 OID 15483477)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2654 (class 1259 OID 15483890)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2655 (class 1259 OID 15483889)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2656 (class 1259 OID 15483891)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2657 (class 1259 OID 15483888)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2658 (class 1259 OID 15483887)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2540 (class 1259 OID 15483463)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2541 (class 1259 OID 15483462)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2491 (class 1259 OID 15483357)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2568 (class 1259 OID 15483534)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 15483536)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2570 (class 1259 OID 15483535)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2479 (class 1259 OID 15483329)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2480 (class 1259 OID 15483328)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2637 (class 1259 OID 15483821)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2591 (class 1259 OID 15483629)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2592 (class 1259 OID 15483630)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 15483631)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2664 (class 1259 OID 15483911)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2600 (class 1259 OID 15483663)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2601 (class 1259 OID 15483660)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2602 (class 1259 OID 15483664)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2603 (class 1259 OID 15483662)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2604 (class 1259 OID 15483661)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2469 (class 1259 OID 15483300)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2470 (class 1259 OID 15483299)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2445 (class 1259 OID 15483224)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2556 (class 1259 OID 15483501)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2509 (class 1259 OID 15483391)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2435 (class 1259 OID 15483178)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2436 (class 1259 OID 15483179)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2561 (class 1259 OID 15483521)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2562 (class 1259 OID 15483520)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2563 (class 1259 OID 15483519)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2483 (class 1259 OID 15483335)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2484 (class 1259 OID 15483337)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2485 (class 1259 OID 15483336)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2647 (class 1259 OID 15483852)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2520 (class 1259 OID 15483429)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2521 (class 1259 OID 15483427)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2522 (class 1259 OID 15483426)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2523 (class 1259 OID 15483428)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2426 (class 1259 OID 15483152)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2427 (class 1259 OID 15483153)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2549 (class 1259 OID 15483485)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2677 (class 1259 OID 15483945)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2678 (class 1259 OID 15483953)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2679 (class 1259 OID 15483954)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2535 (class 1259 OID 15483450)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2577 (class 1259 OID 15483562)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2578 (class 1259 OID 15483563)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2621 (class 1259 OID 15483749)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2622 (class 1259 OID 15483748)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2623 (class 1259 OID 15483745)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2624 (class 1259 OID 15483746)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2625 (class 1259 OID 15483747)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2458 (class 1259 OID 15483265)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2459 (class 1259 OID 15483264)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2460 (class 1259 OID 15483266)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2629 (class 1259 OID 15483802)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2630 (class 1259 OID 15483803)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2614 (class 1259 OID 15483693)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2615 (class 1259 OID 15483694)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2616 (class 1259 OID 15483691)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2617 (class 1259 OID 15483692)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2574 (class 1259 OID 15483553)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 15483438)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2527 (class 1259 OID 15483437)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2528 (class 1259 OID 15483435)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2529 (class 1259 OID 15483436)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2610 (class 1259 OID 15483681)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2611 (class 1259 OID 15483680)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2626 (class 1259 OID 15483793)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2490 (class 1259 OID 15483348)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2644 (class 1259 OID 15483839)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2671 (class 1259 OID 15483929)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2672 (class 1259 OID 15483930)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2441 (class 1259 OID 15483199)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2442 (class 1259 OID 15483198)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2450 (class 1259 OID 15483231)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2451 (class 1259 OID 15483232)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2515 (class 1259 OID 15483419)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 15483418)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2517 (class 1259 OID 15483417)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2497 (class 1259 OID 15483380)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2498 (class 1259 OID 15483376)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2499 (class 1259 OID 15483373)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2500 (class 1259 OID 15483374)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2501 (class 1259 OID 15483372)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2502 (class 1259 OID 15483377)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2503 (class 1259 OID 15483375)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2457 (class 1259 OID 15483250)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2475 (class 1259 OID 15483314)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 15483316)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2477 (class 1259 OID 15483315)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2478 (class 1259 OID 15483317)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2534 (class 1259 OID 15483444)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2596 (class 1259 OID 15483628)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 15483659)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2448 (class 1259 OID 15483222)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2449 (class 1259 OID 15483223)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2571 (class 1259 OID 15483546)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2653 (class 1259 OID 15483863)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2468 (class 1259 OID 15483286)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 15483851)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2554 (class 1259 OID 15483495)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2555 (class 1259 OID 15483494)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2618 (class 1259 OID 15483690)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2465 (class 1259 OID 15483274)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 15483641)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 15483903)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2635 (class 1259 OID 15483810)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2636 (class 1259 OID 15483811)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2514 (class 1259 OID 15483406)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2434 (class 1259 OID 15483172)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2504 (class 1259 OID 15483379)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2707 (class 2606 OID 15484090)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2710 (class 2606 OID 15484075)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2709 (class 2606 OID 15484080)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2705 (class 2606 OID 15484100)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2711 (class 2606 OID 15484070)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2706 (class 2606 OID 15484095)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2708 (class 2606 OID 15484085)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2741 (class 2606 OID 15484245)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2740 (class 2606 OID 15484250)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2774 (class 2606 OID 15484420)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2775 (class 2606 OID 15484415)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2692 (class 2606 OID 15484005)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2728 (class 2606 OID 15484185)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2769 (class 2606 OID 15484400)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2770 (class 2606 OID 15484395)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2768 (class 2606 OID 15484405)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2771 (class 2606 OID 15484390)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2772 (class 2606 OID 15484385)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2726 (class 2606 OID 15484180)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2727 (class 2606 OID 15484175)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2704 (class 2606 OID 15484065)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2736 (class 2606 OID 15484215)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2734 (class 2606 OID 15484225)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2735 (class 2606 OID 15484220)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2698 (class 2606 OID 15484040)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2699 (class 2606 OID 15484035)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2724 (class 2606 OID 15484165)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2765 (class 2606 OID 15484370)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2744 (class 2606 OID 15484255)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2743 (class 2606 OID 15484260)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2742 (class 2606 OID 15484265)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2773 (class 2606 OID 15484410)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2746 (class 2606 OID 15484285)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2749 (class 2606 OID 15484270)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2745 (class 2606 OID 15484290)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2747 (class 2606 OID 15484280)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2748 (class 2606 OID 15484275)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2696 (class 2606 OID 15484030)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2697 (class 2606 OID 15484025)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2688 (class 2606 OID 15483990)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2689 (class 2606 OID 15483985)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2730 (class 2606 OID 15484195)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2712 (class 2606 OID 15484105)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2685 (class 2606 OID 15483965)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2684 (class 2606 OID 15483970)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2731 (class 2606 OID 15484210)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2732 (class 2606 OID 15484205)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2733 (class 2606 OID 15484200)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2702 (class 2606 OID 15484045)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2700 (class 2606 OID 15484055)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2701 (class 2606 OID 15484050)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2767 (class 2606 OID 15484380)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2716 (class 2606 OID 15484140)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2718 (class 2606 OID 15484130)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2719 (class 2606 OID 15484125)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2717 (class 2606 OID 15484135)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2683 (class 2606 OID 15483955)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2682 (class 2606 OID 15483960)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2729 (class 2606 OID 15484190)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2778 (class 2606 OID 15484435)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2780 (class 2606 OID 15484440)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2779 (class 2606 OID 15484445)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2725 (class 2606 OID 15484170)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2739 (class 2606 OID 15484235)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2738 (class 2606 OID 15484240)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2756 (class 2606 OID 15484345)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2757 (class 2606 OID 15484340)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2760 (class 2606 OID 15484325)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2759 (class 2606 OID 15484330)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2758 (class 2606 OID 15484335)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2694 (class 2606 OID 15484015)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2695 (class 2606 OID 15484010)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2693 (class 2606 OID 15484020)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2763 (class 2606 OID 15484355)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2762 (class 2606 OID 15484360)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2753 (class 2606 OID 15484315)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2752 (class 2606 OID 15484320)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2755 (class 2606 OID 15484305)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2754 (class 2606 OID 15484310)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2737 (class 2606 OID 15484230)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2720 (class 2606 OID 15484160)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2721 (class 2606 OID 15484155)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2723 (class 2606 OID 15484145)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2722 (class 2606 OID 15484150)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2750 (class 2606 OID 15484300)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2751 (class 2606 OID 15484295)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2761 (class 2606 OID 15484350)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2703 (class 2606 OID 15484060)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2764 (class 2606 OID 15484365)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2766 (class 2606 OID 15484375)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2777 (class 2606 OID 15484425)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2776 (class 2606 OID 15484430)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2686 (class 2606 OID 15483980)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2687 (class 2606 OID 15483975)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2691 (class 2606 OID 15483995)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2690 (class 2606 OID 15484000)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2713 (class 2606 OID 15484120)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2714 (class 2606 OID 15484115)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2715 (class 2606 OID 15484110)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-25 11:45:36 CEST

--
-- PostgreSQL database dump complete
--

