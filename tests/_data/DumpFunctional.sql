--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-13 09:23:25 CEST

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
-- TOC entry 177 (class 1259 OID 13296587)
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
-- TOC entry 222 (class 1259 OID 13297090)
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
-- TOC entry 221 (class 1259 OID 13297073)
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
-- TOC entry 215 (class 1259 OID 13296985)
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
-- TOC entry 238 (class 1259 OID 13297333)
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
-- TOC entry 191 (class 1259 OID 13296766)
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
-- TOC entry 194 (class 1259 OID 13296800)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 13297235)
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
-- TOC entry 186 (class 1259 OID 13296709)
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
-- TOC entry 223 (class 1259 OID 13297103)
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
-- TOC entry 210 (class 1259 OID 13296930)
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
-- TOC entry 189 (class 1259 OID 13296746)
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
-- TOC entry 193 (class 1259 OID 13296794)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 13296726)
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
-- TOC entry 199 (class 1259 OID 13296847)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 236 (class 1259 OID 13297314)
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
-- TOC entry 237 (class 1259 OID 13297326)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 13297349)
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
-- TOC entry 203 (class 1259 OID 13296872)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 13296683)
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
-- TOC entry 178 (class 1259 OID 13296596)
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
-- TOC entry 179 (class 1259 OID 13296607)
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
-- TOC entry 174 (class 1259 OID 13296561)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 13296580)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 13296879)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 13296910)
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
-- TOC entry 218 (class 1259 OID 13297024)
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
-- TOC entry 181 (class 1259 OID 13296640)
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
-- TOC entry 183 (class 1259 OID 13296675)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 13296853)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 13296660)
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
-- TOC entry 188 (class 1259 OID 13296738)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 13296865)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 13297196)
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
-- TOC entry 226 (class 1259 OID 13297206)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 224 (class 1259 OID 13297152)
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
-- TOC entry 227 (class 1259 OID 13297214)
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
-- TOC entry 206 (class 1259 OID 13296894)
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
-- TOC entry 198 (class 1259 OID 13296838)
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
-- TOC entry 197 (class 1259 OID 13296828)
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
-- TOC entry 217 (class 1259 OID 13297013)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 13296962)
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
-- TOC entry 171 (class 1259 OID 13296532)
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
-- TOC entry 170 (class 1259 OID 13296530)
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
-- TOC entry 207 (class 1259 OID 13296904)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 13296570)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 13296554)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 13296918)
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
-- TOC entry 201 (class 1259 OID 13296859)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 13296805)
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
-- TOC entry 232 (class 1259 OID 13297255)
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
-- TOC entry 231 (class 1259 OID 13297247)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 13297242)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 13296972)
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
-- TOC entry 180 (class 1259 OID 13296632)
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
-- TOC entry 196 (class 1259 OID 13296815)
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
-- TOC entry 216 (class 1259 OID 13297002)
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
-- TOC entry 228 (class 1259 OID 13297224)
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
-- TOC entry 185 (class 1259 OID 13296695)
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
-- TOC entry 172 (class 1259 OID 13296541)
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
-- TOC entry 220 (class 1259 OID 13297050)
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
-- TOC entry 190 (class 1259 OID 13296757)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 13296886)
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
-- TOC entry 234 (class 1259 OID 13297294)
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
-- TOC entry 233 (class 1259 OID 13297266)
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
-- TOC entry 235 (class 1259 OID 13297306)
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
-- TOC entry 212 (class 1259 OID 13296955)
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
-- TOC entry 192 (class 1259 OID 13296789)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 13297040)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 13296945)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2170 (class 2604 OID 13296535)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2891 (class 0 OID 13296587)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 13297090)
-- Dependencies: 222
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55cc-45ec-087c-32db663b811f	000d0000-55cc-45ec-0012-0a81fdd734ad	\N	00090000-55cc-45ec-380e-b47bcc4c8bac	000b0000-55cc-45ec-d196-c85d5aaf2e3f	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55cc-45ec-265d-a1f5b9b7fe80	000d0000-55cc-45ec-cf04-7d4b6f0bd8ce	00100000-55cc-45ec-2c97-105036b4a563	00090000-55cc-45ec-1666-027e0d98705f	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55cc-45ec-c85a-7cba1a4fd4ef	000d0000-55cc-45ec-5492-7f25b7179663	00100000-55cc-45ec-bb90-2a4d01e6482d	00090000-55cc-45ec-ccc9-d43cd9a0e195	\N	0003	t	\N	2015-08-13	\N	2	\N	\N	f	f
000c0000-55cc-45ec-fac6-f8366e07db71	000d0000-55cc-45ec-5519-cf40a62c4b16	\N	00090000-55cc-45ec-6f2a-f25b35448187	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55cc-45ec-d7d2-7ff76915962d	000d0000-55cc-45ec-3b66-781c78213ffa	\N	00090000-55cc-45ec-f901-c14735fc72f6	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55cc-45ec-1b27-924788461671	000d0000-55cc-45ec-03f4-b73794042a89	\N	00090000-55cc-45ec-2864-b21e2a30c60a	000b0000-55cc-45ec-d5f9-b1c0eec2bbeb	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55cc-45ec-a499-2192a35415f2	000d0000-55cc-45ec-7753-8a3fde303cf1	00100000-55cc-45ec-82b4-6ea9396d4aec	00090000-55cc-45ec-e88a-c7aace883a24	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55cc-45ec-df7a-c2f285c5dc07	000d0000-55cc-45ec-5fda-eb2f60c2b90f	\N	00090000-55cc-45ec-bb97-119cb3b46870	000b0000-55cc-45ec-96eb-44d2c4e2f34a	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55cc-45ec-6d39-c1f88feb67d2	000d0000-55cc-45ec-7753-8a3fde303cf1	00100000-55cc-45ec-5e33-dedd318f7228	00090000-55cc-45ec-9d05-70c9ca9de211	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55cc-45ec-4d83-56886e90395d	000d0000-55cc-45ec-7753-8a3fde303cf1	00100000-55cc-45ec-6309-14bb7231f709	00090000-55cc-45ec-5e10-00a433d92f5c	\N	0010	t	\N	2015-08-13	\N	16	\N	\N	f	t
000c0000-55cc-45ec-a265-9931a82faca0	000d0000-55cc-45ec-7753-8a3fde303cf1	00100000-55cc-45ec-d264-50a0eec6cc8d	00090000-55cc-45ec-1502-759f99922824	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2935 (class 0 OID 13297073)
-- Dependencies: 221
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 13296985)
-- Dependencies: 215
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55cc-45ec-5d3c-7b2b45c58019	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55cc-45ec-1bce-f20b696cc2e8	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55cc-45ec-7b2c-e4e72c65648b	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2952 (class 0 OID 13297333)
-- Dependencies: 238
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 13296766)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55cc-45ec-517c-3903c33b6d32	\N	\N	00200000-55cc-45ec-3771-1bc9e7c972a6	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55cc-45ec-c755-28097763c76f	\N	\N	00200000-55cc-45ec-0f4d-70589d6ec729	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55cc-45ec-db39-de529afa256b	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55cc-45ec-412c-ab13af08930d	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55cc-45ec-6c42-25c6e0b35111	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2908 (class 0 OID 13296800)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2943 (class 0 OID 13297235)
-- Dependencies: 229
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 13296709)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55cc-45ea-6ab5-79835382f852	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55cc-45ea-aa4f-ab330015518a	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55cc-45ea-f241-0067e1f5af1d	AL	ALB	008	Albania 	Albanija	\N
00040000-55cc-45ea-49a1-621d20822bc8	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55cc-45ea-2819-2e79b7655c26	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55cc-45ea-b737-6eb52150b953	AD	AND	020	Andorra 	Andora	\N
00040000-55cc-45ea-c00e-12b20798a956	AO	AGO	024	Angola 	Angola	\N
00040000-55cc-45ea-c070-196934bb2194	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55cc-45ea-f0f4-d00e1eafc488	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55cc-45ea-7c6d-556210feed3e	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55cc-45ea-026c-b9f4f46a4dfe	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55cc-45ea-e82f-19f50bfad71b	AM	ARM	051	Armenia 	Armenija	\N
00040000-55cc-45ea-6dc3-04e4b1e7e1e0	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55cc-45ea-5350-5cee5c6ae10c	AU	AUS	036	Australia 	Avstralija	\N
00040000-55cc-45ea-0348-b7665cb28e15	AT	AUT	040	Austria 	Avstrija	\N
00040000-55cc-45ea-a7fd-74bce6d5950f	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55cc-45ea-785f-2ceed065bef0	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55cc-45ea-b4ec-9cf588c54315	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55cc-45ea-b3d0-62724eb2910d	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55cc-45ea-da00-2c9193c1d892	BB	BRB	052	Barbados 	Barbados	\N
00040000-55cc-45ea-6c16-fe5d337d9b25	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55cc-45ea-fb70-15a9e4ec74ba	BE	BEL	056	Belgium 	Belgija	\N
00040000-55cc-45ea-1bda-8e57f3e54660	BZ	BLZ	084	Belize 	Belize	\N
00040000-55cc-45ea-1848-2849e8134af7	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55cc-45ea-1447-7b1b2678e1b8	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55cc-45ea-0163-aeb2185e2db1	BT	BTN	064	Bhutan 	Butan	\N
00040000-55cc-45ea-ad06-6ad47e6197a9	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55cc-45ea-e951-f7ab573f2961	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55cc-45ea-84da-d211240e0ec7	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55cc-45ea-5c25-5dfc25635ca0	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55cc-45ea-e2a7-b300cdb57323	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55cc-45ea-e756-20d3814c548e	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55cc-45ea-5efb-93eda2e950a1	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55cc-45ea-c519-56b1e3d9b5d4	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55cc-45ea-c6bb-5e666188296b	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55cc-45ea-ad74-3808a6b34598	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55cc-45ea-a6e7-7f357d3d2dc3	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55cc-45ea-c6b2-d2e17cc540b0	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55cc-45ea-2d3e-395aae980c82	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55cc-45ea-7598-ff80e1b222f4	CA	CAN	124	Canada 	Kanada	\N
00040000-55cc-45ea-9ef4-0128563ba9ac	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55cc-45ea-d27e-6679c1653571	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55cc-45ea-8c06-185848d19219	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55cc-45ea-c9d7-996dc58aff74	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55cc-45ea-08f2-dd7ea70c15f3	CL	CHL	152	Chile 	Čile	\N
00040000-55cc-45ea-5b94-004c053d0fd6	CN	CHN	156	China 	Kitajska	\N
00040000-55cc-45ea-4f0b-12e55af3f893	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55cc-45ea-3330-4f7d36a541fd	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55cc-45ea-a184-17e4d2eb1aad	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55cc-45ea-d102-9ec6f5c65c76	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55cc-45ea-0eb7-dcebf4bef406	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55cc-45ea-31dc-a301ab958195	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55cc-45ea-251b-7dbb1629b957	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55cc-45ea-6890-9bc791763f29	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55cc-45ea-7524-0577d7ded072	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55cc-45ea-234a-34f1b40caf77	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55cc-45ea-5cc2-d1d0fb4726a2	CU	CUB	192	Cuba 	Kuba	\N
00040000-55cc-45ea-927a-6e249d4236b2	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55cc-45ea-537d-3a9d185965af	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55cc-45ea-a97b-35abe3c8e91c	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55cc-45ea-f2ad-dc30ec939958	DK	DNK	208	Denmark 	Danska	\N
00040000-55cc-45ea-01fb-71d1802cac59	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55cc-45ea-a861-1e6391aa0fd5	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55cc-45ea-34e0-04c9f181d8c1	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55cc-45ea-6741-173b02e3501a	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55cc-45ea-8f19-a70eda84dd67	EG	EGY	818	Egypt 	Egipt	\N
00040000-55cc-45ea-a6eb-f6e837180765	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55cc-45ea-d19c-fb9dfad3ba7f	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55cc-45ea-6cd8-df501d47b376	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55cc-45ea-4c38-159b7da86dfb	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55cc-45ea-615c-1b43db97d6f4	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55cc-45ea-dc3c-3af32a1f3fa5	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55cc-45ea-1b0e-43de30dd4dea	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55cc-45ea-afb6-aa92e2732b0b	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55cc-45ea-14d6-a5adee6fb737	FI	FIN	246	Finland 	Finska	\N
00040000-55cc-45ea-d406-8a4ab0e468c4	FR	FRA	250	France 	Francija	\N
00040000-55cc-45ea-7d5d-3a124ac8eb1d	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55cc-45ea-5aef-36c09ce8611b	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55cc-45ea-9cf9-bd9274945007	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55cc-45ea-135c-ead01510ed12	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55cc-45ea-fa54-c4003d161624	GA	GAB	266	Gabon 	Gabon	\N
00040000-55cc-45ea-78d3-782f67e9a121	GM	GMB	270	Gambia 	Gambija	\N
00040000-55cc-45ea-8d7f-b34a74d1b407	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55cc-45ea-f66a-f9d915d3b713	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55cc-45ea-d8b3-1a9069f1d23c	GH	GHA	288	Ghana 	Gana	\N
00040000-55cc-45ea-195b-44c835a38af1	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55cc-45ea-a212-7f408cec11f3	GR	GRC	300	Greece 	Grčija	\N
00040000-55cc-45ea-ed38-dd637fe6d147	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55cc-45ea-3f2e-5619e9319a69	GD	GRD	308	Grenada 	Grenada	\N
00040000-55cc-45ea-18d3-239cc05acec6	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55cc-45ea-14a4-fdbf3fcf07a5	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55cc-45ea-5c8b-841333aea62d	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55cc-45ea-8afe-8baeac102ed9	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55cc-45ea-b62c-937269cd046f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55cc-45ea-e538-45be7540cab1	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55cc-45ea-21f4-d6042da159d5	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55cc-45ea-1bcb-804fcae23244	HT	HTI	332	Haiti 	Haiti	\N
00040000-55cc-45ea-ea2b-5326fd2b0f3c	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55cc-45ea-aefc-4c02765f34b4	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55cc-45ea-4a3c-bbea89075f79	HN	HND	340	Honduras 	Honduras	\N
00040000-55cc-45ea-49f3-6bb97bf1c7ba	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55cc-45ea-a28d-871140d58cfd	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55cc-45ea-fd7c-3295614ffe2a	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55cc-45ea-6a9d-06bd99f3eddb	IN	IND	356	India 	Indija	\N
00040000-55cc-45ea-29a7-780a12495b13	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55cc-45ea-859b-16a8d5231748	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55cc-45ea-483e-278d7714e6f6	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55cc-45ea-fe3b-a10740b08295	IE	IRL	372	Ireland 	Irska	\N
00040000-55cc-45ea-9254-00a5cac04ae3	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55cc-45ea-b630-2fbbbf3b2b28	IL	ISR	376	Israel 	Izrael	\N
00040000-55cc-45ea-9f47-8339a92d1b62	IT	ITA	380	Italy 	Italija	\N
00040000-55cc-45ea-c196-3cddf32c1b54	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55cc-45ea-b090-82bce3ac3922	JP	JPN	392	Japan 	Japonska	\N
00040000-55cc-45ea-92d5-232e51ceb8a4	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55cc-45ea-d33b-f8ddf753613c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55cc-45ea-bedd-917a18de0102	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55cc-45ea-b024-cdf04e8770bb	KE	KEN	404	Kenya 	Kenija	\N
00040000-55cc-45ea-4963-b728d514de19	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55cc-45ea-9e61-82974cded0c8	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55cc-45ea-c381-e236d19ab411	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55cc-45ea-7e8e-f809d83cc86f	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55cc-45ea-0110-39de5eab8c7c	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55cc-45ea-be06-8de2ad14417d	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55cc-45ea-49c6-8fd8d243bc13	LV	LVA	428	Latvia 	Latvija	\N
00040000-55cc-45ea-163c-32a19f9e2cc2	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55cc-45ea-635b-4a4dbd211d91	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55cc-45ea-d252-df25306d75d5	LR	LBR	430	Liberia 	Liberija	\N
00040000-55cc-45ea-4d00-339eebc2cb3e	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55cc-45ea-a77a-8c0d24e005e0	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55cc-45ea-a7be-99f244bae07c	LT	LTU	440	Lithuania 	Litva	\N
00040000-55cc-45ea-6c8c-3eb9c0115fcd	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55cc-45ea-153c-fa3f65ef1255	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55cc-45ea-7278-b55608a90b95	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55cc-45ea-64da-b999d48eb71d	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55cc-45ea-321a-6bc6476057b3	MW	MWI	454	Malawi 	Malavi	\N
00040000-55cc-45ea-a84e-0fa0d8062d4d	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55cc-45ea-2638-a3cb6b09b8c2	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55cc-45ea-f7e7-ed2342846b92	ML	MLI	466	Mali 	Mali	\N
00040000-55cc-45ea-bc5d-2810706c8844	MT	MLT	470	Malta 	Malta	\N
00040000-55cc-45ea-7bed-588a537337e6	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55cc-45ea-9662-18300d21e7a8	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55cc-45ea-7424-25e8c095cdb4	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55cc-45ea-9cca-3b572ec82a31	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55cc-45ea-248b-619e19c4d625	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55cc-45ea-5ad6-f4489355f88e	MX	MEX	484	Mexico 	Mehika	\N
00040000-55cc-45ea-a2b8-8ec32008409b	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55cc-45ea-eaa6-aa38e97c9b60	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55cc-45ea-91ba-4a5dc7f5cc9f	MC	MCO	492	Monaco 	Monako	\N
00040000-55cc-45ea-580a-4e2f10eb3d7c	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55cc-45ea-33c8-1edb949528d4	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55cc-45ea-945d-c480857b83f4	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55cc-45ea-e602-06649ca96d79	MA	MAR	504	Morocco 	Maroko	\N
00040000-55cc-45ea-e4b3-1d8c7a0710d2	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55cc-45ea-46be-3d70cde4b28e	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55cc-45ea-895f-dcecccbf4df1	NA	NAM	516	Namibia 	Namibija	\N
00040000-55cc-45ea-691d-ae6f65a1cc05	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55cc-45ea-5738-0e0a54f3e5b5	NP	NPL	524	Nepal 	Nepal	\N
00040000-55cc-45ea-622b-f6e663c69bcb	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55cc-45ea-0982-f89d85eeb021	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55cc-45ea-76d5-51880759ba93	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55cc-45ea-6086-b17baf8ff525	NE	NER	562	Niger 	Niger 	\N
00040000-55cc-45ea-acca-4c037d8b5cc7	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55cc-45ea-bc98-c0d8cd80e196	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55cc-45ea-b64a-6ef6a7805ef7	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55cc-45ea-5a9d-be74a457b6dc	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55cc-45ea-5c40-87aab0a7f32a	NO	NOR	578	Norway 	Norveška	\N
00040000-55cc-45ea-5018-0fac36bc6f14	OM	OMN	512	Oman 	Oman	\N
00040000-55cc-45ea-cff8-4500a9aa6fdb	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55cc-45ea-66c0-b5b88013d8f8	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55cc-45ea-eff5-5b4da63c7573	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55cc-45ea-7ab8-98d3c4c8ac6b	PA	PAN	591	Panama 	Panama	\N
00040000-55cc-45ea-ac6a-fdddac415011	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55cc-45ea-8468-9ed9c8de12b5	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55cc-45ea-09bb-4ae7ec37d6f0	PE	PER	604	Peru 	Peru	\N
00040000-55cc-45ea-6a51-a82b06cee2f0	PH	PHL	608	Philippines 	Filipini	\N
00040000-55cc-45ea-5b02-d3394a4e2e1a	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55cc-45ea-2d11-632163b398d1	PL	POL	616	Poland 	Poljska	\N
00040000-55cc-45ea-b6e7-ddc4523ad8fe	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55cc-45ea-0522-52a915a81207	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55cc-45ea-8424-c3f47110830d	QA	QAT	634	Qatar 	Katar	\N
00040000-55cc-45ea-7346-73c1f33af334	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55cc-45ea-5b44-d9981c28a80f	RO	ROU	642	Romania 	Romunija	\N
00040000-55cc-45ea-87dd-dd04930e8753	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55cc-45ea-808e-34fcc2a5653f	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55cc-45ea-631a-1e0bf5f3fb08	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55cc-45ea-3e48-481f52c1ee1d	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55cc-45ea-10b7-e1ee8d5317e6	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55cc-45ea-4789-cc124c0fac28	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55cc-45ea-4f4a-4ac7b8790be6	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55cc-45ea-56bc-80f5b4dbd1fa	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55cc-45ea-80b6-2375f2c8cf06	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55cc-45ea-090e-a951017460f9	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55cc-45ea-a510-e4886d57779b	SM	SMR	674	San Marino 	San Marino	\N
00040000-55cc-45ea-977a-63f77723c963	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55cc-45ea-6f78-db12a51ef035	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55cc-45ea-5789-7799be699363	SN	SEN	686	Senegal 	Senegal	\N
00040000-55cc-45ea-ac05-d411f86bc64a	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55cc-45ea-1e49-de2c174e9a87	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55cc-45ea-a596-f75d3c4653a6	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55cc-45ea-717a-4ce7af1c69b6	SG	SGP	702	Singapore 	Singapur	\N
00040000-55cc-45ea-6d9c-8c431e0b0291	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55cc-45ea-a100-78949ea694d0	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55cc-45ea-82d6-696b67e043b1	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55cc-45ea-2388-fef4ca707fbd	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55cc-45ea-d555-47f817d90122	SO	SOM	706	Somalia 	Somalija	\N
00040000-55cc-45ea-63b6-6f9332c0924b	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55cc-45ea-3697-bf2a997fc45e	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55cc-45ea-8ac8-f96f135661fb	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55cc-45ea-ca67-8d01be61b12c	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55cc-45ea-cb90-4e2c2d89b33f	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55cc-45ea-df0c-bb36a4e55bd2	SD	SDN	729	Sudan 	Sudan	\N
00040000-55cc-45ea-4a7d-eda8288ac820	SR	SUR	740	Suriname 	Surinam	\N
00040000-55cc-45ea-c2fa-e656cf606fa8	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55cc-45eb-caf7-e6c600c5c3c8	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55cc-45eb-e216-87d85c325958	SE	SWE	752	Sweden 	Švedska	\N
00040000-55cc-45eb-ffd6-4b6a599e66f3	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55cc-45eb-0393-a0c587165b67	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55cc-45eb-4401-88c2819053d7	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55cc-45eb-f0ff-d3b8e090c42f	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55cc-45eb-22a3-4c70ecfd3b75	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55cc-45eb-f42d-34ed69de52c1	TH	THA	764	Thailand 	Tajska	\N
00040000-55cc-45eb-423c-3b9f1166dd38	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55cc-45eb-88fb-420e2450911b	TG	TGO	768	Togo 	Togo	\N
00040000-55cc-45eb-e824-ce551cfaff5c	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55cc-45eb-b3b3-4a773c698b83	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55cc-45eb-5fcd-82349d8fb4b1	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55cc-45eb-2baf-257a350be68f	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55cc-45eb-79c6-b312eee1ad04	TR	TUR	792	Turkey 	Turčija	\N
00040000-55cc-45eb-5eb4-5e6d32d65b3d	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55cc-45eb-aeb4-5d4aabbf880b	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55cc-45eb-548c-ae80c492ee50	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55cc-45eb-3d77-0b884e3dfc79	UG	UGA	800	Uganda 	Uganda	\N
00040000-55cc-45eb-52df-381e94a6d064	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55cc-45eb-98d6-f7ba268b15bb	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55cc-45eb-750f-57f73a61a5e4	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55cc-45eb-6238-756aa896dbd9	US	USA	840	United States 	Združene države Amerike	\N
00040000-55cc-45eb-eb2a-1e53aa5d1e64	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55cc-45eb-2317-6dc53358942a	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55cc-45eb-e0a1-453d920e5fdd	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55cc-45eb-22cf-b4e88f7d9989	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55cc-45eb-b7be-d3e582fdfea2	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55cc-45eb-901e-6b5e11191e85	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55cc-45eb-529a-b2bdd2b06dca	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55cc-45eb-990c-d33ace97cec9	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55cc-45eb-b90f-6c982d6264bf	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55cc-45eb-9cab-6d88b920907f	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55cc-45eb-64c0-dcd8bd0d6a7e	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55cc-45eb-1662-2ff87ab97ac8	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55cc-45eb-4a20-cdee8e03aabe	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2937 (class 0 OID 13297103)
-- Dependencies: 223
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55cc-45ec-6601-bf8871805b58	000e0000-55cc-45ec-7ad3-981ea5ff10ed	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55cc-45eb-4f85-7f6a80803d82	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55cc-45ec-419c-9d3bcd2a550a	000e0000-55cc-45ec-2a0c-439ae7dc9229	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55cc-45eb-edd4-915af99f8f8b	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55cc-45ec-5d8a-ccb5e822537c	000e0000-55cc-45ec-0734-3e8f5b353c08	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55cc-45eb-4f85-7f6a80803d82	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55cc-45ec-3ab1-b8278f575b17	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55cc-45ec-4db7-5b7a84320283	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2924 (class 0 OID 13296930)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55cc-45ec-7753-8a3fde303cf1	000e0000-55cc-45ec-2a0c-439ae7dc9229	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55cc-45eb-b658-5b66e32b9bcb
000d0000-55cc-45ec-0012-0a81fdd734ad	000e0000-55cc-45ec-2a0c-439ae7dc9229	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55cc-45eb-b658-5b66e32b9bcb
000d0000-55cc-45ec-cf04-7d4b6f0bd8ce	000e0000-55cc-45ec-2a0c-439ae7dc9229	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55cc-45eb-bf41-20f5ae2f3467
000d0000-55cc-45ec-5492-7f25b7179663	000e0000-55cc-45ec-2a0c-439ae7dc9229	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55cc-45eb-c4b4-51be7699fe4f
000d0000-55cc-45ec-5519-cf40a62c4b16	000e0000-55cc-45ec-2a0c-439ae7dc9229	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55cc-45eb-cdfc-bb3d2017504c
000d0000-55cc-45ec-3b66-781c78213ffa	000e0000-55cc-45ec-2a0c-439ae7dc9229	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55cc-45eb-ab1c-d998e0cd789f
000d0000-55cc-45ec-03f4-b73794042a89	000e0000-55cc-45ec-2a0c-439ae7dc9229	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55cc-45eb-b658-5b66e32b9bcb
000d0000-55cc-45ec-5fda-eb2f60c2b90f	000e0000-55cc-45ec-2a0c-439ae7dc9229	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55cc-45eb-dda2-7fdd892f53b9
\.


