--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-04 09:49:34 CEST

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
-- TOC entry 178 (class 1259 OID 17262043)
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
-- TOC entry 223 (class 1259 OID 17262557)
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
-- TOC entry 222 (class 1259 OID 17262540)
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
-- TOC entry 216 (class 1259 OID 17262450)
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
-- TOC entry 239 (class 1259 OID 17262805)
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
-- TOC entry 192 (class 1259 OID 17262221)
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
-- TOC entry 194 (class 1259 OID 17262252)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 17262707)
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
-- TOC entry 187 (class 1259 OID 17262164)
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
-- TOC entry 224 (class 1259 OID 17262570)
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
-- TOC entry 210 (class 1259 OID 17262385)
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
-- TOC entry 190 (class 1259 OID 17262200)
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
-- TOC entry 188 (class 1259 OID 17262181)
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
-- TOC entry 199 (class 1259 OID 17262299)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 237 (class 1259 OID 17262786)
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
-- TOC entry 238 (class 1259 OID 17262798)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 17262820)
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
-- TOC entry 203 (class 1259 OID 17262324)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 185 (class 1259 OID 17262138)
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
-- TOC entry 179 (class 1259 OID 17262052)
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
-- TOC entry 180 (class 1259 OID 17262063)
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
-- TOC entry 175 (class 1259 OID 17262017)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 17262036)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 17262331)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 17262365)
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
-- TOC entry 219 (class 1259 OID 17262489)
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
-- TOC entry 182 (class 1259 OID 17262096)
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
-- TOC entry 184 (class 1259 OID 17262130)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 17262305)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 183 (class 1259 OID 17262115)
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
-- TOC entry 189 (class 1259 OID 17262193)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid
);


--
-- TOC entry 202 (class 1259 OID 17262317)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 17262668)
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
-- TOC entry 227 (class 1259 OID 17262678)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 17262625)
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
-- TOC entry 228 (class 1259 OID 17262686)
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
-- TOC entry 206 (class 1259 OID 17262346)
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
-- TOC entry 198 (class 1259 OID 17262290)
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
-- TOC entry 197 (class 1259 OID 17262280)
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
-- TOC entry 218 (class 1259 OID 17262478)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 17262417)
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
-- TOC entry 172 (class 1259 OID 17261988)
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
-- TOC entry 171 (class 1259 OID 17261986)
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
-- TOC entry 207 (class 1259 OID 17262359)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 176 (class 1259 OID 17262026)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 174 (class 1259 OID 17262010)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 17262373)
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
-- TOC entry 201 (class 1259 OID 17262311)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 17262257)
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
-- TOC entry 233 (class 1259 OID 17262727)
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
-- TOC entry 232 (class 1259 OID 17262719)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 17262714)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 17262427)
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
-- TOC entry 181 (class 1259 OID 17262088)
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
-- TOC entry 196 (class 1259 OID 17262267)
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
-- TOC entry 217 (class 1259 OID 17262467)
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
-- TOC entry 229 (class 1259 OID 17262696)
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
-- TOC entry 186 (class 1259 OID 17262150)
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
-- TOC entry 173 (class 1259 OID 17261997)
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
-- TOC entry 221 (class 1259 OID 17262515)
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
-- TOC entry 191 (class 1259 OID 17262211)
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
-- TOC entry 205 (class 1259 OID 17262338)
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
-- TOC entry 215 (class 1259 OID 17262441)
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
-- TOC entry 235 (class 1259 OID 17262766)
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
-- TOC entry 234 (class 1259 OID 17262738)
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
-- TOC entry 236 (class 1259 OID 17262778)
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
-- TOC entry 212 (class 1259 OID 17262410)
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
-- TOC entry 193 (class 1259 OID 17262247)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 17262505)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 17262400)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 17261991)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2911 (class 0 OID 17262043)
-- Dependencies: 178
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2956 (class 0 OID 17262557)
-- Dependencies: 223
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55e9-4d0c-39c6-1aba026b9085	000d0000-55e9-4d0c-ffe2-841148fd245b	\N	00090000-55e9-4d0c-1329-0c3a726eb0e6	000b0000-55e9-4d0c-0100-e258904c4604	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-55e9-4d0c-4d60-43ca7c6abba6	000d0000-55e9-4d0c-602e-cdfe8a9d1462	00100000-55e9-4d0c-553d-7d6b679eecdb	00090000-55e9-4d0c-14a7-19a6db6fd815	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-55e9-4d0c-3a7c-ffe32860800f	000d0000-55e9-4d0c-cfbb-824a1592fc18	00100000-55e9-4d0c-6ac7-2036eddd89fb	00090000-55e9-4d0c-d19c-5c2cdacfcbe0	\N	0003	t	\N	2015-09-04	\N	2	t	\N	f	f
000c0000-55e9-4d0c-de4d-e58ab83f4a6e	000d0000-55e9-4d0c-dd5a-ca37026d4884	\N	00090000-55e9-4d0c-d313-48dced030e90	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-55e9-4d0c-9edf-3025ce76e016	000d0000-55e9-4d0c-9296-d7caf29cf4f2	\N	00090000-55e9-4d0c-f3b1-d9d64a01255b	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-55e9-4d0c-dc1b-598495fc2409	000d0000-55e9-4d0c-0e64-efcd1cec2201	\N	00090000-55e9-4d0c-2711-53c37d2c308b	000b0000-55e9-4d0c-1019-4279f58f8ff1	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-55e9-4d0c-179b-3a0cf0e9d480	000d0000-55e9-4d0c-29a1-8eb7f5a5ae18	00100000-55e9-4d0c-5b99-fa2e8832cf62	00090000-55e9-4d0c-568e-de1cd397f946	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-55e9-4d0c-2182-8bbeab74bc07	000d0000-55e9-4d0c-bccf-4c65cba827be	\N	00090000-55e9-4d0c-4d93-e27a12f0fc30	000b0000-55e9-4d0c-7f3a-31f9f83396bf	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-55e9-4d0c-7959-bf2198b658dd	000d0000-55e9-4d0c-29a1-8eb7f5a5ae18	00100000-55e9-4d0c-edc9-b76535b1ad02	00090000-55e9-4d0c-6981-acf7ea1436ec	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-55e9-4d0c-65f8-9674a1b051ea	000d0000-55e9-4d0c-29a1-8eb7f5a5ae18	00100000-55e9-4d0c-16f6-d55ed4abadd1	00090000-55e9-4d0c-693d-02f6c0a37165	\N	0010	t	\N	2015-09-04	\N	16	f	\N	f	t
000c0000-55e9-4d0c-6d71-7a0bc0c2b3d6	000d0000-55e9-4d0c-29a1-8eb7f5a5ae18	00100000-55e9-4d0c-878c-f36c2c0e9b37	00090000-55e9-4d0c-7613-dd88df42dfc6	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
\.


