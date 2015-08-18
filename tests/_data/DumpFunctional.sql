--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-18 11:56:39 CEST

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
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 240
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 177 (class 1259 OID 14616062)
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
-- TOC entry 222 (class 1259 OID 14616565)
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
-- TOC entry 221 (class 1259 OID 14616548)
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
-- TOC entry 215 (class 1259 OID 14616460)
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
-- TOC entry 238 (class 1259 OID 14616808)
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
-- TOC entry 191 (class 1259 OID 14616241)
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
-- TOC entry 194 (class 1259 OID 14616275)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 14616710)
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
-- TOC entry 186 (class 1259 OID 14616184)
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
-- TOC entry 223 (class 1259 OID 14616578)
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
-- TOC entry 210 (class 1259 OID 14616405)
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
-- TOC entry 189 (class 1259 OID 14616221)
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
-- TOC entry 193 (class 1259 OID 14616269)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 14616201)
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
-- TOC entry 199 (class 1259 OID 14616322)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 236 (class 1259 OID 14616789)
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
-- TOC entry 237 (class 1259 OID 14616801)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 14616823)
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
-- TOC entry 203 (class 1259 OID 14616347)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 14616158)
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
-- TOC entry 178 (class 1259 OID 14616071)
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
-- TOC entry 179 (class 1259 OID 14616082)
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
-- TOC entry 174 (class 1259 OID 14616036)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 14616055)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 14616354)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 14616385)
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
-- TOC entry 218 (class 1259 OID 14616499)
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
-- TOC entry 181 (class 1259 OID 14616115)
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
-- TOC entry 183 (class 1259 OID 14616150)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 14616328)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 14616135)
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
-- TOC entry 188 (class 1259 OID 14616213)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 14616340)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 14616671)
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
-- TOC entry 226 (class 1259 OID 14616681)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 224 (class 1259 OID 14616627)
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
-- TOC entry 227 (class 1259 OID 14616689)
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
-- TOC entry 206 (class 1259 OID 14616369)
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
-- TOC entry 198 (class 1259 OID 14616313)
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
-- TOC entry 197 (class 1259 OID 14616303)
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
-- TOC entry 217 (class 1259 OID 14616488)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 14616437)
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
-- TOC entry 171 (class 1259 OID 14616007)
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
-- TOC entry 170 (class 1259 OID 14616005)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 207 (class 1259 OID 14616379)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 14616045)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 14616029)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 14616393)
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
-- TOC entry 201 (class 1259 OID 14616334)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 14616280)
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
-- TOC entry 232 (class 1259 OID 14616730)
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
-- TOC entry 231 (class 1259 OID 14616722)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 14616717)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 14616447)
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
-- TOC entry 180 (class 1259 OID 14616107)
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
-- TOC entry 196 (class 1259 OID 14616290)
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
-- TOC entry 216 (class 1259 OID 14616477)
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
-- TOC entry 228 (class 1259 OID 14616699)
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
-- TOC entry 185 (class 1259 OID 14616170)
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
-- TOC entry 172 (class 1259 OID 14616016)
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
-- TOC entry 220 (class 1259 OID 14616525)
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
-- TOC entry 190 (class 1259 OID 14616232)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 14616361)
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
-- TOC entry 234 (class 1259 OID 14616769)
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
-- TOC entry 233 (class 1259 OID 14616741)
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
-- TOC entry 235 (class 1259 OID 14616781)
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
-- TOC entry 212 (class 1259 OID 14616430)
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
-- TOC entry 192 (class 1259 OID 14616264)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 14616515)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 14616420)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2170 (class 2604 OID 14616010)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2890 (class 0 OID 14616062)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 14616565)
-- Dependencies: 222
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55d3-0156-7c5f-3c6e0087c3dd	000d0000-55d3-0156-cb59-8f4853ac6b48	\N	00090000-55d3-0156-f915-ed19b41645cd	000b0000-55d3-0156-fb1e-8030e70d6fcb	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55d3-0156-acba-ad4df02bc637	000d0000-55d3-0156-30cc-950f620fe66b	00100000-55d3-0156-72f9-d590fc5aefb4	00090000-55d3-0156-853b-44b772c0655b	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55d3-0156-94f6-8b0373da55cf	000d0000-55d3-0156-d0fc-42dca92b329c	00100000-55d3-0156-6818-fffc7b5b3536	00090000-55d3-0156-6d49-38a96e65c071	\N	0003	t	\N	2015-08-18	\N	2	\N	\N	f	f
000c0000-55d3-0156-cb65-524fdf5179cb	000d0000-55d3-0156-2ce1-4856904ec3ee	\N	00090000-55d3-0156-1085-1702dd2e88c0	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55d3-0156-9827-fce44a3a4430	000d0000-55d3-0156-7e5d-5e2a1243b318	\N	00090000-55d3-0156-41fd-05922f429110	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55d3-0156-f2ae-191f2d7cce59	000d0000-55d3-0156-cf44-82f8b19812c7	\N	00090000-55d3-0156-bbcc-768dcbd1c433	000b0000-55d3-0156-cec6-2bb4159ce4c8	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55d3-0156-6771-856a22d7fda9	000d0000-55d3-0156-8384-ba496c0bf8ed	00100000-55d3-0156-44ab-f43f207ab46d	00090000-55d3-0156-69f9-b6ceb89a9748	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55d3-0156-f070-a6de9fde2598	000d0000-55d3-0156-ad09-9e51010aceb9	\N	00090000-55d3-0156-3521-0e2d067af7f9	000b0000-55d3-0156-d892-599ddc62e103	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55d3-0156-ec0d-ab964a52e9a9	000d0000-55d3-0156-8384-ba496c0bf8ed	00100000-55d3-0156-72f8-c7a8ea8749c1	00090000-55d3-0156-9564-5759a1eb9c35	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55d3-0156-e4dd-a241c0b601c2	000d0000-55d3-0156-8384-ba496c0bf8ed	00100000-55d3-0156-8c75-602ed865f8ff	00090000-55d3-0156-4f8a-6a1d88f7b71a	\N	0010	t	\N	2015-08-18	\N	16	\N	\N	f	t
000c0000-55d3-0156-e838-97faa9c130ae	000d0000-55d3-0156-8384-ba496c0bf8ed	00100000-55d3-0156-f4f7-d58abccea7ce	00090000-55d3-0156-a0d8-ffb7bc94f2f8	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2934 (class 0 OID 14616548)
-- Dependencies: 221
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 14616460)
-- Dependencies: 215
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55d3-0156-c6dd-35af2bef080d	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55d3-0156-9294-b79325452f86	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55d3-0156-b936-488191cc057f	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2951 (class 0 OID 14616808)
-- Dependencies: 238
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 14616241)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55d3-0156-c51f-86b8cc819f4f	\N	\N	00200000-55d3-0156-789f-426cf9381e0d	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55d3-0156-98e1-667f1435457c	\N	\N	00200000-55d3-0156-770b-c4b18ba369e3	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55d3-0156-d1b4-4fecc3dc6d13	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55d3-0156-a8e9-37b4eab3c48b	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55d3-0156-6926-d696b7fdd288	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2907 (class 0 OID 14616275)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2942 (class 0 OID 14616710)
-- Dependencies: 229
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 14616184)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55d3-0154-366c-93224f58b010	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55d3-0154-5709-68d4ce39f24f	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55d3-0154-d0b0-af7e80cf621c	AL	ALB	008	Albania 	Albanija	\N
00040000-55d3-0154-a5a9-ccc771148b56	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55d3-0154-06af-dc2ac0c9a8d4	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55d3-0154-9d09-66de59ebdaec	AD	AND	020	Andorra 	Andora	\N
00040000-55d3-0154-82a7-37ba9319c262	AO	AGO	024	Angola 	Angola	\N
00040000-55d3-0154-b4f3-34def9b68e70	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55d3-0154-b0c7-4b9e8f010c56	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55d3-0154-3eb8-d006de93abca	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55d3-0154-0cda-b51e5b9d3a98	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55d3-0154-db93-c1ad59fb703f	AM	ARM	051	Armenia 	Armenija	\N
00040000-55d3-0154-b1f7-0e3b1f005e38	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55d3-0154-fb86-d2b0e3452e64	AU	AUS	036	Australia 	Avstralija	\N
00040000-55d3-0154-9a53-82c780cca4f8	AT	AUT	040	Austria 	Avstrija	\N
00040000-55d3-0154-d047-6c06976ecb23	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55d3-0154-e185-66df14f8c1eb	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55d3-0154-b3e4-8004ad57e80a	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55d3-0154-ad47-f86a3cbf9ec5	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55d3-0154-e890-a9aa459849cb	BB	BRB	052	Barbados 	Barbados	\N
00040000-55d3-0154-da92-8b61c9039ec5	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55d3-0154-86cd-5a322045bdfe	BE	BEL	056	Belgium 	Belgija	\N
00040000-55d3-0154-4914-5f315701a102	BZ	BLZ	084	Belize 	Belize	\N
00040000-55d3-0154-203e-65c21a90971c	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55d3-0154-5969-769c3753e1ed	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55d3-0154-4c66-2b616eeb8f90	BT	BTN	064	Bhutan 	Butan	\N
00040000-55d3-0154-b076-bacbaf0b40e8	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55d3-0154-7b0c-599b4be05788	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55d3-0154-901a-7a830474c4a7	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55d3-0154-1c5b-c03e19d38368	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55d3-0154-3544-72ba13133ad2	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55d3-0154-c3be-1ddfb0b6d8b3	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55d3-0154-6932-9aeaff06776f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55d3-0154-90c6-6c2d36bbb666	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55d3-0154-a725-8420fa0d249b	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55d3-0154-a50b-f43e4362d627	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55d3-0154-4451-7134bb847459	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55d3-0154-2f68-09b67a644c2e	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55d3-0154-6937-4318d6c6cc90	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55d3-0154-297e-ad3f44524452	CA	CAN	124	Canada 	Kanada	\N
00040000-55d3-0154-5414-9c85007797c3	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55d3-0154-2339-fec9a80ab702	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55d3-0154-7484-d74e2028ca72	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55d3-0154-fa1b-4bfda343dea4	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55d3-0154-e3b4-f0c769516f4e	CL	CHL	152	Chile 	Čile	\N
00040000-55d3-0154-65eb-f7d477e300fb	CN	CHN	156	China 	Kitajska	\N
00040000-55d3-0154-d48a-0560dcd92dd8	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55d3-0154-1cd5-1926f5c234a5	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55d3-0154-21dc-11a6a38b3a6c	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55d3-0154-4995-77e6959fca36	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55d3-0154-90da-43cd798b8b9a	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55d3-0154-dc94-c9616fe0b034	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55d3-0154-b25f-7b31dd49576e	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55d3-0154-70d8-9d7477c10966	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55d3-0154-7235-ad28a2e19036	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55d3-0154-853c-90a90ff885a2	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55d3-0154-07e1-9ba2db7cb92d	CU	CUB	192	Cuba 	Kuba	\N
00040000-55d3-0154-eac7-4ed60d61df40	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55d3-0154-9404-d7698ef7029d	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55d3-0154-c34a-adc34165714a	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55d3-0154-c14f-189cc28b150a	DK	DNK	208	Denmark 	Danska	\N
00040000-55d3-0154-e1d6-7282774f6d6a	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55d3-0154-69d0-56b98313f58b	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55d3-0154-d953-783a89e5183f	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55d3-0154-5489-47221676364a	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55d3-0154-de38-4b40323f6d48	EG	EGY	818	Egypt 	Egipt	\N
00040000-55d3-0154-c0ef-4c87fcb57998	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55d3-0154-06d9-b1f095cb3223	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55d3-0154-a30d-2a86abf5d575	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55d3-0154-d94e-d3aa99a440af	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55d3-0154-ac6f-fae73ec025a4	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55d3-0154-f161-32f78801ce75	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55d3-0154-8cc4-75e02ead249f	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55d3-0154-870d-1ccfd20b164f	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55d3-0154-8808-b49b49c9c31f	FI	FIN	246	Finland 	Finska	\N
00040000-55d3-0154-4d79-612a6547834b	FR	FRA	250	France 	Francija	\N
00040000-55d3-0154-e5fd-6c2e0d7e2ab8	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55d3-0154-a2e2-4a061a9dfe71	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55d3-0154-9ad4-542236af282b	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55d3-0154-2486-e4293858c274	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55d3-0154-0bc0-ccb10f69203a	GA	GAB	266	Gabon 	Gabon	\N
00040000-55d3-0154-dbcb-41158a363a2b	GM	GMB	270	Gambia 	Gambija	\N
00040000-55d3-0154-8950-49bbcc589e47	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55d3-0154-f29b-1e65f050d038	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55d3-0154-cc51-6cb18cfca48e	GH	GHA	288	Ghana 	Gana	\N
00040000-55d3-0154-01a1-b6ae899afc45	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55d3-0154-34d0-feeb8b260433	GR	GRC	300	Greece 	Grčija	\N
00040000-55d3-0154-d92f-0a8865bc676c	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55d3-0154-61ff-feb5958229f8	GD	GRD	308	Grenada 	Grenada	\N
00040000-55d3-0154-cc78-a41d3f0f30a4	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55d3-0154-b01a-33443f8227c4	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55d3-0154-23ba-7e7ec99c69f1	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55d3-0154-4a11-961a5d320342	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55d3-0154-6659-f91de641d408	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55d3-0154-bc59-8b6f31dbcda1	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55d3-0154-4ee8-4e7f236e42d4	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55d3-0154-9f9d-b155a9500973	HT	HTI	332	Haiti 	Haiti	\N
00040000-55d3-0154-e4bd-681470197dea	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55d3-0154-2998-01886813fbe9	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55d3-0154-2d3d-5c9d9ca5c6c8	HN	HND	340	Honduras 	Honduras	\N
00040000-55d3-0154-1bd8-6621318635c1	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55d3-0154-d8ea-c6f3d5081732	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55d3-0154-41bc-09acfee55a0d	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55d3-0154-80b2-89ef3594d139	IN	IND	356	India 	Indija	\N
00040000-55d3-0154-c120-f2af924d69e3	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55d3-0154-3895-40692fb34348	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55d3-0154-b28a-8be7ed149afa	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55d3-0154-5926-2377731640d5	IE	IRL	372	Ireland 	Irska	\N
00040000-55d3-0154-f397-be5f024121bc	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55d3-0154-aa63-064295f9543b	IL	ISR	376	Israel 	Izrael	\N
00040000-55d3-0154-60da-143bcf01ba10	IT	ITA	380	Italy 	Italija	\N
00040000-55d3-0154-95e7-93390e68ae07	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55d3-0154-ae08-8d57210aaf0e	JP	JPN	392	Japan 	Japonska	\N
00040000-55d3-0154-6dbe-ea2368a895bb	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55d3-0154-13ae-cedc09d267a7	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55d3-0154-a9f9-b21c66b2cbed	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55d3-0154-7e57-575a265a6dfd	KE	KEN	404	Kenya 	Kenija	\N
00040000-55d3-0154-6a61-0d8983db552d	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55d3-0154-2ee6-449cb3ec0a5d	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55d3-0154-0200-640b324bf340	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55d3-0154-6192-f380e1562991	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55d3-0154-9883-84fc10a2f00e	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55d3-0154-2cfc-50233534803d	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55d3-0154-4923-e393ac79b21e	LV	LVA	428	Latvia 	Latvija	\N
00040000-55d3-0154-7d3c-92fb7fc09ec8	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55d3-0154-060c-6e50a13dabf2	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55d3-0154-0944-0c0493524a4b	LR	LBR	430	Liberia 	Liberija	\N
00040000-55d3-0154-94d1-98edf7f7eb07	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55d3-0154-28a6-d749e61e566e	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55d3-0154-7fb1-4fba509f1138	LT	LTU	440	Lithuania 	Litva	\N
00040000-55d3-0154-9c40-69bfa8fa7d45	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55d3-0154-0666-c57d0f5d9ae0	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55d3-0154-8186-32c02541fde6	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55d3-0154-1afb-5cd7d0183158	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55d3-0154-e9a2-585353541ed1	MW	MWI	454	Malawi 	Malavi	\N
00040000-55d3-0154-3f29-52be33b65086	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55d3-0154-5cfc-79060b9758bc	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55d3-0154-b5d1-f58980effb9b	ML	MLI	466	Mali 	Mali	\N
00040000-55d3-0154-1aa5-2362faa7d35a	MT	MLT	470	Malta 	Malta	\N
00040000-55d3-0154-e957-ec8263bd2779	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55d3-0154-a6f9-c958ea00d16d	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55d3-0154-dc66-8cb24a1afb75	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55d3-0154-c9b2-2aa7291c5fb2	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55d3-0154-6d04-9d91d4b9c929	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55d3-0154-6fea-dd93c0eb78cf	MX	MEX	484	Mexico 	Mehika	\N
00040000-55d3-0154-9843-166018f23abb	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55d3-0154-e5f7-b8941054936f	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55d3-0154-3649-76eb06fd3241	MC	MCO	492	Monaco 	Monako	\N
00040000-55d3-0154-3723-bd21578a2a85	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55d3-0154-0d9f-277e6a711413	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55d3-0154-e924-fe05305adfda	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55d3-0154-c7b0-69c7ddc198c9	MA	MAR	504	Morocco 	Maroko	\N
00040000-55d3-0154-9941-d369f835016a	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55d3-0154-f42f-29e6f65415a2	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55d3-0154-4ca6-d3e5d9650523	NA	NAM	516	Namibia 	Namibija	\N
00040000-55d3-0154-c624-c445a0f2da37	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55d3-0154-7b09-d209b2345952	NP	NPL	524	Nepal 	Nepal	\N
00040000-55d3-0154-4a14-7e68418dedd8	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55d3-0154-245f-65b23682e54e	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55d3-0154-b4df-de265036c5d6	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55d3-0154-1fa6-7d1365c66368	NE	NER	562	Niger 	Niger 	\N
00040000-55d3-0154-812e-9f1f63da5951	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55d3-0154-c1e3-3619e863c507	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55d3-0154-a98c-0c69522522fa	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55d3-0154-1c76-71ff75030d02	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55d3-0154-c02a-0159cdc75e7c	NO	NOR	578	Norway 	Norveška	\N
00040000-55d3-0154-8ec3-23962aabc05a	OM	OMN	512	Oman 	Oman	\N
00040000-55d3-0154-9a68-b7bee0cdb9a6	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55d3-0154-34a1-4c648661511e	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55d3-0154-c420-50e54055fb10	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55d3-0154-6153-c4b45926ceea	PA	PAN	591	Panama 	Panama	\N
00040000-55d3-0154-fc91-f9eba5613a3d	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55d3-0154-798f-b1bffe79d458	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55d3-0154-ca1b-2ba3a2898468	PE	PER	604	Peru 	Peru	\N
00040000-55d3-0154-fbc2-2a10cce41241	PH	PHL	608	Philippines 	Filipini	\N
00040000-55d3-0154-e74c-61e8eec355b3	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55d3-0154-33e1-22ec9737d286	PL	POL	616	Poland 	Poljska	\N
00040000-55d3-0154-25d6-4c4a104d3697	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55d3-0154-8ea7-5131cde485ff	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55d3-0154-89e6-08f0c083449a	QA	QAT	634	Qatar 	Katar	\N
00040000-55d3-0154-94c3-82b64262cb8b	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55d3-0154-45e2-d2a843ecda3b	RO	ROU	642	Romania 	Romunija	\N
00040000-55d3-0154-b888-facac2faa16f	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55d3-0154-94fc-4e92ba602ca3	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55d3-0154-5e92-1dc2952d7701	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55d3-0154-65df-4550fe318084	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55d3-0154-0220-9fcc686712cd	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55d3-0154-b7ea-569e82a16a48	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55d3-0154-49f8-dee0b22b1053	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55d3-0154-75b1-ea4437ef1f57	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55d3-0154-9b48-780c1b7534cd	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55d3-0154-b76a-6d7033e0264e	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55d3-0154-0426-5264eae99243	SM	SMR	674	San Marino 	San Marino	\N
00040000-55d3-0154-1045-abf049e02769	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55d3-0154-4ea9-df303c3db16a	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55d3-0154-3a0f-b0c04fb5f594	SN	SEN	686	Senegal 	Senegal	\N
00040000-55d3-0154-7c50-930fa0b5696c	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55d3-0154-44bc-710c0b0ede05	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55d3-0154-a248-61be48e5c7aa	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55d3-0154-309f-5b1f23f1c264	SG	SGP	702	Singapore 	Singapur	\N
00040000-55d3-0154-56cd-a339dfe4c51e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55d3-0154-c614-44ffa1fabdf4	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55d3-0154-5a1a-d9be25dd670b	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55d3-0154-b69d-f94e3ef9dc41	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55d3-0154-9153-08ffcac57514	SO	SOM	706	Somalia 	Somalija	\N
00040000-55d3-0154-58aa-be66e1787ea0	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55d3-0154-de79-6084ade26bb9	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55d3-0154-2e7e-5b25674f0f55	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55d3-0154-b8c2-f68f307802c7	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55d3-0154-88e6-c36c41356060	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55d3-0154-1f17-34518a9aac87	SD	SDN	729	Sudan 	Sudan	\N
00040000-55d3-0154-6fd5-2ac0b0b09ec4	SR	SUR	740	Suriname 	Surinam	\N
00040000-55d3-0154-0fde-1ad049e7815a	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55d3-0154-e61a-5bc6a7a49d29	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55d3-0154-ecee-0918add155f8	SE	SWE	752	Sweden 	Švedska	\N
00040000-55d3-0154-587d-3d539925a27e	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55d3-0154-08ff-a9d6bfc08d64	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55d3-0154-b511-53b4887b1302	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55d3-0154-e7d9-a8389f76de62	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55d3-0154-bdc3-b1ab2316fcd4	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55d3-0154-9bbf-44cce447ffef	TH	THA	764	Thailand 	Tajska	\N
00040000-55d3-0154-f6ac-da5858c4550c	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55d3-0154-161c-9a884c365a4e	TG	TGO	768	Togo 	Togo	\N
00040000-55d3-0154-bc3e-142322ae332e	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55d3-0154-1cc0-b448b2be6416	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55d3-0154-ad12-10f977d76ef4	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55d3-0154-1096-507285c3f2a5	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55d3-0154-483f-13496957333f	TR	TUR	792	Turkey 	Turčija	\N
00040000-55d3-0154-77d0-7a70e88182bd	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55d3-0154-ac6f-473662e728a4	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55d3-0154-9b18-062992335bef	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55d3-0154-9af7-4bbfbbdfe9a2	UG	UGA	800	Uganda 	Uganda	\N
00040000-55d3-0154-9172-4907ccbaebce	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55d3-0154-2ab7-0a7236b9c2b1	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55d3-0154-b3ff-3731b5113c88	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55d3-0154-efb4-0195cd6bf84e	US	USA	840	United States 	Združene države Amerike	\N
00040000-55d3-0154-da08-b13b8b120c00	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55d3-0154-4a50-68e73c74d29a	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55d3-0154-9f38-0cbcac07f7a5	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55d3-0154-1599-654e59493298	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55d3-0154-28cf-5d9886ab62a7	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55d3-0154-cc32-35cb7e56ab61	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55d3-0154-1f1d-089542e6fab5	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55d3-0154-b8e2-defcf98fedf9	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55d3-0154-d356-2c0c67ed4052	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55d3-0154-7ce0-1d4b561b60c4	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55d3-0154-aff7-5d03b0d1879f	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55d3-0154-4573-e86ed349f6db	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55d3-0154-6e4d-3bc4f5b5fccd	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2936 (class 0 OID 14616578)
-- Dependencies: 223
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, naziv, sort, tipprogramskeenote_id, tip, strosekodkpred, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55d3-0156-5ec8-4e8c1d0936fe	000e0000-55d3-0156-04da-d1d3aa7a14f5	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	1	0	0	0		\N	002b0000-55d3-0155-9c18-cb2a5d65da8b	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55d3-0156-6ead-0fbbf45aceb4	000e0000-55d3-0156-a79d-cc2705e9d44d	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55d3-0155-bbd1-ad2857b7af87	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55d3-0156-4974-16aac97ecd74	000e0000-55d3-0156-57b5-00d4bf1e0d2f	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	1	0	0	0		\N	002b0000-55d3-0155-9c18-cb2a5d65da8b	premiera	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55d3-0156-04d3-0bf5171bba9a	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	Urejanje portala	10	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55d3-0156-2ed9-9379501d2706	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	Delavnice otroci	8	\N	razno	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2923 (class 0 OID 14616405)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55d3-0156-8384-ba496c0bf8ed	000e0000-55d3-0156-a79d-cc2705e9d44d	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55d3-0155-b681-e3bdd89b3731
000d0000-55d3-0156-cb59-8f4853ac6b48	000e0000-55d3-0156-a79d-cc2705e9d44d	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55d3-0155-b681-e3bdd89b3731
000d0000-55d3-0156-30cc-950f620fe66b	000e0000-55d3-0156-a79d-cc2705e9d44d	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55d3-0155-4a0f-8858db79e17f
000d0000-55d3-0156-d0fc-42dca92b329c	000e0000-55d3-0156-a79d-cc2705e9d44d	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55d3-0155-d96c-f9812f63191b
000d0000-55d3-0156-2ce1-4856904ec3ee	000e0000-55d3-0156-a79d-cc2705e9d44d	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55d3-0155-84d8-632afaffef8f
000d0000-55d3-0156-7e5d-5e2a1243b318	000e0000-55d3-0156-a79d-cc2705e9d44d	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-55d3-0155-62c2-349cb16fb57c
000d0000-55d3-0156-cf44-82f8b19812c7	000e0000-55d3-0156-a79d-cc2705e9d44d	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55d3-0155-b681-e3bdd89b3731
000d0000-55d3-0156-ad09-9e51010aceb9	000e0000-55d3-0156-a79d-cc2705e9d44d	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55d3-0155-fe99-15a66e102a13
\.


