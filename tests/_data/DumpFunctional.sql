--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-13 11:27:07 CEST

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
-- TOC entry 177 (class 1259 OID 13425567)
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
-- TOC entry 222 (class 1259 OID 13426070)
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
-- TOC entry 221 (class 1259 OID 13426053)
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
-- TOC entry 215 (class 1259 OID 13425965)
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
-- TOC entry 238 (class 1259 OID 13426313)
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
-- TOC entry 191 (class 1259 OID 13425746)
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
-- TOC entry 194 (class 1259 OID 13425780)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 13426215)
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
-- TOC entry 186 (class 1259 OID 13425689)
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
-- TOC entry 223 (class 1259 OID 13426083)
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
-- TOC entry 210 (class 1259 OID 13425910)
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
-- TOC entry 189 (class 1259 OID 13425726)
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
-- TOC entry 193 (class 1259 OID 13425774)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 13425706)
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
-- TOC entry 199 (class 1259 OID 13425827)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 236 (class 1259 OID 13426294)
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
-- TOC entry 237 (class 1259 OID 13426306)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 13426329)
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
-- TOC entry 203 (class 1259 OID 13425852)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 13425663)
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
-- TOC entry 178 (class 1259 OID 13425576)
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
-- TOC entry 179 (class 1259 OID 13425587)
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
-- TOC entry 174 (class 1259 OID 13425541)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 13425560)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 13425859)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 13425890)
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
-- TOC entry 218 (class 1259 OID 13426004)
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
-- TOC entry 181 (class 1259 OID 13425620)
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
-- TOC entry 183 (class 1259 OID 13425655)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 13425833)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 13425640)
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
-- TOC entry 188 (class 1259 OID 13425718)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 13425845)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 13426176)
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
-- TOC entry 226 (class 1259 OID 13426186)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 224 (class 1259 OID 13426132)
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
-- TOC entry 227 (class 1259 OID 13426194)
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
-- TOC entry 206 (class 1259 OID 13425874)
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
-- TOC entry 198 (class 1259 OID 13425818)
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
-- TOC entry 197 (class 1259 OID 13425808)
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
-- TOC entry 217 (class 1259 OID 13425993)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 13425942)
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
-- TOC entry 171 (class 1259 OID 13425512)
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
-- TOC entry 170 (class 1259 OID 13425510)
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
-- TOC entry 207 (class 1259 OID 13425884)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 13425550)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 13425534)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 13425898)
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
-- TOC entry 201 (class 1259 OID 13425839)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 13425785)
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
-- TOC entry 232 (class 1259 OID 13426235)
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
-- TOC entry 231 (class 1259 OID 13426227)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 13426222)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 13425952)
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
-- TOC entry 180 (class 1259 OID 13425612)
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
-- TOC entry 196 (class 1259 OID 13425795)
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
-- TOC entry 216 (class 1259 OID 13425982)
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
-- TOC entry 228 (class 1259 OID 13426204)
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
-- TOC entry 185 (class 1259 OID 13425675)
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
-- TOC entry 172 (class 1259 OID 13425521)
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
-- TOC entry 220 (class 1259 OID 13426030)
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
-- TOC entry 190 (class 1259 OID 13425737)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 13425866)
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
-- TOC entry 234 (class 1259 OID 13426274)
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
-- TOC entry 233 (class 1259 OID 13426246)
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
-- TOC entry 235 (class 1259 OID 13426286)
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
-- TOC entry 212 (class 1259 OID 13425935)
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
-- TOC entry 192 (class 1259 OID 13425769)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 13426020)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 13425925)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2170 (class 2604 OID 13425515)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2891 (class 0 OID 13425567)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 13426070)
-- Dependencies: 222
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55cc-62ea-94fd-53f0aef300c3	000d0000-55cc-62ea-b565-ffbe76634ef2	\N	00090000-55cc-62ea-fdc7-090f32aff563	000b0000-55cc-62ea-16d1-013a786fe6eb	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55cc-62ea-d80d-08365c3aab09	000d0000-55cc-62ea-439f-c9896350cf0d	00100000-55cc-62ea-1927-a25274d7be63	00090000-55cc-62ea-fe08-b9f0745870f3	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55cc-62ea-c148-7b950e48bb3f	000d0000-55cc-62ea-ff47-66b697a00686	00100000-55cc-62ea-c4e4-768bdc71380d	00090000-55cc-62ea-823a-1af5e5358a3b	\N	0003	t	\N	2015-08-13	\N	2	\N	\N	f	f
000c0000-55cc-62ea-9100-a8f64b4e69e9	000d0000-55cc-62ea-e6ea-766a047fdb41	\N	00090000-55cc-62ea-aeb8-338b3396d25c	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55cc-62ea-642e-bf367e4a467d	000d0000-55cc-62ea-fe82-c710771b1b24	\N	00090000-55cc-62ea-cacf-8d1b3d8207ae	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55cc-62ea-6052-5cfa570246df	000d0000-55cc-62ea-aed7-2f2efe8a0802	\N	00090000-55cc-62ea-e259-11a0ffea6cff	000b0000-55cc-62ea-afe8-7781e95c8d37	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55cc-62ea-bfb1-24627c2d03ec	000d0000-55cc-62ea-d43b-429494a3e4f6	00100000-55cc-62ea-5d7b-53fd095a8510	00090000-55cc-62ea-986d-917be5f622a3	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55cc-62ea-6518-12cfc60ad687	000d0000-55cc-62ea-502e-6ae4ad832c67	\N	00090000-55cc-62ea-0bdd-94f648524ee7	000b0000-55cc-62ea-2603-2dbd6872c9a1	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55cc-62ea-4cd4-a3af06bedd68	000d0000-55cc-62ea-d43b-429494a3e4f6	00100000-55cc-62ea-b679-c8eb4bd57c1c	00090000-55cc-62ea-6463-ba04bf4f72a1	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55cc-62ea-e739-f1af6443e948	000d0000-55cc-62ea-d43b-429494a3e4f6	00100000-55cc-62ea-3d17-a4113ddfa444	00090000-55cc-62ea-561a-7ce34e4b4838	\N	0010	t	\N	2015-08-13	\N	16	\N	\N	f	t
000c0000-55cc-62ea-b185-ba4127d55fb2	000d0000-55cc-62ea-d43b-429494a3e4f6	00100000-55cc-62ea-b797-42f5ad13aa88	00090000-55cc-62ea-acfa-705004da9c82	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2935 (class 0 OID 13426053)
-- Dependencies: 221
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 13425965)
-- Dependencies: 215
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55cc-62e9-3786-fc15e3d06993	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55cc-62e9-c495-ddbcaad11988	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55cc-62e9-5bc5-b7bb354c43e8	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2952 (class 0 OID 13426313)
-- Dependencies: 238
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, title, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 13425746)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55cc-62ea-5eb3-dc281c265081	\N	\N	00200000-55cc-62ea-b499-67e17da38396	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55cc-62ea-691c-0c8ffab7820c	\N	\N	00200000-55cc-62ea-e1f2-4fb29362875a	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55cc-62ea-b1fc-746338b69fe5	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55cc-62ea-7cd3-321dbd2e8f12	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55cc-62ea-29bf-f5c4302e3e28	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2908 (class 0 OID 13425780)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2943 (class 0 OID 13426215)
-- Dependencies: 229
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 13425689)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55cc-62e8-51be-ab4ef5a476af	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55cc-62e8-3865-e7d4e4cc336b	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55cc-62e8-003f-d83dc36c9fd8	AL	ALB	008	Albania 	Albanija	\N
00040000-55cc-62e8-96b1-ccf821e46db4	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55cc-62e8-f02d-16f6846ae84d	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55cc-62e8-05e3-73cf5676f472	AD	AND	020	Andorra 	Andora	\N
00040000-55cc-62e8-822e-502afe80d985	AO	AGO	024	Angola 	Angola	\N
00040000-55cc-62e8-c294-1d021d366f2b	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55cc-62e8-2c08-b648b884ae3a	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55cc-62e8-237d-ba7a6e25248e	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55cc-62e8-1196-289f3ee9426c	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55cc-62e8-8ae8-c7f8cc416458	AM	ARM	051	Armenia 	Armenija	\N
00040000-55cc-62e8-1e97-1e4398545144	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55cc-62e8-5f9b-29d115356c3f	AU	AUS	036	Australia 	Avstralija	\N
00040000-55cc-62e8-8af8-ab62c03f7c79	AT	AUT	040	Austria 	Avstrija	\N
00040000-55cc-62e8-65f8-fcc164c0d52d	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55cc-62e8-6147-2e1b25a8b819	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55cc-62e8-4532-c46cdf16d0d2	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55cc-62e8-9315-2482dd926164	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55cc-62e8-c577-d411dc103963	BB	BRB	052	Barbados 	Barbados	\N
00040000-55cc-62e8-b177-267b7543a4fd	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55cc-62e8-d813-bce97a43ab45	BE	BEL	056	Belgium 	Belgija	\N
00040000-55cc-62e8-c256-323db85adfa1	BZ	BLZ	084	Belize 	Belize	\N
00040000-55cc-62e8-78f4-123cce78fdad	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55cc-62e8-e16a-aa3dc3601b11	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55cc-62e8-86cb-bb26eb22be76	BT	BTN	064	Bhutan 	Butan	\N
00040000-55cc-62e8-68f0-c94d6ea65248	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55cc-62e8-caca-6385d7f1f4ea	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55cc-62e8-ca4d-1f20587c8e67	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55cc-62e8-e69e-6b3a7dca83b2	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55cc-62e8-8e9d-6b049019d9e6	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55cc-62e8-dc63-87753f10cc72	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55cc-62e8-c325-36fd15c75eb0	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55cc-62e8-653a-f4cf4fd310cf	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55cc-62e8-df99-84eae46aa095	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55cc-62e8-a14e-77f3ac695000	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55cc-62e8-9406-39af9d1dae8a	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55cc-62e8-7aaa-662d3a111a20	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55cc-62e8-6baf-50cd9ddc83c4	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55cc-62e8-c271-5fcfce52a54c	CA	CAN	124	Canada 	Kanada	\N
00040000-55cc-62e8-357c-8618a12cf8a2	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55cc-62e8-351d-0b9b5a1de98c	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55cc-62e8-dd4b-954f48cb2480	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55cc-62e8-cdd2-1b48f5b757e3	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55cc-62e8-9ee6-6eb6e138ba90	CL	CHL	152	Chile 	Čile	\N
00040000-55cc-62e8-ce97-eab9dac12fc6	CN	CHN	156	China 	Kitajska	\N
00040000-55cc-62e8-8956-59b743b336f9	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55cc-62e8-a358-58b09d61ac8a	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55cc-62e8-80df-f683ceae7fb8	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55cc-62e8-bd9b-18d6b4dac342	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55cc-62e8-7c3e-7f82bc69d618	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55cc-62e8-ff13-72e86bbe4792	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55cc-62e8-3c9a-cfeb76e64fa1	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55cc-62e8-9220-f0acb5eadd81	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55cc-62e8-9e29-eb421110adb5	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55cc-62e8-ccee-e63542df2d8d	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55cc-62e8-057b-cd5a884c0edb	CU	CUB	192	Cuba 	Kuba	\N
00040000-55cc-62e8-c40a-48a41fb85d58	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55cc-62e8-a4d3-5ff98397d469	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55cc-62e8-40bc-0f7c8075200e	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55cc-62e8-4745-816a99dd5eff	DK	DNK	208	Denmark 	Danska	\N
00040000-55cc-62e8-26a1-7e89dc4b4c89	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55cc-62e8-2acf-e7351d60fe96	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55cc-62e8-afcf-800f6ddd9091	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55cc-62e8-1f9b-d94c1808b202	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55cc-62e8-1457-aeb588d15a08	EG	EGY	818	Egypt 	Egipt	\N
00040000-55cc-62e8-4db2-799fc7f0655e	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55cc-62e8-b694-5f22b6a4dd74	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55cc-62e8-035f-880b0b6b2d57	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55cc-62e8-b55c-7039abc8765c	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55cc-62e8-1e7d-976cddb527cc	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55cc-62e8-6eea-d8426b5b66bb	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55cc-62e8-b91f-fd22deabaafb	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55cc-62e8-6c4e-4daf1e113169	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55cc-62e8-f212-7d5c3b1e1dc4	FI	FIN	246	Finland 	Finska	\N
00040000-55cc-62e8-7d5d-38fb909df080	FR	FRA	250	France 	Francija	\N
00040000-55cc-62e8-366f-2cc3cac9c218	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55cc-62e8-2cab-7aea80cd5435	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55cc-62e8-5ab5-ed9bb50ee65a	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55cc-62e8-4348-abfdf17c6d4b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55cc-62e8-34d6-efda277f9e65	GA	GAB	266	Gabon 	Gabon	\N
00040000-55cc-62e8-501e-371b3877c44f	GM	GMB	270	Gambia 	Gambija	\N
00040000-55cc-62e8-d0fc-9c1bd9562323	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55cc-62e8-7a62-812ad1beb736	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55cc-62e8-5986-6d6997fa46fb	GH	GHA	288	Ghana 	Gana	\N
00040000-55cc-62e8-f615-d8405d907b6a	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55cc-62e8-8bd5-355b6aba2baf	GR	GRC	300	Greece 	Grčija	\N
00040000-55cc-62e8-68a8-4754cdc45612	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55cc-62e8-cd2c-3a9571f26c70	GD	GRD	308	Grenada 	Grenada	\N
00040000-55cc-62e8-58ca-aa7a911d4e23	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55cc-62e8-cce1-f6f4935e0ea9	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55cc-62e8-110c-46aae137bc35	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55cc-62e8-f5e6-65d89a1c18c9	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55cc-62e8-d25c-4033fc23c3a8	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55cc-62e8-903a-78313af0f9ef	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55cc-62e8-b40f-9d5cb269f1be	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55cc-62e8-236a-1067124f120c	HT	HTI	332	Haiti 	Haiti	\N
00040000-55cc-62e8-dccf-1b6d98f74b51	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55cc-62e8-0254-ba41270cab5e	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55cc-62e8-f692-fbcae231edab	HN	HND	340	Honduras 	Honduras	\N
00040000-55cc-62e8-5ce9-c61d4e9e4327	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55cc-62e8-12be-bca67f964ec9	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55cc-62e8-ca96-f0ee21f992aa	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55cc-62e8-5cfb-31f45f51b927	IN	IND	356	India 	Indija	\N
00040000-55cc-62e8-0a8a-25fb6f32d924	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55cc-62e8-4749-e8824a1c28c0	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55cc-62e8-cb57-ff040259b33d	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55cc-62e8-8e77-7b1fc2d8b337	IE	IRL	372	Ireland 	Irska	\N
00040000-55cc-62e8-2100-c05048769d4f	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55cc-62e8-f693-1d0613a63083	IL	ISR	376	Israel 	Izrael	\N
00040000-55cc-62e8-bcc5-5f5aed7289e3	IT	ITA	380	Italy 	Italija	\N
00040000-55cc-62e8-2b68-65739b94ff57	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55cc-62e8-2965-f9306d937f86	JP	JPN	392	Japan 	Japonska	\N
00040000-55cc-62e8-1897-4f840570b809	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55cc-62e8-eb72-46e894aecc2c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55cc-62e8-6433-22e031a8c9f4	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55cc-62e8-fe10-2670bc727cdd	KE	KEN	404	Kenya 	Kenija	\N
00040000-55cc-62e8-9349-a0809a807e7a	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55cc-62e8-b0a0-3d574c69d07b	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55cc-62e8-4cf0-4df93b937f8c	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55cc-62e8-b93d-0f44d8cb4baa	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55cc-62e8-0756-a3babf0ec7b7	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55cc-62e8-d764-074486cda3f9	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55cc-62e8-da51-5e55edad34a8	LV	LVA	428	Latvia 	Latvija	\N
00040000-55cc-62e8-fd36-0c23636f072a	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55cc-62e8-8e7d-e4918b6f9a69	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55cc-62e8-411e-8426a7fd5168	LR	LBR	430	Liberia 	Liberija	\N
00040000-55cc-62e8-471e-0ed5b4c39993	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55cc-62e8-bfa5-6e38fde42401	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55cc-62e8-8bc7-0934229ce0d2	LT	LTU	440	Lithuania 	Litva	\N
00040000-55cc-62e8-e793-88849927a1fc	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55cc-62e8-32cb-7d758ea859cf	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55cc-62e8-ddd7-afea32eac14e	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55cc-62e8-c25d-e650be0b9a9a	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55cc-62e8-77b9-56b10bb8524b	MW	MWI	454	Malawi 	Malavi	\N
00040000-55cc-62e8-3a93-6ddd698605c9	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55cc-62e8-ee7f-07e050777efb	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55cc-62e8-f472-c472b93ccfae	ML	MLI	466	Mali 	Mali	\N
00040000-55cc-62e8-8396-49b97ce4b49a	MT	MLT	470	Malta 	Malta	\N
00040000-55cc-62e8-3b55-f67b3f982738	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55cc-62e8-53ef-2ee2a385b7de	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55cc-62e8-e88e-b26759ce3111	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55cc-62e8-baad-ed89666e4280	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55cc-62e8-9c5f-b465356d3c61	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55cc-62e8-3d3f-55f39b895f67	MX	MEX	484	Mexico 	Mehika	\N
00040000-55cc-62e8-4c19-fad91f7b869b	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55cc-62e8-e7e1-142b9fe4ffba	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55cc-62e8-f473-7cc28e166662	MC	MCO	492	Monaco 	Monako	\N
00040000-55cc-62e8-9d21-4116a679d341	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55cc-62e8-db00-f8ad99595c93	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55cc-62e8-1286-358ddb53b308	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55cc-62e8-01fd-153bcdb4cc5a	MA	MAR	504	Morocco 	Maroko	\N
00040000-55cc-62e8-65cb-882f0bf24fb8	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55cc-62e8-64d0-7896f0f61967	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55cc-62e8-82f7-174afbf67ab9	NA	NAM	516	Namibia 	Namibija	\N
00040000-55cc-62e8-df9d-2f06803d9caa	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55cc-62e8-9c0a-dd39272838c7	NP	NPL	524	Nepal 	Nepal	\N
00040000-55cc-62e8-5a33-0bfa434264d6	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55cc-62e8-72f5-6a78f845623c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55cc-62e8-065f-24ec7b597c62	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55cc-62e8-110c-47dcbbae35ac	NE	NER	562	Niger 	Niger 	\N
00040000-55cc-62e8-84c1-34750ade6d7d	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55cc-62e8-b685-778487ea1356	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55cc-62e8-bf32-b6417fb14faf	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55cc-62e8-53fd-d54f98006f08	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55cc-62e8-47c5-3a4dbe895f7b	NO	NOR	578	Norway 	Norveška	\N
00040000-55cc-62e8-58f1-44a0a19ec5ce	OM	OMN	512	Oman 	Oman	\N
00040000-55cc-62e8-5cc3-e6c99c0b7091	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55cc-62e8-9d06-f37023d6afbe	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55cc-62e8-9a8e-7e033910a814	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55cc-62e8-b794-21911d6492fb	PA	PAN	591	Panama 	Panama	\N
00040000-55cc-62e8-64fb-eae15f6b59e6	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55cc-62e8-7b81-d5ba32b76b25	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55cc-62e8-87ac-7c8ebab8b978	PE	PER	604	Peru 	Peru	\N
00040000-55cc-62e8-afa6-5456b4744a6d	PH	PHL	608	Philippines 	Filipini	\N
00040000-55cc-62e8-4e83-f8b9026b7f1f	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55cc-62e8-8933-7f4092988ccd	PL	POL	616	Poland 	Poljska	\N
00040000-55cc-62e8-1321-3b6ce6077b9e	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55cc-62e8-5ff3-d64e7b6c493a	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55cc-62e8-53fe-7dc102d3e41c	QA	QAT	634	Qatar 	Katar	\N
00040000-55cc-62e8-d2d0-d514604e7f43	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55cc-62e8-1d3d-a223f1d6174f	RO	ROU	642	Romania 	Romunija	\N
00040000-55cc-62e8-453a-ba7ee518af83	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55cc-62e8-927a-93939aa61a9a	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55cc-62e8-55be-8416717f6b6b	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55cc-62e8-4231-b53fc9eeb1ff	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55cc-62e8-6075-64c8acc6e09d	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55cc-62e8-cd04-a43210509707	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55cc-62e8-c455-68afeb9b670e	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55cc-62e8-50a5-3cadcbb965cf	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55cc-62e8-a6a0-1085c853bf12	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55cc-62e8-3d26-bb62bb98daa2	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55cc-62e8-ed92-c97e4913a7ce	SM	SMR	674	San Marino 	San Marino	\N
00040000-55cc-62e8-55ea-e73804232693	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55cc-62e8-b315-fc43bb52cb69	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55cc-62e8-bf61-d71f400e0e42	SN	SEN	686	Senegal 	Senegal	\N
00040000-55cc-62e8-8d45-5acc169fa1e7	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55cc-62e8-eaf4-226b7960e995	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55cc-62e8-802c-6acae3b48061	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55cc-62e8-df49-03ac6912d409	SG	SGP	702	Singapore 	Singapur	\N
00040000-55cc-62e8-1cec-a1d94838c2d0	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55cc-62e8-7c6e-c2f90fe845b1	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55cc-62e8-94cb-0b1e6382c78c	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55cc-62e8-15f6-2aa5ef77f8bb	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55cc-62e8-444d-05a34dfa372b	SO	SOM	706	Somalia 	Somalija	\N
00040000-55cc-62e8-2fb4-c6833150716a	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55cc-62e8-a863-01599f9d03e1	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55cc-62e8-9d8f-cf49b0220670	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55cc-62e8-678d-9faebfa0d509	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55cc-62e8-b690-b1b1e7e05457	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55cc-62e8-fe65-fd690775cd6b	SD	SDN	729	Sudan 	Sudan	\N
00040000-55cc-62e8-4217-5ae304085218	SR	SUR	740	Suriname 	Surinam	\N
00040000-55cc-62e8-0227-26387af3aec9	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55cc-62e8-8477-25aab4147dbf	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55cc-62e8-7884-ec5837a26ae7	SE	SWE	752	Sweden 	Švedska	\N
00040000-55cc-62e8-d08d-4397592304ff	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55cc-62e8-0bdb-cba6882d58b3	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55cc-62e8-0ebd-b593a0ad6b86	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55cc-62e8-5aea-6d0fe7aeaa26	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55cc-62e8-71de-159997f59ad1	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55cc-62e8-a0d6-734fed2dcc37	TH	THA	764	Thailand 	Tajska	\N
00040000-55cc-62e8-a42e-5885661e4437	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55cc-62e8-c65f-ff36d1179fd0	TG	TGO	768	Togo 	Togo	\N
00040000-55cc-62e8-59b0-3b0ac087f00f	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55cc-62e8-cb84-daa2e9569414	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55cc-62e8-8cc8-47641bc5f585	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55cc-62e8-bed4-407101b70c65	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55cc-62e8-4c6b-036f8a0e8390	TR	TUR	792	Turkey 	Turčija	\N
00040000-55cc-62e8-e265-c550e0668d1c	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55cc-62e8-9be9-7c97ed9ac72e	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55cc-62e8-f369-c8c84373c238	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55cc-62e8-d96f-2eda12fa5ec4	UG	UGA	800	Uganda 	Uganda	\N
00040000-55cc-62e8-92f9-d37c718e1b9e	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55cc-62e8-6da6-9b1ba8b4689a	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55cc-62e8-6456-474ed81ca5cf	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55cc-62e8-e8a4-157b4ff89d9e	US	USA	840	United States 	Združene države Amerike	\N
00040000-55cc-62e8-4c77-0fd1c1b5ac10	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55cc-62e8-4d01-c5f4c00594c7	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55cc-62e8-04e7-824dbd8022d5	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55cc-62e8-d584-e3d8f7e6018c	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55cc-62e8-208e-f5113e75a6ea	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55cc-62e8-583a-df16eb78865b	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55cc-62e8-b9a6-e18083d4e080	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55cc-62e8-0e9f-560fc0d1c398	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55cc-62e8-353e-8be684c11aa3	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55cc-62e8-a6f8-dd8d92dda7f4	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55cc-62e8-1956-bcba04bed8b0	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55cc-62e8-71e2-09a7de6b039e	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55cc-62e8-aaf4-ef489a3b4f4c	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2937 (class 0 OID 13426083)
-- Dependencies: 223
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55cc-62ea-d4af-c364120f2187	000e0000-55cc-62ea-6456-76a13368ada3	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55cc-62e9-fe74-1081cd71a1c7	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55cc-62ea-1306-a78d0c0738a0	000e0000-55cc-62ea-0c7d-d0906ebf49b6	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55cc-62e9-655b-3a70e8e99d1f	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55cc-62ea-bf18-13e6a769bfbe	000e0000-55cc-62ea-b844-a9154b8ffb5c	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55cc-62e9-fe74-1081cd71a1c7	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55cc-62ea-8b88-8c4793fd0778	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55cc-62ea-2760-3401f01c63c8	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2924 (class 0 OID 13425910)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55cc-62ea-d43b-429494a3e4f6	000e0000-55cc-62ea-0c7d-d0906ebf49b6	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55cc-62e9-88db-5fdb1538c031
000d0000-55cc-62ea-b565-ffbe76634ef2	000e0000-55cc-62ea-0c7d-d0906ebf49b6	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55cc-62e9-88db-5fdb1538c031
000d0000-55cc-62ea-439f-c9896350cf0d	000e0000-55cc-62ea-0c7d-d0906ebf49b6	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55cc-62e9-96f4-349d9964da04
000d0000-55cc-62ea-ff47-66b697a00686	000e0000-55cc-62ea-0c7d-d0906ebf49b6	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55cc-62e9-e2f4-c8a651f6dae2
000d0000-55cc-62ea-e6ea-766a047fdb41	000e0000-55cc-62ea-0c7d-d0906ebf49b6	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55cc-62e9-bc73-4894d0005f0d
000d0000-55cc-62ea-fe82-c710771b1b24	000e0000-55cc-62ea-0c7d-d0906ebf49b6	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55cc-62e9-ba18-304196350062
000d0000-55cc-62ea-aed7-2f2efe8a0802	000e0000-55cc-62ea-0c7d-d0906ebf49b6	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55cc-62e9-88db-5fdb1538c031
000d0000-55cc-62ea-502e-6ae4ad832c67	000e0000-55cc-62ea-0c7d-d0906ebf49b6	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55cc-62e9-a719-a9a4adc703d1
\.


