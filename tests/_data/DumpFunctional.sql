--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-24 16:36:49 CEST

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
-- TOC entry 2963 (class 0 OID 0)
-- Dependencies: 240
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 177 (class 1259 OID 15335310)
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
-- TOC entry 222 (class 1259 OID 15335813)
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
-- TOC entry 221 (class 1259 OID 15335796)
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
-- TOC entry 215 (class 1259 OID 15335708)
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
-- TOC entry 238 (class 1259 OID 15336060)
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
-- TOC entry 191 (class 1259 OID 15335489)
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
-- TOC entry 194 (class 1259 OID 15335523)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 15335962)
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
-- TOC entry 186 (class 1259 OID 15335432)
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
-- TOC entry 223 (class 1259 OID 15335826)
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
-- TOC entry 210 (class 1259 OID 15335653)
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
-- TOC entry 189 (class 1259 OID 15335469)
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
-- TOC entry 193 (class 1259 OID 15335517)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 15335449)
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
-- TOC entry 199 (class 1259 OID 15335570)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 236 (class 1259 OID 15336041)
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
-- TOC entry 237 (class 1259 OID 15336053)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 15336075)
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
-- TOC entry 203 (class 1259 OID 15335595)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 15335406)
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
-- TOC entry 178 (class 1259 OID 15335319)
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
-- TOC entry 179 (class 1259 OID 15335330)
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
-- TOC entry 174 (class 1259 OID 15335284)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 15335303)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 15335602)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 15335633)
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
-- TOC entry 218 (class 1259 OID 15335747)
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
-- TOC entry 181 (class 1259 OID 15335363)
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
-- TOC entry 183 (class 1259 OID 15335398)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 15335576)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 15335383)
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
-- TOC entry 188 (class 1259 OID 15335461)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 15335588)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 15335924)
-- Name: produkcijadelitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijadelitev (
    id uuid NOT NULL,
    koproducent_id uuid NOT NULL,
    odstotekfinanciranja numeric(15,2) DEFAULT NULL::numeric,
    delez numeric(15,2) DEFAULT NULL::numeric,
    maticnikop boolean NOT NULL,
    enotaprograma_id uuid
);


--
-- TOC entry 226 (class 1259 OID 15335933)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 224 (class 1259 OID 15335880)
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
-- TOC entry 227 (class 1259 OID 15335941)
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
-- TOC entry 206 (class 1259 OID 15335617)
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
-- TOC entry 198 (class 1259 OID 15335561)
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
-- TOC entry 197 (class 1259 OID 15335551)
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
-- TOC entry 217 (class 1259 OID 15335736)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 15335685)
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
-- TOC entry 171 (class 1259 OID 15335255)
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
-- TOC entry 170 (class 1259 OID 15335253)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2964 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 207 (class 1259 OID 15335627)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 15335293)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 15335277)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 15335641)
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
-- TOC entry 201 (class 1259 OID 15335582)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 15335528)
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
-- TOC entry 232 (class 1259 OID 15335982)
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
-- TOC entry 231 (class 1259 OID 15335974)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 15335969)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 15335695)
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
-- TOC entry 180 (class 1259 OID 15335355)
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
-- TOC entry 196 (class 1259 OID 15335538)
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
-- TOC entry 216 (class 1259 OID 15335725)
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
-- TOC entry 228 (class 1259 OID 15335951)
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
-- TOC entry 185 (class 1259 OID 15335418)
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
-- TOC entry 172 (class 1259 OID 15335264)
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
-- TOC entry 220 (class 1259 OID 15335773)
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
-- TOC entry 190 (class 1259 OID 15335480)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 15335609)
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
-- TOC entry 234 (class 1259 OID 15336021)
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
-- TOC entry 233 (class 1259 OID 15335993)
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
-- TOC entry 235 (class 1259 OID 15336033)
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
-- TOC entry 212 (class 1259 OID 15335678)
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
-- TOC entry 192 (class 1259 OID 15335512)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 15335763)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 15335668)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2170 (class 2604 OID 15335258)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2894 (class 0 OID 15335310)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 15335813)
-- Dependencies: 222
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55db-2bff-3329-c859e50aebe7	000d0000-55db-2bff-0503-022f10a9e783	\N	00090000-55db-2bff-80c3-7ef4d7d87327	000b0000-55db-2bff-e9dc-6adacf68b2d5	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55db-2bff-0abd-3008a7e37c8e	000d0000-55db-2bff-966f-9d03e2b110d7	00100000-55db-2bff-bc63-1b291c6de909	00090000-55db-2bff-685f-48a837e028cb	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55db-2bff-70fb-21222823de8f	000d0000-55db-2bff-cc03-12c829ab3045	00100000-55db-2bff-2421-ac9b5d5cb324	00090000-55db-2bff-c525-2c4ade61d9df	\N	0003	t	\N	2015-08-24	\N	2	\N	\N	f	f
000c0000-55db-2bff-661e-70990a2ff6bf	000d0000-55db-2bff-8faa-91d958e991aa	\N	00090000-55db-2bff-74e1-12f51afbdb1b	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55db-2bff-5db3-4e95921afb1a	000d0000-55db-2bff-13a8-9de9419f2327	\N	00090000-55db-2bff-2779-3254aa4d2123	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55db-2bff-aa4f-53b2949a8e96	000d0000-55db-2bff-b221-7012bb3fcdab	\N	00090000-55db-2bff-79cc-b61c07718e8c	000b0000-55db-2bff-352c-162bead83774	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55db-2bff-975b-8a0d6518eeb4	000d0000-55db-2bff-9b36-4119a3a97704	00100000-55db-2bff-af57-f676e9d19ebb	00090000-55db-2bff-0f63-03e388872adf	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55db-2bff-daf7-b7128c97dd3c	000d0000-55db-2bff-800d-28bf6d6168ce	\N	00090000-55db-2bff-bd22-5f261f033206	000b0000-55db-2bff-0dc1-5321e5c79866	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55db-2bff-df17-0ba48eb53305	000d0000-55db-2bff-9b36-4119a3a97704	00100000-55db-2bff-15a8-7c146226564e	00090000-55db-2bff-e87f-62f1d773e456	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55db-2bff-0303-247d8b87ca0b	000d0000-55db-2bff-9b36-4119a3a97704	00100000-55db-2bff-2f40-11e3a2c03b27	00090000-55db-2bff-fb33-335bbe88c1ef	\N	0010	t	\N	2015-08-24	\N	16	\N	\N	f	t
000c0000-55db-2bff-e722-1f9465cb71d8	000d0000-55db-2bff-9b36-4119a3a97704	00100000-55db-2bff-82e3-7abaed583a45	00090000-55db-2bff-76be-b5e61bf6fbd0	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2938 (class 0 OID 15335796)
-- Dependencies: 221
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 15335708)
-- Dependencies: 215
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55db-2bff-4bc5-1fb01862c4c8	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55db-2bff-cd4d-9bd3b01a1988	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55db-2bff-7c01-6a8f6d16bc3a	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2955 (class 0 OID 15336060)
-- Dependencies: 238
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 15335489)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55db-2bff-2e07-89f9375d072b	\N	\N	00200000-55db-2bff-f7e1-3e6e17ac35a2	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55db-2bff-8132-82c4960979aa	\N	\N	00200000-55db-2bff-d5d2-d5e21fc2aff2	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55db-2bff-d695-29ab7bf6e523	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55db-2bff-c81c-c4672802ded2	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55db-2bff-7c96-19660484ef27	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2911 (class 0 OID 15335523)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 15335962)
-- Dependencies: 229
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 15335432)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55db-2bfd-1466-519924c0c52c	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55db-2bfd-299e-feb86ad2695d	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55db-2bfd-ae36-35b3552b6b08	AL	ALB	008	Albania 	Albanija	\N
00040000-55db-2bfd-d332-9ef51e83737e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55db-2bfd-940c-f75b6230b916	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55db-2bfd-9c4a-0dc5851fda93	AD	AND	020	Andorra 	Andora	\N
00040000-55db-2bfd-cc0f-34c2cf127a52	AO	AGO	024	Angola 	Angola	\N
00040000-55db-2bfd-33c2-711570b3f6ab	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55db-2bfd-9195-078362cf5eac	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55db-2bfd-4cb3-9b31abf87480	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55db-2bfd-eb27-01356dbc684b	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55db-2bfd-7c3c-94e4284a12c7	AM	ARM	051	Armenia 	Armenija	\N
00040000-55db-2bfd-9e44-b8eedc60a6db	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55db-2bfd-9f29-67d1500acfbd	AU	AUS	036	Australia 	Avstralija	\N
00040000-55db-2bfd-3d4a-55ebb9bbe9df	AT	AUT	040	Austria 	Avstrija	\N
00040000-55db-2bfd-aa5d-abfc93004145	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55db-2bfd-d4f7-0314712c8e86	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55db-2bfd-cf7c-ae4c82957f7c	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55db-2bfd-09a6-7c5f511ac9cc	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55db-2bfd-e4b4-b8692484b925	BB	BRB	052	Barbados 	Barbados	\N
00040000-55db-2bfd-7341-563dbe4a6d16	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55db-2bfd-5471-844168653903	BE	BEL	056	Belgium 	Belgija	\N
00040000-55db-2bfd-7c95-78e52d03b6d5	BZ	BLZ	084	Belize 	Belize	\N
00040000-55db-2bfd-8073-99a37c8ff946	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55db-2bfd-951d-470f19d39552	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55db-2bfd-cd0c-9b58f186157f	BT	BTN	064	Bhutan 	Butan	\N
00040000-55db-2bfd-91a7-013f9722c7e5	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55db-2bfd-1572-adb6e74a1c69	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55db-2bfd-d465-7b268052db73	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55db-2bfd-e81b-044b742eb019	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55db-2bfd-84d9-f6d816435058	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55db-2bfd-0038-bc9a548c21d2	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55db-2bfd-b2f1-47035f1cf096	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55db-2bfd-976d-e78f1f5cd8f8	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55db-2bfd-49ec-0e20f1c2471d	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55db-2bfd-4fe5-875f670aedf6	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55db-2bfd-eb32-5950d4be91e1	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55db-2bfd-d18d-bbca6a013162	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55db-2bfd-b330-834023402e67	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55db-2bfd-6013-459a674b3b52	CA	CAN	124	Canada 	Kanada	\N
00040000-55db-2bfd-7765-5948ba2e0954	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55db-2bfd-01aa-1e1b7bc2714a	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55db-2bfd-e57a-060aaba40379	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55db-2bfd-3e1b-d9f31b14f6c0	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55db-2bfd-52eb-615fd2a76d40	CL	CHL	152	Chile 	Čile	\N
00040000-55db-2bfd-7ecd-79e7af51e8ca	CN	CHN	156	China 	Kitajska	\N
00040000-55db-2bfd-e926-46a70ccfe346	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55db-2bfd-88bb-2dbeb84f3849	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55db-2bfd-89fa-ec313d29ca49	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55db-2bfd-2b8d-ad2400cb68b0	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55db-2bfd-22c0-28d16129affd	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55db-2bfd-c8e6-984e6f686783	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55db-2bfd-a314-c1de34ef4055	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55db-2bfd-13c6-0fbfaa9fcb2f	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55db-2bfd-27ff-3322eac6cbc5	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55db-2bfd-f83d-d71c1a0e0741	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55db-2bfd-e7f3-fad87ede3214	CU	CUB	192	Cuba 	Kuba	\N
00040000-55db-2bfd-4566-1b052f55d701	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55db-2bfd-af9f-4ebc93fcdaa2	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55db-2bfd-748b-6ff771e8421f	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55db-2bfd-c596-80c4e1459e1d	DK	DNK	208	Denmark 	Danska	\N
00040000-55db-2bfd-3eaf-b469854ae426	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55db-2bfd-63ca-919fb3842ece	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55db-2bfd-9f4f-642388780600	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55db-2bfd-acf8-51328c9f554a	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55db-2bfd-ccf7-8414df538b19	EG	EGY	818	Egypt 	Egipt	\N
00040000-55db-2bfd-7826-93ae8f4fc827	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55db-2bfd-e046-77b9db6b8613	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55db-2bfd-7865-88438f7a20e4	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55db-2bfd-d8bb-65f34d86f9ab	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55db-2bfd-3cd7-469480607581	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55db-2bfd-a759-1ffc6a59579e	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55db-2bfd-bac8-fb1f75b09bb2	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55db-2bfd-a25a-bc5b6a50033e	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55db-2bfd-6850-70bd9e08f816	FI	FIN	246	Finland 	Finska	\N
00040000-55db-2bfd-aa67-512ace9925a7	FR	FRA	250	France 	Francija	\N
00040000-55db-2bfd-6414-effacfd758bd	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55db-2bfd-d63b-af6b5eab9ff9	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55db-2bfd-f0bf-3f178164fb58	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55db-2bfd-77c9-27daa0e47b2d	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55db-2bfd-936a-1103cd602bc5	GA	GAB	266	Gabon 	Gabon	\N
00040000-55db-2bfd-8b4c-0aae957dcfaa	GM	GMB	270	Gambia 	Gambija	\N
00040000-55db-2bfd-6f13-34575273f100	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55db-2bfd-200a-ed6d12d9181f	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55db-2bfd-11e2-2f4e94cd2230	GH	GHA	288	Ghana 	Gana	\N
00040000-55db-2bfd-6d37-5986fba16ce6	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55db-2bfd-c17f-11e4f7875f8b	GR	GRC	300	Greece 	Grčija	\N
00040000-55db-2bfd-f457-69e3cdb10419	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55db-2bfd-c29d-a8d43fcb3f8c	GD	GRD	308	Grenada 	Grenada	\N
00040000-55db-2bfd-ab61-8c979e680adc	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55db-2bfd-8f6d-9f0dd44b4519	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55db-2bfd-f562-5b2117c1bd9d	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55db-2bfd-2750-f37f37847f6e	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55db-2bfd-ec94-faee863da69d	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55db-2bfd-a282-8ae78b057e61	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55db-2bfd-f2e4-4c2322cfb8f7	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55db-2bfd-b7bf-c48fa4408644	HT	HTI	332	Haiti 	Haiti	\N
00040000-55db-2bfd-d165-32a073853bf9	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55db-2bfd-fd7f-6b7c13e734f3	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55db-2bfd-4513-299951e4eded	HN	HND	340	Honduras 	Honduras	\N
00040000-55db-2bfd-93c1-daf39e87bd60	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55db-2bfd-d79b-cd986718d76a	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55db-2bfd-c9ed-a199f39a8576	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55db-2bfd-63e1-90455e597e0f	IN	IND	356	India 	Indija	\N
00040000-55db-2bfd-1e17-bf210638cc22	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55db-2bfd-f0fc-2322274caf3a	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55db-2bfd-9a43-870426ab39b2	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55db-2bfd-0e09-7b0a40272f6d	IE	IRL	372	Ireland 	Irska	\N
00040000-55db-2bfd-749c-72b995a27d0d	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55db-2bfd-48ed-c6a530df67c5	IL	ISR	376	Israel 	Izrael	\N
00040000-55db-2bfd-e17d-d75b4ed37b4d	IT	ITA	380	Italy 	Italija	\N
00040000-55db-2bfd-9f95-4aaeb6f6e9ca	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55db-2bfd-1454-a2cc4156185e	JP	JPN	392	Japan 	Japonska	\N
00040000-55db-2bfd-e6c9-0c0030e29c14	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55db-2bfd-72bb-6c97c954cf04	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55db-2bfd-4e3e-56d8a1ac9d9b	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55db-2bfd-36c1-ebe688bb4653	KE	KEN	404	Kenya 	Kenija	\N
00040000-55db-2bfd-6480-12ce8b393b74	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55db-2bfd-2c90-806749efb0f0	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55db-2bfd-4876-e04d6246b174	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55db-2bfd-0cf2-10ab8449b1bf	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55db-2bfd-3026-b5e751e65438	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55db-2bfd-2542-870ee79468b1	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55db-2bfd-0adf-9c0493291d32	LV	LVA	428	Latvia 	Latvija	\N
00040000-55db-2bfd-58d5-71a87f4e9be9	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55db-2bfd-9dfc-22e5429c9143	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55db-2bfd-f2d4-03fd8d1e3257	LR	LBR	430	Liberia 	Liberija	\N
00040000-55db-2bfd-d0b5-5b281f176688	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55db-2bfd-a422-f0386f279a60	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55db-2bfd-01a9-3d020173d77f	LT	LTU	440	Lithuania 	Litva	\N
00040000-55db-2bfd-8e18-81fd12038d89	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55db-2bfd-a557-574ba35e9934	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55db-2bfd-2e24-9c71f3beae0e	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55db-2bfd-2d8b-19bc6426e387	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55db-2bfd-e52f-10e932a33045	MW	MWI	454	Malawi 	Malavi	\N
00040000-55db-2bfd-544f-bbb332ca4998	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55db-2bfd-cd61-23a135640150	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55db-2bfd-b9b1-5cc832d8e287	ML	MLI	466	Mali 	Mali	\N
00040000-55db-2bfd-53a9-fed270a84561	MT	MLT	470	Malta 	Malta	\N
00040000-55db-2bfd-ad2b-c4ef1747c047	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55db-2bfd-17b9-d995effad6e7	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55db-2bfd-80e0-7baf43aedd71	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55db-2bfd-04a2-bb7df814f611	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55db-2bfd-ed69-38bfd1d3d8e2	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55db-2bfd-88a9-eaad62059880	MX	MEX	484	Mexico 	Mehika	\N
00040000-55db-2bfd-a613-f240da0738d2	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55db-2bfd-2dfc-6bf6c92db87c	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55db-2bfd-0688-2a9e9e6f75dd	MC	MCO	492	Monaco 	Monako	\N
00040000-55db-2bfd-cdca-91361394d9bf	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55db-2bfd-efab-151acfb42009	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55db-2bfd-6e00-f6878962e6a1	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55db-2bfd-f6d3-b1842e7f0b53	MA	MAR	504	Morocco 	Maroko	\N
00040000-55db-2bfd-246c-4ea565ceceb7	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55db-2bfd-2f6a-4b44de8210bf	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55db-2bfd-068c-811b9c15cd0d	NA	NAM	516	Namibia 	Namibija	\N
00040000-55db-2bfd-4fdb-a02f94883165	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55db-2bfd-63d0-15cad524f248	NP	NPL	524	Nepal 	Nepal	\N
00040000-55db-2bfd-99e3-c9ee61608470	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55db-2bfd-f346-0a3ac26f89ec	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55db-2bfd-a267-ac4322d3dc5f	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55db-2bfd-4878-91d5bcb35bfd	NE	NER	562	Niger 	Niger 	\N
00040000-55db-2bfd-8061-a2b212627212	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55db-2bfd-ff96-1389d7979a4d	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55db-2bfd-b1b9-5f1831a80a8d	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55db-2bfd-6e7f-092f89e6a6a6	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55db-2bfd-d917-7c17fa7621db	NO	NOR	578	Norway 	Norveška	\N
00040000-55db-2bfd-3b1b-0b1194386c1f	OM	OMN	512	Oman 	Oman	\N
00040000-55db-2bfd-70bf-4a3d28353cf7	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55db-2bfd-6c4e-62e17d406ca0	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55db-2bfd-fe95-b2a570e39ccc	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55db-2bfd-d73e-3abea0b1b528	PA	PAN	591	Panama 	Panama	\N
00040000-55db-2bfd-f5b9-4e60cd8c5e83	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55db-2bfd-2e8b-9f8b356463a5	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55db-2bfd-33aa-766dd9d45bf5	PE	PER	604	Peru 	Peru	\N
00040000-55db-2bfd-26b7-c72bf87aa652	PH	PHL	608	Philippines 	Filipini	\N
00040000-55db-2bfd-5bba-cd39b3688a92	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55db-2bfd-c0d6-37fd5afed7e1	PL	POL	616	Poland 	Poljska	\N
00040000-55db-2bfd-3944-5e9ed693a0e4	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55db-2bfd-6813-2ed5736abf21	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55db-2bfd-7ca5-e81ed6755015	QA	QAT	634	Qatar 	Katar	\N
00040000-55db-2bfd-58ee-29aa5f0ad78e	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55db-2bfd-2337-7f3cee4b7b8b	RO	ROU	642	Romania 	Romunija	\N
00040000-55db-2bfd-4ebc-65bd70e33ce2	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55db-2bfd-dd92-6eeb9f286667	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55db-2bfd-dc5f-f32132891d37	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55db-2bfd-c613-d67e3a473329	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55db-2bfd-e07b-5f6b77245c2d	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55db-2bfd-c521-32bc4b4d13ec	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55db-2bfd-691f-2f32f4d8a257	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55db-2bfd-b53f-a17ec4a74b67	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55db-2bfd-eaeb-8a82b48affda	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55db-2bfd-a1f3-f3b41bc456fe	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55db-2bfd-b376-8ef65dce0366	SM	SMR	674	San Marino 	San Marino	\N
00040000-55db-2bfd-3be3-ab7fce8ec635	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55db-2bfd-0a0a-147bea715ea0	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55db-2bfd-6a63-e27e4049a4cc	SN	SEN	686	Senegal 	Senegal	\N
00040000-55db-2bfd-4ad9-071b1fc172d5	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55db-2bfd-1c0b-576d226b9516	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55db-2bfd-04b8-b31767469f45	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55db-2bfd-04df-274ed25279e1	SG	SGP	702	Singapore 	Singapur	\N
00040000-55db-2bfd-bf4a-624f74cb1019	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55db-2bfd-bf5f-59107b00930e	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55db-2bfd-eaa5-35f4963b837b	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55db-2bfd-d58a-5e1002bb9095	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55db-2bfd-8385-6bbef0210e1c	SO	SOM	706	Somalia 	Somalija	\N
00040000-55db-2bfd-eb70-d8e002382f7b	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55db-2bfd-25bc-207c05b99cf6	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55db-2bfd-8ca1-38d9c72db847	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55db-2bfd-103c-aeb7a78161b7	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55db-2bfd-2973-b2669d1422a7	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55db-2bfd-1e11-370464b601a2	SD	SDN	729	Sudan 	Sudan	\N
00040000-55db-2bfd-621b-64bf930f15bc	SR	SUR	740	Suriname 	Surinam	\N
00040000-55db-2bfd-5f1e-635de838b7bb	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55db-2bfd-1b6e-cb54b00c9b42	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55db-2bfd-343a-96fdc317b065	SE	SWE	752	Sweden 	Švedska	\N
00040000-55db-2bfd-43a2-a6b933505ff5	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55db-2bfd-106f-48842ca915a4	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55db-2bfd-8dd7-c09ccf5ee581	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55db-2bfd-a60f-a7228386ada5	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55db-2bfd-c3b6-8115f8500419	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55db-2bfd-c3eb-dcdfb3a520f8	TH	THA	764	Thailand 	Tajska	\N
00040000-55db-2bfd-0c57-e66f54d49879	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55db-2bfd-e6d8-24c9e376352f	TG	TGO	768	Togo 	Togo	\N
00040000-55db-2bfd-bf7f-1bcfc023797c	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55db-2bfd-9da6-e4a21a2a8d4b	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55db-2bfd-aec3-2bbaafea5b73	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55db-2bfd-cbe6-23776fd292e5	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55db-2bfd-4a45-81c677d7b3d5	TR	TUR	792	Turkey 	Turčija	\N
00040000-55db-2bfd-d22a-b3b02ddf7d3d	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55db-2bfd-b2d4-69452e650cde	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55db-2bfd-ccaa-9a28e82ee641	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55db-2bfd-dd99-35168f9aadb8	UG	UGA	800	Uganda 	Uganda	\N
00040000-55db-2bfd-09f2-8999052b6527	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55db-2bfd-79f0-474ac2163399	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55db-2bfd-fdbe-15e3734fd3c5	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55db-2bfd-c619-3b1171ccc7f2	US	USA	840	United States 	Združene države Amerike	\N
00040000-55db-2bfd-6ea0-128747f2d638	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55db-2bfd-1646-d4f8c56721d8	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55db-2bfd-eb1d-1e186e0dd85d	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55db-2bfd-42c5-2291925af3ab	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55db-2bfd-3541-d84985ec66b4	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55db-2bfd-8dae-818ebaf14839	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55db-2bfd-605f-43cc8e2a0699	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55db-2bfd-7c79-a3821648e784	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55db-2bfd-f756-71b910723a29	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55db-2bfd-67d8-0583686f3e29	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55db-2bfd-af1d-39ca5e29c448	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55db-2bfd-b381-827a82cc2d71	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55db-2bfd-23d1-1e5d3b1741ca	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2940 (class 0 OID 15335826)
-- Dependencies: 223
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55db-2bff-4afe-08327d1d7573	000e0000-55db-2bff-91ad-4684f5c9c5cc	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		\N	002b0000-55db-2bfd-5101-119435d4cc81	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55db-2bff-fc7d-056b5e943d7c	000e0000-55db-2bff-f03a-282482839bcf	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		\N	002b0000-55db-2bfd-c4de-7cb3259b0316	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55db-2bff-78f1-cedb4a1f30d5	000e0000-55db-2bff-4e4c-6593529371bf	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		\N	002b0000-55db-2bfd-5101-119435d4cc81	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55db-2bff-1f21-716e7cbcbde7	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55db-2bff-9eec-3fabef8f4ea1	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2927 (class 0 OID 15335653)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55db-2bff-9b36-4119a3a97704	000e0000-55db-2bff-f03a-282482839bcf	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55db-2bfd-1540-afe3010f5434
000d0000-55db-2bff-0503-022f10a9e783	000e0000-55db-2bff-f03a-282482839bcf	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55db-2bfd-1540-afe3010f5434
000d0000-55db-2bff-966f-9d03e2b110d7	000e0000-55db-2bff-f03a-282482839bcf	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55db-2bfd-32aa-b44be6bcfbfa
000d0000-55db-2bff-cc03-12c829ab3045	000e0000-55db-2bff-f03a-282482839bcf	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55db-2bfd-197f-f487d152bcdf
000d0000-55db-2bff-8faa-91d958e991aa	000e0000-55db-2bff-f03a-282482839bcf	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55db-2bfd-a535-bb38a62fbf73
000d0000-55db-2bff-13a8-9de9419f2327	000e0000-55db-2bff-f03a-282482839bcf	\N	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55db-2bfd-a535-bb38a62fbf73
000d0000-55db-2bff-b221-7012bb3fcdab	000e0000-55db-2bff-f03a-282482839bcf	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55db-2bfd-1540-afe3010f5434
000d0000-55db-2bff-800d-28bf6d6168ce	000e0000-55db-2bff-f03a-282482839bcf	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55db-2bfd-abc2-c075e55bba2d
\.


