--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-31 10:27:51 CEST

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
-- TOC entry 177 (class 1259 OID 16525740)
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
-- TOC entry 223 (class 1259 OID 16526256)
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
-- TOC entry 222 (class 1259 OID 16526239)
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
-- TOC entry 216 (class 1259 OID 16526149)
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
-- TOC entry 239 (class 1259 OID 16526505)
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
-- TOC entry 191 (class 1259 OID 16525918)
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
-- TOC entry 194 (class 1259 OID 16525952)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 16526407)
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
-- TOC entry 186 (class 1259 OID 16525861)
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
-- TOC entry 224 (class 1259 OID 16526269)
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
-- TOC entry 210 (class 1259 OID 16526084)
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
-- TOC entry 189 (class 1259 OID 16525898)
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
-- TOC entry 193 (class 1259 OID 16525946)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 16525878)
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
-- TOC entry 199 (class 1259 OID 16525999)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 237 (class 1259 OID 16526486)
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
-- TOC entry 238 (class 1259 OID 16526498)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 16526520)
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
-- TOC entry 203 (class 1259 OID 16526024)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 16525835)
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
-- TOC entry 178 (class 1259 OID 16525749)
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
-- TOC entry 179 (class 1259 OID 16525760)
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
-- TOC entry 174 (class 1259 OID 16525714)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 16525733)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 16526031)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 16526064)
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
-- TOC entry 219 (class 1259 OID 16526188)
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
-- TOC entry 181 (class 1259 OID 16525793)
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
-- TOC entry 183 (class 1259 OID 16525827)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 16526005)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 16525812)
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
-- TOC entry 188 (class 1259 OID 16525890)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 16526017)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 16526368)
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
-- TOC entry 227 (class 1259 OID 16526378)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 16526324)
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
-- TOC entry 228 (class 1259 OID 16526386)
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
-- TOC entry 206 (class 1259 OID 16526046)
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
-- TOC entry 198 (class 1259 OID 16525990)
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
-- TOC entry 197 (class 1259 OID 16525980)
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
-- TOC entry 218 (class 1259 OID 16526177)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 16526116)
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
-- TOC entry 171 (class 1259 OID 16525685)
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
-- TOC entry 170 (class 1259 OID 16525683)
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
-- TOC entry 207 (class 1259 OID 16526058)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 16525723)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 16525707)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 16526072)
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
-- TOC entry 201 (class 1259 OID 16526011)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 16525957)
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
-- TOC entry 233 (class 1259 OID 16526427)
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
-- TOC entry 232 (class 1259 OID 16526419)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 16526414)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 16526126)
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
-- TOC entry 180 (class 1259 OID 16525785)
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
-- TOC entry 196 (class 1259 OID 16525967)
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
-- TOC entry 217 (class 1259 OID 16526166)
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
-- TOC entry 229 (class 1259 OID 16526396)
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
-- TOC entry 185 (class 1259 OID 16525847)
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
-- TOC entry 172 (class 1259 OID 16525694)
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
-- TOC entry 221 (class 1259 OID 16526214)
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
-- TOC entry 190 (class 1259 OID 16525909)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 16526038)
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
-- TOC entry 215 (class 1259 OID 16526140)
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
-- TOC entry 235 (class 1259 OID 16526466)
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
-- TOC entry 234 (class 1259 OID 16526438)
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
-- TOC entry 236 (class 1259 OID 16526478)
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
-- TOC entry 212 (class 1259 OID 16526109)
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
-- TOC entry 192 (class 1259 OID 16525941)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 16526204)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 16526099)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 16525688)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2911 (class 0 OID 16525740)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2957 (class 0 OID 16526256)
-- Dependencies: 223
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55e4-1005-4a14-43f9590693b7	000d0000-55e4-1005-9186-cde0c7aa2a39	\N	00090000-55e4-1005-c12c-8f4477f79f5e	000b0000-55e4-1005-5857-5f720f98bb87	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55e4-1005-24fe-afed49215808	000d0000-55e4-1005-1d70-927a7221e1fd	00100000-55e4-1005-72e2-d5e2a64bfad4	00090000-55e4-1005-f6e3-ec56d4f602d8	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55e4-1005-d0ea-48b3bf8aa617	000d0000-55e4-1005-b406-386f121c3e10	00100000-55e4-1005-ea3c-a7bdcf8ac8ca	00090000-55e4-1005-dd9c-35eb0ed8f1c0	\N	0003	t	\N	2015-08-31	\N	2	\N	\N	f	f
000c0000-55e4-1005-3c36-54f0aa46d888	000d0000-55e4-1005-a6ca-e30745ba970c	\N	00090000-55e4-1005-544c-313df33d4a3d	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55e4-1005-3cc9-ed97bdb651d7	000d0000-55e4-1005-d29f-596128a679fd	\N	00090000-55e4-1005-1e4f-01bbbd3c9178	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55e4-1005-f028-97d261037d00	000d0000-55e4-1005-509d-572a6580e499	\N	00090000-55e4-1005-d2b5-f88c2ab583fd	000b0000-55e4-1005-6f24-009177e6c7e3	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55e4-1005-4e4d-72a3fafc2a5c	000d0000-55e4-1005-40c4-39b731365889	00100000-55e4-1005-4c6a-a13463ce7152	00090000-55e4-1005-a675-9c59ec5a2f70	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55e4-1005-6ac0-42d746a48d98	000d0000-55e4-1005-a553-cce3a32af40c	\N	00090000-55e4-1005-fa90-4254d8e3615a	000b0000-55e4-1005-3b38-cee6c604be8d	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55e4-1005-e284-ce4b2d64ef76	000d0000-55e4-1005-40c4-39b731365889	00100000-55e4-1005-b2be-2e59318eee53	00090000-55e4-1005-c605-6265f9b70dc6	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55e4-1005-dded-a6f2683f9c67	000d0000-55e4-1005-40c4-39b731365889	00100000-55e4-1005-42f5-bdb6cbd6e2e5	00090000-55e4-1005-3b96-7cef33f84233	\N	0010	t	\N	2015-08-31	\N	16	\N	\N	f	t
000c0000-55e4-1005-2f54-29268ce52338	000d0000-55e4-1005-40c4-39b731365889	00100000-55e4-1005-da27-7db2f6b25501	00090000-55e4-1005-8591-1edbb2a1a57b	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2956 (class 0 OID 16526239)
-- Dependencies: 222
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 16526149)
-- Dependencies: 216
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55e4-1005-4d16-952db456db27	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55e4-1005-f4e2-53897b8c7edd	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55e4-1005-7c45-42e6f5da34ce	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2973 (class 0 OID 16526505)
-- Dependencies: 239
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2925 (class 0 OID 16525918)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55e4-1005-190c-cb17635360ba	\N	\N	00200000-55e4-1005-18df-47df5e437546	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55e4-1005-1568-a723cb8af8c7	\N	\N	00200000-55e4-1005-bfd0-beec2299add3	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55e4-1005-4c52-2fdc70925aeb	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55e4-1005-1f33-5316f7fbe7c8	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55e4-1005-1189-b16855166587	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2928 (class 0 OID 16525952)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 16526407)
-- Dependencies: 230
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 16525861)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55e4-1004-c0e2-673cb1621b55	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55e4-1004-95b6-4c3ffed294bb	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55e4-1004-044f-520fea374953	AL	ALB	008	Albania 	Albanija	\N
00040000-55e4-1004-130e-8c8257dccc34	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55e4-1004-05dc-85844386306c	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55e4-1004-2f04-a8dc0b908fb8	AD	AND	020	Andorra 	Andora	\N
00040000-55e4-1004-eeae-327977c1b6ef	AO	AGO	024	Angola 	Angola	\N
00040000-55e4-1004-bc55-a4a1dd9ea58b	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55e4-1004-dc2f-d1fa993b5503	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55e4-1004-e338-1aecffe5e068	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55e4-1004-62e2-cd4e97f30a21	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55e4-1004-2978-602aa5ae9d01	AM	ARM	051	Armenia 	Armenija	\N
00040000-55e4-1004-61c3-79491fca6705	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55e4-1004-a9ca-216feba7d848	AU	AUS	036	Australia 	Avstralija	\N
00040000-55e4-1004-c452-bc7a271363c2	AT	AUT	040	Austria 	Avstrija	\N
00040000-55e4-1004-d6ef-e2c35db3cdcd	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55e4-1004-9ba1-ce9b5440c172	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55e4-1004-2009-3486f8b00852	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55e4-1004-bc01-972aae9750ae	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55e4-1004-5e20-246f493b7d64	BB	BRB	052	Barbados 	Barbados	\N
00040000-55e4-1004-6cb0-8e7416f967a6	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55e4-1004-a9b3-7e98a89e2487	BE	BEL	056	Belgium 	Belgija	\N
00040000-55e4-1004-2a24-2802ce04a7c7	BZ	BLZ	084	Belize 	Belize	\N
00040000-55e4-1004-f7aa-dce6816b668a	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55e4-1004-9b29-365123fbf3a2	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55e4-1004-a079-7642392a6167	BT	BTN	064	Bhutan 	Butan	\N
00040000-55e4-1004-96fb-8c35db6b7978	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55e4-1004-0cbc-26bfa1ddf7f4	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55e4-1004-b97c-1e00edca75cf	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55e4-1004-4f9f-7c88844a1bfb	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55e4-1004-54e9-9568804061f2	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55e4-1004-0bea-4a5501f11c7c	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55e4-1004-1bb3-4c523cdad928	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55e4-1004-24e6-7ece7a1d7296	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55e4-1004-acdc-e6d28f5177a1	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55e4-1004-ed3b-50840e5d866f	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55e4-1004-3a81-abe1cb34d1c6	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55e4-1004-de51-bf11a9a56459	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55e4-1004-39b3-bbacb00945b9	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55e4-1004-3a26-bf2e861ed8bf	CA	CAN	124	Canada 	Kanada	\N
00040000-55e4-1004-556d-dabad04c88f7	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55e4-1004-2789-9da82a13b582	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55e4-1004-15bc-1479632c0fc8	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55e4-1004-2310-c54832901928	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55e4-1004-860d-fcb94cca96ca	CL	CHL	152	Chile 	Čile	\N
00040000-55e4-1004-44bf-f1685d6cbac2	CN	CHN	156	China 	Kitajska	\N
00040000-55e4-1004-e7dd-76229242835a	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55e4-1004-d29f-e365b9b838c3	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55e4-1004-1390-d929afedf6a3	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55e4-1004-f1c3-b59df0f2a415	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55e4-1004-7ade-0c98271144cf	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55e4-1004-745a-bc8e5aef2784	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55e4-1004-5a5b-db2529d72497	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55e4-1004-616e-53fab29e7ed9	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55e4-1004-bc85-71b2f16efc20	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55e4-1004-cf7c-8ea2e3dfd198	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55e4-1004-d778-e69fb2b47ee0	CU	CUB	192	Cuba 	Kuba	\N
00040000-55e4-1004-4576-42444827b2f4	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55e4-1004-bd3c-d5ecc8f47cb9	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55e4-1004-c257-cbecf00091bb	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55e4-1004-2fee-be277b149ffb	DK	DNK	208	Denmark 	Danska	\N
00040000-55e4-1004-532c-419631111824	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55e4-1004-7f82-7d75c69357ba	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55e4-1004-36f8-8cd4938612ff	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55e4-1004-a930-b539dac28e08	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55e4-1004-a7bd-0bf739b0102e	EG	EGY	818	Egypt 	Egipt	\N
00040000-55e4-1004-60d2-ccf67d91a843	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55e4-1004-3c8d-1e0f637b3d81	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55e4-1004-b2f9-4952a53afc67	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55e4-1004-d2b9-1be265edf7fa	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55e4-1004-c16f-3bb2b78ad00f	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55e4-1004-11a8-ce2ac393cb66	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55e4-1004-2560-333334048c3b	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55e4-1004-0576-cb858859e0f6	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55e4-1004-d046-0e46282e0da8	FI	FIN	246	Finland 	Finska	\N
00040000-55e4-1004-7425-3870e5635e3f	FR	FRA	250	France 	Francija	\N
00040000-55e4-1004-21b9-0abf117442ca	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55e4-1004-f565-5f234010a70e	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55e4-1004-c008-2ef5bd383eab	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55e4-1004-1339-0954ff47bf16	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55e4-1004-c97b-df7d53e6d177	GA	GAB	266	Gabon 	Gabon	\N
00040000-55e4-1004-c771-b19b4186b59e	GM	GMB	270	Gambia 	Gambija	\N
00040000-55e4-1004-267f-5402546c63b4	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55e4-1004-7fae-1ca4972e3289	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55e4-1004-cdbc-eea110cdfe46	GH	GHA	288	Ghana 	Gana	\N
00040000-55e4-1004-9718-f980fd665b45	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55e4-1004-7442-32c112397a55	GR	GRC	300	Greece 	Grčija	\N
00040000-55e4-1004-a633-98948ca35aa3	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55e4-1004-b008-9cb4d9a80c95	GD	GRD	308	Grenada 	Grenada	\N
00040000-55e4-1004-7b5a-297cfe8e519a	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55e4-1004-8481-5da2f6cfa87f	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55e4-1004-fb17-07b918573241	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55e4-1004-06cd-d750314a44e9	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55e4-1004-8cf6-d0e866b510ec	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55e4-1004-9536-f621cdf4695e	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55e4-1004-6844-ed800efb08b5	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55e4-1004-bb97-90f6b71976cd	HT	HTI	332	Haiti 	Haiti	\N
00040000-55e4-1004-42d6-9c68bcc66616	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55e4-1004-de39-601bc49cc230	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55e4-1004-511b-81bbb980633b	HN	HND	340	Honduras 	Honduras	\N
00040000-55e4-1004-5e0e-94067a64f3ef	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55e4-1004-ec9a-c0de61bc89fa	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55e4-1004-26c8-f6a06f1840cf	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55e4-1004-6806-d9f72c2a3e4b	IN	IND	356	India 	Indija	\N
00040000-55e4-1004-ac01-6fc8e2ce85af	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55e4-1004-660c-5022948d5b7a	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55e4-1004-80f7-f2cc2f44e89e	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55e4-1004-2175-2ec4bb9b2aee	IE	IRL	372	Ireland 	Irska	\N
00040000-55e4-1004-d4b9-ef0cfb3a5235	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55e4-1004-1023-ef30475d6011	IL	ISR	376	Israel 	Izrael	\N
00040000-55e4-1004-a627-e28c03db6dc7	IT	ITA	380	Italy 	Italija	\N
00040000-55e4-1004-6b80-df01d9278db8	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55e4-1004-4d00-c9345b0d41af	JP	JPN	392	Japan 	Japonska	\N
00040000-55e4-1004-0242-48a3b7a848af	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55e4-1004-a064-700b9abdc5c4	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55e4-1004-a826-5df88747d3ad	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55e4-1004-a1ca-d9368aad3a46	KE	KEN	404	Kenya 	Kenija	\N
00040000-55e4-1004-010c-2e42463bcff1	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55e4-1004-550e-32e50aabe6e3	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55e4-1004-3238-c8f1c2c9c270	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55e4-1004-0a11-f31055f00251	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55e4-1004-625e-ed0970b04e24	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55e4-1004-3d8f-e4e99057843c	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55e4-1004-3856-f1978ca64759	LV	LVA	428	Latvia 	Latvija	\N
00040000-55e4-1004-68cb-7f13e0bcf415	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55e4-1004-48c6-9a884a8c5351	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55e4-1004-7a0c-e4ad8ef241c0	LR	LBR	430	Liberia 	Liberija	\N
00040000-55e4-1004-718d-e7d4590127c0	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55e4-1004-56e1-a24164b45068	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55e4-1004-5d20-27e8c09c06da	LT	LTU	440	Lithuania 	Litva	\N
00040000-55e4-1004-6946-46a22d79f611	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55e4-1004-e848-eb5bb68ffa75	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55e4-1004-91c2-7311384ec036	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55e4-1004-429b-d3d106551fef	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55e4-1004-185a-56e68a9aa621	MW	MWI	454	Malawi 	Malavi	\N
00040000-55e4-1004-9070-21af953a606d	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55e4-1004-3f00-4e70436b5c63	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55e4-1004-f281-2b2761894db0	ML	MLI	466	Mali 	Mali	\N
00040000-55e4-1004-cda9-0e6e3bbbb889	MT	MLT	470	Malta 	Malta	\N
00040000-55e4-1004-b9de-38d40e705986	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55e4-1004-7a46-04467c443c28	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55e4-1004-150b-131dccf5d026	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55e4-1004-5d53-5973e13284ba	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55e4-1004-df0c-4a3f2d23d9e0	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55e4-1004-8d7b-a9d1b87c627e	MX	MEX	484	Mexico 	Mehika	\N
00040000-55e4-1004-8223-845d26d2854e	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55e4-1004-f5fc-75b3af818c69	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55e4-1004-520a-a46a0e08a55d	MC	MCO	492	Monaco 	Monako	\N
00040000-55e4-1004-3012-d7cccaa0a761	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55e4-1004-03db-a51c9647430e	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55e4-1004-5740-3fb582f691e9	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55e4-1004-e54f-86fcf00f75d9	MA	MAR	504	Morocco 	Maroko	\N
00040000-55e4-1004-2289-6bbd28eb89b1	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55e4-1004-49db-904bbe5b3b6f	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55e4-1004-27b7-133d48073efe	NA	NAM	516	Namibia 	Namibija	\N
00040000-55e4-1004-95b6-d5cf97ff97ca	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55e4-1004-a1ae-ab90cac9dde0	NP	NPL	524	Nepal 	Nepal	\N
00040000-55e4-1004-a66e-4e4ee0935d2d	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55e4-1004-db50-2ab51f0af252	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55e4-1004-1e9c-04c2006cf6f1	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55e4-1004-fa75-f1e27d97d598	NE	NER	562	Niger 	Niger 	\N
00040000-55e4-1004-f0a4-2a7a90334c6f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55e4-1004-9607-5b8b652c6bc0	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55e4-1004-e34a-01f15bc45a3d	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55e4-1004-6803-3e6e9ca74020	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55e4-1004-429e-1ea43c8c8956	NO	NOR	578	Norway 	Norveška	\N
00040000-55e4-1004-0426-1771efcfa9e7	OM	OMN	512	Oman 	Oman	\N
00040000-55e4-1004-8e4b-c75903636bb2	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55e4-1004-9d09-54e13f62d347	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55e4-1004-689d-7192ce9ef8a1	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55e4-1004-13b8-723d356d198c	PA	PAN	591	Panama 	Panama	\N
00040000-55e4-1004-dc18-543f7f4d1ef0	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55e4-1004-a859-052c16d51673	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55e4-1004-86d3-8dd62b01cf49	PE	PER	604	Peru 	Peru	\N
00040000-55e4-1004-52e7-1282ed951deb	PH	PHL	608	Philippines 	Filipini	\N
00040000-55e4-1004-c788-6273e4c34ac6	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55e4-1004-e8a3-83860036008e	PL	POL	616	Poland 	Poljska	\N
00040000-55e4-1004-0972-d7c026ee55c4	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55e4-1004-313e-f2f19d8f0bea	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55e4-1004-f543-63fc08b32a3c	QA	QAT	634	Qatar 	Katar	\N
00040000-55e4-1004-70bc-0ab3cef055df	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55e4-1004-26e6-45e310fe09c6	RO	ROU	642	Romania 	Romunija	\N
00040000-55e4-1004-496c-3957fe8cfbee	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55e4-1004-d497-b71952ad78a4	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55e4-1004-d860-8b3d4b00c1b4	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55e4-1004-6ca2-66575b9f0473	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55e4-1004-c5be-fdce83392ec0	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55e4-1004-2921-2abb1c16d23c	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55e4-1004-cdc8-615945f578fd	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55e4-1004-15f3-12ce371d8be4	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55e4-1004-b90b-17321338917e	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55e4-1004-60e1-e6e4fd95b54e	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55e4-1004-66e5-82c37c42da28	SM	SMR	674	San Marino 	San Marino	\N
00040000-55e4-1004-04a5-2f64e2fa28dc	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55e4-1004-f7a8-7f05d8480c45	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55e4-1004-0702-6cccc3c259c6	SN	SEN	686	Senegal 	Senegal	\N
00040000-55e4-1004-e60d-c05f8e455a59	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55e4-1004-dfbb-2c4e44700374	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55e4-1004-1d26-a02989ea4a37	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55e4-1004-38ff-8eb07629e969	SG	SGP	702	Singapore 	Singapur	\N
00040000-55e4-1004-c1e5-ff5056ee95d7	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55e4-1004-350a-3952f7ef14f2	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55e4-1004-0f1c-64d5846aa53b	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55e4-1004-9665-a88b8af396c7	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55e4-1004-1f77-3d8d1192de99	SO	SOM	706	Somalia 	Somalija	\N
00040000-55e4-1004-f96a-80f091d2480a	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55e4-1004-ab75-41a7b5355d46	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55e4-1004-6754-84257fa784f8	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55e4-1004-1eb4-6e47a5f91852	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55e4-1004-a0e0-cca42655854b	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55e4-1004-2820-bba58d087d7b	SD	SDN	729	Sudan 	Sudan	\N
00040000-55e4-1004-6b89-c6866e59fb56	SR	SUR	740	Suriname 	Surinam	\N
00040000-55e4-1004-1e88-cc6de1125546	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55e4-1004-4e96-0a65f1031ff8	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55e4-1004-d3dc-04f3ec004345	SE	SWE	752	Sweden 	Švedska	\N
00040000-55e4-1004-c2d5-920bee388f0f	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55e4-1004-a6fd-c5e6536b1255	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55e4-1004-32c6-c199801d9dcc	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55e4-1004-d93c-bc2cedd9b4b7	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55e4-1004-da38-8f93cd6317ed	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55e4-1004-d621-59e5170a1ddf	TH	THA	764	Thailand 	Tajska	\N
00040000-55e4-1004-c2b0-45ca3d9272b3	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55e4-1004-ec34-6417a5813c90	TG	TGO	768	Togo 	Togo	\N
00040000-55e4-1004-3f21-f1697312b5e6	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55e4-1004-fdec-2fe77b9ee152	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55e4-1004-d784-0bac5ab3206b	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55e4-1004-ac1a-2014109e4d55	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55e4-1004-7d17-fd426a055960	TR	TUR	792	Turkey 	Turčija	\N
00040000-55e4-1004-e9bc-1a9ebda7c90d	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55e4-1004-be45-0773551a9b68	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55e4-1004-1461-b3ee4e9f8038	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55e4-1004-f70b-ee360b0806d6	UG	UGA	800	Uganda 	Uganda	\N
00040000-55e4-1004-e47f-83a287b918f3	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55e4-1004-d8d1-a07dfe5c5674	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55e4-1004-1730-f1b62c2f3d1c	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55e4-1004-e384-469e263ee2b5	US	USA	840	United States 	Združene države Amerike	\N
00040000-55e4-1004-1973-4f047a83c2ae	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55e4-1004-1d8b-f9a16faef8a2	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55e4-1004-e25d-f6473419cc17	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55e4-1004-109a-6ddbaafbcd80	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55e4-1004-bfaf-34c2c5db1cb6	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55e4-1004-6bb0-14f5bd99ee79	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55e4-1004-2bc3-c59cbc62a713	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55e4-1004-2269-f4fea0d339a7	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55e4-1004-9c3b-3647c86d67d0	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55e4-1004-b4b8-81db6c255609	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55e4-1004-0f3a-8c0c433bd9cf	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55e4-1004-d0d0-75ce346aeacf	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55e4-1004-9337-62ce46f8dc15	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2958 (class 0 OID 16526269)
-- Dependencies: 224
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55e4-1005-4f70-2f41a85e5716	000e0000-55e4-1005-94e9-a82c90595840	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e4-1004-e7eb-88fcd80801be	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55e4-1005-aae9-29587fb2ef85	000e0000-55e4-1005-d6cf-9935a20ae8a9	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e4-1004-b2ad-69d9311e7bea	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55e4-1005-c114-fc0821661391	000e0000-55e4-1005-3926-f650aea0a60d	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e4-1004-e7eb-88fcd80801be	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55e4-1005-6874-4aec45ab7168	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55e4-1005-dac3-b6ef384dcb60	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2944 (class 0 OID 16526084)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55e4-1005-40c4-39b731365889	000e0000-55e4-1005-d6cf-9935a20ae8a9	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55e4-1004-afb0-43a5c4b96d20
000d0000-55e4-1005-9186-cde0c7aa2a39	000e0000-55e4-1005-d6cf-9935a20ae8a9	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55e4-1004-afb0-43a5c4b96d20
000d0000-55e4-1005-1d70-927a7221e1fd	000e0000-55e4-1005-d6cf-9935a20ae8a9	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55e4-1004-ea78-287b9d7f15c1
000d0000-55e4-1005-b406-386f121c3e10	000e0000-55e4-1005-d6cf-9935a20ae8a9	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55e4-1004-4441-c549ad9dc9c7
000d0000-55e4-1005-a6ca-e30745ba970c	000e0000-55e4-1005-d6cf-9935a20ae8a9	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55e4-1004-fa99-6d555f6b6d3b
000d0000-55e4-1005-d29f-596128a679fd	000e0000-55e4-1005-d6cf-9935a20ae8a9	\N	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55e4-1004-fa99-6d555f6b6d3b
000d0000-55e4-1005-509d-572a6580e499	000e0000-55e4-1005-d6cf-9935a20ae8a9	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55e4-1004-afb0-43a5c4b96d20
000d0000-55e4-1005-a553-cce3a32af40c	000e0000-55e4-1005-d6cf-9935a20ae8a9	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55e4-1004-bc93-7559337f994a
\.