--
-- TOC entry 2903 (class 0 OID 13425726)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 13425774)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 13425706)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55cc-62ea-15f9-0bd2918a6d4b	00080000-55cc-62e9-f547-6027e2c71b7b	00090000-55cc-62ea-561a-7ce34e4b4838	AK		
\.


--
-- TOC entry 2913 (class 0 OID 13425827)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 13426294)
-- Dependencies: 236
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 13426306)
-- Dependencies: 237
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 13426329)
-- Dependencies: 239
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2917 (class 0 OID 13425852)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 13425663)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55cc-62e8-36db-fc734075a772	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55cc-62e8-88a4-2e09c1cad46c	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55cc-62e8-5f02-9538e649d7e3	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55cc-62e8-d09f-08c869631a2b	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55cc-62e8-3000-780404c2de76	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55cc-62e8-f197-fd0ad489c383	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55cc-62e8-ab50-7a1b3db1b48b	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55cc-62e8-de66-ef6535826bc9	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55cc-62e8-de62-39c064eaf40f	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55cc-62e8-6e10-82ca8571b6ba	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55cc-62e8-5bab-ad8d0106f4cf	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55cc-62e8-f0b0-5070507b333f	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55cc-62e8-202e-cfea2e1549e8	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55cc-62e8-ddd9-7b4704952fbc	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55cc-62e9-ba83-b17d1e4e2110	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55cc-62e9-9c11-cd6a209e8c28	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55cc-62e9-1f42-184730681633	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55cc-62e9-14c1-1afb6b1fe215	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55cc-62e9-c8eb-554a632932e4	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55cc-62e9-53d5-1f84968dce51	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2892 (class 0 OID 13425576)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55cc-62e9-fe0f-930c87cbfd92	00000000-55cc-62e9-9c11-cd6a209e8c28	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55cc-62e9-c831-603fb6944a40	00000000-55cc-62e9-9c11-cd6a209e8c28	00010000-55cc-62e8-41d5-a942cbf14f2c	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55cc-62e9-3e53-55d1202b99eb	00000000-55cc-62e9-1f42-184730681633	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2893 (class 0 OID 13425587)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55cc-62ea-fdc7-090f32aff563	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55cc-62ea-aeb8-338b3396d25c	00010000-55cc-62e9-792d-c116675e26c7	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55cc-62ea-823a-1af5e5358a3b	00010000-55cc-62e9-3769-20f83f2a2ba1	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55cc-62ea-6463-ba04bf4f72a1	00010000-55cc-62ea-c6df-8e8adfeaa8be	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55cc-62ea-934a-035be0c7a077	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55cc-62ea-e259-11a0ffea6cff	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55cc-62ea-acfa-705004da9c82	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55cc-62ea-986d-917be5f622a3	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55cc-62ea-561a-7ce34e4b4838	00010000-55cc-62e9-45b5-c41073df29cc	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55cc-62ea-fe08-b9f0745870f3	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55cc-62ea-b857-3aa4e4e48412	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55cc-62ea-cacf-8d1b3d8207ae	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55cc-62ea-0bdd-94f648524ee7	00010000-55cc-62e9-373a-46a1ad620910	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2888 (class 0 OID 13425541)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55cc-62e8-3079-9f6f0088745c	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55cc-62e8-ae62-01a1636ce0a7	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55cc-62e8-ae6e-906ddb564bfb	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55cc-62e8-b736-78b0fa4cd3b6	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55cc-62e8-ee35-9a6968b38f2d	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55cc-62e8-fbb0-aeae0f1b6a4e	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55cc-62e8-4d91-a444e31a3ecd	Abonma-read	Abonma - branje	f
00030000-55cc-62e8-9394-c247e2318dfa	Abonma-write	Abonma - spreminjanje	f
00030000-55cc-62e8-1316-bd63303027d2	Alternacija-read	Alternacija - branje	f
00030000-55cc-62e8-a72a-b7d442771967	Alternacija-write	Alternacija - spreminjanje	f
00030000-55cc-62e8-8da2-ede7f1941dce	Arhivalija-read	Arhivalija - branje	f
00030000-55cc-62e8-08ed-35c92f59d1a2	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55cc-62e8-0640-3ee02c3d18f9	Besedilo-read	Besedilo - branje	f
00030000-55cc-62e8-feda-ddf7cb092c4c	Besedilo-write	Besedilo - spreminjanje	f
00030000-55cc-62e8-8e52-ec1c7574758e	DogodekIzven-read	DogodekIzven - branje	f
00030000-55cc-62e8-2cd8-5a8d1fa0fadb	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55cc-62e8-6d8b-e5556471db82	Dogodek-read	Dogodek - branje	f
00030000-55cc-62e8-ed49-7bdfbc2b5841	Dogodek-write	Dogodek - spreminjanje	f
00030000-55cc-62e8-007c-931dc2d7c8b1	DrugiVir-read	DrugiVir - branje	f
00030000-55cc-62e8-e66b-89e9db0b6d8b	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55cc-62e8-fec4-2b92e0de784e	Drzava-read	Drzava - branje	f
00030000-55cc-62e8-e4b4-540adf45e1d6	Drzava-write	Drzava - spreminjanje	f
00030000-55cc-62e8-3e61-6e75ace49963	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55cc-62e8-5be9-cb746a1b6244	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55cc-62e8-6589-38e6d2e4435f	Funkcija-read	Funkcija - branje	f
00030000-55cc-62e8-b33e-a209bf0dd6fc	Funkcija-write	Funkcija - spreminjanje	f
00030000-55cc-62e8-4202-09a2fdd05878	Gostovanje-read	Gostovanje - branje	f
00030000-55cc-62e8-91d9-069966281800	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55cc-62e8-d7d9-a246176871f6	Gostujoca-read	Gostujoca - branje	f
00030000-55cc-62e8-d51a-052e3176916e	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55cc-62e8-2a72-4cca485b348d	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55cc-62e8-d458-dec3328a8425	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55cc-62e8-2873-7299f64f77d7	Kupec-read	Kupec - branje	f
00030000-55cc-62e8-e9c6-34b456e65a85	Kupec-write	Kupec - spreminjanje	f
00030000-55cc-62e8-4bfb-f774ec6f8edc	NacinPlacina-read	NacinPlacina - branje	f
00030000-55cc-62e8-fb1f-827c899b4912	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55cc-62e8-a9da-f72b04d6cab2	Option-read	Option - branje	f
00030000-55cc-62e8-44d6-fd9dd02128e5	Option-write	Option - spreminjanje	f
00030000-55cc-62e8-0b86-7132ba424f06	OptionValue-read	OptionValue - branje	f
00030000-55cc-62e8-8370-4e00f7718da6	OptionValue-write	OptionValue - spreminjanje	f
00030000-55cc-62e8-4682-cd14f9449649	Oseba-read	Oseba - branje	f
00030000-55cc-62e8-fb96-0c2adce2837f	Oseba-write	Oseba - spreminjanje	f
00030000-55cc-62e8-6f1e-6477a9f18440	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55cc-62e8-7bb7-b59338f40b56	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55cc-62e8-dc25-30dc985cc489	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55cc-62e8-d0bb-281901fc6187	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55cc-62e8-a438-012a516f7c5a	Pogodba-read	Pogodba - branje	f
00030000-55cc-62e8-b23c-837da005cafd	Pogodba-write	Pogodba - spreminjanje	f
00030000-55cc-62e8-f64e-4304ae8ce8e2	Popa-read	Popa - branje	f
00030000-55cc-62e8-d3fb-a5007e2fee01	Popa-write	Popa - spreminjanje	f
00030000-55cc-62e8-bdd7-6e84ec3c080d	Posta-read	Posta - branje	f
00030000-55cc-62e8-2bb3-159a8726996d	Posta-write	Posta - spreminjanje	f
00030000-55cc-62e8-b99a-c94184c437bd	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55cc-62e8-8f5b-8df29acc1979	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55cc-62e8-d9f3-89a4e50618a5	PostniNaslov-read	PostniNaslov - branje	f
00030000-55cc-62e8-3da4-ed10ffc87d99	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55cc-62e8-ae00-88371c6fc9e2	Predstava-read	Predstava - branje	f
00030000-55cc-62e8-f321-4e007f3fd1e4	Predstava-write	Predstava - spreminjanje	f
00030000-55cc-62e8-ee81-ca6e6b634b25	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55cc-62e8-13ec-867ca8c5f59d	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55cc-62e8-611a-7730d478cefb	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55cc-62e8-bfc4-e3ffe587e201	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55cc-62e8-b739-117a4c5792ab	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55cc-62e8-7144-2ec605a2f716	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55cc-62e8-16b3-73b3c3fb7e8c	ProgramDela-read	ProgramDela - branje	f
00030000-55cc-62e8-9182-2b45cc05001e	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55cc-62e8-0a7b-bfffab6f3dd9	ProgramFestival-read	ProgramFestival - branje	f
00030000-55cc-62e8-c228-e82bcb40c5af	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55cc-62e8-c2a8-d4bd6b7c0046	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55cc-62e8-6d8a-6e30ed74d606	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55cc-62e8-d07f-12b869198894	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55cc-62e8-73f3-daaad42ca282	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55cc-62e8-cb49-52c980c3e872	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55cc-62e8-5f1c-33cb141e9dc4	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55cc-62e8-5384-8d51fae7ad68	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55cc-62e8-7929-0116529b72a3	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55cc-62e8-0f18-d2ca7a115343	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55cc-62e8-5608-3cd9748c84dd	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55cc-62e8-0f56-9833e1e69631	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55cc-62e8-3f69-0dd276c7249d	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55cc-62e8-1371-68eca93bc441	ProgramRazno-read	ProgramRazno - branje	f
00030000-55cc-62e8-1238-53b97a3b469e	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55cc-62e8-158c-6e195a9b6460	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55cc-62e8-6a82-fc31771e6f76	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55cc-62e8-d97d-7019e0d45f24	Prostor-read	Prostor - branje	f
00030000-55cc-62e8-3a72-82082ae6455b	Prostor-write	Prostor - spreminjanje	f
00030000-55cc-62e8-933d-16aee5a9ec4f	Racun-read	Racun - branje	f
00030000-55cc-62e8-5981-ea1fbc9fa268	Racun-write	Racun - spreminjanje	f
00030000-55cc-62e8-1f43-bc6717ce16f5	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55cc-62e8-ce04-ad05b43ee846	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55cc-62e8-b418-0ac6b8bc088a	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55cc-62e8-34bb-28c1edd3d7d1	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55cc-62e8-1689-8ac36764af55	Rekvizit-read	Rekvizit - branje	f
00030000-55cc-62e8-54a1-b1cacfe39106	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55cc-62e8-d6f0-ddd6a9b1c522	Revizija-read	Revizija - branje	f
00030000-55cc-62e8-f77f-2e44676c579a	Revizija-write	Revizija - spreminjanje	f
00030000-55cc-62e8-221e-4b8c5f019da8	Rezervacija-read	Rezervacija - branje	f
00030000-55cc-62e8-786e-7d8072a180b9	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55cc-62e8-8516-f8d42c2458a0	SedezniRed-read	SedezniRed - branje	f
00030000-55cc-62e8-ea3d-25d07e3af767	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55cc-62e8-9ac3-ea55c2f7d541	Sedez-read	Sedez - branje	f
00030000-55cc-62e8-dc0b-b8f26e2c8d05	Sedez-write	Sedez - spreminjanje	f
00030000-55cc-62e8-28d6-a9a33f64c93c	Sezona-read	Sezona - branje	f
00030000-55cc-62e8-1024-b83581b97a40	Sezona-write	Sezona - spreminjanje	f
00030000-55cc-62e8-c709-1e85f2436614	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55cc-62e8-9ade-be699e7b8b76	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55cc-62e8-32fe-f9ead92a8f44	Stevilcenje-read	Stevilcenje - branje	f
00030000-55cc-62e8-0a10-7dea05698ee5	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55cc-62e8-f86f-2a310158e518	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55cc-62e8-ee31-6cb42e5dcc20	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55cc-62e8-b3d0-5002466f8b4a	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55cc-62e8-b809-52baebc3d151	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55cc-62e8-5ed1-211cbde2d10f	Telefonska-read	Telefonska - branje	f
00030000-55cc-62e8-509f-ac0ec0200363	Telefonska-write	Telefonska - spreminjanje	f
00030000-55cc-62e8-849e-a337d223456b	TerminStoritve-read	TerminStoritve - branje	f
00030000-55cc-62e8-8f6a-0bf1741868eb	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55cc-62e8-7cee-4ff8f79d6fac	TipFunkcije-read	TipFunkcije - branje	f
00030000-55cc-62e8-e359-5b596db99b10	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55cc-62e8-9897-01efa7cf2bcf	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55cc-62e8-889a-5f4e4bbf1323	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55cc-62e8-6219-aec2bbbae70a	Trr-read	Trr - branje	f
00030000-55cc-62e8-384f-b8736219a6d9	Trr-write	Trr - spreminjanje	f
00030000-55cc-62e8-ccad-f12f88f08d68	Uprizoritev-read	Uprizoritev - branje	f
00030000-55cc-62e8-e840-0a2a57626709	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55cc-62e8-f056-0b25ce9e977c	Vaja-read	Vaja - branje	f
00030000-55cc-62e8-9a73-907764d689c8	Vaja-write	Vaja - spreminjanje	f
00030000-55cc-62e8-1494-b620faf585ce	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55cc-62e8-8b0b-d0e38d77d371	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55cc-62e8-4aa6-75219d94ab51	Zaposlitev-read	Zaposlitev - branje	f
00030000-55cc-62e8-79aa-2338dcfcc6bb	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55cc-62e8-504d-08a355922384	Zasedenost-read	Zasedenost - branje	f
00030000-55cc-62e8-e59a-82e8b8b5ae3c	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55cc-62e8-c78d-78e59623b2f5	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55cc-62e8-4012-d181b83ccf10	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55cc-62e8-57ce-b3212db730f2	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55cc-62e8-0b22-d6e583a6c24a	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55cc-62e8-99c1-f9d9754c68c6	ClSkupina-write	Checkliste - urejanje skupin	f
00030000-55cc-62e8-a1ff-77466271452e	ClSkupina-read	Checkliste - branje skupin	f
00030000-55cc-62e8-387f-6a922edc9fa3	ClSekcija-write	Checkliste - urejanje sekcij	f
00030000-55cc-62e8-3575-1d8a4b74b2c8	ClSekcija-read	Checkliste - branje sekcij	f
00030000-55cc-62e8-2359-b8a128c7f955	ClVzorec-write	Checkliste - urejanje glave chekcliste	f
00030000-55cc-62e8-373b-b0ef01c4f2ba	ClVzorec-read	Checkliste - branje checkliste	f
00030000-55cc-62e8-ea6a-465ad4b624f6	ClVzorecPostavka-write	Checkliste - urejanje postavke chekcliste	f
00030000-55cc-62e8-17c1-2d9167ce7da5	ClVzorecPostavka-read	Checkliste - branje postavke checkliste	f
00030000-55cc-62e8-a003-cdcf4a7442bc	ClPregled-write	Checkliste - Razpis checklist  - generično dovoljenje	f
00030000-55cc-62e8-bdbc-f41649dec26f	ClPregled-read	Checkliste - branje izpolnjenih checklist - generično dovoljenje	f
00030000-55cc-62e8-aab0-063287cb41fc	ClVrednost-write	Checkliste - izpolnjevanje checklist - generični permission	f
00030000-55cc-62e8-3ed7-fe9aa604881a	ClVrednost-read	Checkliste - branje vrednosti checkliste - generični permission	f
\.


