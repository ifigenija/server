--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-21 11:37:37 CEST

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
-- TOC entry 177 (class 1259 OID 15166130)
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
-- TOC entry 222 (class 1259 OID 15166633)
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
-- TOC entry 221 (class 1259 OID 15166616)
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
-- TOC entry 215 (class 1259 OID 15166528)
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
-- TOC entry 238 (class 1259 OID 15166877)
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
-- TOC entry 191 (class 1259 OID 15166309)
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
-- TOC entry 194 (class 1259 OID 15166343)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 15166779)
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
-- TOC entry 186 (class 1259 OID 15166252)
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
-- TOC entry 223 (class 1259 OID 15166646)
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
-- TOC entry 210 (class 1259 OID 15166473)
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
-- TOC entry 189 (class 1259 OID 15166289)
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
-- TOC entry 193 (class 1259 OID 15166337)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 15166269)
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
-- TOC entry 199 (class 1259 OID 15166390)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 236 (class 1259 OID 15166858)
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
-- TOC entry 237 (class 1259 OID 15166870)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 15166892)
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
-- TOC entry 203 (class 1259 OID 15166415)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 15166226)
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
-- TOC entry 178 (class 1259 OID 15166139)
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
-- TOC entry 179 (class 1259 OID 15166150)
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
-- TOC entry 174 (class 1259 OID 15166104)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 15166123)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 15166422)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 15166453)
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
-- TOC entry 218 (class 1259 OID 15166567)
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
-- TOC entry 181 (class 1259 OID 15166183)
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
-- TOC entry 183 (class 1259 OID 15166218)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 15166396)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 15166203)
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
-- TOC entry 188 (class 1259 OID 15166281)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 15166408)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 15166740)
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
-- TOC entry 226 (class 1259 OID 15166750)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 224 (class 1259 OID 15166696)
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
-- TOC entry 227 (class 1259 OID 15166758)
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
-- TOC entry 206 (class 1259 OID 15166437)
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
-- TOC entry 198 (class 1259 OID 15166381)
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
-- TOC entry 197 (class 1259 OID 15166371)
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
-- TOC entry 217 (class 1259 OID 15166556)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 15166505)
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
-- TOC entry 171 (class 1259 OID 15166075)
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
-- TOC entry 170 (class 1259 OID 15166073)
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
-- TOC entry 207 (class 1259 OID 15166447)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 15166113)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 15166097)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 15166461)
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
-- TOC entry 201 (class 1259 OID 15166402)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 15166348)
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
-- TOC entry 232 (class 1259 OID 15166799)
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
-- TOC entry 231 (class 1259 OID 15166791)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 15166786)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 15166515)
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
-- TOC entry 180 (class 1259 OID 15166175)
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
-- TOC entry 196 (class 1259 OID 15166358)
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
-- TOC entry 216 (class 1259 OID 15166545)
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
-- TOC entry 228 (class 1259 OID 15166768)
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
-- TOC entry 185 (class 1259 OID 15166238)
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
-- TOC entry 172 (class 1259 OID 15166084)
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
-- TOC entry 220 (class 1259 OID 15166593)
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
-- TOC entry 190 (class 1259 OID 15166300)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 15166429)
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
-- TOC entry 234 (class 1259 OID 15166838)
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
-- TOC entry 233 (class 1259 OID 15166810)
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
-- TOC entry 235 (class 1259 OID 15166850)
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
-- TOC entry 212 (class 1259 OID 15166498)
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
-- TOC entry 192 (class 1259 OID 15166332)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 15166583)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 15166488)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2170 (class 2604 OID 15166078)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2891 (class 0 OID 15166130)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 15166633)
-- Dependencies: 222
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55d6-f161-4b10-f22d4129e46c	000d0000-55d6-f161-51c7-9911a6eedcc8	\N	00090000-55d6-f160-bad8-76eaaa51b6c1	000b0000-55d6-f161-0b6d-f3d455ad5f6a	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55d6-f161-ee1f-b503cf461e50	000d0000-55d6-f161-871e-f47663188531	00100000-55d6-f161-6cab-d91362adf8ce	00090000-55d6-f161-4cc8-912cac6a1d51	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55d6-f161-913f-ab218f9728a2	000d0000-55d6-f161-71e0-9ae9939ab80c	00100000-55d6-f161-32a9-679b3610f016	00090000-55d6-f160-1ea3-b65f5ca4a803	\N	0003	t	\N	2015-08-21	\N	2	\N	\N	f	f
000c0000-55d6-f161-d5c3-ceb85dd5f026	000d0000-55d6-f161-60ac-e2b48a454049	\N	00090000-55d6-f160-24e6-774a08cee816	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55d6-f161-4558-87eb1f69925d	000d0000-55d6-f161-cd66-ce4f51e90f82	\N	00090000-55d6-f161-5a19-0bb083b0aa78	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55d6-f161-aaba-cbe843799599	000d0000-55d6-f161-682b-9b47fdfb8ac6	\N	00090000-55d6-f161-beec-06e51dc98f0e	000b0000-55d6-f161-de62-87870c51c29a	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55d6-f161-24e7-d811f2ae50c7	000d0000-55d6-f161-d5b6-bf3c8d3fc65e	00100000-55d6-f161-a40c-dbae41ba5ecb	00090000-55d6-f161-e6d9-143dffd390aa	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55d6-f161-57ea-234ea86e18f0	000d0000-55d6-f161-d81d-8347b376b263	\N	00090000-55d6-f161-71ff-5e7b8b086e1d	000b0000-55d6-f161-55d7-44da93b0f593	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55d6-f161-b5b1-fac3ded52216	000d0000-55d6-f161-d5b6-bf3c8d3fc65e	00100000-55d6-f161-2c76-a6b5cba95ad3	00090000-55d6-f161-d234-9e840ab06daf	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55d6-f161-c7ca-baadee0591fe	000d0000-55d6-f161-d5b6-bf3c8d3fc65e	00100000-55d6-f161-5985-c0b865dfea14	00090000-55d6-f161-0c4a-32f9b1b9fb3a	\N	0010	t	\N	2015-08-21	\N	16	\N	\N	f	t
000c0000-55d6-f161-50b1-ced09a87c548	000d0000-55d6-f161-d5b6-bf3c8d3fc65e	00100000-55d6-f161-75b8-1a5d9029de0f	00090000-55d6-f161-2f3e-422ec350fd1c	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2935 (class 0 OID 15166616)
-- Dependencies: 221
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 15166528)
-- Dependencies: 215
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55d6-f160-df46-3cb3c891731a	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55d6-f160-48b5-31fbee3b51e6	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55d6-f160-7ebb-d16b7e73afee	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2952 (class 0 OID 15166877)
-- Dependencies: 238
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 15166309)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55d6-f161-3f2d-4ad3897e7ddc	\N	\N	00200000-55d6-f161-f726-f3f327877a6b	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55d6-f161-2283-0373d81749a8	\N	\N	00200000-55d6-f161-0b7a-76965b7bbc5f	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55d6-f161-3f08-91a743e76934	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55d6-f161-63ff-fa365b7f28e9	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55d6-f161-324a-e233a9901616	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2908 (class 0 OID 15166343)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2943 (class 0 OID 15166779)
-- Dependencies: 229
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 15166252)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55d6-f15f-fffb-fe8879d87df6	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55d6-f15f-4e59-13cb11edf0c8	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55d6-f15f-7345-3bedcb834476	AL	ALB	008	Albania 	Albanija	\N
00040000-55d6-f15f-be95-6e15f39eb358	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55d6-f15f-c7e4-7c326533febd	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55d6-f15f-8e3e-64cbe84c05c1	AD	AND	020	Andorra 	Andora	\N
00040000-55d6-f15f-16ec-ed02d0da9017	AO	AGO	024	Angola 	Angola	\N
00040000-55d6-f15f-8583-f641af110603	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55d6-f15f-a773-f3c2487f43ee	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55d6-f15f-d8bb-2291ca2d20ae	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55d6-f15f-b5f3-925fb17077e4	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55d6-f15f-5077-e6587805bd79	AM	ARM	051	Armenia 	Armenija	\N
00040000-55d6-f15f-4df5-ae878872c00d	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55d6-f15f-e0f7-4a88682725e1	AU	AUS	036	Australia 	Avstralija	\N
00040000-55d6-f15f-042d-dae3b308c9df	AT	AUT	040	Austria 	Avstrija	\N
00040000-55d6-f15f-fca0-933f840b77ea	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55d6-f15f-e391-42222d16aa45	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55d6-f15f-b136-797d5700619a	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55d6-f15f-dd12-93d6c99bdb5c	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55d6-f15f-28b7-ab3b86e55fd7	BB	BRB	052	Barbados 	Barbados	\N
00040000-55d6-f15f-8c9b-0dfd5e703e8a	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55d6-f15f-d531-afae7ba0b99e	BE	BEL	056	Belgium 	Belgija	\N
00040000-55d6-f15f-bbd5-17d1961da1c6	BZ	BLZ	084	Belize 	Belize	\N
00040000-55d6-f15f-8c51-8316311f2320	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55d6-f15f-2504-1e74acf13f70	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55d6-f15f-5bb8-ad3806a403b8	BT	BTN	064	Bhutan 	Butan	\N
00040000-55d6-f15f-c73e-9667bf5e9b2f	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55d6-f15f-dca2-9e4d84ca5711	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55d6-f15f-344c-be13b7da36d6	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55d6-f15f-f5be-fdcee57bf03c	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55d6-f15f-d4bd-35e5738ee988	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55d6-f15f-00b6-e230b0c676d1	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55d6-f15f-1393-78e15ec589fe	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55d6-f15f-07aa-152aab83c23e	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55d6-f15f-7913-062720cf079c	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55d6-f15f-8094-600f367524f0	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55d6-f15f-ab07-e1446a956f01	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55d6-f15f-c9e8-d7374a974c4c	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55d6-f15f-b48a-48d64808072a	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55d6-f15f-7f63-428868e8d194	CA	CAN	124	Canada 	Kanada	\N
00040000-55d6-f15f-8a81-280a93d215c8	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55d6-f15f-d466-37005eff4efa	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55d6-f15f-60ad-4b40c6a47b36	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55d6-f15f-f780-b770a9c38a61	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55d6-f15f-9817-7822da20fac8	CL	CHL	152	Chile 	Čile	\N
00040000-55d6-f15f-e2c0-32226da7b2e5	CN	CHN	156	China 	Kitajska	\N
00040000-55d6-f15f-06be-1faee95b7254	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55d6-f15f-f493-17a845f27c0b	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55d6-f15f-0adc-3c08f99e695f	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55d6-f15f-d0bf-7b045551919e	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55d6-f15f-dbbf-04c2fd7533c8	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55d6-f15f-f785-473c8055a0da	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55d6-f15f-4fc5-032eab7e9318	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55d6-f15f-6695-81f800626556	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55d6-f15f-e375-8646de530163	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55d6-f15f-2c88-2ef0c13446c9	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55d6-f15f-dc08-98f82f2d70c8	CU	CUB	192	Cuba 	Kuba	\N
00040000-55d6-f15f-450b-82bf1ce5aa78	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55d6-f15f-8f6d-21f4584d4461	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55d6-f15f-ea27-5097bab4814b	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55d6-f15f-0dd8-b1ba0c3f23c9	DK	DNK	208	Denmark 	Danska	\N
00040000-55d6-f15f-98dd-adcbd45007f9	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55d6-f15f-ca2f-08d439d2d26d	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55d6-f15f-a17f-d7507891ba12	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55d6-f15f-68bb-827644c69d50	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55d6-f15f-b33d-e00428c32ef5	EG	EGY	818	Egypt 	Egipt	\N
00040000-55d6-f15f-072e-6cfff345dc16	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55d6-f15f-219c-b026965ee8af	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55d6-f15f-4664-3d42a4e6ed26	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55d6-f15f-a82e-14581e4683cc	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55d6-f15f-50c7-56ef5a048dbc	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55d6-f15f-dbf2-5eb68ceaf43b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55d6-f15f-0132-59bf0493fb3a	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55d6-f15f-4461-cf9367e3dfa8	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55d6-f15f-8271-ae58fc51a3bd	FI	FIN	246	Finland 	Finska	\N
00040000-55d6-f15f-c712-06593368be54	FR	FRA	250	France 	Francija	\N
00040000-55d6-f15f-98b5-297bfa6d9362	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55d6-f15f-a738-f70ecc099fd5	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55d6-f15f-5646-5a72539a28fe	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55d6-f15f-1d07-afeb75d161ca	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55d6-f15f-caa0-f32fd3a98bbc	GA	GAB	266	Gabon 	Gabon	\N
00040000-55d6-f15f-4b57-401b7047fb65	GM	GMB	270	Gambia 	Gambija	\N
00040000-55d6-f15f-4481-9d70e234d916	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55d6-f15f-ec4c-8fb8a2116113	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55d6-f15f-d7d8-5624947acc2e	GH	GHA	288	Ghana 	Gana	\N
00040000-55d6-f15f-4502-26e504e31956	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55d6-f15f-512a-ec4089e37c20	GR	GRC	300	Greece 	Grčija	\N
00040000-55d6-f15f-60d7-ed33f5830b92	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55d6-f15f-d118-c76688605579	GD	GRD	308	Grenada 	Grenada	\N
00040000-55d6-f15f-64bf-e5fc8b4e3c8f	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55d6-f15f-b886-aab71f02d54e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55d6-f15f-cdf2-3550917cd66a	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55d6-f15f-8b67-1c04e576607f	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55d6-f15f-ddc2-0aa00dd36c0f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55d6-f15f-ec80-0baeb3fffc2f	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55d6-f15f-0f68-a2a9851daa68	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55d6-f15f-63de-5548e93c33f8	HT	HTI	332	Haiti 	Haiti	\N
00040000-55d6-f15f-22c5-f958121f2d06	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55d6-f15f-a2ff-35a1db855177	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55d6-f15f-ce61-ba1c3dfbd8ff	HN	HND	340	Honduras 	Honduras	\N
00040000-55d6-f15f-11f0-abda003db9db	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55d6-f15f-c86e-a41f9056468f	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55d6-f15f-18c3-01cf798a0283	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55d6-f15f-34c2-c74130435cf2	IN	IND	356	India 	Indija	\N
00040000-55d6-f15f-6d0b-190f1338fadd	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55d6-f15f-a010-e96d25c7a5db	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55d6-f15f-c0ed-bfb7b20f74bb	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55d6-f15f-8e4b-2e3e66093634	IE	IRL	372	Ireland 	Irska	\N
00040000-55d6-f15f-d2f6-b855b0e37cc0	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55d6-f15f-0d17-8acd8745ddb2	IL	ISR	376	Israel 	Izrael	\N
00040000-55d6-f15f-e090-84aa2045ec54	IT	ITA	380	Italy 	Italija	\N
00040000-55d6-f15f-84b1-aabb09a510b1	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55d6-f15f-1402-d2b5584c3f5d	JP	JPN	392	Japan 	Japonska	\N
00040000-55d6-f15f-07d0-311631df9948	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55d6-f15f-a766-172afdae2d0c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55d6-f15f-8819-6e249d3e4cb7	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55d6-f15f-8543-48fbb90233fd	KE	KEN	404	Kenya 	Kenija	\N
00040000-55d6-f15f-2401-a9aae73e935b	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55d6-f15f-4e3a-ab4f1575252c	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55d6-f15f-b9c1-8406be5ecbe9	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55d6-f15f-f50a-555c113871ad	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55d6-f15f-bf99-90e932fd6180	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55d6-f15f-6353-6bcfd544f649	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55d6-f15f-1644-c42685a6d2c8	LV	LVA	428	Latvia 	Latvija	\N
00040000-55d6-f15f-3cc0-490857ebee9c	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55d6-f15f-8b5c-2b1c941c39e1	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55d6-f15f-862d-6d7174dcd13b	LR	LBR	430	Liberia 	Liberija	\N
00040000-55d6-f15f-326e-9f2bf50b1a8f	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55d6-f15f-0542-97b0a96f9de4	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55d6-f15f-b86d-facad88b340b	LT	LTU	440	Lithuania 	Litva	\N
00040000-55d6-f15f-2d69-95ec48c1139c	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55d6-f15f-8d82-da0aa56368b2	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55d6-f15f-be8e-146f37fc1439	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55d6-f15f-5435-65effbd70c3d	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55d6-f15f-86f6-a7e9abc680c7	MW	MWI	454	Malawi 	Malavi	\N
00040000-55d6-f15f-d048-c8630b9a46c4	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55d6-f15f-e15a-4db56bb74c49	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55d6-f15f-1062-ad4daec9c306	ML	MLI	466	Mali 	Mali	\N
00040000-55d6-f15f-744d-b3be30f4f8c9	MT	MLT	470	Malta 	Malta	\N
00040000-55d6-f15f-0c33-2cfbd6575600	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55d6-f15f-2062-f25955df0804	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55d6-f15f-6cd8-23fb9aef57d5	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55d6-f15f-7010-306b4136ce55	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55d6-f15f-a1fa-c1c8a5ad9324	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55d6-f15f-6ad6-7a26e38ca843	MX	MEX	484	Mexico 	Mehika	\N
00040000-55d6-f15f-df25-59f91e7dc7e6	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55d6-f15f-7641-a585fd3e93ed	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55d6-f15f-9ca6-933a0e6ba86f	MC	MCO	492	Monaco 	Monako	\N
00040000-55d6-f15f-ef88-508bf9acc5ef	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55d6-f15f-bfb3-18ac4216a7c2	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55d6-f15f-5bb8-4921a4000d96	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55d6-f15f-ce90-f9e2635111c0	MA	MAR	504	Morocco 	Maroko	\N
00040000-55d6-f15f-27b6-576122f80042	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55d6-f15f-5141-973d979b9b7d	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55d6-f15f-b014-2012f9f05e1e	NA	NAM	516	Namibia 	Namibija	\N
00040000-55d6-f15f-6701-bac8b5aba8b5	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55d6-f15f-d782-ae2f663b56c4	NP	NPL	524	Nepal 	Nepal	\N
00040000-55d6-f15f-5824-f5fa7a5e245c	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55d6-f15f-aff6-2bef6d3e5a15	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55d6-f15f-9c77-ec271f1a8d59	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55d6-f15f-d390-205dc0ebd50f	NE	NER	562	Niger 	Niger 	\N
00040000-55d6-f15f-18ea-7c939af3b2e2	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55d6-f15f-503b-385ab8c44ab3	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55d6-f15f-ce63-d098f17a071e	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55d6-f15f-05d9-a6f50c36bedb	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55d6-f15f-99b4-6d0ac335db46	NO	NOR	578	Norway 	Norveška	\N
00040000-55d6-f15f-f968-4c49f21f138c	OM	OMN	512	Oman 	Oman	\N
00040000-55d6-f15f-759d-b7d24348d57e	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55d6-f15f-4190-5db103ea648e	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55d6-f15f-730c-ecb2b70399e1	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55d6-f15f-fb98-af8292cf5efe	PA	PAN	591	Panama 	Panama	\N
00040000-55d6-f15f-b5e2-90a1d07fd6c5	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55d6-f15f-3271-46f0ab1bbd49	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55d6-f15f-b7c6-1428c2fd9c1f	PE	PER	604	Peru 	Peru	\N
00040000-55d6-f15f-f417-0107cdcb5c36	PH	PHL	608	Philippines 	Filipini	\N
00040000-55d6-f15f-4e8e-bac9e9311a9e	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55d6-f15f-a41c-6715bb7d2699	PL	POL	616	Poland 	Poljska	\N
00040000-55d6-f15f-5326-33856f2284b0	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55d6-f15f-958c-2e1645e8964b	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55d6-f15f-75f1-08444b5e822b	QA	QAT	634	Qatar 	Katar	\N
00040000-55d6-f15f-7ea9-4d727f1d9e6b	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55d6-f15f-2072-58fe3320f518	RO	ROU	642	Romania 	Romunija	\N
00040000-55d6-f15f-7a87-e778431fc558	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55d6-f15f-8fd0-32f6d3305a58	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55d6-f15f-4169-ebf9e27ec86f	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55d6-f15f-9bf7-04117e0f67bd	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55d6-f15f-6544-c3a416ad84be	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55d6-f15f-e12b-0e6afbddac82	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55d6-f15f-943c-3942813de2da	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55d6-f15f-7a5e-9f5dddc9b4c6	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55d6-f15f-78f3-f6537556a157	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55d6-f15f-2cb6-77efc6eedaa7	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55d6-f15f-712c-50171958f8ed	SM	SMR	674	San Marino 	San Marino	\N
00040000-55d6-f15f-2dca-d7796c33e04e	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55d6-f15f-cf67-32b7dc6a34d6	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55d6-f15f-e66b-ef9694cbb110	SN	SEN	686	Senegal 	Senegal	\N
00040000-55d6-f15f-ca42-a2778db39e44	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55d6-f15f-9be7-d74238db2c5f	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55d6-f15f-ff0a-0c69e37c60a4	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55d6-f15f-066f-c5ed929a9dc9	SG	SGP	702	Singapore 	Singapur	\N
00040000-55d6-f15f-8ff9-a6f40f9f2ca6	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55d6-f15f-db10-096a2e68e9e8	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55d6-f15f-c561-2a4f15182030	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55d6-f15f-0276-9f3a91bb6f3b	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55d6-f15f-ef53-f03f0921b5a5	SO	SOM	706	Somalia 	Somalija	\N
00040000-55d6-f15f-c3f4-070c086c9bbd	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55d6-f15f-a495-eaddd1b9c199	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55d6-f15f-89c4-9d2179bc4b9a	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55d6-f15f-c685-81cf873cd412	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55d6-f15f-71af-7a1c66c8420b	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55d6-f15f-102c-f3b90b97a9ad	SD	SDN	729	Sudan 	Sudan	\N
00040000-55d6-f15f-f85e-77b80c0fc9dd	SR	SUR	740	Suriname 	Surinam	\N
00040000-55d6-f15f-d933-9ab02ca62c56	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55d6-f15f-fd87-40f3e0d50928	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55d6-f15f-fca8-6efb374aacad	SE	SWE	752	Sweden 	Švedska	\N
00040000-55d6-f15f-ced1-e94523b008aa	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55d6-f15f-426c-b15f8a9962bb	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55d6-f15f-05e7-9c1db802952f	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55d6-f15f-3b43-5e0f5d1fbe51	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55d6-f15f-f96d-9857238e57ec	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55d6-f15f-6770-3a3b4811de72	TH	THA	764	Thailand 	Tajska	\N
00040000-55d6-f15f-ea03-0cc0bb337af1	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55d6-f15f-e671-aafc808609d7	TG	TGO	768	Togo 	Togo	\N
00040000-55d6-f15f-531f-07e07cee9216	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55d6-f15f-e7c1-8811319a47a9	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55d6-f15f-280c-025a26b9851c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55d6-f15f-a7b6-947d25e4f578	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55d6-f15f-035f-10fe2a076a6f	TR	TUR	792	Turkey 	Turčija	\N
00040000-55d6-f15f-30d8-4b333cab158e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55d6-f15f-6b1f-dbe9d0ff743d	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55d6-f15f-4ccf-feeb79b4267e	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55d6-f15f-8c09-a9ac581d42a7	UG	UGA	800	Uganda 	Uganda	\N
00040000-55d6-f15f-aeb8-489a092402cd	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55d6-f15f-583f-a553260e5f8f	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55d6-f15f-7301-306eddced9d0	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55d6-f15f-4b97-cfed4ecc1b91	US	USA	840	United States 	Združene države Amerike	\N
00040000-55d6-f15f-db1c-f911ff0d86fe	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55d6-f15f-970a-2cb81e714432	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55d6-f15f-a650-860114e6e182	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55d6-f15f-afaf-b12a73023f85	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55d6-f15f-294d-f21172de99b7	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55d6-f15f-bdbd-59d67806c239	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55d6-f15f-a401-ac7700cd9eb9	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55d6-f15f-8bae-ba434c39abf8	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55d6-f15f-a972-e2ecbd3227da	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55d6-f15f-1fa6-31d76d518082	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55d6-f15f-988f-07976f9583e0	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55d6-f15f-fc6a-964c508c33b9	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55d6-f15f-c8ac-dd430b9024a0	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2937 (class 0 OID 15166646)
-- Dependencies: 223
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55d6-f161-a5a8-c21db5daa5ba	000e0000-55d6-f161-f958-182fb4fe6f32	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55d6-f160-c24b-e5f7bc95c897	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55d6-f161-5700-6f680e0241f0	000e0000-55d6-f161-4b74-b17463d2e07c	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55d6-f160-80da-6dbdf472d1cd	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55d6-f161-bbb1-c55e0a337b7c	000e0000-55d6-f161-0e05-837d88917249	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55d6-f160-c24b-e5f7bc95c897	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55d6-f161-525f-f7c30330c232	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55d6-f161-0562-971ed50a05b6	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2924 (class 0 OID 15166473)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55d6-f161-d5b6-bf3c8d3fc65e	000e0000-55d6-f161-4b74-b17463d2e07c	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55d6-f160-d285-ef6a22dbbe53
000d0000-55d6-f161-51c7-9911a6eedcc8	000e0000-55d6-f161-4b74-b17463d2e07c	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55d6-f160-d285-ef6a22dbbe53
000d0000-55d6-f161-871e-f47663188531	000e0000-55d6-f161-4b74-b17463d2e07c	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55d6-f160-b4ab-ae62f85d1374
000d0000-55d6-f161-71e0-9ae9939ab80c	000e0000-55d6-f161-4b74-b17463d2e07c	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55d6-f160-ef13-479f8b03e6d5
000d0000-55d6-f161-60ac-e2b48a454049	000e0000-55d6-f161-4b74-b17463d2e07c	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55d6-f160-d4b9-ec69938f1391
000d0000-55d6-f161-cd66-ce4f51e90f82	000e0000-55d6-f161-4b74-b17463d2e07c	\N	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55d6-f160-d4b9-ec69938f1391
000d0000-55d6-f161-682b-9b47fdfb8ac6	000e0000-55d6-f161-4b74-b17463d2e07c	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55d6-f160-d285-ef6a22dbbe53
000d0000-55d6-f161-d81d-8347b376b263	000e0000-55d6-f161-4b74-b17463d2e07c	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55d6-f160-7073-febefabbc8e8
\.