--
-- TOC entry 2923 (class 0 OID 16525898)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 16525946)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2921 (class 0 OID 16525878)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55e4-1005-0c60-603586b6cf36	00080000-55e4-1005-690b-b48ac047be41	00090000-55e4-1005-3b96-7cef33f84233	AK		
\.


--
-- TOC entry 2933 (class 0 OID 16525999)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 16526486)
-- Dependencies: 237
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 16526498)
-- Dependencies: 238
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 16526520)
-- Dependencies: 240
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 16526024)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2918 (class 0 OID 16525835)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55e4-1004-8976-fdf8f97432cc	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55e4-1004-e324-6eb8d37509b5	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55e4-1004-e72b-c66eb56cb4b9	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55e4-1004-f591-4ef586590122	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55e4-1004-d5b2-481edec1eccd	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55e4-1004-da71-db7db3b7fb15	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55e4-1004-0610-08508954fc8d	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55e4-1004-11de-f3a6384c9a62	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55e4-1004-af2b-c8d9abeaeb5a	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55e4-1004-e63c-5fd465c9491c	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55e4-1004-9822-9b029c5be2c9	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55e4-1004-7cbb-641275bb101c	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55e4-1004-7620-10afb3274461	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55e4-1005-583f-93c336e346d1	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55e4-1005-46ae-08ae146007ba	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55e4-1005-87ce-a3d1a54316a2	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55e4-1005-e742-fe87d7a4ea01	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55e4-1005-2e4c-f7f5cbbd29de	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55e4-1006-8b52-280857458059	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2912 (class 0 OID 16525749)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55e4-1005-932f-953d17ba9e07	00000000-55e4-1005-583f-93c336e346d1	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55e4-1005-80d1-b6089678e67e	00000000-55e4-1005-583f-93c336e346d1	00010000-55e4-1004-3241-4afb914f3bd4	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55e4-1005-b376-a4d769dbaf25	00000000-55e4-1005-46ae-08ae146007ba	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2913 (class 0 OID 16525760)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55e4-1005-c12c-8f4477f79f5e	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55e4-1005-544c-313df33d4a3d	00010000-55e4-1005-70c5-3c08b385385d	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55e4-1005-dd9c-35eb0ed8f1c0	00010000-55e4-1005-ee3b-5a8081f251e6	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55e4-1005-c605-6265f9b70dc6	00010000-55e4-1005-bb87-7b979430e4bb	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55e4-1005-4526-5873f60a1131	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55e4-1005-d2b5-f88c2ab583fd	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55e4-1005-8591-1edbb2a1a57b	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55e4-1005-a675-9c59ec5a2f70	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55e4-1005-3b96-7cef33f84233	00010000-55e4-1005-30ed-2823dde592d7	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55e4-1005-f6e3-ec56d4f602d8	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55e4-1005-4a64-9af7256fcbfd	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55e4-1005-1e4f-01bbbd3c9178	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55e4-1005-fa90-4254d8e3615a	00010000-55e4-1005-3d83-7bd3931fea45	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2908 (class 0 OID 16525714)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55e4-1004-8778-742735fe6cc9	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55e4-1004-4aa6-7be34d788704	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55e4-1004-fb7a-d14ce533ef4a	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55e4-1004-63a1-5536a335a3da	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55e4-1004-f507-6d4a2c161a6f	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55e4-1004-5e61-bba88a8f259f	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55e4-1004-966f-89b444e4b214	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55e4-1004-efe7-1cfd4d0b1ab1	Abonma-read	Abonma - branje	f
00030000-55e4-1004-4a2a-0414d42c5089	Abonma-write	Abonma - spreminjanje	f
00030000-55e4-1004-aeb1-eece37be8764	Alternacija-read	Alternacija - branje	f
00030000-55e4-1004-26d5-33ad6524a03c	Alternacija-write	Alternacija - spreminjanje	f
00030000-55e4-1004-09c7-9b8b147faca8	Arhivalija-read	Arhivalija - branje	f
00030000-55e4-1004-813b-d2221ae35527	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55e4-1004-1750-6d61c5f1af05	Besedilo-read	Besedilo - branje	f
00030000-55e4-1004-e610-9d159aa3b1ff	Besedilo-write	Besedilo - spreminjanje	f
00030000-55e4-1004-e409-378cf1c2649e	DogodekIzven-read	DogodekIzven - branje	f
00030000-55e4-1004-2b82-d5ec34059ff9	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55e4-1004-719e-16115b246ae5	Dogodek-read	Dogodek - branje	f
00030000-55e4-1004-d172-74a8d9d7a7b3	Dogodek-write	Dogodek - spreminjanje	f
00030000-55e4-1004-b279-8c9b08a394f2	DrugiVir-read	DrugiVir - branje	f
00030000-55e4-1004-3181-f6367b43c3da	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55e4-1004-e37b-6a932931a159	Drzava-read	Drzava - branje	f
00030000-55e4-1004-8c21-3303eddd159a	Drzava-write	Drzava - spreminjanje	f
00030000-55e4-1004-a5f3-2cb2624d6876	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55e4-1004-a307-44e4ab1067a2	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55e4-1004-9cfe-7ff5fa416ce9	Funkcija-read	Funkcija - branje	f
00030000-55e4-1004-e47e-193cb9195953	Funkcija-write	Funkcija - spreminjanje	f
00030000-55e4-1004-eb3c-d89183482fd1	Gostovanje-read	Gostovanje - branje	f
00030000-55e4-1004-7e8e-d9d17a9a39ff	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55e4-1004-f624-f56cef1e577b	Gostujoca-read	Gostujoca - branje	f
00030000-55e4-1004-eb37-9d726e5fc0c1	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55e4-1004-178a-7a036a815d78	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55e4-1004-1eef-beae97cda244	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55e4-1004-4c9d-979ed48ae39e	Kupec-read	Kupec - branje	f
00030000-55e4-1004-b189-7df718294636	Kupec-write	Kupec - spreminjanje	f
00030000-55e4-1004-14cb-f5a61a138817	NacinPlacina-read	NacinPlacina - branje	f
00030000-55e4-1004-531d-7510a6af0067	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55e4-1004-d5b1-7c45f54110a5	Option-read	Option - branje	f
00030000-55e4-1004-fb17-543e73ef46f1	Option-write	Option - spreminjanje	f
00030000-55e4-1004-25a8-7684ee02a81e	OptionValue-read	OptionValue - branje	f
00030000-55e4-1004-bb78-f26e23f7ce55	OptionValue-write	OptionValue - spreminjanje	f
00030000-55e4-1004-991d-b410ef9cb265	Oseba-read	Oseba - branje	f
00030000-55e4-1004-f92a-36ee8879afbc	Oseba-write	Oseba - spreminjanje	f
00030000-55e4-1004-d75f-6c83266300a7	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55e4-1004-e815-3a169653049e	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55e4-1004-ea2b-80e232fcd303	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55e4-1004-ebb1-fafbfa706b3b	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55e4-1004-7ee5-7946893c10d9	Pogodba-read	Pogodba - branje	f
00030000-55e4-1004-58a6-a830d8ea8400	Pogodba-write	Pogodba - spreminjanje	f
00030000-55e4-1004-acd7-f96a8280d856	Popa-read	Popa - branje	f
00030000-55e4-1004-c8fe-31aef5b381bc	Popa-write	Popa - spreminjanje	f
00030000-55e4-1004-1b6f-07437eba81de	Posta-read	Posta - branje	f
00030000-55e4-1004-2fe2-ef2750094d19	Posta-write	Posta - spreminjanje	f
00030000-55e4-1004-3639-9cc40d970ffa	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55e4-1004-2b6f-2e5cb1f32179	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55e4-1004-324c-402a98c4e9eb	PostniNaslov-read	PostniNaslov - branje	f
00030000-55e4-1004-e4e1-bcc0f65f8eb0	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55e4-1004-a58a-fa43edd2e95f	Predstava-read	Predstava - branje	f
00030000-55e4-1004-2cdd-04203a9b54e5	Predstava-write	Predstava - spreminjanje	f
00030000-55e4-1004-e9a5-2f29ee5775fb	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55e4-1004-3786-a27fd94f4a29	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55e4-1004-0bba-b58429f7b742	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55e4-1004-a1d8-16d846ba077d	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55e4-1004-2cbd-3dac5c7579d8	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55e4-1004-bee5-11f818773742	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55e4-1004-5ae9-d56f213fb57f	ProgramDela-read	ProgramDela - branje	f
00030000-55e4-1004-20d0-790fa52af835	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55e4-1004-d96a-3f0dfb82ea2d	ProgramFestival-read	ProgramFestival - branje	f
00030000-55e4-1004-ec57-3afc3bdc63dd	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55e4-1004-aa4b-a3ff531557ff	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55e4-1004-81ce-e0510cb3440c	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55e4-1004-98c3-2fbb32e6c145	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55e4-1004-2bb3-3a178259bfdf	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55e4-1004-08b5-862b5bf3b04b	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55e4-1004-6a00-dc8db6b8bbb9	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55e4-1004-81d1-297cfcd374aa	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55e4-1004-da2a-17e1aa81cd33	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55e4-1004-fa71-04ceddad58ad	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55e4-1004-3d4d-41cefdc3fc92	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55e4-1004-8be2-db089dd47a71	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55e4-1004-e636-99779f682696	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55e4-1004-3b6d-06da4b6feefe	ProgramRazno-read	ProgramRazno - branje	f
00030000-55e4-1004-ddb3-513a0abafb80	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55e4-1004-f205-7c1e2e364a09	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55e4-1004-792f-ae79e22c4466	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55e4-1004-e545-c388e7027deb	Prostor-read	Prostor - branje	f
00030000-55e4-1004-66bf-8e2b430f8783	Prostor-write	Prostor - spreminjanje	f
00030000-55e4-1004-cf52-711784d148dc	Racun-read	Racun - branje	f
00030000-55e4-1004-4369-47afe480c80a	Racun-write	Racun - spreminjanje	f
00030000-55e4-1004-c253-e75502790125	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55e4-1004-d296-5443f42a6299	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55e4-1004-5998-bb901f4ea8d2	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55e4-1004-970c-651559eed49e	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55e4-1004-af83-b7d536cc760b	Rekvizit-read	Rekvizit - branje	f
00030000-55e4-1004-9af4-bd36cd4a97f2	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55e4-1004-535a-25b9d470962d	Revizija-read	Revizija - branje	f
00030000-55e4-1004-670a-677f1e86d511	Revizija-write	Revizija - spreminjanje	f
00030000-55e4-1004-4667-5139a30deb09	Rezervacija-read	Rezervacija - branje	f
00030000-55e4-1004-e1c2-63e5cc3654b9	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55e4-1004-586b-adbed8508865	SedezniRed-read	SedezniRed - branje	f
00030000-55e4-1004-3cd0-46208e904c9a	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55e4-1004-57d2-87a3a4342c46	Sedez-read	Sedez - branje	f
00030000-55e4-1004-f52f-a06ea714e378	Sedez-write	Sedez - spreminjanje	f
00030000-55e4-1004-ebc9-3a34845e97cf	Sezona-read	Sezona - branje	f
00030000-55e4-1004-69a2-ddfb7dddbed7	Sezona-write	Sezona - spreminjanje	f
00030000-55e4-1004-eedc-cc66a0de7c07	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55e4-1004-6874-6b70e2be0adc	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55e4-1004-1d87-e3045fd9680d	Stevilcenje-read	Stevilcenje - branje	f
00030000-55e4-1004-e231-77ce551c2dc1	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55e4-1004-b0a3-2d9a101be02f	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55e4-1004-451c-fdf1e2cb0a9d	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55e4-1004-5330-db99e64a569f	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55e4-1004-e4cc-faa146a3be29	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55e4-1004-c999-cdca2c2b6f3f	Telefonska-read	Telefonska - branje	f
00030000-55e4-1004-0178-f33598e2c7c3	Telefonska-write	Telefonska - spreminjanje	f
00030000-55e4-1004-3ef5-5a282dea7663	TerminStoritve-read	TerminStoritve - branje	f
00030000-55e4-1004-2f65-fff3a0f00dad	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55e4-1004-8f01-e5243b96150e	TipFunkcije-read	TipFunkcije - branje	f
00030000-55e4-1004-e6ce-860f13fdcc70	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55e4-1004-c407-f2bae6d1d0d4	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55e4-1004-e603-e1eae68943ce	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55e4-1004-ac49-b0e1ee5172f3	Trr-read	Trr - branje	f
00030000-55e4-1004-b088-7bde8a4533a8	Trr-write	Trr - spreminjanje	f
00030000-55e4-1004-4dda-4afd59623eb0	Uprizoritev-read	Uprizoritev - branje	f
00030000-55e4-1004-5e0d-0b9f430722de	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55e4-1004-2e2e-3140cc05b95a	Vaja-read	Vaja - branje	f
00030000-55e4-1004-3a14-90a023f90692	Vaja-write	Vaja - spreminjanje	f
00030000-55e4-1004-9812-8f0f53f625f3	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55e4-1004-4e0c-dddca4380aad	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55e4-1004-6bf5-1cc5eb7fa4ab	VrstaStroska-read	VrstaStroska - branje	f
00030000-55e4-1004-bc80-439a94f0aeea	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55e4-1004-7c34-9810feaa4672	Zaposlitev-read	Zaposlitev - branje	f
00030000-55e4-1004-240d-53b9fbe30eb9	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55e4-1004-48d5-7df360a599eb	Zasedenost-read	Zasedenost - branje	f
00030000-55e4-1004-71ec-20061e3fa5c0	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55e4-1004-8694-9219aa38fc88	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55e4-1004-5455-bbcd2f9fd0e7	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55e4-1004-08ee-d84906d6c1d1	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55e4-1004-5827-bbbfdac98647	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55e4-1004-9f49-f7b9aea65534	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55e4-1004-ea46-90da4c0b0514	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55e4-1004-f8a8-49c4b9602d4e	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55e4-1004-aeea-9bbdc6410ace	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55e4-1004-bdf5-b2ef10755114	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55e4-1004-ab98-d732649e7c2c	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55e4-1004-a635-2a7808af8133	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55e4-1004-a48b-f83dc2215199	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55e4-1004-b254-d8a279a8d7df	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55e4-1004-1478-69ced5ba1cf7	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55e4-1004-9a50-6d57260a517b	Datoteka-write	Datoteka - spreminjanje	f
00030000-55e4-1004-c3a2-817d25fd6bbf	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2910 (class 0 OID 16525733)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55e4-1004-314b-02c50269f7e2	00030000-55e4-1004-4aa6-7be34d788704
00020000-55e4-1004-44aa-b26224f7310e	00030000-55e4-1004-e37b-6a932931a159
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-efe7-1cfd4d0b1ab1
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-4a2a-0414d42c5089
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-aeb1-eece37be8764
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-26d5-33ad6524a03c
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-09c7-9b8b147faca8
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-719e-16115b246ae5
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-63a1-5536a335a3da
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-d172-74a8d9d7a7b3
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-e37b-6a932931a159
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-8c21-3303eddd159a
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-9cfe-7ff5fa416ce9
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-e47e-193cb9195953
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-eb3c-d89183482fd1
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-7e8e-d9d17a9a39ff
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-f624-f56cef1e577b
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-eb37-9d726e5fc0c1
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-178a-7a036a815d78
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-1eef-beae97cda244
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-d5b1-7c45f54110a5
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-25a8-7684ee02a81e
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-991d-b410ef9cb265
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-f92a-36ee8879afbc
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-acd7-f96a8280d856
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-c8fe-31aef5b381bc
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-1b6f-07437eba81de
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-2fe2-ef2750094d19
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-324c-402a98c4e9eb
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-e4e1-bcc0f65f8eb0
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-a58a-fa43edd2e95f
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-2cdd-04203a9b54e5
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-2cbd-3dac5c7579d8
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-bee5-11f818773742
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-e545-c388e7027deb
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-66bf-8e2b430f8783
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-5998-bb901f4ea8d2
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-970c-651559eed49e
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-af83-b7d536cc760b
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-9af4-bd36cd4a97f2
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-ebc9-3a34845e97cf
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-69a2-ddfb7dddbed7
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-8f01-e5243b96150e
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-4dda-4afd59623eb0
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-5e0d-0b9f430722de
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-2e2e-3140cc05b95a
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-3a14-90a023f90692
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-48d5-7df360a599eb
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-71ec-20061e3fa5c0
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-8694-9219aa38fc88
00020000-55e4-1004-c73c-3a9a736f790c	00030000-55e4-1004-08ee-d84906d6c1d1
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-efe7-1cfd4d0b1ab1
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-09c7-9b8b147faca8
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-719e-16115b246ae5
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-e37b-6a932931a159
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-eb3c-d89183482fd1
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-f624-f56cef1e577b
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-178a-7a036a815d78
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-1eef-beae97cda244
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-d5b1-7c45f54110a5
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-25a8-7684ee02a81e
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-991d-b410ef9cb265
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-f92a-36ee8879afbc
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-acd7-f96a8280d856
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-1b6f-07437eba81de
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-324c-402a98c4e9eb
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-e4e1-bcc0f65f8eb0
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-a58a-fa43edd2e95f
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-e545-c388e7027deb
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-5998-bb901f4ea8d2
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-af83-b7d536cc760b
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-ebc9-3a34845e97cf
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-c999-cdca2c2b6f3f
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-0178-f33598e2c7c3
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-ac49-b0e1ee5172f3
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-b088-7bde8a4533a8
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-7c34-9810feaa4672
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-240d-53b9fbe30eb9
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-8694-9219aa38fc88
00020000-55e4-1004-a7a7-4f5db32cc5eb	00030000-55e4-1004-08ee-d84906d6c1d1
00020000-55e4-1004-510a-4818bd00e019	00030000-55e4-1004-efe7-1cfd4d0b1ab1
00020000-55e4-1004-510a-4818bd00e019	00030000-55e4-1004-aeb1-eece37be8764
00020000-55e4-1004-510a-4818bd00e019	00030000-55e4-1004-09c7-9b8b147faca8
00020000-55e4-1004-510a-4818bd00e019	00030000-55e4-1004-813b-d2221ae35527
00020000-55e4-1004-510a-4818bd00e019	00030000-55e4-1004-1750-6d61c5f1af05
00020000-55e4-1004-510a-4818bd00e019	00030000-55e4-1004-e409-378cf1c2649e
00020000-55e4-1004-510a-4818bd00e019	00030000-55e4-1004-719e-16115b246ae5
00020000-55e4-1004-510a-4818bd00e019	00030000-55e4-1004-e37b-6a932931a159
00020000-55e4-1004-510a-4818bd00e019	00030000-55e4-1004-9cfe-7ff5fa416ce9
00020000-55e4-1004-510a-4818bd00e019	00030000-55e4-1004-eb3c-d89183482fd1
00020000-55e4-1004-510a-4818bd00e019	00030000-55e4-1004-f624-f56cef1e577b
00020000-55e4-1004-510a-4818bd00e019	00030000-55e4-1004-178a-7a036a815d78
00020000-55e4-1004-510a-4818bd00e019	00030000-55e4-1004-d5b1-7c45f54110a5
00020000-55e4-1004-510a-4818bd00e019	00030000-55e4-1004-25a8-7684ee02a81e
00020000-55e4-1004-510a-4818bd00e019	00030000-55e4-1004-991d-b410ef9cb265
00020000-55e4-1004-510a-4818bd00e019	00030000-55e4-1004-acd7-f96a8280d856
00020000-55e4-1004-510a-4818bd00e019	00030000-55e4-1004-1b6f-07437eba81de
00020000-55e4-1004-510a-4818bd00e019	00030000-55e4-1004-a58a-fa43edd2e95f
00020000-55e4-1004-510a-4818bd00e019	00030000-55e4-1004-2cbd-3dac5c7579d8
00020000-55e4-1004-510a-4818bd00e019	00030000-55e4-1004-e545-c388e7027deb
00020000-55e4-1004-510a-4818bd00e019	00030000-55e4-1004-5998-bb901f4ea8d2
00020000-55e4-1004-510a-4818bd00e019	00030000-55e4-1004-af83-b7d536cc760b
00020000-55e4-1004-510a-4818bd00e019	00030000-55e4-1004-ebc9-3a34845e97cf
00020000-55e4-1004-510a-4818bd00e019	00030000-55e4-1004-8f01-e5243b96150e
00020000-55e4-1004-510a-4818bd00e019	00030000-55e4-1004-2e2e-3140cc05b95a
00020000-55e4-1004-510a-4818bd00e019	00030000-55e4-1004-48d5-7df360a599eb
00020000-55e4-1004-510a-4818bd00e019	00030000-55e4-1004-8694-9219aa38fc88
00020000-55e4-1004-510a-4818bd00e019	00030000-55e4-1004-08ee-d84906d6c1d1
00020000-55e4-1004-b6ad-8fd4fce243c8	00030000-55e4-1004-efe7-1cfd4d0b1ab1
00020000-55e4-1004-b6ad-8fd4fce243c8	00030000-55e4-1004-4a2a-0414d42c5089
00020000-55e4-1004-b6ad-8fd4fce243c8	00030000-55e4-1004-26d5-33ad6524a03c
00020000-55e4-1004-b6ad-8fd4fce243c8	00030000-55e4-1004-09c7-9b8b147faca8
00020000-55e4-1004-b6ad-8fd4fce243c8	00030000-55e4-1004-719e-16115b246ae5
00020000-55e4-1004-b6ad-8fd4fce243c8	00030000-55e4-1004-e37b-6a932931a159
00020000-55e4-1004-b6ad-8fd4fce243c8	00030000-55e4-1004-eb3c-d89183482fd1
00020000-55e4-1004-b6ad-8fd4fce243c8	00030000-55e4-1004-f624-f56cef1e577b
00020000-55e4-1004-b6ad-8fd4fce243c8	00030000-55e4-1004-d5b1-7c45f54110a5
00020000-55e4-1004-b6ad-8fd4fce243c8	00030000-55e4-1004-25a8-7684ee02a81e
00020000-55e4-1004-b6ad-8fd4fce243c8	00030000-55e4-1004-acd7-f96a8280d856
00020000-55e4-1004-b6ad-8fd4fce243c8	00030000-55e4-1004-1b6f-07437eba81de
00020000-55e4-1004-b6ad-8fd4fce243c8	00030000-55e4-1004-a58a-fa43edd2e95f
00020000-55e4-1004-b6ad-8fd4fce243c8	00030000-55e4-1004-e545-c388e7027deb
00020000-55e4-1004-b6ad-8fd4fce243c8	00030000-55e4-1004-5998-bb901f4ea8d2
00020000-55e4-1004-b6ad-8fd4fce243c8	00030000-55e4-1004-af83-b7d536cc760b
00020000-55e4-1004-b6ad-8fd4fce243c8	00030000-55e4-1004-ebc9-3a34845e97cf
00020000-55e4-1004-b6ad-8fd4fce243c8	00030000-55e4-1004-8f01-e5243b96150e
00020000-55e4-1004-b6ad-8fd4fce243c8	00030000-55e4-1004-8694-9219aa38fc88
00020000-55e4-1004-b6ad-8fd4fce243c8	00030000-55e4-1004-08ee-d84906d6c1d1
00020000-55e4-1004-d8c3-31840b858055	00030000-55e4-1004-efe7-1cfd4d0b1ab1
00020000-55e4-1004-d8c3-31840b858055	00030000-55e4-1004-09c7-9b8b147faca8
00020000-55e4-1004-d8c3-31840b858055	00030000-55e4-1004-719e-16115b246ae5
00020000-55e4-1004-d8c3-31840b858055	00030000-55e4-1004-e37b-6a932931a159
00020000-55e4-1004-d8c3-31840b858055	00030000-55e4-1004-eb3c-d89183482fd1
00020000-55e4-1004-d8c3-31840b858055	00030000-55e4-1004-f624-f56cef1e577b
00020000-55e4-1004-d8c3-31840b858055	00030000-55e4-1004-d5b1-7c45f54110a5
00020000-55e4-1004-d8c3-31840b858055	00030000-55e4-1004-25a8-7684ee02a81e
00020000-55e4-1004-d8c3-31840b858055	00030000-55e4-1004-acd7-f96a8280d856
00020000-55e4-1004-d8c3-31840b858055	00030000-55e4-1004-1b6f-07437eba81de
00020000-55e4-1004-d8c3-31840b858055	00030000-55e4-1004-a58a-fa43edd2e95f
00020000-55e4-1004-d8c3-31840b858055	00030000-55e4-1004-e545-c388e7027deb
00020000-55e4-1004-d8c3-31840b858055	00030000-55e4-1004-5998-bb901f4ea8d2
00020000-55e4-1004-d8c3-31840b858055	00030000-55e4-1004-af83-b7d536cc760b
00020000-55e4-1004-d8c3-31840b858055	00030000-55e4-1004-ebc9-3a34845e97cf
00020000-55e4-1004-d8c3-31840b858055	00030000-55e4-1004-3ef5-5a282dea7663
00020000-55e4-1004-d8c3-31840b858055	00030000-55e4-1004-fb7a-d14ce533ef4a
00020000-55e4-1004-d8c3-31840b858055	00030000-55e4-1004-8f01-e5243b96150e
00020000-55e4-1004-d8c3-31840b858055	00030000-55e4-1004-8694-9219aa38fc88
00020000-55e4-1004-d8c3-31840b858055	00030000-55e4-1004-08ee-d84906d6c1d1
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-8778-742735fe6cc9
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-4aa6-7be34d788704
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-fb7a-d14ce533ef4a
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-63a1-5536a335a3da
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-f507-6d4a2c161a6f
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-5e61-bba88a8f259f
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-966f-89b444e4b214
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-efe7-1cfd4d0b1ab1
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-4a2a-0414d42c5089
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-aeb1-eece37be8764
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-26d5-33ad6524a03c
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-09c7-9b8b147faca8
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-813b-d2221ae35527
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-1750-6d61c5f1af05
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-e610-9d159aa3b1ff
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-e409-378cf1c2649e
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-2b82-d5ec34059ff9
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-719e-16115b246ae5
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-d172-74a8d9d7a7b3
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-e37b-6a932931a159
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-8c21-3303eddd159a
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-b279-8c9b08a394f2
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-3181-f6367b43c3da
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-a5f3-2cb2624d6876
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-a307-44e4ab1067a2
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-9cfe-7ff5fa416ce9
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-e47e-193cb9195953
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-eb3c-d89183482fd1
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-7e8e-d9d17a9a39ff
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-f624-f56cef1e577b
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-eb37-9d726e5fc0c1
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-178a-7a036a815d78
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-1eef-beae97cda244
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-4c9d-979ed48ae39e
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-b189-7df718294636
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-14cb-f5a61a138817
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-531d-7510a6af0067
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-d5b1-7c45f54110a5
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-fb17-543e73ef46f1
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-25a8-7684ee02a81e
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-bb78-f26e23f7ce55
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-991d-b410ef9cb265
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-f92a-36ee8879afbc
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-d75f-6c83266300a7
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-e815-3a169653049e
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-ea2b-80e232fcd303
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-ebb1-fafbfa706b3b
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-7ee5-7946893c10d9
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-58a6-a830d8ea8400
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-acd7-f96a8280d856
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-c8fe-31aef5b381bc
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-1b6f-07437eba81de
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-2fe2-ef2750094d19
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-3639-9cc40d970ffa
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-2b6f-2e5cb1f32179
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-324c-402a98c4e9eb
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-e4e1-bcc0f65f8eb0
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-a58a-fa43edd2e95f
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-2cdd-04203a9b54e5
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-e9a5-2f29ee5775fb
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-3786-a27fd94f4a29
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-0bba-b58429f7b742
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-a1d8-16d846ba077d
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-2cbd-3dac5c7579d8
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-bee5-11f818773742
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-5ae9-d56f213fb57f
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-20d0-790fa52af835
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-d96a-3f0dfb82ea2d
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-ec57-3afc3bdc63dd
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-aa4b-a3ff531557ff
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-81ce-e0510cb3440c
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-98c3-2fbb32e6c145
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-2bb3-3a178259bfdf
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-08b5-862b5bf3b04b
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-6a00-dc8db6b8bbb9
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-81d1-297cfcd374aa
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-da2a-17e1aa81cd33
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-fa71-04ceddad58ad
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-3d4d-41cefdc3fc92
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-8be2-db089dd47a71
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-e636-99779f682696
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-3b6d-06da4b6feefe
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-ddb3-513a0abafb80
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-f205-7c1e2e364a09
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-792f-ae79e22c4466
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-e545-c388e7027deb
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-66bf-8e2b430f8783
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-cf52-711784d148dc
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-4369-47afe480c80a
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-c253-e75502790125
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-d296-5443f42a6299
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-5998-bb901f4ea8d2
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-970c-651559eed49e
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-af83-b7d536cc760b
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-9af4-bd36cd4a97f2
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-535a-25b9d470962d
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-670a-677f1e86d511
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-4667-5139a30deb09
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-e1c2-63e5cc3654b9
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-586b-adbed8508865
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-3cd0-46208e904c9a
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-57d2-87a3a4342c46
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-f52f-a06ea714e378
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-ebc9-3a34845e97cf
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-69a2-ddfb7dddbed7
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-eedc-cc66a0de7c07
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-6874-6b70e2be0adc
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-1d87-e3045fd9680d
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-e231-77ce551c2dc1
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-b0a3-2d9a101be02f
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-451c-fdf1e2cb0a9d
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-5330-db99e64a569f
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-e4cc-faa146a3be29
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-c999-cdca2c2b6f3f
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-0178-f33598e2c7c3
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-3ef5-5a282dea7663
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-2f65-fff3a0f00dad
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-8f01-e5243b96150e
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-e6ce-860f13fdcc70
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-c407-f2bae6d1d0d4
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-e603-e1eae68943ce
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-ac49-b0e1ee5172f3
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-b088-7bde8a4533a8
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-4dda-4afd59623eb0
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-5e0d-0b9f430722de
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-2e2e-3140cc05b95a
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-3a14-90a023f90692
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-9812-8f0f53f625f3
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-4e0c-dddca4380aad
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-7c34-9810feaa4672
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-240d-53b9fbe30eb9
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-48d5-7df360a599eb
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-71ec-20061e3fa5c0
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-8694-9219aa38fc88
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-5455-bbcd2f9fd0e7
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-08ee-d84906d6c1d1
00020000-55e4-1005-3f28-d5d22042928d	00030000-55e4-1004-5827-bbbfdac98647
\.


