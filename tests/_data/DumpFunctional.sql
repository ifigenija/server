--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-13 11:47:05 CEST

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
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 240
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 177 (class 1259 OID 13441460)
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
-- TOC entry 222 (class 1259 OID 13441963)
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
-- TOC entry 221 (class 1259 OID 13441946)
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
-- TOC entry 215 (class 1259 OID 13441858)
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
-- TOC entry 238 (class 1259 OID 13442206)
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
    title character varying(255) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 191 (class 1259 OID 13441639)
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
-- TOC entry 194 (class 1259 OID 13441673)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 13442108)
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
-- TOC entry 186 (class 1259 OID 13441582)
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
-- TOC entry 223 (class 1259 OID 13441976)
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
    obiskgost integer DEFAULT 0 NOT NULL,
    obiskzamejo integer DEFAULT 0 NOT NULL,
    obiskint integer DEFAULT 0 NOT NULL,
    ponovidoma integer DEFAULT 0 NOT NULL,
    ponovizamejo integer DEFAULT 0 NOT NULL,
    ponovigost integer DEFAULT 0 NOT NULL,
    ponoviint integer DEFAULT 0 NOT NULL,
    naziv character varying(50) DEFAULT NULL::character varying,
    sort integer,
    tipprogramskeenote_id uuid,
    tip character varying(20) NOT NULL,
    strosekodkpred numeric(15,2) DEFAULT 0::numeric,
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
-- TOC entry 210 (class 1259 OID 13441803)
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
-- TOC entry 189 (class 1259 OID 13441619)
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
-- TOC entry 193 (class 1259 OID 13441667)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 13441599)
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
-- TOC entry 199 (class 1259 OID 13441720)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 236 (class 1259 OID 13442187)
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
-- TOC entry 237 (class 1259 OID 13442199)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 13442222)
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
-- TOC entry 203 (class 1259 OID 13441745)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 13441556)
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
-- TOC entry 178 (class 1259 OID 13441469)
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
-- TOC entry 179 (class 1259 OID 13441480)
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
-- TOC entry 174 (class 1259 OID 13441434)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 13441453)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 13441752)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 13441783)
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
-- TOC entry 218 (class 1259 OID 13441897)
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
-- TOC entry 181 (class 1259 OID 13441513)
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
-- TOC entry 183 (class 1259 OID 13441548)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 13441726)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 13441533)
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
-- TOC entry 188 (class 1259 OID 13441611)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 13441738)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 13442069)
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
-- TOC entry 226 (class 1259 OID 13442079)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 224 (class 1259 OID 13442025)
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
    stizvponprej integer,
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
-- TOC entry 227 (class 1259 OID 13442087)
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
-- TOC entry 206 (class 1259 OID 13441767)
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
-- TOC entry 198 (class 1259 OID 13441711)
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
-- TOC entry 197 (class 1259 OID 13441701)
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
-- TOC entry 217 (class 1259 OID 13441886)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 13441835)
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
-- TOC entry 171 (class 1259 OID 13441405)
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
-- TOC entry 170 (class 1259 OID 13441403)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 207 (class 1259 OID 13441777)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 13441443)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 13441427)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 13441791)
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
-- TOC entry 201 (class 1259 OID 13441732)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 13441678)
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
-- TOC entry 232 (class 1259 OID 13442128)
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
-- TOC entry 231 (class 1259 OID 13442120)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 13442115)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 13441845)
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
-- TOC entry 180 (class 1259 OID 13441505)
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
-- TOC entry 196 (class 1259 OID 13441688)
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
-- TOC entry 216 (class 1259 OID 13441875)
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
-- TOC entry 228 (class 1259 OID 13442097)
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
-- TOC entry 185 (class 1259 OID 13441568)
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
-- TOC entry 172 (class 1259 OID 13441414)
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
-- TOC entry 220 (class 1259 OID 13441923)
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
-- TOC entry 190 (class 1259 OID 13441630)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 13441759)
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
-- TOC entry 234 (class 1259 OID 13442167)
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
-- TOC entry 233 (class 1259 OID 13442139)
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
    rigths character varying(255) DEFAULT NULL::character varying,
    source character varying(255) DEFAULT NULL::character varying,
    upor character varying(10) DEFAULT NULL::character varying,
    datknj timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    standard character varying(255) DEFAULT NULL::character varying,
    lokacija character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 13442179)
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
-- TOC entry 212 (class 1259 OID 13441828)
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
-- TOC entry 192 (class 1259 OID 13441662)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 13441913)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 13441818)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2170 (class 2604 OID 13441408)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2891 (class 0 OID 13441460)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 13441963)
-- Dependencies: 222
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55cc-6799-d57a-4639b3047d18	000d0000-55cc-6799-9bbe-925966c9568c	\N	00090000-55cc-6798-5d39-30147c022ff5	000b0000-55cc-6798-cd12-982f26f55b7d	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55cc-6799-4df7-e3944f29e8d1	000d0000-55cc-6799-314c-7353039db403	00100000-55cc-6798-a274-643ea7c0cdcf	00090000-55cc-6798-71d2-f570c67c3adc	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55cc-6799-1c3d-4ce03d1b3349	000d0000-55cc-6799-385c-66b71dfbfad1	00100000-55cc-6798-886b-eeb7412626e7	00090000-55cc-6798-739d-5d09128103e5	\N	0003	t	\N	2015-08-13	\N	2	\N	\N	f	f
000c0000-55cc-6799-ecac-7182a414d471	000d0000-55cc-6799-babd-a9267a03a526	\N	00090000-55cc-6798-14b3-992a64e5ba97	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55cc-6799-4eb7-a74086f0ccbf	000d0000-55cc-6799-32a6-8f2ed24cf57b	\N	00090000-55cc-6798-4f57-43d2eb8b0972	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55cc-6799-d831-f49e0466cd41	000d0000-55cc-6799-3f99-366f313f03ee	\N	00090000-55cc-6798-3349-1a4271dccc6a	000b0000-55cc-6798-a115-2af958be4b2b	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55cc-6799-8ab9-6211b9e34214	000d0000-55cc-6799-a8be-8bfc485a1aca	00100000-55cc-6798-03a0-5e42591425bc	00090000-55cc-6798-2b24-f052242e941b	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55cc-6799-803c-468ec5d542a8	000d0000-55cc-6799-be54-a6d6ad1c2607	\N	00090000-55cc-6798-90a9-f10c0fc15d29	000b0000-55cc-6798-4b57-8a42c831f2d1	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55cc-6799-04ee-cb261d2c36ce	000d0000-55cc-6799-a8be-8bfc485a1aca	00100000-55cc-6798-4266-ffeb78965606	00090000-55cc-6798-70b2-6a5ecf4d51e6	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55cc-6799-487c-f96711447d81	000d0000-55cc-6799-a8be-8bfc485a1aca	00100000-55cc-6798-bf21-f6b20b7f1a7e	00090000-55cc-6798-da34-b2e353cf9605	\N	0010	t	\N	2015-08-13	\N	16	\N	\N	f	t
000c0000-55cc-6799-cba7-7353d231957e	000d0000-55cc-6799-a8be-8bfc485a1aca	00100000-55cc-6798-31fa-5c3b995de070	00090000-55cc-6798-54be-04f44bd797b3	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2935 (class 0 OID 13441946)
-- Dependencies: 221
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 13441858)
-- Dependencies: 215
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55cc-6798-daed-2c8d92655e4e	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55cc-6798-23b2-974ddca203f5	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55cc-6798-bab0-e6a5777e4076	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2952 (class 0 OID 13442206)
-- Dependencies: 238
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 13441639)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55cc-6799-2887-23475d6f963f	\N	\N	00200000-55cc-6799-f5bd-8c18206211f5	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55cc-6799-d2b8-d526a1dcd230	\N	\N	00200000-55cc-6799-1ce0-2019d5b5a56a	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55cc-6799-27e7-ca0928d2fdec	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55cc-6799-dc44-15bf30fc4000	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55cc-6799-272f-490bd99aa9a9	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2908 (class 0 OID 13441673)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2943 (class 0 OID 13442108)
-- Dependencies: 229
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 13441582)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55cc-6796-d211-1ac9d2f004f0	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55cc-6796-d032-1be517211028	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55cc-6796-dc30-56ad69709287	AL	ALB	008	Albania 	Albanija	\N
00040000-55cc-6796-2fb6-d4d776d37220	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55cc-6796-ce10-f0bb0b7e61c5	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55cc-6796-4279-705c0b600aa0	AD	AND	020	Andorra 	Andora	\N
00040000-55cc-6796-36c3-9d8b4df76b7b	AO	AGO	024	Angola 	Angola	\N
00040000-55cc-6796-11b3-e2d6c3cf5124	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55cc-6796-0f5b-e3d8fd885025	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55cc-6796-5b4b-dd9d28f97929	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55cc-6796-e3ef-83b12fe2a929	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55cc-6796-e84e-09eb6e63b64f	AM	ARM	051	Armenia 	Armenija	\N
00040000-55cc-6796-b2e2-622304ad80db	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55cc-6796-3db6-214eb19cfe5c	AU	AUS	036	Australia 	Avstralija	\N
00040000-55cc-6796-c443-6a78c0627898	AT	AUT	040	Austria 	Avstrija	\N
00040000-55cc-6796-0441-b0586c35676b	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55cc-6796-c862-770d1c772584	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55cc-6796-60ea-0922b65f536b	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55cc-6796-f826-c72d97778a7b	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55cc-6796-5a6b-a9c757892994	BB	BRB	052	Barbados 	Barbados	\N
00040000-55cc-6796-634c-4ebc79ffd9bc	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55cc-6796-a59e-5e33089151a8	BE	BEL	056	Belgium 	Belgija	\N
00040000-55cc-6796-3b47-8e85b958e29d	BZ	BLZ	084	Belize 	Belize	\N
00040000-55cc-6796-bda1-8dc4a664e54d	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55cc-6796-7bc9-eb42150e3a56	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55cc-6796-31ad-e67c65e9709e	BT	BTN	064	Bhutan 	Butan	\N
00040000-55cc-6796-9fe3-dec853a4dc59	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55cc-6796-0a07-f0e67d281725	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55cc-6796-ac6f-e1a633fe153b	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55cc-6796-505f-4d619e389ff8	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55cc-6796-82d2-b9b9062b88da	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55cc-6796-6488-2eb033d4a271	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55cc-6796-9126-593f4e3ff80c	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55cc-6796-6e03-b380ecf7b93c	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55cc-6796-701b-554c9301202d	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55cc-6796-2990-cdf6d7aa8733	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55cc-6796-7837-a87d2bdc4f45	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55cc-6796-f1d9-e4afc71dba1c	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55cc-6796-3a9d-e536125424c5	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55cc-6796-3189-670f0ee117c5	CA	CAN	124	Canada 	Kanada	\N
00040000-55cc-6796-6ed7-be803ab73258	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55cc-6796-ec33-667c85d1757d	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55cc-6796-227f-90d7c520e68f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55cc-6796-d662-a847add5a6db	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55cc-6796-1844-c6cd537af79f	CL	CHL	152	Chile 	Čile	\N
00040000-55cc-6796-ee7c-816d88b6ee21	CN	CHN	156	China 	Kitajska	\N
00040000-55cc-6796-a3d0-660d6b8410dd	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55cc-6796-2ecb-b80a54cc807c	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55cc-6796-da5c-bb130223179f	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55cc-6796-d2f7-8d23f2974398	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55cc-6796-7a83-dee8d1d99105	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55cc-6796-3a82-751d3fc76c97	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55cc-6796-5f0e-8f2ffabfd450	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55cc-6796-fc13-437292e87d1a	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55cc-6796-f877-30c14144d04a	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55cc-6796-0f72-d8e3a2644576	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55cc-6796-987a-9554dbab2d70	CU	CUB	192	Cuba 	Kuba	\N
00040000-55cc-6796-362c-9f5625aaaf08	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55cc-6796-2db1-2b1bf0f24af1	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55cc-6796-ff5d-501b9633b9b1	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55cc-6796-500c-bbc09f83ed50	DK	DNK	208	Denmark 	Danska	\N
00040000-55cc-6796-fb6c-03fc31071130	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55cc-6796-431a-f0ec378fbd6b	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55cc-6796-d9c4-cfd51c03bd29	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55cc-6796-4a5a-8eef65527b7a	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55cc-6796-d42d-e50edaf694d2	EG	EGY	818	Egypt 	Egipt	\N
00040000-55cc-6796-964d-8ffd6365e3da	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55cc-6796-4c08-efd8f5eae3d9	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55cc-6796-2d9f-8195cea66e8e	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55cc-6796-71c3-a854c942ed16	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55cc-6796-08f7-f59c6d40a55f	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55cc-6796-7e59-ae7fa824d90f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55cc-6796-3272-921652bb2788	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55cc-6796-3363-08ed89d43d16	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55cc-6796-ad70-e8f938e2c143	FI	FIN	246	Finland 	Finska	\N
00040000-55cc-6796-90ef-93e776a76ec6	FR	FRA	250	France 	Francija	\N
00040000-55cc-6796-8d67-7860054d7870	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55cc-6797-c420-c4c3221e06c9	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55cc-6796-0fb3-31900dd2f924	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55cc-6796-ffff-58d3336b8a6e	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55cc-6796-9ce0-f3ca716a1f7f	GA	GAB	266	Gabon 	Gabon	\N
00040000-55cc-6796-e2c8-21af68dd655f	GM	GMB	270	Gambia 	Gambija	\N
00040000-55cc-6796-c893-af16cb247ad2	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55cc-6796-7840-8f574a10dddd	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55cc-6796-8a23-5b127c36f834	GH	GHA	288	Ghana 	Gana	\N
00040000-55cc-6796-56df-86d1639ef6c0	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55cc-6796-6c1c-979f229895ca	GR	GRC	300	Greece 	Grčija	\N
00040000-55cc-6796-7856-4850e00d1d05	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55cc-6796-8eb4-d554cde67098	GD	GRD	308	Grenada 	Grenada	\N
00040000-55cc-6796-0ee7-d16fd0e6451c	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55cc-6796-8260-f424128bdb98	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55cc-6796-83d0-cf5d94d74404	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55cc-6796-e244-5c7b0ef058c9	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55cc-6796-8da6-1dc16114ec95	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55cc-6796-7718-d27986e60615	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55cc-6796-b3f8-615eafc864f5	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55cc-6796-67d7-e5cf92b639ec	HT	HTI	332	Haiti 	Haiti	\N
00040000-55cc-6796-611d-b541804f83f6	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55cc-6796-d95b-70fee9244dda	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55cc-6796-d7d3-4dde83bbf731	HN	HND	340	Honduras 	Honduras	\N
00040000-55cc-6796-8cc1-439e21006916	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55cc-6796-38b8-263e50b92c2d	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55cc-6796-44e9-5b23776b7b54	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55cc-6796-b34b-8ad007e2bc93	IN	IND	356	India 	Indija	\N
00040000-55cc-6796-eec4-451c19b7db2a	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55cc-6796-ae9f-3ca9a9a142fd	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55cc-6796-84d4-b20372453063	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55cc-6796-9745-5362c5457f70	IE	IRL	372	Ireland 	Irska	\N
00040000-55cc-6796-6ff6-704f55709eed	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55cc-6796-20c1-73fb584bbec2	IL	ISR	376	Israel 	Izrael	\N
00040000-55cc-6796-a73a-55e44fd49fda	IT	ITA	380	Italy 	Italija	\N
00040000-55cc-6796-4ee8-59e1dccf5f81	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55cc-6796-17f8-c42d0af783a3	JP	JPN	392	Japan 	Japonska	\N
00040000-55cc-6796-7a54-3f59c0df6801	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55cc-6796-887c-9222fe8955f0	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55cc-6796-4a75-6826431ba0ab	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55cc-6796-ee83-ca87308710ce	KE	KEN	404	Kenya 	Kenija	\N
00040000-55cc-6796-db1c-91f715c05bec	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55cc-6796-a910-cc94348d0266	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55cc-6796-7679-cb40959c35b1	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55cc-6796-eb31-84aac90ebdf4	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55cc-6796-19b2-9ed1245d8ccb	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55cc-6796-20e1-dd4314e9884a	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55cc-6796-8d30-cf389698b98b	LV	LVA	428	Latvia 	Latvija	\N
00040000-55cc-6796-f3ec-0608347aeeaf	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55cc-6796-0e6f-6c6dab5c3deb	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55cc-6796-9efd-31472e512cfb	LR	LBR	430	Liberia 	Liberija	\N
00040000-55cc-6796-df35-e5163cc8919e	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55cc-6796-46db-c3cbbb580207	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55cc-6796-7a9e-14ab8d592722	LT	LTU	440	Lithuania 	Litva	\N
00040000-55cc-6796-0130-7856cb59bad7	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55cc-6796-a3b0-85ff849e82e9	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55cc-6796-4d3f-14b43a623550	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55cc-6796-41c9-fbc37fab52c2	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55cc-6796-abe8-dda3f48b187d	MW	MWI	454	Malawi 	Malavi	\N
00040000-55cc-6796-c865-5648e4d1e079	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55cc-6796-bb25-d64cfae56908	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55cc-6796-68b6-800174dea93f	ML	MLI	466	Mali 	Mali	\N
00040000-55cc-6796-f978-a9e80e5937ef	MT	MLT	470	Malta 	Malta	\N
00040000-55cc-6796-6958-dfae419302eb	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55cc-6796-2ad1-38ccf4305509	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55cc-6796-6af1-92b19fc59e63	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55cc-6796-8f0c-fa218cc77370	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55cc-6796-b353-25d8b1683926	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55cc-6796-f4d8-963e7d2dbfcc	MX	MEX	484	Mexico 	Mehika	\N
00040000-55cc-6796-1552-65fddb01ab0b	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55cc-6796-3bd0-8ba91fc57058	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55cc-6796-32bb-ffc907a02c51	MC	MCO	492	Monaco 	Monako	\N
00040000-55cc-6796-7da5-c80b50ae553f	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55cc-6796-7e29-c56babf56299	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55cc-6796-9d32-4f747942303c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55cc-6796-ddb7-d69a033723f8	MA	MAR	504	Morocco 	Maroko	\N
00040000-55cc-6797-38d9-06a9fd7e99e4	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55cc-6797-909d-6069cdf132d7	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55cc-6797-aa28-8d10c1c724e8	NA	NAM	516	Namibia 	Namibija	\N
00040000-55cc-6797-0c8a-794197bc2687	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55cc-6797-8dde-69ba9a122262	NP	NPL	524	Nepal 	Nepal	\N
00040000-55cc-6797-9c5b-9cd39b36401a	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55cc-6797-9a93-c6bf6862eb30	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55cc-6797-65ef-df9bd7716472	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55cc-6797-51ad-7d6cf806bbbf	NE	NER	562	Niger 	Niger 	\N
00040000-55cc-6797-e3f4-ed084e7a74a4	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55cc-6797-f651-99806f360e2e	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55cc-6797-1ce2-58656e1e6058	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55cc-6797-0baf-7ab970b06fcc	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55cc-6797-0faa-62ed0b1e68a2	NO	NOR	578	Norway 	Norveška	\N
00040000-55cc-6797-24e7-04c12923bca6	OM	OMN	512	Oman 	Oman	\N
00040000-55cc-6797-bbb7-fb45ecb33614	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55cc-6797-2638-c0a2dfca690b	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55cc-6797-3ee4-6e134899a2ee	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55cc-6797-0ccf-607e28bf8802	PA	PAN	591	Panama 	Panama	\N
00040000-55cc-6797-919b-596030cb7156	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55cc-6797-98f8-85a25ee7bf50	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55cc-6797-780c-a32d2e2ae346	PE	PER	604	Peru 	Peru	\N
00040000-55cc-6797-f931-48c474aa2e92	PH	PHL	608	Philippines 	Filipini	\N
00040000-55cc-6797-8dbe-a606fcd0caaa	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55cc-6797-d315-4baecbf26629	PL	POL	616	Poland 	Poljska	\N
00040000-55cc-6797-fb8d-dd2ba778868c	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55cc-6797-0006-04c2a09facce	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55cc-6797-a180-16801cbafa24	QA	QAT	634	Qatar 	Katar	\N
00040000-55cc-6797-779f-a71ac16bbac1	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55cc-6797-fe69-32bb57ad5032	RO	ROU	642	Romania 	Romunija	\N
00040000-55cc-6797-c46e-a0f48d796a25	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55cc-6797-285b-0e43ed7c6e5c	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55cc-6797-ad71-f3c4dec9444a	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55cc-6797-3601-6079f4b0badb	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55cc-6797-173c-c2968ed63305	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55cc-6797-1ffc-bd9c27b5276e	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55cc-6797-c117-073cbbc3fad0	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55cc-6797-1fa3-ee6b2088bfb2	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55cc-6797-3efa-b61617dc9a4c	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55cc-6797-a5fa-df136109d1cc	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55cc-6797-034f-75eb751416c3	SM	SMR	674	San Marino 	San Marino	\N
00040000-55cc-6797-101d-5ef6949e1fed	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55cc-6797-2550-d87977aee4e2	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55cc-6797-7efa-1840e9c8c22e	SN	SEN	686	Senegal 	Senegal	\N
00040000-55cc-6797-abc7-8382b4de86e0	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55cc-6797-a3ec-6f32e52433f3	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55cc-6797-e0ec-a7d1e502c491	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55cc-6797-dd7c-8933abc975a5	SG	SGP	702	Singapore 	Singapur	\N
00040000-55cc-6797-2515-fe3d6e00830f	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55cc-6797-f7e2-3336403c8be4	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55cc-6797-9a1f-cb9a25846f95	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55cc-6797-5e2d-c3b481d4ccab	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55cc-6797-9e40-d03e2de92eeb	SO	SOM	706	Somalia 	Somalija	\N
00040000-55cc-6797-a351-0fdf9d7c7ec6	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55cc-6797-346b-ff89313ffc82	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55cc-6797-8fca-8e2d2f22b02b	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55cc-6797-1094-154cc384e38d	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55cc-6797-6903-9e6cec7d7d82	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55cc-6797-c273-d0fa59fca61d	SD	SDN	729	Sudan 	Sudan	\N
00040000-55cc-6797-6bb4-cef506f463e9	SR	SUR	740	Suriname 	Surinam	\N
00040000-55cc-6797-af91-4aee234a3a0c	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55cc-6797-3e40-90a21d81608e	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55cc-6797-b546-db7dec42107b	SE	SWE	752	Sweden 	Švedska	\N
00040000-55cc-6797-f0d5-e65d494573a7	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55cc-6797-f5da-3f1ccd857c8c	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55cc-6797-2913-76efc2aa4159	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55cc-6797-75f7-20e97d1dc7a4	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55cc-6797-3f3b-00cd00d56e08	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55cc-6797-73b5-15cf9e8a0b3d	TH	THA	764	Thailand 	Tajska	\N
00040000-55cc-6797-1193-4c1c35f8cdd6	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55cc-6797-a632-130852d33312	TG	TGO	768	Togo 	Togo	\N
00040000-55cc-6797-fb33-be54781c6b3a	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55cc-6797-75d6-bc946775a313	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55cc-6797-6d7a-2fa16ad74d8f	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55cc-6797-45ef-f3460311ee77	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55cc-6797-8554-a12f6cd1240a	TR	TUR	792	Turkey 	Turčija	\N
00040000-55cc-6797-66c3-dd65092737c7	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55cc-6797-8803-2667bc413b66	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55cc-6797-4668-7ee3bcc7ff2c	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55cc-6797-1241-cd600f2ff8dd	UG	UGA	800	Uganda 	Uganda	\N
00040000-55cc-6797-46ee-4d8d1f799037	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55cc-6797-d875-e599a2df76ec	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55cc-6797-b79c-011e052b81e9	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55cc-6797-eac4-58cb3199095b	US	USA	840	United States 	Združene države Amerike	\N
00040000-55cc-6797-05f1-d68b5eaf8309	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55cc-6797-e829-a1f1a943d7fc	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55cc-6797-757a-f9738baac0ab	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55cc-6797-21a2-102162e7b226	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55cc-6797-98b2-3b37ec08e833	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55cc-6797-df89-af624ff234e7	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55cc-6797-6de3-994e218b3987	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55cc-6797-baa1-a263f746b750	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55cc-6797-8b26-03affffd0eef	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55cc-6797-7db1-ca389e7dbf5d	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55cc-6797-97fc-b72e2c019d20	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55cc-6797-fad0-a454e49fb1ea	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55cc-6797-02bc-4aec4632c2f9	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2937 (class 0 OID 13441976)
-- Dependencies: 223
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55cc-6799-9d7e-8bff3dec8a4a	000e0000-55cc-6799-a409-40c5edbf7735	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55cc-6797-b1bd-c5a1458c2752	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55cc-6799-0772-b3caa4e420c8	000e0000-55cc-6799-8e44-d70bd56cb987	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55cc-6797-853a-f57c6c14106b	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55cc-6799-66f1-ade0424c0864	000e0000-55cc-6799-94c5-944fe4c02382	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55cc-6797-b1bd-c5a1458c2752	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55cc-6799-9297-f8ebc3599548	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55cc-6799-ed17-1a35652cda34	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2924 (class 0 OID 13441803)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55cc-6799-a8be-8bfc485a1aca	000e0000-55cc-6799-8e44-d70bd56cb987	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55cc-6797-0bd1-2ef9495c3efb
000d0000-55cc-6799-9bbe-925966c9568c	000e0000-55cc-6799-8e44-d70bd56cb987	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55cc-6797-0bd1-2ef9495c3efb
000d0000-55cc-6799-314c-7353039db403	000e0000-55cc-6799-8e44-d70bd56cb987	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55cc-6797-8b3a-542f8aed644b
000d0000-55cc-6799-385c-66b71dfbfad1	000e0000-55cc-6799-8e44-d70bd56cb987	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55cc-6797-6317-5fa5c406093b
000d0000-55cc-6799-babd-a9267a03a526	000e0000-55cc-6799-8e44-d70bd56cb987	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55cc-6797-734d-affb47f8b6ee
000d0000-55cc-6799-32a6-8f2ed24cf57b	000e0000-55cc-6799-8e44-d70bd56cb987	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55cc-6797-0754-412ffa37acab
000d0000-55cc-6799-3f99-366f313f03ee	000e0000-55cc-6799-8e44-d70bd56cb987	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55cc-6797-0bd1-2ef9495c3efb
000d0000-55cc-6799-be54-a6d6ad1c2607	000e0000-55cc-6799-8e44-d70bd56cb987	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55cc-6797-eb74-8e699e3601ee
\.


