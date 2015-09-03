--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-03 15:59:10 CEST

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
-- TOC entry 178 (class 1259 OID 17256673)
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
-- TOC entry 223 (class 1259 OID 17257187)
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
-- TOC entry 222 (class 1259 OID 17257170)
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
-- TOC entry 216 (class 1259 OID 17257080)
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
-- TOC entry 239 (class 1259 OID 17257435)
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
-- TOC entry 192 (class 1259 OID 17256851)
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
-- TOC entry 194 (class 1259 OID 17256882)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 17257337)
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
-- TOC entry 187 (class 1259 OID 17256794)
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
-- TOC entry 224 (class 1259 OID 17257200)
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
-- TOC entry 210 (class 1259 OID 17257015)
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
-- TOC entry 190 (class 1259 OID 17256830)
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
-- TOC entry 188 (class 1259 OID 17256811)
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
-- TOC entry 199 (class 1259 OID 17256929)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 237 (class 1259 OID 17257416)
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
-- TOC entry 238 (class 1259 OID 17257428)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 17257450)
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
-- TOC entry 203 (class 1259 OID 17256954)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 185 (class 1259 OID 17256768)
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
-- TOC entry 179 (class 1259 OID 17256682)
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
-- TOC entry 180 (class 1259 OID 17256693)
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
-- TOC entry 175 (class 1259 OID 17256647)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 17256666)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 17256961)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 17256995)
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
-- TOC entry 219 (class 1259 OID 17257119)
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
-- TOC entry 182 (class 1259 OID 17256726)
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
-- TOC entry 184 (class 1259 OID 17256760)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 17256935)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 183 (class 1259 OID 17256745)
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
-- TOC entry 189 (class 1259 OID 17256823)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 202 (class 1259 OID 17256947)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 17257298)
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
-- TOC entry 227 (class 1259 OID 17257308)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 17257255)
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
-- TOC entry 228 (class 1259 OID 17257316)
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
-- TOC entry 206 (class 1259 OID 17256976)
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
-- TOC entry 198 (class 1259 OID 17256920)
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
-- TOC entry 197 (class 1259 OID 17256910)
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
-- TOC entry 218 (class 1259 OID 17257108)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 17257047)
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
-- TOC entry 172 (class 1259 OID 17256618)
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
-- TOC entry 171 (class 1259 OID 17256616)
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
-- TOC entry 207 (class 1259 OID 17256989)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 176 (class 1259 OID 17256656)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 174 (class 1259 OID 17256640)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 17257003)
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
-- TOC entry 201 (class 1259 OID 17256941)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 17256887)
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
-- TOC entry 233 (class 1259 OID 17257357)
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
-- TOC entry 232 (class 1259 OID 17257349)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 17257344)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 17257057)
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
-- TOC entry 181 (class 1259 OID 17256718)
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
-- TOC entry 196 (class 1259 OID 17256897)
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
-- TOC entry 217 (class 1259 OID 17257097)
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
-- TOC entry 229 (class 1259 OID 17257326)
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
-- TOC entry 186 (class 1259 OID 17256780)
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
-- TOC entry 173 (class 1259 OID 17256627)
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
-- TOC entry 221 (class 1259 OID 17257145)
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
-- TOC entry 191 (class 1259 OID 17256841)
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
-- TOC entry 205 (class 1259 OID 17256968)
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
-- TOC entry 215 (class 1259 OID 17257071)
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
-- TOC entry 235 (class 1259 OID 17257396)
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
-- TOC entry 234 (class 1259 OID 17257368)
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
-- TOC entry 236 (class 1259 OID 17257408)
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
-- TOC entry 212 (class 1259 OID 17257040)
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
-- TOC entry 193 (class 1259 OID 17256877)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 17257135)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 17257030)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 17256621)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2911 (class 0 OID 17256673)
-- Dependencies: 178
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2956 (class 0 OID 17257187)
-- Dependencies: 223
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55e8-522c-afbf-229df4357174	000d0000-55e8-522c-fab0-7a0c9b2c28bd	\N	00090000-55e8-522c-4b2d-b55617496a7f	000b0000-55e8-522c-b74b-50ecbd8b6191	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55e8-522d-3c5a-3662fc1e2d81	000d0000-55e8-522c-44b1-5b268c837ecb	00100000-55e8-522c-c30a-7865bf3acf25	00090000-55e8-522c-b6cd-113daced229d	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55e8-522d-2b73-81e1b152da05	000d0000-55e8-522c-da3f-ba948d0aaaa2	00100000-55e8-522c-6d26-7493043a10dc	00090000-55e8-522c-59e7-57b708156741	\N	0003	t	\N	2015-09-03	\N	2	t	\N	f	f
000c0000-55e8-522d-6408-ee1f5452a718	000d0000-55e8-522c-41ae-97a93b3ff9c2	\N	00090000-55e8-522c-f64e-fe1e3506259d	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55e8-522d-0aef-5a739393a156	000d0000-55e8-522c-5d3a-f0019a08c048	\N	00090000-55e8-522c-0227-1cf5e6a7c5da	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55e8-522d-8762-fed2139d0985	000d0000-55e8-522c-3de0-1eae06a78a1a	\N	00090000-55e8-522c-0d8d-12b5f7909823	000b0000-55e8-522c-1d05-6213bd0953f0	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55e8-522d-fa03-65792741c1f6	000d0000-55e8-522c-d614-fc69f8dcda8c	00100000-55e8-522c-40d4-1ccad51744b7	00090000-55e8-522c-2b5b-4bca3a0153e0	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55e8-522d-c178-04ca11c44d1e	000d0000-55e8-522c-a245-aeb3602252ee	\N	00090000-55e8-522c-4f17-b19a98881d52	000b0000-55e8-522c-974e-2e14c8597b9b	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55e8-522d-43f9-ff39ab0276b5	000d0000-55e8-522c-d614-fc69f8dcda8c	00100000-55e8-522c-132c-b5b74d0001ff	00090000-55e8-522c-b24c-0da2ece5b9e7	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55e8-522d-3e88-e92d3b6f9b39	000d0000-55e8-522c-d614-fc69f8dcda8c	00100000-55e8-522c-cff4-80ed61d5317f	00090000-55e8-522c-29a1-2c4bbb9a3971	\N	0010	t	\N	2015-09-03	\N	16	f	\N	f	t
000c0000-55e8-522d-e4e3-64074189e4aa	000d0000-55e8-522c-d614-fc69f8dcda8c	00100000-55e8-522c-a27e-43fc480030d6	00090000-55e8-522c-d878-94f369c3b78d	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
\.