--
-- TOC entry 2903 (class 0 OID 13296746)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 13296794)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 13296726)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55cc-45ec-39f1-b3fc69259f06	00080000-55cc-45ec-9b22-14864b8c40d7	00090000-55cc-45ec-5e10-00a433d92f5c	AK		
\.


--
-- TOC entry 2913 (class 0 OID 13296847)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 13297314)
-- Dependencies: 236
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 13297326)
-- Dependencies: 237
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 13297349)
-- Dependencies: 239
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2917 (class 0 OID 13296872)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 13296683)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55cc-45eb-db5d-656e8fbb116b	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55cc-45eb-d48c-ce2027a75c57	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55cc-45eb-2324-87363b1abb26	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55cc-45eb-651e-772783ae11b8	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55cc-45eb-2e67-278ec3c882fb	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55cc-45eb-cc3f-2082b33f02eb	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55cc-45eb-258b-c50612d9900c	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55cc-45eb-ef83-959138594fee	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55cc-45eb-8785-9f5f09eef7b1	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55cc-45eb-e29c-b94b26139f2c	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55cc-45eb-9f66-45eecab20059	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55cc-45eb-4e43-1e8b67e4cd41	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55cc-45eb-3d99-11c0284060db	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55cc-45eb-2c18-23de80102d22	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55cc-45ec-b3d9-bce22edc0b1a	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55cc-45ec-8e0b-4a00d5ec476a	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55cc-45ec-dbca-d84e49cdfe2b	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55cc-45ec-8ea0-17e77598cff8	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55cc-45ec-a2af-c52bb42c2256	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55cc-45ec-37c5-de78c62f4e31	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2892 (class 0 OID 13296596)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55cc-45ec-49f3-93be08f71651	00000000-55cc-45ec-8e0b-4a00d5ec476a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55cc-45ec-9a2f-ac7166fca3ef	00000000-55cc-45ec-8e0b-4a00d5ec476a	00010000-55cc-45eb-b656-04e42f025d7d	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55cc-45ec-acc4-97f1c4d3db78	00000000-55cc-45ec-dbca-d84e49cdfe2b	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2893 (class 0 OID 13296607)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55cc-45ec-380e-b47bcc4c8bac	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55cc-45ec-6f2a-f25b35448187	00010000-55cc-45ec-8cb1-35e5161b4850	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55cc-45ec-ccc9-d43cd9a0e195	00010000-55cc-45ec-c233-974e2dfbc4bb	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55cc-45ec-9d05-70c9ca9de211	00010000-55cc-45ec-c56f-a3a1d0ede374	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55cc-45ec-dc1f-f4fc14b3bdd9	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55cc-45ec-2864-b21e2a30c60a	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55cc-45ec-1502-759f99922824	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55cc-45ec-e88a-c7aace883a24	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55cc-45ec-5e10-00a433d92f5c	00010000-55cc-45ec-3f03-0d09d0d72e65	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55cc-45ec-1666-027e0d98705f	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55cc-45ec-4e9a-fa2bb913f49e	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55cc-45ec-f901-c14735fc72f6	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55cc-45ec-bb97-119cb3b46870	00010000-55cc-45ec-1b71-7e76f3bbc03e	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2888 (class 0 OID 13296561)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55cc-45eb-2d43-7eaf3e36c249	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55cc-45eb-e233-8a9fa9adaf1f	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55cc-45eb-697d-2bca707a4c54	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55cc-45eb-0030-f80c0bf5bd15	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55cc-45eb-ba89-47a79ad07318	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55cc-45eb-73d6-a61be7f29793	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55cc-45eb-9afd-900244739463	Abonma-read	Abonma - branje	f
00030000-55cc-45eb-68a8-8acdabe75dde	Abonma-write	Abonma - spreminjanje	f
00030000-55cc-45eb-88e0-6fca2649bfcb	Alternacija-read	Alternacija - branje	f
00030000-55cc-45eb-ecac-c00767c24ea2	Alternacija-write	Alternacija - spreminjanje	f
00030000-55cc-45eb-888e-739e37fe8710	Arhivalija-read	Arhivalija - branje	f
00030000-55cc-45eb-61ee-a96d9cef2343	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55cc-45eb-7f6c-034c7cf04a3d	Besedilo-read	Besedilo - branje	f
00030000-55cc-45eb-4451-79ead4409486	Besedilo-write	Besedilo - spreminjanje	f
00030000-55cc-45eb-3939-edee1d7ef696	DogodekIzven-read	DogodekIzven - branje	f
00030000-55cc-45eb-11b0-162ec7a3f4ad	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55cc-45eb-238b-2a77392a1d23	Dogodek-read	Dogodek - branje	f
00030000-55cc-45eb-4622-29ae278e4ecd	Dogodek-write	Dogodek - spreminjanje	f
00030000-55cc-45eb-8c86-efbcb8bb8002	DrugiVir-read	DrugiVir - branje	f
00030000-55cc-45eb-5ffa-3e7608f6c851	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55cc-45eb-96db-f5b20326e9c0	Drzava-read	Drzava - branje	f
00030000-55cc-45eb-a2ce-88ca3cd2dc2c	Drzava-write	Drzava - spreminjanje	f
00030000-55cc-45eb-fa1b-9bcab2ec2bdd	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55cc-45eb-4a41-4660cfc0544c	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55cc-45eb-c005-bf18451911e1	Funkcija-read	Funkcija - branje	f
00030000-55cc-45eb-55a1-762916b0da76	Funkcija-write	Funkcija - spreminjanje	f
00030000-55cc-45eb-d1fa-b33e1c0ffe10	Gostovanje-read	Gostovanje - branje	f
00030000-55cc-45eb-5882-fedb09f8ad01	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55cc-45eb-acf1-b216de8ee30e	Gostujoca-read	Gostujoca - branje	f
00030000-55cc-45eb-4fb3-b7a8bb5167d8	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55cc-45eb-11ff-f7068ccf3d2f	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55cc-45eb-a9a9-43afaffe6178	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55cc-45eb-4564-9e63e697bd1d	Kupec-read	Kupec - branje	f
00030000-55cc-45eb-77e1-31ecb5b505a4	Kupec-write	Kupec - spreminjanje	f
00030000-55cc-45eb-c7b5-55bc2a8ed750	NacinPlacina-read	NacinPlacina - branje	f
00030000-55cc-45eb-cdc6-fcd4481b5293	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55cc-45eb-e18d-79735a1cdad6	Option-read	Option - branje	f
00030000-55cc-45eb-ee7b-f4243b4be02a	Option-write	Option - spreminjanje	f
00030000-55cc-45eb-4895-8e97a8806583	OptionValue-read	OptionValue - branje	f
00030000-55cc-45eb-f234-ccfeb999fbc4	OptionValue-write	OptionValue - spreminjanje	f
00030000-55cc-45eb-153a-e02cc7092ebf	Oseba-read	Oseba - branje	f
00030000-55cc-45eb-dcb2-fbf428a9b698	Oseba-write	Oseba - spreminjanje	f
00030000-55cc-45eb-ecc6-020efac9c99e	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55cc-45eb-af0c-d55eccb147a3	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55cc-45eb-7197-91ae88fd4b65	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55cc-45eb-efb5-90959eca2626	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55cc-45eb-9711-40e8d738fd9b	Pogodba-read	Pogodba - branje	f
00030000-55cc-45eb-c8f0-898994a9101e	Pogodba-write	Pogodba - spreminjanje	f
00030000-55cc-45eb-f89f-1efe6046f0a2	Popa-read	Popa - branje	f
00030000-55cc-45eb-54d1-35b93caf5549	Popa-write	Popa - spreminjanje	f
00030000-55cc-45eb-9190-20277d878012	Posta-read	Posta - branje	f
00030000-55cc-45eb-46c9-226f0f174bcc	Posta-write	Posta - spreminjanje	f
00030000-55cc-45eb-3d95-66d9db265824	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55cc-45eb-8a3e-9bce6f38ddbd	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55cc-45eb-cd6d-beded22850e2	PostniNaslov-read	PostniNaslov - branje	f
00030000-55cc-45eb-5e7d-6df983f2372d	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55cc-45eb-fa52-ec837ea4682a	Predstava-read	Predstava - branje	f
00030000-55cc-45eb-63d0-8cffc57f82be	Predstava-write	Predstava - spreminjanje	f
00030000-55cc-45eb-8d0b-0b0c2ee51e8c	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55cc-45eb-b410-6cb81e0b897b	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55cc-45eb-66a9-6b57e062e654	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55cc-45eb-1a1d-8de59a6277ba	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55cc-45eb-d087-a20156887818	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55cc-45eb-5cc6-351359d3c0af	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55cc-45eb-974d-2085caed1511	ProgramDela-read	ProgramDela - branje	f
00030000-55cc-45eb-06e9-074560ed0d26	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55cc-45eb-b8d4-1d98ba75f045	ProgramFestival-read	ProgramFestival - branje	f
00030000-55cc-45eb-82b1-d330055259e6	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55cc-45eb-8233-77321eae0013	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55cc-45eb-e801-76d6bc4cbfb6	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55cc-45eb-8fe2-eb4010468496	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55cc-45eb-f24c-83f8bb586c6f	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55cc-45eb-ee85-e640ee02ab3c	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55cc-45eb-7cb6-204672b5ed05	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55cc-45eb-8759-fa4860258b38	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55cc-45eb-25bf-af6acd5399ed	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55cc-45eb-28e1-87c1439804c4	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55cc-45eb-cacd-673bbd228aee	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55cc-45eb-b510-5148fcf0bff8	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55cc-45eb-0329-c790caeafe8f	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55cc-45eb-8957-b51d85aa1f4c	ProgramRazno-read	ProgramRazno - branje	f
00030000-55cc-45eb-eb6d-15175ad972e2	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55cc-45eb-8790-5ca7424201a9	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55cc-45eb-b20f-d16e721fa4ec	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55cc-45eb-c5b8-ee6bf7e4af51	Prostor-read	Prostor - branje	f
00030000-55cc-45eb-a844-02abd1f65535	Prostor-write	Prostor - spreminjanje	f
00030000-55cc-45eb-6eac-9d5173822880	Racun-read	Racun - branje	f
00030000-55cc-45eb-dd34-1ad05b0f87ba	Racun-write	Racun - spreminjanje	f
00030000-55cc-45eb-db11-f0508f10ace4	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55cc-45eb-2b9f-ef2e1b5e3067	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55cc-45eb-36d3-fe9cecca9214	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55cc-45eb-65fb-0d7d9f45bde0	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55cc-45eb-1ade-ab6124504f9b	Rekvizit-read	Rekvizit - branje	f
00030000-55cc-45eb-c052-a4702fcb9a73	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55cc-45eb-ef1a-721db0a85ee6	Revizija-read	Revizija - branje	f
00030000-55cc-45eb-ca92-b549b008c7df	Revizija-write	Revizija - spreminjanje	f
00030000-55cc-45eb-4f0a-22104457f100	Rezervacija-read	Rezervacija - branje	f
00030000-55cc-45eb-6a0c-81f2353ab931	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55cc-45eb-24fc-979032d9dcfd	SedezniRed-read	SedezniRed - branje	f
00030000-55cc-45eb-52e8-11f5082e7529	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55cc-45eb-77d1-8d90d8da5907	Sedez-read	Sedez - branje	f
00030000-55cc-45eb-b759-ebe51b5922c0	Sedez-write	Sedez - spreminjanje	f
00030000-55cc-45eb-3b3a-c1d88fd0d393	Sezona-read	Sezona - branje	f
00030000-55cc-45eb-508d-e4fa08516c8e	Sezona-write	Sezona - spreminjanje	f
00030000-55cc-45eb-a36b-9a718778c6aa	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55cc-45eb-8315-7459231afd32	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55cc-45eb-cd0a-e70ed49f21d8	Stevilcenje-read	Stevilcenje - branje	f
00030000-55cc-45eb-17e9-857ca1307254	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55cc-45eb-f362-aae8c4796d30	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55cc-45eb-6e05-30a77a3106bd	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55cc-45eb-8a5d-56d181d39326	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55cc-45eb-feed-cc18b83a0d37	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55cc-45eb-92d0-08628ea038a8	Telefonska-read	Telefonska - branje	f
00030000-55cc-45eb-caf5-e5d1f5871bd2	Telefonska-write	Telefonska - spreminjanje	f
00030000-55cc-45eb-69c5-7f79524feaa3	TerminStoritve-read	TerminStoritve - branje	f
00030000-55cc-45eb-f8a9-4f8895572f23	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55cc-45eb-403b-5375a3e6dd6f	TipFunkcije-read	TipFunkcije - branje	f
00030000-55cc-45eb-5fdf-c685f0a09011	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55cc-45eb-ce82-fd15eac922d4	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55cc-45eb-80c0-1fd6be136056	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55cc-45eb-fe83-ba6db794f54e	Trr-read	Trr - branje	f
00030000-55cc-45eb-a1f8-0172ed15954c	Trr-write	Trr - spreminjanje	f
00030000-55cc-45eb-c099-895da682a5ef	Uprizoritev-read	Uprizoritev - branje	f
00030000-55cc-45eb-35d4-78847334c341	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55cc-45eb-459e-c64318aa51f1	Vaja-read	Vaja - branje	f
00030000-55cc-45eb-6961-4ff56fbb5123	Vaja-write	Vaja - spreminjanje	f
00030000-55cc-45eb-f011-144c285695dd	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55cc-45eb-2700-e5cb36c4eb12	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55cc-45eb-e56e-6771d1230aee	Zaposlitev-read	Zaposlitev - branje	f
00030000-55cc-45eb-3196-8b53c2001d2e	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55cc-45eb-03ec-53aa4b01b437	Zasedenost-read	Zasedenost - branje	f
00030000-55cc-45eb-591e-7a19c6561898	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55cc-45eb-1da1-8921c5186cbe	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55cc-45eb-7d98-cb5a3da2ced8	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55cc-45eb-6638-2c9eb08e5b6c	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55cc-45eb-3ae4-551642bbca9e	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55cc-45eb-9fef-08899775e47a	ClSkupina-write	Checkliste - urejanje skupin	f
00030000-55cc-45eb-0a96-6fa5f3e1c995	ClSkupina-read	Checkliste - branje skupin	f
00030000-55cc-45eb-1838-7294ed89d1b6	ClSekcija-write	Checkliste - urejanje sekcij	f
00030000-55cc-45eb-8d87-76113801c32e	ClSekcija-read	Checkliste - branje sekcij	f
00030000-55cc-45eb-79d2-7ab32279e633	ClVzorec-write	Checkliste - urejanje glave chekcliste	f
00030000-55cc-45eb-cdf4-87073feeb35d	ClVzorec-read	Checkliste - branje checkliste	f
00030000-55cc-45eb-51e6-a0e93ccf8d00	ClVzorecPostavka-write	Checkliste - urejanje postavke chekcliste	f
00030000-55cc-45eb-675c-558b69acd3d2	ClVzorecPostavka-read	Checkliste - branje postavke checkliste	f
00030000-55cc-45eb-2a36-ab971a1baca4	ClPregled-write	Checkliste - Razpis checklist  - generično dovoljenje	f
00030000-55cc-45eb-8561-02699fde4cab	ClPregled-read	Checkliste - branje izpolnjenih checklist - generično dovoljenje	f
00030000-55cc-45eb-4547-c9330bd0fb7e	ClVrednost-write	Checkliste - izpolnjevanje checklist - generični permission	f
00030000-55cc-45eb-287e-158f43aeb388	ClVrednost-read	Checkliste - branje vrednosti checkliste - generični permission	f
\.