--
-- TOC entry 2906 (class 0 OID 15335469)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2910 (class 0 OID 15335517)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 15335449)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55db-2bff-0979-43ac0bfba805	00080000-55db-2bff-a15e-012649b89002	00090000-55db-2bff-fb33-335bbe88c1ef	AK		
\.


--
-- TOC entry 2916 (class 0 OID 15335570)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 15336041)
-- Dependencies: 236
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 15336053)
-- Dependencies: 237
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2956 (class 0 OID 15336075)
-- Dependencies: 239
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 15335595)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 15335406)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55db-2bfe-2a04-d8c57c2e502b	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55db-2bfe-4bf4-1488bb356837	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55db-2bfe-f1ea-d51f93bd6f12	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55db-2bfe-ff23-9b13f6599996	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55db-2bfe-b5a8-a35369b8387b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55db-2bfe-9253-f3d18a5c7bf6	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55db-2bfe-fa7e-cd9b20d10c2e	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55db-2bfe-f20a-c3373a593004	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55db-2bfe-5e4e-3049cc5691db	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55db-2bfe-43ab-fecc57d8a68b	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55db-2bfe-f5a2-cf34d5b209cd	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55db-2bfe-34c5-d4148505178f	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55db-2bfe-2076-a9e5317b1c66	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55db-2bfe-5097-3b3c6ba7df98	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55db-2bff-d3af-08c6742fd373	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55db-2bff-ba0d-07b34af18295	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55db-2bff-f3b4-f8f9f51265a5	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55db-2bff-d874-c5296eb4e3d3	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55db-2bff-5dba-54b7736d5234	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55db-2c00-313a-f381a91e674a	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2895 (class 0 OID 15335319)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55db-2bff-3524-a7b8b2cca4de	00000000-55db-2bff-d3af-08c6742fd373	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55db-2bff-5a4e-84906326fc8d	00000000-55db-2bff-d3af-08c6742fd373	00010000-55db-2bfe-640a-cdce7e7f9d3e	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55db-2bff-bf38-8233aacfd319	00000000-55db-2bff-ba0d-07b34af18295	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2896 (class 0 OID 15335330)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55db-2bff-80c3-7ef4d7d87327	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55db-2bff-74e1-12f51afbdb1b	00010000-55db-2bff-564d-7e9c74c099cb	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55db-2bff-c525-2c4ade61d9df	00010000-55db-2bff-a421-f703b5a01434	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55db-2bff-e87f-62f1d773e456	00010000-55db-2bff-5540-642a2c9a21ec	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55db-2bff-71ec-f38769658189	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55db-2bff-79cc-b61c07718e8c	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55db-2bff-76be-b5e61bf6fbd0	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55db-2bff-0f63-03e388872adf	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55db-2bff-fb33-335bbe88c1ef	00010000-55db-2bff-d6e5-a02b9dccd2ee	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55db-2bff-685f-48a837e028cb	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55db-2bff-67f9-bfc3fc7cde80	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55db-2bff-2779-3254aa4d2123	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55db-2bff-bd22-5f261f033206	00010000-55db-2bff-3f0e-60ce6f296e7a	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2891 (class 0 OID 15335284)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55db-2bfe-52b7-d1c7140892bd	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55db-2bfe-9f84-51f822865f28	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55db-2bfe-fe71-9fb536f7cb67	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55db-2bfe-6f1f-4cda50b2f6f3	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55db-2bfe-5b04-4c86f7c35193	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55db-2bfe-8e7f-06d3bef0e5b7	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55db-2bfe-b62a-2f1ab9853f10	Abonma-read	Abonma - branje	f
00030000-55db-2bfe-510d-604d8b224e01	Abonma-write	Abonma - spreminjanje	f
00030000-55db-2bfe-4364-d5d1c025849a	Alternacija-read	Alternacija - branje	f
00030000-55db-2bfe-f1e6-eeebc89a4808	Alternacija-write	Alternacija - spreminjanje	f
00030000-55db-2bfe-7c45-8355e4733c5f	Arhivalija-read	Arhivalija - branje	f
00030000-55db-2bfe-b56a-600c22bdf167	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55db-2bfe-21ce-a50371dc57e3	Besedilo-read	Besedilo - branje	f
00030000-55db-2bfe-82e3-0a8bd86918dc	Besedilo-write	Besedilo - spreminjanje	f
00030000-55db-2bfe-5f33-e66fa185e915	DogodekIzven-read	DogodekIzven - branje	f
00030000-55db-2bfe-ed98-0c1613fac903	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55db-2bfe-50d3-0c6435be19ed	Dogodek-read	Dogodek - branje	f
00030000-55db-2bfe-1ae4-f46c3f97a4d2	Dogodek-write	Dogodek - spreminjanje	f
00030000-55db-2bfe-f7fe-147317a78ce8	DrugiVir-read	DrugiVir - branje	f
00030000-55db-2bfe-71df-3dd5ff9ea18d	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55db-2bfe-2534-25c9e6e083a2	Drzava-read	Drzava - branje	f
00030000-55db-2bfe-fd79-a33627294f35	Drzava-write	Drzava - spreminjanje	f
00030000-55db-2bfe-c7f6-0825065105dd	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55db-2bfe-394f-c727a588a5ad	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55db-2bfe-2d17-8433d068ded2	Funkcija-read	Funkcija - branje	f
00030000-55db-2bfe-116c-07e8f57c4b3f	Funkcija-write	Funkcija - spreminjanje	f
00030000-55db-2bfe-52db-ba1c5cddc8b8	Gostovanje-read	Gostovanje - branje	f
00030000-55db-2bfe-2d64-06bffbf6d603	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55db-2bfe-5a50-31177f771980	Gostujoca-read	Gostujoca - branje	f
00030000-55db-2bfe-9b49-011ff45c2a5c	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55db-2bfe-6350-960d10932d04	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55db-2bfe-cc23-4780755a6bd5	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55db-2bfe-a9a5-594353488a74	Kupec-read	Kupec - branje	f
00030000-55db-2bfe-ce06-83cd908ff841	Kupec-write	Kupec - spreminjanje	f
00030000-55db-2bfe-05ab-9e61528530ba	NacinPlacina-read	NacinPlacina - branje	f
00030000-55db-2bfe-a15b-23c4ffbe5cde	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55db-2bfe-e0ce-73204d0aadb6	Option-read	Option - branje	f
00030000-55db-2bfe-e1ea-7396bf8717db	Option-write	Option - spreminjanje	f
00030000-55db-2bfe-d5cd-adc29a854e5a	OptionValue-read	OptionValue - branje	f
00030000-55db-2bfe-b24c-04eff1e2e7aa	OptionValue-write	OptionValue - spreminjanje	f
00030000-55db-2bfe-d82f-78af5c4b2aaf	Oseba-read	Oseba - branje	f
00030000-55db-2bfe-f2c6-f847a43d0e03	Oseba-write	Oseba - spreminjanje	f
00030000-55db-2bfe-890c-456132602b26	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55db-2bfe-ce7a-703ac4192fb9	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55db-2bfe-0ea2-532cbdef1860	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55db-2bfe-aa8e-30c2302612aa	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55db-2bfe-564b-56145af67c01	Pogodba-read	Pogodba - branje	f
00030000-55db-2bfe-74eb-bd6b218ece52	Pogodba-write	Pogodba - spreminjanje	f
00030000-55db-2bfe-e698-c2e70539bee4	Popa-read	Popa - branje	f
00030000-55db-2bfe-8158-2d3fc0b35944	Popa-write	Popa - spreminjanje	f
00030000-55db-2bfe-b83f-51d43bbcd98f	Posta-read	Posta - branje	f
00030000-55db-2bfe-dfc2-30e404a27c84	Posta-write	Posta - spreminjanje	f
00030000-55db-2bfe-7884-4b909f972238	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55db-2bfe-20b9-7862f56c8030	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55db-2bfe-b446-ca0ce53b448d	PostniNaslov-read	PostniNaslov - branje	f
00030000-55db-2bfe-0b85-b5349d7a3fea	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55db-2bfe-ed9a-5f97e60e2cb9	Predstava-read	Predstava - branje	f
00030000-55db-2bfe-ff95-78fa21a3f7ee	Predstava-write	Predstava - spreminjanje	f
00030000-55db-2bfe-21e0-5f0f2453d82c	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55db-2bfe-f1df-02a23ee9d546	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55db-2bfe-5110-12067269a762	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55db-2bfe-7e3d-66659a003103	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55db-2bfe-b756-4e05d7d81c67	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55db-2bfe-6bc4-17506fbc0902	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55db-2bfe-0976-8a91550bb4d6	ProgramDela-read	ProgramDela - branje	f
00030000-55db-2bfe-0029-e931144868bd	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55db-2bfe-0a27-0be9cc2a89d7	ProgramFestival-read	ProgramFestival - branje	f
00030000-55db-2bfe-1f57-0b5695e18fbf	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55db-2bfe-fdc5-1a8f6369be20	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55db-2bfe-4d73-11ddaa0d3a72	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55db-2bfe-5952-c889b51cd8a2	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55db-2bfe-ff53-fa18a170922c	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55db-2bfe-20d7-1b927ffc54e6	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55db-2bfe-c7d2-d9d21fe0af32	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55db-2bfe-3863-fff7e9f36ca6	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55db-2bfe-ec69-041e1aa80c35	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55db-2bfe-3d7b-a03bd23d6156	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55db-2bfe-815e-ddb6df74e058	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55db-2bfe-0361-72d747b98d64	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55db-2bfe-96e1-922866035107	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55db-2bfe-28e0-892f5bf4e8b4	ProgramRazno-read	ProgramRazno - branje	f
00030000-55db-2bfe-584d-de7ce968d851	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55db-2bfe-4f07-8079d6554af2	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55db-2bfe-2826-6830435d18ea	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55db-2bfe-f844-b0296152359f	Prostor-read	Prostor - branje	f
00030000-55db-2bfe-7802-f3ad35c166c1	Prostor-write	Prostor - spreminjanje	f
00030000-55db-2bfe-810b-cdc1fcaa2dbb	Racun-read	Racun - branje	f
00030000-55db-2bfe-28a2-6c33f9967a87	Racun-write	Racun - spreminjanje	f
00030000-55db-2bfe-3650-0fb936383b1f	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55db-2bfe-8903-ed2ee47dae47	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55db-2bfe-f225-d36273b6ae7d	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55db-2bfe-4447-e042604e5d16	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55db-2bfe-2cb4-fc587e5e3483	Rekvizit-read	Rekvizit - branje	f
00030000-55db-2bfe-7464-d3626de1edf0	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55db-2bfe-80fc-4073ea17fe46	Revizija-read	Revizija - branje	f
00030000-55db-2bfe-33de-1b44e0655584	Revizija-write	Revizija - spreminjanje	f
00030000-55db-2bfe-01c6-640f400e6228	Rezervacija-read	Rezervacija - branje	f
00030000-55db-2bfe-bb88-86a49b7c87ac	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55db-2bfe-b9f7-93c1de02ced8	SedezniRed-read	SedezniRed - branje	f
00030000-55db-2bfe-17e1-fe19fc0c1a84	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55db-2bfe-3a8d-c3c23bfb6061	Sedez-read	Sedez - branje	f
00030000-55db-2bfe-0343-fdb572ba851e	Sedez-write	Sedez - spreminjanje	f
00030000-55db-2bfe-b35a-528ecd2370e6	Sezona-read	Sezona - branje	f
00030000-55db-2bfe-c16c-d91914444192	Sezona-write	Sezona - spreminjanje	f
00030000-55db-2bfe-c4ce-aee0403c9332	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55db-2bfe-b150-1612ecb2edde	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55db-2bfe-3141-93ba73590b47	Stevilcenje-read	Stevilcenje - branje	f
00030000-55db-2bfe-ac0d-89168ee0e0bf	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55db-2bfe-f67d-5e0c970a4cce	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55db-2bfe-cc8b-193d441676dd	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55db-2bfe-068e-d026fb346817	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55db-2bfe-fa7d-26656b2a0583	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55db-2bfe-e646-779435262889	Telefonska-read	Telefonska - branje	f
00030000-55db-2bfe-cdec-5fac1757e72f	Telefonska-write	Telefonska - spreminjanje	f
00030000-55db-2bfe-f3f9-3a5a7104d2f3	TerminStoritve-read	TerminStoritve - branje	f
00030000-55db-2bfe-3a42-fa8641c07087	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55db-2bfe-32c6-f6fdb33f7884	TipFunkcije-read	TipFunkcije - branje	f
00030000-55db-2bfe-ecd6-3e68be5a3175	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55db-2bfe-452b-b84b682e12c5	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55db-2bfe-b29c-dd3baff44e95	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55db-2bfe-05ab-a1272d0d8dfe	Trr-read	Trr - branje	f
00030000-55db-2bfe-5333-43dd7b08e6a1	Trr-write	Trr - spreminjanje	f
00030000-55db-2bfe-30d1-02b95e944570	Uprizoritev-read	Uprizoritev - branje	f
00030000-55db-2bfe-992d-7f01bfd7497c	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55db-2bfe-c352-9b263c8b0892	Vaja-read	Vaja - branje	f
00030000-55db-2bfe-04e3-22fd0df8f5dc	Vaja-write	Vaja - spreminjanje	f
00030000-55db-2bfe-42d8-3919ae6d8c2a	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55db-2bfe-7d03-5c13f54ce9f8	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55db-2bfe-5c34-84cb582fd623	Zaposlitev-read	Zaposlitev - branje	f
00030000-55db-2bfe-eac1-98c203639935	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55db-2bfe-e92e-57f37e336e13	Zasedenost-read	Zasedenost - branje	f
00030000-55db-2bfe-908a-2585473a3912	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55db-2bfe-9876-cf9fb76b5eb3	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55db-2bfe-6a14-e1d1f18d5142	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55db-2bfe-e807-f0266dc14c70	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55db-2bfe-3550-c870fdf07973	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55db-2bfe-ba3c-f4931643fb6f	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55db-2bfe-bc92-a5f60aae3dc8	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55db-2bfe-add6-e73c0863ef62	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55db-2bfe-aae3-804ee91a08ae	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55db-2bfe-2b97-d21b96c2c2ec	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55db-2bfe-91de-890d662fd05a	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55db-2bfe-1a57-e81c83f963b8	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55db-2bfe-42b6-6545e10f0213	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55db-2bfe-f80a-0bb55662f318	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55db-2bfe-d6b7-cbf4a71d93af	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55db-2bfe-53cc-6ecdff36ad9f	Datoteka-write	Datoteka - spreminjanje	f
00030000-55db-2bfe-1238-09b35204a3f3	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2893 (class 0 OID 15335303)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55db-2bfe-fc06-c17856c26755	00030000-55db-2bfe-9f84-51f822865f28
00020000-55db-2bfe-7c36-6c1e7b583f2b	00030000-55db-2bfe-2534-25c9e6e083a2
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-b62a-2f1ab9853f10
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-510d-604d8b224e01
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-4364-d5d1c025849a
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-f1e6-eeebc89a4808
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-7c45-8355e4733c5f
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-50d3-0c6435be19ed
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-6f1f-4cda50b2f6f3
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-1ae4-f46c3f97a4d2
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-2534-25c9e6e083a2
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-fd79-a33627294f35
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-2d17-8433d068ded2
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-116c-07e8f57c4b3f
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-52db-ba1c5cddc8b8
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-2d64-06bffbf6d603
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-5a50-31177f771980
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-9b49-011ff45c2a5c
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-6350-960d10932d04
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-cc23-4780755a6bd5
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-e0ce-73204d0aadb6
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-d5cd-adc29a854e5a
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-d82f-78af5c4b2aaf
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-f2c6-f847a43d0e03
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-e698-c2e70539bee4
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-8158-2d3fc0b35944
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-b83f-51d43bbcd98f
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-dfc2-30e404a27c84
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-b446-ca0ce53b448d
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-0b85-b5349d7a3fea
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-ed9a-5f97e60e2cb9
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-ff95-78fa21a3f7ee
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-b756-4e05d7d81c67
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-6bc4-17506fbc0902
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-f844-b0296152359f
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-7802-f3ad35c166c1
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-f225-d36273b6ae7d
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-4447-e042604e5d16
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-2cb4-fc587e5e3483
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-7464-d3626de1edf0
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-b35a-528ecd2370e6
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-c16c-d91914444192
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-32c6-f6fdb33f7884
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-30d1-02b95e944570
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-992d-7f01bfd7497c
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-c352-9b263c8b0892
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-04e3-22fd0df8f5dc
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-e92e-57f37e336e13
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-908a-2585473a3912
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-9876-cf9fb76b5eb3
00020000-55db-2bfe-5ae7-0c1724bac665	00030000-55db-2bfe-e807-f0266dc14c70
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-b62a-2f1ab9853f10
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-7c45-8355e4733c5f
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-50d3-0c6435be19ed
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-2534-25c9e6e083a2
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-52db-ba1c5cddc8b8
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-5a50-31177f771980
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-6350-960d10932d04
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-cc23-4780755a6bd5
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-e0ce-73204d0aadb6
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-d5cd-adc29a854e5a
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-d82f-78af5c4b2aaf
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-f2c6-f847a43d0e03
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-e698-c2e70539bee4
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-b83f-51d43bbcd98f
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-b446-ca0ce53b448d
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-0b85-b5349d7a3fea
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-ed9a-5f97e60e2cb9
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-f844-b0296152359f
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-f225-d36273b6ae7d
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-2cb4-fc587e5e3483
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-b35a-528ecd2370e6
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-e646-779435262889
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-cdec-5fac1757e72f
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-05ab-a1272d0d8dfe
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-5333-43dd7b08e6a1
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-5c34-84cb582fd623
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-eac1-98c203639935
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-9876-cf9fb76b5eb3
00020000-55db-2bfe-8fde-36f0b1015914	00030000-55db-2bfe-e807-f0266dc14c70
00020000-55db-2bfe-c50a-35e5e355fa17	00030000-55db-2bfe-b62a-2f1ab9853f10
00020000-55db-2bfe-c50a-35e5e355fa17	00030000-55db-2bfe-4364-d5d1c025849a
00020000-55db-2bfe-c50a-35e5e355fa17	00030000-55db-2bfe-7c45-8355e4733c5f
00020000-55db-2bfe-c50a-35e5e355fa17	00030000-55db-2bfe-b56a-600c22bdf167
00020000-55db-2bfe-c50a-35e5e355fa17	00030000-55db-2bfe-21ce-a50371dc57e3
00020000-55db-2bfe-c50a-35e5e355fa17	00030000-55db-2bfe-5f33-e66fa185e915
00020000-55db-2bfe-c50a-35e5e355fa17	00030000-55db-2bfe-50d3-0c6435be19ed
00020000-55db-2bfe-c50a-35e5e355fa17	00030000-55db-2bfe-2534-25c9e6e083a2
00020000-55db-2bfe-c50a-35e5e355fa17	00030000-55db-2bfe-2d17-8433d068ded2
00020000-55db-2bfe-c50a-35e5e355fa17	00030000-55db-2bfe-52db-ba1c5cddc8b8
00020000-55db-2bfe-c50a-35e5e355fa17	00030000-55db-2bfe-5a50-31177f771980
00020000-55db-2bfe-c50a-35e5e355fa17	00030000-55db-2bfe-6350-960d10932d04
00020000-55db-2bfe-c50a-35e5e355fa17	00030000-55db-2bfe-e0ce-73204d0aadb6
00020000-55db-2bfe-c50a-35e5e355fa17	00030000-55db-2bfe-d5cd-adc29a854e5a
00020000-55db-2bfe-c50a-35e5e355fa17	00030000-55db-2bfe-d82f-78af5c4b2aaf
00020000-55db-2bfe-c50a-35e5e355fa17	00030000-55db-2bfe-e698-c2e70539bee4
00020000-55db-2bfe-c50a-35e5e355fa17	00030000-55db-2bfe-b83f-51d43bbcd98f
00020000-55db-2bfe-c50a-35e5e355fa17	00030000-55db-2bfe-ed9a-5f97e60e2cb9
00020000-55db-2bfe-c50a-35e5e355fa17	00030000-55db-2bfe-b756-4e05d7d81c67
00020000-55db-2bfe-c50a-35e5e355fa17	00030000-55db-2bfe-f844-b0296152359f
00020000-55db-2bfe-c50a-35e5e355fa17	00030000-55db-2bfe-f225-d36273b6ae7d
00020000-55db-2bfe-c50a-35e5e355fa17	00030000-55db-2bfe-2cb4-fc587e5e3483
00020000-55db-2bfe-c50a-35e5e355fa17	00030000-55db-2bfe-b35a-528ecd2370e6
00020000-55db-2bfe-c50a-35e5e355fa17	00030000-55db-2bfe-32c6-f6fdb33f7884
00020000-55db-2bfe-c50a-35e5e355fa17	00030000-55db-2bfe-c352-9b263c8b0892
00020000-55db-2bfe-c50a-35e5e355fa17	00030000-55db-2bfe-e92e-57f37e336e13
00020000-55db-2bfe-c50a-35e5e355fa17	00030000-55db-2bfe-9876-cf9fb76b5eb3
00020000-55db-2bfe-c50a-35e5e355fa17	00030000-55db-2bfe-e807-f0266dc14c70
00020000-55db-2bfe-5059-c66bae94ddbe	00030000-55db-2bfe-b62a-2f1ab9853f10
00020000-55db-2bfe-5059-c66bae94ddbe	00030000-55db-2bfe-510d-604d8b224e01
00020000-55db-2bfe-5059-c66bae94ddbe	00030000-55db-2bfe-f1e6-eeebc89a4808
00020000-55db-2bfe-5059-c66bae94ddbe	00030000-55db-2bfe-7c45-8355e4733c5f
00020000-55db-2bfe-5059-c66bae94ddbe	00030000-55db-2bfe-50d3-0c6435be19ed
00020000-55db-2bfe-5059-c66bae94ddbe	00030000-55db-2bfe-2534-25c9e6e083a2
00020000-55db-2bfe-5059-c66bae94ddbe	00030000-55db-2bfe-52db-ba1c5cddc8b8
00020000-55db-2bfe-5059-c66bae94ddbe	00030000-55db-2bfe-5a50-31177f771980
00020000-55db-2bfe-5059-c66bae94ddbe	00030000-55db-2bfe-e0ce-73204d0aadb6
00020000-55db-2bfe-5059-c66bae94ddbe	00030000-55db-2bfe-d5cd-adc29a854e5a
00020000-55db-2bfe-5059-c66bae94ddbe	00030000-55db-2bfe-e698-c2e70539bee4
00020000-55db-2bfe-5059-c66bae94ddbe	00030000-55db-2bfe-b83f-51d43bbcd98f
00020000-55db-2bfe-5059-c66bae94ddbe	00030000-55db-2bfe-ed9a-5f97e60e2cb9
00020000-55db-2bfe-5059-c66bae94ddbe	00030000-55db-2bfe-f844-b0296152359f
00020000-55db-2bfe-5059-c66bae94ddbe	00030000-55db-2bfe-f225-d36273b6ae7d
00020000-55db-2bfe-5059-c66bae94ddbe	00030000-55db-2bfe-2cb4-fc587e5e3483
00020000-55db-2bfe-5059-c66bae94ddbe	00030000-55db-2bfe-b35a-528ecd2370e6
00020000-55db-2bfe-5059-c66bae94ddbe	00030000-55db-2bfe-32c6-f6fdb33f7884
00020000-55db-2bfe-5059-c66bae94ddbe	00030000-55db-2bfe-9876-cf9fb76b5eb3
00020000-55db-2bfe-5059-c66bae94ddbe	00030000-55db-2bfe-e807-f0266dc14c70
00020000-55db-2bfe-fadb-c936bdc5abc0	00030000-55db-2bfe-b62a-2f1ab9853f10
00020000-55db-2bfe-fadb-c936bdc5abc0	00030000-55db-2bfe-7c45-8355e4733c5f
00020000-55db-2bfe-fadb-c936bdc5abc0	00030000-55db-2bfe-50d3-0c6435be19ed
00020000-55db-2bfe-fadb-c936bdc5abc0	00030000-55db-2bfe-2534-25c9e6e083a2
00020000-55db-2bfe-fadb-c936bdc5abc0	00030000-55db-2bfe-52db-ba1c5cddc8b8
00020000-55db-2bfe-fadb-c936bdc5abc0	00030000-55db-2bfe-5a50-31177f771980
00020000-55db-2bfe-fadb-c936bdc5abc0	00030000-55db-2bfe-e0ce-73204d0aadb6
00020000-55db-2bfe-fadb-c936bdc5abc0	00030000-55db-2bfe-d5cd-adc29a854e5a
00020000-55db-2bfe-fadb-c936bdc5abc0	00030000-55db-2bfe-e698-c2e70539bee4
00020000-55db-2bfe-fadb-c936bdc5abc0	00030000-55db-2bfe-b83f-51d43bbcd98f
00020000-55db-2bfe-fadb-c936bdc5abc0	00030000-55db-2bfe-ed9a-5f97e60e2cb9
00020000-55db-2bfe-fadb-c936bdc5abc0	00030000-55db-2bfe-f844-b0296152359f
00020000-55db-2bfe-fadb-c936bdc5abc0	00030000-55db-2bfe-f225-d36273b6ae7d
00020000-55db-2bfe-fadb-c936bdc5abc0	00030000-55db-2bfe-2cb4-fc587e5e3483
00020000-55db-2bfe-fadb-c936bdc5abc0	00030000-55db-2bfe-b35a-528ecd2370e6
00020000-55db-2bfe-fadb-c936bdc5abc0	00030000-55db-2bfe-f3f9-3a5a7104d2f3
00020000-55db-2bfe-fadb-c936bdc5abc0	00030000-55db-2bfe-fe71-9fb536f7cb67
00020000-55db-2bfe-fadb-c936bdc5abc0	00030000-55db-2bfe-32c6-f6fdb33f7884
00020000-55db-2bfe-fadb-c936bdc5abc0	00030000-55db-2bfe-9876-cf9fb76b5eb3
00020000-55db-2bfe-fadb-c936bdc5abc0	00030000-55db-2bfe-e807-f0266dc14c70
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-52b7-d1c7140892bd
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-9f84-51f822865f28
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-fe71-9fb536f7cb67
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-6f1f-4cda50b2f6f3
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-5b04-4c86f7c35193
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-8e7f-06d3bef0e5b7
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-b62a-2f1ab9853f10
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-510d-604d8b224e01
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-4364-d5d1c025849a
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-f1e6-eeebc89a4808
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-7c45-8355e4733c5f
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-b56a-600c22bdf167
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-21ce-a50371dc57e3
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-82e3-0a8bd86918dc
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-5f33-e66fa185e915
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-ed98-0c1613fac903
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-50d3-0c6435be19ed
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-1ae4-f46c3f97a4d2
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-2534-25c9e6e083a2
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-fd79-a33627294f35
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-f7fe-147317a78ce8
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-71df-3dd5ff9ea18d
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-c7f6-0825065105dd
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-394f-c727a588a5ad
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-2d17-8433d068ded2
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-116c-07e8f57c4b3f
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-52db-ba1c5cddc8b8
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-2d64-06bffbf6d603
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-5a50-31177f771980
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-9b49-011ff45c2a5c
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-6350-960d10932d04
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-cc23-4780755a6bd5
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-a9a5-594353488a74
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-ce06-83cd908ff841
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-05ab-9e61528530ba
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-a15b-23c4ffbe5cde
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-e0ce-73204d0aadb6
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-e1ea-7396bf8717db
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-d5cd-adc29a854e5a
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-b24c-04eff1e2e7aa
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-d82f-78af5c4b2aaf
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-f2c6-f847a43d0e03
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-890c-456132602b26
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-ce7a-703ac4192fb9
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-0ea2-532cbdef1860
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-aa8e-30c2302612aa
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-564b-56145af67c01
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-74eb-bd6b218ece52
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-e698-c2e70539bee4
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-8158-2d3fc0b35944
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-b83f-51d43bbcd98f
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-dfc2-30e404a27c84
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-7884-4b909f972238
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-20b9-7862f56c8030
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-b446-ca0ce53b448d
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-0b85-b5349d7a3fea
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-ed9a-5f97e60e2cb9
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-ff95-78fa21a3f7ee
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-21e0-5f0f2453d82c
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-f1df-02a23ee9d546
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-5110-12067269a762
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-7e3d-66659a003103
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-b756-4e05d7d81c67
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-6bc4-17506fbc0902
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-0976-8a91550bb4d6
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-0029-e931144868bd
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-0a27-0be9cc2a89d7
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-1f57-0b5695e18fbf
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-fdc5-1a8f6369be20
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-4d73-11ddaa0d3a72
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-5952-c889b51cd8a2
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-ff53-fa18a170922c
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-20d7-1b927ffc54e6
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-c7d2-d9d21fe0af32
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-3863-fff7e9f36ca6
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-ec69-041e1aa80c35
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-3d7b-a03bd23d6156
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-815e-ddb6df74e058
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-0361-72d747b98d64
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-96e1-922866035107
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-28e0-892f5bf4e8b4
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-584d-de7ce968d851
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-4f07-8079d6554af2
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-2826-6830435d18ea
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-f844-b0296152359f
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-7802-f3ad35c166c1
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-810b-cdc1fcaa2dbb
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-28a2-6c33f9967a87
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-3650-0fb936383b1f
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-8903-ed2ee47dae47
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-f225-d36273b6ae7d
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-4447-e042604e5d16
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-2cb4-fc587e5e3483
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-7464-d3626de1edf0
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-80fc-4073ea17fe46
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-33de-1b44e0655584
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-01c6-640f400e6228
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-bb88-86a49b7c87ac
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-b9f7-93c1de02ced8
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-17e1-fe19fc0c1a84
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-3a8d-c3c23bfb6061
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-0343-fdb572ba851e
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-b35a-528ecd2370e6
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-c16c-d91914444192
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-c4ce-aee0403c9332
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-b150-1612ecb2edde
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-3141-93ba73590b47
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-ac0d-89168ee0e0bf
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-f67d-5e0c970a4cce
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-cc8b-193d441676dd
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-068e-d026fb346817
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-fa7d-26656b2a0583
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-e646-779435262889
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-cdec-5fac1757e72f
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-f3f9-3a5a7104d2f3
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-3a42-fa8641c07087
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-32c6-f6fdb33f7884
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-ecd6-3e68be5a3175
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-452b-b84b682e12c5
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-b29c-dd3baff44e95
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-05ab-a1272d0d8dfe
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-5333-43dd7b08e6a1
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-30d1-02b95e944570
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-992d-7f01bfd7497c
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-c352-9b263c8b0892
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-04e3-22fd0df8f5dc
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-42d8-3919ae6d8c2a
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-7d03-5c13f54ce9f8
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-5c34-84cb582fd623
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-eac1-98c203639935
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-e92e-57f37e336e13
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-908a-2585473a3912
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-9876-cf9fb76b5eb3
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-6a14-e1d1f18d5142
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-e807-f0266dc14c70
00020000-55db-2bff-98ac-0573ee913ff6	00030000-55db-2bfe-3550-c870fdf07973
\.