--
-- TOC entry 2938 (class 0 OID 16526031)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2942 (class 0 OID 16526064)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 16526188)
-- Dependencies: 219
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55e4-1005-5857-5f720f98bb87	00090000-55e4-1005-c12c-8f4477f79f5e	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55e4-1005-6f24-009177e6c7e3	00090000-55e4-1005-d2b5-f88c2ab583fd	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55e4-1005-3b38-cee6c604be8d	00090000-55e4-1005-fa90-4254d8e3615a	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2915 (class 0 OID 16525793)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55e4-1005-690b-b48ac047be41	00040000-55e4-1004-0f1c-64d5846aa53b	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e4-1005-f870-4e2664c54d91	00040000-55e4-1004-0f1c-64d5846aa53b	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55e4-1005-b23d-445189233ba8	00040000-55e4-1004-0f1c-64d5846aa53b	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e4-1005-38e3-5a10fbc190df	00040000-55e4-1004-0f1c-64d5846aa53b	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e4-1005-bf22-5afae6cb2be6	00040000-55e4-1004-0f1c-64d5846aa53b	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e4-1005-1942-dfc80e2a4020	00040000-55e4-1004-62e2-cd4e97f30a21	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e4-1005-ecb0-665786ac6dfc	00040000-55e4-1004-cf7c-8ea2e3dfd198	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e4-1005-1cb8-4cd6b8bc13e8	00040000-55e4-1004-c452-bc7a271363c2	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e4-1006-a1c1-3378eee222de	00040000-55e4-1004-0f1c-64d5846aa53b	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2917 (class 0 OID 16525827)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55e4-1003-14a6-4ea3b8b67609	8341	Adlešiči
00050000-55e4-1003-9137-aeb882e28ae8	5270	Ajdovščina
00050000-55e4-1003-04ac-eb6cc133115a	6280	Ankaran/Ancarano
00050000-55e4-1003-3a78-96bc30d5e083	9253	Apače
00050000-55e4-1003-bdd4-43e8fa99d390	8253	Artiče
00050000-55e4-1003-1eba-e13ebf347213	4275	Begunje na Gorenjskem
00050000-55e4-1003-0004-6fb1b73ee09e	1382	Begunje pri Cerknici
00050000-55e4-1003-7d8e-ae169f5b9adb	9231	Beltinci
00050000-55e4-1003-df16-836f3dd39b1a	2234	Benedikt
00050000-55e4-1003-7e5c-adbb5c1e18c8	2345	Bistrica ob Dravi
00050000-55e4-1003-8fba-7ddd02847241	3256	Bistrica ob Sotli
00050000-55e4-1003-4505-33a79251b7d4	8259	Bizeljsko
00050000-55e4-1003-2410-4336f53f51a4	1223	Blagovica
00050000-55e4-1003-1671-c90bc082c95b	8283	Blanca
00050000-55e4-1003-5988-f90f0893c4bd	4260	Bled
00050000-55e4-1003-3bac-42540004de4a	4273	Blejska Dobrava
00050000-55e4-1003-e5bc-58d1e37fc6c9	9265	Bodonci
00050000-55e4-1003-4c70-85451f4cde76	9222	Bogojina
00050000-55e4-1003-d3c8-4881f26746ad	4263	Bohinjska Bela
00050000-55e4-1003-f657-df0c363a9b6e	4264	Bohinjska Bistrica
00050000-55e4-1003-4615-60cda54f68bb	4265	Bohinjsko jezero
00050000-55e4-1003-573d-88f5f27aa3bb	1353	Borovnica
00050000-55e4-1003-a75c-4d4494be26f3	8294	Boštanj
00050000-55e4-1003-a248-c2f2c45fd1e7	5230	Bovec
00050000-55e4-1003-fb8f-ae0700cf24b2	5295	Branik
00050000-55e4-1003-d89c-ebabfbfa63f2	3314	Braslovče
00050000-55e4-1003-e3bf-3bda48b1db44	5223	Breginj
00050000-55e4-1003-18d5-5f42449ed1ad	8280	Brestanica
00050000-55e4-1003-1163-7ed048a1c0c9	2354	Bresternica
00050000-55e4-1003-538a-e48299b28710	4243	Brezje
00050000-55e4-1003-1909-2b114bbbf802	1351	Brezovica pri Ljubljani
00050000-55e4-1003-7774-7045dac3d091	8250	Brežice
00050000-55e4-1003-7906-bde4161d591a	4210	Brnik - Aerodrom
00050000-55e4-1003-0d07-561ab311ba79	8321	Brusnice
00050000-55e4-1003-3b69-7ceee299a14a	3255	Buče
00050000-55e4-1003-645e-096d5b642246	8276	Bučka 
00050000-55e4-1003-1c57-fdcf3124c8cd	9261	Cankova
00050000-55e4-1003-f4d4-5761d67a9811	3000	Celje 
00050000-55e4-1003-4359-29faeb19f706	3001	Celje - poštni predali
00050000-55e4-1003-c5fd-b9fa73d49c33	4207	Cerklje na Gorenjskem
00050000-55e4-1003-885f-e74ab364bc7a	8263	Cerklje ob Krki
00050000-55e4-1003-c993-b240d5d61891	1380	Cerknica
00050000-55e4-1003-8545-c0105b3bba56	5282	Cerkno
00050000-55e4-1003-7831-2356fc51afb3	2236	Cerkvenjak
00050000-55e4-1003-3958-9be90085bf5d	2215	Ceršak
00050000-55e4-1003-fa73-c606b7464b88	2326	Cirkovce
00050000-55e4-1003-d0f2-6c88b9af9ffa	2282	Cirkulane
00050000-55e4-1003-4276-e1c6266cf693	5273	Col
00050000-55e4-1003-2f94-0d187bbc6852	8251	Čatež ob Savi
00050000-55e4-1003-4f84-790db4fc192e	1413	Čemšenik
00050000-55e4-1003-dce3-d2cc6f3c2c66	5253	Čepovan
00050000-55e4-1003-4d82-85e315f92801	9232	Črenšovci
00050000-55e4-1003-7e8e-9c255eeec873	2393	Črna na Koroškem
00050000-55e4-1003-8f84-f3c1d82e8dad	6275	Črni Kal
00050000-55e4-1003-0bed-4a6cf8d47740	5274	Črni Vrh nad Idrijo
00050000-55e4-1003-b9df-a547fadf78ce	5262	Črniče
00050000-55e4-1003-3a56-8a91cfac8b62	8340	Črnomelj
00050000-55e4-1003-2ba2-e3f55bd64488	6271	Dekani
00050000-55e4-1003-9e30-9886059b79f2	5210	Deskle
00050000-55e4-1003-41d8-f8e297e9930e	2253	Destrnik
00050000-55e4-1003-47c2-d97b4bbeaf42	6215	Divača
00050000-55e4-1003-ac33-10ce66ae286d	1233	Dob
00050000-55e4-1003-8156-fdc007875778	3224	Dobje pri Planini
00050000-55e4-1003-59f8-048de46b9909	8257	Dobova
00050000-55e4-1003-a086-9e08bee50f64	1423	Dobovec
00050000-55e4-1003-a23e-086f1b9997be	5263	Dobravlje
00050000-55e4-1003-f7f2-b120d678736c	3204	Dobrna
00050000-55e4-1003-8f79-aca8e6976acd	8211	Dobrnič
00050000-55e4-1003-3ad7-54db63aa9fed	1356	Dobrova
00050000-55e4-1003-abf2-b32071d2e30c	9223	Dobrovnik/Dobronak 
00050000-55e4-1003-8ac0-1f58982d81d2	5212	Dobrovo v Brdih
00050000-55e4-1003-b28a-261c02628a6b	1431	Dol pri Hrastniku
00050000-55e4-1003-8bb1-34864eab70fc	1262	Dol pri Ljubljani
00050000-55e4-1003-e5a6-6dcc6c10db2d	1273	Dole pri Litiji
00050000-55e4-1003-17b0-0f766d69952b	1331	Dolenja vas
00050000-55e4-1003-4643-01f9ead53c65	8350	Dolenjske Toplice
00050000-55e4-1003-30de-5e3533410494	1230	Domžale
00050000-55e4-1003-9f81-b77aa35cfd1e	2252	Dornava
00050000-55e4-1003-5526-1d1f3764dc14	5294	Dornberk
00050000-55e4-1003-8060-d0ff3d38505d	1319	Draga
00050000-55e4-1004-45a8-3b2a9afebe03	8343	Dragatuš
00050000-55e4-1004-75a4-bc2504d6214f	3222	Dramlje
00050000-55e4-1004-1a39-6d7cb1eaddb1	2370	Dravograd
00050000-55e4-1004-ca6c-931e519e1f75	4203	Duplje
00050000-55e4-1004-d033-fc6a702a63af	6221	Dutovlje
00050000-55e4-1004-ef4e-e3545d724d84	8361	Dvor
00050000-55e4-1004-1193-000be3895c46	2343	Fala
00050000-55e4-1004-ce37-11580159423b	9208	Fokovci
00050000-55e4-1004-1b6e-dc5d13b73b3d	2313	Fram
00050000-55e4-1004-b57c-ec10faa12511	3213	Frankolovo
00050000-55e4-1004-06c0-c835d5f3cc64	1274	Gabrovka
00050000-55e4-1004-402f-48f68593fed8	8254	Globoko
00050000-55e4-1004-f0d1-c9e5b58a2f90	5275	Godovič
00050000-55e4-1004-efaf-c17d67006792	4204	Golnik
00050000-55e4-1004-df66-b9d72d548686	3303	Gomilsko
00050000-55e4-1004-2cec-b53b603eb412	4224	Gorenja vas
00050000-55e4-1004-a054-7f01566fd509	3263	Gorica pri Slivnici
00050000-55e4-1004-1b31-bb6623c69388	2272	Gorišnica
00050000-55e4-1004-3d92-a301765ecdcc	9250	Gornja Radgona
00050000-55e4-1004-f4d1-b237717176df	3342	Gornji Grad
00050000-55e4-1004-7c9f-da640c8a9a06	4282	Gozd Martuljek
00050000-55e4-1004-ffbc-f8a55e30a416	6272	Gračišče
00050000-55e4-1004-9ad8-99066cf2c115	9264	Grad
00050000-55e4-1004-dafc-d4515269c612	8332	Gradac
00050000-55e4-1004-2283-7203e397e8ad	1384	Grahovo
00050000-55e4-1004-33bd-fd0d297a5ff0	5242	Grahovo ob Bači
00050000-55e4-1004-90ca-ce23ed00f569	5251	Grgar
00050000-55e4-1004-3fac-0e3390cda7be	3302	Griže
00050000-55e4-1004-8004-366af53a099e	3231	Grobelno
00050000-55e4-1004-7991-3f4d99a4823c	1290	Grosuplje
00050000-55e4-1004-dbb4-4560900a0d8d	2288	Hajdina
00050000-55e4-1004-ce95-4247602dba3d	8362	Hinje
00050000-55e4-1004-3e60-6ffa1ef5f279	2311	Hoče
00050000-55e4-1004-44b3-023c19e392d0	9205	Hodoš/Hodos
00050000-55e4-1004-55fa-9a80683ef6b4	1354	Horjul
00050000-55e4-1004-cb7c-f87411647e24	1372	Hotedršica
00050000-55e4-1004-c0db-53dcc9895a5c	1430	Hrastnik
00050000-55e4-1004-a5b0-057e9b233721	6225	Hruševje
00050000-55e4-1004-2c83-586240df7226	4276	Hrušica
00050000-55e4-1004-0739-ea9055f4278e	5280	Idrija
00050000-55e4-1004-6c50-b49108a2b6c4	1292	Ig
00050000-55e4-1004-a32f-b80ffafc52bf	6250	Ilirska Bistrica
00050000-55e4-1004-e85e-89aac5d1d35f	6251	Ilirska Bistrica-Trnovo
00050000-55e4-1004-198d-22cd7d46fefe	1295	Ivančna Gorica
00050000-55e4-1004-e863-02d5d5b7e1cb	2259	Ivanjkovci
00050000-55e4-1004-a5b6-5e66d9c95a85	1411	Izlake
00050000-55e4-1004-c6e7-6390ec870d83	6310	Izola/Isola
00050000-55e4-1004-1918-2f6b87621416	2222	Jakobski Dol
00050000-55e4-1004-d27c-ee9bd65526b6	2221	Jarenina
00050000-55e4-1004-735c-97c02c019838	6254	Jelšane
00050000-55e4-1004-d827-d7dec7a3634c	4270	Jesenice
00050000-55e4-1004-ef66-223d7e421d7d	8261	Jesenice na Dolenjskem
00050000-55e4-1004-0e5b-0eb9e1d803f8	3273	Jurklošter
00050000-55e4-1004-7a29-e23de5087926	2223	Jurovski Dol
00050000-55e4-1004-8b30-290b308fccf6	2256	Juršinci
00050000-55e4-1004-6342-5914a4a7a126	5214	Kal nad Kanalom
00050000-55e4-1004-0318-4b03b7b51483	3233	Kalobje
00050000-55e4-1004-bd9d-6cf1d071db8d	4246	Kamna Gorica
00050000-55e4-1004-7a84-f9beb567bb89	2351	Kamnica
00050000-55e4-1004-ceee-1ad04c85cebd	1241	Kamnik
00050000-55e4-1004-7e02-bb6673abd501	5213	Kanal
00050000-55e4-1004-719e-471a2e1804af	8258	Kapele
00050000-55e4-1004-61f9-583c8f15a0e1	2362	Kapla
00050000-55e4-1004-7870-31cbc9136459	2325	Kidričevo
00050000-55e4-1004-f240-46211733eaad	1412	Kisovec
00050000-55e4-1004-6ebb-b3282d4715bd	6253	Knežak
00050000-55e4-1004-4b58-80d70e8ea4a7	5222	Kobarid
00050000-55e4-1004-31e0-5eea8f2e4278	9227	Kobilje
00050000-55e4-1004-27b7-f57d24b810bf	1330	Kočevje
00050000-55e4-1004-6665-d49fbdd7d15d	1338	Kočevska Reka
00050000-55e4-1004-4c90-5279c2da53af	2276	Kog
00050000-55e4-1004-944f-db83759ea30c	5211	Kojsko
00050000-55e4-1004-c0f6-95c70ee78a1d	6223	Komen
00050000-55e4-1004-c81e-41c41ca80ae9	1218	Komenda
00050000-55e4-1004-42ad-62d7bc8f1395	6000	Koper/Capodistria 
00050000-55e4-1004-6576-09ee6b836215	6001	Koper/Capodistria - poštni predali
00050000-55e4-1004-1fd8-de3835bf3e4a	8282	Koprivnica
00050000-55e4-1004-a4dc-08fbdfb0dd3e	5296	Kostanjevica na Krasu
00050000-55e4-1004-2711-5e39d8fc2e43	8311	Kostanjevica na Krki
00050000-55e4-1004-4b6b-47251e8139ad	1336	Kostel
00050000-55e4-1004-cb53-b63108ace041	6256	Košana
00050000-55e4-1004-dbd2-20a604acba56	2394	Kotlje
00050000-55e4-1004-b694-d0e5fa555e8c	6240	Kozina
00050000-55e4-1004-d65e-ef39739b7ad6	3260	Kozje
00050000-55e4-1004-bf79-b40a661c8496	4000	Kranj 
00050000-55e4-1004-f9ca-4cec62f8d62b	4001	Kranj - poštni predali
00050000-55e4-1004-0016-e470e5191653	4280	Kranjska Gora
00050000-55e4-1004-5943-10582af7af6f	1281	Kresnice
00050000-55e4-1004-2e22-4a712663f70e	4294	Križe
00050000-55e4-1004-de06-7f2a3bf11320	9206	Križevci
00050000-55e4-1004-7720-25be9008165c	9242	Križevci pri Ljutomeru
00050000-55e4-1004-5698-6030d0fce00d	1301	Krka
00050000-55e4-1004-b94b-c2849cdfd354	8296	Krmelj
00050000-55e4-1004-0c23-3bc851fa8b19	4245	Kropa
00050000-55e4-1004-5305-607158a55807	8262	Krška vas
00050000-55e4-1004-a3be-16111cc7753a	8270	Krško
00050000-55e4-1004-1e4f-627c44d905a3	9263	Kuzma
00050000-55e4-1004-c749-e14cb9f6de61	2318	Laporje
00050000-55e4-1004-347e-1d479479a6ca	3270	Laško
00050000-55e4-1004-ba14-8b9b262c97b6	1219	Laze v Tuhinju
00050000-55e4-1004-7ba9-b97def77264f	2230	Lenart v Slovenskih goricah
00050000-55e4-1004-b0cb-7b0a3c0ea870	9220	Lendava/Lendva
00050000-55e4-1004-da71-d3e49ab75978	4248	Lesce
00050000-55e4-1004-84cf-77b2fda169f3	3261	Lesično
00050000-55e4-1004-5494-345b589d06ae	8273	Leskovec pri Krškem
00050000-55e4-1004-f147-d7012f0b43ef	2372	Libeliče
00050000-55e4-1004-d77e-eda8c9d9213a	2341	Limbuš
00050000-55e4-1004-6f17-2e8f8410aef5	1270	Litija
00050000-55e4-1004-6492-de5fa5e83093	3202	Ljubečna
00050000-55e4-1004-f208-a49e05c8c979	1000	Ljubljana 
00050000-55e4-1004-b7cb-6905c2ffa790	1001	Ljubljana - poštni predali
00050000-55e4-1004-5f2c-98ea87895885	1231	Ljubljana - Črnuče
00050000-55e4-1004-26ec-09030c5cb0bf	1261	Ljubljana - Dobrunje
00050000-55e4-1004-dffd-1e17970628b1	1260	Ljubljana - Polje
00050000-55e4-1004-ec41-b4b5821fbf7c	1210	Ljubljana - Šentvid
00050000-55e4-1004-ac8b-f5f100bf793c	1211	Ljubljana - Šmartno
00050000-55e4-1004-4abe-4e029459b4d3	3333	Ljubno ob Savinji
00050000-55e4-1004-68df-675607f127af	9240	Ljutomer
00050000-55e4-1004-0f20-d0b3bf5ab2a5	3215	Loče
00050000-55e4-1004-2136-8036effee378	5231	Log pod Mangartom
00050000-55e4-1004-bcbb-4fed3ca857fb	1358	Log pri Brezovici
00050000-55e4-1004-7a75-b6d445942bfc	1370	Logatec
00050000-55e4-1004-90ec-1e3a2ceb9db1	1371	Logatec
00050000-55e4-1004-9a82-3dcccfe285d0	1434	Loka pri Zidanem Mostu
00050000-55e4-1004-4c30-16d39bb8b966	3223	Loka pri Žusmu
00050000-55e4-1004-e419-f1bab38d29d6	6219	Lokev
00050000-55e4-1004-e0c8-b9c48e0e1b11	1318	Loški Potok
00050000-55e4-1004-1c39-7b31f3a3aba8	2324	Lovrenc na Dravskem polju
00050000-55e4-1004-7d36-e8eb1cfe3db3	2344	Lovrenc na Pohorju
00050000-55e4-1004-c2f6-976dbf9d876e	3334	Luče
00050000-55e4-1004-501e-f37c15b79380	1225	Lukovica
00050000-55e4-1004-82e3-cc6462be9b2e	9202	Mačkovci
00050000-55e4-1004-4fc7-45cefb053916	2322	Majšperk
00050000-55e4-1004-af9f-b9faaaab1215	2321	Makole
00050000-55e4-1004-ed04-5f15f16fe3ff	9243	Mala Nedelja
00050000-55e4-1004-2c5d-dd71ddeb07ad	2229	Malečnik
00050000-55e4-1004-92d2-f0911f48d56f	6273	Marezige
00050000-55e4-1004-5c45-e381626fc3bc	2000	Maribor 
00050000-55e4-1004-2729-65a8949fee98	2001	Maribor - poštni predali
00050000-55e4-1004-d8fc-a9295f882582	2206	Marjeta na Dravskem polju
00050000-55e4-1004-8cf1-086a9cbbc757	2281	Markovci
00050000-55e4-1004-0b48-98bd1473fcd7	9221	Martjanci
00050000-55e4-1004-2adc-48adaade92e0	6242	Materija
00050000-55e4-1004-9649-7690c1804c32	4211	Mavčiče
00050000-55e4-1004-0eab-19e4beff6cff	1215	Medvode
00050000-55e4-1004-5094-80a8d89f6891	1234	Mengeš
00050000-55e4-1004-5232-0b4591e213bf	8330	Metlika
00050000-55e4-1004-00c0-73d4d7793313	2392	Mežica
00050000-55e4-1004-70fc-1153b503c8b8	2204	Miklavž na Dravskem polju
00050000-55e4-1004-a66e-ba9974926619	2275	Miklavž pri Ormožu
00050000-55e4-1004-3ba3-0053c276e090	5291	Miren
00050000-55e4-1004-6fcd-015b652257ed	8233	Mirna
00050000-55e4-1004-2201-ad6b2c9a7270	8216	Mirna Peč
00050000-55e4-1004-4065-efd663452a4f	2382	Mislinja
00050000-55e4-1004-5df2-9bc5600a255e	4281	Mojstrana
00050000-55e4-1004-8390-3cf32ac19273	8230	Mokronog
00050000-55e4-1004-e60d-75ec2deb2c85	1251	Moravče
00050000-55e4-1004-5bd0-269f2a409589	9226	Moravske Toplice
00050000-55e4-1004-218a-0625ce520a7b	5216	Most na Soči
00050000-55e4-1004-3e9a-aa21eae02a67	1221	Motnik
00050000-55e4-1004-57d1-71271ab01eda	3330	Mozirje
00050000-55e4-1004-47f3-fde7e4538a14	9000	Murska Sobota 
00050000-55e4-1004-4ade-c7d89853007b	9001	Murska Sobota - poštni predali
00050000-55e4-1004-4512-d715e8859c5a	2366	Muta
00050000-55e4-1004-10a7-646e025d2afd	4202	Naklo
00050000-55e4-1004-5542-d00cf61d95a4	3331	Nazarje
00050000-55e4-1004-831b-ca7b08f90235	1357	Notranje Gorice
00050000-55e4-1004-6640-ffe4d8f6ab79	3203	Nova Cerkev
00050000-55e4-1004-b572-1bd3eb819b55	5000	Nova Gorica 
00050000-55e4-1004-9406-07ab810254ba	5001	Nova Gorica - poštni predali
00050000-55e4-1004-fd5c-dfbb7604962c	1385	Nova vas
00050000-55e4-1004-f424-018637704023	8000	Novo mesto
00050000-55e4-1004-03f4-53d2e965ce17	8001	Novo mesto - poštni predali
00050000-55e4-1004-d490-78fcda634931	6243	Obrov
00050000-55e4-1004-6588-5ed873ac41a2	9233	Odranci
00050000-55e4-1004-d536-4d81359885a0	2317	Oplotnica
00050000-55e4-1004-cd79-f821f357b151	2312	Orehova vas
00050000-55e4-1004-a8ce-d12c4bad6213	2270	Ormož
00050000-55e4-1004-1e9f-63b0dda048d4	1316	Ortnek
00050000-55e4-1004-8a69-d76301cd75d5	1337	Osilnica
00050000-55e4-1004-089c-37683abce45e	8222	Otočec
00050000-55e4-1004-6da9-a7b7ef31a5eb	2361	Ožbalt
00050000-55e4-1004-d24f-e7808f08a3db	2231	Pernica
00050000-55e4-1004-c728-460f7d87124b	2211	Pesnica pri Mariboru
00050000-55e4-1004-afa4-fd5a3a61babe	9203	Petrovci
00050000-55e4-1004-0a2a-5c8fe856f54f	3301	Petrovče
00050000-55e4-1004-3eda-44eb0816ea44	6330	Piran/Pirano
00050000-55e4-1004-87d9-dd47b1b9a7c0	8255	Pišece
00050000-55e4-1004-01a7-14a8b51a8bc7	6257	Pivka
00050000-55e4-1004-40ee-96890d49ceb6	6232	Planina
00050000-55e4-1004-4c81-d964984043b6	3225	Planina pri Sevnici
00050000-55e4-1004-06f5-181d9de9165f	6276	Pobegi
00050000-55e4-1004-3c55-ea0b97509343	8312	Podbočje
00050000-55e4-1004-4b6e-584877aa4ec5	5243	Podbrdo
00050000-55e4-1004-1549-211c79c0b341	3254	Podčetrtek
00050000-55e4-1004-131f-aaa31e5cbda2	2273	Podgorci
00050000-55e4-1004-0a04-2c551d6c2395	6216	Podgorje
00050000-55e4-1004-21fc-0b20892b58fc	2381	Podgorje pri Slovenj Gradcu
00050000-55e4-1004-656d-efcd32e9aaed	6244	Podgrad
00050000-55e4-1004-3f5b-e89af06a3f2d	1414	Podkum
00050000-55e4-1004-6011-6cff45111ef2	2286	Podlehnik
00050000-55e4-1004-4345-20e200e119b7	5272	Podnanos
00050000-55e4-1004-d532-6b5da21547fd	4244	Podnart
00050000-55e4-1004-ab14-7fbc4f22599c	3241	Podplat
00050000-55e4-1004-44d8-e9d66e26efa8	3257	Podsreda
00050000-55e4-1004-160e-d5620042fe9a	2363	Podvelka
00050000-55e4-1004-c3d9-8870624d3a27	2208	Pohorje
00050000-55e4-1004-0ae6-6c1bc5447cd0	2257	Polenšak
00050000-55e4-1004-d31e-b001d3e22c8f	1355	Polhov Gradec
00050000-55e4-1004-66ef-f2a54a46038b	4223	Poljane nad Škofjo Loko
00050000-55e4-1004-729b-7f7f8def28b6	2319	Poljčane
00050000-55e4-1004-28f0-96aba895772e	1272	Polšnik
00050000-55e4-1004-344c-82d3e0c892bf	3313	Polzela
00050000-55e4-1004-09f8-35fc071a403c	3232	Ponikva
00050000-55e4-1004-15fb-ce9ffa29afea	6320	Portorož/Portorose
00050000-55e4-1004-0b55-95248755ea36	6230	Postojna
00050000-55e4-1004-930b-ff39715b7a65	2331	Pragersko
00050000-55e4-1004-27e5-a971acd0e9a4	3312	Prebold
00050000-55e4-1004-f33c-095fa85b6cd9	4205	Preddvor
00050000-55e4-1004-2ef1-f1723f8da25c	6255	Prem
00050000-55e4-1004-e619-042357518abf	1352	Preserje
00050000-55e4-1004-b029-fb36a6654278	6258	Prestranek
00050000-55e4-1004-3ed8-df19cc8ef97f	2391	Prevalje
00050000-55e4-1004-cab1-d1abe7d28790	3262	Prevorje
00050000-55e4-1004-6f41-7f4060397570	1276	Primskovo 
00050000-55e4-1004-274f-4211e3e054ff	3253	Pristava pri Mestinju
00050000-55e4-1004-2067-1a5a01280229	9207	Prosenjakovci/Partosfalva
00050000-55e4-1004-efc5-b52518fbf314	5297	Prvačina
00050000-55e4-1004-f8e6-025743f6106f	2250	Ptuj
00050000-55e4-1004-bd27-d18f434df56b	2323	Ptujska Gora
00050000-55e4-1004-b71f-a56815ed5a11	9201	Puconci
00050000-55e4-1004-07c3-6794c310beed	2327	Rače
00050000-55e4-1004-b903-30beee0db6a5	1433	Radeče
00050000-55e4-1004-b91d-cfce16a9ef98	9252	Radenci
00050000-55e4-1004-8437-829deb85cf22	2360	Radlje ob Dravi
00050000-55e4-1004-9ef2-f65393ffc76d	1235	Radomlje
00050000-55e4-1004-61e2-64e54ca808d3	4240	Radovljica
00050000-55e4-1004-18f0-33a8f06c55e4	8274	Raka
00050000-55e4-1004-1214-7918854edf7b	1381	Rakek
00050000-55e4-1004-fd33-3045cdbed61b	4283	Rateče - Planica
00050000-55e4-1004-ceb9-424c5887bfe1	2390	Ravne na Koroškem
00050000-55e4-1004-22a8-db28e16bae74	9246	Razkrižje
00050000-55e4-1004-b7e0-caca96f543f0	3332	Rečica ob Savinji
00050000-55e4-1004-9d3c-caa82b308eee	5292	Renče
00050000-55e4-1004-32cb-16492e52b803	1310	Ribnica
00050000-55e4-1004-fbc3-aaeabe4f673b	2364	Ribnica na Pohorju
00050000-55e4-1004-f4f3-05a445f987cf	3272	Rimske Toplice
00050000-55e4-1004-edac-7692252304ef	1314	Rob
00050000-55e4-1004-46b0-25b0faba4d58	5215	Ročinj
00050000-55e4-1004-bbcb-53895be16ce4	3250	Rogaška Slatina
00050000-55e4-1004-75e0-bcfa58f9e851	9262	Rogašovci
00050000-55e4-1004-f1f2-b492ee531d69	3252	Rogatec
00050000-55e4-1004-d857-9459bc5d1987	1373	Rovte
00050000-55e4-1004-6b1b-b6d84515af45	2342	Ruše
00050000-55e4-1004-d469-1f5d334a6b9f	1282	Sava
00050000-55e4-1004-22f2-68d627fc5a1e	6333	Sečovlje/Sicciole
00050000-55e4-1004-d990-111354c826cc	4227	Selca
00050000-55e4-1004-89ae-c7b3824ddfde	2352	Selnica ob Dravi
00050000-55e4-1004-2506-14880b4d16a4	8333	Semič
00050000-55e4-1004-374b-a954e2b7a72c	8281	Senovo
00050000-55e4-1004-8321-acc93f9fb34d	6224	Senožeče
00050000-55e4-1004-1803-dd812b6c7221	8290	Sevnica
00050000-55e4-1004-9a39-90d6c8e512f4	6210	Sežana
00050000-55e4-1004-698c-7b052700e870	2214	Sladki Vrh
00050000-55e4-1004-73b6-7a02ee073f04	5283	Slap ob Idrijci
00050000-55e4-1004-98c4-96dad759a0ef	2380	Slovenj Gradec
00050000-55e4-1004-d6fb-a3c6f0f8fbde	2310	Slovenska Bistrica
00050000-55e4-1004-12c6-27000f386b96	3210	Slovenske Konjice
00050000-55e4-1004-4b6c-0a4b97630ab3	1216	Smlednik
00050000-55e4-1004-28cb-9d06a4c49099	5232	Soča
00050000-55e4-1004-f582-11e2b93728b1	1317	Sodražica
00050000-55e4-1004-cb12-b995e891e151	3335	Solčava
00050000-55e4-1004-3fcd-8b67e6addc79	5250	Solkan
00050000-55e4-1004-2678-fe6c4ae89f9b	4229	Sorica
00050000-55e4-1004-9589-75b3ee7cff93	4225	Sovodenj
00050000-55e4-1004-df91-b09b359bf29a	5281	Spodnja Idrija
00050000-55e4-1004-374b-5ed7897e4f07	2241	Spodnji Duplek
00050000-55e4-1004-ae3d-83e55564c551	9245	Spodnji Ivanjci
00050000-55e4-1004-80ea-b7a7832dcf89	2277	Središče ob Dravi
00050000-55e4-1004-d221-d771d64136a3	4267	Srednja vas v Bohinju
00050000-55e4-1004-26f2-6c139541f520	8256	Sromlje 
00050000-55e4-1004-7c42-d281721b25a5	5224	Srpenica
00050000-55e4-1004-ab3b-bc016d1d287c	1242	Stahovica
00050000-55e4-1004-89ba-09391a2c15e2	1332	Stara Cerkev
00050000-55e4-1004-c5c3-720b82a7a539	8342	Stari trg ob Kolpi
00050000-55e4-1004-5455-3c5fb03ba4f3	1386	Stari trg pri Ložu
00050000-55e4-1004-b0cf-e8e9028eae29	2205	Starše
00050000-55e4-1004-7935-c4d28da2b814	2289	Stoperce
00050000-55e4-1004-6607-1b72eef8d681	8322	Stopiče
00050000-55e4-1004-261a-b3640a9ecb68	3206	Stranice
00050000-55e4-1004-42d7-9975c88d1c84	8351	Straža
00050000-55e4-1004-9cac-d3f0fe5147b4	1313	Struge
00050000-55e4-1004-6254-686338df51eb	8293	Studenec
00050000-55e4-1004-0c28-6df4bb58757d	8331	Suhor
00050000-55e4-1004-224e-f4d09377afe9	2233	Sv. Ana v Slovenskih goricah
00050000-55e4-1004-203a-b5805943e121	2235	Sv. Trojica v Slovenskih goricah
00050000-55e4-1004-80ed-89ebff0fa109	2353	Sveti Duh na Ostrem Vrhu
00050000-55e4-1004-123f-4561f3a19fa6	9244	Sveti Jurij ob Ščavnici
00050000-55e4-1004-3134-d6b387d722c7	3264	Sveti Štefan
00050000-55e4-1004-4d25-64bb58843894	2258	Sveti Tomaž
00050000-55e4-1004-fd28-261988709ed7	9204	Šalovci
00050000-55e4-1004-358d-1e4a8cf62ed0	5261	Šempas
00050000-55e4-1004-631f-f1387033b9af	5290	Šempeter pri Gorici
00050000-55e4-1004-38e7-b04b363207c5	3311	Šempeter v Savinjski dolini
00050000-55e4-1004-a5b9-1f3cd3cfc6f7	4208	Šenčur
00050000-55e4-1004-256d-a431650a811f	2212	Šentilj v Slovenskih goricah
00050000-55e4-1004-e9db-c668dd098414	8297	Šentjanž
00050000-55e4-1004-d69f-1e952c0b743f	2373	Šentjanž pri Dravogradu
00050000-55e4-1004-0a97-80e35736d205	8310	Šentjernej
00050000-55e4-1004-0eec-9afc7e471d92	3230	Šentjur
00050000-55e4-1004-e64b-64de53f6fdca	3271	Šentrupert
00050000-55e4-1004-89d5-9f3c5e51e72b	8232	Šentrupert
00050000-55e4-1004-db5b-78b9990c56df	1296	Šentvid pri Stični
00050000-55e4-1004-97c5-738d8f8efc87	8275	Škocjan
00050000-55e4-1004-660c-072f38f4f815	6281	Škofije
00050000-55e4-1004-f483-8ef0ad8ff715	4220	Škofja Loka
00050000-55e4-1004-52a1-32e384f5afe9	3211	Škofja vas
00050000-55e4-1004-90fe-8bb8baef4f34	1291	Škofljica
00050000-55e4-1004-9bb3-3b8ee6c78a9a	6274	Šmarje
00050000-55e4-1004-78b3-ce5591731040	1293	Šmarje - Sap
00050000-55e4-1004-51a4-4df93bfcfce6	3240	Šmarje pri Jelšah
00050000-55e4-1004-4ecd-8a28311cb5e3	8220	Šmarješke Toplice
00050000-55e4-1004-40c6-81be86ce976b	2315	Šmartno na Pohorju
00050000-55e4-1004-757d-1eafbddb5db6	3341	Šmartno ob Dreti
00050000-55e4-1004-8919-30731a6362ac	3327	Šmartno ob Paki
00050000-55e4-1004-30b9-671e16683463	1275	Šmartno pri Litiji
00050000-55e4-1004-665d-cacaa8271540	2383	Šmartno pri Slovenj Gradcu
00050000-55e4-1004-ea7e-e22bd7c29a24	3201	Šmartno v Rožni dolini
00050000-55e4-1004-057b-f96245e797fa	3325	Šoštanj
00050000-55e4-1004-d0ce-3b79075d92d2	6222	Štanjel
00050000-55e4-1004-e12f-d8ee484c6416	3220	Štore
00050000-55e4-1004-34f9-aa559eb6ce37	3304	Tabor
00050000-55e4-1004-85ad-0b19182069be	3221	Teharje
00050000-55e4-1004-7d81-5cd364334a97	9251	Tišina
00050000-55e4-1004-636c-b347b7affe77	5220	Tolmin
00050000-55e4-1004-4149-fac1bfa78ba4	3326	Topolšica
00050000-55e4-1004-d4c1-3fecbecad554	2371	Trbonje
00050000-55e4-1004-85e1-c31848efff2f	1420	Trbovlje
00050000-55e4-1004-820e-f2034966a614	8231	Trebelno 
00050000-55e4-1004-7027-6b37e8fdf715	8210	Trebnje
00050000-55e4-1004-7715-bb9171adcb20	5252	Trnovo pri Gorici
00050000-55e4-1004-d6c2-af42e84004db	2254	Trnovska vas
00050000-55e4-1004-cfc0-5eb3023dea79	1222	Trojane
00050000-55e4-1004-acc7-f82c6065f177	1236	Trzin
00050000-55e4-1004-0bdf-682e04ec0804	4290	Tržič
00050000-55e4-1004-ecec-3920113b247d	8295	Tržišče
00050000-55e4-1004-aa52-327bc24101e1	1311	Turjak
00050000-55e4-1004-c2c9-090df537a6f3	9224	Turnišče
00050000-55e4-1004-c2d9-b752dfc267f8	8323	Uršna sela
00050000-55e4-1004-b39e-c5f32471d6eb	1252	Vače
00050000-55e4-1004-bbce-b75280013e42	3320	Velenje 
00050000-55e4-1004-2e1d-d239ce1b617a	3322	Velenje - poštni predali
00050000-55e4-1004-6285-f7f989e5b650	8212	Velika Loka
00050000-55e4-1004-b8e5-243d32128f17	2274	Velika Nedelja
00050000-55e4-1004-0eca-6fa58f3a0f13	9225	Velika Polana
00050000-55e4-1004-3317-f84eb4586c84	1315	Velike Lašče
00050000-55e4-1004-5a61-6852a49101d1	8213	Veliki Gaber
00050000-55e4-1004-1784-13f08523e801	9241	Veržej
00050000-55e4-1004-c3d0-78c1015df0e5	1312	Videm - Dobrepolje
00050000-55e4-1004-7431-e7fe765b62b2	2284	Videm pri Ptuju
00050000-55e4-1004-0982-7faf8b574e2b	8344	Vinica
00050000-55e4-1004-2a6d-dff5cf27f9c5	5271	Vipava
00050000-55e4-1004-c360-31301fbb037c	4212	Visoko
00050000-55e4-1004-fdb9-253384054b38	1294	Višnja Gora
00050000-55e4-1004-a3fd-0c76edf30c96	3205	Vitanje
00050000-55e4-1004-0179-f2a9b78a987f	2255	Vitomarci
00050000-55e4-1004-05d8-f432f2dfe35e	1217	Vodice
00050000-55e4-1004-6465-b5ce6813d8d9	3212	Vojnik\t
00050000-55e4-1004-ecac-46635c97d8c8	5293	Volčja Draga
00050000-55e4-1004-5c24-981c6613d1e0	2232	Voličina
00050000-55e4-1004-7ec4-5922bfa6831b	3305	Vransko
00050000-55e4-1004-dafb-1877c5b2d867	6217	Vremski Britof
00050000-55e4-1004-1873-d26c45b7212f	1360	Vrhnika
00050000-55e4-1004-ce5a-d78d7b2143bd	2365	Vuhred
00050000-55e4-1004-85c3-c038c1c98424	2367	Vuzenica
00050000-55e4-1004-294e-c9057f23e2ff	8292	Zabukovje 
00050000-55e4-1004-663b-cf11c1a08502	1410	Zagorje ob Savi
00050000-55e4-1004-901f-20ad10569d28	1303	Zagradec
00050000-55e4-1004-4594-248517045c4d	2283	Zavrč
00050000-55e4-1004-af84-4ab2150cc253	8272	Zdole 
00050000-55e4-1004-8167-a04ce3518406	4201	Zgornja Besnica
00050000-55e4-1004-2eca-f5aefcac127f	2242	Zgornja Korena
00050000-55e4-1004-366f-2d555f848c48	2201	Zgornja Kungota
00050000-55e4-1004-ca41-1a9da18b6009	2316	Zgornja Ložnica
00050000-55e4-1004-bddf-fedd94ea48b3	2314	Zgornja Polskava
00050000-55e4-1004-1489-70d61c03e38a	2213	Zgornja Velka
00050000-55e4-1004-fe4e-f5a3f5e4ed4d	4247	Zgornje Gorje
00050000-55e4-1004-e089-539e1185f139	4206	Zgornje Jezersko
00050000-55e4-1004-dfac-286758059e8c	2285	Zgornji Leskovec
00050000-55e4-1004-6e2f-20d517b17a95	1432	Zidani Most
00050000-55e4-1004-28f3-83a6e8b0c282	3214	Zreče
00050000-55e4-1004-7209-5e539fb5f8eb	4209	Žabnica
00050000-55e4-1004-ae3f-78ff27a0856d	3310	Žalec
00050000-55e4-1004-e3ee-82338cbdac5f	4228	Železniki
00050000-55e4-1004-351e-aa52bbe92c83	2287	Žetale
00050000-55e4-1004-7e1a-aa44419fbf18	4226	Žiri
00050000-55e4-1004-3f48-3cd3f7be59b6	4274	Žirovnica
00050000-55e4-1004-a9dc-0ab998f1a2d9	8360	Žužemberk
\.