--
-- TOC entry 2890 (class 0 OID 13425560)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55cc-62e8-1d15-8949c887c55b	00030000-55cc-62e8-ae62-01a1636ce0a7
00020000-55cc-62e8-176c-385926ec26dc	00030000-55cc-62e8-fec4-2b92e0de784e
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-4d91-a444e31a3ecd
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-9394-c247e2318dfa
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-1316-bd63303027d2
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-a72a-b7d442771967
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-8da2-ede7f1941dce
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-6d8b-e5556471db82
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-b736-78b0fa4cd3b6
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-ed49-7bdfbc2b5841
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-fec4-2b92e0de784e
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-e4b4-540adf45e1d6
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-6589-38e6d2e4435f
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-b33e-a209bf0dd6fc
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-4202-09a2fdd05878
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-91d9-069966281800
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-d7d9-a246176871f6
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-d51a-052e3176916e
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-2a72-4cca485b348d
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-d458-dec3328a8425
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-a9da-f72b04d6cab2
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-0b86-7132ba424f06
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-4682-cd14f9449649
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-fb96-0c2adce2837f
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-f64e-4304ae8ce8e2
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-d3fb-a5007e2fee01
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-bdd7-6e84ec3c080d
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-2bb3-159a8726996d
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-d9f3-89a4e50618a5
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-3da4-ed10ffc87d99
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-ae00-88371c6fc9e2
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-f321-4e007f3fd1e4
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-b739-117a4c5792ab
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-7144-2ec605a2f716
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-d97d-7019e0d45f24
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-3a72-82082ae6455b
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-b418-0ac6b8bc088a
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-34bb-28c1edd3d7d1
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-1689-8ac36764af55
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-54a1-b1cacfe39106
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-28d6-a9a33f64c93c
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-1024-b83581b97a40
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-7cee-4ff8f79d6fac
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-ccad-f12f88f08d68
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-e840-0a2a57626709
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-f056-0b25ce9e977c
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-9a73-907764d689c8
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-504d-08a355922384
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-e59a-82e8b8b5ae3c
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-c78d-78e59623b2f5
00020000-55cc-62e8-5236-c7fa5c4d98e5	00030000-55cc-62e8-57ce-b3212db730f2
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-4d91-a444e31a3ecd
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-8da2-ede7f1941dce
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-6d8b-e5556471db82
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-fec4-2b92e0de784e
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-4202-09a2fdd05878
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-d7d9-a246176871f6
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-2a72-4cca485b348d
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-d458-dec3328a8425
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-a9da-f72b04d6cab2
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-0b86-7132ba424f06
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-4682-cd14f9449649
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-fb96-0c2adce2837f
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-f64e-4304ae8ce8e2
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-bdd7-6e84ec3c080d
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-d9f3-89a4e50618a5
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-3da4-ed10ffc87d99
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-ae00-88371c6fc9e2
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-d97d-7019e0d45f24
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-b418-0ac6b8bc088a
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-1689-8ac36764af55
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-28d6-a9a33f64c93c
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-5ed1-211cbde2d10f
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-509f-ac0ec0200363
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-6219-aec2bbbae70a
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-384f-b8736219a6d9
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-4aa6-75219d94ab51
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-79aa-2338dcfcc6bb
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-c78d-78e59623b2f5
00020000-55cc-62e8-914e-3efaa96dba22	00030000-55cc-62e8-57ce-b3212db730f2
00020000-55cc-62e8-fb4a-bdb4d48035b8	00030000-55cc-62e8-4d91-a444e31a3ecd
00020000-55cc-62e8-fb4a-bdb4d48035b8	00030000-55cc-62e8-1316-bd63303027d2
00020000-55cc-62e8-fb4a-bdb4d48035b8	00030000-55cc-62e8-8da2-ede7f1941dce
00020000-55cc-62e8-fb4a-bdb4d48035b8	00030000-55cc-62e8-08ed-35c92f59d1a2
00020000-55cc-62e8-fb4a-bdb4d48035b8	00030000-55cc-62e8-0640-3ee02c3d18f9
00020000-55cc-62e8-fb4a-bdb4d48035b8	00030000-55cc-62e8-8e52-ec1c7574758e
00020000-55cc-62e8-fb4a-bdb4d48035b8	00030000-55cc-62e8-6d8b-e5556471db82
00020000-55cc-62e8-fb4a-bdb4d48035b8	00030000-55cc-62e8-fec4-2b92e0de784e
00020000-55cc-62e8-fb4a-bdb4d48035b8	00030000-55cc-62e8-6589-38e6d2e4435f
00020000-55cc-62e8-fb4a-bdb4d48035b8	00030000-55cc-62e8-4202-09a2fdd05878
00020000-55cc-62e8-fb4a-bdb4d48035b8	00030000-55cc-62e8-d7d9-a246176871f6
00020000-55cc-62e8-fb4a-bdb4d48035b8	00030000-55cc-62e8-2a72-4cca485b348d
00020000-55cc-62e8-fb4a-bdb4d48035b8	00030000-55cc-62e8-a9da-f72b04d6cab2
00020000-55cc-62e8-fb4a-bdb4d48035b8	00030000-55cc-62e8-0b86-7132ba424f06
00020000-55cc-62e8-fb4a-bdb4d48035b8	00030000-55cc-62e8-4682-cd14f9449649
00020000-55cc-62e8-fb4a-bdb4d48035b8	00030000-55cc-62e8-f64e-4304ae8ce8e2
00020000-55cc-62e8-fb4a-bdb4d48035b8	00030000-55cc-62e8-bdd7-6e84ec3c080d
00020000-55cc-62e8-fb4a-bdb4d48035b8	00030000-55cc-62e8-ae00-88371c6fc9e2
00020000-55cc-62e8-fb4a-bdb4d48035b8	00030000-55cc-62e8-b739-117a4c5792ab
00020000-55cc-62e8-fb4a-bdb4d48035b8	00030000-55cc-62e8-d97d-7019e0d45f24
00020000-55cc-62e8-fb4a-bdb4d48035b8	00030000-55cc-62e8-b418-0ac6b8bc088a
00020000-55cc-62e8-fb4a-bdb4d48035b8	00030000-55cc-62e8-1689-8ac36764af55
00020000-55cc-62e8-fb4a-bdb4d48035b8	00030000-55cc-62e8-28d6-a9a33f64c93c
00020000-55cc-62e8-fb4a-bdb4d48035b8	00030000-55cc-62e8-7cee-4ff8f79d6fac
00020000-55cc-62e8-fb4a-bdb4d48035b8	00030000-55cc-62e8-f056-0b25ce9e977c
00020000-55cc-62e8-fb4a-bdb4d48035b8	00030000-55cc-62e8-504d-08a355922384
00020000-55cc-62e8-fb4a-bdb4d48035b8	00030000-55cc-62e8-c78d-78e59623b2f5
00020000-55cc-62e8-fb4a-bdb4d48035b8	00030000-55cc-62e8-57ce-b3212db730f2
00020000-55cc-62e8-f7ec-0ce19f37991e	00030000-55cc-62e8-4d91-a444e31a3ecd
00020000-55cc-62e8-f7ec-0ce19f37991e	00030000-55cc-62e8-9394-c247e2318dfa
00020000-55cc-62e8-f7ec-0ce19f37991e	00030000-55cc-62e8-a72a-b7d442771967
00020000-55cc-62e8-f7ec-0ce19f37991e	00030000-55cc-62e8-8da2-ede7f1941dce
00020000-55cc-62e8-f7ec-0ce19f37991e	00030000-55cc-62e8-6d8b-e5556471db82
00020000-55cc-62e8-f7ec-0ce19f37991e	00030000-55cc-62e8-fec4-2b92e0de784e
00020000-55cc-62e8-f7ec-0ce19f37991e	00030000-55cc-62e8-4202-09a2fdd05878
00020000-55cc-62e8-f7ec-0ce19f37991e	00030000-55cc-62e8-d7d9-a246176871f6
00020000-55cc-62e8-f7ec-0ce19f37991e	00030000-55cc-62e8-a9da-f72b04d6cab2
00020000-55cc-62e8-f7ec-0ce19f37991e	00030000-55cc-62e8-0b86-7132ba424f06
00020000-55cc-62e8-f7ec-0ce19f37991e	00030000-55cc-62e8-f64e-4304ae8ce8e2
00020000-55cc-62e8-f7ec-0ce19f37991e	00030000-55cc-62e8-bdd7-6e84ec3c080d
00020000-55cc-62e8-f7ec-0ce19f37991e	00030000-55cc-62e8-ae00-88371c6fc9e2
00020000-55cc-62e8-f7ec-0ce19f37991e	00030000-55cc-62e8-d97d-7019e0d45f24
00020000-55cc-62e8-f7ec-0ce19f37991e	00030000-55cc-62e8-b418-0ac6b8bc088a
00020000-55cc-62e8-f7ec-0ce19f37991e	00030000-55cc-62e8-1689-8ac36764af55
00020000-55cc-62e8-f7ec-0ce19f37991e	00030000-55cc-62e8-28d6-a9a33f64c93c
00020000-55cc-62e8-f7ec-0ce19f37991e	00030000-55cc-62e8-7cee-4ff8f79d6fac
00020000-55cc-62e8-f7ec-0ce19f37991e	00030000-55cc-62e8-c78d-78e59623b2f5
00020000-55cc-62e8-f7ec-0ce19f37991e	00030000-55cc-62e8-57ce-b3212db730f2
00020000-55cc-62e8-c259-4c8c34375f42	00030000-55cc-62e8-4d91-a444e31a3ecd
00020000-55cc-62e8-c259-4c8c34375f42	00030000-55cc-62e8-8da2-ede7f1941dce
00020000-55cc-62e8-c259-4c8c34375f42	00030000-55cc-62e8-6d8b-e5556471db82
00020000-55cc-62e8-c259-4c8c34375f42	00030000-55cc-62e8-fec4-2b92e0de784e
00020000-55cc-62e8-c259-4c8c34375f42	00030000-55cc-62e8-4202-09a2fdd05878
00020000-55cc-62e8-c259-4c8c34375f42	00030000-55cc-62e8-d7d9-a246176871f6
00020000-55cc-62e8-c259-4c8c34375f42	00030000-55cc-62e8-a9da-f72b04d6cab2
00020000-55cc-62e8-c259-4c8c34375f42	00030000-55cc-62e8-0b86-7132ba424f06
00020000-55cc-62e8-c259-4c8c34375f42	00030000-55cc-62e8-f64e-4304ae8ce8e2
00020000-55cc-62e8-c259-4c8c34375f42	00030000-55cc-62e8-bdd7-6e84ec3c080d
00020000-55cc-62e8-c259-4c8c34375f42	00030000-55cc-62e8-ae00-88371c6fc9e2
00020000-55cc-62e8-c259-4c8c34375f42	00030000-55cc-62e8-d97d-7019e0d45f24
00020000-55cc-62e8-c259-4c8c34375f42	00030000-55cc-62e8-b418-0ac6b8bc088a
00020000-55cc-62e8-c259-4c8c34375f42	00030000-55cc-62e8-1689-8ac36764af55
00020000-55cc-62e8-c259-4c8c34375f42	00030000-55cc-62e8-28d6-a9a33f64c93c
00020000-55cc-62e8-c259-4c8c34375f42	00030000-55cc-62e8-849e-a337d223456b
00020000-55cc-62e8-c259-4c8c34375f42	00030000-55cc-62e8-ae6e-906ddb564bfb
00020000-55cc-62e8-c259-4c8c34375f42	00030000-55cc-62e8-7cee-4ff8f79d6fac
00020000-55cc-62e8-c259-4c8c34375f42	00030000-55cc-62e8-c78d-78e59623b2f5
00020000-55cc-62e8-c259-4c8c34375f42	00030000-55cc-62e8-57ce-b3212db730f2
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-3079-9f6f0088745c
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-ae62-01a1636ce0a7
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-ae6e-906ddb564bfb
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-b736-78b0fa4cd3b6
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-ee35-9a6968b38f2d
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-fbb0-aeae0f1b6a4e
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-4d91-a444e31a3ecd
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-9394-c247e2318dfa
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-1316-bd63303027d2
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-a72a-b7d442771967
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-8da2-ede7f1941dce
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-08ed-35c92f59d1a2
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-0640-3ee02c3d18f9
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-feda-ddf7cb092c4c
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-8e52-ec1c7574758e
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-2cd8-5a8d1fa0fadb
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-6d8b-e5556471db82
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-ed49-7bdfbc2b5841
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-fec4-2b92e0de784e
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-e4b4-540adf45e1d6
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-007c-931dc2d7c8b1
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-e66b-89e9db0b6d8b
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-3e61-6e75ace49963
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-5be9-cb746a1b6244
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-6589-38e6d2e4435f
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-b33e-a209bf0dd6fc
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-4202-09a2fdd05878
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-91d9-069966281800
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-d7d9-a246176871f6
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-d51a-052e3176916e
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-2a72-4cca485b348d
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-d458-dec3328a8425
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-2873-7299f64f77d7
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-e9c6-34b456e65a85
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-4bfb-f774ec6f8edc
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-fb1f-827c899b4912
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-a9da-f72b04d6cab2
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-44d6-fd9dd02128e5
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-0b86-7132ba424f06
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-8370-4e00f7718da6
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-4682-cd14f9449649
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-fb96-0c2adce2837f
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-6f1e-6477a9f18440
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-7bb7-b59338f40b56
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-dc25-30dc985cc489
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-d0bb-281901fc6187
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-a438-012a516f7c5a
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-b23c-837da005cafd
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-f64e-4304ae8ce8e2
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-d3fb-a5007e2fee01
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-bdd7-6e84ec3c080d
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-2bb3-159a8726996d
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-b99a-c94184c437bd
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-8f5b-8df29acc1979
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-d9f3-89a4e50618a5
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-3da4-ed10ffc87d99
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-ae00-88371c6fc9e2
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-f321-4e007f3fd1e4
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-ee81-ca6e6b634b25
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-13ec-867ca8c5f59d
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-611a-7730d478cefb
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-bfc4-e3ffe587e201
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-b739-117a4c5792ab
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-7144-2ec605a2f716
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-16b3-73b3c3fb7e8c
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-9182-2b45cc05001e
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-0a7b-bfffab6f3dd9
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-c228-e82bcb40c5af
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-c2a8-d4bd6b7c0046
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-6d8a-6e30ed74d606
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-d07f-12b869198894
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-73f3-daaad42ca282
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-cb49-52c980c3e872
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-5f1c-33cb141e9dc4
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-5384-8d51fae7ad68
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-7929-0116529b72a3
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-0f18-d2ca7a115343
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-5608-3cd9748c84dd
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-0f56-9833e1e69631
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-3f69-0dd276c7249d
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-1371-68eca93bc441
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-1238-53b97a3b469e
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-158c-6e195a9b6460
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-6a82-fc31771e6f76
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-d97d-7019e0d45f24
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-3a72-82082ae6455b
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-933d-16aee5a9ec4f
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-5981-ea1fbc9fa268
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-1f43-bc6717ce16f5
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-ce04-ad05b43ee846
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-b418-0ac6b8bc088a
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-34bb-28c1edd3d7d1
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-1689-8ac36764af55
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-54a1-b1cacfe39106
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-d6f0-ddd6a9b1c522
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-f77f-2e44676c579a
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-221e-4b8c5f019da8
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-786e-7d8072a180b9
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-8516-f8d42c2458a0
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-ea3d-25d07e3af767
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-9ac3-ea55c2f7d541
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-dc0b-b8f26e2c8d05
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-28d6-a9a33f64c93c
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-1024-b83581b97a40
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-c709-1e85f2436614
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-9ade-be699e7b8b76
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-32fe-f9ead92a8f44
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-0a10-7dea05698ee5
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-f86f-2a310158e518
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-ee31-6cb42e5dcc20
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-b3d0-5002466f8b4a
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-b809-52baebc3d151
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-5ed1-211cbde2d10f
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-509f-ac0ec0200363
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-849e-a337d223456b
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-8f6a-0bf1741868eb
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-7cee-4ff8f79d6fac
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-e359-5b596db99b10
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-9897-01efa7cf2bcf
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-889a-5f4e4bbf1323
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-6219-aec2bbbae70a
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-384f-b8736219a6d9
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-ccad-f12f88f08d68
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-e840-0a2a57626709
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-f056-0b25ce9e977c
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-9a73-907764d689c8
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-1494-b620faf585ce
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-8b0b-d0e38d77d371
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-4aa6-75219d94ab51
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-79aa-2338dcfcc6bb
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-504d-08a355922384
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-e59a-82e8b8b5ae3c
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-c78d-78e59623b2f5
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-4012-d181b83ccf10
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-57ce-b3212db730f2
00020000-55cc-62e9-bc47-063200716e7e	00030000-55cc-62e8-0b22-d6e583a6c24a
\.