--
-- TOC entry 2921 (class 0 OID 15335602)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2925 (class 0 OID 15335633)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 15335747)
-- Dependencies: 218
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55db-2bff-e9dc-6adacf68b2d5	00090000-55db-2bff-80c3-7ef4d7d87327	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55db-2bff-352c-162bead83774	00090000-55db-2bff-79cc-b61c07718e8c	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55db-2bff-0dc1-5321e5c79866	00090000-55db-2bff-bd22-5f261f033206	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2898 (class 0 OID 15335363)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55db-2bff-a15e-012649b89002	00040000-55db-2bfd-eaa5-35f4963b837b	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55db-2bff-e5f4-11cb0c77b1ca	00040000-55db-2bfd-eaa5-35f4963b837b	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55db-2bff-5576-6b4d5ad6edb2	00040000-55db-2bfd-eaa5-35f4963b837b	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55db-2bff-58a8-82bb3e456407	00040000-55db-2bfd-eaa5-35f4963b837b	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55db-2bff-ae17-757f40e7539e	00040000-55db-2bfd-eaa5-35f4963b837b	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55db-2bff-7325-a9d1bc8d26a4	00040000-55db-2bfd-eb27-01356dbc684b	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55db-2bff-a346-b87a59736210	00040000-55db-2bfd-f83d-d71c1a0e0741	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55db-2bff-8551-337bdbf05e60	00040000-55db-2bfd-3d4a-55ebb9bbe9df	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55db-2c00-e9da-33a38b315904	00040000-55db-2bfd-eaa5-35f4963b837b	1001	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2900 (class 0 OID 15335398)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55db-2bfd-699d-516d76d386b3	8341	Adlešiči
00050000-55db-2bfd-4227-921dda29a39e	5270	Ajdovščina
00050000-55db-2bfd-2c20-d2a65e5705e7	6280	Ankaran/Ancarano
00050000-55db-2bfd-4157-2dc7e4db00db	9253	Apače
00050000-55db-2bfd-38aa-f0d1ab15d88d	8253	Artiče
00050000-55db-2bfd-e604-8c25c4118359	4275	Begunje na Gorenjskem
00050000-55db-2bfd-e880-dfaad49eb180	1382	Begunje pri Cerknici
00050000-55db-2bfd-af4f-27407d5f51d6	9231	Beltinci
00050000-55db-2bfd-243a-791964e07ed3	2234	Benedikt
00050000-55db-2bfd-fb0f-244f574532f0	2345	Bistrica ob Dravi
00050000-55db-2bfd-63f2-79e9883efa89	3256	Bistrica ob Sotli
00050000-55db-2bfd-bf9b-f97707e31858	8259	Bizeljsko
00050000-55db-2bfd-82f1-c482f26a1e94	1223	Blagovica
00050000-55db-2bfd-270f-03fefa4bf0b7	8283	Blanca
00050000-55db-2bfd-3d6a-4d042133c1de	4260	Bled
00050000-55db-2bfd-c200-d99984ed0a7d	4273	Blejska Dobrava
00050000-55db-2bfd-8ba4-b183b867ee3e	9265	Bodonci
00050000-55db-2bfd-da39-1ec9fdac85fd	9222	Bogojina
00050000-55db-2bfd-81a6-b9df38c7b5a4	4263	Bohinjska Bela
00050000-55db-2bfd-5e5d-c22f7e662c80	4264	Bohinjska Bistrica
00050000-55db-2bfd-ee44-5f517f2b8601	4265	Bohinjsko jezero
00050000-55db-2bfd-5800-282ad5c5840a	1353	Borovnica
00050000-55db-2bfd-c377-8088f2f7f260	8294	Boštanj
00050000-55db-2bfd-f787-46c37b7e601d	5230	Bovec
00050000-55db-2bfd-17bc-b9e3a41daa82	5295	Branik
00050000-55db-2bfd-9879-9df38f6afee4	3314	Braslovče
00050000-55db-2bfd-7986-396c7cc201b8	5223	Breginj
00050000-55db-2bfd-f145-2c85e73d3020	8280	Brestanica
00050000-55db-2bfd-551d-2823a98940f3	2354	Bresternica
00050000-55db-2bfd-b76e-d430bfe30c89	4243	Brezje
00050000-55db-2bfd-886e-1876b1f36c87	1351	Brezovica pri Ljubljani
00050000-55db-2bfd-e2ca-8755c7ed72bb	8250	Brežice
00050000-55db-2bfd-829e-44984f278075	4210	Brnik - Aerodrom
00050000-55db-2bfd-a13e-1c42248a200a	8321	Brusnice
00050000-55db-2bfd-f4cf-5aa5a39f2a7f	3255	Buče
00050000-55db-2bfd-4e87-b7ac0c6fa4e4	8276	Bučka 
00050000-55db-2bfd-3d88-eda5a13e7404	9261	Cankova
00050000-55db-2bfd-3b0e-c10c72e72971	3000	Celje 
00050000-55db-2bfd-ffe2-8c4583de4847	3001	Celje - poštni predali
00050000-55db-2bfd-eefd-4c8b7e7b8cc5	4207	Cerklje na Gorenjskem
00050000-55db-2bfd-4fc5-e5c86767ae92	8263	Cerklje ob Krki
00050000-55db-2bfd-14fa-cd44c1584df4	1380	Cerknica
00050000-55db-2bfd-555d-1ba76dd8185d	5282	Cerkno
00050000-55db-2bfd-e2af-9065f4948572	2236	Cerkvenjak
00050000-55db-2bfd-d71b-a0c65eaf76f8	2215	Ceršak
00050000-55db-2bfd-cdb7-a8772d762f3b	2326	Cirkovce
00050000-55db-2bfd-8da5-ec678e3aa505	2282	Cirkulane
00050000-55db-2bfd-eb19-e5e073074803	5273	Col
00050000-55db-2bfd-6d1c-5ae2ac293b5f	8251	Čatež ob Savi
00050000-55db-2bfd-ef5b-aa1f9598ba64	1413	Čemšenik
00050000-55db-2bfd-9e20-ca7b55a31720	5253	Čepovan
00050000-55db-2bfd-3c91-adb44472a18f	9232	Črenšovci
00050000-55db-2bfd-0f35-1d72ac528957	2393	Črna na Koroškem
00050000-55db-2bfd-71b9-aa753a230f1b	6275	Črni Kal
00050000-55db-2bfd-0054-230b475a57e3	5274	Črni Vrh nad Idrijo
00050000-55db-2bfd-a104-f0de6bbb1879	5262	Črniče
00050000-55db-2bfd-6152-00359e7307b5	8340	Črnomelj
00050000-55db-2bfd-c10d-22720988983c	6271	Dekani
00050000-55db-2bfd-6bc5-c807e67c8ded	5210	Deskle
00050000-55db-2bfd-d42b-c98573ef6948	2253	Destrnik
00050000-55db-2bfd-161b-df226d86bcdf	6215	Divača
00050000-55db-2bfd-829e-9db54926d7d2	1233	Dob
00050000-55db-2bfd-c645-0ffa0d1c9185	3224	Dobje pri Planini
00050000-55db-2bfd-bd05-358f2f4b7998	8257	Dobova
00050000-55db-2bfd-d41f-767cb0a277c1	1423	Dobovec
00050000-55db-2bfd-f84e-d35a114554ef	5263	Dobravlje
00050000-55db-2bfd-0b71-75c01b919167	3204	Dobrna
00050000-55db-2bfd-ad24-a66429d933e1	8211	Dobrnič
00050000-55db-2bfd-fb44-dbff5f5847c6	1356	Dobrova
00050000-55db-2bfd-af0a-2f81f2e203b1	9223	Dobrovnik/Dobronak 
00050000-55db-2bfd-078f-5b5553ed26b3	5212	Dobrovo v Brdih
00050000-55db-2bfd-b476-3c309e33ab7c	1431	Dol pri Hrastniku
00050000-55db-2bfd-53b5-03e8b7d15c2a	1262	Dol pri Ljubljani
00050000-55db-2bfd-5eea-814ffcacfb99	1273	Dole pri Litiji
00050000-55db-2bfd-491e-be727a7aa865	1331	Dolenja vas
00050000-55db-2bfd-780c-c59201bc5507	8350	Dolenjske Toplice
00050000-55db-2bfd-8078-c9584d3acf8f	1230	Domžale
00050000-55db-2bfd-09ba-05d87c677f6f	2252	Dornava
00050000-55db-2bfd-ec1c-574fa6d20b85	5294	Dornberk
00050000-55db-2bfd-4cad-6edd30e3cf7e	1319	Draga
00050000-55db-2bfd-9395-fffce8d5f284	8343	Dragatuš
00050000-55db-2bfd-88ae-16566ea692bd	3222	Dramlje
00050000-55db-2bfd-c89f-19e5fd503445	2370	Dravograd
00050000-55db-2bfd-53b0-e8bff478f26f	4203	Duplje
00050000-55db-2bfd-3eb6-4dc120e7242f	6221	Dutovlje
00050000-55db-2bfd-29c5-fe1f2f6e31ff	8361	Dvor
00050000-55db-2bfd-3f71-13b29dc0323b	2343	Fala
00050000-55db-2bfd-db6a-df19f6a783a2	9208	Fokovci
00050000-55db-2bfd-405b-26ac0197f0de	2313	Fram
00050000-55db-2bfd-9c00-b4d96732fe32	3213	Frankolovo
00050000-55db-2bfd-7de3-28be7c406818	1274	Gabrovka
00050000-55db-2bfd-b649-442d24824335	8254	Globoko
00050000-55db-2bfd-2824-062b2c66fe34	5275	Godovič
00050000-55db-2bfd-3838-92e9bc4b5a89	4204	Golnik
00050000-55db-2bfd-8e3d-ab62118710ba	3303	Gomilsko
00050000-55db-2bfd-06ef-d810c13effe9	4224	Gorenja vas
00050000-55db-2bfd-dc95-672333aa86f3	3263	Gorica pri Slivnici
00050000-55db-2bfd-38c8-d0f98a386716	2272	Gorišnica
00050000-55db-2bfd-f58f-291cbfbd71ae	9250	Gornja Radgona
00050000-55db-2bfd-e447-91fea884a2c6	3342	Gornji Grad
00050000-55db-2bfd-c0d7-ca10aa9bf223	4282	Gozd Martuljek
00050000-55db-2bfd-1e55-569f8dd355cf	6272	Gračišče
00050000-55db-2bfd-07a0-04ead1aa6e21	9264	Grad
00050000-55db-2bfd-3b32-0952bde133ec	8332	Gradac
00050000-55db-2bfd-55f6-b2d573830141	1384	Grahovo
00050000-55db-2bfd-3c3d-c4197c4ec578	5242	Grahovo ob Bači
00050000-55db-2bfd-c0b4-617f95065f7f	5251	Grgar
00050000-55db-2bfd-2fc9-ec94b99d4d69	3302	Griže
00050000-55db-2bfd-6250-544c6ea6c90c	3231	Grobelno
00050000-55db-2bfd-ac27-b42195f61c6d	1290	Grosuplje
00050000-55db-2bfd-7854-c81adae9ce70	2288	Hajdina
00050000-55db-2bfd-980e-8d16f00a2ae0	8362	Hinje
00050000-55db-2bfd-5348-1cdbb3de1c18	2311	Hoče
00050000-55db-2bfd-1ab1-983634380c6c	9205	Hodoš/Hodos
00050000-55db-2bfd-d012-bf3bde1c8adf	1354	Horjul
00050000-55db-2bfd-e075-1723a2ff4254	1372	Hotedršica
00050000-55db-2bfd-1056-e18d28419b5a	1430	Hrastnik
00050000-55db-2bfd-f7b1-f3bb0e139587	6225	Hruševje
00050000-55db-2bfd-3797-dcc565c1599a	4276	Hrušica
00050000-55db-2bfd-6208-ee0b5ef8121b	5280	Idrija
00050000-55db-2bfd-d520-69fd3d14fdd5	1292	Ig
00050000-55db-2bfd-50ae-0d2be8571c0e	6250	Ilirska Bistrica
00050000-55db-2bfd-7819-51424de09a7a	6251	Ilirska Bistrica-Trnovo
00050000-55db-2bfd-5171-76b14f78ae97	1295	Ivančna Gorica
00050000-55db-2bfd-a5a7-cfbb935fd788	2259	Ivanjkovci
00050000-55db-2bfd-2aef-4a87a5212492	1411	Izlake
00050000-55db-2bfd-297e-c041952809d5	6310	Izola/Isola
00050000-55db-2bfd-dde7-63022d9b8cab	2222	Jakobski Dol
00050000-55db-2bfd-a2d6-2e0eef42d2ac	2221	Jarenina
00050000-55db-2bfd-70a9-604df1bd89e6	6254	Jelšane
00050000-55db-2bfd-2de8-dc6c4619bc6e	4270	Jesenice
00050000-55db-2bfd-58f7-eee0813fa840	8261	Jesenice na Dolenjskem
00050000-55db-2bfd-fc49-60676e558036	3273	Jurklošter
00050000-55db-2bfd-fd55-a16e7820a958	2223	Jurovski Dol
00050000-55db-2bfd-f7af-bf8533a7eab5	2256	Juršinci
00050000-55db-2bfd-fa9d-bc5004f35798	5214	Kal nad Kanalom
00050000-55db-2bfd-8f1b-ecc889eec8c9	3233	Kalobje
00050000-55db-2bfd-3964-dcc07ed63405	4246	Kamna Gorica
00050000-55db-2bfd-b541-0f749c9931eb	2351	Kamnica
00050000-55db-2bfd-a99c-309064de2412	1241	Kamnik
00050000-55db-2bfd-e17c-a140238c6815	5213	Kanal
00050000-55db-2bfd-8ef4-1325a0d4529a	8258	Kapele
00050000-55db-2bfd-74c3-1dc1225b5478	2362	Kapla
00050000-55db-2bfd-f2e2-50c5e552e363	2325	Kidričevo
00050000-55db-2bfd-af40-66cf3776f8b7	1412	Kisovec
00050000-55db-2bfd-e2fc-2008a3c4f7d6	6253	Knežak
00050000-55db-2bfd-c209-10c95bcbf961	5222	Kobarid
00050000-55db-2bfd-ef26-404acea75401	9227	Kobilje
00050000-55db-2bfd-abd0-9e0ed40532cb	1330	Kočevje
00050000-55db-2bfd-3618-d1e111398914	1338	Kočevska Reka
00050000-55db-2bfd-37ab-522b9ef1b9a5	2276	Kog
00050000-55db-2bfd-40a4-c7533d540848	5211	Kojsko
00050000-55db-2bfd-e1b4-b97974c3664e	6223	Komen
00050000-55db-2bfd-4486-2a1a1bbf96c0	1218	Komenda
00050000-55db-2bfd-3b53-074b165916f0	6000	Koper/Capodistria 
00050000-55db-2bfd-772e-5e70e4732abe	6001	Koper/Capodistria - poštni predali
00050000-55db-2bfd-9d1c-16ded3979e19	8282	Koprivnica
00050000-55db-2bfd-fbbf-5182dddf4e26	5296	Kostanjevica na Krasu
00050000-55db-2bfd-6159-5df2ca3193f4	8311	Kostanjevica na Krki
00050000-55db-2bfd-571b-211da61506eb	1336	Kostel
00050000-55db-2bfd-29e2-048871eec421	6256	Košana
00050000-55db-2bfd-64c6-76a14f029ee3	2394	Kotlje
00050000-55db-2bfd-2c9b-e8a2b4b5a8f1	6240	Kozina
00050000-55db-2bfd-150f-3544132f684a	3260	Kozje
00050000-55db-2bfd-ebd6-003b6ddbd105	4000	Kranj 
00050000-55db-2bfd-504a-ad013bdd35ca	4001	Kranj - poštni predali
00050000-55db-2bfd-3d56-494f99d20c18	4280	Kranjska Gora
00050000-55db-2bfd-994c-1d26a60e397b	1281	Kresnice
00050000-55db-2bfd-6e8a-9d16aa573924	4294	Križe
00050000-55db-2bfd-a448-6af6f8e19d03	9206	Križevci
00050000-55db-2bfd-418f-7ff10a3fc9d8	9242	Križevci pri Ljutomeru
00050000-55db-2bfd-1810-ab81819ebd26	1301	Krka
00050000-55db-2bfd-fcb5-5aa6da2ec018	8296	Krmelj
00050000-55db-2bfd-6a73-b088081f2e42	4245	Kropa
00050000-55db-2bfd-dec0-6a085be64692	8262	Krška vas
00050000-55db-2bfd-7aac-b1d3af5da2ce	8270	Krško
00050000-55db-2bfd-5ca4-bdaf3a05b065	9263	Kuzma
00050000-55db-2bfd-f230-2e1639c37fc2	2318	Laporje
00050000-55db-2bfd-2afc-46c2606efe79	3270	Laško
00050000-55db-2bfd-538c-e09824a455c8	1219	Laze v Tuhinju
00050000-55db-2bfd-9589-c9cb7ef28679	2230	Lenart v Slovenskih goricah
00050000-55db-2bfd-038f-4d3d5f16ea1c	9220	Lendava/Lendva
00050000-55db-2bfd-9bc0-081e9ffd97a5	4248	Lesce
00050000-55db-2bfd-324e-11c95e513209	3261	Lesično
00050000-55db-2bfd-c2c6-6dc57aeb7048	8273	Leskovec pri Krškem
00050000-55db-2bfd-59f4-6922f0625dba	2372	Libeliče
00050000-55db-2bfd-f2ad-123fa8a592eb	2341	Limbuš
00050000-55db-2bfd-6324-59f45ad8be7d	1270	Litija
00050000-55db-2bfd-3abf-78766fd77c35	3202	Ljubečna
00050000-55db-2bfd-bd83-4dbee3d2e42c	1000	Ljubljana 
00050000-55db-2bfd-f4f6-5e13a1b779a4	1001	Ljubljana - poštni predali
00050000-55db-2bfd-e0e3-24f84d0857e7	1231	Ljubljana - Črnuče
00050000-55db-2bfd-477f-76398588bdf5	1261	Ljubljana - Dobrunje
00050000-55db-2bfd-b0db-d135229959cf	1260	Ljubljana - Polje
00050000-55db-2bfd-f833-7c3a264cf236	1210	Ljubljana - Šentvid
00050000-55db-2bfd-ea22-2e9187a432be	1211	Ljubljana - Šmartno
00050000-55db-2bfd-4eee-8b6e6f9bf146	3333	Ljubno ob Savinji
00050000-55db-2bfd-893d-2bc7862c7ebd	9240	Ljutomer
00050000-55db-2bfd-e378-8a7cc38fd86f	3215	Loče
00050000-55db-2bfd-5346-db5bb25ebf7d	5231	Log pod Mangartom
00050000-55db-2bfd-817e-3b56d7568182	1358	Log pri Brezovici
00050000-55db-2bfd-861a-572a0c39e56a	1370	Logatec
00050000-55db-2bfd-7c03-c8ef1feb7e2f	1371	Logatec
00050000-55db-2bfd-d0d0-849a4942552f	1434	Loka pri Zidanem Mostu
00050000-55db-2bfd-d6ef-f27f52e3ec3c	3223	Loka pri Žusmu
00050000-55db-2bfd-bace-2dbd0e82fb65	6219	Lokev
00050000-55db-2bfd-aa5e-cffa1ce38804	1318	Loški Potok
00050000-55db-2bfd-89ee-b91319523bce	2324	Lovrenc na Dravskem polju
00050000-55db-2bfd-dffc-0318798b2d0d	2344	Lovrenc na Pohorju
00050000-55db-2bfd-1f9b-0fda9f662f64	3334	Luče
00050000-55db-2bfd-fa4a-43d839b202ce	1225	Lukovica
00050000-55db-2bfd-4a6b-d5d6e0d7fc0e	9202	Mačkovci
00050000-55db-2bfd-49c0-a8499e9a8af1	2322	Majšperk
00050000-55db-2bfd-65ef-2169a8887101	2321	Makole
00050000-55db-2bfd-9272-6071cd552297	9243	Mala Nedelja
00050000-55db-2bfd-ffd7-c155fc63b3e7	2229	Malečnik
00050000-55db-2bfd-c4a9-5dca8a54ffef	6273	Marezige
00050000-55db-2bfd-088e-7572018abedd	2000	Maribor 
00050000-55db-2bfd-096e-09be653e9534	2001	Maribor - poštni predali
00050000-55db-2bfd-a0ac-af155283801b	2206	Marjeta na Dravskem polju
00050000-55db-2bfd-da76-b0e164fb321c	2281	Markovci
00050000-55db-2bfd-9c4f-3f1aa64de382	9221	Martjanci
00050000-55db-2bfd-2a80-d1306e64011e	6242	Materija
00050000-55db-2bfd-4d45-0b66fc74292f	4211	Mavčiče
00050000-55db-2bfd-313f-febe578f0007	1215	Medvode
00050000-55db-2bfd-ac86-15d1eee4df85	1234	Mengeš
00050000-55db-2bfd-ddb9-1cccf9f20728	8330	Metlika
00050000-55db-2bfd-b59d-c73ea39d86f9	2392	Mežica
00050000-55db-2bfd-5659-49060e20da3e	2204	Miklavž na Dravskem polju
00050000-55db-2bfd-b8a3-e42a0ca46c8b	2275	Miklavž pri Ormožu
00050000-55db-2bfd-3ca8-c16ec606d0e1	5291	Miren
00050000-55db-2bfd-7e40-d4235d37d35b	8233	Mirna
00050000-55db-2bfd-12bd-308de548b0c8	8216	Mirna Peč
00050000-55db-2bfd-2d78-a4650e2e79f5	2382	Mislinja
00050000-55db-2bfd-d496-881be57cfbd5	4281	Mojstrana
00050000-55db-2bfd-1140-d7827265489e	8230	Mokronog
00050000-55db-2bfd-9a1f-7568a70811bb	1251	Moravče
00050000-55db-2bfd-f8c0-da1f45389831	9226	Moravske Toplice
00050000-55db-2bfd-48fe-ac61e8111da5	5216	Most na Soči
00050000-55db-2bfd-36c7-2907f469e631	1221	Motnik
00050000-55db-2bfd-cb25-39a56ee5a2c7	3330	Mozirje
00050000-55db-2bfd-2f6c-fb54c2d1ea97	9000	Murska Sobota 
00050000-55db-2bfd-be5b-dadfe9ecd4a8	9001	Murska Sobota - poštni predali
00050000-55db-2bfd-9567-374f59da365f	2366	Muta
00050000-55db-2bfd-3e50-c097e906b35a	4202	Naklo
00050000-55db-2bfd-ea0f-4b0277b64844	3331	Nazarje
00050000-55db-2bfd-1cf7-97479d146290	1357	Notranje Gorice
00050000-55db-2bfd-1635-376d9ccc5874	3203	Nova Cerkev
00050000-55db-2bfd-9519-6a5724f3ff2c	5000	Nova Gorica 
00050000-55db-2bfd-25a5-ba7a6e015bbb	5001	Nova Gorica - poštni predali
00050000-55db-2bfd-6aab-aa0874a9eacf	1385	Nova vas
00050000-55db-2bfd-d503-df580e845fd0	8000	Novo mesto
00050000-55db-2bfd-b248-3b7370c004e8	8001	Novo mesto - poštni predali
00050000-55db-2bfd-3462-812527e9312b	6243	Obrov
00050000-55db-2bfd-a1e0-cc17c053bc89	9233	Odranci
00050000-55db-2bfd-80b0-de62594118a3	2317	Oplotnica
00050000-55db-2bfd-6e14-00fb1a918e29	2312	Orehova vas
00050000-55db-2bfd-47db-b25906514f55	2270	Ormož
00050000-55db-2bfd-7e49-dcaaa75cf1d1	1316	Ortnek
00050000-55db-2bfd-1b74-97c7851cc5fb	1337	Osilnica
00050000-55db-2bfd-8f1a-7cd2625f7571	8222	Otočec
00050000-55db-2bfd-c169-36306c8b5be4	2361	Ožbalt
00050000-55db-2bfd-9792-c4d690e2e96f	2231	Pernica
00050000-55db-2bfd-30be-7e6970fd461d	2211	Pesnica pri Mariboru
00050000-55db-2bfd-d6f2-2c7000383b0e	9203	Petrovci
00050000-55db-2bfd-419f-38b15677e8ee	3301	Petrovče
00050000-55db-2bfd-7e85-fbf91e644c2a	6330	Piran/Pirano
00050000-55db-2bfd-762c-9b6fdfec0658	8255	Pišece
00050000-55db-2bfd-612a-a2660b79645c	6257	Pivka
00050000-55db-2bfd-ee7c-21fac61d5779	6232	Planina
00050000-55db-2bfd-5735-9eb47b4b34ae	3225	Planina pri Sevnici
00050000-55db-2bfd-cd0e-d36b3ba5c6f5	6276	Pobegi
00050000-55db-2bfd-131b-c5dd10ce2188	8312	Podbočje
00050000-55db-2bfd-54f6-453fc6c48913	5243	Podbrdo
00050000-55db-2bfd-ccd4-ea8ea91544d0	3254	Podčetrtek
00050000-55db-2bfd-9d9b-7d7aba5f88c2	2273	Podgorci
00050000-55db-2bfd-2b7d-5708e029ded1	6216	Podgorje
00050000-55db-2bfd-6801-340823e092eb	2381	Podgorje pri Slovenj Gradcu
00050000-55db-2bfd-ab5f-b1269c80b13d	6244	Podgrad
00050000-55db-2bfd-0c61-aafc9029f8fd	1414	Podkum
00050000-55db-2bfd-e80d-01d8af8b1b3a	2286	Podlehnik
00050000-55db-2bfd-c3c6-f6786613a82d	5272	Podnanos
00050000-55db-2bfd-30bc-5b742d74f0a7	4244	Podnart
00050000-55db-2bfd-4e00-f082232fe17d	3241	Podplat
00050000-55db-2bfd-771d-93923dbd8a11	3257	Podsreda
00050000-55db-2bfd-db9e-2818de952084	2363	Podvelka
00050000-55db-2bfd-26bd-0fe445945b4d	2208	Pohorje
00050000-55db-2bfd-f2e5-11e6baebaaf9	2257	Polenšak
00050000-55db-2bfd-4e90-58ad1007a567	1355	Polhov Gradec
00050000-55db-2bfd-759d-5f1f9b4c525c	4223	Poljane nad Škofjo Loko
00050000-55db-2bfd-c19e-a82e7d46191c	2319	Poljčane
00050000-55db-2bfd-0412-3d5bcdd37cef	1272	Polšnik
00050000-55db-2bfd-307b-80654bc40a40	3313	Polzela
00050000-55db-2bfd-fbd7-4075fc891fa8	3232	Ponikva
00050000-55db-2bfd-0aaa-1a62ef60a2ca	6320	Portorož/Portorose
00050000-55db-2bfd-c75e-692aaddfcb92	6230	Postojna
00050000-55db-2bfd-d116-2384ae1247c3	2331	Pragersko
00050000-55db-2bfd-447c-bc64251bf241	3312	Prebold
00050000-55db-2bfd-9c69-55af02546815	4205	Preddvor
00050000-55db-2bfd-b0ec-8ed08449ca8a	6255	Prem
00050000-55db-2bfd-4181-e125234129b3	1352	Preserje
00050000-55db-2bfd-d1c5-21616d0e01d1	6258	Prestranek
00050000-55db-2bfd-6530-0092041f52ac	2391	Prevalje
00050000-55db-2bfd-b772-cd26ddbcfcb0	3262	Prevorje
00050000-55db-2bfd-3378-2f7fd97ad7bd	1276	Primskovo 
00050000-55db-2bfd-efcb-7887a6a7eb16	3253	Pristava pri Mestinju
00050000-55db-2bfd-5e62-2a006a33a63c	9207	Prosenjakovci/Partosfalva
00050000-55db-2bfd-5f72-d78437f05a8c	5297	Prvačina
00050000-55db-2bfd-7c64-ed9e956d460c	2250	Ptuj
00050000-55db-2bfd-d4a1-cdcc80ce5791	2323	Ptujska Gora
00050000-55db-2bfd-7e09-16d4ca3dc882	9201	Puconci
00050000-55db-2bfd-7172-cd487242fd33	2327	Rače
00050000-55db-2bfd-401f-111b5442ad1a	1433	Radeče
00050000-55db-2bfd-a1b8-6b2d22ac026c	9252	Radenci
00050000-55db-2bfd-7497-6dd2dd465639	2360	Radlje ob Dravi
00050000-55db-2bfd-4d60-ef7bb541fafa	1235	Radomlje
00050000-55db-2bfd-8366-31950cb31f6e	4240	Radovljica
00050000-55db-2bfd-7e45-028d1154e61a	8274	Raka
00050000-55db-2bfd-4b7a-81bd3f5ea8cb	1381	Rakek
00050000-55db-2bfd-2cfb-7131e017d2b8	4283	Rateče - Planica
00050000-55db-2bfd-2e52-f58b35cb6637	2390	Ravne na Koroškem
00050000-55db-2bfd-295a-5d949aeee3ab	9246	Razkrižje
00050000-55db-2bfd-ae4c-d76cf6f40293	3332	Rečica ob Savinji
00050000-55db-2bfd-a5fc-f7dceb251dee	5292	Renče
00050000-55db-2bfd-ebac-ccb7bf327ccd	1310	Ribnica
00050000-55db-2bfd-f5c9-a4cdb91b9be2	2364	Ribnica na Pohorju
00050000-55db-2bfd-f824-856b0b5d1c77	3272	Rimske Toplice
00050000-55db-2bfd-67f9-2a74ec4bff98	1314	Rob
00050000-55db-2bfd-bd87-522561c12cc7	5215	Ročinj
00050000-55db-2bfd-fa71-8afc54899a70	3250	Rogaška Slatina
00050000-55db-2bfd-cca1-185963f7201c	9262	Rogašovci
00050000-55db-2bfd-e23c-3800b5471503	3252	Rogatec
00050000-55db-2bfd-e081-21b32dfec1de	1373	Rovte
00050000-55db-2bfd-a970-97133d94a624	2342	Ruše
00050000-55db-2bfd-73ac-9e11cfbd2fbb	1282	Sava
00050000-55db-2bfd-5516-97b26e240d5c	6333	Sečovlje/Sicciole
00050000-55db-2bfd-0085-1e76b553d330	4227	Selca
00050000-55db-2bfd-d6ad-d932d52160ba	2352	Selnica ob Dravi
00050000-55db-2bfd-f9e5-a60514287f35	8333	Semič
00050000-55db-2bfd-14ef-bc989ad43f51	8281	Senovo
00050000-55db-2bfd-91b0-c93fd04df6b9	6224	Senožeče
00050000-55db-2bfd-124f-53df8baeff83	8290	Sevnica
00050000-55db-2bfd-904a-596001cc7974	6210	Sežana
00050000-55db-2bfd-2900-0c97bf2b2eb8	2214	Sladki Vrh
00050000-55db-2bfd-35a8-038fa400c6a4	5283	Slap ob Idrijci
00050000-55db-2bfd-fbe1-dffcf64b10ab	2380	Slovenj Gradec
00050000-55db-2bfd-a070-6c254a989b83	2310	Slovenska Bistrica
00050000-55db-2bfd-194a-492122ccc09c	3210	Slovenske Konjice
00050000-55db-2bfd-500c-547ad1355a3b	1216	Smlednik
00050000-55db-2bfd-1413-c0d14b2e9834	5232	Soča
00050000-55db-2bfd-8bf1-dd639323338a	1317	Sodražica
00050000-55db-2bfd-6f9f-86c90508270f	3335	Solčava
00050000-55db-2bfd-b5f0-804d187cdd8f	5250	Solkan
00050000-55db-2bfd-3953-e714cd0abe84	4229	Sorica
00050000-55db-2bfd-8c16-e222cdf26838	4225	Sovodenj
00050000-55db-2bfd-b56a-b2ec514cb435	5281	Spodnja Idrija
00050000-55db-2bfd-6ac4-4bcf20aaec88	2241	Spodnji Duplek
00050000-55db-2bfd-bf27-27850e9645cf	9245	Spodnji Ivanjci
00050000-55db-2bfd-5967-69d25464a486	2277	Središče ob Dravi
00050000-55db-2bfd-6728-603694fe3404	4267	Srednja vas v Bohinju
00050000-55db-2bfd-cd88-75ede3ec10f3	8256	Sromlje 
00050000-55db-2bfd-ae0f-1e0d43d3f0ae	5224	Srpenica
00050000-55db-2bfd-455e-d73ab35686db	1242	Stahovica
00050000-55db-2bfd-c90c-e98d6179aa8f	1332	Stara Cerkev
00050000-55db-2bfd-2090-88447e232155	8342	Stari trg ob Kolpi
00050000-55db-2bfd-62c0-9b1aa46eb499	1386	Stari trg pri Ložu
00050000-55db-2bfd-c1e4-35a00f4026b1	2205	Starše
00050000-55db-2bfd-f15d-cb7e59846eb9	2289	Stoperce
00050000-55db-2bfd-5b62-8478d2b80489	8322	Stopiče
00050000-55db-2bfd-2b8b-e1dcb9eb50ff	3206	Stranice
00050000-55db-2bfd-fb0d-18296459abc9	8351	Straža
00050000-55db-2bfd-4eb3-9152d94a6a65	1313	Struge
00050000-55db-2bfd-1974-dc1bd9126f14	8293	Studenec
00050000-55db-2bfd-ea69-6ee4aed7ef58	8331	Suhor
00050000-55db-2bfd-cd80-f655af6ed161	2233	Sv. Ana v Slovenskih goricah
00050000-55db-2bfd-7e7a-b60fe41c5041	2235	Sv. Trojica v Slovenskih goricah
00050000-55db-2bfd-a5f9-1c58078bd41c	2353	Sveti Duh na Ostrem Vrhu
00050000-55db-2bfd-ce4c-6e81e0b3af62	9244	Sveti Jurij ob Ščavnici
00050000-55db-2bfd-3798-8274b6e813b1	3264	Sveti Štefan
00050000-55db-2bfd-1cb6-c1861a9aa46b	2258	Sveti Tomaž
00050000-55db-2bfd-0a07-545a7900c895	9204	Šalovci
00050000-55db-2bfd-4ad2-8c82108f59de	5261	Šempas
00050000-55db-2bfd-f5ee-1db85237db75	5290	Šempeter pri Gorici
00050000-55db-2bfd-abe6-1dd8ed06e1ef	3311	Šempeter v Savinjski dolini
00050000-55db-2bfd-c008-49350d6ca369	4208	Šenčur
00050000-55db-2bfd-ea1a-88139278ca58	2212	Šentilj v Slovenskih goricah
00050000-55db-2bfd-5ba8-5e8c75036e6d	8297	Šentjanž
00050000-55db-2bfd-d6ec-1704feb0c057	2373	Šentjanž pri Dravogradu
00050000-55db-2bfd-9f76-bbadf5cb6c5f	8310	Šentjernej
00050000-55db-2bfd-4fc1-0e77280acdf7	3230	Šentjur
00050000-55db-2bfd-8ba3-a3818aee382d	3271	Šentrupert
00050000-55db-2bfd-04d0-ab94eb9b5a04	8232	Šentrupert
00050000-55db-2bfd-efb7-8b90dbc4b583	1296	Šentvid pri Stični
00050000-55db-2bfd-325e-d1a4e82e3552	8275	Škocjan
00050000-55db-2bfd-2d18-9756ce5b7b3e	6281	Škofije
00050000-55db-2bfd-e48a-120caad1c78b	4220	Škofja Loka
00050000-55db-2bfd-f25c-71996eb22a48	3211	Škofja vas
00050000-55db-2bfd-b6b3-7a5e6e182d24	1291	Škofljica
00050000-55db-2bfd-77ad-a0990f1a18dd	6274	Šmarje
00050000-55db-2bfd-0ba5-d83e1f6a6661	1293	Šmarje - Sap
00050000-55db-2bfd-761e-5e9836a8dd2d	3240	Šmarje pri Jelšah
00050000-55db-2bfd-2e72-7d0e521d0bde	8220	Šmarješke Toplice
00050000-55db-2bfd-58cb-f0feec3c5685	2315	Šmartno na Pohorju
00050000-55db-2bfd-646f-1e26a8f814fc	3341	Šmartno ob Dreti
00050000-55db-2bfd-75a9-271b876d85c0	3327	Šmartno ob Paki
00050000-55db-2bfd-87da-d658eceb0b0e	1275	Šmartno pri Litiji
00050000-55db-2bfd-115a-7450d85198a0	2383	Šmartno pri Slovenj Gradcu
00050000-55db-2bfd-ee44-67e4553ba760	3201	Šmartno v Rožni dolini
00050000-55db-2bfd-1167-12cd85e06ba5	3325	Šoštanj
00050000-55db-2bfd-0565-87bdb8dcd717	6222	Štanjel
00050000-55db-2bfd-2e86-af200322821f	3220	Štore
00050000-55db-2bfd-7874-177c611500ef	3304	Tabor
00050000-55db-2bfd-5e33-1f2ad488e993	3221	Teharje
00050000-55db-2bfd-7c7e-f03d45a687e0	9251	Tišina
00050000-55db-2bfd-e443-b5b56d8c4bf8	5220	Tolmin
00050000-55db-2bfd-55ce-28d6e6333205	3326	Topolšica
00050000-55db-2bfd-ba51-3e7624e5261f	2371	Trbonje
00050000-55db-2bfd-e1fd-0f1e67d2e5d1	1420	Trbovlje
00050000-55db-2bfd-652a-16942fd52c3a	8231	Trebelno 
00050000-55db-2bfd-b355-152c1001e05b	8210	Trebnje
00050000-55db-2bfd-df87-1ee48e6bd5fe	5252	Trnovo pri Gorici
00050000-55db-2bfd-1614-021611a36f59	2254	Trnovska vas
00050000-55db-2bfd-9fb9-ed19bd11e7b1	1222	Trojane
00050000-55db-2bfd-3884-072abfadbd69	1236	Trzin
00050000-55db-2bfd-8d0f-97781a4c480f	4290	Tržič
00050000-55db-2bfd-bce7-7a3871122c56	8295	Tržišče
00050000-55db-2bfd-0fd0-ca1b6a9bb5bc	1311	Turjak
00050000-55db-2bfd-3822-744038247faa	9224	Turnišče
00050000-55db-2bfd-064a-53971efb7b08	8323	Uršna sela
00050000-55db-2bfd-d420-9546d5f5779b	1252	Vače
00050000-55db-2bfd-f07f-1c2750ef95d3	3320	Velenje 
00050000-55db-2bfd-3ac4-2d49c52a1a5b	3322	Velenje - poštni predali
00050000-55db-2bfd-b255-7b9bd6accf4e	8212	Velika Loka
00050000-55db-2bfd-f8db-e13b58c2b624	2274	Velika Nedelja
00050000-55db-2bfd-1850-9f04bed9dce9	9225	Velika Polana
00050000-55db-2bfd-6012-27f8c7aa5f78	1315	Velike Lašče
00050000-55db-2bfd-9aa2-5bce5f96cfc6	8213	Veliki Gaber
00050000-55db-2bfd-a5a5-07eb662dd14a	9241	Veržej
00050000-55db-2bfd-b3cd-2cef0d1505bb	1312	Videm - Dobrepolje
00050000-55db-2bfd-cdc0-7419548e3d0a	2284	Videm pri Ptuju
00050000-55db-2bfd-b1d6-20cd0046af67	8344	Vinica
00050000-55db-2bfd-0308-33ae3e30c5c0	5271	Vipava
00050000-55db-2bfd-3b59-dbbd15211316	4212	Visoko
00050000-55db-2bfd-376b-e0da3ef2809f	1294	Višnja Gora
00050000-55db-2bfd-62e4-539a45c6534e	3205	Vitanje
00050000-55db-2bfd-7299-f77323daa006	2255	Vitomarci
00050000-55db-2bfd-7b02-01269aca7cde	1217	Vodice
00050000-55db-2bfd-b5cc-51cc0424ee6a	3212	Vojnik\t
00050000-55db-2bfd-d66c-1898481c1d6f	5293	Volčja Draga
00050000-55db-2bfd-dedd-f84701519265	2232	Voličina
00050000-55db-2bfd-9946-e008007d3cea	3305	Vransko
00050000-55db-2bfd-49e4-bb150df2963c	6217	Vremski Britof
00050000-55db-2bfd-fe01-f962e2c2ee9f	1360	Vrhnika
00050000-55db-2bfd-eca3-1748f146b504	2365	Vuhred
00050000-55db-2bfd-a672-16f95fc9e711	2367	Vuzenica
00050000-55db-2bfd-dff8-f108b6d250e5	8292	Zabukovje 
00050000-55db-2bfd-6372-14502e572719	1410	Zagorje ob Savi
00050000-55db-2bfd-240c-50f5f70c10a2	1303	Zagradec
00050000-55db-2bfd-0ed6-1c2dd044afb9	2283	Zavrč
00050000-55db-2bfd-df7e-cc128bf0e1f0	8272	Zdole 
00050000-55db-2bfd-7bf4-6f9a8cd5e257	4201	Zgornja Besnica
00050000-55db-2bfd-00a5-44950c840d4a	2242	Zgornja Korena
00050000-55db-2bfd-4072-9251335d1baf	2201	Zgornja Kungota
00050000-55db-2bfd-378a-ae7db67d1b3e	2316	Zgornja Ložnica
00050000-55db-2bfd-88ac-b6f363a89964	2314	Zgornja Polskava
00050000-55db-2bfd-4367-bfbcd1e79b16	2213	Zgornja Velka
00050000-55db-2bfd-47aa-b900911d27de	4247	Zgornje Gorje
00050000-55db-2bfd-4cd7-0363dc352952	4206	Zgornje Jezersko
00050000-55db-2bfd-1b1b-344a4d082c5e	2285	Zgornji Leskovec
00050000-55db-2bfd-b609-02760cd1f312	1432	Zidani Most
00050000-55db-2bfd-fe5e-0ca91fcb28e4	3214	Zreče
00050000-55db-2bfd-96f2-75c01cb8e5a9	4209	Žabnica
00050000-55db-2bfd-93d2-61059dac68d2	3310	Žalec
00050000-55db-2bfd-f730-1266036337dd	4228	Železniki
00050000-55db-2bfd-4758-46cd60155a3a	2287	Žetale
00050000-55db-2bfd-3c41-9b02b4a1acc3	4226	Žiri
00050000-55db-2bfd-de39-13b85bcbfeff	4274	Žirovnica
00050000-55db-2bfd-4b36-64ca0a7bd657	8360	Žužemberk
\.