--
-- TOC entry 2955 (class 0 OID 17257170)
-- Dependencies: 222
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 17257080)
-- Dependencies: 216
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55e8-522c-f38b-146a57673934	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55e8-522c-6e06-5632b599a589	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55e8-522c-1aa7-b6fbcf3e3afa	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2972 (class 0 OID 17257435)
-- Dependencies: 239
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2925 (class 0 OID 17256851)
-- Dependencies: 192
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55e8-522c-51e3-8a187616f546	\N	\N	00200000-55e8-522c-2298-4bc2b290b7f9	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55e8-522c-32a0-0f3484c3de2b	\N	\N	00200000-55e8-522c-247c-1d679b11dcf9	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55e8-522c-4063-c8717f191346	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55e8-522c-bffb-e0f66fc66603	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55e8-522c-848e-80f03fe5a18d	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2927 (class 0 OID 17256882)
-- Dependencies: 194
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 17257337)
-- Dependencies: 230
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 17256794)
-- Dependencies: 187
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55e8-522a-fdda-07d1442e4da9	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55e8-522a-5a26-39a84a114d81	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55e8-522a-682d-a112897bd9aa	AL	ALB	008	Albania 	Albanija	\N
00040000-55e8-522a-ad9a-0e453df096f2	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55e8-522a-518a-6126cb66c676	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55e8-522a-2b5f-255c4a14f3f9	AD	AND	020	Andorra 	Andora	\N
00040000-55e8-522a-19b5-33bfe6c5be70	AO	AGO	024	Angola 	Angola	\N
00040000-55e8-522a-d6df-bc11a98f0ae1	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55e8-522a-a1a8-fc43af608891	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55e8-522a-0923-1c334ae2357d	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55e8-522a-543f-133152785934	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55e8-522a-9e7d-61c82be0a189	AM	ARM	051	Armenia 	Armenija	\N
00040000-55e8-522a-30a2-f97bd988cdb7	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55e8-522a-75ee-e7b42e3abe23	AU	AUS	036	Australia 	Avstralija	\N
00040000-55e8-522a-d8a4-494f399dc21c	AT	AUT	040	Austria 	Avstrija	\N
00040000-55e8-522a-b40a-5f8e590eff25	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55e8-522a-b86d-745248ebf0f7	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55e8-522a-6f9a-92a2a556f241	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55e8-522a-c176-e1858e13a035	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55e8-522a-c783-99a2a36bc947	BB	BRB	052	Barbados 	Barbados	\N
00040000-55e8-522a-b181-dc0888f4d1ef	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55e8-522a-4004-ac144d0558ab	BE	BEL	056	Belgium 	Belgija	\N
00040000-55e8-522a-5a3d-4485d2a25f9f	BZ	BLZ	084	Belize 	Belize	\N
00040000-55e8-522a-38c1-57f496efedc6	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55e8-522a-5eb5-283220cf08d4	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55e8-522a-6990-6eca4549f4ee	BT	BTN	064	Bhutan 	Butan	\N
00040000-55e8-522a-a862-f2abf6ac8d50	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55e8-522a-3039-efe066d0e08d	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55e8-522a-d9f6-a1f5b1b624d0	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55e8-522a-8f05-ee81e0e30c3f	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55e8-522b-92c5-6714e3964f03	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55e8-522b-03e3-7f3092cb4427	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55e8-522b-b839-fb4e5f209f55	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55e8-522b-dbdb-16fae5142dc9	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55e8-522b-230f-ca9e86a1b34f	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55e8-522b-b433-ec9154b894ef	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55e8-522b-bd33-5f3723709c36	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55e8-522b-dab1-37bdb3abc946	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55e8-522b-dac5-aa1a1a9d6431	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55e8-522b-b81d-b7943226e9d3	CA	CAN	124	Canada 	Kanada	\N
00040000-55e8-522b-9d78-9cb1e0a6c3d2	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55e8-522b-9d55-9b8aa05d55b0	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55e8-522b-5325-735d1d6ac14a	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55e8-522b-3f79-08ae152c6e80	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55e8-522b-c4a1-85b7609318ee	CL	CHL	152	Chile 	Čile	\N
00040000-55e8-522b-074b-00efd8db27b7	CN	CHN	156	China 	Kitajska	\N
00040000-55e8-522b-0b3f-cd54a94010d2	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55e8-522b-2816-c762e787672a	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55e8-522b-79fd-0890e345f10e	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55e8-522b-95ad-efccb1081bd4	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55e8-522b-d119-e276b2fa1900	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55e8-522b-d162-22c4b92c305a	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55e8-522b-d1b4-0aaf5be81cef	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55e8-522b-99fd-d97b774fab4d	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55e8-522b-173c-823d72e9694e	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55e8-522b-a0f0-23f88aa97505	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55e8-522b-46ec-bb8a84b609ad	CU	CUB	192	Cuba 	Kuba	\N
00040000-55e8-522b-d957-44af63d8a2b7	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55e8-522b-f3ac-4402a6cc4a63	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55e8-522b-396a-a2313aa4a751	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55e8-522b-67f4-fbfc55417b7d	DK	DNK	208	Denmark 	Danska	\N
00040000-55e8-522b-7450-36512bcb0ceb	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55e8-522b-8cce-d353547d6ef9	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55e8-522b-108b-98b551e84c13	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55e8-522b-a76d-7f409ae6e75c	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55e8-522b-f9eb-8028db132ba5	EG	EGY	818	Egypt 	Egipt	\N
00040000-55e8-522b-4ae6-db0a27cdec69	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55e8-522b-8a4b-5e27ff501f88	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55e8-522b-bc43-102bdb6b74ae	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55e8-522b-f3d3-4d08a5807362	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55e8-522b-4b66-514fdf25442b	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55e8-522b-1555-745e40f5693f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55e8-522b-f017-9c665ccdda13	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55e8-522b-7330-c8080b40649e	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55e8-522b-0032-7afc8c69387f	FI	FIN	246	Finland 	Finska	\N
00040000-55e8-522b-bf41-a59cef4f2f61	FR	FRA	250	France 	Francija	\N
00040000-55e8-522b-e2c7-18598b2f213d	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55e8-522b-0307-01f805c8b205	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55e8-522b-5618-baf479fc509b	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55e8-522b-e339-a3cb7a7fc3a6	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55e8-522b-3468-27b828415e50	GA	GAB	266	Gabon 	Gabon	\N
00040000-55e8-522b-4bd7-627ecb152f09	GM	GMB	270	Gambia 	Gambija	\N
00040000-55e8-522b-261b-fee45c3a54e9	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55e8-522b-30ef-7f8397a995a4	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55e8-522b-c598-3f30cf26d811	GH	GHA	288	Ghana 	Gana	\N
00040000-55e8-522b-9588-df65b3a9321d	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55e8-522b-1456-dcffc82527d7	GR	GRC	300	Greece 	Grčija	\N
00040000-55e8-522b-e9e3-e9f3892cd300	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55e8-522b-3325-8b8cae6a638e	GD	GRD	308	Grenada 	Grenada	\N
00040000-55e8-522b-eafd-f09d0548be71	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55e8-522b-f7c7-a6034bce5902	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55e8-522b-860b-a5cc6083ab4b	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55e8-522b-3804-0f5fb8e90462	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55e8-522b-8c91-18ed7384f5d3	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55e8-522b-92bc-8942b7a526f9	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55e8-522b-df58-aeadae5888df	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55e8-522b-bca2-48ef2925b703	HT	HTI	332	Haiti 	Haiti	\N
00040000-55e8-522b-02cf-68f9918f2c07	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55e8-522b-5684-28c23cdfdd75	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55e8-522b-32b8-135388b47eca	HN	HND	340	Honduras 	Honduras	\N
00040000-55e8-522b-5278-42dea48dd0d5	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55e8-522b-3d49-195ff2b1e7f1	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55e8-522b-770b-69607637d13e	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55e8-522b-5379-189e95633bba	IN	IND	356	India 	Indija	\N
00040000-55e8-522b-8495-47b1696d653c	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55e8-522b-9a79-83060886385b	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55e8-522b-0dd9-3e15f1af27df	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55e8-522b-10bf-aa3cec0a6969	IE	IRL	372	Ireland 	Irska	\N
00040000-55e8-522b-df89-082b95743399	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55e8-522b-4879-1336d1ccc986	IL	ISR	376	Israel 	Izrael	\N
00040000-55e8-522b-eac2-57ab012b6014	IT	ITA	380	Italy 	Italija	\N
00040000-55e8-522b-b58b-846820391a1f	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55e8-522b-2527-593c17c6c85e	JP	JPN	392	Japan 	Japonska	\N
00040000-55e8-522b-de0f-e33c770ecac1	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55e8-522b-bb97-fa2eb1809ed5	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55e8-522b-6ba0-15097967248c	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55e8-522b-7223-1108db958e21	KE	KEN	404	Kenya 	Kenija	\N
00040000-55e8-522b-2411-bc4abbbcf0be	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55e8-522b-c8b3-36013a8e540b	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55e8-522b-51a6-d44dba813682	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55e8-522b-bc1d-9c4a319314c2	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55e8-522b-d855-8f9f84ea84be	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55e8-522b-0f05-8b1a9b4f4891	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55e8-522b-df49-0ac4990a8dfb	LV	LVA	428	Latvia 	Latvija	\N
00040000-55e8-522b-88ee-5edecd5881c6	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55e8-522b-48fc-de6389c34e07	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55e8-522b-898d-971a21da4598	LR	LBR	430	Liberia 	Liberija	\N
00040000-55e8-522b-e004-b7ddd8a45fbf	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55e8-522b-1344-791970a08c59	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55e8-522b-829f-ac3473a93a8e	LT	LTU	440	Lithuania 	Litva	\N
00040000-55e8-522b-9869-5df97053822b	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55e8-522b-d014-2642b77bd09e	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55e8-522b-db13-c2e98bb34483	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55e8-522b-2da2-7de6dc3755f1	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55e8-522b-7575-77d576ac7f05	MW	MWI	454	Malawi 	Malavi	\N
00040000-55e8-522b-8512-a6b6929474dc	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55e8-522b-be82-595e78c7b07f	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55e8-522b-5dbf-9bcf8b138f70	ML	MLI	466	Mali 	Mali	\N
00040000-55e8-522b-4faf-30dc13ae1221	MT	MLT	470	Malta 	Malta	\N
00040000-55e8-522b-742c-be0eae1d7c94	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55e8-522b-673f-8df8de76f22d	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55e8-522b-b5b4-2e4056e9bf5e	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55e8-522b-0b68-0153fffe0a43	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55e8-522b-dd34-05f279f4d5c3	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55e8-522b-2479-ecaa4c7812ce	MX	MEX	484	Mexico 	Mehika	\N
00040000-55e8-522b-6aa5-0e4c605a309d	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55e8-522b-c285-7d3f69d0a70b	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55e8-522b-76a8-ff2408fa6c18	MC	MCO	492	Monaco 	Monako	\N
00040000-55e8-522b-879d-175c66945354	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55e8-522b-9dc0-894b7be83ee4	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55e8-522b-3ffa-61596c4bb76c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55e8-522b-5c3d-e8b7aae0b839	MA	MAR	504	Morocco 	Maroko	\N
00040000-55e8-522b-c08e-152362c4ba8d	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55e8-522b-b94c-e26614da456f	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55e8-522b-78c9-ea4c55d1cc24	NA	NAM	516	Namibia 	Namibija	\N
00040000-55e8-522b-1da2-d7ce5f1449c8	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55e8-522b-c361-0d75e54eb514	NP	NPL	524	Nepal 	Nepal	\N
00040000-55e8-522b-4e57-d62bbfbaed22	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55e8-522b-886a-6717f79bfc26	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55e8-522b-4864-03edad0130e9	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55e8-522b-1cfc-831f64fa74d3	NE	NER	562	Niger 	Niger 	\N
00040000-55e8-522b-4725-90fa8bc0dfe6	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55e8-522b-e3de-daa54d276035	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55e8-522b-e2b3-ac91567fc1a0	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55e8-522b-c004-8bfe90802308	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55e8-522b-d520-115ded63c293	NO	NOR	578	Norway 	Norveška	\N
00040000-55e8-522b-af66-14b793494b1f	OM	OMN	512	Oman 	Oman	\N
00040000-55e8-522b-ea5b-754a9eeeb109	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55e8-522b-58c4-221053461d27	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55e8-522b-6223-24015e7554fb	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55e8-522b-5f5f-36fd7f1eb8f6	PA	PAN	591	Panama 	Panama	\N
00040000-55e8-522b-031a-981e0024f57a	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55e8-522b-d81c-fc1806663ff7	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55e8-522b-2f97-62aef99547bc	PE	PER	604	Peru 	Peru	\N
00040000-55e8-522b-2be6-5b1601f05490	PH	PHL	608	Philippines 	Filipini	\N
00040000-55e8-522b-b1c1-bceb8bd29b27	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55e8-522b-39c5-bd082dad835d	PL	POL	616	Poland 	Poljska	\N
00040000-55e8-522b-5392-9e385d32942c	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55e8-522b-231c-345fc94e5061	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55e8-522b-5e1d-4ef8621fc6dc	QA	QAT	634	Qatar 	Katar	\N
00040000-55e8-522b-18fc-ecf99713374e	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55e8-522b-978b-e8510c70f0a8	RO	ROU	642	Romania 	Romunija	\N
00040000-55e8-522b-6a40-9dcaa83b901c	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55e8-522b-6361-1055a5a5446c	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55e8-522b-95a9-acc21118f9a8	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55e8-522b-9ce3-7edcfa56e297	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55e8-522b-240e-3f77760416b0	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55e8-522b-9c1c-fcd2e9db9006	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55e8-522b-fa98-c95bc06facce	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55e8-522b-c201-fce84a0ee959	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55e8-522b-b1f9-2c8ba5ff157e	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55e8-522b-9df0-b073c1e04839	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55e8-522b-e474-61af34b97550	SM	SMR	674	San Marino 	San Marino	\N
00040000-55e8-522b-f97f-6ff743ed17ab	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55e8-522b-e859-1e63d06fa837	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55e8-522b-3a7c-caafd90f8f58	SN	SEN	686	Senegal 	Senegal	\N
00040000-55e8-522b-481a-7a15b1884630	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55e8-522b-a9d5-8a779f33f2b5	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55e8-522b-eb98-42e4fefeddc6	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55e8-522b-65c1-9ce884eb0c74	SG	SGP	702	Singapore 	Singapur	\N
00040000-55e8-522b-d013-314f0ed590c9	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55e8-522b-77c8-a1be689e2d75	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55e8-522b-2611-7ba4a3d8c31d	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55e8-522b-a765-e890a428485d	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55e8-522b-eb90-4e1ba60f5196	SO	SOM	706	Somalia 	Somalija	\N
00040000-55e8-522b-67df-5420caf3236c	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55e8-522b-bf67-e68e2ee0c437	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55e8-522b-f6ab-2f6042b62098	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55e8-522b-43f5-58ee0e112f8f	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55e8-522b-3911-9b018d99ad39	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55e8-522b-602d-a16933bc880f	SD	SDN	729	Sudan 	Sudan	\N
00040000-55e8-522b-7126-627fdf534cc8	SR	SUR	740	Suriname 	Surinam	\N
00040000-55e8-522b-fde5-b8062665be31	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55e8-522b-4cce-e5ecba9db5db	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55e8-522b-cc7c-5e493217c996	SE	SWE	752	Sweden 	Švedska	\N
00040000-55e8-522b-b0ed-e31a42fc4750	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55e8-522b-4e43-cdb82b7017b8	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55e8-522b-22f6-4d673c4a1c64	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55e8-522b-85f8-1fa60d405a60	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55e8-522b-94ce-30ea5c71712c	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55e8-522b-9a6b-de6280985d50	TH	THA	764	Thailand 	Tajska	\N
00040000-55e8-522b-0180-1fff4bbfad88	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55e8-522b-a97c-cddca93fcbf6	TG	TGO	768	Togo 	Togo	\N
00040000-55e8-522b-a3c4-4abe112d8a3c	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55e8-522b-0eef-93a0b670b68d	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55e8-522b-548f-b89437b9215e	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55e8-522b-f713-ee7249bd370d	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55e8-522b-afea-df519b26709b	TR	TUR	792	Turkey 	Turčija	\N
00040000-55e8-522b-a56d-72545feeabc0	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55e8-522b-f776-905d943dc6ce	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55e8-522b-cbf1-6cb3f7eefedb	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55e8-522b-8216-943ed58aa6de	UG	UGA	800	Uganda 	Uganda	\N
00040000-55e8-522b-0632-d962c11e2b96	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55e8-522b-d007-6c6595245281	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55e8-522b-796a-997eeb1fef73	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55e8-522b-0f41-9b6b33826688	US	USA	840	United States 	Združene države Amerike	\N
00040000-55e8-522b-ab7b-70188aa62ed1	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55e8-522b-be3f-9d195e0870d0	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55e8-522b-c411-a31626fdab0a	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55e8-522b-eac6-37014e3048e7	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55e8-522b-bc38-24e6daf608e2	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55e8-522b-d326-4e6cc03b23ed	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55e8-522b-b718-c9e90950ccdc	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55e8-522b-c766-623500d15913	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55e8-522b-647e-01391a257664	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55e8-522b-94a0-3b9f893fd2a8	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55e8-522b-fda3-2d5a3224588e	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55e8-522b-8a68-64b7c89f6bd6	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55e8-522b-b07e-d928c7cddc62	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2957 (class 0 OID 17257200)
-- Dependencies: 224
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55e8-522c-c9a1-6d4a0d7722ac	000e0000-55e8-522c-d183-c7bd16efd29b	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e8-522a-715b-0c27b035d85b	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55e8-522c-8569-d48952cb2919	000e0000-55e8-522c-af75-2407a21ae70d	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e8-522a-71c7-8e1799b9533a	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55e8-522c-a1b0-1a725d106621	000e0000-55e8-522c-109a-90841166224e	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e8-522a-715b-0c27b035d85b	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55e8-522c-cac8-617b8c4e01b6	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55e8-522c-5a2c-2956d77b4f01	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2943 (class 0 OID 17257015)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55e8-522c-fab0-7a0c9b2c28bd	000e0000-55e8-522c-af75-2407a21ae70d	000c0000-55e8-522c-afbf-229df4357174	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55e8-522a-70dc-7f942a88a417
000d0000-55e8-522c-44b1-5b268c837ecb	000e0000-55e8-522c-af75-2407a21ae70d	000c0000-55e8-522d-3c5a-3662fc1e2d81	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55e8-522a-83ee-bdf74303060f
000d0000-55e8-522c-da3f-ba948d0aaaa2	000e0000-55e8-522c-af75-2407a21ae70d	000c0000-55e8-522d-2b73-81e1b152da05	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55e8-522a-9799-b1c6d774175e
000d0000-55e8-522c-41ae-97a93b3ff9c2	000e0000-55e8-522c-af75-2407a21ae70d	000c0000-55e8-522d-6408-ee1f5452a718	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55e8-522a-fe73-6fae11f63743
000d0000-55e8-522c-5d3a-f0019a08c048	000e0000-55e8-522c-af75-2407a21ae70d	000c0000-55e8-522d-0aef-5a739393a156	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55e8-522a-fe73-6fae11f63743
000d0000-55e8-522c-3de0-1eae06a78a1a	000e0000-55e8-522c-af75-2407a21ae70d	000c0000-55e8-522d-8762-fed2139d0985	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55e8-522a-70dc-7f942a88a417
000d0000-55e8-522c-d614-fc69f8dcda8c	000e0000-55e8-522c-af75-2407a21ae70d	000c0000-55e8-522d-43f9-ff39ab0276b5	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55e8-522a-70dc-7f942a88a417
000d0000-55e8-522c-a245-aeb3602252ee	000e0000-55e8-522c-af75-2407a21ae70d	000c0000-55e8-522d-c178-04ca11c44d1e	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55e8-522a-0842-a3d05e18cb97
\.


--
-- TOC entry 2923 (class 0 OID 17256830)
-- Dependencies: 190
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2921 (class 0 OID 17256811)
-- Dependencies: 188
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55e8-522c-104a-e956e925ed08	00080000-55e8-522c-7195-64fbcda584fd	00090000-55e8-522c-29a1-2c4bbb9a3971	AK		
\.