--
-- TOC entry 2934 (class 0 OID 16526005)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 16525812)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55e4-1005-6991-562e0c64d427	00080000-55e4-1005-690b-b48ac047be41	\N	00040000-55e4-1004-0f1c-64d5846aa53b	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55e4-1005-d8ad-d0a3d91e1e33	00080000-55e4-1005-690b-b48ac047be41	\N	00040000-55e4-1004-0f1c-64d5846aa53b		\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55e4-1005-c816-c58886e3021b	00080000-55e4-1005-f870-4e2664c54d91	\N	00040000-55e4-1004-0f1c-64d5846aa53b		\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2922 (class 0 OID 16525890)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 16526017)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2960 (class 0 OID 16526368)
-- Dependencies: 226
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 16526378)
-- Dependencies: 227
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55e4-1005-652c-02f8926ecdef	00080000-55e4-1005-b23d-445189233ba8	0987	AK
00190000-55e4-1005-7150-da7187e3a549	00080000-55e4-1005-f870-4e2664c54d91	0989	AK
00190000-55e4-1005-fa71-350c6964c23d	00080000-55e4-1005-38e3-5a10fbc190df	0986	AK
00190000-55e4-1005-f296-7d3074e87b55	00080000-55e4-1005-1942-dfc80e2a4020	0984	AK
00190000-55e4-1005-51bd-58d77c5f10ac	00080000-55e4-1005-ecb0-665786ac6dfc	0983	AK
00190000-55e4-1005-6a40-a83b3c2f31a2	00080000-55e4-1005-1cb8-4cd6b8bc13e8	0982	AK
00190000-55e4-1006-aa0f-98cd2948478b	00080000-55e4-1006-a1c1-3378eee222de	1001	AK
\.