--
-- TOC entry 2918 (class 0 OID 13425859)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2922 (class 0 OID 13425890)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 13426004)
-- Dependencies: 218
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55cc-62ea-16d1-013a786fe6eb	00090000-55cc-62ea-fdc7-090f32aff563	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55cc-62ea-afe8-7781e95c8d37	00090000-55cc-62ea-e259-11a0ffea6cff	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55cc-62ea-2603-2dbd6872c9a1	00090000-55cc-62ea-0bdd-94f648524ee7	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2895 (class 0 OID 13425620)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55cc-62e9-f547-6027e2c71b7b	00040000-55cc-62e8-94cb-0b1e6382c78c	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55cc-62e9-82b8-44f3f4e9e827	00040000-55cc-62e8-94cb-0b1e6382c78c	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55cc-62e9-5593-65a2077454dc	00040000-55cc-62e8-94cb-0b1e6382c78c	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55cc-62e9-40a7-558c8846523c	00040000-55cc-62e8-94cb-0b1e6382c78c	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55cc-62e9-d41c-ee07b9bceac9	00040000-55cc-62e8-94cb-0b1e6382c78c	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55cc-62e9-e5c9-7a560cc2f7c7	00040000-55cc-62e8-1196-289f3ee9426c	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55cc-62e9-f1d6-f2fb2fad092f	00040000-55cc-62e8-ccee-e63542df2d8d	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55cc-62e9-418d-49062020b5dd	00040000-55cc-62e8-8af8-ab62c03f7c79	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55cc-62ea-60a7-c2cb773626e9	00040000-55cc-62e8-94cb-0b1e6382c78c	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2897 (class 0 OID 13425655)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55cc-62e8-7bee-fb7124c2b837	8341	Adlešiči
00050000-55cc-62e8-7f91-aaadfe4ec498	5270	Ajdovščina
00050000-55cc-62e8-c89b-296096e2c078	6280	Ankaran/Ancarano
00050000-55cc-62e8-f8b5-2d5b123bad71	9253	Apače
00050000-55cc-62e8-5bec-3be49b91ce79	8253	Artiče
00050000-55cc-62e8-2fb0-d8fbff7106e1	4275	Begunje na Gorenjskem
00050000-55cc-62e8-87f6-f384cf278b67	1382	Begunje pri Cerknici
00050000-55cc-62e8-ed80-2b1eb72a8f8c	9231	Beltinci
00050000-55cc-62e8-7606-c734e6518883	2234	Benedikt
00050000-55cc-62e8-8163-72059be1ebc2	2345	Bistrica ob Dravi
00050000-55cc-62e8-8c25-778b80bcdcc8	3256	Bistrica ob Sotli
00050000-55cc-62e8-d7ca-3c08c1f96ee5	8259	Bizeljsko
00050000-55cc-62e8-7c6b-b255cc77baf4	1223	Blagovica
00050000-55cc-62e8-e6d1-86e0fada5e4d	8283	Blanca
00050000-55cc-62e8-50f2-313d742a9831	4260	Bled
00050000-55cc-62e8-1dff-70f7d231e235	4273	Blejska Dobrava
00050000-55cc-62e8-81e0-c68caea1f078	9265	Bodonci
00050000-55cc-62e8-2b22-0c46818ed4a8	9222	Bogojina
00050000-55cc-62e8-0331-3089915a92a6	4263	Bohinjska Bela
00050000-55cc-62e8-04c2-57cf94ab5e66	4264	Bohinjska Bistrica
00050000-55cc-62e8-7d34-6eaac9020b9c	4265	Bohinjsko jezero
00050000-55cc-62e8-4c65-c30a9fec322d	1353	Borovnica
00050000-55cc-62e8-5a03-165a62b1dab9	8294	Boštanj
00050000-55cc-62e8-bf5e-b3408ff03137	5230	Bovec
00050000-55cc-62e8-ccfb-4d9abb0bb94b	5295	Branik
00050000-55cc-62e8-34b6-fc1512f35283	3314	Braslovče
00050000-55cc-62e8-7749-75bec98ff0c2	5223	Breginj
00050000-55cc-62e8-be42-eb58956d2d40	8280	Brestanica
00050000-55cc-62e8-61d5-56fc9414b0ac	2354	Bresternica
00050000-55cc-62e8-0da4-de33fabab0ad	4243	Brezje
00050000-55cc-62e8-439b-6edfb5602365	1351	Brezovica pri Ljubljani
00050000-55cc-62e8-62f8-f117e23a9a3d	8250	Brežice
00050000-55cc-62e8-db25-c7447ba146f6	4210	Brnik - Aerodrom
00050000-55cc-62e8-cc95-69175ebf1bc0	8321	Brusnice
00050000-55cc-62e8-3152-8a95976a0cd3	3255	Buče
00050000-55cc-62e8-b8d0-ca2c6f32d4c8	8276	Bučka 
00050000-55cc-62e8-c1aa-ec9ee63a4515	9261	Cankova
00050000-55cc-62e8-93ac-5a4fe5fcf244	3000	Celje 
00050000-55cc-62e8-03a3-36b5ea6af299	3001	Celje - poštni predali
00050000-55cc-62e8-f17b-6b30338f6889	4207	Cerklje na Gorenjskem
00050000-55cc-62e8-7766-4d90478b7f50	8263	Cerklje ob Krki
00050000-55cc-62e8-1aa3-a20e55eb5825	1380	Cerknica
00050000-55cc-62e8-e830-acc1a89a7373	5282	Cerkno
00050000-55cc-62e8-a837-1f84c9ff0011	2236	Cerkvenjak
00050000-55cc-62e8-9989-325b4b5db90d	2215	Ceršak
00050000-55cc-62e8-d8c8-82ecdcca71e8	2326	Cirkovce
00050000-55cc-62e8-0060-2d171a474982	2282	Cirkulane
00050000-55cc-62e8-3153-668eae8264ae	5273	Col
00050000-55cc-62e8-e435-58ba49659f63	8251	Čatež ob Savi
00050000-55cc-62e8-2227-4e15678cef98	1413	Čemšenik
00050000-55cc-62e8-4c60-f3437c40a7db	5253	Čepovan
00050000-55cc-62e8-6af9-2ab220882978	9232	Črenšovci
00050000-55cc-62e8-e6f2-54770aa344a3	2393	Črna na Koroškem
00050000-55cc-62e8-6ed3-3eb15e64e90e	6275	Črni Kal
00050000-55cc-62e8-6589-753d5fed618e	5274	Črni Vrh nad Idrijo
00050000-55cc-62e8-64fd-c9125b829285	5262	Črniče
00050000-55cc-62e8-29f9-77b0fea09f2b	8340	Črnomelj
00050000-55cc-62e8-7d8b-46a409a23e80	6271	Dekani
00050000-55cc-62e8-6716-6fe12fb6a43d	5210	Deskle
00050000-55cc-62e8-6b4e-c95ee01393a8	2253	Destrnik
00050000-55cc-62e8-67a3-c4a652c1cd70	6215	Divača
00050000-55cc-62e8-acf2-87c1448c9127	1233	Dob
00050000-55cc-62e8-37a3-493bcd6498e7	3224	Dobje pri Planini
00050000-55cc-62e8-ee81-c7edc9148631	8257	Dobova
00050000-55cc-62e8-85b9-3f36c3d4b168	1423	Dobovec
00050000-55cc-62e8-a22b-ec7082adf525	5263	Dobravlje
00050000-55cc-62e8-cb2b-3c62b79c5279	3204	Dobrna
00050000-55cc-62e8-cd22-2731a73991cd	8211	Dobrnič
00050000-55cc-62e8-1805-2e8281bf3e80	1356	Dobrova
00050000-55cc-62e8-b9bd-06113c661299	9223	Dobrovnik/Dobronak 
00050000-55cc-62e8-4e64-6bf3dc148680	5212	Dobrovo v Brdih
00050000-55cc-62e8-9681-03a97cc87c0a	1431	Dol pri Hrastniku
00050000-55cc-62e8-9ec1-31b5e68a4fa5	1262	Dol pri Ljubljani
00050000-55cc-62e8-2280-37bf5e830bd4	1273	Dole pri Litiji
00050000-55cc-62e8-92f5-cd22d4621c02	1331	Dolenja vas
00050000-55cc-62e8-84e7-489f6cf9684a	8350	Dolenjske Toplice
00050000-55cc-62e8-592c-9f209a22dda6	1230	Domžale
00050000-55cc-62e8-0c93-103cdd6d7921	2252	Dornava
00050000-55cc-62e8-268c-6ded14c61920	5294	Dornberk
00050000-55cc-62e8-0046-46065c518dab	1319	Draga
00050000-55cc-62e8-ea70-d5396ffb3f7d	8343	Dragatuš
00050000-55cc-62e8-c684-f72667470f9a	3222	Dramlje
00050000-55cc-62e8-ab53-a8f87631d608	2370	Dravograd
00050000-55cc-62e8-9f41-4b34faa30b6f	4203	Duplje
00050000-55cc-62e8-24bd-5f86a27d1e49	6221	Dutovlje
00050000-55cc-62e8-6abd-f575fdf9609d	8361	Dvor
00050000-55cc-62e8-e7ed-88c847b16c99	2343	Fala
00050000-55cc-62e8-598d-1abf59d80319	9208	Fokovci
00050000-55cc-62e8-5519-aed69a1ef7b0	2313	Fram
00050000-55cc-62e8-ebb6-f9227db1a8a6	3213	Frankolovo
00050000-55cc-62e8-0ed0-1fc39374cae6	1274	Gabrovka
00050000-55cc-62e8-a750-4f27ced4d598	8254	Globoko
00050000-55cc-62e8-054e-cf35f39c23c6	5275	Godovič
00050000-55cc-62e8-fc91-b244cb94e4cb	4204	Golnik
00050000-55cc-62e8-2e0e-29f1f9d66464	3303	Gomilsko
00050000-55cc-62e8-0151-92839ca21d0a	4224	Gorenja vas
00050000-55cc-62e8-6301-afdd823835da	3263	Gorica pri Slivnici
00050000-55cc-62e8-102e-cd072189e03f	2272	Gorišnica
00050000-55cc-62e8-f82a-229c58cca439	9250	Gornja Radgona
00050000-55cc-62e8-c403-ac1822c87270	3342	Gornji Grad
00050000-55cc-62e8-b947-c907d9068c86	4282	Gozd Martuljek
00050000-55cc-62e8-3df4-98dad43027a3	6272	Gračišče
00050000-55cc-62e8-4eae-9479a25667e8	9264	Grad
00050000-55cc-62e8-4449-bb54c07b0db8	8332	Gradac
00050000-55cc-62e8-0390-9f8008c4ffcd	1384	Grahovo
00050000-55cc-62e8-8afc-e00da4c1d783	5242	Grahovo ob Bači
00050000-55cc-62e8-d1e7-02c2741b3d77	5251	Grgar
00050000-55cc-62e8-3b4d-1d5bf0fa5896	3302	Griže
00050000-55cc-62e8-aa49-ee263f67eb39	3231	Grobelno
00050000-55cc-62e8-3ba8-b65275425c9c	1290	Grosuplje
00050000-55cc-62e8-b5f2-1d90b2895b40	2288	Hajdina
00050000-55cc-62e8-9fbc-ed0b3c978469	8362	Hinje
00050000-55cc-62e8-a6a0-9137c2434930	2311	Hoče
00050000-55cc-62e8-fb6a-173def05fd90	9205	Hodoš/Hodos
00050000-55cc-62e8-23d5-b066aeff1597	1354	Horjul
00050000-55cc-62e8-bb2f-31c27ecbff63	1372	Hotedršica
00050000-55cc-62e8-ba93-423928bc854d	1430	Hrastnik
00050000-55cc-62e8-ba6a-13249a5b3058	6225	Hruševje
00050000-55cc-62e8-5550-8df14c990b83	4276	Hrušica
00050000-55cc-62e8-023c-6e5e55473cd5	5280	Idrija
00050000-55cc-62e8-e2bb-2c681158c499	1292	Ig
00050000-55cc-62e8-12c4-103bb4cdfdcb	6250	Ilirska Bistrica
00050000-55cc-62e8-c3ca-ac455c2ab974	6251	Ilirska Bistrica-Trnovo
00050000-55cc-62e8-468f-5a193726c560	1295	Ivančna Gorica
00050000-55cc-62e8-93db-be1ac35846de	2259	Ivanjkovci
00050000-55cc-62e8-8e01-0353939d18c1	1411	Izlake
00050000-55cc-62e8-fc91-41bf10be58b1	6310	Izola/Isola
00050000-55cc-62e8-aa77-94fd963606df	2222	Jakobski Dol
00050000-55cc-62e8-e170-76778efb1cfe	2221	Jarenina
00050000-55cc-62e8-38df-e03163f67338	6254	Jelšane
00050000-55cc-62e8-9487-8366f67e2c81	4270	Jesenice
00050000-55cc-62e8-86d8-c3897143b980	8261	Jesenice na Dolenjskem
00050000-55cc-62e8-66f9-2a6e47293c31	3273	Jurklošter
00050000-55cc-62e8-6441-08c7de27d235	2223	Jurovski Dol
00050000-55cc-62e8-1230-200726a89f5e	2256	Juršinci
00050000-55cc-62e8-7150-14198ea43469	5214	Kal nad Kanalom
00050000-55cc-62e8-f679-cd53c61c099f	3233	Kalobje
00050000-55cc-62e8-1c35-b61ee5770773	4246	Kamna Gorica
00050000-55cc-62e8-c9c9-80f85bf9068c	2351	Kamnica
00050000-55cc-62e8-a8eb-e2bd2493b3d2	1241	Kamnik
00050000-55cc-62e8-b915-f8ec510fb5ae	5213	Kanal
00050000-55cc-62e8-b4c1-c6f6f18480e0	8258	Kapele
00050000-55cc-62e8-b8f1-9cb30d98856f	2362	Kapla
00050000-55cc-62e8-64be-4062e48755bd	2325	Kidričevo
00050000-55cc-62e8-4970-5d0194d14f3d	1412	Kisovec
00050000-55cc-62e8-0b13-1150182411c3	6253	Knežak
00050000-55cc-62e8-508d-1d097ddf9339	5222	Kobarid
00050000-55cc-62e8-6ac0-91a594abf3bd	9227	Kobilje
00050000-55cc-62e8-2d1d-aef2cb352dfd	1330	Kočevje
00050000-55cc-62e8-d37d-7005d2eac8cf	1338	Kočevska Reka
00050000-55cc-62e8-2db1-45fbb1a475c1	2276	Kog
00050000-55cc-62e8-612f-734cf3513630	5211	Kojsko
00050000-55cc-62e8-2a65-1e54aecec418	6223	Komen
00050000-55cc-62e8-2a6f-d2c3453500e9	1218	Komenda
00050000-55cc-62e8-0831-73572ad90bc4	6000	Koper/Capodistria 
00050000-55cc-62e8-bd2d-0d47f2706008	6001	Koper/Capodistria - poštni predali
00050000-55cc-62e8-6927-bae3a2287652	8282	Koprivnica
00050000-55cc-62e8-6a58-3f87dc572618	5296	Kostanjevica na Krasu
00050000-55cc-62e8-c9d3-e001434e7070	8311	Kostanjevica na Krki
00050000-55cc-62e8-7873-2ccb35721c11	1336	Kostel
00050000-55cc-62e8-4c89-6f3f63c29fc7	6256	Košana
00050000-55cc-62e8-4103-9a5a9a43ccbd	2394	Kotlje
00050000-55cc-62e8-f5c6-f00bd333d695	6240	Kozina
00050000-55cc-62e8-eab1-a00985881c8c	3260	Kozje
00050000-55cc-62e8-00a5-8aa65adadfd8	4000	Kranj 
00050000-55cc-62e8-9f8f-58166c806b0a	4001	Kranj - poštni predali
00050000-55cc-62e8-9789-52a266646a66	4280	Kranjska Gora
00050000-55cc-62e8-0dc0-87494b175576	1281	Kresnice
00050000-55cc-62e8-8d57-c36a0761154a	4294	Križe
00050000-55cc-62e8-1512-4868d14e4e45	9206	Križevci
00050000-55cc-62e8-24ee-0713934dfa45	9242	Križevci pri Ljutomeru
00050000-55cc-62e8-d7a7-760851e6e122	1301	Krka
00050000-55cc-62e8-a9fe-d59b04104054	8296	Krmelj
00050000-55cc-62e8-66a8-ca14596e4f9b	4245	Kropa
00050000-55cc-62e8-8c13-a323601ed8c7	8262	Krška vas
00050000-55cc-62e8-93ef-91643761b809	8270	Krško
00050000-55cc-62e8-f07a-5f570699cf65	9263	Kuzma
00050000-55cc-62e8-c9e2-edcd577fa06c	2318	Laporje
00050000-55cc-62e8-fbb0-0a33a28f6024	3270	Laško
00050000-55cc-62e8-b9e8-d32c7ef81ac9	1219	Laze v Tuhinju
00050000-55cc-62e8-5fe9-d2192fd4dc7e	2230	Lenart v Slovenskih goricah
00050000-55cc-62e8-ed1b-c0af968adb3a	9220	Lendava/Lendva
00050000-55cc-62e8-a932-3ca7ead0cd77	4248	Lesce
00050000-55cc-62e8-48eb-3801f5100a6b	3261	Lesično
00050000-55cc-62e8-2dff-bee3fc066c52	8273	Leskovec pri Krškem
00050000-55cc-62e8-1ec9-414496097a0d	2372	Libeliče
00050000-55cc-62e8-7b0f-5ba9382d975f	2341	Limbuš
00050000-55cc-62e8-44ef-a5fb3394fd77	1270	Litija
00050000-55cc-62e8-c236-87a6b73a7432	3202	Ljubečna
00050000-55cc-62e8-3e0e-f796b4a07be7	1000	Ljubljana 
00050000-55cc-62e8-66d2-ad058453fa0f	1001	Ljubljana - poštni predali
00050000-55cc-62e8-5e40-dc563df3b889	1231	Ljubljana - Črnuče
00050000-55cc-62e8-b995-31b6d0ee4d5a	1261	Ljubljana - Dobrunje
00050000-55cc-62e8-d79f-16b17a8179b0	1260	Ljubljana - Polje
00050000-55cc-62e8-9a44-bd833c46bdb8	1210	Ljubljana - Šentvid
00050000-55cc-62e8-e60f-472e0da7bffd	1211	Ljubljana - Šmartno
00050000-55cc-62e8-b181-5a1c7d150e71	3333	Ljubno ob Savinji
00050000-55cc-62e8-a58e-90fc01753fc5	9240	Ljutomer
00050000-55cc-62e8-db12-76283d416d90	3215	Loče
00050000-55cc-62e8-4309-65d8cf4d0b17	5231	Log pod Mangartom
00050000-55cc-62e8-1cba-d057aa155d7f	1358	Log pri Brezovici
00050000-55cc-62e8-9f35-6ec6b686f9e9	1370	Logatec
00050000-55cc-62e8-c0e3-b740508ca20a	1371	Logatec
00050000-55cc-62e8-b979-41034cfeccf2	1434	Loka pri Zidanem Mostu
00050000-55cc-62e8-663d-6474ac0be4e7	3223	Loka pri Žusmu
00050000-55cc-62e8-ec0f-86072fdcfdc3	6219	Lokev
00050000-55cc-62e8-d1b3-a1eda3e788b1	1318	Loški Potok
00050000-55cc-62e8-286d-bf90464c84fa	2324	Lovrenc na Dravskem polju
00050000-55cc-62e8-3f2f-a3a99054d8b5	2344	Lovrenc na Pohorju
00050000-55cc-62e8-9606-d9c920702029	3334	Luče
00050000-55cc-62e8-f5b4-ffdcbffe77d2	1225	Lukovica
00050000-55cc-62e8-70eb-6e1b53503cd5	9202	Mačkovci
00050000-55cc-62e8-ef20-5ec37d3ebdfc	2322	Majšperk
00050000-55cc-62e8-77d1-3744044c9598	2321	Makole
00050000-55cc-62e8-637a-258d781bd2cb	9243	Mala Nedelja
00050000-55cc-62e8-632c-dd9961fd4aff	2229	Malečnik
00050000-55cc-62e8-7588-0540ca9208f5	6273	Marezige
00050000-55cc-62e8-242f-d3c0b811a251	2000	Maribor 
00050000-55cc-62e8-0d54-ae92dad8005b	2001	Maribor - poštni predali
00050000-55cc-62e8-9d2c-1cdcbe1c8851	2206	Marjeta na Dravskem polju
00050000-55cc-62e8-d007-db79a8a68035	2281	Markovci
00050000-55cc-62e8-1988-982235e91e15	9221	Martjanci
00050000-55cc-62e8-7566-a7de13f7893d	6242	Materija
00050000-55cc-62e8-b43b-430c2abbb5e9	4211	Mavčiče
00050000-55cc-62e8-44d2-ebaeae9471b3	1215	Medvode
00050000-55cc-62e8-dbed-34764e723fbd	1234	Mengeš
00050000-55cc-62e8-1e85-1ee0488fc723	8330	Metlika
00050000-55cc-62e8-9f00-2465cf8d082c	2392	Mežica
00050000-55cc-62e8-4d4a-f667746f9ed2	2204	Miklavž na Dravskem polju
00050000-55cc-62e8-86ea-d236c3ba24ea	2275	Miklavž pri Ormožu
00050000-55cc-62e8-3250-2835a4bdb080	5291	Miren
00050000-55cc-62e8-486e-f8d8e6d0f6d9	8233	Mirna
00050000-55cc-62e8-4bb8-94582982a1e1	8216	Mirna Peč
00050000-55cc-62e8-f01f-4367395958d8	2382	Mislinja
00050000-55cc-62e8-ffdf-fa21fb080ce6	4281	Mojstrana
00050000-55cc-62e8-ccf5-e7b74b03d104	8230	Mokronog
00050000-55cc-62e8-4858-85e05a749f06	1251	Moravče
00050000-55cc-62e8-8fef-d66e79f2b47e	9226	Moravske Toplice
00050000-55cc-62e8-cf98-bf3c5e6bbebd	5216	Most na Soči
00050000-55cc-62e8-4fe9-c5d44f7fe858	1221	Motnik
00050000-55cc-62e8-20c5-660d217f2446	3330	Mozirje
00050000-55cc-62e8-699d-cce83f0281e8	9000	Murska Sobota 
00050000-55cc-62e8-ab9b-81f39cba2319	9001	Murska Sobota - poštni predali
00050000-55cc-62e8-8680-ebfb7fdc9ced	2366	Muta
00050000-55cc-62e8-9dc6-269bc891f474	4202	Naklo
00050000-55cc-62e8-3c77-a7b9a4932fd1	3331	Nazarje
00050000-55cc-62e8-9adf-2cb4b6f6c50a	1357	Notranje Gorice
00050000-55cc-62e8-16b9-d1884b922d0e	3203	Nova Cerkev
00050000-55cc-62e8-df6b-cb50da1621f0	5000	Nova Gorica 
00050000-55cc-62e8-6f22-a763a2a5a62b	5001	Nova Gorica - poštni predali
00050000-55cc-62e8-27a2-8bdcf0645cf1	1385	Nova vas
00050000-55cc-62e8-9668-f84a541f5420	8000	Novo mesto
00050000-55cc-62e8-7dde-5682f7d7af57	8001	Novo mesto - poštni predali
00050000-55cc-62e8-1f03-3d4cfe7509ae	6243	Obrov
00050000-55cc-62e8-de42-7ec2e29e3e01	9233	Odranci
00050000-55cc-62e8-f373-76fa7e67a918	2317	Oplotnica
00050000-55cc-62e8-81f6-32e983718af7	2312	Orehova vas
00050000-55cc-62e8-6d8e-29963426e17d	2270	Ormož
00050000-55cc-62e8-3fee-74c978a8add8	1316	Ortnek
00050000-55cc-62e8-0934-1be701d69001	1337	Osilnica
00050000-55cc-62e8-1ae3-299abaeb6177	8222	Otočec
00050000-55cc-62e8-2422-e9c0e80e8363	2361	Ožbalt
00050000-55cc-62e8-c36f-1f6e42aac162	2231	Pernica
00050000-55cc-62e8-a002-b0d900634f0f	2211	Pesnica pri Mariboru
00050000-55cc-62e8-7da3-3362c645df29	9203	Petrovci
00050000-55cc-62e8-0586-6c295a6de62e	3301	Petrovče
00050000-55cc-62e8-0cad-431a2a872feb	6330	Piran/Pirano
00050000-55cc-62e8-71f5-82db76545ab2	8255	Pišece
00050000-55cc-62e8-4380-7c63e45c2550	6257	Pivka
00050000-55cc-62e8-4255-11d06bbd6f2b	6232	Planina
00050000-55cc-62e8-0390-3506e8da902a	3225	Planina pri Sevnici
00050000-55cc-62e8-def4-c18eb42d7d9e	6276	Pobegi
00050000-55cc-62e8-ac67-50b5c30cd58c	8312	Podbočje
00050000-55cc-62e8-d5ec-64f4e8cece5b	5243	Podbrdo
00050000-55cc-62e8-a4e1-37f36362f0f7	3254	Podčetrtek
00050000-55cc-62e8-989c-9e20351b8aca	2273	Podgorci
00050000-55cc-62e8-a60c-a6387f0d5821	6216	Podgorje
00050000-55cc-62e8-ba6a-ae0bdb444a65	2381	Podgorje pri Slovenj Gradcu
00050000-55cc-62e8-581a-13986d1d5375	6244	Podgrad
00050000-55cc-62e8-e76d-262a417ad31a	1414	Podkum
00050000-55cc-62e8-8e50-742598bc8f1d	2286	Podlehnik
00050000-55cc-62e8-0f98-6d3b8f3b3216	5272	Podnanos
00050000-55cc-62e8-bd41-13ff187cb119	4244	Podnart
00050000-55cc-62e8-17a9-84d17519e2c8	3241	Podplat
00050000-55cc-62e8-8149-19a18258f107	3257	Podsreda
00050000-55cc-62e8-5d7e-76879ae703ad	2363	Podvelka
00050000-55cc-62e8-0cdf-47fa287a5bfc	2208	Pohorje
00050000-55cc-62e8-231d-e3aff938cbad	2257	Polenšak
00050000-55cc-62e8-31e6-3c1c5323bc3f	1355	Polhov Gradec
00050000-55cc-62e8-6905-c29ad242efd7	4223	Poljane nad Škofjo Loko
00050000-55cc-62e8-98e2-4ee0dfeec450	2319	Poljčane
00050000-55cc-62e8-be27-dbfae30c43f9	1272	Polšnik
00050000-55cc-62e8-c1fb-c776dbfffd4d	3313	Polzela
00050000-55cc-62e8-5626-cc3c6aff30f4	3232	Ponikva
00050000-55cc-62e8-f952-4df2f1e96a75	6320	Portorož/Portorose
00050000-55cc-62e8-84b4-24aa8bbef285	6230	Postojna
00050000-55cc-62e8-b36e-b307cd915eff	2331	Pragersko
00050000-55cc-62e8-ac47-146ccc0414e7	3312	Prebold
00050000-55cc-62e8-b4b8-486f52d52acb	4205	Preddvor
00050000-55cc-62e8-d30f-f92c2eefb8a0	6255	Prem
00050000-55cc-62e8-5c7b-943d36c4cda0	1352	Preserje
00050000-55cc-62e8-a244-6ff971c3dce2	6258	Prestranek
00050000-55cc-62e8-04b7-a9c9de316999	2391	Prevalje
00050000-55cc-62e8-2e52-f6d83fd788b3	3262	Prevorje
00050000-55cc-62e8-1627-add46718019f	1276	Primskovo 
00050000-55cc-62e8-cecc-ca54a584589e	3253	Pristava pri Mestinju
00050000-55cc-62e8-53b4-1a876ff6a09b	9207	Prosenjakovci/Partosfalva
00050000-55cc-62e8-617d-ba497751be75	5297	Prvačina
00050000-55cc-62e8-3d81-aea2ace08785	2250	Ptuj
00050000-55cc-62e8-e4f0-45715fc2e146	2323	Ptujska Gora
00050000-55cc-62e8-1b26-54a330cfe26f	9201	Puconci
00050000-55cc-62e8-ba2f-f5620e242331	2327	Rače
00050000-55cc-62e8-84aa-53328923d7aa	1433	Radeče
00050000-55cc-62e8-b508-d14482820adf	9252	Radenci
00050000-55cc-62e8-0f53-6b3afea6f08b	2360	Radlje ob Dravi
00050000-55cc-62e8-f4e9-e81147ab24d2	1235	Radomlje
00050000-55cc-62e8-597b-fabb8f440e72	4240	Radovljica
00050000-55cc-62e8-5827-d8dd179bfef7	8274	Raka
00050000-55cc-62e8-3fc5-581033438faa	1381	Rakek
00050000-55cc-62e8-bf07-d4d7ac77d500	4283	Rateče - Planica
00050000-55cc-62e8-01d2-abb2727ac5fe	2390	Ravne na Koroškem
00050000-55cc-62e8-dcfb-d8f67c887d21	9246	Razkrižje
00050000-55cc-62e8-f3d6-7c1b89582fd3	3332	Rečica ob Savinji
00050000-55cc-62e8-3fad-b8455f3c40d9	5292	Renče
00050000-55cc-62e8-1994-5368bd6d88ff	1310	Ribnica
00050000-55cc-62e8-0e96-eb5e105c2343	2364	Ribnica na Pohorju
00050000-55cc-62e8-0a22-9cbf97175b00	3272	Rimske Toplice
00050000-55cc-62e8-db94-495a26517896	1314	Rob
00050000-55cc-62e8-3530-859430966af3	5215	Ročinj
00050000-55cc-62e8-e0ba-562d2f10ed03	3250	Rogaška Slatina
00050000-55cc-62e8-ed77-1549ac54fe35	9262	Rogašovci
00050000-55cc-62e8-61ca-df49ed4d0b05	3252	Rogatec
00050000-55cc-62e8-18b2-9419c71ea702	1373	Rovte
00050000-55cc-62e8-991b-deed50abef9e	2342	Ruše
00050000-55cc-62e8-5dbf-b61498f9df39	1282	Sava
00050000-55cc-62e8-5703-a374b4c1d314	6333	Sečovlje/Sicciole
00050000-55cc-62e8-6768-377e585d684a	4227	Selca
00050000-55cc-62e8-2f76-6e5ab24e499a	2352	Selnica ob Dravi
00050000-55cc-62e8-c340-4b5353402897	8333	Semič
00050000-55cc-62e8-8977-32993dd40251	8281	Senovo
00050000-55cc-62e8-f07b-4674b2f52645	6224	Senožeče
00050000-55cc-62e8-bfd7-3660d437d1d9	8290	Sevnica
00050000-55cc-62e8-78cc-3b65c9698e3f	6210	Sežana
00050000-55cc-62e8-5148-9e93717afc13	2214	Sladki Vrh
00050000-55cc-62e8-bd31-6d9e73183880	5283	Slap ob Idrijci
00050000-55cc-62e8-2f0f-3ce87cee9137	2380	Slovenj Gradec
00050000-55cc-62e8-6b6d-ebf3c9d70db8	2310	Slovenska Bistrica
00050000-55cc-62e8-e316-c1a538d88b9a	3210	Slovenske Konjice
00050000-55cc-62e8-5105-825c91ea19ac	1216	Smlednik
00050000-55cc-62e8-981d-0e8599f15653	5232	Soča
00050000-55cc-62e8-26de-a74758d77966	1317	Sodražica
00050000-55cc-62e8-6fe1-9b11c3f42bfc	3335	Solčava
00050000-55cc-62e8-d7f7-488796d12cd9	5250	Solkan
00050000-55cc-62e8-05ca-102e2fe5a21c	4229	Sorica
00050000-55cc-62e8-9347-5aeb7969f117	4225	Sovodenj
00050000-55cc-62e8-025e-71cd86ab8ad6	5281	Spodnja Idrija
00050000-55cc-62e8-f348-ce59485077c4	2241	Spodnji Duplek
00050000-55cc-62e8-1429-e34bb5796d32	9245	Spodnji Ivanjci
00050000-55cc-62e8-f99d-677d09679100	2277	Središče ob Dravi
00050000-55cc-62e8-d288-4e8cd3f4b50f	4267	Srednja vas v Bohinju
00050000-55cc-62e8-83dd-4763b40e4b5f	8256	Sromlje 
00050000-55cc-62e8-6d4a-ad16d77970be	5224	Srpenica
00050000-55cc-62e8-1ac8-c187042dae6f	1242	Stahovica
00050000-55cc-62e8-2a83-fa840fcb2a94	1332	Stara Cerkev
00050000-55cc-62e8-ecf2-826fdb611f52	8342	Stari trg ob Kolpi
00050000-55cc-62e8-1a47-b9e7aaacb331	1386	Stari trg pri Ložu
00050000-55cc-62e8-e5d2-3de3d14b1a21	2205	Starše
00050000-55cc-62e8-7e3a-e8a27100d6ed	2289	Stoperce
00050000-55cc-62e8-d168-2be4a1c0e96f	8322	Stopiče
00050000-55cc-62e8-5d8e-9f8d8e37e659	3206	Stranice
00050000-55cc-62e8-822e-4694fa7cfd31	8351	Straža
00050000-55cc-62e8-2173-a9c14521330c	1313	Struge
00050000-55cc-62e8-d6b6-d4644b8c1ca9	8293	Studenec
00050000-55cc-62e8-c57c-d3cc778795c1	8331	Suhor
00050000-55cc-62e8-9776-923c786ef4d3	2233	Sv. Ana v Slovenskih goricah
00050000-55cc-62e8-6531-442dad1b1b95	2235	Sv. Trojica v Slovenskih goricah
00050000-55cc-62e8-622a-26182fa0acf4	2353	Sveti Duh na Ostrem Vrhu
00050000-55cc-62e8-2d79-722e32f21257	9244	Sveti Jurij ob Ščavnici
00050000-55cc-62e8-d7bf-4d4947e75328	3264	Sveti Štefan
00050000-55cc-62e8-2625-b0a1ceede6e9	2258	Sveti Tomaž
00050000-55cc-62e8-51be-9a75b5858eae	9204	Šalovci
00050000-55cc-62e8-f830-25286bdb3bd2	5261	Šempas
00050000-55cc-62e8-2070-dcecac2f52d3	5290	Šempeter pri Gorici
00050000-55cc-62e8-ad00-69b85cc54b60	3311	Šempeter v Savinjski dolini
00050000-55cc-62e8-1aa1-f681877ed195	4208	Šenčur
00050000-55cc-62e8-400a-00e4447fdeef	2212	Šentilj v Slovenskih goricah
00050000-55cc-62e8-64c1-83a0c81aa826	8297	Šentjanž
00050000-55cc-62e8-e3ee-dc806ab10f25	2373	Šentjanž pri Dravogradu
00050000-55cc-62e8-b18d-6be5b5c7771c	8310	Šentjernej
00050000-55cc-62e8-7cc7-8db56e224e52	3230	Šentjur
00050000-55cc-62e8-d190-bbe385d36ea2	3271	Šentrupert
00050000-55cc-62e8-9450-855c7906545c	8232	Šentrupert
00050000-55cc-62e8-c75a-2e5e93afea4d	1296	Šentvid pri Stični
00050000-55cc-62e8-1811-4452d17b984e	8275	Škocjan
00050000-55cc-62e8-9a83-13e7172fb2e3	6281	Škofije
00050000-55cc-62e8-163f-5571b12dc9a5	4220	Škofja Loka
00050000-55cc-62e8-369a-1a896a40b002	3211	Škofja vas
00050000-55cc-62e8-6e58-1becbf67f1fd	1291	Škofljica
00050000-55cc-62e8-fd28-a4d2c1004746	6274	Šmarje
00050000-55cc-62e8-4aac-d028c08fd3a4	1293	Šmarje - Sap
00050000-55cc-62e8-e2a0-fb0dd5659535	3240	Šmarje pri Jelšah
00050000-55cc-62e8-449e-19d14d95e121	8220	Šmarješke Toplice
00050000-55cc-62e8-02ec-dc7d487e5477	2315	Šmartno na Pohorju
00050000-55cc-62e8-099e-b6ebb19354fe	3341	Šmartno ob Dreti
00050000-55cc-62e8-7c55-c341d0cac2fc	3327	Šmartno ob Paki
00050000-55cc-62e8-42a6-babc564979dd	1275	Šmartno pri Litiji
00050000-55cc-62e8-8cc1-41e7410cb85e	2383	Šmartno pri Slovenj Gradcu
00050000-55cc-62e8-0e53-3bce1a6b0d8f	3201	Šmartno v Rožni dolini
00050000-55cc-62e8-0723-5887c6bd983e	3325	Šoštanj
00050000-55cc-62e8-9828-c637b2f8eda9	6222	Štanjel
00050000-55cc-62e8-cfff-d498d13146b4	3220	Štore
00050000-55cc-62e8-3563-59038eb6f79b	3304	Tabor
00050000-55cc-62e8-3f82-02f7a1bddce5	3221	Teharje
00050000-55cc-62e8-e197-4f9194c4180d	9251	Tišina
00050000-55cc-62e8-3795-bbb4f8bc9018	5220	Tolmin
00050000-55cc-62e8-5285-7ba0d8e17235	3326	Topolšica
00050000-55cc-62e8-ab37-e90a5b74e24c	2371	Trbonje
00050000-55cc-62e8-9012-258d9d7343e2	1420	Trbovlje
00050000-55cc-62e8-f725-2a9505ed55e1	8231	Trebelno 
00050000-55cc-62e8-bd05-ca95f8b6aff8	8210	Trebnje
00050000-55cc-62e8-5f27-9e979d36a0a5	5252	Trnovo pri Gorici
00050000-55cc-62e8-e34b-dcf77ad39e44	2254	Trnovska vas
00050000-55cc-62e8-af59-52e17bcf5b79	1222	Trojane
00050000-55cc-62e8-51a3-6af73263b2af	1236	Trzin
00050000-55cc-62e8-fe37-38d8fbd7940e	4290	Tržič
00050000-55cc-62e8-00c3-28b74e63a899	8295	Tržišče
00050000-55cc-62e8-f78b-f642c8457754	1311	Turjak
00050000-55cc-62e8-0bc3-2c23dbc83b90	9224	Turnišče
00050000-55cc-62e8-1723-b8b87ac13950	8323	Uršna sela
00050000-55cc-62e8-15ae-132ab1adc70b	1252	Vače
00050000-55cc-62e8-21ff-906eab4a53d2	3320	Velenje 
00050000-55cc-62e8-2c43-4dcbd76c4a29	3322	Velenje - poštni predali
00050000-55cc-62e8-691a-16b49ea2f518	8212	Velika Loka
00050000-55cc-62e8-6fad-992aed416c8c	2274	Velika Nedelja
00050000-55cc-62e8-dea4-eb9f54275d3e	9225	Velika Polana
00050000-55cc-62e8-b2ac-6986c4785d8c	1315	Velike Lašče
00050000-55cc-62e8-a934-3eb757536398	8213	Veliki Gaber
00050000-55cc-62e8-a52e-d2fa30dad149	9241	Veržej
00050000-55cc-62e8-ef80-02a2cb00c702	1312	Videm - Dobrepolje
00050000-55cc-62e8-06d2-1f7816607883	2284	Videm pri Ptuju
00050000-55cc-62e8-da07-f4b25fe9892a	8344	Vinica
00050000-55cc-62e8-428c-1435357aff01	5271	Vipava
00050000-55cc-62e8-cab0-db6b61b6e141	4212	Visoko
00050000-55cc-62e8-c35b-5bf6231a675c	1294	Višnja Gora
00050000-55cc-62e8-2b96-39ac93359236	3205	Vitanje
00050000-55cc-62e8-4c6f-bd6208b6b9f2	2255	Vitomarci
00050000-55cc-62e8-93c3-acdd188b794f	1217	Vodice
00050000-55cc-62e8-f321-551dae2fba64	3212	Vojnik\t
00050000-55cc-62e8-f78e-aabac3c0d6e3	5293	Volčja Draga
00050000-55cc-62e8-9f89-a49f92e5bf6a	2232	Voličina
00050000-55cc-62e8-8f96-492591973356	3305	Vransko
00050000-55cc-62e8-e7b1-bb8eb807da67	6217	Vremski Britof
00050000-55cc-62e8-ccbb-0a8a0a48eb82	1360	Vrhnika
00050000-55cc-62e8-a5fc-dac5f0426b4b	2365	Vuhred
00050000-55cc-62e8-69ea-4d73f7de9dd5	2367	Vuzenica
00050000-55cc-62e8-f834-6aa6cc83b61b	8292	Zabukovje 
00050000-55cc-62e8-9699-a20b80a5e103	1410	Zagorje ob Savi
00050000-55cc-62e8-ebc5-eb90f7ef5041	1303	Zagradec
00050000-55cc-62e8-1763-61dba429c7b5	2283	Zavrč
00050000-55cc-62e8-2fe6-1b30910f7f87	8272	Zdole 
00050000-55cc-62e8-aabe-26facbc66435	4201	Zgornja Besnica
00050000-55cc-62e8-dd58-79b34b674dc7	2242	Zgornja Korena
00050000-55cc-62e8-03bc-e780c5966386	2201	Zgornja Kungota
00050000-55cc-62e8-a864-6f71670cd600	2316	Zgornja Ložnica
00050000-55cc-62e8-e79a-e375f833991c	2314	Zgornja Polskava
00050000-55cc-62e8-b904-b912e2b17a70	2213	Zgornja Velka
00050000-55cc-62e8-2e77-b644becdec92	4247	Zgornje Gorje
00050000-55cc-62e8-9ed1-ae54431860c5	4206	Zgornje Jezersko
00050000-55cc-62e8-9f1e-68528cf20a4c	2285	Zgornji Leskovec
00050000-55cc-62e8-c061-119d714c833e	1432	Zidani Most
00050000-55cc-62e8-ee3d-573d7b6c3944	3214	Zreče
00050000-55cc-62e8-64e9-8e79c68f5cbe	4209	Žabnica
00050000-55cc-62e8-08d9-bd13be9db0f3	3310	Žalec
00050000-55cc-62e8-dc66-128d17c439af	4228	Železniki
00050000-55cc-62e8-b97c-9edbe6a1facd	2287	Žetale
00050000-55cc-62e8-1a4c-577158665549	4226	Žiri
00050000-55cc-62e8-e340-efc8eb2f1653	4274	Žirovnica
00050000-55cc-62e8-aa99-ef8c03ce9db2	8360	Žužemberk
\.