--
-- TOC entry 2890 (class 0 OID 13296580)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55cc-45eb-25fb-b7f58cdc504e	00030000-55cc-45eb-e233-8a9fa9adaf1f
00020000-55cc-45eb-b27c-f92590bcebd5	00030000-55cc-45eb-96db-f5b20326e9c0
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-9afd-900244739463
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-68a8-8acdabe75dde
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-88e0-6fca2649bfcb
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-ecac-c00767c24ea2
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-888e-739e37fe8710
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-238b-2a77392a1d23
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-0030-f80c0bf5bd15
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-4622-29ae278e4ecd
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-96db-f5b20326e9c0
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-a2ce-88ca3cd2dc2c
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-c005-bf18451911e1
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-55a1-762916b0da76
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-d1fa-b33e1c0ffe10
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-5882-fedb09f8ad01
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-acf1-b216de8ee30e
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-4fb3-b7a8bb5167d8
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-11ff-f7068ccf3d2f
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-a9a9-43afaffe6178
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-e18d-79735a1cdad6
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-4895-8e97a8806583
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-153a-e02cc7092ebf
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-dcb2-fbf428a9b698
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-f89f-1efe6046f0a2
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-54d1-35b93caf5549
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-9190-20277d878012
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-46c9-226f0f174bcc
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-cd6d-beded22850e2
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-5e7d-6df983f2372d
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-fa52-ec837ea4682a
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-63d0-8cffc57f82be
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-d087-a20156887818
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-5cc6-351359d3c0af
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-c5b8-ee6bf7e4af51
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-a844-02abd1f65535
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-36d3-fe9cecca9214
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-65fb-0d7d9f45bde0
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-1ade-ab6124504f9b
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-c052-a4702fcb9a73
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-3b3a-c1d88fd0d393
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-508d-e4fa08516c8e
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-403b-5375a3e6dd6f
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-c099-895da682a5ef
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-35d4-78847334c341
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-459e-c64318aa51f1
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-6961-4ff56fbb5123
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-03ec-53aa4b01b437
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-591e-7a19c6561898
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-1da1-8921c5186cbe
00020000-55cc-45eb-0890-a566de471abd	00030000-55cc-45eb-6638-2c9eb08e5b6c
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-9afd-900244739463
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-888e-739e37fe8710
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-238b-2a77392a1d23
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-96db-f5b20326e9c0
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-d1fa-b33e1c0ffe10
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-acf1-b216de8ee30e
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-11ff-f7068ccf3d2f
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-a9a9-43afaffe6178
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-e18d-79735a1cdad6
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-4895-8e97a8806583
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-153a-e02cc7092ebf
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-dcb2-fbf428a9b698
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-f89f-1efe6046f0a2
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-9190-20277d878012
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-cd6d-beded22850e2
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-5e7d-6df983f2372d
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-fa52-ec837ea4682a
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-c5b8-ee6bf7e4af51
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-36d3-fe9cecca9214
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-1ade-ab6124504f9b
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-3b3a-c1d88fd0d393
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-92d0-08628ea038a8
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-caf5-e5d1f5871bd2
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-fe83-ba6db794f54e
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-a1f8-0172ed15954c
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-e56e-6771d1230aee
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-3196-8b53c2001d2e
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-1da1-8921c5186cbe
00020000-55cc-45eb-569f-fc996c2d40a7	00030000-55cc-45eb-6638-2c9eb08e5b6c
00020000-55cc-45eb-5e8e-015bef049fd5	00030000-55cc-45eb-9afd-900244739463
00020000-55cc-45eb-5e8e-015bef049fd5	00030000-55cc-45eb-88e0-6fca2649bfcb
00020000-55cc-45eb-5e8e-015bef049fd5	00030000-55cc-45eb-888e-739e37fe8710
00020000-55cc-45eb-5e8e-015bef049fd5	00030000-55cc-45eb-61ee-a96d9cef2343
00020000-55cc-45eb-5e8e-015bef049fd5	00030000-55cc-45eb-7f6c-034c7cf04a3d
00020000-55cc-45eb-5e8e-015bef049fd5	00030000-55cc-45eb-3939-edee1d7ef696
00020000-55cc-45eb-5e8e-015bef049fd5	00030000-55cc-45eb-238b-2a77392a1d23
00020000-55cc-45eb-5e8e-015bef049fd5	00030000-55cc-45eb-96db-f5b20326e9c0
00020000-55cc-45eb-5e8e-015bef049fd5	00030000-55cc-45eb-c005-bf18451911e1
00020000-55cc-45eb-5e8e-015bef049fd5	00030000-55cc-45eb-d1fa-b33e1c0ffe10
00020000-55cc-45eb-5e8e-015bef049fd5	00030000-55cc-45eb-acf1-b216de8ee30e
00020000-55cc-45eb-5e8e-015bef049fd5	00030000-55cc-45eb-11ff-f7068ccf3d2f
00020000-55cc-45eb-5e8e-015bef049fd5	00030000-55cc-45eb-e18d-79735a1cdad6
00020000-55cc-45eb-5e8e-015bef049fd5	00030000-55cc-45eb-4895-8e97a8806583
00020000-55cc-45eb-5e8e-015bef049fd5	00030000-55cc-45eb-153a-e02cc7092ebf
00020000-55cc-45eb-5e8e-015bef049fd5	00030000-55cc-45eb-f89f-1efe6046f0a2
00020000-55cc-45eb-5e8e-015bef049fd5	00030000-55cc-45eb-9190-20277d878012
00020000-55cc-45eb-5e8e-015bef049fd5	00030000-55cc-45eb-fa52-ec837ea4682a
00020000-55cc-45eb-5e8e-015bef049fd5	00030000-55cc-45eb-d087-a20156887818
00020000-55cc-45eb-5e8e-015bef049fd5	00030000-55cc-45eb-c5b8-ee6bf7e4af51
00020000-55cc-45eb-5e8e-015bef049fd5	00030000-55cc-45eb-36d3-fe9cecca9214
00020000-55cc-45eb-5e8e-015bef049fd5	00030000-55cc-45eb-1ade-ab6124504f9b
00020000-55cc-45eb-5e8e-015bef049fd5	00030000-55cc-45eb-3b3a-c1d88fd0d393
00020000-55cc-45eb-5e8e-015bef049fd5	00030000-55cc-45eb-403b-5375a3e6dd6f
00020000-55cc-45eb-5e8e-015bef049fd5	00030000-55cc-45eb-459e-c64318aa51f1
00020000-55cc-45eb-5e8e-015bef049fd5	00030000-55cc-45eb-03ec-53aa4b01b437
00020000-55cc-45eb-5e8e-015bef049fd5	00030000-55cc-45eb-1da1-8921c5186cbe
00020000-55cc-45eb-5e8e-015bef049fd5	00030000-55cc-45eb-6638-2c9eb08e5b6c
00020000-55cc-45eb-71ca-749777af4004	00030000-55cc-45eb-9afd-900244739463
00020000-55cc-45eb-71ca-749777af4004	00030000-55cc-45eb-68a8-8acdabe75dde
00020000-55cc-45eb-71ca-749777af4004	00030000-55cc-45eb-ecac-c00767c24ea2
00020000-55cc-45eb-71ca-749777af4004	00030000-55cc-45eb-888e-739e37fe8710
00020000-55cc-45eb-71ca-749777af4004	00030000-55cc-45eb-238b-2a77392a1d23
00020000-55cc-45eb-71ca-749777af4004	00030000-55cc-45eb-96db-f5b20326e9c0
00020000-55cc-45eb-71ca-749777af4004	00030000-55cc-45eb-d1fa-b33e1c0ffe10
00020000-55cc-45eb-71ca-749777af4004	00030000-55cc-45eb-acf1-b216de8ee30e
00020000-55cc-45eb-71ca-749777af4004	00030000-55cc-45eb-e18d-79735a1cdad6
00020000-55cc-45eb-71ca-749777af4004	00030000-55cc-45eb-4895-8e97a8806583
00020000-55cc-45eb-71ca-749777af4004	00030000-55cc-45eb-f89f-1efe6046f0a2
00020000-55cc-45eb-71ca-749777af4004	00030000-55cc-45eb-9190-20277d878012
00020000-55cc-45eb-71ca-749777af4004	00030000-55cc-45eb-fa52-ec837ea4682a
00020000-55cc-45eb-71ca-749777af4004	00030000-55cc-45eb-c5b8-ee6bf7e4af51
00020000-55cc-45eb-71ca-749777af4004	00030000-55cc-45eb-36d3-fe9cecca9214
00020000-55cc-45eb-71ca-749777af4004	00030000-55cc-45eb-1ade-ab6124504f9b
00020000-55cc-45eb-71ca-749777af4004	00030000-55cc-45eb-3b3a-c1d88fd0d393
00020000-55cc-45eb-71ca-749777af4004	00030000-55cc-45eb-403b-5375a3e6dd6f
00020000-55cc-45eb-71ca-749777af4004	00030000-55cc-45eb-1da1-8921c5186cbe
00020000-55cc-45eb-71ca-749777af4004	00030000-55cc-45eb-6638-2c9eb08e5b6c
00020000-55cc-45eb-45a7-0467293881f5	00030000-55cc-45eb-9afd-900244739463
00020000-55cc-45eb-45a7-0467293881f5	00030000-55cc-45eb-888e-739e37fe8710
00020000-55cc-45eb-45a7-0467293881f5	00030000-55cc-45eb-238b-2a77392a1d23
00020000-55cc-45eb-45a7-0467293881f5	00030000-55cc-45eb-96db-f5b20326e9c0
00020000-55cc-45eb-45a7-0467293881f5	00030000-55cc-45eb-d1fa-b33e1c0ffe10
00020000-55cc-45eb-45a7-0467293881f5	00030000-55cc-45eb-acf1-b216de8ee30e
00020000-55cc-45eb-45a7-0467293881f5	00030000-55cc-45eb-e18d-79735a1cdad6
00020000-55cc-45eb-45a7-0467293881f5	00030000-55cc-45eb-4895-8e97a8806583
00020000-55cc-45eb-45a7-0467293881f5	00030000-55cc-45eb-f89f-1efe6046f0a2
00020000-55cc-45eb-45a7-0467293881f5	00030000-55cc-45eb-9190-20277d878012
00020000-55cc-45eb-45a7-0467293881f5	00030000-55cc-45eb-fa52-ec837ea4682a
00020000-55cc-45eb-45a7-0467293881f5	00030000-55cc-45eb-c5b8-ee6bf7e4af51
00020000-55cc-45eb-45a7-0467293881f5	00030000-55cc-45eb-36d3-fe9cecca9214
00020000-55cc-45eb-45a7-0467293881f5	00030000-55cc-45eb-1ade-ab6124504f9b
00020000-55cc-45eb-45a7-0467293881f5	00030000-55cc-45eb-3b3a-c1d88fd0d393
00020000-55cc-45eb-45a7-0467293881f5	00030000-55cc-45eb-69c5-7f79524feaa3
00020000-55cc-45eb-45a7-0467293881f5	00030000-55cc-45eb-697d-2bca707a4c54
00020000-55cc-45eb-45a7-0467293881f5	00030000-55cc-45eb-403b-5375a3e6dd6f
00020000-55cc-45eb-45a7-0467293881f5	00030000-55cc-45eb-1da1-8921c5186cbe
00020000-55cc-45eb-45a7-0467293881f5	00030000-55cc-45eb-6638-2c9eb08e5b6c
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-2d43-7eaf3e36c249
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-e233-8a9fa9adaf1f
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-697d-2bca707a4c54
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-0030-f80c0bf5bd15
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-ba89-47a79ad07318
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-73d6-a61be7f29793
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-9afd-900244739463
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-68a8-8acdabe75dde
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-88e0-6fca2649bfcb
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-ecac-c00767c24ea2
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-888e-739e37fe8710
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-61ee-a96d9cef2343
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-7f6c-034c7cf04a3d
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-4451-79ead4409486
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-3939-edee1d7ef696
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-11b0-162ec7a3f4ad
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-238b-2a77392a1d23
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-4622-29ae278e4ecd
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-96db-f5b20326e9c0
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-a2ce-88ca3cd2dc2c
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-8c86-efbcb8bb8002
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-5ffa-3e7608f6c851
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-fa1b-9bcab2ec2bdd
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-4a41-4660cfc0544c
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-c005-bf18451911e1
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-55a1-762916b0da76
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-d1fa-b33e1c0ffe10
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-5882-fedb09f8ad01
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-acf1-b216de8ee30e
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-4fb3-b7a8bb5167d8
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-11ff-f7068ccf3d2f
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-a9a9-43afaffe6178
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-4564-9e63e697bd1d
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-77e1-31ecb5b505a4
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-c7b5-55bc2a8ed750
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-cdc6-fcd4481b5293
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-e18d-79735a1cdad6
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-ee7b-f4243b4be02a
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-4895-8e97a8806583
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-f234-ccfeb999fbc4
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-153a-e02cc7092ebf
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-dcb2-fbf428a9b698
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-ecc6-020efac9c99e
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-af0c-d55eccb147a3
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-7197-91ae88fd4b65
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-efb5-90959eca2626
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-9711-40e8d738fd9b
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-c8f0-898994a9101e
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-f89f-1efe6046f0a2
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-54d1-35b93caf5549
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-9190-20277d878012
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-46c9-226f0f174bcc
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-3d95-66d9db265824
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-8a3e-9bce6f38ddbd
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-cd6d-beded22850e2
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-5e7d-6df983f2372d
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-fa52-ec837ea4682a
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-63d0-8cffc57f82be
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-8d0b-0b0c2ee51e8c
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-b410-6cb81e0b897b
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-66a9-6b57e062e654
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-1a1d-8de59a6277ba
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-d087-a20156887818
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-5cc6-351359d3c0af
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-974d-2085caed1511
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-06e9-074560ed0d26
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-b8d4-1d98ba75f045
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-82b1-d330055259e6
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-8233-77321eae0013
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-e801-76d6bc4cbfb6
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-8fe2-eb4010468496
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-f24c-83f8bb586c6f
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-ee85-e640ee02ab3c
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-7cb6-204672b5ed05
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-8759-fa4860258b38
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-25bf-af6acd5399ed
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-28e1-87c1439804c4
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-cacd-673bbd228aee
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-b510-5148fcf0bff8
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-0329-c790caeafe8f
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-8957-b51d85aa1f4c
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-eb6d-15175ad972e2
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-8790-5ca7424201a9
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-b20f-d16e721fa4ec
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-c5b8-ee6bf7e4af51
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-a844-02abd1f65535
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-6eac-9d5173822880
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-dd34-1ad05b0f87ba
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-db11-f0508f10ace4
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-2b9f-ef2e1b5e3067
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-36d3-fe9cecca9214
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-65fb-0d7d9f45bde0
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-1ade-ab6124504f9b
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-c052-a4702fcb9a73
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-ef1a-721db0a85ee6
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-ca92-b549b008c7df
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-4f0a-22104457f100
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-6a0c-81f2353ab931
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-24fc-979032d9dcfd
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-52e8-11f5082e7529
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-77d1-8d90d8da5907
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-b759-ebe51b5922c0
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-3b3a-c1d88fd0d393
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-508d-e4fa08516c8e
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-a36b-9a718778c6aa
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-8315-7459231afd32
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-cd0a-e70ed49f21d8
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-17e9-857ca1307254
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-f362-aae8c4796d30
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-6e05-30a77a3106bd
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-8a5d-56d181d39326
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-feed-cc18b83a0d37
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-92d0-08628ea038a8
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-caf5-e5d1f5871bd2
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-69c5-7f79524feaa3
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-f8a9-4f8895572f23
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-403b-5375a3e6dd6f
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-5fdf-c685f0a09011
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-ce82-fd15eac922d4
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-80c0-1fd6be136056
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-fe83-ba6db794f54e
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-a1f8-0172ed15954c
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-c099-895da682a5ef
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-35d4-78847334c341
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-459e-c64318aa51f1
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-6961-4ff56fbb5123
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-f011-144c285695dd
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-2700-e5cb36c4eb12
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-e56e-6771d1230aee
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-3196-8b53c2001d2e
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-03ec-53aa4b01b437
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-591e-7a19c6561898
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-1da1-8921c5186cbe
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-7d98-cb5a3da2ced8
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-6638-2c9eb08e5b6c
00020000-55cc-45ec-71b0-489b7d69c98c	00030000-55cc-45eb-3ae4-551642bbca9e
\.