--
-- TOC entry 2932 (class 0 OID 17256929)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 17257416)
-- Dependencies: 237
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 17257428)
-- Dependencies: 238
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2973 (class 0 OID 17257450)
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
-- TOC entry 2936 (class 0 OID 17256954)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2918 (class 0 OID 17256768)
-- Dependencies: 185
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55e8-522b-532a-25904c473aa4	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55e8-522b-9f86-641affd957e1	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55e8-522b-cd18-bbbf7ba03683	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55e8-522b-0a70-3dafca721fd6	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55e8-522b-60f5-e823eface8a6	dogodek.status	array	a:7:{i:100;a:1:{s:5:"label";s:11:"Dolgoročno";}i:200;a:1:{s:5:"label";s:9:"Planirano";}i:300;a:1:{s:5:"label";s:8:"Fiksiran";}i:400;a:1:{s:5:"label";s:17:"Potrjen - interno";}i:500;a:1:{s:5:"label";s:15:"Potrjen - javno";}i:600;a:1:{s:5:"label";s:10:"Zaključen";}i:700;a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55e8-522b-d071-7f200ba7f345	dogodek.razred	array	a:5:{i:100;a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}i:200;a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}i:300;a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}i:400;a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}i:500;a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55e8-522b-eee9-678656b6f180	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55e8-522b-46c3-c7c785f70fd8	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55e8-522b-cebc-a36f1c83a161	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55e8-522b-9c4b-ad92b02826d7	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55e8-522b-c609-a35f13621514	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55e8-522b-f62d-1e9c415a61b3	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55e8-522b-d76b-164dbae7fcc7	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55e8-522b-3233-3b50e91b3262	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55e8-522c-6ac4-4bb349871da2	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55e8-522c-1cf1-c9e1c7d77e67	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55e8-522c-02f4-744ff0b54de7	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55e8-522c-6125-4dd4081b269a	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55e8-522c-3dbc-e2d0f6836c31	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55e8-522d-0cf5-1919e3474ba5	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2912 (class 0 OID 17256682)
-- Dependencies: 179
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55e8-522c-def3-c472bea28a8e	00000000-55e8-522c-6ac4-4bb349871da2	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55e8-522c-9da2-b5658fe07606	00000000-55e8-522c-6ac4-4bb349871da2	00010000-55e8-522b-8818-8faaa340ca70	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55e8-522c-8b4a-72c3ff47cf19	00000000-55e8-522c-1cf1-c9e1c7d77e67	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2913 (class 0 OID 17256693)
-- Dependencies: 180
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55e8-522c-4b2d-b55617496a7f	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55e8-522c-f64e-fe1e3506259d	00010000-55e8-522c-a2b3-108183bd1c0d	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55e8-522c-59e7-57b708156741	00010000-55e8-522c-22c7-fd9ff3338020	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55e8-522c-b24c-0da2ece5b9e7	00010000-55e8-522c-dd2c-5c4d5eb14def	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55e8-522c-4a2a-e8cc2271b9e0	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55e8-522c-0d8d-12b5f7909823	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55e8-522c-d878-94f369c3b78d	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55e8-522c-2b5b-4bca3a0153e0	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55e8-522c-29a1-2c4bbb9a3971	00010000-55e8-522c-4a4d-dd7c1465219c	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55e8-522c-b6cd-113daced229d	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55e8-522c-3ed5-755ee539430e	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55e8-522c-0227-1cf5e6a7c5da	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55e8-522c-4f17-b19a98881d52	00010000-55e8-522c-d435-e6c4d5f8e217	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2908 (class 0 OID 17256647)
-- Dependencies: 175
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55e8-522b-de28-a78a68bb0945	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55e8-522b-1dfb-868678f9f81f	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55e8-522b-0677-07249b7d3e99	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55e8-522b-b1f9-95620eaee222	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55e8-522b-ec15-0d33332222e7	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55e8-522b-7539-65a142af9906	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55e8-522b-8762-bdc03d47d64e	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55e8-522b-0f98-e01a77905daa	Abonma-read	Abonma - branje	f
00030000-55e8-522b-c048-4594013372f1	Abonma-write	Abonma - spreminjanje	f
00030000-55e8-522b-761a-af7108ff0d55	Alternacija-read	Alternacija - branje	f
00030000-55e8-522b-8bfe-ba53ea1de0bc	Alternacija-write	Alternacija - spreminjanje	f
00030000-55e8-522b-af36-7507985756b7	Arhivalija-read	Arhivalija - branje	f
00030000-55e8-522b-a830-abd10a4400e6	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55e8-522b-2b4c-5bdeb3a6cd2f	Besedilo-read	Besedilo - branje	f
00030000-55e8-522b-2dca-89f1521118b8	Besedilo-write	Besedilo - spreminjanje	f
00030000-55e8-522b-1f00-48369b621ece	DogodekIzven-read	DogodekIzven - branje	f
00030000-55e8-522b-f9ea-74da59596f01	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55e8-522b-8ba7-ab6c085c9d98	Dogodek-read	Dogodek - branje	f
00030000-55e8-522b-0d44-6e3ad3fdfebb	Dogodek-write	Dogodek - spreminjanje	f
00030000-55e8-522b-5cd2-10eec14a4ac8	DrugiVir-read	DrugiVir - branje	f
00030000-55e8-522b-7707-561b19174554	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55e8-522b-b51d-aa9a2c98347e	Drzava-read	Drzava - branje	f
00030000-55e8-522b-6d07-006d829eda8e	Drzava-write	Drzava - spreminjanje	f
00030000-55e8-522b-c9e4-c3878083e470	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55e8-522b-cbc8-8108fc746c26	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55e8-522b-1e4f-67056713dca3	Funkcija-read	Funkcija - branje	f
00030000-55e8-522b-1334-82442cb6619d	Funkcija-write	Funkcija - spreminjanje	f
00030000-55e8-522b-1806-41966ab7aa60	Gostovanje-read	Gostovanje - branje	f
00030000-55e8-522b-4a16-1af4ded97521	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55e8-522b-e9cb-a09e1309b170	Gostujoca-read	Gostujoca - branje	f
00030000-55e8-522b-2514-d9a52e33eed8	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55e8-522b-e1fe-4ad483843f8d	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55e8-522b-2760-763a984ba1ec	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55e8-522b-115c-9da019d959b9	Kupec-read	Kupec - branje	f
00030000-55e8-522b-b868-86c248e60d76	Kupec-write	Kupec - spreminjanje	f
00030000-55e8-522b-9724-98e348f16b1a	NacinPlacina-read	NacinPlacina - branje	f
00030000-55e8-522b-1ad0-b7cbb5c60b2a	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55e8-522b-c5af-52e2fec1fc8b	Option-read	Option - branje	f
00030000-55e8-522b-886a-0c1b1275360b	Option-write	Option - spreminjanje	f
00030000-55e8-522b-bd03-79231aa35a0b	OptionValue-read	OptionValue - branje	f
00030000-55e8-522b-b382-61d47898c51e	OptionValue-write	OptionValue - spreminjanje	f
00030000-55e8-522b-8d80-74aa1944d650	Oseba-read	Oseba - branje	f
00030000-55e8-522b-796e-e44e04cf32d2	Oseba-write	Oseba - spreminjanje	f
00030000-55e8-522b-27a6-98c08830615a	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55e8-522b-1274-0915219a57ff	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55e8-522b-c22f-2a0d1e9636aa	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55e8-522b-f13f-c6b283132e2a	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55e8-522b-4dc1-39e69f6c6af7	Pogodba-read	Pogodba - branje	f
00030000-55e8-522b-2095-e87cce4aa134	Pogodba-write	Pogodba - spreminjanje	f
00030000-55e8-522b-3c60-e7ef73455361	Popa-read	Popa - branje	f
00030000-55e8-522b-878b-58337d0040eb	Popa-write	Popa - spreminjanje	f
00030000-55e8-522b-d253-3e6f3337347f	Posta-read	Posta - branje	f
00030000-55e8-522b-1328-7d9777fb5e0e	Posta-write	Posta - spreminjanje	f
00030000-55e8-522b-e061-e5c4841ba43c	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55e8-522b-45a9-1291cf1d20fc	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55e8-522b-29a1-f675106940bc	PostniNaslov-read	PostniNaslov - branje	f
00030000-55e8-522b-dbb1-e78157b146f0	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55e8-522b-3037-86ec4f0faa77	Predstava-read	Predstava - branje	f
00030000-55e8-522b-a934-79fbf4cd3bc0	Predstava-write	Predstava - spreminjanje	f
00030000-55e8-522b-ea41-e816a5383eaf	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55e8-522b-5fd9-a966cb9ceaa1	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55e8-522b-9cd4-293def876c48	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55e8-522b-1668-8a53894f4c0a	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55e8-522b-a1d2-3279d9ef619b	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55e8-522b-6041-ce2a04cfc04e	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55e8-522b-2abb-afe4663cdc9d	ProgramDela-read	ProgramDela - branje	f
00030000-55e8-522b-91f3-d8b70191bfa2	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55e8-522b-2200-6abc647519e5	ProgramFestival-read	ProgramFestival - branje	f
00030000-55e8-522b-d59f-af5c3e57b7f7	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55e8-522b-3f4c-58e73e20faff	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55e8-522b-f2cd-2b33be7c3e9f	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55e8-522b-0355-d5660c0ad91e	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55e8-522b-4579-ab3664428049	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55e8-522b-b0f0-f84589481eeb	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55e8-522b-92a9-f6476da6d610	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55e8-522b-0e18-66126498c9b6	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55e8-522b-309d-3057770bdb41	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55e8-522b-4899-58e3f552ada5	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55e8-522b-7f4e-96f077520ec2	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55e8-522b-a218-a9be862bbc0b	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55e8-522b-9864-5c0b33321fc6	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55e8-522b-697a-260fa3d2e6a0	ProgramRazno-read	ProgramRazno - branje	f
00030000-55e8-522b-f67b-f6d7dc5866c8	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55e8-522b-d51e-df186924714d	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55e8-522b-afeb-c0c152b65286	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55e8-522b-3f29-1924360c435b	Prostor-read	Prostor - branje	f
00030000-55e8-522b-b399-d030e2995e78	Prostor-write	Prostor - spreminjanje	f
00030000-55e8-522b-edbd-256057ea5c90	Racun-read	Racun - branje	f
00030000-55e8-522b-985f-2aaaeab36ab7	Racun-write	Racun - spreminjanje	f
00030000-55e8-522b-6faa-7d756e57e1be	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55e8-522b-c61d-44f5f1131c0e	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55e8-522b-7cb6-275368195d8f	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55e8-522b-f3ff-c90a2941abec	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55e8-522b-b708-49d0902ebb55	Rekvizit-read	Rekvizit - branje	f
00030000-55e8-522b-ea7a-f239762e5531	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55e8-522b-4a6f-c1e9a916161e	Revizija-read	Revizija - branje	f
00030000-55e8-522b-ca42-6b8f74fda6a9	Revizija-write	Revizija - spreminjanje	f
00030000-55e8-522b-8781-4a4ec64d8c09	Rezervacija-read	Rezervacija - branje	f
00030000-55e8-522b-a581-4fe38566b39c	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55e8-522b-293f-fab25b9e4643	SedezniRed-read	SedezniRed - branje	f
00030000-55e8-522b-c9d4-3d9e73b0ce27	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55e8-522b-3335-803ad2cda169	Sedez-read	Sedez - branje	f
00030000-55e8-522b-fac2-e9173fc983a9	Sedez-write	Sedez - spreminjanje	f
00030000-55e8-522b-902b-0b919dfa00fa	Sezona-read	Sezona - branje	f
00030000-55e8-522b-6c6f-f7217cca6f1f	Sezona-write	Sezona - spreminjanje	f
00030000-55e8-522b-a34d-63a297e4a7e6	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55e8-522b-efe9-4c7de94be527	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55e8-522b-19b1-02307f00363b	Stevilcenje-read	Stevilcenje - branje	f
00030000-55e8-522b-ca42-726262929abe	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55e8-522b-f4a3-f2071a6983f9	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55e8-522b-3cab-39d2e31a7abd	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55e8-522b-dd24-97416a5a1df6	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55e8-522b-51b1-60e6e0989531	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55e8-522b-5ab6-225be1654650	Telefonska-read	Telefonska - branje	f
00030000-55e8-522b-77d5-58044e70e751	Telefonska-write	Telefonska - spreminjanje	f
00030000-55e8-522b-916f-d076393bc9a0	TerminStoritve-read	TerminStoritve - branje	f
00030000-55e8-522b-a95b-a509ae1084ba	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55e8-522b-0bc7-9c94324f9b45	TipFunkcije-read	TipFunkcije - branje	f
00030000-55e8-522b-d856-f1660eefaf9b	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55e8-522b-ad2d-802bf6af6841	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55e8-522b-16dc-b57d64dfe9f6	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55e8-522b-b730-4a2b8216aa80	Trr-read	Trr - branje	f
00030000-55e8-522b-d5e6-9979f0e13554	Trr-write	Trr - spreminjanje	f
00030000-55e8-522b-6c15-363b2b883b29	Uprizoritev-read	Uprizoritev - branje	f
00030000-55e8-522b-4dfa-723041cec7b2	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55e8-522b-59c9-368e25d681c2	Vaja-read	Vaja - branje	f
00030000-55e8-522b-49d1-33aabbe8b582	Vaja-write	Vaja - spreminjanje	f
00030000-55e8-522b-7574-77cf11d81b31	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55e8-522b-fc54-919d0013a19a	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55e8-522b-3402-c0379ad83963	VrstaStroska-read	VrstaStroska - branje	f
00030000-55e8-522b-eb01-2302cb41b85c	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55e8-522b-7346-8030d800a775	Zaposlitev-read	Zaposlitev - branje	f
00030000-55e8-522b-12c2-fef47beeeeb2	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55e8-522b-9362-a0e5edf5609d	Zasedenost-read	Zasedenost - branje	f
00030000-55e8-522b-ef87-22ff2f322683	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55e8-522b-4514-a50b38b5c33d	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55e8-522b-4249-84170ea2564f	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55e8-522b-18b5-e7a03c8fbabe	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55e8-522b-37b0-d12f35de22c8	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55e8-522b-2733-5cf9aec3beab	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55e8-522b-d67e-d1e00ee368d4	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55e8-522b-f8c8-f4a7ef3386ac	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55e8-522b-c811-3940bdca879c	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55e8-522b-a441-3392c1a0182c	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55e8-522b-a047-2476dbb08993	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55e8-522b-2bec-d4d6d25a1e68	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55e8-522b-1da9-cdd7ac0f883e	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55e8-522b-20d7-0afd266dd4be	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55e8-522b-8c1f-ef3f81b1fcae	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55e8-522b-7f63-a259cb604269	Datoteka-write	Datoteka - spreminjanje	f
00030000-55e8-522b-3087-4e8383dff336	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2910 (class 0 OID 17256666)
-- Dependencies: 177
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55e8-522b-889a-12af6ca7e29e	00030000-55e8-522b-1dfb-868678f9f81f
00020000-55e8-522b-58b3-1bf3f9abf272	00030000-55e8-522b-b51d-aa9a2c98347e
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-0f98-e01a77905daa
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-c048-4594013372f1
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-761a-af7108ff0d55
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-8bfe-ba53ea1de0bc
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-af36-7507985756b7
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-8ba7-ab6c085c9d98
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-b1f9-95620eaee222
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-0d44-6e3ad3fdfebb
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-b51d-aa9a2c98347e
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-6d07-006d829eda8e
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-1e4f-67056713dca3
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-1334-82442cb6619d
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-1806-41966ab7aa60
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-4a16-1af4ded97521
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-e9cb-a09e1309b170
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-2514-d9a52e33eed8
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-e1fe-4ad483843f8d
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-2760-763a984ba1ec
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-c5af-52e2fec1fc8b
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-bd03-79231aa35a0b
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-8d80-74aa1944d650
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-796e-e44e04cf32d2
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-3c60-e7ef73455361
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-878b-58337d0040eb
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-d253-3e6f3337347f
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-1328-7d9777fb5e0e
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-29a1-f675106940bc
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-dbb1-e78157b146f0
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-3037-86ec4f0faa77
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-a934-79fbf4cd3bc0
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-a1d2-3279d9ef619b
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-6041-ce2a04cfc04e
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-3f29-1924360c435b
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-b399-d030e2995e78
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-7cb6-275368195d8f
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-f3ff-c90a2941abec
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-b708-49d0902ebb55
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-ea7a-f239762e5531
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-902b-0b919dfa00fa
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-6c6f-f7217cca6f1f
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-0bc7-9c94324f9b45
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-6c15-363b2b883b29
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-4dfa-723041cec7b2
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-59c9-368e25d681c2
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-49d1-33aabbe8b582
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-9362-a0e5edf5609d
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-ef87-22ff2f322683
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-4514-a50b38b5c33d
00020000-55e8-522b-4a87-998e30f4870c	00030000-55e8-522b-18b5-e7a03c8fbabe
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-0f98-e01a77905daa
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-af36-7507985756b7
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-8ba7-ab6c085c9d98
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-b51d-aa9a2c98347e
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-1806-41966ab7aa60
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-e9cb-a09e1309b170
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-e1fe-4ad483843f8d
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-2760-763a984ba1ec
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-c5af-52e2fec1fc8b
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-bd03-79231aa35a0b
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-8d80-74aa1944d650
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-796e-e44e04cf32d2
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-3c60-e7ef73455361
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-d253-3e6f3337347f
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-29a1-f675106940bc
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-dbb1-e78157b146f0
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-3037-86ec4f0faa77
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-3f29-1924360c435b
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-7cb6-275368195d8f
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-b708-49d0902ebb55
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-902b-0b919dfa00fa
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-5ab6-225be1654650
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-77d5-58044e70e751
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-b730-4a2b8216aa80
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-d5e6-9979f0e13554
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-7346-8030d800a775
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-12c2-fef47beeeeb2
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-4514-a50b38b5c33d
00020000-55e8-522b-f10e-4e86662aafe3	00030000-55e8-522b-18b5-e7a03c8fbabe
00020000-55e8-522b-c7a1-1dc16518d7ca	00030000-55e8-522b-0f98-e01a77905daa
00020000-55e8-522b-c7a1-1dc16518d7ca	00030000-55e8-522b-761a-af7108ff0d55
00020000-55e8-522b-c7a1-1dc16518d7ca	00030000-55e8-522b-af36-7507985756b7
00020000-55e8-522b-c7a1-1dc16518d7ca	00030000-55e8-522b-a830-abd10a4400e6
00020000-55e8-522b-c7a1-1dc16518d7ca	00030000-55e8-522b-2b4c-5bdeb3a6cd2f
00020000-55e8-522b-c7a1-1dc16518d7ca	00030000-55e8-522b-1f00-48369b621ece
00020000-55e8-522b-c7a1-1dc16518d7ca	00030000-55e8-522b-8ba7-ab6c085c9d98
00020000-55e8-522b-c7a1-1dc16518d7ca	00030000-55e8-522b-b51d-aa9a2c98347e
00020000-55e8-522b-c7a1-1dc16518d7ca	00030000-55e8-522b-1e4f-67056713dca3
00020000-55e8-522b-c7a1-1dc16518d7ca	00030000-55e8-522b-1806-41966ab7aa60
00020000-55e8-522b-c7a1-1dc16518d7ca	00030000-55e8-522b-e9cb-a09e1309b170
00020000-55e8-522b-c7a1-1dc16518d7ca	00030000-55e8-522b-e1fe-4ad483843f8d
00020000-55e8-522b-c7a1-1dc16518d7ca	00030000-55e8-522b-c5af-52e2fec1fc8b
00020000-55e8-522b-c7a1-1dc16518d7ca	00030000-55e8-522b-bd03-79231aa35a0b
00020000-55e8-522b-c7a1-1dc16518d7ca	00030000-55e8-522b-8d80-74aa1944d650
00020000-55e8-522b-c7a1-1dc16518d7ca	00030000-55e8-522b-3c60-e7ef73455361
00020000-55e8-522b-c7a1-1dc16518d7ca	00030000-55e8-522b-d253-3e6f3337347f
00020000-55e8-522b-c7a1-1dc16518d7ca	00030000-55e8-522b-3037-86ec4f0faa77
00020000-55e8-522b-c7a1-1dc16518d7ca	00030000-55e8-522b-a1d2-3279d9ef619b
00020000-55e8-522b-c7a1-1dc16518d7ca	00030000-55e8-522b-3f29-1924360c435b
00020000-55e8-522b-c7a1-1dc16518d7ca	00030000-55e8-522b-7cb6-275368195d8f
00020000-55e8-522b-c7a1-1dc16518d7ca	00030000-55e8-522b-b708-49d0902ebb55
00020000-55e8-522b-c7a1-1dc16518d7ca	00030000-55e8-522b-902b-0b919dfa00fa
00020000-55e8-522b-c7a1-1dc16518d7ca	00030000-55e8-522b-0bc7-9c94324f9b45
00020000-55e8-522b-c7a1-1dc16518d7ca	00030000-55e8-522b-59c9-368e25d681c2
00020000-55e8-522b-c7a1-1dc16518d7ca	00030000-55e8-522b-9362-a0e5edf5609d
00020000-55e8-522b-c7a1-1dc16518d7ca	00030000-55e8-522b-4514-a50b38b5c33d
00020000-55e8-522b-c7a1-1dc16518d7ca	00030000-55e8-522b-18b5-e7a03c8fbabe
00020000-55e8-522b-2398-6f46f2ee0ae3	00030000-55e8-522b-0f98-e01a77905daa
00020000-55e8-522b-2398-6f46f2ee0ae3	00030000-55e8-522b-c048-4594013372f1
00020000-55e8-522b-2398-6f46f2ee0ae3	00030000-55e8-522b-8bfe-ba53ea1de0bc
00020000-55e8-522b-2398-6f46f2ee0ae3	00030000-55e8-522b-af36-7507985756b7
00020000-55e8-522b-2398-6f46f2ee0ae3	00030000-55e8-522b-8ba7-ab6c085c9d98
00020000-55e8-522b-2398-6f46f2ee0ae3	00030000-55e8-522b-b51d-aa9a2c98347e
00020000-55e8-522b-2398-6f46f2ee0ae3	00030000-55e8-522b-1806-41966ab7aa60
00020000-55e8-522b-2398-6f46f2ee0ae3	00030000-55e8-522b-e9cb-a09e1309b170
00020000-55e8-522b-2398-6f46f2ee0ae3	00030000-55e8-522b-c5af-52e2fec1fc8b
00020000-55e8-522b-2398-6f46f2ee0ae3	00030000-55e8-522b-bd03-79231aa35a0b
00020000-55e8-522b-2398-6f46f2ee0ae3	00030000-55e8-522b-3c60-e7ef73455361
00020000-55e8-522b-2398-6f46f2ee0ae3	00030000-55e8-522b-d253-3e6f3337347f
00020000-55e8-522b-2398-6f46f2ee0ae3	00030000-55e8-522b-3037-86ec4f0faa77
00020000-55e8-522b-2398-6f46f2ee0ae3	00030000-55e8-522b-3f29-1924360c435b
00020000-55e8-522b-2398-6f46f2ee0ae3	00030000-55e8-522b-7cb6-275368195d8f
00020000-55e8-522b-2398-6f46f2ee0ae3	00030000-55e8-522b-b708-49d0902ebb55
00020000-55e8-522b-2398-6f46f2ee0ae3	00030000-55e8-522b-902b-0b919dfa00fa
00020000-55e8-522b-2398-6f46f2ee0ae3	00030000-55e8-522b-0bc7-9c94324f9b45
00020000-55e8-522b-2398-6f46f2ee0ae3	00030000-55e8-522b-4514-a50b38b5c33d
00020000-55e8-522b-2398-6f46f2ee0ae3	00030000-55e8-522b-18b5-e7a03c8fbabe
00020000-55e8-522b-2d1a-a93d371bd394	00030000-55e8-522b-0f98-e01a77905daa
00020000-55e8-522b-2d1a-a93d371bd394	00030000-55e8-522b-af36-7507985756b7
00020000-55e8-522b-2d1a-a93d371bd394	00030000-55e8-522b-8ba7-ab6c085c9d98
00020000-55e8-522b-2d1a-a93d371bd394	00030000-55e8-522b-b51d-aa9a2c98347e
00020000-55e8-522b-2d1a-a93d371bd394	00030000-55e8-522b-1806-41966ab7aa60
00020000-55e8-522b-2d1a-a93d371bd394	00030000-55e8-522b-e9cb-a09e1309b170
00020000-55e8-522b-2d1a-a93d371bd394	00030000-55e8-522b-c5af-52e2fec1fc8b
00020000-55e8-522b-2d1a-a93d371bd394	00030000-55e8-522b-bd03-79231aa35a0b
00020000-55e8-522b-2d1a-a93d371bd394	00030000-55e8-522b-3c60-e7ef73455361
00020000-55e8-522b-2d1a-a93d371bd394	00030000-55e8-522b-d253-3e6f3337347f
00020000-55e8-522b-2d1a-a93d371bd394	00030000-55e8-522b-3037-86ec4f0faa77
00020000-55e8-522b-2d1a-a93d371bd394	00030000-55e8-522b-3f29-1924360c435b
00020000-55e8-522b-2d1a-a93d371bd394	00030000-55e8-522b-7cb6-275368195d8f
00020000-55e8-522b-2d1a-a93d371bd394	00030000-55e8-522b-b708-49d0902ebb55
00020000-55e8-522b-2d1a-a93d371bd394	00030000-55e8-522b-902b-0b919dfa00fa
00020000-55e8-522b-2d1a-a93d371bd394	00030000-55e8-522b-916f-d076393bc9a0
00020000-55e8-522b-2d1a-a93d371bd394	00030000-55e8-522b-0677-07249b7d3e99
00020000-55e8-522b-2d1a-a93d371bd394	00030000-55e8-522b-0bc7-9c94324f9b45
00020000-55e8-522b-2d1a-a93d371bd394	00030000-55e8-522b-4514-a50b38b5c33d
00020000-55e8-522b-2d1a-a93d371bd394	00030000-55e8-522b-18b5-e7a03c8fbabe
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-de28-a78a68bb0945
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-1dfb-868678f9f81f
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-0677-07249b7d3e99
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-b1f9-95620eaee222
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-ec15-0d33332222e7
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-7539-65a142af9906
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-8762-bdc03d47d64e
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-0f98-e01a77905daa
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-c048-4594013372f1
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-761a-af7108ff0d55
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-8bfe-ba53ea1de0bc
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-af36-7507985756b7
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-a830-abd10a4400e6
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-2b4c-5bdeb3a6cd2f
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-2dca-89f1521118b8
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-1f00-48369b621ece
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-f9ea-74da59596f01
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-8ba7-ab6c085c9d98
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-0d44-6e3ad3fdfebb
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-b51d-aa9a2c98347e
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-6d07-006d829eda8e
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-5cd2-10eec14a4ac8
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-7707-561b19174554
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-c9e4-c3878083e470
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-cbc8-8108fc746c26
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-1e4f-67056713dca3
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-1334-82442cb6619d
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-1806-41966ab7aa60
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-4a16-1af4ded97521
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-e9cb-a09e1309b170
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-2514-d9a52e33eed8
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-e1fe-4ad483843f8d
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-2760-763a984ba1ec
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-115c-9da019d959b9
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-b868-86c248e60d76
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-9724-98e348f16b1a
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-1ad0-b7cbb5c60b2a
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-c5af-52e2fec1fc8b
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-886a-0c1b1275360b
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-bd03-79231aa35a0b
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-b382-61d47898c51e
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-8d80-74aa1944d650
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-796e-e44e04cf32d2
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-27a6-98c08830615a
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-1274-0915219a57ff
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-c22f-2a0d1e9636aa
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-f13f-c6b283132e2a
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-4dc1-39e69f6c6af7
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-2095-e87cce4aa134
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-3c60-e7ef73455361
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-878b-58337d0040eb
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-d253-3e6f3337347f
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-1328-7d9777fb5e0e
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-e061-e5c4841ba43c
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-45a9-1291cf1d20fc
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-29a1-f675106940bc
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-dbb1-e78157b146f0
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-3037-86ec4f0faa77
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-a934-79fbf4cd3bc0
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-ea41-e816a5383eaf
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-5fd9-a966cb9ceaa1
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-9cd4-293def876c48
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-1668-8a53894f4c0a
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-a1d2-3279d9ef619b
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-6041-ce2a04cfc04e
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-2abb-afe4663cdc9d
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-91f3-d8b70191bfa2
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-2200-6abc647519e5
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-d59f-af5c3e57b7f7
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-3f4c-58e73e20faff
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-f2cd-2b33be7c3e9f
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-0355-d5660c0ad91e
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-4579-ab3664428049
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-b0f0-f84589481eeb
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-92a9-f6476da6d610
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-0e18-66126498c9b6
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-309d-3057770bdb41
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-4899-58e3f552ada5
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-7f4e-96f077520ec2
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-a218-a9be862bbc0b
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-9864-5c0b33321fc6
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-697a-260fa3d2e6a0
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-f67b-f6d7dc5866c8
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-d51e-df186924714d
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-afeb-c0c152b65286
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-3f29-1924360c435b
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-b399-d030e2995e78
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-edbd-256057ea5c90
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-985f-2aaaeab36ab7
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-6faa-7d756e57e1be
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-c61d-44f5f1131c0e
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-7cb6-275368195d8f
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-f3ff-c90a2941abec
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-b708-49d0902ebb55
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-ea7a-f239762e5531
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-4a6f-c1e9a916161e
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-ca42-6b8f74fda6a9
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-8781-4a4ec64d8c09
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-a581-4fe38566b39c
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-293f-fab25b9e4643
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-c9d4-3d9e73b0ce27
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-3335-803ad2cda169
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-fac2-e9173fc983a9
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-902b-0b919dfa00fa
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-6c6f-f7217cca6f1f
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-a34d-63a297e4a7e6
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-efe9-4c7de94be527
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-19b1-02307f00363b
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-ca42-726262929abe
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-f4a3-f2071a6983f9
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-3cab-39d2e31a7abd
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-dd24-97416a5a1df6
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-51b1-60e6e0989531
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-5ab6-225be1654650
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-77d5-58044e70e751
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-916f-d076393bc9a0
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-a95b-a509ae1084ba
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-0bc7-9c94324f9b45
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-d856-f1660eefaf9b
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-ad2d-802bf6af6841
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-16dc-b57d64dfe9f6
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-b730-4a2b8216aa80
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-d5e6-9979f0e13554
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-6c15-363b2b883b29
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-4dfa-723041cec7b2
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-59c9-368e25d681c2
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-49d1-33aabbe8b582
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-7574-77cf11d81b31
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-fc54-919d0013a19a
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-3402-c0379ad83963
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-eb01-2302cb41b85c
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-7346-8030d800a775
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-12c2-fef47beeeeb2
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-9362-a0e5edf5609d
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-ef87-22ff2f322683
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-4514-a50b38b5c33d
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-4249-84170ea2564f
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-18b5-e7a03c8fbabe
00020000-55e8-522c-4422-302ed50c504a	00030000-55e8-522b-37b0-d12f35de22c8
\.