--
-- TOC entry 2914 (class 0 OID 13425833)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 13425640)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 13425718)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 13425845)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 13426176)
-- Dependencies: 225
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 13426186)
-- Dependencies: 226
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55cc-62ea-e1ca-331e30584324	00080000-55cc-62ea-60a7-c2cb773626e9	0900	AK
00190000-55cc-62ea-7e74-281cec32fd95	00080000-55cc-62e9-5593-65a2077454dc	0987	AK
00190000-55cc-62ea-5617-93322844fa4f	00080000-55cc-62e9-82b8-44f3f4e9e827	0989	AK
00190000-55cc-62ea-a5ca-b3083085980c	00080000-55cc-62e9-40a7-558c8846523c	0986	AK
00190000-55cc-62ea-c0a9-e034af835f49	00080000-55cc-62e9-e5c9-7a560cc2f7c7	0984	AK
00190000-55cc-62ea-5a2d-e0c08f52f653	00080000-55cc-62e9-f1d6-f2fb2fad092f	0983	AK
00190000-55cc-62ea-cfd7-19914916ab4d	00080000-55cc-62e9-418d-49062020b5dd	0982	AK
\.


--
-- TOC entry 2938 (class 0 OID 13426132)
-- Dependencies: 224
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponprej, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55cc-62ea-e814-3522c0a94095	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2941 (class 0 OID 13426194)
-- Dependencies: 227
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 13425874)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55cc-62e9-8062-23a9f1d18c35	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55cc-62e9-7e7f-3171ec879983	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55cc-62e9-a67c-c278f8366e5a	0003	Kazinska	t	84	Kazinska dvorana
00220000-55cc-62e9-e783-d1392a6130d9	0004	Mali oder	t	24	Mali oder 
00220000-55cc-62e9-0ac1-7df9cb883ab8	0005	Komorni oder	t	15	Komorni oder
00220000-55cc-62e9-9dcd-4c359365df0c	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55cc-62e9-3a84-398c710637d7	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2912 (class 0 OID 13425818)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2911 (class 0 OID 13425808)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 13425993)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 13425942)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 13425512)
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
-- TOC entry 2921 (class 0 OID 13425884)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 13425550)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55cc-62e8-1d15-8949c887c55b	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55cc-62e8-176c-385926ec26dc	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55cc-62e8-c2ed-0ea034530397	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55cc-62e8-78dd-8ae947bc1564	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55cc-62e8-5236-c7fa5c4d98e5	planer	Planer dogodkov v koledarju	t
00020000-55cc-62e8-914e-3efaa96dba22	kadrovska	Kadrovska služba	t
00020000-55cc-62e8-fb4a-bdb4d48035b8	arhivar	Ažuriranje arhivalij	t
00020000-55cc-62e8-f7ec-0ce19f37991e	igralec	Igralec	t
00020000-55cc-62e8-c259-4c8c34375f42	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55cc-62e9-bc47-063200716e7e	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2887 (class 0 OID 13425534)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55cc-62e8-41d5-a942cbf14f2c	00020000-55cc-62e8-c2ed-0ea034530397
00010000-55cc-62e8-3407-aed388ae2582	00020000-55cc-62e8-c2ed-0ea034530397
00010000-55cc-62ea-0faa-e8f799f50d39	00020000-55cc-62e9-bc47-063200716e7e
\.