--
-- TOC entry 2903 (class 0 OID 13441619)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 13441667)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 13441599)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55cc-6798-18ca-f04d8d739bb1	00080000-55cc-6798-70a5-b902c01d665b	00090000-55cc-6798-da34-b2e353cf9605	AK		
\.


--
-- TOC entry 2913 (class 0 OID 13441720)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 13442187)
-- Dependencies: 236
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 13442199)
-- Dependencies: 237
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 13442222)
-- Dependencies: 239
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2917 (class 0 OID 13441745)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 13441556)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55cc-6797-078f-2d1b67af4df8	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55cc-6797-c7d9-db12d611c425	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55cc-6797-a4b6-e2d40a168c63	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55cc-6797-9f8a-b061f86094c3	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55cc-6797-355c-c914e59c5479	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55cc-6797-28c9-93d1738556a5	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55cc-6797-a47b-baa2d8170408	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55cc-6797-8554-ec754e4f0957	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55cc-6797-db61-00fc1b7436c8	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55cc-6797-f0fa-ae8e24ab01c3	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55cc-6797-8cf1-fe7e23b35657	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55cc-6797-221c-b84ee950d73a	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55cc-6797-798d-ec3850a193b2	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55cc-6797-82b1-f70ea1ebe7c2	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55cc-6798-f7e0-232e9dca5130	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55cc-6798-41ec-010384f221c9	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55cc-6798-c21f-a7c0f31f0798	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55cc-6798-d4e1-186c3099299f	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55cc-6798-2342-d8ca81d86ba8	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55cc-6798-3895-b1c3c6e22b61	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2892 (class 0 OID 13441469)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55cc-6798-1f62-0fc5691c5d9f	00000000-55cc-6798-41ec-010384f221c9	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55cc-6798-385d-c7bc4307bf25	00000000-55cc-6798-41ec-010384f221c9	00010000-55cc-6797-1742-2b0286a4e4e7	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55cc-6798-2c65-47b8c349fb5d	00000000-55cc-6798-c21f-a7c0f31f0798	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2893 (class 0 OID 13441480)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55cc-6798-5d39-30147c022ff5	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55cc-6798-14b3-992a64e5ba97	00010000-55cc-6798-f049-07d1bed18bf6	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55cc-6798-739d-5d09128103e5	00010000-55cc-6798-3b4d-a45251d04dd2	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55cc-6798-70b2-6a5ecf4d51e6	00010000-55cc-6798-614d-aa38ea75cc13	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55cc-6798-374d-46943a83cc4d	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55cc-6798-3349-1a4271dccc6a	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55cc-6798-54be-04f44bd797b3	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55cc-6798-2b24-f052242e941b	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55cc-6798-da34-b2e353cf9605	00010000-55cc-6798-1c30-4dc28acb47d5	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55cc-6798-71d2-f570c67c3adc	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55cc-6798-8875-be2d2aec6bd3	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55cc-6798-4f57-43d2eb8b0972	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55cc-6798-90a9-f10c0fc15d29	00010000-55cc-6798-59bc-ac08a6745b8f	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2888 (class 0 OID 13441434)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55cc-6797-9a19-b06cf32f9d13	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55cc-6797-a656-995e152f0ea1	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55cc-6797-0e38-a5c062c46daa	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55cc-6797-fe43-4540e04c97c8	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55cc-6797-a073-386cb2298e17	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55cc-6797-73da-b332334dfd0e	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55cc-6797-524d-45038213c4cb	Abonma-read	Abonma - branje	f
00030000-55cc-6797-ffb3-d9ddd1f946d8	Abonma-write	Abonma - spreminjanje	f
00030000-55cc-6797-603c-31b3cff56135	Alternacija-read	Alternacija - branje	f
00030000-55cc-6797-ea4e-9d92d0ba59cc	Alternacija-write	Alternacija - spreminjanje	f
00030000-55cc-6797-c4e5-d86feba5ab38	Arhivalija-read	Arhivalija - branje	f
00030000-55cc-6797-61e5-33a25dbc9e13	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55cc-6797-d33a-d72d1c07e04e	Besedilo-read	Besedilo - branje	f
00030000-55cc-6797-42e5-496dc41a8434	Besedilo-write	Besedilo - spreminjanje	f
00030000-55cc-6797-12cd-c2b8b87eccd0	DogodekIzven-read	DogodekIzven - branje	f
00030000-55cc-6797-b81d-f8306962fabc	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55cc-6797-ff0f-a3fc17bdab76	Dogodek-read	Dogodek - branje	f
00030000-55cc-6797-dec6-ae69fde2ef47	Dogodek-write	Dogodek - spreminjanje	f
00030000-55cc-6797-9fdd-1f09a5dc8567	DrugiVir-read	DrugiVir - branje	f
00030000-55cc-6797-ae04-792217b191fe	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55cc-6797-be1d-d5c3499fcc6f	Drzava-read	Drzava - branje	f
00030000-55cc-6797-19b1-ba5f68d136c2	Drzava-write	Drzava - spreminjanje	f
00030000-55cc-6797-caf2-be6dd58f1ccc	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55cc-6797-62a1-1e8ed02d790f	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55cc-6797-352c-9b6119a2dc89	Funkcija-read	Funkcija - branje	f
00030000-55cc-6797-1a7c-5d14b0df2bae	Funkcija-write	Funkcija - spreminjanje	f
00030000-55cc-6797-88fd-f0208b578671	Gostovanje-read	Gostovanje - branje	f
00030000-55cc-6797-f01c-f8f6ac01f91c	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55cc-6797-e988-13952e2e7239	Gostujoca-read	Gostujoca - branje	f
00030000-55cc-6797-90bd-aa304029e38e	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55cc-6797-4e85-5be51a51b9ae	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55cc-6797-3756-3f87dcdba97d	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55cc-6797-e86e-b97fa761fa2d	Kupec-read	Kupec - branje	f
00030000-55cc-6797-acb8-ea3b6e72d097	Kupec-write	Kupec - spreminjanje	f
00030000-55cc-6797-e77d-c1e2dec5ec35	NacinPlacina-read	NacinPlacina - branje	f
00030000-55cc-6797-cf96-68506ae8eb5f	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55cc-6797-5c51-bcf7dcf7cb21	Option-read	Option - branje	f
00030000-55cc-6797-8b9f-b65695f1649b	Option-write	Option - spreminjanje	f
00030000-55cc-6797-fc7c-68798935bc24	OptionValue-read	OptionValue - branje	f
00030000-55cc-6797-ded8-ffd8df0bccfe	OptionValue-write	OptionValue - spreminjanje	f
00030000-55cc-6797-1c64-6e244e0dde1c	Oseba-read	Oseba - branje	f
00030000-55cc-6797-65af-7877a66b77df	Oseba-write	Oseba - spreminjanje	f
00030000-55cc-6797-1029-63a3f34f5eeb	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55cc-6797-dc26-22a9d1b8bcbf	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55cc-6797-9539-be4c6ed9f590	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55cc-6797-c8b8-dd228c14c143	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55cc-6797-5188-d094f935d1a2	Pogodba-read	Pogodba - branje	f
00030000-55cc-6797-490a-b46a8ce2400f	Pogodba-write	Pogodba - spreminjanje	f
00030000-55cc-6797-df97-669a7124aa0d	Popa-read	Popa - branje	f
00030000-55cc-6797-e400-347575d54e0a	Popa-write	Popa - spreminjanje	f
00030000-55cc-6797-a844-4e6afcd0b1af	Posta-read	Posta - branje	f
00030000-55cc-6797-ab23-e89e6a87d6aa	Posta-write	Posta - spreminjanje	f
00030000-55cc-6797-4b4a-3b34c7f7a300	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55cc-6797-752f-d9a0748e3698	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55cc-6797-7486-177ba1c4250f	PostniNaslov-read	PostniNaslov - branje	f
00030000-55cc-6797-6c9a-33249f711e2f	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55cc-6797-4f1c-84600c0d49c7	Predstava-read	Predstava - branje	f
00030000-55cc-6797-ebcc-b2e29418c7d3	Predstava-write	Predstava - spreminjanje	f
00030000-55cc-6797-82d0-98883d4c9b55	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55cc-6797-deb2-9fb91f5df75a	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55cc-6797-cb50-ce53197c9da4	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55cc-6797-ef71-5697aa4966db	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55cc-6797-96c7-2708f489175d	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55cc-6797-7767-75b333238e15	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55cc-6797-f23b-5cd2dcea7409	ProgramDela-read	ProgramDela - branje	f
00030000-55cc-6797-17c5-aa1c6251f572	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55cc-6797-21c5-1160e2a778ea	ProgramFestival-read	ProgramFestival - branje	f
00030000-55cc-6797-82ab-225b95b9ebd0	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55cc-6797-6fc9-0f47b5ed6077	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55cc-6797-5d65-9a7dfd4cf7de	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55cc-6797-bc98-853db38166e0	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55cc-6797-e38a-cb6f97df1ca9	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55cc-6797-4385-a849a56b8769	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55cc-6797-23b7-6e0019130219	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55cc-6797-ef45-7997c564e307	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55cc-6797-68b8-494c3116be61	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55cc-6797-8e3d-d7ff04ae3e90	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55cc-6797-8ab8-4a7deea05256	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55cc-6797-8041-5cc1b42e8ee9	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55cc-6797-a613-d7c190e0d07d	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55cc-6797-da1c-2d5d8a7d86ae	ProgramRazno-read	ProgramRazno - branje	f
00030000-55cc-6797-ba8e-8a04e6ce492c	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55cc-6797-fc75-25e9326ce9b0	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55cc-6797-a07e-1343bd2322ed	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55cc-6797-377f-d9a0fa315b19	Prostor-read	Prostor - branje	f
00030000-55cc-6797-099c-1575cff0674c	Prostor-write	Prostor - spreminjanje	f
00030000-55cc-6797-e660-d7f79b597809	Racun-read	Racun - branje	f
00030000-55cc-6797-fc8d-4833ffcf2d69	Racun-write	Racun - spreminjanje	f
00030000-55cc-6797-3533-ed89adc12e7e	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55cc-6797-e4fd-fda66d7044e2	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55cc-6797-2ac0-cc44c4b2b92e	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55cc-6797-8bf2-c3070ded6040	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55cc-6797-d46b-887210812e98	Rekvizit-read	Rekvizit - branje	f
00030000-55cc-6797-4ec6-1c154fdf7d01	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55cc-6797-8604-3a71ccd5e57c	Revizija-read	Revizija - branje	f
00030000-55cc-6797-1b67-1e50a1bc212c	Revizija-write	Revizija - spreminjanje	f
00030000-55cc-6797-728c-13b5c3f46905	Rezervacija-read	Rezervacija - branje	f
00030000-55cc-6797-64c1-c1cd9acd5e6a	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55cc-6797-52ba-df9dc3e65063	SedezniRed-read	SedezniRed - branje	f
00030000-55cc-6797-894c-57a7be5c776f	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55cc-6797-a572-2ca67f18df6b	Sedez-read	Sedez - branje	f
00030000-55cc-6797-b4b4-98c859783813	Sedez-write	Sedez - spreminjanje	f
00030000-55cc-6797-8c8f-52d5af366494	Sezona-read	Sezona - branje	f
00030000-55cc-6797-2b90-2ecaf2567170	Sezona-write	Sezona - spreminjanje	f
00030000-55cc-6797-f6c6-c11a2e6312e6	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55cc-6797-2ec7-ee08aa8942e1	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55cc-6797-2a41-61b98236c90e	Stevilcenje-read	Stevilcenje - branje	f
00030000-55cc-6797-0665-b2600fd4885f	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55cc-6797-6e97-25205ef156b0	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55cc-6797-16f6-b2f4baae3c81	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55cc-6797-f5ec-0326e7f4990a	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55cc-6797-9438-32d234618398	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55cc-6797-b088-3f50e7a9cf03	Telefonska-read	Telefonska - branje	f
00030000-55cc-6797-5313-cc4e31d056b2	Telefonska-write	Telefonska - spreminjanje	f
00030000-55cc-6797-4ae6-42325e23ccfc	TerminStoritve-read	TerminStoritve - branje	f
00030000-55cc-6797-e230-e199239c73a4	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55cc-6797-822f-a54358d3ad03	TipFunkcije-read	TipFunkcije - branje	f
00030000-55cc-6797-21e8-6b5446543b0a	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55cc-6797-62f1-370a2335f23c	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55cc-6797-dd39-ee5f5def00a7	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55cc-6797-b5c5-a212b116955c	Trr-read	Trr - branje	f
00030000-55cc-6797-672c-9acda6ee8614	Trr-write	Trr - spreminjanje	f
00030000-55cc-6797-d501-928113700113	Uprizoritev-read	Uprizoritev - branje	f
00030000-55cc-6797-1806-a9df41fb6ecb	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55cc-6797-e78a-b08877ef1773	Vaja-read	Vaja - branje	f
00030000-55cc-6797-1f87-56329a04a2ac	Vaja-write	Vaja - spreminjanje	f
00030000-55cc-6797-db46-3ae285e1f7d5	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55cc-6797-8b9e-3765de5e16e1	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55cc-6797-3543-2062abb729bf	Zaposlitev-read	Zaposlitev - branje	f
00030000-55cc-6797-ae39-7d83a4fbb917	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55cc-6797-0427-e214e95618e3	Zasedenost-read	Zasedenost - branje	f
00030000-55cc-6797-51bf-0b1f6d63d12e	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55cc-6797-0754-5b0450f14448	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55cc-6797-69b0-56e87e2111d0	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55cc-6797-371f-4bc6c1d29ebe	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55cc-6797-c6c9-84579d63b732	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55cc-6797-29d7-2bdef3fd74cc	ClSkupina-write	Checkliste - urejanje skupin	f
00030000-55cc-6797-b255-d31e156fa277	ClSkupina-read	Checkliste - branje skupin	f
00030000-55cc-6797-48b0-a26bf977a19e	ClSekcija-write	Checkliste - urejanje sekcij	f
00030000-55cc-6797-6fc2-2fdac9b90e07	ClSekcija-read	Checkliste - branje sekcij	f
00030000-55cc-6797-fed7-01894225cbb3	ClVzorec-write	Checkliste - urejanje glave chekcliste	f
00030000-55cc-6797-04ca-17461be61dfd	ClVzorec-read	Checkliste - branje checkliste	f
00030000-55cc-6797-2a76-2b038bda6530	ClVzorecPostavka-write	Checkliste - urejanje postavke chekcliste	f
00030000-55cc-6797-955f-3139cd8e5872	ClVzorecPostavka-read	Checkliste - branje postavke checkliste	f
00030000-55cc-6797-a89c-bdbc6086f0bd	ClPregled-write	Checkliste - Razpis checklist  - generično dovoljenje	f
00030000-55cc-6797-5bd2-23076984840f	ClPregled-read	Checkliste - branje izpolnjenih checklist - generično dovoljenje	f
00030000-55cc-6797-7c4c-5c1f1fd003e0	ClVrednost-write	Checkliste - izpolnjevanje checklist - generični permission	f
00030000-55cc-6797-2b6a-ae150dd97c52	ClVrednost-read	Checkliste - branje vrednosti checkliste - generični permission	f
\.