--
-- TOC entry 2903 (class 0 OID 15166289)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 15166337)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 15166269)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55d6-f161-3a0a-283e2957aed6	00080000-55d6-f160-8c16-9181053bfe26	00090000-55d6-f161-0c4a-32f9b1b9fb3a	AK		
\.


--
-- TOC entry 2913 (class 0 OID 15166390)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 15166858)
-- Dependencies: 236
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 15166870)
-- Dependencies: 237
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 15166892)
-- Dependencies: 239
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2917 (class 0 OID 15166415)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 15166226)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55d6-f15f-344d-f5b378e3af18	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55d6-f15f-9a73-e108d1e34cb7	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55d6-f15f-3892-612776f8c47c	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55d6-f15f-770a-a07478ed642a	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55d6-f15f-50d7-8e0d175cc3a7	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55d6-f15f-bb69-d70a85d8c93f	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55d6-f15f-8006-1d056fcd58cc	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55d6-f15f-ef07-a7b1c6b0e7bd	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55d6-f15f-fdd3-1c4f96cd2010	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55d6-f15f-26d0-85f96a062446	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55d6-f15f-d16e-16c6ce1c0d7f	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55d6-f15f-8aeb-2cf20c09bc1c	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55d6-f15f-92c8-d6e6cee7f4d6	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55d6-f15f-09a7-601f9bf8f9b5	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55d6-f160-5751-51cd72cfaacf	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55d6-f160-2ac2-07623113350b	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55d6-f160-6d89-e49c0a44d28a	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55d6-f160-40ad-ae4e3d086577	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55d6-f160-3eb6-35979d21f6e9	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55d6-f160-84e6-629443de7f22	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2892 (class 0 OID 15166139)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55d6-f160-dfe0-6e5148792a88	00000000-55d6-f160-2ac2-07623113350b	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55d6-f160-d28b-8a818a1ff32d	00000000-55d6-f160-2ac2-07623113350b	00010000-55d6-f15f-4ca3-39529de29f3d	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55d6-f160-9fbf-ed83952107d9	00000000-55d6-f160-6d89-e49c0a44d28a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2893 (class 0 OID 15166150)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55d6-f160-bad8-76eaaa51b6c1	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55d6-f160-24e6-774a08cee816	00010000-55d6-f160-1e1f-122575ad2dca	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55d6-f160-1ea3-b65f5ca4a803	00010000-55d6-f160-be26-eba6c5d6951b	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55d6-f161-d234-9e840ab06daf	00010000-55d6-f160-1bf7-e3788f6c2b96	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55d6-f161-cd74-04268f50ef72	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55d6-f161-beec-06e51dc98f0e	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55d6-f161-2f3e-422ec350fd1c	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55d6-f161-e6d9-143dffd390aa	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55d6-f161-0c4a-32f9b1b9fb3a	00010000-55d6-f160-85f3-b81d0ae378b4	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55d6-f161-4cc8-912cac6a1d51	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55d6-f161-542b-cb96ff956c76	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55d6-f161-5a19-0bb083b0aa78	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55d6-f161-71ff-5e7b8b086e1d	00010000-55d6-f160-3258-691844aa2ad1	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2888 (class 0 OID 15166104)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55d6-f15f-71d7-f6f38567e8b7	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55d6-f15f-7b4b-d4984c5c1400	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55d6-f15f-efa7-88f5f1acd62d	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55d6-f15f-c9d6-953006519ebf	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55d6-f15f-1259-2fabbf3acb4e	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55d6-f15f-a268-401498bacc93	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55d6-f15f-3c5f-ebdfcc17dce3	Abonma-read	Abonma - branje	f
00030000-55d6-f15f-0c6c-628c94ab7ad8	Abonma-write	Abonma - spreminjanje	f
00030000-55d6-f15f-d678-d41b945f4cd7	Alternacija-read	Alternacija - branje	f
00030000-55d6-f15f-ed92-938f9518d0ca	Alternacija-write	Alternacija - spreminjanje	f
00030000-55d6-f15f-cf26-c68dd68eed1f	Arhivalija-read	Arhivalija - branje	f
00030000-55d6-f15f-99b6-cdcf02289e11	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55d6-f15f-15d8-e44c420c9a98	Besedilo-read	Besedilo - branje	f
00030000-55d6-f15f-e3bd-ba8bce014147	Besedilo-write	Besedilo - spreminjanje	f
00030000-55d6-f15f-7cf9-4fc3b28d3d12	DogodekIzven-read	DogodekIzven - branje	f
00030000-55d6-f15f-6fec-b4abe664e527	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55d6-f15f-179a-4f4ddbc40e77	Dogodek-read	Dogodek - branje	f
00030000-55d6-f15f-795d-d5d9106e1482	Dogodek-write	Dogodek - spreminjanje	f
00030000-55d6-f15f-8054-3b315688b6d8	DrugiVir-read	DrugiVir - branje	f
00030000-55d6-f15f-061e-b2e02855b5ca	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55d6-f15f-4752-765444f9a671	Drzava-read	Drzava - branje	f
00030000-55d6-f15f-3239-2ae2ea72bf16	Drzava-write	Drzava - spreminjanje	f
00030000-55d6-f15f-1680-0b52493f480c	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55d6-f15f-a2a3-5891438af1ca	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55d6-f15f-f02c-19486ad7d95b	Funkcija-read	Funkcija - branje	f
00030000-55d6-f15f-f0f8-f3209d6fe3a2	Funkcija-write	Funkcija - spreminjanje	f
00030000-55d6-f15f-5376-acacaa606844	Gostovanje-read	Gostovanje - branje	f
00030000-55d6-f15f-4476-56a5809c3b1c	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55d6-f15f-b6f8-ac1bae8633d7	Gostujoca-read	Gostujoca - branje	f
00030000-55d6-f15f-6048-0c6ed7bfa214	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55d6-f15f-9071-e27670aab047	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55d6-f15f-152f-5e887366edf0	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55d6-f15f-922e-9c708709caea	Kupec-read	Kupec - branje	f
00030000-55d6-f15f-83b8-de719b066c49	Kupec-write	Kupec - spreminjanje	f
00030000-55d6-f15f-83ab-ccf9d6cc2500	NacinPlacina-read	NacinPlacina - branje	f
00030000-55d6-f15f-ad5b-d8e6d314418c	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55d6-f15f-4f54-4ad9ecf75fbc	Option-read	Option - branje	f
00030000-55d6-f15f-da77-2a7d6e8f621b	Option-write	Option - spreminjanje	f
00030000-55d6-f15f-38e9-611abbc84ac0	OptionValue-read	OptionValue - branje	f
00030000-55d6-f15f-1046-08b02ff306a7	OptionValue-write	OptionValue - spreminjanje	f
00030000-55d6-f15f-5d41-592ee77b1f09	Oseba-read	Oseba - branje	f
00030000-55d6-f15f-77ac-31d5ed3f2c19	Oseba-write	Oseba - spreminjanje	f
00030000-55d6-f15f-bdfa-c99f07d6afcd	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55d6-f15f-9c9e-eb9f4ca6beef	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55d6-f15f-8973-8fdb2b04ef79	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55d6-f15f-e196-52afbb35c895	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55d6-f15f-2aba-87f38ebe5cfa	Pogodba-read	Pogodba - branje	f
00030000-55d6-f15f-36ad-bd8b1baad163	Pogodba-write	Pogodba - spreminjanje	f
00030000-55d6-f15f-1077-f8b9a8f7b1cd	Popa-read	Popa - branje	f
00030000-55d6-f15f-e05c-4c4e35f55e26	Popa-write	Popa - spreminjanje	f
00030000-55d6-f15f-4b27-d14dcdb7bdf4	Posta-read	Posta - branje	f
00030000-55d6-f15f-f9bd-68586d43eeac	Posta-write	Posta - spreminjanje	f
00030000-55d6-f15f-a1cf-e3550d8d9323	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55d6-f15f-f04b-336013120cff	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55d6-f15f-93c0-36a88609e5ab	PostniNaslov-read	PostniNaslov - branje	f
00030000-55d6-f15f-75b1-4ea6109a7845	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55d6-f15f-9028-76deae70da4b	Predstava-read	Predstava - branje	f
00030000-55d6-f15f-525d-166206e32e94	Predstava-write	Predstava - spreminjanje	f
00030000-55d6-f15f-da5e-ab24a9db3abc	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55d6-f15f-2edf-f076cf0c2862	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55d6-f15f-9368-a19b5cde83dc	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55d6-f15f-5934-d7516060c2cc	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55d6-f15f-1746-663b6af696eb	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55d6-f15f-28d5-7f41be32aed3	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55d6-f15f-78e0-78b870d33349	ProgramDela-read	ProgramDela - branje	f
00030000-55d6-f15f-94a4-567fe17793e5	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55d6-f15f-1c3d-34ad708b82af	ProgramFestival-read	ProgramFestival - branje	f
00030000-55d6-f15f-c3a1-25a9bd8a68e2	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55d6-f15f-9f1a-885c300562eb	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55d6-f15f-71f9-2e5896bf0777	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55d6-f15f-abfa-c91fcb722b24	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55d6-f15f-dfa9-c7fec9479564	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55d6-f15f-1747-4de3e4f9b044	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55d6-f15f-3445-dd92766dffa7	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55d6-f15f-153e-44317a516d70	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55d6-f15f-e0c5-fd48c1dbc2b4	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55d6-f15f-c7c3-0eef44e2d021	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55d6-f15f-24e4-9d5863465013	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55d6-f15f-0739-3d72e54100e7	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55d6-f15f-cca9-c305bc042389	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55d6-f15f-dbed-88756e5087bd	ProgramRazno-read	ProgramRazno - branje	f
00030000-55d6-f15f-b769-9e2a5c8affe0	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55d6-f15f-7a47-4463a079f2f5	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55d6-f15f-3bdd-c2f794341776	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55d6-f15f-455b-0e0739d91308	Prostor-read	Prostor - branje	f
00030000-55d6-f15f-020d-2ee4d6f9cfe1	Prostor-write	Prostor - spreminjanje	f
00030000-55d6-f15f-0acc-f136c952df15	Racun-read	Racun - branje	f
00030000-55d6-f15f-d354-18455d85f6b0	Racun-write	Racun - spreminjanje	f
00030000-55d6-f15f-a94c-1d2180497aba	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55d6-f15f-004b-6f5d2e20fe27	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55d6-f15f-0354-d71ef524d918	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55d6-f15f-4c83-e0e74f328dda	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55d6-f15f-08d8-044dc96650d2	Rekvizit-read	Rekvizit - branje	f
00030000-55d6-f15f-4c3d-4e0a462cabb8	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55d6-f15f-f6aa-fe513d0f0403	Revizija-read	Revizija - branje	f
00030000-55d6-f15f-f304-6a8baf02cfab	Revizija-write	Revizija - spreminjanje	f
00030000-55d6-f15f-3ae5-6e90d8492724	Rezervacija-read	Rezervacija - branje	f
00030000-55d6-f15f-09fd-82cc1f7e4527	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55d6-f15f-ec41-cc316a01a866	SedezniRed-read	SedezniRed - branje	f
00030000-55d6-f15f-ed59-18c8ed3343f4	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55d6-f15f-58c7-fc54696887ee	Sedez-read	Sedez - branje	f
00030000-55d6-f15f-e678-8cc78d282b35	Sedez-write	Sedez - spreminjanje	f
00030000-55d6-f15f-1981-282bfac33377	Sezona-read	Sezona - branje	f
00030000-55d6-f15f-10ae-fcb93fa343db	Sezona-write	Sezona - spreminjanje	f
00030000-55d6-f15f-2c73-f03bcf3aca25	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55d6-f15f-180f-553b91fae3d6	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55d6-f15f-b4e5-c110c3ccf5b5	Stevilcenje-read	Stevilcenje - branje	f
00030000-55d6-f15f-2a71-180e51465c97	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55d6-f15f-8e00-36d50f92fdb6	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55d6-f15f-38ad-8a3f49382c28	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55d6-f15f-2441-c1b233f8d12f	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55d6-f15f-429d-05bac45a3230	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55d6-f15f-c545-6de3261ac9c0	Telefonska-read	Telefonska - branje	f
00030000-55d6-f15f-390b-a29382ede3b2	Telefonska-write	Telefonska - spreminjanje	f
00030000-55d6-f15f-ff79-203567963459	TerminStoritve-read	TerminStoritve - branje	f
00030000-55d6-f15f-d86e-f4c00a5ef1ac	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55d6-f15f-24c5-34bb5e64f98e	TipFunkcije-read	TipFunkcije - branje	f
00030000-55d6-f15f-d59e-320fd160818c	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55d6-f15f-d30a-0bc04707be08	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55d6-f15f-24b6-5131b10a7a13	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55d6-f15f-050f-bd519b83acec	Trr-read	Trr - branje	f
00030000-55d6-f15f-cc75-1add34236d84	Trr-write	Trr - spreminjanje	f
00030000-55d6-f15f-e629-7ed0c0ac8292	Uprizoritev-read	Uprizoritev - branje	f
00030000-55d6-f15f-32d6-539386539678	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55d6-f15f-9421-c2a8ddf5afee	Vaja-read	Vaja - branje	f
00030000-55d6-f15f-e755-96e2848d40ec	Vaja-write	Vaja - spreminjanje	f
00030000-55d6-f15f-3842-3f61fbd8a031	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55d6-f15f-d152-495f994824e1	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55d6-f15f-1f82-988d4658aa40	Zaposlitev-read	Zaposlitev - branje	f
00030000-55d6-f15f-46dc-9a156d1eca57	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55d6-f15f-2639-a17dc40c7a53	Zasedenost-read	Zasedenost - branje	f
00030000-55d6-f15f-3b01-a846d1845648	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55d6-f15f-5b91-3ced761509d6	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55d6-f15f-4b5b-8642f1970ca0	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55d6-f15f-cc03-3403dda31fe6	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55d6-f15f-9261-73d1bc7b134d	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55d6-f15f-e27e-9b6ee4cc4d4f	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55d6-f15f-fda3-0ee6658ea67e	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55d6-f15f-0e6f-ba07ea230a0c	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55d6-f15f-a481-a3e538a85a24	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55d6-f15f-963c-f22f45d65f60	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55d6-f15f-6a70-95d667720331	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55d6-f15f-8aa4-79e126a89be8	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55d6-f15f-38d7-bbf26a2c99ac	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55d6-f15f-3dca-122cc9aad755	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55d6-f15f-05b2-901731a78c96	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55d6-f15f-3468-ac6ff135e5bf	Datoteka-write	Datoteka - spreminjanje	f
00030000-55d6-f15f-1ae4-95b46b5e7842	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2890 (class 0 OID 15166123)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55d6-f15f-0eb5-3252aa6a270b	00030000-55d6-f15f-7b4b-d4984c5c1400
00020000-55d6-f15f-b8f3-cd5ef74409b1	00030000-55d6-f15f-4752-765444f9a671
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-3c5f-ebdfcc17dce3
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-0c6c-628c94ab7ad8
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-d678-d41b945f4cd7
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-ed92-938f9518d0ca
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-cf26-c68dd68eed1f
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-179a-4f4ddbc40e77
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-c9d6-953006519ebf
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-795d-d5d9106e1482
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-4752-765444f9a671
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-3239-2ae2ea72bf16
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-f02c-19486ad7d95b
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-f0f8-f3209d6fe3a2
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-5376-acacaa606844
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-4476-56a5809c3b1c
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-b6f8-ac1bae8633d7
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-6048-0c6ed7bfa214
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-9071-e27670aab047
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-152f-5e887366edf0
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-4f54-4ad9ecf75fbc
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-38e9-611abbc84ac0
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-5d41-592ee77b1f09
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-77ac-31d5ed3f2c19
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-1077-f8b9a8f7b1cd
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-e05c-4c4e35f55e26
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-4b27-d14dcdb7bdf4
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-f9bd-68586d43eeac
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-93c0-36a88609e5ab
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-75b1-4ea6109a7845
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-9028-76deae70da4b
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-525d-166206e32e94
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-1746-663b6af696eb
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-28d5-7f41be32aed3
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-455b-0e0739d91308
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-020d-2ee4d6f9cfe1
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-0354-d71ef524d918
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-4c83-e0e74f328dda
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-08d8-044dc96650d2
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-4c3d-4e0a462cabb8
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-1981-282bfac33377
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-10ae-fcb93fa343db
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-24c5-34bb5e64f98e
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-e629-7ed0c0ac8292
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-32d6-539386539678
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-9421-c2a8ddf5afee
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-e755-96e2848d40ec
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-2639-a17dc40c7a53
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-3b01-a846d1845648
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-5b91-3ced761509d6
00020000-55d6-f15f-a82e-3c6f82a4ffed	00030000-55d6-f15f-cc03-3403dda31fe6
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-3c5f-ebdfcc17dce3
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-cf26-c68dd68eed1f
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-179a-4f4ddbc40e77
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-4752-765444f9a671
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-5376-acacaa606844
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-b6f8-ac1bae8633d7
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-9071-e27670aab047
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-152f-5e887366edf0
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-4f54-4ad9ecf75fbc
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-38e9-611abbc84ac0
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-5d41-592ee77b1f09
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-77ac-31d5ed3f2c19
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-1077-f8b9a8f7b1cd
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-4b27-d14dcdb7bdf4
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-93c0-36a88609e5ab
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-75b1-4ea6109a7845
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-9028-76deae70da4b
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-455b-0e0739d91308
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-0354-d71ef524d918
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-08d8-044dc96650d2
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-1981-282bfac33377
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-c545-6de3261ac9c0
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-390b-a29382ede3b2
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-050f-bd519b83acec
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-cc75-1add34236d84
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-1f82-988d4658aa40
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-46dc-9a156d1eca57
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-5b91-3ced761509d6
00020000-55d6-f15f-47af-6855eb472e6a	00030000-55d6-f15f-cc03-3403dda31fe6
00020000-55d6-f15f-f832-7c74e32e739f	00030000-55d6-f15f-3c5f-ebdfcc17dce3
00020000-55d6-f15f-f832-7c74e32e739f	00030000-55d6-f15f-d678-d41b945f4cd7
00020000-55d6-f15f-f832-7c74e32e739f	00030000-55d6-f15f-cf26-c68dd68eed1f
00020000-55d6-f15f-f832-7c74e32e739f	00030000-55d6-f15f-99b6-cdcf02289e11
00020000-55d6-f15f-f832-7c74e32e739f	00030000-55d6-f15f-15d8-e44c420c9a98
00020000-55d6-f15f-f832-7c74e32e739f	00030000-55d6-f15f-7cf9-4fc3b28d3d12
00020000-55d6-f15f-f832-7c74e32e739f	00030000-55d6-f15f-179a-4f4ddbc40e77
00020000-55d6-f15f-f832-7c74e32e739f	00030000-55d6-f15f-4752-765444f9a671
00020000-55d6-f15f-f832-7c74e32e739f	00030000-55d6-f15f-f02c-19486ad7d95b
00020000-55d6-f15f-f832-7c74e32e739f	00030000-55d6-f15f-5376-acacaa606844
00020000-55d6-f15f-f832-7c74e32e739f	00030000-55d6-f15f-b6f8-ac1bae8633d7
00020000-55d6-f15f-f832-7c74e32e739f	00030000-55d6-f15f-9071-e27670aab047
00020000-55d6-f15f-f832-7c74e32e739f	00030000-55d6-f15f-4f54-4ad9ecf75fbc
00020000-55d6-f15f-f832-7c74e32e739f	00030000-55d6-f15f-38e9-611abbc84ac0
00020000-55d6-f15f-f832-7c74e32e739f	00030000-55d6-f15f-5d41-592ee77b1f09
00020000-55d6-f15f-f832-7c74e32e739f	00030000-55d6-f15f-1077-f8b9a8f7b1cd
00020000-55d6-f15f-f832-7c74e32e739f	00030000-55d6-f15f-4b27-d14dcdb7bdf4
00020000-55d6-f15f-f832-7c74e32e739f	00030000-55d6-f15f-9028-76deae70da4b
00020000-55d6-f15f-f832-7c74e32e739f	00030000-55d6-f15f-1746-663b6af696eb
00020000-55d6-f15f-f832-7c74e32e739f	00030000-55d6-f15f-455b-0e0739d91308
00020000-55d6-f15f-f832-7c74e32e739f	00030000-55d6-f15f-0354-d71ef524d918
00020000-55d6-f15f-f832-7c74e32e739f	00030000-55d6-f15f-08d8-044dc96650d2
00020000-55d6-f15f-f832-7c74e32e739f	00030000-55d6-f15f-1981-282bfac33377
00020000-55d6-f15f-f832-7c74e32e739f	00030000-55d6-f15f-24c5-34bb5e64f98e
00020000-55d6-f15f-f832-7c74e32e739f	00030000-55d6-f15f-9421-c2a8ddf5afee
00020000-55d6-f15f-f832-7c74e32e739f	00030000-55d6-f15f-2639-a17dc40c7a53
00020000-55d6-f15f-f832-7c74e32e739f	00030000-55d6-f15f-5b91-3ced761509d6
00020000-55d6-f15f-f832-7c74e32e739f	00030000-55d6-f15f-cc03-3403dda31fe6
00020000-55d6-f15f-e728-41d00de360c9	00030000-55d6-f15f-3c5f-ebdfcc17dce3
00020000-55d6-f15f-e728-41d00de360c9	00030000-55d6-f15f-0c6c-628c94ab7ad8
00020000-55d6-f15f-e728-41d00de360c9	00030000-55d6-f15f-ed92-938f9518d0ca
00020000-55d6-f15f-e728-41d00de360c9	00030000-55d6-f15f-cf26-c68dd68eed1f
00020000-55d6-f15f-e728-41d00de360c9	00030000-55d6-f15f-179a-4f4ddbc40e77
00020000-55d6-f15f-e728-41d00de360c9	00030000-55d6-f15f-4752-765444f9a671
00020000-55d6-f15f-e728-41d00de360c9	00030000-55d6-f15f-5376-acacaa606844
00020000-55d6-f15f-e728-41d00de360c9	00030000-55d6-f15f-b6f8-ac1bae8633d7
00020000-55d6-f15f-e728-41d00de360c9	00030000-55d6-f15f-4f54-4ad9ecf75fbc
00020000-55d6-f15f-e728-41d00de360c9	00030000-55d6-f15f-38e9-611abbc84ac0
00020000-55d6-f15f-e728-41d00de360c9	00030000-55d6-f15f-1077-f8b9a8f7b1cd
00020000-55d6-f15f-e728-41d00de360c9	00030000-55d6-f15f-4b27-d14dcdb7bdf4
00020000-55d6-f15f-e728-41d00de360c9	00030000-55d6-f15f-9028-76deae70da4b
00020000-55d6-f15f-e728-41d00de360c9	00030000-55d6-f15f-455b-0e0739d91308
00020000-55d6-f15f-e728-41d00de360c9	00030000-55d6-f15f-0354-d71ef524d918
00020000-55d6-f15f-e728-41d00de360c9	00030000-55d6-f15f-08d8-044dc96650d2
00020000-55d6-f15f-e728-41d00de360c9	00030000-55d6-f15f-1981-282bfac33377
00020000-55d6-f15f-e728-41d00de360c9	00030000-55d6-f15f-24c5-34bb5e64f98e
00020000-55d6-f15f-e728-41d00de360c9	00030000-55d6-f15f-5b91-3ced761509d6
00020000-55d6-f15f-e728-41d00de360c9	00030000-55d6-f15f-cc03-3403dda31fe6
00020000-55d6-f15f-08f5-f1ea2186e8ad	00030000-55d6-f15f-3c5f-ebdfcc17dce3
00020000-55d6-f15f-08f5-f1ea2186e8ad	00030000-55d6-f15f-cf26-c68dd68eed1f
00020000-55d6-f15f-08f5-f1ea2186e8ad	00030000-55d6-f15f-179a-4f4ddbc40e77
00020000-55d6-f15f-08f5-f1ea2186e8ad	00030000-55d6-f15f-4752-765444f9a671
00020000-55d6-f15f-08f5-f1ea2186e8ad	00030000-55d6-f15f-5376-acacaa606844
00020000-55d6-f15f-08f5-f1ea2186e8ad	00030000-55d6-f15f-b6f8-ac1bae8633d7
00020000-55d6-f15f-08f5-f1ea2186e8ad	00030000-55d6-f15f-4f54-4ad9ecf75fbc
00020000-55d6-f15f-08f5-f1ea2186e8ad	00030000-55d6-f15f-38e9-611abbc84ac0
00020000-55d6-f15f-08f5-f1ea2186e8ad	00030000-55d6-f15f-1077-f8b9a8f7b1cd
00020000-55d6-f15f-08f5-f1ea2186e8ad	00030000-55d6-f15f-4b27-d14dcdb7bdf4
00020000-55d6-f15f-08f5-f1ea2186e8ad	00030000-55d6-f15f-9028-76deae70da4b
00020000-55d6-f15f-08f5-f1ea2186e8ad	00030000-55d6-f15f-455b-0e0739d91308
00020000-55d6-f15f-08f5-f1ea2186e8ad	00030000-55d6-f15f-0354-d71ef524d918
00020000-55d6-f15f-08f5-f1ea2186e8ad	00030000-55d6-f15f-08d8-044dc96650d2
00020000-55d6-f15f-08f5-f1ea2186e8ad	00030000-55d6-f15f-1981-282bfac33377
00020000-55d6-f15f-08f5-f1ea2186e8ad	00030000-55d6-f15f-ff79-203567963459
00020000-55d6-f15f-08f5-f1ea2186e8ad	00030000-55d6-f15f-efa7-88f5f1acd62d
00020000-55d6-f15f-08f5-f1ea2186e8ad	00030000-55d6-f15f-24c5-34bb5e64f98e
00020000-55d6-f15f-08f5-f1ea2186e8ad	00030000-55d6-f15f-5b91-3ced761509d6
00020000-55d6-f15f-08f5-f1ea2186e8ad	00030000-55d6-f15f-cc03-3403dda31fe6
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-71d7-f6f38567e8b7
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-7b4b-d4984c5c1400
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-efa7-88f5f1acd62d
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-c9d6-953006519ebf
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-1259-2fabbf3acb4e
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-a268-401498bacc93
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-3c5f-ebdfcc17dce3
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-0c6c-628c94ab7ad8
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-d678-d41b945f4cd7
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-ed92-938f9518d0ca
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-cf26-c68dd68eed1f
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-99b6-cdcf02289e11
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-15d8-e44c420c9a98
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-e3bd-ba8bce014147
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-7cf9-4fc3b28d3d12
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-6fec-b4abe664e527
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-179a-4f4ddbc40e77
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-795d-d5d9106e1482
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-4752-765444f9a671
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-3239-2ae2ea72bf16
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-8054-3b315688b6d8
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-061e-b2e02855b5ca
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-1680-0b52493f480c
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-a2a3-5891438af1ca
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-f02c-19486ad7d95b
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-f0f8-f3209d6fe3a2
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-5376-acacaa606844
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-4476-56a5809c3b1c
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-b6f8-ac1bae8633d7
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-6048-0c6ed7bfa214
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-9071-e27670aab047
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-152f-5e887366edf0
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-922e-9c708709caea
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-83b8-de719b066c49
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-83ab-ccf9d6cc2500
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-ad5b-d8e6d314418c
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-4f54-4ad9ecf75fbc
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-da77-2a7d6e8f621b
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-38e9-611abbc84ac0
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-1046-08b02ff306a7
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-5d41-592ee77b1f09
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-77ac-31d5ed3f2c19
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-bdfa-c99f07d6afcd
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-9c9e-eb9f4ca6beef
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-8973-8fdb2b04ef79
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-e196-52afbb35c895
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-2aba-87f38ebe5cfa
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-36ad-bd8b1baad163
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-1077-f8b9a8f7b1cd
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-e05c-4c4e35f55e26
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-4b27-d14dcdb7bdf4
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-f9bd-68586d43eeac
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-a1cf-e3550d8d9323
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-f04b-336013120cff
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-93c0-36a88609e5ab
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-75b1-4ea6109a7845
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-9028-76deae70da4b
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-525d-166206e32e94
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-da5e-ab24a9db3abc
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-2edf-f076cf0c2862
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-9368-a19b5cde83dc
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-5934-d7516060c2cc
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-1746-663b6af696eb
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-28d5-7f41be32aed3
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-78e0-78b870d33349
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-94a4-567fe17793e5
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-1c3d-34ad708b82af
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-c3a1-25a9bd8a68e2
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-9f1a-885c300562eb
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-71f9-2e5896bf0777
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-abfa-c91fcb722b24
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-dfa9-c7fec9479564
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-1747-4de3e4f9b044
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-3445-dd92766dffa7
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-153e-44317a516d70
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-e0c5-fd48c1dbc2b4
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-c7c3-0eef44e2d021
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-24e4-9d5863465013
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-0739-3d72e54100e7
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-cca9-c305bc042389
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-dbed-88756e5087bd
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-b769-9e2a5c8affe0
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-7a47-4463a079f2f5
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-3bdd-c2f794341776
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-455b-0e0739d91308
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-020d-2ee4d6f9cfe1
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-0acc-f136c952df15
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-d354-18455d85f6b0
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-a94c-1d2180497aba
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-004b-6f5d2e20fe27
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-0354-d71ef524d918
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-4c83-e0e74f328dda
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-08d8-044dc96650d2
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-4c3d-4e0a462cabb8
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-f6aa-fe513d0f0403
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-f304-6a8baf02cfab
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-3ae5-6e90d8492724
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-09fd-82cc1f7e4527
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-ec41-cc316a01a866
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-ed59-18c8ed3343f4
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-58c7-fc54696887ee
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-e678-8cc78d282b35
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-1981-282bfac33377
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-10ae-fcb93fa343db
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-2c73-f03bcf3aca25
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-180f-553b91fae3d6
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-b4e5-c110c3ccf5b5
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-2a71-180e51465c97
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-8e00-36d50f92fdb6
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-38ad-8a3f49382c28
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-2441-c1b233f8d12f
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-429d-05bac45a3230
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-c545-6de3261ac9c0
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-390b-a29382ede3b2
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-ff79-203567963459
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-d86e-f4c00a5ef1ac
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-24c5-34bb5e64f98e
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-d59e-320fd160818c
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-d30a-0bc04707be08
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-24b6-5131b10a7a13
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-050f-bd519b83acec
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-cc75-1add34236d84
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-e629-7ed0c0ac8292
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-32d6-539386539678
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-9421-c2a8ddf5afee
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-e755-96e2848d40ec
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-3842-3f61fbd8a031
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-d152-495f994824e1
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-1f82-988d4658aa40
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-46dc-9a156d1eca57
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-2639-a17dc40c7a53
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-3b01-a846d1845648
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-5b91-3ced761509d6
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-4b5b-8642f1970ca0
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-cc03-3403dda31fe6
00020000-55d6-f160-7f3c-9d10dace4045	00030000-55d6-f15f-9261-73d1bc7b134d
\.