--
-- TOC entry 2923 (class 0 OID 13425898)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2915 (class 0 OID 13425839)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 13425785)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 13426235)
-- Dependencies: 232
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55cc-62e9-4bfc-0059a2985aef	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55cc-62e9-58e9-f735c39abf4a	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55cc-62e9-7d94-459eaeb422f9	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55cc-62e9-52ec-e44f6866aa0a	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55cc-62e9-2208-2242a273eb11	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2945 (class 0 OID 13426227)
-- Dependencies: 231
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55cc-62e9-fad7-d6cb9be007d4	00230000-55cc-62e9-52ec-e44f6866aa0a	popa
00240000-55cc-62e9-7586-878cd6ec8418	00230000-55cc-62e9-52ec-e44f6866aa0a	oseba
00240000-55cc-62e9-500b-c4cf10ff084d	00230000-55cc-62e9-52ec-e44f6866aa0a	sezona
00240000-55cc-62e9-e9d1-a9e9192e314c	00230000-55cc-62e9-58e9-f735c39abf4a	prostor
00240000-55cc-62e9-ac86-62f91c91bfec	00230000-55cc-62e9-52ec-e44f6866aa0a	besedilo
00240000-55cc-62e9-f8c7-f619d2789639	00230000-55cc-62e9-52ec-e44f6866aa0a	uprizoritev
00240000-55cc-62e9-c7e8-e2148beed905	00230000-55cc-62e9-52ec-e44f6866aa0a	funkcija
00240000-55cc-62e9-f482-49c3d0d88918	00230000-55cc-62e9-52ec-e44f6866aa0a	tipfunkcije
00240000-55cc-62e9-0028-b0f4173a2a41	00230000-55cc-62e9-52ec-e44f6866aa0a	alternacija
00240000-55cc-62e9-5fa7-7a5c005a71cf	00230000-55cc-62e9-4bfc-0059a2985aef	pogodba
00240000-55cc-62e9-c5f3-4d72a7e7ab0f	00230000-55cc-62e9-52ec-e44f6866aa0a	zaposlitev
00240000-55cc-62e9-7d8c-86d5108a5988	00230000-55cc-62e9-4bfc-0059a2985aef	programdela
00240000-55cc-62e9-a750-e1aba0aaa74f	00230000-55cc-62e9-52ec-e44f6866aa0a	zapis
\.