--
-- TOC entry 2937 (class 0 OID 17256961)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2941 (class 0 OID 17256995)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 17257119)
-- Dependencies: 219
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55e8-522c-b74b-50ecbd8b6191	00090000-55e8-522c-4b2d-b55617496a7f	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55e8-522c-1d05-6213bd0953f0	00090000-55e8-522c-0d8d-12b5f7909823	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55e8-522c-974e-2e14c8597b9b	00090000-55e8-522c-4f17-b19a98881d52	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2915 (class 0 OID 17256726)
-- Dependencies: 182
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55e8-522c-7195-64fbcda584fd	00040000-55e8-522b-2611-7ba4a3d8c31d	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e8-522c-1a73-5894a780c959	00040000-55e8-522b-2611-7ba4a3d8c31d	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55e8-522c-d10d-998126cccfe2	00040000-55e8-522b-2611-7ba4a3d8c31d	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e8-522c-72e1-fd684f6c10b3	00040000-55e8-522b-2611-7ba4a3d8c31d	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e8-522c-a30a-08003f3503e7	00040000-55e8-522b-2611-7ba4a3d8c31d	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e8-522c-4f38-815c208c8d27	00040000-55e8-522a-543f-133152785934	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e8-522c-9e13-bf34e40fbe1f	00040000-55e8-522b-a0f0-23f88aa97505	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e8-522c-0179-550f0cf35c1f	00040000-55e8-522a-d8a4-494f399dc21c	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e8-522d-ac8b-29a4618e6b98	00040000-55e8-522b-2611-7ba4a3d8c31d	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2917 (class 0 OID 17256760)
-- Dependencies: 184
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55e8-522a-19b2-3c95ea7ff346	8341	Adlešiči
00050000-55e8-522a-3afe-15975532095e	5270	Ajdovščina
00050000-55e8-522a-33bf-1ba6e6e8ab44	6280	Ankaran/Ancarano
00050000-55e8-522a-d5ce-e2a06f7a8b79	9253	Apače
00050000-55e8-522a-8a07-2697f7f7a69f	8253	Artiče
00050000-55e8-522a-6a1a-fce670616884	4275	Begunje na Gorenjskem
00050000-55e8-522a-11f2-eeb3a1894981	1382	Begunje pri Cerknici
00050000-55e8-522a-cae0-b0a08046952c	9231	Beltinci
00050000-55e8-522a-68f3-bca4b3626e9e	2234	Benedikt
00050000-55e8-522a-9989-93f365362761	2345	Bistrica ob Dravi
00050000-55e8-522a-8028-59b8ff9166a6	3256	Bistrica ob Sotli
00050000-55e8-522a-6a02-ea6cfdf1fce9	8259	Bizeljsko
00050000-55e8-522a-4191-788b1208542d	1223	Blagovica
00050000-55e8-522a-34c4-e5173d11ea57	8283	Blanca
00050000-55e8-522a-6b6d-069abd93042e	4260	Bled
00050000-55e8-522a-851e-1a2fb7e55ee4	4273	Blejska Dobrava
00050000-55e8-522a-f962-268cdb8af99d	9265	Bodonci
00050000-55e8-522a-7420-fe7517c298e4	9222	Bogojina
00050000-55e8-522a-4631-457d4003c9a3	4263	Bohinjska Bela
00050000-55e8-522a-fed1-9abc511dfa7c	4264	Bohinjska Bistrica
00050000-55e8-522a-f1cb-589685e3a371	4265	Bohinjsko jezero
00050000-55e8-522a-a00e-33a71ad89290	1353	Borovnica
00050000-55e8-522a-39bf-a7916553ab0b	8294	Boštanj
00050000-55e8-522a-c7a9-d19d3a02eebf	5230	Bovec
00050000-55e8-522a-b5d7-583b1450fe51	5295	Branik
00050000-55e8-522a-7197-b4d7038282d4	3314	Braslovče
00050000-55e8-522a-19a0-8a1f23595872	5223	Breginj
00050000-55e8-522a-6451-3fd50e9637a6	8280	Brestanica
00050000-55e8-522a-e39e-38093011452b	2354	Bresternica
00050000-55e8-522a-bfdb-0fe206a3a0d6	4243	Brezje
00050000-55e8-522a-74c4-2201e402c3d5	1351	Brezovica pri Ljubljani
00050000-55e8-522a-f25f-daf015af91d2	8250	Brežice
00050000-55e8-522a-a53f-ad8a705fd959	4210	Brnik - Aerodrom
00050000-55e8-522a-3e9f-f9f42a296a03	8321	Brusnice
00050000-55e8-522a-69a7-19c2427ea1fc	3255	Buče
00050000-55e8-522a-7714-d2ba587931b7	8276	Bučka 
00050000-55e8-522a-bcdd-9c33c1c32184	9261	Cankova
00050000-55e8-522a-8d0f-142bedbc209c	3000	Celje 
00050000-55e8-522a-cc87-ffbb6ae92af6	3001	Celje - poštni predali
00050000-55e8-522a-1038-5ec41bfc8cd7	4207	Cerklje na Gorenjskem
00050000-55e8-522a-5f6c-9abf4a20d967	8263	Cerklje ob Krki
00050000-55e8-522a-c13c-4842cf104fe2	1380	Cerknica
00050000-55e8-522a-357d-68ec0a4f913c	5282	Cerkno
00050000-55e8-522a-a340-a8cb7753af01	2236	Cerkvenjak
00050000-55e8-522a-e8cc-762ad4054f86	2215	Ceršak
00050000-55e8-522a-aebb-5993c6924f2d	2326	Cirkovce
00050000-55e8-522a-d0a0-d916d02565fb	2282	Cirkulane
00050000-55e8-522a-214e-24265d32d89e	5273	Col
00050000-55e8-522a-5a5a-4f963fe0da7b	8251	Čatež ob Savi
00050000-55e8-522a-0295-013507a20fe5	1413	Čemšenik
00050000-55e8-522a-3a5b-38e751b42eb2	5253	Čepovan
00050000-55e8-522a-9501-1ee66e1c7d9f	9232	Črenšovci
00050000-55e8-522a-784a-6bee2ad05dd2	2393	Črna na Koroškem
00050000-55e8-522a-7894-18b256f86978	6275	Črni Kal
00050000-55e8-522a-d2f5-27c41662896b	5274	Črni Vrh nad Idrijo
00050000-55e8-522a-7c58-1edd0e5ebc0d	5262	Črniče
00050000-55e8-522a-9a28-201557cc1e9c	8340	Črnomelj
00050000-55e8-522a-60d1-7bb384c0dda5	6271	Dekani
00050000-55e8-522a-4ed5-51561daca07e	5210	Deskle
00050000-55e8-522a-e8e6-c209172f8f8b	2253	Destrnik
00050000-55e8-522a-9607-f23cb1827b23	6215	Divača
00050000-55e8-522a-9d44-95746f450cb0	1233	Dob
00050000-55e8-522a-70ba-dd67824e7d8d	3224	Dobje pri Planini
00050000-55e8-522a-24ee-7e2c9e7dd3ca	8257	Dobova
00050000-55e8-522a-3e15-b056205e6b96	1423	Dobovec
00050000-55e8-522a-88c6-a4c65e108639	5263	Dobravlje
00050000-55e8-522a-ee85-ed9a1845b1b7	3204	Dobrna
00050000-55e8-522a-56a9-61223ebc3d7f	8211	Dobrnič
00050000-55e8-522a-8b9d-c7437a3eefcf	1356	Dobrova
00050000-55e8-522a-f15d-275c6cd89b18	9223	Dobrovnik/Dobronak 
00050000-55e8-522a-abf7-8e1de4500421	5212	Dobrovo v Brdih
00050000-55e8-522a-5fa4-5c4ae12ab2b7	1431	Dol pri Hrastniku
00050000-55e8-522a-d462-f1eacefb119c	1262	Dol pri Ljubljani
00050000-55e8-522a-60d1-22d277fc1318	1273	Dole pri Litiji
00050000-55e8-522a-c740-eeef3185d00b	1331	Dolenja vas
00050000-55e8-522a-0ef8-8ba4cffaed77	8350	Dolenjske Toplice
00050000-55e8-522a-e509-6c8c1bbdc564	1230	Domžale
00050000-55e8-522a-9b66-9eaa473a9c89	2252	Dornava
00050000-55e8-522a-51f7-5bc703c9a4d0	5294	Dornberk
00050000-55e8-522a-2696-668da1f854be	1319	Draga
00050000-55e8-522a-82b2-c1f9e0e611fd	8343	Dragatuš
00050000-55e8-522a-150d-d279f12c1523	3222	Dramlje
00050000-55e8-522a-f3d3-d5a1166e6e61	2370	Dravograd
00050000-55e8-522a-7bda-52616aa8d130	4203	Duplje
00050000-55e8-522a-6a54-0f8f78607350	6221	Dutovlje
00050000-55e8-522a-9fac-7deab5e38ed9	8361	Dvor
00050000-55e8-522a-9f68-000cb58bd5a6	2343	Fala
00050000-55e8-522a-411a-f89d748bc81d	9208	Fokovci
00050000-55e8-522a-0f99-f03fafa20b98	2313	Fram
00050000-55e8-522a-66c4-94d43856a350	3213	Frankolovo
00050000-55e8-522a-5899-8c1c078579ce	1274	Gabrovka
00050000-55e8-522a-2e99-294f6afbe583	8254	Globoko
00050000-55e8-522a-48f1-a567f2c7f871	5275	Godovič
00050000-55e8-522a-54c6-7507ba88c32c	4204	Golnik
00050000-55e8-522a-6e8d-b52c8dbc1caa	3303	Gomilsko
00050000-55e8-522a-7515-833edce12781	4224	Gorenja vas
00050000-55e8-522a-4745-83e89b0f3803	3263	Gorica pri Slivnici
00050000-55e8-522a-b1e0-80473e48a2f6	2272	Gorišnica
00050000-55e8-522a-a5fc-8fde458a428f	9250	Gornja Radgona
00050000-55e8-522a-9041-cbaa2ae7d146	3342	Gornji Grad
00050000-55e8-522a-f489-19279d33b890	4282	Gozd Martuljek
00050000-55e8-522a-bc05-05fa3c69f1e5	6272	Gračišče
00050000-55e8-522a-ff6f-430135c7296a	9264	Grad
00050000-55e8-522a-7be1-2166e4e8ea26	8332	Gradac
00050000-55e8-522a-d864-cd2fa3251a98	1384	Grahovo
00050000-55e8-522a-6941-8b56f897c6d3	5242	Grahovo ob Bači
00050000-55e8-522a-d4a0-aa4510a4c188	5251	Grgar
00050000-55e8-522a-9652-e74f8a9c9502	3302	Griže
00050000-55e8-522a-929d-6b2d8c090a04	3231	Grobelno
00050000-55e8-522a-8483-7bd55ecb8ca4	1290	Grosuplje
00050000-55e8-522a-2fef-3c12cb26ebac	2288	Hajdina
00050000-55e8-522a-dfca-e6abe72c819f	8362	Hinje
00050000-55e8-522a-9ee1-7a2b88526f75	2311	Hoče
00050000-55e8-522a-fe4a-fe6987db6017	9205	Hodoš/Hodos
00050000-55e8-522a-9ced-ed788cb7e2e1	1354	Horjul
00050000-55e8-522a-726d-b179a0eafc11	1372	Hotedršica
00050000-55e8-522a-d8ff-8e54400003d7	1430	Hrastnik
00050000-55e8-522a-51aa-ef86a84d899d	6225	Hruševje
00050000-55e8-522a-f508-ea351fc0a447	4276	Hrušica
00050000-55e8-522a-c1f0-028f60584f95	5280	Idrija
00050000-55e8-522a-9246-ed781b75e056	1292	Ig
00050000-55e8-522a-2ca6-4af58a330a0e	6250	Ilirska Bistrica
00050000-55e8-522a-498f-88340b57fe60	6251	Ilirska Bistrica-Trnovo
00050000-55e8-522a-e115-da8bd40d5e15	1295	Ivančna Gorica
00050000-55e8-522a-3577-51a8a38c4079	2259	Ivanjkovci
00050000-55e8-522a-f847-11b8e2481c9a	1411	Izlake
00050000-55e8-522a-e44d-b68736bfa210	6310	Izola/Isola
00050000-55e8-522a-38a4-36f0ebe3c189	2222	Jakobski Dol
00050000-55e8-522a-9250-1475eff26f30	2221	Jarenina
00050000-55e8-522a-d235-40a036297323	6254	Jelšane
00050000-55e8-522a-f7f4-71693a81eaaf	4270	Jesenice
00050000-55e8-522a-6bac-f47d9eabb682	8261	Jesenice na Dolenjskem
00050000-55e8-522a-b59c-c8b3b8923dc2	3273	Jurklošter
00050000-55e8-522a-0ebb-b2b499815e45	2223	Jurovski Dol
00050000-55e8-522a-1708-da7746d5e4f5	2256	Juršinci
00050000-55e8-522a-9d63-901329a91a22	5214	Kal nad Kanalom
00050000-55e8-522a-cbc9-38dd5ae17927	3233	Kalobje
00050000-55e8-522a-6e73-e00fc2d1cee5	4246	Kamna Gorica
00050000-55e8-522a-1345-4a4d919a42a0	2351	Kamnica
00050000-55e8-522a-0eed-220f5dc8acb3	1241	Kamnik
00050000-55e8-522a-cf5b-a77ae505038e	5213	Kanal
00050000-55e8-522a-cde8-5afc6788b65a	8258	Kapele
00050000-55e8-522a-d73b-fbb3f6280670	2362	Kapla
00050000-55e8-522a-56d3-0f64547dd8c2	2325	Kidričevo
00050000-55e8-522a-98ac-c1b820c88219	1412	Kisovec
00050000-55e8-522a-7a36-e916c1208795	6253	Knežak
00050000-55e8-522a-8432-b67842115893	5222	Kobarid
00050000-55e8-522a-757c-890b24e06b4b	9227	Kobilje
00050000-55e8-522a-9471-554d4d1f5756	1330	Kočevje
00050000-55e8-522a-9a2f-872b2882f10e	1338	Kočevska Reka
00050000-55e8-522a-adc1-c9571a95ad51	2276	Kog
00050000-55e8-522a-c906-0f3643878392	5211	Kojsko
00050000-55e8-522a-20af-a488558670b2	6223	Komen
00050000-55e8-522a-5752-8c37fedf83c5	1218	Komenda
00050000-55e8-522a-492f-0ad0ed2570bd	6000	Koper/Capodistria 
00050000-55e8-522a-742d-03caefcfad73	6001	Koper/Capodistria - poštni predali
00050000-55e8-522a-8c91-0f562cd0015a	8282	Koprivnica
00050000-55e8-522a-29dd-b39bf53a771a	5296	Kostanjevica na Krasu
00050000-55e8-522a-8bf6-4d95fa4705af	8311	Kostanjevica na Krki
00050000-55e8-522a-33b5-29d5f35f8125	1336	Kostel
00050000-55e8-522a-e7b8-5bbe893ebde9	6256	Košana
00050000-55e8-522a-58f4-b3dee7907a65	2394	Kotlje
00050000-55e8-522a-9f20-6f685bf5529a	6240	Kozina
00050000-55e8-522a-0f71-70f29431f159	3260	Kozje
00050000-55e8-522a-1dd3-625662c7c743	4000	Kranj 
00050000-55e8-522a-c993-3dca20df0df9	4001	Kranj - poštni predali
00050000-55e8-522a-71ed-cbeacd464939	4280	Kranjska Gora
00050000-55e8-522a-7131-e937c220af81	1281	Kresnice
00050000-55e8-522a-86d8-9318ee713ccc	4294	Križe
00050000-55e8-522a-7621-65268a4c5059	9206	Križevci
00050000-55e8-522a-3ed2-e43f84344a55	9242	Križevci pri Ljutomeru
00050000-55e8-522a-8def-af633c1880e1	1301	Krka
00050000-55e8-522a-faa7-4d92384fba73	8296	Krmelj
00050000-55e8-522a-e563-21a4b4fb4e22	4245	Kropa
00050000-55e8-522a-f577-40c6dfff82ce	8262	Krška vas
00050000-55e8-522a-7ff8-5735c5345c00	8270	Krško
00050000-55e8-522a-628e-1db350c7aefd	9263	Kuzma
00050000-55e8-522a-0436-af5a6a130989	2318	Laporje
00050000-55e8-522a-1e56-05ee7bf2f368	3270	Laško
00050000-55e8-522a-f397-0d5db0fec5d0	1219	Laze v Tuhinju
00050000-55e8-522a-e35a-d183b3a4856e	2230	Lenart v Slovenskih goricah
00050000-55e8-522a-57f0-0b60b4204086	9220	Lendava/Lendva
00050000-55e8-522a-02c0-88f9632ccf66	4248	Lesce
00050000-55e8-522a-349e-9a358b6bbdf1	3261	Lesično
00050000-55e8-522a-ab01-8d2250c906c4	8273	Leskovec pri Krškem
00050000-55e8-522a-4501-dac0b04e4f96	2372	Libeliče
00050000-55e8-522a-e34c-8802207f5a62	2341	Limbuš
00050000-55e8-522a-178f-0d2c28714f21	1270	Litija
00050000-55e8-522a-a9c7-e15ac57a306a	3202	Ljubečna
00050000-55e8-522a-985e-6f1cf86eed2f	1000	Ljubljana 
00050000-55e8-522a-3512-82019230ec31	1001	Ljubljana - poštni predali
00050000-55e8-522a-0c8c-97f8fa52c78b	1231	Ljubljana - Črnuče
00050000-55e8-522a-8820-ad6611c46d44	1261	Ljubljana - Dobrunje
00050000-55e8-522a-2059-47005f5eb07a	1260	Ljubljana - Polje
00050000-55e8-522a-3a84-cbb9f4cb13fb	1210	Ljubljana - Šentvid
00050000-55e8-522a-f052-c73441df7866	1211	Ljubljana - Šmartno
00050000-55e8-522a-e66d-329804414951	3333	Ljubno ob Savinji
00050000-55e8-522a-d669-d1da00bf521d	9240	Ljutomer
00050000-55e8-522a-5fbb-4440dd37d93d	3215	Loče
00050000-55e8-522a-62f5-88a39dd135f7	5231	Log pod Mangartom
00050000-55e8-522a-0d83-16357d5a8f3d	1358	Log pri Brezovici
00050000-55e8-522a-c159-97fb719abf43	1370	Logatec
00050000-55e8-522a-aae4-55a3df25a0c8	1371	Logatec
00050000-55e8-522a-d04a-35d820bbda9c	1434	Loka pri Zidanem Mostu
00050000-55e8-522a-c88b-49175cd56cb7	3223	Loka pri Žusmu
00050000-55e8-522a-86fa-eb7dde0de67d	6219	Lokev
00050000-55e8-522a-fac2-e704d77f4a98	1318	Loški Potok
00050000-55e8-522a-d242-a7c1112d0ae0	2324	Lovrenc na Dravskem polju
00050000-55e8-522a-59aa-8bbd630e6eac	2344	Lovrenc na Pohorju
00050000-55e8-522a-2e28-f42f77cf4697	3334	Luče
00050000-55e8-522a-e893-4a8a2d4878c8	1225	Lukovica
00050000-55e8-522a-d86a-3ebc223a6edb	9202	Mačkovci
00050000-55e8-522a-73ae-e4945cc64995	2322	Majšperk
00050000-55e8-522a-d4a8-1ec860cd0127	2321	Makole
00050000-55e8-522a-c90d-0f1c128193d4	9243	Mala Nedelja
00050000-55e8-522a-af1f-003c2af73910	2229	Malečnik
00050000-55e8-522a-7b1b-16d66b103fa4	6273	Marezige
00050000-55e8-522a-1f13-aac92add6135	2000	Maribor 
00050000-55e8-522a-6ebe-114419137f0b	2001	Maribor - poštni predali
00050000-55e8-522a-dfa3-8e2f0ca252eb	2206	Marjeta na Dravskem polju
00050000-55e8-522a-eaa1-6a5abb556b3b	2281	Markovci
00050000-55e8-522a-d85e-a9251bab4204	9221	Martjanci
00050000-55e8-522a-d1cf-3f8204cd01ea	6242	Materija
00050000-55e8-522a-8885-0b088a711b65	4211	Mavčiče
00050000-55e8-522a-b90c-bed8c6ec77f5	1215	Medvode
00050000-55e8-522a-a169-8f80176ca9c6	1234	Mengeš
00050000-55e8-522a-e355-b74f101d3f6d	8330	Metlika
00050000-55e8-522a-2572-5938b16685a4	2392	Mežica
00050000-55e8-522a-6705-868e7b8d70af	2204	Miklavž na Dravskem polju
00050000-55e8-522a-794d-fb6d972c06a6	2275	Miklavž pri Ormožu
00050000-55e8-522a-691d-a5714097383b	5291	Miren
00050000-55e8-522a-66cd-053f124a77ef	8233	Mirna
00050000-55e8-522a-135c-dc2c1c1d2222	8216	Mirna Peč
00050000-55e8-522a-73b2-259b473af196	2382	Mislinja
00050000-55e8-522a-be24-a9fad46ac42f	4281	Mojstrana
00050000-55e8-522a-1c69-04d30fb554f5	8230	Mokronog
00050000-55e8-522a-cb61-7670d2698bab	1251	Moravče
00050000-55e8-522a-4bba-bee9440e4490	9226	Moravske Toplice
00050000-55e8-522a-e7a3-27c5f86ba724	5216	Most na Soči
00050000-55e8-522a-3276-a798cd018f8c	1221	Motnik
00050000-55e8-522a-7101-8989608a3488	3330	Mozirje
00050000-55e8-522a-9d8e-aff93fde4546	9000	Murska Sobota 
00050000-55e8-522a-3017-d55f179ba0f0	9001	Murska Sobota - poštni predali
00050000-55e8-522a-962c-8d7cf5651dc5	2366	Muta
00050000-55e8-522a-7904-4d52c66edb09	4202	Naklo
00050000-55e8-522a-421a-5c17fedbd4dc	3331	Nazarje
00050000-55e8-522a-6842-a4fbd5e66a54	1357	Notranje Gorice
00050000-55e8-522a-aba1-c92e53d8f4da	3203	Nova Cerkev
00050000-55e8-522a-33c0-a899b187606e	5000	Nova Gorica 
00050000-55e8-522a-5eee-07a6fbced247	5001	Nova Gorica - poštni predali
00050000-55e8-522a-98d9-9e620bcc4db1	1385	Nova vas
00050000-55e8-522a-916d-ac1317972495	8000	Novo mesto
00050000-55e8-522a-a3e0-9f7a1a70fb55	8001	Novo mesto - poštni predali
00050000-55e8-522a-ae18-1e2949c192ad	6243	Obrov
00050000-55e8-522a-4555-ffb5ca752d2e	9233	Odranci
00050000-55e8-522a-e29f-c5790b1a818c	2317	Oplotnica
00050000-55e8-522a-eb4f-6d39c93858dc	2312	Orehova vas
00050000-55e8-522a-5c52-1f481bed3142	2270	Ormož
00050000-55e8-522a-4978-a25f3aeb8504	1316	Ortnek
00050000-55e8-522a-ee9d-3181cf580fb9	1337	Osilnica
00050000-55e8-522a-5c99-e33482a1ebec	8222	Otočec
00050000-55e8-522a-6032-7e7ecc3f7743	2361	Ožbalt
00050000-55e8-522a-b326-d083bd090e0d	2231	Pernica
00050000-55e8-522a-78a0-e2597053ed40	2211	Pesnica pri Mariboru
00050000-55e8-522a-72eb-8ac73e133295	9203	Petrovci
00050000-55e8-522a-e0b0-4fa4f0e71ce6	3301	Petrovče
00050000-55e8-522a-7664-b6fb99cf22b5	6330	Piran/Pirano
00050000-55e8-522a-9521-293a81f1f40e	8255	Pišece
00050000-55e8-522a-fa9a-fa4d0af8ad1a	6257	Pivka
00050000-55e8-522a-5941-98a53fecbdd5	6232	Planina
00050000-55e8-522a-b97c-c926bb19a37c	3225	Planina pri Sevnici
00050000-55e8-522a-9d03-a343f23e9d41	6276	Pobegi
00050000-55e8-522a-29c0-b9fcf59e83f1	8312	Podbočje
00050000-55e8-522a-255a-f7d2717ddb6e	5243	Podbrdo
00050000-55e8-522a-d9d4-3b306fae2c58	3254	Podčetrtek
00050000-55e8-522a-36d0-3ba60c8bf0a1	2273	Podgorci
00050000-55e8-522a-ab77-29839b73b1d4	6216	Podgorje
00050000-55e8-522a-5222-a58d3f86252e	2381	Podgorje pri Slovenj Gradcu
00050000-55e8-522a-e67d-0932ddb507e1	6244	Podgrad
00050000-55e8-522a-0261-17aa728ee1e2	1414	Podkum
00050000-55e8-522a-04cd-61f122aae268	2286	Podlehnik
00050000-55e8-522a-debc-ea85f46c6226	5272	Podnanos
00050000-55e8-522a-c8ed-e04b2bb67097	4244	Podnart
00050000-55e8-522a-786a-0df0d302d20b	3241	Podplat
00050000-55e8-522a-776a-dddd65295778	3257	Podsreda
00050000-55e8-522a-4354-9d464522a499	2363	Podvelka
00050000-55e8-522a-238d-0eeefd7348d2	2208	Pohorje
00050000-55e8-522a-43f7-02d1528250bb	2257	Polenšak
00050000-55e8-522a-f037-4222a3976c94	1355	Polhov Gradec
00050000-55e8-522a-930e-0e6393fb04bd	4223	Poljane nad Škofjo Loko
00050000-55e8-522a-f285-dc8c67cb9946	2319	Poljčane
00050000-55e8-522a-b2d4-9905c05f0951	1272	Polšnik
00050000-55e8-522a-be14-1ef9ea4b6619	3313	Polzela
00050000-55e8-522a-d0b7-e83d89a9d94a	3232	Ponikva
00050000-55e8-522a-9bf3-4396e901f687	6320	Portorož/Portorose
00050000-55e8-522a-0688-e54edae5f289	6230	Postojna
00050000-55e8-522a-5242-8cd91166299b	2331	Pragersko
00050000-55e8-522a-23eb-51c49937ad1b	3312	Prebold
00050000-55e8-522a-f83b-a3783c5022d3	4205	Preddvor
00050000-55e8-522a-56a3-1338e83dc1cf	6255	Prem
00050000-55e8-522a-b4aa-cafa37e0bfd1	1352	Preserje
00050000-55e8-522a-7b4a-01b45acc00f9	6258	Prestranek
00050000-55e8-522a-0020-8e3b6fb91c8a	2391	Prevalje
00050000-55e8-522a-aa62-c5231c4e275a	3262	Prevorje
00050000-55e8-522a-68b2-479a7200cf7f	1276	Primskovo 
00050000-55e8-522a-5b67-48a2c303b54c	3253	Pristava pri Mestinju
00050000-55e8-522a-a831-fc969142ca88	9207	Prosenjakovci/Partosfalva
00050000-55e8-522a-0f2a-e430421f725e	5297	Prvačina
00050000-55e8-522a-b5b9-f99025a92b35	2250	Ptuj
00050000-55e8-522a-7d6a-7d1936b3bd6b	2323	Ptujska Gora
00050000-55e8-522a-b1fd-ff0e5d3e2f77	9201	Puconci
00050000-55e8-522a-f491-48f0f56dd396	2327	Rače
00050000-55e8-522a-b4db-48681526ab44	1433	Radeče
00050000-55e8-522a-8c17-70bf8f951d4a	9252	Radenci
00050000-55e8-522a-50f1-b7f493bb1c58	2360	Radlje ob Dravi
00050000-55e8-522a-7bfa-c77dfdebcb26	1235	Radomlje
00050000-55e8-522a-f569-3a692e051000	4240	Radovljica
00050000-55e8-522a-2af1-ac254b60f1bd	8274	Raka
00050000-55e8-522a-e8ca-3954647dd6f0	1381	Rakek
00050000-55e8-522a-63bc-9479d81bff86	4283	Rateče - Planica
00050000-55e8-522a-878b-5f64c007a42f	2390	Ravne na Koroškem
00050000-55e8-522a-64bc-8f71c8a36461	9246	Razkrižje
00050000-55e8-522a-42b5-03aef32cd5d4	3332	Rečica ob Savinji
00050000-55e8-522a-5051-85055e1a9fd4	5292	Renče
00050000-55e8-522a-0be2-4de07832157e	1310	Ribnica
00050000-55e8-522a-1afc-d636e01ca4fc	2364	Ribnica na Pohorju
00050000-55e8-522a-36a5-1bf132e58809	3272	Rimske Toplice
00050000-55e8-522a-c821-34e8a64afa21	1314	Rob
00050000-55e8-522a-e56d-45a60599cadf	5215	Ročinj
00050000-55e8-522a-50a7-a8102a156655	3250	Rogaška Slatina
00050000-55e8-522a-87e4-394a59812e2c	9262	Rogašovci
00050000-55e8-522a-b8d1-4afaadc99939	3252	Rogatec
00050000-55e8-522a-1c31-c3ef4e5bf9d4	1373	Rovte
00050000-55e8-522a-bee0-858cec1f25dd	2342	Ruše
00050000-55e8-522a-a352-ef618f5c5e22	1282	Sava
00050000-55e8-522a-63aa-e1368fe80a67	6333	Sečovlje/Sicciole
00050000-55e8-522a-6c5c-3c05c00a2009	4227	Selca
00050000-55e8-522a-2dbe-e7bfc7103f7f	2352	Selnica ob Dravi
00050000-55e8-522a-51f3-4eee4e087a94	8333	Semič
00050000-55e8-522a-f2e3-e8d8e3463a28	8281	Senovo
00050000-55e8-522a-60c1-b92d4eb7a3ca	6224	Senožeče
00050000-55e8-522a-eeda-7e8e3ccce311	8290	Sevnica
00050000-55e8-522a-7a50-af5403653c44	6210	Sežana
00050000-55e8-522a-f40f-fd5d209db99c	2214	Sladki Vrh
00050000-55e8-522a-89ff-81cc4fcfb6a0	5283	Slap ob Idrijci
00050000-55e8-522a-cee2-a8670896b356	2380	Slovenj Gradec
00050000-55e8-522a-e7af-e41b742f025c	2310	Slovenska Bistrica
00050000-55e8-522a-6d64-9609622dd28e	3210	Slovenske Konjice
00050000-55e8-522a-1340-d7d3a1fb41f5	1216	Smlednik
00050000-55e8-522a-c33e-55247297b853	5232	Soča
00050000-55e8-522a-e75e-222553a8fa83	1317	Sodražica
00050000-55e8-522a-ba72-a8c051263649	3335	Solčava
00050000-55e8-522a-ec6a-add9a71299c0	5250	Solkan
00050000-55e8-522a-419e-8e83503f6fd4	4229	Sorica
00050000-55e8-522a-158b-38b1fc50c5f5	4225	Sovodenj
00050000-55e8-522a-ac62-daeab6a430a6	5281	Spodnja Idrija
00050000-55e8-522a-ec0c-2f034c6ff959	2241	Spodnji Duplek
00050000-55e8-522a-d208-0fe520dd8bb7	9245	Spodnji Ivanjci
00050000-55e8-522a-2c3c-e7e9a7e3b9a6	2277	Središče ob Dravi
00050000-55e8-522a-01cc-73760dc8053c	4267	Srednja vas v Bohinju
00050000-55e8-522a-f7f4-7e7a98019c8a	8256	Sromlje 
00050000-55e8-522a-da05-afc1fa48aa68	5224	Srpenica
00050000-55e8-522a-02c8-eba543728143	1242	Stahovica
00050000-55e8-522a-f8d7-b196fc6d2c3c	1332	Stara Cerkev
00050000-55e8-522a-85e6-e5c231b32839	8342	Stari trg ob Kolpi
00050000-55e8-522a-2feb-d2a4b8119da2	1386	Stari trg pri Ložu
00050000-55e8-522a-a489-7d524dc53032	2205	Starše
00050000-55e8-522a-f519-6d4c65546e2e	2289	Stoperce
00050000-55e8-522a-70e7-a8e57bb17c12	8322	Stopiče
00050000-55e8-522a-f206-21046ac932e6	3206	Stranice
00050000-55e8-522a-16ed-5fadb84ca471	8351	Straža
00050000-55e8-522a-5deb-0fb6391d7a72	1313	Struge
00050000-55e8-522a-8667-f0b4c0ce3b93	8293	Studenec
00050000-55e8-522a-9968-9300d1f70e6c	8331	Suhor
00050000-55e8-522a-f401-e0a8f4e568a8	2233	Sv. Ana v Slovenskih goricah
00050000-55e8-522a-240c-9208b61594df	2235	Sv. Trojica v Slovenskih goricah
00050000-55e8-522a-a6e2-add1903125cb	2353	Sveti Duh na Ostrem Vrhu
00050000-55e8-522a-f7f9-af626096bbfd	9244	Sveti Jurij ob Ščavnici
00050000-55e8-522a-7df4-43cf67f80a9b	3264	Sveti Štefan
00050000-55e8-522a-c94e-2c1b2085a370	2258	Sveti Tomaž
00050000-55e8-522a-08d6-07a43516d195	9204	Šalovci
00050000-55e8-522a-891b-8df49f858827	5261	Šempas
00050000-55e8-522a-8b28-cbb75dccb1d0	5290	Šempeter pri Gorici
00050000-55e8-522a-d70d-77ba2c9fdf71	3311	Šempeter v Savinjski dolini
00050000-55e8-522a-e407-c73d67294882	4208	Šenčur
00050000-55e8-522a-0af0-d9ebffcb4b83	2212	Šentilj v Slovenskih goricah
00050000-55e8-522a-4ddb-4fa7d27363db	8297	Šentjanž
00050000-55e8-522a-892d-bb3d9ec8f3fd	2373	Šentjanž pri Dravogradu
00050000-55e8-522a-b4f4-3c7b37137371	8310	Šentjernej
00050000-55e8-522a-a5de-6144f5a7d2ff	3230	Šentjur
00050000-55e8-522a-0062-ceb6ed4a5675	3271	Šentrupert
00050000-55e8-522a-7687-9e5c1ee121c2	8232	Šentrupert
00050000-55e8-522a-62b0-a2e9bcf00662	1296	Šentvid pri Stični
00050000-55e8-522a-0e26-f282923b5ae8	8275	Škocjan
00050000-55e8-522a-4f72-980248c2ef67	6281	Škofije
00050000-55e8-522a-167c-d99510e3312c	4220	Škofja Loka
00050000-55e8-522a-0119-242dcaca2aab	3211	Škofja vas
00050000-55e8-522a-6864-14ae1cf4a7a5	1291	Škofljica
00050000-55e8-522a-6982-03729b25b76b	6274	Šmarje
00050000-55e8-522a-7be3-56713f5db34c	1293	Šmarje - Sap
00050000-55e8-522a-4271-94e39b5fd94c	3240	Šmarje pri Jelšah
00050000-55e8-522a-a756-4ab42b01c1a8	8220	Šmarješke Toplice
00050000-55e8-522a-7794-0ba53491a9b7	2315	Šmartno na Pohorju
00050000-55e8-522a-254f-cbb671824dd2	3341	Šmartno ob Dreti
00050000-55e8-522a-273c-42ef3e638e7e	3327	Šmartno ob Paki
00050000-55e8-522a-b3e4-8cba8d818ce3	1275	Šmartno pri Litiji
00050000-55e8-522a-0532-a9088e13c0e8	2383	Šmartno pri Slovenj Gradcu
00050000-55e8-522a-341d-5f9365efc3db	3201	Šmartno v Rožni dolini
00050000-55e8-522a-f1b0-051c24fb1d76	3325	Šoštanj
00050000-55e8-522a-58f4-2e23d53c8bfc	6222	Štanjel
00050000-55e8-522a-6d1b-b8bf1ab421e5	3220	Štore
00050000-55e8-522a-3030-b8b5c27d4e21	3304	Tabor
00050000-55e8-522a-6913-e58dba4f9613	3221	Teharje
00050000-55e8-522a-4aa5-8730d611e8fe	9251	Tišina
00050000-55e8-522a-7b64-f411bd9c8cdb	5220	Tolmin
00050000-55e8-522a-2976-9cf880c9c60b	3326	Topolšica
00050000-55e8-522a-0693-e4ff2fd73e1c	2371	Trbonje
00050000-55e8-522a-d89c-7ece77cf2ff0	1420	Trbovlje
00050000-55e8-522a-b12c-a7a5ed887973	8231	Trebelno 
00050000-55e8-522a-970f-ccfdcf1f6fcb	8210	Trebnje
00050000-55e8-522a-29fd-a2f30f425dbf	5252	Trnovo pri Gorici
00050000-55e8-522a-9094-633570c626da	2254	Trnovska vas
00050000-55e8-522a-88de-80fa44348d65	1222	Trojane
00050000-55e8-522a-e4ca-c8456151ed96	1236	Trzin
00050000-55e8-522a-78f3-96d16d3b271f	4290	Tržič
00050000-55e8-522a-9561-95e5833861a5	8295	Tržišče
00050000-55e8-522a-22ca-4c58c17c3604	1311	Turjak
00050000-55e8-522a-6690-0468a47219c8	9224	Turnišče
00050000-55e8-522a-2fc0-2388fc98ff13	8323	Uršna sela
00050000-55e8-522a-fcd1-b8afa45e9f9b	1252	Vače
00050000-55e8-522a-e8a3-3b67b52b9493	3320	Velenje 
00050000-55e8-522a-4fb4-ac6574f95192	3322	Velenje - poštni predali
00050000-55e8-522a-f4fc-5adec3c7d868	8212	Velika Loka
00050000-55e8-522a-3eb3-b5d7d6c92578	2274	Velika Nedelja
00050000-55e8-522a-3425-e94dcdf462ae	9225	Velika Polana
00050000-55e8-522a-7f61-1a5210ae4b35	1315	Velike Lašče
00050000-55e8-522a-46fa-b3b83fdfe340	8213	Veliki Gaber
00050000-55e8-522a-89c4-8db25ab36bb2	9241	Veržej
00050000-55e8-522a-f357-536114d6fcd6	1312	Videm - Dobrepolje
00050000-55e8-522a-c526-dae68c5f52ee	2284	Videm pri Ptuju
00050000-55e8-522a-7f4b-4a9d13580cf0	8344	Vinica
00050000-55e8-522a-969a-53806138e0fe	5271	Vipava
00050000-55e8-522a-8b98-229efc0c1ba9	4212	Visoko
00050000-55e8-522a-0f12-6308eaa23759	1294	Višnja Gora
00050000-55e8-522a-3db8-bbd1bc79dcc0	3205	Vitanje
00050000-55e8-522a-d889-e0411d18b6e8	2255	Vitomarci
00050000-55e8-522a-c6e5-47b4c33aa6aa	1217	Vodice
00050000-55e8-522a-ce0f-e3dd963ca919	3212	Vojnik\t
00050000-55e8-522a-7cf8-bb5e221d65c8	5293	Volčja Draga
00050000-55e8-522a-ce6c-c75d26a8b331	2232	Voličina
00050000-55e8-522a-7ffc-d26fd62c2f7a	3305	Vransko
00050000-55e8-522a-b61d-6c0ff2f63899	6217	Vremski Britof
00050000-55e8-522a-dd54-11e59c354563	1360	Vrhnika
00050000-55e8-522a-7a21-57c5416cd54a	2365	Vuhred
00050000-55e8-522a-c192-176f86682ec1	2367	Vuzenica
00050000-55e8-522a-c213-505d6bb9d121	8292	Zabukovje 
00050000-55e8-522a-df23-e09847f7e11f	1410	Zagorje ob Savi
00050000-55e8-522a-4271-099920a01c84	1303	Zagradec
00050000-55e8-522a-e5ff-c9f96e33e350	2283	Zavrč
00050000-55e8-522a-4672-162ec2c389e4	8272	Zdole 
00050000-55e8-522a-f0ed-d73bcfa58744	4201	Zgornja Besnica
00050000-55e8-522a-ab62-7e0176b2f076	2242	Zgornja Korena
00050000-55e8-522a-e965-854527930e7d	2201	Zgornja Kungota
00050000-55e8-522a-f750-a9bb5228da0f	2316	Zgornja Ložnica
00050000-55e8-522a-b583-238cac5cf1d1	2314	Zgornja Polskava
00050000-55e8-522a-037c-31863f655ed9	2213	Zgornja Velka
00050000-55e8-522a-bdb6-76ae093e0e61	4247	Zgornje Gorje
00050000-55e8-522a-bb1f-fa66d06c11c6	4206	Zgornje Jezersko
00050000-55e8-522a-2d6d-20b73dfb1c92	2285	Zgornji Leskovec
00050000-55e8-522a-c5ba-3a0e78e0d6b6	1432	Zidani Most
00050000-55e8-522a-f898-456c10dd9a7c	3214	Zreče
00050000-55e8-522a-c83f-f4a49091b022	4209	Žabnica
00050000-55e8-522a-0642-e0ce3b12234c	3310	Žalec
00050000-55e8-522a-c7a5-689717716117	4228	Železniki
00050000-55e8-522a-e418-341268c4d8bb	2287	Žetale
00050000-55e8-522a-05db-4e3cb8160f32	4226	Žiri
00050000-55e8-522a-f0a2-ad7d2327130e	4274	Žirovnica
00050000-55e8-522a-ef5d-4ddd80d62a5e	8360	Žužemberk
\.