--
-- TOC entry 2959 (class 0 OID 16526324)
-- Dependencies: 225
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55e4-1005-dd44-174e745af972	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2962 (class 0 OID 16526386)
-- Dependencies: 228
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 16526046)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55e4-1005-62b8-368b51f6f1f8	\N	\N	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55e4-1005-cb6d-43d67fec6d49	\N	\N	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55e4-1005-15ff-f0b59a4a2462	\N	\N	0003	Kazinska	t	84	Kazinska dvorana
00220000-55e4-1005-abac-01f226e8799a	\N	\N	0004	Mali oder	t	24	Mali oder 
00220000-55e4-1005-f600-a688c264b365	\N	\N	0005	Komorni oder	t	15	Komorni oder
00220000-55e4-1005-2865-15faceb19728	\N	\N	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55e4-1005-f0ef-a61171045550	\N	\N	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2932 (class 0 OID 16525990)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 16525980)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 16526177)
-- Dependencies: 218
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 16526116)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 16525685)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55e4-1006-a1c1-3378eee222de	00010000-55e4-1004-d70c-f4805ecac278	2015-08-31 10:27:50	INS	a:0:{}
2	App\\Entity\\Option	00000000-55e4-1006-8b52-280857458059	00010000-55e4-1004-d70c-f4805ecac278	2015-08-31 10:27:50	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55e4-1006-aa0f-98cd2948478b	00010000-55e4-1004-d70c-f4805ecac278	2015-08-31 10:27:50	INS	a:0:{}
\.


