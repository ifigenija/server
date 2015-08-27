--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-27 16:24:04 CEST

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
-- TOC entry 177 (class 1259 OID 15945860)
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
-- TOC entry 223 (class 1259 OID 15946376)
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
-- TOC entry 222 (class 1259 OID 15946359)
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
-- TOC entry 216 (class 1259 OID 15946269)
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
-- TOC entry 239 (class 1259 OID 15946625)
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
-- TOC entry 191 (class 1259 OID 15946038)
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
-- TOC entry 194 (class 1259 OID 15946072)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 15946527)
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
-- TOC entry 186 (class 1259 OID 15945981)
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
-- TOC entry 224 (class 1259 OID 15946389)
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
-- TOC entry 210 (class 1259 OID 15946204)
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
-- TOC entry 189 (class 1259 OID 15946018)
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
-- TOC entry 193 (class 1259 OID 15946066)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 15945998)
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
-- TOC entry 199 (class 1259 OID 15946119)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 237 (class 1259 OID 15946606)
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
-- TOC entry 238 (class 1259 OID 15946618)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 15946640)
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
-- TOC entry 203 (class 1259 OID 15946144)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 15945955)
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
-- TOC entry 178 (class 1259 OID 15945869)
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
-- TOC entry 179 (class 1259 OID 15945880)
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
-- TOC entry 174 (class 1259 OID 15945834)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 15945853)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 15946151)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 15946184)
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
-- TOC entry 219 (class 1259 OID 15946308)
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
-- TOC entry 181 (class 1259 OID 15945913)
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
-- TOC entry 183 (class 1259 OID 15945947)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 15946125)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 15945932)
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
-- TOC entry 188 (class 1259 OID 15946010)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 15946137)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 15946488)
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
-- TOC entry 227 (class 1259 OID 15946498)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 15946444)
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
-- TOC entry 228 (class 1259 OID 15946506)
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
-- TOC entry 206 (class 1259 OID 15946166)
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
-- TOC entry 198 (class 1259 OID 15946110)
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
-- TOC entry 197 (class 1259 OID 15946100)
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
-- TOC entry 218 (class 1259 OID 15946297)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 15946236)
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
-- TOC entry 171 (class 1259 OID 15945805)
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
-- TOC entry 170 (class 1259 OID 15945803)
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
-- TOC entry 207 (class 1259 OID 15946178)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 15945843)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 15945827)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 15946192)
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
-- TOC entry 201 (class 1259 OID 15946131)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 15946077)
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
-- TOC entry 233 (class 1259 OID 15946547)
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
-- TOC entry 232 (class 1259 OID 15946539)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 15946534)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 15946246)
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
-- TOC entry 180 (class 1259 OID 15945905)
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
-- TOC entry 196 (class 1259 OID 15946087)
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
-- TOC entry 217 (class 1259 OID 15946286)
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
-- TOC entry 229 (class 1259 OID 15946516)
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
-- TOC entry 185 (class 1259 OID 15945967)
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
-- TOC entry 172 (class 1259 OID 15945814)
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
-- TOC entry 221 (class 1259 OID 15946334)
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
-- TOC entry 190 (class 1259 OID 15946029)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 15946158)
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
-- TOC entry 215 (class 1259 OID 15946260)
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
-- TOC entry 235 (class 1259 OID 15946586)
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
-- TOC entry 234 (class 1259 OID 15946558)
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
-- TOC entry 236 (class 1259 OID 15946598)
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
-- TOC entry 212 (class 1259 OID 15946229)
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
-- TOC entry 192 (class 1259 OID 15946061)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 15946324)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 15946219)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 15945808)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2911 (class 0 OID 15945860)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2957 (class 0 OID 15946376)
-- Dependencies: 223
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55df-1d83-e163-33472256af32	000d0000-55df-1d82-8dde-b989f9c4a9c9	\N	00090000-55df-1d82-5651-c21a2a66c767	000b0000-55df-1d82-bb9a-12b3c75631e5	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55df-1d83-e228-45f65e9fdf47	000d0000-55df-1d82-2447-7bb0dda66b69	00100000-55df-1d83-9ae0-0533b7b818d2	00090000-55df-1d82-5acb-b82678b39f8a	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55df-1d83-55fc-9d5e5d6efdb4	000d0000-55df-1d82-df35-b5c55f0ca74b	00100000-55df-1d83-1736-6224ce4d0817	00090000-55df-1d82-b95c-ac400b698d08	\N	0003	t	\N	2015-08-27	\N	2	\N	\N	f	f
000c0000-55df-1d83-c4b1-f33ad7a8af3b	000d0000-55df-1d82-a717-16bcd0eaaec4	\N	00090000-55df-1d82-1ac4-7a40199ec52a	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55df-1d83-3c1c-630d6acaf46d	000d0000-55df-1d82-bf26-be293a8d8947	\N	00090000-55df-1d82-091b-2481b738299d	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55df-1d83-730e-27151e52113f	000d0000-55df-1d82-ccfa-e7425793b339	\N	00090000-55df-1d82-4743-b40e555d031b	000b0000-55df-1d82-f5f3-0ac099af294d	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55df-1d83-1af1-c6f3ee9e372f	000d0000-55df-1d82-7911-1f3506b40ac4	00100000-55df-1d83-7ff4-5df1983a338c	00090000-55df-1d82-2acd-9d6657e42930	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55df-1d83-f809-94c63949f65e	000d0000-55df-1d82-093d-140f08f354db	\N	00090000-55df-1d82-3fae-3574456ca643	000b0000-55df-1d82-ac07-6f559e5a0dcb	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55df-1d83-93ac-1f52fa082601	000d0000-55df-1d82-7911-1f3506b40ac4	00100000-55df-1d83-5546-82a8f2d7d079	00090000-55df-1d82-146a-54087b383f84	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55df-1d83-9051-d1855b1333a1	000d0000-55df-1d82-7911-1f3506b40ac4	00100000-55df-1d83-7dc1-9177c603d42f	00090000-55df-1d82-abcf-cd4031feb6eb	\N	0010	t	\N	2015-08-27	\N	16	\N	\N	f	t
000c0000-55df-1d83-d39d-84b9724166a5	000d0000-55df-1d82-7911-1f3506b40ac4	00100000-55df-1d83-ea0d-85f560f59644	00090000-55df-1d82-d3dd-2a7a02961f33	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2956 (class 0 OID 15946359)
-- Dependencies: 222
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 15946269)
-- Dependencies: 216
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55df-1d82-a342-e814bd49f2dc	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55df-1d82-1df6-8d3db3a3620d	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55df-1d82-17f7-9ca87aa27075	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2973 (class 0 OID 15946625)
-- Dependencies: 239
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2925 (class 0 OID 15946038)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55df-1d83-56fa-ec00c634e8f1	\N	\N	00200000-55df-1d82-d07b-943c6ebc4933	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55df-1d83-7b1d-9fa8a128226a	\N	\N	00200000-55df-1d82-5c6a-e3d8a730e928	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55df-1d83-5128-2e514e72160d	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55df-1d83-32c2-da3e81f9da06	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55df-1d83-4471-f365140f52ae	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2928 (class 0 OID 15946072)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 15946527)
-- Dependencies: 230
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 15945981)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55df-1d81-3fd5-3271367c781e	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55df-1d81-23fc-23a337e2c5de	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55df-1d81-b748-c05c3dee2eec	AL	ALB	008	Albania 	Albanija	\N
00040000-55df-1d81-33d3-46cf45ef4a07	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55df-1d81-c4d0-58d34780c7f7	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55df-1d81-21e0-35494c290d4e	AD	AND	020	Andorra 	Andora	\N
00040000-55df-1d81-ec3c-76deb8a4368c	AO	AGO	024	Angola 	Angola	\N
00040000-55df-1d81-ac31-c015496d369c	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55df-1d81-7955-142369f52d35	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55df-1d81-8b2d-8417ccbf3757	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55df-1d81-19f4-5ef02882b060	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55df-1d81-0b7b-0c53759eef15	AM	ARM	051	Armenia 	Armenija	\N
00040000-55df-1d81-e9c4-955fb8087f16	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55df-1d81-8999-d695c3db3d3e	AU	AUS	036	Australia 	Avstralija	\N
00040000-55df-1d81-2007-b1837a5e8117	AT	AUT	040	Austria 	Avstrija	\N
00040000-55df-1d81-bb2d-d5c7bfa7dd92	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55df-1d81-cd1b-407abf55d2a0	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55df-1d81-05e3-79fd33d44a3e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55df-1d81-d4b5-a9a80a68b297	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55df-1d81-19a0-4f63e99bdae0	BB	BRB	052	Barbados 	Barbados	\N
00040000-55df-1d81-3817-eb145b3c15bc	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55df-1d81-047d-a57a4efa7594	BE	BEL	056	Belgium 	Belgija	\N
00040000-55df-1d81-35ce-25d77a1d9e5f	BZ	BLZ	084	Belize 	Belize	\N
00040000-55df-1d81-e130-8c798910b486	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55df-1d81-4208-b265cc32d485	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55df-1d81-d56b-5be0465c4d2e	BT	BTN	064	Bhutan 	Butan	\N
00040000-55df-1d81-d1d8-6a04619bc2b7	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55df-1d81-c38a-e6f9f7fb1e8f	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55df-1d81-2367-46a9683cf68a	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55df-1d81-cb84-4b96882f5cb1	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55df-1d81-0df1-907f85a205b7	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55df-1d81-c5b2-ea43054dc3a2	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55df-1d81-7da8-5a8edcef0d0f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55df-1d81-0a0d-369a63dc51bc	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55df-1d81-53ac-c2c4d66ea6bc	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55df-1d81-db72-eb103b2c1526	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55df-1d81-b8f3-009be3e7c3a9	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55df-1d81-11c1-bb916eabbb09	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55df-1d81-f9c9-91aa7d384115	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55df-1d81-2886-7cdc163625f7	CA	CAN	124	Canada 	Kanada	\N
00040000-55df-1d81-9f28-180f71cdc60f	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55df-1d81-8753-9c2e6f28b0be	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55df-1d81-57cd-6c447a42cada	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55df-1d81-1a70-ad2f68075628	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55df-1d81-d114-0cd47b369aa1	CL	CHL	152	Chile 	Čile	\N
00040000-55df-1d81-3d5f-e60461083876	CN	CHN	156	China 	Kitajska	\N
00040000-55df-1d81-375b-db97ef9d3dd4	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55df-1d81-9032-1f6627fa9349	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55df-1d81-cb5d-8dc53e5a8533	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55df-1d81-6258-9415ec2b2c6a	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55df-1d81-690b-c013fbaf705e	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55df-1d81-a73c-4167917b49ac	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55df-1d81-8e8f-ad8d492d163e	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55df-1d81-55fb-74eb5e056772	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55df-1d81-590b-e058e9de33e1	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55df-1d81-a3c7-bb6d9ecf5428	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55df-1d81-f384-7acae7abc2c3	CU	CUB	192	Cuba 	Kuba	\N
00040000-55df-1d81-0c7a-bd1063060fa0	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55df-1d81-789d-7ae9bc916af5	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55df-1d81-ea6d-0d3a89d93119	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55df-1d81-999a-e0e615d454c9	DK	DNK	208	Denmark 	Danska	\N
00040000-55df-1d81-0c40-97c17ec41a80	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55df-1d81-0fd1-bc5dc00bd0f7	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55df-1d81-097c-59e8df7815f5	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55df-1d81-c239-9cce7fc40d56	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55df-1d81-3037-b7ad2465c8b3	EG	EGY	818	Egypt 	Egipt	\N
00040000-55df-1d81-efa7-93c35c690274	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55df-1d81-d476-94df27e31aa0	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55df-1d81-874a-93ef1327eeba	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55df-1d81-15b9-2b7a84964bc4	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55df-1d81-8dc0-71d5dd6dce73	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55df-1d81-6bac-d13b217f698e	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55df-1d81-f922-0343e61d182a	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55df-1d81-62f0-d8719d93c526	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55df-1d81-8af1-bfa5ca88e1b3	FI	FIN	246	Finland 	Finska	\N
00040000-55df-1d81-b621-2f1a6ac3dd9a	FR	FRA	250	France 	Francija	\N
00040000-55df-1d81-37ca-1cb945cbfac0	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55df-1d81-81e1-37834559cb37	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55df-1d81-4c45-345b779bb187	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55df-1d81-2504-a4b8a6ca9b26	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55df-1d81-946c-f9e1ef18cb4c	GA	GAB	266	Gabon 	Gabon	\N
00040000-55df-1d81-e87a-e40b634ecf7c	GM	GMB	270	Gambia 	Gambija	\N
00040000-55df-1d81-667b-6e56e2045891	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55df-1d81-c2a6-c62760699c8e	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55df-1d81-416e-8f5dad552fb6	GH	GHA	288	Ghana 	Gana	\N
00040000-55df-1d81-2e14-27ee60480708	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55df-1d81-800d-3a10e7daea3e	GR	GRC	300	Greece 	Grčija	\N
00040000-55df-1d81-d258-66123f6b2cb0	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55df-1d81-bb0b-4c881e5fc0ca	GD	GRD	308	Grenada 	Grenada	\N
00040000-55df-1d81-c238-d85b8ebafc02	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55df-1d81-0283-8d8895f0bcfe	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55df-1d81-281f-8e15e83d2dd9	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55df-1d81-aef3-9fb6c35da20f	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55df-1d81-dc9b-00bbeb6dd50d	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55df-1d81-364a-b8b25f49f8ac	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55df-1d81-69f6-e79b9704131d	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55df-1d81-f218-8df75c14181f	HT	HTI	332	Haiti 	Haiti	\N
00040000-55df-1d81-2848-97cb34eeb5d3	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55df-1d81-23f7-733960bea79b	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55df-1d81-d369-d05cd11a5836	HN	HND	340	Honduras 	Honduras	\N
00040000-55df-1d81-a904-8003db6f5f49	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55df-1d81-3128-638ea2ee90d1	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55df-1d81-a325-90812a1c1aa9	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55df-1d81-1676-b18f393672da	IN	IND	356	India 	Indija	\N
00040000-55df-1d81-52d9-061ca993d938	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55df-1d81-9107-7263b19f3945	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55df-1d81-13e3-211b89605df6	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55df-1d81-4121-4a3ef88d153a	IE	IRL	372	Ireland 	Irska	\N
00040000-55df-1d81-27b9-766d5eec80f8	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55df-1d81-5085-2ef51437fd81	IL	ISR	376	Israel 	Izrael	\N
00040000-55df-1d81-e978-9b7e932e492d	IT	ITA	380	Italy 	Italija	\N
00040000-55df-1d81-a9ca-ba33c98540b2	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55df-1d81-f0be-725cc9f6e1e0	JP	JPN	392	Japan 	Japonska	\N
00040000-55df-1d81-76b9-24500b611fe7	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55df-1d81-6b42-cad445aa81c0	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55df-1d81-43fc-2021eeff9b6e	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55df-1d81-a211-3ff40dca5563	KE	KEN	404	Kenya 	Kenija	\N
00040000-55df-1d81-a1af-5ba9ab17c40b	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55df-1d81-f66f-01a370e52dc4	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55df-1d81-b64a-fa95f240c399	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55df-1d81-2179-c3da63fe3c5b	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55df-1d81-3015-b48a6d78cc9c	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55df-1d81-2ff1-d2ed4382b775	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55df-1d81-e261-4fc85fec9222	LV	LVA	428	Latvia 	Latvija	\N
00040000-55df-1d81-a56b-c52debe8af63	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55df-1d81-0733-fe4e20bc3100	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55df-1d81-6536-a51333bcd157	LR	LBR	430	Liberia 	Liberija	\N
00040000-55df-1d81-7fe3-efdcad64422b	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55df-1d81-9d23-d1bc56761be0	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55df-1d81-dfc3-f4f8f9732742	LT	LTU	440	Lithuania 	Litva	\N
00040000-55df-1d81-1167-30cf15c2bf64	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55df-1d81-bfea-f280647b986a	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55df-1d81-8d48-0fb0656aa46b	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55df-1d81-012a-60a3e77417ca	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55df-1d81-8497-39b14f89c774	MW	MWI	454	Malawi 	Malavi	\N
00040000-55df-1d81-ed5b-c46973846f2d	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55df-1d81-c72e-0bcc9a70267c	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55df-1d81-2d13-6d04f5d98f88	ML	MLI	466	Mali 	Mali	\N
00040000-55df-1d81-0a2c-d5e8c4b83d92	MT	MLT	470	Malta 	Malta	\N
00040000-55df-1d81-0869-dc7f13e67f49	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55df-1d81-1d0e-e18ccaff8af2	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55df-1d81-8814-492b3483a454	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55df-1d81-3d36-d5a5a3bffbb6	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55df-1d81-40d0-308b0cea0d68	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55df-1d81-531b-a948765865bc	MX	MEX	484	Mexico 	Mehika	\N
00040000-55df-1d81-4192-30d3a001ecdf	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55df-1d81-149e-239c5e43150f	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55df-1d81-434b-30e591b1e832	MC	MCO	492	Monaco 	Monako	\N
00040000-55df-1d81-a79c-38593e05f566	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55df-1d81-90ac-8ee3b344221e	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55df-1d81-94c7-38a9e6078090	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55df-1d81-05ef-d23d2ddf66b1	MA	MAR	504	Morocco 	Maroko	\N
00040000-55df-1d81-ddb6-1fa954d9e3b1	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55df-1d81-0dd2-fd0377f85d87	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55df-1d81-db6b-3aeaca80fa84	NA	NAM	516	Namibia 	Namibija	\N
00040000-55df-1d81-a172-156fa265cb72	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55df-1d81-ef59-99c3cd7bacd9	NP	NPL	524	Nepal 	Nepal	\N
00040000-55df-1d81-5614-5a03bbdb5779	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55df-1d81-e289-727b707b2aa5	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55df-1d81-a79b-97468fcc255b	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55df-1d81-63a5-df0f97194046	NE	NER	562	Niger 	Niger 	\N
00040000-55df-1d81-1232-acce6dc3c8dc	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55df-1d81-be84-a15aefda7e81	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55df-1d81-4cf9-48956f77e327	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55df-1d81-9bfd-e8a30b0c5406	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55df-1d81-f85b-c8757def8d91	NO	NOR	578	Norway 	Norveška	\N
00040000-55df-1d81-96a5-0f1144023b4e	OM	OMN	512	Oman 	Oman	\N
00040000-55df-1d81-9ccb-a3b88ae19564	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55df-1d81-1568-3ec9dcedf229	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55df-1d81-a19b-ba50128920e9	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55df-1d81-7923-2c939e4746fb	PA	PAN	591	Panama 	Panama	\N
00040000-55df-1d81-d0cf-cfb0f3d6773b	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55df-1d81-aade-b64ab9ce9594	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55df-1d81-9168-4202d7822885	PE	PER	604	Peru 	Peru	\N
00040000-55df-1d81-3d68-c0b677623612	PH	PHL	608	Philippines 	Filipini	\N
00040000-55df-1d81-3c30-462a1b25ab60	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55df-1d81-2dba-e7f342c0451f	PL	POL	616	Poland 	Poljska	\N
00040000-55df-1d81-ca6b-2437e5f7caa2	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55df-1d81-d8c8-f0790411bd6b	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55df-1d81-9449-6fe415d14322	QA	QAT	634	Qatar 	Katar	\N
00040000-55df-1d81-7a91-24d6d9cc325b	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55df-1d81-8a0f-912afef75466	RO	ROU	642	Romania 	Romunija	\N
00040000-55df-1d81-ce5f-06a8a0ff5932	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55df-1d81-e4e5-3b18d07c50e8	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55df-1d81-e314-1f34df5d328f	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55df-1d81-2d22-535327f70728	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55df-1d81-4910-facfb0aeaa75	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55df-1d81-c1f7-687584cf4e82	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55df-1d81-cbba-b9b8d17c06e8	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55df-1d81-d21d-746f2ebb7f3d	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55df-1d81-0682-22360ef5c238	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55df-1d81-1060-e0e6a0547a95	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55df-1d81-8c9f-5c5d728d1b9a	SM	SMR	674	San Marino 	San Marino	\N
00040000-55df-1d81-47ac-6491edae0c70	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55df-1d81-68a0-49440af53b97	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55df-1d81-5e05-fc0c1d4c1866	SN	SEN	686	Senegal 	Senegal	\N
00040000-55df-1d81-ff8e-9f41d7e3c574	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55df-1d81-56c7-813e894d23f5	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55df-1d81-cf7a-e02d9fd35872	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55df-1d81-4d31-5e90f921ab6c	SG	SGP	702	Singapore 	Singapur	\N
00040000-55df-1d81-1252-22929513fe36	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55df-1d81-feea-736ded534c6f	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55df-1d81-dd06-f3c62bad5f1f	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55df-1d81-6b6d-8c9b89787242	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55df-1d81-1f1b-e314bfeb8eab	SO	SOM	706	Somalia 	Somalija	\N
00040000-55df-1d81-07ab-543c774647ca	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55df-1d81-5543-c093dca625b7	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55df-1d81-fda4-13b89843f7a9	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55df-1d81-0ce7-608570b3c8c1	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55df-1d81-711d-dca8bddd0aa8	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55df-1d81-4394-05925b007344	SD	SDN	729	Sudan 	Sudan	\N
00040000-55df-1d81-1f02-c175bb400693	SR	SUR	740	Suriname 	Surinam	\N
00040000-55df-1d81-a4c1-21fcad09e26b	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55df-1d81-d77a-a3b60398c57f	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55df-1d81-079d-aad44285cc9d	SE	SWE	752	Sweden 	Švedska	\N
00040000-55df-1d81-d03b-221f2a2b0629	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55df-1d81-106d-1b43ec1b1192	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55df-1d81-8996-f44f10ea42cf	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55df-1d81-1fbb-27a73f15524e	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55df-1d81-3165-f6f674048f50	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55df-1d81-e917-1bb37ff48500	TH	THA	764	Thailand 	Tajska	\N
00040000-55df-1d81-01a6-4c28da2333e7	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55df-1d81-cf50-21b23c90403c	TG	TGO	768	Togo 	Togo	\N
00040000-55df-1d81-53d0-1ef850f62952	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55df-1d81-9862-30a8af573b62	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55df-1d81-f14e-5666a1db76d2	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55df-1d81-5a7b-a61013f4b8e8	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55df-1d81-705a-8b8eecea20cd	TR	TUR	792	Turkey 	Turčija	\N
00040000-55df-1d81-2d3e-ce4156756ed1	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55df-1d81-6b9b-5d5e61db3bd1	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55df-1d81-4854-a8aad3dc1301	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55df-1d81-e288-5afbfe071897	UG	UGA	800	Uganda 	Uganda	\N
00040000-55df-1d81-253f-23d33eccfc07	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55df-1d81-3e9e-243de155ee28	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55df-1d81-8ccf-00d03e2a35b5	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55df-1d81-d4d7-bc17633378ff	US	USA	840	United States 	Združene države Amerike	\N
00040000-55df-1d81-6d90-6b9757b6abff	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55df-1d81-cb77-15fe93e0782a	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55df-1d81-8ced-38e6319f46f6	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55df-1d81-d34c-ed3b688dbc94	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55df-1d81-bf1e-7dc41ab89ed1	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55df-1d81-f1f7-9cb5b1ba41db	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55df-1d81-887b-8cb9f9405f58	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55df-1d81-34f1-463b17dbe5e7	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55df-1d81-08de-58e55d9ccf22	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55df-1d81-8c08-255e8817aad2	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55df-1d81-a46c-2e7e04fd0595	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55df-1d81-0e00-0c2b1e054eb9	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55df-1d81-8c62-af220f16b307	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2958 (class 0 OID 15946389)
-- Dependencies: 224
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55df-1d82-972a-b8bb055d429c	000e0000-55df-1d82-d88d-76f06f5e0d1b	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55df-1d80-87e1-81cb98dba3fd	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55df-1d83-944e-cec2fac68e44	000e0000-55df-1d82-6eff-9bcf795305fb	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55df-1d80-86e8-ac8953c20d5c	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55df-1d83-3bfd-75e7946d3b96	000e0000-55df-1d82-08a1-be2d6f5f8828	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55df-1d80-87e1-81cb98dba3fd	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55df-1d83-198d-17d62b70af77	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55df-1d83-2e49-e85c6a6f951d	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2944 (class 0 OID 15946204)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55df-1d82-7911-1f3506b40ac4	000e0000-55df-1d82-6eff-9bcf795305fb	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55df-1d80-7354-f1a8babc06ee
000d0000-55df-1d82-8dde-b989f9c4a9c9	000e0000-55df-1d82-6eff-9bcf795305fb	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55df-1d80-7354-f1a8babc06ee
000d0000-55df-1d82-2447-7bb0dda66b69	000e0000-55df-1d82-6eff-9bcf795305fb	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55df-1d80-ac39-ecd5928d7d65
000d0000-55df-1d82-df35-b5c55f0ca74b	000e0000-55df-1d82-6eff-9bcf795305fb	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55df-1d80-db2e-e416ec38eaca
000d0000-55df-1d82-a717-16bcd0eaaec4	000e0000-55df-1d82-6eff-9bcf795305fb	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55df-1d80-6b3b-4d3caf2cbab5
000d0000-55df-1d82-bf26-be293a8d8947	000e0000-55df-1d82-6eff-9bcf795305fb	\N	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55df-1d80-6b3b-4d3caf2cbab5
000d0000-55df-1d82-ccfa-e7425793b339	000e0000-55df-1d82-6eff-9bcf795305fb	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55df-1d80-7354-f1a8babc06ee
000d0000-55df-1d82-093d-140f08f354db	000e0000-55df-1d82-6eff-9bcf795305fb	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55df-1d80-9f26-74746774f618
\.