--
-- TOC entry 2955 (class 0 OID 17262540)
-- Dependencies: 222
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 17262450)
-- Dependencies: 216
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55e9-4d0c-1761-4dad6e19b34f	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55e9-4d0c-a9c1-34bfe6615b62	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55e9-4d0c-b754-256b0942fe8c	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2972 (class 0 OID 17262805)
-- Dependencies: 239
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2925 (class 0 OID 17262221)
-- Dependencies: 192
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-55e9-4d0c-6898-69003a28a1b6	\N	\N	00200000-55e9-4d0c-0699-7f3d5382e225	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55e9-4d0c-0d54-34bf08cbad1b	\N	\N	00200000-55e9-4d0c-ea5d-cf7a657bef53	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55e9-4d0c-afbb-2485ce6f3b30	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55e9-4d0c-f7fc-638f45a21a8a	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55e9-4d0c-1a17-1ef7f3314058	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2927 (class 0 OID 17262252)
-- Dependencies: 194
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 2963 (class 0 OID 17262707)
-- Dependencies: 230
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 17262164)
-- Dependencies: 187
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55e9-4d0a-8b85-9a4db9184532	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55e9-4d0a-c755-612f6643634b	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55e9-4d0a-47ac-35e184f485bd	AL	ALB	008	Albania 	Albanija	\N
00040000-55e9-4d0a-1912-2cc0fd58b980	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55e9-4d0a-bdcc-54099d886df4	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55e9-4d0a-dd67-bcec2542a24e	AD	AND	020	Andorra 	Andora	\N
00040000-55e9-4d0a-c372-9aab1a3bb80e	AO	AGO	024	Angola 	Angola	\N
00040000-55e9-4d0a-b370-17dfd4b9a80a	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55e9-4d0a-e4ba-9f3b58ebf2d0	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55e9-4d0a-bc2a-e9456a0a825d	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55e9-4d0a-33fa-06c6bba3f85f	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55e9-4d0a-8b9f-1a2f1817f46d	AM	ARM	051	Armenia 	Armenija	\N
00040000-55e9-4d0a-3460-249936611133	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55e9-4d0a-d8de-5ec850f3593c	AU	AUS	036	Australia 	Avstralija	\N
00040000-55e9-4d0a-3589-f0e6347f7b8f	AT	AUT	040	Austria 	Avstrija	\N
00040000-55e9-4d0a-d850-f44848efe072	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55e9-4d0a-bc49-3732385b45be	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55e9-4d0a-104f-9ac7ee363e7c	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55e9-4d0a-efed-6ba90a8e98d9	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55e9-4d0a-295e-62326aaafe5d	BB	BRB	052	Barbados 	Barbados	\N
00040000-55e9-4d0a-95c8-169f5a064f7d	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55e9-4d0a-1d86-7d5790d03d39	BE	BEL	056	Belgium 	Belgija	\N
00040000-55e9-4d0a-4334-a61733a01f49	BZ	BLZ	084	Belize 	Belize	\N
00040000-55e9-4d0a-6def-ffd814798a5f	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55e9-4d0a-1436-18e9676f4f3c	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55e9-4d0a-f2c7-65d13a7f1762	BT	BTN	064	Bhutan 	Butan	\N
00040000-55e9-4d0a-5f27-fa55425af4cd	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55e9-4d0a-63ef-824e8d29a66e	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55e9-4d0a-f6ca-87be95767e5f	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55e9-4d0a-0496-4a11712a9dc7	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55e9-4d0a-de77-2f8e8a9b93b5	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55e9-4d0a-ce33-bbbf4da483ce	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55e9-4d0a-6335-5189f4bb73bd	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55e9-4d0a-d16d-db7424369d02	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55e9-4d0a-5335-0fe4403c7f29	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55e9-4d0a-5a47-57826bd64258	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55e9-4d0a-b81a-d29588e816d3	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55e9-4d0a-bb7f-79dd30ca88f9	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55e9-4d0a-554f-d1cda34c9e04	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55e9-4d0a-de68-ad02f2cb149b	CA	CAN	124	Canada 	Kanada	\N
00040000-55e9-4d0a-0bbc-2edf8251f77c	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55e9-4d0a-0124-1d40997d6716	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55e9-4d0a-bc84-d4c53ac307f4	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55e9-4d0a-1ea5-ccdbfafcff10	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55e9-4d0a-8ebe-7c451bde03de	CL	CHL	152	Chile 	Čile	\N
00040000-55e9-4d0a-4a58-8b4586a158dc	CN	CHN	156	China 	Kitajska	\N
00040000-55e9-4d0a-6636-6d5ee75c482b	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55e9-4d0a-7077-aff33f1fbffc	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55e9-4d0a-c87e-e30c91bd7676	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55e9-4d0a-58a5-16e30b69185c	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55e9-4d0a-8309-ce5951045bfb	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55e9-4d0a-59cb-64a01a85e25d	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55e9-4d0a-cd4d-216f44df463f	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55e9-4d0a-7fa1-6ff76f66e8c7	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55e9-4d0a-31a0-d4f832e79322	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55e9-4d0a-7c8e-6a77f7dfe2b6	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55e9-4d0a-587b-79677aee76bb	CU	CUB	192	Cuba 	Kuba	\N
00040000-55e9-4d0a-ec12-377291c1cddd	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55e9-4d0a-fb87-bd0235ada2dd	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55e9-4d0a-6292-77309059c309	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55e9-4d0a-2526-1392b275c67d	DK	DNK	208	Denmark 	Danska	\N
00040000-55e9-4d0a-5a7b-317c996276f7	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55e9-4d0a-e4e2-d1a6984cead0	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55e9-4d0a-423c-871a6149a52a	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55e9-4d0a-fca1-4a40678315f4	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55e9-4d0a-d0d3-54faf8c56fd5	EG	EGY	818	Egypt 	Egipt	\N
00040000-55e9-4d0a-87a2-489f0c8403de	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55e9-4d0a-03f5-834434bec22c	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55e9-4d0a-85dd-33103d01cbc4	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55e9-4d0a-d01c-d6a0c3f0e0ae	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55e9-4d0a-25c3-599b9f1b0af2	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55e9-4d0a-247a-9337278f4a80	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55e9-4d0a-ce80-fa476623d092	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55e9-4d0a-1ea2-f487efc44336	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55e9-4d0a-2d94-a641c862c86b	FI	FIN	246	Finland 	Finska	\N
00040000-55e9-4d0a-1e23-3d065968c13b	FR	FRA	250	France 	Francija	\N
00040000-55e9-4d0a-d6f8-35abed3db9ed	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55e9-4d0a-a021-350091c72f29	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55e9-4d0a-0fc7-dfdd37028a26	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55e9-4d0a-840c-87bd25108b84	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55e9-4d0a-ba3f-abeb13bfe94d	GA	GAB	266	Gabon 	Gabon	\N
00040000-55e9-4d0a-e970-945ff887da19	GM	GMB	270	Gambia 	Gambija	\N
00040000-55e9-4d0a-00b0-7f15b436cbb1	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55e9-4d0a-0290-9b8b5bdbdb07	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55e9-4d0a-843d-62473deb4209	GH	GHA	288	Ghana 	Gana	\N
00040000-55e9-4d0a-2a80-59fe9f1afaf5	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55e9-4d0a-c539-c5da467b9d5c	GR	GRC	300	Greece 	Grčija	\N
00040000-55e9-4d0a-907f-664eb220f9b4	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55e9-4d0a-af9d-ad1149ac82ea	GD	GRD	308	Grenada 	Grenada	\N
00040000-55e9-4d0a-8cd7-5cd2f7d7184b	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55e9-4d0a-0cee-9a9cf52eb564	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55e9-4d0a-02e3-306163fa083c	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55e9-4d0a-16a7-a4f4cabdef1e	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55e9-4d0a-c2da-2cfee70ae999	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55e9-4d0a-0bbb-9f61c6fafa5e	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55e9-4d0a-b276-2e09d6f5e6b7	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55e9-4d0a-5947-a29aa51aeabf	HT	HTI	332	Haiti 	Haiti	\N
00040000-55e9-4d0a-3e31-55c97a81d2a5	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55e9-4d0a-4b3c-f457dd4a9244	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55e9-4d0a-7ed0-315f0de38859	HN	HND	340	Honduras 	Honduras	\N
00040000-55e9-4d0a-656d-9181f4554170	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55e9-4d0a-4bad-b79c3a113ffd	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55e9-4d0a-f141-2b2e0bbf3f85	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55e9-4d0a-eb3c-5e01d407a386	IN	IND	356	India 	Indija	\N
00040000-55e9-4d0a-11c1-6204699b52f5	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55e9-4d0a-9c5d-5eda94fffc07	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55e9-4d0a-bdf1-4583ccf5f000	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55e9-4d0a-1f01-08f71f85e266	IE	IRL	372	Ireland 	Irska	\N
00040000-55e9-4d0a-1f42-8ca58878f990	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55e9-4d0a-b55b-8f94baabff43	IL	ISR	376	Israel 	Izrael	\N
00040000-55e9-4d0a-0537-717d13feb664	IT	ITA	380	Italy 	Italija	\N
00040000-55e9-4d0a-2a90-4d5663911d67	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55e9-4d0a-83d7-8db5c9362932	JP	JPN	392	Japan 	Japonska	\N
00040000-55e9-4d0a-ced5-e26044e6128b	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55e9-4d0a-407f-03f1490ded8e	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55e9-4d0a-f648-991b7ceefb9d	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55e9-4d0a-fb3e-9fc9a128d4b6	KE	KEN	404	Kenya 	Kenija	\N
00040000-55e9-4d0a-3ce7-82fd0286e298	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55e9-4d0a-77de-083a35539c1c	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55e9-4d0a-8ecc-c26afe87a25d	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55e9-4d0a-d9e3-6ce500617357	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55e9-4d0a-f74e-fda28b96271f	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55e9-4d0a-a90c-32ce072e5973	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55e9-4d0a-05d2-aa0a7b8d8983	LV	LVA	428	Latvia 	Latvija	\N
00040000-55e9-4d0a-7647-f5ba54a09723	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55e9-4d0a-d4da-1ff6635361d0	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55e9-4d0a-d63e-6b02d5bd66b3	LR	LBR	430	Liberia 	Liberija	\N
00040000-55e9-4d0a-af75-5940d1770a5c	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55e9-4d0a-a6fe-6cb8413aaaa7	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55e9-4d0a-2aa5-fc9ef9eaeace	LT	LTU	440	Lithuania 	Litva	\N
00040000-55e9-4d0a-081b-1b647402ff81	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55e9-4d0a-b969-a5336342c46d	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55e9-4d0a-f368-5c8125381a3f	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55e9-4d0a-7b9a-b6bd59768481	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55e9-4d0a-7f7b-b158dd44303d	MW	MWI	454	Malawi 	Malavi	\N
00040000-55e9-4d0a-28be-1479b6d4a59b	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55e9-4d0a-ae8d-7a36c17c050b	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55e9-4d0a-6e45-9f992da29324	ML	MLI	466	Mali 	Mali	\N
00040000-55e9-4d0a-6384-9b3a58a3f295	MT	MLT	470	Malta 	Malta	\N
00040000-55e9-4d0a-dc7d-07c3fe095aa0	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55e9-4d0a-aef2-d83b7f328f40	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55e9-4d0a-9faf-6de46e453be6	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55e9-4d0a-8e3d-68bffeafc6f1	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55e9-4d0a-eb57-84cc025edd35	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55e9-4d0a-e8b3-c355731e9697	MX	MEX	484	Mexico 	Mehika	\N
00040000-55e9-4d0a-1c44-d99e207da45b	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55e9-4d0a-7922-ba9c7a0111ad	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55e9-4d0a-0273-ab052085ee61	MC	MCO	492	Monaco 	Monako	\N
00040000-55e9-4d0a-7295-a1d5e5272eab	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55e9-4d0a-050e-9fbac6ccc148	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55e9-4d0a-bd01-7bd48da0ecf1	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55e9-4d0a-afd5-044d9c612eb6	MA	MAR	504	Morocco 	Maroko	\N
00040000-55e9-4d0a-745e-953faf2a95df	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55e9-4d0a-d391-6aa6722df041	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55e9-4d0a-986f-49ff39501eb7	NA	NAM	516	Namibia 	Namibija	\N
00040000-55e9-4d0a-d10d-7f3d64e768c4	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55e9-4d0a-a976-d7a8880221fc	NP	NPL	524	Nepal 	Nepal	\N
00040000-55e9-4d0a-6136-592994181463	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55e9-4d0a-5776-b2fc6152c20a	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55e9-4d0a-0f8e-36694ece5d17	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55e9-4d0a-01ee-97677ffe0b13	NE	NER	562	Niger 	Niger 	\N
00040000-55e9-4d0a-ef71-774a9b3ccf53	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55e9-4d0a-9038-40c05d34719b	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55e9-4d0a-0df8-5b5d48d6256b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55e9-4d0a-f776-bceae9553ae6	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55e9-4d0a-50a6-15ea8e9b72c5	NO	NOR	578	Norway 	Norveška	\N
00040000-55e9-4d0a-266d-d57f8a88dc17	OM	OMN	512	Oman 	Oman	\N
00040000-55e9-4d0a-5d18-eeff28bdbbfc	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55e9-4d0a-affd-fb9ff1d39aa3	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55e9-4d0a-eaa0-a9643bc5ee45	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55e9-4d0a-1456-3568cd9365b8	PA	PAN	591	Panama 	Panama	\N
00040000-55e9-4d0a-5767-8f83845d19de	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55e9-4d0a-9d73-53a25bddebfb	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55e9-4d0a-eb51-373931323fce	PE	PER	604	Peru 	Peru	\N
00040000-55e9-4d0a-4c50-c746d056dabf	PH	PHL	608	Philippines 	Filipini	\N
00040000-55e9-4d0a-3a2c-af3e74dc46b1	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55e9-4d0a-a2a3-0bd70a82e3c7	PL	POL	616	Poland 	Poljska	\N
00040000-55e9-4d0a-b98e-15a1a9f6f18a	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55e9-4d0a-1dcd-d1826475ddec	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55e9-4d0a-a4b1-154fd2853f27	QA	QAT	634	Qatar 	Katar	\N
00040000-55e9-4d0a-4e5f-39dcb0743d3c	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55e9-4d0a-bac8-34c95e0ac537	RO	ROU	642	Romania 	Romunija	\N
00040000-55e9-4d0a-485b-9f840ac2d43f	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55e9-4d0a-0628-df29eb019b4b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55e9-4d0a-73fc-73873c512569	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55e9-4d0a-f3ff-44b8d7235a8e	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55e9-4d0a-560b-a2e455b93d60	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55e9-4d0a-586e-50ae29e08108	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55e9-4d0a-20a4-8c401e835a79	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55e9-4d0a-9227-0651317a68c8	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55e9-4d0a-40e6-18d907038b2d	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55e9-4d0a-a48c-4347bc724a1f	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55e9-4d0a-3152-4f5d0824e1d2	SM	SMR	674	San Marino 	San Marino	\N
00040000-55e9-4d0a-c7bf-19fa9959f12e	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55e9-4d0a-7d40-89c7ee5e8038	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55e9-4d0a-f0d3-1cea99fb2ad5	SN	SEN	686	Senegal 	Senegal	\N
00040000-55e9-4d0a-9820-1dc934c92c0b	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55e9-4d0a-25c5-593134167ae4	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55e9-4d0a-0ba3-91faf48ec79a	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55e9-4d0a-ac71-a681c95cfaf6	SG	SGP	702	Singapore 	Singapur	\N
00040000-55e9-4d0a-2e48-4cc4e2e8cdcd	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55e9-4d0a-54ab-da3eb5b01470	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55e9-4d0a-cce7-0052ec7466f0	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55e9-4d0a-9d4d-8f089fad9148	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55e9-4d0a-31e5-90b1756faa15	SO	SOM	706	Somalia 	Somalija	\N
00040000-55e9-4d0a-2141-8ec5fe731ad1	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55e9-4d0a-150a-18b981040048	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55e9-4d0a-490f-ce590aab0276	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55e9-4d0a-5720-1879ccbd2c56	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55e9-4d0a-fd2f-7c479203382a	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55e9-4d0a-6846-f37095dca393	SD	SDN	729	Sudan 	Sudan	\N
00040000-55e9-4d0a-f988-2836b5932ecf	SR	SUR	740	Suriname 	Surinam	\N
00040000-55e9-4d0a-191c-d70e6054dd6c	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55e9-4d0a-1882-091fbb1ab030	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55e9-4d0a-3c6f-37fd3d615794	SE	SWE	752	Sweden 	Švedska	\N
00040000-55e9-4d0a-d192-5413f70ae082	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55e9-4d0a-4292-155d47394e61	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55e9-4d0a-304d-d6d415b62987	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55e9-4d0a-0379-0604027c1544	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55e9-4d0a-bc0a-319e496462a3	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55e9-4d0a-34e6-16f1a057c9fd	TH	THA	764	Thailand 	Tajska	\N
00040000-55e9-4d0a-7cb5-a53aa7efac6c	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55e9-4d0a-4cee-bebb0226bd56	TG	TGO	768	Togo 	Togo	\N
00040000-55e9-4d0a-1377-3dbd0c88ed54	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55e9-4d0a-4f94-be2f648f9815	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55e9-4d0a-27e4-32e04d7cfcb4	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55e9-4d0b-039e-3dce8f5fd1ea	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55e9-4d0b-d8c4-ba970113d317	TR	TUR	792	Turkey 	Turčija	\N
00040000-55e9-4d0b-4f51-6439c57ce1c2	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55e9-4d0b-2be9-601301bceda4	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55e9-4d0b-eb33-2b44ff2c74a7	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55e9-4d0b-9d56-168f8ebf4f79	UG	UGA	800	Uganda 	Uganda	\N
00040000-55e9-4d0b-c97d-8e3d47994593	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55e9-4d0b-91dd-38856c1e9fe5	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55e9-4d0b-cd81-008f4b021b48	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55e9-4d0b-b731-0917aab0d971	US	USA	840	United States 	Združene države Amerike	\N
00040000-55e9-4d0b-53bc-f8d7971d92d6	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55e9-4d0b-c651-2e77f4402bdf	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55e9-4d0b-b259-e658929623ea	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55e9-4d0b-3bc0-4268ae1648ca	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55e9-4d0b-d69b-6db20a02f465	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55e9-4d0b-98ee-fae15f8fed11	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55e9-4d0b-5c47-595ac67a31d7	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55e9-4d0b-b91c-92d5579ae947	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55e9-4d0b-2f3f-b8d5c051f546	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55e9-4d0b-2f18-d8b7dd2629bc	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55e9-4d0b-677d-3ce6c418d14e	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55e9-4d0b-e604-b0b66e14b252	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55e9-4d0b-bd8e-b317d67539ec	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2957 (class 0 OID 17262570)
-- Dependencies: 224
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55e9-4d0c-20c8-b06454bc2082	000e0000-55e9-4d0c-8d97-2f9f83336043	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e9-4d0a-1548-236c62571426	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55e9-4d0c-470b-75901303cc43	000e0000-55e9-4d0c-3a43-3e9f2e2fd6f2	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e9-4d0a-6791-83d5d2b74c2b	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55e9-4d0c-9007-94f58a4d1980	000e0000-55e9-4d0c-4c83-408bd8c1cc2d	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55e9-4d0a-1548-236c62571426	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55e9-4d0c-a8b9-0b6819582462	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55e9-4d0c-b0db-068e565533ea	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2943 (class 0 OID 17262385)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55e9-4d0c-ffe2-841148fd245b	000e0000-55e9-4d0c-3a43-3e9f2e2fd6f2	000c0000-55e9-4d0c-39c6-1aba026b9085	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55e9-4d0a-9b6e-338f872f18e6
000d0000-55e9-4d0c-602e-cdfe8a9d1462	000e0000-55e9-4d0c-3a43-3e9f2e2fd6f2	000c0000-55e9-4d0c-4d60-43ca7c6abba6	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55e9-4d0a-8ed5-c0f1815da950
000d0000-55e9-4d0c-cfbb-824a1592fc18	000e0000-55e9-4d0c-3a43-3e9f2e2fd6f2	000c0000-55e9-4d0c-3a7c-ffe32860800f	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55e9-4d0a-745a-d6acc80f76fc
000d0000-55e9-4d0c-dd5a-ca37026d4884	000e0000-55e9-4d0c-3a43-3e9f2e2fd6f2	000c0000-55e9-4d0c-de4d-e58ab83f4a6e	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55e9-4d0a-b502-5e5504492d9c
000d0000-55e9-4d0c-9296-d7caf29cf4f2	000e0000-55e9-4d0c-3a43-3e9f2e2fd6f2	000c0000-55e9-4d0c-9edf-3025ce76e016	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55e9-4d0a-b502-5e5504492d9c
000d0000-55e9-4d0c-0e64-efcd1cec2201	000e0000-55e9-4d0c-3a43-3e9f2e2fd6f2	000c0000-55e9-4d0c-dc1b-598495fc2409	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55e9-4d0a-9b6e-338f872f18e6
000d0000-55e9-4d0c-29a1-8eb7f5a5ae18	000e0000-55e9-4d0c-3a43-3e9f2e2fd6f2	000c0000-55e9-4d0c-7959-bf2198b658dd	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55e9-4d0a-9b6e-338f872f18e6
000d0000-55e9-4d0c-bccf-4c65cba827be	000e0000-55e9-4d0c-3a43-3e9f2e2fd6f2	000c0000-55e9-4d0c-2182-8bbeab74bc07	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55e9-4d0a-2028-b72aea3cd0a8
\.


--
-- TOC entry 2923 (class 0 OID 17262200)
-- Dependencies: 190
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2921 (class 0 OID 17262181)
-- Dependencies: 188
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55e9-4d0c-39b3-ba80e49f4137	00080000-55e9-4d0c-1606-9e05a98b3fd6	00090000-55e9-4d0c-693d-02f6c0a37165	AK		
\.