--
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2941 (class 0 OID 16526058)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 16525723)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55e4-1004-314b-02c50269f7e2	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55e4-1004-44aa-b26224f7310e	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55e4-1004-3907-9d18dfbd01fa	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55e4-1004-dc4c-b6c682f438b7	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55e4-1004-c73c-3a9a736f790c	planer	Planer dogodkov v koledarju	t
00020000-55e4-1004-a7a7-4f5db32cc5eb	kadrovska	Kadrovska služba	t
00020000-55e4-1004-510a-4818bd00e019	arhivar	Ažuriranje arhivalij	t
00020000-55e4-1004-b6ad-8fd4fce243c8	igralec	Igralec	t
00020000-55e4-1004-d8c3-31840b858055	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55e4-1005-3f28-d5d22042928d	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2907 (class 0 OID 16525707)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55e4-1004-3241-4afb914f3bd4	00020000-55e4-1004-3907-9d18dfbd01fa
00010000-55e4-1004-d70c-f4805ecac278	00020000-55e4-1004-3907-9d18dfbd01fa
00010000-55e4-1005-fd02-b6767292f1ac	00020000-55e4-1005-3f28-d5d22042928d
\.


--
-- TOC entry 2943 (class 0 OID 16526072)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 16526011)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 16525957)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 16526427)
-- Dependencies: 233
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55e4-1004-00fd-42df50553712	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55e4-1004-14b6-b904a55f9529	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55e4-1004-7171-4c132b6bb7fa	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55e4-1004-965b-993c5ad33a38	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55e4-1004-60ad-e3dde21f14b4	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2966 (class 0 OID 16526419)
-- Dependencies: 232
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55e4-1004-50bc-9af069ebabad	00230000-55e4-1004-965b-993c5ad33a38	popa
00240000-55e4-1004-d396-09bd70a90062	00230000-55e4-1004-965b-993c5ad33a38	oseba
00240000-55e4-1004-ecd5-c150b732c7d9	00230000-55e4-1004-965b-993c5ad33a38	sezona
00240000-55e4-1004-a511-34a446c078f3	00230000-55e4-1004-14b6-b904a55f9529	prostor
00240000-55e4-1004-3e70-a362076b2abd	00230000-55e4-1004-965b-993c5ad33a38	besedilo
00240000-55e4-1004-d426-d6d2837011be	00230000-55e4-1004-965b-993c5ad33a38	uprizoritev
00240000-55e4-1004-d653-fe55c19fa253	00230000-55e4-1004-965b-993c5ad33a38	funkcija
00240000-55e4-1004-af25-8fe9f83de041	00230000-55e4-1004-965b-993c5ad33a38	tipfunkcije
00240000-55e4-1004-7f64-9868869774c2	00230000-55e4-1004-965b-993c5ad33a38	alternacija
00240000-55e4-1004-659e-0d388954acc8	00230000-55e4-1004-00fd-42df50553712	pogodba
00240000-55e4-1004-b76c-f1706b3119f0	00230000-55e4-1004-965b-993c5ad33a38	zaposlitev
00240000-55e4-1004-80b8-2985088e3cbc	00230000-55e4-1004-00fd-42df50553712	programdela
00240000-55e4-1004-723c-3c7f6c433957	00230000-55e4-1004-965b-993c5ad33a38	zapis
\.