--
-- TOC entry 2923 (class 0 OID 15946018)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 15946066)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2921 (class 0 OID 15945998)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55df-1d82-c5c3-938b80d7cbf1	00080000-55df-1d82-0662-64cc2d19f13e	00090000-55df-1d82-abcf-cd4031feb6eb	AK		
\.


--
-- TOC entry 2933 (class 0 OID 15946119)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 15946606)
-- Dependencies: 237
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 15946618)
-- Dependencies: 238
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 15946640)
-- Dependencies: 240
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 15946144)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2918 (class 0 OID 15945955)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55df-1d81-42bd-2f7402035a6f	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55df-1d81-6670-f7e79567550a	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55df-1d81-4c8c-52d2e93ddb2a	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55df-1d81-e48a-a85b5301c32b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55df-1d81-bec2-5828ff906ea4	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55df-1d81-3253-b1670b45a078	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55df-1d81-77fd-f49764d35d99	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55df-1d81-7b03-96594bb09c80	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55df-1d81-ee62-f6e452867153	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55df-1d81-158b-77bbb7b0d7fa	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55df-1d81-110c-dc28fc5b48ea	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55df-1d81-d9a1-ac22d0108cc3	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55df-1d81-af45-a45554be08a8	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55df-1d82-10a3-3744cceea0a3	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55df-1d82-66df-536558da5f28	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55df-1d82-9525-eba63bdca7e6	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55df-1d82-2707-5935647d20cd	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55df-1d82-af03-28f31e933f95	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55df-1d83-6696-3d17f2fc0838	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2912 (class 0 OID 15945869)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55df-1d82-43f4-c6916642bc8d	00000000-55df-1d82-10a3-3744cceea0a3	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55df-1d82-3c03-e8b9a8acc01e	00000000-55df-1d82-10a3-3744cceea0a3	00010000-55df-1d81-2294-70f1971ca24c	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55df-1d82-1f66-51cd972a0d61	00000000-55df-1d82-66df-536558da5f28	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2913 (class 0 OID 15945880)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55df-1d82-5651-c21a2a66c767	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55df-1d82-1ac4-7a40199ec52a	00010000-55df-1d82-811b-b5d2f729e6f2	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55df-1d82-b95c-ac400b698d08	00010000-55df-1d82-fbf7-f3071b947938	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55df-1d82-146a-54087b383f84	00010000-55df-1d82-78ff-4b39b7e16d6c	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55df-1d82-412d-26969edbb438	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55df-1d82-4743-b40e555d031b	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55df-1d82-d3dd-2a7a02961f33	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55df-1d82-2acd-9d6657e42930	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55df-1d82-abcf-cd4031feb6eb	00010000-55df-1d82-35c6-6338464f95b0	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55df-1d82-5acb-b82678b39f8a	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55df-1d82-0cf5-fdf8fc7968d1	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55df-1d82-091b-2481b738299d	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55df-1d82-3fae-3574456ca643	00010000-55df-1d82-a905-874755f4d91c	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2908 (class 0 OID 15945834)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55df-1d81-eca7-eae895d6634d	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55df-1d81-acb1-702d187f75f7	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55df-1d81-3b1c-fe0a940d3784	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55df-1d81-acf7-49ff193fb524	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55df-1d81-6894-ebb75931f8f0	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55df-1d81-0629-0a9da12ec03b	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55df-1d81-fbe5-fb183f459074	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55df-1d81-efd2-516f2d88144e	Abonma-read	Abonma - branje	f
00030000-55df-1d81-0103-2d359ab8a903	Abonma-write	Abonma - spreminjanje	f
00030000-55df-1d81-dd97-ef7504a2284f	Alternacija-read	Alternacija - branje	f
00030000-55df-1d81-e2fc-afd18b721556	Alternacija-write	Alternacija - spreminjanje	f
00030000-55df-1d81-9f4b-6f0c1cb01cb0	Arhivalija-read	Arhivalija - branje	f
00030000-55df-1d81-51fc-e71d65fdd452	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55df-1d81-a4b8-585f7a731e7f	Besedilo-read	Besedilo - branje	f
00030000-55df-1d81-987c-93cfe9c8ae12	Besedilo-write	Besedilo - spreminjanje	f
00030000-55df-1d81-5a7f-56f9643b182b	DogodekIzven-read	DogodekIzven - branje	f
00030000-55df-1d81-1533-0ee0dcd0cb2a	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55df-1d81-c1fe-bfc18f402389	Dogodek-read	Dogodek - branje	f
00030000-55df-1d81-4e0b-8eba5ed92af2	Dogodek-write	Dogodek - spreminjanje	f
00030000-55df-1d81-e87b-0c421c34cbe1	DrugiVir-read	DrugiVir - branje	f
00030000-55df-1d81-36c4-8f58fbe2c90e	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55df-1d81-10eb-0b9b3896838b	Drzava-read	Drzava - branje	f
00030000-55df-1d81-ae9c-8fd356b4c059	Drzava-write	Drzava - spreminjanje	f
00030000-55df-1d81-b004-69c9f568855b	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55df-1d81-f2a5-a79192371462	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55df-1d81-a4d8-3e6868f45bbb	Funkcija-read	Funkcija - branje	f
00030000-55df-1d81-a4c1-8f25a17c2208	Funkcija-write	Funkcija - spreminjanje	f
00030000-55df-1d81-398a-97d80cd21552	Gostovanje-read	Gostovanje - branje	f
00030000-55df-1d81-8556-2e7d8ada53f8	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55df-1d81-d047-bbd62643b8c0	Gostujoca-read	Gostujoca - branje	f
00030000-55df-1d81-7c6b-cefed0f96cbd	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55df-1d81-4156-85eb8c069317	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55df-1d81-09d3-54c8d3c44f0f	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55df-1d81-dfe2-80ea447b0e15	Kupec-read	Kupec - branje	f
00030000-55df-1d81-50e2-044f35779497	Kupec-write	Kupec - spreminjanje	f
00030000-55df-1d81-1e66-815d6ba36072	NacinPlacina-read	NacinPlacina - branje	f
00030000-55df-1d81-13a4-4d01a720cd8c	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55df-1d81-183e-9a29f852aa51	Option-read	Option - branje	f
00030000-55df-1d81-2107-35d9d0b9670f	Option-write	Option - spreminjanje	f
00030000-55df-1d81-abc8-46a55952da03	OptionValue-read	OptionValue - branje	f
00030000-55df-1d81-5528-a306067e1c54	OptionValue-write	OptionValue - spreminjanje	f
00030000-55df-1d81-9d73-e93922379960	Oseba-read	Oseba - branje	f
00030000-55df-1d81-3027-f0931e006d0c	Oseba-write	Oseba - spreminjanje	f
00030000-55df-1d81-9939-a3c58219251c	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55df-1d81-fa6b-53d1067ca5ce	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55df-1d81-89d9-9307bfe439a4	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55df-1d81-e2f9-b1afb5ed64d4	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55df-1d81-9563-ed41ae469a06	Pogodba-read	Pogodba - branje	f
00030000-55df-1d81-ca4b-9bdc2631b24d	Pogodba-write	Pogodba - spreminjanje	f
00030000-55df-1d81-94c4-4951e95ba1fa	Popa-read	Popa - branje	f
00030000-55df-1d81-6f39-e018315111e8	Popa-write	Popa - spreminjanje	f
00030000-55df-1d81-ddca-7762831ac321	Posta-read	Posta - branje	f
00030000-55df-1d81-b729-87cf9bd410c7	Posta-write	Posta - spreminjanje	f
00030000-55df-1d81-27e6-a605abfb94cc	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55df-1d81-4922-8f543fc4257a	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55df-1d81-1725-4cdaddf988df	PostniNaslov-read	PostniNaslov - branje	f
00030000-55df-1d81-ed57-247af9080f20	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55df-1d81-c414-c8990553e4d8	Predstava-read	Predstava - branje	f
00030000-55df-1d81-ba4a-e019d890983d	Predstava-write	Predstava - spreminjanje	f
00030000-55df-1d81-ba33-64f1eda0d4c0	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55df-1d81-d17a-0a72311915b5	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55df-1d81-e311-737d006c7882	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55df-1d81-5421-cb817e4aa493	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55df-1d81-5ad1-4dbf813ccfc3	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55df-1d81-3be9-b4ae6f387800	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55df-1d81-686f-5189170e24b2	ProgramDela-read	ProgramDela - branje	f
00030000-55df-1d81-d2b7-16c11211933a	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55df-1d81-ffe9-268517289d62	ProgramFestival-read	ProgramFestival - branje	f
00030000-55df-1d81-9504-a7238aca1136	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55df-1d81-a515-92e8e40bd819	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55df-1d81-7481-63b912218115	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55df-1d81-1709-b61b34f58470	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55df-1d81-f188-78a65d6c0e56	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55df-1d81-ea59-5cddd6fb256a	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55df-1d81-08dc-8a1632324b49	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55df-1d81-1f75-3231b8b266a6	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55df-1d81-3b17-7b48e9343b31	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55df-1d81-b215-66a1b577e6f7	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55df-1d81-5b35-971b43eec9b0	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55df-1d81-a72b-c4a8d529db56	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55df-1d81-ddbe-3072bc6f303f	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55df-1d81-0e85-52e6dd826a8b	ProgramRazno-read	ProgramRazno - branje	f
00030000-55df-1d81-e271-6910e020db9d	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55df-1d81-9c36-e9275e7cd51b	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55df-1d81-bcb9-caac86e95394	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55df-1d81-4fcf-f9aa509d95ae	Prostor-read	Prostor - branje	f
00030000-55df-1d81-1ff2-b2e32aaccdc5	Prostor-write	Prostor - spreminjanje	f
00030000-55df-1d81-da93-2c1dcac888de	Racun-read	Racun - branje	f
00030000-55df-1d81-d0f6-cd105799bbf0	Racun-write	Racun - spreminjanje	f
00030000-55df-1d81-9dfa-e905f8b3e563	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55df-1d81-81e6-76c8d5aea27a	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55df-1d81-5837-ced060092ac2	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55df-1d81-d423-80698555f98a	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55df-1d81-05ae-9125ff4f86b4	Rekvizit-read	Rekvizit - branje	f
00030000-55df-1d81-90ca-b144c560770f	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55df-1d81-7b07-f35fb6a71a11	Revizija-read	Revizija - branje	f
00030000-55df-1d81-8f0f-e3cfda63b330	Revizija-write	Revizija - spreminjanje	f
00030000-55df-1d81-7d8e-1d18ed7471f4	Rezervacija-read	Rezervacija - branje	f
00030000-55df-1d81-b8b3-944971d1ba14	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55df-1d81-77ba-5213a5763841	SedezniRed-read	SedezniRed - branje	f
00030000-55df-1d81-0e93-6a68cc913019	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55df-1d81-4f43-085209a19e79	Sedez-read	Sedez - branje	f
00030000-55df-1d81-813b-99028468ba5c	Sedez-write	Sedez - spreminjanje	f
00030000-55df-1d81-c861-ded76d6aa43d	Sezona-read	Sezona - branje	f
00030000-55df-1d81-49ec-c63cf06f33f4	Sezona-write	Sezona - spreminjanje	f
00030000-55df-1d81-bb1b-9a4e1a65b641	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55df-1d81-19be-4ac0a95f22e5	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55df-1d81-d9e7-8d45ffab3473	Stevilcenje-read	Stevilcenje - branje	f
00030000-55df-1d81-56f7-9aba9799e6bc	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55df-1d81-6699-2ab036122fc8	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55df-1d81-3f1d-ba410cec1d67	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55df-1d81-5a2d-4811e0b8b868	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55df-1d81-fb07-4721f26aa54f	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55df-1d81-837c-32de37d3e934	Telefonska-read	Telefonska - branje	f
00030000-55df-1d81-5a97-0c33bea23bab	Telefonska-write	Telefonska - spreminjanje	f
00030000-55df-1d81-8633-aa0f6e80cfd2	TerminStoritve-read	TerminStoritve - branje	f
00030000-55df-1d81-10bc-8d578d95e9bd	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55df-1d81-7475-7ff3f72edcda	TipFunkcije-read	TipFunkcije - branje	f
00030000-55df-1d81-0f41-d678c5f5b776	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55df-1d81-80be-086305be8961	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55df-1d81-9b1f-bc9322097c45	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55df-1d81-8c5f-6bc5aa640eb5	Trr-read	Trr - branje	f
00030000-55df-1d81-6bf9-a532140db285	Trr-write	Trr - spreminjanje	f
00030000-55df-1d81-a81c-90e42ee1a502	Uprizoritev-read	Uprizoritev - branje	f
00030000-55df-1d81-10a9-9cb2e78b747c	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55df-1d81-1e6e-0aca9db5494d	Vaja-read	Vaja - branje	f
00030000-55df-1d81-81bd-a4224a437e73	Vaja-write	Vaja - spreminjanje	f
00030000-55df-1d81-e82c-16407a4fd0d6	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55df-1d81-8c2c-a55216541ed5	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55df-1d81-b695-fec2f9967961	VrstaStroska-read	VrstaStroska - branje	f
00030000-55df-1d81-effb-44165b904ae3	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55df-1d81-7db1-87b95d1d9b27	Zaposlitev-read	Zaposlitev - branje	f
00030000-55df-1d81-b159-4313432a2b88	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55df-1d81-fe33-bfc6161f1601	Zasedenost-read	Zasedenost - branje	f
00030000-55df-1d81-9090-f8441aac7355	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55df-1d81-da41-8cf42ccc24a5	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55df-1d81-7854-5eafe85374ad	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55df-1d81-757d-fa575817fc8f	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55df-1d81-ce32-5931b331e248	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55df-1d81-e51a-a3d80b36276c	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55df-1d81-890b-3cb3b80883bd	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55df-1d81-5b05-cfce9f38ed2e	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55df-1d81-9cbf-fb4a96e4a01d	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55df-1d81-d74f-c082d3e7524a	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55df-1d81-02dd-a0c38c5d0b80	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55df-1d81-117f-e17e90d2faa3	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55df-1d81-dcdf-a7cf1442351f	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55df-1d81-6a86-b958ceee1f77	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55df-1d81-c179-2a0198e6d5ea	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55df-1d81-99d7-479a28a0be90	Datoteka-write	Datoteka - spreminjanje	f
00030000-55df-1d81-7ddc-19211e27dc22	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2910 (class 0 OID 15945853)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55df-1d81-025e-74e60d42b0b5	00030000-55df-1d81-acb1-702d187f75f7
00020000-55df-1d81-d527-34bc23813431	00030000-55df-1d81-10eb-0b9b3896838b
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-efd2-516f2d88144e
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-0103-2d359ab8a903
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-dd97-ef7504a2284f
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-e2fc-afd18b721556
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-9f4b-6f0c1cb01cb0
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-c1fe-bfc18f402389
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-acf7-49ff193fb524
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-4e0b-8eba5ed92af2
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-10eb-0b9b3896838b
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-ae9c-8fd356b4c059
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-a4d8-3e6868f45bbb
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-a4c1-8f25a17c2208
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-398a-97d80cd21552
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-8556-2e7d8ada53f8
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-d047-bbd62643b8c0
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-7c6b-cefed0f96cbd
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-4156-85eb8c069317
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-09d3-54c8d3c44f0f
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-183e-9a29f852aa51
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-abc8-46a55952da03
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-9d73-e93922379960
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-3027-f0931e006d0c
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-94c4-4951e95ba1fa
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-6f39-e018315111e8
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-ddca-7762831ac321
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-b729-87cf9bd410c7
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-1725-4cdaddf988df
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-ed57-247af9080f20
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-c414-c8990553e4d8
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-ba4a-e019d890983d
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-5ad1-4dbf813ccfc3
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-3be9-b4ae6f387800
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-4fcf-f9aa509d95ae
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-1ff2-b2e32aaccdc5
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-5837-ced060092ac2
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-d423-80698555f98a
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-05ae-9125ff4f86b4
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-90ca-b144c560770f
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-c861-ded76d6aa43d
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-49ec-c63cf06f33f4
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-7475-7ff3f72edcda
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-a81c-90e42ee1a502
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-10a9-9cb2e78b747c
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-1e6e-0aca9db5494d
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-81bd-a4224a437e73
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-fe33-bfc6161f1601
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-9090-f8441aac7355
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-da41-8cf42ccc24a5
00020000-55df-1d81-44a3-81d087d57692	00030000-55df-1d81-757d-fa575817fc8f
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-efd2-516f2d88144e
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-9f4b-6f0c1cb01cb0
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-c1fe-bfc18f402389
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-10eb-0b9b3896838b
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-398a-97d80cd21552
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-d047-bbd62643b8c0
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-4156-85eb8c069317
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-09d3-54c8d3c44f0f
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-183e-9a29f852aa51
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-abc8-46a55952da03
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-9d73-e93922379960
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-3027-f0931e006d0c
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-94c4-4951e95ba1fa
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-ddca-7762831ac321
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-1725-4cdaddf988df
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-ed57-247af9080f20
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-c414-c8990553e4d8
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-4fcf-f9aa509d95ae
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-5837-ced060092ac2
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-05ae-9125ff4f86b4
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-c861-ded76d6aa43d
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-837c-32de37d3e934
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-5a97-0c33bea23bab
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-8c5f-6bc5aa640eb5
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-6bf9-a532140db285
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-7db1-87b95d1d9b27
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-b159-4313432a2b88
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-da41-8cf42ccc24a5
00020000-55df-1d81-afc4-67e7835499fe	00030000-55df-1d81-757d-fa575817fc8f
00020000-55df-1d81-7376-173da7e28215	00030000-55df-1d81-efd2-516f2d88144e
00020000-55df-1d81-7376-173da7e28215	00030000-55df-1d81-dd97-ef7504a2284f
00020000-55df-1d81-7376-173da7e28215	00030000-55df-1d81-9f4b-6f0c1cb01cb0
00020000-55df-1d81-7376-173da7e28215	00030000-55df-1d81-51fc-e71d65fdd452
00020000-55df-1d81-7376-173da7e28215	00030000-55df-1d81-a4b8-585f7a731e7f
00020000-55df-1d81-7376-173da7e28215	00030000-55df-1d81-5a7f-56f9643b182b
00020000-55df-1d81-7376-173da7e28215	00030000-55df-1d81-c1fe-bfc18f402389
00020000-55df-1d81-7376-173da7e28215	00030000-55df-1d81-10eb-0b9b3896838b
00020000-55df-1d81-7376-173da7e28215	00030000-55df-1d81-a4d8-3e6868f45bbb
00020000-55df-1d81-7376-173da7e28215	00030000-55df-1d81-398a-97d80cd21552
00020000-55df-1d81-7376-173da7e28215	00030000-55df-1d81-d047-bbd62643b8c0
00020000-55df-1d81-7376-173da7e28215	00030000-55df-1d81-4156-85eb8c069317
00020000-55df-1d81-7376-173da7e28215	00030000-55df-1d81-183e-9a29f852aa51
00020000-55df-1d81-7376-173da7e28215	00030000-55df-1d81-abc8-46a55952da03
00020000-55df-1d81-7376-173da7e28215	00030000-55df-1d81-9d73-e93922379960
00020000-55df-1d81-7376-173da7e28215	00030000-55df-1d81-94c4-4951e95ba1fa
00020000-55df-1d81-7376-173da7e28215	00030000-55df-1d81-ddca-7762831ac321
00020000-55df-1d81-7376-173da7e28215	00030000-55df-1d81-c414-c8990553e4d8
00020000-55df-1d81-7376-173da7e28215	00030000-55df-1d81-5ad1-4dbf813ccfc3
00020000-55df-1d81-7376-173da7e28215	00030000-55df-1d81-4fcf-f9aa509d95ae
00020000-55df-1d81-7376-173da7e28215	00030000-55df-1d81-5837-ced060092ac2
00020000-55df-1d81-7376-173da7e28215	00030000-55df-1d81-05ae-9125ff4f86b4
00020000-55df-1d81-7376-173da7e28215	00030000-55df-1d81-c861-ded76d6aa43d
00020000-55df-1d81-7376-173da7e28215	00030000-55df-1d81-7475-7ff3f72edcda
00020000-55df-1d81-7376-173da7e28215	00030000-55df-1d81-1e6e-0aca9db5494d
00020000-55df-1d81-7376-173da7e28215	00030000-55df-1d81-fe33-bfc6161f1601
00020000-55df-1d81-7376-173da7e28215	00030000-55df-1d81-da41-8cf42ccc24a5
00020000-55df-1d81-7376-173da7e28215	00030000-55df-1d81-757d-fa575817fc8f
00020000-55df-1d81-25a3-46f55d15fcc7	00030000-55df-1d81-efd2-516f2d88144e
00020000-55df-1d81-25a3-46f55d15fcc7	00030000-55df-1d81-0103-2d359ab8a903
00020000-55df-1d81-25a3-46f55d15fcc7	00030000-55df-1d81-e2fc-afd18b721556
00020000-55df-1d81-25a3-46f55d15fcc7	00030000-55df-1d81-9f4b-6f0c1cb01cb0
00020000-55df-1d81-25a3-46f55d15fcc7	00030000-55df-1d81-c1fe-bfc18f402389
00020000-55df-1d81-25a3-46f55d15fcc7	00030000-55df-1d81-10eb-0b9b3896838b
00020000-55df-1d81-25a3-46f55d15fcc7	00030000-55df-1d81-398a-97d80cd21552
00020000-55df-1d81-25a3-46f55d15fcc7	00030000-55df-1d81-d047-bbd62643b8c0
00020000-55df-1d81-25a3-46f55d15fcc7	00030000-55df-1d81-183e-9a29f852aa51
00020000-55df-1d81-25a3-46f55d15fcc7	00030000-55df-1d81-abc8-46a55952da03
00020000-55df-1d81-25a3-46f55d15fcc7	00030000-55df-1d81-94c4-4951e95ba1fa
00020000-55df-1d81-25a3-46f55d15fcc7	00030000-55df-1d81-ddca-7762831ac321
00020000-55df-1d81-25a3-46f55d15fcc7	00030000-55df-1d81-c414-c8990553e4d8
00020000-55df-1d81-25a3-46f55d15fcc7	00030000-55df-1d81-4fcf-f9aa509d95ae
00020000-55df-1d81-25a3-46f55d15fcc7	00030000-55df-1d81-5837-ced060092ac2
00020000-55df-1d81-25a3-46f55d15fcc7	00030000-55df-1d81-05ae-9125ff4f86b4
00020000-55df-1d81-25a3-46f55d15fcc7	00030000-55df-1d81-c861-ded76d6aa43d
00020000-55df-1d81-25a3-46f55d15fcc7	00030000-55df-1d81-7475-7ff3f72edcda
00020000-55df-1d81-25a3-46f55d15fcc7	00030000-55df-1d81-da41-8cf42ccc24a5
00020000-55df-1d81-25a3-46f55d15fcc7	00030000-55df-1d81-757d-fa575817fc8f
00020000-55df-1d81-e282-fc914629c94a	00030000-55df-1d81-efd2-516f2d88144e
00020000-55df-1d81-e282-fc914629c94a	00030000-55df-1d81-9f4b-6f0c1cb01cb0
00020000-55df-1d81-e282-fc914629c94a	00030000-55df-1d81-c1fe-bfc18f402389
00020000-55df-1d81-e282-fc914629c94a	00030000-55df-1d81-10eb-0b9b3896838b
00020000-55df-1d81-e282-fc914629c94a	00030000-55df-1d81-398a-97d80cd21552
00020000-55df-1d81-e282-fc914629c94a	00030000-55df-1d81-d047-bbd62643b8c0
00020000-55df-1d81-e282-fc914629c94a	00030000-55df-1d81-183e-9a29f852aa51
00020000-55df-1d81-e282-fc914629c94a	00030000-55df-1d81-abc8-46a55952da03
00020000-55df-1d81-e282-fc914629c94a	00030000-55df-1d81-94c4-4951e95ba1fa
00020000-55df-1d81-e282-fc914629c94a	00030000-55df-1d81-ddca-7762831ac321
00020000-55df-1d81-e282-fc914629c94a	00030000-55df-1d81-c414-c8990553e4d8
00020000-55df-1d81-e282-fc914629c94a	00030000-55df-1d81-4fcf-f9aa509d95ae
00020000-55df-1d81-e282-fc914629c94a	00030000-55df-1d81-5837-ced060092ac2
00020000-55df-1d81-e282-fc914629c94a	00030000-55df-1d81-05ae-9125ff4f86b4
00020000-55df-1d81-e282-fc914629c94a	00030000-55df-1d81-c861-ded76d6aa43d
00020000-55df-1d81-e282-fc914629c94a	00030000-55df-1d81-8633-aa0f6e80cfd2
00020000-55df-1d81-e282-fc914629c94a	00030000-55df-1d81-3b1c-fe0a940d3784
00020000-55df-1d81-e282-fc914629c94a	00030000-55df-1d81-7475-7ff3f72edcda
00020000-55df-1d81-e282-fc914629c94a	00030000-55df-1d81-da41-8cf42ccc24a5
00020000-55df-1d81-e282-fc914629c94a	00030000-55df-1d81-757d-fa575817fc8f
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-eca7-eae895d6634d
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-acb1-702d187f75f7
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-3b1c-fe0a940d3784
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-acf7-49ff193fb524
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-6894-ebb75931f8f0
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-0629-0a9da12ec03b
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-fbe5-fb183f459074
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-efd2-516f2d88144e
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-0103-2d359ab8a903
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-dd97-ef7504a2284f
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-e2fc-afd18b721556
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-9f4b-6f0c1cb01cb0
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-51fc-e71d65fdd452
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-a4b8-585f7a731e7f
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-987c-93cfe9c8ae12
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-5a7f-56f9643b182b
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-1533-0ee0dcd0cb2a
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-c1fe-bfc18f402389
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-4e0b-8eba5ed92af2
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-10eb-0b9b3896838b
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-ae9c-8fd356b4c059
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-e87b-0c421c34cbe1
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-36c4-8f58fbe2c90e
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-b004-69c9f568855b
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-f2a5-a79192371462
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-a4d8-3e6868f45bbb
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-a4c1-8f25a17c2208
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-398a-97d80cd21552
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-8556-2e7d8ada53f8
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-d047-bbd62643b8c0
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-7c6b-cefed0f96cbd
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-4156-85eb8c069317
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-09d3-54c8d3c44f0f
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-dfe2-80ea447b0e15
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-50e2-044f35779497
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-1e66-815d6ba36072
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-13a4-4d01a720cd8c
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-183e-9a29f852aa51
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-2107-35d9d0b9670f
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-abc8-46a55952da03
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-5528-a306067e1c54
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-9d73-e93922379960
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-3027-f0931e006d0c
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-9939-a3c58219251c
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-fa6b-53d1067ca5ce
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-89d9-9307bfe439a4
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-e2f9-b1afb5ed64d4
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-9563-ed41ae469a06
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-ca4b-9bdc2631b24d
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-94c4-4951e95ba1fa
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-6f39-e018315111e8
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-ddca-7762831ac321
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-b729-87cf9bd410c7
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-27e6-a605abfb94cc
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-4922-8f543fc4257a
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-1725-4cdaddf988df
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-ed57-247af9080f20
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-c414-c8990553e4d8
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-ba4a-e019d890983d
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-ba33-64f1eda0d4c0
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-d17a-0a72311915b5
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-e311-737d006c7882
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-5421-cb817e4aa493
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-5ad1-4dbf813ccfc3
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-3be9-b4ae6f387800
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-686f-5189170e24b2
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-d2b7-16c11211933a
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-ffe9-268517289d62
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-9504-a7238aca1136
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-a515-92e8e40bd819
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-7481-63b912218115
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-1709-b61b34f58470
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-f188-78a65d6c0e56
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-ea59-5cddd6fb256a
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-08dc-8a1632324b49
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-1f75-3231b8b266a6
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-3b17-7b48e9343b31
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-b215-66a1b577e6f7
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-5b35-971b43eec9b0
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-a72b-c4a8d529db56
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-ddbe-3072bc6f303f
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-0e85-52e6dd826a8b
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-e271-6910e020db9d
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-9c36-e9275e7cd51b
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-bcb9-caac86e95394
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-4fcf-f9aa509d95ae
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-1ff2-b2e32aaccdc5
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-da93-2c1dcac888de
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-d0f6-cd105799bbf0
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-9dfa-e905f8b3e563
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-81e6-76c8d5aea27a
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-5837-ced060092ac2
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-d423-80698555f98a
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-05ae-9125ff4f86b4
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-90ca-b144c560770f
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-7b07-f35fb6a71a11
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-8f0f-e3cfda63b330
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-7d8e-1d18ed7471f4
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-b8b3-944971d1ba14
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-77ba-5213a5763841
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-0e93-6a68cc913019
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-4f43-085209a19e79
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-813b-99028468ba5c
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-c861-ded76d6aa43d
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-49ec-c63cf06f33f4
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-bb1b-9a4e1a65b641
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-19be-4ac0a95f22e5
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-d9e7-8d45ffab3473
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-56f7-9aba9799e6bc
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-6699-2ab036122fc8
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-3f1d-ba410cec1d67
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-5a2d-4811e0b8b868
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-fb07-4721f26aa54f
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-837c-32de37d3e934
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-5a97-0c33bea23bab
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-8633-aa0f6e80cfd2
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-10bc-8d578d95e9bd
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-7475-7ff3f72edcda
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-0f41-d678c5f5b776
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-80be-086305be8961
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-9b1f-bc9322097c45
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-8c5f-6bc5aa640eb5
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-6bf9-a532140db285
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-a81c-90e42ee1a502
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-10a9-9cb2e78b747c
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-1e6e-0aca9db5494d
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-81bd-a4224a437e73
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-e82c-16407a4fd0d6
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-8c2c-a55216541ed5
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-7db1-87b95d1d9b27
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-b159-4313432a2b88
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-fe33-bfc6161f1601
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-9090-f8441aac7355
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-da41-8cf42ccc24a5
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-7854-5eafe85374ad
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-757d-fa575817fc8f
00020000-55df-1d82-fe1c-26ab46cab49b	00030000-55df-1d81-ce32-5931b331e248
\.


