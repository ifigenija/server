--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-21 08:49:23 CEST

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
-- TOC entry 177 (class 1259 OID 15139111)
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
-- TOC entry 222 (class 1259 OID 15139614)
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
-- TOC entry 221 (class 1259 OID 15139597)
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
-- TOC entry 215 (class 1259 OID 15139509)
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
-- TOC entry 238 (class 1259 OID 15139858)
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
-- TOC entry 191 (class 1259 OID 15139290)
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
-- TOC entry 194 (class 1259 OID 15139324)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 15139760)
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
-- TOC entry 186 (class 1259 OID 15139233)
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
-- TOC entry 223 (class 1259 OID 15139627)
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
-- TOC entry 210 (class 1259 OID 15139454)
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
-- TOC entry 189 (class 1259 OID 15139270)
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
-- TOC entry 193 (class 1259 OID 15139318)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 15139250)
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
-- TOC entry 199 (class 1259 OID 15139371)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 236 (class 1259 OID 15139839)
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
-- TOC entry 237 (class 1259 OID 15139851)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 15139873)
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
-- TOC entry 203 (class 1259 OID 15139396)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 15139207)
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
-- TOC entry 178 (class 1259 OID 15139120)
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
-- TOC entry 179 (class 1259 OID 15139131)
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
-- TOC entry 174 (class 1259 OID 15139085)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 15139104)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 15139403)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 15139434)
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
-- TOC entry 218 (class 1259 OID 15139548)
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
-- TOC entry 181 (class 1259 OID 15139164)
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
-- TOC entry 183 (class 1259 OID 15139199)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 15139377)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 15139184)
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
-- TOC entry 188 (class 1259 OID 15139262)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 15139389)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 15139721)
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
-- TOC entry 226 (class 1259 OID 15139731)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 224 (class 1259 OID 15139677)
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
-- TOC entry 227 (class 1259 OID 15139739)
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
-- TOC entry 206 (class 1259 OID 15139418)
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
-- TOC entry 198 (class 1259 OID 15139362)
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
-- TOC entry 197 (class 1259 OID 15139352)
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
-- TOC entry 217 (class 1259 OID 15139537)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 15139486)
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
-- TOC entry 171 (class 1259 OID 15139056)
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
-- TOC entry 170 (class 1259 OID 15139054)
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
-- TOC entry 207 (class 1259 OID 15139428)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 15139094)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 15139078)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 15139442)
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
-- TOC entry 201 (class 1259 OID 15139383)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 15139329)
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
-- TOC entry 232 (class 1259 OID 15139780)
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
-- TOC entry 231 (class 1259 OID 15139772)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 15139767)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 15139496)
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
-- TOC entry 180 (class 1259 OID 15139156)
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
-- TOC entry 196 (class 1259 OID 15139339)
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
-- TOC entry 216 (class 1259 OID 15139526)
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
-- TOC entry 228 (class 1259 OID 15139749)
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
-- TOC entry 185 (class 1259 OID 15139219)
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
-- TOC entry 172 (class 1259 OID 15139065)
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
-- TOC entry 220 (class 1259 OID 15139574)
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
-- TOC entry 190 (class 1259 OID 15139281)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 15139410)
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
-- TOC entry 234 (class 1259 OID 15139819)
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
-- TOC entry 233 (class 1259 OID 15139791)
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
-- TOC entry 235 (class 1259 OID 15139831)
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
-- TOC entry 212 (class 1259 OID 15139479)
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
-- TOC entry 192 (class 1259 OID 15139313)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 15139564)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 15139469)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2170 (class 2604 OID 15139059)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2891 (class 0 OID 15139111)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 15139614)
-- Dependencies: 222
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55d6-c9f2-f187-6d8cf6c77ced	000d0000-55d6-c9f2-15d9-86d1b1a6b851	\N	00090000-55d6-c9f2-5d52-df3f29b8bfc6	000b0000-55d6-c9f2-7501-1710df7deb94	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55d6-c9f2-8401-b03831a4d218	000d0000-55d6-c9f2-5415-b07a17b2a1a3	00100000-55d6-c9f2-73f3-7aca1493b6c3	00090000-55d6-c9f2-6759-c0229b9f5fe0	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55d6-c9f2-3fb1-b6b8a0418515	000d0000-55d6-c9f2-ca67-f027d744e796	00100000-55d6-c9f2-5466-1946667df502	00090000-55d6-c9f2-6e0b-68c1d99b96b0	\N	0003	t	\N	2015-08-21	\N	2	\N	\N	f	f
000c0000-55d6-c9f2-3620-700eb12e5530	000d0000-55d6-c9f2-85e2-aa97b2ec149e	\N	00090000-55d6-c9f2-e7eb-2757439f796b	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55d6-c9f2-1532-ae0ac7199e03	000d0000-55d6-c9f2-1e4f-ccbaf1da83e3	\N	00090000-55d6-c9f2-bf7b-7c742b2adae0	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55d6-c9f2-f0c2-449d11ec9598	000d0000-55d6-c9f2-50c3-c680eadafc8b	\N	00090000-55d6-c9f2-1218-4ad9d0253ec5	000b0000-55d6-c9f2-df0b-db951e2f6e59	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55d6-c9f2-8862-934a28979fc8	000d0000-55d6-c9f2-7b38-33c805367dc9	00100000-55d6-c9f2-dbbb-fe961b6c64f9	00090000-55d6-c9f2-eee8-d6208ce3a44c	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55d6-c9f2-9390-01ca47b5f3ef	000d0000-55d6-c9f2-0c1e-dd12cdc0e320	\N	00090000-55d6-c9f2-bb43-bc872dd94c1c	000b0000-55d6-c9f2-b5de-435451c74b30	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55d6-c9f2-df78-49c45f6fe69d	000d0000-55d6-c9f2-7b38-33c805367dc9	00100000-55d6-c9f2-9b80-4c57fbe8a5ec	00090000-55d6-c9f2-7a7a-2cb94cb47d3d	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55d6-c9f2-236b-0a4e9acdbb61	000d0000-55d6-c9f2-7b38-33c805367dc9	00100000-55d6-c9f2-95de-76650f84eef4	00090000-55d6-c9f2-17fb-9b3c9ebce5cd	\N	0010	t	\N	2015-08-21	\N	16	\N	\N	f	t
000c0000-55d6-c9f2-9734-00a28a1eb6f6	000d0000-55d6-c9f2-7b38-33c805367dc9	00100000-55d6-c9f2-8a1f-28dda242d030	00090000-55d6-c9f2-2b52-b6615adb474b	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2935 (class 0 OID 15139597)
-- Dependencies: 221
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 15139509)
-- Dependencies: 215
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55d6-c9f1-f61f-5d81c77e94a7	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55d6-c9f1-e044-a491493c5605	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55d6-c9f1-020a-da49c743128a	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2952 (class 0 OID 15139858)
-- Dependencies: 238
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 15139290)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55d6-c9f2-a734-b0434ad0ad25	\N	\N	00200000-55d6-c9f2-110c-e52e2dde196f	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55d6-c9f2-653c-06a0068f5168	\N	\N	00200000-55d6-c9f2-8262-5f0ae4e5f237	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55d6-c9f2-527c-3054c4141330	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55d6-c9f2-74ae-f83d1044a17f	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55d6-c9f2-e8a0-bfbd9d89800c	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2908 (class 0 OID 15139324)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2943 (class 0 OID 15139760)
-- Dependencies: 229
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 15139233)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55d6-c9ef-8983-db06892f3338	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55d6-c9ef-aa57-88d505f3f968	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55d6-c9ef-b7fd-7466ec3503ba	AL	ALB	008	Albania 	Albanija	\N
00040000-55d6-c9ef-6203-710c43ba490d	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55d6-c9ef-f830-5d82cce4ceac	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55d6-c9ef-a03d-f63de40c4b11	AD	AND	020	Andorra 	Andora	\N
00040000-55d6-c9ef-51a5-6a842fa3bc77	AO	AGO	024	Angola 	Angola	\N
00040000-55d6-c9ef-7c48-1470e2d3d266	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55d6-c9ef-74bc-8a9c8551aeaf	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55d6-c9ef-b2d2-e7a33c103f86	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55d6-c9ef-45be-e2601d995858	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55d6-c9ef-5184-a17fced4c827	AM	ARM	051	Armenia 	Armenija	\N
00040000-55d6-c9ef-1100-655adc18b957	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55d6-c9ef-2d57-630b04355726	AU	AUS	036	Australia 	Avstralija	\N
00040000-55d6-c9ef-c4ec-1d519755556a	AT	AUT	040	Austria 	Avstrija	\N
00040000-55d6-c9ef-8804-ee79c4a2cd80	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55d6-c9ef-9db1-1ce4c46fd80a	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55d6-c9ef-aae9-d0c6b2fb0874	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55d6-c9ef-8379-32d97c3506a3	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55d6-c9ef-41c0-6fa6938050be	BB	BRB	052	Barbados 	Barbados	\N
00040000-55d6-c9ef-3a6c-807fe0b3d1e6	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55d6-c9ef-0dd0-c800bbeb9bd4	BE	BEL	056	Belgium 	Belgija	\N
00040000-55d6-c9ef-f806-de5f374e896c	BZ	BLZ	084	Belize 	Belize	\N
00040000-55d6-c9ef-4d51-91e79de24331	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55d6-c9ef-2bce-47df10a9ca48	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55d6-c9ef-1865-f6b896d1d395	BT	BTN	064	Bhutan 	Butan	\N
00040000-55d6-c9ef-be39-b5dfa46333ef	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55d6-c9ef-d2a6-054d318b416a	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55d6-c9ef-f3a2-6787490b4486	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55d6-c9ef-7e41-afd617b3ed48	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55d6-c9ef-5c3c-91177a698d01	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55d6-c9ef-023a-ebffcb2c50c3	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55d6-c9ef-16e5-eab836952b8c	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55d6-c9ef-2413-d53070edd316	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55d6-c9ef-76be-3616a3d8ad55	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55d6-c9ef-6bab-dece3b34f5d0	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55d6-c9ef-dd6c-8bebebe9e4f7	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55d6-c9ef-7507-1ff9ad477efc	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55d6-c9ef-9583-74d68aac01ee	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55d6-c9ef-a1ee-cb349185c3a1	CA	CAN	124	Canada 	Kanada	\N
00040000-55d6-c9ef-6b6b-049386edae73	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55d6-c9ef-17f1-146c8176045a	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55d6-c9ef-844d-b1714e3e39ad	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55d6-c9ef-1ea7-15bc28ba60fe	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55d6-c9ef-4d11-869aba6883be	CL	CHL	152	Chile 	Čile	\N
00040000-55d6-c9f0-81ef-0bea59a009f0	CN	CHN	156	China 	Kitajska	\N
00040000-55d6-c9f0-2a60-03e8d6e2c606	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55d6-c9f0-a997-50aed05d62e7	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55d6-c9f0-426d-8df67d825c35	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55d6-c9f0-c648-05ab59f55edc	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55d6-c9f0-6aa5-fecd3b964ad3	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55d6-c9f0-e742-01c071d37fef	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55d6-c9f0-5143-3cf7097c3d47	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55d6-c9f0-5464-03a5f38406a5	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55d6-c9f0-a4e8-b7e658bbab62	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55d6-c9f0-1a38-ced676b0287c	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55d6-c9f0-57f5-7cb6b3a4f07c	CU	CUB	192	Cuba 	Kuba	\N
00040000-55d6-c9f0-a2f0-485453744d10	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55d6-c9f0-caac-da38cbb448e4	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55d6-c9f0-5b77-1c5ddfc62a5a	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55d6-c9f0-895d-bd2055a3e95e	DK	DNK	208	Denmark 	Danska	\N
00040000-55d6-c9f0-d471-917936efb5e9	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55d6-c9f0-ff19-2c34de403d56	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55d6-c9f0-e8db-9d7d266daa06	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55d6-c9f0-5789-77fdfd66149c	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55d6-c9f0-b7e8-c7c5f2386fc4	EG	EGY	818	Egypt 	Egipt	\N
00040000-55d6-c9f0-4509-a421c672559d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55d6-c9f0-7159-130309f1e9a7	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55d6-c9f0-f5a0-f8c0d3d3b876	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55d6-c9f0-4597-6e46abcf2721	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55d6-c9f0-29cd-8cdbfb934983	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55d6-c9f0-9338-68b61313699a	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55d6-c9f0-97e4-b82eabc9dbf6	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55d6-c9f0-dd41-fac54e76aa02	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55d6-c9f0-8035-7450af0589d5	FI	FIN	246	Finland 	Finska	\N
00040000-55d6-c9f0-7a4d-743afee5e4e8	FR	FRA	250	France 	Francija	\N
00040000-55d6-c9f0-a295-06cf0f54f72e	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55d6-c9f0-b23d-6290ccfa79d6	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55d6-c9f0-3235-5194c2e623d7	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55d6-c9f0-9d0e-daceb2b0a020	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55d6-c9f0-248a-29cb6cc8f384	GA	GAB	266	Gabon 	Gabon	\N
00040000-55d6-c9f0-bfdc-d1a0c7c29fa4	GM	GMB	270	Gambia 	Gambija	\N
00040000-55d6-c9f0-357c-de6bd796eb0b	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55d6-c9f0-7d28-1d5b3de8d472	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55d6-c9f0-063c-1f5ee922a192	GH	GHA	288	Ghana 	Gana	\N
00040000-55d6-c9f0-1398-0448fb06c1c9	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55d6-c9f0-6597-b691c72280ce	GR	GRC	300	Greece 	Grčija	\N
00040000-55d6-c9f0-a217-d1395fa24b88	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55d6-c9f0-e9ae-7aba4a3eafa9	GD	GRD	308	Grenada 	Grenada	\N
00040000-55d6-c9f0-7a87-7755e0920745	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55d6-c9f0-4c80-f644588f4559	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55d6-c9f0-80ab-5be0e9e6ebf6	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55d6-c9f0-6502-71f2378e86cd	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55d6-c9f0-df2c-183cc4622c8b	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55d6-c9f0-4aaa-50bb86745bf6	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55d6-c9f0-4bdd-09bac9614386	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55d6-c9f0-1521-8d4d341b2d2d	HT	HTI	332	Haiti 	Haiti	\N
00040000-55d6-c9f0-8868-f38690dfbc26	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55d6-c9f0-ebc3-6ece5e47e361	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55d6-c9f0-8010-b5699dc7f359	HN	HND	340	Honduras 	Honduras	\N
00040000-55d6-c9f0-15b2-003d709d10ab	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55d6-c9f0-c6bd-6a5bd6f6865a	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55d6-c9f0-77e0-2c7552450aaf	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55d6-c9f0-44fa-4e73897317ed	IN	IND	356	India 	Indija	\N
00040000-55d6-c9f0-64d3-fa6403136e18	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55d6-c9f0-f145-106f2fda1ae1	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55d6-c9f0-f8e2-784ff1b3e7fd	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55d6-c9f0-8b4c-ae2e1ddf2575	IE	IRL	372	Ireland 	Irska	\N
00040000-55d6-c9f0-9d85-00e655ba30cc	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55d6-c9f0-c4ce-d3e8f81a4642	IL	ISR	376	Israel 	Izrael	\N
00040000-55d6-c9f0-0b41-58b8bc874346	IT	ITA	380	Italy 	Italija	\N
00040000-55d6-c9f0-e6e7-aa6b6e122e96	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55d6-c9f0-04b4-686e6f182287	JP	JPN	392	Japan 	Japonska	\N
00040000-55d6-c9f0-3b1c-184648f9bfd0	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55d6-c9f0-0e8d-7995b4f30025	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55d6-c9f0-de9e-4875b2514da5	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55d6-c9f0-e50d-1d21cc4160d3	KE	KEN	404	Kenya 	Kenija	\N
00040000-55d6-c9f0-e9e1-99bc8125422b	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55d6-c9f0-fb53-fcd080bc22de	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55d6-c9f0-06bf-153520eb140b	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55d6-c9f0-3f54-15794e0f65d6	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55d6-c9f0-71e9-97d12bc0e9f2	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55d6-c9f0-74ec-f2d420cbe9f8	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55d6-c9f0-b30f-e46cd0d42d2f	LV	LVA	428	Latvia 	Latvija	\N
00040000-55d6-c9f0-559d-e9f6199b51bd	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55d6-c9f0-eb29-89f54d281a39	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55d6-c9f0-580a-543434946156	LR	LBR	430	Liberia 	Liberija	\N
00040000-55d6-c9f0-a230-befb34aeb0dc	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55d6-c9f0-e16b-5d4bfbb2f62d	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55d6-c9f0-b163-fcc64425fb35	LT	LTU	440	Lithuania 	Litva	\N
00040000-55d6-c9f0-49d6-e039f0bee520	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55d6-c9f0-40d5-e5066d0d5837	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55d6-c9f0-cad7-0fa68caac53c	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55d6-c9f0-84e0-f89e0f7f5aae	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55d6-c9f0-d8a1-5d5cd907dd07	MW	MWI	454	Malawi 	Malavi	\N
00040000-55d6-c9f0-0279-f00ffc1b273b	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55d6-c9f0-0542-cde4a29a3cce	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55d6-c9f0-33e8-11121da39a5a	ML	MLI	466	Mali 	Mali	\N
00040000-55d6-c9f0-6362-a4c5e361386b	MT	MLT	470	Malta 	Malta	\N
00040000-55d6-c9f0-810c-dbdd45e846c6	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55d6-c9f0-8c09-89a7f462b601	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55d6-c9f0-dd1f-15eb91b2c462	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55d6-c9f0-bcd1-07a359001946	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55d6-c9f0-235a-fdeb8b88c668	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55d6-c9f0-62bf-e07c1b2a08b2	MX	MEX	484	Mexico 	Mehika	\N
00040000-55d6-c9f0-4b58-1cdbf5dae80f	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55d6-c9f0-4a96-c416f8830cd7	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55d6-c9f0-1bbe-cbe65036c9ea	MC	MCO	492	Monaco 	Monako	\N
00040000-55d6-c9f0-af30-d11bb06d3fc7	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55d6-c9f0-dfb8-a37dc110b3c8	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55d6-c9f0-95e9-f3f1165c3b75	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55d6-c9f0-f64f-2c5526e086ed	MA	MAR	504	Morocco 	Maroko	\N
00040000-55d6-c9f0-1e12-3a009055a750	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55d6-c9f0-dea8-68a8e62c9bb5	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55d6-c9f0-1f68-74d6955b7615	NA	NAM	516	Namibia 	Namibija	\N
00040000-55d6-c9f0-09ae-e8cc9eaae828	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55d6-c9f0-0e2d-dd861ea16fa2	NP	NPL	524	Nepal 	Nepal	\N
00040000-55d6-c9f0-bfca-b8becbb9e658	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55d6-c9f0-80ff-0c7d6352964a	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55d6-c9f0-c009-0c11235c49d6	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55d6-c9f0-2856-bf93dfbbaa35	NE	NER	562	Niger 	Niger 	\N
00040000-55d6-c9f0-ac63-8a12658b46ee	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55d6-c9f0-dd59-cd48a6b07815	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55d6-c9f0-5dae-0bc4879a9f38	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55d6-c9f0-4769-79ec7ffbeb7c	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55d6-c9f0-8560-8e9f0d2de80d	NO	NOR	578	Norway 	Norveška	\N
00040000-55d6-c9f0-f735-1ed8863837a3	OM	OMN	512	Oman 	Oman	\N
00040000-55d6-c9f0-b06a-0130e95f7457	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55d6-c9f0-1946-eb02c6c218e3	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55d6-c9f0-0b29-6c4371467788	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55d6-c9f0-8b12-8ad8ce8f1c99	PA	PAN	591	Panama 	Panama	\N
00040000-55d6-c9f0-5030-c948d492dbf4	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55d6-c9f0-48c6-a56fce898404	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55d6-c9f0-2bed-574e5945a15f	PE	PER	604	Peru 	Peru	\N
00040000-55d6-c9f0-0f9d-632fc5b7ab87	PH	PHL	608	Philippines 	Filipini	\N
00040000-55d6-c9f0-348b-6a5a5d8c2f31	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55d6-c9f0-d09b-3a40e4bc2a53	PL	POL	616	Poland 	Poljska	\N
00040000-55d6-c9f0-9f88-f681afb8fdb9	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55d6-c9f0-5b6e-5aa6d21941b9	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55d6-c9f0-8be1-e25f0a689ce7	QA	QAT	634	Qatar 	Katar	\N
00040000-55d6-c9f0-4b0c-2a2238a884dc	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55d6-c9f0-d842-72f270053882	RO	ROU	642	Romania 	Romunija	\N
00040000-55d6-c9f0-6138-c7399d76d721	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55d6-c9f0-ebf5-7adfc250ef93	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55d6-c9f0-2b32-6ab02a8ee03f	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55d6-c9f0-0ce5-2fbf080190d5	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55d6-c9f0-9731-336763f8fcbf	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55d6-c9f0-8561-5f9d660196fd	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55d6-c9f0-4bd2-0910ac8e9667	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55d6-c9f0-41cf-b600a5eb9e8b	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55d6-c9f0-9c6c-001ea4f42d68	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55d6-c9f0-28fc-4d49abefd1a9	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55d6-c9f0-589e-b349e9ba351c	SM	SMR	674	San Marino 	San Marino	\N
00040000-55d6-c9f0-0b0d-3289c5400ea5	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55d6-c9f0-650e-4526751f3303	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55d6-c9f0-223e-8e7c73417c01	SN	SEN	686	Senegal 	Senegal	\N
00040000-55d6-c9f0-25fe-1540e41e57c4	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55d6-c9f0-cde9-e92798abf365	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55d6-c9f0-acc0-61afc352d54b	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55d6-c9f0-e572-2156e157b5ba	SG	SGP	702	Singapore 	Singapur	\N
00040000-55d6-c9f0-6b69-33ad7f1cf9b5	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55d6-c9f0-a26c-8d637b7b6d3b	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55d6-c9f0-1c09-99083dcc93b3	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55d6-c9f0-29ab-2579250641be	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55d6-c9f0-7c2c-18e47c8dabb9	SO	SOM	706	Somalia 	Somalija	\N
00040000-55d6-c9f0-2aa6-52ca00f50db8	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55d6-c9f0-fcbe-4c27f4e86bce	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55d6-c9f0-50f0-38aa2646d40f	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55d6-c9f0-156b-e1537fea0c81	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55d6-c9f0-a8c1-dc3edf9ba1a6	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55d6-c9f0-71ea-361f0aaf386b	SD	SDN	729	Sudan 	Sudan	\N
00040000-55d6-c9f0-e008-8de134e23893	SR	SUR	740	Suriname 	Surinam	\N
00040000-55d6-c9f0-0bb4-8f67ca76dae2	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55d6-c9f0-466c-1bcb2d3306cd	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55d6-c9f0-bd07-674064aecd2e	SE	SWE	752	Sweden 	Švedska	\N
00040000-55d6-c9f0-1941-ac2419d66177	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55d6-c9f0-3a75-e5764dc71a8c	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55d6-c9f0-7b55-ecdcd8f5a91d	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55d6-c9f0-48dd-6b250343867d	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55d6-c9f0-b4ed-6eec585e14eb	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55d6-c9f0-3047-98fea637cf63	TH	THA	764	Thailand 	Tajska	\N
00040000-55d6-c9f0-392b-f9df75fa454f	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55d6-c9f0-a083-6dd2f19ec676	TG	TGO	768	Togo 	Togo	\N
00040000-55d6-c9f0-8f13-487f43f5da4a	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55d6-c9f0-ca12-dd83bbb4c090	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55d6-c9f0-9368-547f22f1df72	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55d6-c9f0-4dda-2c04e9c0f879	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55d6-c9f0-fcf5-68856f69eebb	TR	TUR	792	Turkey 	Turčija	\N
00040000-55d6-c9f0-5cbf-2129995e2732	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55d6-c9f0-1582-4031d25b2ab8	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55d6-c9f0-b462-cd01ecfc24b3	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55d6-c9f0-4864-609152ca6b0f	UG	UGA	800	Uganda 	Uganda	\N
00040000-55d6-c9f0-a2eb-f85cb0775684	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55d6-c9f0-d57c-ca5561256396	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55d6-c9f0-3d92-0d461cbe4839	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55d6-c9f0-50e8-f814d4930fbd	US	USA	840	United States 	Združene države Amerike	\N
00040000-55d6-c9f0-18db-2a9ccfe476d8	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55d6-c9f0-b580-a6d8953ca3b9	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55d6-c9f0-9510-23cc39964542	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55d6-c9f0-6806-46a9a0138c3c	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55d6-c9f0-6b0f-32373d1547fd	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55d6-c9f0-93c4-c4e4ae372172	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55d6-c9f0-0a8c-4535f8fd99b9	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55d6-c9f0-c971-9277e30cf60b	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55d6-c9f0-be5e-a7024b71a38e	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55d6-c9f0-81be-c6a412db5b73	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55d6-c9f0-658f-caffe041a677	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55d6-c9f0-65b2-1112f3548916	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55d6-c9f0-734c-1555725f850e	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2937 (class 0 OID 15139627)
-- Dependencies: 223
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55d6-c9f2-90c0-40cedba50c33	000e0000-55d6-c9f2-2f90-3feb707b4cce	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55d6-c9f1-7435-593334ae8d96	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55d6-c9f2-a931-786e96c0f7f9	000e0000-55d6-c9f2-0290-0e9e0df86b25	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55d6-c9f1-8cb5-c17859f66450	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55d6-c9f2-2c46-b0123871fabe	000e0000-55d6-c9f2-b22f-84db5fbcb41b	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55d6-c9f1-7435-593334ae8d96	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55d6-c9f2-8dc3-f3b5c984a24f	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55d6-c9f2-fad2-2a8cf34881d6	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2924 (class 0 OID 15139454)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55d6-c9f2-7b38-33c805367dc9	000e0000-55d6-c9f2-0290-0e9e0df86b25	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55d6-c9f1-776e-8e73af412aa0
000d0000-55d6-c9f2-15d9-86d1b1a6b851	000e0000-55d6-c9f2-0290-0e9e0df86b25	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55d6-c9f1-776e-8e73af412aa0
000d0000-55d6-c9f2-5415-b07a17b2a1a3	000e0000-55d6-c9f2-0290-0e9e0df86b25	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55d6-c9f1-e3ef-b5dfd2f5704d
000d0000-55d6-c9f2-ca67-f027d744e796	000e0000-55d6-c9f2-0290-0e9e0df86b25	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55d6-c9f1-fc67-7323d07fc787
000d0000-55d6-c9f2-85e2-aa97b2ec149e	000e0000-55d6-c9f2-0290-0e9e0df86b25	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55d6-c9f1-8cc5-cede012042e1
000d0000-55d6-c9f2-1e4f-ccbaf1da83e3	000e0000-55d6-c9f2-0290-0e9e0df86b25	\N	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55d6-c9f1-8cc5-cede012042e1
000d0000-55d6-c9f2-50c3-c680eadafc8b	000e0000-55d6-c9f2-0290-0e9e0df86b25	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55d6-c9f1-776e-8e73af412aa0
000d0000-55d6-c9f2-0c1e-dd12cdc0e320	000e0000-55d6-c9f2-0290-0e9e0df86b25	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55d6-c9f1-9395-476970d9ed0b
\.