--
-- TOC entry 2890 (class 0 OID 13441453)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55cc-6797-a990-da5e8e2c6060	00030000-55cc-6797-a656-995e152f0ea1
00020000-55cc-6797-4857-24a3a302e8fb	00030000-55cc-6797-be1d-d5c3499fcc6f
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-524d-45038213c4cb
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-ffb3-d9ddd1f946d8
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-603c-31b3cff56135
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-ea4e-9d92d0ba59cc
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-c4e5-d86feba5ab38
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-ff0f-a3fc17bdab76
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-fe43-4540e04c97c8
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-dec6-ae69fde2ef47
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-be1d-d5c3499fcc6f
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-19b1-ba5f68d136c2
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-352c-9b6119a2dc89
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-1a7c-5d14b0df2bae
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-88fd-f0208b578671
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-f01c-f8f6ac01f91c
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-e988-13952e2e7239
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-90bd-aa304029e38e
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-4e85-5be51a51b9ae
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-3756-3f87dcdba97d
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-5c51-bcf7dcf7cb21
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-fc7c-68798935bc24
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-1c64-6e244e0dde1c
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-65af-7877a66b77df
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-df97-669a7124aa0d
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-e400-347575d54e0a
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-a844-4e6afcd0b1af
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-ab23-e89e6a87d6aa
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-7486-177ba1c4250f
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-6c9a-33249f711e2f
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-4f1c-84600c0d49c7
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-ebcc-b2e29418c7d3
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-96c7-2708f489175d
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-7767-75b333238e15
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-377f-d9a0fa315b19
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-099c-1575cff0674c
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-2ac0-cc44c4b2b92e
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-8bf2-c3070ded6040
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-d46b-887210812e98
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-4ec6-1c154fdf7d01
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-8c8f-52d5af366494
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-2b90-2ecaf2567170
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-822f-a54358d3ad03
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-d501-928113700113
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-1806-a9df41fb6ecb
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-e78a-b08877ef1773
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-1f87-56329a04a2ac
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-0427-e214e95618e3
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-51bf-0b1f6d63d12e
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-0754-5b0450f14448
00020000-55cc-6797-7eda-4c05ab9a687d	00030000-55cc-6797-371f-4bc6c1d29ebe
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-524d-45038213c4cb
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-c4e5-d86feba5ab38
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-ff0f-a3fc17bdab76
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-be1d-d5c3499fcc6f
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-88fd-f0208b578671
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-e988-13952e2e7239
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-4e85-5be51a51b9ae
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-3756-3f87dcdba97d
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-5c51-bcf7dcf7cb21
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-fc7c-68798935bc24
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-1c64-6e244e0dde1c
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-65af-7877a66b77df
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-df97-669a7124aa0d
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-a844-4e6afcd0b1af
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-7486-177ba1c4250f
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-6c9a-33249f711e2f
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-4f1c-84600c0d49c7
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-377f-d9a0fa315b19
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-2ac0-cc44c4b2b92e
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-d46b-887210812e98
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-8c8f-52d5af366494
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-b088-3f50e7a9cf03
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-5313-cc4e31d056b2
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-b5c5-a212b116955c
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-672c-9acda6ee8614
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-3543-2062abb729bf
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-ae39-7d83a4fbb917
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-0754-5b0450f14448
00020000-55cc-6797-451e-730d2efcafa2	00030000-55cc-6797-371f-4bc6c1d29ebe
00020000-55cc-6797-c790-8f5092cd7cf7	00030000-55cc-6797-524d-45038213c4cb
00020000-55cc-6797-c790-8f5092cd7cf7	00030000-55cc-6797-603c-31b3cff56135
00020000-55cc-6797-c790-8f5092cd7cf7	00030000-55cc-6797-c4e5-d86feba5ab38
00020000-55cc-6797-c790-8f5092cd7cf7	00030000-55cc-6797-61e5-33a25dbc9e13
00020000-55cc-6797-c790-8f5092cd7cf7	00030000-55cc-6797-d33a-d72d1c07e04e
00020000-55cc-6797-c790-8f5092cd7cf7	00030000-55cc-6797-12cd-c2b8b87eccd0
00020000-55cc-6797-c790-8f5092cd7cf7	00030000-55cc-6797-ff0f-a3fc17bdab76
00020000-55cc-6797-c790-8f5092cd7cf7	00030000-55cc-6797-be1d-d5c3499fcc6f
00020000-55cc-6797-c790-8f5092cd7cf7	00030000-55cc-6797-352c-9b6119a2dc89
00020000-55cc-6797-c790-8f5092cd7cf7	00030000-55cc-6797-88fd-f0208b578671
00020000-55cc-6797-c790-8f5092cd7cf7	00030000-55cc-6797-e988-13952e2e7239
00020000-55cc-6797-c790-8f5092cd7cf7	00030000-55cc-6797-4e85-5be51a51b9ae
00020000-55cc-6797-c790-8f5092cd7cf7	00030000-55cc-6797-5c51-bcf7dcf7cb21
00020000-55cc-6797-c790-8f5092cd7cf7	00030000-55cc-6797-fc7c-68798935bc24
00020000-55cc-6797-c790-8f5092cd7cf7	00030000-55cc-6797-1c64-6e244e0dde1c
00020000-55cc-6797-c790-8f5092cd7cf7	00030000-55cc-6797-df97-669a7124aa0d
00020000-55cc-6797-c790-8f5092cd7cf7	00030000-55cc-6797-a844-4e6afcd0b1af
00020000-55cc-6797-c790-8f5092cd7cf7	00030000-55cc-6797-4f1c-84600c0d49c7
00020000-55cc-6797-c790-8f5092cd7cf7	00030000-55cc-6797-96c7-2708f489175d
00020000-55cc-6797-c790-8f5092cd7cf7	00030000-55cc-6797-377f-d9a0fa315b19
00020000-55cc-6797-c790-8f5092cd7cf7	00030000-55cc-6797-2ac0-cc44c4b2b92e
00020000-55cc-6797-c790-8f5092cd7cf7	00030000-55cc-6797-d46b-887210812e98
00020000-55cc-6797-c790-8f5092cd7cf7	00030000-55cc-6797-8c8f-52d5af366494
00020000-55cc-6797-c790-8f5092cd7cf7	00030000-55cc-6797-822f-a54358d3ad03
00020000-55cc-6797-c790-8f5092cd7cf7	00030000-55cc-6797-e78a-b08877ef1773
00020000-55cc-6797-c790-8f5092cd7cf7	00030000-55cc-6797-0427-e214e95618e3
00020000-55cc-6797-c790-8f5092cd7cf7	00030000-55cc-6797-0754-5b0450f14448
00020000-55cc-6797-c790-8f5092cd7cf7	00030000-55cc-6797-371f-4bc6c1d29ebe
00020000-55cc-6797-d1f8-156c11d40a1b	00030000-55cc-6797-524d-45038213c4cb
00020000-55cc-6797-d1f8-156c11d40a1b	00030000-55cc-6797-ffb3-d9ddd1f946d8
00020000-55cc-6797-d1f8-156c11d40a1b	00030000-55cc-6797-ea4e-9d92d0ba59cc
00020000-55cc-6797-d1f8-156c11d40a1b	00030000-55cc-6797-c4e5-d86feba5ab38
00020000-55cc-6797-d1f8-156c11d40a1b	00030000-55cc-6797-ff0f-a3fc17bdab76
00020000-55cc-6797-d1f8-156c11d40a1b	00030000-55cc-6797-be1d-d5c3499fcc6f
00020000-55cc-6797-d1f8-156c11d40a1b	00030000-55cc-6797-88fd-f0208b578671
00020000-55cc-6797-d1f8-156c11d40a1b	00030000-55cc-6797-e988-13952e2e7239
00020000-55cc-6797-d1f8-156c11d40a1b	00030000-55cc-6797-5c51-bcf7dcf7cb21
00020000-55cc-6797-d1f8-156c11d40a1b	00030000-55cc-6797-fc7c-68798935bc24
00020000-55cc-6797-d1f8-156c11d40a1b	00030000-55cc-6797-df97-669a7124aa0d
00020000-55cc-6797-d1f8-156c11d40a1b	00030000-55cc-6797-a844-4e6afcd0b1af
00020000-55cc-6797-d1f8-156c11d40a1b	00030000-55cc-6797-4f1c-84600c0d49c7
00020000-55cc-6797-d1f8-156c11d40a1b	00030000-55cc-6797-377f-d9a0fa315b19
00020000-55cc-6797-d1f8-156c11d40a1b	00030000-55cc-6797-2ac0-cc44c4b2b92e
00020000-55cc-6797-d1f8-156c11d40a1b	00030000-55cc-6797-d46b-887210812e98
00020000-55cc-6797-d1f8-156c11d40a1b	00030000-55cc-6797-8c8f-52d5af366494
00020000-55cc-6797-d1f8-156c11d40a1b	00030000-55cc-6797-822f-a54358d3ad03
00020000-55cc-6797-d1f8-156c11d40a1b	00030000-55cc-6797-0754-5b0450f14448
00020000-55cc-6797-d1f8-156c11d40a1b	00030000-55cc-6797-371f-4bc6c1d29ebe
00020000-55cc-6797-06ec-107432479f63	00030000-55cc-6797-524d-45038213c4cb
00020000-55cc-6797-06ec-107432479f63	00030000-55cc-6797-c4e5-d86feba5ab38
00020000-55cc-6797-06ec-107432479f63	00030000-55cc-6797-ff0f-a3fc17bdab76
00020000-55cc-6797-06ec-107432479f63	00030000-55cc-6797-be1d-d5c3499fcc6f
00020000-55cc-6797-06ec-107432479f63	00030000-55cc-6797-88fd-f0208b578671
00020000-55cc-6797-06ec-107432479f63	00030000-55cc-6797-e988-13952e2e7239
00020000-55cc-6797-06ec-107432479f63	00030000-55cc-6797-5c51-bcf7dcf7cb21
00020000-55cc-6797-06ec-107432479f63	00030000-55cc-6797-fc7c-68798935bc24
00020000-55cc-6797-06ec-107432479f63	00030000-55cc-6797-df97-669a7124aa0d
00020000-55cc-6797-06ec-107432479f63	00030000-55cc-6797-a844-4e6afcd0b1af
00020000-55cc-6797-06ec-107432479f63	00030000-55cc-6797-4f1c-84600c0d49c7
00020000-55cc-6797-06ec-107432479f63	00030000-55cc-6797-377f-d9a0fa315b19
00020000-55cc-6797-06ec-107432479f63	00030000-55cc-6797-2ac0-cc44c4b2b92e
00020000-55cc-6797-06ec-107432479f63	00030000-55cc-6797-d46b-887210812e98
00020000-55cc-6797-06ec-107432479f63	00030000-55cc-6797-8c8f-52d5af366494
00020000-55cc-6797-06ec-107432479f63	00030000-55cc-6797-4ae6-42325e23ccfc
00020000-55cc-6797-06ec-107432479f63	00030000-55cc-6797-0e38-a5c062c46daa
00020000-55cc-6797-06ec-107432479f63	00030000-55cc-6797-822f-a54358d3ad03
00020000-55cc-6797-06ec-107432479f63	00030000-55cc-6797-0754-5b0450f14448
00020000-55cc-6797-06ec-107432479f63	00030000-55cc-6797-371f-4bc6c1d29ebe
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-9a19-b06cf32f9d13
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-a656-995e152f0ea1
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-0e38-a5c062c46daa
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-fe43-4540e04c97c8
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-a073-386cb2298e17
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-73da-b332334dfd0e
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-524d-45038213c4cb
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-ffb3-d9ddd1f946d8
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-603c-31b3cff56135
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-ea4e-9d92d0ba59cc
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-c4e5-d86feba5ab38
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-61e5-33a25dbc9e13
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-d33a-d72d1c07e04e
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-42e5-496dc41a8434
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-12cd-c2b8b87eccd0
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-b81d-f8306962fabc
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-ff0f-a3fc17bdab76
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-dec6-ae69fde2ef47
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-be1d-d5c3499fcc6f
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-19b1-ba5f68d136c2
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-9fdd-1f09a5dc8567
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-ae04-792217b191fe
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-caf2-be6dd58f1ccc
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-62a1-1e8ed02d790f
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-352c-9b6119a2dc89
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-1a7c-5d14b0df2bae
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-88fd-f0208b578671
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-f01c-f8f6ac01f91c
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-e988-13952e2e7239
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-90bd-aa304029e38e
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-4e85-5be51a51b9ae
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-3756-3f87dcdba97d
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-e86e-b97fa761fa2d
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-acb8-ea3b6e72d097
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-e77d-c1e2dec5ec35
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-cf96-68506ae8eb5f
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-5c51-bcf7dcf7cb21
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-8b9f-b65695f1649b
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-fc7c-68798935bc24
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-ded8-ffd8df0bccfe
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-1c64-6e244e0dde1c
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-65af-7877a66b77df
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-1029-63a3f34f5eeb
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-dc26-22a9d1b8bcbf
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-9539-be4c6ed9f590
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-c8b8-dd228c14c143
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-5188-d094f935d1a2
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-490a-b46a8ce2400f
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-df97-669a7124aa0d
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-e400-347575d54e0a
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-a844-4e6afcd0b1af
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-ab23-e89e6a87d6aa
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-4b4a-3b34c7f7a300
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-752f-d9a0748e3698
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-7486-177ba1c4250f
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-6c9a-33249f711e2f
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-4f1c-84600c0d49c7
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-ebcc-b2e29418c7d3
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-82d0-98883d4c9b55
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-deb2-9fb91f5df75a
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-cb50-ce53197c9da4
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-ef71-5697aa4966db
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-96c7-2708f489175d
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-7767-75b333238e15
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-f23b-5cd2dcea7409
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-17c5-aa1c6251f572
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-21c5-1160e2a778ea
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-82ab-225b95b9ebd0
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-6fc9-0f47b5ed6077
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-5d65-9a7dfd4cf7de
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-bc98-853db38166e0
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-e38a-cb6f97df1ca9
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-4385-a849a56b8769
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-23b7-6e0019130219
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-ef45-7997c564e307
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-68b8-494c3116be61
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-8e3d-d7ff04ae3e90
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-8ab8-4a7deea05256
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-8041-5cc1b42e8ee9
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-a613-d7c190e0d07d
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-da1c-2d5d8a7d86ae
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-ba8e-8a04e6ce492c
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-fc75-25e9326ce9b0
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-a07e-1343bd2322ed
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-377f-d9a0fa315b19
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-099c-1575cff0674c
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-e660-d7f79b597809
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-fc8d-4833ffcf2d69
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-3533-ed89adc12e7e
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-e4fd-fda66d7044e2
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-2ac0-cc44c4b2b92e
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-8bf2-c3070ded6040
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-d46b-887210812e98
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-4ec6-1c154fdf7d01
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-8604-3a71ccd5e57c
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-1b67-1e50a1bc212c
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-728c-13b5c3f46905
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-64c1-c1cd9acd5e6a
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-52ba-df9dc3e65063
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-894c-57a7be5c776f
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-a572-2ca67f18df6b
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-b4b4-98c859783813
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-8c8f-52d5af366494
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-2b90-2ecaf2567170
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-f6c6-c11a2e6312e6
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-2ec7-ee08aa8942e1
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-2a41-61b98236c90e
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-0665-b2600fd4885f
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-6e97-25205ef156b0
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-16f6-b2f4baae3c81
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-f5ec-0326e7f4990a
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-9438-32d234618398
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-b088-3f50e7a9cf03
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-5313-cc4e31d056b2
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-4ae6-42325e23ccfc
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-e230-e199239c73a4
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-822f-a54358d3ad03
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-21e8-6b5446543b0a
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-62f1-370a2335f23c
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-dd39-ee5f5def00a7
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-b5c5-a212b116955c
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-672c-9acda6ee8614
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-d501-928113700113
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-1806-a9df41fb6ecb
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-e78a-b08877ef1773
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-1f87-56329a04a2ac
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-db46-3ae285e1f7d5
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-8b9e-3765de5e16e1
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-3543-2062abb729bf
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-ae39-7d83a4fbb917
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-0427-e214e95618e3
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-51bf-0b1f6d63d12e
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-0754-5b0450f14448
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-69b0-56e87e2111d0
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-371f-4bc6c1d29ebe
00020000-55cc-6798-2692-fda074d60c5b	00030000-55cc-6797-c6c9-84579d63b732
\.