--
-- TOC entry 2944 (class 0 OID 13426222)
-- Dependencies: 230
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 13425952)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55cc-62ea-927f-87a9385e78de	000e0000-55cc-62ea-0c7d-d0906ebf49b6	00080000-55cc-62e9-f547-6027e2c71b7b	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55cc-62ea-8ae0-b6ca378a7f57	000e0000-55cc-62ea-0c7d-d0906ebf49b6	00080000-55cc-62e9-f547-6027e2c71b7b	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55cc-62ea-48af-106da764fa98	000e0000-55cc-62ea-0c7d-d0906ebf49b6	00080000-55cc-62e9-d41c-ee07b9bceac9	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55cc-62ea-ee71-890085044cee	000e0000-55cc-62ea-0c7d-d0906ebf49b6	00080000-55cc-62e9-d41c-ee07b9bceac9	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2894 (class 0 OID 13425612)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2910 (class 0 OID 13425795)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55cc-62ea-e312-225c93b6a93e	00180000-55cc-62ea-5eb3-dc281c265081	000c0000-55cc-62ea-94fd-53f0aef300c3	00090000-55cc-62ea-561a-7ce34e4b4838	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55cc-62ea-128c-080218bc1c62	00180000-55cc-62ea-5eb3-dc281c265081	000c0000-55cc-62ea-d80d-08365c3aab09	00090000-55cc-62ea-fe08-b9f0745870f3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55cc-62ea-3f84-1a969fa9da11	00180000-55cc-62ea-5eb3-dc281c265081	000c0000-55cc-62ea-c148-7b950e48bb3f	00090000-55cc-62ea-823a-1af5e5358a3b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55cc-62ea-d098-7825671fb8b3	00180000-55cc-62ea-5eb3-dc281c265081	000c0000-55cc-62ea-9100-a8f64b4e69e9	00090000-55cc-62ea-aeb8-338b3396d25c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55cc-62ea-bff0-d5b36a5dff0b	00180000-55cc-62ea-5eb3-dc281c265081	000c0000-55cc-62ea-642e-bf367e4a467d	00090000-55cc-62ea-cacf-8d1b3d8207ae	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55cc-62ea-f57b-54ed8bbb4dd9	00180000-55cc-62ea-b1fc-746338b69fe5	\N	00090000-55cc-62ea-cacf-8d1b3d8207ae	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2930 (class 0 OID 13425982)
-- Dependencies: 216
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55cc-62e9-517e-3911fe279b7d	Avtor	Avtorji	Avtorka	umetnik
000f0000-55cc-62e9-5600-602a457e5725	Priredba	Priredba	Priredba	umetnik
000f0000-55cc-62e9-cd39-13f4aebad85c	Prevod	Prevod	Prevod	umetnik
000f0000-55cc-62e9-96f4-349d9964da04	Režija	Režija	Režija	umetnik
000f0000-55cc-62e9-29b1-d524ea8c19af	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55cc-62e9-d034-4441551f1250	Scenografija	Scenografija	Scenografija	tehnik
000f0000-55cc-62e9-d616-a8fca661fdba	Kostumografija	Kostumografija	Kostumografija	tehnik
000f0000-55cc-62e9-2038-3873770fa5b5	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55cc-62e9-ba18-304196350062	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	tehnik
000f0000-55cc-62e9-6e73-3c619a587df9	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	tehnik
000f0000-55cc-62e9-a719-a9a4adc703d1	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55cc-62e9-b888-132552bc623a	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55cc-62e9-8676-3ca80d1d2b55	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	tehnik
000f0000-55cc-62e9-19fa-676ec624aff5	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	tehnik
000f0000-55cc-62e9-88db-5fdb1538c031	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55cc-62e9-7f6c-eebabb0808d3	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55cc-62e9-bc73-4894d0005f0d	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55cc-62e9-e2f4-c8a651f6dae2	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2942 (class 0 OID 13426204)
-- Dependencies: 228
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55cc-62e9-caff-c2a8943b406b	01	Velika predstava	f	1.00	1.00
002b0000-55cc-62e9-c659-60c4cc35d123	02	Mala predstava	f	0.50	0.50
002b0000-55cc-62e9-16ed-c07e802ea63d	03	Mala koprodukcija	t	0.40	1.00
002b0000-55cc-62e9-fe74-1081cd71a1c7	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55cc-62e9-655b-3a70e8e99d1f	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2899 (class 0 OID 13425675)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2886 (class 0 OID 13425521)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55cc-62e8-3407-aed388ae2582	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROsO7POmWPkO0nEM6CR8gd92v97mjxw/K	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55cc-62e9-3769-20f83f2a2ba1	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55cc-62e9-792d-c116675e26c7	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55cc-62e9-45b5-c41073df29cc	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55cc-62e9-373a-46a1ad620910	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55cc-62ea-c6df-8e8adfeaa8be	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55cc-62ea-607d-adff22dea27f	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55cc-62ea-6500-92279cd0cf99	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55cc-62ea-6c47-4b9c038a80c2	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55cc-62ea-0401-23875fdd90c0	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55cc-62ea-0faa-e8f799f50d39	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55cc-62e8-41d5-a942cbf14f2c	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2934 (class 0 OID 13426030)
-- Dependencies: 220
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55cc-62ea-6456-76a13368ada3	00160000-55cc-62e9-3786-fc15e3d06993	00150000-55cc-62e9-87a3-4d2c644d4fbc	00140000-55cc-62e8-8aa8-b6c4bccf2bc1	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55cc-62e9-0ac1-7df9cb883ab8
000e0000-55cc-62ea-0c7d-d0906ebf49b6	00160000-55cc-62e9-5bc5-b7bb354c43e8	00150000-55cc-62e9-1a57-d1e83dfb46e9	00140000-55cc-62e8-81a7-207c89cbbfee	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55cc-62e9-9dcd-4c359365df0c
000e0000-55cc-62ea-b844-a9154b8ffb5c	\N	00150000-55cc-62e9-1a57-d1e83dfb46e9	00140000-55cc-62e8-81a7-207c89cbbfee	00190000-55cc-62ea-7e74-281cec32fd95	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55cc-62e9-0ac1-7df9cb883ab8
000e0000-55cc-62ea-1084-1320aa98452e	\N	00150000-55cc-62e9-1a57-d1e83dfb46e9	00140000-55cc-62e8-81a7-207c89cbbfee	00190000-55cc-62ea-7e74-281cec32fd95	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55cc-62e9-0ac1-7df9cb883ab8
000e0000-55cc-62ea-d4ab-6bbd821765b2	\N	00150000-55cc-62e9-1a57-d1e83dfb46e9	00140000-55cc-62e8-81a7-207c89cbbfee	00190000-55cc-62ea-7e74-281cec32fd95	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55cc-62e9-8062-23a9f1d18c35
\.