--
-- TOC entry 2903 (class 0 OID 15139270)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 15139318)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 15139250)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55d6-c9f2-1e55-1509ddf1a94b	00080000-55d6-c9f1-e272-e798c83c5248	00090000-55d6-c9f2-17fb-9b3c9ebce5cd	AK		
\.


--
-- TOC entry 2913 (class 0 OID 15139371)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 15139839)
-- Dependencies: 236
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 15139851)
-- Dependencies: 237
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 15139873)
-- Dependencies: 239
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2917 (class 0 OID 15139396)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 15139207)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55d6-c9f0-65db-98ea7b0c061d	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55d6-c9f0-6edb-3afd0750b373	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55d6-c9f0-23b8-2586ea5e86a7	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55d6-c9f0-6177-9c7eed360299	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55d6-c9f0-77be-6fc3a632f20e	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55d6-c9f0-dc24-aa2e1995d879	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55d6-c9f0-0607-8a893c425003	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55d6-c9f0-a941-150bee3e9368	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55d6-c9f0-d28b-650017fcba27	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55d6-c9f0-a430-2670b75dfbd9	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55d6-c9f0-10d9-5a49525df4fa	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55d6-c9f0-1a4a-55ec656d3561	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55d6-c9f0-cf59-7cad22e93838	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55d6-c9f0-bc04-e995c003f9b9	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55d6-c9f1-eab4-a0a3bc25d4a5	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55d6-c9f1-a84a-812f2064d874	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55d6-c9f1-6c59-c5c4d9168779	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55d6-c9f1-7121-32fb228622ee	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55d6-c9f1-e551-4c259f5cbdad	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55d6-c9f1-515a-1f5cefdc7d30	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2892 (class 0 OID 15139120)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55d6-c9f1-2179-8c3daf23162b	00000000-55d6-c9f1-a84a-812f2064d874	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55d6-c9f1-fb7d-92e49a03bd39	00000000-55d6-c9f1-a84a-812f2064d874	00010000-55d6-c9f0-fe17-7f7d6e670ddb	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55d6-c9f1-9dfe-906789a62dc3	00000000-55d6-c9f1-6c59-c5c4d9168779	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2893 (class 0 OID 15139131)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55d6-c9f2-5d52-df3f29b8bfc6	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55d6-c9f2-e7eb-2757439f796b	00010000-55d6-c9f2-5790-43637bafec23	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55d6-c9f2-6e0b-68c1d99b96b0	00010000-55d6-c9f2-9c52-152e7a380a47	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55d6-c9f2-7a7a-2cb94cb47d3d	00010000-55d6-c9f2-fe04-5767559d32fb	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55d6-c9f2-b4a7-c29fb128d85c	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55d6-c9f2-1218-4ad9d0253ec5	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55d6-c9f2-2b52-b6615adb474b	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55d6-c9f2-eee8-d6208ce3a44c	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55d6-c9f2-17fb-9b3c9ebce5cd	00010000-55d6-c9f2-389b-bd40886efeb7	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55d6-c9f2-6759-c0229b9f5fe0	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55d6-c9f2-a305-7739d4362139	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55d6-c9f2-bf7b-7c742b2adae0	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55d6-c9f2-bb43-bc872dd94c1c	00010000-55d6-c9f2-5bf2-5c370c42fac9	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2888 (class 0 OID 15139085)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55d6-c9f0-3159-e2b39071328c	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55d6-c9f0-982e-77c9a4f1186d	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55d6-c9f0-7eac-364a257126ba	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55d6-c9f0-d50d-1092daa00a38	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55d6-c9f0-abff-c97b1328bf2d	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55d6-c9f0-2af2-962adde0ea00	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55d6-c9f0-d411-554ed7f5a3b7	Abonma-read	Abonma - branje	f
00030000-55d6-c9f0-98af-758c6250392c	Abonma-write	Abonma - spreminjanje	f
00030000-55d6-c9f0-3478-668702328242	Alternacija-read	Alternacija - branje	f
00030000-55d6-c9f0-f466-d499697d0247	Alternacija-write	Alternacija - spreminjanje	f
00030000-55d6-c9f0-5e3e-bec79d83bfc6	Arhivalija-read	Arhivalija - branje	f
00030000-55d6-c9f0-8110-e6264379393c	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55d6-c9f0-2521-314feb614275	Besedilo-read	Besedilo - branje	f
00030000-55d6-c9f0-e61e-afbd4b98acf0	Besedilo-write	Besedilo - spreminjanje	f
00030000-55d6-c9f0-e532-9e100950e570	DogodekIzven-read	DogodekIzven - branje	f
00030000-55d6-c9f0-41bb-cd8c423116e8	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55d6-c9f0-8378-ee21a8625297	Dogodek-read	Dogodek - branje	f
00030000-55d6-c9f0-12d9-308ecbf4cb2f	Dogodek-write	Dogodek - spreminjanje	f
00030000-55d6-c9f0-0ca7-edf716cc3bb4	DrugiVir-read	DrugiVir - branje	f
00030000-55d6-c9f0-26bf-1d2e4108ab7e	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55d6-c9f0-8c97-690c148114a5	Drzava-read	Drzava - branje	f
00030000-55d6-c9f0-9eaa-99ef05a26bfc	Drzava-write	Drzava - spreminjanje	f
00030000-55d6-c9f0-3918-3f8a9f3e63a4	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55d6-c9f0-12e7-1b259a71e651	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55d6-c9f0-4e66-efd1fa9ae701	Funkcija-read	Funkcija - branje	f
00030000-55d6-c9f0-0a0b-0ac75ece5eb0	Funkcija-write	Funkcija - spreminjanje	f
00030000-55d6-c9f0-0803-e4bbbe538d95	Gostovanje-read	Gostovanje - branje	f
00030000-55d6-c9f0-9e0c-15c4a8fe900f	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55d6-c9f0-9232-4eb3d52a2e9a	Gostujoca-read	Gostujoca - branje	f
00030000-55d6-c9f0-6ce0-1db6b62fcafd	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55d6-c9f0-6eac-088a47ba599d	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55d6-c9f0-39ed-9bfa84c552e4	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55d6-c9f0-f5a9-91f0a02988ab	Kupec-read	Kupec - branje	f
00030000-55d6-c9f0-3d8c-f4b8e7c95cdb	Kupec-write	Kupec - spreminjanje	f
00030000-55d6-c9f0-6fed-a4fd2c179ac7	NacinPlacina-read	NacinPlacina - branje	f
00030000-55d6-c9f0-a14f-20119a140ce3	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55d6-c9f0-83ce-c7b8cb35f11d	Option-read	Option - branje	f
00030000-55d6-c9f0-621d-96c55b002a5c	Option-write	Option - spreminjanje	f
00030000-55d6-c9f0-e218-a6f3206b8123	OptionValue-read	OptionValue - branje	f
00030000-55d6-c9f0-e609-911385cdae47	OptionValue-write	OptionValue - spreminjanje	f
00030000-55d6-c9f0-e1a0-57ad22ac21c6	Oseba-read	Oseba - branje	f
00030000-55d6-c9f0-7715-3033990f6fdb	Oseba-write	Oseba - spreminjanje	f
00030000-55d6-c9f0-283c-2aa2cba9a40d	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55d6-c9f0-cb6c-c485aeb6bc9d	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55d6-c9f0-e5fa-391584012ae4	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55d6-c9f0-1e2c-5e12582f2915	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55d6-c9f0-3edc-db77febb9d2b	Pogodba-read	Pogodba - branje	f
00030000-55d6-c9f0-dee0-a2c278a907bd	Pogodba-write	Pogodba - spreminjanje	f
00030000-55d6-c9f0-7127-8a303b5d4267	Popa-read	Popa - branje	f
00030000-55d6-c9f0-124e-75e27ae62750	Popa-write	Popa - spreminjanje	f
00030000-55d6-c9f0-b4a9-0c6dc86dcecb	Posta-read	Posta - branje	f
00030000-55d6-c9f0-5cb9-448eee5195dc	Posta-write	Posta - spreminjanje	f
00030000-55d6-c9f0-106c-d5b629e46fad	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55d6-c9f0-d9ae-8229a6733ada	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55d6-c9f0-1ffb-6649aa5cc403	PostniNaslov-read	PostniNaslov - branje	f
00030000-55d6-c9f0-3e6b-dce60c2c7520	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55d6-c9f0-8c82-9bad582b77f0	Predstava-read	Predstava - branje	f
00030000-55d6-c9f0-5f55-224f8e424019	Predstava-write	Predstava - spreminjanje	f
00030000-55d6-c9f0-04c7-134581c02105	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55d6-c9f0-c614-7f4a0c3aa27c	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55d6-c9f0-0f6e-4e00d1f82402	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55d6-c9f0-80bb-7380f6ff130a	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55d6-c9f0-d70e-3d33b439f3ec	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55d6-c9f0-7feb-ae43bbbac319	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55d6-c9f0-0233-6a9341a3eca0	ProgramDela-read	ProgramDela - branje	f
00030000-55d6-c9f0-b887-5dbb04f49890	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55d6-c9f0-e2ac-320f41c4605b	ProgramFestival-read	ProgramFestival - branje	f
00030000-55d6-c9f0-7074-f753908b0242	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55d6-c9f0-8980-11d1896bcfdc	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55d6-c9f0-f1a4-d5d876ecb7e1	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55d6-c9f0-708c-b46b7964e84c	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55d6-c9f0-8a37-d08fcc7d29d2	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55d6-c9f0-e8a8-c2378e96b088	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55d6-c9f0-7253-863fcf86919b	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55d6-c9f0-a838-436d6bdd00cc	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55d6-c9f0-d09e-416be29f4f7c	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55d6-c9f0-276d-d4670a537fe3	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55d6-c9f0-9df2-c4949f35ca90	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55d6-c9f0-44cf-90c7f6b00d3a	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55d6-c9f0-4b1b-0aa52fb442dc	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55d6-c9f0-2614-9070f28c4b9c	ProgramRazno-read	ProgramRazno - branje	f
00030000-55d6-c9f0-1cbf-a3799bb926bb	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55d6-c9f0-c0ce-99d70e80401c	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55d6-c9f0-9a0d-463c3188109c	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55d6-c9f0-bfc6-d28aabafa643	Prostor-read	Prostor - branje	f
00030000-55d6-c9f0-b581-725b5f4c6ef6	Prostor-write	Prostor - spreminjanje	f
00030000-55d6-c9f0-98ec-24efb1781185	Racun-read	Racun - branje	f
00030000-55d6-c9f0-aeef-e8aa024eef28	Racun-write	Racun - spreminjanje	f
00030000-55d6-c9f0-ea4b-9900ba04926c	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55d6-c9f0-89ee-5dfd9d129905	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55d6-c9f0-33ef-672d15986f9e	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55d6-c9f0-9412-5b3c52739502	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55d6-c9f0-4414-73f0824babfe	Rekvizit-read	Rekvizit - branje	f
00030000-55d6-c9f0-da81-1ac97cbde0a4	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55d6-c9f0-d904-69bc4df5bb9b	Revizija-read	Revizija - branje	f
00030000-55d6-c9f0-3178-256858135d88	Revizija-write	Revizija - spreminjanje	f
00030000-55d6-c9f0-d69f-a49de2f0f154	Rezervacija-read	Rezervacija - branje	f
00030000-55d6-c9f0-d959-fb8f78717205	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55d6-c9f0-8bcf-81ccf72ccc8d	SedezniRed-read	SedezniRed - branje	f
00030000-55d6-c9f0-a115-f29780b18303	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55d6-c9f0-4149-ed26126eb5d7	Sedez-read	Sedez - branje	f
00030000-55d6-c9f0-6fac-52317d0a3847	Sedez-write	Sedez - spreminjanje	f
00030000-55d6-c9f0-5a6c-dea16cfe50ab	Sezona-read	Sezona - branje	f
00030000-55d6-c9f0-0f37-05be251418b0	Sezona-write	Sezona - spreminjanje	f
00030000-55d6-c9f0-1dad-3266f6bb4ab6	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55d6-c9f0-5a55-71a61cb40855	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55d6-c9f0-443e-4b1ca210dec8	Stevilcenje-read	Stevilcenje - branje	f
00030000-55d6-c9f0-088e-7ffe33c114f1	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55d6-c9f0-2bbb-43e1673e5d31	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55d6-c9f0-3080-004a7e355048	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55d6-c9f0-5e25-da6e5d35def8	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55d6-c9f0-61f5-25f529e10f8b	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55d6-c9f0-a733-0665cfa6ee31	Telefonska-read	Telefonska - branje	f
00030000-55d6-c9f0-fc7f-c8fcb66d57bf	Telefonska-write	Telefonska - spreminjanje	f
00030000-55d6-c9f0-b287-86957ba7fc26	TerminStoritve-read	TerminStoritve - branje	f
00030000-55d6-c9f0-7885-4f928d4fbcd5	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55d6-c9f0-a70c-bcaacc8482e7	TipFunkcije-read	TipFunkcije - branje	f
00030000-55d6-c9f0-f23a-aa4b6d9de7e3	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55d6-c9f0-5474-1ab01ab0c920	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55d6-c9f0-de13-fc9c57c5c2c4	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55d6-c9f0-d552-2f89c6d752e6	Trr-read	Trr - branje	f
00030000-55d6-c9f0-ace6-cc20b8ed3728	Trr-write	Trr - spreminjanje	f
00030000-55d6-c9f0-0076-d4534026546f	Uprizoritev-read	Uprizoritev - branje	f
00030000-55d6-c9f0-d20a-89e0870086b4	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55d6-c9f0-68fe-11211443dee7	Vaja-read	Vaja - branje	f
00030000-55d6-c9f0-01d5-8da2598fca5f	Vaja-write	Vaja - spreminjanje	f
00030000-55d6-c9f0-3cdd-6a16dfa1a5b9	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55d6-c9f0-6d61-b124af5b6c3c	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55d6-c9f0-337f-8522a438530b	Zaposlitev-read	Zaposlitev - branje	f
00030000-55d6-c9f0-80fe-a648685ca09b	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55d6-c9f0-d376-5bd0a3a0fe85	Zasedenost-read	Zasedenost - branje	f
00030000-55d6-c9f0-d8b4-d76c2ec50e69	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55d6-c9f0-b4d2-ea646bb1c356	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55d6-c9f0-c57c-191cbd3b06ec	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55d6-c9f0-e24e-9947833bb931	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55d6-c9f0-5a86-b9b5e3e1ccde	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55d6-c9f0-720b-fee55781a9b4	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55d6-c9f0-fe80-a4dbdc548199	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55d6-c9f0-e61f-12fe7f1bb69c	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55d6-c9f0-0dab-315f1d7bdb4d	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55d6-c9f0-3620-bec36f698814	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55d6-c9f0-db6c-2d6e6346286d	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55d6-c9f0-d8c9-c848c30dba53	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55d6-c9f0-b24d-af5b354fba86	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55d6-c9f0-1a68-ce4817ec6d39	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55d6-c9f0-2274-9ad94d9db253	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55d6-c9f0-fb03-72e4421e1aa9	Datoteka-write	Datoteka - spreminjanje	f
00030000-55d6-c9f0-e840-683d6ff998d4	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2890 (class 0 OID 15139104)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55d6-c9f0-b5ca-dd63f880d73d	00030000-55d6-c9f0-982e-77c9a4f1186d
00020000-55d6-c9f0-64c2-f11454991f1e	00030000-55d6-c9f0-8c97-690c148114a5
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-d411-554ed7f5a3b7
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-98af-758c6250392c
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-3478-668702328242
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-f466-d499697d0247
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-5e3e-bec79d83bfc6
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-8378-ee21a8625297
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-d50d-1092daa00a38
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-12d9-308ecbf4cb2f
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-8c97-690c148114a5
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-9eaa-99ef05a26bfc
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-4e66-efd1fa9ae701
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-0a0b-0ac75ece5eb0
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-0803-e4bbbe538d95
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-9e0c-15c4a8fe900f
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-9232-4eb3d52a2e9a
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-6ce0-1db6b62fcafd
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-6eac-088a47ba599d
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-39ed-9bfa84c552e4
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-83ce-c7b8cb35f11d
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-e218-a6f3206b8123
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-e1a0-57ad22ac21c6
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-7715-3033990f6fdb
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-7127-8a303b5d4267
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-124e-75e27ae62750
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-b4a9-0c6dc86dcecb
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-5cb9-448eee5195dc
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-1ffb-6649aa5cc403
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-3e6b-dce60c2c7520
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-8c82-9bad582b77f0
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-5f55-224f8e424019
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-d70e-3d33b439f3ec
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-7feb-ae43bbbac319
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-bfc6-d28aabafa643
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-b581-725b5f4c6ef6
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-33ef-672d15986f9e
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-9412-5b3c52739502
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-4414-73f0824babfe
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-da81-1ac97cbde0a4
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-5a6c-dea16cfe50ab
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-0f37-05be251418b0
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-a70c-bcaacc8482e7
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-0076-d4534026546f
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-d20a-89e0870086b4
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-68fe-11211443dee7
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-01d5-8da2598fca5f
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-d376-5bd0a3a0fe85
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-d8b4-d76c2ec50e69
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-b4d2-ea646bb1c356
00020000-55d6-c9f0-a163-08fe84806219	00030000-55d6-c9f0-e24e-9947833bb931
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-d411-554ed7f5a3b7
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-5e3e-bec79d83bfc6
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-8378-ee21a8625297
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-8c97-690c148114a5
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-0803-e4bbbe538d95
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-9232-4eb3d52a2e9a
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-6eac-088a47ba599d
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-39ed-9bfa84c552e4
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-83ce-c7b8cb35f11d
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-e218-a6f3206b8123
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-e1a0-57ad22ac21c6
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-7715-3033990f6fdb
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-7127-8a303b5d4267
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-b4a9-0c6dc86dcecb
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-1ffb-6649aa5cc403
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-3e6b-dce60c2c7520
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-8c82-9bad582b77f0
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-bfc6-d28aabafa643
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-33ef-672d15986f9e
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-4414-73f0824babfe
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-5a6c-dea16cfe50ab
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-a733-0665cfa6ee31
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-fc7f-c8fcb66d57bf
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-d552-2f89c6d752e6
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-ace6-cc20b8ed3728
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-337f-8522a438530b
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-80fe-a648685ca09b
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-b4d2-ea646bb1c356
00020000-55d6-c9f0-74b5-8ebde03c6455	00030000-55d6-c9f0-e24e-9947833bb931
00020000-55d6-c9f0-a964-c0cf13d87849	00030000-55d6-c9f0-d411-554ed7f5a3b7
00020000-55d6-c9f0-a964-c0cf13d87849	00030000-55d6-c9f0-3478-668702328242
00020000-55d6-c9f0-a964-c0cf13d87849	00030000-55d6-c9f0-5e3e-bec79d83bfc6
00020000-55d6-c9f0-a964-c0cf13d87849	00030000-55d6-c9f0-8110-e6264379393c
00020000-55d6-c9f0-a964-c0cf13d87849	00030000-55d6-c9f0-2521-314feb614275
00020000-55d6-c9f0-a964-c0cf13d87849	00030000-55d6-c9f0-e532-9e100950e570
00020000-55d6-c9f0-a964-c0cf13d87849	00030000-55d6-c9f0-8378-ee21a8625297
00020000-55d6-c9f0-a964-c0cf13d87849	00030000-55d6-c9f0-8c97-690c148114a5
00020000-55d6-c9f0-a964-c0cf13d87849	00030000-55d6-c9f0-4e66-efd1fa9ae701
00020000-55d6-c9f0-a964-c0cf13d87849	00030000-55d6-c9f0-0803-e4bbbe538d95
00020000-55d6-c9f0-a964-c0cf13d87849	00030000-55d6-c9f0-9232-4eb3d52a2e9a
00020000-55d6-c9f0-a964-c0cf13d87849	00030000-55d6-c9f0-6eac-088a47ba599d
00020000-55d6-c9f0-a964-c0cf13d87849	00030000-55d6-c9f0-83ce-c7b8cb35f11d
00020000-55d6-c9f0-a964-c0cf13d87849	00030000-55d6-c9f0-e218-a6f3206b8123
00020000-55d6-c9f0-a964-c0cf13d87849	00030000-55d6-c9f0-e1a0-57ad22ac21c6
00020000-55d6-c9f0-a964-c0cf13d87849	00030000-55d6-c9f0-7127-8a303b5d4267
00020000-55d6-c9f0-a964-c0cf13d87849	00030000-55d6-c9f0-b4a9-0c6dc86dcecb
00020000-55d6-c9f0-a964-c0cf13d87849	00030000-55d6-c9f0-8c82-9bad582b77f0
00020000-55d6-c9f0-a964-c0cf13d87849	00030000-55d6-c9f0-d70e-3d33b439f3ec
00020000-55d6-c9f0-a964-c0cf13d87849	00030000-55d6-c9f0-bfc6-d28aabafa643
00020000-55d6-c9f0-a964-c0cf13d87849	00030000-55d6-c9f0-33ef-672d15986f9e
00020000-55d6-c9f0-a964-c0cf13d87849	00030000-55d6-c9f0-4414-73f0824babfe
00020000-55d6-c9f0-a964-c0cf13d87849	00030000-55d6-c9f0-5a6c-dea16cfe50ab
00020000-55d6-c9f0-a964-c0cf13d87849	00030000-55d6-c9f0-a70c-bcaacc8482e7
00020000-55d6-c9f0-a964-c0cf13d87849	00030000-55d6-c9f0-68fe-11211443dee7
00020000-55d6-c9f0-a964-c0cf13d87849	00030000-55d6-c9f0-d376-5bd0a3a0fe85
00020000-55d6-c9f0-a964-c0cf13d87849	00030000-55d6-c9f0-b4d2-ea646bb1c356
00020000-55d6-c9f0-a964-c0cf13d87849	00030000-55d6-c9f0-e24e-9947833bb931
00020000-55d6-c9f0-5e04-ccee4127ef0a	00030000-55d6-c9f0-d411-554ed7f5a3b7
00020000-55d6-c9f0-5e04-ccee4127ef0a	00030000-55d6-c9f0-98af-758c6250392c
00020000-55d6-c9f0-5e04-ccee4127ef0a	00030000-55d6-c9f0-f466-d499697d0247
00020000-55d6-c9f0-5e04-ccee4127ef0a	00030000-55d6-c9f0-5e3e-bec79d83bfc6
00020000-55d6-c9f0-5e04-ccee4127ef0a	00030000-55d6-c9f0-8378-ee21a8625297
00020000-55d6-c9f0-5e04-ccee4127ef0a	00030000-55d6-c9f0-8c97-690c148114a5
00020000-55d6-c9f0-5e04-ccee4127ef0a	00030000-55d6-c9f0-0803-e4bbbe538d95
00020000-55d6-c9f0-5e04-ccee4127ef0a	00030000-55d6-c9f0-9232-4eb3d52a2e9a
00020000-55d6-c9f0-5e04-ccee4127ef0a	00030000-55d6-c9f0-83ce-c7b8cb35f11d
00020000-55d6-c9f0-5e04-ccee4127ef0a	00030000-55d6-c9f0-e218-a6f3206b8123
00020000-55d6-c9f0-5e04-ccee4127ef0a	00030000-55d6-c9f0-7127-8a303b5d4267
00020000-55d6-c9f0-5e04-ccee4127ef0a	00030000-55d6-c9f0-b4a9-0c6dc86dcecb
00020000-55d6-c9f0-5e04-ccee4127ef0a	00030000-55d6-c9f0-8c82-9bad582b77f0
00020000-55d6-c9f0-5e04-ccee4127ef0a	00030000-55d6-c9f0-bfc6-d28aabafa643
00020000-55d6-c9f0-5e04-ccee4127ef0a	00030000-55d6-c9f0-33ef-672d15986f9e
00020000-55d6-c9f0-5e04-ccee4127ef0a	00030000-55d6-c9f0-4414-73f0824babfe
00020000-55d6-c9f0-5e04-ccee4127ef0a	00030000-55d6-c9f0-5a6c-dea16cfe50ab
00020000-55d6-c9f0-5e04-ccee4127ef0a	00030000-55d6-c9f0-a70c-bcaacc8482e7
00020000-55d6-c9f0-5e04-ccee4127ef0a	00030000-55d6-c9f0-b4d2-ea646bb1c356
00020000-55d6-c9f0-5e04-ccee4127ef0a	00030000-55d6-c9f0-e24e-9947833bb931
00020000-55d6-c9f0-f47d-cdb5aee8981e	00030000-55d6-c9f0-d411-554ed7f5a3b7
00020000-55d6-c9f0-f47d-cdb5aee8981e	00030000-55d6-c9f0-5e3e-bec79d83bfc6
00020000-55d6-c9f0-f47d-cdb5aee8981e	00030000-55d6-c9f0-8378-ee21a8625297
00020000-55d6-c9f0-f47d-cdb5aee8981e	00030000-55d6-c9f0-8c97-690c148114a5
00020000-55d6-c9f0-f47d-cdb5aee8981e	00030000-55d6-c9f0-0803-e4bbbe538d95
00020000-55d6-c9f0-f47d-cdb5aee8981e	00030000-55d6-c9f0-9232-4eb3d52a2e9a
00020000-55d6-c9f0-f47d-cdb5aee8981e	00030000-55d6-c9f0-83ce-c7b8cb35f11d
00020000-55d6-c9f0-f47d-cdb5aee8981e	00030000-55d6-c9f0-e218-a6f3206b8123
00020000-55d6-c9f0-f47d-cdb5aee8981e	00030000-55d6-c9f0-7127-8a303b5d4267
00020000-55d6-c9f0-f47d-cdb5aee8981e	00030000-55d6-c9f0-b4a9-0c6dc86dcecb
00020000-55d6-c9f0-f47d-cdb5aee8981e	00030000-55d6-c9f0-8c82-9bad582b77f0
00020000-55d6-c9f0-f47d-cdb5aee8981e	00030000-55d6-c9f0-bfc6-d28aabafa643
00020000-55d6-c9f0-f47d-cdb5aee8981e	00030000-55d6-c9f0-33ef-672d15986f9e
00020000-55d6-c9f0-f47d-cdb5aee8981e	00030000-55d6-c9f0-4414-73f0824babfe
00020000-55d6-c9f0-f47d-cdb5aee8981e	00030000-55d6-c9f0-5a6c-dea16cfe50ab
00020000-55d6-c9f0-f47d-cdb5aee8981e	00030000-55d6-c9f0-b287-86957ba7fc26
00020000-55d6-c9f0-f47d-cdb5aee8981e	00030000-55d6-c9f0-7eac-364a257126ba
00020000-55d6-c9f0-f47d-cdb5aee8981e	00030000-55d6-c9f0-a70c-bcaacc8482e7
00020000-55d6-c9f0-f47d-cdb5aee8981e	00030000-55d6-c9f0-b4d2-ea646bb1c356
00020000-55d6-c9f0-f47d-cdb5aee8981e	00030000-55d6-c9f0-e24e-9947833bb931
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-3159-e2b39071328c
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-982e-77c9a4f1186d
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-7eac-364a257126ba
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-d50d-1092daa00a38
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-abff-c97b1328bf2d
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-2af2-962adde0ea00
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-d411-554ed7f5a3b7
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-98af-758c6250392c
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-3478-668702328242
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-f466-d499697d0247
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-5e3e-bec79d83bfc6
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-8110-e6264379393c
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-2521-314feb614275
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-e61e-afbd4b98acf0
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-e532-9e100950e570
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-41bb-cd8c423116e8
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-8378-ee21a8625297
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-12d9-308ecbf4cb2f
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-8c97-690c148114a5
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-9eaa-99ef05a26bfc
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-0ca7-edf716cc3bb4
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-26bf-1d2e4108ab7e
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-3918-3f8a9f3e63a4
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-12e7-1b259a71e651
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-4e66-efd1fa9ae701
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-0a0b-0ac75ece5eb0
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-0803-e4bbbe538d95
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-9e0c-15c4a8fe900f
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-9232-4eb3d52a2e9a
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-6ce0-1db6b62fcafd
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-6eac-088a47ba599d
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-39ed-9bfa84c552e4
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-f5a9-91f0a02988ab
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-3d8c-f4b8e7c95cdb
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-6fed-a4fd2c179ac7
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-a14f-20119a140ce3
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-83ce-c7b8cb35f11d
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-621d-96c55b002a5c
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-e218-a6f3206b8123
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-e609-911385cdae47
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-e1a0-57ad22ac21c6
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-7715-3033990f6fdb
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-283c-2aa2cba9a40d
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-cb6c-c485aeb6bc9d
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-e5fa-391584012ae4
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-1e2c-5e12582f2915
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-3edc-db77febb9d2b
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-dee0-a2c278a907bd
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-7127-8a303b5d4267
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-124e-75e27ae62750
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-b4a9-0c6dc86dcecb
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-5cb9-448eee5195dc
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-106c-d5b629e46fad
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-d9ae-8229a6733ada
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-1ffb-6649aa5cc403
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-3e6b-dce60c2c7520
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-8c82-9bad582b77f0
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-5f55-224f8e424019
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-04c7-134581c02105
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-c614-7f4a0c3aa27c
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-0f6e-4e00d1f82402
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-80bb-7380f6ff130a
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-d70e-3d33b439f3ec
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-7feb-ae43bbbac319
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-0233-6a9341a3eca0
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-b887-5dbb04f49890
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-e2ac-320f41c4605b
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-7074-f753908b0242
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-8980-11d1896bcfdc
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-f1a4-d5d876ecb7e1
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-708c-b46b7964e84c
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-8a37-d08fcc7d29d2
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-e8a8-c2378e96b088
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-7253-863fcf86919b
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-a838-436d6bdd00cc
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-d09e-416be29f4f7c
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-276d-d4670a537fe3
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-9df2-c4949f35ca90
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-44cf-90c7f6b00d3a
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-4b1b-0aa52fb442dc
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-2614-9070f28c4b9c
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-1cbf-a3799bb926bb
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-c0ce-99d70e80401c
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-9a0d-463c3188109c
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-bfc6-d28aabafa643
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-b581-725b5f4c6ef6
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-98ec-24efb1781185
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-aeef-e8aa024eef28
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-ea4b-9900ba04926c
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-89ee-5dfd9d129905
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-33ef-672d15986f9e
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-9412-5b3c52739502
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-4414-73f0824babfe
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-da81-1ac97cbde0a4
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-d904-69bc4df5bb9b
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-3178-256858135d88
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-d69f-a49de2f0f154
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-d959-fb8f78717205
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-8bcf-81ccf72ccc8d
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-a115-f29780b18303
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-4149-ed26126eb5d7
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-6fac-52317d0a3847
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-5a6c-dea16cfe50ab
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-0f37-05be251418b0
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-1dad-3266f6bb4ab6
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-5a55-71a61cb40855
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-443e-4b1ca210dec8
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-088e-7ffe33c114f1
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-2bbb-43e1673e5d31
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-3080-004a7e355048
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-5e25-da6e5d35def8
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-61f5-25f529e10f8b
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-a733-0665cfa6ee31
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-fc7f-c8fcb66d57bf
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-b287-86957ba7fc26
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-7885-4f928d4fbcd5
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-a70c-bcaacc8482e7
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-f23a-aa4b6d9de7e3
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-5474-1ab01ab0c920
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-de13-fc9c57c5c2c4
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-d552-2f89c6d752e6
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-ace6-cc20b8ed3728
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-0076-d4534026546f
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-d20a-89e0870086b4
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-68fe-11211443dee7
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-01d5-8da2598fca5f
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-3cdd-6a16dfa1a5b9
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-6d61-b124af5b6c3c
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-337f-8522a438530b
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-80fe-a648685ca09b
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-d376-5bd0a3a0fe85
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-d8b4-d76c2ec50e69
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-b4d2-ea646bb1c356
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-c57c-191cbd3b06ec
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-e24e-9947833bb931
00020000-55d6-c9f2-1d26-762c76f0a21a	00030000-55d6-c9f0-5a86-b9b5e3e1ccde
\.