--
-- TOC entry 2933 (class 0 OID 17256935)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 17256745)
-- Dependencies: 183
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55e8-522c-9878-96b39c0cf147	00080000-55e8-522c-7195-64fbcda584fd	\N	00040000-55e8-522b-2611-7ba4a3d8c31d	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55e8-522c-18b8-62f6d3541966	00080000-55e8-522c-7195-64fbcda584fd	\N	00040000-55e8-522b-2611-7ba4a3d8c31d		\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55e8-522c-45fd-cedfdcf0b030	00080000-55e8-522c-1a73-5894a780c959	\N	00040000-55e8-522b-2611-7ba4a3d8c31d		\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2922 (class 0 OID 17256823)
-- Dependencies: 189
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 17256947)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 17257298)
-- Dependencies: 226
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2960 (class 0 OID 17257308)
-- Dependencies: 227
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55e8-522c-7be5-1e774faaa0b4	00080000-55e8-522c-d10d-998126cccfe2	0987	AK
00190000-55e8-522c-53c4-fb9f47477743	00080000-55e8-522c-1a73-5894a780c959	0989	AK
00190000-55e8-522c-7cbf-7cdfe2f5a6d5	00080000-55e8-522c-72e1-fd684f6c10b3	0986	AK
00190000-55e8-522c-cf13-048ef8ebe3f1	00080000-55e8-522c-4f38-815c208c8d27	0984	AK
00190000-55e8-522c-0e62-36133c926fb8	00080000-55e8-522c-9e13-bf34e40fbe1f	0983	AK
00190000-55e8-522c-6ebf-cfa8e79f672e	00080000-55e8-522c-0179-550f0cf35c1f	0982	AK
00190000-55e8-522d-d416-51ee24e2fed9	00080000-55e8-522d-ac8b-29a4618e6b98	1001	AK
\.