--
-- TOC entry 2902 (class 0 OID 14616221)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 14616269)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 14616201)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55d3-0156-0469-df49e9f9133d	00080000-55d3-0156-2032-2fa89d0f1e16	00090000-55d3-0156-4f8a-6a1d88f7b71a	AK		
\.


--
-- TOC entry 2912 (class 0 OID 14616322)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 14616789)
-- Dependencies: 236
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 14616801)
-- Dependencies: 237
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 14616823)
-- Dependencies: 239
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2916 (class 0 OID 14616347)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 14616158)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55d3-0154-2349-4b7fefaed2cb	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-55d3-0154-208b-aea8593ef69b	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55d3-0154-dd8e-a8f7380dbe11	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55d3-0154-4777-5627da8932ff	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55d3-0154-fe8b-be2a3804450b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55d3-0154-0d79-fae33d3f03af	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55d3-0154-7586-7374d51aba90	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55d3-0154-0045-793727fe050b	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55d3-0154-ea90-d628201b03de	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55d3-0154-031a-3d0cd4c523be	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55d3-0154-9cdd-e1879963f048	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55d3-0154-014c-4f4dffd33413	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55d3-0154-0ab4-35cac4804488	strosekuprizoritve.tipstroska	array	a:3:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55d3-0154-25f2-005a81c15a95	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55d3-0156-ea6a-9b1051f34f31	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-55d3-0156-ed7f-050b6949ae61	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55d3-0156-2396-be8fa6bf68a2	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55d3-0156-469a-c4b2c634e1d9	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55d3-0156-7fb5-140cc9f610d8	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55d3-0156-77e9-8e6cf9ac199b	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2891 (class 0 OID 14616071)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55d3-0156-d0ba-9261b7d37d2c	00000000-55d3-0156-ed7f-050b6949ae61	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55d3-0156-1ce2-dda18b79003e	00000000-55d3-0156-ed7f-050b6949ae61	00010000-55d3-0154-1265-46f340ca8be5	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55d3-0156-43f2-8325e153310a	00000000-55d3-0156-2396-be8fa6bf68a2	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2892 (class 0 OID 14616082)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55d3-0156-f915-ed19b41645cd	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55d3-0156-1085-1702dd2e88c0	00010000-55d3-0156-f3c7-4a3c15607152	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55d3-0156-6d49-38a96e65c071	00010000-55d3-0156-78b3-24b0b91f544e	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55d3-0156-9564-5759a1eb9c35	00010000-55d3-0156-ba90-e0a08b605329	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55d3-0156-fe7b-d02a6b425834	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55d3-0156-bbcc-768dcbd1c433	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55d3-0156-a0d8-ffb7bc94f2f8	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55d3-0156-69f9-b6ceb89a9748	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55d3-0156-4f8a-6a1d88f7b71a	00010000-55d3-0156-276e-b6bcd85ee699	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55d3-0156-853b-44b772c0655b	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55d3-0156-7d70-81ed0384dece	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55d3-0156-41fd-05922f429110	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55d3-0156-3521-0e2d067af7f9	00010000-55d3-0156-08fb-384c73d52708	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2887 (class 0 OID 14616036)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55d3-0154-b7e6-df86e63fe3aa	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55d3-0154-be2a-3d06e797a2b3	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55d3-0154-48bd-dbb81c6b5498	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55d3-0154-2533-4e1eb275d2c9	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55d3-0154-fc6c-ec9ba90de477	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55d3-0154-1718-a151a028e2e0	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55d3-0154-7700-45f445ea67df	Abonma-read	Abonma - branje	f
00030000-55d3-0154-7c2f-a4cc9439a0b7	Abonma-write	Abonma - spreminjanje	f
00030000-55d3-0154-12be-bc0779c683ae	Alternacija-read	Alternacija - branje	f
00030000-55d3-0154-43ca-d304ee7cfbd4	Alternacija-write	Alternacija - spreminjanje	f
00030000-55d3-0154-c36d-c3579988eb34	Arhivalija-read	Arhivalija - branje	f
00030000-55d3-0154-a742-68507c86fc9a	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55d3-0154-72eb-92b00e54669c	Besedilo-read	Besedilo - branje	f
00030000-55d3-0154-ec68-089869a5f69e	Besedilo-write	Besedilo - spreminjanje	f
00030000-55d3-0154-72ec-a56a33154744	DogodekIzven-read	DogodekIzven - branje	f
00030000-55d3-0154-e70d-edee53cc51b2	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55d3-0154-5fa4-2ff709f1b59a	Dogodek-read	Dogodek - branje	f
00030000-55d3-0154-3b16-a9ae1c10bdd9	Dogodek-write	Dogodek - spreminjanje	f
00030000-55d3-0154-862b-665212215b89	DrugiVir-read	DrugiVir - branje	f
00030000-55d3-0154-27da-bf000ca75505	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55d3-0154-ceed-ea0da3a0aad8	Drzava-read	Drzava - branje	f
00030000-55d3-0154-f804-3424da266727	Drzava-write	Drzava - spreminjanje	f
00030000-55d3-0154-04a3-d2a43c81e2bf	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55d3-0154-7502-f588e9f7677b	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55d3-0154-abdd-02b6a86b3d76	Funkcija-read	Funkcija - branje	f
00030000-55d3-0154-b10b-7225e277ac13	Funkcija-write	Funkcija - spreminjanje	f
00030000-55d3-0154-be15-160e2aedc7be	Gostovanje-read	Gostovanje - branje	f
00030000-55d3-0154-249c-7e3da0b01be2	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55d3-0154-bcd4-c36bea9e2208	Gostujoca-read	Gostujoca - branje	f
00030000-55d3-0154-652c-1ade1c71a8c4	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55d3-0154-fe68-ccaa4a8c344e	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55d3-0154-fb19-bd456a5ef5de	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55d3-0154-01e5-1059d4100c0a	Kupec-read	Kupec - branje	f
00030000-55d3-0154-a87e-43447c0b454a	Kupec-write	Kupec - spreminjanje	f
00030000-55d3-0154-9215-c219c26907be	NacinPlacina-read	NacinPlacina - branje	f
00030000-55d3-0154-e7f9-f1bdb67082e0	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55d3-0154-a41d-7e8c51c42688	Option-read	Option - branje	f
00030000-55d3-0154-b006-94698e9438f9	Option-write	Option - spreminjanje	f
00030000-55d3-0154-a7ec-c3c37cfc1503	OptionValue-read	OptionValue - branje	f
00030000-55d3-0154-d5d1-43c7343f486d	OptionValue-write	OptionValue - spreminjanje	f
00030000-55d3-0154-aa33-2a0bc0bd8d32	Oseba-read	Oseba - branje	f
00030000-55d3-0154-f8d1-2d9dd0e30187	Oseba-write	Oseba - spreminjanje	f
00030000-55d3-0154-a600-bf1a4d147d44	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55d3-0154-0d9f-ddbc741acbe8	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55d3-0154-eeb7-804e4f568a47	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55d3-0154-f12e-be6ca8012f6c	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55d3-0154-dab0-8fddb395b588	Pogodba-read	Pogodba - branje	f
00030000-55d3-0154-c1b8-2d0841f12301	Pogodba-write	Pogodba - spreminjanje	f
00030000-55d3-0154-c7ff-b29d5fdafb62	Popa-read	Popa - branje	f
00030000-55d3-0154-ff88-33fdfb27182f	Popa-write	Popa - spreminjanje	f
00030000-55d3-0154-1beb-df1ade24e758	Posta-read	Posta - branje	f
00030000-55d3-0154-9d99-e12477560a2c	Posta-write	Posta - spreminjanje	f
00030000-55d3-0154-6453-7f6b47447fa0	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55d3-0154-e5a5-e10d690bc6a5	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55d3-0154-d5cf-20b1b1ae688f	PostniNaslov-read	PostniNaslov - branje	f
00030000-55d3-0154-7180-b0413a0c28fb	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55d3-0154-1460-b8640bf7b939	Predstava-read	Predstava - branje	f
00030000-55d3-0154-8759-23ba28b0d380	Predstava-write	Predstava - spreminjanje	f
00030000-55d3-0154-f334-344983fa8548	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55d3-0154-312a-e959a6feae96	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55d3-0154-cde9-fe070c8633f2	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55d3-0154-36e0-483b8b544c76	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55d3-0154-28db-ec0666d86d2a	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55d3-0154-e2ba-5c0d582e9eca	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55d3-0154-81d6-64303f727b12	ProgramDela-read	ProgramDela - branje	f
00030000-55d3-0154-3d2d-b545e1607b6d	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55d3-0154-1522-9e77391665e3	ProgramFestival-read	ProgramFestival - branje	f
00030000-55d3-0154-2351-ecec03bb9609	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55d3-0154-44a8-75723531f511	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55d3-0154-e2f1-5947e5665609	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55d3-0154-fad0-a53f81326dbf	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55d3-0154-e921-a76b6ea67f06	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55d3-0154-5cf3-0da4ed4e64da	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55d3-0154-4e62-21b41d4b5ed8	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55d3-0154-1575-13f262dae943	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55d3-0154-b8f9-11d19b229437	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55d3-0154-8307-4cd70cd447a2	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55d3-0154-1755-ff1300f72b39	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55d3-0154-6328-dcc4b403ba45	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55d3-0154-c22d-0d0a0ee86d5d	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55d3-0154-8af8-6a7e023e7fc4	ProgramRazno-read	ProgramRazno - branje	f
00030000-55d3-0154-28d4-a4b78d5d958f	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55d3-0154-2cf9-12a585322e18	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55d3-0154-a7ab-24de349efb31	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55d3-0154-f32b-aec5a18b620e	Prostor-read	Prostor - branje	f
00030000-55d3-0154-a461-7b77e63b8278	Prostor-write	Prostor - spreminjanje	f
00030000-55d3-0154-9494-20a61475720e	Racun-read	Racun - branje	f
00030000-55d3-0154-a0f7-f3a220c2fcee	Racun-write	Racun - spreminjanje	f
00030000-55d3-0154-c962-5d7f4d1184f2	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55d3-0154-1c79-d55701dd3f4e	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55d3-0154-56fd-fbff1ecf3489	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55d3-0154-bb7f-0956a4019f95	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55d3-0154-0ed8-2a883b9aea89	Rekvizit-read	Rekvizit - branje	f
00030000-55d3-0154-6bc7-c40f9beb2c08	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55d3-0154-d882-965ace4ebf39	Revizija-read	Revizija - branje	f
00030000-55d3-0154-95ae-7a7e044a0213	Revizija-write	Revizija - spreminjanje	f
00030000-55d3-0154-6270-8ff01bfc4acd	Rezervacija-read	Rezervacija - branje	f
00030000-55d3-0154-6f08-604d275769e1	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55d3-0154-fdc0-8a84c45675e5	SedezniRed-read	SedezniRed - branje	f
00030000-55d3-0154-a72d-3d7b55dc76da	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55d3-0154-10aa-b297d56bba27	Sedez-read	Sedez - branje	f
00030000-55d3-0154-95e7-60718a48cb5d	Sedez-write	Sedez - spreminjanje	f
00030000-55d3-0154-400f-c213374ac99c	Sezona-read	Sezona - branje	f
00030000-55d3-0154-d75f-be5a9c5bc076	Sezona-write	Sezona - spreminjanje	f
00030000-55d3-0154-35ec-f9b01208c426	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55d3-0154-f73a-f3c0388d0582	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55d3-0154-75ba-5c4536fa7f20	Stevilcenje-read	Stevilcenje - branje	f
00030000-55d3-0154-ba89-b4b1654944ba	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55d3-0154-fdbc-ecb0ef8ddce8	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55d3-0154-efdf-5e1d3774b693	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55d3-0154-a32b-bdc3a23ef350	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55d3-0154-6443-c22125f36c97	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55d3-0154-fcd7-be82de652390	Telefonska-read	Telefonska - branje	f
00030000-55d3-0154-2348-d3154a906f8e	Telefonska-write	Telefonska - spreminjanje	f
00030000-55d3-0154-4c76-ae079e972930	TerminStoritve-read	TerminStoritve - branje	f
00030000-55d3-0154-b7d0-d07e8519a24e	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55d3-0154-71a4-3d8aa81034d8	TipFunkcije-read	TipFunkcije - branje	f
00030000-55d3-0154-0bd9-3816605783a6	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55d3-0154-fde9-48e2afaade6c	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55d3-0154-d879-24dc8f051351	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55d3-0154-6edc-fd6114fefb96	Trr-read	Trr - branje	f
00030000-55d3-0154-4076-73f2faabc4ae	Trr-write	Trr - spreminjanje	f
00030000-55d3-0154-dd45-08ad444e526f	Uprizoritev-read	Uprizoritev - branje	f
00030000-55d3-0154-07e0-10a351be6958	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55d3-0154-aff2-4fae8615d951	Vaja-read	Vaja - branje	f
00030000-55d3-0154-c47a-cd261a7dfb93	Vaja-write	Vaja - spreminjanje	f
00030000-55d3-0154-da1e-5d4084d75a72	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55d3-0154-0077-554cccb2af51	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55d3-0154-c2c1-eaac6f35d312	Zaposlitev-read	Zaposlitev - branje	f
00030000-55d3-0154-313a-1af21a697d04	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55d3-0154-df13-a20e0f470022	Zasedenost-read	Zasedenost - branje	f
00030000-55d3-0154-8511-d4867e11aa26	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55d3-0154-244b-40543cd6a36b	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55d3-0154-a24c-bc89d3a628d0	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55d3-0154-5442-a4a6c8afd332	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55d3-0154-a261-7037f261e2ac	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55d3-0154-c0f4-e3723ff111f1	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55d3-0154-42a7-b8ec00618623	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55d3-0154-8566-bd3366fb2a28	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55d3-0154-bd08-f370c3e42566	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55d3-0154-59bd-a7ecb4c0815e	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55d3-0154-328c-2ccd5dd929bd	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55d3-0154-322f-4808046a5084	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55d3-0154-464a-7dfde07fa6d4	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55d3-0154-3156-cc95263d8865	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55d3-0154-e276-9157e930e104	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55d3-0154-ab0f-41852b9ade00	Datoteka-write	Datoteka - spreminjanje	f
00030000-55d3-0154-4352-f8e148539624	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2889 (class 0 OID 14616055)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55d3-0154-3302-775be7bd0551	00030000-55d3-0154-be2a-3d06e797a2b3
00020000-55d3-0154-4b9f-e88f2608e00f	00030000-55d3-0154-ceed-ea0da3a0aad8
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-7700-45f445ea67df
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-7c2f-a4cc9439a0b7
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-12be-bc0779c683ae
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-43ca-d304ee7cfbd4
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-c36d-c3579988eb34
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-5fa4-2ff709f1b59a
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-2533-4e1eb275d2c9
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-3b16-a9ae1c10bdd9
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-ceed-ea0da3a0aad8
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-f804-3424da266727
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-abdd-02b6a86b3d76
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-b10b-7225e277ac13
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-be15-160e2aedc7be
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-249c-7e3da0b01be2
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-bcd4-c36bea9e2208
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-652c-1ade1c71a8c4
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-fe68-ccaa4a8c344e
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-fb19-bd456a5ef5de
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-a41d-7e8c51c42688
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-a7ec-c3c37cfc1503
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-aa33-2a0bc0bd8d32
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-f8d1-2d9dd0e30187
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-c7ff-b29d5fdafb62
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-ff88-33fdfb27182f
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-1beb-df1ade24e758
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-9d99-e12477560a2c
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-d5cf-20b1b1ae688f
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-7180-b0413a0c28fb
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-1460-b8640bf7b939
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-8759-23ba28b0d380
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-28db-ec0666d86d2a
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-e2ba-5c0d582e9eca
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-f32b-aec5a18b620e
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-a461-7b77e63b8278
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-56fd-fbff1ecf3489
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-bb7f-0956a4019f95
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-0ed8-2a883b9aea89
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-6bc7-c40f9beb2c08
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-400f-c213374ac99c
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-d75f-be5a9c5bc076
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-71a4-3d8aa81034d8
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-dd45-08ad444e526f
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-07e0-10a351be6958
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-aff2-4fae8615d951
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-c47a-cd261a7dfb93
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-df13-a20e0f470022
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-8511-d4867e11aa26
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-244b-40543cd6a36b
00020000-55d3-0154-a734-b86705e6bbad	00030000-55d3-0154-5442-a4a6c8afd332
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-7700-45f445ea67df
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-c36d-c3579988eb34
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-5fa4-2ff709f1b59a
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-ceed-ea0da3a0aad8
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-be15-160e2aedc7be
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-bcd4-c36bea9e2208
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-fe68-ccaa4a8c344e
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-fb19-bd456a5ef5de
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-a41d-7e8c51c42688
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-a7ec-c3c37cfc1503
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-aa33-2a0bc0bd8d32
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-f8d1-2d9dd0e30187
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-c7ff-b29d5fdafb62
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-1beb-df1ade24e758
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-d5cf-20b1b1ae688f
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-7180-b0413a0c28fb
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-1460-b8640bf7b939
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-f32b-aec5a18b620e
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-56fd-fbff1ecf3489
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-0ed8-2a883b9aea89
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-400f-c213374ac99c
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-fcd7-be82de652390
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-2348-d3154a906f8e
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-6edc-fd6114fefb96
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-4076-73f2faabc4ae
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-c2c1-eaac6f35d312
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-313a-1af21a697d04
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-244b-40543cd6a36b
00020000-55d3-0154-3c4d-a7a543e347f3	00030000-55d3-0154-5442-a4a6c8afd332
00020000-55d3-0154-6da8-b0c5b09d8117	00030000-55d3-0154-7700-45f445ea67df
00020000-55d3-0154-6da8-b0c5b09d8117	00030000-55d3-0154-12be-bc0779c683ae
00020000-55d3-0154-6da8-b0c5b09d8117	00030000-55d3-0154-c36d-c3579988eb34
00020000-55d3-0154-6da8-b0c5b09d8117	00030000-55d3-0154-a742-68507c86fc9a
00020000-55d3-0154-6da8-b0c5b09d8117	00030000-55d3-0154-72eb-92b00e54669c
00020000-55d3-0154-6da8-b0c5b09d8117	00030000-55d3-0154-72ec-a56a33154744
00020000-55d3-0154-6da8-b0c5b09d8117	00030000-55d3-0154-5fa4-2ff709f1b59a
00020000-55d3-0154-6da8-b0c5b09d8117	00030000-55d3-0154-ceed-ea0da3a0aad8
00020000-55d3-0154-6da8-b0c5b09d8117	00030000-55d3-0154-abdd-02b6a86b3d76
00020000-55d3-0154-6da8-b0c5b09d8117	00030000-55d3-0154-be15-160e2aedc7be
00020000-55d3-0154-6da8-b0c5b09d8117	00030000-55d3-0154-bcd4-c36bea9e2208
00020000-55d3-0154-6da8-b0c5b09d8117	00030000-55d3-0154-fe68-ccaa4a8c344e
00020000-55d3-0154-6da8-b0c5b09d8117	00030000-55d3-0154-a41d-7e8c51c42688
00020000-55d3-0154-6da8-b0c5b09d8117	00030000-55d3-0154-a7ec-c3c37cfc1503
00020000-55d3-0154-6da8-b0c5b09d8117	00030000-55d3-0154-aa33-2a0bc0bd8d32
00020000-55d3-0154-6da8-b0c5b09d8117	00030000-55d3-0154-c7ff-b29d5fdafb62
00020000-55d3-0154-6da8-b0c5b09d8117	00030000-55d3-0154-1beb-df1ade24e758
00020000-55d3-0154-6da8-b0c5b09d8117	00030000-55d3-0154-1460-b8640bf7b939
00020000-55d3-0154-6da8-b0c5b09d8117	00030000-55d3-0154-28db-ec0666d86d2a
00020000-55d3-0154-6da8-b0c5b09d8117	00030000-55d3-0154-f32b-aec5a18b620e
00020000-55d3-0154-6da8-b0c5b09d8117	00030000-55d3-0154-56fd-fbff1ecf3489
00020000-55d3-0154-6da8-b0c5b09d8117	00030000-55d3-0154-0ed8-2a883b9aea89
00020000-55d3-0154-6da8-b0c5b09d8117	00030000-55d3-0154-400f-c213374ac99c
00020000-55d3-0154-6da8-b0c5b09d8117	00030000-55d3-0154-71a4-3d8aa81034d8
00020000-55d3-0154-6da8-b0c5b09d8117	00030000-55d3-0154-aff2-4fae8615d951
00020000-55d3-0154-6da8-b0c5b09d8117	00030000-55d3-0154-df13-a20e0f470022
00020000-55d3-0154-6da8-b0c5b09d8117	00030000-55d3-0154-244b-40543cd6a36b
00020000-55d3-0154-6da8-b0c5b09d8117	00030000-55d3-0154-5442-a4a6c8afd332
00020000-55d3-0154-6e6b-a3649ecfbed8	00030000-55d3-0154-7700-45f445ea67df
00020000-55d3-0154-6e6b-a3649ecfbed8	00030000-55d3-0154-7c2f-a4cc9439a0b7
00020000-55d3-0154-6e6b-a3649ecfbed8	00030000-55d3-0154-43ca-d304ee7cfbd4
00020000-55d3-0154-6e6b-a3649ecfbed8	00030000-55d3-0154-c36d-c3579988eb34
00020000-55d3-0154-6e6b-a3649ecfbed8	00030000-55d3-0154-5fa4-2ff709f1b59a
00020000-55d3-0154-6e6b-a3649ecfbed8	00030000-55d3-0154-ceed-ea0da3a0aad8
00020000-55d3-0154-6e6b-a3649ecfbed8	00030000-55d3-0154-be15-160e2aedc7be
00020000-55d3-0154-6e6b-a3649ecfbed8	00030000-55d3-0154-bcd4-c36bea9e2208
00020000-55d3-0154-6e6b-a3649ecfbed8	00030000-55d3-0154-a41d-7e8c51c42688
00020000-55d3-0154-6e6b-a3649ecfbed8	00030000-55d3-0154-a7ec-c3c37cfc1503
00020000-55d3-0154-6e6b-a3649ecfbed8	00030000-55d3-0154-c7ff-b29d5fdafb62
00020000-55d3-0154-6e6b-a3649ecfbed8	00030000-55d3-0154-1beb-df1ade24e758
00020000-55d3-0154-6e6b-a3649ecfbed8	00030000-55d3-0154-1460-b8640bf7b939
00020000-55d3-0154-6e6b-a3649ecfbed8	00030000-55d3-0154-f32b-aec5a18b620e
00020000-55d3-0154-6e6b-a3649ecfbed8	00030000-55d3-0154-56fd-fbff1ecf3489
00020000-55d3-0154-6e6b-a3649ecfbed8	00030000-55d3-0154-0ed8-2a883b9aea89
00020000-55d3-0154-6e6b-a3649ecfbed8	00030000-55d3-0154-400f-c213374ac99c
00020000-55d3-0154-6e6b-a3649ecfbed8	00030000-55d3-0154-71a4-3d8aa81034d8
00020000-55d3-0154-6e6b-a3649ecfbed8	00030000-55d3-0154-244b-40543cd6a36b
00020000-55d3-0154-6e6b-a3649ecfbed8	00030000-55d3-0154-5442-a4a6c8afd332
00020000-55d3-0154-b1ba-398ccc7905ae	00030000-55d3-0154-7700-45f445ea67df
00020000-55d3-0154-b1ba-398ccc7905ae	00030000-55d3-0154-c36d-c3579988eb34
00020000-55d3-0154-b1ba-398ccc7905ae	00030000-55d3-0154-5fa4-2ff709f1b59a
00020000-55d3-0154-b1ba-398ccc7905ae	00030000-55d3-0154-ceed-ea0da3a0aad8
00020000-55d3-0154-b1ba-398ccc7905ae	00030000-55d3-0154-be15-160e2aedc7be
00020000-55d3-0154-b1ba-398ccc7905ae	00030000-55d3-0154-bcd4-c36bea9e2208
00020000-55d3-0154-b1ba-398ccc7905ae	00030000-55d3-0154-a41d-7e8c51c42688
00020000-55d3-0154-b1ba-398ccc7905ae	00030000-55d3-0154-a7ec-c3c37cfc1503
00020000-55d3-0154-b1ba-398ccc7905ae	00030000-55d3-0154-c7ff-b29d5fdafb62
00020000-55d3-0154-b1ba-398ccc7905ae	00030000-55d3-0154-1beb-df1ade24e758
00020000-55d3-0154-b1ba-398ccc7905ae	00030000-55d3-0154-1460-b8640bf7b939
00020000-55d3-0154-b1ba-398ccc7905ae	00030000-55d3-0154-f32b-aec5a18b620e
00020000-55d3-0154-b1ba-398ccc7905ae	00030000-55d3-0154-56fd-fbff1ecf3489
00020000-55d3-0154-b1ba-398ccc7905ae	00030000-55d3-0154-0ed8-2a883b9aea89
00020000-55d3-0154-b1ba-398ccc7905ae	00030000-55d3-0154-400f-c213374ac99c
00020000-55d3-0154-b1ba-398ccc7905ae	00030000-55d3-0154-4c76-ae079e972930
00020000-55d3-0154-b1ba-398ccc7905ae	00030000-55d3-0154-48bd-dbb81c6b5498
00020000-55d3-0154-b1ba-398ccc7905ae	00030000-55d3-0154-71a4-3d8aa81034d8
00020000-55d3-0154-b1ba-398ccc7905ae	00030000-55d3-0154-244b-40543cd6a36b
00020000-55d3-0154-b1ba-398ccc7905ae	00030000-55d3-0154-5442-a4a6c8afd332
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-b7e6-df86e63fe3aa
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-be2a-3d06e797a2b3
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-48bd-dbb81c6b5498
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-2533-4e1eb275d2c9
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-fc6c-ec9ba90de477
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-1718-a151a028e2e0
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-7700-45f445ea67df
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-7c2f-a4cc9439a0b7
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-12be-bc0779c683ae
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-43ca-d304ee7cfbd4
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-c36d-c3579988eb34
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-a742-68507c86fc9a
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-72eb-92b00e54669c
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-ec68-089869a5f69e
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-72ec-a56a33154744
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-e70d-edee53cc51b2
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-5fa4-2ff709f1b59a
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-3b16-a9ae1c10bdd9
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-ceed-ea0da3a0aad8
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-f804-3424da266727
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-862b-665212215b89
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-27da-bf000ca75505
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-04a3-d2a43c81e2bf
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-7502-f588e9f7677b
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-abdd-02b6a86b3d76
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-b10b-7225e277ac13
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-be15-160e2aedc7be
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-249c-7e3da0b01be2
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-bcd4-c36bea9e2208
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-652c-1ade1c71a8c4
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-fe68-ccaa4a8c344e
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-fb19-bd456a5ef5de
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-01e5-1059d4100c0a
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-a87e-43447c0b454a
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-9215-c219c26907be
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-e7f9-f1bdb67082e0
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-a41d-7e8c51c42688
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-b006-94698e9438f9
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-a7ec-c3c37cfc1503
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-d5d1-43c7343f486d
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-aa33-2a0bc0bd8d32
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-f8d1-2d9dd0e30187
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-a600-bf1a4d147d44
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-0d9f-ddbc741acbe8
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-eeb7-804e4f568a47
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-f12e-be6ca8012f6c
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-dab0-8fddb395b588
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-c1b8-2d0841f12301
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-c7ff-b29d5fdafb62
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-ff88-33fdfb27182f
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-1beb-df1ade24e758
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-9d99-e12477560a2c
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-6453-7f6b47447fa0
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-e5a5-e10d690bc6a5
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-d5cf-20b1b1ae688f
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-7180-b0413a0c28fb
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-1460-b8640bf7b939
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-8759-23ba28b0d380
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-f334-344983fa8548
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-312a-e959a6feae96
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-cde9-fe070c8633f2
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-36e0-483b8b544c76
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-28db-ec0666d86d2a
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-e2ba-5c0d582e9eca
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-81d6-64303f727b12
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-3d2d-b545e1607b6d
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-1522-9e77391665e3
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-2351-ecec03bb9609
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-44a8-75723531f511
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-e2f1-5947e5665609
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-fad0-a53f81326dbf
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-e921-a76b6ea67f06
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-5cf3-0da4ed4e64da
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-4e62-21b41d4b5ed8
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-1575-13f262dae943
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-b8f9-11d19b229437
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-8307-4cd70cd447a2
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-1755-ff1300f72b39
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-6328-dcc4b403ba45
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-c22d-0d0a0ee86d5d
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-8af8-6a7e023e7fc4
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-28d4-a4b78d5d958f
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-2cf9-12a585322e18
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-a7ab-24de349efb31
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-f32b-aec5a18b620e
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-a461-7b77e63b8278
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-9494-20a61475720e
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-a0f7-f3a220c2fcee
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-c962-5d7f4d1184f2
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-1c79-d55701dd3f4e
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-56fd-fbff1ecf3489
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-bb7f-0956a4019f95
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-0ed8-2a883b9aea89
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-6bc7-c40f9beb2c08
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-d882-965ace4ebf39
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-95ae-7a7e044a0213
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-6270-8ff01bfc4acd
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-6f08-604d275769e1
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-fdc0-8a84c45675e5
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-a72d-3d7b55dc76da
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-10aa-b297d56bba27
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-95e7-60718a48cb5d
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-400f-c213374ac99c
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-d75f-be5a9c5bc076
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-35ec-f9b01208c426
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-f73a-f3c0388d0582
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-75ba-5c4536fa7f20
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-ba89-b4b1654944ba
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-fdbc-ecb0ef8ddce8
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-efdf-5e1d3774b693
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-a32b-bdc3a23ef350
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-6443-c22125f36c97
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-fcd7-be82de652390
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-2348-d3154a906f8e
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-4c76-ae079e972930
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-b7d0-d07e8519a24e
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-71a4-3d8aa81034d8
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-0bd9-3816605783a6
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-fde9-48e2afaade6c
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-d879-24dc8f051351
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-6edc-fd6114fefb96
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-4076-73f2faabc4ae
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-dd45-08ad444e526f
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-07e0-10a351be6958
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-aff2-4fae8615d951
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-c47a-cd261a7dfb93
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-da1e-5d4084d75a72
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-0077-554cccb2af51
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-c2c1-eaac6f35d312
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-313a-1af21a697d04
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-df13-a20e0f470022
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-8511-d4867e11aa26
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-244b-40543cd6a36b
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-a24c-bc89d3a628d0
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-5442-a4a6c8afd332
00020000-55d3-0156-e3dc-d6c31c903926	00030000-55d3-0154-a261-7037f261e2ac
\.