--
-- TOC entry 2918 (class 0 OID 13441752)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2922 (class 0 OID 13441783)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 13441897)
-- Dependencies: 218
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55cc-6798-cd12-982f26f55b7d	00090000-55cc-6798-5d39-30147c022ff5	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55cc-6798-a115-2af958be4b2b	00090000-55cc-6798-3349-1a4271dccc6a	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55cc-6798-4b57-8a42c831f2d1	00090000-55cc-6798-90a9-f10c0fc15d29	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2895 (class 0 OID 13441513)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55cc-6798-70a5-b902c01d665b	00040000-55cc-6797-9a1f-cb9a25846f95	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55cc-6798-9869-f54515e9cfee	00040000-55cc-6797-9a1f-cb9a25846f95	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55cc-6798-0e72-d0b952f4c96d	00040000-55cc-6797-9a1f-cb9a25846f95	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55cc-6798-5817-1692089fcf71	00040000-55cc-6797-9a1f-cb9a25846f95	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55cc-6798-9698-d3370bcd67c9	00040000-55cc-6797-9a1f-cb9a25846f95	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55cc-6798-eb3f-a85dea63d9a2	00040000-55cc-6796-e3ef-83b12fe2a929	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55cc-6798-0622-0a30c105a8d3	00040000-55cc-6796-0f72-d8e3a2644576	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55cc-6798-98d2-afcc24c996d4	00040000-55cc-6796-c443-6a78c0627898	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55cc-6798-59da-15057bd621fd	00040000-55cc-6797-9a1f-cb9a25846f95	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2897 (class 0 OID 13441548)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55cc-6797-daff-203476001d91	8341	Adlešiči
00050000-55cc-6797-6427-9bace3bf6288	5270	Ajdovščina
00050000-55cc-6797-4ac9-9e78b4aa7bf5	6280	Ankaran/Ancarano
00050000-55cc-6797-16d9-8c689288b3cf	9253	Apače
00050000-55cc-6797-8bdb-c457b4878bb2	8253	Artiče
00050000-55cc-6797-bd39-30a0d2c5e54d	4275	Begunje na Gorenjskem
00050000-55cc-6797-eb6c-288f12520870	1382	Begunje pri Cerknici
00050000-55cc-6797-3d25-adcbd09cf651	9231	Beltinci
00050000-55cc-6797-92d8-8338c95498c3	2234	Benedikt
00050000-55cc-6797-5dd3-0dd97d284f1b	2345	Bistrica ob Dravi
00050000-55cc-6797-ad15-8d8f24db7514	3256	Bistrica ob Sotli
00050000-55cc-6797-044d-a584d87c79c3	8259	Bizeljsko
00050000-55cc-6797-8d6e-f832ab41c19a	1223	Blagovica
00050000-55cc-6797-f679-013aa4d28288	8283	Blanca
00050000-55cc-6797-7411-1626c797f7f9	4260	Bled
00050000-55cc-6797-ee4e-c7987cbd3c72	4273	Blejska Dobrava
00050000-55cc-6797-d4a6-c6785c9688c1	9265	Bodonci
00050000-55cc-6797-a3be-a20505dea48e	9222	Bogojina
00050000-55cc-6797-f011-2509250313e6	4263	Bohinjska Bela
00050000-55cc-6797-65c6-5cd9e464ebb4	4264	Bohinjska Bistrica
00050000-55cc-6797-d18e-9a08102ec93b	4265	Bohinjsko jezero
00050000-55cc-6797-b77b-971cf802ae78	1353	Borovnica
00050000-55cc-6797-c948-729189886cd8	8294	Boštanj
00050000-55cc-6797-7535-628514b3dc73	5230	Bovec
00050000-55cc-6797-e085-7eaf91cb3259	5295	Branik
00050000-55cc-6797-a6bc-cb40dc616e8b	3314	Braslovče
00050000-55cc-6797-a96c-286a50b39890	5223	Breginj
00050000-55cc-6797-b10c-fa791bb3f00a	8280	Brestanica
00050000-55cc-6797-b1db-ca64f546d8db	2354	Bresternica
00050000-55cc-6797-cff4-230d68f003fa	4243	Brezje
00050000-55cc-6797-0361-346c83546a78	1351	Brezovica pri Ljubljani
00050000-55cc-6797-0b2e-c203582f9d6f	8250	Brežice
00050000-55cc-6797-7349-009a3a8b88d2	4210	Brnik - Aerodrom
00050000-55cc-6797-3a20-9f28ea0c7078	8321	Brusnice
00050000-55cc-6797-6f96-61a343fc1efb	3255	Buče
00050000-55cc-6797-9bd6-d6cd16af9bc6	8276	Bučka 
00050000-55cc-6797-779b-d84866d902bd	9261	Cankova
00050000-55cc-6797-5eca-82729d07ea9d	3000	Celje 
00050000-55cc-6797-16cb-c72f25bef4ec	3001	Celje - poštni predali
00050000-55cc-6797-0f83-80fb97bfefb8	4207	Cerklje na Gorenjskem
00050000-55cc-6797-1362-584e1d9e51b3	8263	Cerklje ob Krki
00050000-55cc-6797-08ad-127bf671adf7	1380	Cerknica
00050000-55cc-6797-25e6-796f4743c790	5282	Cerkno
00050000-55cc-6797-96ac-c1a9d648cd58	2236	Cerkvenjak
00050000-55cc-6797-e316-ab516269eb31	2215	Ceršak
00050000-55cc-6797-1f2b-1ba24debd219	2326	Cirkovce
00050000-55cc-6797-4127-7a50535aab0f	2282	Cirkulane
00050000-55cc-6797-2ca9-52bd13293363	5273	Col
00050000-55cc-6797-a511-6333a77678b7	8251	Čatež ob Savi
00050000-55cc-6797-1b3c-6f7be0f03f17	1413	Čemšenik
00050000-55cc-6797-630c-9f3cd2fed31e	5253	Čepovan
00050000-55cc-6797-2d82-1122aed48ca1	9232	Črenšovci
00050000-55cc-6797-4d80-3197714d90a0	2393	Črna na Koroškem
00050000-55cc-6797-f2d6-174a7d22d542	6275	Črni Kal
00050000-55cc-6797-472f-7b34a9a48c76	5274	Črni Vrh nad Idrijo
00050000-55cc-6797-cb2b-b7b7528f6847	5262	Črniče
00050000-55cc-6797-7c10-f9e55538d69a	8340	Črnomelj
00050000-55cc-6797-c0b4-a2ea71d5a520	6271	Dekani
00050000-55cc-6797-b2b1-76a1760d1de8	5210	Deskle
00050000-55cc-6797-2d0e-1d12acf02135	2253	Destrnik
00050000-55cc-6797-6e7b-f3415fd38756	6215	Divača
00050000-55cc-6797-6c3b-a0a072cca633	1233	Dob
00050000-55cc-6797-ded1-30c9a71a21f3	3224	Dobje pri Planini
00050000-55cc-6797-95cb-13ce98793428	8257	Dobova
00050000-55cc-6797-94ee-120b71e8abec	1423	Dobovec
00050000-55cc-6797-7d63-deec5826b8e7	5263	Dobravlje
00050000-55cc-6797-75da-069056e236fd	3204	Dobrna
00050000-55cc-6797-d5d4-8a21216ff600	8211	Dobrnič
00050000-55cc-6797-4134-46bd8b4377c6	1356	Dobrova
00050000-55cc-6797-068a-46777575f5ec	9223	Dobrovnik/Dobronak 
00050000-55cc-6797-1531-0dc7ffeeec1b	5212	Dobrovo v Brdih
00050000-55cc-6797-5d19-f3d3c19607b8	1431	Dol pri Hrastniku
00050000-55cc-6797-48c3-1ee012c54ceb	1262	Dol pri Ljubljani
00050000-55cc-6797-f12c-9fa0ee8e6031	1273	Dole pri Litiji
00050000-55cc-6797-380a-a3dc9f1a86a5	1331	Dolenja vas
00050000-55cc-6797-e66b-ea8094e06635	8350	Dolenjske Toplice
00050000-55cc-6797-ba4b-8ed3140ab31d	1230	Domžale
00050000-55cc-6797-5a9a-2ba0a880aae4	2252	Dornava
00050000-55cc-6797-3ee5-7061c8d6037b	5294	Dornberk
00050000-55cc-6797-21da-266d9f1dcf04	1319	Draga
00050000-55cc-6797-634d-3bc01fc04722	8343	Dragatuš
00050000-55cc-6797-1258-b68261239c4c	3222	Dramlje
00050000-55cc-6797-f0ac-d50abf3220d8	2370	Dravograd
00050000-55cc-6797-04cc-20b3540d8aad	4203	Duplje
00050000-55cc-6797-0728-794c70733cfb	6221	Dutovlje
00050000-55cc-6797-a51f-fa64d6b91ad5	8361	Dvor
00050000-55cc-6797-c062-bc92f70fac6f	2343	Fala
00050000-55cc-6797-6237-5e08c2a7c013	9208	Fokovci
00050000-55cc-6797-13b7-c265ef1335a7	2313	Fram
00050000-55cc-6797-2c78-1c077d8e6be7	3213	Frankolovo
00050000-55cc-6797-6aa5-93e324bb1ae6	1274	Gabrovka
00050000-55cc-6797-9d59-211908680dc3	8254	Globoko
00050000-55cc-6797-3f6a-28529b527de6	5275	Godovič
00050000-55cc-6797-7d51-dbd79fa126e8	4204	Golnik
00050000-55cc-6797-3f2b-96264f58fe99	3303	Gomilsko
00050000-55cc-6797-7879-b2dd1407b355	4224	Gorenja vas
00050000-55cc-6797-8664-b27ff5a21f6f	3263	Gorica pri Slivnici
00050000-55cc-6797-531d-82ca76e78b66	2272	Gorišnica
00050000-55cc-6797-b126-cf65b8811c7c	9250	Gornja Radgona
00050000-55cc-6797-6ad2-971b9d7d026c	3342	Gornji Grad
00050000-55cc-6797-1853-7dc6b9da9785	4282	Gozd Martuljek
00050000-55cc-6797-67f8-684d0386433d	6272	Gračišče
00050000-55cc-6797-145b-b97eb2a0f9d4	9264	Grad
00050000-55cc-6797-6fee-cf2e63e68ffd	8332	Gradac
00050000-55cc-6797-d1ee-7a8bbcbab429	1384	Grahovo
00050000-55cc-6797-3f76-98e9e10b316e	5242	Grahovo ob Bači
00050000-55cc-6797-c978-8ee76f93b49f	5251	Grgar
00050000-55cc-6797-5535-8bdeacb62b7e	3302	Griže
00050000-55cc-6797-c4da-4b7022e893d7	3231	Grobelno
00050000-55cc-6797-b7ad-921aa1d9eef7	1290	Grosuplje
00050000-55cc-6797-c49c-341d50399d4e	2288	Hajdina
00050000-55cc-6797-705e-775f38b6d7e1	8362	Hinje
00050000-55cc-6797-8e98-a5c1caf75be3	2311	Hoče
00050000-55cc-6797-f9ac-9bccae081bbd	9205	Hodoš/Hodos
00050000-55cc-6797-059c-e6fe97fae8fc	1354	Horjul
00050000-55cc-6797-8325-76464fe9bd68	1372	Hotedršica
00050000-55cc-6797-41cf-b821b11d23ae	1430	Hrastnik
00050000-55cc-6797-329f-40dd3da91599	6225	Hruševje
00050000-55cc-6797-f404-1ae307c5dc20	4276	Hrušica
00050000-55cc-6797-bccc-eba613781dbd	5280	Idrija
00050000-55cc-6797-538b-9ac4d9410538	1292	Ig
00050000-55cc-6797-8ba2-5f998805131a	6250	Ilirska Bistrica
00050000-55cc-6797-e6a5-629ea726a61a	6251	Ilirska Bistrica-Trnovo
00050000-55cc-6797-428d-15b2fe4ea2da	1295	Ivančna Gorica
00050000-55cc-6797-8353-b198761cd2c2	2259	Ivanjkovci
00050000-55cc-6797-3d43-c112eeaada98	1411	Izlake
00050000-55cc-6797-4fca-971510801e9e	6310	Izola/Isola
00050000-55cc-6797-fa70-f996576bc807	2222	Jakobski Dol
00050000-55cc-6797-596d-484d981483b8	2221	Jarenina
00050000-55cc-6797-2b6b-d071cab569b9	6254	Jelšane
00050000-55cc-6797-e5d4-43a2b57ed0bd	4270	Jesenice
00050000-55cc-6797-28cf-ae2c9d102d9a	8261	Jesenice na Dolenjskem
00050000-55cc-6797-e674-5b25e6b56311	3273	Jurklošter
00050000-55cc-6797-7d00-c614dad03755	2223	Jurovski Dol
00050000-55cc-6797-4c6f-50c219d0a80b	2256	Juršinci
00050000-55cc-6797-d0d1-cf8175f67c9a	5214	Kal nad Kanalom
00050000-55cc-6797-b6c3-85cadff05256	3233	Kalobje
00050000-55cc-6797-7344-c65d985180f0	4246	Kamna Gorica
00050000-55cc-6797-3262-22b382d25c9a	2351	Kamnica
00050000-55cc-6797-3789-19ef808f0613	1241	Kamnik
00050000-55cc-6797-b055-2048cf5c2e4a	5213	Kanal
00050000-55cc-6797-aaa3-4aafbcb9e712	8258	Kapele
00050000-55cc-6797-17bb-ee7d11f3c6ff	2362	Kapla
00050000-55cc-6797-96fb-94bc28cbd799	2325	Kidričevo
00050000-55cc-6797-1ffd-9e8801939f7d	1412	Kisovec
00050000-55cc-6797-e887-e13bd295a0b6	6253	Knežak
00050000-55cc-6797-cf62-5a78ae95a7a4	5222	Kobarid
00050000-55cc-6797-8cad-cc9c48024898	9227	Kobilje
00050000-55cc-6797-1015-42e66dfc4ffd	1330	Kočevje
00050000-55cc-6797-9293-d9be370739f5	1338	Kočevska Reka
00050000-55cc-6797-5231-6615a98cde22	2276	Kog
00050000-55cc-6797-5578-33dff0087e13	5211	Kojsko
00050000-55cc-6797-9c4a-67c3df0f9b40	6223	Komen
00050000-55cc-6797-27a2-881fb159450c	1218	Komenda
00050000-55cc-6797-071c-f76d7c5d3b3f	6000	Koper/Capodistria 
00050000-55cc-6797-bca2-baeb91870465	6001	Koper/Capodistria - poštni predali
00050000-55cc-6797-6de0-960bac19a107	8282	Koprivnica
00050000-55cc-6797-e634-8973d85de55d	5296	Kostanjevica na Krasu
00050000-55cc-6797-2e59-15c2d2278dea	8311	Kostanjevica na Krki
00050000-55cc-6797-f1d7-49cc1df0a11b	1336	Kostel
00050000-55cc-6797-878b-98da6f87b7a3	6256	Košana
00050000-55cc-6797-3c52-b787f404ace5	2394	Kotlje
00050000-55cc-6797-f318-8dafd074df19	6240	Kozina
00050000-55cc-6797-082f-a640b64138f6	3260	Kozje
00050000-55cc-6797-0681-7f329909a75f	4000	Kranj 
00050000-55cc-6797-c1ec-2493197f3a5f	4001	Kranj - poštni predali
00050000-55cc-6797-73fb-4e45e3abf32a	4280	Kranjska Gora
00050000-55cc-6797-1f12-931ce2adba84	1281	Kresnice
00050000-55cc-6797-f96a-0a2b547675d1	4294	Križe
00050000-55cc-6797-d0c9-42e3ee8c1d7b	9206	Križevci
00050000-55cc-6797-333b-e0ebd4a0dde8	9242	Križevci pri Ljutomeru
00050000-55cc-6797-985c-4a4d6fb0d7bf	1301	Krka
00050000-55cc-6797-3b64-6ccb8d36c463	8296	Krmelj
00050000-55cc-6797-36c7-772ced7d3888	4245	Kropa
00050000-55cc-6797-22b4-456ee4640fc8	8262	Krška vas
00050000-55cc-6797-d3e3-096c674ebbed	8270	Krško
00050000-55cc-6797-a9a9-3b719cc65fa6	9263	Kuzma
00050000-55cc-6797-60c6-aa6838de78a5	2318	Laporje
00050000-55cc-6797-2eb5-20dc3a623404	3270	Laško
00050000-55cc-6797-fd09-db44048b09b3	1219	Laze v Tuhinju
00050000-55cc-6797-4ce2-3898101f7e74	2230	Lenart v Slovenskih goricah
00050000-55cc-6797-1330-bdb6f5ddb666	9220	Lendava/Lendva
00050000-55cc-6797-c23b-d92a65a5dfb7	4248	Lesce
00050000-55cc-6797-1c34-ce61a9a80371	3261	Lesično
00050000-55cc-6797-6e4b-f003dc97d53a	8273	Leskovec pri Krškem
00050000-55cc-6797-3703-7e05869dcbf4	2372	Libeliče
00050000-55cc-6797-fc50-d8efe44ef5c7	2341	Limbuš
00050000-55cc-6797-646a-f0e3a24a4308	1270	Litija
00050000-55cc-6797-5379-cc509d2a32f6	3202	Ljubečna
00050000-55cc-6797-cfc1-7c3d0abee53a	1000	Ljubljana 
00050000-55cc-6797-8ec6-629807c95b9c	1001	Ljubljana - poštni predali
00050000-55cc-6797-1279-c763270e570e	1231	Ljubljana - Črnuče
00050000-55cc-6797-64f7-e6ccd2041bf1	1261	Ljubljana - Dobrunje
00050000-55cc-6797-4ec5-aa15faa317c4	1260	Ljubljana - Polje
00050000-55cc-6797-b2be-2dddf3970e53	1210	Ljubljana - Šentvid
00050000-55cc-6797-d64c-17b80a411c2d	1211	Ljubljana - Šmartno
00050000-55cc-6797-b14a-2c6fec35a2f9	3333	Ljubno ob Savinji
00050000-55cc-6797-a110-edcd9e170f21	9240	Ljutomer
00050000-55cc-6797-d17b-abe5ae286218	3215	Loče
00050000-55cc-6797-b4d5-03a3a96be813	5231	Log pod Mangartom
00050000-55cc-6797-0887-8f7b4e6f71a9	1358	Log pri Brezovici
00050000-55cc-6797-7f01-607e8c3f2822	1370	Logatec
00050000-55cc-6797-0def-9ed517beca6f	1371	Logatec
00050000-55cc-6797-9f66-876ed3f182d1	1434	Loka pri Zidanem Mostu
00050000-55cc-6797-09b0-2df0e4118864	3223	Loka pri Žusmu
00050000-55cc-6797-b9f3-30648803c53e	6219	Lokev
00050000-55cc-6797-1544-d5683ee3258d	1318	Loški Potok
00050000-55cc-6797-126c-7ded249c5a30	2324	Lovrenc na Dravskem polju
00050000-55cc-6797-8639-fbe4f807a0b7	2344	Lovrenc na Pohorju
00050000-55cc-6797-0ea5-cfb98e028b46	3334	Luče
00050000-55cc-6797-56e3-30d24711231a	1225	Lukovica
00050000-55cc-6797-ebae-d6dd5ec41d5d	9202	Mačkovci
00050000-55cc-6797-a571-e979265f5342	2322	Majšperk
00050000-55cc-6797-f08b-619a441e3f46	2321	Makole
00050000-55cc-6797-0c04-0f6ceb0cff01	9243	Mala Nedelja
00050000-55cc-6797-8b1d-03cd76532899	2229	Malečnik
00050000-55cc-6797-33d8-02c80410e7b3	6273	Marezige
00050000-55cc-6797-f4be-7cdff6db6393	2000	Maribor 
00050000-55cc-6797-032f-a87453800fb0	2001	Maribor - poštni predali
00050000-55cc-6797-31aa-578b85167398	2206	Marjeta na Dravskem polju
00050000-55cc-6797-0a46-ff24e58a7773	2281	Markovci
00050000-55cc-6797-7921-60f924e57ffd	9221	Martjanci
00050000-55cc-6797-c3b7-74819bcbea08	6242	Materija
00050000-55cc-6797-7d7f-736be883d35b	4211	Mavčiče
00050000-55cc-6797-3924-991b69528c0b	1215	Medvode
00050000-55cc-6797-d0ef-51183d603504	1234	Mengeš
00050000-55cc-6797-87fe-60ad2a5a866b	8330	Metlika
00050000-55cc-6797-4c73-265d2c19276c	2392	Mežica
00050000-55cc-6797-e7e7-5c183ac35cd7	2204	Miklavž na Dravskem polju
00050000-55cc-6797-7de1-3fda84e43daa	2275	Miklavž pri Ormožu
00050000-55cc-6797-5963-2ca3ebab0654	5291	Miren
00050000-55cc-6797-99e7-b226d5c38376	8233	Mirna
00050000-55cc-6797-c4ce-54ca1fab7585	8216	Mirna Peč
00050000-55cc-6797-db60-d1395a3175bc	2382	Mislinja
00050000-55cc-6797-a463-134da0e68586	4281	Mojstrana
00050000-55cc-6797-03b3-aa3ec172f77b	8230	Mokronog
00050000-55cc-6797-d044-8ae5ce74dc21	1251	Moravče
00050000-55cc-6797-4077-26d4a2bacfc6	9226	Moravske Toplice
00050000-55cc-6797-f242-9a496b912780	5216	Most na Soči
00050000-55cc-6797-1c7b-8b1d0689525b	1221	Motnik
00050000-55cc-6797-481e-8c6cd269954b	3330	Mozirje
00050000-55cc-6797-ea23-478325c87b10	9000	Murska Sobota 
00050000-55cc-6797-8c2f-2cbc2b5e894c	9001	Murska Sobota - poštni predali
00050000-55cc-6797-ae8d-96efc182f69a	2366	Muta
00050000-55cc-6797-0c76-79a6d9fa176b	4202	Naklo
00050000-55cc-6797-54a8-e5c80a0f3443	3331	Nazarje
00050000-55cc-6797-76bb-9ae536002ff6	1357	Notranje Gorice
00050000-55cc-6797-e40f-b095a88c0110	3203	Nova Cerkev
00050000-55cc-6797-8797-020ce9d485b2	5000	Nova Gorica 
00050000-55cc-6797-2d1a-be536afee31f	5001	Nova Gorica - poštni predali
00050000-55cc-6797-fa05-30d6a053522c	1385	Nova vas
00050000-55cc-6797-dee3-8f4af58aa15f	8000	Novo mesto
00050000-55cc-6797-1403-fb12724e179c	8001	Novo mesto - poštni predali
00050000-55cc-6797-0c9d-2531f62ae451	6243	Obrov
00050000-55cc-6797-cb06-cf1ba1347c9c	9233	Odranci
00050000-55cc-6797-3a13-f12bcedb309a	2317	Oplotnica
00050000-55cc-6797-2fe6-cf9056a880a2	2312	Orehova vas
00050000-55cc-6797-a52a-55492cbde4c3	2270	Ormož
00050000-55cc-6797-f298-130d6fb604ac	1316	Ortnek
00050000-55cc-6797-3342-eea0febf6936	1337	Osilnica
00050000-55cc-6797-369f-f065afe0e5c1	8222	Otočec
00050000-55cc-6797-bf28-91eb0c29b1df	2361	Ožbalt
00050000-55cc-6797-2b72-f4dab8112653	2231	Pernica
00050000-55cc-6797-e17e-922cc6fa31b3	2211	Pesnica pri Mariboru
00050000-55cc-6797-60be-cb754c4c9165	9203	Petrovci
00050000-55cc-6797-3ebf-0b0f3d634bab	3301	Petrovče
00050000-55cc-6797-a67c-c491de86da82	6330	Piran/Pirano
00050000-55cc-6797-a9df-1c69c7aa6966	8255	Pišece
00050000-55cc-6797-db65-9de7bde3c89e	6257	Pivka
00050000-55cc-6797-24f0-fed1f8cc0a59	6232	Planina
00050000-55cc-6797-7314-424ff438fabb	3225	Planina pri Sevnici
00050000-55cc-6797-e836-bd2dc9036e13	6276	Pobegi
00050000-55cc-6797-6d65-011452686c06	8312	Podbočje
00050000-55cc-6797-8c3c-2e417d1f2c73	5243	Podbrdo
00050000-55cc-6797-2909-575f3c49b7be	3254	Podčetrtek
00050000-55cc-6797-20fe-f40494a1cb8a	2273	Podgorci
00050000-55cc-6797-4bce-bf4bd13fc133	6216	Podgorje
00050000-55cc-6797-de6b-4b64df2ff5b2	2381	Podgorje pri Slovenj Gradcu
00050000-55cc-6797-6ec4-1e2c1acb6492	6244	Podgrad
00050000-55cc-6797-876e-8c747c60231b	1414	Podkum
00050000-55cc-6797-9007-0a7d4210eadc	2286	Podlehnik
00050000-55cc-6797-4b92-b46a23901201	5272	Podnanos
00050000-55cc-6797-3c81-9acaeca747f2	4244	Podnart
00050000-55cc-6797-d28b-a07b3e6f6539	3241	Podplat
00050000-55cc-6797-b43a-4849a4ba263a	3257	Podsreda
00050000-55cc-6797-2952-0cc67ff7e241	2363	Podvelka
00050000-55cc-6797-ca53-be8a2f4b1a5b	2208	Pohorje
00050000-55cc-6797-ae5f-2bf550f837f3	2257	Polenšak
00050000-55cc-6797-4774-306b9170d924	1355	Polhov Gradec
00050000-55cc-6797-783e-007f51051412	4223	Poljane nad Škofjo Loko
00050000-55cc-6797-aac0-daa42bc4dfcc	2319	Poljčane
00050000-55cc-6797-da67-ce59ec5a7e9e	1272	Polšnik
00050000-55cc-6797-6f9a-4a6694b5659c	3313	Polzela
00050000-55cc-6797-e44a-ee4417b430c2	3232	Ponikva
00050000-55cc-6797-baec-1c5082bfbdda	6320	Portorož/Portorose
00050000-55cc-6797-c896-58f98aab16e2	6230	Postojna
00050000-55cc-6797-fdf6-aa4c43cc0e68	2331	Pragersko
00050000-55cc-6797-cd43-b46361dd7b82	3312	Prebold
00050000-55cc-6797-a5d5-daed042e2612	4205	Preddvor
00050000-55cc-6797-d1fc-b7e75cc459bd	6255	Prem
00050000-55cc-6797-3f11-f0e3040b9074	1352	Preserje
00050000-55cc-6797-86ff-e22cde346f75	6258	Prestranek
00050000-55cc-6797-c647-a0f97287c76e	2391	Prevalje
00050000-55cc-6797-c5b5-6f8d46a2dd11	3262	Prevorje
00050000-55cc-6797-6247-60ed1e48549d	1276	Primskovo 
00050000-55cc-6797-1684-d1ae0ba268f0	3253	Pristava pri Mestinju
00050000-55cc-6797-8bf4-8e45093d7928	9207	Prosenjakovci/Partosfalva
00050000-55cc-6797-4f55-154415b9b697	5297	Prvačina
00050000-55cc-6797-0aff-d1e914d09ffe	2250	Ptuj
00050000-55cc-6797-67c0-417784fe714d	2323	Ptujska Gora
00050000-55cc-6797-9401-6e6cef4bc24b	9201	Puconci
00050000-55cc-6797-6fc1-ce323b2f691e	2327	Rače
00050000-55cc-6797-8897-e4baa6e4be52	1433	Radeče
00050000-55cc-6797-4263-a19cc47e14ed	9252	Radenci
00050000-55cc-6797-01c5-01dc0f4900ba	2360	Radlje ob Dravi
00050000-55cc-6797-ba32-304345fd4e1c	1235	Radomlje
00050000-55cc-6797-f999-beae766bd19a	4240	Radovljica
00050000-55cc-6797-761f-9541e0116a03	8274	Raka
00050000-55cc-6797-21b3-a4592849a4ba	1381	Rakek
00050000-55cc-6797-49c8-bfb6f89e436d	4283	Rateče - Planica
00050000-55cc-6797-5b08-38fd86e46e22	2390	Ravne na Koroškem
00050000-55cc-6797-14a6-a268b9d53d42	9246	Razkrižje
00050000-55cc-6797-4d3d-224567b957b1	3332	Rečica ob Savinji
00050000-55cc-6797-3ae5-9fd31832c322	5292	Renče
00050000-55cc-6797-3a9d-079f0bd923b3	1310	Ribnica
00050000-55cc-6797-0a70-910135010b19	2364	Ribnica na Pohorju
00050000-55cc-6797-51ff-fce39ba52b67	3272	Rimske Toplice
00050000-55cc-6797-9d70-395141963942	1314	Rob
00050000-55cc-6797-d23c-84b9f37334f4	5215	Ročinj
00050000-55cc-6797-12f8-707d268d984e	3250	Rogaška Slatina
00050000-55cc-6797-348b-fa224ad10c74	9262	Rogašovci
00050000-55cc-6797-9bb6-f467e0234ab7	3252	Rogatec
00050000-55cc-6797-2af9-5c36ea85cd7f	1373	Rovte
00050000-55cc-6797-414b-483c8c4c24a8	2342	Ruše
00050000-55cc-6797-c40d-77c01a39eb19	1282	Sava
00050000-55cc-6797-3dd1-281a5284bcad	6333	Sečovlje/Sicciole
00050000-55cc-6797-3983-3ed57a2dafbb	4227	Selca
00050000-55cc-6797-890c-2a91493132dd	2352	Selnica ob Dravi
00050000-55cc-6797-d546-bb4ffe696cde	8333	Semič
00050000-55cc-6797-6d6e-d11a8c534dd5	8281	Senovo
00050000-55cc-6797-fb87-e9dcee7ad602	6224	Senožeče
00050000-55cc-6797-807f-9f57ecfd2c62	8290	Sevnica
00050000-55cc-6797-3011-f0b6b8e78f7c	6210	Sežana
00050000-55cc-6797-c22d-f6379fde00f0	2214	Sladki Vrh
00050000-55cc-6797-c2a1-a8cf61ec5d71	5283	Slap ob Idrijci
00050000-55cc-6797-2866-8126d396dc27	2380	Slovenj Gradec
00050000-55cc-6797-f0db-7221cdc059c5	2310	Slovenska Bistrica
00050000-55cc-6797-1c73-9a0eeb4633c1	3210	Slovenske Konjice
00050000-55cc-6797-f051-4dbba31ffffe	1216	Smlednik
00050000-55cc-6797-57f8-df33946ffa4f	5232	Soča
00050000-55cc-6797-89a2-1bd7b750c828	1317	Sodražica
00050000-55cc-6797-fa67-974bdbb9fa86	3335	Solčava
00050000-55cc-6797-b145-16c5126460ac	5250	Solkan
00050000-55cc-6797-eb6e-6669ed406aba	4229	Sorica
00050000-55cc-6797-b6a5-f89f527006e5	4225	Sovodenj
00050000-55cc-6797-bdfd-52c5d0ee3804	5281	Spodnja Idrija
00050000-55cc-6797-4ae9-128b5f4306e1	2241	Spodnji Duplek
00050000-55cc-6797-a483-f71797e810ae	9245	Spodnji Ivanjci
00050000-55cc-6797-8687-b0bdaf63d7e4	2277	Središče ob Dravi
00050000-55cc-6797-5717-694e9a595d35	4267	Srednja vas v Bohinju
00050000-55cc-6797-357f-79253913d7a6	8256	Sromlje 
00050000-55cc-6797-c083-affea72dd440	5224	Srpenica
00050000-55cc-6797-b72e-9d4b7949a263	1242	Stahovica
00050000-55cc-6797-1f8d-45b2bdc943aa	1332	Stara Cerkev
00050000-55cc-6797-9e1f-67023d961238	8342	Stari trg ob Kolpi
00050000-55cc-6797-df65-3ea7c7ea40f6	1386	Stari trg pri Ložu
00050000-55cc-6797-9073-dfc1b8ff1428	2205	Starše
00050000-55cc-6797-ab35-d0a7e9d777fb	2289	Stoperce
00050000-55cc-6797-1eea-84abc0a0feaf	8322	Stopiče
00050000-55cc-6797-2cee-03a3fdf2596d	3206	Stranice
00050000-55cc-6797-b678-18188966bddc	8351	Straža
00050000-55cc-6797-519b-6e405387c273	1313	Struge
00050000-55cc-6797-924e-ad1d8b6dc937	8293	Studenec
00050000-55cc-6797-bdaa-841ab776194c	8331	Suhor
00050000-55cc-6797-172c-067a235b91e6	2233	Sv. Ana v Slovenskih goricah
00050000-55cc-6797-d457-428cbcb8c84a	2235	Sv. Trojica v Slovenskih goricah
00050000-55cc-6797-1885-262186081cf9	2353	Sveti Duh na Ostrem Vrhu
00050000-55cc-6797-1ee0-e12bf009ddf1	9244	Sveti Jurij ob Ščavnici
00050000-55cc-6797-4072-f45d7b37ef86	3264	Sveti Štefan
00050000-55cc-6797-181a-3cd1d2da9294	2258	Sveti Tomaž
00050000-55cc-6797-49c1-6c58f38398ef	9204	Šalovci
00050000-55cc-6797-3377-5d70b5fe5370	5261	Šempas
00050000-55cc-6797-cbfa-eaed401e1c8d	5290	Šempeter pri Gorici
00050000-55cc-6797-7be3-6248931147cf	3311	Šempeter v Savinjski dolini
00050000-55cc-6797-8c87-19399fa6f4d1	4208	Šenčur
00050000-55cc-6797-c8b9-29ce5bbbc509	2212	Šentilj v Slovenskih goricah
00050000-55cc-6797-bb37-13d5a017fc15	8297	Šentjanž
00050000-55cc-6797-d628-813919fb2cca	2373	Šentjanž pri Dravogradu
00050000-55cc-6797-f77f-256e36715214	8310	Šentjernej
00050000-55cc-6797-ed4a-7cffe24fd385	3230	Šentjur
00050000-55cc-6797-9558-f80d5bfba22c	3271	Šentrupert
00050000-55cc-6797-2cce-dd6a41890a50	8232	Šentrupert
00050000-55cc-6797-b6b0-d4b7ee35ca28	1296	Šentvid pri Stični
00050000-55cc-6797-30cf-549016118d12	8275	Škocjan
00050000-55cc-6797-c872-e8a46fd806ba	6281	Škofije
00050000-55cc-6797-353e-7001039e3461	4220	Škofja Loka
00050000-55cc-6797-9302-4f784ec5dcd7	3211	Škofja vas
00050000-55cc-6797-8dc7-d98d20dbdb57	1291	Škofljica
00050000-55cc-6797-5600-8cb402ff94dc	6274	Šmarje
00050000-55cc-6797-512b-c3a7381103fa	1293	Šmarje - Sap
00050000-55cc-6797-9915-011d005a4244	3240	Šmarje pri Jelšah
00050000-55cc-6797-de1b-19f35bf4b72a	8220	Šmarješke Toplice
00050000-55cc-6797-a7a3-2f03ee7716c5	2315	Šmartno na Pohorju
00050000-55cc-6797-47aa-0fe72adba523	3341	Šmartno ob Dreti
00050000-55cc-6797-a7b0-a2a2085a55a5	3327	Šmartno ob Paki
00050000-55cc-6797-7efc-d3dc9b46e5f7	1275	Šmartno pri Litiji
00050000-55cc-6797-4b0a-82427378146a	2383	Šmartno pri Slovenj Gradcu
00050000-55cc-6797-8171-5250b517bda9	3201	Šmartno v Rožni dolini
00050000-55cc-6797-2d17-5f57c66513eb	3325	Šoštanj
00050000-55cc-6797-8200-62e533f42772	6222	Štanjel
00050000-55cc-6797-86da-a197b0232b10	3220	Štore
00050000-55cc-6797-137e-5a668c2cd0c7	3304	Tabor
00050000-55cc-6797-2b2e-d53cd065f21a	3221	Teharje
00050000-55cc-6797-79a2-f76459389aab	9251	Tišina
00050000-55cc-6797-aeae-5324866267a4	5220	Tolmin
00050000-55cc-6797-0f40-0d9985ae6329	3326	Topolšica
00050000-55cc-6797-b989-b3b1a89a9611	2371	Trbonje
00050000-55cc-6797-83da-9392462e02e8	1420	Trbovlje
00050000-55cc-6797-65c5-fbf74e37d7e0	8231	Trebelno 
00050000-55cc-6797-e768-80da6c95467c	8210	Trebnje
00050000-55cc-6797-24fe-d8e0a01f220d	5252	Trnovo pri Gorici
00050000-55cc-6797-34c4-ee35a1ec64b8	2254	Trnovska vas
00050000-55cc-6797-bf03-512448a9f6ed	1222	Trojane
00050000-55cc-6797-c6c7-840ed2a25930	1236	Trzin
00050000-55cc-6797-e1b3-399b0f73a182	4290	Tržič
00050000-55cc-6797-20ad-916c74c4ff37	8295	Tržišče
00050000-55cc-6797-68dd-4cca87e8ca1a	1311	Turjak
00050000-55cc-6797-94dd-049b1b1f4540	9224	Turnišče
00050000-55cc-6797-2547-0dbcbeafc0e7	8323	Uršna sela
00050000-55cc-6797-5bd8-89547f6df1ba	1252	Vače
00050000-55cc-6797-6a9d-b82154404391	3320	Velenje 
00050000-55cc-6797-f070-ec0ce8e8adaf	3322	Velenje - poštni predali
00050000-55cc-6797-6b6e-5d891672ac36	8212	Velika Loka
00050000-55cc-6797-6d92-910070619ea3	2274	Velika Nedelja
00050000-55cc-6797-f557-910ddafbe460	9225	Velika Polana
00050000-55cc-6797-e43a-8260a642ca00	1315	Velike Lašče
00050000-55cc-6797-1835-cbe8510dcf7f	8213	Veliki Gaber
00050000-55cc-6797-e6b5-564d0fd65696	9241	Veržej
00050000-55cc-6797-8bdf-9fcde5da8ce3	1312	Videm - Dobrepolje
00050000-55cc-6797-dd1c-f6aff41894ba	2284	Videm pri Ptuju
00050000-55cc-6797-0f81-1909015e6f74	8344	Vinica
00050000-55cc-6797-fe4e-8c98ff763693	5271	Vipava
00050000-55cc-6797-0087-051897e141ea	4212	Visoko
00050000-55cc-6797-7642-a3a0941d3ac8	1294	Višnja Gora
00050000-55cc-6797-67d5-892d3e4abcf2	3205	Vitanje
00050000-55cc-6797-7b3b-35f888f554cd	2255	Vitomarci
00050000-55cc-6797-27b5-24db7a11a747	1217	Vodice
00050000-55cc-6797-bafd-2b84ce6940a9	3212	Vojnik\t
00050000-55cc-6797-5ef8-a4035f82a569	5293	Volčja Draga
00050000-55cc-6797-f40b-81d034e69cc9	2232	Voličina
00050000-55cc-6797-aca6-25ee3747cc1a	3305	Vransko
00050000-55cc-6797-f60c-6315ef2dc427	6217	Vremski Britof
00050000-55cc-6797-11f5-5d0b76e039ec	1360	Vrhnika
00050000-55cc-6797-64f7-1d8075106eee	2365	Vuhred
00050000-55cc-6797-19d1-8f9c598c61c0	2367	Vuzenica
00050000-55cc-6797-d92a-9e8488ecf13e	8292	Zabukovje 
00050000-55cc-6797-165a-df712e0faf13	1410	Zagorje ob Savi
00050000-55cc-6797-acd9-cd13e024949c	1303	Zagradec
00050000-55cc-6797-b550-db876798e9bf	2283	Zavrč
00050000-55cc-6797-ac67-4092e7de7ebe	8272	Zdole 
00050000-55cc-6797-4f5c-7fa75e7805d8	4201	Zgornja Besnica
00050000-55cc-6797-fc1a-d90de8c7ebc4	2242	Zgornja Korena
00050000-55cc-6797-0487-b2e57458e41c	2201	Zgornja Kungota
00050000-55cc-6797-ac22-74089e81a378	2316	Zgornja Ložnica
00050000-55cc-6797-4f68-bf08a6ce6af7	2314	Zgornja Polskava
00050000-55cc-6797-dea8-1eeae7afc8a9	2213	Zgornja Velka
00050000-55cc-6797-b96d-6dc647076b4b	4247	Zgornje Gorje
00050000-55cc-6797-7433-e95104319915	4206	Zgornje Jezersko
00050000-55cc-6797-d8b3-3b0751d19466	2285	Zgornji Leskovec
00050000-55cc-6797-cad2-ab5687aad6e4	1432	Zidani Most
00050000-55cc-6797-cfa2-8a3280daf7b4	3214	Zreče
00050000-55cc-6797-e9da-7f0ff976415b	4209	Žabnica
00050000-55cc-6797-72cf-937883e71c97	3310	Žalec
00050000-55cc-6797-259f-2aa31a56c1d4	4228	Železniki
00050000-55cc-6797-4188-b0673dbf16d8	2287	Žetale
00050000-55cc-6797-6f48-8ba18858e322	4226	Žiri
00050000-55cc-6797-d949-c3fcf5504460	4274	Žirovnica
00050000-55cc-6797-7f00-282ca633148f	8360	Žužemberk
\.