--
-- TOC entry 2918 (class 0 OID 15139403)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2922 (class 0 OID 15139434)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 15139548)
-- Dependencies: 218
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55d6-c9f2-7501-1710df7deb94	00090000-55d6-c9f2-5d52-df3f29b8bfc6	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55d6-c9f2-df0b-db951e2f6e59	00090000-55d6-c9f2-1218-4ad9d0253ec5	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55d6-c9f2-b5de-435451c74b30	00090000-55d6-c9f2-bb43-bc872dd94c1c	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2895 (class 0 OID 15139164)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55d6-c9f1-e272-e798c83c5248	00040000-55d6-c9f0-1c09-99083dcc93b3	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d6-c9f1-b53d-7d80edb6d3ed	00040000-55d6-c9f0-1c09-99083dcc93b3	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55d6-c9f1-ef3d-ac58631f5b36	00040000-55d6-c9f0-1c09-99083dcc93b3	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d6-c9f1-4967-6950152a378d	00040000-55d6-c9f0-1c09-99083dcc93b3	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d6-c9f1-9558-8cb9afa64cbe	00040000-55d6-c9f0-1c09-99083dcc93b3	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d6-c9f1-b5fe-412a284e758c	00040000-55d6-c9ef-45be-e2601d995858	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d6-c9f1-bbb3-702e996782c1	00040000-55d6-c9f0-1a38-ced676b0287c	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d6-c9f1-8adb-9fbb1853bbc6	00040000-55d6-c9ef-c4ec-1d519755556a	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d6-c9f2-ba65-559c4c28c3f6	00040000-55d6-c9f0-1c09-99083dcc93b3	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2897 (class 0 OID 15139199)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55d6-c9f0-9e68-0167b92f4385	8341	Adlešiči
00050000-55d6-c9f0-3bba-7f6a5afef4a2	5270	Ajdovščina
00050000-55d6-c9f0-1e6f-be04fdbc0b4f	6280	Ankaran/Ancarano
00050000-55d6-c9f0-c586-5b1e2baade8e	9253	Apače
00050000-55d6-c9f0-94be-8faac028fdfe	8253	Artiče
00050000-55d6-c9f0-75ad-7e93a781c6a2	4275	Begunje na Gorenjskem
00050000-55d6-c9f0-32d9-9cbb87f503ba	1382	Begunje pri Cerknici
00050000-55d6-c9f0-ff5e-38580b660354	9231	Beltinci
00050000-55d6-c9f0-eb87-e89ce580c291	2234	Benedikt
00050000-55d6-c9f0-6bc7-abadd86cd820	2345	Bistrica ob Dravi
00050000-55d6-c9f0-121b-42d9ba21bf6d	3256	Bistrica ob Sotli
00050000-55d6-c9f0-2958-8547c51bab6f	8259	Bizeljsko
00050000-55d6-c9f0-31ca-1f0b6b6d2f74	1223	Blagovica
00050000-55d6-c9f0-2a77-a261020be4d5	8283	Blanca
00050000-55d6-c9f0-faaa-dbea4284a264	4260	Bled
00050000-55d6-c9f0-075a-005ed6cd5d0d	4273	Blejska Dobrava
00050000-55d6-c9f0-d061-0232ec6be874	9265	Bodonci
00050000-55d6-c9f0-9fc3-de788d287b93	9222	Bogojina
00050000-55d6-c9f0-ec3b-bb29970c34bb	4263	Bohinjska Bela
00050000-55d6-c9f0-e2a5-79a5e0c21c7e	4264	Bohinjska Bistrica
00050000-55d6-c9f0-fee5-80f2b7b66d63	4265	Bohinjsko jezero
00050000-55d6-c9f0-53e6-cf7d2e57e4ec	1353	Borovnica
00050000-55d6-c9f0-5304-1f8b73e7d428	8294	Boštanj
00050000-55d6-c9f0-08e6-9b66cb024d17	5230	Bovec
00050000-55d6-c9f0-9215-781bd84db367	5295	Branik
00050000-55d6-c9f0-d1a5-067d6d88ae2f	3314	Braslovče
00050000-55d6-c9f0-af05-1787bbbe8cea	5223	Breginj
00050000-55d6-c9f0-e147-4ecbc8aa7e64	8280	Brestanica
00050000-55d6-c9f0-9302-93107f8e555e	2354	Bresternica
00050000-55d6-c9f0-5348-953a8c458df3	4243	Brezje
00050000-55d6-c9f0-672d-1553a65c8ef9	1351	Brezovica pri Ljubljani
00050000-55d6-c9f0-de0a-a5e3458ca5dd	8250	Brežice
00050000-55d6-c9f0-065e-e62c96805978	4210	Brnik - Aerodrom
00050000-55d6-c9f0-1bbc-18d873f71359	8321	Brusnice
00050000-55d6-c9f0-7ac9-3b29053e052f	3255	Buče
00050000-55d6-c9f0-f21b-2e1a6e688b36	8276	Bučka 
00050000-55d6-c9f0-56af-5a6592027e44	9261	Cankova
00050000-55d6-c9f0-4bda-e040ef70de97	3000	Celje 
00050000-55d6-c9f0-78bd-b1f3629ea2f8	3001	Celje - poštni predali
00050000-55d6-c9f0-bf98-3bbb43cb1006	4207	Cerklje na Gorenjskem
00050000-55d6-c9f0-c024-2ebdc1871608	8263	Cerklje ob Krki
00050000-55d6-c9f0-c76b-d5ce21717e16	1380	Cerknica
00050000-55d6-c9f0-81e7-7aab34d1b428	5282	Cerkno
00050000-55d6-c9f0-140e-e9a1a18130a5	2236	Cerkvenjak
00050000-55d6-c9f0-5713-a398733e2e3e	2215	Ceršak
00050000-55d6-c9f0-5fc6-8330fe09fac8	2326	Cirkovce
00050000-55d6-c9f0-7187-4d455f5badcc	2282	Cirkulane
00050000-55d6-c9f0-b53e-ad1a479a1d51	5273	Col
00050000-55d6-c9f0-e966-e1787d9d7fbd	8251	Čatež ob Savi
00050000-55d6-c9f0-4879-612f89efa5d6	1413	Čemšenik
00050000-55d6-c9f0-9265-371de109e5d3	5253	Čepovan
00050000-55d6-c9f0-bfc3-a99d3a4e6b47	9232	Črenšovci
00050000-55d6-c9f0-983e-7975282530ca	2393	Črna na Koroškem
00050000-55d6-c9f0-b73c-8ff77d34f279	6275	Črni Kal
00050000-55d6-c9f0-3f4a-ff3e5d33a1bd	5274	Črni Vrh nad Idrijo
00050000-55d6-c9f0-d6d7-9ebeb1ee31a6	5262	Črniče
00050000-55d6-c9f0-da22-07dc7881d77a	8340	Črnomelj
00050000-55d6-c9f0-7702-2fceb8ae1e5c	6271	Dekani
00050000-55d6-c9f0-534e-a9bb7b606941	5210	Deskle
00050000-55d6-c9f0-dd0a-5e1483e9f818	2253	Destrnik
00050000-55d6-c9f0-922c-dcdf3be6f6fe	6215	Divača
00050000-55d6-c9f0-369a-132734dcc427	1233	Dob
00050000-55d6-c9f0-be82-ca36a569cccd	3224	Dobje pri Planini
00050000-55d6-c9f0-c8b2-ce460a50218a	8257	Dobova
00050000-55d6-c9f0-8eb9-0a5b5253e847	1423	Dobovec
00050000-55d6-c9f0-16cf-c91259aff208	5263	Dobravlje
00050000-55d6-c9f0-bcfa-4598d2a0fb83	3204	Dobrna
00050000-55d6-c9f0-eefd-bbffaa68cd9c	8211	Dobrnič
00050000-55d6-c9f0-4a36-526530b5663b	1356	Dobrova
00050000-55d6-c9f0-573e-49fe5379dbad	9223	Dobrovnik/Dobronak 
00050000-55d6-c9f0-a3df-62fb2e8b053c	5212	Dobrovo v Brdih
00050000-55d6-c9f0-5a64-620e9a2f3a31	1431	Dol pri Hrastniku
00050000-55d6-c9f0-10b0-03fbe4cf1a13	1262	Dol pri Ljubljani
00050000-55d6-c9f0-2c99-84ef5b720a63	1273	Dole pri Litiji
00050000-55d6-c9f0-8e60-f8e88024f068	1331	Dolenja vas
00050000-55d6-c9f0-4a28-35a94f432515	8350	Dolenjske Toplice
00050000-55d6-c9f0-d13d-a2f29b330e45	1230	Domžale
00050000-55d6-c9f0-f7b5-c9d2801ec257	2252	Dornava
00050000-55d6-c9f0-70b5-82bd1516b4e0	5294	Dornberk
00050000-55d6-c9f0-c96b-33dc8ea499c2	1319	Draga
00050000-55d6-c9f0-0c87-7ad1979dbd26	8343	Dragatuš
00050000-55d6-c9f0-38f5-f623549b5548	3222	Dramlje
00050000-55d6-c9f0-433f-5d9ce4fea0c1	2370	Dravograd
00050000-55d6-c9f0-baf0-3b3c0f670cf1	4203	Duplje
00050000-55d6-c9f0-2980-d566670df94c	6221	Dutovlje
00050000-55d6-c9f0-c0b8-c0fc7b73510d	8361	Dvor
00050000-55d6-c9f0-fa45-707ebd66e5d7	2343	Fala
00050000-55d6-c9f0-d257-6953150b029a	9208	Fokovci
00050000-55d6-c9f0-4fd8-eadea67a9400	2313	Fram
00050000-55d6-c9f0-e06f-6b599fe8fc95	3213	Frankolovo
00050000-55d6-c9f0-f60a-83563274d99c	1274	Gabrovka
00050000-55d6-c9f0-49e7-550a742c78d6	8254	Globoko
00050000-55d6-c9f0-8361-b088c3376f89	5275	Godovič
00050000-55d6-c9f0-a0be-faa49855b913	4204	Golnik
00050000-55d6-c9f0-e6c4-dbb237ec3c3d	3303	Gomilsko
00050000-55d6-c9f0-8315-61913afcc3d3	4224	Gorenja vas
00050000-55d6-c9f0-767b-418302f82a85	3263	Gorica pri Slivnici
00050000-55d6-c9f0-04a8-7fbccc9ff314	2272	Gorišnica
00050000-55d6-c9f0-2cb6-8a7d1d96cb31	9250	Gornja Radgona
00050000-55d6-c9f0-fae4-1edfaadc1cf3	3342	Gornji Grad
00050000-55d6-c9f0-547a-50602dcf8c10	4282	Gozd Martuljek
00050000-55d6-c9f0-bd1c-db7aae467e56	6272	Gračišče
00050000-55d6-c9f0-c1a4-78db7825e7cc	9264	Grad
00050000-55d6-c9f0-1498-c51d97063d7c	8332	Gradac
00050000-55d6-c9f0-40e6-0d30931754e4	1384	Grahovo
00050000-55d6-c9f0-56af-d13f36d56a18	5242	Grahovo ob Bači
00050000-55d6-c9f0-1a20-d1c6d3a1c8cf	5251	Grgar
00050000-55d6-c9f0-1e1a-f4d03467de48	3302	Griže
00050000-55d6-c9f0-a3d4-da4196cb8d92	3231	Grobelno
00050000-55d6-c9f0-26fd-4ff67bb2d9ee	1290	Grosuplje
00050000-55d6-c9f0-2d7f-52fae5c0643e	2288	Hajdina
00050000-55d6-c9f0-5a6e-152389a191ac	8362	Hinje
00050000-55d6-c9f0-4010-fa1b957086c6	2311	Hoče
00050000-55d6-c9f0-87e7-08f0c9848444	9205	Hodoš/Hodos
00050000-55d6-c9f0-bd3e-7b742db66716	1354	Horjul
00050000-55d6-c9f0-c2b5-3227c842abd4	1372	Hotedršica
00050000-55d6-c9f0-4c2d-6a58e734c59d	1430	Hrastnik
00050000-55d6-c9f0-456e-cafc05b51002	6225	Hruševje
00050000-55d6-c9f0-58b7-1256f5053122	4276	Hrušica
00050000-55d6-c9f0-eadf-da46374423cf	5280	Idrija
00050000-55d6-c9f0-9cba-fab00af08b69	1292	Ig
00050000-55d6-c9f0-11b4-aa1a74a6d233	6250	Ilirska Bistrica
00050000-55d6-c9f0-dc4c-22d3f929b803	6251	Ilirska Bistrica-Trnovo
00050000-55d6-c9f0-5af5-891831c02097	1295	Ivančna Gorica
00050000-55d6-c9f0-f0d6-a137a1c4b35f	2259	Ivanjkovci
00050000-55d6-c9f0-d920-1f49bbbf7c3a	1411	Izlake
00050000-55d6-c9f0-9a6e-135d135cd8ed	6310	Izola/Isola
00050000-55d6-c9f0-55c8-0ab0877d51a2	2222	Jakobski Dol
00050000-55d6-c9f0-679d-595b348185d2	2221	Jarenina
00050000-55d6-c9f0-a1d6-a554ee01eddd	6254	Jelšane
00050000-55d6-c9f0-be77-f95dce2ee6c1	4270	Jesenice
00050000-55d6-c9f0-d48d-29e3895662f6	8261	Jesenice na Dolenjskem
00050000-55d6-c9f0-65dc-2e0667a04239	3273	Jurklošter
00050000-55d6-c9f0-bcc3-26729602c303	2223	Jurovski Dol
00050000-55d6-c9f0-31f1-8cd043019839	2256	Juršinci
00050000-55d6-c9f0-c812-e0249054f6bb	5214	Kal nad Kanalom
00050000-55d6-c9f0-2c08-5f834605c5f5	3233	Kalobje
00050000-55d6-c9f0-98df-6e30a8dce3ee	4246	Kamna Gorica
00050000-55d6-c9f0-1df8-97210d8df4ca	2351	Kamnica
00050000-55d6-c9f0-8ca6-a5e92555373a	1241	Kamnik
00050000-55d6-c9f0-4a4a-8b40203123aa	5213	Kanal
00050000-55d6-c9f0-881b-e4215eb3711a	8258	Kapele
00050000-55d6-c9f0-e238-e7b27c8bf195	2362	Kapla
00050000-55d6-c9f0-275c-371fa8258c4d	2325	Kidričevo
00050000-55d6-c9f0-ae43-6ce5df06534b	1412	Kisovec
00050000-55d6-c9f0-4cf8-2566d88442da	6253	Knežak
00050000-55d6-c9f0-8a62-8a8c2d852b47	5222	Kobarid
00050000-55d6-c9f0-da28-92d83bd8d298	9227	Kobilje
00050000-55d6-c9f0-910b-93ede2d893fa	1330	Kočevje
00050000-55d6-c9f0-1801-2de7e3acc606	1338	Kočevska Reka
00050000-55d6-c9f0-642e-fc13582c6677	2276	Kog
00050000-55d6-c9f0-5de6-e52f2616fa3d	5211	Kojsko
00050000-55d6-c9f0-7c0d-d87565b385a0	6223	Komen
00050000-55d6-c9f0-b1e7-17de94cd6566	1218	Komenda
00050000-55d6-c9f0-ff99-ebf0516e8170	6000	Koper/Capodistria 
00050000-55d6-c9f0-3956-6187f7a12f35	6001	Koper/Capodistria - poštni predali
00050000-55d6-c9f0-b25a-37c302694e98	8282	Koprivnica
00050000-55d6-c9f0-56ea-0924bcb0cc07	5296	Kostanjevica na Krasu
00050000-55d6-c9f0-cde1-f8c1835c2aff	8311	Kostanjevica na Krki
00050000-55d6-c9f0-63d6-b6ffc62b3b6a	1336	Kostel
00050000-55d6-c9f0-c167-7380b4eeaa85	6256	Košana
00050000-55d6-c9f0-eccc-715c22fe0924	2394	Kotlje
00050000-55d6-c9f0-08f5-fe237d5c5dee	6240	Kozina
00050000-55d6-c9f0-6adb-548cd3e0a0be	3260	Kozje
00050000-55d6-c9f0-c06d-ef2c0c61dc4b	4000	Kranj 
00050000-55d6-c9f0-c3c2-0459af54716a	4001	Kranj - poštni predali
00050000-55d6-c9f0-1302-aff2dea1fbd1	4280	Kranjska Gora
00050000-55d6-c9f0-b464-ddb9badf4661	1281	Kresnice
00050000-55d6-c9f0-87f5-afafc8fe3447	4294	Križe
00050000-55d6-c9f0-487c-90e0ff9a3294	9206	Križevci
00050000-55d6-c9f0-5d27-6d80635adaa4	9242	Križevci pri Ljutomeru
00050000-55d6-c9f0-f7ee-7c5c62de5ac3	1301	Krka
00050000-55d6-c9f0-cdf5-f216595e2b42	8296	Krmelj
00050000-55d6-c9f0-aaa1-1782101b8b46	4245	Kropa
00050000-55d6-c9f0-6dc4-4a04a295f36d	8262	Krška vas
00050000-55d6-c9f0-8319-0e4af66e3db6	8270	Krško
00050000-55d6-c9f0-3dd9-dfd5c1520220	9263	Kuzma
00050000-55d6-c9f0-a3b2-be5b9e615427	2318	Laporje
00050000-55d6-c9f0-ccaa-a7240ace630f	3270	Laško
00050000-55d6-c9f0-7b53-0ba8c6dfc48b	1219	Laze v Tuhinju
00050000-55d6-c9f0-bf50-87a4c98233b5	2230	Lenart v Slovenskih goricah
00050000-55d6-c9f0-f571-f866ce76f427	9220	Lendava/Lendva
00050000-55d6-c9f0-8d1e-c16e9a185612	4248	Lesce
00050000-55d6-c9f0-b7f5-98be7273155b	3261	Lesično
00050000-55d6-c9f0-3e08-9e1d46605004	8273	Leskovec pri Krškem
00050000-55d6-c9f0-4d5b-cf7a2f8cfd94	2372	Libeliče
00050000-55d6-c9f0-7ca3-752c48a2678f	2341	Limbuš
00050000-55d6-c9f0-0013-1c613eacb6ee	1270	Litija
00050000-55d6-c9f0-973f-d07dde12c3a8	3202	Ljubečna
00050000-55d6-c9f0-8e84-6b42e0377292	1000	Ljubljana 
00050000-55d6-c9f0-c5fc-5453e4fa3dbd	1001	Ljubljana - poštni predali
00050000-55d6-c9f0-78f6-6b310e8b8555	1231	Ljubljana - Črnuče
00050000-55d6-c9f0-d36b-5134a3fc4815	1261	Ljubljana - Dobrunje
00050000-55d6-c9f0-aeb5-41169ad3416e	1260	Ljubljana - Polje
00050000-55d6-c9f0-8d6d-930d4874544c	1210	Ljubljana - Šentvid
00050000-55d6-c9f0-baa9-9a63ae8d6860	1211	Ljubljana - Šmartno
00050000-55d6-c9f0-b6bc-499ed088a467	3333	Ljubno ob Savinji
00050000-55d6-c9f0-3bec-3821dca3d335	9240	Ljutomer
00050000-55d6-c9f0-626e-444f9c28bac6	3215	Loče
00050000-55d6-c9f0-e165-2f2ff0daf381	5231	Log pod Mangartom
00050000-55d6-c9f0-336d-3dc2db205290	1358	Log pri Brezovici
00050000-55d6-c9f0-0610-a663f272f900	1370	Logatec
00050000-55d6-c9f0-a160-af507ad5fa26	1371	Logatec
00050000-55d6-c9f0-9b07-c63b49c653b7	1434	Loka pri Zidanem Mostu
00050000-55d6-c9f0-543b-981446412c21	3223	Loka pri Žusmu
00050000-55d6-c9f0-81a8-5cc8be0f4ac0	6219	Lokev
00050000-55d6-c9f0-cce0-7fe330f70ead	1318	Loški Potok
00050000-55d6-c9f0-fb5f-b386bd45885f	2324	Lovrenc na Dravskem polju
00050000-55d6-c9f0-5fe9-d27672e1a44b	2344	Lovrenc na Pohorju
00050000-55d6-c9f0-dc89-836024384b9a	3334	Luče
00050000-55d6-c9f0-6634-9a55ae87f38d	1225	Lukovica
00050000-55d6-c9f0-dc51-9b38caaa97a6	9202	Mačkovci
00050000-55d6-c9f0-5f93-4e7b4ff9f6e5	2322	Majšperk
00050000-55d6-c9f0-7d60-1327e25b481c	2321	Makole
00050000-55d6-c9f0-a99b-2ef30051074a	9243	Mala Nedelja
00050000-55d6-c9f0-905f-c4b8cf716547	2229	Malečnik
00050000-55d6-c9f0-b0b8-75e77e0e4732	6273	Marezige
00050000-55d6-c9f0-d3d5-9527a7042761	2000	Maribor 
00050000-55d6-c9f0-4b19-dd140c829373	2001	Maribor - poštni predali
00050000-55d6-c9f0-d380-71c70f2c22dd	2206	Marjeta na Dravskem polju
00050000-55d6-c9f0-5dbf-a10b4b91cee1	2281	Markovci
00050000-55d6-c9f0-e562-90772f264135	9221	Martjanci
00050000-55d6-c9f0-e0bd-32a103a1abda	6242	Materija
00050000-55d6-c9f0-f770-4505c1152129	4211	Mavčiče
00050000-55d6-c9f0-d83a-67a911948c60	1215	Medvode
00050000-55d6-c9f0-3207-dc9d92222e81	1234	Mengeš
00050000-55d6-c9f0-1055-013a3f4aafb5	8330	Metlika
00050000-55d6-c9f0-b9b3-5726f627468e	2392	Mežica
00050000-55d6-c9f0-85e5-cd476b7ade8e	2204	Miklavž na Dravskem polju
00050000-55d6-c9f0-cf04-d827213d39b3	2275	Miklavž pri Ormožu
00050000-55d6-c9f0-6f07-4f2e5e9072d2	5291	Miren
00050000-55d6-c9f0-25fa-635e689b5d6a	8233	Mirna
00050000-55d6-c9f0-c7b6-8e6a508f9a7c	8216	Mirna Peč
00050000-55d6-c9f0-1582-1b6301b4625d	2382	Mislinja
00050000-55d6-c9f0-b644-fb892634141b	4281	Mojstrana
00050000-55d6-c9f0-bce4-9fd6a21b816c	8230	Mokronog
00050000-55d6-c9f0-2fda-020e6ddf8dfc	1251	Moravče
00050000-55d6-c9f0-280c-db0ff7eeab16	9226	Moravske Toplice
00050000-55d6-c9f0-42e4-c37981fb6d52	5216	Most na Soči
00050000-55d6-c9f0-78b1-36be278f7923	1221	Motnik
00050000-55d6-c9f0-acba-ca15e5cc478a	3330	Mozirje
00050000-55d6-c9f0-adda-2f7667b83646	9000	Murska Sobota 
00050000-55d6-c9f0-8da5-1093fb02c24c	9001	Murska Sobota - poštni predali
00050000-55d6-c9f0-c160-29df48f4a778	2366	Muta
00050000-55d6-c9f0-29a0-1fb73b3c42de	4202	Naklo
00050000-55d6-c9f0-413c-80faa091eaf2	3331	Nazarje
00050000-55d6-c9f0-1d0a-ea41b2ee27b9	1357	Notranje Gorice
00050000-55d6-c9f0-77fe-44aeda1ddb3b	3203	Nova Cerkev
00050000-55d6-c9f0-9615-0141b0ab17eb	5000	Nova Gorica 
00050000-55d6-c9f0-0cae-2ac67a12e1cf	5001	Nova Gorica - poštni predali
00050000-55d6-c9f0-2e6e-afc3fd264423	1385	Nova vas
00050000-55d6-c9f0-585f-cfe10b8052a1	8000	Novo mesto
00050000-55d6-c9f0-5dbc-1db5ce5ec388	8001	Novo mesto - poštni predali
00050000-55d6-c9f0-7fda-8741899e9aa2	6243	Obrov
00050000-55d6-c9f0-8fe0-9a0a23550bca	9233	Odranci
00050000-55d6-c9f0-e688-b296fed67a75	2317	Oplotnica
00050000-55d6-c9f0-bc18-44ef9aa274b2	2312	Orehova vas
00050000-55d6-c9f0-c924-6ca7dfe99f77	2270	Ormož
00050000-55d6-c9f0-b6fb-1a1d77405ae4	1316	Ortnek
00050000-55d6-c9f0-b8a7-fceebddddc0a	1337	Osilnica
00050000-55d6-c9f0-b485-081414191a2e	8222	Otočec
00050000-55d6-c9f0-3f50-6a02dad680eb	2361	Ožbalt
00050000-55d6-c9f0-b941-c7b8f308f4ff	2231	Pernica
00050000-55d6-c9f0-7a53-d8b8608cedbc	2211	Pesnica pri Mariboru
00050000-55d6-c9f0-e43b-084482e7b595	9203	Petrovci
00050000-55d6-c9f0-451a-ba66e56a3e8c	3301	Petrovče
00050000-55d6-c9f0-70e6-53d311927ca2	6330	Piran/Pirano
00050000-55d6-c9f0-dc40-2f90ca70027c	8255	Pišece
00050000-55d6-c9f0-1b07-6fd840ad9388	6257	Pivka
00050000-55d6-c9f0-8532-f5998deef939	6232	Planina
00050000-55d6-c9f0-b178-460e15f58cb1	3225	Planina pri Sevnici
00050000-55d6-c9f0-f59d-3c8c463905d6	6276	Pobegi
00050000-55d6-c9f0-654d-4f5b60a3c84f	8312	Podbočje
00050000-55d6-c9f0-8d7b-35e7d9df31dc	5243	Podbrdo
00050000-55d6-c9f0-dea2-48204fd13e16	3254	Podčetrtek
00050000-55d6-c9f0-9ee3-7b3056116d37	2273	Podgorci
00050000-55d6-c9f0-d44f-2690e2d65465	6216	Podgorje
00050000-55d6-c9f0-4d40-42cc8b3effd6	2381	Podgorje pri Slovenj Gradcu
00050000-55d6-c9f0-11b8-c15b72901a90	6244	Podgrad
00050000-55d6-c9f0-e980-572facfc6fe0	1414	Podkum
00050000-55d6-c9f0-8b97-fccdc7a57ddd	2286	Podlehnik
00050000-55d6-c9f0-9a39-0d4245e051cd	5272	Podnanos
00050000-55d6-c9f0-2d80-62320dd14eb4	4244	Podnart
00050000-55d6-c9f0-a300-2e913a348a4e	3241	Podplat
00050000-55d6-c9f0-8aa2-620c8b2d0137	3257	Podsreda
00050000-55d6-c9f0-bdae-07f924d39dbe	2363	Podvelka
00050000-55d6-c9f0-3659-d8ad7ab2adb0	2208	Pohorje
00050000-55d6-c9f0-11ec-fc211d7ae7a6	2257	Polenšak
00050000-55d6-c9f0-c3d9-ccfaa14f9752	1355	Polhov Gradec
00050000-55d6-c9f0-c43b-2732812b458e	4223	Poljane nad Škofjo Loko
00050000-55d6-c9f0-b06b-3734b4641ab9	2319	Poljčane
00050000-55d6-c9f0-8b62-ca07f5ad0422	1272	Polšnik
00050000-55d6-c9f0-b0af-815b6f8025b4	3313	Polzela
00050000-55d6-c9f0-c847-6b8f3838bf5a	3232	Ponikva
00050000-55d6-c9f0-175b-8c9f6e952d00	6320	Portorož/Portorose
00050000-55d6-c9f0-4d04-d0a27e8f3a86	6230	Postojna
00050000-55d6-c9f0-5259-78ea8eb6796b	2331	Pragersko
00050000-55d6-c9f0-8359-448556c9a28c	3312	Prebold
00050000-55d6-c9f0-a941-6b13f774fa64	4205	Preddvor
00050000-55d6-c9f0-b21b-d176c9d64e46	6255	Prem
00050000-55d6-c9f0-7cb6-6b15628e0b47	1352	Preserje
00050000-55d6-c9f0-6e59-30eeda9889f4	6258	Prestranek
00050000-55d6-c9f0-921a-5886f2f0595b	2391	Prevalje
00050000-55d6-c9f0-ad4b-daac471a471e	3262	Prevorje
00050000-55d6-c9f0-a70f-b02a28cd9726	1276	Primskovo 
00050000-55d6-c9f0-4e9a-83dee0e78243	3253	Pristava pri Mestinju
00050000-55d6-c9f0-caa5-cf4039667584	9207	Prosenjakovci/Partosfalva
00050000-55d6-c9f0-5072-fa4fc6d0430f	5297	Prvačina
00050000-55d6-c9f0-4b1e-e4facf40c19b	2250	Ptuj
00050000-55d6-c9f0-bd58-63a247d26077	2323	Ptujska Gora
00050000-55d6-c9f0-5671-15d9d749102b	9201	Puconci
00050000-55d6-c9f0-3e4d-226194a1654a	2327	Rače
00050000-55d6-c9f0-320d-68a2f88f4ddb	1433	Radeče
00050000-55d6-c9f0-3fa8-34382fb5020a	9252	Radenci
00050000-55d6-c9f0-7ab4-e1d0a1b60446	2360	Radlje ob Dravi
00050000-55d6-c9f0-1b1f-ea6ecdfa09bf	1235	Radomlje
00050000-55d6-c9f0-fe58-68f38f96fc32	4240	Radovljica
00050000-55d6-c9f0-4ef5-a617e360ae90	8274	Raka
00050000-55d6-c9f0-589a-5c48da4ebab4	1381	Rakek
00050000-55d6-c9f0-b312-0dc79fbaf78e	4283	Rateče - Planica
00050000-55d6-c9f0-4768-0cc6bc4c2c82	2390	Ravne na Koroškem
00050000-55d6-c9f0-8aee-57c8a3146052	9246	Razkrižje
00050000-55d6-c9f0-6657-a5f1b857bfb5	3332	Rečica ob Savinji
00050000-55d6-c9f0-9a06-04b0e28ceb32	5292	Renče
00050000-55d6-c9f0-dc75-b6daf595507c	1310	Ribnica
00050000-55d6-c9f0-571a-1925d27d12e9	2364	Ribnica na Pohorju
00050000-55d6-c9f0-4857-094c0192362c	3272	Rimske Toplice
00050000-55d6-c9f0-4a68-48547a94da5e	1314	Rob
00050000-55d6-c9f0-6dff-f3ddc0f47a45	5215	Ročinj
00050000-55d6-c9f0-ee10-8aa5d8bdf0b7	3250	Rogaška Slatina
00050000-55d6-c9f0-ee82-08de77cea213	9262	Rogašovci
00050000-55d6-c9f0-40f9-287658e9a24b	3252	Rogatec
00050000-55d6-c9f0-ad1f-995669d1a184	1373	Rovte
00050000-55d6-c9f0-9ef7-a242399bc1e8	2342	Ruše
00050000-55d6-c9f0-5965-d796ef309c21	1282	Sava
00050000-55d6-c9f0-3538-7bcb2f02dd01	6333	Sečovlje/Sicciole
00050000-55d6-c9f0-5d9f-0cc1875a4421	4227	Selca
00050000-55d6-c9f0-95c5-5be6723135a3	2352	Selnica ob Dravi
00050000-55d6-c9f0-708e-b47291dc2819	8333	Semič
00050000-55d6-c9f0-53ae-7e9ec65ec353	8281	Senovo
00050000-55d6-c9f0-eb1f-ff56942937eb	6224	Senožeče
00050000-55d6-c9f0-7ff4-ba7e5ba889ea	8290	Sevnica
00050000-55d6-c9f0-8e25-d17779a28adf	6210	Sežana
00050000-55d6-c9f0-f8a8-7c2b1f68a62a	2214	Sladki Vrh
00050000-55d6-c9f0-dffa-88099da412d3	5283	Slap ob Idrijci
00050000-55d6-c9f0-50fc-a7b0ba5a76a3	2380	Slovenj Gradec
00050000-55d6-c9f0-4c14-2877d79e9c5a	2310	Slovenska Bistrica
00050000-55d6-c9f0-8d30-a01469b0c8ef	3210	Slovenske Konjice
00050000-55d6-c9f0-e032-78f67cc1c840	1216	Smlednik
00050000-55d6-c9f0-19b1-33c6963e573e	5232	Soča
00050000-55d6-c9f0-be29-36f759f646e6	1317	Sodražica
00050000-55d6-c9f0-4106-82c97df6dabd	3335	Solčava
00050000-55d6-c9f0-d17a-5bfc9b13555e	5250	Solkan
00050000-55d6-c9f0-45fa-50ea4dfd38ef	4229	Sorica
00050000-55d6-c9f0-83d1-afad9c5c2e4f	4225	Sovodenj
00050000-55d6-c9f0-ca7f-771bdba3d36b	5281	Spodnja Idrija
00050000-55d6-c9f0-37a0-111a76ca8ef8	2241	Spodnji Duplek
00050000-55d6-c9f0-2712-a20f21642bfb	9245	Spodnji Ivanjci
00050000-55d6-c9f0-1856-595158d944e8	2277	Središče ob Dravi
00050000-55d6-c9f0-017f-856d84a171e7	4267	Srednja vas v Bohinju
00050000-55d6-c9f0-e1b8-c38608440ca4	8256	Sromlje 
00050000-55d6-c9f0-7977-35b92673125a	5224	Srpenica
00050000-55d6-c9f0-eaa5-42757585248f	1242	Stahovica
00050000-55d6-c9f0-cfab-5f8dfba3b229	1332	Stara Cerkev
00050000-55d6-c9f0-89b9-7c07db81f920	8342	Stari trg ob Kolpi
00050000-55d6-c9f0-6c93-3f8b6e81477d	1386	Stari trg pri Ložu
00050000-55d6-c9f0-070f-369cfdf8d102	2205	Starše
00050000-55d6-c9f0-f7f7-6c5ff1f7094e	2289	Stoperce
00050000-55d6-c9f0-7d59-161f8ca1f6ad	8322	Stopiče
00050000-55d6-c9f0-28e2-668b3e71cc4e	3206	Stranice
00050000-55d6-c9f0-3810-d1ec890ed2be	8351	Straža
00050000-55d6-c9f0-033f-69e4453a5d73	1313	Struge
00050000-55d6-c9f0-6a04-a1638fdf6def	8293	Studenec
00050000-55d6-c9f0-9d88-275afe6597cd	8331	Suhor
00050000-55d6-c9f0-a2cf-a90888d0f3d3	2233	Sv. Ana v Slovenskih goricah
00050000-55d6-c9f0-4895-4d04d0d6a2d9	2235	Sv. Trojica v Slovenskih goricah
00050000-55d6-c9f0-75e3-3389ab5ebbd9	2353	Sveti Duh na Ostrem Vrhu
00050000-55d6-c9f0-6e74-217e6f542732	9244	Sveti Jurij ob Ščavnici
00050000-55d6-c9f0-91a9-c9989d18d7a6	3264	Sveti Štefan
00050000-55d6-c9f0-37fd-43f43d1ba515	2258	Sveti Tomaž
00050000-55d6-c9f0-a000-bf7a696ade54	9204	Šalovci
00050000-55d6-c9f0-9367-a47e53aee1bd	5261	Šempas
00050000-55d6-c9f0-fa8c-d6447d2f3ef6	5290	Šempeter pri Gorici
00050000-55d6-c9f0-2579-0b6aa57a9db7	3311	Šempeter v Savinjski dolini
00050000-55d6-c9f0-e3ab-e8717f5fca21	4208	Šenčur
00050000-55d6-c9f0-5699-7a28fcde0d26	2212	Šentilj v Slovenskih goricah
00050000-55d6-c9f0-97e7-ec7735ce4e0d	8297	Šentjanž
00050000-55d6-c9f0-e85f-35229d295d17	2373	Šentjanž pri Dravogradu
00050000-55d6-c9f0-7e9c-c5c45c7f5425	8310	Šentjernej
00050000-55d6-c9f0-b552-502a6da052d6	3230	Šentjur
00050000-55d6-c9f0-2fa3-9b226cca43b1	3271	Šentrupert
00050000-55d6-c9f0-1894-2eb491dab9d6	8232	Šentrupert
00050000-55d6-c9f0-5e00-bc6f40ab6418	1296	Šentvid pri Stični
00050000-55d6-c9f0-7f9c-1f476787f82d	8275	Škocjan
00050000-55d6-c9f0-14fb-e2f631bb97ed	6281	Škofije
00050000-55d6-c9f0-8dbd-a3ac10e9b0fb	4220	Škofja Loka
00050000-55d6-c9f0-8823-96bbd6af38f3	3211	Škofja vas
00050000-55d6-c9f0-a5d3-e82e4d54a8e6	1291	Škofljica
00050000-55d6-c9f0-7100-0bd23e455c1e	6274	Šmarje
00050000-55d6-c9f0-c150-7ef950f313c6	1293	Šmarje - Sap
00050000-55d6-c9f0-d65e-e0ae8c2925a4	3240	Šmarje pri Jelšah
00050000-55d6-c9f0-e70b-e4f0fa5ff812	8220	Šmarješke Toplice
00050000-55d6-c9f0-dc43-e59099aeb431	2315	Šmartno na Pohorju
00050000-55d6-c9f0-82ba-1baa1b72b7a5	3341	Šmartno ob Dreti
00050000-55d6-c9f0-222f-1f604edddc1a	3327	Šmartno ob Paki
00050000-55d6-c9f0-fb13-e5b4fb282da5	1275	Šmartno pri Litiji
00050000-55d6-c9f0-4b5b-65a2a5b199f1	2383	Šmartno pri Slovenj Gradcu
00050000-55d6-c9f0-d258-d8b565694f32	3201	Šmartno v Rožni dolini
00050000-55d6-c9f0-1d17-b2a7221cab4d	3325	Šoštanj
00050000-55d6-c9f0-6a62-d002b0c4d92d	6222	Štanjel
00050000-55d6-c9f0-5d1c-8d0f2a7b9fff	3220	Štore
00050000-55d6-c9f0-98cc-210c9d66b8f3	3304	Tabor
00050000-55d6-c9f0-cad1-7984c30af9aa	3221	Teharje
00050000-55d6-c9f0-f3ba-a3a58f3548ae	9251	Tišina
00050000-55d6-c9f0-6be5-3f131dd107e7	5220	Tolmin
00050000-55d6-c9f0-699a-49ed2d475ae1	3326	Topolšica
00050000-55d6-c9f0-fc81-57cc0c2b2c4b	2371	Trbonje
00050000-55d6-c9f0-4e7e-7d5fc3cc2609	1420	Trbovlje
00050000-55d6-c9f0-1dc9-ee30cdfb9ad3	8231	Trebelno 
00050000-55d6-c9f0-4c24-1c1ea0069097	8210	Trebnje
00050000-55d6-c9f0-731e-a4ed97479c04	5252	Trnovo pri Gorici
00050000-55d6-c9f0-d5cb-dc9ecc81c6d0	2254	Trnovska vas
00050000-55d6-c9f0-2e75-9d352168c109	1222	Trojane
00050000-55d6-c9f0-7a4d-ae61df809b9e	1236	Trzin
00050000-55d6-c9f0-a42f-77c1b3da940d	4290	Tržič
00050000-55d6-c9f0-8ed2-70239c80b938	8295	Tržišče
00050000-55d6-c9f0-160a-a278b73f3917	1311	Turjak
00050000-55d6-c9f0-426e-463b2af5e109	9224	Turnišče
00050000-55d6-c9f0-7644-63ad4a9060dd	8323	Uršna sela
00050000-55d6-c9f0-94e8-a26e6c9029be	1252	Vače
00050000-55d6-c9f0-b772-66d4ac2b4bee	3320	Velenje 
00050000-55d6-c9f0-6a00-d943cbd160e1	3322	Velenje - poštni predali
00050000-55d6-c9f0-07db-0d1459671eb4	8212	Velika Loka
00050000-55d6-c9f0-0f6c-d0ca86ce338a	2274	Velika Nedelja
00050000-55d6-c9f0-6667-7dde3922b64e	9225	Velika Polana
00050000-55d6-c9f0-1c7f-21c79c5bc189	1315	Velike Lašče
00050000-55d6-c9f0-2a0d-35f7e790b272	8213	Veliki Gaber
00050000-55d6-c9f0-7654-8795d74f8ac8	9241	Veržej
00050000-55d6-c9f0-2eed-cd6c171ab5ba	1312	Videm - Dobrepolje
00050000-55d6-c9f0-0843-ce71915c8198	2284	Videm pri Ptuju
00050000-55d6-c9f0-a85c-9b9dde1621fd	8344	Vinica
00050000-55d6-c9f0-efe5-1dc0105a6f3e	5271	Vipava
00050000-55d6-c9f0-4ce1-4126fd72dc72	4212	Visoko
00050000-55d6-c9f0-e896-b2012344eca2	1294	Višnja Gora
00050000-55d6-c9f0-5c67-2076306895b9	3205	Vitanje
00050000-55d6-c9f0-a296-43493e423e5c	2255	Vitomarci
00050000-55d6-c9f0-9b35-326da124fa8f	1217	Vodice
00050000-55d6-c9f0-c5e4-9861d2c6580a	3212	Vojnik\t
00050000-55d6-c9f0-3c13-f0fe85bbac39	5293	Volčja Draga
00050000-55d6-c9f0-ae34-7df8a0eb5ca3	2232	Voličina
00050000-55d6-c9f0-5f65-c47ebb585c78	3305	Vransko
00050000-55d6-c9f0-558b-8a26f260e948	6217	Vremski Britof
00050000-55d6-c9f0-b0a4-1615acd0b496	1360	Vrhnika
00050000-55d6-c9f0-b391-546ac531b5df	2365	Vuhred
00050000-55d6-c9f0-e6df-b59f07db882a	2367	Vuzenica
00050000-55d6-c9f0-762d-3fce40080003	8292	Zabukovje 
00050000-55d6-c9f0-e8a4-ac113bca004d	1410	Zagorje ob Savi
00050000-55d6-c9f0-6572-3a31fb7c45bc	1303	Zagradec
00050000-55d6-c9f0-230f-3ab937952c86	2283	Zavrč
00050000-55d6-c9f0-e51d-c95fbd5985c1	8272	Zdole 
00050000-55d6-c9f0-1569-9a11874def1c	4201	Zgornja Besnica
00050000-55d6-c9f0-a794-eee503c16396	2242	Zgornja Korena
00050000-55d6-c9f0-37d0-4d9836e91776	2201	Zgornja Kungota
00050000-55d6-c9f0-9df7-206f3627d33e	2316	Zgornja Ložnica
00050000-55d6-c9f0-7820-5ddab49a1f58	2314	Zgornja Polskava
00050000-55d6-c9f0-1858-b75bde5d4735	2213	Zgornja Velka
00050000-55d6-c9f0-5934-f9c0e76ff962	4247	Zgornje Gorje
00050000-55d6-c9f0-c902-6b59b24cda3b	4206	Zgornje Jezersko
00050000-55d6-c9f0-2efc-d84cd609b035	2285	Zgornji Leskovec
00050000-55d6-c9f0-a222-a3a465c42bf0	1432	Zidani Most
00050000-55d6-c9f0-3dfc-a79baeb37418	3214	Zreče
00050000-55d6-c9f0-1ef4-bf2e10af7492	4209	Žabnica
00050000-55d6-c9f0-1b64-8b631ab0c4d4	3310	Žalec
00050000-55d6-c9f0-64b8-ec1463bb4634	4228	Železniki
00050000-55d6-c9f0-a5a0-67b9f59d911a	2287	Žetale
00050000-55d6-c9f0-e153-2a13c2716a12	4226	Žiri
00050000-55d6-c9f0-fa1b-cc9fc53c67b3	4274	Žirovnica
00050000-55d6-c9f0-4bbc-971ef955912c	8360	Žužemberk
\.