--
-- TOC entry 2965 (class 0 OID 16526414)
-- Dependencies: 231
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
7b0dc97a-e888-462a-8578-4a6be1bfb9d1	00230000-55e4-1004-965b-993c5ad33a38	0	1001
\.


--
-- TOC entry 2948 (class 0 OID 16526126)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55e4-1005-bf1b-2a2a004cc0da	000e0000-55e4-1005-d6cf-9935a20ae8a9	00080000-55e4-1005-690b-b48ac047be41	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55e4-1004-e188-b16bf09a6469
00270000-55e4-1005-e606-b132c9727c25	000e0000-55e4-1005-d6cf-9935a20ae8a9	00080000-55e4-1005-690b-b48ac047be41	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55e4-1004-e188-b16bf09a6469
00270000-55e4-1005-7ec5-b33acbf138d3	000e0000-55e4-1005-d6cf-9935a20ae8a9	00080000-55e4-1005-bf22-5afae6cb2be6	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4	\N
\.


--
-- TOC entry 2914 (class 0 OID 16525785)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 16525967)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55e4-1005-bcf6-7feb5cc4e311	00180000-55e4-1005-190c-cb17635360ba	000c0000-55e4-1005-4a14-43f9590693b7	00090000-55e4-1005-3b96-7cef33f84233	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e4-1005-7a37-48b03fa19c76	00180000-55e4-1005-190c-cb17635360ba	000c0000-55e4-1005-24fe-afed49215808	00090000-55e4-1005-f6e3-ec56d4f602d8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e4-1005-5673-5c8b2aa8fd23	00180000-55e4-1005-190c-cb17635360ba	000c0000-55e4-1005-d0ea-48b3bf8aa617	00090000-55e4-1005-dd9c-35eb0ed8f1c0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e4-1005-9fb0-4b3db70b7c6f	00180000-55e4-1005-190c-cb17635360ba	000c0000-55e4-1005-3c36-54f0aa46d888	00090000-55e4-1005-544c-313df33d4a3d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e4-1005-910b-897563eb1598	00180000-55e4-1005-190c-cb17635360ba	000c0000-55e4-1005-3cc9-ed97bdb651d7	00090000-55e4-1005-1e4f-01bbbd3c9178	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e4-1005-0491-b8529a1c106d	00180000-55e4-1005-4c52-2fdc70925aeb	\N	00090000-55e4-1005-1e4f-01bbbd3c9178	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2951 (class 0 OID 16526166)
-- Dependencies: 217
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55e4-1004-bfbe-e703912912a4	Avtor	Avtorji	Avtorka	umetnik
000f0000-55e4-1004-1a61-7d0ee272f28f	Priredba	Priredba	Priredba	umetnik
000f0000-55e4-1004-c7cb-aa4dee220c58	Prevod	Prevod	Prevod	umetnik
000f0000-55e4-1004-ea78-287b9d7f15c1	Režija	Režija	Režija	umetnik
000f0000-55e4-1004-bed1-9f1e05ea12c2	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55e4-1004-da8c-5fe77ea17375	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55e4-1004-2c91-408622bd765a	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55e4-1004-2a24-a01906adc569	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55e4-1004-74ff-b69b952a87e7	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55e4-1004-ccf2-531757e461a8	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55e4-1004-bc93-7559337f994a	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55e4-1004-22af-89b2fe1f5e16	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55e4-1004-01dd-46911a8ab26e	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55e4-1004-6fe6-317bcbde38f1	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55e4-1004-afb0-43a5c4b96d20	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55e4-1004-bfb7-944d65fffd14	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55e4-1004-fa99-6d555f6b6d3b	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55e4-1004-4441-c549ad9dc9c7	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2963 (class 0 OID 16526396)
-- Dependencies: 229
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55e4-1004-3dc7-64baa8a7760b	01	Velika predstava	f	1.00	1.00
002b0000-55e4-1004-5db8-3b192413b55a	02	Mala predstava	f	0.50	0.50
002b0000-55e4-1004-f71a-2e5a1fbf16ce	03	Mala koprodukcija	t	0.40	1.00
002b0000-55e4-1004-e7eb-88fcd80801be	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55e4-1004-b2ad-69d9311e7bea	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2919 (class 0 OID 16525847)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 16525694)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55e4-1004-d70c-f4805ecac278	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRObGlSnJWK0zQYHy9s86Vy/tVYNGNYiuy	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55e4-1005-ee3b-5a8081f251e6	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55e4-1005-70c5-3c08b385385d	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55e4-1005-30ed-2823dde592d7	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55e4-1005-3d83-7bd3931fea45	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55e4-1005-bb87-7b979430e4bb	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55e4-1005-f876-71c026d60a0b	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55e4-1005-d57b-bcb180991af3	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55e4-1005-8112-da9ca4efe7b4	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55e4-1005-f40e-70e8600973cf	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55e4-1005-fd02-b6767292f1ac	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55e4-1004-3241-4afb914f3bd4	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2955 (class 0 OID 16526214)
-- Dependencies: 221
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55e4-1005-94e9-a82c90595840	00160000-55e4-1005-4d16-952db456db27	\N	00140000-55e4-1004-14d6-00dca85a92c5	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55e4-1005-f600-a688c264b365
000e0000-55e4-1005-d6cf-9935a20ae8a9	00160000-55e4-1005-7c45-42e6f5da34ce	\N	00140000-55e4-1004-9a94-710aee1ba8a5	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55e4-1005-2865-15faceb19728
000e0000-55e4-1005-3926-f650aea0a60d	\N	\N	00140000-55e4-1004-9a94-710aee1ba8a5	00190000-55e4-1005-652c-02f8926ecdef	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55e4-1005-f600-a688c264b365
000e0000-55e4-1005-b94d-fb45ff66a208	\N	\N	00140000-55e4-1004-9a94-710aee1ba8a5	00190000-55e4-1005-652c-02f8926ecdef	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55e4-1005-f600-a688c264b365
000e0000-55e4-1005-0aba-819ca5bcd5a7	\N	\N	00140000-55e4-1004-9a94-710aee1ba8a5	00190000-55e4-1005-652c-02f8926ecdef	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55e4-1005-62b8-368b51f6f1f8
000e0000-55e4-1005-d333-0856629090ba	\N	\N	00140000-55e4-1004-9a94-710aee1ba8a5	00190000-55e4-1005-652c-02f8926ecdef	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55e4-1005-62b8-368b51f6f1f8
\.