--
-- TOC entry 2917 (class 0 OID 14616354)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2921 (class 0 OID 14616385)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 14616499)
-- Dependencies: 218
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55d3-0156-fb1e-8030e70d6fcb	00090000-55d3-0156-f915-ed19b41645cd	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55d3-0156-cec6-2bb4159ce4c8	00090000-55d3-0156-bbcc-768dcbd1c433	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55d3-0156-d892-599ddc62e103	00090000-55d3-0156-3521-0e2d067af7f9	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2894 (class 0 OID 14616115)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55d3-0156-2032-2fa89d0f1e16	00040000-55d3-0154-5a1a-d9be25dd670b	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d3-0156-e59e-d95ee23d0fb5	00040000-55d3-0154-5a1a-d9be25dd670b	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55d3-0156-5a1e-aa9a57ef9c70	00040000-55d3-0154-5a1a-d9be25dd670b	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d3-0156-8434-44bc74b3d125	00040000-55d3-0154-5a1a-d9be25dd670b	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d3-0156-2304-a210162dd3b7	00040000-55d3-0154-5a1a-d9be25dd670b	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d3-0156-a875-27c46f90e5ec	00040000-55d3-0154-0cda-b51e5b9d3a98	0984	koproducent	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d3-0156-3a76-eba4355efbf0	00040000-55d3-0154-853c-90a90ff885a2	0983	koproducent	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d3-0156-f7dc-68430b85c30d	00040000-55d3-0154-9a53-82c780cca4f8	0982	koproducent	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55d3-0156-2178-04984f045601	00040000-55d3-0154-5a1a-d9be25dd670b	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2896 (class 0 OID 14616150)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55d3-0154-001c-f198c0c2c15c	8341	Adlešiči
00050000-55d3-0154-bdf7-700afb860ca1	5270	Ajdovščina
00050000-55d3-0154-aa45-cef233e2d159	6280	Ankaran/Ancarano
00050000-55d3-0154-3c0d-da7d79f9adb9	9253	Apače
00050000-55d3-0154-793d-be6656891e03	8253	Artiče
00050000-55d3-0154-a09f-1517cf9b0b5e	4275	Begunje na Gorenjskem
00050000-55d3-0154-6348-7bec6539f0a7	1382	Begunje pri Cerknici
00050000-55d3-0154-cbc8-b32cea80a50c	9231	Beltinci
00050000-55d3-0154-69ba-0f84aee62aff	2234	Benedikt
00050000-55d3-0154-b54b-b8b19d82e230	2345	Bistrica ob Dravi
00050000-55d3-0154-8d1a-9e20bd216391	3256	Bistrica ob Sotli
00050000-55d3-0154-fbd6-c64a8cebe0b1	8259	Bizeljsko
00050000-55d3-0154-3899-b1c7bca7e01e	1223	Blagovica
00050000-55d3-0154-f309-18ebbe6d28b0	8283	Blanca
00050000-55d3-0154-de70-5630e8828118	4260	Bled
00050000-55d3-0154-8fe7-abef99d57f28	4273	Blejska Dobrava
00050000-55d3-0154-3cb0-e52a78a29143	9265	Bodonci
00050000-55d3-0154-986f-76ad087a21ee	9222	Bogojina
00050000-55d3-0154-1dcc-4525bc97a8fe	4263	Bohinjska Bela
00050000-55d3-0154-7c68-31cd4af83fe6	4264	Bohinjska Bistrica
00050000-55d3-0154-7b25-7f52726e3130	4265	Bohinjsko jezero
00050000-55d3-0154-0142-34e9ac5a5295	1353	Borovnica
00050000-55d3-0154-80c6-7b0e2d67bb17	8294	Boštanj
00050000-55d3-0154-3b2d-99fb5823f331	5230	Bovec
00050000-55d3-0154-7df7-63a2c58c2af3	5295	Branik
00050000-55d3-0154-338b-b421a9aab113	3314	Braslovče
00050000-55d3-0154-f2fb-060de49a87f6	5223	Breginj
00050000-55d3-0154-e7c6-287055633471	8280	Brestanica
00050000-55d3-0154-ed2f-e66fbcdae918	2354	Bresternica
00050000-55d3-0154-c199-c5b35db97b42	4243	Brezje
00050000-55d3-0154-588d-c16e17bf7829	1351	Brezovica pri Ljubljani
00050000-55d3-0154-bcb1-802bee2cea58	8250	Brežice
00050000-55d3-0154-e8f0-6d50021be86e	4210	Brnik - Aerodrom
00050000-55d3-0154-41a4-5f5adde44a54	8321	Brusnice
00050000-55d3-0154-5b07-e4c74ff98d3d	3255	Buče
00050000-55d3-0154-45db-b9d8bd0a8172	8276	Bučka 
00050000-55d3-0154-41e5-5b729f36df09	9261	Cankova
00050000-55d3-0154-dd3c-522d4aee131a	3000	Celje 
00050000-55d3-0154-1d72-d1943cb9f6a2	3001	Celje - poštni predali
00050000-55d3-0154-0d1c-1b12d1a0305d	4207	Cerklje na Gorenjskem
00050000-55d3-0154-a1f0-a35ed06c49ca	8263	Cerklje ob Krki
00050000-55d3-0154-1079-ab82d038c6ae	1380	Cerknica
00050000-55d3-0154-e546-9d16f8518739	5282	Cerkno
00050000-55d3-0154-1583-493cfb620f96	2236	Cerkvenjak
00050000-55d3-0154-2f43-4c019920a8bd	2215	Ceršak
00050000-55d3-0154-b31a-12c18d174a58	2326	Cirkovce
00050000-55d3-0154-ca43-a0779a67d8d0	2282	Cirkulane
00050000-55d3-0154-8178-7eb977897d7d	5273	Col
00050000-55d3-0154-24ba-2bf8c6528c9b	8251	Čatež ob Savi
00050000-55d3-0154-cd4c-03311d1b26f7	1413	Čemšenik
00050000-55d3-0154-af93-108d30812d85	5253	Čepovan
00050000-55d3-0154-2260-25de36aa1ee9	9232	Črenšovci
00050000-55d3-0154-252e-31cb57d83611	2393	Črna na Koroškem
00050000-55d3-0154-56f9-3b9590878a36	6275	Črni Kal
00050000-55d3-0154-4a42-64fc9f14f618	5274	Črni Vrh nad Idrijo
00050000-55d3-0154-d9ff-002e8b6a2d74	5262	Črniče
00050000-55d3-0154-2369-d781110edd9f	8340	Črnomelj
00050000-55d3-0154-97b9-cc78f4f7e7ef	6271	Dekani
00050000-55d3-0154-6375-da9cabaef532	5210	Deskle
00050000-55d3-0154-fb29-8ed80b6cc5f4	2253	Destrnik
00050000-55d3-0154-f5bc-4a2620b2e38a	6215	Divača
00050000-55d3-0154-d781-05bfceb1a664	1233	Dob
00050000-55d3-0154-f6c8-a9f3731630c8	3224	Dobje pri Planini
00050000-55d3-0154-f31e-191fd9e15e87	8257	Dobova
00050000-55d3-0154-9132-51817436cff0	1423	Dobovec
00050000-55d3-0154-b186-2ede77e1bf74	5263	Dobravlje
00050000-55d3-0154-11cc-ff341e21d4f9	3204	Dobrna
00050000-55d3-0154-4e2a-4b8577f631a1	8211	Dobrnič
00050000-55d3-0154-31a6-8b5c3b99c616	1356	Dobrova
00050000-55d3-0154-12e5-3d64db2e4f35	9223	Dobrovnik/Dobronak 
00050000-55d3-0154-b1fb-5defd3036c7c	5212	Dobrovo v Brdih
00050000-55d3-0154-086b-d240df743515	1431	Dol pri Hrastniku
00050000-55d3-0154-3ed7-f0815afe1d86	1262	Dol pri Ljubljani
00050000-55d3-0154-2f4d-fb29c4ead459	1273	Dole pri Litiji
00050000-55d3-0154-8a9e-467f2983acb1	1331	Dolenja vas
00050000-55d3-0154-39bd-c5b8176fee0c	8350	Dolenjske Toplice
00050000-55d3-0154-5824-13ccc50bb9a5	1230	Domžale
00050000-55d3-0154-7cfe-8f3f56a7bc26	2252	Dornava
00050000-55d3-0154-d75d-9644b8807a66	5294	Dornberk
00050000-55d3-0154-2149-d906e3f15a96	1319	Draga
00050000-55d3-0154-1d3e-44121be0b944	8343	Dragatuš
00050000-55d3-0154-a962-53077e517924	3222	Dramlje
00050000-55d3-0154-1f04-9dbc997b6161	2370	Dravograd
00050000-55d3-0154-c9fb-c6be6060485f	4203	Duplje
00050000-55d3-0154-8d32-5648140712dc	6221	Dutovlje
00050000-55d3-0154-ed62-6abee04c98a7	8361	Dvor
00050000-55d3-0154-de64-e215f296a1fd	2343	Fala
00050000-55d3-0154-222c-35f2fc125ef5	9208	Fokovci
00050000-55d3-0154-2ed3-c7298a2a6bc0	2313	Fram
00050000-55d3-0154-edd2-de8485c2d78f	3213	Frankolovo
00050000-55d3-0154-bab6-dcbc7327af63	1274	Gabrovka
00050000-55d3-0154-741f-1748f45d1150	8254	Globoko
00050000-55d3-0154-2cfc-aafb7428e006	5275	Godovič
00050000-55d3-0154-f77b-205261559cb6	4204	Golnik
00050000-55d3-0154-ee37-910957fcde42	3303	Gomilsko
00050000-55d3-0154-2265-83affc49147c	4224	Gorenja vas
00050000-55d3-0154-dbb3-bf4e96c69272	3263	Gorica pri Slivnici
00050000-55d3-0154-477a-91857d4afe1b	2272	Gorišnica
00050000-55d3-0154-a4d3-93bd07d456fb	9250	Gornja Radgona
00050000-55d3-0154-153d-15347c54e17d	3342	Gornji Grad
00050000-55d3-0154-aea7-66995e4fb226	4282	Gozd Martuljek
00050000-55d3-0154-2618-18062295393a	6272	Gračišče
00050000-55d3-0154-69e0-2220f3a68005	9264	Grad
00050000-55d3-0154-668a-f19ee2298454	8332	Gradac
00050000-55d3-0154-9fd9-f9176815a7ad	1384	Grahovo
00050000-55d3-0154-d2a2-a253c95498df	5242	Grahovo ob Bači
00050000-55d3-0154-9507-1a3ca7783e70	5251	Grgar
00050000-55d3-0154-ed08-9ad5faa12d02	3302	Griže
00050000-55d3-0154-9237-d3d46855f897	3231	Grobelno
00050000-55d3-0154-c334-0f3b07aae3af	1290	Grosuplje
00050000-55d3-0154-0df4-5fca1155625c	2288	Hajdina
00050000-55d3-0154-8d5b-2e23946dbdd5	8362	Hinje
00050000-55d3-0154-a005-5ddce6497a0d	2311	Hoče
00050000-55d3-0154-dd0e-5e8450f4e3ce	9205	Hodoš/Hodos
00050000-55d3-0154-fc43-a264257ea32e	1354	Horjul
00050000-55d3-0154-776d-bf5cc94c02a7	1372	Hotedršica
00050000-55d3-0154-3143-6c74ece283ee	1430	Hrastnik
00050000-55d3-0154-0756-c171c054c5a7	6225	Hruševje
00050000-55d3-0154-b9a1-1c0e38528f68	4276	Hrušica
00050000-55d3-0154-bf8b-b0754ed3b92d	5280	Idrija
00050000-55d3-0154-553d-50af7a2fc2a1	1292	Ig
00050000-55d3-0154-f4ee-f8645932043e	6250	Ilirska Bistrica
00050000-55d3-0154-6653-0295ac0c8e5f	6251	Ilirska Bistrica-Trnovo
00050000-55d3-0154-5382-d658d5be791e	1295	Ivančna Gorica
00050000-55d3-0154-474f-3a5e6593fc9a	2259	Ivanjkovci
00050000-55d3-0154-cccc-ff165bb0d51b	1411	Izlake
00050000-55d3-0154-c05a-89c5d97d8fd1	6310	Izola/Isola
00050000-55d3-0154-6687-5f77e9fc76f1	2222	Jakobski Dol
00050000-55d3-0154-b0a6-0add705173a7	2221	Jarenina
00050000-55d3-0154-d407-b100b2fcb40c	6254	Jelšane
00050000-55d3-0154-c11a-45d627b283d1	4270	Jesenice
00050000-55d3-0154-6fcc-e3ba7fe70040	8261	Jesenice na Dolenjskem
00050000-55d3-0154-614c-5e09f858f8b1	3273	Jurklošter
00050000-55d3-0154-0d03-33e7775aa96a	2223	Jurovski Dol
00050000-55d3-0154-5e4b-0758a392b68e	2256	Juršinci
00050000-55d3-0154-6728-4f5f88452f21	5214	Kal nad Kanalom
00050000-55d3-0154-f998-a445f096a31e	3233	Kalobje
00050000-55d3-0154-3be2-ec92ea09baa8	4246	Kamna Gorica
00050000-55d3-0154-1457-e8ee4f2471a8	2351	Kamnica
00050000-55d3-0154-9d1f-9cb54ffb79e2	1241	Kamnik
00050000-55d3-0154-6df4-da12f26c140b	5213	Kanal
00050000-55d3-0154-332a-d90b81e7fcf7	8258	Kapele
00050000-55d3-0154-379b-dc9f00a03b5c	2362	Kapla
00050000-55d3-0154-323b-864f8117baa7	2325	Kidričevo
00050000-55d3-0154-2f5c-64cc4d822a9d	1412	Kisovec
00050000-55d3-0154-6ac1-d074f1bb4e4a	6253	Knežak
00050000-55d3-0154-2eaf-b3ec26a244d9	5222	Kobarid
00050000-55d3-0154-0525-dad546b89f35	9227	Kobilje
00050000-55d3-0154-df8f-1be235d2b914	1330	Kočevje
00050000-55d3-0154-b82e-b0c3f61b4d82	1338	Kočevska Reka
00050000-55d3-0154-c716-d74555fab441	2276	Kog
00050000-55d3-0154-2e2c-9b32c79bb552	5211	Kojsko
00050000-55d3-0154-3ae6-105776116f0e	6223	Komen
00050000-55d3-0154-4097-c47fa4cef36e	1218	Komenda
00050000-55d3-0154-2644-71bd439835e2	6000	Koper/Capodistria 
00050000-55d3-0154-32bf-bf25cdec035e	6001	Koper/Capodistria - poštni predali
00050000-55d3-0154-15cb-054108f2ec49	8282	Koprivnica
00050000-55d3-0154-4498-28d6f99de423	5296	Kostanjevica na Krasu
00050000-55d3-0154-8a8a-0645b5b0e981	8311	Kostanjevica na Krki
00050000-55d3-0154-d5f2-65d5d5a8a87d	1336	Kostel
00050000-55d3-0154-caef-fa6df131db7f	6256	Košana
00050000-55d3-0154-d92d-5b8ed785acca	2394	Kotlje
00050000-55d3-0154-d608-31782d7fad42	6240	Kozina
00050000-55d3-0154-e699-872f19ebb73d	3260	Kozje
00050000-55d3-0154-c25d-a3476e2010b4	4000	Kranj 
00050000-55d3-0154-d098-00d83ea8ffc3	4001	Kranj - poštni predali
00050000-55d3-0154-56a0-f690006ebcf4	4280	Kranjska Gora
00050000-55d3-0154-071f-f19292030a05	1281	Kresnice
00050000-55d3-0154-e6a5-1b555cce28d2	4294	Križe
00050000-55d3-0154-2cec-01bc74d097d1	9206	Križevci
00050000-55d3-0154-3967-5577c92b4383	9242	Križevci pri Ljutomeru
00050000-55d3-0154-52d1-c182922b03c5	1301	Krka
00050000-55d3-0154-102d-1d86ec6362eb	8296	Krmelj
00050000-55d3-0154-3a0c-e33ab26e797a	4245	Kropa
00050000-55d3-0154-0126-38de8eef40e3	8262	Krška vas
00050000-55d3-0154-cb72-c9e0deee2c15	8270	Krško
00050000-55d3-0154-5c67-5639a48d004a	9263	Kuzma
00050000-55d3-0154-7f55-19084a072c14	2318	Laporje
00050000-55d3-0154-53c1-4b3ccc68a8a6	3270	Laško
00050000-55d3-0154-fd13-095c08cfcba9	1219	Laze v Tuhinju
00050000-55d3-0154-ce03-4aa30872a046	2230	Lenart v Slovenskih goricah
00050000-55d3-0154-4e25-cf022efc0163	9220	Lendava/Lendva
00050000-55d3-0154-aeeb-4e659cc48630	4248	Lesce
00050000-55d3-0154-1d06-eaf48f55dbd4	3261	Lesično
00050000-55d3-0154-25bf-655453f66787	8273	Leskovec pri Krškem
00050000-55d3-0154-d752-9280a64d48cc	2372	Libeliče
00050000-55d3-0154-cf3b-a22187d282af	2341	Limbuš
00050000-55d3-0154-3e3e-ac93bccdaffe	1270	Litija
00050000-55d3-0154-a40a-43833a1e2731	3202	Ljubečna
00050000-55d3-0154-e2e2-800ae5d6d4b0	1000	Ljubljana 
00050000-55d3-0154-03d3-c0f52803ace1	1001	Ljubljana - poštni predali
00050000-55d3-0154-83cb-8508d784f739	1231	Ljubljana - Črnuče
00050000-55d3-0154-1ed3-2d270203036d	1261	Ljubljana - Dobrunje
00050000-55d3-0154-3385-547a59c47bd1	1260	Ljubljana - Polje
00050000-55d3-0154-0408-7ffedc2d3d21	1210	Ljubljana - Šentvid
00050000-55d3-0154-e54b-a0e656bdcd42	1211	Ljubljana - Šmartno
00050000-55d3-0154-dc20-0bb296d5b89c	3333	Ljubno ob Savinji
00050000-55d3-0154-07a6-eb5dc4bad4db	9240	Ljutomer
00050000-55d3-0154-5f04-d3676f2d34b3	3215	Loče
00050000-55d3-0154-995f-0cbd08370b4c	5231	Log pod Mangartom
00050000-55d3-0154-3397-7a2feb4cf588	1358	Log pri Brezovici
00050000-55d3-0154-25b1-bda40a091423	1370	Logatec
00050000-55d3-0154-14b4-97540f50bf1e	1371	Logatec
00050000-55d3-0154-9359-fdc2af621b02	1434	Loka pri Zidanem Mostu
00050000-55d3-0154-1806-69fbfe2358d3	3223	Loka pri Žusmu
00050000-55d3-0154-ae50-0edffa27b5f2	6219	Lokev
00050000-55d3-0154-db1a-0282e2be3f18	1318	Loški Potok
00050000-55d3-0154-37ee-60d396d5c3c5	2324	Lovrenc na Dravskem polju
00050000-55d3-0154-a934-e7f179c40a69	2344	Lovrenc na Pohorju
00050000-55d3-0154-ad21-2dffd376f0eb	3334	Luče
00050000-55d3-0154-cc8f-906e0de3eb9a	1225	Lukovica
00050000-55d3-0154-d422-569522782720	9202	Mačkovci
00050000-55d3-0154-5dac-6c2970999da8	2322	Majšperk
00050000-55d3-0154-cfc5-79dad7a5f71c	2321	Makole
00050000-55d3-0154-56b8-8afd37323bc2	9243	Mala Nedelja
00050000-55d3-0154-8f86-c52796761116	2229	Malečnik
00050000-55d3-0154-9642-f92cda29557f	6273	Marezige
00050000-55d3-0154-5492-b46f3e1fb8b8	2000	Maribor 
00050000-55d3-0154-5c97-abceb3013d71	2001	Maribor - poštni predali
00050000-55d3-0154-5bf8-5ea076fd1885	2206	Marjeta na Dravskem polju
00050000-55d3-0155-a7f0-80ac9b33ba7e	2281	Markovci
00050000-55d3-0155-edeb-5a9367aa5e91	9221	Martjanci
00050000-55d3-0155-8fcd-30bbd625d0b4	6242	Materija
00050000-55d3-0155-515e-8dc46b87c221	4211	Mavčiče
00050000-55d3-0155-f486-75d6391d6621	1215	Medvode
00050000-55d3-0155-270f-605e09a70928	1234	Mengeš
00050000-55d3-0155-565a-9874f2543e0c	8330	Metlika
00050000-55d3-0155-5904-17640cc6c9bf	2392	Mežica
00050000-55d3-0155-0b8a-16d61c7bebe7	2204	Miklavž na Dravskem polju
00050000-55d3-0155-bb0c-66751731ea57	2275	Miklavž pri Ormožu
00050000-55d3-0155-7a11-a97fec0bfa75	5291	Miren
00050000-55d3-0155-82cf-9a642c5dc0f9	8233	Mirna
00050000-55d3-0155-068e-928eb71627f1	8216	Mirna Peč
00050000-55d3-0155-ea93-a42d5ce67821	2382	Mislinja
00050000-55d3-0155-5f8e-5dfb507f0653	4281	Mojstrana
00050000-55d3-0155-d832-ca8696ca0047	8230	Mokronog
00050000-55d3-0155-75a0-3ec05e83747a	1251	Moravče
00050000-55d3-0155-5256-aa673ee68d44	9226	Moravske Toplice
00050000-55d3-0155-4e60-aaa4b9eb2e83	5216	Most na Soči
00050000-55d3-0155-244b-3486f3750973	1221	Motnik
00050000-55d3-0155-c8b8-fdb6dbf830a0	3330	Mozirje
00050000-55d3-0155-4e26-4e25256f811a	9000	Murska Sobota 
00050000-55d3-0155-51d0-ec1e865e93f5	9001	Murska Sobota - poštni predali
00050000-55d3-0155-9a87-e9f39a5f61a1	2366	Muta
00050000-55d3-0155-6957-36171b922eaa	4202	Naklo
00050000-55d3-0155-4404-aa8e0a8baa34	3331	Nazarje
00050000-55d3-0155-bc86-8044e4609c63	1357	Notranje Gorice
00050000-55d3-0155-23e6-9fc536e9f6d6	3203	Nova Cerkev
00050000-55d3-0155-1a9d-f33a80be7861	5000	Nova Gorica 
00050000-55d3-0155-96ee-d87b521488fc	5001	Nova Gorica - poštni predali
00050000-55d3-0155-8a9e-6fb0ba5291d9	1385	Nova vas
00050000-55d3-0155-f825-928c99960070	8000	Novo mesto
00050000-55d3-0155-8c05-2983c81e3aa7	8001	Novo mesto - poštni predali
00050000-55d3-0155-28b6-458a24b7f1e4	6243	Obrov
00050000-55d3-0155-1742-679de80ab7ad	9233	Odranci
00050000-55d3-0155-0a81-61b1dded5e6f	2317	Oplotnica
00050000-55d3-0155-c6f5-dff5570a3428	2312	Orehova vas
00050000-55d3-0155-88f6-b49ae0c50619	2270	Ormož
00050000-55d3-0155-c514-49d1add750eb	1316	Ortnek
00050000-55d3-0155-61f1-a26cc90bf51c	1337	Osilnica
00050000-55d3-0155-5a8a-12d471aa99f4	8222	Otočec
00050000-55d3-0155-3eeb-61e6f43248ee	2361	Ožbalt
00050000-55d3-0155-2bc5-0ba679110360	2231	Pernica
00050000-55d3-0155-9c02-32d363b140c1	2211	Pesnica pri Mariboru
00050000-55d3-0155-cf6d-e79427d0a321	9203	Petrovci
00050000-55d3-0155-8059-511a39ea62dd	3301	Petrovče
00050000-55d3-0155-1456-a4a47b895081	6330	Piran/Pirano
00050000-55d3-0155-de6e-4c75d73bf3f6	8255	Pišece
00050000-55d3-0155-43bd-1b4ede61d7e6	6257	Pivka
00050000-55d3-0155-429d-231ae1c700aa	6232	Planina
00050000-55d3-0155-73b9-8489c6ec1e1a	3225	Planina pri Sevnici
00050000-55d3-0155-4ea4-f4fe402c0439	6276	Pobegi
00050000-55d3-0155-13d1-8203f073def0	8312	Podbočje
00050000-55d3-0155-f6e9-f1a16ddf71c4	5243	Podbrdo
00050000-55d3-0155-1e70-517f190601e9	3254	Podčetrtek
00050000-55d3-0155-501b-78eafafec2c8	2273	Podgorci
00050000-55d3-0155-b042-0c4dab810b2c	6216	Podgorje
00050000-55d3-0155-8b55-2a38b0a6c86e	2381	Podgorje pri Slovenj Gradcu
00050000-55d3-0155-6fc9-ed75e330bd13	6244	Podgrad
00050000-55d3-0155-954d-01d252369e94	1414	Podkum
00050000-55d3-0155-4485-0139cfbefcaf	2286	Podlehnik
00050000-55d3-0155-33c1-1f05978d6c8c	5272	Podnanos
00050000-55d3-0155-4308-6d64608db03d	4244	Podnart
00050000-55d3-0155-a97c-7fee67e49827	3241	Podplat
00050000-55d3-0155-718a-3ce4efbaa2c5	3257	Podsreda
00050000-55d3-0155-64fb-64c90c1ca1cb	2363	Podvelka
00050000-55d3-0155-3370-cf9a2f109d19	2208	Pohorje
00050000-55d3-0155-52d9-d185a1affec6	2257	Polenšak
00050000-55d3-0155-2bf9-be67fa0f74d3	1355	Polhov Gradec
00050000-55d3-0155-53d0-d469a38851df	4223	Poljane nad Škofjo Loko
00050000-55d3-0155-4458-c527dee84007	2319	Poljčane
00050000-55d3-0155-0090-592195fdb944	1272	Polšnik
00050000-55d3-0155-2314-0d60cf6ec5f2	3313	Polzela
00050000-55d3-0155-1167-729dba98766c	3232	Ponikva
00050000-55d3-0155-33ab-f6d006ed9a39	6320	Portorož/Portorose
00050000-55d3-0155-23e2-49b6603dbfef	6230	Postojna
00050000-55d3-0155-a3f8-bc8683d679e1	2331	Pragersko
00050000-55d3-0155-84fc-3ea0d384735f	3312	Prebold
00050000-55d3-0155-0d5c-5b7fa6ee3ba0	4205	Preddvor
00050000-55d3-0155-df50-74c42dbcd3b7	6255	Prem
00050000-55d3-0155-b973-3ec33cf5293d	1352	Preserje
00050000-55d3-0155-0e6e-7430d696817d	6258	Prestranek
00050000-55d3-0155-75b0-3805af7f607d	2391	Prevalje
00050000-55d3-0155-3f1f-a31646ae8f58	3262	Prevorje
00050000-55d3-0155-0594-0afe25e0fe8c	1276	Primskovo 
00050000-55d3-0155-ed26-6e018822f8a7	3253	Pristava pri Mestinju
00050000-55d3-0155-0904-d581a5464d59	9207	Prosenjakovci/Partosfalva
00050000-55d3-0155-a57b-7470c7c6d1f8	5297	Prvačina
00050000-55d3-0155-3572-f163fffc6a56	2250	Ptuj
00050000-55d3-0155-cd1e-65c9653dcf22	2323	Ptujska Gora
00050000-55d3-0155-a21e-10e25696aafe	9201	Puconci
00050000-55d3-0155-3615-a1b9ee451de3	2327	Rače
00050000-55d3-0155-e45a-5c29431519e6	1433	Radeče
00050000-55d3-0155-6c8e-429b116c30b5	9252	Radenci
00050000-55d3-0155-6f14-b6409d50b88f	2360	Radlje ob Dravi
00050000-55d3-0155-afbe-7f23c83ad0ad	1235	Radomlje
00050000-55d3-0155-de7b-6ddde5c12097	4240	Radovljica
00050000-55d3-0155-7b63-fa6f43c76a4f	8274	Raka
00050000-55d3-0155-7fd7-1846646022fe	1381	Rakek
00050000-55d3-0155-09d2-4dd7e983cb76	4283	Rateče - Planica
00050000-55d3-0155-8e17-c09055d0a544	2390	Ravne na Koroškem
00050000-55d3-0155-a651-1aa19e1074b2	9246	Razkrižje
00050000-55d3-0155-fc11-b8f321c1d088	3332	Rečica ob Savinji
00050000-55d3-0155-0888-a7335088e738	5292	Renče
00050000-55d3-0155-2cf4-d8c6dcab8faa	1310	Ribnica
00050000-55d3-0155-ff3a-e8c093df9def	2364	Ribnica na Pohorju
00050000-55d3-0155-9047-bd0dd82c6bee	3272	Rimske Toplice
00050000-55d3-0155-a2cd-5a141fbb1a6c	1314	Rob
00050000-55d3-0155-6b39-3a85d8252b89	5215	Ročinj
00050000-55d3-0155-13fd-b4ce338871bf	3250	Rogaška Slatina
00050000-55d3-0155-8b93-60c58e9530bd	9262	Rogašovci
00050000-55d3-0155-99b9-4ecf33d5689e	3252	Rogatec
00050000-55d3-0155-743b-bba8b6e94e9c	1373	Rovte
00050000-55d3-0155-f785-733de75c38a8	2342	Ruše
00050000-55d3-0155-f5d7-6d0c2fd4306e	1282	Sava
00050000-55d3-0155-478d-f651e6634832	6333	Sečovlje/Sicciole
00050000-55d3-0155-0bb1-0105ba73400a	4227	Selca
00050000-55d3-0155-ca1f-25dbf86d9431	2352	Selnica ob Dravi
00050000-55d3-0155-5c45-a00ea8418087	8333	Semič
00050000-55d3-0155-ea80-f30b4c7d9c49	8281	Senovo
00050000-55d3-0155-bcf1-8c9f2c299546	6224	Senožeče
00050000-55d3-0155-ce45-bd49a8670b40	8290	Sevnica
00050000-55d3-0155-a5e6-e742dd5f5965	6210	Sežana
00050000-55d3-0155-0b5a-8842ce8d4e0d	2214	Sladki Vrh
00050000-55d3-0155-9888-f271f14b36fa	5283	Slap ob Idrijci
00050000-55d3-0155-67ae-6d859a1c0412	2380	Slovenj Gradec
00050000-55d3-0155-be06-3dcc085e8591	2310	Slovenska Bistrica
00050000-55d3-0155-f607-d4d759247289	3210	Slovenske Konjice
00050000-55d3-0155-351d-caa71fb55f0d	1216	Smlednik
00050000-55d3-0155-1a78-23a11eb1e2b7	5232	Soča
00050000-55d3-0155-23c9-1a9801b337fa	1317	Sodražica
00050000-55d3-0155-0016-6b9763ceacbc	3335	Solčava
00050000-55d3-0155-7a0c-c0b433e271f4	5250	Solkan
00050000-55d3-0155-0617-0bbb29281fb9	4229	Sorica
00050000-55d3-0155-9d6c-f6c4b174cfc8	4225	Sovodenj
00050000-55d3-0155-4e42-6c0e3fd26bbc	5281	Spodnja Idrija
00050000-55d3-0155-ecac-92a51a5e92a8	2241	Spodnji Duplek
00050000-55d3-0155-1a9d-2722497bb83b	9245	Spodnji Ivanjci
00050000-55d3-0155-02ce-26bff50a5fd0	2277	Središče ob Dravi
00050000-55d3-0155-4e72-3e01db7f4774	4267	Srednja vas v Bohinju
00050000-55d3-0155-a321-33de0e998316	8256	Sromlje 
00050000-55d3-0155-9dff-2d9fd2521847	5224	Srpenica
00050000-55d3-0155-5e50-c81a6b4f36fc	1242	Stahovica
00050000-55d3-0155-c2c7-c3cc363cc1dd	1332	Stara Cerkev
00050000-55d3-0155-e227-7367ebe77fe1	8342	Stari trg ob Kolpi
00050000-55d3-0155-860a-eecfe7195780	1386	Stari trg pri Ložu
00050000-55d3-0155-6bf2-71e712450b7c	2205	Starše
00050000-55d3-0155-5a2b-1a2adf6ee41b	2289	Stoperce
00050000-55d3-0155-b4be-40269c07b494	8322	Stopiče
00050000-55d3-0155-aa7b-ed3d2507f342	3206	Stranice
00050000-55d3-0155-1253-9d02c1987276	8351	Straža
00050000-55d3-0155-5660-d034564a068b	1313	Struge
00050000-55d3-0155-26df-609836968746	8293	Studenec
00050000-55d3-0155-7fae-60a6fdfe2e53	8331	Suhor
00050000-55d3-0155-49ac-36159565c4a1	2233	Sv. Ana v Slovenskih goricah
00050000-55d3-0155-eb21-f01d04bf8ca5	2235	Sv. Trojica v Slovenskih goricah
00050000-55d3-0155-1b6f-d782a48a7d71	2353	Sveti Duh na Ostrem Vrhu
00050000-55d3-0155-dcbd-8e2b6a429db6	9244	Sveti Jurij ob Ščavnici
00050000-55d3-0155-8035-bc3b11fa2a44	3264	Sveti Štefan
00050000-55d3-0155-c022-dadf5937eaf2	2258	Sveti Tomaž
00050000-55d3-0155-15a0-6f14237ec511	9204	Šalovci
00050000-55d3-0155-eeec-db457fdeaead	5261	Šempas
00050000-55d3-0155-759a-20b761ff13f7	5290	Šempeter pri Gorici
00050000-55d3-0155-097b-e4910bb460b7	3311	Šempeter v Savinjski dolini
00050000-55d3-0155-9eb5-4ef9f66fef11	4208	Šenčur
00050000-55d3-0155-bf36-c213163dfed3	2212	Šentilj v Slovenskih goricah
00050000-55d3-0155-f6ec-d5bc0fc32107	8297	Šentjanž
00050000-55d3-0155-6169-50dd3402a510	2373	Šentjanž pri Dravogradu
00050000-55d3-0155-0bcf-9570e7ad8aa3	8310	Šentjernej
00050000-55d3-0155-9bdd-e4d2ab933e46	3230	Šentjur
00050000-55d3-0155-96a8-536b80bfb54f	3271	Šentrupert
00050000-55d3-0155-5dca-f55cc4bd5767	8232	Šentrupert
00050000-55d3-0155-6e2d-a9c83f6f1e45	1296	Šentvid pri Stični
00050000-55d3-0155-0cd8-46791f10abcc	8275	Škocjan
00050000-55d3-0155-36ca-3e54aebd1cad	6281	Škofije
00050000-55d3-0155-898e-d2fbeb1a9ae6	4220	Škofja Loka
00050000-55d3-0155-9d5d-b61885d0b442	3211	Škofja vas
00050000-55d3-0155-6698-fa21f6a31266	1291	Škofljica
00050000-55d3-0155-43fb-1f843af4161a	6274	Šmarje
00050000-55d3-0155-77d6-f4e969bb28d3	1293	Šmarje - Sap
00050000-55d3-0155-0c9f-aa69ab900d5f	3240	Šmarje pri Jelšah
00050000-55d3-0155-f8d4-c01a88cb135c	8220	Šmarješke Toplice
00050000-55d3-0155-8e7a-bf95efded6cb	2315	Šmartno na Pohorju
00050000-55d3-0155-0e23-bb84b708e77a	3341	Šmartno ob Dreti
00050000-55d3-0155-5f77-c5581e7c43ca	3327	Šmartno ob Paki
00050000-55d3-0155-7d3d-56353ef1079d	1275	Šmartno pri Litiji
00050000-55d3-0155-9291-7a88c98e8909	2383	Šmartno pri Slovenj Gradcu
00050000-55d3-0155-90d5-bb1c593cac72	3201	Šmartno v Rožni dolini
00050000-55d3-0155-8063-75a8b872c2cb	3325	Šoštanj
00050000-55d3-0155-3587-b1aef8513632	6222	Štanjel
00050000-55d3-0155-a1db-7ba2c6f614fb	3220	Štore
00050000-55d3-0155-b132-bd3f6ecd9d42	3304	Tabor
00050000-55d3-0155-98fe-1a3cd01dbc39	3221	Teharje
00050000-55d3-0155-f82c-bdb587985878	9251	Tišina
00050000-55d3-0155-aea1-3a36c1277e1f	5220	Tolmin
00050000-55d3-0155-a626-919e24940269	3326	Topolšica
00050000-55d3-0155-b25b-de9f618401a1	2371	Trbonje
00050000-55d3-0155-8586-c6281155ffde	1420	Trbovlje
00050000-55d3-0155-39c9-b742a7c97498	8231	Trebelno 
00050000-55d3-0155-59d4-6d37d8c0787c	8210	Trebnje
00050000-55d3-0155-c5b7-f29b50dac636	5252	Trnovo pri Gorici
00050000-55d3-0155-5487-c8fbb7100fd0	2254	Trnovska vas
00050000-55d3-0155-6f34-afe7926f5ee5	1222	Trojane
00050000-55d3-0155-941b-6e1cb788e028	1236	Trzin
00050000-55d3-0155-87a8-ed0ad6768399	4290	Tržič
00050000-55d3-0155-3290-a54a8a1ea269	8295	Tržišče
00050000-55d3-0155-d8d8-fa98144da28d	1311	Turjak
00050000-55d3-0155-f783-1d8b2636c2f1	9224	Turnišče
00050000-55d3-0155-fd80-280beafb1a23	8323	Uršna sela
00050000-55d3-0155-4ebc-d36ddf8c08b3	1252	Vače
00050000-55d3-0155-817f-1d6212a65322	3320	Velenje 
00050000-55d3-0155-66af-3870c50971d0	3322	Velenje - poštni predali
00050000-55d3-0155-775b-d9e7a4fc7daa	8212	Velika Loka
00050000-55d3-0155-1f05-556e8e66daa0	2274	Velika Nedelja
00050000-55d3-0155-b205-a58eafa32f29	9225	Velika Polana
00050000-55d3-0155-6b93-cfde9048b92e	1315	Velike Lašče
00050000-55d3-0155-359b-2f40b4595782	8213	Veliki Gaber
00050000-55d3-0155-64e2-ea45138b53b4	9241	Veržej
00050000-55d3-0155-490b-819fe96d1d26	1312	Videm - Dobrepolje
00050000-55d3-0155-5811-58d7d2b0f9a7	2284	Videm pri Ptuju
00050000-55d3-0155-1684-02e5e2afb9a8	8344	Vinica
00050000-55d3-0155-96b8-7c9341868c0e	5271	Vipava
00050000-55d3-0155-591c-f213f104dea9	4212	Visoko
00050000-55d3-0155-edcb-a1b5a29e7f3a	1294	Višnja Gora
00050000-55d3-0155-773f-993675260d10	3205	Vitanje
00050000-55d3-0155-58d5-8f8229092c82	2255	Vitomarci
00050000-55d3-0155-a050-bc42833d79a8	1217	Vodice
00050000-55d3-0155-3eea-bad43f34a406	3212	Vojnik\t
00050000-55d3-0155-41df-efe8b7d78e34	5293	Volčja Draga
00050000-55d3-0155-0255-911b602e5b84	2232	Voličina
00050000-55d3-0155-7e1e-131a922d29c0	3305	Vransko
00050000-55d3-0155-dfe1-f16dee131939	6217	Vremski Britof
00050000-55d3-0155-bd36-eb7ccdbb406a	1360	Vrhnika
00050000-55d3-0155-aa17-8cd1d8cc3efc	2365	Vuhred
00050000-55d3-0155-d43b-81b0495fa6d3	2367	Vuzenica
00050000-55d3-0155-943f-952233ba71de	8292	Zabukovje 
00050000-55d3-0155-2b30-81ed1deb4a0a	1410	Zagorje ob Savi
00050000-55d3-0155-2744-7f80864f2e16	1303	Zagradec
00050000-55d3-0155-bdca-c09dd08791d3	2283	Zavrč
00050000-55d3-0155-a104-beac1dc42feb	8272	Zdole 
00050000-55d3-0155-42d8-ea54fd627f5f	4201	Zgornja Besnica
00050000-55d3-0155-eed9-4fb8c61cec23	2242	Zgornja Korena
00050000-55d3-0155-2421-2203853d8b37	2201	Zgornja Kungota
00050000-55d3-0155-4048-ceb48a825b1c	2316	Zgornja Ložnica
00050000-55d3-0155-7fd1-beb0684efcf5	2314	Zgornja Polskava
00050000-55d3-0155-aa89-8dc3aeb51267	2213	Zgornja Velka
00050000-55d3-0155-f9d6-94a584aba455	4247	Zgornje Gorje
00050000-55d3-0155-b1b4-387c3ba65974	4206	Zgornje Jezersko
00050000-55d3-0155-a0dd-69dfe690e2cf	2285	Zgornji Leskovec
00050000-55d3-0155-60f8-b98585f3da9c	1432	Zidani Most
00050000-55d3-0155-dee9-2299eb38ef28	3214	Zreče
00050000-55d3-0155-ac3f-3bc52edca04a	4209	Žabnica
00050000-55d3-0155-2c65-17c892c6182c	3310	Žalec
00050000-55d3-0155-9144-7b127e1fc64e	4228	Železniki
00050000-55d3-0155-1d48-adf55516b8f2	2287	Žetale
00050000-55d3-0155-5caf-685170c6794a	4226	Žiri
00050000-55d3-0155-1a1c-401589b5fbbf	4274	Žirovnica
00050000-55d3-0155-88fa-7cdc5d5ee419	8360	Žužemberk
\.