--
-- TOC entry 2918 (class 0 OID 15166422)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2922 (class 0 OID 15166453)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 15166567)
-- Dependencies: 218
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55d6-f161-0b6d-f3d455ad5f6a	00090000-55d6-f160-bad8-76eaaa51b6c1	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55d6-f161-de62-87870c51c29a	00090000-55d6-f161-beec-06e51dc98f0e	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55d6-f161-55d7-44da93b0f593	00090000-55d6-f161-71ff-5e7b8b086e1d	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2895 (class 0 OID 15166183)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55d6-f160-8c16-9181053bfe26	00040000-55d6-f15f-c561-2a4f15182030	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d6-f160-23b3-176aba60c8b6	00040000-55d6-f15f-c561-2a4f15182030	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55d6-f160-958c-238a6317e613	00040000-55d6-f15f-c561-2a4f15182030	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d6-f160-0d60-694eb2b95dac	00040000-55d6-f15f-c561-2a4f15182030	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d6-f160-9ce0-0cfa4a939bd4	00040000-55d6-f15f-c561-2a4f15182030	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d6-f160-15b1-dee0393827e7	00040000-55d6-f15f-b5f3-925fb17077e4	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d6-f160-1ce5-9972665195d5	00040000-55d6-f15f-2c88-2ef0c13446c9	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d6-f160-8188-2f6adb596833	00040000-55d6-f15f-042d-dae3b308c9df	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d6-f160-f91e-da04ff747be8	00040000-55d6-f15f-c561-2a4f15182030	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2897 (class 0 OID 15166218)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55d6-f15f-61be-2f2079795e40	8341	Adlešiči
00050000-55d6-f15f-f0c0-58d617cd32a2	5270	Ajdovščina
00050000-55d6-f15f-cecb-b1218cefc0ff	6280	Ankaran/Ancarano
00050000-55d6-f15f-2c23-bd414e74ee56	9253	Apače
00050000-55d6-f15f-ed31-6148fe0f87ee	8253	Artiče
00050000-55d6-f15f-e838-7ea236568c19	4275	Begunje na Gorenjskem
00050000-55d6-f15f-9164-b817dfb60d0a	1382	Begunje pri Cerknici
00050000-55d6-f15f-6db5-f577d67ebf5c	9231	Beltinci
00050000-55d6-f15f-b58b-2f821331d465	2234	Benedikt
00050000-55d6-f15f-55a7-f9450ff1699b	2345	Bistrica ob Dravi
00050000-55d6-f15f-51c7-c1220a247c2c	3256	Bistrica ob Sotli
00050000-55d6-f15f-b2a9-08994da5cc6f	8259	Bizeljsko
00050000-55d6-f15f-5359-efd7fd216172	1223	Blagovica
00050000-55d6-f15f-60b5-cf2d4b350f8e	8283	Blanca
00050000-55d6-f15f-174e-b7c8055b88b8	4260	Bled
00050000-55d6-f15f-307f-8a3552f5ff27	4273	Blejska Dobrava
00050000-55d6-f15f-09b4-253e395cd88b	9265	Bodonci
00050000-55d6-f15f-227b-e2e8fa2edba8	9222	Bogojina
00050000-55d6-f15f-ca97-8c550e7c10c5	4263	Bohinjska Bela
00050000-55d6-f15f-554c-5b7257323939	4264	Bohinjska Bistrica
00050000-55d6-f15f-b1cd-ad8870e87e5f	4265	Bohinjsko jezero
00050000-55d6-f15f-9da7-a0938028f26c	1353	Borovnica
00050000-55d6-f15f-d9b2-8a67288da2f6	8294	Boštanj
00050000-55d6-f15f-228c-c7d4b3eecfae	5230	Bovec
00050000-55d6-f15f-4d07-ca4aaab0a2fc	5295	Branik
00050000-55d6-f15f-a773-108886a4b8dc	3314	Braslovče
00050000-55d6-f15f-0604-5840a839aaf3	5223	Breginj
00050000-55d6-f15f-4acf-ea8e9c00a7c4	8280	Brestanica
00050000-55d6-f15f-3b0a-22f40ab1ded1	2354	Bresternica
00050000-55d6-f15f-17e0-7d1d8f2d3946	4243	Brezje
00050000-55d6-f15f-3967-423248d82912	1351	Brezovica pri Ljubljani
00050000-55d6-f15f-da92-50aae3ef9b15	8250	Brežice
00050000-55d6-f15f-6f49-82abfd2a52de	4210	Brnik - Aerodrom
00050000-55d6-f15f-94ae-95670bdd74fa	8321	Brusnice
00050000-55d6-f15f-a263-1cb7d4301dca	3255	Buče
00050000-55d6-f15f-a4ab-ae3af9767846	8276	Bučka 
00050000-55d6-f15f-efe1-981ce22028fe	9261	Cankova
00050000-55d6-f15f-204a-8f92c2f9381e	3000	Celje 
00050000-55d6-f15f-5dd4-603f5beb4cbe	3001	Celje - poštni predali
00050000-55d6-f15f-922a-ad077f73adba	4207	Cerklje na Gorenjskem
00050000-55d6-f15f-303b-cc28eaf47a16	8263	Cerklje ob Krki
00050000-55d6-f15f-a871-310cb278b884	1380	Cerknica
00050000-55d6-f15f-11f4-2e94da39ea30	5282	Cerkno
00050000-55d6-f15f-2ab4-77138030f8ec	2236	Cerkvenjak
00050000-55d6-f15f-c186-3873d286920a	2215	Ceršak
00050000-55d6-f15f-93d8-9e402b72654f	2326	Cirkovce
00050000-55d6-f15f-e05c-06f7db3e3244	2282	Cirkulane
00050000-55d6-f15f-549f-df7dd7fbde92	5273	Col
00050000-55d6-f15f-53b1-0eb182d59743	8251	Čatež ob Savi
00050000-55d6-f15f-9cb2-a72ed4b26e09	1413	Čemšenik
00050000-55d6-f15f-77e1-a13330460349	5253	Čepovan
00050000-55d6-f15f-6071-f6bab77c63e0	9232	Črenšovci
00050000-55d6-f15f-29d9-215b8ef20e22	2393	Črna na Koroškem
00050000-55d6-f15f-9061-e05688093508	6275	Črni Kal
00050000-55d6-f15f-4b97-985bbf3b3ff1	5274	Črni Vrh nad Idrijo
00050000-55d6-f15f-74b4-bb28e0ae84e6	5262	Črniče
00050000-55d6-f15f-10dc-b8708caed60d	8340	Črnomelj
00050000-55d6-f15f-905f-398850f10c79	6271	Dekani
00050000-55d6-f15f-1a3c-ff678ae7b839	5210	Deskle
00050000-55d6-f15f-7848-9e6b632ad0ce	2253	Destrnik
00050000-55d6-f15f-b0c2-2f58ba480fbe	6215	Divača
00050000-55d6-f15f-f015-20114d098b13	1233	Dob
00050000-55d6-f15f-49c8-3d548b47adde	3224	Dobje pri Planini
00050000-55d6-f15f-32c7-66bbcd371395	8257	Dobova
00050000-55d6-f15f-c554-6908d4279673	1423	Dobovec
00050000-55d6-f15f-c439-9e84b527a57b	5263	Dobravlje
00050000-55d6-f15f-1808-62dfda2f1627	3204	Dobrna
00050000-55d6-f15f-dae7-58c73d891b6c	8211	Dobrnič
00050000-55d6-f15f-f59f-1769da94021a	1356	Dobrova
00050000-55d6-f15f-bdc5-2cc48d7c61cd	9223	Dobrovnik/Dobronak 
00050000-55d6-f15f-663a-1edebbd1c355	5212	Dobrovo v Brdih
00050000-55d6-f15f-7335-54dc4e97a06b	1431	Dol pri Hrastniku
00050000-55d6-f15f-a7e9-448a2783a183	1262	Dol pri Ljubljani
00050000-55d6-f15f-42f6-e7a9444623ba	1273	Dole pri Litiji
00050000-55d6-f15f-6e51-998006b4b83e	1331	Dolenja vas
00050000-55d6-f15f-3f72-5505dc836a8e	8350	Dolenjske Toplice
00050000-55d6-f15f-7d13-036d68d1a4bd	1230	Domžale
00050000-55d6-f15f-baae-0568cd871bbf	2252	Dornava
00050000-55d6-f15f-2ab2-0bd5b00a5f03	5294	Dornberk
00050000-55d6-f15f-9e8e-b833f1de52b9	1319	Draga
00050000-55d6-f15f-b839-dd985bf08153	8343	Dragatuš
00050000-55d6-f15f-ea62-bd463a853e62	3222	Dramlje
00050000-55d6-f15f-d330-e586fcddbd8b	2370	Dravograd
00050000-55d6-f15f-2989-f78ba8588592	4203	Duplje
00050000-55d6-f15f-c2f2-046e050fe0ff	6221	Dutovlje
00050000-55d6-f15f-6cae-da399e4aad7f	8361	Dvor
00050000-55d6-f15f-5380-c362bf14571f	2343	Fala
00050000-55d6-f15f-a24d-39da968e1e2f	9208	Fokovci
00050000-55d6-f15f-771d-9dbef00adac8	2313	Fram
00050000-55d6-f15f-9ea8-43cba40a9155	3213	Frankolovo
00050000-55d6-f15f-a7c7-88a46b1b69db	1274	Gabrovka
00050000-55d6-f15f-9b92-9c72be83f5b5	8254	Globoko
00050000-55d6-f15f-6b3c-12fbb071ca6c	5275	Godovič
00050000-55d6-f15f-a9fb-004ac9ac08a3	4204	Golnik
00050000-55d6-f15f-bbe7-8d566c3f2870	3303	Gomilsko
00050000-55d6-f15f-da54-2f057e25712f	4224	Gorenja vas
00050000-55d6-f15f-2e43-e62963e06877	3263	Gorica pri Slivnici
00050000-55d6-f15f-f170-3f6a52f17ab2	2272	Gorišnica
00050000-55d6-f15f-b17a-a620ce8b5b73	9250	Gornja Radgona
00050000-55d6-f15f-9d46-8356d8fe73a3	3342	Gornji Grad
00050000-55d6-f15f-2a4e-27d98753cd05	4282	Gozd Martuljek
00050000-55d6-f15f-75ed-fb15b1ef8449	6272	Gračišče
00050000-55d6-f15f-c0ad-f30e59ebb170	9264	Grad
00050000-55d6-f15f-b401-b95137c199d5	8332	Gradac
00050000-55d6-f15f-683e-49ae6868ba6c	1384	Grahovo
00050000-55d6-f15f-36ee-0ad580e0c028	5242	Grahovo ob Bači
00050000-55d6-f15f-567f-f2e5680a473f	5251	Grgar
00050000-55d6-f15f-389a-72be38007825	3302	Griže
00050000-55d6-f15f-1b70-4c9996ef97d1	3231	Grobelno
00050000-55d6-f15f-d4c8-5366a252ceae	1290	Grosuplje
00050000-55d6-f15f-c346-7ff45854eed8	2288	Hajdina
00050000-55d6-f15f-72e7-373d2e251a88	8362	Hinje
00050000-55d6-f15f-7fe1-7c8340d3d790	2311	Hoče
00050000-55d6-f15f-53f3-a148112f6baf	9205	Hodoš/Hodos
00050000-55d6-f15f-23db-ef0f6430112a	1354	Horjul
00050000-55d6-f15f-6e64-ae17a8f6740c	1372	Hotedršica
00050000-55d6-f15f-c58b-f7a0067600ba	1430	Hrastnik
00050000-55d6-f15f-0f0c-6f41dd47697a	6225	Hruševje
00050000-55d6-f15f-2680-0eb9627479a7	4276	Hrušica
00050000-55d6-f15f-13d7-3fc86957ed8e	5280	Idrija
00050000-55d6-f15f-bcc9-3165b44d3f5e	1292	Ig
00050000-55d6-f15f-d615-8b385d40d8a5	6250	Ilirska Bistrica
00050000-55d6-f15f-d27d-18326addd871	6251	Ilirska Bistrica-Trnovo
00050000-55d6-f15f-8319-e16003dae1d3	1295	Ivančna Gorica
00050000-55d6-f15f-d31d-c4d935c29ad7	2259	Ivanjkovci
00050000-55d6-f15f-ab0d-b8caaba46b4a	1411	Izlake
00050000-55d6-f15f-d740-1fa9b8e934e8	6310	Izola/Isola
00050000-55d6-f15f-3443-f09a143304ad	2222	Jakobski Dol
00050000-55d6-f15f-077f-f3b49df66825	2221	Jarenina
00050000-55d6-f15f-0342-48721e2e75ac	6254	Jelšane
00050000-55d6-f15f-d675-f9656a51a089	4270	Jesenice
00050000-55d6-f15f-dcba-569cbd4c58c3	8261	Jesenice na Dolenjskem
00050000-55d6-f15f-d1ef-39f8b7adcb68	3273	Jurklošter
00050000-55d6-f15f-4671-975e9ae4f305	2223	Jurovski Dol
00050000-55d6-f15f-ace2-9d057f0bb917	2256	Juršinci
00050000-55d6-f15f-34b4-b183e0ad384d	5214	Kal nad Kanalom
00050000-55d6-f15f-6e5c-b656475a2ce7	3233	Kalobje
00050000-55d6-f15f-b442-ea132f05d9e7	4246	Kamna Gorica
00050000-55d6-f15f-6a32-20a5170cec6d	2351	Kamnica
00050000-55d6-f15f-f500-705fd1fd4530	1241	Kamnik
00050000-55d6-f15f-be10-b2e7fad24c46	5213	Kanal
00050000-55d6-f15f-29fc-0227c6f36437	8258	Kapele
00050000-55d6-f15f-038e-31cadf70e57e	2362	Kapla
00050000-55d6-f15f-bfbd-523d895b06d8	2325	Kidričevo
00050000-55d6-f15f-3e1c-4bdbd4f269a5	1412	Kisovec
00050000-55d6-f15f-295f-5069be0d4c65	6253	Knežak
00050000-55d6-f15f-137a-9fb873a9e48c	5222	Kobarid
00050000-55d6-f15f-7cf4-4884aa6af105	9227	Kobilje
00050000-55d6-f15f-092b-2a8e593fbebc	1330	Kočevje
00050000-55d6-f15f-4780-ec37ba035081	1338	Kočevska Reka
00050000-55d6-f15f-aa5b-b34441c53b87	2276	Kog
00050000-55d6-f15f-c11f-a224645ed246	5211	Kojsko
00050000-55d6-f15f-7dcd-c7e3d738c4d3	6223	Komen
00050000-55d6-f15f-2b84-961dcd398bdf	1218	Komenda
00050000-55d6-f15f-81fd-46ff0cb82227	6000	Koper/Capodistria 
00050000-55d6-f15f-fac1-d8841abf8d3a	6001	Koper/Capodistria - poštni predali
00050000-55d6-f15f-5c1a-08595b358423	8282	Koprivnica
00050000-55d6-f15f-d7b4-840205a7e41f	5296	Kostanjevica na Krasu
00050000-55d6-f15f-fb00-1908e2548546	8311	Kostanjevica na Krki
00050000-55d6-f15f-9f1f-4903bf927e5c	1336	Kostel
00050000-55d6-f15f-9d6e-5bc4af616a53	6256	Košana
00050000-55d6-f15f-62fc-2dbcf910f72b	2394	Kotlje
00050000-55d6-f15f-2779-7f8e2c2c3346	6240	Kozina
00050000-55d6-f15f-ffba-8ac5111e1bbf	3260	Kozje
00050000-55d6-f15f-5141-24761aa7d7c4	4000	Kranj 
00050000-55d6-f15f-a5c1-680fb4a14354	4001	Kranj - poštni predali
00050000-55d6-f15f-17ee-789b8de46d53	4280	Kranjska Gora
00050000-55d6-f15f-ad78-3ee8dde643ca	1281	Kresnice
00050000-55d6-f15f-ec34-213b67be8fbc	4294	Križe
00050000-55d6-f15f-d7d2-b25d675d540e	9206	Križevci
00050000-55d6-f15f-1971-6d6a15b94cc2	9242	Križevci pri Ljutomeru
00050000-55d6-f15f-fec6-d22430e58a89	1301	Krka
00050000-55d6-f15f-5ce1-4809c71c1639	8296	Krmelj
00050000-55d6-f15f-40ed-b6bde4f6f46a	4245	Kropa
00050000-55d6-f15f-0d2c-c46c22f75457	8262	Krška vas
00050000-55d6-f15f-f4cd-1e95609f9882	8270	Krško
00050000-55d6-f15f-7cfc-23b6cece0b97	9263	Kuzma
00050000-55d6-f15f-7901-aaa95f220e4d	2318	Laporje
00050000-55d6-f15f-5ec3-4b0edc2bf7b2	3270	Laško
00050000-55d6-f15f-06df-ab2d66c1cc39	1219	Laze v Tuhinju
00050000-55d6-f15f-03eb-62bd550778cc	2230	Lenart v Slovenskih goricah
00050000-55d6-f15f-dec0-9cf6698a3fe6	9220	Lendava/Lendva
00050000-55d6-f15f-4f37-3261b4bf4576	4248	Lesce
00050000-55d6-f15f-f53a-4417bb7bf850	3261	Lesično
00050000-55d6-f15f-1411-16fd34c1dac9	8273	Leskovec pri Krškem
00050000-55d6-f15f-2e34-1eb150745a49	2372	Libeliče
00050000-55d6-f15f-a30e-a229c5f97396	2341	Limbuš
00050000-55d6-f15f-a77e-f32de5f57179	1270	Litija
00050000-55d6-f15f-9582-a1c1c2c6c0c4	3202	Ljubečna
00050000-55d6-f15f-0d0b-eef330f412fc	1000	Ljubljana 
00050000-55d6-f15f-a9ef-a7ebe4006967	1001	Ljubljana - poštni predali
00050000-55d6-f15f-1418-228ba3b3e693	1231	Ljubljana - Črnuče
00050000-55d6-f15f-ae58-a847888e4353	1261	Ljubljana - Dobrunje
00050000-55d6-f15f-088c-6e3a80d9e8bd	1260	Ljubljana - Polje
00050000-55d6-f15f-4681-2cf84e4c31cd	1210	Ljubljana - Šentvid
00050000-55d6-f15f-06af-e96c9d40bc58	1211	Ljubljana - Šmartno
00050000-55d6-f15f-d0e7-826d2b498196	3333	Ljubno ob Savinji
00050000-55d6-f15f-44b1-f7c5acd00968	9240	Ljutomer
00050000-55d6-f15f-0a5d-97c970b886b1	3215	Loče
00050000-55d6-f15f-9acf-36a862026991	5231	Log pod Mangartom
00050000-55d6-f15f-2f88-4e44072954bc	1358	Log pri Brezovici
00050000-55d6-f15f-aea7-0f02f643ec6b	1370	Logatec
00050000-55d6-f15f-21ba-7cf29c5b4ccb	1371	Logatec
00050000-55d6-f15f-be63-93ae3e955ce0	1434	Loka pri Zidanem Mostu
00050000-55d6-f15f-b590-33067e7f413c	3223	Loka pri Žusmu
00050000-55d6-f15f-8f7b-61390e59dab8	6219	Lokev
00050000-55d6-f15f-b669-a2a85788a665	1318	Loški Potok
00050000-55d6-f15f-1c7c-6e9ff81307fe	2324	Lovrenc na Dravskem polju
00050000-55d6-f15f-17e2-46201aa62d05	2344	Lovrenc na Pohorju
00050000-55d6-f15f-5071-da62a4537702	3334	Luče
00050000-55d6-f15f-4120-b46b927d24b6	1225	Lukovica
00050000-55d6-f15f-f32c-4439260e5783	9202	Mačkovci
00050000-55d6-f15f-1a3a-4861b1f963b0	2322	Majšperk
00050000-55d6-f15f-34ba-f697389cf931	2321	Makole
00050000-55d6-f15f-9886-4a60d42d1341	9243	Mala Nedelja
00050000-55d6-f15f-c5ef-61a7367d5301	2229	Malečnik
00050000-55d6-f15f-aab8-5c660384d1de	6273	Marezige
00050000-55d6-f15f-7197-bc17f8f0ddc9	2000	Maribor 
00050000-55d6-f15f-0365-b22fa3a826ee	2001	Maribor - poštni predali
00050000-55d6-f15f-382e-8b328e3f8680	2206	Marjeta na Dravskem polju
00050000-55d6-f15f-b732-6c1e8ca38fc3	2281	Markovci
00050000-55d6-f15f-cef8-f0a2ed82e1c7	9221	Martjanci
00050000-55d6-f15f-f4cc-e3bb1600d18e	6242	Materija
00050000-55d6-f15f-6fd0-863ad9105771	4211	Mavčiče
00050000-55d6-f15f-81eb-8bfaa1835f54	1215	Medvode
00050000-55d6-f15f-6f81-a4f5bd084bca	1234	Mengeš
00050000-55d6-f15f-bbe4-c7ec6af52b7a	8330	Metlika
00050000-55d6-f15f-a3c8-35ea8d65c872	2392	Mežica
00050000-55d6-f15f-dc7a-b331c35368de	2204	Miklavž na Dravskem polju
00050000-55d6-f15f-f251-f2abc8fbe15b	2275	Miklavž pri Ormožu
00050000-55d6-f15f-54b8-2fc6725f6a08	5291	Miren
00050000-55d6-f15f-0fe8-b46c3c375e72	8233	Mirna
00050000-55d6-f15f-0510-f04f69db2547	8216	Mirna Peč
00050000-55d6-f15f-e791-841318bbb21b	2382	Mislinja
00050000-55d6-f15f-a2d4-c0abcad8cce1	4281	Mojstrana
00050000-55d6-f15f-455a-95604e481cf9	8230	Mokronog
00050000-55d6-f15f-372c-9e38150fe44e	1251	Moravče
00050000-55d6-f15f-524e-4f9235000b67	9226	Moravske Toplice
00050000-55d6-f15f-2230-d8dbcec5e918	5216	Most na Soči
00050000-55d6-f15f-ccd7-87f244b4db0d	1221	Motnik
00050000-55d6-f15f-7b2e-d2f811478db2	3330	Mozirje
00050000-55d6-f15f-ee1e-1886a3b9f06a	9000	Murska Sobota 
00050000-55d6-f15f-c1f2-815544dcca83	9001	Murska Sobota - poštni predali
00050000-55d6-f15f-4a6c-34807809f0de	2366	Muta
00050000-55d6-f15f-b3c0-113c9d44f821	4202	Naklo
00050000-55d6-f15f-4ee4-d28f19862441	3331	Nazarje
00050000-55d6-f15f-5b1e-e80ac5f00182	1357	Notranje Gorice
00050000-55d6-f15f-4d80-06bcf46877bf	3203	Nova Cerkev
00050000-55d6-f15f-ad0f-5ecd5c76d024	5000	Nova Gorica 
00050000-55d6-f15f-937f-afab538b67d3	5001	Nova Gorica - poštni predali
00050000-55d6-f15f-943b-cabe08b1ad8b	1385	Nova vas
00050000-55d6-f15f-c625-9f45ca22f5b1	8000	Novo mesto
00050000-55d6-f15f-189f-b0218ec90ada	8001	Novo mesto - poštni predali
00050000-55d6-f15f-43aa-006c81e25ce6	6243	Obrov
00050000-55d6-f15f-6fd6-12623d218a81	9233	Odranci
00050000-55d6-f15f-1499-c6c052020bac	2317	Oplotnica
00050000-55d6-f15f-fff7-a96db48afbc2	2312	Orehova vas
00050000-55d6-f15f-0aff-67a2637e18d5	2270	Ormož
00050000-55d6-f15f-f4a6-6480e62be4b9	1316	Ortnek
00050000-55d6-f15f-173d-1b9fd2791c59	1337	Osilnica
00050000-55d6-f15f-e947-3b64cb8c26e8	8222	Otočec
00050000-55d6-f15f-65f5-6df06d19701e	2361	Ožbalt
00050000-55d6-f15f-e168-66ee430f61e2	2231	Pernica
00050000-55d6-f15f-05f4-be0910197646	2211	Pesnica pri Mariboru
00050000-55d6-f15f-46a6-4571b1af3d22	9203	Petrovci
00050000-55d6-f15f-7c9e-d84eae6e8e1c	3301	Petrovče
00050000-55d6-f15f-571c-c8784d86882e	6330	Piran/Pirano
00050000-55d6-f15f-4c11-d6d956d4e80c	8255	Pišece
00050000-55d6-f15f-4b05-3df03561238b	6257	Pivka
00050000-55d6-f15f-abbd-3ba692d01019	6232	Planina
00050000-55d6-f15f-aa5a-0ef74ac35cc6	3225	Planina pri Sevnici
00050000-55d6-f15f-dc06-79a223594a0b	6276	Pobegi
00050000-55d6-f15f-3226-b0e0cc30b91c	8312	Podbočje
00050000-55d6-f15f-1025-8974569d1df7	5243	Podbrdo
00050000-55d6-f15f-0bd8-064602ab8e1a	3254	Podčetrtek
00050000-55d6-f15f-d8ef-d93418dc7032	2273	Podgorci
00050000-55d6-f15f-2241-8dea6522df9d	6216	Podgorje
00050000-55d6-f15f-74ca-d66203d13467	2381	Podgorje pri Slovenj Gradcu
00050000-55d6-f15f-2af9-f4efd5057427	6244	Podgrad
00050000-55d6-f15f-7684-b1fa3e6447eb	1414	Podkum
00050000-55d6-f15f-30a1-4e9849755326	2286	Podlehnik
00050000-55d6-f15f-3067-2f1591f23cf4	5272	Podnanos
00050000-55d6-f15f-3b5f-c54cdfb8c8a8	4244	Podnart
00050000-55d6-f15f-b2d9-8cdcb022b982	3241	Podplat
00050000-55d6-f15f-0b17-729219dd9881	3257	Podsreda
00050000-55d6-f15f-1ccd-791564703051	2363	Podvelka
00050000-55d6-f15f-3608-6c58fdf1a227	2208	Pohorje
00050000-55d6-f15f-93e6-941069d3589b	2257	Polenšak
00050000-55d6-f15f-fd7b-4057c450ed9c	1355	Polhov Gradec
00050000-55d6-f15f-97ca-657dafeae28e	4223	Poljane nad Škofjo Loko
00050000-55d6-f15f-1e1c-b7bcffd6e871	2319	Poljčane
00050000-55d6-f15f-e7d3-ed1d70dc8c53	1272	Polšnik
00050000-55d6-f15f-c6ec-d1e00b73fcb0	3313	Polzela
00050000-55d6-f15f-dbc4-586524f40fec	3232	Ponikva
00050000-55d6-f15f-8a53-7cd99f2f282b	6320	Portorož/Portorose
00050000-55d6-f15f-0167-59762069b4f6	6230	Postojna
00050000-55d6-f15f-1a0a-5b20b45d4b11	2331	Pragersko
00050000-55d6-f15f-3c7a-ff086876564c	3312	Prebold
00050000-55d6-f15f-84d1-c9fe77a3e635	4205	Preddvor
00050000-55d6-f15f-9ce9-da60e8c10777	6255	Prem
00050000-55d6-f15f-fe3b-24fb8d95b7db	1352	Preserje
00050000-55d6-f15f-6621-d2a4b87767a7	6258	Prestranek
00050000-55d6-f15f-7e3d-030974abbab8	2391	Prevalje
00050000-55d6-f15f-d7f5-7776980132ce	3262	Prevorje
00050000-55d6-f15f-eb2e-5849f3c7bd8c	1276	Primskovo 
00050000-55d6-f15f-5134-091d29847212	3253	Pristava pri Mestinju
00050000-55d6-f15f-1231-bc5ebbbb8831	9207	Prosenjakovci/Partosfalva
00050000-55d6-f15f-ba33-18229b75634a	5297	Prvačina
00050000-55d6-f15f-95d8-62ceb9948183	2250	Ptuj
00050000-55d6-f15f-7696-45773025e40f	2323	Ptujska Gora
00050000-55d6-f15f-cb64-80a873365212	9201	Puconci
00050000-55d6-f15f-546e-c8997e865797	2327	Rače
00050000-55d6-f15f-e838-2437bfb5b54a	1433	Radeče
00050000-55d6-f15f-e68b-e7b711ba49fa	9252	Radenci
00050000-55d6-f15f-f648-3ae7b1c45815	2360	Radlje ob Dravi
00050000-55d6-f15f-8f71-774161a73ae8	1235	Radomlje
00050000-55d6-f15f-69a2-8d8f3e15b497	4240	Radovljica
00050000-55d6-f15f-8a88-afc26809be83	8274	Raka
00050000-55d6-f15f-4a13-4a4e0076b5ad	1381	Rakek
00050000-55d6-f15f-6580-aea88fc050b9	4283	Rateče - Planica
00050000-55d6-f15f-6afb-47c0540fe2f0	2390	Ravne na Koroškem
00050000-55d6-f15f-4bf1-a62d1604d0c2	9246	Razkrižje
00050000-55d6-f15f-5273-e3243c1e80f6	3332	Rečica ob Savinji
00050000-55d6-f15f-5617-9eb9950e6f44	5292	Renče
00050000-55d6-f15f-4ab6-cbf746f78690	1310	Ribnica
00050000-55d6-f15f-116e-008507a7787f	2364	Ribnica na Pohorju
00050000-55d6-f15f-86f3-5f2a99f76676	3272	Rimske Toplice
00050000-55d6-f15f-a508-2f0a6f01170e	1314	Rob
00050000-55d6-f15f-2616-6244c05a73da	5215	Ročinj
00050000-55d6-f15f-9323-03eacfb706b9	3250	Rogaška Slatina
00050000-55d6-f15f-095d-769bd80f014c	9262	Rogašovci
00050000-55d6-f15f-d56d-b42d8beb1350	3252	Rogatec
00050000-55d6-f15f-5c68-10d420dcf2b0	1373	Rovte
00050000-55d6-f15f-722c-0c02bf6e1e76	2342	Ruše
00050000-55d6-f15f-c8b6-4ef9482e083c	1282	Sava
00050000-55d6-f15f-12ec-45201f114aef	6333	Sečovlje/Sicciole
00050000-55d6-f15f-95db-351522d29354	4227	Selca
00050000-55d6-f15f-2b19-452578390420	2352	Selnica ob Dravi
00050000-55d6-f15f-e7f4-569687b0e999	8333	Semič
00050000-55d6-f15f-713c-eaf250610530	8281	Senovo
00050000-55d6-f15f-edf0-a5e645259d29	6224	Senožeče
00050000-55d6-f15f-5e4c-4a4e0e4398aa	8290	Sevnica
00050000-55d6-f15f-a53c-537ddca6d1e7	6210	Sežana
00050000-55d6-f15f-380f-023d6a9233dd	2214	Sladki Vrh
00050000-55d6-f15f-556c-2ac1c1195f7c	5283	Slap ob Idrijci
00050000-55d6-f15f-a6ed-09c392ea5bb4	2380	Slovenj Gradec
00050000-55d6-f15f-7917-72e6fcdde1c8	2310	Slovenska Bistrica
00050000-55d6-f15f-645f-8bb61efb55e5	3210	Slovenske Konjice
00050000-55d6-f15f-a278-5931312e60a8	1216	Smlednik
00050000-55d6-f15f-a5d8-c6df8fb20590	5232	Soča
00050000-55d6-f15f-c7a0-640ffc9732d5	1317	Sodražica
00050000-55d6-f15f-e6fa-0c7bfb1ff04f	3335	Solčava
00050000-55d6-f15f-58d1-4942bdc1918e	5250	Solkan
00050000-55d6-f15f-eaf0-820b1c6e5b5b	4229	Sorica
00050000-55d6-f15f-185b-b6d95f6e98b5	4225	Sovodenj
00050000-55d6-f15f-e796-22f940b4160b	5281	Spodnja Idrija
00050000-55d6-f15f-059b-99c83fa8aa32	2241	Spodnji Duplek
00050000-55d6-f15f-ecd2-999213fe6e46	9245	Spodnji Ivanjci
00050000-55d6-f15f-3b69-81a8ee82c426	2277	Središče ob Dravi
00050000-55d6-f15f-7a0d-6105caddea2b	4267	Srednja vas v Bohinju
00050000-55d6-f15f-00f3-14e6cfe8bb1f	8256	Sromlje 
00050000-55d6-f15f-9edb-e8d52e7fa93b	5224	Srpenica
00050000-55d6-f15f-da25-81873268b916	1242	Stahovica
00050000-55d6-f15f-01fe-3e151fbee0fa	1332	Stara Cerkev
00050000-55d6-f15f-aab2-a41bd2080ff9	8342	Stari trg ob Kolpi
00050000-55d6-f15f-6d07-b744056b94cf	1386	Stari trg pri Ložu
00050000-55d6-f15f-ce9b-611772566350	2205	Starše
00050000-55d6-f15f-d8aa-531ad64c9be9	2289	Stoperce
00050000-55d6-f15f-ca85-ca67f396b940	8322	Stopiče
00050000-55d6-f15f-481a-a27ba102adbc	3206	Stranice
00050000-55d6-f15f-795b-34c90f28f2ca	8351	Straža
00050000-55d6-f15f-54c6-5f3c7b880a2b	1313	Struge
00050000-55d6-f15f-be0f-947e07a3dbc6	8293	Studenec
00050000-55d6-f15f-97be-6660157a0248	8331	Suhor
00050000-55d6-f15f-a4be-ee4b1e3e99cf	2233	Sv. Ana v Slovenskih goricah
00050000-55d6-f15f-1ff7-703c36228a64	2235	Sv. Trojica v Slovenskih goricah
00050000-55d6-f15f-7ab1-e9d435f6ae02	2353	Sveti Duh na Ostrem Vrhu
00050000-55d6-f15f-940d-519e26a1c403	9244	Sveti Jurij ob Ščavnici
00050000-55d6-f15f-bab4-4d816c3b3ca7	3264	Sveti Štefan
00050000-55d6-f15f-afb0-cdb4fd101065	2258	Sveti Tomaž
00050000-55d6-f15f-e61a-95db796e1560	9204	Šalovci
00050000-55d6-f15f-fec4-6ad14d3f210e	5261	Šempas
00050000-55d6-f15f-0bc3-bbbbdd078ba8	5290	Šempeter pri Gorici
00050000-55d6-f15f-dd8d-287c4da00f76	3311	Šempeter v Savinjski dolini
00050000-55d6-f15f-dc9d-2c9e21714765	4208	Šenčur
00050000-55d6-f15f-f981-45e16a0d9fff	2212	Šentilj v Slovenskih goricah
00050000-55d6-f15f-7107-e94360d191a1	8297	Šentjanž
00050000-55d6-f15f-217d-484049e6e067	2373	Šentjanž pri Dravogradu
00050000-55d6-f15f-169a-1ce9d10404ab	8310	Šentjernej
00050000-55d6-f15f-a2e1-ea630a6ec671	3230	Šentjur
00050000-55d6-f15f-d4fd-6f1c64e1af41	3271	Šentrupert
00050000-55d6-f15f-fa5f-0f7ab0d834e8	8232	Šentrupert
00050000-55d6-f15f-4120-19d5c3d9ea5d	1296	Šentvid pri Stični
00050000-55d6-f15f-f7ad-b17d9d1a6e69	8275	Škocjan
00050000-55d6-f15f-d9ae-ad017ac0045e	6281	Škofije
00050000-55d6-f15f-778a-038238bdedb8	4220	Škofja Loka
00050000-55d6-f15f-2521-6ef8460d6524	3211	Škofja vas
00050000-55d6-f15f-714f-4955f0426aa0	1291	Škofljica
00050000-55d6-f15f-36d9-cd0ab404490d	6274	Šmarje
00050000-55d6-f15f-fe20-4da2725b5bf4	1293	Šmarje - Sap
00050000-55d6-f15f-9e2e-92c1132e249a	3240	Šmarje pri Jelšah
00050000-55d6-f15f-b590-96e772924118	8220	Šmarješke Toplice
00050000-55d6-f15f-4a1f-57f4044cce07	2315	Šmartno na Pohorju
00050000-55d6-f15f-69d3-88a4488d2136	3341	Šmartno ob Dreti
00050000-55d6-f15f-6ccb-d8b8c12640af	3327	Šmartno ob Paki
00050000-55d6-f15f-ee6a-c2477751a4c4	1275	Šmartno pri Litiji
00050000-55d6-f15f-003d-c71753d2c0e3	2383	Šmartno pri Slovenj Gradcu
00050000-55d6-f15f-2dbd-4fd686d958ae	3201	Šmartno v Rožni dolini
00050000-55d6-f15f-b38e-d2cea8cb00f6	3325	Šoštanj
00050000-55d6-f15f-d12c-a9fa4a1d0eff	6222	Štanjel
00050000-55d6-f15f-405b-9f3cd4ae4751	3220	Štore
00050000-55d6-f15f-f54d-56fccd1fa476	3304	Tabor
00050000-55d6-f15f-030c-31374c1a806e	3221	Teharje
00050000-55d6-f15f-d3eb-b9ecafb9002c	9251	Tišina
00050000-55d6-f15f-2a32-b30f4f4e4d24	5220	Tolmin
00050000-55d6-f15f-84b3-e765853142ad	3326	Topolšica
00050000-55d6-f15f-475b-e03a91cb813f	2371	Trbonje
00050000-55d6-f15f-8577-328e7e407838	1420	Trbovlje
00050000-55d6-f15f-3d07-201096cced21	8231	Trebelno 
00050000-55d6-f15f-79ff-67a7645c0c10	8210	Trebnje
00050000-55d6-f15f-d917-5d9ad20e2b67	5252	Trnovo pri Gorici
00050000-55d6-f15f-dd6a-3507a4f3c695	2254	Trnovska vas
00050000-55d6-f15f-b958-a4b37d303fb5	1222	Trojane
00050000-55d6-f15f-0094-8b948a1abc83	1236	Trzin
00050000-55d6-f15f-1419-e5f7d4608866	4290	Tržič
00050000-55d6-f15f-9a2c-aadce51bc5ae	8295	Tržišče
00050000-55d6-f15f-8c61-46a36b2b8d94	1311	Turjak
00050000-55d6-f15f-04ef-49ec052b61e4	9224	Turnišče
00050000-55d6-f15f-110e-756c3a3ece44	8323	Uršna sela
00050000-55d6-f15f-fc79-17cf2a363a61	1252	Vače
00050000-55d6-f15f-1b00-c2e0b31f1997	3320	Velenje 
00050000-55d6-f15f-c56a-d87b7111b642	3322	Velenje - poštni predali
00050000-55d6-f15f-b99a-cdc095e952f9	8212	Velika Loka
00050000-55d6-f15f-68e4-7e01d6824b13	2274	Velika Nedelja
00050000-55d6-f15f-e4f3-80de22cb9596	9225	Velika Polana
00050000-55d6-f15f-c95b-fc0f59cb71ed	1315	Velike Lašče
00050000-55d6-f15f-4de6-c5f8c42c2aed	8213	Veliki Gaber
00050000-55d6-f15f-f072-fdb29088ef30	9241	Veržej
00050000-55d6-f15f-68db-48bd85fa4cee	1312	Videm - Dobrepolje
00050000-55d6-f15f-4a75-d66dc69dfe96	2284	Videm pri Ptuju
00050000-55d6-f15f-a368-afb1a584101e	8344	Vinica
00050000-55d6-f15f-8a2a-845b6398c25b	5271	Vipava
00050000-55d6-f15f-7a39-2e53b6c3774a	4212	Visoko
00050000-55d6-f15f-c695-72510af5dc30	1294	Višnja Gora
00050000-55d6-f15f-eefa-b839b74bb780	3205	Vitanje
00050000-55d6-f15f-e05f-e8d85081227d	2255	Vitomarci
00050000-55d6-f15f-dd73-d583c84db26a	1217	Vodice
00050000-55d6-f15f-9d37-76bd9844d86d	3212	Vojnik\t
00050000-55d6-f15f-ac4c-8daea67d1e27	5293	Volčja Draga
00050000-55d6-f15f-d6f5-3c0a8b7c834a	2232	Voličina
00050000-55d6-f15f-f8cb-bd5aa82bfd2b	3305	Vransko
00050000-55d6-f15f-8702-df9ab40cfa1a	6217	Vremski Britof
00050000-55d6-f15f-78b5-889e872aba71	1360	Vrhnika
00050000-55d6-f15f-26a9-e78712a67942	2365	Vuhred
00050000-55d6-f15f-39b9-bb9def783254	2367	Vuzenica
00050000-55d6-f15f-ea28-fe27716afc4c	8292	Zabukovje 
00050000-55d6-f15f-1b20-d17877206ec2	1410	Zagorje ob Savi
00050000-55d6-f15f-f823-13dc1e54861e	1303	Zagradec
00050000-55d6-f15f-05a2-1d68284cb6bd	2283	Zavrč
00050000-55d6-f15f-8ece-4d262ddbd9e6	8272	Zdole 
00050000-55d6-f15f-6766-4de731d84a6b	4201	Zgornja Besnica
00050000-55d6-f15f-cc8a-73ee82a1fbce	2242	Zgornja Korena
00050000-55d6-f15f-b62e-a86edc8bcd30	2201	Zgornja Kungota
00050000-55d6-f15f-2558-8413d2353ab8	2316	Zgornja Ložnica
00050000-55d6-f15f-1bd4-02317380f100	2314	Zgornja Polskava
00050000-55d6-f15f-d0c9-b4edca763178	2213	Zgornja Velka
00050000-55d6-f15f-b371-95148fe64911	4247	Zgornje Gorje
00050000-55d6-f15f-f351-74624bf8c7d6	4206	Zgornje Jezersko
00050000-55d6-f15f-b0db-bdf6fd830ee8	2285	Zgornji Leskovec
00050000-55d6-f15f-382d-4ea9e0a78806	1432	Zidani Most
00050000-55d6-f15f-3bde-610ea040ab3c	3214	Zreče
00050000-55d6-f15f-e284-47648654be96	4209	Žabnica
00050000-55d6-f15f-28f2-6d00d70b04d6	3310	Žalec
00050000-55d6-f15f-e318-422b6b963acf	4228	Železniki
00050000-55d6-f15f-120a-71f953d1afdb	2287	Žetale
00050000-55d6-f15f-1ad8-58dcb3b13882	4226	Žiri
00050000-55d6-f15f-7cb2-4c329f96ed0b	4274	Žirovnica
00050000-55d6-f15f-96b2-b7b1f7e1587c	8360	Žužemberk
\.