--
-- TOC entry 2932 (class 0 OID 17262299)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 17262786)
-- Dependencies: 237
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 17262798)
-- Dependencies: 238
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2973 (class 0 OID 17262820)
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
-- TOC entry 2936 (class 0 OID 17262324)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2918 (class 0 OID 17262138)
-- Dependencies: 185
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55e9-4d0b-48cf-52e95e6c3e4f	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55e9-4d0b-bab5-6e59f876ca56	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55e9-4d0b-7a62-c43dc1187223	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55e9-4d0b-d9f2-6ee71ddfc86b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55e9-4d0b-bae1-f1c580673c18	dogodek.status	array	a:7:{i:100;a:1:{s:5:"label";s:11:"Dolgoročno";}i:200;a:1:{s:5:"label";s:9:"Planirano";}i:300;a:1:{s:5:"label";s:8:"Fiksiran";}i:400;a:1:{s:5:"label";s:17:"Potrjen - interno";}i:500;a:1:{s:5:"label";s:15:"Potrjen - javno";}i:600;a:1:{s:5:"label";s:10:"Zaključen";}i:700;a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-55e9-4d0b-7339-6427551e93d1	dogodek.razred	array	a:5:{i:100;a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}i:200;a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}i:300;a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}i:400;a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}i:500;a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-55e9-4d0b-58e7-5691e878eef7	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55e9-4d0b-2c36-2c06b54f01e6	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55e9-4d0b-893e-895f8e8ffe5c	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55e9-4d0b-39f4-1814aa2807d6	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55e9-4d0b-5dee-24f760d4aebe	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55e9-4d0b-d882-5a0c539ff526	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55e9-4d0b-811a-8345d58c41a0	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55e9-4d0b-edb3-dd232b14964b	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55e9-4d0c-a248-a9dce9b7fa96	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55e9-4d0c-664a-fd38559c89e6	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55e9-4d0c-5350-ce5ff391c4b9	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55e9-4d0c-897f-8bb053bb5abf	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55e9-4d0c-4533-e03397106ca0	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55e9-4d0d-8a88-9079bd938d43	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2912 (class 0 OID 17262052)
-- Dependencies: 179
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55e9-4d0c-c04b-2a7755616f75	00000000-55e9-4d0c-a248-a9dce9b7fa96	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55e9-4d0c-e2de-3482a45dba72	00000000-55e9-4d0c-a248-a9dce9b7fa96	00010000-55e9-4d0b-887d-90fc2a27b9cc	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55e9-4d0c-2d11-f9fa0d4d455f	00000000-55e9-4d0c-664a-fd38559c89e6	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2913 (class 0 OID 17262063)
-- Dependencies: 180
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55e9-4d0c-1329-0c3a726eb0e6	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55e9-4d0c-d313-48dced030e90	00010000-55e9-4d0c-13f1-ecd0567c0413	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55e9-4d0c-d19c-5c2cdacfcbe0	00010000-55e9-4d0c-4220-ad21c83433e7	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55e9-4d0c-6981-acf7ea1436ec	00010000-55e9-4d0c-c72a-ba3677afeb72	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55e9-4d0c-c9c4-da25d8984faa	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55e9-4d0c-2711-53c37d2c308b	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55e9-4d0c-7613-dd88df42dfc6	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55e9-4d0c-568e-de1cd397f946	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55e9-4d0c-693d-02f6c0a37165	00010000-55e9-4d0c-182f-6d105818bce6	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55e9-4d0c-14a7-19a6db6fd815	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55e9-4d0c-6003-bdb14dc5ecb6	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55e9-4d0c-f3b1-d9d64a01255b	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55e9-4d0c-4d93-e27a12f0fc30	00010000-55e9-4d0c-966b-4b04e7cf02f9	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2908 (class 0 OID 17262017)
-- Dependencies: 175
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55e9-4d0b-d512-6ed3187d6428	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55e9-4d0b-6f2c-ebe2b0cd70cd	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55e9-4d0b-1f82-676e7c360e2d	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55e9-4d0b-4ac0-bab6df7698fa	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55e9-4d0b-a066-c46b814fb9a1	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55e9-4d0b-7330-a47223ecf3f4	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55e9-4d0b-00ba-c7b4f2c87043	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-55e9-4d0b-93e9-cdfcbce88c21	Abonma-read	Abonma - branje	f
00030000-55e9-4d0b-5e29-e3f8d497b341	Abonma-write	Abonma - spreminjanje	f
00030000-55e9-4d0b-3460-76f467c98eb4	Alternacija-read	Alternacija - branje	f
00030000-55e9-4d0b-6f89-68e73e7499df	Alternacija-write	Alternacija - spreminjanje	f
00030000-55e9-4d0b-a11a-585faa22b503	Arhivalija-read	Arhivalija - branje	f
00030000-55e9-4d0b-14d8-4b533ce1835d	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55e9-4d0b-de2d-d40e1d59979e	Besedilo-read	Besedilo - branje	f
00030000-55e9-4d0b-ce98-9727d7c2c76b	Besedilo-write	Besedilo - spreminjanje	f
00030000-55e9-4d0b-6555-77c57a044ae0	DogodekIzven-read	DogodekIzven - branje	f
00030000-55e9-4d0b-f62e-e4155f64d72d	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55e9-4d0b-52b3-5b990342abbd	Dogodek-read	Dogodek - branje	f
00030000-55e9-4d0b-f5ca-2657b68115e8	Dogodek-write	Dogodek - spreminjanje	f
00030000-55e9-4d0b-316a-6dc4a98028cd	DrugiVir-read	DrugiVir - branje	f
00030000-55e9-4d0b-1a0a-75552e230e05	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55e9-4d0b-8694-51c1074c2483	Drzava-read	Drzava - branje	f
00030000-55e9-4d0b-f24e-1c77c782781a	Drzava-write	Drzava - spreminjanje	f
00030000-55e9-4d0b-7dc4-c4b32ad0acb5	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55e9-4d0b-7063-f42c5bdc1a63	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55e9-4d0b-7f04-07b5c50a907d	Funkcija-read	Funkcija - branje	f
00030000-55e9-4d0b-2cbb-07e6e3ddebfc	Funkcija-write	Funkcija - spreminjanje	f
00030000-55e9-4d0b-5826-41ce40762e2f	Gostovanje-read	Gostovanje - branje	f
00030000-55e9-4d0b-2637-1c1f10096070	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55e9-4d0b-02b7-45da764c86da	Gostujoca-read	Gostujoca - branje	f
00030000-55e9-4d0b-5027-59f8fad8c1d5	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55e9-4d0b-0ce8-e0562f75d5d8	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55e9-4d0b-b3cd-56d5a9de3db1	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55e9-4d0b-96f5-c84d12a03222	Kupec-read	Kupec - branje	f
00030000-55e9-4d0b-e89a-d015fb2dbe6b	Kupec-write	Kupec - spreminjanje	f
00030000-55e9-4d0b-9691-dd2dbc9db35e	NacinPlacina-read	NacinPlacina - branje	f
00030000-55e9-4d0b-0ce1-665908a8eb30	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55e9-4d0b-a72c-fcc6cdde1458	Option-read	Option - branje	f
00030000-55e9-4d0b-f46d-eebc970deee5	Option-write	Option - spreminjanje	f
00030000-55e9-4d0b-ddbf-614d859f3fd5	OptionValue-read	OptionValue - branje	f
00030000-55e9-4d0b-1b11-9037db337172	OptionValue-write	OptionValue - spreminjanje	f
00030000-55e9-4d0b-b107-0e2ee3b2d9c7	Oseba-read	Oseba - branje	f
00030000-55e9-4d0b-6448-977c4773a4a8	Oseba-write	Oseba - spreminjanje	f
00030000-55e9-4d0b-e284-4f088c593a88	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55e9-4d0b-3d74-41fb9863a743	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55e9-4d0b-feab-02fdb59d7474	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55e9-4d0b-f32b-540cd9b4dd50	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55e9-4d0b-e890-7f256f86b0af	Pogodba-read	Pogodba - branje	f
00030000-55e9-4d0b-0905-b697f5f19cca	Pogodba-write	Pogodba - spreminjanje	f
00030000-55e9-4d0b-6588-d365c6b70aa0	Popa-read	Popa - branje	f
00030000-55e9-4d0b-bb53-0c30026ec029	Popa-write	Popa - spreminjanje	f
00030000-55e9-4d0b-c4eb-b1995d2003bb	Posta-read	Posta - branje	f
00030000-55e9-4d0b-2754-c88b94e0d2a9	Posta-write	Posta - spreminjanje	f
00030000-55e9-4d0b-f173-e57e2f4ebbdb	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55e9-4d0b-a666-af54bd86a30f	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55e9-4d0b-6942-3a79bdaa8f57	PostniNaslov-read	PostniNaslov - branje	f
00030000-55e9-4d0b-7011-1e8fd18cfdb4	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55e9-4d0b-97a7-6ebad1d02b3c	Predstava-read	Predstava - branje	f
00030000-55e9-4d0b-c3e1-58432b68bc59	Predstava-write	Predstava - spreminjanje	f
00030000-55e9-4d0b-efc0-9ad8d26f8feb	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55e9-4d0b-41aa-12ae5004004e	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55e9-4d0b-9ffd-a05b32baaf77	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55e9-4d0b-068d-75571a702e26	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55e9-4d0b-7976-886728e64a51	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55e9-4d0b-62c9-cf227700170b	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55e9-4d0b-a778-812fbeabd0a7	ProgramDela-read	ProgramDela - branje	f
00030000-55e9-4d0b-c9c2-3d2511553759	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55e9-4d0b-6f3d-1ec6fc7b7cd5	ProgramFestival-read	ProgramFestival - branje	f
00030000-55e9-4d0b-5ce3-86c499fc0463	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55e9-4d0b-f3f2-1ef6c534a630	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55e9-4d0b-aea0-001cac3d45aa	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55e9-4d0b-3078-93982f126dee	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55e9-4d0b-4fad-593789ee678b	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55e9-4d0b-7fd4-251c7d222982	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55e9-4d0b-7310-4d9fe47a2c11	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55e9-4d0b-fecf-5fe91a2bc3ec	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55e9-4d0b-b853-3f3771c0d3ac	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55e9-4d0b-9362-76e1cc0ff7bb	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55e9-4d0b-a367-643b07b4fba1	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55e9-4d0b-d339-7dcd966e6bef	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55e9-4d0b-28e8-98076038884d	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55e9-4d0b-e852-20249777cdce	ProgramRazno-read	ProgramRazno - branje	f
00030000-55e9-4d0b-acb3-f86eafa67701	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55e9-4d0b-c0fe-63f65adcbfc8	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55e9-4d0b-252c-0f29ac48f430	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55e9-4d0b-fac9-ffea68a27aac	Prostor-read	Prostor - branje	f
00030000-55e9-4d0b-ff48-3c207da31ae7	Prostor-write	Prostor - spreminjanje	f
00030000-55e9-4d0b-3794-6ae2250a164c	Racun-read	Racun - branje	f
00030000-55e9-4d0b-f54f-3e842c4ce8f5	Racun-write	Racun - spreminjanje	f
00030000-55e9-4d0b-156a-222d74b2c41e	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55e9-4d0b-9687-8caee368708d	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55e9-4d0b-e434-2fb204ac5af6	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55e9-4d0b-d4a7-04daa39151fb	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55e9-4d0b-e897-ebcc7e377da5	Rekvizit-read	Rekvizit - branje	f
00030000-55e9-4d0b-fe0e-e1363257df88	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55e9-4d0b-068c-24ea1d205889	Revizija-read	Revizija - branje	f
00030000-55e9-4d0b-ab06-7cc629e67633	Revizija-write	Revizija - spreminjanje	f
00030000-55e9-4d0b-2df3-a362a0ffa9ff	Rezervacija-read	Rezervacija - branje	f
00030000-55e9-4d0b-a627-09b60c0e813a	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55e9-4d0b-bdd8-a285dfff7573	SedezniRed-read	SedezniRed - branje	f
00030000-55e9-4d0b-b830-c11872635fd2	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55e9-4d0b-7641-95db399e7119	Sedez-read	Sedez - branje	f
00030000-55e9-4d0b-81c2-4cd8477844fb	Sedez-write	Sedez - spreminjanje	f
00030000-55e9-4d0b-7d0c-2e78464ecc75	Sezona-read	Sezona - branje	f
00030000-55e9-4d0b-225d-939dbdcd5440	Sezona-write	Sezona - spreminjanje	f
00030000-55e9-4d0b-1fee-3732eabe13f8	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55e9-4d0b-204b-6be3d616089c	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55e9-4d0b-9087-bc8f6d04f02b	Stevilcenje-read	Stevilcenje - branje	f
00030000-55e9-4d0b-468d-4f8df68ea3bf	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55e9-4d0b-31b5-e766c54f205e	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55e9-4d0b-d035-6fc48c5eb1c2	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55e9-4d0b-263e-0400635a78d4	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55e9-4d0b-efae-2fc1371e91f3	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55e9-4d0b-3cdf-c6621d792179	Telefonska-read	Telefonska - branje	f
00030000-55e9-4d0b-eb1d-eaca6d7e5f81	Telefonska-write	Telefonska - spreminjanje	f
00030000-55e9-4d0b-eccd-ad7045fffbc6	TerminStoritve-read	TerminStoritve - branje	f
00030000-55e9-4d0b-4178-e7dca73fc763	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55e9-4d0b-fc3c-00eaaeb6ebc0	TipFunkcije-read	TipFunkcije - branje	f
00030000-55e9-4d0b-e39c-c6593305e922	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55e9-4d0b-e1e7-5304c233f792	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55e9-4d0b-8646-0f30c7c0ce8c	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55e9-4d0b-dcb3-9d79954e208a	Trr-read	Trr - branje	f
00030000-55e9-4d0b-a0de-ded2af154b0d	Trr-write	Trr - spreminjanje	f
00030000-55e9-4d0b-0d6b-1bd7cb29e961	Uprizoritev-read	Uprizoritev - branje	f
00030000-55e9-4d0b-e59f-59c3bd6875d6	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55e9-4d0b-a0ef-f426d55a4f89	Vaja-read	Vaja - branje	f
00030000-55e9-4d0b-dea5-93c7963d0056	Vaja-write	Vaja - spreminjanje	f
00030000-55e9-4d0b-e4fd-68f8824c7207	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55e9-4d0b-4186-a45e67a22f88	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55e9-4d0b-09a0-bedc4d595b91	VrstaStroska-read	VrstaStroska - branje	f
00030000-55e9-4d0b-e14e-4e6916850525	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-55e9-4d0b-c116-75028e342b10	Zaposlitev-read	Zaposlitev - branje	f
00030000-55e9-4d0b-f894-64afe41c34ce	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55e9-4d0b-78ef-c0f298fa533b	Zasedenost-read	Zasedenost - branje	f
00030000-55e9-4d0b-ee30-9987f7b44fa1	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55e9-4d0b-34d5-d477b7fb58c6	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55e9-4d0b-aa56-ffe88cb4b6bd	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55e9-4d0b-1959-5031aaf80880	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55e9-4d0b-a0be-269fe7dbe592	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55e9-4d0b-3d58-934930ba9f33	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55e9-4d0b-52be-15b463f1fe78	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55e9-4d0b-b2f2-09f5ef2a33a1	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55e9-4d0b-8978-3b308605cc08	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55e9-4d0b-17f4-cff5020c21b4	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55e9-4d0b-2d52-5b9cd707a7b3	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55e9-4d0b-27f7-84b6c663ae6a	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55e9-4d0b-86ad-cf6fe8e31000	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55e9-4d0b-0a50-4911c4e6a370	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55e9-4d0b-111c-04c43e5a5676	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55e9-4d0b-74b3-766f8ffa3753	Datoteka-write	Datoteka - spreminjanje	f
00030000-55e9-4d0b-ee1b-b1c8f09beb6f	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2910 (class 0 OID 17262036)
-- Dependencies: 177
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55e9-4d0b-0b78-0e91433cf855	00030000-55e9-4d0b-6f2c-ebe2b0cd70cd
00020000-55e9-4d0b-609b-7fe224a9e384	00030000-55e9-4d0b-8694-51c1074c2483
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-93e9-cdfcbce88c21
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-5e29-e3f8d497b341
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-3460-76f467c98eb4
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-6f89-68e73e7499df
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-a11a-585faa22b503
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-52b3-5b990342abbd
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-4ac0-bab6df7698fa
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-f5ca-2657b68115e8
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-8694-51c1074c2483
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-f24e-1c77c782781a
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-7f04-07b5c50a907d
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-2cbb-07e6e3ddebfc
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-5826-41ce40762e2f
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-2637-1c1f10096070
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-02b7-45da764c86da
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-5027-59f8fad8c1d5
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-0ce8-e0562f75d5d8
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-b3cd-56d5a9de3db1
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-a72c-fcc6cdde1458
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-ddbf-614d859f3fd5
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-b107-0e2ee3b2d9c7
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-6448-977c4773a4a8
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-6588-d365c6b70aa0
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-bb53-0c30026ec029
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-c4eb-b1995d2003bb
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-2754-c88b94e0d2a9
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-6942-3a79bdaa8f57
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-7011-1e8fd18cfdb4
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-97a7-6ebad1d02b3c
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-c3e1-58432b68bc59
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-7976-886728e64a51
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-62c9-cf227700170b
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-fac9-ffea68a27aac
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-ff48-3c207da31ae7
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-e434-2fb204ac5af6
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-d4a7-04daa39151fb
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-e897-ebcc7e377da5
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-fe0e-e1363257df88
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-7d0c-2e78464ecc75
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-225d-939dbdcd5440
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-fc3c-00eaaeb6ebc0
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-0d6b-1bd7cb29e961
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-e59f-59c3bd6875d6
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-a0ef-f426d55a4f89
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-dea5-93c7963d0056
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-78ef-c0f298fa533b
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-ee30-9987f7b44fa1
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-34d5-d477b7fb58c6
00020000-55e9-4d0b-c113-e64bb0bc8202	00030000-55e9-4d0b-1959-5031aaf80880
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-93e9-cdfcbce88c21
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-a11a-585faa22b503
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-52b3-5b990342abbd
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-8694-51c1074c2483
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-5826-41ce40762e2f
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-02b7-45da764c86da
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-0ce8-e0562f75d5d8
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-b3cd-56d5a9de3db1
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-a72c-fcc6cdde1458
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-ddbf-614d859f3fd5
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-b107-0e2ee3b2d9c7
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-6448-977c4773a4a8
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-6588-d365c6b70aa0
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-c4eb-b1995d2003bb
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-6942-3a79bdaa8f57
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-7011-1e8fd18cfdb4
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-97a7-6ebad1d02b3c
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-fac9-ffea68a27aac
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-e434-2fb204ac5af6
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-e897-ebcc7e377da5
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-7d0c-2e78464ecc75
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-3cdf-c6621d792179
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-eb1d-eaca6d7e5f81
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-dcb3-9d79954e208a
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-a0de-ded2af154b0d
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-c116-75028e342b10
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-f894-64afe41c34ce
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-34d5-d477b7fb58c6
00020000-55e9-4d0b-f23f-96efa62cad96	00030000-55e9-4d0b-1959-5031aaf80880
00020000-55e9-4d0b-8675-1495849eb9df	00030000-55e9-4d0b-93e9-cdfcbce88c21
00020000-55e9-4d0b-8675-1495849eb9df	00030000-55e9-4d0b-3460-76f467c98eb4
00020000-55e9-4d0b-8675-1495849eb9df	00030000-55e9-4d0b-a11a-585faa22b503
00020000-55e9-4d0b-8675-1495849eb9df	00030000-55e9-4d0b-14d8-4b533ce1835d
00020000-55e9-4d0b-8675-1495849eb9df	00030000-55e9-4d0b-de2d-d40e1d59979e
00020000-55e9-4d0b-8675-1495849eb9df	00030000-55e9-4d0b-6555-77c57a044ae0
00020000-55e9-4d0b-8675-1495849eb9df	00030000-55e9-4d0b-52b3-5b990342abbd
00020000-55e9-4d0b-8675-1495849eb9df	00030000-55e9-4d0b-8694-51c1074c2483
00020000-55e9-4d0b-8675-1495849eb9df	00030000-55e9-4d0b-7f04-07b5c50a907d
00020000-55e9-4d0b-8675-1495849eb9df	00030000-55e9-4d0b-5826-41ce40762e2f
00020000-55e9-4d0b-8675-1495849eb9df	00030000-55e9-4d0b-02b7-45da764c86da
00020000-55e9-4d0b-8675-1495849eb9df	00030000-55e9-4d0b-0ce8-e0562f75d5d8
00020000-55e9-4d0b-8675-1495849eb9df	00030000-55e9-4d0b-a72c-fcc6cdde1458
00020000-55e9-4d0b-8675-1495849eb9df	00030000-55e9-4d0b-ddbf-614d859f3fd5
00020000-55e9-4d0b-8675-1495849eb9df	00030000-55e9-4d0b-b107-0e2ee3b2d9c7
00020000-55e9-4d0b-8675-1495849eb9df	00030000-55e9-4d0b-6588-d365c6b70aa0
00020000-55e9-4d0b-8675-1495849eb9df	00030000-55e9-4d0b-c4eb-b1995d2003bb
00020000-55e9-4d0b-8675-1495849eb9df	00030000-55e9-4d0b-97a7-6ebad1d02b3c
00020000-55e9-4d0b-8675-1495849eb9df	00030000-55e9-4d0b-7976-886728e64a51
00020000-55e9-4d0b-8675-1495849eb9df	00030000-55e9-4d0b-fac9-ffea68a27aac
00020000-55e9-4d0b-8675-1495849eb9df	00030000-55e9-4d0b-e434-2fb204ac5af6
00020000-55e9-4d0b-8675-1495849eb9df	00030000-55e9-4d0b-e897-ebcc7e377da5
00020000-55e9-4d0b-8675-1495849eb9df	00030000-55e9-4d0b-7d0c-2e78464ecc75
00020000-55e9-4d0b-8675-1495849eb9df	00030000-55e9-4d0b-fc3c-00eaaeb6ebc0
00020000-55e9-4d0b-8675-1495849eb9df	00030000-55e9-4d0b-a0ef-f426d55a4f89
00020000-55e9-4d0b-8675-1495849eb9df	00030000-55e9-4d0b-78ef-c0f298fa533b
00020000-55e9-4d0b-8675-1495849eb9df	00030000-55e9-4d0b-34d5-d477b7fb58c6
00020000-55e9-4d0b-8675-1495849eb9df	00030000-55e9-4d0b-1959-5031aaf80880
00020000-55e9-4d0b-db4b-b6ad60bd74fe	00030000-55e9-4d0b-93e9-cdfcbce88c21
00020000-55e9-4d0b-db4b-b6ad60bd74fe	00030000-55e9-4d0b-5e29-e3f8d497b341
00020000-55e9-4d0b-db4b-b6ad60bd74fe	00030000-55e9-4d0b-6f89-68e73e7499df
00020000-55e9-4d0b-db4b-b6ad60bd74fe	00030000-55e9-4d0b-a11a-585faa22b503
00020000-55e9-4d0b-db4b-b6ad60bd74fe	00030000-55e9-4d0b-52b3-5b990342abbd
00020000-55e9-4d0b-db4b-b6ad60bd74fe	00030000-55e9-4d0b-8694-51c1074c2483
00020000-55e9-4d0b-db4b-b6ad60bd74fe	00030000-55e9-4d0b-5826-41ce40762e2f
00020000-55e9-4d0b-db4b-b6ad60bd74fe	00030000-55e9-4d0b-02b7-45da764c86da
00020000-55e9-4d0b-db4b-b6ad60bd74fe	00030000-55e9-4d0b-a72c-fcc6cdde1458
00020000-55e9-4d0b-db4b-b6ad60bd74fe	00030000-55e9-4d0b-ddbf-614d859f3fd5
00020000-55e9-4d0b-db4b-b6ad60bd74fe	00030000-55e9-4d0b-6588-d365c6b70aa0
00020000-55e9-4d0b-db4b-b6ad60bd74fe	00030000-55e9-4d0b-c4eb-b1995d2003bb
00020000-55e9-4d0b-db4b-b6ad60bd74fe	00030000-55e9-4d0b-97a7-6ebad1d02b3c
00020000-55e9-4d0b-db4b-b6ad60bd74fe	00030000-55e9-4d0b-fac9-ffea68a27aac
00020000-55e9-4d0b-db4b-b6ad60bd74fe	00030000-55e9-4d0b-e434-2fb204ac5af6
00020000-55e9-4d0b-db4b-b6ad60bd74fe	00030000-55e9-4d0b-e897-ebcc7e377da5
00020000-55e9-4d0b-db4b-b6ad60bd74fe	00030000-55e9-4d0b-7d0c-2e78464ecc75
00020000-55e9-4d0b-db4b-b6ad60bd74fe	00030000-55e9-4d0b-fc3c-00eaaeb6ebc0
00020000-55e9-4d0b-db4b-b6ad60bd74fe	00030000-55e9-4d0b-34d5-d477b7fb58c6
00020000-55e9-4d0b-db4b-b6ad60bd74fe	00030000-55e9-4d0b-1959-5031aaf80880
00020000-55e9-4d0b-40e9-7e97d68984b0	00030000-55e9-4d0b-93e9-cdfcbce88c21
00020000-55e9-4d0b-40e9-7e97d68984b0	00030000-55e9-4d0b-a11a-585faa22b503
00020000-55e9-4d0b-40e9-7e97d68984b0	00030000-55e9-4d0b-52b3-5b990342abbd
00020000-55e9-4d0b-40e9-7e97d68984b0	00030000-55e9-4d0b-8694-51c1074c2483
00020000-55e9-4d0b-40e9-7e97d68984b0	00030000-55e9-4d0b-5826-41ce40762e2f
00020000-55e9-4d0b-40e9-7e97d68984b0	00030000-55e9-4d0b-02b7-45da764c86da
00020000-55e9-4d0b-40e9-7e97d68984b0	00030000-55e9-4d0b-a72c-fcc6cdde1458
00020000-55e9-4d0b-40e9-7e97d68984b0	00030000-55e9-4d0b-ddbf-614d859f3fd5
00020000-55e9-4d0b-40e9-7e97d68984b0	00030000-55e9-4d0b-6588-d365c6b70aa0
00020000-55e9-4d0b-40e9-7e97d68984b0	00030000-55e9-4d0b-c4eb-b1995d2003bb
00020000-55e9-4d0b-40e9-7e97d68984b0	00030000-55e9-4d0b-97a7-6ebad1d02b3c
00020000-55e9-4d0b-40e9-7e97d68984b0	00030000-55e9-4d0b-fac9-ffea68a27aac
00020000-55e9-4d0b-40e9-7e97d68984b0	00030000-55e9-4d0b-e434-2fb204ac5af6
00020000-55e9-4d0b-40e9-7e97d68984b0	00030000-55e9-4d0b-e897-ebcc7e377da5
00020000-55e9-4d0b-40e9-7e97d68984b0	00030000-55e9-4d0b-7d0c-2e78464ecc75
00020000-55e9-4d0b-40e9-7e97d68984b0	00030000-55e9-4d0b-eccd-ad7045fffbc6
00020000-55e9-4d0b-40e9-7e97d68984b0	00030000-55e9-4d0b-1f82-676e7c360e2d
00020000-55e9-4d0b-40e9-7e97d68984b0	00030000-55e9-4d0b-fc3c-00eaaeb6ebc0
00020000-55e9-4d0b-40e9-7e97d68984b0	00030000-55e9-4d0b-34d5-d477b7fb58c6
00020000-55e9-4d0b-40e9-7e97d68984b0	00030000-55e9-4d0b-1959-5031aaf80880
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-d512-6ed3187d6428
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-6f2c-ebe2b0cd70cd
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-1f82-676e7c360e2d
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-4ac0-bab6df7698fa
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-a066-c46b814fb9a1
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-7330-a47223ecf3f4
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-00ba-c7b4f2c87043
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-93e9-cdfcbce88c21
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-5e29-e3f8d497b341
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-3460-76f467c98eb4
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-6f89-68e73e7499df
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-a11a-585faa22b503
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-14d8-4b533ce1835d
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-de2d-d40e1d59979e
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-ce98-9727d7c2c76b
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-6555-77c57a044ae0
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-f62e-e4155f64d72d
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-52b3-5b990342abbd
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-f5ca-2657b68115e8
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-8694-51c1074c2483
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-f24e-1c77c782781a
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-316a-6dc4a98028cd
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-1a0a-75552e230e05
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-7dc4-c4b32ad0acb5
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-7063-f42c5bdc1a63
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-7f04-07b5c50a907d
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-2cbb-07e6e3ddebfc
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-5826-41ce40762e2f
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-2637-1c1f10096070
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-02b7-45da764c86da
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-5027-59f8fad8c1d5
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-0ce8-e0562f75d5d8
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-b3cd-56d5a9de3db1
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-96f5-c84d12a03222
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-e89a-d015fb2dbe6b
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-9691-dd2dbc9db35e
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-0ce1-665908a8eb30
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-a72c-fcc6cdde1458
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-f46d-eebc970deee5
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-ddbf-614d859f3fd5
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-1b11-9037db337172
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-b107-0e2ee3b2d9c7
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-6448-977c4773a4a8
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-e284-4f088c593a88
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-3d74-41fb9863a743
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-feab-02fdb59d7474
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-f32b-540cd9b4dd50
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-e890-7f256f86b0af
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-0905-b697f5f19cca
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-6588-d365c6b70aa0
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-bb53-0c30026ec029
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-c4eb-b1995d2003bb
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-2754-c88b94e0d2a9
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-f173-e57e2f4ebbdb
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-a666-af54bd86a30f
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-6942-3a79bdaa8f57
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-7011-1e8fd18cfdb4
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-97a7-6ebad1d02b3c
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-c3e1-58432b68bc59
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-efc0-9ad8d26f8feb
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-41aa-12ae5004004e
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-9ffd-a05b32baaf77
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-068d-75571a702e26
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-7976-886728e64a51
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-62c9-cf227700170b
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-a778-812fbeabd0a7
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-c9c2-3d2511553759
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-6f3d-1ec6fc7b7cd5
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-5ce3-86c499fc0463
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-f3f2-1ef6c534a630
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-aea0-001cac3d45aa
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-3078-93982f126dee
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-4fad-593789ee678b
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-7fd4-251c7d222982
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-7310-4d9fe47a2c11
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-fecf-5fe91a2bc3ec
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-b853-3f3771c0d3ac
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-9362-76e1cc0ff7bb
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-a367-643b07b4fba1
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-d339-7dcd966e6bef
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-28e8-98076038884d
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-e852-20249777cdce
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-acb3-f86eafa67701
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-c0fe-63f65adcbfc8
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-252c-0f29ac48f430
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-fac9-ffea68a27aac
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-ff48-3c207da31ae7
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-3794-6ae2250a164c
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-f54f-3e842c4ce8f5
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-156a-222d74b2c41e
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-9687-8caee368708d
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-e434-2fb204ac5af6
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-d4a7-04daa39151fb
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-e897-ebcc7e377da5
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-fe0e-e1363257df88
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-068c-24ea1d205889
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-ab06-7cc629e67633
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-2df3-a362a0ffa9ff
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-a627-09b60c0e813a
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-bdd8-a285dfff7573
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-b830-c11872635fd2
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-7641-95db399e7119
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-81c2-4cd8477844fb
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-7d0c-2e78464ecc75
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-225d-939dbdcd5440
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-1fee-3732eabe13f8
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-204b-6be3d616089c
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-9087-bc8f6d04f02b
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-468d-4f8df68ea3bf
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-31b5-e766c54f205e
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-d035-6fc48c5eb1c2
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-263e-0400635a78d4
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-efae-2fc1371e91f3
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-3cdf-c6621d792179
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-eb1d-eaca6d7e5f81
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-eccd-ad7045fffbc6
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-4178-e7dca73fc763
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-fc3c-00eaaeb6ebc0
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-e39c-c6593305e922
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-e1e7-5304c233f792
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-8646-0f30c7c0ce8c
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-dcb3-9d79954e208a
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-a0de-ded2af154b0d
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-0d6b-1bd7cb29e961
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-e59f-59c3bd6875d6
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-a0ef-f426d55a4f89
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-dea5-93c7963d0056
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-e4fd-68f8824c7207
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-4186-a45e67a22f88
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-09a0-bedc4d595b91
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-e14e-4e6916850525
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-c116-75028e342b10
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-f894-64afe41c34ce
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-78ef-c0f298fa533b
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-ee30-9987f7b44fa1
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-34d5-d477b7fb58c6
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-aa56-ffe88cb4b6bd
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-1959-5031aaf80880
00020000-55e9-4d0c-7e4f-654cd43f8913	00030000-55e9-4d0b-a0be-269fe7dbe592
\.