--
-- TOC entry 2917 (class 0 OID 15335576)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 15335383)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 15335461)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2919 (class 0 OID 15335588)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2942 (class 0 OID 15335924)
-- Dependencies: 225
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2943 (class 0 OID 15335933)
-- Dependencies: 226
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55db-2bff-a1dc-1c96229e4dce	00080000-55db-2bff-5576-6b4d5ad6edb2	0987	AK
00190000-55db-2bff-1626-655d652a3a66	00080000-55db-2bff-e5f4-11cb0c77b1ca	0989	AK
00190000-55db-2bff-f805-ceacb7998e4d	00080000-55db-2bff-58a8-82bb3e456407	0986	AK
00190000-55db-2bff-e8a1-6186c05d5611	00080000-55db-2bff-7325-a9d1bc8d26a4	0984	AK
00190000-55db-2bff-6dbf-c59ddeef2274	00080000-55db-2bff-a346-b87a59736210	0983	AK
00190000-55db-2bff-2c4a-b24af83ef9a4	00080000-55db-2bff-8551-337bdbf05e60	0982	AK
00190000-55db-2c00-cfc3-434eb2c11af9	00080000-55db-2c00-e9da-33a38b315904	1001	AK
\.


--
-- TOC entry 2941 (class 0 OID 15335880)
-- Dependencies: 224
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55db-2bff-c1bd-67c5b5624c32	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2944 (class 0 OID 15335941)
-- Dependencies: 227
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2923 (class 0 OID 15335617)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55db-2bff-f892-60af6127afe6	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55db-2bff-a28f-d55e351493e8	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55db-2bff-e052-b3fbfd2b5424	0003	Kazinska	t	84	Kazinska dvorana
00220000-55db-2bff-790a-7cd33b694649	0004	Mali oder	t	24	Mali oder 
00220000-55db-2bff-9324-582a00a017e0	0005	Komorni oder	t	15	Komorni oder
00220000-55db-2bff-95b5-c4c8742ff3e5	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55db-2bff-19a7-f9c3d9838c87	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2915 (class 0 OID 15335561)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2914 (class 0 OID 15335551)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 15335736)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 15335685)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2888 (class 0 OID 15335255)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55db-2c00-e9da-33a38b315904	00010000-55db-2bfe-f541-109f2f62e2b5	2015-08-24 16:36:48	INS	a:0:{}
2	App\\Entity\\Option	00000000-55db-2c00-313a-f381a91e674a	00010000-55db-2bfe-f541-109f2f62e2b5	2015-08-24 16:36:48	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55db-2c00-cfc3-434eb2c11af9	00010000-55db-2bfe-f541-109f2f62e2b5	2015-08-24 16:36:48	INS	a:0:{}
\.