--
-- TOC entry 2938 (class 0 OID 15946151)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2942 (class 0 OID 15946184)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 15946308)
-- Dependencies: 219
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55df-1d82-bb9a-12b3c75631e5	00090000-55df-1d82-5651-c21a2a66c767	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55df-1d82-f5f3-0ac099af294d	00090000-55df-1d82-4743-b40e555d031b	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55df-1d82-ac07-6f559e5a0dcb	00090000-55df-1d82-3fae-3574456ca643	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2915 (class 0 OID 15945913)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55df-1d82-0662-64cc2d19f13e	00040000-55df-1d81-dd06-f3c62bad5f1f	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55df-1d82-4b84-cf6fdb4a1168	00040000-55df-1d81-dd06-f3c62bad5f1f	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55df-1d82-36cb-8d172f969634	00040000-55df-1d81-dd06-f3c62bad5f1f	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55df-1d82-59cc-4a8a8c83f107	00040000-55df-1d81-dd06-f3c62bad5f1f	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55df-1d82-18e6-273bfa34413b	00040000-55df-1d81-dd06-f3c62bad5f1f	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55df-1d82-de8b-be2023a3b140	00040000-55df-1d81-19f4-5ef02882b060	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55df-1d82-a914-f20830105bc2	00040000-55df-1d81-a3c7-bb6d9ecf5428	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55df-1d82-ad6c-a50340dfb953	00040000-55df-1d81-2007-b1837a5e8117	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55df-1d83-584c-667fa1726b05	00040000-55df-1d81-dd06-f3c62bad5f1f	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2917 (class 0 OID 15945947)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55df-1d80-248e-417a40a7e857	8341	Adlešiči
00050000-55df-1d80-5e15-edc17e77483e	5270	Ajdovščina
00050000-55df-1d80-87b6-9c39f22e0ebf	6280	Ankaran/Ancarano
00050000-55df-1d80-7d14-e32385d8b2cf	9253	Apače
00050000-55df-1d80-cda5-00452d639594	8253	Artiče
00050000-55df-1d80-93f0-da935d6d5e1a	4275	Begunje na Gorenjskem
00050000-55df-1d80-d5d8-b12a47b578c3	1382	Begunje pri Cerknici
00050000-55df-1d80-1b17-0b486ec7f13f	9231	Beltinci
00050000-55df-1d80-f8ce-cd410fddb979	2234	Benedikt
00050000-55df-1d80-85ab-6bf8e5d16482	2345	Bistrica ob Dravi
00050000-55df-1d80-789b-ddf657fe4bb2	3256	Bistrica ob Sotli
00050000-55df-1d80-f800-9fca9adf7be8	8259	Bizeljsko
00050000-55df-1d80-1164-4438298d7c61	1223	Blagovica
00050000-55df-1d80-353b-87898894a3ca	8283	Blanca
00050000-55df-1d80-5a4d-3e0a83ffcc0b	4260	Bled
00050000-55df-1d80-5503-1892ca79703d	4273	Blejska Dobrava
00050000-55df-1d80-361b-3f056b53fd4b	9265	Bodonci
00050000-55df-1d80-2ea2-4455f377b135	9222	Bogojina
00050000-55df-1d80-a532-3a3f73cb93bc	4263	Bohinjska Bela
00050000-55df-1d80-790c-8ddcb2e4d7f8	4264	Bohinjska Bistrica
00050000-55df-1d80-78cf-664f6b42c10f	4265	Bohinjsko jezero
00050000-55df-1d80-fec7-54c90efcda26	1353	Borovnica
00050000-55df-1d80-a29e-2a0d1d655c7f	8294	Boštanj
00050000-55df-1d80-1bae-96d4742526e9	5230	Bovec
00050000-55df-1d80-12fd-0282500bb30f	5295	Branik
00050000-55df-1d80-363e-5c80f4e58cab	3314	Braslovče
00050000-55df-1d80-b14f-82b820c237bc	5223	Breginj
00050000-55df-1d80-1b53-8038c6087036	8280	Brestanica
00050000-55df-1d80-90bf-e3ac8442bc5b	2354	Bresternica
00050000-55df-1d80-e12b-7ad8fad531e6	4243	Brezje
00050000-55df-1d80-3c3a-2e3a9f2831c4	1351	Brezovica pri Ljubljani
00050000-55df-1d80-6bc7-71af714f30c2	8250	Brežice
00050000-55df-1d80-f5d9-6d4bc5b1b0c2	4210	Brnik - Aerodrom
00050000-55df-1d80-ab92-e6cc6a479734	8321	Brusnice
00050000-55df-1d80-0103-563424c0569e	3255	Buče
00050000-55df-1d80-6057-d8c60865633d	8276	Bučka 
00050000-55df-1d80-c10b-a26080d3f414	9261	Cankova
00050000-55df-1d80-3ba1-690c4448775b	3000	Celje 
00050000-55df-1d80-c2a9-451ee422f6da	3001	Celje - poštni predali
00050000-55df-1d80-af0b-f83f1eee38d0	4207	Cerklje na Gorenjskem
00050000-55df-1d80-f3ba-ad1961682a90	8263	Cerklje ob Krki
00050000-55df-1d80-a719-8532a7f4fd16	1380	Cerknica
00050000-55df-1d80-d2f6-3cf95d6cf966	5282	Cerkno
00050000-55df-1d80-4d94-1b7e7d142b7d	2236	Cerkvenjak
00050000-55df-1d80-604d-74cfd9df8fe8	2215	Ceršak
00050000-55df-1d80-2173-dbf902dd1aba	2326	Cirkovce
00050000-55df-1d80-cc42-1c0722d67fa1	2282	Cirkulane
00050000-55df-1d80-989c-0543e5a6d2fd	5273	Col
00050000-55df-1d80-217c-6afc63ee6f93	8251	Čatež ob Savi
00050000-55df-1d80-4f8c-47e2766226ad	1413	Čemšenik
00050000-55df-1d80-fb5f-0505cea7cd79	5253	Čepovan
00050000-55df-1d80-e24e-23e314cd78ab	9232	Črenšovci
00050000-55df-1d80-b8f1-b374cb7621c2	2393	Črna na Koroškem
00050000-55df-1d80-52ae-7b326e36372d	6275	Črni Kal
00050000-55df-1d80-7ad9-ad7791af6ae1	5274	Črni Vrh nad Idrijo
00050000-55df-1d80-01cd-f5fafac06de3	5262	Črniče
00050000-55df-1d80-d9a6-0faa547e492c	8340	Črnomelj
00050000-55df-1d80-7fbc-7eff1123e850	6271	Dekani
00050000-55df-1d80-655a-48aee21e0075	5210	Deskle
00050000-55df-1d80-1971-67e09647e1cf	2253	Destrnik
00050000-55df-1d80-63c3-9a5fbb4af664	6215	Divača
00050000-55df-1d80-ce33-cfbb67d268a9	1233	Dob
00050000-55df-1d80-b5b2-ae473b2233b3	3224	Dobje pri Planini
00050000-55df-1d80-0ef3-3664a0cae50c	8257	Dobova
00050000-55df-1d80-a3cf-c393d7ff9a25	1423	Dobovec
00050000-55df-1d80-0740-6b492165ca25	5263	Dobravlje
00050000-55df-1d80-dd99-ad4f723264fb	3204	Dobrna
00050000-55df-1d80-2521-67247f495b77	8211	Dobrnič
00050000-55df-1d80-8a28-ac7b0433fbdf	1356	Dobrova
00050000-55df-1d80-c4ff-7366cb745513	9223	Dobrovnik/Dobronak 
00050000-55df-1d80-3219-62963964959f	5212	Dobrovo v Brdih
00050000-55df-1d80-2fe1-37edb5fc9f24	1431	Dol pri Hrastniku
00050000-55df-1d80-a69f-06689132845e	1262	Dol pri Ljubljani
00050000-55df-1d80-41b8-23b7410c7b36	1273	Dole pri Litiji
00050000-55df-1d80-c357-5a04ac21ef9e	1331	Dolenja vas
00050000-55df-1d80-423d-6a44ad62abe7	8350	Dolenjske Toplice
00050000-55df-1d80-729f-0c638f8669b3	1230	Domžale
00050000-55df-1d80-78c0-6f3a3841df9e	2252	Dornava
00050000-55df-1d80-577b-d4a65a86561d	5294	Dornberk
00050000-55df-1d80-c797-330a845fa9d2	1319	Draga
00050000-55df-1d80-2970-c694f30becfa	8343	Dragatuš
00050000-55df-1d80-c2a4-b0092fab587d	3222	Dramlje
00050000-55df-1d80-9a4b-5924986a2c4b	2370	Dravograd
00050000-55df-1d80-c4c3-88caccc1858b	4203	Duplje
00050000-55df-1d80-e44f-0c7c8c111a46	6221	Dutovlje
00050000-55df-1d80-3bd2-91c3353d6b8a	8361	Dvor
00050000-55df-1d80-253e-c00274d95b79	2343	Fala
00050000-55df-1d80-a5a7-69ccd9fbd84f	9208	Fokovci
00050000-55df-1d80-8106-99dc929080fa	2313	Fram
00050000-55df-1d80-cbb6-5d24d0007f00	3213	Frankolovo
00050000-55df-1d80-82bf-00861de8fd71	1274	Gabrovka
00050000-55df-1d80-71e4-69cc1fb6ed11	8254	Globoko
00050000-55df-1d80-d7db-36381797b7c6	5275	Godovič
00050000-55df-1d80-be41-381464b22f32	4204	Golnik
00050000-55df-1d80-730e-214f19d336d4	3303	Gomilsko
00050000-55df-1d80-cda6-951338534c30	4224	Gorenja vas
00050000-55df-1d80-7f75-74a926e1f9ea	3263	Gorica pri Slivnici
00050000-55df-1d80-f155-11d195d8f962	2272	Gorišnica
00050000-55df-1d80-f398-f6f51fc7b662	9250	Gornja Radgona
00050000-55df-1d80-cdce-deef89848b65	3342	Gornji Grad
00050000-55df-1d80-ea8b-ccd1a31a1028	4282	Gozd Martuljek
00050000-55df-1d80-d5af-91a5eaaa69e9	6272	Gračišče
00050000-55df-1d80-11a9-ea666816ac86	9264	Grad
00050000-55df-1d80-2794-f05fc1c3c134	8332	Gradac
00050000-55df-1d80-3803-cc15af2c2f66	1384	Grahovo
00050000-55df-1d80-6f2d-5a989d4b387a	5242	Grahovo ob Bači
00050000-55df-1d80-5767-48f282ca2cc6	5251	Grgar
00050000-55df-1d80-6eaa-40ca1503a126	3302	Griže
00050000-55df-1d80-72b9-c43b02245ee6	3231	Grobelno
00050000-55df-1d80-292b-5abbf8c992de	1290	Grosuplje
00050000-55df-1d80-5c4e-505cc415ce59	2288	Hajdina
00050000-55df-1d80-04d3-d25d8ff3bb62	8362	Hinje
00050000-55df-1d80-2aa8-15a888215a11	2311	Hoče
00050000-55df-1d80-58d7-d7086ea0960f	9205	Hodoš/Hodos
00050000-55df-1d80-0f16-3014ecaaea64	1354	Horjul
00050000-55df-1d80-be3c-09431cdf49ec	1372	Hotedršica
00050000-55df-1d80-4122-631900930f2e	1430	Hrastnik
00050000-55df-1d80-8963-17486d158f9e	6225	Hruševje
00050000-55df-1d80-bb68-d3e72777206a	4276	Hrušica
00050000-55df-1d80-f04e-6599f262b1f1	5280	Idrija
00050000-55df-1d80-23d0-fe3f7fb0e0ad	1292	Ig
00050000-55df-1d80-2604-85fc46c97a6f	6250	Ilirska Bistrica
00050000-55df-1d80-fea1-cd192a7ffee1	6251	Ilirska Bistrica-Trnovo
00050000-55df-1d80-52b5-b2b8186e53cf	1295	Ivančna Gorica
00050000-55df-1d80-2193-71d58b6c8439	2259	Ivanjkovci
00050000-55df-1d80-a2c1-34534a65cefc	1411	Izlake
00050000-55df-1d80-9c41-a4eeacbf0945	6310	Izola/Isola
00050000-55df-1d80-dafa-5251e8ca39bd	2222	Jakobski Dol
00050000-55df-1d80-0491-a7ef63124d20	2221	Jarenina
00050000-55df-1d80-1a8a-5e6f83317ec4	6254	Jelšane
00050000-55df-1d80-e789-579901b50946	4270	Jesenice
00050000-55df-1d80-6131-3fc90c4b475e	8261	Jesenice na Dolenjskem
00050000-55df-1d80-ce4c-290a0b904bb9	3273	Jurklošter
00050000-55df-1d80-e039-a27f739b0976	2223	Jurovski Dol
00050000-55df-1d80-288e-694f49e8a634	2256	Juršinci
00050000-55df-1d80-70e6-0e007154855e	5214	Kal nad Kanalom
00050000-55df-1d80-f3d1-9c2692b73802	3233	Kalobje
00050000-55df-1d80-4149-32b13a94e54a	4246	Kamna Gorica
00050000-55df-1d80-d3a5-391e2255b673	2351	Kamnica
00050000-55df-1d80-ace0-52b3ee695448	1241	Kamnik
00050000-55df-1d80-3aa4-3b1ff6728337	5213	Kanal
00050000-55df-1d80-55dc-9c420d702139	8258	Kapele
00050000-55df-1d80-3b1b-ebc316a9e233	2362	Kapla
00050000-55df-1d80-70ee-718dfdc558c7	2325	Kidričevo
00050000-55df-1d80-fd21-b36317d854f5	1412	Kisovec
00050000-55df-1d80-8cf5-7c85faab491f	6253	Knežak
00050000-55df-1d80-7cf1-a1cf92de5099	5222	Kobarid
00050000-55df-1d80-1761-c0954b0e3c8c	9227	Kobilje
00050000-55df-1d80-4717-62310bfd0889	1330	Kočevje
00050000-55df-1d80-c8e3-88bc36e0d0c5	1338	Kočevska Reka
00050000-55df-1d80-a8d2-4e34d2513f4a	2276	Kog
00050000-55df-1d80-f009-6569eb29c1f5	5211	Kojsko
00050000-55df-1d80-75c9-ac724842ef90	6223	Komen
00050000-55df-1d80-fd66-cf93db7fcb93	1218	Komenda
00050000-55df-1d80-296c-917662b478de	6000	Koper/Capodistria 
00050000-55df-1d80-9576-40f7cfd5443d	6001	Koper/Capodistria - poštni predali
00050000-55df-1d80-2384-5bd0c69068a6	8282	Koprivnica
00050000-55df-1d80-0c5c-7322e86e6501	5296	Kostanjevica na Krasu
00050000-55df-1d80-ac45-6beb54ca99a5	8311	Kostanjevica na Krki
00050000-55df-1d80-36a3-c9d175184e23	1336	Kostel
00050000-55df-1d80-4246-48d7fca0b836	6256	Košana
00050000-55df-1d80-1a8f-92ab67cfcc7c	2394	Kotlje
00050000-55df-1d80-6b80-9f2e155d14d1	6240	Kozina
00050000-55df-1d80-0f0f-9cfcd16b0a02	3260	Kozje
00050000-55df-1d80-9711-87bbf44f80dd	4000	Kranj 
00050000-55df-1d80-8043-364c77981ce6	4001	Kranj - poštni predali
00050000-55df-1d80-cbd8-e0e7c9ad732a	4280	Kranjska Gora
00050000-55df-1d80-0567-ba3cf8e64144	1281	Kresnice
00050000-55df-1d80-3b2e-c5e235b57332	4294	Križe
00050000-55df-1d80-dc2c-5472c6e469a7	9206	Križevci
00050000-55df-1d80-dec7-c005cb2bf088	9242	Križevci pri Ljutomeru
00050000-55df-1d80-6fb0-fa5416228d2f	1301	Krka
00050000-55df-1d80-eeb4-ac57142a2bbd	8296	Krmelj
00050000-55df-1d80-c6e0-00109edbfdf4	4245	Kropa
00050000-55df-1d80-6b36-040880dce5f9	8262	Krška vas
00050000-55df-1d80-a372-f95cb176fca5	8270	Krško
00050000-55df-1d80-0c2a-e3bffc838e76	9263	Kuzma
00050000-55df-1d80-1128-eda342d89fa0	2318	Laporje
00050000-55df-1d80-78ed-5619aa99a575	3270	Laško
00050000-55df-1d80-cb76-059350bd66f9	1219	Laze v Tuhinju
00050000-55df-1d80-40d1-e6fdb5713f4e	2230	Lenart v Slovenskih goricah
00050000-55df-1d80-91d2-2e6c257fc02a	9220	Lendava/Lendva
00050000-55df-1d80-5fad-ec09b6b5d125	4248	Lesce
00050000-55df-1d80-ee64-052f0fe8cbf3	3261	Lesično
00050000-55df-1d80-7d6c-35b3eb975270	8273	Leskovec pri Krškem
00050000-55df-1d80-bece-8cb447120ebf	2372	Libeliče
00050000-55df-1d80-46ee-f6447f29d630	2341	Limbuš
00050000-55df-1d80-852f-ba0b85c558d2	1270	Litija
00050000-55df-1d80-734b-da323cf9104c	3202	Ljubečna
00050000-55df-1d80-4dde-96a003ac9b26	1000	Ljubljana 
00050000-55df-1d80-c2fd-940cc371d251	1001	Ljubljana - poštni predali
00050000-55df-1d80-87c3-0f41eafb2e85	1231	Ljubljana - Črnuče
00050000-55df-1d80-3de3-542425bc51a5	1261	Ljubljana - Dobrunje
00050000-55df-1d80-6781-0419b4a6e177	1260	Ljubljana - Polje
00050000-55df-1d80-06fd-c1cd040d3b13	1210	Ljubljana - Šentvid
00050000-55df-1d80-9b51-2046497a1bed	1211	Ljubljana - Šmartno
00050000-55df-1d80-5bb7-b5b2f5e8dd18	3333	Ljubno ob Savinji
00050000-55df-1d80-1d33-511631093221	9240	Ljutomer
00050000-55df-1d80-eded-63415b5177b0	3215	Loče
00050000-55df-1d80-0e0c-3204bd71bbf2	5231	Log pod Mangartom
00050000-55df-1d80-02ce-404f848d5ac5	1358	Log pri Brezovici
00050000-55df-1d80-de82-271e31eb6f99	1370	Logatec
00050000-55df-1d80-7370-674ac67ac447	1371	Logatec
00050000-55df-1d80-9dd3-77c72e7bc2e2	1434	Loka pri Zidanem Mostu
00050000-55df-1d80-717e-ae46855139de	3223	Loka pri Žusmu
00050000-55df-1d80-bae2-b2489c67a060	6219	Lokev
00050000-55df-1d80-ebe6-71c536ebeb20	1318	Loški Potok
00050000-55df-1d80-626f-f2a12c136ea7	2324	Lovrenc na Dravskem polju
00050000-55df-1d80-64c4-99802305998b	2344	Lovrenc na Pohorju
00050000-55df-1d80-df25-043446d23bb7	3334	Luče
00050000-55df-1d80-93c0-94e228da84c9	1225	Lukovica
00050000-55df-1d80-b0c7-3a3c32fb1442	9202	Mačkovci
00050000-55df-1d80-3ea7-8e0a7884dd36	2322	Majšperk
00050000-55df-1d80-2b1a-3477a3d8f4fe	2321	Makole
00050000-55df-1d80-6160-f363de519388	9243	Mala Nedelja
00050000-55df-1d80-cf4f-9e65bdb77b18	2229	Malečnik
00050000-55df-1d80-add4-0525e47bdb63	6273	Marezige
00050000-55df-1d80-5071-1e41f17a71fd	2000	Maribor 
00050000-55df-1d80-fce5-a4cef3fdd3ec	2001	Maribor - poštni predali
00050000-55df-1d80-3648-f643899352c1	2206	Marjeta na Dravskem polju
00050000-55df-1d80-fc03-f9b19aaa8f2f	2281	Markovci
00050000-55df-1d80-52a0-09b8e3ff7e5d	9221	Martjanci
00050000-55df-1d80-740b-2ff276824922	6242	Materija
00050000-55df-1d80-7629-6beac860383c	4211	Mavčiče
00050000-55df-1d80-803c-098a3a055520	1215	Medvode
00050000-55df-1d80-2584-ad4c14fc5c98	1234	Mengeš
00050000-55df-1d80-1151-dbb2a5fe54c3	8330	Metlika
00050000-55df-1d80-097f-5c2c96f253bc	2392	Mežica
00050000-55df-1d80-6559-43e0cfa5c6e2	2204	Miklavž na Dravskem polju
00050000-55df-1d80-17e2-2770575484c1	2275	Miklavž pri Ormožu
00050000-55df-1d80-ee45-1e90045e5e06	5291	Miren
00050000-55df-1d80-0ef6-0655abd95509	8233	Mirna
00050000-55df-1d80-d3b2-2d5e1a4fcbf2	8216	Mirna Peč
00050000-55df-1d80-aa31-8cad27e0b532	2382	Mislinja
00050000-55df-1d80-8bed-4abd3d47353d	4281	Mojstrana
00050000-55df-1d80-061b-87c400bb3ec2	8230	Mokronog
00050000-55df-1d80-a130-ec8df401c77b	1251	Moravče
00050000-55df-1d80-af55-b0f292185b62	9226	Moravske Toplice
00050000-55df-1d80-8c60-ad8d4d8047bc	5216	Most na Soči
00050000-55df-1d80-d690-16d225dc2c5c	1221	Motnik
00050000-55df-1d80-6cb9-b66f17b8db98	3330	Mozirje
00050000-55df-1d80-bb2b-91c33bb74153	9000	Murska Sobota 
00050000-55df-1d80-54d7-1192ea0adb76	9001	Murska Sobota - poštni predali
00050000-55df-1d80-39fd-8583665a26b6	2366	Muta
00050000-55df-1d80-a081-bbf9914021ea	4202	Naklo
00050000-55df-1d80-69aa-0ac7b2cfa092	3331	Nazarje
00050000-55df-1d80-913f-a135c366ef63	1357	Notranje Gorice
00050000-55df-1d80-d5d8-5e7646639ebc	3203	Nova Cerkev
00050000-55df-1d80-5704-5e88e7b09060	5000	Nova Gorica 
00050000-55df-1d80-a0f6-cd025a56eabc	5001	Nova Gorica - poštni predali
00050000-55df-1d80-af1d-778f5a7824bd	1385	Nova vas
00050000-55df-1d80-e1f2-a9b7865c235e	8000	Novo mesto
00050000-55df-1d80-a807-6c4d9dcc5ff9	8001	Novo mesto - poštni predali
00050000-55df-1d80-26c8-0dc5cfa199bd	6243	Obrov
00050000-55df-1d80-1815-5e6f04448591	9233	Odranci
00050000-55df-1d80-fe27-57df26de20a1	2317	Oplotnica
00050000-55df-1d80-5078-5e7ca706cbcf	2312	Orehova vas
00050000-55df-1d80-d064-225a56cf6e85	2270	Ormož
00050000-55df-1d80-046a-8b22b9cc8fa4	1316	Ortnek
00050000-55df-1d80-7abc-5a8c0f7ee9a0	1337	Osilnica
00050000-55df-1d80-682d-88a81b6edc6b	8222	Otočec
00050000-55df-1d80-e7d1-e0fb2629d4f8	2361	Ožbalt
00050000-55df-1d80-08bb-29fa07eb6307	2231	Pernica
00050000-55df-1d80-d1d2-5c63b8ac6be1	2211	Pesnica pri Mariboru
00050000-55df-1d80-776d-b2836c78ca84	9203	Petrovci
00050000-55df-1d80-a3bb-1aefaf563e68	3301	Petrovče
00050000-55df-1d80-c2eb-00a6ada3fe8c	6330	Piran/Pirano
00050000-55df-1d80-ec5b-745cdcc80627	8255	Pišece
00050000-55df-1d80-4901-64fcb8e15753	6257	Pivka
00050000-55df-1d80-582e-f1a2ddba0672	6232	Planina
00050000-55df-1d80-1788-658927e74c2e	3225	Planina pri Sevnici
00050000-55df-1d80-295b-2db843f46919	6276	Pobegi
00050000-55df-1d80-f74d-e68f97df50df	8312	Podbočje
00050000-55df-1d80-ff5c-978c80b2eade	5243	Podbrdo
00050000-55df-1d80-151d-b578a6d17f95	3254	Podčetrtek
00050000-55df-1d80-8821-98f27d8c8f29	2273	Podgorci
00050000-55df-1d80-c9b3-2ab538152bc5	6216	Podgorje
00050000-55df-1d80-2143-99122bb520ed	2381	Podgorje pri Slovenj Gradcu
00050000-55df-1d80-a781-6b172e99bc01	6244	Podgrad
00050000-55df-1d80-3a5f-b4a4e628a80f	1414	Podkum
00050000-55df-1d80-acb8-12146a9c77ac	2286	Podlehnik
00050000-55df-1d80-1530-e5d8b65f086f	5272	Podnanos
00050000-55df-1d80-f8f6-53e9d90c2cc6	4244	Podnart
00050000-55df-1d80-9419-c14aecc9ace0	3241	Podplat
00050000-55df-1d80-e45f-416e7fb8a190	3257	Podsreda
00050000-55df-1d80-3dd1-1818bd46a593	2363	Podvelka
00050000-55df-1d80-ee8f-088c6cd7016f	2208	Pohorje
00050000-55df-1d80-131e-252989a045d0	2257	Polenšak
00050000-55df-1d80-0e0f-d54c9a548382	1355	Polhov Gradec
00050000-55df-1d80-1259-5d1f10176332	4223	Poljane nad Škofjo Loko
00050000-55df-1d80-f641-cc4ba5472aa6	2319	Poljčane
00050000-55df-1d80-66fc-a4c1439f7374	1272	Polšnik
00050000-55df-1d80-7fc3-f25c82ae1ff0	3313	Polzela
00050000-55df-1d80-95dc-a8eff366cb7e	3232	Ponikva
00050000-55df-1d80-fb33-8eb8fd9694a1	6320	Portorož/Portorose
00050000-55df-1d80-780a-7820c1f7fdcd	6230	Postojna
00050000-55df-1d80-7fa4-ce1cd6a09afb	2331	Pragersko
00050000-55df-1d80-8f85-a80f3a1cdf5a	3312	Prebold
00050000-55df-1d80-6a47-fb490c052efe	4205	Preddvor
00050000-55df-1d80-3480-d512d3c4d672	6255	Prem
00050000-55df-1d80-5cdb-69d1d97cf147	1352	Preserje
00050000-55df-1d80-2042-11aad6be6f29	6258	Prestranek
00050000-55df-1d80-b752-6ca2ee7874df	2391	Prevalje
00050000-55df-1d80-427a-c3a6fdac4f24	3262	Prevorje
00050000-55df-1d80-72a1-a16500e7e39c	1276	Primskovo 
00050000-55df-1d80-b05c-e5fea47cbe0b	3253	Pristava pri Mestinju
00050000-55df-1d80-02cd-eddbafd293c5	9207	Prosenjakovci/Partosfalva
00050000-55df-1d80-276e-fc19ac5a9c6a	5297	Prvačina
00050000-55df-1d80-2a27-f1467b9ce88b	2250	Ptuj
00050000-55df-1d80-092b-42eeb1e69c96	2323	Ptujska Gora
00050000-55df-1d80-5c80-f7604bc8a7e6	9201	Puconci
00050000-55df-1d80-9108-d4d8e582b858	2327	Rače
00050000-55df-1d80-38fd-ca7d98ced032	1433	Radeče
00050000-55df-1d80-4aec-ff774008ee5a	9252	Radenci
00050000-55df-1d80-5feb-dea6a6edc08d	2360	Radlje ob Dravi
00050000-55df-1d80-cc77-779dfbec330c	1235	Radomlje
00050000-55df-1d80-e891-6284146c65eb	4240	Radovljica
00050000-55df-1d80-c140-ae919fce3524	8274	Raka
00050000-55df-1d80-0dea-5011011e3cd2	1381	Rakek
00050000-55df-1d80-fc50-82d4764992c4	4283	Rateče - Planica
00050000-55df-1d80-0eba-9a9c7188357e	2390	Ravne na Koroškem
00050000-55df-1d80-5f48-868d169a609f	9246	Razkrižje
00050000-55df-1d80-6649-0716b2258095	3332	Rečica ob Savinji
00050000-55df-1d80-d923-a114eeddac3e	5292	Renče
00050000-55df-1d80-ffcd-dc8fb036b565	1310	Ribnica
00050000-55df-1d80-5e0b-0ae5590f83cf	2364	Ribnica na Pohorju
00050000-55df-1d80-5c2d-fc3f91e10b4f	3272	Rimske Toplice
00050000-55df-1d80-0352-aa5a93353fec	1314	Rob
00050000-55df-1d80-94b6-f0d6d99ad593	5215	Ročinj
00050000-55df-1d80-2737-3e2aff6b3f26	3250	Rogaška Slatina
00050000-55df-1d80-3264-269ffb5bdb47	9262	Rogašovci
00050000-55df-1d80-7f16-90b1899a68a8	3252	Rogatec
00050000-55df-1d80-eedb-64228c4e2b16	1373	Rovte
00050000-55df-1d80-9ffd-218fc00c8675	2342	Ruše
00050000-55df-1d80-ff47-a6b14c5b55c6	1282	Sava
00050000-55df-1d80-df57-377cb0a1b527	6333	Sečovlje/Sicciole
00050000-55df-1d80-1dff-b3671feb351c	4227	Selca
00050000-55df-1d80-d9fb-f18599b3ad0a	2352	Selnica ob Dravi
00050000-55df-1d80-770e-f7320efb3ac3	8333	Semič
00050000-55df-1d80-2ae0-196d141af711	8281	Senovo
00050000-55df-1d80-1824-9c6e00780b73	6224	Senožeče
00050000-55df-1d80-7d76-a74ace956ba7	8290	Sevnica
00050000-55df-1d80-669d-6b4fe573db93	6210	Sežana
00050000-55df-1d80-edb9-00392c561c47	2214	Sladki Vrh
00050000-55df-1d80-937b-474df016c1e0	5283	Slap ob Idrijci
00050000-55df-1d80-a3d3-3d98c2bd4857	2380	Slovenj Gradec
00050000-55df-1d80-f890-f42eb1dbe90c	2310	Slovenska Bistrica
00050000-55df-1d80-458f-e524b8e8f051	3210	Slovenske Konjice
00050000-55df-1d80-257c-76a6c97db1db	1216	Smlednik
00050000-55df-1d80-390a-cd9c13369948	5232	Soča
00050000-55df-1d80-475e-9a97121ce286	1317	Sodražica
00050000-55df-1d80-ce6f-6fb962ca146b	3335	Solčava
00050000-55df-1d80-7cb7-91aee7cf10be	5250	Solkan
00050000-55df-1d80-9701-86175dd43982	4229	Sorica
00050000-55df-1d80-673e-adcae6b9cdfa	4225	Sovodenj
00050000-55df-1d80-d13a-4028a04c2f55	5281	Spodnja Idrija
00050000-55df-1d80-65d5-1994e23f0813	2241	Spodnji Duplek
00050000-55df-1d80-0e69-30305609ad14	9245	Spodnji Ivanjci
00050000-55df-1d80-67b4-85d4eba4c29d	2277	Središče ob Dravi
00050000-55df-1d80-39e3-fd8fa22a7048	4267	Srednja vas v Bohinju
00050000-55df-1d80-4805-ed773576e16f	8256	Sromlje 
00050000-55df-1d80-1036-3f26843b27d0	5224	Srpenica
00050000-55df-1d80-7155-c5811b5b5b38	1242	Stahovica
00050000-55df-1d80-4661-bbcda809741b	1332	Stara Cerkev
00050000-55df-1d80-54e1-0e754ac1ee22	8342	Stari trg ob Kolpi
00050000-55df-1d80-4c75-ef1dfffa9f7c	1386	Stari trg pri Ložu
00050000-55df-1d80-5946-e92f4e7d436f	2205	Starše
00050000-55df-1d80-df3a-711e83ccc436	2289	Stoperce
00050000-55df-1d80-df3f-c69962ca4740	8322	Stopiče
00050000-55df-1d80-f351-619e6abbc768	3206	Stranice
00050000-55df-1d80-477a-ffcbe7680225	8351	Straža
00050000-55df-1d80-ba3e-39d6d84f69e9	1313	Struge
00050000-55df-1d80-33e1-36a940e0cde9	8293	Studenec
00050000-55df-1d80-e2d5-e99235e31e38	8331	Suhor
00050000-55df-1d80-536b-e04783f728d9	2233	Sv. Ana v Slovenskih goricah
00050000-55df-1d80-9e2f-76058671aa76	2235	Sv. Trojica v Slovenskih goricah
00050000-55df-1d80-6d39-39373118436e	2353	Sveti Duh na Ostrem Vrhu
00050000-55df-1d80-732e-135cb83ffba8	9244	Sveti Jurij ob Ščavnici
00050000-55df-1d80-66d4-2181fe5b4891	3264	Sveti Štefan
00050000-55df-1d80-9a65-d21ead9728ab	2258	Sveti Tomaž
00050000-55df-1d80-19a2-6f1667c6ff1e	9204	Šalovci
00050000-55df-1d80-a8e5-3c57872d9c36	5261	Šempas
00050000-55df-1d80-1936-7d49ce72f376	5290	Šempeter pri Gorici
00050000-55df-1d80-f69e-af0548a61ade	3311	Šempeter v Savinjski dolini
00050000-55df-1d80-cf3c-f435a3a29a0b	4208	Šenčur
00050000-55df-1d80-782d-69099fd5b1cc	2212	Šentilj v Slovenskih goricah
00050000-55df-1d80-a2a6-c4ac5a7f003a	8297	Šentjanž
00050000-55df-1d80-1fb7-3889044c6bec	2373	Šentjanž pri Dravogradu
00050000-55df-1d80-4335-b5dddebbbb02	8310	Šentjernej
00050000-55df-1d80-f087-be4a2744f89b	3230	Šentjur
00050000-55df-1d80-b749-e6badab88a48	3271	Šentrupert
00050000-55df-1d80-5467-dda530f794e5	8232	Šentrupert
00050000-55df-1d80-8577-900d9640e518	1296	Šentvid pri Stični
00050000-55df-1d80-cc2b-bead078b73d8	8275	Škocjan
00050000-55df-1d80-1d1c-1318aac0da86	6281	Škofije
00050000-55df-1d80-dc89-12dfea6c744c	4220	Škofja Loka
00050000-55df-1d80-87d1-409d9bd40101	3211	Škofja vas
00050000-55df-1d80-410f-cc5e73ebe187	1291	Škofljica
00050000-55df-1d80-1595-fb26ca8cd510	6274	Šmarje
00050000-55df-1d80-3c8d-a8ad8ca65966	1293	Šmarje - Sap
00050000-55df-1d80-0147-54c5e714d2e8	3240	Šmarje pri Jelšah
00050000-55df-1d80-3032-8641a0b682a0	8220	Šmarješke Toplice
00050000-55df-1d80-dc58-584aa5abbd49	2315	Šmartno na Pohorju
00050000-55df-1d80-26ba-d2e1556f1f10	3341	Šmartno ob Dreti
00050000-55df-1d80-8877-848791abcc68	3327	Šmartno ob Paki
00050000-55df-1d80-2529-026921e8568b	1275	Šmartno pri Litiji
00050000-55df-1d80-20aa-b73392b430fe	2383	Šmartno pri Slovenj Gradcu
00050000-55df-1d80-05f0-e5a6551e16da	3201	Šmartno v Rožni dolini
00050000-55df-1d80-677b-053ce7cf74fd	3325	Šoštanj
00050000-55df-1d80-e6f8-8979256dad66	6222	Štanjel
00050000-55df-1d80-e4c4-a014a67c41b7	3220	Štore
00050000-55df-1d80-d5e4-a6a04c1cef4d	3304	Tabor
00050000-55df-1d80-f6a3-f0649c339d8b	3221	Teharje
00050000-55df-1d80-4537-070c2efd9256	9251	Tišina
00050000-55df-1d80-1ba1-0736ca0db7bb	5220	Tolmin
00050000-55df-1d80-19c8-2b08299b09aa	3326	Topolšica
00050000-55df-1d80-70d9-7200eddd63eb	2371	Trbonje
00050000-55df-1d80-37f2-f36785cfcd9b	1420	Trbovlje
00050000-55df-1d80-5c37-8cd91890f39c	8231	Trebelno 
00050000-55df-1d80-bba6-395eece82a58	8210	Trebnje
00050000-55df-1d80-03cc-e787fea76740	5252	Trnovo pri Gorici
00050000-55df-1d80-a5d1-f8a649e1852e	2254	Trnovska vas
00050000-55df-1d80-ad94-331d239df186	1222	Trojane
00050000-55df-1d80-4930-2e83eb9a2c77	1236	Trzin
00050000-55df-1d80-ec2a-f7026485d1b8	4290	Tržič
00050000-55df-1d80-9790-7bfc9d1fcf8c	8295	Tržišče
00050000-55df-1d80-b28f-ded477c27105	1311	Turjak
00050000-55df-1d80-ca7e-581750be83c0	9224	Turnišče
00050000-55df-1d80-f463-b9bce662792a	8323	Uršna sela
00050000-55df-1d80-53c1-d7ada4b109f9	1252	Vače
00050000-55df-1d80-9b83-93f690fed398	3320	Velenje 
00050000-55df-1d80-a812-c753d9f09cb1	3322	Velenje - poštni predali
00050000-55df-1d80-4ff0-9a4662da7c22	8212	Velika Loka
00050000-55df-1d80-5efc-37f2e4f3eeb9	2274	Velika Nedelja
00050000-55df-1d80-94b9-d9d7a9e93ae3	9225	Velika Polana
00050000-55df-1d80-369a-19c1331c1160	1315	Velike Lašče
00050000-55df-1d80-b6e4-1c273d985abe	8213	Veliki Gaber
00050000-55df-1d80-c781-3d5ab09b6a3b	9241	Veržej
00050000-55df-1d80-9b7d-900f44f0aa25	1312	Videm - Dobrepolje
00050000-55df-1d80-2323-d8a508c01a0f	2284	Videm pri Ptuju
00050000-55df-1d80-4885-139f2c2f06a5	8344	Vinica
00050000-55df-1d80-8497-b14de62dad6f	5271	Vipava
00050000-55df-1d80-4f55-5e679d591bf7	4212	Visoko
00050000-55df-1d80-9439-c05bf95c154b	1294	Višnja Gora
00050000-55df-1d80-f8df-f96f9c06b87d	3205	Vitanje
00050000-55df-1d80-30f3-d3b50330265d	2255	Vitomarci
00050000-55df-1d80-7dee-0fcebd064873	1217	Vodice
00050000-55df-1d80-15fa-94902ed93c42	3212	Vojnik\t
00050000-55df-1d80-193b-f6f770aa6584	5293	Volčja Draga
00050000-55df-1d80-b511-b039e167aeed	2232	Voličina
00050000-55df-1d80-69d7-e3097013c6e1	3305	Vransko
00050000-55df-1d80-3b0c-d775bcc4db72	6217	Vremski Britof
00050000-55df-1d80-6be4-d31a4419b8c1	1360	Vrhnika
00050000-55df-1d80-96b4-49d86d31bfbd	2365	Vuhred
00050000-55df-1d80-4dea-8ae136922095	2367	Vuzenica
00050000-55df-1d80-3559-2d0fda37a524	8292	Zabukovje 
00050000-55df-1d80-d1d0-d48f4f38c5c6	1410	Zagorje ob Savi
00050000-55df-1d80-2174-88a424019d62	1303	Zagradec
00050000-55df-1d80-5e6c-c8dc3c821c5c	2283	Zavrč
00050000-55df-1d80-b75a-e3bea6c8a55d	8272	Zdole 
00050000-55df-1d80-59ac-9c457f97d12b	4201	Zgornja Besnica
00050000-55df-1d80-c049-f5558a9dc048	2242	Zgornja Korena
00050000-55df-1d80-2811-4a916eb89719	2201	Zgornja Kungota
00050000-55df-1d80-0a9b-3eec910a719d	2316	Zgornja Ložnica
00050000-55df-1d80-880a-61da1287f974	2314	Zgornja Polskava
00050000-55df-1d80-b507-49f8d2582e3f	2213	Zgornja Velka
00050000-55df-1d80-9da7-ee76a0210961	4247	Zgornje Gorje
00050000-55df-1d80-89bf-09ef640f3732	4206	Zgornje Jezersko
00050000-55df-1d80-07d0-bc8c31b4f844	2285	Zgornji Leskovec
00050000-55df-1d80-6dae-035cadd6ca09	1432	Zidani Most
00050000-55df-1d80-4e64-1cd57c3d2f05	3214	Zreče
00050000-55df-1d80-4c24-5626b7188a04	4209	Žabnica
00050000-55df-1d80-b892-1b38d5707c03	3310	Žalec
00050000-55df-1d80-11ba-0b3bff1a9bdd	4228	Železniki
00050000-55df-1d80-8333-c9f250bad19f	2287	Žetale
00050000-55df-1d80-56bd-10d1a738a102	4226	Žiri
00050000-55df-1d80-01f5-fc762a92f521	4274	Žirovnica
00050000-55df-1d80-55a3-d6b0842a3576	8360	Žužemberk
\.