--
-- TOC entry 2924 (class 0 OID 16525909)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55e4-1005-18df-47df5e437546	000e0000-55e4-1005-d6cf-9935a20ae8a9	1	
00200000-55e4-1005-bfd0-beec2299add3	000e0000-55e4-1005-d6cf-9935a20ae8a9	2	
\.


--
-- TOC entry 2939 (class 0 OID 16526038)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 16526140)
-- Dependencies: 215
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55e4-1004-f7d6-45e75d2752c7	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55e4-1004-d265-19322e0d8e38	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55e4-1004-dff2-2dfb41b66f8d	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55e4-1004-4ea5-a52a5b1963c2	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55e4-1004-177a-c93a3fb98f72	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55e4-1004-5e53-5c1ac03dcc22	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55e4-1004-20d8-17a0304f6262	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55e4-1004-c081-1a4203bbb08d	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55e4-1004-e188-b16bf09a6469	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55e4-1004-c5e2-d3a51f32ef45	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55e4-1004-1920-f1e2ae48d0bf	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55e4-1004-bfff-597df4ad8e4e	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55e4-1004-6d09-80f09edb2a95	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55e4-1004-a59a-e240f0be3ef0	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55e4-1004-77be-bd89dfe72705	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55e4-1004-9b66-cf3d8e74e077	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55e4-1004-4d10-30dbc17a74f5	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55e4-1004-6dfb-14f4a4ae8aa4	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55e4-1004-d908-0af2a2ef18a3	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55e4-1004-250c-10b1b6142618	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55e4-1004-e27b-38ad314e29fb	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55e4-1004-d1eb-84dd6a7ab8d7	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55e4-1004-4fb9-2e8a9a090f8b	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55e4-1004-27f2-3900d67b3af1	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55e4-1004-9241-8e482a9bafb7	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55e4-1004-ec87-ee9ffd82b147	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55e4-1004-c9d1-d0408c674a93	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55e4-1004-74c8-72711cca8cf9	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2969 (class 0 OID 16526466)
-- Dependencies: 235
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 16526438)
-- Dependencies: 234
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 16526478)
-- Dependencies: 236
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 16526109)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55e4-1005-72e2-d5e2a64bfad4	00090000-55e4-1005-f6e3-ec56d4f602d8	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e4-1005-ea3c-a7bdcf8ac8ca	00090000-55e4-1005-dd9c-35eb0ed8f1c0	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e4-1005-4c6a-a13463ce7152	00090000-55e4-1005-a675-9c59ec5a2f70	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e4-1005-b2be-2e59318eee53	00090000-55e4-1005-c605-6265f9b70dc6	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e4-1005-42f5-bdb6cbd6e2e5	00090000-55e4-1005-3b96-7cef33f84233	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e4-1005-da27-7db2f6b25501	00090000-55e4-1005-8591-1edbb2a1a57b	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2926 (class 0 OID 16525941)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 16526204)
-- Dependencies: 220
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55e4-1004-14d6-00dca85a92c5	01	Drama	drama (SURS 01)
00140000-55e4-1004-003b-5c6a652eac50	02	Opera	opera (SURS 02)
00140000-55e4-1004-577e-55d827da0c38	03	Balet	balet (SURS 03)
00140000-55e4-1004-c180-a270e5c7c38c	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55e4-1004-7d14-a9c535a1dce0	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55e4-1004-9a94-710aee1ba8a5	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55e4-1004-0577-8e7da13bba92	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2945 (class 0 OID 16526099)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2448 (class 2606 OID 16525748)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 16526263)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 16526253)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 16526165)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 16526518)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 16525931)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 16525956)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 16526412)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 16525873)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 16526318)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 16526095)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 16525907)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 16525950)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 16525887)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 16526003)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 16526495)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 16526502)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2694 (class 2606 OID 16526526)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 16526030)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 16525845)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 16525757)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 16525781)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 16525737)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2439 (class 2606 OID 16525722)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 16526036)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 16526071)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 16526199)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 16525809)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 16525833)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 16526009)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 16525823)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 16525894)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 16526021)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 16526375)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 16526383)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 16526366)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 16526394)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 16526053)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 16525994)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 16525985)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 16526187)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 16526123)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 16525693)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 16526062)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 16525711)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2441 (class 2606 OID 16525731)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 16526080)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 16526016)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 16525965)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 16526436)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 16526424)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 16526418)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 16526136)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 16525790)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 16525976)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 16526176)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 16526406)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 16525858)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 16525706)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 16526232)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 16525916)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 16526044)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 16526148)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 16526476)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 16526460)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 16526484)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 16526114)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 16525945)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 16526212)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 16526107)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 1259 OID 16525938)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2591 (class 1259 OID 16526137)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2592 (class 1259 OID 16526138)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2593 (class 1259 OID 16526139)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2680 (class 1259 OID 16526497)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2681 (class 1259 OID 16526496)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2462 (class 1259 OID 16525811)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2554 (class 1259 OID 16526037)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2667 (class 1259 OID 16526464)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2668 (class 1259 OID 16526463)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2669 (class 1259 OID 16526465)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2670 (class 1259 OID 16526462)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2671 (class 1259 OID 16526461)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2548 (class 1259 OID 16526023)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2549 (class 1259 OID 16526022)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2499 (class 1259 OID 16525917)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2578 (class 1259 OID 16526096)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2579 (class 1259 OID 16526098)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2580 (class 1259 OID 16526097)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2487 (class 1259 OID 16525889)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2488 (class 1259 OID 16525888)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2650 (class 1259 OID 16526395)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2604 (class 1259 OID 16526201)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2605 (class 1259 OID 16526202)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2606 (class 1259 OID 16526203)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2677 (class 1259 OID 16526485)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2613 (class 1259 OID 16526237)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2614 (class 1259 OID 16526234)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2615 (class 1259 OID 16526238)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2616 (class 1259 OID 16526236)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2617 (class 1259 OID 16526235)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2477 (class 1259 OID 16525860)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2478 (class 1259 OID 16525859)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2453 (class 1259 OID 16525784)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2566 (class 1259 OID 16526063)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2517 (class 1259 OID 16525951)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2443 (class 1259 OID 16525738)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2444 (class 1259 OID 16525739)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2571 (class 1259 OID 16526083)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2572 (class 1259 OID 16526082)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2573 (class 1259 OID 16526081)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2491 (class 1259 OID 16525895)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2492 (class 1259 OID 16525897)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2493 (class 1259 OID 16525896)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2660 (class 1259 OID 16526426)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2528 (class 1259 OID 16525989)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2529 (class 1259 OID 16525987)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2530 (class 1259 OID 16525986)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2531 (class 1259 OID 16525988)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2434 (class 1259 OID 16525712)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2435 (class 1259 OID 16525713)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2557 (class 1259 OID 16526045)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2690 (class 1259 OID 16526519)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2691 (class 1259 OID 16526527)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2692 (class 1259 OID 16526528)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2543 (class 1259 OID 16526010)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2587 (class 1259 OID 16526124)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2588 (class 1259 OID 16526125)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2634 (class 1259 OID 16526323)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2635 (class 1259 OID 16526322)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2636 (class 1259 OID 16526319)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2637 (class 1259 OID 16526320)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2638 (class 1259 OID 16526321)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2466 (class 1259 OID 16525825)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2467 (class 1259 OID 16525824)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2468 (class 1259 OID 16525826)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2560 (class 1259 OID 16526057)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2561 (class 1259 OID 16526056)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2642 (class 1259 OID 16526376)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2643 (class 1259 OID 16526377)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2627 (class 1259 OID 16526267)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2628 (class 1259 OID 16526268)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2629 (class 1259 OID 16526265)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2630 (class 1259 OID 16526266)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2584 (class 1259 OID 16526115)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2534 (class 1259 OID 16525998)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2535 (class 1259 OID 16525997)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2536 (class 1259 OID 16525995)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2537 (class 1259 OID 16525996)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2623 (class 1259 OID 16526255)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2624 (class 1259 OID 16526254)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2639 (class 1259 OID 16526367)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2498 (class 1259 OID 16525908)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2657 (class 1259 OID 16526413)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2684 (class 1259 OID 16526503)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2685 (class 1259 OID 16526504)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2449 (class 1259 OID 16525759)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2450 (class 1259 OID 16525758)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2458 (class 1259 OID 16525791)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2459 (class 1259 OID 16525792)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2523 (class 1259 OID 16525979)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2524 (class 1259 OID 16525978)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2525 (class 1259 OID 16525977)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2505 (class 1259 OID 16525940)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2506 (class 1259 OID 16525936)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2507 (class 1259 OID 16525933)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2508 (class 1259 OID 16525934)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2509 (class 1259 OID 16525932)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2510 (class 1259 OID 16525937)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2511 (class 1259 OID 16525935)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2465 (class 1259 OID 16525810)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2483 (class 1259 OID 16525874)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2484 (class 1259 OID 16525876)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2485 (class 1259 OID 16525875)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2486 (class 1259 OID 16525877)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2542 (class 1259 OID 16526004)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2609 (class 1259 OID 16526200)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2618 (class 1259 OID 16526233)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2456 (class 1259 OID 16525782)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2457 (class 1259 OID 16525783)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2581 (class 1259 OID 16526108)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2666 (class 1259 OID 16526437)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 16525846)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2663 (class 1259 OID 16526425)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2564 (class 1259 OID 16526055)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2565 (class 1259 OID 16526054)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2631 (class 1259 OID 16526264)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2473 (class 1259 OID 16525834)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2610 (class 1259 OID 16526213)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2674 (class 1259 OID 16526477)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2648 (class 1259 OID 16526384)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 16526385)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2522 (class 1259 OID 16525966)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2442 (class 1259 OID 16525732)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2512 (class 1259 OID 16525939)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2720 (class 2606 OID 16526664)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2723 (class 2606 OID 16526649)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2722 (class 2606 OID 16526654)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2718 (class 2606 OID 16526674)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2724 (class 2606 OID 16526644)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2719 (class 2606 OID 16526669)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2721 (class 2606 OID 16526659)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2757 (class 2606 OID 16526829)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2756 (class 2606 OID 16526834)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2755 (class 2606 OID 16526839)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2790 (class 2606 OID 16527009)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2791 (class 2606 OID 16527004)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2705 (class 2606 OID 16526579)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2741 (class 2606 OID 16526759)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2785 (class 2606 OID 16526989)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2786 (class 2606 OID 16526984)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2784 (class 2606 OID 16526994)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2787 (class 2606 OID 16526979)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2788 (class 2606 OID 16526974)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2739 (class 2606 OID 16526754)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2740 (class 2606 OID 16526749)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2717 (class 2606 OID 16526639)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2751 (class 2606 OID 16526799)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2749 (class 2606 OID 16526809)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2750 (class 2606 OID 16526804)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2711 (class 2606 OID 16526614)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2712 (class 2606 OID 16526609)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2737 (class 2606 OID 16526739)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2781 (class 2606 OID 16526959)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2760 (class 2606 OID 16526844)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2759 (class 2606 OID 16526849)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2758 (class 2606 OID 16526854)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2789 (class 2606 OID 16526999)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2762 (class 2606 OID 16526874)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2765 (class 2606 OID 16526859)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2761 (class 2606 OID 16526879)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2763 (class 2606 OID 16526869)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2764 (class 2606 OID 16526864)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2709 (class 2606 OID 16526604)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2710 (class 2606 OID 16526599)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2701 (class 2606 OID 16526564)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2702 (class 2606 OID 16526559)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2745 (class 2606 OID 16526779)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2725 (class 2606 OID 16526679)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2698 (class 2606 OID 16526539)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2697 (class 2606 OID 16526544)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2746 (class 2606 OID 16526794)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2747 (class 2606 OID 16526789)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2748 (class 2606 OID 16526784)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2715 (class 2606 OID 16526619)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2713 (class 2606 OID 16526629)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2714 (class 2606 OID 16526624)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2783 (class 2606 OID 16526969)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2729 (class 2606 OID 16526714)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2731 (class 2606 OID 16526704)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2732 (class 2606 OID 16526699)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2730 (class 2606 OID 16526709)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2696 (class 2606 OID 16526529)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2695 (class 2606 OID 16526534)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2742 (class 2606 OID 16526764)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2794 (class 2606 OID 16527024)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2796 (class 2606 OID 16527029)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2795 (class 2606 OID 16527034)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2738 (class 2606 OID 16526744)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2754 (class 2606 OID 16526819)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2753 (class 2606 OID 16526824)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2772 (class 2606 OID 16526934)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2773 (class 2606 OID 16526929)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2776 (class 2606 OID 16526914)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2775 (class 2606 OID 16526919)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2774 (class 2606 OID 16526924)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2707 (class 2606 OID 16526589)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2708 (class 2606 OID 16526584)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2706 (class 2606 OID 16526594)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2743 (class 2606 OID 16526774)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2744 (class 2606 OID 16526769)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2779 (class 2606 OID 16526944)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2778 (class 2606 OID 16526949)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2769 (class 2606 OID 16526904)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2768 (class 2606 OID 16526909)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2771 (class 2606 OID 16526894)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2770 (class 2606 OID 16526899)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2752 (class 2606 OID 16526814)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2733 (class 2606 OID 16526734)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2734 (class 2606 OID 16526729)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2736 (class 2606 OID 16526719)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2735 (class 2606 OID 16526724)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2766 (class 2606 OID 16526889)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2767 (class 2606 OID 16526884)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2777 (class 2606 OID 16526939)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2716 (class 2606 OID 16526634)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2780 (class 2606 OID 16526954)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2782 (class 2606 OID 16526964)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2793 (class 2606 OID 16527014)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2792 (class 2606 OID 16527019)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2699 (class 2606 OID 16526554)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2700 (class 2606 OID 16526549)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2704 (class 2606 OID 16526569)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2703 (class 2606 OID 16526574)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2726 (class 2606 OID 16526694)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2727 (class 2606 OID 16526689)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2728 (class 2606 OID 16526684)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-31 10:27:51 CEST

--
-- PostgreSQL database dump complete
--