--
-- TOC entry 2914 (class 0 OID 13441726)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 13441533)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 13441611)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 13441738)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 13442069)
-- Dependencies: 225
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 13442079)
-- Dependencies: 226
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55cc-6798-e01f-e50d9d61f471	00080000-55cc-6798-59da-15057bd621fd	0900	AK
00190000-55cc-6798-8e53-3fecadf6fbc0	00080000-55cc-6798-0e72-d0b952f4c96d	0987	AK
00190000-55cc-6798-7db8-030e3dffbd42	00080000-55cc-6798-9869-f54515e9cfee	0989	AK
00190000-55cc-6798-caee-6675b4f9d664	00080000-55cc-6798-5817-1692089fcf71	0986	AK
00190000-55cc-6798-1c89-c3713c001157	00080000-55cc-6798-eb3f-a85dea63d9a2	0984	AK
00190000-55cc-6798-1f2e-d5289a8b4c8d	00080000-55cc-6798-0622-0a30c105a8d3	0983	AK
00190000-55cc-6798-227f-3b68221ec30b	00080000-55cc-6798-98d2-afcc24c996d4	0982	AK
\.


--
-- TOC entry 2938 (class 0 OID 13442025)
-- Dependencies: 224
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponprej, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55cc-6799-5bc0-3e6536f3e870	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2941 (class 0 OID 13442087)
-- Dependencies: 227
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 13441767)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55cc-6798-f9c4-6e3667c86ab3	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55cc-6798-69dd-d311339d2a2f	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55cc-6798-6ed4-d337f6d3890c	0003	Kazinska	t	84	Kazinska dvorana
00220000-55cc-6798-5077-9f59d6d8307d	0004	Mali oder	t	24	Mali oder 
00220000-55cc-6798-6e19-16e95b8de603	0005	Komorni oder	t	15	Komorni oder
00220000-55cc-6798-9d16-a50d9e94c266	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55cc-6798-adb5-e567c88f01a3	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2912 (class 0 OID 13441711)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2911 (class 0 OID 13441701)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 13441886)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 13441835)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 13441405)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2921 (class 0 OID 13441777)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 13441443)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55cc-6797-a990-da5e8e2c6060	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55cc-6797-4857-24a3a302e8fb	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55cc-6797-e2c0-d4ed19b05d2a	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55cc-6797-3fc3-fa2540e3dc28	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55cc-6797-7eda-4c05ab9a687d	planer	Planer dogodkov v koledarju	t
00020000-55cc-6797-451e-730d2efcafa2	kadrovska	Kadrovska služba	t
00020000-55cc-6797-c790-8f5092cd7cf7	arhivar	Ažuriranje arhivalij	t
00020000-55cc-6797-d1f8-156c11d40a1b	igralec	Igralec	t
00020000-55cc-6797-06ec-107432479f63	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55cc-6798-2692-fda074d60c5b	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2887 (class 0 OID 13441427)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55cc-6797-1742-2b0286a4e4e7	00020000-55cc-6797-e2c0-d4ed19b05d2a
00010000-55cc-6797-dd77-cdf497722a3c	00020000-55cc-6797-e2c0-d4ed19b05d2a
00010000-55cc-6798-3d26-0f0602f39e03	00020000-55cc-6798-2692-fda074d60c5b
\.