--
-- TOC entry 2937 (class 0 OID 17262331)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2941 (class 0 OID 17262365)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 17262489)
-- Dependencies: 219
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55e9-4d0c-0100-e258904c4604	00090000-55e9-4d0c-1329-0c3a726eb0e6	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55e9-4d0c-1019-4279f58f8ff1	00090000-55e9-4d0c-2711-53c37d2c308b	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55e9-4d0c-7f3a-31f9f83396bf	00090000-55e9-4d0c-4d93-e27a12f0fc30	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2915 (class 0 OID 17262096)
-- Dependencies: 182
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55e9-4d0c-1606-9e05a98b3fd6	00040000-55e9-4d0a-cce7-0052ec7466f0	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e9-4d0c-af7d-9a0070cbd82b	00040000-55e9-4d0a-cce7-0052ec7466f0	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55e9-4d0c-a118-d150c900ea9d	00040000-55e9-4d0a-cce7-0052ec7466f0	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e9-4d0c-ef5c-788dc7dc8dfd	00040000-55e9-4d0a-cce7-0052ec7466f0	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e9-4d0c-0f05-09ac2b4b10d0	00040000-55e9-4d0a-cce7-0052ec7466f0	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e9-4d0c-e63e-b7b0caef748f	00040000-55e9-4d0a-33fa-06c6bba3f85f	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e9-4d0c-1d21-7beaa06562ae	00040000-55e9-4d0a-7c8e-6a77f7dfe2b6	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e9-4d0c-a810-5d928bd11766	00040000-55e9-4d0a-3589-f0e6347f7b8f	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55e9-4d0d-31f7-a31a54147aa3	00040000-55e9-4d0a-cce7-0052ec7466f0	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2917 (class 0 OID 17262130)
-- Dependencies: 184
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55e9-4d0a-5bc3-0eb49c3bd6d5	8341	Adlešiči
00050000-55e9-4d0a-0983-c640d8487e9e	5270	Ajdovščina
00050000-55e9-4d0a-d203-6baead42e971	6280	Ankaran/Ancarano
00050000-55e9-4d0a-2810-fb8644cad374	9253	Apače
00050000-55e9-4d0a-9f23-66e28600e2f5	8253	Artiče
00050000-55e9-4d0a-ea6c-b158a1380bed	4275	Begunje na Gorenjskem
00050000-55e9-4d0a-4359-0510dea62afb	1382	Begunje pri Cerknici
00050000-55e9-4d0a-971b-a4bdd96dd9c9	9231	Beltinci
00050000-55e9-4d0a-4d1a-5a4c5726517c	2234	Benedikt
00050000-55e9-4d0a-1d84-cde05936e7ec	2345	Bistrica ob Dravi
00050000-55e9-4d0a-8349-1ccc1f058b4d	3256	Bistrica ob Sotli
00050000-55e9-4d0a-879a-ec791c7ed1e7	8259	Bizeljsko
00050000-55e9-4d0a-cf15-6c0770f2b693	1223	Blagovica
00050000-55e9-4d0a-e43e-d4613b608545	8283	Blanca
00050000-55e9-4d0a-2ef7-4a8e35656d72	4260	Bled
00050000-55e9-4d0a-b630-a230d4fdc243	4273	Blejska Dobrava
00050000-55e9-4d0a-d6f9-f9d35d3b6501	9265	Bodonci
00050000-55e9-4d0a-edab-1e8e50aaed46	9222	Bogojina
00050000-55e9-4d0a-4f46-9e0092b3b74d	4263	Bohinjska Bela
00050000-55e9-4d0a-f1d4-da9b68e20108	4264	Bohinjska Bistrica
00050000-55e9-4d0a-5a9b-5b67de8d8d8b	4265	Bohinjsko jezero
00050000-55e9-4d0a-d464-e19372e87f79	1353	Borovnica
00050000-55e9-4d0a-7c29-3c9df5522dc5	8294	Boštanj
00050000-55e9-4d0a-3542-95cc0e4ef04d	5230	Bovec
00050000-55e9-4d0a-bcca-0207315c277d	5295	Branik
00050000-55e9-4d0a-3356-ae34b947e40c	3314	Braslovče
00050000-55e9-4d0a-6a7c-034b22d4e267	5223	Breginj
00050000-55e9-4d0a-d275-ef3a66cad4f9	8280	Brestanica
00050000-55e9-4d0a-2ab5-1a80ace99b44	2354	Bresternica
00050000-55e9-4d0a-19de-868d39e5b799	4243	Brezje
00050000-55e9-4d0a-6bc3-943030c425b5	1351	Brezovica pri Ljubljani
00050000-55e9-4d0a-6e9a-7547be9204f9	8250	Brežice
00050000-55e9-4d0a-616c-bf88d443005e	4210	Brnik - Aerodrom
00050000-55e9-4d0a-9959-79bce1fd7897	8321	Brusnice
00050000-55e9-4d0a-4efc-ddf9c6143ddd	3255	Buče
00050000-55e9-4d0a-dcf7-055a846c36dd	8276	Bučka 
00050000-55e9-4d0a-439f-9304b2590d24	9261	Cankova
00050000-55e9-4d0a-bad1-1c6b4f2bb86e	3000	Celje 
00050000-55e9-4d0a-5dbd-e7e13b260afd	3001	Celje - poštni predali
00050000-55e9-4d0a-1169-fbc301a22b92	4207	Cerklje na Gorenjskem
00050000-55e9-4d0a-435a-5f64d8762532	8263	Cerklje ob Krki
00050000-55e9-4d0a-0dde-13aeef7fe3fc	1380	Cerknica
00050000-55e9-4d0a-30e4-37ced0aeecef	5282	Cerkno
00050000-55e9-4d0a-4832-c62e71493a6f	2236	Cerkvenjak
00050000-55e9-4d0a-cff4-74a8d5ca0a04	2215	Ceršak
00050000-55e9-4d0a-e132-a9d33829297e	2326	Cirkovce
00050000-55e9-4d0a-3dec-b31402a5449a	2282	Cirkulane
00050000-55e9-4d0a-bc7f-b6a466b5043e	5273	Col
00050000-55e9-4d0a-fb85-6ff31f81a52b	8251	Čatež ob Savi
00050000-55e9-4d0a-94b4-5096a0f5c213	1413	Čemšenik
00050000-55e9-4d0a-5eb8-0b00603f712f	5253	Čepovan
00050000-55e9-4d0a-d979-00c9ac1ca546	9232	Črenšovci
00050000-55e9-4d0a-2a66-fde332ed04be	2393	Črna na Koroškem
00050000-55e9-4d0a-5ef3-fd04c0ce47ef	6275	Črni Kal
00050000-55e9-4d0a-ee93-6c73c58c34b4	5274	Črni Vrh nad Idrijo
00050000-55e9-4d0a-0c6a-bea09181fdc4	5262	Črniče
00050000-55e9-4d0a-412a-7513c34045fa	8340	Črnomelj
00050000-55e9-4d0a-50f5-2d7df4f10bef	6271	Dekani
00050000-55e9-4d0a-4edc-0ad314ab643e	5210	Deskle
00050000-55e9-4d0a-86ea-af659079177c	2253	Destrnik
00050000-55e9-4d0a-e62e-07e4fc0b0d8f	6215	Divača
00050000-55e9-4d0a-4bfc-fc589dd259c6	1233	Dob
00050000-55e9-4d0a-b1ba-1ba0be02fdb7	3224	Dobje pri Planini
00050000-55e9-4d0a-6bd6-c51715ad70be	8257	Dobova
00050000-55e9-4d0a-1652-c8afcb53663a	1423	Dobovec
00050000-55e9-4d0a-cc7a-21ce4409cfe8	5263	Dobravlje
00050000-55e9-4d0a-55b5-0af6725d0a95	3204	Dobrna
00050000-55e9-4d0a-2b31-4ca24ad868ef	8211	Dobrnič
00050000-55e9-4d0a-490b-dfb284d19e1c	1356	Dobrova
00050000-55e9-4d0a-5054-1b1f59a77155	9223	Dobrovnik/Dobronak 
00050000-55e9-4d0a-68ee-63593c58182e	5212	Dobrovo v Brdih
00050000-55e9-4d0a-0f9b-f29dde1093d2	1431	Dol pri Hrastniku
00050000-55e9-4d0a-2210-61b3a1b126ad	1262	Dol pri Ljubljani
00050000-55e9-4d0a-e47e-abad9a73a840	1273	Dole pri Litiji
00050000-55e9-4d0a-3b1d-a17b6aa267ff	1331	Dolenja vas
00050000-55e9-4d0a-8556-b5e114c980bd	8350	Dolenjske Toplice
00050000-55e9-4d0a-b726-65b9de99dc2a	1230	Domžale
00050000-55e9-4d0a-927f-b3a7ab970f51	2252	Dornava
00050000-55e9-4d0a-0271-2b47eebc6d7a	5294	Dornberk
00050000-55e9-4d0a-3f34-f83546e4931a	1319	Draga
00050000-55e9-4d0a-d3d9-ff468ae7f325	8343	Dragatuš
00050000-55e9-4d0a-94c0-b9d82bc6fbc2	3222	Dramlje
00050000-55e9-4d0a-8e6f-f7ff3092172a	2370	Dravograd
00050000-55e9-4d0a-5e6e-9cf3ef0e3b47	4203	Duplje
00050000-55e9-4d0a-883d-c6d04a133987	6221	Dutovlje
00050000-55e9-4d0a-a72c-9fb3d2de6a49	8361	Dvor
00050000-55e9-4d0a-367c-a5fa6dadae5c	2343	Fala
00050000-55e9-4d0a-bab5-abf0e2b487bd	9208	Fokovci
00050000-55e9-4d0a-d783-e319a8b77234	2313	Fram
00050000-55e9-4d0a-1f93-3f3e49d566f6	3213	Frankolovo
00050000-55e9-4d0a-561c-3a095d6c7eac	1274	Gabrovka
00050000-55e9-4d0a-04bf-b52d3937f92b	8254	Globoko
00050000-55e9-4d0a-a9cf-6f7d79afd5e6	5275	Godovič
00050000-55e9-4d0a-900f-c05196a5f761	4204	Golnik
00050000-55e9-4d0a-1436-dec427c104bf	3303	Gomilsko
00050000-55e9-4d0a-8291-dfd29a2adf85	4224	Gorenja vas
00050000-55e9-4d0a-ea86-f9207fb5e85d	3263	Gorica pri Slivnici
00050000-55e9-4d0a-8b8e-7eb68734b405	2272	Gorišnica
00050000-55e9-4d0a-1d1c-85d130d4d26f	9250	Gornja Radgona
00050000-55e9-4d0a-b394-dae14cb746b9	3342	Gornji Grad
00050000-55e9-4d0a-8332-26b8ba51057e	4282	Gozd Martuljek
00050000-55e9-4d0a-0457-283752e454aa	6272	Gračišče
00050000-55e9-4d0a-c23e-18cb0fc7eaaf	9264	Grad
00050000-55e9-4d0a-289e-80ed92f2b6bf	8332	Gradac
00050000-55e9-4d0a-6417-cf56b5fe31f6	1384	Grahovo
00050000-55e9-4d0a-e3e9-cef770b10f02	5242	Grahovo ob Bači
00050000-55e9-4d0a-8d15-403dda8eb592	5251	Grgar
00050000-55e9-4d0a-f25d-743d2ed33ae0	3302	Griže
00050000-55e9-4d0a-7530-e4efa0ec8576	3231	Grobelno
00050000-55e9-4d0a-3b72-1c63cadb260f	1290	Grosuplje
00050000-55e9-4d0a-e0f0-6c714015c7c4	2288	Hajdina
00050000-55e9-4d0a-ec61-3189a3c4783e	8362	Hinje
00050000-55e9-4d0a-f081-01ed7c2c5a4a	2311	Hoče
00050000-55e9-4d0a-b350-4b376397a632	9205	Hodoš/Hodos
00050000-55e9-4d0a-a79b-b97a69436c0a	1354	Horjul
00050000-55e9-4d0a-bbdd-e2d9f251a72c	1372	Hotedršica
00050000-55e9-4d0a-e57a-121daf387944	1430	Hrastnik
00050000-55e9-4d0a-cc43-e3382bee92ac	6225	Hruševje
00050000-55e9-4d0a-24ce-4d8cede6d61e	4276	Hrušica
00050000-55e9-4d0a-d7f4-75d4520972b8	5280	Idrija
00050000-55e9-4d0a-325c-ffe472944766	1292	Ig
00050000-55e9-4d0a-bf33-f2c48ebd7be0	6250	Ilirska Bistrica
00050000-55e9-4d0a-de44-f56237fb06e8	6251	Ilirska Bistrica-Trnovo
00050000-55e9-4d0a-27bc-257cde4653e3	1295	Ivančna Gorica
00050000-55e9-4d0a-3f7c-eb70234d6f8a	2259	Ivanjkovci
00050000-55e9-4d0a-ff56-432adf00d62d	1411	Izlake
00050000-55e9-4d0a-eee3-8224794aee47	6310	Izola/Isola
00050000-55e9-4d0a-d1e3-00d6182ec62f	2222	Jakobski Dol
00050000-55e9-4d0a-a284-04432e3c9ee3	2221	Jarenina
00050000-55e9-4d0a-a028-0e37329cb64b	6254	Jelšane
00050000-55e9-4d0a-ae1e-2d04fca9a7c1	4270	Jesenice
00050000-55e9-4d0a-4bbf-ad5e665514ad	8261	Jesenice na Dolenjskem
00050000-55e9-4d0a-b06a-79ea37c8112d	3273	Jurklošter
00050000-55e9-4d0a-0ed2-cf7713625a00	2223	Jurovski Dol
00050000-55e9-4d0a-a5a1-84464ff2d3e9	2256	Juršinci
00050000-55e9-4d0a-2906-8a8470156d4d	5214	Kal nad Kanalom
00050000-55e9-4d0a-1c68-c609ee6dc018	3233	Kalobje
00050000-55e9-4d0a-0b8b-d7a5116a5206	4246	Kamna Gorica
00050000-55e9-4d0a-1e00-74f641402c54	2351	Kamnica
00050000-55e9-4d0a-45a5-cbebacc681e5	1241	Kamnik
00050000-55e9-4d0a-e6f5-aa17c2f7217d	5213	Kanal
00050000-55e9-4d0a-15df-53b81a0f893c	8258	Kapele
00050000-55e9-4d0a-cc42-a4aec424688f	2362	Kapla
00050000-55e9-4d0a-04f3-40658a1d9ef2	2325	Kidričevo
00050000-55e9-4d0a-2ccc-b5600eaadab2	1412	Kisovec
00050000-55e9-4d0a-e9e6-1815b4674ce6	6253	Knežak
00050000-55e9-4d0a-571b-fb6225cc7bb9	5222	Kobarid
00050000-55e9-4d0a-625b-af8bc06629ab	9227	Kobilje
00050000-55e9-4d0a-c2c4-3e554f2c7b57	1330	Kočevje
00050000-55e9-4d0a-9171-dfb41ddf7cea	1338	Kočevska Reka
00050000-55e9-4d0a-88e7-994b60dc8cf8	2276	Kog
00050000-55e9-4d0a-9823-f7a4f16ec909	5211	Kojsko
00050000-55e9-4d0a-7d7f-c4c7b828d7cf	6223	Komen
00050000-55e9-4d0a-9134-0a6cfe48c6b9	1218	Komenda
00050000-55e9-4d0a-ab62-c35bf355147f	6000	Koper/Capodistria 
00050000-55e9-4d0a-6e91-df2912374738	6001	Koper/Capodistria - poštni predali
00050000-55e9-4d0a-dc33-7d78f5698450	8282	Koprivnica
00050000-55e9-4d0a-74fb-a7d34b5cfd90	5296	Kostanjevica na Krasu
00050000-55e9-4d0a-33a4-d8be1f1d847d	8311	Kostanjevica na Krki
00050000-55e9-4d0a-97c9-2ee14488b85a	1336	Kostel
00050000-55e9-4d0a-5373-8b9160783cbe	6256	Košana
00050000-55e9-4d0a-d602-6a501089127a	2394	Kotlje
00050000-55e9-4d0a-b7e9-b23f4d615379	6240	Kozina
00050000-55e9-4d0a-1697-945cf7e43558	3260	Kozje
00050000-55e9-4d0a-7aa0-eda168ba9cda	4000	Kranj 
00050000-55e9-4d0a-bc59-adafcdbd5bc4	4001	Kranj - poštni predali
00050000-55e9-4d0a-db67-0a2e7b65248a	4280	Kranjska Gora
00050000-55e9-4d0a-ce84-10e8bd974534	1281	Kresnice
00050000-55e9-4d0a-4b32-5f5984a068eb	4294	Križe
00050000-55e9-4d0a-ac6c-80cae589d84f	9206	Križevci
00050000-55e9-4d0a-fa4f-94e14a35845a	9242	Križevci pri Ljutomeru
00050000-55e9-4d0a-d907-8d85a41fe9b5	1301	Krka
00050000-55e9-4d0a-8ead-95cffa67b009	8296	Krmelj
00050000-55e9-4d0a-654b-9194e297511a	4245	Kropa
00050000-55e9-4d0a-594f-922130f3d47a	8262	Krška vas
00050000-55e9-4d0a-f116-4618a62bd875	8270	Krško
00050000-55e9-4d0a-8129-0a21471ce492	9263	Kuzma
00050000-55e9-4d0a-9d9f-cee0e16b5e7e	2318	Laporje
00050000-55e9-4d0a-10b7-16686c21af39	3270	Laško
00050000-55e9-4d0a-3ed8-998b1f22046f	1219	Laze v Tuhinju
00050000-55e9-4d0a-4ea0-1a89b3df2232	2230	Lenart v Slovenskih goricah
00050000-55e9-4d0a-c70c-3d20c592ff87	9220	Lendava/Lendva
00050000-55e9-4d0a-a633-d8665dc79884	4248	Lesce
00050000-55e9-4d0a-74ab-93f320782fa9	3261	Lesično
00050000-55e9-4d0a-aeae-3715457407b2	8273	Leskovec pri Krškem
00050000-55e9-4d0a-f193-decf4a248be4	2372	Libeliče
00050000-55e9-4d0a-967b-4722ade6552f	2341	Limbuš
00050000-55e9-4d0a-923d-ac9117e4eb68	1270	Litija
00050000-55e9-4d0a-dddc-1f30e7853675	3202	Ljubečna
00050000-55e9-4d0a-5ee9-9b4c3055a1e7	1000	Ljubljana 
00050000-55e9-4d0a-ec87-2a5bacc7f4e0	1001	Ljubljana - poštni predali
00050000-55e9-4d0a-6c56-b3d68a935655	1231	Ljubljana - Črnuče
00050000-55e9-4d0a-29c9-df7f63386c70	1261	Ljubljana - Dobrunje
00050000-55e9-4d0a-cbc2-b033839aa102	1260	Ljubljana - Polje
00050000-55e9-4d0a-0a93-72e95fa7b949	1210	Ljubljana - Šentvid
00050000-55e9-4d0a-a7cf-c4bc348a5651	1211	Ljubljana - Šmartno
00050000-55e9-4d0a-2e16-52722ee14b59	3333	Ljubno ob Savinji
00050000-55e9-4d0a-8ce8-428f3ebe155f	9240	Ljutomer
00050000-55e9-4d0a-08ad-197a9dbfc991	3215	Loče
00050000-55e9-4d0a-885b-a6cc816b41ea	5231	Log pod Mangartom
00050000-55e9-4d0a-3fc4-e0d1cc1818b4	1358	Log pri Brezovici
00050000-55e9-4d0a-3e70-44075366a68e	1370	Logatec
00050000-55e9-4d0a-87e6-21bb61ba5f9d	1371	Logatec
00050000-55e9-4d0a-6cef-3605d13f695f	1434	Loka pri Zidanem Mostu
00050000-55e9-4d0a-fe49-30b432abf79a	3223	Loka pri Žusmu
00050000-55e9-4d0a-f7e1-a4a740ec5870	6219	Lokev
00050000-55e9-4d0a-98b7-8175f64c4dae	1318	Loški Potok
00050000-55e9-4d0a-4de0-693ae8ca1b02	2324	Lovrenc na Dravskem polju
00050000-55e9-4d0a-4eb8-3860e20d35fd	2344	Lovrenc na Pohorju
00050000-55e9-4d0a-c44c-40de10c069ea	3334	Luče
00050000-55e9-4d0a-8bf7-4a92cfa37eda	1225	Lukovica
00050000-55e9-4d0a-b394-87b53799626a	9202	Mačkovci
00050000-55e9-4d0a-1ad1-9c3afcfc051e	2322	Majšperk
00050000-55e9-4d0a-bef0-5bb065395d49	2321	Makole
00050000-55e9-4d0a-653e-64c4bfee5ad6	9243	Mala Nedelja
00050000-55e9-4d0a-a0d9-4813a81b9903	2229	Malečnik
00050000-55e9-4d0a-45ca-47720f4a5cb2	6273	Marezige
00050000-55e9-4d0a-a83a-6a1b66149f5b	2000	Maribor 
00050000-55e9-4d0a-2474-76f37dccb5eb	2001	Maribor - poštni predali
00050000-55e9-4d0a-6078-6a52d459ea9d	2206	Marjeta na Dravskem polju
00050000-55e9-4d0a-a420-1753b7ec7fd6	2281	Markovci
00050000-55e9-4d0a-15bf-6a2fa257e99b	9221	Martjanci
00050000-55e9-4d0a-d255-59acc19f5f9d	6242	Materija
00050000-55e9-4d0a-7bdc-e2f1a549b1c6	4211	Mavčiče
00050000-55e9-4d0a-7708-107593be45cc	1215	Medvode
00050000-55e9-4d0a-af8b-e9ec0d71a704	1234	Mengeš
00050000-55e9-4d0a-d972-021d6ab082f5	8330	Metlika
00050000-55e9-4d0a-51fa-fcdf346980a5	2392	Mežica
00050000-55e9-4d0a-be6e-50063130f510	2204	Miklavž na Dravskem polju
00050000-55e9-4d0a-7174-6252539ce0ed	2275	Miklavž pri Ormožu
00050000-55e9-4d0a-ee1a-a82fdd34fb62	5291	Miren
00050000-55e9-4d0a-410b-b9e433a5197d	8233	Mirna
00050000-55e9-4d0a-6a9e-5938cc5109c9	8216	Mirna Peč
00050000-55e9-4d0a-fe23-80acc4ae428f	2382	Mislinja
00050000-55e9-4d0a-1c58-bad1fbc9144e	4281	Mojstrana
00050000-55e9-4d0a-bfd6-91c59537a1c9	8230	Mokronog
00050000-55e9-4d0a-7a36-4b00a6cfee5a	1251	Moravče
00050000-55e9-4d0a-6c93-e1ff0f13bcc1	9226	Moravske Toplice
00050000-55e9-4d0a-be41-84155510b5b3	5216	Most na Soči
00050000-55e9-4d0a-af65-23fb900fc82d	1221	Motnik
00050000-55e9-4d0a-22ae-911a4eeef85c	3330	Mozirje
00050000-55e9-4d0a-bf34-93ba233107a5	9000	Murska Sobota 
00050000-55e9-4d0a-68fc-66ea51fb330a	9001	Murska Sobota - poštni predali
00050000-55e9-4d0a-aa5b-5b870b246523	2366	Muta
00050000-55e9-4d0a-9c56-6a45a6f9761d	4202	Naklo
00050000-55e9-4d0a-e79e-5e698d6c3ac5	3331	Nazarje
00050000-55e9-4d0a-5ca2-f63108e746bd	1357	Notranje Gorice
00050000-55e9-4d0a-d81a-34452f0dddf8	3203	Nova Cerkev
00050000-55e9-4d0a-df0f-112d6f5f2536	5000	Nova Gorica 
00050000-55e9-4d0a-f83d-ced25ef54f56	5001	Nova Gorica - poštni predali
00050000-55e9-4d0a-d474-0359420cbe53	1385	Nova vas
00050000-55e9-4d0a-8e4c-c76282c7ecaa	8000	Novo mesto
00050000-55e9-4d0a-c967-85a42d29e65e	8001	Novo mesto - poštni predali
00050000-55e9-4d0a-4739-6238b64b8fe6	6243	Obrov
00050000-55e9-4d0a-e738-56da8d187a5b	9233	Odranci
00050000-55e9-4d0a-7ae2-92cf7afb9dc7	2317	Oplotnica
00050000-55e9-4d0a-c994-435be1024ee8	2312	Orehova vas
00050000-55e9-4d0a-4eb8-e20d996ce8ed	2270	Ormož
00050000-55e9-4d0a-e3a0-3f910534881e	1316	Ortnek
00050000-55e9-4d0a-0f41-9506dd92e6a7	1337	Osilnica
00050000-55e9-4d0a-ff92-19f48c4e2a64	8222	Otočec
00050000-55e9-4d0a-964b-207879ac79f6	2361	Ožbalt
00050000-55e9-4d0a-d483-df03a5d57b78	2231	Pernica
00050000-55e9-4d0a-5cfe-3d064ee24ceb	2211	Pesnica pri Mariboru
00050000-55e9-4d0a-faed-70564a129515	9203	Petrovci
00050000-55e9-4d0a-42ac-4d8d956f17b8	3301	Petrovče
00050000-55e9-4d0a-2df0-10356ba00662	6330	Piran/Pirano
00050000-55e9-4d0a-66cc-8ebfe3d85dd7	8255	Pišece
00050000-55e9-4d0a-a1ee-c6b8e4d60a09	6257	Pivka
00050000-55e9-4d0a-db0a-fcf9f7136bb8	6232	Planina
00050000-55e9-4d0a-f408-3e895e2dc36c	3225	Planina pri Sevnici
00050000-55e9-4d0a-b36d-e1660ba96e58	6276	Pobegi
00050000-55e9-4d0a-d092-7bbad7bb6f20	8312	Podbočje
00050000-55e9-4d0a-e7cb-66881babcf21	5243	Podbrdo
00050000-55e9-4d0a-353b-1179312daf4d	3254	Podčetrtek
00050000-55e9-4d0a-e691-c4e95fe6497c	2273	Podgorci
00050000-55e9-4d0a-bfe7-23704bafbc0d	6216	Podgorje
00050000-55e9-4d0a-7580-4eac8ff7f3a7	2381	Podgorje pri Slovenj Gradcu
00050000-55e9-4d0a-1732-46bc69c7fdad	6244	Podgrad
00050000-55e9-4d0a-15fc-4cf69114fb2c	1414	Podkum
00050000-55e9-4d0a-596f-ed0eba4496ca	2286	Podlehnik
00050000-55e9-4d0a-49a3-f4aa2ac914df	5272	Podnanos
00050000-55e9-4d0a-415d-53d2c11f0287	4244	Podnart
00050000-55e9-4d0a-e7c3-1cd098c867f7	3241	Podplat
00050000-55e9-4d0a-4d31-8a4257957713	3257	Podsreda
00050000-55e9-4d0a-1013-87198be45c72	2363	Podvelka
00050000-55e9-4d0a-f9b0-02b2b34e5882	2208	Pohorje
00050000-55e9-4d0a-c486-71766cf479ef	2257	Polenšak
00050000-55e9-4d0a-90f9-141b51479683	1355	Polhov Gradec
00050000-55e9-4d0a-a419-65b55c07d8ad	4223	Poljane nad Škofjo Loko
00050000-55e9-4d0a-964f-3e65075a4bf0	2319	Poljčane
00050000-55e9-4d0a-07f0-4e048f33ae23	1272	Polšnik
00050000-55e9-4d0a-abfa-5d68f1c2fa65	3313	Polzela
00050000-55e9-4d0a-630c-caccfc10d536	3232	Ponikva
00050000-55e9-4d0a-2a8f-e4d10cf50f39	6320	Portorož/Portorose
00050000-55e9-4d0a-afa1-69194f60b233	6230	Postojna
00050000-55e9-4d0a-b552-5ccf3a1b73be	2331	Pragersko
00050000-55e9-4d0a-ea98-e56686677030	3312	Prebold
00050000-55e9-4d0a-ed5d-809835845d1a	4205	Preddvor
00050000-55e9-4d0a-9f90-ddddf88ebc21	6255	Prem
00050000-55e9-4d0a-da53-a2f3187e69f2	1352	Preserje
00050000-55e9-4d0a-74ce-c02cfb0380eb	6258	Prestranek
00050000-55e9-4d0a-a48c-c4cb60bee2b0	2391	Prevalje
00050000-55e9-4d0a-df7d-2a9b7f501b18	3262	Prevorje
00050000-55e9-4d0a-f797-b1daded27555	1276	Primskovo 
00050000-55e9-4d0a-6ae4-90bdb8eec7e0	3253	Pristava pri Mestinju
00050000-55e9-4d0a-3a6a-bb0cc9c61a4b	9207	Prosenjakovci/Partosfalva
00050000-55e9-4d0a-a766-62968bfb6f60	5297	Prvačina
00050000-55e9-4d0a-b4b9-d3cf3668713c	2250	Ptuj
00050000-55e9-4d0a-6af9-056c9416b378	2323	Ptujska Gora
00050000-55e9-4d0a-e16c-74b7fa3e340f	9201	Puconci
00050000-55e9-4d0a-37a2-afabf57abe59	2327	Rače
00050000-55e9-4d0a-566f-c600a897472d	1433	Radeče
00050000-55e9-4d0a-0a5b-43f1ec2f97ce	9252	Radenci
00050000-55e9-4d0a-a7d0-8738a821de41	2360	Radlje ob Dravi
00050000-55e9-4d0a-7240-1508c990032c	1235	Radomlje
00050000-55e9-4d0a-acec-9473fb9f0e4e	4240	Radovljica
00050000-55e9-4d0a-3368-0f722be6b6d2	8274	Raka
00050000-55e9-4d0a-1abd-b644a08cba2e	1381	Rakek
00050000-55e9-4d0a-272a-b004810e5317	4283	Rateče - Planica
00050000-55e9-4d0a-e5af-4651443ca977	2390	Ravne na Koroškem
00050000-55e9-4d0a-ea60-7b998cfa8bc5	9246	Razkrižje
00050000-55e9-4d0a-d6a9-541be02481a3	3332	Rečica ob Savinji
00050000-55e9-4d0a-9d96-6be7d74423f9	5292	Renče
00050000-55e9-4d0a-1cdf-32fafbbce4d4	1310	Ribnica
00050000-55e9-4d0a-3aff-d5e862bce787	2364	Ribnica na Pohorju
00050000-55e9-4d0a-fa2b-fb1b4d0d74d5	3272	Rimske Toplice
00050000-55e9-4d0a-a825-8a869f0bf980	1314	Rob
00050000-55e9-4d0a-2296-b94bf06d1991	5215	Ročinj
00050000-55e9-4d0a-9eba-de37c664e314	3250	Rogaška Slatina
00050000-55e9-4d0a-92b5-cfa111d52d1d	9262	Rogašovci
00050000-55e9-4d0a-593f-2dfd098e81df	3252	Rogatec
00050000-55e9-4d0a-83f7-0e1dea4ab25b	1373	Rovte
00050000-55e9-4d0a-4874-87b5c5548d34	2342	Ruše
00050000-55e9-4d0a-55db-c05fa38ff25a	1282	Sava
00050000-55e9-4d0a-ac67-9493d818c82e	6333	Sečovlje/Sicciole
00050000-55e9-4d0a-b70f-40d356136eda	4227	Selca
00050000-55e9-4d0a-7a6b-d7518e6481fd	2352	Selnica ob Dravi
00050000-55e9-4d0a-460b-1b41b2f3c2e7	8333	Semič
00050000-55e9-4d0a-779f-c0ecc9cdd299	8281	Senovo
00050000-55e9-4d0a-ea4a-9271b9a7e878	6224	Senožeče
00050000-55e9-4d0a-e84a-db22472e5487	8290	Sevnica
00050000-55e9-4d0a-fab7-e781c706cbff	6210	Sežana
00050000-55e9-4d0a-eabe-310c4c0126e8	2214	Sladki Vrh
00050000-55e9-4d0a-add6-6a4f6db41cd2	5283	Slap ob Idrijci
00050000-55e9-4d0a-3b62-cb6ea1ed0b76	2380	Slovenj Gradec
00050000-55e9-4d0a-c910-3afa594eac51	2310	Slovenska Bistrica
00050000-55e9-4d0a-4184-321e674a7b72	3210	Slovenske Konjice
00050000-55e9-4d0a-10c3-2cd073fbb129	1216	Smlednik
00050000-55e9-4d0a-36fe-c84178b9776f	5232	Soča
00050000-55e9-4d0a-d27b-e78fd1058dd6	1317	Sodražica
00050000-55e9-4d0a-1aff-712d7caea293	3335	Solčava
00050000-55e9-4d0a-1699-174aaea7c1fa	5250	Solkan
00050000-55e9-4d0a-5058-55a0480488b2	4229	Sorica
00050000-55e9-4d0a-64b7-42bac34dcae5	4225	Sovodenj
00050000-55e9-4d0a-f4c0-b13957e0f61a	5281	Spodnja Idrija
00050000-55e9-4d0a-bc82-7184e01f99d7	2241	Spodnji Duplek
00050000-55e9-4d0a-3fdc-01f7faa60adc	9245	Spodnji Ivanjci
00050000-55e9-4d0a-8770-81b354af9280	2277	Središče ob Dravi
00050000-55e9-4d0a-640a-c965f745e5c1	4267	Srednja vas v Bohinju
00050000-55e9-4d0a-a98b-2cd7c2058fd4	8256	Sromlje 
00050000-55e9-4d0a-5567-c386d552472e	5224	Srpenica
00050000-55e9-4d0a-4a4c-736a172ac70f	1242	Stahovica
00050000-55e9-4d0a-b7ff-dc2fa6afaf19	1332	Stara Cerkev
00050000-55e9-4d0a-7e04-cb5ce3fbb0d4	8342	Stari trg ob Kolpi
00050000-55e9-4d0a-ae73-398265e02e6c	1386	Stari trg pri Ložu
00050000-55e9-4d0a-a9cb-4565b3357e71	2205	Starše
00050000-55e9-4d0a-fe37-2d97ba859d14	2289	Stoperce
00050000-55e9-4d0a-fab1-f32cf907a236	8322	Stopiče
00050000-55e9-4d0a-9da6-54f471a32493	3206	Stranice
00050000-55e9-4d0a-8328-03c6d02c3e0c	8351	Straža
00050000-55e9-4d0a-475b-67133311e68c	1313	Struge
00050000-55e9-4d0a-bdba-b6eb205833d1	8293	Studenec
00050000-55e9-4d0a-e02e-b6e3e033481d	8331	Suhor
00050000-55e9-4d0a-6ff2-e224301346f8	2233	Sv. Ana v Slovenskih goricah
00050000-55e9-4d0a-4717-c4f7af3d3902	2235	Sv. Trojica v Slovenskih goricah
00050000-55e9-4d0a-3079-daca41c049de	2353	Sveti Duh na Ostrem Vrhu
00050000-55e9-4d0a-9fa7-57de93113ecf	9244	Sveti Jurij ob Ščavnici
00050000-55e9-4d0a-67d0-3b417a419825	3264	Sveti Štefan
00050000-55e9-4d0a-91ee-14c92683a9c8	2258	Sveti Tomaž
00050000-55e9-4d0a-f61d-34692563f763	9204	Šalovci
00050000-55e9-4d0a-241d-c7b2a274dff3	5261	Šempas
00050000-55e9-4d0a-13e5-88ef7fe87b85	5290	Šempeter pri Gorici
00050000-55e9-4d0a-8010-bbb69c8a948f	3311	Šempeter v Savinjski dolini
00050000-55e9-4d0a-4008-28ad18ac405c	4208	Šenčur
00050000-55e9-4d0a-b456-1b21526d2f63	2212	Šentilj v Slovenskih goricah
00050000-55e9-4d0a-5b3f-d8dfc76cffc0	8297	Šentjanž
00050000-55e9-4d0a-0ae0-a55f989c7c34	2373	Šentjanž pri Dravogradu
00050000-55e9-4d0a-f569-b072f333b297	8310	Šentjernej
00050000-55e9-4d0a-a1a2-dbb5bfc26f95	3230	Šentjur
00050000-55e9-4d0a-ed39-7f9854976b90	3271	Šentrupert
00050000-55e9-4d0a-2dd3-e7cfb216dc35	8232	Šentrupert
00050000-55e9-4d0a-41d4-35ce76fc4fae	1296	Šentvid pri Stični
00050000-55e9-4d0a-7b7f-7b1b2aa3f931	8275	Škocjan
00050000-55e9-4d0a-5935-89f59713c341	6281	Škofije
00050000-55e9-4d0a-0307-30ec39c8f53c	4220	Škofja Loka
00050000-55e9-4d0a-93b9-cb2981991b58	3211	Škofja vas
00050000-55e9-4d0a-4cc8-88173e8050ca	1291	Škofljica
00050000-55e9-4d0a-86cc-e0452a78f384	6274	Šmarje
00050000-55e9-4d0a-2993-a2ea21ec9e90	1293	Šmarje - Sap
00050000-55e9-4d0a-f7b7-7cfcafb88c94	3240	Šmarje pri Jelšah
00050000-55e9-4d0a-67aa-1a16d3f23a3c	8220	Šmarješke Toplice
00050000-55e9-4d0a-ccb5-22b25c233723	2315	Šmartno na Pohorju
00050000-55e9-4d0a-3cf2-ca3f7c238242	3341	Šmartno ob Dreti
00050000-55e9-4d0a-0524-6c14b197c437	3327	Šmartno ob Paki
00050000-55e9-4d0a-8a18-ec914b77239b	1275	Šmartno pri Litiji
00050000-55e9-4d0a-76d6-f5598934f6f2	2383	Šmartno pri Slovenj Gradcu
00050000-55e9-4d0a-5a51-f37217cbf2e4	3201	Šmartno v Rožni dolini
00050000-55e9-4d0a-a0ba-5e8618c0fac5	3325	Šoštanj
00050000-55e9-4d0a-8ae0-2b3098062867	6222	Štanjel
00050000-55e9-4d0a-fb88-7de1cbc46bfd	3220	Štore
00050000-55e9-4d0a-ad50-a634a0070c9b	3304	Tabor
00050000-55e9-4d0a-29a7-a9f6ab991f09	3221	Teharje
00050000-55e9-4d0a-077e-a8aae6afb217	9251	Tišina
00050000-55e9-4d0a-bc5f-0ee4a3fec187	5220	Tolmin
00050000-55e9-4d0a-6a81-cf23251274e0	3326	Topolšica
00050000-55e9-4d0a-108e-ec35e5d69a5a	2371	Trbonje
00050000-55e9-4d0a-35bf-ab565da5957d	1420	Trbovlje
00050000-55e9-4d0a-e203-3bd33e186c7c	8231	Trebelno 
00050000-55e9-4d0a-f1e7-42d1bbd7a66d	8210	Trebnje
00050000-55e9-4d0a-8368-a31b0c6e2882	5252	Trnovo pri Gorici
00050000-55e9-4d0a-68fe-95600b3707f8	2254	Trnovska vas
00050000-55e9-4d0a-5529-f277543f1f06	1222	Trojane
00050000-55e9-4d0a-076c-14cf2f25251c	1236	Trzin
00050000-55e9-4d0a-aa6a-f8bf477079e2	4290	Tržič
00050000-55e9-4d0a-164f-743194b17bea	8295	Tržišče
00050000-55e9-4d0a-e65d-149115369a99	1311	Turjak
00050000-55e9-4d0a-aa35-9ecd7b76d2d7	9224	Turnišče
00050000-55e9-4d0a-a8b5-e42751e4a092	8323	Uršna sela
00050000-55e9-4d0a-76dd-92cab62f203c	1252	Vače
00050000-55e9-4d0a-3fad-05de20e98e2a	3320	Velenje 
00050000-55e9-4d0a-cd89-222ebc09f8ce	3322	Velenje - poštni predali
00050000-55e9-4d0a-3ced-79e78192cce2	8212	Velika Loka
00050000-55e9-4d0a-e1a8-7fbc0ab23eda	2274	Velika Nedelja
00050000-55e9-4d0a-b686-9ed7b62f79c6	9225	Velika Polana
00050000-55e9-4d0a-0b11-4d6032fef145	1315	Velike Lašče
00050000-55e9-4d0a-1880-6bee0e4abf82	8213	Veliki Gaber
00050000-55e9-4d0a-6b1e-f49ac4d53a8a	9241	Veržej
00050000-55e9-4d0a-aa80-f72c93498ef5	1312	Videm - Dobrepolje
00050000-55e9-4d0a-3314-8040ef749d9f	2284	Videm pri Ptuju
00050000-55e9-4d0a-a1e4-05df10e05ae8	8344	Vinica
00050000-55e9-4d0a-9c50-c891f5223891	5271	Vipava
00050000-55e9-4d0a-25d1-b6168ff0388f	4212	Visoko
00050000-55e9-4d0a-21df-e61c2402fb9f	1294	Višnja Gora
00050000-55e9-4d0a-ea16-a8f06d754edc	3205	Vitanje
00050000-55e9-4d0a-46f0-14758994c7c9	2255	Vitomarci
00050000-55e9-4d0a-dd61-5c683821d7fa	1217	Vodice
00050000-55e9-4d0a-ec37-1aac309ea331	3212	Vojnik\t
00050000-55e9-4d0a-96d7-91bebd61c65a	5293	Volčja Draga
00050000-55e9-4d0a-c9bc-1e0be76765c4	2232	Voličina
00050000-55e9-4d0a-865c-62fca1360d86	3305	Vransko
00050000-55e9-4d0a-293b-215b1ea2ff32	6217	Vremski Britof
00050000-55e9-4d0a-7e4d-582c7bc78501	1360	Vrhnika
00050000-55e9-4d0a-a0dc-9b2218e20fb5	2365	Vuhred
00050000-55e9-4d0a-96fc-6337c0fe7b0b	2367	Vuzenica
00050000-55e9-4d0a-0d18-9eb80a8415dd	8292	Zabukovje 
00050000-55e9-4d0a-dadf-06061d4a5f70	1410	Zagorje ob Savi
00050000-55e9-4d0a-0ed6-da71d4eda951	1303	Zagradec
00050000-55e9-4d0a-2618-5d688a5b5e13	2283	Zavrč
00050000-55e9-4d0a-10e2-5b41c38d87df	8272	Zdole 
00050000-55e9-4d0a-bc6c-f2907b5bcd29	4201	Zgornja Besnica
00050000-55e9-4d0a-25ad-39e1a9bba385	2242	Zgornja Korena
00050000-55e9-4d0a-2684-378ba90ddcf7	2201	Zgornja Kungota
00050000-55e9-4d0a-8d68-0896df909ede	2316	Zgornja Ložnica
00050000-55e9-4d0a-041b-2932185e47cf	2314	Zgornja Polskava
00050000-55e9-4d0a-83e9-da0d1227958c	2213	Zgornja Velka
00050000-55e9-4d0a-b1e0-6f615ebfdf5f	4247	Zgornje Gorje
00050000-55e9-4d0a-76d7-ca1f37f2e2c0	4206	Zgornje Jezersko
00050000-55e9-4d0a-afe3-4156403b706c	2285	Zgornji Leskovec
00050000-55e9-4d0a-4cf0-26ae3dfb4545	1432	Zidani Most
00050000-55e9-4d0a-93f8-6ef449f588bb	3214	Zreče
00050000-55e9-4d0a-9fac-e05a2eeed350	4209	Žabnica
00050000-55e9-4d0a-2757-6a225603bef4	3310	Žalec
00050000-55e9-4d0a-8fde-fadde1a4d298	4228	Železniki
00050000-55e9-4d0a-c9dc-8c995b1a99f4	2287	Žetale
00050000-55e9-4d0a-10cc-be48160c9ecf	4226	Žiri
00050000-55e9-4d0a-7ae6-cc7a754c33eb	4274	Žirovnica
00050000-55e9-4d0a-3c37-b28e561ff1c7	8360	Žužemberk
\.