--
-- TOC entry 2914 (class 0 OID 15166396)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 15166203)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 15166281)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 15166408)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 15166740)
-- Dependencies: 225
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 15166750)
-- Dependencies: 226
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55d6-f160-916a-1ed0f995173a	00080000-55d6-f160-f91e-da04ff747be8	0900	AK
00190000-55d6-f161-29d0-04febdc55035	00080000-55d6-f160-958c-238a6317e613	0987	AK
00190000-55d6-f161-ea4f-27dba7947cb0	00080000-55d6-f160-23b3-176aba60c8b6	0989	AK
00190000-55d6-f161-6396-af18bd8bd75f	00080000-55d6-f160-0d60-694eb2b95dac	0986	AK
00190000-55d6-f161-e117-51fe7465d256	00080000-55d6-f160-15b1-dee0393827e7	0984	AK
00190000-55d6-f161-351a-4ffdc0048d96	00080000-55d6-f160-1ce5-9972665195d5	0983	AK
00190000-55d6-f161-7b1f-9210afd62267	00080000-55d6-f160-8188-2f6adb596833	0982	AK
\.


--
-- TOC entry 2938 (class 0 OID 15166696)
-- Dependencies: 224
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponprej, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55d6-f161-b76f-044958af8a18	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2941 (class 0 OID 15166758)
-- Dependencies: 227
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 15166437)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55d6-f160-5a63-b89d6689e114	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55d6-f160-36f2-5d0092e92a0b	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55d6-f160-05af-159b4b177ad6	0003	Kazinska	t	84	Kazinska dvorana
00220000-55d6-f160-103a-21a6359b5c3d	0004	Mali oder	t	24	Mali oder 
00220000-55d6-f160-5753-c90b978ea62c	0005	Komorni oder	t	15	Komorni oder
00220000-55d6-f160-6e6a-deb2ea6a7b71	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55d6-f160-b165-0c2e08867196	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2912 (class 0 OID 15166381)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2911 (class 0 OID 15166371)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 15166556)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 15166505)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 15166075)
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
-- TOC entry 2921 (class 0 OID 15166447)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 15166113)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55d6-f15f-0eb5-3252aa6a270b	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55d6-f15f-b8f3-cd5ef74409b1	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55d6-f15f-ff5a-1eb97e0c1495	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55d6-f15f-7d07-e8987d7d7c31	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55d6-f15f-a82e-3c6f82a4ffed	planer	Planer dogodkov v koledarju	t
00020000-55d6-f15f-47af-6855eb472e6a	kadrovska	Kadrovska služba	t
00020000-55d6-f15f-f832-7c74e32e739f	arhivar	Ažuriranje arhivalij	t
00020000-55d6-f15f-e728-41d00de360c9	igralec	Igralec	t
00020000-55d6-f15f-08f5-f1ea2186e8ad	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55d6-f160-7f3c-9d10dace4045	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2887 (class 0 OID 15166097)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55d6-f15f-4ca3-39529de29f3d	00020000-55d6-f15f-ff5a-1eb97e0c1495
00010000-55d6-f15f-1bb4-f41052a8bd6f	00020000-55d6-f15f-ff5a-1eb97e0c1495
00010000-55d6-f160-0a29-bae76bd486f4	00020000-55d6-f160-7f3c-9d10dace4045
\.