--
-- TOC entry 2914 (class 0 OID 15139377)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 15139184)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 15139262)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 15139389)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 15139721)
-- Dependencies: 225
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 15139731)
-- Dependencies: 226
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55d6-c9f2-5008-c5b0e46842cc	00080000-55d6-c9f2-ba65-559c4c28c3f6	0900	AK
00190000-55d6-c9f2-8100-cf990089e19a	00080000-55d6-c9f1-ef3d-ac58631f5b36	0987	AK
00190000-55d6-c9f2-eb3e-964b1aaf5947	00080000-55d6-c9f1-b53d-7d80edb6d3ed	0989	AK
00190000-55d6-c9f2-b024-0b2d1bc619d6	00080000-55d6-c9f1-4967-6950152a378d	0986	AK
00190000-55d6-c9f2-b498-f251e0d6ce1c	00080000-55d6-c9f1-b5fe-412a284e758c	0984	AK
00190000-55d6-c9f2-fe6f-f212643434b2	00080000-55d6-c9f1-bbb3-702e996782c1	0983	AK
00190000-55d6-c9f2-45b3-6ef70226790d	00080000-55d6-c9f1-8adb-9fbb1853bbc6	0982	AK
\.


--
-- TOC entry 2938 (class 0 OID 15139677)
-- Dependencies: 224
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponprej, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55d6-c9f2-c350-3a593b28f1e9	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2941 (class 0 OID 15139739)
-- Dependencies: 227
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 15139418)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55d6-c9f1-0ac8-5ac6fb3948c4	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55d6-c9f1-4e4d-66312cf97441	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55d6-c9f1-bd52-c510fca55a52	0003	Kazinska	t	84	Kazinska dvorana
00220000-55d6-c9f1-34c1-5ec5a640d7a7	0004	Mali oder	t	24	Mali oder 
00220000-55d6-c9f1-2028-5cf2ce27b62f	0005	Komorni oder	t	15	Komorni oder
00220000-55d6-c9f1-292c-4e5819c44f13	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55d6-c9f1-ef8a-902cc4bfce16	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2912 (class 0 OID 15139362)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2911 (class 0 OID 15139352)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 15139537)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 15139486)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 15139056)
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
-- TOC entry 2921 (class 0 OID 15139428)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 15139094)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55d6-c9f0-b5ca-dd63f880d73d	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55d6-c9f0-64c2-f11454991f1e	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55d6-c9f0-ff75-c582f40eb1ff	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55d6-c9f0-0d54-8835643a70c6	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55d6-c9f0-a163-08fe84806219	planer	Planer dogodkov v koledarju	t
00020000-55d6-c9f0-74b5-8ebde03c6455	kadrovska	Kadrovska služba	t
00020000-55d6-c9f0-a964-c0cf13d87849	arhivar	Ažuriranje arhivalij	t
00020000-55d6-c9f0-5e04-ccee4127ef0a	igralec	Igralec	t
00020000-55d6-c9f0-f47d-cdb5aee8981e	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55d6-c9f2-1d26-762c76f0a21a	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2887 (class 0 OID 15139078)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55d6-c9f0-fe17-7f7d6e670ddb	00020000-55d6-c9f0-ff75-c582f40eb1ff
00010000-55d6-c9f0-2576-60058eaeac0b	00020000-55d6-c9f0-ff75-c582f40eb1ff
00010000-55d6-c9f2-4c5b-24ef88b137d7	00020000-55d6-c9f2-1d26-762c76f0a21a
\.