--
-- TOC entry 2918 (class 0 OID 13296879)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2922 (class 0 OID 13296910)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 13297024)
-- Dependencies: 218
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55cc-45ec-d196-c85d5aaf2e3f	00090000-55cc-45ec-380e-b47bcc4c8bac	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55cc-45ec-d5f9-b1c0eec2bbeb	00090000-55cc-45ec-2864-b21e2a30c60a	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55cc-45ec-96eb-44d2c4e2f34a	00090000-55cc-45ec-bb97-119cb3b46870	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2895 (class 0 OID 13296640)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55cc-45ec-9b22-14864b8c40d7	00040000-55cc-45ea-82d6-696b67e043b1	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55cc-45ec-e634-c9ae4bc3e164	00040000-55cc-45ea-82d6-696b67e043b1	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55cc-45ec-e186-909635db1c85	00040000-55cc-45ea-82d6-696b67e043b1	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55cc-45ec-d4db-240e194373af	00040000-55cc-45ea-82d6-696b67e043b1	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55cc-45ec-c6ec-b4fa99cdcbdb	00040000-55cc-45ea-82d6-696b67e043b1	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55cc-45ec-6266-624265babdea	00040000-55cc-45ea-026c-b9f4f46a4dfe	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55cc-45ec-60f3-688c07873dff	00040000-55cc-45ea-234a-34f1b40caf77	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55cc-45ec-8a60-c817a420667b	00040000-55cc-45ea-0348-b7665cb28e15	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55cc-45ec-e612-dbe17e2cc775	00040000-55cc-45ea-82d6-696b67e043b1	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2897 (class 0 OID 13296675)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55cc-45eb-eeb7-81668c4d5247	8341	Adlešiči
00050000-55cc-45eb-55f5-3264034dd68d	5270	Ajdovščina
00050000-55cc-45eb-50b6-840bd7013e48	6280	Ankaran/Ancarano
00050000-55cc-45eb-63f7-f84f43258a4b	9253	Apače
00050000-55cc-45eb-3d36-d2471be341aa	8253	Artiče
00050000-55cc-45eb-ed49-378afc7195dd	4275	Begunje na Gorenjskem
00050000-55cc-45eb-6817-8bc7902e7bb5	1382	Begunje pri Cerknici
00050000-55cc-45eb-b7c6-94cf82558549	9231	Beltinci
00050000-55cc-45eb-beec-191e32c1e4a0	2234	Benedikt
00050000-55cc-45eb-e013-a195a41acb37	2345	Bistrica ob Dravi
00050000-55cc-45eb-8d6f-bed7c16d3d26	3256	Bistrica ob Sotli
00050000-55cc-45eb-bd83-109cc2a63eae	8259	Bizeljsko
00050000-55cc-45eb-0874-4fb9e8e1dc08	1223	Blagovica
00050000-55cc-45eb-3f6a-919ff535d062	8283	Blanca
00050000-55cc-45eb-2a92-2ccf9b2defc6	4260	Bled
00050000-55cc-45eb-c334-29eaf6f7936c	4273	Blejska Dobrava
00050000-55cc-45eb-157d-c3966e5cba97	9265	Bodonci
00050000-55cc-45eb-a9d8-fb74738e3678	9222	Bogojina
00050000-55cc-45eb-0e67-10ab00459b66	4263	Bohinjska Bela
00050000-55cc-45eb-7b3a-73c4f5ca98f0	4264	Bohinjska Bistrica
00050000-55cc-45eb-bc59-56926d48d1a2	4265	Bohinjsko jezero
00050000-55cc-45eb-4ff4-8f0be06b91e6	1353	Borovnica
00050000-55cc-45eb-0e19-5410ccf5c1cc	8294	Boštanj
00050000-55cc-45eb-891e-a18693fbe028	5230	Bovec
00050000-55cc-45eb-8be0-3435e2e91142	5295	Branik
00050000-55cc-45eb-9150-28abc0011ae8	3314	Braslovče
00050000-55cc-45eb-a3d4-7f7ce46868eb	5223	Breginj
00050000-55cc-45eb-f2d4-1acb4863ab58	8280	Brestanica
00050000-55cc-45eb-823f-b8593d533fc9	2354	Bresternica
00050000-55cc-45eb-25ec-41eb0336b5e6	4243	Brezje
00050000-55cc-45eb-cc71-5db5d84eb05d	1351	Brezovica pri Ljubljani
00050000-55cc-45eb-d0ae-e1adde5695d8	8250	Brežice
00050000-55cc-45eb-4909-5eceea9c3c33	4210	Brnik - Aerodrom
00050000-55cc-45eb-2d40-5f4dfcf5a5b1	8321	Brusnice
00050000-55cc-45eb-aafe-c85a437202c5	3255	Buče
00050000-55cc-45eb-b310-9458083b83e1	8276	Bučka 
00050000-55cc-45eb-7edd-8a8be1d695d6	9261	Cankova
00050000-55cc-45eb-d79b-d8ebb7673a87	3000	Celje 
00050000-55cc-45eb-7828-fba389accda3	3001	Celje - poštni predali
00050000-55cc-45eb-8a0f-e48e5b076730	4207	Cerklje na Gorenjskem
00050000-55cc-45eb-84d4-9c6df9971e75	8263	Cerklje ob Krki
00050000-55cc-45eb-ec2e-bda19b26b83f	1380	Cerknica
00050000-55cc-45eb-f604-b0b1e0847416	5282	Cerkno
00050000-55cc-45eb-7b52-fd2efc818443	2236	Cerkvenjak
00050000-55cc-45eb-167e-aba10405cd58	2215	Ceršak
00050000-55cc-45eb-d803-d7133152baf8	2326	Cirkovce
00050000-55cc-45eb-af0a-28611f79d80f	2282	Cirkulane
00050000-55cc-45eb-78d9-205d07ce5eb6	5273	Col
00050000-55cc-45eb-9cef-8df8f47175d7	8251	Čatež ob Savi
00050000-55cc-45eb-243a-c4ddd8728439	1413	Čemšenik
00050000-55cc-45eb-f9c7-fb7c6c4610f9	5253	Čepovan
00050000-55cc-45eb-864f-3df9fd3f5068	9232	Črenšovci
00050000-55cc-45eb-d46c-3719e3a473c9	2393	Črna na Koroškem
00050000-55cc-45eb-4b79-97184c37ee53	6275	Črni Kal
00050000-55cc-45eb-9b2f-ca6211180568	5274	Črni Vrh nad Idrijo
00050000-55cc-45eb-d23e-020998c345bd	5262	Črniče
00050000-55cc-45eb-c06a-f5e4df81117e	8340	Črnomelj
00050000-55cc-45eb-898a-35235d416c24	6271	Dekani
00050000-55cc-45eb-f24f-e1d81a3ee38a	5210	Deskle
00050000-55cc-45eb-eb12-83cb18039837	2253	Destrnik
00050000-55cc-45eb-bb7d-5ef864a8ea32	6215	Divača
00050000-55cc-45eb-bc92-2e771daaada8	1233	Dob
00050000-55cc-45eb-b1ad-1a3c6c6464a9	3224	Dobje pri Planini
00050000-55cc-45eb-c475-8ff09d1ee87a	8257	Dobova
00050000-55cc-45eb-ae8a-09c30b8c01ef	1423	Dobovec
00050000-55cc-45eb-4e4c-5e7cf4ce6370	5263	Dobravlje
00050000-55cc-45eb-bf8c-3cf706280f74	3204	Dobrna
00050000-55cc-45eb-7997-331426cc887c	8211	Dobrnič
00050000-55cc-45eb-816c-0f1d0f70fe27	1356	Dobrova
00050000-55cc-45eb-037c-bd855a1d3f85	9223	Dobrovnik/Dobronak 
00050000-55cc-45eb-9634-45e7e3e16df5	5212	Dobrovo v Brdih
00050000-55cc-45eb-f41d-adbfe563dcda	1431	Dol pri Hrastniku
00050000-55cc-45eb-4150-ab152982c648	1262	Dol pri Ljubljani
00050000-55cc-45eb-5f61-ffc14cae1607	1273	Dole pri Litiji
00050000-55cc-45eb-8ab2-96733587cfbe	1331	Dolenja vas
00050000-55cc-45eb-3e13-938cabc00e30	8350	Dolenjske Toplice
00050000-55cc-45eb-46fb-74834d2eaa22	1230	Domžale
00050000-55cc-45eb-5c6b-82e9debca8c5	2252	Dornava
00050000-55cc-45eb-ca01-0937be5b3d06	5294	Dornberk
00050000-55cc-45eb-89d3-9e88359562e0	1319	Draga
00050000-55cc-45eb-df5c-af145afac0de	8343	Dragatuš
00050000-55cc-45eb-6a48-7d5732537a88	3222	Dramlje
00050000-55cc-45eb-4f13-cf3d42e385f4	2370	Dravograd
00050000-55cc-45eb-0149-df8b9990c28a	4203	Duplje
00050000-55cc-45eb-d5c2-364d5f95b49f	6221	Dutovlje
00050000-55cc-45eb-52b4-bded045952a4	8361	Dvor
00050000-55cc-45eb-98e1-40b946c067ab	2343	Fala
00050000-55cc-45eb-9d1f-56e648e1cb8d	9208	Fokovci
00050000-55cc-45eb-63fe-c34f86eb5aa0	2313	Fram
00050000-55cc-45eb-aecf-45163084973c	3213	Frankolovo
00050000-55cc-45eb-b0fc-bf76edb86e60	1274	Gabrovka
00050000-55cc-45eb-4626-46ded47ddd64	8254	Globoko
00050000-55cc-45eb-e5f1-ca6e8929d43d	5275	Godovič
00050000-55cc-45eb-f292-05d8e1164e1f	4204	Golnik
00050000-55cc-45eb-8275-3cd2bcdc1a5c	3303	Gomilsko
00050000-55cc-45eb-63a3-518a5e4f01ed	4224	Gorenja vas
00050000-55cc-45eb-4583-d16424a1d19d	3263	Gorica pri Slivnici
00050000-55cc-45eb-86cf-844bece020e6	2272	Gorišnica
00050000-55cc-45eb-ddd8-b0760bfd3872	9250	Gornja Radgona
00050000-55cc-45eb-a4a2-8c9fd2826d02	3342	Gornji Grad
00050000-55cc-45eb-61d9-3ab2348bf3af	4282	Gozd Martuljek
00050000-55cc-45eb-777e-722674ca1c7f	6272	Gračišče
00050000-55cc-45eb-d3e2-b5a2c39876b7	9264	Grad
00050000-55cc-45eb-dc1f-6e00e62ad6a2	8332	Gradac
00050000-55cc-45eb-393a-86beaa25ea71	1384	Grahovo
00050000-55cc-45eb-4ac3-607b010ccc26	5242	Grahovo ob Bači
00050000-55cc-45eb-375e-640db496a8a8	5251	Grgar
00050000-55cc-45eb-7eff-e295de2d3a52	3302	Griže
00050000-55cc-45eb-ed30-eb086eb5d739	3231	Grobelno
00050000-55cc-45eb-b082-414142ae41f0	1290	Grosuplje
00050000-55cc-45eb-ae06-1a41686be0ea	2288	Hajdina
00050000-55cc-45eb-1563-488bc6eff5ee	8362	Hinje
00050000-55cc-45eb-cbb3-38890294eae7	2311	Hoče
00050000-55cc-45eb-b156-1ef9d7528049	9205	Hodoš/Hodos
00050000-55cc-45eb-91ee-8b9416f62892	1354	Horjul
00050000-55cc-45eb-3b14-10d208b0fa23	1372	Hotedršica
00050000-55cc-45eb-cbe6-6b5786680a5f	1430	Hrastnik
00050000-55cc-45eb-c19e-2bb56d13e5ee	6225	Hruševje
00050000-55cc-45eb-2668-7a148fb98424	4276	Hrušica
00050000-55cc-45eb-11fe-36d839f4c892	5280	Idrija
00050000-55cc-45eb-e040-b968d29726e6	1292	Ig
00050000-55cc-45eb-69a1-0793a84a3615	6250	Ilirska Bistrica
00050000-55cc-45eb-3b12-4ab3d8cfb460	6251	Ilirska Bistrica-Trnovo
00050000-55cc-45eb-6911-083ee7c090c2	1295	Ivančna Gorica
00050000-55cc-45eb-013e-ad90d2696525	2259	Ivanjkovci
00050000-55cc-45eb-6575-6fe66c28f7e5	1411	Izlake
00050000-55cc-45eb-cdbe-ea86948c89d6	6310	Izola/Isola
00050000-55cc-45eb-10c3-462e3dcf9e6d	2222	Jakobski Dol
00050000-55cc-45eb-4473-4d08938bcf3d	2221	Jarenina
00050000-55cc-45eb-2fcb-254714459b61	6254	Jelšane
00050000-55cc-45eb-5227-eb0ece1f2bac	4270	Jesenice
00050000-55cc-45eb-7241-c25d5be3f677	8261	Jesenice na Dolenjskem
00050000-55cc-45eb-050e-8af40919defc	3273	Jurklošter
00050000-55cc-45eb-2fdf-f9bafc2956a2	2223	Jurovski Dol
00050000-55cc-45eb-162b-4a8de342c5a8	2256	Juršinci
00050000-55cc-45eb-7333-7647ce4b3f68	5214	Kal nad Kanalom
00050000-55cc-45eb-8b2f-0d212cfbc2fc	3233	Kalobje
00050000-55cc-45eb-96aa-74f897b9ec4e	4246	Kamna Gorica
00050000-55cc-45eb-12ce-745519be420d	2351	Kamnica
00050000-55cc-45eb-23d0-1ba1c269bf52	1241	Kamnik
00050000-55cc-45eb-c6b5-0b71f2ab8956	5213	Kanal
00050000-55cc-45eb-7c39-e208d88ce23e	8258	Kapele
00050000-55cc-45eb-1223-542d39620d38	2362	Kapla
00050000-55cc-45eb-a1d6-fe41339f1272	2325	Kidričevo
00050000-55cc-45eb-1a9d-8baefd5bca7e	1412	Kisovec
00050000-55cc-45eb-4405-275f52848391	6253	Knežak
00050000-55cc-45eb-5aa1-8043237d214f	5222	Kobarid
00050000-55cc-45eb-1255-752c54102a97	9227	Kobilje
00050000-55cc-45eb-91ef-c93da6d0fe92	1330	Kočevje
00050000-55cc-45eb-6475-bf1bfd4632ec	1338	Kočevska Reka
00050000-55cc-45eb-8ac6-4b370c782c84	2276	Kog
00050000-55cc-45eb-a43b-fcaa62be8564	5211	Kojsko
00050000-55cc-45eb-6b0a-baa5b0ee46f6	6223	Komen
00050000-55cc-45eb-aee2-6d925f84b074	1218	Komenda
00050000-55cc-45eb-e329-3e8005e35bbc	6000	Koper/Capodistria 
00050000-55cc-45eb-d00d-1f3a49580972	6001	Koper/Capodistria - poštni predali
00050000-55cc-45eb-80dc-4caf50e1bb74	8282	Koprivnica
00050000-55cc-45eb-1c93-d342f96a0048	5296	Kostanjevica na Krasu
00050000-55cc-45eb-b89f-562b1a2a4aba	8311	Kostanjevica na Krki
00050000-55cc-45eb-ca8e-965d7e136f03	1336	Kostel
00050000-55cc-45eb-0e26-71d54be64d43	6256	Košana
00050000-55cc-45eb-ada7-ce0f7f63e661	2394	Kotlje
00050000-55cc-45eb-3ec6-2f8e1074ba1f	6240	Kozina
00050000-55cc-45eb-3cd8-7b6613f6a296	3260	Kozje
00050000-55cc-45eb-9ee5-607e5f58c39a	4000	Kranj 
00050000-55cc-45eb-0286-873129dd3362	4001	Kranj - poštni predali
00050000-55cc-45eb-ca96-aa283d664b9b	4280	Kranjska Gora
00050000-55cc-45eb-e488-f419805d6ff7	1281	Kresnice
00050000-55cc-45eb-fdf3-3c4bdac92f02	4294	Križe
00050000-55cc-45eb-2905-79b05e21f838	9206	Križevci
00050000-55cc-45eb-5adc-a4ab065d197b	9242	Križevci pri Ljutomeru
00050000-55cc-45eb-595a-4f32b0f9af32	1301	Krka
00050000-55cc-45eb-64fa-98f157a8fd3b	8296	Krmelj
00050000-55cc-45eb-3ab0-7cf3b2a4e90e	4245	Kropa
00050000-55cc-45eb-8e52-a64ee9cb1f0d	8262	Krška vas
00050000-55cc-45eb-65fe-180b6e6feb2f	8270	Krško
00050000-55cc-45eb-fe5d-95997b4d2405	9263	Kuzma
00050000-55cc-45eb-9110-1c24ab3c7232	2318	Laporje
00050000-55cc-45eb-462d-b17d4cce3a27	3270	Laško
00050000-55cc-45eb-11c8-f8b85c00be4d	1219	Laze v Tuhinju
00050000-55cc-45eb-22b9-5f45af0da551	2230	Lenart v Slovenskih goricah
00050000-55cc-45eb-7aa1-0c9be0be6623	9220	Lendava/Lendva
00050000-55cc-45eb-de1c-5176c04e6711	4248	Lesce
00050000-55cc-45eb-1266-690f0e5b1b5b	3261	Lesično
00050000-55cc-45eb-73ea-f5b30dcf27c6	8273	Leskovec pri Krškem
00050000-55cc-45eb-de57-d17679216c59	2372	Libeliče
00050000-55cc-45eb-4a45-d1eac28809a5	2341	Limbuš
00050000-55cc-45eb-06e6-25b16564eb98	1270	Litija
00050000-55cc-45eb-fd89-27461f33407a	3202	Ljubečna
00050000-55cc-45eb-287c-54aa54552351	1000	Ljubljana 
00050000-55cc-45eb-15f1-7a46d7a00ee2	1001	Ljubljana - poštni predali
00050000-55cc-45eb-944a-1a84cd491a1c	1231	Ljubljana - Črnuče
00050000-55cc-45eb-adab-f90a7dd0c281	1261	Ljubljana - Dobrunje
00050000-55cc-45eb-ab82-3e532f37bd89	1260	Ljubljana - Polje
00050000-55cc-45eb-cd5e-2e79289350dc	1210	Ljubljana - Šentvid
00050000-55cc-45eb-418b-c36140bc13e3	1211	Ljubljana - Šmartno
00050000-55cc-45eb-efdf-40fb3fd7d47e	3333	Ljubno ob Savinji
00050000-55cc-45eb-fe4c-706358a5ca4a	9240	Ljutomer
00050000-55cc-45eb-158f-d6d1c2e4422d	3215	Loče
00050000-55cc-45eb-8780-4da7101d827e	5231	Log pod Mangartom
00050000-55cc-45eb-6bd3-47ffde9ba98b	1358	Log pri Brezovici
00050000-55cc-45eb-2c86-8938e1fbfbee	1370	Logatec
00050000-55cc-45eb-eff9-29416418fc5d	1371	Logatec
00050000-55cc-45eb-98dc-a98628ac1768	1434	Loka pri Zidanem Mostu
00050000-55cc-45eb-717b-7712e59de318	3223	Loka pri Žusmu
00050000-55cc-45eb-5fd9-40e4055929aa	6219	Lokev
00050000-55cc-45eb-1ba0-94504ba288b9	1318	Loški Potok
00050000-55cc-45eb-16d8-7322a146743e	2324	Lovrenc na Dravskem polju
00050000-55cc-45eb-d2d7-d981c12184b2	2344	Lovrenc na Pohorju
00050000-55cc-45eb-2ccd-8b5a421dd788	3334	Luče
00050000-55cc-45eb-6652-8bd257124866	1225	Lukovica
00050000-55cc-45eb-252f-371187b881c5	9202	Mačkovci
00050000-55cc-45eb-dae7-b7deca363eab	2322	Majšperk
00050000-55cc-45eb-6530-5d49df7b66b6	2321	Makole
00050000-55cc-45eb-9229-b2ace8d54104	9243	Mala Nedelja
00050000-55cc-45eb-5990-fdbb446553f6	2229	Malečnik
00050000-55cc-45eb-5f95-23f7845c3889	6273	Marezige
00050000-55cc-45eb-1c07-82d4d68812bd	2000	Maribor 
00050000-55cc-45eb-a057-123c0da57c95	2001	Maribor - poštni predali
00050000-55cc-45eb-bc70-569ff303748e	2206	Marjeta na Dravskem polju
00050000-55cc-45eb-4a22-cb7c29fe7f26	2281	Markovci
00050000-55cc-45eb-c370-681ce45f723e	9221	Martjanci
00050000-55cc-45eb-08e0-ccd56a1bdd47	6242	Materija
00050000-55cc-45eb-f39a-fa1f37e12552	4211	Mavčiče
00050000-55cc-45eb-44f4-740a05194a2a	1215	Medvode
00050000-55cc-45eb-91b8-501b3b1d48ee	1234	Mengeš
00050000-55cc-45eb-9bef-be65f6dae054	8330	Metlika
00050000-55cc-45eb-22bf-a0b3b33217d5	2392	Mežica
00050000-55cc-45eb-1138-a39341d1778f	2204	Miklavž na Dravskem polju
00050000-55cc-45eb-b77f-c6d308fa8200	2275	Miklavž pri Ormožu
00050000-55cc-45eb-dcfe-7c62ac6ec37d	5291	Miren
00050000-55cc-45eb-0ac7-5ab36064f073	8233	Mirna
00050000-55cc-45eb-8ba8-9918714b618a	8216	Mirna Peč
00050000-55cc-45eb-4aa5-92875cbb9b91	2382	Mislinja
00050000-55cc-45eb-ecb9-bbf4843e1b51	4281	Mojstrana
00050000-55cc-45eb-d490-dc9f1f8afef7	8230	Mokronog
00050000-55cc-45eb-a5ef-f0b6a0bf208d	1251	Moravče
00050000-55cc-45eb-99cb-881310956367	9226	Moravske Toplice
00050000-55cc-45eb-6cf3-7da20a3d77fb	5216	Most na Soči
00050000-55cc-45eb-6157-2dd400ffe025	1221	Motnik
00050000-55cc-45eb-5852-52193332ec14	3330	Mozirje
00050000-55cc-45eb-43bb-34bae77ffb16	9000	Murska Sobota 
00050000-55cc-45eb-a2e1-a015040b9f70	9001	Murska Sobota - poštni predali
00050000-55cc-45eb-e600-2a4ab004bf55	2366	Muta
00050000-55cc-45eb-1d8f-f6856a7298d1	4202	Naklo
00050000-55cc-45eb-0771-00c3e6e576c6	3331	Nazarje
00050000-55cc-45eb-2195-4a0a68a48b8d	1357	Notranje Gorice
00050000-55cc-45eb-9d24-7155fa8d3260	3203	Nova Cerkev
00050000-55cc-45eb-d49a-c7a0e4be138f	5000	Nova Gorica 
00050000-55cc-45eb-0b2c-0310789c861b	5001	Nova Gorica - poštni predali
00050000-55cc-45eb-0c28-0350c32e46f1	1385	Nova vas
00050000-55cc-45eb-711e-caf41c7aa85c	8000	Novo mesto
00050000-55cc-45eb-9412-a6aaefff5b70	8001	Novo mesto - poštni predali
00050000-55cc-45eb-8c5e-480949980d5b	6243	Obrov
00050000-55cc-45eb-2166-a61b22ae689c	9233	Odranci
00050000-55cc-45eb-b28e-07d084c918db	2317	Oplotnica
00050000-55cc-45eb-2db0-0f3d9a282ad7	2312	Orehova vas
00050000-55cc-45eb-7448-eaf01d32da88	2270	Ormož
00050000-55cc-45eb-1c64-ecea2c687345	1316	Ortnek
00050000-55cc-45eb-7b80-681e4bbdf5c5	1337	Osilnica
00050000-55cc-45eb-0abb-4f7638c2f006	8222	Otočec
00050000-55cc-45eb-fb39-50b3153309c4	2361	Ožbalt
00050000-55cc-45eb-7bd3-672f41f55a59	2231	Pernica
00050000-55cc-45eb-12bc-018265efa487	2211	Pesnica pri Mariboru
00050000-55cc-45eb-1b42-49afed7710fa	9203	Petrovci
00050000-55cc-45eb-cbd0-5e527e138ff2	3301	Petrovče
00050000-55cc-45eb-184f-66817b7ad613	6330	Piran/Pirano
00050000-55cc-45eb-8907-e09561fb007e	8255	Pišece
00050000-55cc-45eb-497a-d3a234024871	6257	Pivka
00050000-55cc-45eb-cd12-db474f67e0c3	6232	Planina
00050000-55cc-45eb-6e98-d460cc14d428	3225	Planina pri Sevnici
00050000-55cc-45eb-8c89-6ae78415fa12	6276	Pobegi
00050000-55cc-45eb-b0e3-45e8060771ea	8312	Podbočje
00050000-55cc-45eb-cee9-cca46582af63	5243	Podbrdo
00050000-55cc-45eb-a37f-3c2565938905	3254	Podčetrtek
00050000-55cc-45eb-2d06-c3181f2f0c56	2273	Podgorci
00050000-55cc-45eb-b9b8-0b11ea53c5c3	6216	Podgorje
00050000-55cc-45eb-1ed6-c7b1db48b4cf	2381	Podgorje pri Slovenj Gradcu
00050000-55cc-45eb-ea89-2f81e75cce15	6244	Podgrad
00050000-55cc-45eb-65f1-3d4922280966	1414	Podkum
00050000-55cc-45eb-fc1d-91bd5cbc2fb0	2286	Podlehnik
00050000-55cc-45eb-7568-5ff5817b8a4a	5272	Podnanos
00050000-55cc-45eb-cbf6-d1b473886864	4244	Podnart
00050000-55cc-45eb-4ce2-31152d16d83e	3241	Podplat
00050000-55cc-45eb-ec45-1d10f546806c	3257	Podsreda
00050000-55cc-45eb-4353-671da7607d9f	2363	Podvelka
00050000-55cc-45eb-b64f-6ac075d72d8a	2208	Pohorje
00050000-55cc-45eb-7ab8-45730ec41490	2257	Polenšak
00050000-55cc-45eb-db42-5fbe4726dcce	1355	Polhov Gradec
00050000-55cc-45eb-a24e-e9fee14436ff	4223	Poljane nad Škofjo Loko
00050000-55cc-45eb-15b2-161427751ed3	2319	Poljčane
00050000-55cc-45eb-1d3e-b0538cf8d00b	1272	Polšnik
00050000-55cc-45eb-516e-a6d46b52cefc	3313	Polzela
00050000-55cc-45eb-0bdc-965462675603	3232	Ponikva
00050000-55cc-45eb-96e4-3c424ace9646	6320	Portorož/Portorose
00050000-55cc-45eb-45e6-b323adecd3d2	6230	Postojna
00050000-55cc-45eb-af4a-ada58db7e7ad	2331	Pragersko
00050000-55cc-45eb-cdd1-da113a13dcfb	3312	Prebold
00050000-55cc-45eb-c88c-450f7a9931b7	4205	Preddvor
00050000-55cc-45eb-fa9c-08561d5598fe	6255	Prem
00050000-55cc-45eb-969a-58dcd4380e76	1352	Preserje
00050000-55cc-45eb-ddb9-a1e9cd199e6b	6258	Prestranek
00050000-55cc-45eb-e50d-3316383b18ee	2391	Prevalje
00050000-55cc-45eb-ccb6-1ce47f5dd7fb	3262	Prevorje
00050000-55cc-45eb-86a7-60d761f57135	1276	Primskovo 
00050000-55cc-45eb-c240-e832b969c2f5	3253	Pristava pri Mestinju
00050000-55cc-45eb-744d-803d426bad6a	9207	Prosenjakovci/Partosfalva
00050000-55cc-45eb-3b0e-3dedf1611c9b	5297	Prvačina
00050000-55cc-45eb-7c36-5d0ec5cd46ce	2250	Ptuj
00050000-55cc-45eb-39b3-bcfe95f0263a	2323	Ptujska Gora
00050000-55cc-45eb-3b4a-32aee5c72be6	9201	Puconci
00050000-55cc-45eb-3774-8129bc019259	2327	Rače
00050000-55cc-45eb-5307-fcda9f3b81c8	1433	Radeče
00050000-55cc-45eb-fd8f-819d72666b87	9252	Radenci
00050000-55cc-45eb-bfbe-2449ae7a2f8e	2360	Radlje ob Dravi
00050000-55cc-45eb-f86b-ab48298300f1	1235	Radomlje
00050000-55cc-45eb-0d8c-ea1b847ca50a	4240	Radovljica
00050000-55cc-45eb-6385-cfb9e7443c04	8274	Raka
00050000-55cc-45eb-903f-77e0fe67a9b2	1381	Rakek
00050000-55cc-45eb-e179-d4f653408d20	4283	Rateče - Planica
00050000-55cc-45eb-9f55-4315c6e9bac4	2390	Ravne na Koroškem
00050000-55cc-45eb-3ee5-83d36ea4074e	9246	Razkrižje
00050000-55cc-45eb-c9d9-d0cec8f4c286	3332	Rečica ob Savinji
00050000-55cc-45eb-680a-484b05fead92	5292	Renče
00050000-55cc-45eb-0405-eb2f859671dd	1310	Ribnica
00050000-55cc-45eb-1bdf-36c6c7c62c95	2364	Ribnica na Pohorju
00050000-55cc-45eb-4db4-fa7da21953a6	3272	Rimske Toplice
00050000-55cc-45eb-5b4a-1b2a2f59e0c1	1314	Rob
00050000-55cc-45eb-00b6-cfe34b051883	5215	Ročinj
00050000-55cc-45eb-5f44-2f93d605739e	3250	Rogaška Slatina
00050000-55cc-45eb-273c-2907b20c0e92	9262	Rogašovci
00050000-55cc-45eb-145f-cce82e913c67	3252	Rogatec
00050000-55cc-45eb-8c31-9324c6e508c0	1373	Rovte
00050000-55cc-45eb-f05e-e8f63ccc3542	2342	Ruše
00050000-55cc-45eb-f70e-f80393f1e2bc	1282	Sava
00050000-55cc-45eb-96f6-19b5f19c3c87	6333	Sečovlje/Sicciole
00050000-55cc-45eb-f25b-3eeee037bb4e	4227	Selca
00050000-55cc-45eb-b5ed-dca42b9f7acf	2352	Selnica ob Dravi
00050000-55cc-45eb-1c16-cbf2bcd92336	8333	Semič
00050000-55cc-45eb-4974-a46c3c45e876	8281	Senovo
00050000-55cc-45eb-ec33-b087c3265098	6224	Senožeče
00050000-55cc-45eb-f038-3916a4302840	8290	Sevnica
00050000-55cc-45eb-d7bc-807fbcef670e	6210	Sežana
00050000-55cc-45eb-ea7d-72e761ec43d2	2214	Sladki Vrh
00050000-55cc-45eb-fc1e-756c400dca5d	5283	Slap ob Idrijci
00050000-55cc-45eb-990a-5b7313053e5e	2380	Slovenj Gradec
00050000-55cc-45eb-a46b-4d9e9cb01fd1	2310	Slovenska Bistrica
00050000-55cc-45eb-10aa-810b4f6c2566	3210	Slovenske Konjice
00050000-55cc-45eb-8c1e-102427fb95ce	1216	Smlednik
00050000-55cc-45eb-4875-c88beaa03978	5232	Soča
00050000-55cc-45eb-bde9-c6a66a659bab	1317	Sodražica
00050000-55cc-45eb-0190-4056fdb6463c	3335	Solčava
00050000-55cc-45eb-a2de-e3994fb3677e	5250	Solkan
00050000-55cc-45eb-343a-fd40ef04ebf0	4229	Sorica
00050000-55cc-45eb-6cff-f796f24efb12	4225	Sovodenj
00050000-55cc-45eb-7934-197b7c51f8de	5281	Spodnja Idrija
00050000-55cc-45eb-a109-95c53bb1c9a2	2241	Spodnji Duplek
00050000-55cc-45eb-62b0-5f8e41218530	9245	Spodnji Ivanjci
00050000-55cc-45eb-3971-35a16df5c4b9	2277	Središče ob Dravi
00050000-55cc-45eb-b4ce-ad17a8ccd3bd	4267	Srednja vas v Bohinju
00050000-55cc-45eb-4d16-b0e8285fa0f3	8256	Sromlje 
00050000-55cc-45eb-6d09-0c30dfb628a2	5224	Srpenica
00050000-55cc-45eb-cebc-49baa84b3207	1242	Stahovica
00050000-55cc-45eb-0672-eda4915ea6c7	1332	Stara Cerkev
00050000-55cc-45eb-349a-d2cdce6bb227	8342	Stari trg ob Kolpi
00050000-55cc-45eb-8248-3318c9cd3c14	1386	Stari trg pri Ložu
00050000-55cc-45eb-bbb9-9204cc9e8ae1	2205	Starše
00050000-55cc-45eb-0326-54a786444284	2289	Stoperce
00050000-55cc-45eb-006b-28d43e9bf3ce	8322	Stopiče
00050000-55cc-45eb-9581-de05d5d2b431	3206	Stranice
00050000-55cc-45eb-5a2a-286026d25bff	8351	Straža
00050000-55cc-45eb-ed7a-a372ef1ed2fa	1313	Struge
00050000-55cc-45eb-176d-e61205cb7110	8293	Studenec
00050000-55cc-45eb-0f51-4d6b51560641	8331	Suhor
00050000-55cc-45eb-800a-2b0940e9d0db	2233	Sv. Ana v Slovenskih goricah
00050000-55cc-45eb-71b2-2bf7107dde55	2235	Sv. Trojica v Slovenskih goricah
00050000-55cc-45eb-9093-7b92d0ffec96	2353	Sveti Duh na Ostrem Vrhu
00050000-55cc-45eb-3acc-a3157f96a876	9244	Sveti Jurij ob Ščavnici
00050000-55cc-45eb-a34e-e9657b6ac69d	3264	Sveti Štefan
00050000-55cc-45eb-b2f3-d0c90512c501	2258	Sveti Tomaž
00050000-55cc-45eb-9fd4-18b246b9fd35	9204	Šalovci
00050000-55cc-45eb-16fe-c8737a1909b5	5261	Šempas
00050000-55cc-45eb-2d4e-859547379e13	5290	Šempeter pri Gorici
00050000-55cc-45eb-2919-f0ae2fb50e01	3311	Šempeter v Savinjski dolini
00050000-55cc-45eb-f8e8-a4e86c8b5a3c	4208	Šenčur
00050000-55cc-45eb-28c8-b54bda79d931	2212	Šentilj v Slovenskih goricah
00050000-55cc-45eb-b059-093860096da9	8297	Šentjanž
00050000-55cc-45eb-0dc2-d410c88537c3	2373	Šentjanž pri Dravogradu
00050000-55cc-45eb-d80d-020f4cc48115	8310	Šentjernej
00050000-55cc-45eb-9714-c3ffabf61604	3230	Šentjur
00050000-55cc-45eb-ba68-63b33f13a472	3271	Šentrupert
00050000-55cc-45eb-5043-013e85174919	8232	Šentrupert
00050000-55cc-45eb-6d6a-2f14a545fb1b	1296	Šentvid pri Stični
00050000-55cc-45eb-ed23-8958885261df	8275	Škocjan
00050000-55cc-45eb-bd19-dd73aff6cf75	6281	Škofije
00050000-55cc-45eb-7ba9-78ef48d1f6e5	4220	Škofja Loka
00050000-55cc-45eb-ee7a-b89cdd66cb70	3211	Škofja vas
00050000-55cc-45eb-744e-ac72a823d34e	1291	Škofljica
00050000-55cc-45eb-0dd8-f6302ae0f231	6274	Šmarje
00050000-55cc-45eb-cb7e-8c947962923d	1293	Šmarje - Sap
00050000-55cc-45eb-cb88-41101c071d6a	3240	Šmarje pri Jelšah
00050000-55cc-45eb-ae72-1f21c0e9090f	8220	Šmarješke Toplice
00050000-55cc-45eb-cc2c-08bc18f96d50	2315	Šmartno na Pohorju
00050000-55cc-45eb-28b2-b86ca4e060b2	3341	Šmartno ob Dreti
00050000-55cc-45eb-cac0-2c7af610cb8e	3327	Šmartno ob Paki
00050000-55cc-45eb-fea3-6d772d38558a	1275	Šmartno pri Litiji
00050000-55cc-45eb-4e88-9e1a486cf0dc	2383	Šmartno pri Slovenj Gradcu
00050000-55cc-45eb-3183-0ed39c71dae7	3201	Šmartno v Rožni dolini
00050000-55cc-45eb-44e9-00030e9e1cd2	3325	Šoštanj
00050000-55cc-45eb-8bd4-a6e77e6accf6	6222	Štanjel
00050000-55cc-45eb-23c3-94125618f3ee	3220	Štore
00050000-55cc-45eb-f38a-8a8601250658	3304	Tabor
00050000-55cc-45eb-be05-c956abe5a79f	3221	Teharje
00050000-55cc-45eb-6da2-a0a893755c23	9251	Tišina
00050000-55cc-45eb-c92a-b2d16cbb201a	5220	Tolmin
00050000-55cc-45eb-b4bf-955c46379658	3326	Topolšica
00050000-55cc-45eb-ee2c-9a5a81cce9b2	2371	Trbonje
00050000-55cc-45eb-4db2-782e15bef325	1420	Trbovlje
00050000-55cc-45eb-a9f3-0166503d3593	8231	Trebelno 
00050000-55cc-45eb-d37c-31433a4be361	8210	Trebnje
00050000-55cc-45eb-8dae-3fe9c0e2b5f6	5252	Trnovo pri Gorici
00050000-55cc-45eb-3ab5-502ec4d446f0	2254	Trnovska vas
00050000-55cc-45eb-dfe5-9de18a3ea81f	1222	Trojane
00050000-55cc-45eb-54bc-a1073fce2bcb	1236	Trzin
00050000-55cc-45eb-89f1-f8be0cb3f409	4290	Tržič
00050000-55cc-45eb-5138-c84eb8b426c7	8295	Tržišče
00050000-55cc-45eb-a2c1-e156218d6455	1311	Turjak
00050000-55cc-45eb-e853-d3cd8b5e2a06	9224	Turnišče
00050000-55cc-45eb-e7a5-1e66d05af4a6	8323	Uršna sela
00050000-55cc-45eb-7cdc-e261b8306ccd	1252	Vače
00050000-55cc-45eb-ad49-252778dc6dad	3320	Velenje 
00050000-55cc-45eb-eced-88235f38735d	3322	Velenje - poštni predali
00050000-55cc-45eb-ea68-b5d793c29d22	8212	Velika Loka
00050000-55cc-45eb-8338-e3af7e6228e1	2274	Velika Nedelja
00050000-55cc-45eb-2a5d-9fdb7ff3937f	9225	Velika Polana
00050000-55cc-45eb-3bfd-1a10bbbe8133	1315	Velike Lašče
00050000-55cc-45eb-80c3-347a8465070d	8213	Veliki Gaber
00050000-55cc-45eb-4850-42b0d04160e5	9241	Veržej
00050000-55cc-45eb-65d7-7e05c7ac5f1f	1312	Videm - Dobrepolje
00050000-55cc-45eb-4e45-ceb786c8499f	2284	Videm pri Ptuju
00050000-55cc-45eb-abea-a30f589c50ee	8344	Vinica
00050000-55cc-45eb-0dd3-89f7acad3b34	5271	Vipava
00050000-55cc-45eb-613e-9285caf48405	4212	Visoko
00050000-55cc-45eb-b702-4ad3daacc5fe	1294	Višnja Gora
00050000-55cc-45eb-05c0-89fd810f6487	3205	Vitanje
00050000-55cc-45eb-a75d-0a6334af574d	2255	Vitomarci
00050000-55cc-45eb-55d0-a331a422ed43	1217	Vodice
00050000-55cc-45eb-0d29-ed41bcb273b4	3212	Vojnik\t
00050000-55cc-45eb-8edb-747922b7a517	5293	Volčja Draga
00050000-55cc-45eb-41b2-22277fed502b	2232	Voličina
00050000-55cc-45eb-2e21-703432f2294f	3305	Vransko
00050000-55cc-45eb-3d3c-c8d9b0c96c92	6217	Vremski Britof
00050000-55cc-45eb-a5d4-3dcd1297c5d3	1360	Vrhnika
00050000-55cc-45eb-cdab-ae8cfa17e931	2365	Vuhred
00050000-55cc-45eb-4d48-cf04734fbcc5	2367	Vuzenica
00050000-55cc-45eb-40ae-cb0e9716773b	8292	Zabukovje 
00050000-55cc-45eb-6894-6bd9b126013f	1410	Zagorje ob Savi
00050000-55cc-45eb-a1af-290eb4a51efa	1303	Zagradec
00050000-55cc-45eb-65b2-60fd59c5461f	2283	Zavrč
00050000-55cc-45eb-3c17-2e6b60e46a7a	8272	Zdole 
00050000-55cc-45eb-1b01-9d8652d451f0	4201	Zgornja Besnica
00050000-55cc-45eb-2917-937722e2270d	2242	Zgornja Korena
00050000-55cc-45eb-2903-7ee0fa6fe9bb	2201	Zgornja Kungota
00050000-55cc-45eb-83c4-a89511eb5a87	2316	Zgornja Ložnica
00050000-55cc-45eb-e852-384d5d3a19d3	2314	Zgornja Polskava
00050000-55cc-45eb-64a0-c6a83c3b2a56	2213	Zgornja Velka
00050000-55cc-45eb-63ce-67137faa7452	4247	Zgornje Gorje
00050000-55cc-45eb-fd84-1efd9cb126f3	4206	Zgornje Jezersko
00050000-55cc-45eb-2e96-fbc844073326	2285	Zgornji Leskovec
00050000-55cc-45eb-9470-a700a156c24d	1432	Zidani Most
00050000-55cc-45eb-14c4-1c078b05b5fc	3214	Zreče
00050000-55cc-45eb-6e2f-197be817ffe8	4209	Žabnica
00050000-55cc-45eb-ee9c-9594d9e9697f	3310	Žalec
00050000-55cc-45eb-c7e4-2022b7f70511	4228	Železniki
00050000-55cc-45eb-aeb8-772a19797d4c	2287	Žetale
00050000-55cc-45eb-a99e-de57283d05db	4226	Žiri
00050000-55cc-45eb-b09a-426365f1caed	4274	Žirovnica
00050000-55cc-45eb-d520-41bb251f2d86	8360	Žužemberk
\.