--
-- TOC entry 2923 (class 0 OID 15166461)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2915 (class 0 OID 15166402)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 15166348)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 15166799)
-- Dependencies: 232
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55d6-f160-d3e9-5615495ebe2a	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55d6-f160-c366-150b68c59fbb	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55d6-f160-a448-abcd3a296305	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55d6-f160-25b2-f07d2ee209fc	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55d6-f160-b35a-0753ee0c69af	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2945 (class 0 OID 15166791)
-- Dependencies: 231
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55d6-f160-6775-83c712eeecdc	00230000-55d6-f160-25b2-f07d2ee209fc	popa
00240000-55d6-f160-5a00-922c9afda3da	00230000-55d6-f160-25b2-f07d2ee209fc	oseba
00240000-55d6-f160-2489-fef799431e87	00230000-55d6-f160-25b2-f07d2ee209fc	sezona
00240000-55d6-f160-380f-a84d5c1cdb3c	00230000-55d6-f160-c366-150b68c59fbb	prostor
00240000-55d6-f160-9ff8-c4a91f758dbf	00230000-55d6-f160-25b2-f07d2ee209fc	besedilo
00240000-55d6-f160-9838-e80701ff5203	00230000-55d6-f160-25b2-f07d2ee209fc	uprizoritev
00240000-55d6-f160-75e4-1a254e3b9d35	00230000-55d6-f160-25b2-f07d2ee209fc	funkcija
00240000-55d6-f160-7374-1d316b7c7c97	00230000-55d6-f160-25b2-f07d2ee209fc	tipfunkcije
00240000-55d6-f160-16de-a3ad918a8adc	00230000-55d6-f160-25b2-f07d2ee209fc	alternacija
00240000-55d6-f160-b9ba-ff52d141f463	00230000-55d6-f160-d3e9-5615495ebe2a	pogodba
00240000-55d6-f160-6650-7e69aaa1bf30	00230000-55d6-f160-25b2-f07d2ee209fc	zaposlitev
00240000-55d6-f160-7c7d-5fb1c5294369	00230000-55d6-f160-d3e9-5615495ebe2a	programdela
00240000-55d6-f160-347b-617f180f681d	00230000-55d6-f160-25b2-f07d2ee209fc	zapis
\.