--
-- TOC entry 2923 (class 0 OID 15139442)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2915 (class 0 OID 15139383)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 15139329)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 15139780)
-- Dependencies: 232
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55d6-c9f0-46f8-618fdb4d08a3	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55d6-c9f0-d380-2be8a462012d	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55d6-c9f0-eadf-1cc7269c0241	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55d6-c9f0-1938-0eb36a59d874	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55d6-c9f0-c1c2-b6ce4936a5ba	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2945 (class 0 OID 15139772)
-- Dependencies: 231
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55d6-c9f0-49a5-cd8f0505590a	00230000-55d6-c9f0-1938-0eb36a59d874	popa
00240000-55d6-c9f1-ddc2-14e681a57271	00230000-55d6-c9f0-1938-0eb36a59d874	oseba
00240000-55d6-c9f1-813a-452c7e7ca816	00230000-55d6-c9f0-1938-0eb36a59d874	sezona
00240000-55d6-c9f1-551b-cc319e859b8a	00230000-55d6-c9f0-d380-2be8a462012d	prostor
00240000-55d6-c9f1-172d-01d7a43665b8	00230000-55d6-c9f0-1938-0eb36a59d874	besedilo
00240000-55d6-c9f1-b3ef-565ff69074ca	00230000-55d6-c9f0-1938-0eb36a59d874	uprizoritev
00240000-55d6-c9f1-86f0-c6fa156a4a01	00230000-55d6-c9f0-1938-0eb36a59d874	funkcija
00240000-55d6-c9f1-287f-331d907a607d	00230000-55d6-c9f0-1938-0eb36a59d874	tipfunkcije
00240000-55d6-c9f1-d52b-21beae0d50e1	00230000-55d6-c9f0-1938-0eb36a59d874	alternacija
00240000-55d6-c9f1-7228-8fccd3276d7c	00230000-55d6-c9f0-46f8-618fdb4d08a3	pogodba
00240000-55d6-c9f1-acfd-0703c2e32129	00230000-55d6-c9f0-1938-0eb36a59d874	zaposlitev
00240000-55d6-c9f1-1453-b3a934f16274	00230000-55d6-c9f0-46f8-618fdb4d08a3	programdela
00240000-55d6-c9f1-80d1-61d5606305e0	00230000-55d6-c9f0-1938-0eb36a59d874	zapis
\.