--
-- TOC entry 2934 (class 0 OID 15946125)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 15945932)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55df-1d82-fc79-2d463ec35a60	00080000-55df-1d82-0662-64cc2d19f13e	\N	00040000-55df-1d81-dd06-f3c62bad5f1f	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55df-1d82-2d6a-478c1121a9f1	00080000-55df-1d82-0662-64cc2d19f13e	\N	00040000-55df-1d81-dd06-f3c62bad5f1f		\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55df-1d82-5854-c6f17045927c	00080000-55df-1d82-4b84-cf6fdb4a1168	\N	00040000-55df-1d81-dd06-f3c62bad5f1f		\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2922 (class 0 OID 15946010)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 15946137)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2960 (class 0 OID 15946488)
-- Dependencies: 226
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 15946498)
-- Dependencies: 227
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55df-1d82-8179-237dab63213c	00080000-55df-1d82-36cb-8d172f969634	0987	AK
00190000-55df-1d82-9e1f-aba670568f36	00080000-55df-1d82-4b84-cf6fdb4a1168	0989	AK
00190000-55df-1d82-1c89-895ee84b9800	00080000-55df-1d82-59cc-4a8a8c83f107	0986	AK
00190000-55df-1d82-816d-48e810df3066	00080000-55df-1d82-de8b-be2023a3b140	0984	AK
00190000-55df-1d82-c8ff-51edd9b19940	00080000-55df-1d82-a914-f20830105bc2	0983	AK
00190000-55df-1d82-1e67-95620ef20e2c	00080000-55df-1d82-ad6c-a50340dfb953	0982	AK
00190000-55df-1d83-f81a-1160132e9716	00080000-55df-1d83-584c-667fa1726b05	1001	AK
\.