--
-- TOC entry 2944 (class 0 OID 15166786)
-- Dependencies: 230
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 15166515)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55d6-f161-a7e2-d4a1c94dffcc	000e0000-55d6-f161-4b74-b17463d2e07c	00080000-55d6-f160-8c16-9181053bfe26	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55d6-f161-106c-1ae258c9c2f5	000e0000-55d6-f161-4b74-b17463d2e07c	00080000-55d6-f160-8c16-9181053bfe26	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55d6-f161-662d-0cd6d77ae705	000e0000-55d6-f161-4b74-b17463d2e07c	00080000-55d6-f160-9ce0-0cfa4a939bd4	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2894 (class 0 OID 15166175)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2910 (class 0 OID 15166358)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55d6-f161-f7d9-0c4a5bc215fb	00180000-55d6-f161-3f2d-4ad3897e7ddc	000c0000-55d6-f161-4b10-f22d4129e46c	00090000-55d6-f161-0c4a-32f9b1b9fb3a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d6-f161-32ea-025430105348	00180000-55d6-f161-3f2d-4ad3897e7ddc	000c0000-55d6-f161-ee1f-b503cf461e50	00090000-55d6-f161-4cc8-912cac6a1d51	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d6-f161-429e-71f7d5224334	00180000-55d6-f161-3f2d-4ad3897e7ddc	000c0000-55d6-f161-913f-ab218f9728a2	00090000-55d6-f160-1ea3-b65f5ca4a803	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d6-f161-65cd-06e0ab15ea2a	00180000-55d6-f161-3f2d-4ad3897e7ddc	000c0000-55d6-f161-d5c3-ceb85dd5f026	00090000-55d6-f160-24e6-774a08cee816	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d6-f161-9113-7e7ed148812c	00180000-55d6-f161-3f2d-4ad3897e7ddc	000c0000-55d6-f161-4558-87eb1f69925d	00090000-55d6-f161-5a19-0bb083b0aa78	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d6-f161-4b45-7e113465a0cb	00180000-55d6-f161-3f08-91a743e76934	\N	00090000-55d6-f161-5a19-0bb083b0aa78	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2930 (class 0 OID 15166545)
-- Dependencies: 216
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55d6-f160-bf9a-12651c52a832	Avtor	Avtorji	Avtorka	umetnik
000f0000-55d6-f160-fda7-14b247c6a1ae	Priredba	Priredba	Priredba	umetnik
000f0000-55d6-f160-ac13-55e05d5c00fe	Prevod	Prevod	Prevod	umetnik
000f0000-55d6-f160-b4ab-ae62f85d1374	Režija	Režija	Režija	umetnik
000f0000-55d6-f160-9cc7-3b6813868eaa	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55d6-f160-e533-a1f0f4890441	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55d6-f160-4fd2-0bf403b5ad60	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55d6-f160-9b5e-d9e02bb5f65c	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55d6-f160-943d-f525666886cd	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55d6-f160-60de-44a599dc8d44	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55d6-f160-7073-febefabbc8e8	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55d6-f160-1487-42fe13e51c2a	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55d6-f160-500e-ba04289ae63a	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55d6-f160-84ee-cf68f8d7acb4	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55d6-f160-d285-ef6a22dbbe53	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55d6-f160-631c-605fa763fdf9	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55d6-f160-d4b9-ec69938f1391	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55d6-f160-ef13-479f8b03e6d5	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2942 (class 0 OID 15166768)
-- Dependencies: 228
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55d6-f160-1306-73f7e78f5a51	01	Velika predstava	f	1.00	1.00
002b0000-55d6-f160-5bc6-5cf8869751f7	02	Mala predstava	f	0.50	0.50
002b0000-55d6-f160-6aed-b65a7ab01fe2	03	Mala koprodukcija	t	0.40	1.00
002b0000-55d6-f160-c24b-e5f7bc95c897	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55d6-f160-80da-6dbdf472d1cd	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2899 (class 0 OID 15166238)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2886 (class 0 OID 15166084)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55d6-f15f-1bb4-f41052a8bd6f	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROVFqrK0YLazvwygE9UBf1VcQDBg2rDiG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55d6-f160-be26-eba6c5d6951b	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55d6-f160-1e1f-122575ad2dca	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55d6-f160-85f3-b81d0ae378b4	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55d6-f160-3258-691844aa2ad1	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55d6-f160-1bf7-e3788f6c2b96	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55d6-f160-8785-e451e2510503	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55d6-f160-cad8-6086a5142acf	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55d6-f160-911d-de96155c2fc1	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55d6-f160-7e8e-fc5b2156e7e2	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55d6-f160-0a29-bae76bd486f4	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55d6-f15f-4ca3-39529de29f3d	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2934 (class 0 OID 15166593)
-- Dependencies: 220
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55d6-f161-f958-182fb4fe6f32	00160000-55d6-f160-df46-3cb3c891731a	00150000-55d6-f160-4879-24896b1081ee	00140000-55d6-f15f-6429-7ca75d299e27	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55d6-f160-5753-c90b978ea62c
000e0000-55d6-f161-4b74-b17463d2e07c	00160000-55d6-f160-7ebb-d16b7e73afee	00150000-55d6-f160-3065-77a9bda13202	00140000-55d6-f15f-2dfe-04d29fd09a33	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55d6-f160-6e6a-deb2ea6a7b71
000e0000-55d6-f161-0e05-837d88917249	\N	00150000-55d6-f160-3065-77a9bda13202	00140000-55d6-f15f-2dfe-04d29fd09a33	00190000-55d6-f161-29d0-04febdc55035	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55d6-f160-5753-c90b978ea62c
000e0000-55d6-f161-20bb-458bf863118a	\N	00150000-55d6-f160-3065-77a9bda13202	00140000-55d6-f15f-2dfe-04d29fd09a33	00190000-55d6-f161-29d0-04febdc55035	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55d6-f160-5753-c90b978ea62c
000e0000-55d6-f161-cc5c-bfb8fdfa6748	\N	00150000-55d6-f160-3065-77a9bda13202	00140000-55d6-f15f-2dfe-04d29fd09a33	00190000-55d6-f161-29d0-04febdc55035	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55d6-f160-5a63-b89d6689e114
000e0000-55d6-f161-2441-4dd5cffef3a0	\N	00150000-55d6-f160-3065-77a9bda13202	00140000-55d6-f15f-2dfe-04d29fd09a33	00190000-55d6-f161-29d0-04febdc55035	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f		00220000-55d6-f160-5a63-b89d6689e114
\.