--
-- TOC entry 2933 (class 0 OID 17262305)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 17262115)
-- Dependencies: 183
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-55e9-4d0c-490f-c313f428f23e	00080000-55e9-4d0c-1606-9e05a98b3fd6	\N	00040000-55e9-4d0a-cce7-0052ec7466f0	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-55e9-4d0c-ed52-e6f05d0b33a6	00080000-55e9-4d0c-1606-9e05a98b3fd6	\N	00040000-55e9-4d0a-cce7-0052ec7466f0		\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-55e9-4d0c-b82c-61cad6d662af	00080000-55e9-4d0c-af7d-9a0070cbd82b	\N	00040000-55e9-4d0a-cce7-0052ec7466f0		\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2922 (class 0 OID 17262193)
-- Dependencies: 189
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 17262317)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 17262668)
-- Dependencies: 226
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2960 (class 0 OID 17262678)
-- Dependencies: 227
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55e9-4d0c-1d90-7a3fbf519aed	00080000-55e9-4d0c-a118-d150c900ea9d	0987	AK
00190000-55e9-4d0c-a121-f3226570752d	00080000-55e9-4d0c-af7d-9a0070cbd82b	0989	AK
00190000-55e9-4d0c-c0cb-ff9275cd85ef	00080000-55e9-4d0c-ef5c-788dc7dc8dfd	0986	AK
00190000-55e9-4d0c-c3a2-d80e3414c324	00080000-55e9-4d0c-e63e-b7b0caef748f	0984	AK
00190000-55e9-4d0c-f26c-8a57a8735762	00080000-55e9-4d0c-1d21-7beaa06562ae	0983	AK
00190000-55e9-4d0c-0fe7-2ad2c57827f4	00080000-55e9-4d0c-a810-5d928bd11766	0982	AK
00190000-55e9-4d0d-eea3-37dc559911d0	00080000-55e9-4d0d-31f7-a31a54147aa3	1001	AK
\.