--
-- TOC entry 2958 (class 0 OID 17257255)
-- Dependencies: 225
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55e8-522c-0c9a-ca27b32a30ae	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2961 (class 0 OID 17257316)
-- Dependencies: 228
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 17256976)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, seplanira, kapaciteta, opis) FROM stdin;
00220000-55e8-522c-57e3-d472a9065320	\N	\N	0001	Poskusna 1	f	t	8	Poskusna učilnica v prvem
00220000-55e8-522c-5b07-26a9d5e97b16	\N	\N	0002	Poskusna 3	f	f	34	Poskusna učilnica v tretjem
00220000-55e8-522c-fc1a-9534d3a5021a	\N	\N	0003	Kazinska	t	t	84	Kazinska dvorana
00220000-55e8-522c-bc3a-e09f915fcb63	\N	\N	0004	Mali oder	t	t	24	Mali oder 
00220000-55e8-522c-a64e-be6a52ea69d1	\N	\N	0005	Komorni oder	t	t	15	Komorni oder
00220000-55e8-522c-dd20-005fda424b5c	\N	\N	0006	Stara dvorana	t	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55e8-522c-310c-0de0fea751ee	\N	\N	0007	Velika dvorana	t	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2931 (class 0 OID 17256920)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 17256910)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 17257108)
-- Dependencies: 218
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 17257047)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 17256618)
-- Dependencies: 172
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55e8-522d-ac8b-29a4618e6b98	00010000-55e8-522b-b576-966ac33c6313	2015-09-03 15:59:09	INS	a:0:{}
2	App\\Entity\\Option	00000000-55e8-522d-0cf5-1919e3474ba5	00010000-55e8-522b-b576-966ac33c6313	2015-09-03 15:59:09	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55e8-522d-d416-51ee24e2fed9	00010000-55e8-522b-b576-966ac33c6313	2015-09-03 15:59:09	INS	a:0:{}
\.