--
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2924 (class 0 OID 15335627)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 15335293)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55db-2bfe-fc06-c17856c26755	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55db-2bfe-7c36-6c1e7b583f2b	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55db-2bfe-76c8-2a8a52f93012	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55db-2bfe-88af-2d632eb839aa	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55db-2bfe-5ae7-0c1724bac665	planer	Planer dogodkov v koledarju	t
00020000-55db-2bfe-8fde-36f0b1015914	kadrovska	Kadrovska služba	t
00020000-55db-2bfe-c50a-35e5e355fa17	arhivar	Ažuriranje arhivalij	t
00020000-55db-2bfe-5059-c66bae94ddbe	igralec	Igralec	t
00020000-55db-2bfe-fadb-c936bdc5abc0	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55db-2bff-98ac-0573ee913ff6	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2890 (class 0 OID 15335277)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55db-2bfe-640a-cdce7e7f9d3e	00020000-55db-2bfe-76c8-2a8a52f93012
00010000-55db-2bfe-f541-109f2f62e2b5	00020000-55db-2bfe-76c8-2a8a52f93012
00010000-55db-2bff-b7c9-ac8e8757eeb3	00020000-55db-2bff-98ac-0573ee913ff6
\.


--
-- TOC entry 2926 (class 0 OID 15335641)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2918 (class 0 OID 15335582)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2912 (class 0 OID 15335528)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 15335982)
-- Dependencies: 232
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55db-2bfd-f4d2-b5730f1e340d	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55db-2bfd-0f7d-987847e52b07	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55db-2bfd-d69a-1702e9e2f0e8	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55db-2bfd-1870-5da7c9aaa2ec	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55db-2bfd-1e95-7f3883f1513b	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2948 (class 0 OID 15335974)
-- Dependencies: 231
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55db-2bfd-858a-e5470e600b97	00230000-55db-2bfd-1870-5da7c9aaa2ec	popa
00240000-55db-2bfd-173a-09b41e672c24	00230000-55db-2bfd-1870-5da7c9aaa2ec	oseba
00240000-55db-2bfd-480c-8f3ad0519007	00230000-55db-2bfd-1870-5da7c9aaa2ec	sezona
00240000-55db-2bfd-a3b2-8498727f4185	00230000-55db-2bfd-0f7d-987847e52b07	prostor
00240000-55db-2bfd-8636-4057d4eb8e8e	00230000-55db-2bfd-1870-5da7c9aaa2ec	besedilo
00240000-55db-2bfd-16b4-30295e0ad205	00230000-55db-2bfd-1870-5da7c9aaa2ec	uprizoritev
00240000-55db-2bfd-e125-74ff2d8794a9	00230000-55db-2bfd-1870-5da7c9aaa2ec	funkcija
00240000-55db-2bfd-4705-1ce7214abbbd	00230000-55db-2bfd-1870-5da7c9aaa2ec	tipfunkcije
00240000-55db-2bfd-fe3b-5c62e295fc08	00230000-55db-2bfd-1870-5da7c9aaa2ec	alternacija
00240000-55db-2bfd-87b1-d1719d9e1096	00230000-55db-2bfd-f4d2-b5730f1e340d	pogodba
00240000-55db-2bfd-9f2f-e13554c4c632	00230000-55db-2bfd-1870-5da7c9aaa2ec	zaposlitev
00240000-55db-2bfd-203a-5ee284c4104e	00230000-55db-2bfd-f4d2-b5730f1e340d	programdela
00240000-55db-2bfd-5e6c-a4d1268cb599	00230000-55db-2bfd-1870-5da7c9aaa2ec	zapis
\.