--
-- TOC entry 2944 (class 0 OID 15139767)
-- Dependencies: 230
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 15139496)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55d6-c9f2-f902-89f81391f689	000e0000-55d6-c9f2-0290-0e9e0df86b25	00080000-55d6-c9f1-e272-e798c83c5248	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55d6-c9f2-d8d5-6260acdc3c8a	000e0000-55d6-c9f2-0290-0e9e0df86b25	00080000-55d6-c9f1-e272-e798c83c5248	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55d6-c9f2-ef4d-5c41b0048d3d	000e0000-55d6-c9f2-0290-0e9e0df86b25	00080000-55d6-c9f1-9558-8cb9afa64cbe	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55d6-c9f2-69d5-af1a0c737b80	000e0000-55d6-c9f2-0290-0e9e0df86b25	00080000-55d6-c9f1-9558-8cb9afa64cbe	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2894 (class 0 OID 15139156)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2910 (class 0 OID 15139339)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55d6-c9f2-be24-305c5124ad67	00180000-55d6-c9f2-a734-b0434ad0ad25	000c0000-55d6-c9f2-f187-6d8cf6c77ced	00090000-55d6-c9f2-17fb-9b3c9ebce5cd	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d6-c9f2-d78f-53a80220c72c	00180000-55d6-c9f2-a734-b0434ad0ad25	000c0000-55d6-c9f2-8401-b03831a4d218	00090000-55d6-c9f2-6759-c0229b9f5fe0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d6-c9f2-22d1-f0ab4372e796	00180000-55d6-c9f2-a734-b0434ad0ad25	000c0000-55d6-c9f2-3fb1-b6b8a0418515	00090000-55d6-c9f2-6e0b-68c1d99b96b0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d6-c9f2-47f5-16b8e75fdf72	00180000-55d6-c9f2-a734-b0434ad0ad25	000c0000-55d6-c9f2-3620-700eb12e5530	00090000-55d6-c9f2-e7eb-2757439f796b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d6-c9f2-388b-e9a50e5ac8b6	00180000-55d6-c9f2-a734-b0434ad0ad25	000c0000-55d6-c9f2-1532-ae0ac7199e03	00090000-55d6-c9f2-bf7b-7c742b2adae0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d6-c9f2-b512-9937929ef810	00180000-55d6-c9f2-527c-3054c4141330	\N	00090000-55d6-c9f2-bf7b-7c742b2adae0	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2930 (class 0 OID 15139526)
-- Dependencies: 216
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55d6-c9f1-c6e3-47b69cfcf7e0	Avtor	Avtorji	Avtorka	umetnik
000f0000-55d6-c9f1-594e-7ae72523a158	Priredba	Priredba	Priredba	umetnik
000f0000-55d6-c9f1-3faa-cd4e65b7caa2	Prevod	Prevod	Prevod	umetnik
000f0000-55d6-c9f1-e3ef-b5dfd2f5704d	Režija	Režija	Režija	umetnik
000f0000-55d6-c9f1-4c46-4480a2373690	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55d6-c9f1-cbd3-151183daff24	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55d6-c9f1-48a0-d78048991b2e	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55d6-c9f1-a4d2-b1b19d05613d	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55d6-c9f1-ec57-259dfaba273b	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55d6-c9f1-ef9b-b6f0e20edd7b	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55d6-c9f1-9395-476970d9ed0b	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55d6-c9f1-9fa3-b5a9717a4094	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55d6-c9f1-de92-abc2508869cd	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55d6-c9f1-d8de-f0d2b9f17236	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55d6-c9f1-776e-8e73af412aa0	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55d6-c9f1-6b2f-81830d26f47d	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55d6-c9f1-8cc5-cede012042e1	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55d6-c9f1-fc67-7323d07fc787	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2942 (class 0 OID 15139749)
-- Dependencies: 228
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55d6-c9f1-941d-a9936dceab81	01	Velika predstava	f	1.00	1.00
002b0000-55d6-c9f1-e5e6-5fac5da45f05	02	Mala predstava	f	0.50	0.50
002b0000-55d6-c9f1-68f2-05e1611db476	03	Mala koprodukcija	t	0.40	1.00
002b0000-55d6-c9f1-7435-593334ae8d96	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55d6-c9f1-8cb5-c17859f66450	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2899 (class 0 OID 15139219)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2886 (class 0 OID 15139065)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55d6-c9f0-2576-60058eaeac0b	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROv5WaXFYAWhmABvgnMyoDkBkhqRCBXxq	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55d6-c9f2-9c52-152e7a380a47	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55d6-c9f2-5790-43637bafec23	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55d6-c9f2-389b-bd40886efeb7	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55d6-c9f2-5bf2-5c370c42fac9	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55d6-c9f2-fe04-5767559d32fb	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55d6-c9f2-db73-2bb0550c7132	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55d6-c9f2-f668-ed674d354c9d	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55d6-c9f2-6fb4-762bf3defbaf	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55d6-c9f2-c175-e19628bdbee2	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55d6-c9f2-4c5b-24ef88b137d7	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55d6-c9f0-fe17-7f7d6e670ddb	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2934 (class 0 OID 15139574)
-- Dependencies: 220
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55d6-c9f2-2f90-3feb707b4cce	00160000-55d6-c9f1-f61f-5d81c77e94a7	00150000-55d6-c9f1-b3c7-86fd92bc5ed7	00140000-55d6-c9ef-6fa5-7c648e00ebb9	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55d6-c9f1-2028-5cf2ce27b62f
000e0000-55d6-c9f2-0290-0e9e0df86b25	00160000-55d6-c9f1-020a-da49c743128a	00150000-55d6-c9f1-57a7-1e5925587025	00140000-55d6-c9ef-9c70-9da64d1f0ab6	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55d6-c9f1-292c-4e5819c44f13
000e0000-55d6-c9f2-b22f-84db5fbcb41b	\N	00150000-55d6-c9f1-57a7-1e5925587025	00140000-55d6-c9ef-9c70-9da64d1f0ab6	00190000-55d6-c9f2-8100-cf990089e19a	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55d6-c9f1-2028-5cf2ce27b62f
000e0000-55d6-c9f2-d129-fa58c845d8b0	\N	00150000-55d6-c9f1-57a7-1e5925587025	00140000-55d6-c9ef-9c70-9da64d1f0ab6	00190000-55d6-c9f2-8100-cf990089e19a	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55d6-c9f1-2028-5cf2ce27b62f
000e0000-55d6-c9f2-b707-923a7ae43c47	\N	00150000-55d6-c9f1-57a7-1e5925587025	00140000-55d6-c9ef-9c70-9da64d1f0ab6	00190000-55d6-c9f2-8100-cf990089e19a	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55d6-c9f1-0ac8-5ac6fb3948c4
000e0000-55d6-c9f2-2678-ed262c64a9cc	\N	00150000-55d6-c9f1-57a7-1e5925587025	00140000-55d6-c9ef-9c70-9da64d1f0ab6	00190000-55d6-c9f2-8100-cf990089e19a	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f		00220000-55d6-c9f1-0ac8-5ac6fb3948c4
\.