--
-- TOC entry 2913 (class 0 OID 14616328)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 14616135)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 14616213)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2915 (class 0 OID 14616340)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2938 (class 0 OID 14616671)
-- Dependencies: 225
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 14616681)
-- Dependencies: 226
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55d3-0156-903e-4a95d3fc838c	00080000-55d3-0156-2178-04984f045601	0900	AK
00190000-55d3-0156-3a78-c89efd4d202b	00080000-55d3-0156-5a1e-aa9a57ef9c70	0987	AK
00190000-55d3-0156-758b-7d06c62877f6	00080000-55d3-0156-e59e-d95ee23d0fb5	0989	AK
00190000-55d3-0156-aed7-92dc773d65b7	00080000-55d3-0156-8434-44bc74b3d125	0986	AK
00190000-55d3-0156-52fc-55705a0beb1f	00080000-55d3-0156-a875-27c46f90e5ec	0984	AK
00190000-55d3-0156-63f1-354593ad0078	00080000-55d3-0156-3a76-eba4355efbf0	0983	AK
00190000-55d3-0156-9efa-478bcd551acb	00080000-55d3-0156-f7dc-68430b85c30d	0982	AK
\.


--
-- TOC entry 2937 (class 0 OID 14616627)
-- Dependencies: 224
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponprej, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55d3-0156-212f-1f68a9c6394a	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2940 (class 0 OID 14616689)
-- Dependencies: 227
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2919 (class 0 OID 14616369)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55d3-0156-1e56-32018031a063	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55d3-0156-69bf-1139c08d408c	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55d3-0156-06d0-d735dbb39330	0003	Kazinska	t	84	Kazinska dvorana
00220000-55d3-0156-44f8-5a16c9e57759	0004	Mali oder	t	24	Mali oder 
00220000-55d3-0156-0cfb-1bd9fb9ad959	0005	Komorni oder	t	15	Komorni oder
00220000-55d3-0156-43c8-e666eda6709b	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55d3-0156-7e14-dc284a98a110	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2911 (class 0 OID 14616313)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2910 (class 0 OID 14616303)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 14616488)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2926 (class 0 OID 14616437)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 14616007)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2920 (class 0 OID 14616379)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2888 (class 0 OID 14616045)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55d3-0154-3302-775be7bd0551	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55d3-0154-4b9f-e88f2608e00f	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55d3-0154-e2c2-9d49ca71d058	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55d3-0154-3598-851dbe624ba1	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55d3-0154-a734-b86705e6bbad	planer	Planer dogodkov v koledarju	t
00020000-55d3-0154-3c4d-a7a543e347f3	kadrovska	Kadrovska služba	t
00020000-55d3-0154-6da8-b0c5b09d8117	arhivar	Ažuriranje arhivalij	t
00020000-55d3-0154-6e6b-a3649ecfbed8	igralec	Igralec	t
00020000-55d3-0154-b1ba-398ccc7905ae	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55d3-0156-e3dc-d6c31c903926	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2886 (class 0 OID 14616029)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55d3-0154-1265-46f340ca8be5	00020000-55d3-0154-e2c2-9d49ca71d058
00010000-55d3-0154-92f5-b849e860f483	00020000-55d3-0154-e2c2-9d49ca71d058
00010000-55d3-0156-54a4-166c15ea90ff	00020000-55d3-0156-e3dc-d6c31c903926
\.