--
-- TOC entry 2947 (class 0 OID 15335969)
-- Dependencies: 230
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
e1e7d4c8-bf59-4296-9592-c8a11031cd2f	00230000-55db-2bfd-1870-5da7c9aaa2ec	0	1001
\.


--
-- TOC entry 2931 (class 0 OID 15335695)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55db-2bff-59cd-4f35e4d0932c	000e0000-55db-2bff-f03a-282482839bcf	00080000-55db-2bff-a15e-012649b89002	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55db-2bff-c2fc-281ce35cea90	000e0000-55db-2bff-f03a-282482839bcf	00080000-55db-2bff-a15e-012649b89002	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55db-2bff-d691-17acf5845160	000e0000-55db-2bff-f03a-282482839bcf	00080000-55db-2bff-ae17-757f40e7539e	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2897 (class 0 OID 15335355)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2913 (class 0 OID 15335538)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55db-2bff-fced-73487ecd59a5	00180000-55db-2bff-2e07-89f9375d072b	000c0000-55db-2bff-3329-c859e50aebe7	00090000-55db-2bff-fb33-335bbe88c1ef	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55db-2bff-9299-14ecf35501b1	00180000-55db-2bff-2e07-89f9375d072b	000c0000-55db-2bff-0abd-3008a7e37c8e	00090000-55db-2bff-685f-48a837e028cb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55db-2bff-04c0-4f79b3028df4	00180000-55db-2bff-2e07-89f9375d072b	000c0000-55db-2bff-70fb-21222823de8f	00090000-55db-2bff-c525-2c4ade61d9df	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55db-2bff-f424-8bbc70bc08fd	00180000-55db-2bff-2e07-89f9375d072b	000c0000-55db-2bff-661e-70990a2ff6bf	00090000-55db-2bff-74e1-12f51afbdb1b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55db-2bff-f2bf-078926acb8f5	00180000-55db-2bff-2e07-89f9375d072b	000c0000-55db-2bff-5db3-4e95921afb1a	00090000-55db-2bff-2779-3254aa4d2123	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55db-2bff-e550-4fd6bdc1dbea	00180000-55db-2bff-d695-29ab7bf6e523	\N	00090000-55db-2bff-2779-3254aa4d2123	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2933 (class 0 OID 15335725)
-- Dependencies: 216
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55db-2bfd-728f-5015ff981475	Avtor	Avtorji	Avtorka	umetnik
000f0000-55db-2bfd-6bb6-6c6b2e2f7e60	Priredba	Priredba	Priredba	umetnik
000f0000-55db-2bfd-6f16-f0e92eca8c3e	Prevod	Prevod	Prevod	umetnik
000f0000-55db-2bfd-32aa-b44be6bcfbfa	Režija	Režija	Režija	umetnik
000f0000-55db-2bfd-19af-b9402ff0b70d	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55db-2bfd-11d9-e1a718a68efd	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55db-2bfd-b8a3-fb71b15837d0	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55db-2bfd-4b68-9190d8391777	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55db-2bfd-ff89-5eb19ee6c270	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55db-2bfd-0cca-53c5c564b6c6	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55db-2bfd-abc2-c075e55bba2d	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55db-2bfd-7bf3-fde1ce505d4f	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55db-2bfd-5dac-064c21e5e496	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55db-2bfd-7093-4cc7c5aae59a	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55db-2bfd-1540-afe3010f5434	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55db-2bfd-af14-ed23043140ed	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55db-2bfd-a535-bb38a62fbf73	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55db-2bfd-197f-f487d152bcdf	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2945 (class 0 OID 15335951)
-- Dependencies: 228
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55db-2bfd-ee46-8381d61d0b36	01	Velika predstava	f	1.00	1.00
002b0000-55db-2bfd-e99a-57f67881a96e	02	Mala predstava	f	0.50	0.50
002b0000-55db-2bfd-c230-0a010c18fe99	03	Mala koprodukcija	t	0.40	1.00
002b0000-55db-2bfd-5101-119435d4cc81	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55db-2bfd-c4de-7cb3259b0316	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2902 (class 0 OID 15335418)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 15335264)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55db-2bfe-f541-109f2f62e2b5	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO6DsHmo5X9XzkQhu3MXRuYk36Hyh1lyu	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55db-2bff-a421-f703b5a01434	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55db-2bff-564d-7e9c74c099cb	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55db-2bff-d6e5-a02b9dccd2ee	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55db-2bff-3f0e-60ce6f296e7a	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55db-2bff-5540-642a2c9a21ec	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55db-2bff-fe2f-2dace0368230	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55db-2bff-48b5-fbe2fa4b0478	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55db-2bff-030a-ddcc136c487c	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55db-2bff-afc6-bc951d3c5344	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55db-2bff-b7c9-ac8e8757eeb3	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55db-2bfe-640a-cdce7e7f9d3e	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2937 (class 0 OID 15335773)
-- Dependencies: 220
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55db-2bff-91ad-4684f5c9c5cc	00160000-55db-2bff-4bc5-1fb01862c4c8	00150000-55db-2bfd-4676-a30d5ffc3a22	00140000-55db-2bfd-fda0-4339f9b73e99	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55db-2bff-9324-582a00a017e0
000e0000-55db-2bff-f03a-282482839bcf	00160000-55db-2bff-7c01-6a8f6d16bc3a	00150000-55db-2bfd-44c5-e6739ca4ada0	00140000-55db-2bfd-4815-7e2535c3f3a0	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55db-2bff-95b5-c4c8742ff3e5
000e0000-55db-2bff-4e4c-6593529371bf	\N	00150000-55db-2bfd-44c5-e6739ca4ada0	00140000-55db-2bfd-4815-7e2535c3f3a0	00190000-55db-2bff-a1dc-1c96229e4dce	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55db-2bff-9324-582a00a017e0
000e0000-55db-2bff-7d44-31ca2c009e71	\N	00150000-55db-2bfd-44c5-e6739ca4ada0	00140000-55db-2bfd-4815-7e2535c3f3a0	00190000-55db-2bff-a1dc-1c96229e4dce	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55db-2bff-9324-582a00a017e0
000e0000-55db-2bff-39d4-11379c891649	\N	00150000-55db-2bfd-44c5-e6739ca4ada0	00140000-55db-2bfd-4815-7e2535c3f3a0	00190000-55db-2bff-a1dc-1c96229e4dce	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55db-2bff-f892-60af6127afe6
000e0000-55db-2bff-5f8f-f736634f0ad8	\N	00150000-55db-2bfd-44c5-e6739ca4ada0	00140000-55db-2bfd-4815-7e2535c3f3a0	00190000-55db-2bff-a1dc-1c96229e4dce	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f		00220000-55db-2bff-f892-60af6127afe6
\.