--
-- TOC entry 2904 (class 0 OID 15139281)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55d6-c9f2-110c-e52e2dde196f	000e0000-55d6-c9f2-0290-0e9e0df86b25	1	
00200000-55d6-c9f2-8262-5f0ae4e5f237	000e0000-55d6-c9f2-0290-0e9e0df86b25	2	
\.


--
-- TOC entry 2919 (class 0 OID 15139410)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 15139819)
-- Dependencies: 234
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 15139791)
-- Dependencies: 233
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 15139831)
-- Dependencies: 235
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2926 (class 0 OID 15139479)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55d6-c9f2-73f3-7aca1493b6c3	00090000-55d6-c9f2-6759-c0229b9f5fe0	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d6-c9f2-5466-1946667df502	00090000-55d6-c9f2-6e0b-68c1d99b96b0	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d6-c9f2-dbbb-fe961b6c64f9	00090000-55d6-c9f2-eee8-d6208ce3a44c	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d6-c9f2-9b80-4c57fbe8a5ec	00090000-55d6-c9f2-7a7a-2cb94cb47d3d	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d6-c9f2-95de-76650f84eef4	00090000-55d6-c9f2-17fb-9b3c9ebce5cd	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d6-c9f2-8a1f-28dda242d030	00090000-55d6-c9f2-2b52-b6615adb474b	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2906 (class 0 OID 15139313)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 15139564)
-- Dependencies: 219
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55d6-c9ef-6fa5-7c648e00ebb9	01	Drama	drama (SURS 01)
00140000-55d6-c9ef-6f45-70beccf82f0d	02	Opera	opera (SURS 02)
00140000-55d6-c9ef-8948-beab191bf258	03	Balet	balet (SURS 03)
00140000-55d6-c9ef-dc8b-dfe5c3ee3250	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55d6-c9ef-33cb-ae23ff7b1545	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55d6-c9ef-9c70-9da64d1f0ab6	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55d6-c9ef-c450-e8fa7d76cb12	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2925 (class 0 OID 15139469)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55d6-c9f1-9223-d55665cfe023	01	Opera	opera
00150000-55d6-c9f1-3afc-aec8e1d8c62e	02	Opereta	opereta
00150000-55d6-c9f1-8d0d-50cfb5d9b970	03	Balet	balet
00150000-55d6-c9f1-e023-b765bf2760e8	04	Plesne prireditve	plesne prireditve
00150000-55d6-c9f1-3c74-89ea4004b596	05	Lutkovno gledališče	lutkovno gledališče
00150000-55d6-c9f1-291d-f6b4dfba3d75	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55d6-c9f1-65e3-af7ee0388486	07	Biografska drama	biografska drama
00150000-55d6-c9f1-b3c7-86fd92bc5ed7	08	Komedija	komedija
00150000-55d6-c9f1-e2e3-4af2c5cfd07a	09	Črna komedija	črna komedija
00150000-55d6-c9f1-2515-d20916ac4e61	10	E-igra	E-igra
00150000-55d6-c9f1-57a7-1e5925587025	11	Kriminalka	kriminalka
00150000-55d6-c9f1-798d-bc8b444e4c66	12	Musical	musical
\.