--
-- TOC entry 2914 (class 0 OID 13296853)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 13296660)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 13296738)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 13296865)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 13297196)
-- Dependencies: 225
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 13297206)
-- Dependencies: 226
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55cc-45ec-30ff-2f6ad8f42429	00080000-55cc-45ec-e612-dbe17e2cc775	0900	AK
00190000-55cc-45ec-67dc-1ed6be8da275	00080000-55cc-45ec-e186-909635db1c85	0987	AK
00190000-55cc-45ec-d5f4-e9aff920a791	00080000-55cc-45ec-e634-c9ae4bc3e164	0989	AK
00190000-55cc-45ec-46e4-85a529d8bc29	00080000-55cc-45ec-d4db-240e194373af	0986	AK
00190000-55cc-45ec-2562-67e06c72c0ca	00080000-55cc-45ec-6266-624265babdea	0984	AK
00190000-55cc-45ec-c905-cb30380f3fed	00080000-55cc-45ec-60f3-688c07873dff	0983	AK
00190000-55cc-45ec-6ad7-fed3442aca45	00080000-55cc-45ec-8a60-c817a420667b	0982	AK
\.


--
-- TOC entry 2938 (class 0 OID 13297152)
-- Dependencies: 224
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponprej, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55cc-45ec-0040-5bf70e9b1cbf	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2941 (class 0 OID 13297214)
-- Dependencies: 227
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 13296894)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55cc-45ec-f3d1-d863e5d62977	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55cc-45ec-7ce7-c6551a612711	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55cc-45ec-31c9-c999fca94e5b	0003	Kazinska	t	84	Kazinska dvorana
00220000-55cc-45ec-6e38-acb6e7760f8f	0004	Mali oder	t	24	Mali oder 
00220000-55cc-45ec-7930-bdf385e4c194	0005	Komorni oder	t	15	Komorni oder
00220000-55cc-45ec-23b3-ce4e9e5752c4	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55cc-45ec-cde1-c884fdcdc846	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2912 (class 0 OID 13296838)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2911 (class 0 OID 13296828)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 13297013)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 13296962)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 13296532)
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
-- TOC entry 2921 (class 0 OID 13296904)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 13296570)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55cc-45eb-25fb-b7f58cdc504e	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55cc-45eb-b27c-f92590bcebd5	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55cc-45eb-f21b-8fb5a87cac2e	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55cc-45eb-8d87-01aa92c22570	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55cc-45eb-0890-a566de471abd	planer	Planer dogodkov v koledarju	t
00020000-55cc-45eb-569f-fc996c2d40a7	kadrovska	Kadrovska služba	t
00020000-55cc-45eb-5e8e-015bef049fd5	arhivar	Ažuriranje arhivalij	t
00020000-55cc-45eb-71ca-749777af4004	igralec	Igralec	t
00020000-55cc-45eb-45a7-0467293881f5	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55cc-45ec-71b0-489b7d69c98c	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2887 (class 0 OID 13296554)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55cc-45eb-b656-04e42f025d7d	00020000-55cc-45eb-f21b-8fb5a87cac2e
00010000-55cc-45eb-47ee-26a41d6bc01a	00020000-55cc-45eb-f21b-8fb5a87cac2e
00010000-55cc-45ec-be40-e61a8041eb4b	00020000-55cc-45ec-71b0-489b7d69c98c
\.