--
-- TOC entry 2959 (class 0 OID 15946444)
-- Dependencies: 225
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55df-1d83-e1b4-8d89fd2ad767	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2962 (class 0 OID 15946506)
-- Dependencies: 228
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 15946166)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55df-1d82-331b-a1ef196e9450	\N	\N	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55df-1d82-62fb-e81d221d041b	\N	\N	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55df-1d82-66cc-92f5d6e647c4	\N	\N	0003	Kazinska	t	84	Kazinska dvorana
00220000-55df-1d82-3d07-4d5b59d51004	\N	\N	0004	Mali oder	t	24	Mali oder 
00220000-55df-1d82-3adc-ed41d4fdcabf	\N	\N	0005	Komorni oder	t	15	Komorni oder
00220000-55df-1d82-8870-272b920890d8	\N	\N	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55df-1d82-427f-49883853f32f	\N	\N	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2932 (class 0 OID 15946110)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 15946100)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 15946297)
-- Dependencies: 218
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 15946236)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 15945805)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55df-1d83-584c-667fa1726b05	00010000-55df-1d81-4422-a8076d2727c6	2015-08-27 16:24:03	INS	a:0:{}
2	App\\Entity\\Option	00000000-55df-1d83-6696-3d17f2fc0838	00010000-55df-1d81-4422-a8076d2727c6	2015-08-27 16:24:03	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55df-1d83-f81a-1160132e9716	00010000-55df-1d81-4422-a8076d2727c6	2015-08-27 16:24:03	INS	a:0:{}
\.