--
-- TOC entry 2922 (class 0 OID 14616393)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2914 (class 0 OID 14616334)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 14616280)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2945 (class 0 OID 14616730)
-- Dependencies: 232
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55d3-0155-f8a8-0740cf7ff320	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55d3-0155-353b-09f1e7fcff75	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55d3-0155-2b13-0c2979dd8077	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55d3-0155-b680-4b012c5e168b	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55d3-0155-b3de-6968199616c8	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2944 (class 0 OID 14616722)
-- Dependencies: 231
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55d3-0155-d2a9-f5451b6ec5bd	00230000-55d3-0155-b680-4b012c5e168b	popa
00240000-55d3-0155-76ec-fa5eb55d7a5d	00230000-55d3-0155-b680-4b012c5e168b	oseba
00240000-55d3-0155-ac8c-d1d54117b78c	00230000-55d3-0155-b680-4b012c5e168b	sezona
00240000-55d3-0155-c881-4d13c2bcd1e5	00230000-55d3-0155-353b-09f1e7fcff75	prostor
00240000-55d3-0155-d1a5-a65303d67c4f	00230000-55d3-0155-b680-4b012c5e168b	besedilo
00240000-55d3-0155-8ee9-d347c95f7fea	00230000-55d3-0155-b680-4b012c5e168b	uprizoritev
00240000-55d3-0155-713d-19978c6ee52f	00230000-55d3-0155-b680-4b012c5e168b	funkcija
00240000-55d3-0155-3eb4-277690bd6b41	00230000-55d3-0155-b680-4b012c5e168b	tipfunkcije
00240000-55d3-0155-5b05-2cd240fd0ad9	00230000-55d3-0155-b680-4b012c5e168b	alternacija
00240000-55d3-0155-4f2f-412f4c7bca34	00230000-55d3-0155-f8a8-0740cf7ff320	pogodba
00240000-55d3-0155-b86e-a0889193489c	00230000-55d3-0155-b680-4b012c5e168b	zaposlitev
00240000-55d3-0155-703e-15d0a273c445	00230000-55d3-0155-f8a8-0740cf7ff320	programdela
00240000-55d3-0155-03a6-645ab4ae0004	00230000-55d3-0155-b680-4b012c5e168b	zapis
\.