--
-- TOC entry 2923 (class 0 OID 13296918)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2915 (class 0 OID 13296859)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 13296805)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 13297255)
-- Dependencies: 232
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55cc-45eb-9ad9-1cda109eb5c1	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55cc-45eb-0c81-d8ade139680e	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55cc-45eb-ceb8-c12a90beb1ba	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55cc-45eb-96c7-3471ce914297	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55cc-45eb-520e-5a35d5cc31fe	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2945 (class 0 OID 13297247)
-- Dependencies: 231
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55cc-45eb-a14a-6589e005b012	00230000-55cc-45eb-96c7-3471ce914297	popa
00240000-55cc-45eb-e51d-e0535173974a	00230000-55cc-45eb-96c7-3471ce914297	oseba
00240000-55cc-45eb-d293-f0e0e18526ae	00230000-55cc-45eb-96c7-3471ce914297	sezona
00240000-55cc-45eb-b57d-6a2fda64c471	00230000-55cc-45eb-0c81-d8ade139680e	prostor
00240000-55cc-45eb-eb31-54b2a4d4271e	00230000-55cc-45eb-96c7-3471ce914297	besedilo
00240000-55cc-45eb-5b65-a3a1bb4a9992	00230000-55cc-45eb-96c7-3471ce914297	uprizoritev
00240000-55cc-45eb-32e5-b11c0fa58f81	00230000-55cc-45eb-96c7-3471ce914297	funkcija
00240000-55cc-45eb-1a8f-5116c86261e7	00230000-55cc-45eb-96c7-3471ce914297	tipfunkcije
00240000-55cc-45eb-b4c7-e038b3dd4630	00230000-55cc-45eb-96c7-3471ce914297	alternacija
00240000-55cc-45eb-5206-d3884e16a66d	00230000-55cc-45eb-9ad9-1cda109eb5c1	pogodba
00240000-55cc-45eb-9080-af44e02a2280	00230000-55cc-45eb-96c7-3471ce914297	zaposlitev
00240000-55cc-45eb-3940-029006d3d332	00230000-55cc-45eb-9ad9-1cda109eb5c1	programdela
00240000-55cc-45eb-8bb1-64808d328d75	00230000-55cc-45eb-96c7-3471ce914297	zapis
\.