--
-- TOC entry 2958 (class 0 OID 17262625)
-- Dependencies: 225
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55e9-4d0c-57fe-ea1bd03bb82b	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2961 (class 0 OID 17262686)
-- Dependencies: 228
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 17262346)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, seplanira, kapaciteta, opis) FROM stdin;
00220000-55e9-4d0c-5d10-5b8a71173d1e	\N	\N	0001	Poskusna 1	f	t	8	Poskusna učilnica v prvem
00220000-55e9-4d0c-f660-225f55b3c36c	\N	\N	0002	Poskusna 3	f	f	34	Poskusna učilnica v tretjem
00220000-55e9-4d0c-867a-0e06cf3daabc	\N	\N	0003	Kazinska	t	t	84	Kazinska dvorana
00220000-55e9-4d0c-eeea-87f94500f0f0	\N	\N	0004	Mali oder	t	t	24	Mali oder 
00220000-55e9-4d0c-87b3-cd000080be5b	\N	\N	0005	Komorni oder	t	t	15	Komorni oder
00220000-55e9-4d0c-4425-fb15276f9f27	\N	\N	0006	Stara dvorana	t	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55e9-4d0c-7984-da8ada151ac4	\N	\N	0007	Velika dvorana	t	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2931 (class 0 OID 17262290)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 17262280)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 17262478)
-- Dependencies: 218
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 17262417)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 17261988)
-- Dependencies: 172
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55e9-4d0d-31f7-a31a54147aa3	00010000-55e9-4d0b-7cef-f3aa1b9f89b3	2015-09-04 09:49:33	INS	a:0:{}
2	App\\Entity\\Option	00000000-55e9-4d0d-8a88-9079bd938d43	00010000-55e9-4d0b-7cef-f3aa1b9f89b3	2015-09-04 09:49:33	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55e9-4d0d-eea3-37dc559911d0	00010000-55e9-4d0b-7cef-f3aa1b9f89b3	2015-09-04 09:49:33	INS	a:0:{}
\.