--
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2941 (class 0 OID 15946178)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 15945843)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55df-1d81-025e-74e60d42b0b5	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55df-1d81-d527-34bc23813431	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55df-1d81-821b-a71daf4e7893	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55df-1d81-6129-34f60a40c073	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55df-1d81-44a3-81d087d57692	planer	Planer dogodkov v koledarju	t
00020000-55df-1d81-afc4-67e7835499fe	kadrovska	Kadrovska služba	t
00020000-55df-1d81-7376-173da7e28215	arhivar	Ažuriranje arhivalij	t
00020000-55df-1d81-25a3-46f55d15fcc7	igralec	Igralec	t
00020000-55df-1d81-e282-fc914629c94a	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55df-1d82-fe1c-26ab46cab49b	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2907 (class 0 OID 15945827)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55df-1d81-2294-70f1971ca24c	00020000-55df-1d81-821b-a71daf4e7893
00010000-55df-1d81-4422-a8076d2727c6	00020000-55df-1d81-821b-a71daf4e7893
00010000-55df-1d82-a216-b21c043240de	00020000-55df-1d82-fe1c-26ab46cab49b
\.


--
-- TOC entry 2943 (class 0 OID 15946192)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 15946131)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 15946077)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 15946547)
-- Dependencies: 233
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55df-1d81-408a-bce0ab09aa2c	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55df-1d81-ae18-81583e981cac	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55df-1d81-1c2b-1e06c94484df	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55df-1d81-b6bd-825fff88f80b	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55df-1d81-35cf-773420f2a186	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2966 (class 0 OID 15946539)
-- Dependencies: 232
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55df-1d81-8405-fbf7fb0895ee	00230000-55df-1d81-b6bd-825fff88f80b	popa
00240000-55df-1d81-6b35-4ae1cb9ea320	00230000-55df-1d81-b6bd-825fff88f80b	oseba
00240000-55df-1d81-1ad7-cceccf4f17f9	00230000-55df-1d81-b6bd-825fff88f80b	sezona
00240000-55df-1d81-16cc-53b178581281	00230000-55df-1d81-ae18-81583e981cac	prostor
00240000-55df-1d81-5a9a-c63f2afaf8a1	00230000-55df-1d81-b6bd-825fff88f80b	besedilo
00240000-55df-1d81-5947-3965fbec5155	00230000-55df-1d81-b6bd-825fff88f80b	uprizoritev
00240000-55df-1d81-5e88-f0d28b8eccdf	00230000-55df-1d81-b6bd-825fff88f80b	funkcija
00240000-55df-1d81-bed4-bab47e26579f	00230000-55df-1d81-b6bd-825fff88f80b	tipfunkcije
00240000-55df-1d81-a7be-cab21e833beb	00230000-55df-1d81-b6bd-825fff88f80b	alternacija
00240000-55df-1d81-234d-67ebcf82599d	00230000-55df-1d81-408a-bce0ab09aa2c	pogodba
00240000-55df-1d81-660d-908b5b176d02	00230000-55df-1d81-b6bd-825fff88f80b	zaposlitev
00240000-55df-1d81-beb2-427e9d236aac	00230000-55df-1d81-408a-bce0ab09aa2c	programdela
00240000-55df-1d81-2ac6-e2a17f6ed4f5	00230000-55df-1d81-b6bd-825fff88f80b	zapis
\.