--
-- TOC entry 2907 (class 0 OID 15335480)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55db-2bff-f7e1-3e6e17ac35a2	000e0000-55db-2bff-f03a-282482839bcf	1	
00200000-55db-2bff-d5d2-d5e21fc2aff2	000e0000-55db-2bff-f03a-282482839bcf	2	
\.


--
-- TOC entry 2922 (class 0 OID 15335609)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 15336021)
-- Dependencies: 234
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 15335993)
-- Dependencies: 233
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 15336033)
-- Dependencies: 235
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 15335678)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55db-2bff-bc63-1b291c6de909	00090000-55db-2bff-685f-48a837e028cb	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55db-2bff-2421-ac9b5d5cb324	00090000-55db-2bff-c525-2c4ade61d9df	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55db-2bff-af57-f676e9d19ebb	00090000-55db-2bff-0f63-03e388872adf	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55db-2bff-15a8-7c146226564e	00090000-55db-2bff-e87f-62f1d773e456	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55db-2bff-2f40-11e3a2c03b27	00090000-55db-2bff-fb33-335bbe88c1ef	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55db-2bff-82e3-7abaed583a45	00090000-55db-2bff-76be-b5e61bf6fbd0	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2909 (class 0 OID 15335512)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 15335763)
-- Dependencies: 219
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55db-2bfd-fda0-4339f9b73e99	01	Drama	drama (SURS 01)
00140000-55db-2bfd-6e85-4de130d0c296	02	Opera	opera (SURS 02)
00140000-55db-2bfd-a2be-938a732fdb2c	03	Balet	balet (SURS 03)
00140000-55db-2bfd-55cd-cee332306ace	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55db-2bfd-40b6-e2f261919be8	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55db-2bfd-4815-7e2535c3f3a0	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55db-2bfd-d00c-4aa33c8c8d07	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2928 (class 0 OID 15335668)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55db-2bfd-561a-a1d14021010a	01	Opera	opera
00150000-55db-2bfd-4e4f-6896a943b284	02	Opereta	opereta
00150000-55db-2bfd-49bc-c0c5c40724bb	03	Balet	balet
00150000-55db-2bfd-108d-f0860da53e99	04	Plesne prireditve	plesne prireditve
00150000-55db-2bfd-5297-9647ef842669	05	Lutkovno gledališče	lutkovno gledališče
00150000-55db-2bfd-dd45-c063450f9199	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55db-2bfd-a946-b15a771d6347	07	Biografska drama	biografska drama
00150000-55db-2bfd-4676-a30d5ffc3a22	08	Komedija	komedija
00150000-55db-2bfd-fa14-5fbe69516ebe	09	Črna komedija	črna komedija
00150000-55db-2bfd-1378-fb00729bc857	10	E-igra	E-igra
00150000-55db-2bfd-44c5-e6739ca4ada0	11	Kriminalka	kriminalka
00150000-55db-2bfd-0667-1ee5699200c8	12	Musical	musical
\.