--
-- TOC entry 2982 (class 0 OID 0)
-- Dependencies: 171
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2940 (class 0 OID 17256989)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 17256656)
-- Dependencies: 176
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55e8-522b-889a-12af6ca7e29e	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55e8-522b-58b3-1bf3f9abf272	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55e8-522b-5268-0a7ccf47b470	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55e8-522b-886b-a137f6586c59	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55e8-522b-4a87-998e30f4870c	planer	Planer dogodkov v koledarju	t
00020000-55e8-522b-f10e-4e86662aafe3	kadrovska	Kadrovska služba	t
00020000-55e8-522b-c7a1-1dc16518d7ca	arhivar	Ažuriranje arhivalij	t
00020000-55e8-522b-2398-6f46f2ee0ae3	igralec	Igralec	t
00020000-55e8-522b-2d1a-a93d371bd394	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55e8-522c-4422-302ed50c504a	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2907 (class 0 OID 17256640)
-- Dependencies: 174
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55e8-522b-8818-8faaa340ca70	00020000-55e8-522b-5268-0a7ccf47b470
00010000-55e8-522b-b576-966ac33c6313	00020000-55e8-522b-5268-0a7ccf47b470
00010000-55e8-522c-4bf4-2bb9e52fc274	00020000-55e8-522c-4422-302ed50c504a
\.


--
-- TOC entry 2942 (class 0 OID 17257003)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 17256941)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 17256887)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 17257357)
-- Dependencies: 233
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55e8-522a-67e0-b78069114369	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55e8-522a-1b23-585149067101	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55e8-522a-b730-fc68744924ba	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55e8-522a-c4b9-45a357d260e1	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55e8-522a-dbe5-af4a1327f14d	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2965 (class 0 OID 17257349)
-- Dependencies: 232
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55e8-522a-33fe-f32bf4ae4ed7	00230000-55e8-522a-c4b9-45a357d260e1	popa
00240000-55e8-522a-971c-e83b598bceba	00230000-55e8-522a-c4b9-45a357d260e1	oseba
00240000-55e8-522a-2ac4-b3765ce6110f	00230000-55e8-522a-c4b9-45a357d260e1	sezona
00240000-55e8-522a-08bb-610ac23da24c	00230000-55e8-522a-1b23-585149067101	prostor
00240000-55e8-522a-d6b4-1fabb761d6ac	00230000-55e8-522a-c4b9-45a357d260e1	besedilo
00240000-55e8-522a-8f9b-afa8d535a5fa	00230000-55e8-522a-c4b9-45a357d260e1	uprizoritev
00240000-55e8-522a-0640-87855271e4bf	00230000-55e8-522a-c4b9-45a357d260e1	funkcija
00240000-55e8-522a-1571-433b53aaa7a2	00230000-55e8-522a-c4b9-45a357d260e1	tipfunkcije
00240000-55e8-522a-776f-b047ab477b02	00230000-55e8-522a-c4b9-45a357d260e1	alternacija
00240000-55e8-522a-f5cd-70ace196ec89	00230000-55e8-522a-67e0-b78069114369	pogodba
00240000-55e8-522a-1e0a-2e68a1cac7b2	00230000-55e8-522a-c4b9-45a357d260e1	zaposlitev
00240000-55e8-522a-1f55-bc277c59ed80	00230000-55e8-522a-c4b9-45a357d260e1	zvrstuprizoritve
00240000-55e8-522a-f591-5ad11bf5c333	00230000-55e8-522a-67e0-b78069114369	programdela
00240000-55e8-522a-7dc1-953edf459170	00230000-55e8-522a-c4b9-45a357d260e1	zapis
\.


--
-- TOC entry 2964 (class 0 OID 17257344)
-- Dependencies: 231
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
2e936847-5258-4a2e-9c97-1bb884fce4e5	00230000-55e8-522a-c4b9-45a357d260e1	0	1001
\.


--
-- TOC entry 2947 (class 0 OID 17257057)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55e8-522c-c626-3271ca01f456	000e0000-55e8-522c-af75-2407a21ae70d	00080000-55e8-522c-7195-64fbcda584fd	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55e8-522b-8479-cd62f80e2df0
00270000-55e8-522c-6d12-b205562931de	000e0000-55e8-522c-af75-2407a21ae70d	00080000-55e8-522c-7195-64fbcda584fd	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55e8-522b-8479-cd62f80e2df0
00270000-55e8-522c-836a-832e0c62c1e9	000e0000-55e8-522c-af75-2407a21ae70d	00080000-55e8-522c-a30a-08003f3503e7	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4	\N
\.


--
-- TOC entry 2914 (class 0 OID 17256718)
-- Dependencies: 181
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 17256897)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55e8-522d-7e03-4afa91592c8a	00180000-55e8-522c-51e3-8a187616f546	000c0000-55e8-522c-afbf-229df4357174	00090000-55e8-522c-29a1-2c4bbb9a3971	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e8-522d-8693-a341c43d74f9	00180000-55e8-522c-51e3-8a187616f546	000c0000-55e8-522d-3c5a-3662fc1e2d81	00090000-55e8-522c-b6cd-113daced229d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e8-522d-17b9-0308eaee9f59	00180000-55e8-522c-51e3-8a187616f546	000c0000-55e8-522d-2b73-81e1b152da05	00090000-55e8-522c-59e7-57b708156741	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e8-522d-bfb3-f326b19d107a	00180000-55e8-522c-51e3-8a187616f546	000c0000-55e8-522d-6408-ee1f5452a718	00090000-55e8-522c-f64e-fe1e3506259d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e8-522d-93f1-d9e8fd1601bb	00180000-55e8-522c-51e3-8a187616f546	000c0000-55e8-522d-0aef-5a739393a156	00090000-55e8-522c-0227-1cf5e6a7c5da	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e8-522d-e083-2c68df815ea8	00180000-55e8-522c-4063-c8717f191346	\N	00090000-55e8-522c-0227-1cf5e6a7c5da	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2950 (class 0 OID 17257097)
-- Dependencies: 217
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55e8-522a-ba1d-31647e657de6	Avtor	Avtorji	Avtorka	umetnik
000f0000-55e8-522a-9bdb-144cdf510d29	Priredba	Priredba	Priredba	umetnik
000f0000-55e8-522a-7a0e-c0ec96fd5111	Prevod	Prevod	Prevod	umetnik
000f0000-55e8-522a-83ee-bdf74303060f	Režija	Režija	Režija	umetnik
000f0000-55e8-522a-4f2d-471555fb8c90	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55e8-522a-a14b-a00cb3c84a0c	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55e8-522a-1541-47de3c11aaff	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55e8-522a-31a5-829ae0600732	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55e8-522a-69d9-226d33196689	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55e8-522a-9ddc-64e249ae0100	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55e8-522a-0842-a3d05e18cb97	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55e8-522a-94cd-35d9435e6dd2	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55e8-522a-2f64-2f3df74d4810	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55e8-522a-311e-19e2ba5388cc	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55e8-522a-70dc-7f942a88a417	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55e8-522a-5f2d-2f0408f69948	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55e8-522a-fe73-6fae11f63743	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55e8-522a-9799-b1c6d774175e	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2962 (class 0 OID 17257326)
-- Dependencies: 229
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55e8-522a-04b1-c3c5050094d8	01	Velika predstava	f	1.00	1.00
002b0000-55e8-522a-1226-2309116eb62d	02	Mala predstava	f	0.50	0.50
002b0000-55e8-522a-5e19-8700cdb4f04b	03	Mala koprodukcija	t	0.40	1.00
002b0000-55e8-522a-715b-0c27b035d85b	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55e8-522a-71c7-8e1799b9533a	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2919 (class 0 OID 17256780)
-- Dependencies: 186
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 17256627)
-- Dependencies: 173
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55e8-522b-b576-966ac33c6313	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROGSsy177WClO3HQTOWwIiGOTUJve56.S	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55e8-522c-22c7-fd9ff3338020	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55e8-522c-a2b3-108183bd1c0d	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55e8-522c-4a4d-dd7c1465219c	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55e8-522c-d435-e6c4d5f8e217	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55e8-522c-dd2c-5c4d5eb14def	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55e8-522c-0117-17dac4571c84	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55e8-522c-e98f-f00dff0817e5	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55e8-522c-bc12-37306272d6f0	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55e8-522c-d722-f1d46401215b	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55e8-522c-4bf4-2bb9e52fc274	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55e8-522b-8818-8faaa340ca70	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2954 (class 0 OID 17257145)
-- Dependencies: 221
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55e8-522c-d183-c7bd16efd29b	00160000-55e8-522c-f38b-146a57673934	\N	00140000-55e8-522a-0017-19ae0c1d91d5	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55e8-522c-a64e-be6a52ea69d1
000e0000-55e8-522c-af75-2407a21ae70d	00160000-55e8-522c-1aa7-b6fbcf3e3afa	\N	00140000-55e8-522a-a56e-839934aa4169	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55e8-522c-dd20-005fda424b5c
000e0000-55e8-522c-109a-90841166224e	\N	\N	00140000-55e8-522a-a56e-839934aa4169	00190000-55e8-522c-7be5-1e774faaa0b4	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55e8-522c-a64e-be6a52ea69d1
000e0000-55e8-522c-1ca7-afcc9e74826b	\N	\N	00140000-55e8-522a-a56e-839934aa4169	00190000-55e8-522c-7be5-1e774faaa0b4	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55e8-522c-a64e-be6a52ea69d1
000e0000-55e8-522c-43a2-03fde71c64e5	\N	\N	00140000-55e8-522a-a56e-839934aa4169	00190000-55e8-522c-7be5-1e774faaa0b4	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55e8-522c-57e3-d472a9065320
000e0000-55e8-522c-d14a-8b0823002cdb	\N	\N	00140000-55e8-522a-a56e-839934aa4169	00190000-55e8-522c-7be5-1e774faaa0b4	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55e8-522c-57e3-d472a9065320
\.