--
-- TOC entry 2436 (class 2606 OID 15139119)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 15139621)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 15139611)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 15139525)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 15139871)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 15139303)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 15139328)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 15139765)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 15139245)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 15139671)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 15139465)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 15139279)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 2606 OID 15139322)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 15139259)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 15139375)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 15139848)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 15139855)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2677 (class 2606 OID 15139879)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 15139402)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 15139217)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 15139128)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 15139152)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 15139108)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2427 (class 2606 OID 15139093)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 15139408)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 15139441)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 15139559)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 15139181)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 15139205)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 15139381)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 15139195)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 15139266)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 15139393)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 15139728)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 15139736)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 15139719)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 15139747)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 15139425)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 15139366)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 15139357)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 15139547)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 15139493)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 15139064)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 15139432)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 15139082)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2429 (class 2606 OID 15139102)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 15139450)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 15139388)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 15139337)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 15139789)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 15139777)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 15139771)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 15139506)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 15139161)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 15139348)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 15139536)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 15139759)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 15139230)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 15139077)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 15139590)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 15139288)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 15139416)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 15139829)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 15139813)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 15139837)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 15139484)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 15139317)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 15139572)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 15139477)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 1259 OID 15139310)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2577 (class 1259 OID 15139507)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2578 (class 1259 OID 15139508)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2663 (class 1259 OID 15139850)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2664 (class 1259 OID 15139849)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2450 (class 1259 OID 15139183)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2542 (class 1259 OID 15139409)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2650 (class 1259 OID 15139817)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2651 (class 1259 OID 15139816)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2652 (class 1259 OID 15139818)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2653 (class 1259 OID 15139815)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2654 (class 1259 OID 15139814)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2536 (class 1259 OID 15139395)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2537 (class 1259 OID 15139394)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2487 (class 1259 OID 15139289)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2564 (class 1259 OID 15139466)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2565 (class 1259 OID 15139468)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2566 (class 1259 OID 15139467)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2475 (class 1259 OID 15139261)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2476 (class 1259 OID 15139260)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2633 (class 1259 OID 15139748)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2587 (class 1259 OID 15139561)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2588 (class 1259 OID 15139562)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2589 (class 1259 OID 15139563)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2660 (class 1259 OID 15139838)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2596 (class 1259 OID 15139595)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2597 (class 1259 OID 15139592)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2598 (class 1259 OID 15139596)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2599 (class 1259 OID 15139594)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2600 (class 1259 OID 15139593)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2465 (class 1259 OID 15139232)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2466 (class 1259 OID 15139231)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2441 (class 1259 OID 15139155)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2552 (class 1259 OID 15139433)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2505 (class 1259 OID 15139323)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2431 (class 1259 OID 15139109)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2432 (class 1259 OID 15139110)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2557 (class 1259 OID 15139453)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2558 (class 1259 OID 15139452)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2559 (class 1259 OID 15139451)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2479 (class 1259 OID 15139267)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2480 (class 1259 OID 15139269)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2481 (class 1259 OID 15139268)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 15139779)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2516 (class 1259 OID 15139361)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2517 (class 1259 OID 15139359)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2518 (class 1259 OID 15139358)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2519 (class 1259 OID 15139360)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2422 (class 1259 OID 15139083)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2423 (class 1259 OID 15139084)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2545 (class 1259 OID 15139417)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2673 (class 1259 OID 15139872)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2674 (class 1259 OID 15139880)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2675 (class 1259 OID 15139881)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2531 (class 1259 OID 15139382)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2573 (class 1259 OID 15139494)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2574 (class 1259 OID 15139495)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2617 (class 1259 OID 15139676)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2618 (class 1259 OID 15139675)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2619 (class 1259 OID 15139672)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2620 (class 1259 OID 15139673)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2621 (class 1259 OID 15139674)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2454 (class 1259 OID 15139197)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2455 (class 1259 OID 15139196)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2456 (class 1259 OID 15139198)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2625 (class 1259 OID 15139729)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2626 (class 1259 OID 15139730)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2610 (class 1259 OID 15139625)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2611 (class 1259 OID 15139626)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2612 (class 1259 OID 15139623)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2613 (class 1259 OID 15139624)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2570 (class 1259 OID 15139485)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2522 (class 1259 OID 15139370)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2523 (class 1259 OID 15139369)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2524 (class 1259 OID 15139367)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2525 (class 1259 OID 15139368)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 15139613)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2607 (class 1259 OID 15139612)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2622 (class 1259 OID 15139720)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2486 (class 1259 OID 15139280)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2640 (class 1259 OID 15139766)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2667 (class 1259 OID 15139856)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2668 (class 1259 OID 15139857)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2437 (class 1259 OID 15139130)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2438 (class 1259 OID 15139129)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2446 (class 1259 OID 15139162)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 15139163)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2511 (class 1259 OID 15139351)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2512 (class 1259 OID 15139350)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2513 (class 1259 OID 15139349)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2493 (class 1259 OID 15139312)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2494 (class 1259 OID 15139308)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2495 (class 1259 OID 15139305)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2496 (class 1259 OID 15139306)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2497 (class 1259 OID 15139304)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2498 (class 1259 OID 15139309)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2499 (class 1259 OID 15139307)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2453 (class 1259 OID 15139182)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2471 (class 1259 OID 15139246)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2472 (class 1259 OID 15139248)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2473 (class 1259 OID 15139247)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2474 (class 1259 OID 15139249)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2530 (class 1259 OID 15139376)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2592 (class 1259 OID 15139560)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 15139591)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2444 (class 1259 OID 15139153)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2445 (class 1259 OID 15139154)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2567 (class 1259 OID 15139478)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 15139790)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2464 (class 1259 OID 15139218)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 15139778)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2550 (class 1259 OID 15139427)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2551 (class 1259 OID 15139426)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 15139622)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2461 (class 1259 OID 15139206)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 15139573)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2657 (class 1259 OID 15139830)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2631 (class 1259 OID 15139737)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2632 (class 1259 OID 15139738)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2510 (class 1259 OID 15139338)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2430 (class 1259 OID 15139103)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2500 (class 1259 OID 15139311)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2703 (class 2606 OID 15140017)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2706 (class 2606 OID 15140002)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2705 (class 2606 OID 15140007)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2701 (class 2606 OID 15140027)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2707 (class 2606 OID 15139997)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2702 (class 2606 OID 15140022)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2704 (class 2606 OID 15140012)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2737 (class 2606 OID 15140172)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2736 (class 2606 OID 15140177)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2770 (class 2606 OID 15140347)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2771 (class 2606 OID 15140342)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2688 (class 2606 OID 15139932)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2724 (class 2606 OID 15140112)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2765 (class 2606 OID 15140327)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2766 (class 2606 OID 15140322)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2764 (class 2606 OID 15140332)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2767 (class 2606 OID 15140317)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2768 (class 2606 OID 15140312)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2722 (class 2606 OID 15140107)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2723 (class 2606 OID 15140102)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2700 (class 2606 OID 15139992)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2732 (class 2606 OID 15140142)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2730 (class 2606 OID 15140152)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2731 (class 2606 OID 15140147)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2694 (class 2606 OID 15139967)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2695 (class 2606 OID 15139962)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2720 (class 2606 OID 15140092)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2761 (class 2606 OID 15140297)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2740 (class 2606 OID 15140182)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2739 (class 2606 OID 15140187)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2738 (class 2606 OID 15140192)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2769 (class 2606 OID 15140337)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2742 (class 2606 OID 15140212)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2745 (class 2606 OID 15140197)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2741 (class 2606 OID 15140217)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2743 (class 2606 OID 15140207)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2744 (class 2606 OID 15140202)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2692 (class 2606 OID 15139957)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2693 (class 2606 OID 15139952)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2684 (class 2606 OID 15139917)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2685 (class 2606 OID 15139912)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2726 (class 2606 OID 15140122)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2708 (class 2606 OID 15140032)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2681 (class 2606 OID 15139892)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2680 (class 2606 OID 15139897)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2727 (class 2606 OID 15140137)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2728 (class 2606 OID 15140132)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2729 (class 2606 OID 15140127)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2698 (class 2606 OID 15139972)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2696 (class 2606 OID 15139982)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2697 (class 2606 OID 15139977)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2763 (class 2606 OID 15140307)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2712 (class 2606 OID 15140067)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2714 (class 2606 OID 15140057)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2715 (class 2606 OID 15140052)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2713 (class 2606 OID 15140062)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2679 (class 2606 OID 15139882)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2678 (class 2606 OID 15139887)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2725 (class 2606 OID 15140117)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2774 (class 2606 OID 15140362)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2776 (class 2606 OID 15140367)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2775 (class 2606 OID 15140372)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2721 (class 2606 OID 15140097)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2735 (class 2606 OID 15140162)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2734 (class 2606 OID 15140167)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2752 (class 2606 OID 15140272)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2753 (class 2606 OID 15140267)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2756 (class 2606 OID 15140252)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2755 (class 2606 OID 15140257)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2754 (class 2606 OID 15140262)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2690 (class 2606 OID 15139942)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2691 (class 2606 OID 15139937)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2689 (class 2606 OID 15139947)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2759 (class 2606 OID 15140282)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2758 (class 2606 OID 15140287)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2749 (class 2606 OID 15140242)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2748 (class 2606 OID 15140247)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2751 (class 2606 OID 15140232)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2750 (class 2606 OID 15140237)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2733 (class 2606 OID 15140157)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2716 (class 2606 OID 15140087)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2717 (class 2606 OID 15140082)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2719 (class 2606 OID 15140072)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2718 (class 2606 OID 15140077)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2746 (class 2606 OID 15140227)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2747 (class 2606 OID 15140222)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2757 (class 2606 OID 15140277)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2699 (class 2606 OID 15139987)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2760 (class 2606 OID 15140292)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2762 (class 2606 OID 15140302)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2773 (class 2606 OID 15140352)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2772 (class 2606 OID 15140357)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2682 (class 2606 OID 15139907)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2683 (class 2606 OID 15139902)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2687 (class 2606 OID 15139922)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2686 (class 2606 OID 15139927)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2709 (class 2606 OID 15140047)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2710 (class 2606 OID 15140042)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2711 (class 2606 OID 15140037)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-21 08:49:23 CEST

--
-- PostgreSQL database dump complete
--