--
-- TOC entry 2965 (class 0 OID 15946534)
-- Dependencies: 231
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
256032a7-c198-453b-a6d8-a5ed0eb3c82f	00230000-55df-1d81-b6bd-825fff88f80b	0	1001
\.


--
-- TOC entry 2948 (class 0 OID 15946246)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55df-1d83-3693-b5ef6f90529b	000e0000-55df-1d82-6eff-9bcf795305fb	00080000-55df-1d82-0662-64cc2d19f13e	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55df-1d81-c3ef-b6dc1c99bd2f
00270000-55df-1d83-d3ea-21f0b3076261	000e0000-55df-1d82-6eff-9bcf795305fb	00080000-55df-1d82-0662-64cc2d19f13e	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55df-1d81-c3ef-b6dc1c99bd2f
00270000-55df-1d83-dc7e-3d83b80e364a	000e0000-55df-1d82-6eff-9bcf795305fb	00080000-55df-1d82-18e6-273bfa34413b	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4	\N
\.


--
-- TOC entry 2914 (class 0 OID 15945905)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 15946087)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55df-1d83-d7f4-62195fdd7eaf	00180000-55df-1d83-56fa-ec00c634e8f1	000c0000-55df-1d83-e163-33472256af32	00090000-55df-1d82-abcf-cd4031feb6eb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55df-1d83-27a9-4fda7e3c70ad	00180000-55df-1d83-56fa-ec00c634e8f1	000c0000-55df-1d83-e228-45f65e9fdf47	00090000-55df-1d82-5acb-b82678b39f8a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55df-1d83-e2f7-fec525ed3bb4	00180000-55df-1d83-56fa-ec00c634e8f1	000c0000-55df-1d83-55fc-9d5e5d6efdb4	00090000-55df-1d82-b95c-ac400b698d08	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55df-1d83-09fd-9dbf6da6d98a	00180000-55df-1d83-56fa-ec00c634e8f1	000c0000-55df-1d83-c4b1-f33ad7a8af3b	00090000-55df-1d82-1ac4-7a40199ec52a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55df-1d83-0df5-b55b64d08025	00180000-55df-1d83-56fa-ec00c634e8f1	000c0000-55df-1d83-3c1c-630d6acaf46d	00090000-55df-1d82-091b-2481b738299d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55df-1d83-4733-b9e9d884510f	00180000-55df-1d83-5128-2e514e72160d	\N	00090000-55df-1d82-091b-2481b738299d	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2951 (class 0 OID 15946286)
-- Dependencies: 217
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55df-1d80-de79-05419fb28fd1	Avtor	Avtorji	Avtorka	umetnik
000f0000-55df-1d80-69db-d5175405db5a	Priredba	Priredba	Priredba	umetnik
000f0000-55df-1d80-e9a5-4d14559f1e1b	Prevod	Prevod	Prevod	umetnik
000f0000-55df-1d80-ac39-ecd5928d7d65	Režija	Režija	Režija	umetnik
000f0000-55df-1d80-4395-b6776782bf48	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55df-1d80-f743-8a17261d275d	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55df-1d80-9d60-cb7157365646	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55df-1d80-318c-17336026cea9	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55df-1d80-0c54-7b19207f2d48	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55df-1d80-3865-edeb371a83c8	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55df-1d80-9f26-74746774f618	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55df-1d80-8f83-9cd7100be8d8	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55df-1d80-f507-e9726fe28b1a	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55df-1d80-5d65-f3f1b9175213	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55df-1d80-7354-f1a8babc06ee	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55df-1d80-df21-a7beef69f54f	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55df-1d80-6b3b-4d3caf2cbab5	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55df-1d80-db2e-e416ec38eaca	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2963 (class 0 OID 15946516)
-- Dependencies: 229
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55df-1d80-bf0f-9c94a60e0fc4	01	Velika predstava	f	1.00	1.00
002b0000-55df-1d80-b6b9-77494343b4b7	02	Mala predstava	f	0.50	0.50
002b0000-55df-1d80-067d-87fbbab37551	03	Mala koprodukcija	t	0.40	1.00
002b0000-55df-1d80-87e1-81cb98dba3fd	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55df-1d80-86e8-ac8953c20d5c	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2919 (class 0 OID 15945967)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 15945814)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55df-1d81-4422-a8076d2727c6	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROe0bOLvtd7GLe6N6nT01AKMdGDvT95Se	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55df-1d82-fbf7-f3071b947938	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55df-1d82-811b-b5d2f729e6f2	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55df-1d82-35c6-6338464f95b0	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55df-1d82-a905-874755f4d91c	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55df-1d82-78ff-4b39b7e16d6c	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55df-1d82-e4ec-f13b8e00b1e8	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55df-1d82-59b9-04e4b9791075	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55df-1d82-a71a-35a1f2b166d9	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55df-1d82-7032-e9e66d153534	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55df-1d82-a216-b21c043240de	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55df-1d81-2294-70f1971ca24c	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2955 (class 0 OID 15946334)
-- Dependencies: 221
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55df-1d82-d88d-76f06f5e0d1b	00160000-55df-1d82-a342-e814bd49f2dc	\N	00140000-55df-1d81-df80-bc0b547f5be4	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55df-1d82-3adc-ed41d4fdcabf
000e0000-55df-1d82-6eff-9bcf795305fb	00160000-55df-1d82-17f7-9ca87aa27075	\N	00140000-55df-1d81-f40f-16d9afc8baa5	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55df-1d82-8870-272b920890d8
000e0000-55df-1d82-08a1-be2d6f5f8828	\N	\N	00140000-55df-1d81-f40f-16d9afc8baa5	00190000-55df-1d82-8179-237dab63213c	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55df-1d82-3adc-ed41d4fdcabf
000e0000-55df-1d82-572d-100bc40c19b0	\N	\N	00140000-55df-1d81-f40f-16d9afc8baa5	00190000-55df-1d82-8179-237dab63213c	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55df-1d82-3adc-ed41d4fdcabf
000e0000-55df-1d82-8b7e-00bfff056413	\N	\N	00140000-55df-1d81-f40f-16d9afc8baa5	00190000-55df-1d82-8179-237dab63213c	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55df-1d82-331b-a1ef196e9450
000e0000-55df-1d82-2974-1cab26349b5f	\N	\N	00140000-55df-1d81-f40f-16d9afc8baa5	00190000-55df-1d82-8179-237dab63213c	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55df-1d82-331b-a1ef196e9450
\.