--
-- TOC entry 2904 (class 0 OID 13425737)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55cc-62ea-b499-67e17da38396	000e0000-55cc-62ea-0c7d-d0906ebf49b6	1	
00200000-55cc-62ea-e1f2-4fb29362875a	000e0000-55cc-62ea-0c7d-d0906ebf49b6	2	
\.


--
-- TOC entry 2919 (class 0 OID 13425866)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 13426274)
-- Dependencies: 234
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 13426246)
-- Dependencies: 233
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rigths, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 13426286)
-- Dependencies: 235
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2926 (class 0 OID 13425935)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55cc-62ea-1927-a25274d7be63	00090000-55cc-62ea-fe08-b9f0745870f3	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55cc-62ea-c4e4-768bdc71380d	00090000-55cc-62ea-823a-1af5e5358a3b	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55cc-62ea-5d7b-53fd095a8510	00090000-55cc-62ea-986d-917be5f622a3	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55cc-62ea-b679-c8eb4bd57c1c	00090000-55cc-62ea-6463-ba04bf4f72a1	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55cc-62ea-3d17-a4113ddfa444	00090000-55cc-62ea-561a-7ce34e4b4838	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55cc-62ea-b797-42f5ad13aa88	00090000-55cc-62ea-acfa-705004da9c82	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2906 (class 0 OID 13425769)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 13426020)
-- Dependencies: 219
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55cc-62e8-8aa8-b6c4bccf2bc1	01	Drama	drama (SURS 01)
00140000-55cc-62e8-ab2e-e0ad53b4acb0	02	Opera	opera (SURS 02)
00140000-55cc-62e8-06c6-3a09e0fcd17f	03	Balet	balet (SURS 03)
00140000-55cc-62e8-5b80-52c6cf6dd0db	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55cc-62e8-50d9-d067e3960232	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55cc-62e8-81a7-207c89cbbfee	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55cc-62e8-4bce-45fc8b773af2	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2925 (class 0 OID 13425925)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55cc-62e9-58f4-09d226608ae7	01	Opera	opera
00150000-55cc-62e9-a4ae-01c7993149ca	02	Opereta	opereta
00150000-55cc-62e9-e932-bed1063d2424	03	Balet	balet
00150000-55cc-62e9-6423-288ec850464a	04	Plesne prireditve	plesne prireditve
00150000-55cc-62e9-e9cc-8367f030c31e	05	Lutkovno gledališče	lutkovno gledališče
00150000-55cc-62e9-c764-d2802172a3c1	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55cc-62e9-edb4-9aa370284020	07	Biografska drama	biografska drama
00150000-55cc-62e9-87a3-4d2c644d4fbc	08	Komedija	komedija
00150000-55cc-62e9-b6f6-f5196604bd97	09	Črna komedija	črna komedija
00150000-55cc-62e9-29fe-092762ba9a82	10	E-igra	E-igra
00150000-55cc-62e9-1a57-d1e83dfb46e9	11	Kriminalka	kriminalka
00150000-55cc-62e9-b321-f93261dd73c5	12	Musical	musical
\.


--
-- TOC entry 2436 (class 2606 OID 13425575)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 13426077)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 13426067)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 13425981)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 13426327)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 13425759)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 13425784)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 13426220)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 13425701)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 13426126)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 13425921)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 13425735)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 2606 OID 13425778)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 13425715)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 13425831)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 13426303)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 13426310)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2677 (class 2606 OID 13426335)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 13425858)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 13425673)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 13425584)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 13425608)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 13425564)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2427 (class 2606 OID 13425549)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 13425864)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 13425897)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 13426015)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 13425637)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 13425661)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 13425837)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 13425651)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 13425722)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 13425849)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 13426183)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 13426191)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 13426174)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 13426202)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 13425881)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 13425822)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 13425813)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 13426003)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 13425949)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 13425520)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 13425888)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 13425538)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2429 (class 2606 OID 13425558)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 13425906)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 13425844)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 13425793)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 13426244)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 13426232)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 13426226)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 13425962)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 13425617)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 13425804)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 13425992)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 13426214)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 13425686)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 13425533)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 13426046)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 13425744)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 13425872)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 13426284)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 13426268)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 13426292)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 13425940)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 13425773)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 13426028)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 13425933)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 1259 OID 13425766)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2577 (class 1259 OID 13425963)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2578 (class 1259 OID 13425964)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2663 (class 1259 OID 13426305)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2664 (class 1259 OID 13426304)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2450 (class 1259 OID 13425639)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2542 (class 1259 OID 13425865)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2650 (class 1259 OID 13426272)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2651 (class 1259 OID 13426271)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2652 (class 1259 OID 13426273)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2653 (class 1259 OID 13426270)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2654 (class 1259 OID 13426269)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2536 (class 1259 OID 13425851)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2537 (class 1259 OID 13425850)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2487 (class 1259 OID 13425745)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2564 (class 1259 OID 13425922)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2565 (class 1259 OID 13425924)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2566 (class 1259 OID 13425923)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2475 (class 1259 OID 13425717)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2476 (class 1259 OID 13425716)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2633 (class 1259 OID 13426203)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2587 (class 1259 OID 13426017)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2588 (class 1259 OID 13426018)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2589 (class 1259 OID 13426019)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2660 (class 1259 OID 13426293)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2596 (class 1259 OID 13426051)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2597 (class 1259 OID 13426048)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2598 (class 1259 OID 13426052)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2599 (class 1259 OID 13426050)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2600 (class 1259 OID 13426049)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2465 (class 1259 OID 13425688)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2466 (class 1259 OID 13425687)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2441 (class 1259 OID 13425611)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2552 (class 1259 OID 13425889)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2505 (class 1259 OID 13425779)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2431 (class 1259 OID 13425565)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2432 (class 1259 OID 13425566)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2557 (class 1259 OID 13425909)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2558 (class 1259 OID 13425908)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2559 (class 1259 OID 13425907)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2479 (class 1259 OID 13425723)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2480 (class 1259 OID 13425725)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2481 (class 1259 OID 13425724)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 13426234)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2516 (class 1259 OID 13425817)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2517 (class 1259 OID 13425815)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2518 (class 1259 OID 13425814)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2519 (class 1259 OID 13425816)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2422 (class 1259 OID 13425539)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2423 (class 1259 OID 13425540)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2545 (class 1259 OID 13425873)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2673 (class 1259 OID 13426328)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2674 (class 1259 OID 13426336)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2675 (class 1259 OID 13426337)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2531 (class 1259 OID 13425838)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2573 (class 1259 OID 13425950)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2574 (class 1259 OID 13425951)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2617 (class 1259 OID 13426131)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2618 (class 1259 OID 13426130)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2619 (class 1259 OID 13426127)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2620 (class 1259 OID 13426128)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2621 (class 1259 OID 13426129)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2454 (class 1259 OID 13425653)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2455 (class 1259 OID 13425652)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2456 (class 1259 OID 13425654)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2625 (class 1259 OID 13426184)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2626 (class 1259 OID 13426185)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2610 (class 1259 OID 13426081)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2611 (class 1259 OID 13426082)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2612 (class 1259 OID 13426079)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2613 (class 1259 OID 13426080)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2570 (class 1259 OID 13425941)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2522 (class 1259 OID 13425826)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2523 (class 1259 OID 13425825)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2524 (class 1259 OID 13425823)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2525 (class 1259 OID 13425824)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 13426069)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2607 (class 1259 OID 13426068)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2622 (class 1259 OID 13426175)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2486 (class 1259 OID 13425736)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2640 (class 1259 OID 13426221)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2667 (class 1259 OID 13426311)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2668 (class 1259 OID 13426312)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2437 (class 1259 OID 13425586)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2438 (class 1259 OID 13425585)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2446 (class 1259 OID 13425618)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 13425619)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2511 (class 1259 OID 13425807)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2512 (class 1259 OID 13425806)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2513 (class 1259 OID 13425805)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2493 (class 1259 OID 13425768)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2494 (class 1259 OID 13425764)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2495 (class 1259 OID 13425761)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2496 (class 1259 OID 13425762)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2497 (class 1259 OID 13425760)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2498 (class 1259 OID 13425765)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2499 (class 1259 OID 13425763)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2453 (class 1259 OID 13425638)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2471 (class 1259 OID 13425702)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2472 (class 1259 OID 13425704)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2473 (class 1259 OID 13425703)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2474 (class 1259 OID 13425705)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2530 (class 1259 OID 13425832)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2592 (class 1259 OID 13426016)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 13426047)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2444 (class 1259 OID 13425609)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2445 (class 1259 OID 13425610)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2567 (class 1259 OID 13425934)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 13426245)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2464 (class 1259 OID 13425674)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 13426233)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2550 (class 1259 OID 13425883)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2551 (class 1259 OID 13425882)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 13426078)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2461 (class 1259 OID 13425662)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 13426029)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2657 (class 1259 OID 13426285)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2631 (class 1259 OID 13426192)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2632 (class 1259 OID 13426193)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2510 (class 1259 OID 13425794)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2430 (class 1259 OID 13425559)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2500 (class 1259 OID 13425767)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2703 (class 2606 OID 13426473)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2706 (class 2606 OID 13426458)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2705 (class 2606 OID 13426463)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2701 (class 2606 OID 13426483)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2707 (class 2606 OID 13426453)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2702 (class 2606 OID 13426478)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2704 (class 2606 OID 13426468)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2737 (class 2606 OID 13426628)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2736 (class 2606 OID 13426633)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2770 (class 2606 OID 13426803)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2771 (class 2606 OID 13426798)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2688 (class 2606 OID 13426388)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2724 (class 2606 OID 13426568)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2765 (class 2606 OID 13426783)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2766 (class 2606 OID 13426778)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2764 (class 2606 OID 13426788)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2767 (class 2606 OID 13426773)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2768 (class 2606 OID 13426768)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2722 (class 2606 OID 13426563)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2723 (class 2606 OID 13426558)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2700 (class 2606 OID 13426448)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2732 (class 2606 OID 13426598)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2730 (class 2606 OID 13426608)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2731 (class 2606 OID 13426603)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2694 (class 2606 OID 13426423)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2695 (class 2606 OID 13426418)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2720 (class 2606 OID 13426548)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2761 (class 2606 OID 13426753)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2740 (class 2606 OID 13426638)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2739 (class 2606 OID 13426643)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2738 (class 2606 OID 13426648)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2769 (class 2606 OID 13426793)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2742 (class 2606 OID 13426668)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2745 (class 2606 OID 13426653)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2741 (class 2606 OID 13426673)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2743 (class 2606 OID 13426663)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2744 (class 2606 OID 13426658)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2692 (class 2606 OID 13426413)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2693 (class 2606 OID 13426408)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2684 (class 2606 OID 13426373)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2685 (class 2606 OID 13426368)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2726 (class 2606 OID 13426578)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2708 (class 2606 OID 13426488)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2681 (class 2606 OID 13426348)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2680 (class 2606 OID 13426353)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2727 (class 2606 OID 13426593)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2728 (class 2606 OID 13426588)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2729 (class 2606 OID 13426583)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2698 (class 2606 OID 13426428)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2696 (class 2606 OID 13426438)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2697 (class 2606 OID 13426433)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2763 (class 2606 OID 13426763)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2712 (class 2606 OID 13426523)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2714 (class 2606 OID 13426513)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2715 (class 2606 OID 13426508)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2713 (class 2606 OID 13426518)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2679 (class 2606 OID 13426338)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2678 (class 2606 OID 13426343)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2725 (class 2606 OID 13426573)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2774 (class 2606 OID 13426818)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2776 (class 2606 OID 13426823)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2775 (class 2606 OID 13426828)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2721 (class 2606 OID 13426553)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2735 (class 2606 OID 13426618)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2734 (class 2606 OID 13426623)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2752 (class 2606 OID 13426728)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2753 (class 2606 OID 13426723)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2756 (class 2606 OID 13426708)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2755 (class 2606 OID 13426713)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2754 (class 2606 OID 13426718)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2690 (class 2606 OID 13426398)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2691 (class 2606 OID 13426393)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2689 (class 2606 OID 13426403)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2759 (class 2606 OID 13426738)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2758 (class 2606 OID 13426743)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2749 (class 2606 OID 13426698)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2748 (class 2606 OID 13426703)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2751 (class 2606 OID 13426688)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2750 (class 2606 OID 13426693)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2733 (class 2606 OID 13426613)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2716 (class 2606 OID 13426543)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2717 (class 2606 OID 13426538)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2719 (class 2606 OID 13426528)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2718 (class 2606 OID 13426533)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2746 (class 2606 OID 13426683)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2747 (class 2606 OID 13426678)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2757 (class 2606 OID 13426733)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2699 (class 2606 OID 13426443)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2760 (class 2606 OID 13426748)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2762 (class 2606 OID 13426758)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2773 (class 2606 OID 13426808)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2772 (class 2606 OID 13426813)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2682 (class 2606 OID 13426363)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2683 (class 2606 OID 13426358)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2687 (class 2606 OID 13426378)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2686 (class 2606 OID 13426383)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2709 (class 2606 OID 13426503)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2710 (class 2606 OID 13426498)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2711 (class 2606 OID 13426493)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-13 11:27:07 CEST

--
-- PostgreSQL database dump complete
--