--
-- TOC entry 2904 (class 0 OID 15166300)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55d6-f161-f726-f3f327877a6b	000e0000-55d6-f161-4b74-b17463d2e07c	1	
00200000-55d6-f161-0b7a-76965b7bbc5f	000e0000-55d6-f161-4b74-b17463d2e07c	2	
\.


--
-- TOC entry 2919 (class 0 OID 15166429)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 15166838)
-- Dependencies: 234
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 15166810)
-- Dependencies: 233
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 15166850)
-- Dependencies: 235
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2926 (class 0 OID 15166498)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55d6-f161-6cab-d91362adf8ce	00090000-55d6-f161-4cc8-912cac6a1d51	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d6-f161-32a9-679b3610f016	00090000-55d6-f160-1ea3-b65f5ca4a803	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d6-f161-a40c-dbae41ba5ecb	00090000-55d6-f161-e6d9-143dffd390aa	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d6-f161-2c76-a6b5cba95ad3	00090000-55d6-f161-d234-9e840ab06daf	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d6-f161-5985-c0b865dfea14	00090000-55d6-f161-0c4a-32f9b1b9fb3a	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d6-f161-75b8-1a5d9029de0f	00090000-55d6-f161-2f3e-422ec350fd1c	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2906 (class 0 OID 15166332)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 15166583)
-- Dependencies: 219
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55d6-f15f-6429-7ca75d299e27	01	Drama	drama (SURS 01)
00140000-55d6-f15f-8396-d33b271a36a5	02	Opera	opera (SURS 02)
00140000-55d6-f15f-7474-269c0da4f7d7	03	Balet	balet (SURS 03)
00140000-55d6-f15f-3495-bdddb1e7d384	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55d6-f15f-e9ee-ebe3958b1626	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55d6-f15f-2dfe-04d29fd09a33	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55d6-f15f-3688-98030e2ce5f0	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2925 (class 0 OID 15166488)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55d6-f160-0cd3-5bfdc79e6494	01	Opera	opera
00150000-55d6-f160-10d5-13bd797ca93c	02	Opereta	opereta
00150000-55d6-f160-f76a-134bd10eb37f	03	Balet	balet
00150000-55d6-f160-27f7-738b4beb31eb	04	Plesne prireditve	plesne prireditve
00150000-55d6-f160-6f2f-248320118026	05	Lutkovno gledališče	lutkovno gledališče
00150000-55d6-f160-e905-9d7dabebdcb2	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55d6-f160-2133-e427ac72f215	07	Biografska drama	biografska drama
00150000-55d6-f160-4879-24896b1081ee	08	Komedija	komedija
00150000-55d6-f160-4f22-09960b0e43a2	09	Črna komedija	črna komedija
00150000-55d6-f160-d3d2-0e01c5626c87	10	E-igra	E-igra
00150000-55d6-f160-3065-77a9bda13202	11	Kriminalka	kriminalka
00150000-55d6-f160-06ba-846cf56f9084	12	Musical	musical
\.