--
-- TOC entry 2944 (class 0 OID 13297242)
-- Dependencies: 230
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 13296972)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55cc-45ec-7b50-81993b99b263	000e0000-55cc-45ec-2a0c-439ae7dc9229	00080000-55cc-45ec-9b22-14864b8c40d7	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55cc-45ec-2781-0017cb92206b	000e0000-55cc-45ec-2a0c-439ae7dc9229	00080000-55cc-45ec-9b22-14864b8c40d7	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55cc-45ec-5871-3e774e02e2b5	000e0000-55cc-45ec-2a0c-439ae7dc9229	00080000-55cc-45ec-c6ec-b4fa99cdcbdb	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55cc-45ec-f0aa-3ae9a71e3e7c	000e0000-55cc-45ec-2a0c-439ae7dc9229	00080000-55cc-45ec-c6ec-b4fa99cdcbdb	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2894 (class 0 OID 13296632)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2910 (class 0 OID 13296815)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55cc-45ec-aba5-bd2e4eedbd4f	00180000-55cc-45ec-517c-3903c33b6d32	000c0000-55cc-45ec-087c-32db663b811f	00090000-55cc-45ec-5e10-00a433d92f5c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55cc-45ec-09c4-51c675cc5af0	00180000-55cc-45ec-517c-3903c33b6d32	000c0000-55cc-45ec-265d-a1f5b9b7fe80	00090000-55cc-45ec-1666-027e0d98705f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55cc-45ec-cccc-d735e01d92f5	00180000-55cc-45ec-517c-3903c33b6d32	000c0000-55cc-45ec-c85a-7cba1a4fd4ef	00090000-55cc-45ec-ccc9-d43cd9a0e195	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55cc-45ec-060c-79afb75fc9ba	00180000-55cc-45ec-517c-3903c33b6d32	000c0000-55cc-45ec-fac6-f8366e07db71	00090000-55cc-45ec-6f2a-f25b35448187	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55cc-45ec-7789-ca5090060746	00180000-55cc-45ec-517c-3903c33b6d32	000c0000-55cc-45ec-d7d2-7ff76915962d	00090000-55cc-45ec-f901-c14735fc72f6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55cc-45ec-1dc7-69e948fb869c	00180000-55cc-45ec-db39-de529afa256b	\N	00090000-55cc-45ec-f901-c14735fc72f6	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2930 (class 0 OID 13297002)
-- Dependencies: 216
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55cc-45eb-aec7-5de1c752f374	Avtor	Avtorji	Avtorka	umetnik
000f0000-55cc-45eb-692b-efc9e94ed6d6	Priredba	Priredba	Priredba	umetnik
000f0000-55cc-45eb-e00f-2a5d8a99e720	Prevod	Prevod	Prevod	umetnik
000f0000-55cc-45eb-bf41-20f5ae2f3467	Režija	Režija	Režija	umetnik
000f0000-55cc-45eb-320d-327620377052	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55cc-45eb-b139-cdbba112e7a3	Scenografija	Scenografija	Scenografija	tehnik
000f0000-55cc-45eb-edde-9d2c0be75f92	Kostumografija	Kostumografija	Kostumografija	tehnik
000f0000-55cc-45eb-2574-950efe117725	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55cc-45eb-ab1c-d998e0cd789f	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	tehnik
000f0000-55cc-45eb-e0b7-5f128816fbfc	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	tehnik
000f0000-55cc-45eb-dda2-7fdd892f53b9	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55cc-45eb-dc40-200650da7cf7	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55cc-45eb-a700-f2acb7a75364	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	tehnik
000f0000-55cc-45eb-ba10-8ad12c7dd1cf	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	tehnik
000f0000-55cc-45eb-b658-5b66e32b9bcb	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55cc-45eb-51d7-df823df2dd6c	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55cc-45eb-cdfc-bb3d2017504c	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55cc-45eb-c4b4-51be7699fe4f	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2942 (class 0 OID 13297224)
-- Dependencies: 228
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55cc-45eb-6336-057cfd7e28f0	01	Velika predstava	f	1.00	1.00
002b0000-55cc-45eb-11f8-6f3be80d9b56	02	Mala predstava	f	0.50	0.50
002b0000-55cc-45eb-70f5-54e04fac1b4d	03	Mala koprodukcija	t	0.40	1.00
002b0000-55cc-45eb-4f85-7f6a80803d82	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55cc-45eb-edd4-915af99f8f8b	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2899 (class 0 OID 13296695)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2886 (class 0 OID 13296541)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55cc-45eb-47ee-26a41d6bc01a	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROFaIqooEsgChl7N.F4v6Mu/0r7bGRYW2	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55cc-45ec-c233-974e2dfbc4bb	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55cc-45ec-8cb1-35e5161b4850	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55cc-45ec-3f03-0d09d0d72e65	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55cc-45ec-1b71-7e76f3bbc03e	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55cc-45ec-c56f-a3a1d0ede374	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55cc-45ec-2dd0-aee2dd59f11a	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55cc-45ec-79e6-a651e7c3de8f	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55cc-45ec-1ea0-86b9d2da3b66	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55cc-45ec-abcc-57a4116a2146	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55cc-45ec-be40-e61a8041eb4b	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55cc-45eb-b656-04e42f025d7d	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2934 (class 0 OID 13297050)
-- Dependencies: 220
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55cc-45ec-7ad3-981ea5ff10ed	00160000-55cc-45ec-5d3c-7b2b45c58019	00150000-55cc-45eb-d24b-a8a8bf08d61c	00140000-55cc-45ea-01c6-8457abf5998e	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55cc-45ec-7930-bdf385e4c194
000e0000-55cc-45ec-2a0c-439ae7dc9229	00160000-55cc-45ec-7b2c-e4e72c65648b	00150000-55cc-45eb-9771-6ee68f3e0382	00140000-55cc-45ea-bc62-12fe753a3fe8	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55cc-45ec-23b3-ce4e9e5752c4
000e0000-55cc-45ec-0734-3e8f5b353c08	\N	00150000-55cc-45eb-9771-6ee68f3e0382	00140000-55cc-45ea-bc62-12fe753a3fe8	00190000-55cc-45ec-67dc-1ed6be8da275	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55cc-45ec-7930-bdf385e4c194
000e0000-55cc-45ec-f319-2d1793cad52e	\N	00150000-55cc-45eb-9771-6ee68f3e0382	00140000-55cc-45ea-bc62-12fe753a3fe8	00190000-55cc-45ec-67dc-1ed6be8da275	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55cc-45ec-7930-bdf385e4c194
000e0000-55cc-45ec-d15c-8522fe46a549	\N	00150000-55cc-45eb-9771-6ee68f3e0382	00140000-55cc-45ea-bc62-12fe753a3fe8	00190000-55cc-45ec-67dc-1ed6be8da275	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55cc-45ec-f3d1-d863e5d62977
\.