--
-- TOC entry 2943 (class 0 OID 14616717)
-- Dependencies: 230
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2927 (class 0 OID 14616447)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55d3-0156-c78b-d980baab8e0b	000e0000-55d3-0156-a79d-cc2705e9d44d	00080000-55d3-0156-2032-2fa89d0f1e16	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55d3-0156-2170-7595ba9c6ff3	000e0000-55d3-0156-a79d-cc2705e9d44d	00080000-55d3-0156-2032-2fa89d0f1e16	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55d3-0156-7a5d-e88af2295b89	000e0000-55d3-0156-a79d-cc2705e9d44d	00080000-55d3-0156-2304-a210162dd3b7	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
00270000-55d3-0156-9655-635743f63eb7	000e0000-55d3-0156-a79d-cc2705e9d44d	00080000-55d3-0156-2304-a210162dd3b7	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2893 (class 0 OID 14616107)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 14616290)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55d3-0156-644a-7a5ee7b647df	00180000-55d3-0156-c51f-86b8cc819f4f	000c0000-55d3-0156-7c5f-3c6e0087c3dd	00090000-55d3-0156-4f8a-6a1d88f7b71a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d3-0156-b852-5ef48dca1961	00180000-55d3-0156-c51f-86b8cc819f4f	000c0000-55d3-0156-acba-ad4df02bc637	00090000-55d3-0156-853b-44b772c0655b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d3-0156-381f-b913fa418705	00180000-55d3-0156-c51f-86b8cc819f4f	000c0000-55d3-0156-94f6-8b0373da55cf	00090000-55d3-0156-6d49-38a96e65c071	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d3-0156-1033-2111fa3dd07a	00180000-55d3-0156-c51f-86b8cc819f4f	000c0000-55d3-0156-cb65-524fdf5179cb	00090000-55d3-0156-1085-1702dd2e88c0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d3-0156-ec17-0e0f61c04673	00180000-55d3-0156-c51f-86b8cc819f4f	000c0000-55d3-0156-9827-fce44a3a4430	00090000-55d3-0156-41fd-05922f429110	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55d3-0156-96ee-36f496c85f57	00180000-55d3-0156-d1b4-4fecc3dc6d13	\N	00090000-55d3-0156-41fd-05922f429110	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2929 (class 0 OID 14616477)
-- Dependencies: 216
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55d3-0155-ddc5-cd666d80baa6	Avtor	Avtorji	Avtorka	umetnik
000f0000-55d3-0155-0619-dbf6dcd3d6b9	Priredba	Priredba	Priredba	umetnik
000f0000-55d3-0155-fd98-144583c0dbae	Prevod	Prevod	Prevod	umetnik
000f0000-55d3-0155-4a0f-8858db79e17f	Režija	Režija	Režija	umetnik
000f0000-55d3-0155-9d86-1b406802740e	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55d3-0155-2d45-a6cb02599564	Scenografija	Scenografija	Scenografija	tehnik
000f0000-55d3-0155-910a-41de8a7ce488	Kostumografija	Kostumografija	Kostumografija	tehnik
000f0000-55d3-0155-85c7-80c57b64714b	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55d3-0155-62c2-349cb16fb57c	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	tehnik
000f0000-55d3-0155-29b4-979312f3dbe2	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	tehnik
000f0000-55d3-0155-fe99-15a66e102a13	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55d3-0155-b17f-fc127a7c5236	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55d3-0155-43c4-8ad7aedff61b	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	tehnik
000f0000-55d3-0155-9835-84f04f96b831	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	tehnik
000f0000-55d3-0155-b681-e3bdd89b3731	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55d3-0155-e861-62268fb30359	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55d3-0155-84d8-632afaffef8f	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55d3-0155-d96c-f9812f63191b	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2941 (class 0 OID 14616699)
-- Dependencies: 228
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55d3-0155-ebc9-2320372d065c	01	Velika predstava	f	1.00	1.00
002b0000-55d3-0155-a758-d1bb0e904b89	02	Mala predstava	f	0.50	0.50
002b0000-55d3-0155-96a8-09bb4e4ea70d	03	Mala koprodukcija	t	0.40	1.00
002b0000-55d3-0155-9c18-cb2a5d65da8b	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55d3-0155-bbd1-ad2857b7af87	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2898 (class 0 OID 14616170)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 14616016)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55d3-0154-92f5-b849e860f483	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROFY9zv/HNylJryEARH.nKiazVaS8kMdy	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55d3-0156-78b3-24b0b91f544e	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55d3-0156-f3c7-4a3c15607152	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55d3-0156-276e-b6bcd85ee699	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55d3-0156-08fb-384c73d52708	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55d3-0156-ba90-e0a08b605329	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55d3-0156-a132-4fe1dc5979cc	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55d3-0156-cad5-0db5e634a3ae	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55d3-0156-a990-ebcbf1bda0a8	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55d3-0156-b07d-2e95aa15e9ce	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55d3-0156-54a4-166c15ea90ff	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55d3-0154-1265-46f340ca8be5	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2933 (class 0 OID 14616525)
-- Dependencies: 220
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55d3-0156-04da-d1d3aa7a14f5	00160000-55d3-0156-c6dd-35af2bef080d	00150000-55d3-0155-c85d-a53ac35e04cf	00140000-55d3-0154-fd61-4b0d94ef7a51	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55d3-0156-0cfb-1bd9fb9ad959
000e0000-55d3-0156-a79d-cc2705e9d44d	00160000-55d3-0156-b936-488191cc057f	00150000-55d3-0155-d368-d51b657ac590	00140000-55d3-0154-a44b-b7a6372528f9	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55d3-0156-43c8-e666eda6709b
000e0000-55d3-0156-57b5-00d4bf1e0d2f	\N	00150000-55d3-0155-d368-d51b657ac590	00140000-55d3-0154-a44b-b7a6372528f9	00190000-55d3-0156-3a78-c89efd4d202b	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55d3-0156-0cfb-1bd9fb9ad959
000e0000-55d3-0156-1d18-3adb499d006d	\N	00150000-55d3-0155-d368-d51b657ac590	00140000-55d3-0154-a44b-b7a6372528f9	00190000-55d3-0156-3a78-c89efd4d202b	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55d3-0156-0cfb-1bd9fb9ad959
000e0000-55d3-0156-3a8f-36589a29f3fb	\N	00150000-55d3-0155-d368-d51b657ac590	00140000-55d3-0154-a44b-b7a6372528f9	00190000-55d3-0156-3a78-c89efd4d202b	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55d3-0156-1e56-32018031a063
000e0000-55d3-0156-ee04-9b8f360b644f	\N	00150000-55d3-0155-d368-d51b657ac590	00140000-55d3-0154-a44b-b7a6372528f9	00190000-55d3-0156-3a78-c89efd4d202b	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f		00220000-55d3-0156-1e56-32018031a063
\.