--
-- TOC entry 2924 (class 0 OID 17256841)
-- Dependencies: 191
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55e8-522c-2298-4bc2b290b7f9	000e0000-55e8-522c-af75-2407a21ae70d	\N	1	
00200000-55e8-522c-247c-1d679b11dcf9	000e0000-55e8-522c-af75-2407a21ae70d	\N	2	
\.


--
-- TOC entry 2938 (class 0 OID 17256968)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 17257071)
-- Dependencies: 215
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55e8-522b-6877-b8ff004492c2	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55e8-522b-97f3-f26828d424c1	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55e8-522b-c4e3-ac9fc05ac853	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55e8-522b-d87d-05cc5ab20aab	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55e8-522b-9330-dc7e57f6ad75	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55e8-522b-e75d-81c1dd972cc5	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55e8-522b-0d70-3636db106998	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55e8-522b-39bf-671dd9c4b484	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55e8-522b-8479-cd62f80e2df0	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55e8-522b-c8e7-21610f4df6f0	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55e8-522b-3ba7-b74a2e78d9cd	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55e8-522b-ec8e-a6626a98d7e6	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55e8-522b-8e74-54d3612ccfc0	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55e8-522b-cec1-c2ca30c076da	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55e8-522b-9d6b-b04ee6417a27	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55e8-522b-619d-9536ce926505	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55e8-522b-6343-8c973c7fe3e3	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55e8-522b-0106-876eccf0b1de	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55e8-522b-93f5-6f6e1bb9feeb	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55e8-522b-cb6c-ea5ce5e72ab4	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55e8-522b-f02b-fe0faaae5987	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55e8-522b-53a4-f0ca112e7590	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55e8-522b-64ca-5a8b10d462d8	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55e8-522b-66fd-b6dafb9c679a	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55e8-522b-b0c6-5107a167daa5	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55e8-522b-14e2-b97144d1e2f1	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55e8-522b-ae30-e8aad06c1781	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55e8-522b-1d1a-badc803970fa	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2968 (class 0 OID 17257396)
-- Dependencies: 235
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 17257368)
-- Dependencies: 234
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 17257408)
-- Dependencies: 236
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2945 (class 0 OID 17257040)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55e8-522c-c30a-7865bf3acf25	00090000-55e8-522c-b6cd-113daced229d	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e8-522c-6d26-7493043a10dc	00090000-55e8-522c-59e7-57b708156741	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e8-522c-40d4-1ccad51744b7	00090000-55e8-522c-2b5b-4bca3a0153e0	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e8-522c-132c-b5b74d0001ff	00090000-55e8-522c-b24c-0da2ece5b9e7	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e8-522c-cff4-80ed61d5317f	00090000-55e8-522c-29a1-2c4bbb9a3971	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e8-522c-a27e-43fc480030d6	00090000-55e8-522c-d878-94f369c3b78d	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2926 (class 0 OID 17256877)
-- Dependencies: 193
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 17257135)
-- Dependencies: 220
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55e8-522a-0017-19ae0c1d91d5	01	Drama	drama (SURS 01)
00140000-55e8-522a-7077-93f981ac480f	02	Opera	opera (SURS 02)
00140000-55e8-522a-1cfd-7154b812ad5d	03	Balet	balet (SURS 03)
00140000-55e8-522a-8c17-ab04b31ad0d6	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55e8-522a-0d37-c4646ae4adbf	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55e8-522a-a56e-839934aa4169	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55e8-522a-4256-1d42a2eb2dc2	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2944 (class 0 OID 17257030)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2454 (class 2606 OID 17256681)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 17257194)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 17257184)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 17257096)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 17257448)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 17256866)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 17256886)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 17257342)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 17256806)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 17257249)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 17257026)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 17256839)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 17256820)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 17256933)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 17257425)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 17257432)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2696 (class 2606 OID 17257456)
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
-- TOC entry 2556 (class 2606 OID 17256960)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 17256778)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 17256690)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 17256714)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 17256670)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2445 (class 2606 OID 17256655)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 17256966)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 17257002)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 17257130)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 17256742)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 17256766)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 17256939)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 17256756)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 17256827)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 17256951)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 17257305)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 17257313)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 17257297)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 17257324)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 17256984)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 17256924)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 17256915)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 17257118)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 17257054)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 17256626)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 17256993)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 17256644)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2447 (class 2606 OID 17256664)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 17257011)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 17256946)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 17256895)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 17257366)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 17257354)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 17257348)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 17257067)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 17256723)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 17256906)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 17257107)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 17257336)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 17256791)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 17256639)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 17257163)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 17256849)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 17256974)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 17257079)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 17257406)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 17257390)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 17257414)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 17257045)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 17256881)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 17257143)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 17257038)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 1259 OID 17256875)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2510 (class 1259 OID 17256876)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2511 (class 1259 OID 17256874)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2512 (class 1259 OID 17256873)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2594 (class 1259 OID 17257068)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2595 (class 1259 OID 17257069)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2596 (class 1259 OID 17257070)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2682 (class 1259 OID 17257427)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2683 (class 1259 OID 17257426)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2468 (class 1259 OID 17256744)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2557 (class 1259 OID 17256967)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2669 (class 1259 OID 17257394)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2670 (class 1259 OID 17257393)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2671 (class 1259 OID 17257395)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2672 (class 1259 OID 17257392)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2673 (class 1259 OID 17257391)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2551 (class 1259 OID 17256953)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2552 (class 1259 OID 17256952)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2504 (class 1259 OID 17256850)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 17257027)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2582 (class 1259 OID 17257029)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2583 (class 1259 OID 17257028)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2493 (class 1259 OID 17256822)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2494 (class 1259 OID 17256821)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2652 (class 1259 OID 17257325)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2607 (class 1259 OID 17257132)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2608 (class 1259 OID 17257133)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2609 (class 1259 OID 17257134)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2679 (class 1259 OID 17257415)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2616 (class 1259 OID 17257168)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2617 (class 1259 OID 17257165)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2618 (class 1259 OID 17257169)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2619 (class 1259 OID 17257167)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2620 (class 1259 OID 17257166)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2483 (class 1259 OID 17256793)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2484 (class 1259 OID 17256792)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2459 (class 1259 OID 17256717)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2569 (class 1259 OID 17256994)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2449 (class 1259 OID 17256671)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2450 (class 1259 OID 17256672)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2574 (class 1259 OID 17257014)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2575 (class 1259 OID 17257013)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2576 (class 1259 OID 17257012)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2497 (class 1259 OID 17256828)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2498 (class 1259 OID 17256829)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2662 (class 1259 OID 17257356)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2531 (class 1259 OID 17256919)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2532 (class 1259 OID 17256917)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2533 (class 1259 OID 17256916)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2534 (class 1259 OID 17256918)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2440 (class 1259 OID 17256645)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2441 (class 1259 OID 17256646)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2560 (class 1259 OID 17256975)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2692 (class 1259 OID 17257449)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2693 (class 1259 OID 17257457)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2694 (class 1259 OID 17257458)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2546 (class 1259 OID 17256940)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2590 (class 1259 OID 17257055)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2591 (class 1259 OID 17257056)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2637 (class 1259 OID 17257254)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2638 (class 1259 OID 17257253)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2639 (class 1259 OID 17257250)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2640 (class 1259 OID 17257251)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2641 (class 1259 OID 17257252)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2472 (class 1259 OID 17256758)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2473 (class 1259 OID 17256757)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2474 (class 1259 OID 17256759)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2563 (class 1259 OID 17256988)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2564 (class 1259 OID 17256987)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2644 (class 1259 OID 17257306)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2645 (class 1259 OID 17257307)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2630 (class 1259 OID 17257198)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 17257199)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2632 (class 1259 OID 17257196)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2633 (class 1259 OID 17257197)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2587 (class 1259 OID 17257046)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2537 (class 1259 OID 17256928)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2538 (class 1259 OID 17256927)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2539 (class 1259 OID 17256925)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2540 (class 1259 OID 17256926)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2626 (class 1259 OID 17257186)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2627 (class 1259 OID 17257185)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2503 (class 1259 OID 17256840)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2659 (class 1259 OID 17257343)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2686 (class 1259 OID 17257433)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2687 (class 1259 OID 17257434)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2455 (class 1259 OID 17256692)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2456 (class 1259 OID 17256691)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2464 (class 1259 OID 17256724)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 17256725)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2526 (class 1259 OID 17256909)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2527 (class 1259 OID 17256908)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2528 (class 1259 OID 17256907)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2513 (class 1259 OID 17256868)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2514 (class 1259 OID 17256869)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2515 (class 1259 OID 17256867)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2516 (class 1259 OID 17256871)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2517 (class 1259 OID 17256872)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2518 (class 1259 OID 17256870)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2471 (class 1259 OID 17256743)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2489 (class 1259 OID 17256807)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2490 (class 1259 OID 17256809)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2491 (class 1259 OID 17256808)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2492 (class 1259 OID 17256810)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2545 (class 1259 OID 17256934)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2612 (class 1259 OID 17257131)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 17257164)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2462 (class 1259 OID 17256715)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2463 (class 1259 OID 17256716)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2584 (class 1259 OID 17257039)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2668 (class 1259 OID 17257367)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 17256779)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2665 (class 1259 OID 17257355)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2567 (class 1259 OID 17256986)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2568 (class 1259 OID 17256985)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2634 (class 1259 OID 17257195)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2479 (class 1259 OID 17256767)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 17257144)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2676 (class 1259 OID 17257407)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2650 (class 1259 OID 17257314)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2651 (class 1259 OID 17257315)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2525 (class 1259 OID 17256896)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2448 (class 1259 OID 17256665)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2720 (class 2606 OID 17257574)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2721 (class 2606 OID 17257579)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2725 (class 2606 OID 17257599)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2719 (class 2606 OID 17257569)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2723 (class 2606 OID 17257589)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2724 (class 2606 OID 17257594)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2722 (class 2606 OID 17257584)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2755 (class 2606 OID 17257749)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2756 (class 2606 OID 17257754)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2757 (class 2606 OID 17257759)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2790 (class 2606 OID 17257924)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2789 (class 2606 OID 17257919)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2707 (class 2606 OID 17257509)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2741 (class 2606 OID 17257679)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2786 (class 2606 OID 17257904)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2785 (class 2606 OID 17257899)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2787 (class 2606 OID 17257909)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2784 (class 2606 OID 17257894)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2783 (class 2606 OID 17257889)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2740 (class 2606 OID 17257674)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2739 (class 2606 OID 17257669)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2718 (class 2606 OID 17257564)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2749 (class 2606 OID 17257719)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2751 (class 2606 OID 17257729)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2750 (class 2606 OID 17257724)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2714 (class 2606 OID 17257544)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2713 (class 2606 OID 17257539)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2737 (class 2606 OID 17257659)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2780 (class 2606 OID 17257874)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2758 (class 2606 OID 17257764)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2759 (class 2606 OID 17257769)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2760 (class 2606 OID 17257774)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2788 (class 2606 OID 17257914)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2764 (class 2606 OID 17257794)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2761 (class 2606 OID 17257779)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2765 (class 2606 OID 17257799)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2763 (class 2606 OID 17257789)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2762 (class 2606 OID 17257784)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2712 (class 2606 OID 17257534)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2711 (class 2606 OID 17257529)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2704 (class 2606 OID 17257494)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2703 (class 2606 OID 17257489)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2745 (class 2606 OID 17257699)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2699 (class 2606 OID 17257469)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2700 (class 2606 OID 17257474)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2748 (class 2606 OID 17257714)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2747 (class 2606 OID 17257709)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2746 (class 2606 OID 17257704)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2715 (class 2606 OID 17257549)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2716 (class 2606 OID 17257554)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2782 (class 2606 OID 17257884)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2732 (class 2606 OID 17257634)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2730 (class 2606 OID 17257624)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2729 (class 2606 OID 17257619)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2731 (class 2606 OID 17257629)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2697 (class 2606 OID 17257459)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2698 (class 2606 OID 17257464)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2742 (class 2606 OID 17257684)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2793 (class 2606 OID 17257939)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2794 (class 2606 OID 17257944)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2795 (class 2606 OID 17257949)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2738 (class 2606 OID 17257664)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2753 (class 2606 OID 17257739)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2754 (class 2606 OID 17257744)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2776 (class 2606 OID 17257854)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2775 (class 2606 OID 17257849)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2772 (class 2606 OID 17257834)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2773 (class 2606 OID 17257839)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2774 (class 2606 OID 17257844)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2709 (class 2606 OID 17257519)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2708 (class 2606 OID 17257514)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2710 (class 2606 OID 17257524)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2744 (class 2606 OID 17257694)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2743 (class 2606 OID 17257689)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2777 (class 2606 OID 17257859)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2778 (class 2606 OID 17257864)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2770 (class 2606 OID 17257824)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2771 (class 2606 OID 17257829)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2768 (class 2606 OID 17257814)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2769 (class 2606 OID 17257819)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2752 (class 2606 OID 17257734)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2736 (class 2606 OID 17257654)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2735 (class 2606 OID 17257649)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2733 (class 2606 OID 17257639)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2734 (class 2606 OID 17257644)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2767 (class 2606 OID 17257809)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2766 (class 2606 OID 17257804)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2717 (class 2606 OID 17257559)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2779 (class 2606 OID 17257869)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2781 (class 2606 OID 17257879)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2791 (class 2606 OID 17257929)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2792 (class 2606 OID 17257934)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2702 (class 2606 OID 17257484)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2701 (class 2606 OID 17257479)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2705 (class 2606 OID 17257499)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2706 (class 2606 OID 17257504)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2728 (class 2606 OID 17257614)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2727 (class 2606 OID 17257609)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2726 (class 2606 OID 17257604)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-03 15:59:11 CEST

--
-- PostgreSQL database dump complete
--