--
-- TOC entry 2982 (class 0 OID 0)
-- Dependencies: 171
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2940 (class 0 OID 17262359)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 17262026)
-- Dependencies: 176
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55e9-4d0b-0b78-0e91433cf855	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55e9-4d0b-609b-7fe224a9e384	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55e9-4d0b-95ec-c7b969d77c39	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55e9-4d0b-b545-74a9e63ee2e5	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55e9-4d0b-c113-e64bb0bc8202	planer	Planer dogodkov v koledarju	t
00020000-55e9-4d0b-f23f-96efa62cad96	kadrovska	Kadrovska služba	t
00020000-55e9-4d0b-8675-1495849eb9df	arhivar	Ažuriranje arhivalij	t
00020000-55e9-4d0b-db4b-b6ad60bd74fe	igralec	Igralec	t
00020000-55e9-4d0b-40e9-7e97d68984b0	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55e9-4d0c-7e4f-654cd43f8913	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2907 (class 0 OID 17262010)
-- Dependencies: 174
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55e9-4d0b-887d-90fc2a27b9cc	00020000-55e9-4d0b-95ec-c7b969d77c39
00010000-55e9-4d0b-7cef-f3aa1b9f89b3	00020000-55e9-4d0b-95ec-c7b969d77c39
00010000-55e9-4d0c-d8af-65d870041e66	00020000-55e9-4d0c-7e4f-654cd43f8913
\.


--
-- TOC entry 2942 (class 0 OID 17262373)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 17262311)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 17262257)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 17262727)
-- Dependencies: 233
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55e9-4d0a-7c65-03dc1f2d3c3f	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55e9-4d0a-1143-314e17bc0ba9	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55e9-4d0a-88e8-5abc4052d487	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55e9-4d0a-0102-ce2e49da7a4f	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55e9-4d0a-3b84-7fed8f8fd3bd	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2965 (class 0 OID 17262719)
-- Dependencies: 232
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55e9-4d0a-68c9-7817d3d7c8b3	00230000-55e9-4d0a-0102-ce2e49da7a4f	popa
00240000-55e9-4d0a-fcb7-c5c3d6bdbdf0	00230000-55e9-4d0a-0102-ce2e49da7a4f	oseba
00240000-55e9-4d0a-5a1b-bd9381089c11	00230000-55e9-4d0a-0102-ce2e49da7a4f	sezona
00240000-55e9-4d0a-6180-9deb1a8882b1	00230000-55e9-4d0a-1143-314e17bc0ba9	prostor
00240000-55e9-4d0a-e219-5c5577d00010	00230000-55e9-4d0a-0102-ce2e49da7a4f	besedilo
00240000-55e9-4d0a-982e-678e33150b00	00230000-55e9-4d0a-0102-ce2e49da7a4f	uprizoritev
00240000-55e9-4d0a-b64f-522cd79d4027	00230000-55e9-4d0a-0102-ce2e49da7a4f	funkcija
00240000-55e9-4d0a-4bda-35bab67698a0	00230000-55e9-4d0a-0102-ce2e49da7a4f	tipfunkcije
00240000-55e9-4d0a-7a44-336904bbedcf	00230000-55e9-4d0a-0102-ce2e49da7a4f	alternacija
00240000-55e9-4d0a-0e45-d437551e0286	00230000-55e9-4d0a-7c65-03dc1f2d3c3f	pogodba
00240000-55e9-4d0a-fafa-48a5bbefd25d	00230000-55e9-4d0a-0102-ce2e49da7a4f	zaposlitev
00240000-55e9-4d0a-8a29-110d438a3a3e	00230000-55e9-4d0a-0102-ce2e49da7a4f	zvrstuprizoritve
00240000-55e9-4d0a-9422-06f06e3d27b7	00230000-55e9-4d0a-7c65-03dc1f2d3c3f	programdela
00240000-55e9-4d0a-64be-10fba9866bd4	00230000-55e9-4d0a-0102-ce2e49da7a4f	zapis
\.


--
-- TOC entry 2964 (class 0 OID 17262714)
-- Dependencies: 231
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
4b294672-4286-47c3-a641-dedcaf14084b	00230000-55e9-4d0a-0102-ce2e49da7a4f	0	1001
\.


--
-- TOC entry 2947 (class 0 OID 17262427)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-55e9-4d0c-c4d1-01b9685edf92	000e0000-55e9-4d0c-3a43-3e9f2e2fd6f2	00080000-55e9-4d0c-1606-9e05a98b3fd6	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-55e9-4d0b-b631-e7e8f5d744d3
00270000-55e9-4d0c-95e7-c520fc2ba88f	000e0000-55e9-4d0c-3a43-3e9f2e2fd6f2	00080000-55e9-4d0c-1606-9e05a98b3fd6	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-55e9-4d0b-b631-e7e8f5d744d3
00270000-55e9-4d0c-5952-f2170af2a7fd	000e0000-55e9-4d0c-3a43-3e9f2e2fd6f2	00080000-55e9-4d0c-0f05-09ac2b4b10d0	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4	\N
\.


--
-- TOC entry 2914 (class 0 OID 17262088)
-- Dependencies: 181
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 17262267)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55e9-4d0c-07db-82cbd919e8d6	00180000-55e9-4d0c-6898-69003a28a1b6	000c0000-55e9-4d0c-39c6-1aba026b9085	00090000-55e9-4d0c-693d-02f6c0a37165	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e9-4d0c-8bc1-ce5ab62992a6	00180000-55e9-4d0c-6898-69003a28a1b6	000c0000-55e9-4d0c-4d60-43ca7c6abba6	00090000-55e9-4d0c-14a7-19a6db6fd815	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e9-4d0c-3853-88e2d9e47603	00180000-55e9-4d0c-6898-69003a28a1b6	000c0000-55e9-4d0c-3a7c-ffe32860800f	00090000-55e9-4d0c-d19c-5c2cdacfcbe0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e9-4d0c-527f-914214e9a7a4	00180000-55e9-4d0c-6898-69003a28a1b6	000c0000-55e9-4d0c-de4d-e58ab83f4a6e	00090000-55e9-4d0c-d313-48dced030e90	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e9-4d0c-cc0a-60fbe460e3cb	00180000-55e9-4d0c-6898-69003a28a1b6	000c0000-55e9-4d0c-9edf-3025ce76e016	00090000-55e9-4d0c-f3b1-d9d64a01255b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55e9-4d0c-8c62-c82c181de085	00180000-55e9-4d0c-afbb-2485ce6f3b30	\N	00090000-55e9-4d0c-f3b1-d9d64a01255b	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2950 (class 0 OID 17262467)
-- Dependencies: 217
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55e9-4d0a-69c2-1fb9cefb730a	Avtor	Avtorji	Avtorka	umetnik
000f0000-55e9-4d0a-641c-fe7e8f5851d7	Priredba	Priredba	Priredba	umetnik
000f0000-55e9-4d0a-b62e-6c5df72b4939	Prevod	Prevod	Prevod	umetnik
000f0000-55e9-4d0a-8ed5-c0f1815da950	Režija	Režija	Režija	umetnik
000f0000-55e9-4d0a-d408-8cf693a01d16	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55e9-4d0a-da25-8a5ff45e8657	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55e9-4d0a-7c62-a35a4759ab86	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55e9-4d0a-4e48-fb2fa1ae42fe	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55e9-4d0a-a774-63143e4cc239	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55e9-4d0a-b2cb-9b54b06604d2	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55e9-4d0a-2028-b72aea3cd0a8	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55e9-4d0a-c832-c2eef2a7461c	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55e9-4d0a-8bbf-d3310b6515a1	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55e9-4d0a-d657-8a6f90065725	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55e9-4d0a-9b6e-338f872f18e6	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55e9-4d0a-26ae-d595180a9707	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55e9-4d0a-b502-5e5504492d9c	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55e9-4d0a-745a-d6acc80f76fc	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2962 (class 0 OID 17262696)
-- Dependencies: 229
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55e9-4d0a-883a-1bde6994ecea	01	Velika predstava	f	1.00	1.00
002b0000-55e9-4d0a-fd6a-ca81fae8d931	02	Mala predstava	f	0.50	0.50
002b0000-55e9-4d0a-f212-5339b8241bd1	03	Mala koprodukcija	t	0.40	1.00
002b0000-55e9-4d0a-1548-236c62571426	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55e9-4d0a-6791-83d5d2b74c2b	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2919 (class 0 OID 17262150)
-- Dependencies: 186
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 17261997)
-- Dependencies: 173
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55e9-4d0b-7cef-f3aa1b9f89b3	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROz7fQveWl8ZbHpSI7HLG6d8uihWI9Hfm	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55e9-4d0c-4220-ad21c83433e7	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55e9-4d0c-13f1-ecd0567c0413	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55e9-4d0c-182f-6d105818bce6	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55e9-4d0c-966b-4b04e7cf02f9	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55e9-4d0c-c72a-ba3677afeb72	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55e9-4d0c-1aa0-38b7b5d75c26	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55e9-4d0c-ac1d-66846c6358ee	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55e9-4d0c-2fad-30111a28902b	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55e9-4d0c-c28d-a193a4a60013	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55e9-4d0c-d8af-65d870041e66	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55e9-4d0b-887d-90fc2a27b9cc	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2954 (class 0 OID 17262515)
-- Dependencies: 221
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55e9-4d0c-8d97-2f9f83336043	00160000-55e9-4d0c-1761-4dad6e19b34f	\N	00140000-55e9-4d0a-25f8-687475a0d9c3	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f	\N	\N		00220000-55e9-4d0c-87b3-cd000080be5b
000e0000-55e9-4d0c-3a43-3e9f2e2fd6f2	00160000-55e9-4d0c-b754-256b0942fe8c	\N	00140000-55e9-4d0a-382b-7b776169de2a	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f	\N	\N		00220000-55e9-4d0c-4425-fb15276f9f27
000e0000-55e9-4d0c-4c83-408bd8c1cc2d	\N	\N	00140000-55e9-4d0a-382b-7b776169de2a	00190000-55e9-4d0c-1d90-7a3fbf519aed	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f	\N	\N		00220000-55e9-4d0c-87b3-cd000080be5b
000e0000-55e9-4d0c-8a38-0bc863dc0494	\N	\N	00140000-55e9-4d0a-382b-7b776169de2a	00190000-55e9-4d0c-1d90-7a3fbf519aed	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f	\N	\N		00220000-55e9-4d0c-87b3-cd000080be5b
000e0000-55e9-4d0c-9f31-ee6663e7a8c1	\N	\N	00140000-55e9-4d0a-382b-7b776169de2a	00190000-55e9-4d0c-1d90-7a3fbf519aed	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f	\N	\N		00220000-55e9-4d0c-5d10-5b8a71173d1e
000e0000-55e9-4d0c-ab42-95d661d5b562	\N	\N	00140000-55e9-4d0a-382b-7b776169de2a	00190000-55e9-4d0c-1d90-7a3fbf519aed	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f	\N	\N		00220000-55e9-4d0c-5d10-5b8a71173d1e
\.