--
-- TOC entry 2903 (class 0 OID 14616232)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55d3-0156-789f-426cf9381e0d	000e0000-55d3-0156-a79d-cc2705e9d44d	1	
00200000-55d3-0156-770b-c4b18ba369e3	000e0000-55d3-0156-a79d-cc2705e9d44d	2	
\.


--
-- TOC entry 2918 (class 0 OID 14616361)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 14616769)
-- Dependencies: 234
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 14616741)
-- Dependencies: 233
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 14616781)
-- Dependencies: 235
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2925 (class 0 OID 14616430)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55d3-0156-72f9-d590fc5aefb4	00090000-55d3-0156-853b-44b772c0655b	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d3-0156-6818-fffc7b5b3536	00090000-55d3-0156-6d49-38a96e65c071	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d3-0156-44ab-f43f207ab46d	00090000-55d3-0156-69f9-b6ceb89a9748	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d3-0156-72f8-c7a8ea8749c1	00090000-55d3-0156-9564-5759a1eb9c35	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d3-0156-8c75-602ed865f8ff	00090000-55d3-0156-4f8a-6a1d88f7b71a	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55d3-0156-f4f7-d58abccea7ce	00090000-55d3-0156-a0d8-ffb7bc94f2f8	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2905 (class 0 OID 14616264)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 14616515)
-- Dependencies: 219
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55d3-0154-fd61-4b0d94ef7a51	01	Drama	drama (SURS 01)
00140000-55d3-0154-48dd-948f541ee5d3	02	Opera	opera (SURS 02)
00140000-55d3-0154-c216-d5608a6f5f23	03	Balet	balet (SURS 03)
00140000-55d3-0154-16fd-89014037914e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55d3-0154-9416-19f2b30f5f68	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55d3-0154-a44b-b7a6372528f9	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55d3-0154-fb3d-d71bb1241455	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2924 (class 0 OID 14616420)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55d3-0155-554d-7c8599f22c30	01	Opera	opera
00150000-55d3-0155-a935-63d625eefba1	02	Opereta	opereta
00150000-55d3-0155-3304-269db54c0873	03	Balet	balet
00150000-55d3-0155-a122-6ac3de1e0ed2	04	Plesne prireditve	plesne prireditve
00150000-55d3-0155-0a41-89573e0274e1	05	Lutkovno gledališče	lutkovno gledališče
00150000-55d3-0155-c7a3-8b047d4210d9	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55d3-0155-f791-37491f733dbb	07	Biografska drama	biografska drama
00150000-55d3-0155-c85d-a53ac35e04cf	08	Komedija	komedija
00150000-55d3-0155-6394-1dd0265ebe44	09	Črna komedija	črna komedija
00150000-55d3-0155-9008-7cbfd0e47ffc	10	E-igra	E-igra
00150000-55d3-0155-d368-d51b657ac590	11	Kriminalka	kriminalka
00150000-55d3-0155-7b4b-a4f91f72b2cb	12	Musical	musical
\.