--
-- TOC entry 2436 (class 2606 OID 15166138)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 15166640)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 15166630)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 15166544)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 15166890)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 15166322)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 15166347)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 15166784)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 15166264)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 15166690)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 15166484)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 15166298)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 2606 OID 15166341)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 15166278)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 15166394)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 15166867)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 15166874)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2677 (class 2606 OID 15166898)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 15166421)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 15166236)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 15166147)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 15166171)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 15166127)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2427 (class 2606 OID 15166112)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 15166427)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 15166460)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 15166578)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 15166200)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 15166224)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 15166400)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 15166214)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 15166285)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 15166412)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 15166747)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 15166755)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 15166738)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 15166766)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 15166444)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 15166385)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 15166376)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 15166566)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 15166512)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 15166083)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 15166451)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 15166101)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2429 (class 2606 OID 15166121)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 15166469)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 15166407)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 15166356)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 15166808)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 15166796)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 15166790)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 15166525)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 15166180)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 15166367)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 15166555)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 15166778)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 15166249)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 15166096)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 15166609)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 15166307)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 15166435)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 15166848)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 15166832)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 15166856)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 15166503)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 15166336)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 15166591)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 15166496)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 1259 OID 15166329)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2577 (class 1259 OID 15166526)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2578 (class 1259 OID 15166527)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2663 (class 1259 OID 15166869)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2664 (class 1259 OID 15166868)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2450 (class 1259 OID 15166202)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2542 (class 1259 OID 15166428)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2650 (class 1259 OID 15166836)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2651 (class 1259 OID 15166835)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2652 (class 1259 OID 15166837)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2653 (class 1259 OID 15166834)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2654 (class 1259 OID 15166833)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2536 (class 1259 OID 15166414)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2537 (class 1259 OID 15166413)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2487 (class 1259 OID 15166308)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2564 (class 1259 OID 15166485)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2565 (class 1259 OID 15166487)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2566 (class 1259 OID 15166486)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2475 (class 1259 OID 15166280)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2476 (class 1259 OID 15166279)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2633 (class 1259 OID 15166767)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2587 (class 1259 OID 15166580)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2588 (class 1259 OID 15166581)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2589 (class 1259 OID 15166582)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2660 (class 1259 OID 15166857)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2596 (class 1259 OID 15166614)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2597 (class 1259 OID 15166611)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2598 (class 1259 OID 15166615)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2599 (class 1259 OID 15166613)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2600 (class 1259 OID 15166612)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2465 (class 1259 OID 15166251)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2466 (class 1259 OID 15166250)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2441 (class 1259 OID 15166174)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2552 (class 1259 OID 15166452)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2505 (class 1259 OID 15166342)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2431 (class 1259 OID 15166128)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2432 (class 1259 OID 15166129)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2557 (class 1259 OID 15166472)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2558 (class 1259 OID 15166471)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2559 (class 1259 OID 15166470)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2479 (class 1259 OID 15166286)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2480 (class 1259 OID 15166288)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2481 (class 1259 OID 15166287)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 15166798)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2516 (class 1259 OID 15166380)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2517 (class 1259 OID 15166378)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2518 (class 1259 OID 15166377)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2519 (class 1259 OID 15166379)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2422 (class 1259 OID 15166102)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2423 (class 1259 OID 15166103)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2545 (class 1259 OID 15166436)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2673 (class 1259 OID 15166891)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2674 (class 1259 OID 15166899)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2675 (class 1259 OID 15166900)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2531 (class 1259 OID 15166401)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2573 (class 1259 OID 15166513)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2574 (class 1259 OID 15166514)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2617 (class 1259 OID 15166695)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2618 (class 1259 OID 15166694)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2619 (class 1259 OID 15166691)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2620 (class 1259 OID 15166692)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2621 (class 1259 OID 15166693)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2454 (class 1259 OID 15166216)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2455 (class 1259 OID 15166215)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2456 (class 1259 OID 15166217)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2625 (class 1259 OID 15166748)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2626 (class 1259 OID 15166749)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2610 (class 1259 OID 15166644)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2611 (class 1259 OID 15166645)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2612 (class 1259 OID 15166642)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2613 (class 1259 OID 15166643)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2570 (class 1259 OID 15166504)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2522 (class 1259 OID 15166389)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2523 (class 1259 OID 15166388)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2524 (class 1259 OID 15166386)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2525 (class 1259 OID 15166387)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 15166632)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2607 (class 1259 OID 15166631)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2622 (class 1259 OID 15166739)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2486 (class 1259 OID 15166299)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2640 (class 1259 OID 15166785)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2667 (class 1259 OID 15166875)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2668 (class 1259 OID 15166876)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2437 (class 1259 OID 15166149)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2438 (class 1259 OID 15166148)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2446 (class 1259 OID 15166181)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 15166182)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2511 (class 1259 OID 15166370)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2512 (class 1259 OID 15166369)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2513 (class 1259 OID 15166368)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2493 (class 1259 OID 15166331)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2494 (class 1259 OID 15166327)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2495 (class 1259 OID 15166324)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2496 (class 1259 OID 15166325)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2497 (class 1259 OID 15166323)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2498 (class 1259 OID 15166328)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2499 (class 1259 OID 15166326)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2453 (class 1259 OID 15166201)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2471 (class 1259 OID 15166265)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2472 (class 1259 OID 15166267)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2473 (class 1259 OID 15166266)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2474 (class 1259 OID 15166268)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2530 (class 1259 OID 15166395)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2592 (class 1259 OID 15166579)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 15166610)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2444 (class 1259 OID 15166172)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2445 (class 1259 OID 15166173)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2567 (class 1259 OID 15166497)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 15166809)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2464 (class 1259 OID 15166237)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 15166797)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2550 (class 1259 OID 15166446)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2551 (class 1259 OID 15166445)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 15166641)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2461 (class 1259 OID 15166225)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 15166592)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2657 (class 1259 OID 15166849)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2631 (class 1259 OID 15166756)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2632 (class 1259 OID 15166757)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2510 (class 1259 OID 15166357)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2430 (class 1259 OID 15166122)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2500 (class 1259 OID 15166330)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2703 (class 2606 OID 15167036)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2706 (class 2606 OID 15167021)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2705 (class 2606 OID 15167026)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2701 (class 2606 OID 15167046)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2707 (class 2606 OID 15167016)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2702 (class 2606 OID 15167041)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2704 (class 2606 OID 15167031)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2737 (class 2606 OID 15167191)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2736 (class 2606 OID 15167196)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2770 (class 2606 OID 15167366)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2771 (class 2606 OID 15167361)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2688 (class 2606 OID 15166951)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2724 (class 2606 OID 15167131)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2765 (class 2606 OID 15167346)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2766 (class 2606 OID 15167341)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2764 (class 2606 OID 15167351)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2767 (class 2606 OID 15167336)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2768 (class 2606 OID 15167331)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2722 (class 2606 OID 15167126)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2723 (class 2606 OID 15167121)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2700 (class 2606 OID 15167011)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2732 (class 2606 OID 15167161)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2730 (class 2606 OID 15167171)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2731 (class 2606 OID 15167166)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2694 (class 2606 OID 15166986)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2695 (class 2606 OID 15166981)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2720 (class 2606 OID 15167111)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2761 (class 2606 OID 15167316)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2740 (class 2606 OID 15167201)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2739 (class 2606 OID 15167206)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2738 (class 2606 OID 15167211)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2769 (class 2606 OID 15167356)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2742 (class 2606 OID 15167231)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2745 (class 2606 OID 15167216)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2741 (class 2606 OID 15167236)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2743 (class 2606 OID 15167226)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2744 (class 2606 OID 15167221)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2692 (class 2606 OID 15166976)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2693 (class 2606 OID 15166971)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2684 (class 2606 OID 15166936)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2685 (class 2606 OID 15166931)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2726 (class 2606 OID 15167141)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2708 (class 2606 OID 15167051)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2681 (class 2606 OID 15166911)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2680 (class 2606 OID 15166916)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2727 (class 2606 OID 15167156)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2728 (class 2606 OID 15167151)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2729 (class 2606 OID 15167146)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2698 (class 2606 OID 15166991)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2696 (class 2606 OID 15167001)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2697 (class 2606 OID 15166996)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2763 (class 2606 OID 15167326)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2712 (class 2606 OID 15167086)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2714 (class 2606 OID 15167076)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2715 (class 2606 OID 15167071)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2713 (class 2606 OID 15167081)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2679 (class 2606 OID 15166901)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2678 (class 2606 OID 15166906)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2725 (class 2606 OID 15167136)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2774 (class 2606 OID 15167381)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2776 (class 2606 OID 15167386)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2775 (class 2606 OID 15167391)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2721 (class 2606 OID 15167116)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2735 (class 2606 OID 15167181)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2734 (class 2606 OID 15167186)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2752 (class 2606 OID 15167291)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2753 (class 2606 OID 15167286)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2756 (class 2606 OID 15167271)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2755 (class 2606 OID 15167276)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2754 (class 2606 OID 15167281)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2690 (class 2606 OID 15166961)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2691 (class 2606 OID 15166956)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2689 (class 2606 OID 15166966)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2759 (class 2606 OID 15167301)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2758 (class 2606 OID 15167306)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2749 (class 2606 OID 15167261)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2748 (class 2606 OID 15167266)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2751 (class 2606 OID 15167251)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2750 (class 2606 OID 15167256)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2733 (class 2606 OID 15167176)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2716 (class 2606 OID 15167106)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2717 (class 2606 OID 15167101)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2719 (class 2606 OID 15167091)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2718 (class 2606 OID 15167096)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2746 (class 2606 OID 15167246)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2747 (class 2606 OID 15167241)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2757 (class 2606 OID 15167296)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2699 (class 2606 OID 15167006)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2760 (class 2606 OID 15167311)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2762 (class 2606 OID 15167321)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2773 (class 2606 OID 15167371)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2772 (class 2606 OID 15167376)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2682 (class 2606 OID 15166926)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2683 (class 2606 OID 15166921)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2687 (class 2606 OID 15166941)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2686 (class 2606 OID 15166946)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2709 (class 2606 OID 15167066)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2710 (class 2606 OID 15167061)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2711 (class 2606 OID 15167056)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-21 11:37:38 CEST

--
-- PostgreSQL database dump complete
--