--
-- TOC entry 2924 (class 0 OID 15946029)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55df-1d82-d07b-943c6ebc4933	000e0000-55df-1d82-6eff-9bcf795305fb	1	
00200000-55df-1d82-5c6a-e3d8a730e928	000e0000-55df-1d82-6eff-9bcf795305fb	2	
\.


--
-- TOC entry 2939 (class 0 OID 15946158)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 15946260)
-- Dependencies: 215
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55df-1d81-bafb-d78bc7e3a50d	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55df-1d81-6558-86891cf6660c	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55df-1d81-44ff-05757dcd2848	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55df-1d81-9889-cded38a978f9	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55df-1d81-4960-0b49add8c8dd	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55df-1d81-235d-63c865b59a78	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55df-1d81-4830-a563d336dc5d	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55df-1d81-5026-952499e1b498	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55df-1d81-c3ef-b6dc1c99bd2f	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55df-1d81-9ab7-b5dac9addbe8	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55df-1d81-aed0-7704a52ff0eb	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55df-1d81-3ceb-a4623f0abbdf	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55df-1d81-4488-9b69f954dcde	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55df-1d81-c889-c40fc1c9f903	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55df-1d81-1e14-3f7db4b1fd84	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55df-1d81-d0f3-2d830c0dfabe	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55df-1d81-8c4a-16ac38f78516	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55df-1d81-18d3-f32ba2f150bc	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55df-1d81-9f8f-5abdfa04407e	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55df-1d81-6d5c-fffa89391820	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55df-1d81-47e2-6548861a076d	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55df-1d81-f114-0323300ff371	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55df-1d81-86ed-c4bf2398162c	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55df-1d81-1170-087829239aac	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55df-1d81-7b5f-9a3d49c9cb47	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55df-1d81-9bfd-fe05ffee511f	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55df-1d81-6276-f505168c2bc9	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55df-1d81-83d9-89cfe8b08e2d	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2969 (class 0 OID 15946586)
-- Dependencies: 235
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 15946558)
-- Dependencies: 234
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 15946598)
-- Dependencies: 236
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 15946229)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55df-1d83-9ae0-0533b7b818d2	00090000-55df-1d82-5acb-b82678b39f8a	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55df-1d83-1736-6224ce4d0817	00090000-55df-1d82-b95c-ac400b698d08	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55df-1d83-7ff4-5df1983a338c	00090000-55df-1d82-2acd-9d6657e42930	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55df-1d83-5546-82a8f2d7d079	00090000-55df-1d82-146a-54087b383f84	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55df-1d83-7dc1-9177c603d42f	00090000-55df-1d82-abcf-cd4031feb6eb	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55df-1d83-ea0d-85f560f59644	00090000-55df-1d82-d3dd-2a7a02961f33	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2926 (class 0 OID 15946061)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 15946324)
-- Dependencies: 220
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55df-1d81-df80-bc0b547f5be4	01	Drama	drama (SURS 01)
00140000-55df-1d81-5322-79e255758046	02	Opera	opera (SURS 02)
00140000-55df-1d81-865d-5e501ecd821a	03	Balet	balet (SURS 03)
00140000-55df-1d81-1eaf-7eaba9305653	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55df-1d81-97d6-1cc126d3af48	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55df-1d81-f40f-16d9afc8baa5	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55df-1d81-7156-7d39e35ab55d	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2945 (class 0 OID 15946219)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2448 (class 2606 OID 15945868)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 15946383)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 15946373)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 15946285)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 15946638)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 15946051)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 15946076)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 15946532)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 15945993)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 15946438)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 15946215)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 15946027)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 15946070)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 15946007)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 15946123)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 15946615)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 15946622)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2694 (class 2606 OID 15946646)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 15946150)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 15945965)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 15945877)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 15945901)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 15945857)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2439 (class 2606 OID 15945842)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 15946156)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 15946191)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 15946319)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 15945929)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 15945953)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 15946129)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 15945943)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 15946014)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 15946141)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 15946495)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 15946503)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 15946486)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 15946514)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 15946173)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 15946114)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 15946105)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 15946307)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 15946243)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 15945813)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 15946182)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 15945831)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2441 (class 2606 OID 15945851)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 15946200)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 15946136)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 15946085)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 15946556)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 15946544)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 15946538)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 15946256)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 15945910)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 15946096)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 15946296)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 15946526)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 15945978)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 15945826)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 15946352)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 15946036)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 15946164)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 15946268)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 15946596)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 15946580)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 15946604)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 15946234)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 15946065)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 15946332)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 15946227)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 1259 OID 15946058)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2591 (class 1259 OID 15946257)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2592 (class 1259 OID 15946258)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2593 (class 1259 OID 15946259)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2680 (class 1259 OID 15946617)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2681 (class 1259 OID 15946616)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2462 (class 1259 OID 15945931)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2554 (class 1259 OID 15946157)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2667 (class 1259 OID 15946584)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2668 (class 1259 OID 15946583)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2669 (class 1259 OID 15946585)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2670 (class 1259 OID 15946582)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2671 (class 1259 OID 15946581)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2548 (class 1259 OID 15946143)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2549 (class 1259 OID 15946142)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2499 (class 1259 OID 15946037)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2578 (class 1259 OID 15946216)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2579 (class 1259 OID 15946218)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2580 (class 1259 OID 15946217)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2487 (class 1259 OID 15946009)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2488 (class 1259 OID 15946008)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2650 (class 1259 OID 15946515)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2604 (class 1259 OID 15946321)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2605 (class 1259 OID 15946322)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2606 (class 1259 OID 15946323)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2677 (class 1259 OID 15946605)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2613 (class 1259 OID 15946357)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2614 (class 1259 OID 15946354)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2615 (class 1259 OID 15946358)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2616 (class 1259 OID 15946356)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2617 (class 1259 OID 15946355)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2477 (class 1259 OID 15945980)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2478 (class 1259 OID 15945979)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2453 (class 1259 OID 15945904)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2566 (class 1259 OID 15946183)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2517 (class 1259 OID 15946071)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2443 (class 1259 OID 15945858)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2444 (class 1259 OID 15945859)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2571 (class 1259 OID 15946203)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2572 (class 1259 OID 15946202)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2573 (class 1259 OID 15946201)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2491 (class 1259 OID 15946015)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2492 (class 1259 OID 15946017)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2493 (class 1259 OID 15946016)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2660 (class 1259 OID 15946546)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2528 (class 1259 OID 15946109)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2529 (class 1259 OID 15946107)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2530 (class 1259 OID 15946106)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2531 (class 1259 OID 15946108)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2434 (class 1259 OID 15945832)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2435 (class 1259 OID 15945833)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2557 (class 1259 OID 15946165)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2690 (class 1259 OID 15946639)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2691 (class 1259 OID 15946647)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2692 (class 1259 OID 15946648)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2543 (class 1259 OID 15946130)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2587 (class 1259 OID 15946244)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2588 (class 1259 OID 15946245)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2634 (class 1259 OID 15946443)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2635 (class 1259 OID 15946442)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2636 (class 1259 OID 15946439)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2637 (class 1259 OID 15946440)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2638 (class 1259 OID 15946441)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2466 (class 1259 OID 15945945)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2467 (class 1259 OID 15945944)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2468 (class 1259 OID 15945946)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2560 (class 1259 OID 15946177)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2561 (class 1259 OID 15946176)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2642 (class 1259 OID 15946496)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2643 (class 1259 OID 15946497)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2627 (class 1259 OID 15946387)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2628 (class 1259 OID 15946388)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2629 (class 1259 OID 15946385)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2630 (class 1259 OID 15946386)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2584 (class 1259 OID 15946235)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2534 (class 1259 OID 15946118)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2535 (class 1259 OID 15946117)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2536 (class 1259 OID 15946115)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2537 (class 1259 OID 15946116)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2623 (class 1259 OID 15946375)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2624 (class 1259 OID 15946374)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2639 (class 1259 OID 15946487)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2498 (class 1259 OID 15946028)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2657 (class 1259 OID 15946533)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2684 (class 1259 OID 15946623)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2685 (class 1259 OID 15946624)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2449 (class 1259 OID 15945879)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2450 (class 1259 OID 15945878)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2458 (class 1259 OID 15945911)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2459 (class 1259 OID 15945912)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2523 (class 1259 OID 15946099)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2524 (class 1259 OID 15946098)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2525 (class 1259 OID 15946097)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2505 (class 1259 OID 15946060)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2506 (class 1259 OID 15946056)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2507 (class 1259 OID 15946053)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2508 (class 1259 OID 15946054)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2509 (class 1259 OID 15946052)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2510 (class 1259 OID 15946057)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2511 (class 1259 OID 15946055)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2465 (class 1259 OID 15945930)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2483 (class 1259 OID 15945994)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2484 (class 1259 OID 15945996)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2485 (class 1259 OID 15945995)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2486 (class 1259 OID 15945997)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2542 (class 1259 OID 15946124)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2609 (class 1259 OID 15946320)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2618 (class 1259 OID 15946353)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2456 (class 1259 OID 15945902)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2457 (class 1259 OID 15945903)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2581 (class 1259 OID 15946228)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2666 (class 1259 OID 15946557)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 15945966)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2663 (class 1259 OID 15946545)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2564 (class 1259 OID 15946175)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2565 (class 1259 OID 15946174)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2631 (class 1259 OID 15946384)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2473 (class 1259 OID 15945954)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2610 (class 1259 OID 15946333)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2674 (class 1259 OID 15946597)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2648 (class 1259 OID 15946504)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 15946505)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2522 (class 1259 OID 15946086)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2442 (class 1259 OID 15945852)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2512 (class 1259 OID 15946059)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2720 (class 2606 OID 15946784)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2723 (class 2606 OID 15946769)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2722 (class 2606 OID 15946774)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2718 (class 2606 OID 15946794)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2724 (class 2606 OID 15946764)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2719 (class 2606 OID 15946789)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2721 (class 2606 OID 15946779)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2757 (class 2606 OID 15946949)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2756 (class 2606 OID 15946954)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2755 (class 2606 OID 15946959)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2790 (class 2606 OID 15947129)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2791 (class 2606 OID 15947124)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2705 (class 2606 OID 15946699)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2741 (class 2606 OID 15946879)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2785 (class 2606 OID 15947109)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2786 (class 2606 OID 15947104)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2784 (class 2606 OID 15947114)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2787 (class 2606 OID 15947099)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2788 (class 2606 OID 15947094)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2739 (class 2606 OID 15946874)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2740 (class 2606 OID 15946869)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2717 (class 2606 OID 15946759)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2751 (class 2606 OID 15946919)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2749 (class 2606 OID 15946929)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2750 (class 2606 OID 15946924)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2711 (class 2606 OID 15946734)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2712 (class 2606 OID 15946729)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2737 (class 2606 OID 15946859)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2781 (class 2606 OID 15947079)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2760 (class 2606 OID 15946964)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2759 (class 2606 OID 15946969)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2758 (class 2606 OID 15946974)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2789 (class 2606 OID 15947119)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2762 (class 2606 OID 15946994)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2765 (class 2606 OID 15946979)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2761 (class 2606 OID 15946999)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2763 (class 2606 OID 15946989)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2764 (class 2606 OID 15946984)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2709 (class 2606 OID 15946724)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2710 (class 2606 OID 15946719)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2701 (class 2606 OID 15946684)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2702 (class 2606 OID 15946679)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2745 (class 2606 OID 15946899)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2725 (class 2606 OID 15946799)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2698 (class 2606 OID 15946659)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2697 (class 2606 OID 15946664)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2746 (class 2606 OID 15946914)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2747 (class 2606 OID 15946909)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2748 (class 2606 OID 15946904)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2715 (class 2606 OID 15946739)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2713 (class 2606 OID 15946749)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2714 (class 2606 OID 15946744)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2783 (class 2606 OID 15947089)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2729 (class 2606 OID 15946834)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2731 (class 2606 OID 15946824)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2732 (class 2606 OID 15946819)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2730 (class 2606 OID 15946829)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2696 (class 2606 OID 15946649)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2695 (class 2606 OID 15946654)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2742 (class 2606 OID 15946884)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2794 (class 2606 OID 15947144)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2796 (class 2606 OID 15947149)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2795 (class 2606 OID 15947154)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2738 (class 2606 OID 15946864)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2754 (class 2606 OID 15946939)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2753 (class 2606 OID 15946944)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2772 (class 2606 OID 15947054)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2773 (class 2606 OID 15947049)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2776 (class 2606 OID 15947034)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2775 (class 2606 OID 15947039)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2774 (class 2606 OID 15947044)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2707 (class 2606 OID 15946709)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2708 (class 2606 OID 15946704)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2706 (class 2606 OID 15946714)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2743 (class 2606 OID 15946894)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2744 (class 2606 OID 15946889)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2779 (class 2606 OID 15947064)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2778 (class 2606 OID 15947069)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2769 (class 2606 OID 15947024)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2768 (class 2606 OID 15947029)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2771 (class 2606 OID 15947014)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2770 (class 2606 OID 15947019)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2752 (class 2606 OID 15946934)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2733 (class 2606 OID 15946854)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2734 (class 2606 OID 15946849)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2736 (class 2606 OID 15946839)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2735 (class 2606 OID 15946844)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2766 (class 2606 OID 15947009)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2767 (class 2606 OID 15947004)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2777 (class 2606 OID 15947059)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2716 (class 2606 OID 15946754)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2780 (class 2606 OID 15947074)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2782 (class 2606 OID 15947084)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2793 (class 2606 OID 15947134)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2792 (class 2606 OID 15947139)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2699 (class 2606 OID 15946674)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2700 (class 2606 OID 15946669)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2704 (class 2606 OID 15946689)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2703 (class 2606 OID 15946694)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2726 (class 2606 OID 15946814)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2727 (class 2606 OID 15946809)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2728 (class 2606 OID 15946804)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-27 16:24:04 CEST

--
-- PostgreSQL database dump complete
--