--
-- TOC entry 2904 (class 0 OID 13296757)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55cc-45ec-3771-1bc9e7c972a6	000e0000-55cc-45ec-2a0c-439ae7dc9229	1	
00200000-55cc-45ec-0f4d-70589d6ec729	000e0000-55cc-45ec-2a0c-439ae7dc9229	2	
\.


--
-- TOC entry 2919 (class 0 OID 13296886)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 13297294)
-- Dependencies: 234
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 13297266)
-- Dependencies: 233
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 13297306)
-- Dependencies: 235
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2926 (class 0 OID 13296955)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55cc-45ec-2c97-105036b4a563	00090000-55cc-45ec-1666-027e0d98705f	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55cc-45ec-bb90-2a4d01e6482d	00090000-55cc-45ec-ccc9-d43cd9a0e195	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55cc-45ec-82b4-6ea9396d4aec	00090000-55cc-45ec-e88a-c7aace883a24	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55cc-45ec-5e33-dedd318f7228	00090000-55cc-45ec-9d05-70c9ca9de211	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55cc-45ec-6309-14bb7231f709	00090000-55cc-45ec-5e10-00a433d92f5c	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55cc-45ec-d264-50a0eec6cc8d	00090000-55cc-45ec-1502-759f99922824	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2906 (class 0 OID 13296789)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 13297040)
-- Dependencies: 219
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55cc-45ea-01c6-8457abf5998e	01	Drama	drama (SURS 01)
00140000-55cc-45ea-8ad7-fa5be29f25f2	02	Opera	opera (SURS 02)
00140000-55cc-45ea-015a-4016ab28d9c0	03	Balet	balet (SURS 03)
00140000-55cc-45ea-ef35-7f010a3fa62d	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55cc-45ea-b132-34aa2c274ddf	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55cc-45ea-bc62-12fe753a3fe8	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55cc-45ea-5387-cc128eab74fe	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2925 (class 0 OID 13296945)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55cc-45eb-c01e-aa89f864752e	01	Opera	opera
00150000-55cc-45eb-6f0c-4be031502a91	02	Opereta	opereta
00150000-55cc-45eb-bc94-807d980037a2	03	Balet	balet
00150000-55cc-45eb-f2e8-2147f3dac539	04	Plesne prireditve	plesne prireditve
00150000-55cc-45eb-e0b5-da1853ccd0e7	05	Lutkovno gledališče	lutkovno gledališče
00150000-55cc-45eb-b775-9fc64a074ca4	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55cc-45eb-e877-7745663097b6	07	Biografska drama	biografska drama
00150000-55cc-45eb-d24b-a8a8bf08d61c	08	Komedija	komedija
00150000-55cc-45eb-b2fa-627b92b049f8	09	Črna komedija	črna komedija
00150000-55cc-45eb-3e7f-d303baad51db	10	E-igra	E-igra
00150000-55cc-45eb-9771-6ee68f3e0382	11	Kriminalka	kriminalka
00150000-55cc-45eb-5d58-237a47365c05	12	Musical	musical
\.


--
-- TOC entry 2436 (class 2606 OID 13296595)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 13297097)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 13297087)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 13297001)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 13297347)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 13296779)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 13296804)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 13297240)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 13296721)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 13297146)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 13296941)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 13296755)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 2606 OID 13296798)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 13296735)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 13296851)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 13297323)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 13297330)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2677 (class 2606 OID 13297355)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 13296878)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 13296693)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 13296604)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 13296628)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 13296584)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2427 (class 2606 OID 13296569)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 13296884)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 13296917)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 13297035)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 13296657)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 13296681)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 13296857)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 13296671)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 13296742)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 13296869)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 13297203)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 13297211)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 13297194)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 13297222)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 13296901)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 13296842)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 13296833)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 13297023)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 13296969)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 13296540)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 13296908)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 13296558)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2429 (class 2606 OID 13296578)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 13296926)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 13296864)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 13296813)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 13297264)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 13297252)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 13297246)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 13296982)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 13296637)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 13296824)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 13297012)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 13297234)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 13296706)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 13296553)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 13297066)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 13296764)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 13296892)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 13297304)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 13297288)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 13297312)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 13296960)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 13296793)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 13297048)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 13296953)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 1259 OID 13296786)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2577 (class 1259 OID 13296983)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2578 (class 1259 OID 13296984)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2663 (class 1259 OID 13297325)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2664 (class 1259 OID 13297324)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2450 (class 1259 OID 13296659)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2542 (class 1259 OID 13296885)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2650 (class 1259 OID 13297292)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2651 (class 1259 OID 13297291)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2652 (class 1259 OID 13297293)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2653 (class 1259 OID 13297290)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2654 (class 1259 OID 13297289)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2536 (class 1259 OID 13296871)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2537 (class 1259 OID 13296870)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2487 (class 1259 OID 13296765)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2564 (class 1259 OID 13296942)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2565 (class 1259 OID 13296944)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2566 (class 1259 OID 13296943)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2475 (class 1259 OID 13296737)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2476 (class 1259 OID 13296736)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2633 (class 1259 OID 13297223)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2587 (class 1259 OID 13297037)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2588 (class 1259 OID 13297038)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2589 (class 1259 OID 13297039)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2660 (class 1259 OID 13297313)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2596 (class 1259 OID 13297071)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2597 (class 1259 OID 13297068)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2598 (class 1259 OID 13297072)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2599 (class 1259 OID 13297070)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2600 (class 1259 OID 13297069)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2465 (class 1259 OID 13296708)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2466 (class 1259 OID 13296707)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2441 (class 1259 OID 13296631)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2552 (class 1259 OID 13296909)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2505 (class 1259 OID 13296799)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2431 (class 1259 OID 13296585)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2432 (class 1259 OID 13296586)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2557 (class 1259 OID 13296929)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2558 (class 1259 OID 13296928)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2559 (class 1259 OID 13296927)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2479 (class 1259 OID 13296743)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2480 (class 1259 OID 13296745)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2481 (class 1259 OID 13296744)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 13297254)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2516 (class 1259 OID 13296837)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2517 (class 1259 OID 13296835)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2518 (class 1259 OID 13296834)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2519 (class 1259 OID 13296836)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2422 (class 1259 OID 13296559)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2423 (class 1259 OID 13296560)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2545 (class 1259 OID 13296893)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2673 (class 1259 OID 13297348)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2674 (class 1259 OID 13297356)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2675 (class 1259 OID 13297357)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2531 (class 1259 OID 13296858)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2573 (class 1259 OID 13296970)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2574 (class 1259 OID 13296971)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2617 (class 1259 OID 13297151)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2618 (class 1259 OID 13297150)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2619 (class 1259 OID 13297147)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2620 (class 1259 OID 13297148)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2621 (class 1259 OID 13297149)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2454 (class 1259 OID 13296673)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2455 (class 1259 OID 13296672)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2456 (class 1259 OID 13296674)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2625 (class 1259 OID 13297204)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2626 (class 1259 OID 13297205)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2610 (class 1259 OID 13297101)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2611 (class 1259 OID 13297102)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2612 (class 1259 OID 13297099)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2613 (class 1259 OID 13297100)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2570 (class 1259 OID 13296961)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2522 (class 1259 OID 13296846)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2523 (class 1259 OID 13296845)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2524 (class 1259 OID 13296843)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2525 (class 1259 OID 13296844)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 13297089)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2607 (class 1259 OID 13297088)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2622 (class 1259 OID 13297195)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2486 (class 1259 OID 13296756)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2640 (class 1259 OID 13297241)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2667 (class 1259 OID 13297331)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2668 (class 1259 OID 13297332)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2437 (class 1259 OID 13296606)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2438 (class 1259 OID 13296605)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2446 (class 1259 OID 13296638)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 13296639)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2511 (class 1259 OID 13296827)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2512 (class 1259 OID 13296826)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2513 (class 1259 OID 13296825)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2493 (class 1259 OID 13296788)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2494 (class 1259 OID 13296784)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2495 (class 1259 OID 13296781)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2496 (class 1259 OID 13296782)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2497 (class 1259 OID 13296780)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2498 (class 1259 OID 13296785)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2499 (class 1259 OID 13296783)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2453 (class 1259 OID 13296658)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2471 (class 1259 OID 13296722)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2472 (class 1259 OID 13296724)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2473 (class 1259 OID 13296723)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2474 (class 1259 OID 13296725)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2530 (class 1259 OID 13296852)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2592 (class 1259 OID 13297036)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 13297067)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2444 (class 1259 OID 13296629)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2445 (class 1259 OID 13296630)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2567 (class 1259 OID 13296954)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 13297265)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2464 (class 1259 OID 13296694)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 13297253)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2550 (class 1259 OID 13296903)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2551 (class 1259 OID 13296902)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 13297098)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2461 (class 1259 OID 13296682)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 13297049)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2657 (class 1259 OID 13297305)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2631 (class 1259 OID 13297212)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2632 (class 1259 OID 13297213)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2510 (class 1259 OID 13296814)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2430 (class 1259 OID 13296579)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2500 (class 1259 OID 13296787)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2703 (class 2606 OID 13297493)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2706 (class 2606 OID 13297478)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2705 (class 2606 OID 13297483)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2701 (class 2606 OID 13297503)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2707 (class 2606 OID 13297473)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2702 (class 2606 OID 13297498)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2704 (class 2606 OID 13297488)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2737 (class 2606 OID 13297648)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2736 (class 2606 OID 13297653)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2770 (class 2606 OID 13297823)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2771 (class 2606 OID 13297818)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2688 (class 2606 OID 13297408)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2724 (class 2606 OID 13297588)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2765 (class 2606 OID 13297803)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2766 (class 2606 OID 13297798)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2764 (class 2606 OID 13297808)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2767 (class 2606 OID 13297793)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2768 (class 2606 OID 13297788)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2722 (class 2606 OID 13297583)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2723 (class 2606 OID 13297578)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2700 (class 2606 OID 13297468)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2732 (class 2606 OID 13297618)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2730 (class 2606 OID 13297628)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2731 (class 2606 OID 13297623)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2694 (class 2606 OID 13297443)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2695 (class 2606 OID 13297438)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2720 (class 2606 OID 13297568)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2761 (class 2606 OID 13297773)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2740 (class 2606 OID 13297658)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2739 (class 2606 OID 13297663)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2738 (class 2606 OID 13297668)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2769 (class 2606 OID 13297813)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2742 (class 2606 OID 13297688)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2745 (class 2606 OID 13297673)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2741 (class 2606 OID 13297693)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2743 (class 2606 OID 13297683)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2744 (class 2606 OID 13297678)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2692 (class 2606 OID 13297433)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2693 (class 2606 OID 13297428)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2684 (class 2606 OID 13297393)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2685 (class 2606 OID 13297388)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2726 (class 2606 OID 13297598)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2708 (class 2606 OID 13297508)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2681 (class 2606 OID 13297368)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2680 (class 2606 OID 13297373)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2727 (class 2606 OID 13297613)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2728 (class 2606 OID 13297608)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2729 (class 2606 OID 13297603)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2698 (class 2606 OID 13297448)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2696 (class 2606 OID 13297458)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2697 (class 2606 OID 13297453)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2763 (class 2606 OID 13297783)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2712 (class 2606 OID 13297543)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2714 (class 2606 OID 13297533)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2715 (class 2606 OID 13297528)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2713 (class 2606 OID 13297538)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2679 (class 2606 OID 13297358)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2678 (class 2606 OID 13297363)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2725 (class 2606 OID 13297593)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2774 (class 2606 OID 13297838)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2776 (class 2606 OID 13297843)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2775 (class 2606 OID 13297848)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2721 (class 2606 OID 13297573)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2735 (class 2606 OID 13297638)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2734 (class 2606 OID 13297643)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2752 (class 2606 OID 13297748)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2753 (class 2606 OID 13297743)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2756 (class 2606 OID 13297728)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2755 (class 2606 OID 13297733)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2754 (class 2606 OID 13297738)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2690 (class 2606 OID 13297418)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2691 (class 2606 OID 13297413)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2689 (class 2606 OID 13297423)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2759 (class 2606 OID 13297758)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2758 (class 2606 OID 13297763)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2749 (class 2606 OID 13297718)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2748 (class 2606 OID 13297723)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2751 (class 2606 OID 13297708)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2750 (class 2606 OID 13297713)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2733 (class 2606 OID 13297633)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2716 (class 2606 OID 13297563)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2717 (class 2606 OID 13297558)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2719 (class 2606 OID 13297548)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2718 (class 2606 OID 13297553)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2746 (class 2606 OID 13297703)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2747 (class 2606 OID 13297698)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2757 (class 2606 OID 13297753)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2699 (class 2606 OID 13297463)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2760 (class 2606 OID 13297768)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2762 (class 2606 OID 13297778)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2773 (class 2606 OID 13297828)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2772 (class 2606 OID 13297833)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2682 (class 2606 OID 13297383)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2683 (class 2606 OID 13297378)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2687 (class 2606 OID 13297398)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2686 (class 2606 OID 13297403)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2709 (class 2606 OID 13297523)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2710 (class 2606 OID 13297518)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2711 (class 2606 OID 13297513)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-13 09:23:25 CEST

--
-- PostgreSQL database dump complete
--