--
-- TOC entry 2924 (class 0 OID 17262211)
-- Dependencies: 191
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-55e9-4d0c-0699-7f3d5382e225	000e0000-55e9-4d0c-3a43-3e9f2e2fd6f2	\N	1	
00200000-55e9-4d0c-ea5d-cf7a657bef53	000e0000-55e9-4d0c-3a43-3e9f2e2fd6f2	\N	2	
\.


--
-- TOC entry 2938 (class 0 OID 17262338)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 17262441)
-- Dependencies: 215
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-55e9-4d0b-423c-1bbfbfc8a0c6	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-55e9-4d0b-3151-8a51fdc04a66	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-55e9-4d0b-698d-5fe57439a407	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-55e9-4d0b-9549-2c902fefccb8	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-55e9-4d0b-c702-47c2a636c56c	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-55e9-4d0b-ac38-c3d674202393	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-55e9-4d0b-686a-7312a4ef2eea	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-55e9-4d0b-7cf9-ef980d2e9e7f	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-55e9-4d0b-b631-e7e8f5d744d3	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-55e9-4d0b-4eb2-a518b8eb91ec	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-55e9-4d0b-5d6a-3d74f173f02c	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-55e9-4d0b-b97a-c01cba72f632	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-55e9-4d0b-3257-ed9e155cd019	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-55e9-4d0b-bb5b-29ee6be60c7b	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-55e9-4d0b-f931-743f0fccd62c	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-55e9-4d0b-3fb1-fdf9b95fd25f	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-55e9-4d0b-8f9d-7bc4ec81e428	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-55e9-4d0b-ac07-e6c22af0c06b	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-55e9-4d0b-d347-d5a2b6d18bde	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-55e9-4d0b-999d-13041b47bb2b	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-55e9-4d0b-f3ba-18216da72d03	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-55e9-4d0b-290d-5c8ab0b98494	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-55e9-4d0b-64d8-95fc30f1a412	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-55e9-4d0b-fc29-b208688d8cf6	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-55e9-4d0b-2380-2f1a8f0f121b	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-55e9-4d0b-3523-9be9f202794b	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-55e9-4d0b-34b2-1ab71180711f	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-55e9-4d0b-6fea-1fad41f6deba	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 2968 (class 0 OID 17262766)
-- Dependencies: 235
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 17262738)
-- Dependencies: 234
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 17262778)
-- Dependencies: 236
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2945 (class 0 OID 17262410)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55e9-4d0c-553d-7d6b679eecdb	00090000-55e9-4d0c-14a7-19a6db6fd815	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e9-4d0c-6ac7-2036eddd89fb	00090000-55e9-4d0c-d19c-5c2cdacfcbe0	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e9-4d0c-5b99-fa2e8832cf62	00090000-55e9-4d0c-568e-de1cd397f946	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e9-4d0c-edc9-b76535b1ad02	00090000-55e9-4d0c-6981-acf7ea1436ec	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e9-4d0c-16f6-d55ed4abadd1	00090000-55e9-4d0c-693d-02f6c0a37165	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55e9-4d0c-878c-f36c2c0e9b37	00090000-55e9-4d0c-7613-dd88df42dfc6	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2926 (class 0 OID 17262247)
-- Dependencies: 193
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 17262505)
-- Dependencies: 220
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55e9-4d0a-25f8-687475a0d9c3	01	Drama	drama (SURS 01)
00140000-55e9-4d0a-797a-a0b5c33d09e8	02	Opera	opera (SURS 02)
00140000-55e9-4d0a-396d-e914195fdc75	03	Balet	balet (SURS 03)
00140000-55e9-4d0a-f686-1ddce23a4b64	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55e9-4d0a-ecd7-8e3b580ff9ed	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55e9-4d0a-382b-7b776169de2a	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55e9-4d0a-c79b-df07776d1073	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2944 (class 0 OID 17262400)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2454 (class 2606 OID 17262051)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 17262564)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 17262554)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 17262466)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 17262818)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 17262236)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 17262256)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 17262712)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 17262176)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 17262619)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 17262396)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 17262209)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 17262190)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 17262303)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 17262795)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 17262802)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2696 (class 2606 OID 17262826)
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
-- TOC entry 2556 (class 2606 OID 17262330)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 17262148)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 17262060)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 17262084)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 17262040)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2445 (class 2606 OID 17262025)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 17262336)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 17262372)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 17262500)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 17262112)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 17262136)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 17262309)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 17262126)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 17262197)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 17262321)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 17262675)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 17262683)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 17262667)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 17262694)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 17262354)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 17262294)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 17262285)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 17262488)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 17262424)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 17261996)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 17262363)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 17262014)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2447 (class 2606 OID 17262034)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 17262381)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 17262316)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 17262265)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 17262736)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 17262724)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 17262718)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 17262437)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 17262093)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 17262276)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 17262477)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 17262706)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 17262161)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 17262009)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 17262533)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 17262219)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 17262344)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 17262449)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 17262776)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 17262760)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 17262784)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 17262415)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 17262251)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 17262513)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 17262408)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 1259 OID 17262245)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2510 (class 1259 OID 17262246)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2511 (class 1259 OID 17262244)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2512 (class 1259 OID 17262243)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2594 (class 1259 OID 17262438)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2595 (class 1259 OID 17262439)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2596 (class 1259 OID 17262440)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2682 (class 1259 OID 17262797)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2683 (class 1259 OID 17262796)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2468 (class 1259 OID 17262114)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2557 (class 1259 OID 17262337)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2669 (class 1259 OID 17262764)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2670 (class 1259 OID 17262763)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2671 (class 1259 OID 17262765)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2672 (class 1259 OID 17262762)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2673 (class 1259 OID 17262761)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2551 (class 1259 OID 17262323)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2552 (class 1259 OID 17262322)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2504 (class 1259 OID 17262220)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 17262397)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2582 (class 1259 OID 17262399)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2583 (class 1259 OID 17262398)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2493 (class 1259 OID 17262192)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2494 (class 1259 OID 17262191)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2652 (class 1259 OID 17262695)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2607 (class 1259 OID 17262502)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2608 (class 1259 OID 17262503)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2609 (class 1259 OID 17262504)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2679 (class 1259 OID 17262785)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2616 (class 1259 OID 17262538)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2617 (class 1259 OID 17262535)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2618 (class 1259 OID 17262539)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2619 (class 1259 OID 17262537)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2620 (class 1259 OID 17262536)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2483 (class 1259 OID 17262163)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2484 (class 1259 OID 17262162)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2459 (class 1259 OID 17262087)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2569 (class 1259 OID 17262364)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2449 (class 1259 OID 17262041)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2450 (class 1259 OID 17262042)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2574 (class 1259 OID 17262384)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2575 (class 1259 OID 17262383)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2576 (class 1259 OID 17262382)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2497 (class 1259 OID 17262198)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2498 (class 1259 OID 17262199)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2662 (class 1259 OID 17262726)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2531 (class 1259 OID 17262289)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2532 (class 1259 OID 17262287)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2533 (class 1259 OID 17262286)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2534 (class 1259 OID 17262288)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2440 (class 1259 OID 17262015)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2441 (class 1259 OID 17262016)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2560 (class 1259 OID 17262345)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2692 (class 1259 OID 17262819)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2693 (class 1259 OID 17262827)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2694 (class 1259 OID 17262828)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2546 (class 1259 OID 17262310)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2590 (class 1259 OID 17262425)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2591 (class 1259 OID 17262426)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2637 (class 1259 OID 17262624)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2638 (class 1259 OID 17262623)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2639 (class 1259 OID 17262620)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2640 (class 1259 OID 17262621)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2641 (class 1259 OID 17262622)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2472 (class 1259 OID 17262128)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2473 (class 1259 OID 17262127)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2474 (class 1259 OID 17262129)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2563 (class 1259 OID 17262358)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2564 (class 1259 OID 17262357)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2644 (class 1259 OID 17262676)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2645 (class 1259 OID 17262677)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2630 (class 1259 OID 17262568)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 17262569)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2632 (class 1259 OID 17262566)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2633 (class 1259 OID 17262567)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2587 (class 1259 OID 17262416)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2537 (class 1259 OID 17262298)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2538 (class 1259 OID 17262297)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2539 (class 1259 OID 17262295)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2540 (class 1259 OID 17262296)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2626 (class 1259 OID 17262556)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2627 (class 1259 OID 17262555)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2503 (class 1259 OID 17262210)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2659 (class 1259 OID 17262713)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2686 (class 1259 OID 17262803)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2687 (class 1259 OID 17262804)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2455 (class 1259 OID 17262062)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2456 (class 1259 OID 17262061)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2464 (class 1259 OID 17262094)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 17262095)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2526 (class 1259 OID 17262279)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2527 (class 1259 OID 17262278)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2528 (class 1259 OID 17262277)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2513 (class 1259 OID 17262238)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2514 (class 1259 OID 17262239)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2515 (class 1259 OID 17262237)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2516 (class 1259 OID 17262241)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2517 (class 1259 OID 17262242)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2518 (class 1259 OID 17262240)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2471 (class 1259 OID 17262113)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2489 (class 1259 OID 17262177)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2490 (class 1259 OID 17262179)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2491 (class 1259 OID 17262178)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2492 (class 1259 OID 17262180)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2545 (class 1259 OID 17262304)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2612 (class 1259 OID 17262501)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 17262534)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2462 (class 1259 OID 17262085)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2463 (class 1259 OID 17262086)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2584 (class 1259 OID 17262409)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2668 (class 1259 OID 17262737)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 17262149)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2665 (class 1259 OID 17262725)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2567 (class 1259 OID 17262356)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2568 (class 1259 OID 17262355)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2634 (class 1259 OID 17262565)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2479 (class 1259 OID 17262137)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 17262514)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2676 (class 1259 OID 17262777)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2650 (class 1259 OID 17262684)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2651 (class 1259 OID 17262685)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2525 (class 1259 OID 17262266)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2448 (class 1259 OID 17262035)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2724 (class 2606 OID 17262944)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2723 (class 2606 OID 17262949)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2719 (class 2606 OID 17262969)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2725 (class 2606 OID 17262939)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2721 (class 2606 OID 17262959)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2720 (class 2606 OID 17262964)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2722 (class 2606 OID 17262954)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2757 (class 2606 OID 17263119)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2756 (class 2606 OID 17263124)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2755 (class 2606 OID 17263129)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2789 (class 2606 OID 17263294)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2790 (class 2606 OID 17263289)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2707 (class 2606 OID 17262879)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2741 (class 2606 OID 17263049)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2784 (class 2606 OID 17263274)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2785 (class 2606 OID 17263269)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2783 (class 2606 OID 17263279)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2786 (class 2606 OID 17263264)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2787 (class 2606 OID 17263259)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2739 (class 2606 OID 17263044)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2740 (class 2606 OID 17263039)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2718 (class 2606 OID 17262934)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2751 (class 2606 OID 17263089)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2749 (class 2606 OID 17263099)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2750 (class 2606 OID 17263094)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2713 (class 2606 OID 17262914)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2714 (class 2606 OID 17262909)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2737 (class 2606 OID 17263029)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2780 (class 2606 OID 17263244)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2760 (class 2606 OID 17263134)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2759 (class 2606 OID 17263139)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2758 (class 2606 OID 17263144)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2788 (class 2606 OID 17263284)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2762 (class 2606 OID 17263164)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2765 (class 2606 OID 17263149)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2761 (class 2606 OID 17263169)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2763 (class 2606 OID 17263159)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2764 (class 2606 OID 17263154)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2711 (class 2606 OID 17262904)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2712 (class 2606 OID 17262899)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2703 (class 2606 OID 17262864)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2704 (class 2606 OID 17262859)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2745 (class 2606 OID 17263069)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2700 (class 2606 OID 17262839)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2699 (class 2606 OID 17262844)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2746 (class 2606 OID 17263084)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2747 (class 2606 OID 17263079)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2748 (class 2606 OID 17263074)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2716 (class 2606 OID 17262919)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2715 (class 2606 OID 17262924)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2782 (class 2606 OID 17263254)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2729 (class 2606 OID 17263004)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2731 (class 2606 OID 17262994)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2732 (class 2606 OID 17262989)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2730 (class 2606 OID 17262999)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2698 (class 2606 OID 17262829)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2697 (class 2606 OID 17262834)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2742 (class 2606 OID 17263054)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2793 (class 2606 OID 17263309)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2795 (class 2606 OID 17263314)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2794 (class 2606 OID 17263319)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2738 (class 2606 OID 17263034)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2754 (class 2606 OID 17263109)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2753 (class 2606 OID 17263114)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2772 (class 2606 OID 17263224)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2773 (class 2606 OID 17263219)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2776 (class 2606 OID 17263204)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2775 (class 2606 OID 17263209)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2774 (class 2606 OID 17263214)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2709 (class 2606 OID 17262889)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2710 (class 2606 OID 17262884)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2708 (class 2606 OID 17262894)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2743 (class 2606 OID 17263064)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2744 (class 2606 OID 17263059)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2778 (class 2606 OID 17263229)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2777 (class 2606 OID 17263234)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2769 (class 2606 OID 17263194)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2768 (class 2606 OID 17263199)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2771 (class 2606 OID 17263184)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2770 (class 2606 OID 17263189)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2752 (class 2606 OID 17263104)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2733 (class 2606 OID 17263024)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2734 (class 2606 OID 17263019)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2736 (class 2606 OID 17263009)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2735 (class 2606 OID 17263014)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2766 (class 2606 OID 17263179)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2767 (class 2606 OID 17263174)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2717 (class 2606 OID 17262929)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2779 (class 2606 OID 17263239)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2781 (class 2606 OID 17263249)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2792 (class 2606 OID 17263299)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2791 (class 2606 OID 17263304)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2701 (class 2606 OID 17262854)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2702 (class 2606 OID 17262849)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2706 (class 2606 OID 17262869)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2705 (class 2606 OID 17262874)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2726 (class 2606 OID 17262984)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2727 (class 2606 OID 17262979)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2728 (class 2606 OID 17262974)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-04 09:49:34 CEST

--
-- PostgreSQL database dump complete
--