--
-- TOC entry 2439 (class 2606 OID 15335318)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 15335820)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 15335810)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 15335724)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 15336073)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 15335502)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 15335527)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 15335967)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 15335444)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 15335874)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 15335664)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 15335478)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 15335521)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 15335458)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 15335574)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 15336050)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 15336057)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2680 (class 2606 OID 15336081)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 15335601)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 15335416)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 15335327)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 15335351)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 15335307)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2430 (class 2606 OID 15335292)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 15335607)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 15335640)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 15335758)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 15335380)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 15335404)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 15335580)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 15335394)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 15335465)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 15335592)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 15335930)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 15335938)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 15335922)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 15335949)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 15335624)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 15335565)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 15335556)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 15335746)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 15335692)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 15335263)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 15335631)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 15335281)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2432 (class 2606 OID 15335301)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 15335649)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 15335587)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 15335536)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 15335991)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 15335979)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 15335973)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 15335705)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 15335360)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 15335547)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 15335735)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 15335961)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 15335429)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 15335276)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 15335789)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 15335487)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 15335615)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 15336031)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 15336015)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 15336039)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 15335683)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 15335516)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 15335771)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 15335676)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 1259 OID 15335509)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2580 (class 1259 OID 15335706)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 15335707)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2666 (class 1259 OID 15336052)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2667 (class 1259 OID 15336051)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2453 (class 1259 OID 15335382)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2545 (class 1259 OID 15335608)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2653 (class 1259 OID 15336019)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2654 (class 1259 OID 15336018)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2655 (class 1259 OID 15336020)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2656 (class 1259 OID 15336017)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2657 (class 1259 OID 15336016)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2539 (class 1259 OID 15335594)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2540 (class 1259 OID 15335593)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2490 (class 1259 OID 15335488)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2567 (class 1259 OID 15335665)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2568 (class 1259 OID 15335667)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2569 (class 1259 OID 15335666)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2478 (class 1259 OID 15335460)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2479 (class 1259 OID 15335459)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2636 (class 1259 OID 15335950)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2590 (class 1259 OID 15335760)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2591 (class 1259 OID 15335761)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2592 (class 1259 OID 15335762)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2663 (class 1259 OID 15336040)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2599 (class 1259 OID 15335794)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2600 (class 1259 OID 15335791)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2601 (class 1259 OID 15335795)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2602 (class 1259 OID 15335793)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2603 (class 1259 OID 15335792)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2468 (class 1259 OID 15335431)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2469 (class 1259 OID 15335430)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2444 (class 1259 OID 15335354)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2555 (class 1259 OID 15335632)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2508 (class 1259 OID 15335522)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2434 (class 1259 OID 15335308)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2435 (class 1259 OID 15335309)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2560 (class 1259 OID 15335652)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2561 (class 1259 OID 15335651)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2562 (class 1259 OID 15335650)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2482 (class 1259 OID 15335466)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2483 (class 1259 OID 15335468)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2484 (class 1259 OID 15335467)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2646 (class 1259 OID 15335981)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2519 (class 1259 OID 15335560)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2520 (class 1259 OID 15335558)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2521 (class 1259 OID 15335557)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2522 (class 1259 OID 15335559)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2425 (class 1259 OID 15335282)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2426 (class 1259 OID 15335283)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2548 (class 1259 OID 15335616)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2676 (class 1259 OID 15336074)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2677 (class 1259 OID 15336082)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2678 (class 1259 OID 15336083)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2534 (class 1259 OID 15335581)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2576 (class 1259 OID 15335693)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2577 (class 1259 OID 15335694)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2620 (class 1259 OID 15335879)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2621 (class 1259 OID 15335878)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2622 (class 1259 OID 15335875)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2623 (class 1259 OID 15335876)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2624 (class 1259 OID 15335877)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2457 (class 1259 OID 15335396)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2458 (class 1259 OID 15335395)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2459 (class 1259 OID 15335397)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2628 (class 1259 OID 15335931)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2629 (class 1259 OID 15335932)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2613 (class 1259 OID 15335824)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2614 (class 1259 OID 15335825)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2615 (class 1259 OID 15335822)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2616 (class 1259 OID 15335823)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2573 (class 1259 OID 15335684)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2525 (class 1259 OID 15335569)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2526 (class 1259 OID 15335568)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2527 (class 1259 OID 15335566)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2528 (class 1259 OID 15335567)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2609 (class 1259 OID 15335812)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2610 (class 1259 OID 15335811)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2625 (class 1259 OID 15335923)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2489 (class 1259 OID 15335479)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2643 (class 1259 OID 15335968)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2670 (class 1259 OID 15336058)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2671 (class 1259 OID 15336059)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2440 (class 1259 OID 15335329)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2441 (class 1259 OID 15335328)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2449 (class 1259 OID 15335361)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2450 (class 1259 OID 15335362)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2514 (class 1259 OID 15335550)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2515 (class 1259 OID 15335549)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2516 (class 1259 OID 15335548)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2496 (class 1259 OID 15335511)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2497 (class 1259 OID 15335507)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2498 (class 1259 OID 15335504)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2499 (class 1259 OID 15335505)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2500 (class 1259 OID 15335503)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2501 (class 1259 OID 15335508)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2502 (class 1259 OID 15335506)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2456 (class 1259 OID 15335381)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2474 (class 1259 OID 15335445)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2475 (class 1259 OID 15335447)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2476 (class 1259 OID 15335446)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2477 (class 1259 OID 15335448)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2533 (class 1259 OID 15335575)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2595 (class 1259 OID 15335759)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2604 (class 1259 OID 15335790)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2447 (class 1259 OID 15335352)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2448 (class 1259 OID 15335353)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2570 (class 1259 OID 15335677)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2652 (class 1259 OID 15335992)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2467 (class 1259 OID 15335417)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2649 (class 1259 OID 15335980)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2553 (class 1259 OID 15335626)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2554 (class 1259 OID 15335625)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2617 (class 1259 OID 15335821)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2464 (class 1259 OID 15335405)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2596 (class 1259 OID 15335772)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2660 (class 1259 OID 15336032)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2634 (class 1259 OID 15335939)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 15335940)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2513 (class 1259 OID 15335537)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2433 (class 1259 OID 15335302)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2503 (class 1259 OID 15335510)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2706 (class 2606 OID 15336219)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2709 (class 2606 OID 15336204)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2708 (class 2606 OID 15336209)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2704 (class 2606 OID 15336229)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2710 (class 2606 OID 15336199)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2705 (class 2606 OID 15336224)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2707 (class 2606 OID 15336214)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2740 (class 2606 OID 15336374)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2739 (class 2606 OID 15336379)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2773 (class 2606 OID 15336549)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2774 (class 2606 OID 15336544)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2691 (class 2606 OID 15336134)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2727 (class 2606 OID 15336314)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2768 (class 2606 OID 15336529)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2769 (class 2606 OID 15336524)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2767 (class 2606 OID 15336534)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2770 (class 2606 OID 15336519)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2771 (class 2606 OID 15336514)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2725 (class 2606 OID 15336309)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2726 (class 2606 OID 15336304)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2703 (class 2606 OID 15336194)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2735 (class 2606 OID 15336344)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2733 (class 2606 OID 15336354)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2734 (class 2606 OID 15336349)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2697 (class 2606 OID 15336169)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2698 (class 2606 OID 15336164)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2723 (class 2606 OID 15336294)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2764 (class 2606 OID 15336499)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2743 (class 2606 OID 15336384)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2742 (class 2606 OID 15336389)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2741 (class 2606 OID 15336394)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2772 (class 2606 OID 15336539)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2745 (class 2606 OID 15336414)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2748 (class 2606 OID 15336399)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2744 (class 2606 OID 15336419)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2746 (class 2606 OID 15336409)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2747 (class 2606 OID 15336404)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2695 (class 2606 OID 15336159)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2696 (class 2606 OID 15336154)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2687 (class 2606 OID 15336119)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2688 (class 2606 OID 15336114)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2729 (class 2606 OID 15336324)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2711 (class 2606 OID 15336234)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2684 (class 2606 OID 15336094)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2683 (class 2606 OID 15336099)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2730 (class 2606 OID 15336339)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2731 (class 2606 OID 15336334)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2732 (class 2606 OID 15336329)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2701 (class 2606 OID 15336174)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2699 (class 2606 OID 15336184)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2700 (class 2606 OID 15336179)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2766 (class 2606 OID 15336509)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2715 (class 2606 OID 15336269)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2717 (class 2606 OID 15336259)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2718 (class 2606 OID 15336254)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2716 (class 2606 OID 15336264)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2682 (class 2606 OID 15336084)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2681 (class 2606 OID 15336089)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2728 (class 2606 OID 15336319)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2777 (class 2606 OID 15336564)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2779 (class 2606 OID 15336569)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2778 (class 2606 OID 15336574)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2724 (class 2606 OID 15336299)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2738 (class 2606 OID 15336364)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2737 (class 2606 OID 15336369)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2755 (class 2606 OID 15336474)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2756 (class 2606 OID 15336469)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2759 (class 2606 OID 15336454)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2758 (class 2606 OID 15336459)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2757 (class 2606 OID 15336464)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2693 (class 2606 OID 15336144)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2694 (class 2606 OID 15336139)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2692 (class 2606 OID 15336149)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2762 (class 2606 OID 15336484)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2761 (class 2606 OID 15336489)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2752 (class 2606 OID 15336444)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2751 (class 2606 OID 15336449)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2754 (class 2606 OID 15336434)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2753 (class 2606 OID 15336439)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2736 (class 2606 OID 15336359)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2719 (class 2606 OID 15336289)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2720 (class 2606 OID 15336284)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2722 (class 2606 OID 15336274)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2721 (class 2606 OID 15336279)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2749 (class 2606 OID 15336429)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2750 (class 2606 OID 15336424)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2760 (class 2606 OID 15336479)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2702 (class 2606 OID 15336189)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2763 (class 2606 OID 15336494)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2765 (class 2606 OID 15336504)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2776 (class 2606 OID 15336554)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2775 (class 2606 OID 15336559)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2685 (class 2606 OID 15336109)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2686 (class 2606 OID 15336104)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2690 (class 2606 OID 15336124)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2689 (class 2606 OID 15336129)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2712 (class 2606 OID 15336249)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2713 (class 2606 OID 15336244)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2714 (class 2606 OID 15336239)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-24 16:36:49 CEST

--
-- PostgreSQL database dump complete
--