--
-- TOC entry 2435 (class 2606 OID 14616070)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 14616572)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 14616562)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 14616476)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 14616821)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 14616254)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 14616279)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 14616715)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 14616196)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 14616621)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 14616416)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 14616230)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 14616273)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 14616210)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 14616326)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 14616798)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 14616805)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2676 (class 2606 OID 14616829)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 14616353)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 14616168)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 14616079)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 14616103)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 14616059)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2426 (class 2606 OID 14616044)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 14616359)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 14616392)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 14616510)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2451 (class 2606 OID 14616132)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 14616156)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 14616332)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 14616146)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 14616217)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 14616344)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 14616678)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 14616686)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 14616669)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 14616697)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 14616376)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 14616317)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 14616308)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 14616498)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 14616444)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 14616015)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 14616383)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 14616033)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2428 (class 2606 OID 14616053)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 14616401)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 14616339)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 14616288)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 14616739)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 14616727)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 14616721)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 14616457)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 14616112)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 14616299)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 14616487)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 14616709)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 14616181)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 14616028)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 14616541)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 14616239)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 14616367)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 14616779)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 14616763)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 14616787)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 14616435)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 14616268)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 14616523)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 14616428)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 1259 OID 14616261)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2576 (class 1259 OID 14616458)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2577 (class 1259 OID 14616459)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2662 (class 1259 OID 14616800)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2663 (class 1259 OID 14616799)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2449 (class 1259 OID 14616134)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2541 (class 1259 OID 14616360)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2649 (class 1259 OID 14616767)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2650 (class 1259 OID 14616766)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2651 (class 1259 OID 14616768)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2652 (class 1259 OID 14616765)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2653 (class 1259 OID 14616764)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2535 (class 1259 OID 14616346)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2536 (class 1259 OID 14616345)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2486 (class 1259 OID 14616240)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2563 (class 1259 OID 14616417)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2564 (class 1259 OID 14616419)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2565 (class 1259 OID 14616418)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2474 (class 1259 OID 14616212)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2475 (class 1259 OID 14616211)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2632 (class 1259 OID 14616698)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2586 (class 1259 OID 14616512)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2587 (class 1259 OID 14616513)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2588 (class 1259 OID 14616514)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2659 (class 1259 OID 14616788)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2595 (class 1259 OID 14616546)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2596 (class 1259 OID 14616543)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2597 (class 1259 OID 14616547)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2598 (class 1259 OID 14616545)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2599 (class 1259 OID 14616544)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2464 (class 1259 OID 14616183)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 14616182)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2440 (class 1259 OID 14616106)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2551 (class 1259 OID 14616384)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2504 (class 1259 OID 14616274)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2430 (class 1259 OID 14616060)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2431 (class 1259 OID 14616061)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2556 (class 1259 OID 14616404)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2557 (class 1259 OID 14616403)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2558 (class 1259 OID 14616402)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2478 (class 1259 OID 14616218)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2479 (class 1259 OID 14616220)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2480 (class 1259 OID 14616219)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2642 (class 1259 OID 14616729)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2515 (class 1259 OID 14616312)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2516 (class 1259 OID 14616310)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2517 (class 1259 OID 14616309)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2518 (class 1259 OID 14616311)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2421 (class 1259 OID 14616034)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2422 (class 1259 OID 14616035)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2544 (class 1259 OID 14616368)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2672 (class 1259 OID 14616822)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2673 (class 1259 OID 14616830)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2674 (class 1259 OID 14616831)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2530 (class 1259 OID 14616333)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2572 (class 1259 OID 14616445)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2573 (class 1259 OID 14616446)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2616 (class 1259 OID 14616626)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2617 (class 1259 OID 14616625)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2618 (class 1259 OID 14616622)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2619 (class 1259 OID 14616623)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2620 (class 1259 OID 14616624)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2453 (class 1259 OID 14616148)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2454 (class 1259 OID 14616147)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2455 (class 1259 OID 14616149)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2624 (class 1259 OID 14616679)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2625 (class 1259 OID 14616680)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2609 (class 1259 OID 14616576)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2610 (class 1259 OID 14616577)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2611 (class 1259 OID 14616574)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2612 (class 1259 OID 14616575)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2569 (class 1259 OID 14616436)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2521 (class 1259 OID 14616321)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2522 (class 1259 OID 14616320)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2523 (class 1259 OID 14616318)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2524 (class 1259 OID 14616319)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2605 (class 1259 OID 14616564)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2606 (class 1259 OID 14616563)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2621 (class 1259 OID 14616670)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2485 (class 1259 OID 14616231)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2639 (class 1259 OID 14616716)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2666 (class 1259 OID 14616806)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2667 (class 1259 OID 14616807)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2436 (class 1259 OID 14616081)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2437 (class 1259 OID 14616080)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2445 (class 1259 OID 14616113)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2446 (class 1259 OID 14616114)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2510 (class 1259 OID 14616302)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2511 (class 1259 OID 14616301)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2512 (class 1259 OID 14616300)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2492 (class 1259 OID 14616263)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2493 (class 1259 OID 14616259)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2494 (class 1259 OID 14616256)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2495 (class 1259 OID 14616257)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2496 (class 1259 OID 14616255)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2497 (class 1259 OID 14616260)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2498 (class 1259 OID 14616258)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2452 (class 1259 OID 14616133)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 14616197)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2471 (class 1259 OID 14616199)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2472 (class 1259 OID 14616198)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2473 (class 1259 OID 14616200)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2529 (class 1259 OID 14616327)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2591 (class 1259 OID 14616511)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 14616542)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2443 (class 1259 OID 14616104)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2444 (class 1259 OID 14616105)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2566 (class 1259 OID 14616429)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 14616740)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2463 (class 1259 OID 14616169)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2645 (class 1259 OID 14616728)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2549 (class 1259 OID 14616378)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2550 (class 1259 OID 14616377)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 14616573)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2460 (class 1259 OID 14616157)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 14616524)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2656 (class 1259 OID 14616780)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2630 (class 1259 OID 14616687)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2631 (class 1259 OID 14616688)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2509 (class 1259 OID 14616289)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2429 (class 1259 OID 14616054)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2499 (class 1259 OID 14616262)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2704 (class 2606 OID 14616967)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2701 (class 2606 OID 14616952)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2702 (class 2606 OID 14616957)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2706 (class 2606 OID 14616977)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2700 (class 2606 OID 14616947)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2705 (class 2606 OID 14616972)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2703 (class 2606 OID 14616962)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2735 (class 2606 OID 14617122)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2736 (class 2606 OID 14617127)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2770 (class 2606 OID 14617297)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2769 (class 2606 OID 14617292)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2687 (class 2606 OID 14616882)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2723 (class 2606 OID 14617062)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2766 (class 2606 OID 14617277)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2765 (class 2606 OID 14617272)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2767 (class 2606 OID 14617282)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2764 (class 2606 OID 14617267)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2763 (class 2606 OID 14617262)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2722 (class 2606 OID 14617057)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2721 (class 2606 OID 14617052)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2699 (class 2606 OID 14616942)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2729 (class 2606 OID 14617092)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2731 (class 2606 OID 14617102)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2730 (class 2606 OID 14617097)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2694 (class 2606 OID 14616917)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2693 (class 2606 OID 14616912)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2719 (class 2606 OID 14617042)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2760 (class 2606 OID 14617247)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2737 (class 2606 OID 14617132)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2738 (class 2606 OID 14617137)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2739 (class 2606 OID 14617142)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2768 (class 2606 OID 14617287)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2743 (class 2606 OID 14617162)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2740 (class 2606 OID 14617147)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2744 (class 2606 OID 14617167)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2742 (class 2606 OID 14617157)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2741 (class 2606 OID 14617152)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2692 (class 2606 OID 14616907)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2691 (class 2606 OID 14616902)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2684 (class 2606 OID 14616867)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2683 (class 2606 OID 14616862)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2725 (class 2606 OID 14617072)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2707 (class 2606 OID 14616982)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2679 (class 2606 OID 14616842)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2680 (class 2606 OID 14616847)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2728 (class 2606 OID 14617087)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2727 (class 2606 OID 14617082)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2726 (class 2606 OID 14617077)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2695 (class 2606 OID 14616922)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2697 (class 2606 OID 14616932)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2696 (class 2606 OID 14616927)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2762 (class 2606 OID 14617257)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2714 (class 2606 OID 14617017)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2712 (class 2606 OID 14617007)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2711 (class 2606 OID 14617002)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2713 (class 2606 OID 14617012)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2677 (class 2606 OID 14616832)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2678 (class 2606 OID 14616837)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2724 (class 2606 OID 14617067)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2773 (class 2606 OID 14617312)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2774 (class 2606 OID 14617317)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2775 (class 2606 OID 14617322)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2720 (class 2606 OID 14617047)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2733 (class 2606 OID 14617112)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2734 (class 2606 OID 14617117)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2755 (class 2606 OID 14617222)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2754 (class 2606 OID 14617217)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2751 (class 2606 OID 14617202)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2752 (class 2606 OID 14617207)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2753 (class 2606 OID 14617212)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2689 (class 2606 OID 14616892)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2688 (class 2606 OID 14616887)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2690 (class 2606 OID 14616897)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2757 (class 2606 OID 14617232)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2758 (class 2606 OID 14617237)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2749 (class 2606 OID 14617192)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2750 (class 2606 OID 14617197)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2747 (class 2606 OID 14617182)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2748 (class 2606 OID 14617187)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2732 (class 2606 OID 14617107)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2718 (class 2606 OID 14617037)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2717 (class 2606 OID 14617032)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2715 (class 2606 OID 14617022)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2716 (class 2606 OID 14617027)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2746 (class 2606 OID 14617177)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2745 (class 2606 OID 14617172)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2756 (class 2606 OID 14617227)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2698 (class 2606 OID 14616937)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2759 (class 2606 OID 14617242)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2761 (class 2606 OID 14617252)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2771 (class 2606 OID 14617302)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2772 (class 2606 OID 14617307)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2682 (class 2606 OID 14616857)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2681 (class 2606 OID 14616852)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2685 (class 2606 OID 14616872)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2686 (class 2606 OID 14616877)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2710 (class 2606 OID 14616997)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2709 (class 2606 OID 14616992)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2708 (class 2606 OID 14616987)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-18 11:56:39 CEST

--
-- PostgreSQL database dump complete
--