--
-- TOC entry 2923 (class 0 OID 13441791)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2915 (class 0 OID 13441732)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 13441678)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 13442128)
-- Dependencies: 232
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55cc-6797-cf6b-497203d2e8cd	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55cc-6797-631a-1853ecf77b41	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55cc-6797-c280-6c27f93765c1	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55cc-6797-25f6-4aedfbfaaa2a	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55cc-6797-e462-a7f7e13e2b72	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2945 (class 0 OID 13442120)
-- Dependencies: 231
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55cc-6797-46fa-b07a43229ac0	00230000-55cc-6797-25f6-4aedfbfaaa2a	popa
00240000-55cc-6797-6c24-86c90ed6b12b	00230000-55cc-6797-25f6-4aedfbfaaa2a	oseba
00240000-55cc-6797-f829-ab1b9a686367	00230000-55cc-6797-25f6-4aedfbfaaa2a	sezona
00240000-55cc-6797-8f98-fbf6aaa5eb06	00230000-55cc-6797-631a-1853ecf77b41	prostor
00240000-55cc-6797-f002-814174177dde	00230000-55cc-6797-25f6-4aedfbfaaa2a	besedilo
00240000-55cc-6797-2f2e-4bdc9815e1b7	00230000-55cc-6797-25f6-4aedfbfaaa2a	uprizoritev
00240000-55cc-6797-f1dc-e32b9ffe31da	00230000-55cc-6797-25f6-4aedfbfaaa2a	funkcija
00240000-55cc-6797-75f1-8f0e4bfc1ebd	00230000-55cc-6797-25f6-4aedfbfaaa2a	tipfunkcije
00240000-55cc-6797-6efe-7c1f619c7e9a	00230000-55cc-6797-25f6-4aedfbfaaa2a	alternacija
00240000-55cc-6797-97ce-4bbcd9772beb	00230000-55cc-6797-cf6b-497203d2e8cd	pogodba
00240000-55cc-6797-7e5f-98fb753f9289	00230000-55cc-6797-25f6-4aedfbfaaa2a	zaposlitev
00240000-55cc-6797-d5be-89a4f7bdb54e	00230000-55cc-6797-cf6b-497203d2e8cd	programdela
00240000-55cc-6797-d1ec-bdca0a6cd1e5	00230000-55cc-6797-25f6-4aedfbfaaa2a	zapis
\.


--
-- TOC entry 2944 (class 0 OID 13442115)
-- Dependencies: 230
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 13441845)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55cc-6799-432e-30e8f4cbcf4d	000e0000-55cc-6799-8e44-d70bd56cb987	00080000-55cc-6798-70a5-b902c01d665b	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55cc-6799-ffee-538f5056bda7	000e0000-55cc-6799-8e44-d70bd56cb987	00080000-55cc-6798-70a5-b902c01d665b	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55cc-6799-d073-7c1531c2a972	000e0000-55cc-6799-8e44-d70bd56cb987	00080000-55cc-6798-9698-d3370bcd67c9	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55cc-6799-c299-725f14aa4ed1	000e0000-55cc-6799-8e44-d70bd56cb987	00080000-55cc-6798-9698-d3370bcd67c9	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2894 (class 0 OID 13441505)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2910 (class 0 OID 13441688)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55cc-6799-9657-13a9cd281515	00180000-55cc-6799-2887-23475d6f963f	000c0000-55cc-6799-d57a-4639b3047d18	00090000-55cc-6798-da34-b2e353cf9605	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55cc-6799-6b38-b273a19db18a	00180000-55cc-6799-2887-23475d6f963f	000c0000-55cc-6799-4df7-e3944f29e8d1	00090000-55cc-6798-71d2-f570c67c3adc	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55cc-6799-ba8f-39e0bb58e3fb	00180000-55cc-6799-2887-23475d6f963f	000c0000-55cc-6799-1c3d-4ce03d1b3349	00090000-55cc-6798-739d-5d09128103e5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55cc-6799-cb68-bdaa18fdf55f	00180000-55cc-6799-2887-23475d6f963f	000c0000-55cc-6799-ecac-7182a414d471	00090000-55cc-6798-14b3-992a64e5ba97	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55cc-6799-18b0-0138e42cddf6	00180000-55cc-6799-2887-23475d6f963f	000c0000-55cc-6799-4eb7-a74086f0ccbf	00090000-55cc-6798-4f57-43d2eb8b0972	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55cc-6799-1e0e-7632bab087da	00180000-55cc-6799-27e7-ca0928d2fdec	\N	00090000-55cc-6798-4f57-43d2eb8b0972	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2930 (class 0 OID 13441875)
-- Dependencies: 216
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55cc-6797-5bd4-c62f26b6ef42	Avtor	Avtorji	Avtorka	umetnik
000f0000-55cc-6797-090f-835c1b84f2e0	Priredba	Priredba	Priredba	umetnik
000f0000-55cc-6797-d4b3-4dd809dce838	Prevod	Prevod	Prevod	umetnik
000f0000-55cc-6797-8b3a-542f8aed644b	Režija	Režija	Režija	umetnik
000f0000-55cc-6797-582c-81c5be5989da	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55cc-6797-e217-cb0c8ddbeb00	Scenografija	Scenografija	Scenografija	tehnik
000f0000-55cc-6797-d1bc-97c2f510fb3b	Kostumografija	Kostumografija	Kostumografija	tehnik
000f0000-55cc-6797-0dc5-0c3695e5c8ec	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55cc-6797-0754-412ffa37acab	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	tehnik
000f0000-55cc-6797-a648-c3d2a8fd9be0	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	tehnik
000f0000-55cc-6797-eb74-8e699e3601ee	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55cc-6797-93b0-06a95ac9d09a	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55cc-6797-c181-d4694b1d267c	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	tehnik
000f0000-55cc-6797-365a-7243c10c3205	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	tehnik
000f0000-55cc-6797-0bd1-2ef9495c3efb	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55cc-6797-5a84-a2e64981fe57	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55cc-6797-734d-affb47f8b6ee	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55cc-6797-6317-5fa5c406093b	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2942 (class 0 OID 13442097)
-- Dependencies: 228
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55cc-6797-017f-803372a69a48	01	Velika predstava	f	1.00	1.00
002b0000-55cc-6797-3273-0cdb093047e1	02	Mala predstava	f	0.50	0.50
002b0000-55cc-6797-df56-b028f9cfce9d	03	Mala koprodukcija	t	0.40	1.00
002b0000-55cc-6797-b1bd-c5a1458c2752	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55cc-6797-853a-f57c6c14106b	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2899 (class 0 OID 13441568)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2886 (class 0 OID 13441414)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55cc-6797-dd77-cdf497722a3c	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO5vNsSGe/fvbCQuW9oeqFwQ2psWXYc7G	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55cc-6798-3b4d-a45251d04dd2	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55cc-6798-f049-07d1bed18bf6	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55cc-6798-1c30-4dc28acb47d5	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55cc-6798-59bc-ac08a6745b8f	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55cc-6798-614d-aa38ea75cc13	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55cc-6798-afd1-53c7a43d14e8	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55cc-6798-588e-62049904c01f	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55cc-6798-3a27-347af8a98607	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55cc-6798-1298-9e30338e9c22	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55cc-6798-3d26-0f0602f39e03	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55cc-6797-1742-2b0286a4e4e7	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2934 (class 0 OID 13441923)
-- Dependencies: 220
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55cc-6799-a409-40c5edbf7735	00160000-55cc-6798-daed-2c8d92655e4e	00150000-55cc-6797-6695-a78784b6ad7f	00140000-55cc-6796-6d74-3711d45a0f4b	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55cc-6798-6e19-16e95b8de603
000e0000-55cc-6799-8e44-d70bd56cb987	00160000-55cc-6798-bab0-e6a5777e4076	00150000-55cc-6797-0be2-76f45218ac7c	00140000-55cc-6796-7b75-761369522dc6	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55cc-6798-9d16-a50d9e94c266
000e0000-55cc-6799-94c5-944fe4c02382	\N	00150000-55cc-6797-0be2-76f45218ac7c	00140000-55cc-6796-7b75-761369522dc6	00190000-55cc-6798-8e53-3fecadf6fbc0	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55cc-6798-6e19-16e95b8de603
000e0000-55cc-6799-47bc-8ca68377164a	\N	00150000-55cc-6797-0be2-76f45218ac7c	00140000-55cc-6796-7b75-761369522dc6	00190000-55cc-6798-8e53-3fecadf6fbc0	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55cc-6798-6e19-16e95b8de603
000e0000-55cc-6799-ac19-7bad74cd8077	\N	00150000-55cc-6797-0be2-76f45218ac7c	00140000-55cc-6796-7b75-761369522dc6	00190000-55cc-6798-8e53-3fecadf6fbc0	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55cc-6798-f9c4-6e3667c86ab3
\.


--
-- TOC entry 2904 (class 0 OID 13441630)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55cc-6799-f5bd-8c18206211f5	000e0000-55cc-6799-8e44-d70bd56cb987	1	
00200000-55cc-6799-1ce0-2019d5b5a56a	000e0000-55cc-6799-8e44-d70bd56cb987	2	
\.


--
-- TOC entry 2919 (class 0 OID 13441759)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 13442167)
-- Dependencies: 234
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 13442139)
-- Dependencies: 233
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 13442179)
-- Dependencies: 235
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2926 (class 0 OID 13441828)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55cc-6798-a274-643ea7c0cdcf	00090000-55cc-6798-71d2-f570c67c3adc	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55cc-6798-886b-eeb7412626e7	00090000-55cc-6798-739d-5d09128103e5	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55cc-6798-03a0-5e42591425bc	00090000-55cc-6798-2b24-f052242e941b	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55cc-6798-4266-ffeb78965606	00090000-55cc-6798-70b2-6a5ecf4d51e6	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55cc-6798-bf21-f6b20b7f1a7e	00090000-55cc-6798-da34-b2e353cf9605	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55cc-6798-31fa-5c3b995de070	00090000-55cc-6798-54be-04f44bd797b3	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2906 (class 0 OID 13441662)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 13441913)
-- Dependencies: 219
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55cc-6796-6d74-3711d45a0f4b	01	Drama	drama (SURS 01)
00140000-55cc-6796-f5ee-e4204f9288d4	02	Opera	opera (SURS 02)
00140000-55cc-6796-18d7-21e01a37c03a	03	Balet	balet (SURS 03)
00140000-55cc-6796-89a4-cac803310eac	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55cc-6796-1490-1d126f35d64c	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55cc-6796-7b75-761369522dc6	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55cc-6796-a206-bfc01c303a20	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2925 (class 0 OID 13441818)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55cc-6797-3626-798350f8cec6	01	Opera	opera
00150000-55cc-6797-0305-3c234530f9a2	02	Opereta	opereta
00150000-55cc-6797-ffe7-98677789f278	03	Balet	balet
00150000-55cc-6797-a2ef-58a63111ce94	04	Plesne prireditve	plesne prireditve
00150000-55cc-6797-4fc2-f2bf1521ae54	05	Lutkovno gledališče	lutkovno gledališče
00150000-55cc-6797-97b7-2241a0e6e6a9	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55cc-6797-b1fd-6599f1370073	07	Biografska drama	biografska drama
00150000-55cc-6797-6695-a78784b6ad7f	08	Komedija	komedija
00150000-55cc-6797-4ec7-68f7d5aa536b	09	Črna komedija	črna komedija
00150000-55cc-6797-77c2-aa85ee79982d	10	E-igra	E-igra
00150000-55cc-6797-0be2-76f45218ac7c	11	Kriminalka	kriminalka
00150000-55cc-6797-aebb-ebe68bda74d2	12	Musical	musical
\.


--
-- TOC entry 2436 (class 2606 OID 13441468)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 13441970)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 13441960)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 13441874)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 13442220)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 13441652)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 13441677)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 13442113)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 13441594)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 13442019)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 13441814)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 13441628)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 2606 OID 13441671)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 13441608)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 13441724)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 13442196)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 13442203)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2677 (class 2606 OID 13442228)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 13441751)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 13441566)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 13441477)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 13441501)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 13441457)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2427 (class 2606 OID 13441442)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 13441757)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 13441790)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 13441908)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 13441530)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 13441554)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 13441730)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 13441544)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 13441615)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 13441742)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 13442076)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 13442084)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 13442067)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 13442095)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 13441774)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 13441715)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 13441706)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 13441896)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 13441842)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 13441413)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 13441781)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 13441431)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2429 (class 2606 OID 13441451)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 13441799)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 13441737)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 13441686)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 13442137)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 13442125)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 13442119)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 13441855)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 13441510)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 13441697)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 13441885)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 13442107)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 13441579)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 13441426)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 13441939)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 13441637)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 13441765)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 13442177)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 13442161)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 13442185)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 13441833)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 13441666)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 13441921)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 13441826)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 1259 OID 13441659)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2577 (class 1259 OID 13441856)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2578 (class 1259 OID 13441857)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2663 (class 1259 OID 13442198)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2664 (class 1259 OID 13442197)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2450 (class 1259 OID 13441532)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2542 (class 1259 OID 13441758)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2650 (class 1259 OID 13442165)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2651 (class 1259 OID 13442164)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2652 (class 1259 OID 13442166)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2653 (class 1259 OID 13442163)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2654 (class 1259 OID 13442162)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2536 (class 1259 OID 13441744)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2537 (class 1259 OID 13441743)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2487 (class 1259 OID 13441638)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2564 (class 1259 OID 13441815)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2565 (class 1259 OID 13441817)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2566 (class 1259 OID 13441816)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2475 (class 1259 OID 13441610)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2476 (class 1259 OID 13441609)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2633 (class 1259 OID 13442096)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2587 (class 1259 OID 13441910)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2588 (class 1259 OID 13441911)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2589 (class 1259 OID 13441912)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2660 (class 1259 OID 13442186)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2596 (class 1259 OID 13441944)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2597 (class 1259 OID 13441941)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2598 (class 1259 OID 13441945)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2599 (class 1259 OID 13441943)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2600 (class 1259 OID 13441942)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2465 (class 1259 OID 13441581)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2466 (class 1259 OID 13441580)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2441 (class 1259 OID 13441504)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2552 (class 1259 OID 13441782)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2505 (class 1259 OID 13441672)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2431 (class 1259 OID 13441458)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2432 (class 1259 OID 13441459)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2557 (class 1259 OID 13441802)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2558 (class 1259 OID 13441801)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2559 (class 1259 OID 13441800)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2479 (class 1259 OID 13441616)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2480 (class 1259 OID 13441618)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2481 (class 1259 OID 13441617)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 13442127)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2516 (class 1259 OID 13441710)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2517 (class 1259 OID 13441708)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2518 (class 1259 OID 13441707)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2519 (class 1259 OID 13441709)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2422 (class 1259 OID 13441432)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2423 (class 1259 OID 13441433)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2545 (class 1259 OID 13441766)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2673 (class 1259 OID 13442221)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2674 (class 1259 OID 13442229)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2675 (class 1259 OID 13442230)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2531 (class 1259 OID 13441731)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2573 (class 1259 OID 13441843)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2574 (class 1259 OID 13441844)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2617 (class 1259 OID 13442024)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2618 (class 1259 OID 13442023)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2619 (class 1259 OID 13442020)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2620 (class 1259 OID 13442021)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2621 (class 1259 OID 13442022)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2454 (class 1259 OID 13441546)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2455 (class 1259 OID 13441545)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2456 (class 1259 OID 13441547)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2625 (class 1259 OID 13442077)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2626 (class 1259 OID 13442078)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2610 (class 1259 OID 13441974)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2611 (class 1259 OID 13441975)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2612 (class 1259 OID 13441972)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2613 (class 1259 OID 13441973)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2570 (class 1259 OID 13441834)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2522 (class 1259 OID 13441719)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2523 (class 1259 OID 13441718)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2524 (class 1259 OID 13441716)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2525 (class 1259 OID 13441717)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 13441962)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2607 (class 1259 OID 13441961)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2622 (class 1259 OID 13442068)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2486 (class 1259 OID 13441629)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2640 (class 1259 OID 13442114)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2667 (class 1259 OID 13442204)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2668 (class 1259 OID 13442205)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2437 (class 1259 OID 13441479)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2438 (class 1259 OID 13441478)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2446 (class 1259 OID 13441511)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 13441512)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2511 (class 1259 OID 13441700)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2512 (class 1259 OID 13441699)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2513 (class 1259 OID 13441698)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2493 (class 1259 OID 13441661)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2494 (class 1259 OID 13441657)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2495 (class 1259 OID 13441654)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2496 (class 1259 OID 13441655)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2497 (class 1259 OID 13441653)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2498 (class 1259 OID 13441658)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2499 (class 1259 OID 13441656)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2453 (class 1259 OID 13441531)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2471 (class 1259 OID 13441595)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2472 (class 1259 OID 13441597)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2473 (class 1259 OID 13441596)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2474 (class 1259 OID 13441598)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2530 (class 1259 OID 13441725)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2592 (class 1259 OID 13441909)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 13441940)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2444 (class 1259 OID 13441502)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2445 (class 1259 OID 13441503)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2567 (class 1259 OID 13441827)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 13442138)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2464 (class 1259 OID 13441567)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 13442126)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2550 (class 1259 OID 13441776)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2551 (class 1259 OID 13441775)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 13441971)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2461 (class 1259 OID 13441555)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 13441922)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2657 (class 1259 OID 13442178)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2631 (class 1259 OID 13442085)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2632 (class 1259 OID 13442086)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2510 (class 1259 OID 13441687)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2430 (class 1259 OID 13441452)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2500 (class 1259 OID 13441660)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2703 (class 2606 OID 13442366)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2706 (class 2606 OID 13442351)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2705 (class 2606 OID 13442356)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2701 (class 2606 OID 13442376)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2707 (class 2606 OID 13442346)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2702 (class 2606 OID 13442371)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2704 (class 2606 OID 13442361)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2737 (class 2606 OID 13442521)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2736 (class 2606 OID 13442526)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2770 (class 2606 OID 13442696)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2771 (class 2606 OID 13442691)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2688 (class 2606 OID 13442281)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2724 (class 2606 OID 13442461)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2765 (class 2606 OID 13442676)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2766 (class 2606 OID 13442671)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2764 (class 2606 OID 13442681)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2767 (class 2606 OID 13442666)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2768 (class 2606 OID 13442661)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2722 (class 2606 OID 13442456)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2723 (class 2606 OID 13442451)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2700 (class 2606 OID 13442341)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2732 (class 2606 OID 13442491)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2730 (class 2606 OID 13442501)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2731 (class 2606 OID 13442496)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2694 (class 2606 OID 13442316)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2695 (class 2606 OID 13442311)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2720 (class 2606 OID 13442441)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2761 (class 2606 OID 13442646)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2740 (class 2606 OID 13442531)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2739 (class 2606 OID 13442536)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2738 (class 2606 OID 13442541)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2769 (class 2606 OID 13442686)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2742 (class 2606 OID 13442561)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2745 (class 2606 OID 13442546)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2741 (class 2606 OID 13442566)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2743 (class 2606 OID 13442556)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2744 (class 2606 OID 13442551)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2692 (class 2606 OID 13442306)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2693 (class 2606 OID 13442301)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2684 (class 2606 OID 13442266)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2685 (class 2606 OID 13442261)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2726 (class 2606 OID 13442471)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2708 (class 2606 OID 13442381)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2681 (class 2606 OID 13442241)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2680 (class 2606 OID 13442246)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2727 (class 2606 OID 13442486)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2728 (class 2606 OID 13442481)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2729 (class 2606 OID 13442476)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2698 (class 2606 OID 13442321)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2696 (class 2606 OID 13442331)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2697 (class 2606 OID 13442326)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2763 (class 2606 OID 13442656)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2712 (class 2606 OID 13442416)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2714 (class 2606 OID 13442406)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2715 (class 2606 OID 13442401)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2713 (class 2606 OID 13442411)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2679 (class 2606 OID 13442231)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2678 (class 2606 OID 13442236)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2725 (class 2606 OID 13442466)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2774 (class 2606 OID 13442711)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2776 (class 2606 OID 13442716)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2775 (class 2606 OID 13442721)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2721 (class 2606 OID 13442446)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2735 (class 2606 OID 13442511)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2734 (class 2606 OID 13442516)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2752 (class 2606 OID 13442621)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2753 (class 2606 OID 13442616)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2756 (class 2606 OID 13442601)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2755 (class 2606 OID 13442606)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2754 (class 2606 OID 13442611)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2690 (class 2606 OID 13442291)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2691 (class 2606 OID 13442286)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2689 (class 2606 OID 13442296)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2759 (class 2606 OID 13442631)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2758 (class 2606 OID 13442636)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2749 (class 2606 OID 13442591)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2748 (class 2606 OID 13442596)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2751 (class 2606 OID 13442581)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2750 (class 2606 OID 13442586)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2733 (class 2606 OID 13442506)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2716 (class 2606 OID 13442436)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2717 (class 2606 OID 13442431)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2719 (class 2606 OID 13442421)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2718 (class 2606 OID 13442426)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2746 (class 2606 OID 13442576)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2747 (class 2606 OID 13442571)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2757 (class 2606 OID 13442626)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2699 (class 2606 OID 13442336)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2760 (class 2606 OID 13442641)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2762 (class 2606 OID 13442651)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2773 (class 2606 OID 13442701)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2772 (class 2606 OID 13442706)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2682 (class 2606 OID 13442256)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2683 (class 2606 OID 13442251)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2687 (class 2606 OID 13442271)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2686 (class 2606 OID 13442276)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2709 (class 2606 OID 13442396)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2710 (class 2606 OID 13442391)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2711 (class 2606 OID 13442386)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-13 11:47:06 CEST

--
-- PostgreSQL database dump complete
--

