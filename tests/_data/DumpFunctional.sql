--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-25 14:40:09 CEST

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
-- TOC entry 2964 (class 0 OID 0)
-- Dependencies: 240
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 177 (class 1259 OID 15515075)
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
-- TOC entry 222 (class 1259 OID 15515577)
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
-- TOC entry 221 (class 1259 OID 15515560)
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
-- TOC entry 215 (class 1259 OID 15515472)
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
-- TOC entry 238 (class 1259 OID 15515826)
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
-- TOC entry 191 (class 1259 OID 15515253)
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
-- TOC entry 194 (class 1259 OID 15515287)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 15515728)
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
-- TOC entry 186 (class 1259 OID 15515196)
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
-- TOC entry 223 (class 1259 OID 15515590)
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
-- TOC entry 210 (class 1259 OID 15515417)
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
-- TOC entry 189 (class 1259 OID 15515233)
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
-- TOC entry 193 (class 1259 OID 15515281)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 187 (class 1259 OID 15515213)
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
-- TOC entry 199 (class 1259 OID 15515334)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 236 (class 1259 OID 15515807)
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
-- TOC entry 237 (class 1259 OID 15515819)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 15515841)
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
-- TOC entry 203 (class 1259 OID 15515359)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 15515170)
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
-- TOC entry 178 (class 1259 OID 15515084)
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
-- TOC entry 179 (class 1259 OID 15515095)
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
-- TOC entry 174 (class 1259 OID 15515049)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 15515068)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 15515366)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 15515397)
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
-- TOC entry 218 (class 1259 OID 15515511)
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
-- TOC entry 181 (class 1259 OID 15515128)
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
-- TOC entry 183 (class 1259 OID 15515162)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 15515340)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 182 (class 1259 OID 15515147)
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
-- TOC entry 188 (class 1259 OID 15515225)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 15515352)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 15515689)
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
-- TOC entry 226 (class 1259 OID 15515699)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 224 (class 1259 OID 15515645)
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
-- TOC entry 227 (class 1259 OID 15515707)
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
-- TOC entry 206 (class 1259 OID 15515381)
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
-- TOC entry 198 (class 1259 OID 15515325)
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
-- TOC entry 197 (class 1259 OID 15515315)
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
-- TOC entry 217 (class 1259 OID 15515500)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 15515449)
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
-- TOC entry 171 (class 1259 OID 15515020)
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
-- TOC entry 170 (class 1259 OID 15515018)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 207 (class 1259 OID 15515391)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 15515058)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 15515042)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 15515405)
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
-- TOC entry 201 (class 1259 OID 15515346)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 15515292)
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
-- TOC entry 232 (class 1259 OID 15515748)
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
-- TOC entry 231 (class 1259 OID 15515740)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 15515735)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 214 (class 1259 OID 15515459)
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
-- TOC entry 180 (class 1259 OID 15515120)
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
-- TOC entry 196 (class 1259 OID 15515302)
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
-- TOC entry 216 (class 1259 OID 15515489)
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
-- TOC entry 228 (class 1259 OID 15515717)
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
-- TOC entry 185 (class 1259 OID 15515182)
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
-- TOC entry 172 (class 1259 OID 15515029)
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
-- TOC entry 220 (class 1259 OID 15515537)
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
-- TOC entry 190 (class 1259 OID 15515244)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 205 (class 1259 OID 15515373)
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
-- TOC entry 234 (class 1259 OID 15515787)
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
-- TOC entry 233 (class 1259 OID 15515759)
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
-- TOC entry 235 (class 1259 OID 15515799)
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
-- TOC entry 212 (class 1259 OID 15515442)
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
-- TOC entry 192 (class 1259 OID 15515276)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 15515527)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 211 (class 1259 OID 15515432)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2170 (class 2604 OID 15515023)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2895 (class 0 OID 15515075)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 15515577)
-- Dependencies: 222
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-55dc-6228-64c1-0e85810285f4	000d0000-55dc-6228-cd53-527c0b031a8a	\N	00090000-55dc-6228-be47-03cf88774846	000b0000-55dc-6228-68f7-3d1fec354139	0001	f	\N	\N	\N	3	\N	\N	t	t
000c0000-55dc-6228-13c5-9c3eeddb9af1	000d0000-55dc-6228-ec52-0cd00f0ed7d2	00100000-55dc-6228-cdae-8ac03cf6bf3f	00090000-55dc-6228-413e-0fc763965f85	\N	0002	t	2016-01-01	\N	\N	8	\N	\N	f	f
000c0000-55dc-6228-466d-a3c82f49259b	000d0000-55dc-6228-cd39-632862c027d4	00100000-55dc-6228-e8ea-ec2c551d3e58	00090000-55dc-6228-1845-3128da1819a9	\N	0003	t	\N	2015-08-25	\N	2	\N	\N	f	f
000c0000-55dc-6228-4ff3-700ac93c0796	000d0000-55dc-6228-da80-a2974719ac36	\N	00090000-55dc-6228-0ff7-56490cdfc5d4	\N	0004	f	2016-01-01	2016-01-01	\N	26	\N	\N	f	f
000c0000-55dc-6228-5238-c35ff5c9af6e	000d0000-55dc-6228-2d7d-6e92b7c20967	\N	00090000-55dc-6228-62f3-eb4f084ca254	\N	0005	f	2016-01-01	2016-01-01	\N	7	\N	\N	f	f
000c0000-55dc-6228-4fe8-4ad805ecebf7	000d0000-55dc-6228-fb02-412e7030d3a9	\N	00090000-55dc-6228-018b-d520d087b7f2	000b0000-55dc-6228-ca43-a2eb02b272d0	0006	f	2016-01-01	2016-01-01	\N	1	\N	\N	t	t
000c0000-55dc-6228-0f0f-7aba74aea04c	000d0000-55dc-6228-80bd-cdebf9ff3a4b	00100000-55dc-6228-8e44-0386b4c5d1a3	00090000-55dc-6228-f4ff-05e4b2b2a937	\N	0007	t	2016-01-01	2016-01-01	\N	14	\N	\N	f	t
000c0000-55dc-6228-df7b-19516c5312fe	000d0000-55dc-6228-b274-fbc8fba1b48f	\N	00090000-55dc-6228-9a32-1dbc75d31225	000b0000-55dc-6228-8e0b-dd08e5baf585	0008	f	2016-01-01	2016-01-01	\N	12	\N	\N	t	t
000c0000-55dc-6228-07ea-4226ac83573c	000d0000-55dc-6228-80bd-cdebf9ff3a4b	00100000-55dc-6228-369a-8f5d93100a73	00090000-55dc-6228-6b5c-eda32771e84f	\N	0009	t	2017-01-01	2017-01-01	\N	15	\N	\N	f	t
000c0000-55dc-6228-f98a-7b1d41c39797	000d0000-55dc-6228-80bd-cdebf9ff3a4b	00100000-55dc-6228-5c9f-36ccc7fe9028	00090000-55dc-6228-7fd3-3fb8d9149657	\N	0010	t	\N	2015-08-25	\N	16	\N	\N	f	t
000c0000-55dc-6228-a71f-5d4f2f839caf	000d0000-55dc-6228-80bd-cdebf9ff3a4b	00100000-55dc-6228-0776-baedb7a4e4b4	00090000-55dc-6228-82df-fac8cbe5f416	\N	0011	t	2017-01-01	\N	\N	17	\N	\N	f	t
\.


--
-- TOC entry 2939 (class 0 OID 15515560)
-- Dependencies: 221
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2933 (class 0 OID 15515472)
-- Dependencies: 215
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-55dc-6227-a3b5-1717759932dc	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-55dc-6228-c1fa-9ab982961c9b	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-55dc-6228-571f-c0bfc12cc326	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2956 (class 0 OID 15515826)
-- Dependencies: 238
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2909 (class 0 OID 15515253)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-55dc-6228-92a9-01d576401003	\N	\N	00200000-55dc-6228-d438-fb3288eedb2f	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-55dc-6228-9a0c-ccb371d9d041	\N	\N	00200000-55dc-6228-4f03-8cd29ec17346	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-55dc-6228-7aa9-0df87c0ee267	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-55dc-6228-4522-197ee26930d0	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-55dc-6228-2ba1-fdf8a022156b	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2912 (class 0 OID 15515287)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 15515728)
-- Dependencies: 229
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 15515196)
-- Dependencies: 186
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-55dc-6226-0491-101d513c3c83	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-55dc-6226-eabf-185af7cab109	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-55dc-6226-3934-01f504172a92	AL	ALB	008	Albania 	Albanija	\N
00040000-55dc-6226-2d86-9a2d8050acfb	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-55dc-6226-c95d-158864637542	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-55dc-6226-d291-c34a78cc9900	AD	AND	020	Andorra 	Andora	\N
00040000-55dc-6226-e0cc-b1f3de472f12	AO	AGO	024	Angola 	Angola	\N
00040000-55dc-6226-f702-928d0b822c9f	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-55dc-6226-431d-52bef2540701	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-55dc-6226-4a5c-56457938a1b1	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-55dc-6226-d346-c84060ec432c	AR	ARG	032	Argentina 	Argenitna	\N
00040000-55dc-6226-d631-90b6d1039e82	AM	ARM	051	Armenia 	Armenija	\N
00040000-55dc-6226-3873-9a009652d366	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-55dc-6226-01dd-aa66e0157d98	AU	AUS	036	Australia 	Avstralija	\N
00040000-55dc-6226-124f-97b86a360612	AT	AUT	040	Austria 	Avstrija	\N
00040000-55dc-6226-ff50-3e75054161d3	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-55dc-6226-0513-ea5fab47de34	BS	BHS	044	Bahamas 	Bahami	\N
00040000-55dc-6226-6dfc-7d0f1bd7de34	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-55dc-6226-d315-152de52125f4	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-55dc-6226-6f45-c50b1193ddf5	BB	BRB	052	Barbados 	Barbados	\N
00040000-55dc-6226-ac90-61436373b70f	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-55dc-6226-e75e-d059c3e98b4a	BE	BEL	056	Belgium 	Belgija	\N
00040000-55dc-6226-98e0-efc2612e6a63	BZ	BLZ	084	Belize 	Belize	\N
00040000-55dc-6226-230c-80ee3dd3b9fd	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-55dc-6226-3410-577b549096a1	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-55dc-6226-a38a-6f48de3deef2	BT	BTN	064	Bhutan 	Butan	\N
00040000-55dc-6226-1581-65a658f58ca0	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-55dc-6226-bed9-9d59eaf2613a	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-55dc-6226-54b0-1cf7a40d46ca	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-55dc-6226-cb54-826e2f27e0ee	BW	BWA	072	Botswana 	Bocvana	\N
00040000-55dc-6226-15ef-3055a805d803	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-55dc-6226-f2c0-e0f407d943de	BR	BRA	076	Brazil 	Brazilija	\N
00040000-55dc-6226-83ca-5a32a50fd81a	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-55dc-6226-e2f2-1aa8e4aec81a	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-55dc-6226-8845-795d9cacdc87	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-55dc-6226-6465-dccaa5ef21d8	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-55dc-6226-686f-4cfafb30b823	BI	BDI	108	Burundi 	Burundi 	\N
00040000-55dc-6226-b4e9-877404b90366	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-55dc-6226-03f1-feb6ca338a19	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-55dc-6226-da45-cff80bb16648	CA	CAN	124	Canada 	Kanada	\N
00040000-55dc-6226-acd2-a58da5d47eba	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-55dc-6226-dc49-5b1b1c22aa41	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-55dc-6226-8af5-b2c8e9751bb8	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-55dc-6226-4c30-e06f20ea387d	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-55dc-6226-c01d-91c70313eb0c	CL	CHL	152	Chile 	Čile	\N
00040000-55dc-6226-ab71-22bd59c10c46	CN	CHN	156	China 	Kitajska	\N
00040000-55dc-6226-c767-be6939d5b443	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-55dc-6226-be72-8099999d3b24	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-55dc-6226-8787-970342e7f7bd	CO	COL	170	Colombia 	Kolumbija	\N
00040000-55dc-6226-edfa-1980032648f8	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-55dc-6226-74c4-f009ff6ab077	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-55dc-6226-d612-a50d078e2bef	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-55dc-6226-b924-cc1a48600ed7	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-55dc-6226-dfeb-b4101a5cca65	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-55dc-6226-665f-26faa7695f76	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-55dc-6226-5cd7-de8af3278544	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-55dc-6226-6b97-cb8f00c07ba0	CU	CUB	192	Cuba 	Kuba	\N
00040000-55dc-6226-8b6e-994da86c1acd	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-55dc-6226-d029-f1efa2df76f4	CY	CYP	196	Cyprus 	Ciper	\N
00040000-55dc-6226-baf3-9c0e3063d62d	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-55dc-6226-839b-3d7bdbabc8e4	DK	DNK	208	Denmark 	Danska	\N
00040000-55dc-6226-b1a3-cc4f30be4646	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-55dc-6226-be34-4e9831067c2d	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-55dc-6226-d4b5-f9217f4f4a8d	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-55dc-6226-9d33-ca5880b247c8	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-55dc-6226-da51-29b975283e90	EG	EGY	818	Egypt 	Egipt	\N
00040000-55dc-6226-ae85-395270c81932	SV	SLV	222	El Salvador 	Salvador	\N
00040000-55dc-6226-551f-5e0d18147f9f	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-55dc-6226-c4ce-e4f25c52c20b	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-55dc-6226-0cbe-89a6d6e32f77	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-55dc-6226-03a9-d48c70670813	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-55dc-6226-630b-32b50c5ae091	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-55dc-6226-a3cf-710de4c65126	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-55dc-6226-af1b-cefd240428a4	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-55dc-6226-6fee-f224360b7304	FI	FIN	246	Finland 	Finska	\N
00040000-55dc-6226-3415-cd1d0f409502	FR	FRA	250	France 	Francija	\N
00040000-55dc-6226-bb71-67b515c4d6aa	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-55dc-6226-52ee-ddb37ace5297	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-55dc-6226-a4a1-3274550a0087	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-55dc-6226-4010-f1eb1a5e5b53	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-55dc-6226-a122-8f684838985e	GA	GAB	266	Gabon 	Gabon	\N
00040000-55dc-6226-e822-27009b937527	GM	GMB	270	Gambia 	Gambija	\N
00040000-55dc-6226-23b7-59494faee2b7	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-55dc-6226-1196-0a28c8e6fa96	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-55dc-6226-7d62-35b2b08f4659	GH	GHA	288	Ghana 	Gana	\N
00040000-55dc-6226-de08-3a46bd63d360	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-55dc-6226-7482-e24030aa4703	GR	GRC	300	Greece 	Grčija	\N
00040000-55dc-6226-644c-a4e7d57eb19d	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-55dc-6226-dfa0-e2dfc6fd5bc9	GD	GRD	308	Grenada 	Grenada	\N
00040000-55dc-6226-2a57-d037f998a155	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-55dc-6226-3182-35be3f126bad	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-55dc-6226-e9ab-12817a5c2905	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-55dc-6226-dbd1-3c5f4113b181	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-55dc-6226-077d-0a134f2e5800	GN	GIN	324	Guinea 	Gvineja	\N
00040000-55dc-6226-ecd4-5e55e1936bb3	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-55dc-6226-55cc-a2127a643788	GY	GUY	328	Guyana 	Gvajana	\N
00040000-55dc-6226-f3a9-5ee9f3a0732e	HT	HTI	332	Haiti 	Haiti	\N
00040000-55dc-6226-f0d7-9a0b71db48c0	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-55dc-6226-b983-ce6797cd6e4a	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-55dc-6226-aca9-7977d7e4cdfc	HN	HND	340	Honduras 	Honduras	\N
00040000-55dc-6226-13ad-9a071d47a171	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-55dc-6226-5438-915d87bf8ee0	HU	HUN	348	Hungary 	Madžarska	\N
00040000-55dc-6226-faf2-9c85ba20f820	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-55dc-6226-2523-2c48052410bd	IN	IND	356	India 	Indija	\N
00040000-55dc-6226-739b-76929369a382	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-55dc-6226-a246-87d61cd9d57f	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-55dc-6226-c65c-2e21785e41b9	IQ	IRQ	368	Iraq 	Irak	\N
00040000-55dc-6226-1fc5-d90ed4f57b3f	IE	IRL	372	Ireland 	Irska	\N
00040000-55dc-6226-d23d-3928f4aa1123	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-55dc-6226-39fb-5d959bf9a9c2	IL	ISR	376	Israel 	Izrael	\N
00040000-55dc-6226-0e7e-76f32377d0b3	IT	ITA	380	Italy 	Italija	\N
00040000-55dc-6226-4a9e-1df56c05f5e7	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-55dc-6226-f238-71d2d06c82a0	JP	JPN	392	Japan 	Japonska	\N
00040000-55dc-6226-e95a-5b48fcba30cf	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-55dc-6226-34fc-60c7926a3bee	JO	JOR	400	Jordan 	Jordanija	\N
00040000-55dc-6226-3b52-fa4738a3b8f5	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-55dc-6226-ddc0-ee90a3d46a9f	KE	KEN	404	Kenya 	Kenija	\N
00040000-55dc-6226-da73-1455537a9459	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-55dc-6226-05c0-6ce96d3d59c1	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-55dc-6226-69e7-0c24c03b2215	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-55dc-6226-75b8-2e500c56b781	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-55dc-6226-04e7-5220b83592f9	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-55dc-6226-5435-f0ef2866e897	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-55dc-6226-cd37-4f17f02f6e5a	LV	LVA	428	Latvia 	Latvija	\N
00040000-55dc-6226-b2bb-922774ac36b6	LB	LBN	422	Lebanon 	Libanon	\N
00040000-55dc-6226-8931-4d6cfcb7540f	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-55dc-6226-a1c3-07430c1b5dad	LR	LBR	430	Liberia 	Liberija	\N
00040000-55dc-6226-2851-77550a134b1b	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-55dc-6226-4201-d2da779b5b37	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-55dc-6226-8113-d34929e2c2ef	LT	LTU	440	Lithuania 	Litva	\N
00040000-55dc-6226-f863-6e141c787b33	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-55dc-6226-4522-4c22d3038d66	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-55dc-6226-8fa2-550648a13db5	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-55dc-6226-3734-dd99a426460b	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-55dc-6226-bb9b-9bec3dc6259d	MW	MWI	454	Malawi 	Malavi	\N
00040000-55dc-6226-817d-510dd3ab855c	MY	MYS	458	Malaysia 	Malezija	\N
00040000-55dc-6226-cc95-8962a2eb5f9a	MV	MDV	462	Maldives 	Maldivi	\N
00040000-55dc-6226-0944-60a3e5883d20	ML	MLI	466	Mali 	Mali	\N
00040000-55dc-6226-e4dc-be49a5463df8	MT	MLT	470	Malta 	Malta	\N
00040000-55dc-6226-7052-eaa806292cbe	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-55dc-6226-183f-8637c1164eb7	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-55dc-6226-61fc-5b566d52a3f1	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-55dc-6226-5fab-038f34d783ec	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-55dc-6226-8c31-a9ef21b8ff8a	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-55dc-6226-5729-4847c6b5a70a	MX	MEX	484	Mexico 	Mehika	\N
00040000-55dc-6226-e4d5-d36f0bf637c7	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-55dc-6226-42d8-13ba302f68f3	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-55dc-6226-2369-f1457c7e0569	MC	MCO	492	Monaco 	Monako	\N
00040000-55dc-6226-dc70-2f02b27cae63	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-55dc-6226-a791-8d9d4019b22d	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-55dc-6226-9c3a-0b3771b9a0cb	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-55dc-6226-e1b4-221efa90ff6c	MA	MAR	504	Morocco 	Maroko	\N
00040000-55dc-6226-3bb9-f47bb3a9954d	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-55dc-6226-6be9-dd8526979a54	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-55dc-6226-4cb4-5c49ea3d0024	NA	NAM	516	Namibia 	Namibija	\N
00040000-55dc-6226-fbf8-8055cdca07e6	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-55dc-6226-8e0b-97245014ce08	NP	NPL	524	Nepal 	Nepal	\N
00040000-55dc-6226-05b4-b9750c1c97ea	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-55dc-6226-86d8-06e7ce45cf49	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-55dc-6226-bc9f-9a801fe8c999	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-55dc-6226-4c1b-ae8e65a47b78	NE	NER	562	Niger 	Niger 	\N
00040000-55dc-6226-7775-cb8375ac71f1	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-55dc-6226-91a6-b1d2f87dd967	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-55dc-6226-c580-685c23b92cdb	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-55dc-6226-e3be-549d461bd077	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-55dc-6226-fd41-db21e5aca8e4	NO	NOR	578	Norway 	Norveška	\N
00040000-55dc-6226-d16a-317702f11636	OM	OMN	512	Oman 	Oman	\N
00040000-55dc-6226-a6ef-ad16c70dace9	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-55dc-6226-e89c-0cc2d11b207f	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-55dc-6226-f35a-6881c3628d0c	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-55dc-6226-c57e-767ff866254d	PA	PAN	591	Panama 	Panama	\N
00040000-55dc-6226-028d-9141c7a4b31e	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-55dc-6226-2f7c-cd9d024b31c3	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-55dc-6226-41ff-6cbf41a577d7	PE	PER	604	Peru 	Peru	\N
00040000-55dc-6226-1370-2b929fb506ee	PH	PHL	608	Philippines 	Filipini	\N
00040000-55dc-6226-1062-f35a85f5c18a	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-55dc-6226-5902-4c18c147461f	PL	POL	616	Poland 	Poljska	\N
00040000-55dc-6226-40a6-b0bf70605fee	PT	PRT	620	Portugal 	Portugalska	\N
00040000-55dc-6226-7129-366b9d3745df	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-55dc-6226-e7ff-11e97cc73958	QA	QAT	634	Qatar 	Katar	\N
00040000-55dc-6226-4eb3-7422bc9c0d25	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-55dc-6226-3d6a-c0cd36a289ed	RO	ROU	642	Romania 	Romunija	\N
00040000-55dc-6226-6fa4-412e371913f5	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-55dc-6226-ae33-f0071b99b2b1	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-55dc-6226-4f95-9b1a294fb159	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-55dc-6226-8418-ca4271f74ea3	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-55dc-6226-5633-7d427cfb9d2d	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-55dc-6226-5a9e-98db8daa0408	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-55dc-6226-8dea-a764efd74221	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-55dc-6226-baae-e475df48c1ea	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-55dc-6226-f5f8-85ca79d9735d	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-55dc-6226-6c4f-beef94818d1f	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-55dc-6226-5656-156d96240fd4	SM	SMR	674	San Marino 	San Marino	\N
00040000-55dc-6226-3b85-f6d6dae26ac2	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-55dc-6226-3375-9743d145edf5	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-55dc-6226-dd00-336e48887f03	SN	SEN	686	Senegal 	Senegal	\N
00040000-55dc-6226-7270-c0c3d8e96d70	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-55dc-6226-f0ed-205321f59d71	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-55dc-6226-ad17-570014f517c9	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-55dc-6226-3b1f-29f529908b05	SG	SGP	702	Singapore 	Singapur	\N
00040000-55dc-6226-b41a-5de849e16598	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-55dc-6226-b151-54407178b22e	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-55dc-6226-a187-896de7e7c8e2	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-55dc-6226-1be9-48e18e88661f	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-55dc-6226-124f-c0253bcb1ccc	SO	SOM	706	Somalia 	Somalija	\N
00040000-55dc-6226-cad2-fffa4bbc25fb	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-55dc-6226-36c3-e7eca92967fe	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-55dc-6226-d092-09cd4a1e76f9	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-55dc-6226-90b4-fec139d96565	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-55dc-6226-706f-8a07d28ddd08	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-55dc-6226-7bdb-3779aeeb388d	SD	SDN	729	Sudan 	Sudan	\N
00040000-55dc-6226-27eb-3858bbfeb0ea	SR	SUR	740	Suriname 	Surinam	\N
00040000-55dc-6226-662c-8014b898595e	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-55dc-6226-cbd7-6f63dcfaab74	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-55dc-6226-57a0-f71678a9a343	SE	SWE	752	Sweden 	Švedska	\N
00040000-55dc-6226-a64b-eb686e94aa9c	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-55dc-6226-be04-3d502de52445	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-55dc-6226-7229-54926a6cfcf4	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-55dc-6226-5eb7-cc4630666dc0	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-55dc-6226-e44c-da47935177f1	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-55dc-6226-7145-9d7811b62617	TH	THA	764	Thailand 	Tajska	\N
00040000-55dc-6226-4e8f-0dd7a2dcae9c	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-55dc-6226-e9b7-3e638cc5a056	TG	TGO	768	Togo 	Togo	\N
00040000-55dc-6226-ba71-337be9282b80	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-55dc-6226-9121-755a1445ae9e	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-55dc-6226-7ed2-3549c652239e	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-55dc-6226-ad85-ee709f73f78f	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-55dc-6226-36a0-36c708697f58	TR	TUR	792	Turkey 	Turčija	\N
00040000-55dc-6226-5be6-c82c53d8da76	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-55dc-6226-c41c-f51cbf9e0ea3	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55dc-6226-3fc6-5a2189bc2e25	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-55dc-6226-a771-7e59646253ad	UG	UGA	800	Uganda 	Uganda	\N
00040000-55dc-6226-8ac5-ec5927bd17d5	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-55dc-6226-2f81-1959b0d486ef	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-55dc-6226-1882-505fd4d27a24	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-55dc-6226-53c5-b32b655aa3b6	US	USA	840	United States 	Združene države Amerike	\N
00040000-55dc-6226-d08b-cafa7e8101b5	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-55dc-6226-f694-794a941998fa	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-55dc-6226-194b-f46aa1a644cc	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-55dc-6226-554f-41b09eecece4	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-55dc-6226-9d0c-4fdf9de6d1cd	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-55dc-6226-18e5-9f53a6c80430	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-55dc-6226-c901-a3738cf5f7ef	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-55dc-6226-87e6-838398150da7	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-55dc-6226-a00c-8d09d580afa1	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-55dc-6226-1fff-a830282fac36	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-55dc-6226-6f37-04a106663ca9	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-55dc-6226-48f0-eaa2f5c1f351	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-55dc-6226-3dd9-7b6dcb73fa29	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2941 (class 0 OID 15515590)
-- Dependencies: 223
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-55dc-6228-469d-d1a5a7e6e638	000e0000-55dc-6228-0a80-91a83633f032	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55dc-6226-caf6-11b2869e9080	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55dc-6228-44cd-b3c0ad5dc207	000e0000-55dc-6228-f6ba-85034de8d8f7	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55dc-6226-7f90-abebdb98122f	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-55dc-6228-ecf8-6a24d9b879ca	000e0000-55dc-6228-196e-a57260712fcb	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-55dc-6226-caf6-11b2869e9080	premiera	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55dc-6228-e097-23b943797e74	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-55dc-6228-887a-128347fd63b0	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2928 (class 0 OID 15515417)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-55dc-6228-80bd-cdebf9ff3a4b	000e0000-55dc-6228-f6ba-85034de8d8f7	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-55dc-6226-457a-02f306144530
000d0000-55dc-6228-cd53-527c0b031a8a	000e0000-55dc-6228-f6ba-85034de8d8f7	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-55dc-6226-457a-02f306144530
000d0000-55dc-6228-ec52-0cd00f0ed7d2	000e0000-55dc-6228-f6ba-85034de8d8f7	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-55dc-6226-ecc2-f9e39281421a
000d0000-55dc-6228-cd39-632862c027d4	000e0000-55dc-6228-f6ba-85034de8d8f7	\N	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-55dc-6226-f1df-ddefaf92a787
000d0000-55dc-6228-da80-a2974719ac36	000e0000-55dc-6228-f6ba-85034de8d8f7	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-55dc-6226-e24e-6ffd01eb29ec
000d0000-55dc-6228-2d7d-6e92b7c20967	000e0000-55dc-6228-f6ba-85034de8d8f7	\N	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-55dc-6226-e24e-6ffd01eb29ec
000d0000-55dc-6228-fb02-412e7030d3a9	000e0000-55dc-6228-f6ba-85034de8d8f7	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-55dc-6226-457a-02f306144530
000d0000-55dc-6228-b274-fbc8fba1b48f	000e0000-55dc-6228-f6ba-85034de8d8f7	\N	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-55dc-6226-8a71-18b582201e23
\.


--
-- TOC entry 2907 (class 0 OID 15515233)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2911 (class 0 OID 15515281)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 15515213)
-- Dependencies: 187
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-55dc-6228-74a2-cd2791ee20a5	00080000-55dc-6228-9694-c9477bc138ab	00090000-55dc-6228-7fd3-3fb8d9149657	AK		
\.


--
-- TOC entry 2917 (class 0 OID 15515334)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 15515807)
-- Dependencies: 236
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2955 (class 0 OID 15515819)
-- Dependencies: 237
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 2957 (class 0 OID 15515841)
-- Dependencies: 239
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2921 (class 0 OID 15515359)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2902 (class 0 OID 15515170)
-- Dependencies: 184
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-55dc-6227-fd1d-b07a898c626f	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-55dc-6227-3f59-44207d4c8322	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-55dc-6227-528a-847520b15bac	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-55dc-6227-d3bc-80b9cfa6cc3c	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-55dc-6227-88bc-c40fb7927a74	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-55dc-6227-ba56-6845e4142477	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-55dc-6227-79bd-6e31ba6f23a9	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-55dc-6227-f00c-cb619f96dbfb	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-55dc-6227-c404-90547e886c86	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-55dc-6227-7114-f6931942a663	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-55dc-6227-3ffa-4aec3fa4e223	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-55dc-6227-c32a-75521f1de826	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:9:"avtorprav";a:1:{s:5:"label";s:32:"Strošek odkupa avtorskih pravic";}}	f	t	f	\N	Tip stroška
00000000-55dc-6227-2926-81f40c5b9652	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-55dc-6228-a9e7-642b356db613	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-55dc-6228-a4e3-8df831d896e7	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-55dc-6228-ca83-02a300441352	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-55dc-6228-4862-af18d7bc7ee6	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-55dc-6228-858a-9cc66d81d8e7	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-55dc-6229-3902-dca4f9672a2e	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2896 (class 0 OID 15515084)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-55dc-6228-e64c-eec9a538db48	00000000-55dc-6228-a9e7-642b356db613	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-55dc-6228-9156-2f9e151a8d24	00000000-55dc-6228-a9e7-642b356db613	00010000-55dc-6227-7e4e-7095fd972ae2	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-55dc-6228-780d-f78affcb03e4	00000000-55dc-6228-a4e3-8df831d896e7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2897 (class 0 OID 15515095)
-- Dependencies: 179
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-55dc-6228-be47-03cf88774846	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-55dc-6228-0ff7-56490cdfc5d4	00010000-55dc-6228-ad1b-2552c645e0c4	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-55dc-6228-1845-3128da1819a9	00010000-55dc-6228-eef4-357be44d87ab	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-55dc-6228-6b5c-eda32771e84f	00010000-55dc-6228-d61c-7c553e525248	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-55dc-6228-66a4-974b88581f12	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-55dc-6228-018b-d520d087b7f2	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-55dc-6228-82df-fac8cbe5f416	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-55dc-6228-f4ff-05e4b2b2a937	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-55dc-6228-7fd3-3fb8d9149657	00010000-55dc-6228-9877-143b071e45f2	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-55dc-6228-413e-0fc763965f85	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-55dc-6228-2775-a3e03e287ad2	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-55dc-6228-62f3-eb4f084ca254	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-55dc-6228-9a32-1dbc75d31225	00010000-55dc-6228-a746-ca48f988cc1d	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2892 (class 0 OID 15515049)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-55dc-6227-30ef-05c135997e78	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-55dc-6227-b0ef-3d11aba8d898	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-55dc-6227-6c23-e3edd184cbcc	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-55dc-6227-2e6c-2c791d1ec7cb	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-55dc-6227-5cb1-8cf8a20a8068	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-55dc-6227-0c14-2dfc8d67728e	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-55dc-6227-cb79-159dace7faab	Abonma-read	Abonma - branje	f
00030000-55dc-6227-52f9-dc7d937674d0	Abonma-write	Abonma - spreminjanje	f
00030000-55dc-6227-b377-f4b69e0c48a5	Alternacija-read	Alternacija - branje	f
00030000-55dc-6227-c4ce-3ce8874b0bea	Alternacija-write	Alternacija - spreminjanje	f
00030000-55dc-6227-b2b2-d778471fe329	Arhivalija-read	Arhivalija - branje	f
00030000-55dc-6227-bf4d-ee8ef5bbbd55	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-55dc-6227-a33b-8b4e5ab1b60d	Besedilo-read	Besedilo - branje	f
00030000-55dc-6227-eda9-038c01711515	Besedilo-write	Besedilo - spreminjanje	f
00030000-55dc-6227-1b62-1c3c42c98a92	DogodekIzven-read	DogodekIzven - branje	f
00030000-55dc-6227-c362-f204c3ddcee4	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-55dc-6227-7aaa-1e0188eef424	Dogodek-read	Dogodek - branje	f
00030000-55dc-6227-03e9-2a380836faa4	Dogodek-write	Dogodek - spreminjanje	f
00030000-55dc-6227-b647-a8177deb3d31	DrugiVir-read	DrugiVir - branje	f
00030000-55dc-6227-17f5-47e64314302a	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-55dc-6227-1999-2ab55d8c0f74	Drzava-read	Drzava - branje	f
00030000-55dc-6227-5927-ad50e724d5db	Drzava-write	Drzava - spreminjanje	f
00030000-55dc-6227-dd7a-d0b1a2400dc5	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-55dc-6227-63f0-1d2c98090e7a	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-55dc-6227-24d9-17ae67e4fb90	Funkcija-read	Funkcija - branje	f
00030000-55dc-6227-c95a-5d6362a6a8eb	Funkcija-write	Funkcija - spreminjanje	f
00030000-55dc-6227-9e25-389dbbe66c7d	Gostovanje-read	Gostovanje - branje	f
00030000-55dc-6227-b839-011da3a9b2db	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-55dc-6227-6125-abb6d40da743	Gostujoca-read	Gostujoca - branje	f
00030000-55dc-6227-4bd1-e913d63e4be7	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-55dc-6227-cc5e-c6f25a74b8f9	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-55dc-6227-d9f2-9a787c96a702	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-55dc-6227-25ef-ff9858f3111b	Kupec-read	Kupec - branje	f
00030000-55dc-6227-3879-14de8da9dfc2	Kupec-write	Kupec - spreminjanje	f
00030000-55dc-6227-8912-c6d9717cfe87	NacinPlacina-read	NacinPlacina - branje	f
00030000-55dc-6227-542f-09680318f436	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-55dc-6227-0263-416e5c047422	Option-read	Option - branje	f
00030000-55dc-6227-1c03-9b6531c948fb	Option-write	Option - spreminjanje	f
00030000-55dc-6227-fb32-4eb7cb23b746	OptionValue-read	OptionValue - branje	f
00030000-55dc-6227-125d-e8ce6930459d	OptionValue-write	OptionValue - spreminjanje	f
00030000-55dc-6227-6508-80469867e2d8	Oseba-read	Oseba - branje	f
00030000-55dc-6227-752d-604f02d11ae0	Oseba-write	Oseba - spreminjanje	f
00030000-55dc-6227-7f5f-b77efc23d6dc	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-55dc-6227-6586-baf01a9e14ee	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-55dc-6227-6111-dae93e7dd545	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-55dc-6227-0e71-02c772147193	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-55dc-6227-e3ac-7f7a65c0749a	Pogodba-read	Pogodba - branje	f
00030000-55dc-6227-422f-e0150b94f9a2	Pogodba-write	Pogodba - spreminjanje	f
00030000-55dc-6227-73b4-c35f46d483e3	Popa-read	Popa - branje	f
00030000-55dc-6227-d293-e871f588dffc	Popa-write	Popa - spreminjanje	f
00030000-55dc-6227-b30b-2c9181361d5c	Posta-read	Posta - branje	f
00030000-55dc-6227-b8d2-e7e8046ada5b	Posta-write	Posta - spreminjanje	f
00030000-55dc-6227-26eb-175ea081aed6	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-55dc-6227-013c-793e19bad51f	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-55dc-6227-0880-f28eb544c63f	PostniNaslov-read	PostniNaslov - branje	f
00030000-55dc-6227-27fd-c1c57a574704	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-55dc-6227-e597-fa4006d0c843	Predstava-read	Predstava - branje	f
00030000-55dc-6227-0653-6a01bcca00aa	Predstava-write	Predstava - spreminjanje	f
00030000-55dc-6227-2047-53231c832701	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-55dc-6227-c92f-dff766a869ab	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-55dc-6227-f454-20ffb6066ca0	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-55dc-6227-fcd4-4ab8c76f6b98	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-55dc-6227-2975-73ffe3c55469	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-55dc-6227-2016-a71ba9631e32	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-55dc-6227-f7f3-95e866652078	ProgramDela-read	ProgramDela - branje	f
00030000-55dc-6227-05b8-90ce4e9d9ebc	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-55dc-6227-b6f6-bbeaf87c6fe2	ProgramFestival-read	ProgramFestival - branje	f
00030000-55dc-6227-e90f-96853ccd9d61	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-55dc-6227-7583-7238daadff07	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-55dc-6227-bfc2-4abc233ad9f5	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-55dc-6227-1327-a2e22c3017e4	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-55dc-6227-187b-1888141f1370	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-55dc-6227-5de9-7524f47a1e88	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-55dc-6227-1a4c-f08f6dfefc01	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-55dc-6227-f284-b01e8ba1307d	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-55dc-6227-1c6c-fca21567107f	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-55dc-6227-63b1-33dc993f4e8e	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-55dc-6227-69c0-58558f67bef5	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-55dc-6227-6322-2770e971cd19	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-55dc-6227-7839-d9da2039c52e	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-55dc-6227-e32b-ee3b05be09d1	ProgramRazno-read	ProgramRazno - branje	f
00030000-55dc-6227-0ffa-a6385980b15c	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-55dc-6227-20df-afbe1da24c31	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-55dc-6227-87bf-9a9374b388cc	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-55dc-6227-9827-4a44d723d737	Prostor-read	Prostor - branje	f
00030000-55dc-6227-1994-f228f3cac248	Prostor-write	Prostor - spreminjanje	f
00030000-55dc-6227-3abe-ae8e22f317b6	Racun-read	Racun - branje	f
00030000-55dc-6227-30d9-9f401a04da3a	Racun-write	Racun - spreminjanje	f
00030000-55dc-6227-919f-d7ed57451f7a	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-55dc-6227-7723-8c97af6f4c37	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-55dc-6227-f9f7-787b0c250cb1	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-55dc-6227-69ab-2bb328ff6187	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-55dc-6227-4fb8-fc6949047bf0	Rekvizit-read	Rekvizit - branje	f
00030000-55dc-6227-d9dd-2666db5e7207	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-55dc-6227-0bd1-f274282acd87	Revizija-read	Revizija - branje	f
00030000-55dc-6227-baaf-1519e603b688	Revizija-write	Revizija - spreminjanje	f
00030000-55dc-6227-6e2e-0046909f06bd	Rezervacija-read	Rezervacija - branje	f
00030000-55dc-6227-e4bb-d37146a5ab7b	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-55dc-6227-dd33-7c4a378b8354	SedezniRed-read	SedezniRed - branje	f
00030000-55dc-6227-0990-f91d815bd56a	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-55dc-6227-70dc-23dd6ddeb67d	Sedez-read	Sedez - branje	f
00030000-55dc-6227-2570-89e94dc92dae	Sedez-write	Sedez - spreminjanje	f
00030000-55dc-6227-c530-17f6addfd5d5	Sezona-read	Sezona - branje	f
00030000-55dc-6227-0719-2bc7c4c32e08	Sezona-write	Sezona - spreminjanje	f
00030000-55dc-6227-f7b9-e54ca59296d5	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-55dc-6227-38d5-52e1a3d65a41	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-55dc-6227-1032-55868596e657	Stevilcenje-read	Stevilcenje - branje	f
00030000-55dc-6227-31c4-e2fb5e4bc534	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-55dc-6227-65e5-9de4766578db	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-55dc-6227-75f0-530de018ec94	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-55dc-6227-f210-eeac83820ab4	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-55dc-6227-f22c-524f2159b594	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-55dc-6227-bb71-3822003383c5	Telefonska-read	Telefonska - branje	f
00030000-55dc-6227-dc46-9e977dd86099	Telefonska-write	Telefonska - spreminjanje	f
00030000-55dc-6227-680d-3f838a274e58	TerminStoritve-read	TerminStoritve - branje	f
00030000-55dc-6227-c392-58bf95d898c3	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-55dc-6227-f22f-1f0fedf658e6	TipFunkcije-read	TipFunkcije - branje	f
00030000-55dc-6227-fa62-b9dc4c5d1957	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-55dc-6227-70f4-6503841a6a30	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-55dc-6227-9d47-44f5b2219571	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-55dc-6227-78b0-be67b551fc6e	Trr-read	Trr - branje	f
00030000-55dc-6227-32ca-e3a4bd988903	Trr-write	Trr - spreminjanje	f
00030000-55dc-6227-0147-c94235c2d320	Uprizoritev-read	Uprizoritev - branje	f
00030000-55dc-6227-a28e-a25d9b5e4639	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-55dc-6227-1384-9786581f9310	Vaja-read	Vaja - branje	f
00030000-55dc-6227-934c-0213ab2ac280	Vaja-write	Vaja - spreminjanje	f
00030000-55dc-6227-ec44-88bece26fa7c	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-55dc-6227-05bc-8e25f9282f6c	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-55dc-6227-edaf-85d5973803fb	Zaposlitev-read	Zaposlitev - branje	f
00030000-55dc-6227-a910-d2d4bfce8115	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-55dc-6227-28ce-e7fb302820db	Zasedenost-read	Zasedenost - branje	f
00030000-55dc-6227-b4ef-1e8d4879d641	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-55dc-6227-5475-313483b85665	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-55dc-6227-11ab-8dd546342175	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-55dc-6227-75d4-30f17b15f35d	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-55dc-6227-8432-ae81a134905e	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-55dc-6227-0239-08389abb8345	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-55dc-6227-f72a-b47fba16c32c	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-55dc-6227-1b95-c3e140786dfe	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-55dc-6227-ee75-af80e877167a	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-55dc-6227-421c-4a1c84cc9f96	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-55dc-6227-b1ca-c715563910cc	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-55dc-6227-ba94-6f3715b83848	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55dc-6227-7f01-50e8b31cd430	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-55dc-6227-a7ac-db4cab3e96ea	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-55dc-6227-d003-a1758ca95231	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-55dc-6227-bd85-efcdcf99dc30	Datoteka-write	Datoteka - spreminjanje	f
00030000-55dc-6227-3dd8-e45e82986fb2	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2894 (class 0 OID 15515068)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-55dc-6227-a97f-8d89f2965834	00030000-55dc-6227-b0ef-3d11aba8d898
00020000-55dc-6227-aeee-06ed3a1621fa	00030000-55dc-6227-1999-2ab55d8c0f74
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-cb79-159dace7faab
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-52f9-dc7d937674d0
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-b377-f4b69e0c48a5
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-c4ce-3ce8874b0bea
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-b2b2-d778471fe329
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-7aaa-1e0188eef424
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-2e6c-2c791d1ec7cb
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-03e9-2a380836faa4
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-1999-2ab55d8c0f74
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-5927-ad50e724d5db
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-24d9-17ae67e4fb90
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-c95a-5d6362a6a8eb
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-9e25-389dbbe66c7d
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-b839-011da3a9b2db
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-6125-abb6d40da743
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-4bd1-e913d63e4be7
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-cc5e-c6f25a74b8f9
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-d9f2-9a787c96a702
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-0263-416e5c047422
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-fb32-4eb7cb23b746
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-6508-80469867e2d8
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-752d-604f02d11ae0
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-73b4-c35f46d483e3
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-d293-e871f588dffc
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-b30b-2c9181361d5c
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-b8d2-e7e8046ada5b
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-0880-f28eb544c63f
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-27fd-c1c57a574704
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-e597-fa4006d0c843
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-0653-6a01bcca00aa
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-2975-73ffe3c55469
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-2016-a71ba9631e32
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-9827-4a44d723d737
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-1994-f228f3cac248
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-f9f7-787b0c250cb1
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-69ab-2bb328ff6187
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-4fb8-fc6949047bf0
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-d9dd-2666db5e7207
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-c530-17f6addfd5d5
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-0719-2bc7c4c32e08
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-f22f-1f0fedf658e6
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-0147-c94235c2d320
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-a28e-a25d9b5e4639
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-1384-9786581f9310
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-934c-0213ab2ac280
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-28ce-e7fb302820db
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-b4ef-1e8d4879d641
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-5475-313483b85665
00020000-55dc-6227-632a-e984452a9cc0	00030000-55dc-6227-75d4-30f17b15f35d
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-cb79-159dace7faab
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-b2b2-d778471fe329
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-7aaa-1e0188eef424
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-1999-2ab55d8c0f74
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-9e25-389dbbe66c7d
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-6125-abb6d40da743
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-cc5e-c6f25a74b8f9
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-d9f2-9a787c96a702
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-0263-416e5c047422
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-fb32-4eb7cb23b746
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-6508-80469867e2d8
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-752d-604f02d11ae0
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-73b4-c35f46d483e3
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-b30b-2c9181361d5c
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-0880-f28eb544c63f
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-27fd-c1c57a574704
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-e597-fa4006d0c843
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-9827-4a44d723d737
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-f9f7-787b0c250cb1
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-4fb8-fc6949047bf0
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-c530-17f6addfd5d5
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-bb71-3822003383c5
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-dc46-9e977dd86099
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-78b0-be67b551fc6e
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-32ca-e3a4bd988903
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-edaf-85d5973803fb
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-a910-d2d4bfce8115
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-5475-313483b85665
00020000-55dc-6227-bcc7-ecf125a9e86c	00030000-55dc-6227-75d4-30f17b15f35d
00020000-55dc-6227-e8ef-3919c6407ff3	00030000-55dc-6227-cb79-159dace7faab
00020000-55dc-6227-e8ef-3919c6407ff3	00030000-55dc-6227-b377-f4b69e0c48a5
00020000-55dc-6227-e8ef-3919c6407ff3	00030000-55dc-6227-b2b2-d778471fe329
00020000-55dc-6227-e8ef-3919c6407ff3	00030000-55dc-6227-bf4d-ee8ef5bbbd55
00020000-55dc-6227-e8ef-3919c6407ff3	00030000-55dc-6227-a33b-8b4e5ab1b60d
00020000-55dc-6227-e8ef-3919c6407ff3	00030000-55dc-6227-1b62-1c3c42c98a92
00020000-55dc-6227-e8ef-3919c6407ff3	00030000-55dc-6227-7aaa-1e0188eef424
00020000-55dc-6227-e8ef-3919c6407ff3	00030000-55dc-6227-1999-2ab55d8c0f74
00020000-55dc-6227-e8ef-3919c6407ff3	00030000-55dc-6227-24d9-17ae67e4fb90
00020000-55dc-6227-e8ef-3919c6407ff3	00030000-55dc-6227-9e25-389dbbe66c7d
00020000-55dc-6227-e8ef-3919c6407ff3	00030000-55dc-6227-6125-abb6d40da743
00020000-55dc-6227-e8ef-3919c6407ff3	00030000-55dc-6227-cc5e-c6f25a74b8f9
00020000-55dc-6227-e8ef-3919c6407ff3	00030000-55dc-6227-0263-416e5c047422
00020000-55dc-6227-e8ef-3919c6407ff3	00030000-55dc-6227-fb32-4eb7cb23b746
00020000-55dc-6227-e8ef-3919c6407ff3	00030000-55dc-6227-6508-80469867e2d8
00020000-55dc-6227-e8ef-3919c6407ff3	00030000-55dc-6227-73b4-c35f46d483e3
00020000-55dc-6227-e8ef-3919c6407ff3	00030000-55dc-6227-b30b-2c9181361d5c
00020000-55dc-6227-e8ef-3919c6407ff3	00030000-55dc-6227-e597-fa4006d0c843
00020000-55dc-6227-e8ef-3919c6407ff3	00030000-55dc-6227-2975-73ffe3c55469
00020000-55dc-6227-e8ef-3919c6407ff3	00030000-55dc-6227-9827-4a44d723d737
00020000-55dc-6227-e8ef-3919c6407ff3	00030000-55dc-6227-f9f7-787b0c250cb1
00020000-55dc-6227-e8ef-3919c6407ff3	00030000-55dc-6227-4fb8-fc6949047bf0
00020000-55dc-6227-e8ef-3919c6407ff3	00030000-55dc-6227-c530-17f6addfd5d5
00020000-55dc-6227-e8ef-3919c6407ff3	00030000-55dc-6227-f22f-1f0fedf658e6
00020000-55dc-6227-e8ef-3919c6407ff3	00030000-55dc-6227-1384-9786581f9310
00020000-55dc-6227-e8ef-3919c6407ff3	00030000-55dc-6227-28ce-e7fb302820db
00020000-55dc-6227-e8ef-3919c6407ff3	00030000-55dc-6227-5475-313483b85665
00020000-55dc-6227-e8ef-3919c6407ff3	00030000-55dc-6227-75d4-30f17b15f35d
00020000-55dc-6227-6d04-69ca87b950de	00030000-55dc-6227-cb79-159dace7faab
00020000-55dc-6227-6d04-69ca87b950de	00030000-55dc-6227-52f9-dc7d937674d0
00020000-55dc-6227-6d04-69ca87b950de	00030000-55dc-6227-c4ce-3ce8874b0bea
00020000-55dc-6227-6d04-69ca87b950de	00030000-55dc-6227-b2b2-d778471fe329
00020000-55dc-6227-6d04-69ca87b950de	00030000-55dc-6227-7aaa-1e0188eef424
00020000-55dc-6227-6d04-69ca87b950de	00030000-55dc-6227-1999-2ab55d8c0f74
00020000-55dc-6227-6d04-69ca87b950de	00030000-55dc-6227-9e25-389dbbe66c7d
00020000-55dc-6227-6d04-69ca87b950de	00030000-55dc-6227-6125-abb6d40da743
00020000-55dc-6227-6d04-69ca87b950de	00030000-55dc-6227-0263-416e5c047422
00020000-55dc-6227-6d04-69ca87b950de	00030000-55dc-6227-fb32-4eb7cb23b746
00020000-55dc-6227-6d04-69ca87b950de	00030000-55dc-6227-73b4-c35f46d483e3
00020000-55dc-6227-6d04-69ca87b950de	00030000-55dc-6227-b30b-2c9181361d5c
00020000-55dc-6227-6d04-69ca87b950de	00030000-55dc-6227-e597-fa4006d0c843
00020000-55dc-6227-6d04-69ca87b950de	00030000-55dc-6227-9827-4a44d723d737
00020000-55dc-6227-6d04-69ca87b950de	00030000-55dc-6227-f9f7-787b0c250cb1
00020000-55dc-6227-6d04-69ca87b950de	00030000-55dc-6227-4fb8-fc6949047bf0
00020000-55dc-6227-6d04-69ca87b950de	00030000-55dc-6227-c530-17f6addfd5d5
00020000-55dc-6227-6d04-69ca87b950de	00030000-55dc-6227-f22f-1f0fedf658e6
00020000-55dc-6227-6d04-69ca87b950de	00030000-55dc-6227-5475-313483b85665
00020000-55dc-6227-6d04-69ca87b950de	00030000-55dc-6227-75d4-30f17b15f35d
00020000-55dc-6227-850e-43cfde96f0b6	00030000-55dc-6227-cb79-159dace7faab
00020000-55dc-6227-850e-43cfde96f0b6	00030000-55dc-6227-b2b2-d778471fe329
00020000-55dc-6227-850e-43cfde96f0b6	00030000-55dc-6227-7aaa-1e0188eef424
00020000-55dc-6227-850e-43cfde96f0b6	00030000-55dc-6227-1999-2ab55d8c0f74
00020000-55dc-6227-850e-43cfde96f0b6	00030000-55dc-6227-9e25-389dbbe66c7d
00020000-55dc-6227-850e-43cfde96f0b6	00030000-55dc-6227-6125-abb6d40da743
00020000-55dc-6227-850e-43cfde96f0b6	00030000-55dc-6227-0263-416e5c047422
00020000-55dc-6227-850e-43cfde96f0b6	00030000-55dc-6227-fb32-4eb7cb23b746
00020000-55dc-6227-850e-43cfde96f0b6	00030000-55dc-6227-73b4-c35f46d483e3
00020000-55dc-6227-850e-43cfde96f0b6	00030000-55dc-6227-b30b-2c9181361d5c
00020000-55dc-6227-850e-43cfde96f0b6	00030000-55dc-6227-e597-fa4006d0c843
00020000-55dc-6227-850e-43cfde96f0b6	00030000-55dc-6227-9827-4a44d723d737
00020000-55dc-6227-850e-43cfde96f0b6	00030000-55dc-6227-f9f7-787b0c250cb1
00020000-55dc-6227-850e-43cfde96f0b6	00030000-55dc-6227-4fb8-fc6949047bf0
00020000-55dc-6227-850e-43cfde96f0b6	00030000-55dc-6227-c530-17f6addfd5d5
00020000-55dc-6227-850e-43cfde96f0b6	00030000-55dc-6227-680d-3f838a274e58
00020000-55dc-6227-850e-43cfde96f0b6	00030000-55dc-6227-6c23-e3edd184cbcc
00020000-55dc-6227-850e-43cfde96f0b6	00030000-55dc-6227-f22f-1f0fedf658e6
00020000-55dc-6227-850e-43cfde96f0b6	00030000-55dc-6227-5475-313483b85665
00020000-55dc-6227-850e-43cfde96f0b6	00030000-55dc-6227-75d4-30f17b15f35d
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-30ef-05c135997e78
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-b0ef-3d11aba8d898
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-6c23-e3edd184cbcc
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-2e6c-2c791d1ec7cb
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-5cb1-8cf8a20a8068
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-0c14-2dfc8d67728e
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-cb79-159dace7faab
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-52f9-dc7d937674d0
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-b377-f4b69e0c48a5
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-c4ce-3ce8874b0bea
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-b2b2-d778471fe329
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-bf4d-ee8ef5bbbd55
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-a33b-8b4e5ab1b60d
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-eda9-038c01711515
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-1b62-1c3c42c98a92
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-c362-f204c3ddcee4
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-7aaa-1e0188eef424
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-03e9-2a380836faa4
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-1999-2ab55d8c0f74
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-5927-ad50e724d5db
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-b647-a8177deb3d31
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-17f5-47e64314302a
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-dd7a-d0b1a2400dc5
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-63f0-1d2c98090e7a
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-24d9-17ae67e4fb90
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-c95a-5d6362a6a8eb
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-9e25-389dbbe66c7d
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-b839-011da3a9b2db
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-6125-abb6d40da743
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-4bd1-e913d63e4be7
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-cc5e-c6f25a74b8f9
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-d9f2-9a787c96a702
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-25ef-ff9858f3111b
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-3879-14de8da9dfc2
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-8912-c6d9717cfe87
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-542f-09680318f436
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-0263-416e5c047422
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-1c03-9b6531c948fb
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-fb32-4eb7cb23b746
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-125d-e8ce6930459d
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-6508-80469867e2d8
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-752d-604f02d11ae0
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-7f5f-b77efc23d6dc
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-6586-baf01a9e14ee
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-6111-dae93e7dd545
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-0e71-02c772147193
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-e3ac-7f7a65c0749a
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-422f-e0150b94f9a2
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-73b4-c35f46d483e3
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-d293-e871f588dffc
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-b30b-2c9181361d5c
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-b8d2-e7e8046ada5b
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-26eb-175ea081aed6
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-013c-793e19bad51f
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-0880-f28eb544c63f
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-27fd-c1c57a574704
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-e597-fa4006d0c843
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-0653-6a01bcca00aa
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-2047-53231c832701
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-c92f-dff766a869ab
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-f454-20ffb6066ca0
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-fcd4-4ab8c76f6b98
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-2975-73ffe3c55469
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-2016-a71ba9631e32
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-f7f3-95e866652078
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-05b8-90ce4e9d9ebc
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-b6f6-bbeaf87c6fe2
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-e90f-96853ccd9d61
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-7583-7238daadff07
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-bfc2-4abc233ad9f5
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-1327-a2e22c3017e4
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-187b-1888141f1370
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-5de9-7524f47a1e88
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-1a4c-f08f6dfefc01
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-f284-b01e8ba1307d
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-1c6c-fca21567107f
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-63b1-33dc993f4e8e
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-69c0-58558f67bef5
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-6322-2770e971cd19
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-7839-d9da2039c52e
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-e32b-ee3b05be09d1
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-0ffa-a6385980b15c
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-20df-afbe1da24c31
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-87bf-9a9374b388cc
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-9827-4a44d723d737
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-1994-f228f3cac248
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-3abe-ae8e22f317b6
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-30d9-9f401a04da3a
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-919f-d7ed57451f7a
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-7723-8c97af6f4c37
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-f9f7-787b0c250cb1
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-69ab-2bb328ff6187
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-4fb8-fc6949047bf0
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-d9dd-2666db5e7207
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-0bd1-f274282acd87
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-baaf-1519e603b688
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-6e2e-0046909f06bd
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-e4bb-d37146a5ab7b
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-dd33-7c4a378b8354
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-0990-f91d815bd56a
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-70dc-23dd6ddeb67d
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-2570-89e94dc92dae
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-c530-17f6addfd5d5
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-0719-2bc7c4c32e08
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-f7b9-e54ca59296d5
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-38d5-52e1a3d65a41
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-1032-55868596e657
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-31c4-e2fb5e4bc534
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-65e5-9de4766578db
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-75f0-530de018ec94
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-f210-eeac83820ab4
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-f22c-524f2159b594
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-bb71-3822003383c5
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-dc46-9e977dd86099
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-680d-3f838a274e58
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-c392-58bf95d898c3
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-f22f-1f0fedf658e6
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-fa62-b9dc4c5d1957
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-70f4-6503841a6a30
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-9d47-44f5b2219571
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-78b0-be67b551fc6e
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-32ca-e3a4bd988903
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-0147-c94235c2d320
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-a28e-a25d9b5e4639
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-1384-9786581f9310
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-934c-0213ab2ac280
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-ec44-88bece26fa7c
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-05bc-8e25f9282f6c
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-edaf-85d5973803fb
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-a910-d2d4bfce8115
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-28ce-e7fb302820db
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-b4ef-1e8d4879d641
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-5475-313483b85665
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-11ab-8dd546342175
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-75d4-30f17b15f35d
00020000-55dc-6228-89d5-c46de3003a8d	00030000-55dc-6227-8432-ae81a134905e
\.


--
-- TOC entry 2922 (class 0 OID 15515366)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2926 (class 0 OID 15515397)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 15515511)
-- Dependencies: 218
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, vrednostdopremiere, aktivna, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-55dc-6228-68f7-3d1fec354139	00090000-55dc-6228-be47-03cf88774846	\N	\N	0001	\N	\N	f	10.00	3	10.00	30.00	10.00	t	t	f	t	Pogodba o sodelovanju
000b0000-55dc-6228-ca43-a2eb02b272d0	00090000-55dc-6228-018b-d520d087b7f2	\N	\N	0002	\N	\N	t	11.00	10	11.00	31.00	110.00	t	f	t	t	Pogodba za vlogo Helena
000b0000-55dc-6228-8e0b-dd08e5baf585	00090000-55dc-6228-9a32-1dbc75d31225	\N	\N	0003	\N	\N	f	12.00	4	12.00	32.00	12.00	t	f	t	f	Pogodba za lektoriranje
\.


--
-- TOC entry 2899 (class 0 OID 15515128)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-55dc-6228-9694-c9477bc138ab	00040000-55dc-6226-a187-896de7e7c8e2	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dc-6228-b606-2ca506963d19	00040000-55dc-6226-a187-896de7e7c8e2	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-55dc-6228-c50f-677deec80de5	00040000-55dc-6226-a187-896de7e7c8e2	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dc-6228-0a0c-94f543d47a1c	00040000-55dc-6226-a187-896de7e7c8e2	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dc-6228-a34f-1d405197b844	00040000-55dc-6226-a187-896de7e7c8e2	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dc-6228-e628-9ecdff10de10	00040000-55dc-6226-d346-c84060ec432c	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dc-6228-d89e-1f2fae498109	00040000-55dc-6226-5cd7-de8af3278544	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dc-6228-3fe3-6f27ae759962	00040000-55dc-6226-124f-97b86a360612	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-55dc-6229-4c94-048d15d0d4e2	00040000-55dc-6226-a187-896de7e7c8e2	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2901 (class 0 OID 15515162)
-- Dependencies: 183
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-55dc-6226-6917-249f7d66cd61	8341	Adlešiči
00050000-55dc-6226-32bc-66b870b85bbc	5270	Ajdovščina
00050000-55dc-6226-10a6-2a66432f30e1	6280	Ankaran/Ancarano
00050000-55dc-6226-bd20-fd8cb0d7dd6d	9253	Apače
00050000-55dc-6226-82a8-170c8155ebe8	8253	Artiče
00050000-55dc-6226-117c-bfebf17b774a	4275	Begunje na Gorenjskem
00050000-55dc-6226-6732-edb014e2d5cc	1382	Begunje pri Cerknici
00050000-55dc-6226-cc7a-542f5fa28166	9231	Beltinci
00050000-55dc-6226-2b11-83da851835c7	2234	Benedikt
00050000-55dc-6226-d55a-70653e52386d	2345	Bistrica ob Dravi
00050000-55dc-6226-8d07-3eb74aacaff0	3256	Bistrica ob Sotli
00050000-55dc-6226-5ff6-1555b576d309	8259	Bizeljsko
00050000-55dc-6226-1e74-a2895d19ba73	1223	Blagovica
00050000-55dc-6226-3b5c-8590b4a0d97a	8283	Blanca
00050000-55dc-6226-2de5-0dbb839437bb	4260	Bled
00050000-55dc-6226-eabd-78bf47d7ba8f	4273	Blejska Dobrava
00050000-55dc-6226-dab2-37d31cd49e13	9265	Bodonci
00050000-55dc-6226-4516-007bff1a9890	9222	Bogojina
00050000-55dc-6226-f88a-5d92498ec40a	4263	Bohinjska Bela
00050000-55dc-6226-a473-eeca9344d189	4264	Bohinjska Bistrica
00050000-55dc-6226-c335-d8e3104753c9	4265	Bohinjsko jezero
00050000-55dc-6226-4438-5b1a7b3e5db5	1353	Borovnica
00050000-55dc-6226-c4c2-9d60effa9d87	8294	Boštanj
00050000-55dc-6226-402e-4af4381a57a4	5230	Bovec
00050000-55dc-6226-289e-b2d41f61e950	5295	Branik
00050000-55dc-6226-cec6-5680d9488f8d	3314	Braslovče
00050000-55dc-6226-435e-ae45b55d6c8f	5223	Breginj
00050000-55dc-6226-fdbc-7bdee3d1e7d1	8280	Brestanica
00050000-55dc-6226-5702-b54ed3132d72	2354	Bresternica
00050000-55dc-6226-864b-0636e91fcacf	4243	Brezje
00050000-55dc-6226-6153-32f94da080e7	1351	Brezovica pri Ljubljani
00050000-55dc-6226-41d3-6a1064986d0f	8250	Brežice
00050000-55dc-6226-cc7a-af42163e0567	4210	Brnik - Aerodrom
00050000-55dc-6226-e27a-0a8851d10850	8321	Brusnice
00050000-55dc-6226-d980-032ba00b4dc5	3255	Buče
00050000-55dc-6226-ff74-4f43f349fa3a	8276	Bučka 
00050000-55dc-6226-a727-46f67232cf81	9261	Cankova
00050000-55dc-6226-8d47-67faa80c0680	3000	Celje 
00050000-55dc-6226-4e19-1a8aa6f7535d	3001	Celje - poštni predali
00050000-55dc-6226-4066-a566426cba1c	4207	Cerklje na Gorenjskem
00050000-55dc-6226-7318-a340e2f32401	8263	Cerklje ob Krki
00050000-55dc-6226-328f-8c1d5dece96c	1380	Cerknica
00050000-55dc-6226-fd5d-0c3082552502	5282	Cerkno
00050000-55dc-6226-ec4a-b994f171b950	2236	Cerkvenjak
00050000-55dc-6226-ff65-197701415830	2215	Ceršak
00050000-55dc-6226-b0c9-95bee0c70464	2326	Cirkovce
00050000-55dc-6226-39f7-fcbce3ec820a	2282	Cirkulane
00050000-55dc-6226-64a9-9beb29af7d73	5273	Col
00050000-55dc-6226-5e4f-96ac5470d084	8251	Čatež ob Savi
00050000-55dc-6226-bedb-4c59d6b67942	1413	Čemšenik
00050000-55dc-6226-4207-b40616d52705	5253	Čepovan
00050000-55dc-6226-eea1-36b52c9de3e8	9232	Črenšovci
00050000-55dc-6226-ba47-95cd516f56db	2393	Črna na Koroškem
00050000-55dc-6226-6a95-0423d17a6256	6275	Črni Kal
00050000-55dc-6226-cbe5-08215444ba7b	5274	Črni Vrh nad Idrijo
00050000-55dc-6226-5ac5-c6a2be5aab72	5262	Črniče
00050000-55dc-6226-baac-ea209fe2ffbf	8340	Črnomelj
00050000-55dc-6226-0a03-b828e7162bca	6271	Dekani
00050000-55dc-6226-bfcb-99b764b0c28e	5210	Deskle
00050000-55dc-6226-0669-bc658d972564	2253	Destrnik
00050000-55dc-6226-02c2-fe95dc8f28b9	6215	Divača
00050000-55dc-6226-1b42-d8f43b9f18b7	1233	Dob
00050000-55dc-6226-372c-da906401c9b0	3224	Dobje pri Planini
00050000-55dc-6226-713a-d70a40fbdf87	8257	Dobova
00050000-55dc-6226-9dcb-3fb9122fd7cf	1423	Dobovec
00050000-55dc-6226-3f34-aaa2c7fef84c	5263	Dobravlje
00050000-55dc-6226-608c-a63ca5e459e5	3204	Dobrna
00050000-55dc-6226-7161-c9461c43b4b3	8211	Dobrnič
00050000-55dc-6226-627a-d0156ca9c339	1356	Dobrova
00050000-55dc-6226-3901-2fe7b58cc0a9	9223	Dobrovnik/Dobronak 
00050000-55dc-6226-a836-5df808a616f3	5212	Dobrovo v Brdih
00050000-55dc-6226-e763-3f84b726c0c6	1431	Dol pri Hrastniku
00050000-55dc-6226-f700-ecf18e1cf748	1262	Dol pri Ljubljani
00050000-55dc-6226-1a13-5a2cf1802edf	1273	Dole pri Litiji
00050000-55dc-6226-3456-db79604f526d	1331	Dolenja vas
00050000-55dc-6226-7bb8-cac251fc8612	8350	Dolenjske Toplice
00050000-55dc-6226-5bec-fb82ccd1deb1	1230	Domžale
00050000-55dc-6226-d5d6-1b9ce05f436a	2252	Dornava
00050000-55dc-6226-4990-aaa0086bbad5	5294	Dornberk
00050000-55dc-6226-a0ac-8248eff7ae48	1319	Draga
00050000-55dc-6226-0792-02676bfaa77e	8343	Dragatuš
00050000-55dc-6226-0de0-6660f80442d0	3222	Dramlje
00050000-55dc-6226-09e1-3d0ddf2c5a2b	2370	Dravograd
00050000-55dc-6226-c750-dc577736e1f3	4203	Duplje
00050000-55dc-6226-e996-e1d56ab2254c	6221	Dutovlje
00050000-55dc-6226-4f2f-e41e265b98db	8361	Dvor
00050000-55dc-6226-e658-c679fb9e7935	2343	Fala
00050000-55dc-6226-9b4a-d5065945585b	9208	Fokovci
00050000-55dc-6226-acf4-bd8c60b7e7b0	2313	Fram
00050000-55dc-6226-8e81-97d0835b2ccf	3213	Frankolovo
00050000-55dc-6226-7a3f-adbc3b64fd3c	1274	Gabrovka
00050000-55dc-6226-dcc1-3c6cdd2114d9	8254	Globoko
00050000-55dc-6226-2b76-1f37fddb8ea6	5275	Godovič
00050000-55dc-6226-5a6d-de7a23df2cd3	4204	Golnik
00050000-55dc-6226-e7ed-ed58533fc357	3303	Gomilsko
00050000-55dc-6226-10ee-d1bf06a14314	4224	Gorenja vas
00050000-55dc-6226-062d-600eeee5a250	3263	Gorica pri Slivnici
00050000-55dc-6226-3b5b-154d9b16d52d	2272	Gorišnica
00050000-55dc-6226-3f35-89f56e340c66	9250	Gornja Radgona
00050000-55dc-6226-5b97-60cc1fd0b140	3342	Gornji Grad
00050000-55dc-6226-aaf8-1b97eb309843	4282	Gozd Martuljek
00050000-55dc-6226-e167-d9f2e7cccbad	6272	Gračišče
00050000-55dc-6226-cc12-263359b255ba	9264	Grad
00050000-55dc-6226-2e68-7166ea56c199	8332	Gradac
00050000-55dc-6226-c531-8bda605282b3	1384	Grahovo
00050000-55dc-6226-e12f-3938f5e3d8e5	5242	Grahovo ob Bači
00050000-55dc-6226-19b1-bf1d5694912b	5251	Grgar
00050000-55dc-6226-515d-ae3dd3747605	3302	Griže
00050000-55dc-6226-f177-cfefd30f812f	3231	Grobelno
00050000-55dc-6226-3cc4-5870d663e57a	1290	Grosuplje
00050000-55dc-6226-f21f-e6e1a1811d1f	2288	Hajdina
00050000-55dc-6226-f115-63843feb7254	8362	Hinje
00050000-55dc-6226-82e0-bdbb5f3320da	2311	Hoče
00050000-55dc-6226-5939-1627867b3746	9205	Hodoš/Hodos
00050000-55dc-6226-2d30-b54c08973c66	1354	Horjul
00050000-55dc-6226-148d-a2cadb6982cc	1372	Hotedršica
00050000-55dc-6226-16a4-651a633d02aa	1430	Hrastnik
00050000-55dc-6226-fdd4-98873d220060	6225	Hruševje
00050000-55dc-6226-5c2f-fc682084a262	4276	Hrušica
00050000-55dc-6226-5ae8-7b817ccf8293	5280	Idrija
00050000-55dc-6226-fd79-8446b45ad864	1292	Ig
00050000-55dc-6226-8f92-901f7bf116ad	6250	Ilirska Bistrica
00050000-55dc-6226-9fd1-7a2bd76fbead	6251	Ilirska Bistrica-Trnovo
00050000-55dc-6226-e970-fda246eac2cb	1295	Ivančna Gorica
00050000-55dc-6226-54bc-0a73f942794e	2259	Ivanjkovci
00050000-55dc-6226-d5e5-776b3c6d5a08	1411	Izlake
00050000-55dc-6226-c46b-c161aa32826a	6310	Izola/Isola
00050000-55dc-6226-11f1-39e4789c2613	2222	Jakobski Dol
00050000-55dc-6226-4921-3ae910f7ccf4	2221	Jarenina
00050000-55dc-6226-f325-6063aa978873	6254	Jelšane
00050000-55dc-6226-0b96-a94274a69a10	4270	Jesenice
00050000-55dc-6226-3ac3-4195ee864fb1	8261	Jesenice na Dolenjskem
00050000-55dc-6226-a630-245239e35744	3273	Jurklošter
00050000-55dc-6226-06ba-b8194f3a176c	2223	Jurovski Dol
00050000-55dc-6226-b84e-4cf38f1d5a5a	2256	Juršinci
00050000-55dc-6226-e05c-64d160c6fcc1	5214	Kal nad Kanalom
00050000-55dc-6226-9b0d-7d471ccfe718	3233	Kalobje
00050000-55dc-6226-0ed9-cfdb3888877f	4246	Kamna Gorica
00050000-55dc-6226-fd90-9ed671cfa56a	2351	Kamnica
00050000-55dc-6226-839b-deabe6bc5d52	1241	Kamnik
00050000-55dc-6226-b50f-bf05b50df840	5213	Kanal
00050000-55dc-6226-1a88-325fd26a28ab	8258	Kapele
00050000-55dc-6226-6e5e-832fb58c8251	2362	Kapla
00050000-55dc-6226-c5e8-44743acfcb2e	2325	Kidričevo
00050000-55dc-6226-7a03-7105ca768aef	1412	Kisovec
00050000-55dc-6226-42d5-f38193e333f4	6253	Knežak
00050000-55dc-6226-35cc-a8e1d7c928bb	5222	Kobarid
00050000-55dc-6226-e415-89c1ba9521db	9227	Kobilje
00050000-55dc-6226-f62c-bb84968d8d4b	1330	Kočevje
00050000-55dc-6226-7c7e-2821f10b7778	1338	Kočevska Reka
00050000-55dc-6226-468e-fd29566178f0	2276	Kog
00050000-55dc-6226-424c-a43a23246a47	5211	Kojsko
00050000-55dc-6226-459a-dd4348bfba99	6223	Komen
00050000-55dc-6226-ce71-692923a00332	1218	Komenda
00050000-55dc-6226-ec97-d3ce60075d63	6000	Koper/Capodistria 
00050000-55dc-6226-5844-4425e32fccde	6001	Koper/Capodistria - poštni predali
00050000-55dc-6226-33df-d26ca47b35fd	8282	Koprivnica
00050000-55dc-6226-be32-98112b33afce	5296	Kostanjevica na Krasu
00050000-55dc-6226-df7b-89bb0efd0f3c	8311	Kostanjevica na Krki
00050000-55dc-6226-f990-97b5c5477429	1336	Kostel
00050000-55dc-6226-2c94-66f5a6f057d8	6256	Košana
00050000-55dc-6226-2122-ada06183e959	2394	Kotlje
00050000-55dc-6226-c5da-3fc3789a70d3	6240	Kozina
00050000-55dc-6226-e609-057497f7d9f5	3260	Kozje
00050000-55dc-6226-d465-f1bc32f78979	4000	Kranj 
00050000-55dc-6226-bfb8-8a71dac9c0c8	4001	Kranj - poštni predali
00050000-55dc-6226-1391-1a7871079050	4280	Kranjska Gora
00050000-55dc-6226-3a8e-6a6bd30f527b	1281	Kresnice
00050000-55dc-6226-aea4-15eb01fa4626	4294	Križe
00050000-55dc-6226-8e0b-5d830d875672	9206	Križevci
00050000-55dc-6226-2768-61c262b1e002	9242	Križevci pri Ljutomeru
00050000-55dc-6226-57ae-9d40baa8ffb1	1301	Krka
00050000-55dc-6226-bc35-09bbe6be487d	8296	Krmelj
00050000-55dc-6226-fb5d-6d65692f7188	4245	Kropa
00050000-55dc-6226-cbb9-59d61b7a80eb	8262	Krška vas
00050000-55dc-6226-ea01-0bcb1dd4cdb5	8270	Krško
00050000-55dc-6226-8406-c684d5e1b169	9263	Kuzma
00050000-55dc-6226-b2e3-ba1d0d75537b	2318	Laporje
00050000-55dc-6226-bcf7-07c4a3dfaccd	3270	Laško
00050000-55dc-6226-9cb4-12e816d5f1b4	1219	Laze v Tuhinju
00050000-55dc-6226-7981-c0a40bc0e6f2	2230	Lenart v Slovenskih goricah
00050000-55dc-6226-772c-cd1a5219cb81	9220	Lendava/Lendva
00050000-55dc-6226-71b7-e95001ad5af2	4248	Lesce
00050000-55dc-6226-e0b1-01d6a622dc7c	3261	Lesično
00050000-55dc-6226-cafb-0cf5b591eef3	8273	Leskovec pri Krškem
00050000-55dc-6226-b156-5c57271df20b	2372	Libeliče
00050000-55dc-6226-dd5e-47a4341df943	2341	Limbuš
00050000-55dc-6226-4c73-014ec81d13bd	1270	Litija
00050000-55dc-6226-1723-4e6985ae5e26	3202	Ljubečna
00050000-55dc-6226-b8df-b35727983a66	1000	Ljubljana 
00050000-55dc-6226-de72-02b5aabce529	1001	Ljubljana - poštni predali
00050000-55dc-6226-e73a-c7f928b19e75	1231	Ljubljana - Črnuče
00050000-55dc-6226-f40b-0ccb27973e0e	1261	Ljubljana - Dobrunje
00050000-55dc-6226-631a-214ab3c44205	1260	Ljubljana - Polje
00050000-55dc-6226-d729-bbbb45e1ffa4	1210	Ljubljana - Šentvid
00050000-55dc-6226-3625-737449bbd343	1211	Ljubljana - Šmartno
00050000-55dc-6226-3692-e2a66863ce09	3333	Ljubno ob Savinji
00050000-55dc-6226-c2e9-b863e2c5e36c	9240	Ljutomer
00050000-55dc-6226-c1ce-d29fce3fcaee	3215	Loče
00050000-55dc-6226-e5e3-d795b8ec6d27	5231	Log pod Mangartom
00050000-55dc-6226-f332-14a4a713eb38	1358	Log pri Brezovici
00050000-55dc-6226-8c6b-dddc230d6ced	1370	Logatec
00050000-55dc-6226-5a18-efbe068cd875	1371	Logatec
00050000-55dc-6226-769a-0607ec2e78a1	1434	Loka pri Zidanem Mostu
00050000-55dc-6226-560b-6b2bc6fd0376	3223	Loka pri Žusmu
00050000-55dc-6226-c531-1444aeb7b8e6	6219	Lokev
00050000-55dc-6226-0f4e-9fe9f5b63012	1318	Loški Potok
00050000-55dc-6226-8ce0-dcafab40e4f2	2324	Lovrenc na Dravskem polju
00050000-55dc-6226-687d-4f716bf52c48	2344	Lovrenc na Pohorju
00050000-55dc-6226-5138-04b6896d5887	3334	Luče
00050000-55dc-6226-f9f3-13c87d52cf24	1225	Lukovica
00050000-55dc-6226-ba49-2a3673adbaa2	9202	Mačkovci
00050000-55dc-6226-06e6-34a8224263cb	2322	Majšperk
00050000-55dc-6226-0c40-56d02ee3e3d2	2321	Makole
00050000-55dc-6226-8886-394703860957	9243	Mala Nedelja
00050000-55dc-6226-e215-bbde7c22d8f7	2229	Malečnik
00050000-55dc-6226-97e7-c25bc882a4f2	6273	Marezige
00050000-55dc-6226-6843-7d188bca93e2	2000	Maribor 
00050000-55dc-6226-62d3-ff5a7900f52b	2001	Maribor - poštni predali
00050000-55dc-6226-80b4-fc3dcaec1123	2206	Marjeta na Dravskem polju
00050000-55dc-6226-1fc6-ee020baa9187	2281	Markovci
00050000-55dc-6226-8736-5d101374a017	9221	Martjanci
00050000-55dc-6226-8c30-723d93f37a78	6242	Materija
00050000-55dc-6226-275a-41e5929ad9ad	4211	Mavčiče
00050000-55dc-6226-fe54-3b2ab014a47d	1215	Medvode
00050000-55dc-6226-1af9-b21bd7549b1b	1234	Mengeš
00050000-55dc-6226-f447-197aa59f2e26	8330	Metlika
00050000-55dc-6226-9dc6-9c7b8b18d9b5	2392	Mežica
00050000-55dc-6226-7032-7c0dc0b83277	2204	Miklavž na Dravskem polju
00050000-55dc-6226-536c-f17bcd7dfc99	2275	Miklavž pri Ormožu
00050000-55dc-6226-c9de-7c29914eb6bc	5291	Miren
00050000-55dc-6226-f69b-10aefb7ad41d	8233	Mirna
00050000-55dc-6226-fac5-e3ca96c2588d	8216	Mirna Peč
00050000-55dc-6226-6b33-dc0c8d14e0df	2382	Mislinja
00050000-55dc-6226-b192-4de373a35f52	4281	Mojstrana
00050000-55dc-6226-1505-ae0b7439a5d0	8230	Mokronog
00050000-55dc-6226-f292-1f69a05d8cb5	1251	Moravče
00050000-55dc-6226-9054-b8fdfdec314e	9226	Moravske Toplice
00050000-55dc-6226-8584-31bf1dfb75c9	5216	Most na Soči
00050000-55dc-6226-891f-29ec303c222b	1221	Motnik
00050000-55dc-6226-5713-507cf5a86ea8	3330	Mozirje
00050000-55dc-6226-501f-826959bd877f	9000	Murska Sobota 
00050000-55dc-6226-1cbf-233562fb7144	9001	Murska Sobota - poštni predali
00050000-55dc-6226-fa77-c52ac9a35651	2366	Muta
00050000-55dc-6226-80d0-09ea51781094	4202	Naklo
00050000-55dc-6226-037e-0ee13ff81fc7	3331	Nazarje
00050000-55dc-6226-d652-356060f0221e	1357	Notranje Gorice
00050000-55dc-6226-5189-8f783eea3138	3203	Nova Cerkev
00050000-55dc-6226-bc09-f55a8c1fdadb	5000	Nova Gorica 
00050000-55dc-6226-4518-bc4b4ee022fd	5001	Nova Gorica - poštni predali
00050000-55dc-6226-a938-3cd02b8d8149	1385	Nova vas
00050000-55dc-6226-a436-dff798254173	8000	Novo mesto
00050000-55dc-6226-9637-f91f7ad93efa	8001	Novo mesto - poštni predali
00050000-55dc-6226-b5f2-f232293ef1f7	6243	Obrov
00050000-55dc-6226-170e-1482f5751c5e	9233	Odranci
00050000-55dc-6226-1a45-41cfc36acd01	2317	Oplotnica
00050000-55dc-6226-b66b-dc6c35fbf9ed	2312	Orehova vas
00050000-55dc-6226-07a5-ee27c3f93759	2270	Ormož
00050000-55dc-6226-3ffc-358d6d3683bd	1316	Ortnek
00050000-55dc-6226-8fab-b0eec6cabbc5	1337	Osilnica
00050000-55dc-6226-132c-a4dcd60f6eb9	8222	Otočec
00050000-55dc-6226-f0c8-4dec4d1026e1	2361	Ožbalt
00050000-55dc-6226-216f-8d73b4acf9a3	2231	Pernica
00050000-55dc-6226-242c-6101edba5486	2211	Pesnica pri Mariboru
00050000-55dc-6226-ea99-bb7c6a0f8917	9203	Petrovci
00050000-55dc-6226-8157-05717837d037	3301	Petrovče
00050000-55dc-6226-b2f2-d5d8fee4d59f	6330	Piran/Pirano
00050000-55dc-6226-261c-048dab1aad54	8255	Pišece
00050000-55dc-6226-7b66-1f20383ee3f2	6257	Pivka
00050000-55dc-6226-ffe0-b07f29c30f09	6232	Planina
00050000-55dc-6226-f22b-93c82eac03f8	3225	Planina pri Sevnici
00050000-55dc-6226-7d94-693eb050a584	6276	Pobegi
00050000-55dc-6226-d85f-79f8b14edff9	8312	Podbočje
00050000-55dc-6226-51c3-ff62e2d6ad17	5243	Podbrdo
00050000-55dc-6226-b6ee-0d329304e478	3254	Podčetrtek
00050000-55dc-6226-0e27-51a52ef8a005	2273	Podgorci
00050000-55dc-6226-8d12-a0985ccf8368	6216	Podgorje
00050000-55dc-6226-c1d7-e642edde1219	2381	Podgorje pri Slovenj Gradcu
00050000-55dc-6226-763a-ecb7d9a75aa1	6244	Podgrad
00050000-55dc-6226-c504-536858d7740b	1414	Podkum
00050000-55dc-6226-6b0a-ffcb3a524cdb	2286	Podlehnik
00050000-55dc-6226-e94b-40d9ae6398f9	5272	Podnanos
00050000-55dc-6226-e967-bc4db721a26a	4244	Podnart
00050000-55dc-6226-6f91-1a5365e52b53	3241	Podplat
00050000-55dc-6226-b50b-62702dfa152f	3257	Podsreda
00050000-55dc-6226-e1a6-33aa65cc95ef	2363	Podvelka
00050000-55dc-6226-391b-5c5224c9ad49	2208	Pohorje
00050000-55dc-6226-4132-bd8557aba880	2257	Polenšak
00050000-55dc-6226-c469-c016c6a6e209	1355	Polhov Gradec
00050000-55dc-6226-601b-156a4fca2561	4223	Poljane nad Škofjo Loko
00050000-55dc-6226-cdb9-ff116d866164	2319	Poljčane
00050000-55dc-6226-3a66-e4cc62fcfbfc	1272	Polšnik
00050000-55dc-6226-1344-9615afd3a7e1	3313	Polzela
00050000-55dc-6226-27b8-4f4880e9ec82	3232	Ponikva
00050000-55dc-6226-8504-ccdfb4e7f409	6320	Portorož/Portorose
00050000-55dc-6226-199e-ea7732a5fb41	6230	Postojna
00050000-55dc-6226-8d95-a9acd2d6dc58	2331	Pragersko
00050000-55dc-6226-2016-f0b517744580	3312	Prebold
00050000-55dc-6226-edab-de5fa64ce19a	4205	Preddvor
00050000-55dc-6226-caab-129e3c74c9f7	6255	Prem
00050000-55dc-6226-adb4-500c32e1a3fa	1352	Preserje
00050000-55dc-6226-b0cd-048095121029	6258	Prestranek
00050000-55dc-6226-9f32-fa970cd91493	2391	Prevalje
00050000-55dc-6226-b37c-9d97d2f0cc9b	3262	Prevorje
00050000-55dc-6226-4adc-e5e26a1e9944	1276	Primskovo 
00050000-55dc-6226-210e-8ef950dd0afa	3253	Pristava pri Mestinju
00050000-55dc-6226-6c7a-f76bbbc0aa7a	9207	Prosenjakovci/Partosfalva
00050000-55dc-6226-8655-483d63181316	5297	Prvačina
00050000-55dc-6226-af59-216364b2cdc8	2250	Ptuj
00050000-55dc-6226-9cdf-910884468432	2323	Ptujska Gora
00050000-55dc-6226-ce52-cf3174a7ed9b	9201	Puconci
00050000-55dc-6226-1485-f6ecb3d6fe58	2327	Rače
00050000-55dc-6226-18cd-377bc711806e	1433	Radeče
00050000-55dc-6226-270f-2a4bf354047c	9252	Radenci
00050000-55dc-6226-192b-91325cb4b152	2360	Radlje ob Dravi
00050000-55dc-6226-8e49-e3ffab735bf8	1235	Radomlje
00050000-55dc-6226-742c-97dedd8c886f	4240	Radovljica
00050000-55dc-6226-036e-0c7dece4cad5	8274	Raka
00050000-55dc-6226-57d4-22d9d7b041c6	1381	Rakek
00050000-55dc-6226-a7e5-51b115a000ba	4283	Rateče - Planica
00050000-55dc-6226-2551-2dd1433a0147	2390	Ravne na Koroškem
00050000-55dc-6226-bb53-6c53e4a4e43e	9246	Razkrižje
00050000-55dc-6226-dabf-8af5371ec615	3332	Rečica ob Savinji
00050000-55dc-6226-20ae-535eb9d344db	5292	Renče
00050000-55dc-6226-4523-3a32c81b01e3	1310	Ribnica
00050000-55dc-6226-1413-0a274dead70c	2364	Ribnica na Pohorju
00050000-55dc-6226-68d0-9cc403e789d9	3272	Rimske Toplice
00050000-55dc-6226-ccc4-995973be3bdb	1314	Rob
00050000-55dc-6226-fa3b-864a13bf912d	5215	Ročinj
00050000-55dc-6226-72c8-0d313f695881	3250	Rogaška Slatina
00050000-55dc-6226-6ee3-d0de60e645df	9262	Rogašovci
00050000-55dc-6226-8ee1-67a9a94ce409	3252	Rogatec
00050000-55dc-6226-bdc7-e2c7a415883f	1373	Rovte
00050000-55dc-6226-fa5b-689d3a8837ff	2342	Ruše
00050000-55dc-6226-1006-3ef4f92fecf6	1282	Sava
00050000-55dc-6226-272d-5bee6c0c80c8	6333	Sečovlje/Sicciole
00050000-55dc-6226-b90b-5a401371458f	4227	Selca
00050000-55dc-6226-d358-b013d2ac210e	2352	Selnica ob Dravi
00050000-55dc-6226-9fbe-1380e2f14d7d	8333	Semič
00050000-55dc-6226-4e1d-feca5cfcfec4	8281	Senovo
00050000-55dc-6226-67ba-4df975ded223	6224	Senožeče
00050000-55dc-6226-64de-90ecf36706e1	8290	Sevnica
00050000-55dc-6226-bb86-3151bef43b30	6210	Sežana
00050000-55dc-6226-dfcb-d395fcd4ec72	2214	Sladki Vrh
00050000-55dc-6226-d42e-f21022846c51	5283	Slap ob Idrijci
00050000-55dc-6226-5e93-abafc33ea641	2380	Slovenj Gradec
00050000-55dc-6226-0030-b9cda31c5fa1	2310	Slovenska Bistrica
00050000-55dc-6226-8fce-77875c9b18eb	3210	Slovenske Konjice
00050000-55dc-6226-c67c-67ac608dd106	1216	Smlednik
00050000-55dc-6226-dc5e-c1fafd0bfcc4	5232	Soča
00050000-55dc-6226-9997-d26ecfec7bcd	1317	Sodražica
00050000-55dc-6226-be8d-b826caedf58f	3335	Solčava
00050000-55dc-6226-89cc-06913538a2f1	5250	Solkan
00050000-55dc-6226-fb6a-341db873f313	4229	Sorica
00050000-55dc-6226-b043-3ad1a201e9a8	4225	Sovodenj
00050000-55dc-6226-ab82-54c6a09368ed	5281	Spodnja Idrija
00050000-55dc-6226-2a68-0e97f5b57261	2241	Spodnji Duplek
00050000-55dc-6226-c580-df6f2621d100	9245	Spodnji Ivanjci
00050000-55dc-6226-93cf-c1392fbcf3f5	2277	Središče ob Dravi
00050000-55dc-6226-a9a4-9bd067daebda	4267	Srednja vas v Bohinju
00050000-55dc-6226-7841-35b655bac486	8256	Sromlje 
00050000-55dc-6226-6f2c-8efa1e83cbb9	5224	Srpenica
00050000-55dc-6226-3520-3236fb10fd3b	1242	Stahovica
00050000-55dc-6226-59fe-772f22bfa3c0	1332	Stara Cerkev
00050000-55dc-6226-613a-a36b9c33a483	8342	Stari trg ob Kolpi
00050000-55dc-6226-1f01-2c72d75f77a2	1386	Stari trg pri Ložu
00050000-55dc-6226-6544-83f0f53a34d3	2205	Starše
00050000-55dc-6226-dd6a-b8117d8cb270	2289	Stoperce
00050000-55dc-6226-8dc3-1b898bea655a	8322	Stopiče
00050000-55dc-6226-a0fa-b36f34b879ed	3206	Stranice
00050000-55dc-6226-bd78-b65a8c17aabc	8351	Straža
00050000-55dc-6226-56d6-a72502a10aa1	1313	Struge
00050000-55dc-6226-1001-964c9ee59971	8293	Studenec
00050000-55dc-6226-f982-fb444f49f88a	8331	Suhor
00050000-55dc-6226-c9c9-72ac53d9ae63	2233	Sv. Ana v Slovenskih goricah
00050000-55dc-6226-b3ec-f064d189673d	2235	Sv. Trojica v Slovenskih goricah
00050000-55dc-6226-5064-4a85e3f1d39a	2353	Sveti Duh na Ostrem Vrhu
00050000-55dc-6226-1283-46f8745c77be	9244	Sveti Jurij ob Ščavnici
00050000-55dc-6226-a8d6-c72d35e27da3	3264	Sveti Štefan
00050000-55dc-6226-c7a1-15288f3ebc83	2258	Sveti Tomaž
00050000-55dc-6226-99be-1f2576a1bbc1	9204	Šalovci
00050000-55dc-6226-cb8f-146d43eefac7	5261	Šempas
00050000-55dc-6226-a1c5-a90a112d1629	5290	Šempeter pri Gorici
00050000-55dc-6226-a2a0-7b27b514145c	3311	Šempeter v Savinjski dolini
00050000-55dc-6226-f7fc-cdf6912a7bdc	4208	Šenčur
00050000-55dc-6226-31cf-890374518041	2212	Šentilj v Slovenskih goricah
00050000-55dc-6226-355a-3b595172361a	8297	Šentjanž
00050000-55dc-6226-ce86-62e7fa135e4e	2373	Šentjanž pri Dravogradu
00050000-55dc-6226-cd17-e2938f2759b9	8310	Šentjernej
00050000-55dc-6226-4829-828b9851d16c	3230	Šentjur
00050000-55dc-6226-a27b-41db5105899f	3271	Šentrupert
00050000-55dc-6226-9d29-e5037e63402f	8232	Šentrupert
00050000-55dc-6226-a166-6c32a3c260d9	1296	Šentvid pri Stični
00050000-55dc-6226-898b-db198356b425	8275	Škocjan
00050000-55dc-6226-bd1e-91c6c922e432	6281	Škofije
00050000-55dc-6226-6bf3-0736e32f3f73	4220	Škofja Loka
00050000-55dc-6226-8e8b-05123d3a80f1	3211	Škofja vas
00050000-55dc-6226-8de6-bf713f467c6e	1291	Škofljica
00050000-55dc-6226-1e24-6fe07647283f	6274	Šmarje
00050000-55dc-6226-56e4-aa506a20c731	1293	Šmarje - Sap
00050000-55dc-6226-77b4-b1c34de0613d	3240	Šmarje pri Jelšah
00050000-55dc-6226-5581-f93469c22707	8220	Šmarješke Toplice
00050000-55dc-6226-e276-4fe1f6197074	2315	Šmartno na Pohorju
00050000-55dc-6226-a7b6-99b263fd104f	3341	Šmartno ob Dreti
00050000-55dc-6226-d5ac-e853bbc3dcbe	3327	Šmartno ob Paki
00050000-55dc-6226-96a8-79c17e6a82e6	1275	Šmartno pri Litiji
00050000-55dc-6226-1782-df93d69bc9ea	2383	Šmartno pri Slovenj Gradcu
00050000-55dc-6226-2aff-5887ea9f4318	3201	Šmartno v Rožni dolini
00050000-55dc-6226-9866-0230a6709d14	3325	Šoštanj
00050000-55dc-6226-b2ae-8a6d1b47880a	6222	Štanjel
00050000-55dc-6226-4a17-b301d8efc7ab	3220	Štore
00050000-55dc-6226-f29c-8ac2beb41f32	3304	Tabor
00050000-55dc-6226-a49e-62baaf302619	3221	Teharje
00050000-55dc-6226-99a7-a875de332b08	9251	Tišina
00050000-55dc-6226-0831-1dec7d8d1d80	5220	Tolmin
00050000-55dc-6226-7703-168397afe3af	3326	Topolšica
00050000-55dc-6226-b279-3b2cec168494	2371	Trbonje
00050000-55dc-6226-8b5d-15a67223e372	1420	Trbovlje
00050000-55dc-6226-bcb3-d8a0b9bb05b7	8231	Trebelno 
00050000-55dc-6226-85fb-a779b7be3a35	8210	Trebnje
00050000-55dc-6226-5116-ea51a7c91b14	5252	Trnovo pri Gorici
00050000-55dc-6226-2da6-2a3fd51ce962	2254	Trnovska vas
00050000-55dc-6226-91a2-4fcb9baac0f0	1222	Trojane
00050000-55dc-6226-4779-f3af452fcbea	1236	Trzin
00050000-55dc-6226-1489-37b1b46959de	4290	Tržič
00050000-55dc-6226-7635-cd825d554546	8295	Tržišče
00050000-55dc-6226-c1f6-2cef8485d7aa	1311	Turjak
00050000-55dc-6226-96b8-82bb44d23fba	9224	Turnišče
00050000-55dc-6226-abe4-788ad81dcbe3	8323	Uršna sela
00050000-55dc-6226-4a08-16ee7fb640ea	1252	Vače
00050000-55dc-6226-5f30-69fa48b4a3f0	3320	Velenje 
00050000-55dc-6226-6bbe-a083a3ee882c	3322	Velenje - poštni predali
00050000-55dc-6226-ee1a-64e5b588e37a	8212	Velika Loka
00050000-55dc-6226-317c-265697d5eee2	2274	Velika Nedelja
00050000-55dc-6226-859c-95730f6533fa	9225	Velika Polana
00050000-55dc-6226-106b-30f98876f32e	1315	Velike Lašče
00050000-55dc-6226-ed9b-4680e6a94dd4	8213	Veliki Gaber
00050000-55dc-6226-5698-9a608fbd2163	9241	Veržej
00050000-55dc-6226-78e8-d047d983acb1	1312	Videm - Dobrepolje
00050000-55dc-6226-0bdb-26f7fd7d1b78	2284	Videm pri Ptuju
00050000-55dc-6226-254f-2d3f63ee5f8f	8344	Vinica
00050000-55dc-6226-350e-afbc7c1e1e81	5271	Vipava
00050000-55dc-6226-9562-afb37baee725	4212	Visoko
00050000-55dc-6226-9082-2c8ad932be18	1294	Višnja Gora
00050000-55dc-6226-219e-2c6adb4944d8	3205	Vitanje
00050000-55dc-6226-f5b9-978bc24cda30	2255	Vitomarci
00050000-55dc-6226-9f82-1dd2b4f214d2	1217	Vodice
00050000-55dc-6226-4145-c1e5330d9a44	3212	Vojnik\t
00050000-55dc-6226-249d-ca4ec1e00be8	5293	Volčja Draga
00050000-55dc-6226-66c7-5d346b7a5515	2232	Voličina
00050000-55dc-6226-a8f7-31112772aa41	3305	Vransko
00050000-55dc-6226-6f8a-3360d8ed9211	6217	Vremski Britof
00050000-55dc-6226-e899-50bffd73d95a	1360	Vrhnika
00050000-55dc-6226-6c1d-1465cc5fb621	2365	Vuhred
00050000-55dc-6226-7f30-eef043f3eafa	2367	Vuzenica
00050000-55dc-6226-c11f-9786dfb37622	8292	Zabukovje 
00050000-55dc-6226-891b-8c1d975e5c13	1410	Zagorje ob Savi
00050000-55dc-6226-4a92-c9856399f854	1303	Zagradec
00050000-55dc-6226-6d38-bc4341daf0f4	2283	Zavrč
00050000-55dc-6226-4242-ee2332859229	8272	Zdole 
00050000-55dc-6226-ed0f-c8c020875e20	4201	Zgornja Besnica
00050000-55dc-6226-5458-ff1fba608da3	2242	Zgornja Korena
00050000-55dc-6226-fdfe-3e40c56cdc11	2201	Zgornja Kungota
00050000-55dc-6226-cdf1-2ab26f7edc9d	2316	Zgornja Ložnica
00050000-55dc-6226-3fec-fa343ecc1d54	2314	Zgornja Polskava
00050000-55dc-6226-dcf0-987202c097f0	2213	Zgornja Velka
00050000-55dc-6226-a648-4536feaa94db	4247	Zgornje Gorje
00050000-55dc-6226-a37f-b7beda669ff9	4206	Zgornje Jezersko
00050000-55dc-6226-aec9-3bf903e2e899	2285	Zgornji Leskovec
00050000-55dc-6226-f6ef-88521aed5664	1432	Zidani Most
00050000-55dc-6226-cbee-8d5292d58714	3214	Zreče
00050000-55dc-6226-adb3-38a774b24e93	4209	Žabnica
00050000-55dc-6226-0f8d-05d1db300099	3310	Žalec
00050000-55dc-6226-89bf-cd4ae379c060	4228	Železniki
00050000-55dc-6226-b85d-3e428dd51a9d	2287	Žetale
00050000-55dc-6226-443d-41a7cd935973	4226	Žiri
00050000-55dc-6226-41d0-574b54b66041	4274	Žirovnica
00050000-55dc-6226-d21b-7eb46793d76c	8360	Žužemberk
\.


--
-- TOC entry 2918 (class 0 OID 15515340)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 15515147)
-- Dependencies: 182
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 15515225)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 15515352)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2943 (class 0 OID 15515689)
-- Dependencies: 225
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2944 (class 0 OID 15515699)
-- Dependencies: 226
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-55dc-6228-0bc7-d8f6b8367bda	00080000-55dc-6228-c50f-677deec80de5	0987	AK
00190000-55dc-6228-fed6-7a6a8ce91ea4	00080000-55dc-6228-b606-2ca506963d19	0989	AK
00190000-55dc-6228-01b2-ba83b474f467	00080000-55dc-6228-0a0c-94f543d47a1c	0986	AK
00190000-55dc-6228-618a-3337faf4325e	00080000-55dc-6228-e628-9ecdff10de10	0984	AK
00190000-55dc-6228-48e1-e10df675b90b	00080000-55dc-6228-d89e-1f2fae498109	0983	AK
00190000-55dc-6228-6939-d51289aac79a	00080000-55dc-6228-3fe3-6f27ae759962	0982	AK
00190000-55dc-6229-2669-3b7089d07f8a	00080000-55dc-6229-4c94-048d15d0d4e2	1001	AK
\.


--
-- TOC entry 2942 (class 0 OID 15515645)
-- Dependencies: 224
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-55dc-6228-c44d-8e23fd387dbe	\N	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2945 (class 0 OID 15515707)
-- Dependencies: 227
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 2924 (class 0 OID 15515381)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-55dc-6228-8c2b-60b26e866a44	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-55dc-6228-7a9a-5c2502f0d5be	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-55dc-6228-4d71-4421e60ebc67	0003	Kazinska	t	84	Kazinska dvorana
00220000-55dc-6228-664d-28ef299df0ce	0004	Mali oder	t	24	Mali oder 
00220000-55dc-6228-2f5e-4a80e474f53f	0005	Komorni oder	t	15	Komorni oder
00220000-55dc-6228-9251-42c874d6b41d	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-55dc-6228-e8b2-eff4a8e2565c	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2916 (class 0 OID 15515325)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2915 (class 0 OID 15515315)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 15515500)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 15515449)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 15515020)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-55dc-6229-4c94-048d15d0d4e2	00010000-55dc-6227-c095-dacb53d031e6	2015-08-25 14:40:09	INS	a:0:{}
2	App\\Entity\\Option	00000000-55dc-6229-3902-dca4f9672a2e	00010000-55dc-6227-c095-dacb53d031e6	2015-08-25 14:40:09	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-55dc-6229-2669-3b7089d07f8a	00010000-55dc-6227-c095-dacb53d031e6	2015-08-25 14:40:09	INS	a:0:{}
\.


--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 2925 (class 0 OID 15515391)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 15515058)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-55dc-6227-a97f-8d89f2965834	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-55dc-6227-aeee-06ed3a1621fa	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-55dc-6227-ee8c-1d50ce7fce06	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-55dc-6227-784d-bc898fa04aaf	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-55dc-6227-632a-e984452a9cc0	planer	Planer dogodkov v koledarju	t
00020000-55dc-6227-bcc7-ecf125a9e86c	kadrovska	Kadrovska služba	t
00020000-55dc-6227-e8ef-3919c6407ff3	arhivar	Ažuriranje arhivalij	t
00020000-55dc-6227-6d04-69ca87b950de	igralec	Igralec	t
00020000-55dc-6227-850e-43cfde96f0b6	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-55dc-6228-89d5-c46de3003a8d	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2891 (class 0 OID 15515042)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-55dc-6227-7e4e-7095fd972ae2	00020000-55dc-6227-ee8c-1d50ce7fce06
00010000-55dc-6227-c095-dacb53d031e6	00020000-55dc-6227-ee8c-1d50ce7fce06
00010000-55dc-6228-2077-9176ed22be42	00020000-55dc-6228-89d5-c46de3003a8d
\.


--
-- TOC entry 2927 (class 0 OID 15515405)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2919 (class 0 OID 15515346)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2913 (class 0 OID 15515292)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 15515748)
-- Dependencies: 232
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-55dc-6226-a8f7-895b91fe30d3	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-55dc-6226-d390-da40627ee6c6	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-55dc-6226-4f36-cf43ebe1070f	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-55dc-6226-151d-beec886fe93f	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-55dc-6226-a3ce-cf24448fd2e7	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2949 (class 0 OID 15515740)
-- Dependencies: 231
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-55dc-6226-687e-741059532699	00230000-55dc-6226-151d-beec886fe93f	popa
00240000-55dc-6226-636c-5cac437e3d33	00230000-55dc-6226-151d-beec886fe93f	oseba
00240000-55dc-6226-522f-d623d7033d8d	00230000-55dc-6226-151d-beec886fe93f	sezona
00240000-55dc-6226-91ef-ee6d836a68e7	00230000-55dc-6226-d390-da40627ee6c6	prostor
00240000-55dc-6226-308f-62c7ff638abf	00230000-55dc-6226-151d-beec886fe93f	besedilo
00240000-55dc-6226-d7a6-63e6a4c18ccb	00230000-55dc-6226-151d-beec886fe93f	uprizoritev
00240000-55dc-6226-350f-486150f6f39c	00230000-55dc-6226-151d-beec886fe93f	funkcija
00240000-55dc-6226-aa81-e4da7a243c99	00230000-55dc-6226-151d-beec886fe93f	tipfunkcije
00240000-55dc-6226-c4c7-ac2a1047f09e	00230000-55dc-6226-151d-beec886fe93f	alternacija
00240000-55dc-6226-1b61-4753397f67d6	00230000-55dc-6226-a8f7-895b91fe30d3	pogodba
00240000-55dc-6226-786e-c9f560ffdbce	00230000-55dc-6226-151d-beec886fe93f	zaposlitev
00240000-55dc-6226-64e5-c04a8dfbd048	00230000-55dc-6226-a8f7-895b91fe30d3	programdela
00240000-55dc-6226-f4fa-b3c036822861	00230000-55dc-6226-151d-beec886fe93f	zapis
\.


--
-- TOC entry 2948 (class 0 OID 15515735)
-- Dependencies: 230
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
55ab6e25-a5f8-4ee2-8c37-5313ad4f344a	00230000-55dc-6226-151d-beec886fe93f	0	1001
\.


--
-- TOC entry 2932 (class 0 OID 15515459)
-- Dependencies: 214
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-55dc-6228-2d2f-37f88be68bd5	000e0000-55dc-6228-f6ba-85034de8d8f7	00080000-55dc-6228-9694-c9477bc138ab	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-55dc-6228-1c3a-73cf412faec2	000e0000-55dc-6228-f6ba-85034de8d8f7	00080000-55dc-6228-9694-c9477bc138ab	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-55dc-6228-ca28-e7761d2c2140	000e0000-55dc-6228-f6ba-85034de8d8f7	00080000-55dc-6228-a34f-1d405197b844	Avtorske pravice	300.00	30.00	Odkup avtorskih pravic	avtorprav	4
\.


--
-- TOC entry 2898 (class 0 OID 15515120)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2914 (class 0 OID 15515302)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-55dc-6228-6ad1-847f4e025397	00180000-55dc-6228-92a9-01d576401003	000c0000-55dc-6228-64c1-0e85810285f4	00090000-55dc-6228-7fd3-3fb8d9149657	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dc-6228-a989-7fa19dfa705a	00180000-55dc-6228-92a9-01d576401003	000c0000-55dc-6228-13c5-9c3eeddb9af1	00090000-55dc-6228-413e-0fc763965f85	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dc-6228-6fb6-cad51e7170c3	00180000-55dc-6228-92a9-01d576401003	000c0000-55dc-6228-466d-a3c82f49259b	00090000-55dc-6228-1845-3128da1819a9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dc-6228-2e89-6ec6b1374158	00180000-55dc-6228-92a9-01d576401003	000c0000-55dc-6228-4ff3-700ac93c0796	00090000-55dc-6228-0ff7-56490cdfc5d4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dc-6228-ed84-5a066c4b3467	00180000-55dc-6228-92a9-01d576401003	000c0000-55dc-6228-5238-c35ff5c9af6e	00090000-55dc-6228-62f3-eb4f084ca254	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-55dc-6228-ce44-e8d441399bc2	00180000-55dc-6228-7aa9-0df87c0ee267	\N	00090000-55dc-6228-62f3-eb4f084ca254	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 2934 (class 0 OID 15515489)
-- Dependencies: 216
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-55dc-6226-4433-5b4a7bb7767b	Avtor	Avtorji	Avtorka	umetnik
000f0000-55dc-6226-2dc1-50df14536ba7	Priredba	Priredba	Priredba	umetnik
000f0000-55dc-6226-a643-27e5c2f579bc	Prevod	Prevod	Prevod	umetnik
000f0000-55dc-6226-ecc2-f9e39281421a	Režija	Režija	Režija	umetnik
000f0000-55dc-6226-6679-ac5ede038bb1	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-55dc-6226-8fe3-603e87aba35a	Scenografija	Scenografija	Scenografija	umetnik
000f0000-55dc-6226-7888-c12b20a3ac83	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-55dc-6226-397f-6a2358db0387	Koreografija	Koreografija	Koreografija	umetnik
000f0000-55dc-6226-9e8c-e7a427078d68	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-55dc-6226-3054-7f4e2855f216	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-55dc-6226-8a71-18b582201e23	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-55dc-6226-d5e1-6ab420cbadcf	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-55dc-6226-1a63-454fc0d72da4	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-55dc-6226-8c98-94fcff79520b	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-55dc-6226-457a-02f306144530	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-55dc-6226-0647-5b0baedbf9f3	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-55dc-6226-e24e-6ffd01eb29ec	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-55dc-6226-f1df-ddefaf92a787	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 2946 (class 0 OID 15515717)
-- Dependencies: 228
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-55dc-6226-6a38-322c8ababfcf	01	Velika predstava	f	1.00	1.00
002b0000-55dc-6226-3d82-5603af27f544	02	Mala predstava	f	0.50	0.50
002b0000-55dc-6226-4645-768ea4379728	03	Mala koprodukcija	t	0.40	1.00
002b0000-55dc-6226-caf6-11b2869e9080	04	Srednja koprodukcija	t	0.70	2.00
002b0000-55dc-6226-7f90-abebdb98122f	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2903 (class 0 OID 15515182)
-- Dependencies: 185
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 15515029)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-55dc-6227-c095-dacb53d031e6	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROyLdRVh4pizZqVbaCu0rV6GIj4Rlk1D6	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-55dc-6228-eef4-357be44d87ab	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-55dc-6228-ad1b-2552c645e0c4	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-55dc-6228-9877-143b071e45f2	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-55dc-6228-a746-ca48f988cc1d	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-55dc-6228-d61c-7c553e525248	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-55dc-6228-3d34-05819bd7da8b	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-55dc-6228-87c2-3c0e419e15e8	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-55dc-6228-aa2f-3bde8a764d07	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-55dc-6228-38c5-62f5193a8203	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-55dc-6228-2077-9176ed22be42	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-55dc-6227-7e4e-7095fd972ae2	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2938 (class 0 OID 15515537)
-- Dependencies: 220
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-55dc-6228-0a80-91a83633f032	00160000-55dc-6227-a3b5-1717759932dc	00150000-55dc-6226-f692-9bd5316cb6c0	00140000-55dc-6226-a60b-3c45bfd5724a	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-55dc-6228-2f5e-4a80e474f53f
000e0000-55dc-6228-f6ba-85034de8d8f7	00160000-55dc-6228-571f-c0bfc12cc326	00150000-55dc-6226-2772-8995123d971d	00140000-55dc-6226-fc11-ae747ac307f4	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2016-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-55dc-6228-9251-42c874d6b41d
000e0000-55dc-6228-196e-a57260712fcb	\N	00150000-55dc-6226-2772-8995123d971d	00140000-55dc-6226-fc11-ae747ac307f4	00190000-55dc-6228-0bc7-d8f6b8367bda	0003	postprodukcija	Kisli maček			\N	2016-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-55dc-6228-2f5e-4a80e474f53f
000e0000-55dc-6228-0b97-b61b1a21502d	\N	00150000-55dc-6226-2772-8995123d971d	00140000-55dc-6226-fc11-ae747ac307f4	00190000-55dc-6228-0bc7-d8f6b8367bda	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2017-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-55dc-6228-2f5e-4a80e474f53f
000e0000-55dc-6228-e25b-8f5c325cc8d1	\N	00150000-55dc-6226-2772-8995123d971d	00140000-55dc-6226-fc11-ae747ac307f4	00190000-55dc-6228-0bc7-d8f6b8367bda	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2017-05-20	1	Nina Kokelj	f	1				\N	f		00220000-55dc-6228-8c2b-60b26e866a44
000e0000-55dc-6228-c19e-c4673ee6b218	\N	00150000-55dc-6226-2772-8995123d971d	00140000-55dc-6226-fc11-ae747ac307f4	00190000-55dc-6228-0bc7-d8f6b8367bda	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	1	Nandi Frafar	f	1				\N	f		00220000-55dc-6228-8c2b-60b26e866a44
\.


--
-- TOC entry 2908 (class 0 OID 15515244)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-55dc-6228-d438-fb3288eedb2f	000e0000-55dc-6228-f6ba-85034de8d8f7	1	
00200000-55dc-6228-4f03-8cd29ec17346	000e0000-55dc-6228-f6ba-85034de8d8f7	2	
\.


--
-- TOC entry 2923 (class 0 OID 15515373)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 15515787)
-- Dependencies: 234
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 15515759)
-- Dependencies: 233
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 15515799)
-- Dependencies: 235
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 15515442)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-55dc-6228-cdae-8ac03cf6bf3f	00090000-55dc-6228-413e-0fc763965f85	01	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dc-6228-e8ea-ec2c551d3e58	00090000-55dc-6228-1845-3128da1819a9	02	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dc-6228-8e44-0386b4c5d1a3	00090000-55dc-6228-f4ff-05e4b2b2a937	03	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dc-6228-369a-8f5d93100a73	00090000-55dc-6228-6b5c-eda32771e84f	04	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dc-6228-5c9f-36ccc7fe9028	00090000-55dc-6228-7fd3-3fb8d9149657	05	A	2010-02-01	2010-02-01	1	2		t	f	f	t
00100000-55dc-6228-0776-baedb7a4e4b4	00090000-55dc-6228-82df-fac8cbe5f416	06	A	2010-02-01	2010-02-01	1	2		t	f	f	t
\.


--
-- TOC entry 2910 (class 0 OID 15515276)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2937 (class 0 OID 15515527)
-- Dependencies: 219
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-55dc-6226-a60b-3c45bfd5724a	01	Drama	drama (SURS 01)
00140000-55dc-6226-5f15-7d803cc46631	02	Opera	opera (SURS 02)
00140000-55dc-6226-1379-32f237d63692	03	Balet	balet (SURS 03)
00140000-55dc-6226-156a-43b128dd8bd7	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-55dc-6226-ed05-24d5cf4a1a12	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-55dc-6226-fc11-ae747ac307f4	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-55dc-6226-47cd-ebc1b4b93ecb	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2929 (class 0 OID 15515432)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-55dc-6226-b25b-9e78f9d04ccc	01	Opera	opera
00150000-55dc-6226-1e26-b182ff800c21	02	Opereta	opereta
00150000-55dc-6226-b2df-d09c08a47f34	03	Balet	balet
00150000-55dc-6226-c43b-4fef64a47a1c	04	Plesne prireditve	plesne prireditve
00150000-55dc-6226-a4aa-9e7d4210bf34	05	Lutkovno gledališče	lutkovno gledališče
00150000-55dc-6226-60e8-993b4f0ffac5	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-55dc-6226-0eab-b74a1d146ce1	07	Biografska drama	biografska drama
00150000-55dc-6226-f692-9bd5316cb6c0	08	Komedija	komedija
00150000-55dc-6226-a901-c0acedf3e2d4	09	Črna komedija	črna komedija
00150000-55dc-6226-7f47-aee75be39f13	10	E-igra	E-igra
00150000-55dc-6226-2772-8995123d971d	11	Kriminalka	kriminalka
00150000-55dc-6226-b04e-725bdbc6c05a	12	Musical	musical
\.


--
-- TOC entry 2440 (class 2606 OID 15515083)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 15515584)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 15515574)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 15515488)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2676 (class 2606 OID 15515839)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 15515266)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 15515291)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 15515733)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 15515208)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 15515639)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 15515428)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 15515242)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 15515285)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 15515222)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 15515338)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 15515816)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 15515823)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2681 (class 2606 OID 15515847)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 15515365)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 15515180)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2444 (class 2606 OID 15515092)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2447 (class 2606 OID 15515116)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 15515072)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2431 (class 2606 OID 15515057)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 15515371)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 15515404)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 15515522)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 15515144)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 15515168)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 15515344)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 15515158)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 15515229)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 15515356)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 15515696)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 15515704)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 15515687)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 15515715)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 15515388)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 15515329)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 15515320)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 15515510)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 15515456)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 15515028)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 15515395)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 15515046)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2433 (class 2606 OID 15515066)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 15515413)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 15515351)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 15515300)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 15515757)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 15515745)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 15515739)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 15515469)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2453 (class 2606 OID 15515125)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 15515311)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 15515499)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 15515727)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 15515193)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 15515041)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 15515553)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 15515251)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 15515379)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 15515797)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 15515781)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 15515805)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 15515447)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 15515280)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 15515535)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 15515440)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 1259 OID 15515273)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2581 (class 1259 OID 15515470)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2582 (class 1259 OID 15515471)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2667 (class 1259 OID 15515818)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2668 (class 1259 OID 15515817)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2454 (class 1259 OID 15515146)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2546 (class 1259 OID 15515372)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2654 (class 1259 OID 15515785)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2655 (class 1259 OID 15515784)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2656 (class 1259 OID 15515786)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2657 (class 1259 OID 15515783)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2658 (class 1259 OID 15515782)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2540 (class 1259 OID 15515358)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2541 (class 1259 OID 15515357)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2491 (class 1259 OID 15515252)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2568 (class 1259 OID 15515429)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 15515431)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2570 (class 1259 OID 15515430)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2479 (class 1259 OID 15515224)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2480 (class 1259 OID 15515223)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2637 (class 1259 OID 15515716)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2591 (class 1259 OID 15515524)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2592 (class 1259 OID 15515525)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 15515526)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2664 (class 1259 OID 15515806)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2600 (class 1259 OID 15515558)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2601 (class 1259 OID 15515555)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2602 (class 1259 OID 15515559)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2603 (class 1259 OID 15515557)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2604 (class 1259 OID 15515556)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2469 (class 1259 OID 15515195)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2470 (class 1259 OID 15515194)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2445 (class 1259 OID 15515119)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2556 (class 1259 OID 15515396)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2509 (class 1259 OID 15515286)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2435 (class 1259 OID 15515073)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2436 (class 1259 OID 15515074)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2561 (class 1259 OID 15515416)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2562 (class 1259 OID 15515415)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2563 (class 1259 OID 15515414)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2483 (class 1259 OID 15515230)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2484 (class 1259 OID 15515232)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2485 (class 1259 OID 15515231)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2647 (class 1259 OID 15515747)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2520 (class 1259 OID 15515324)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2521 (class 1259 OID 15515322)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2522 (class 1259 OID 15515321)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2523 (class 1259 OID 15515323)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2426 (class 1259 OID 15515047)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2427 (class 1259 OID 15515048)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2549 (class 1259 OID 15515380)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2677 (class 1259 OID 15515840)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2678 (class 1259 OID 15515848)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2679 (class 1259 OID 15515849)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2535 (class 1259 OID 15515345)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2577 (class 1259 OID 15515457)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2578 (class 1259 OID 15515458)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2621 (class 1259 OID 15515644)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2622 (class 1259 OID 15515643)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2623 (class 1259 OID 15515640)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2624 (class 1259 OID 15515641)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2625 (class 1259 OID 15515642)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2458 (class 1259 OID 15515160)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2459 (class 1259 OID 15515159)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2460 (class 1259 OID 15515161)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2629 (class 1259 OID 15515697)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2630 (class 1259 OID 15515698)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2614 (class 1259 OID 15515588)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2615 (class 1259 OID 15515589)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2616 (class 1259 OID 15515586)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2617 (class 1259 OID 15515587)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2574 (class 1259 OID 15515448)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 15515333)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2527 (class 1259 OID 15515332)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2528 (class 1259 OID 15515330)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2529 (class 1259 OID 15515331)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2610 (class 1259 OID 15515576)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2611 (class 1259 OID 15515575)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2626 (class 1259 OID 15515688)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2490 (class 1259 OID 15515243)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2644 (class 1259 OID 15515734)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2671 (class 1259 OID 15515824)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2672 (class 1259 OID 15515825)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2441 (class 1259 OID 15515094)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2442 (class 1259 OID 15515093)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2450 (class 1259 OID 15515126)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2451 (class 1259 OID 15515127)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2515 (class 1259 OID 15515314)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 15515313)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2517 (class 1259 OID 15515312)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2497 (class 1259 OID 15515275)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2498 (class 1259 OID 15515271)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2499 (class 1259 OID 15515268)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2500 (class 1259 OID 15515269)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2501 (class 1259 OID 15515267)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2502 (class 1259 OID 15515272)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2503 (class 1259 OID 15515270)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2457 (class 1259 OID 15515145)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2475 (class 1259 OID 15515209)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 15515211)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2477 (class 1259 OID 15515210)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2478 (class 1259 OID 15515212)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2534 (class 1259 OID 15515339)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2596 (class 1259 OID 15515523)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 15515554)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2448 (class 1259 OID 15515117)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2449 (class 1259 OID 15515118)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2571 (class 1259 OID 15515441)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2653 (class 1259 OID 15515758)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2468 (class 1259 OID 15515181)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 15515746)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2554 (class 1259 OID 15515390)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2555 (class 1259 OID 15515389)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2618 (class 1259 OID 15515585)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2465 (class 1259 OID 15515169)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 15515536)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 15515798)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2635 (class 1259 OID 15515705)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2636 (class 1259 OID 15515706)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2514 (class 1259 OID 15515301)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2434 (class 1259 OID 15515067)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2504 (class 1259 OID 15515274)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2707 (class 2606 OID 15515985)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2710 (class 2606 OID 15515970)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2709 (class 2606 OID 15515975)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2705 (class 2606 OID 15515995)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2711 (class 2606 OID 15515965)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2706 (class 2606 OID 15515990)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2708 (class 2606 OID 15515980)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2741 (class 2606 OID 15516140)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2740 (class 2606 OID 15516145)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2774 (class 2606 OID 15516315)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2775 (class 2606 OID 15516310)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2692 (class 2606 OID 15515900)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2728 (class 2606 OID 15516080)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2769 (class 2606 OID 15516295)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2770 (class 2606 OID 15516290)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2768 (class 2606 OID 15516300)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2771 (class 2606 OID 15516285)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2772 (class 2606 OID 15516280)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2726 (class 2606 OID 15516075)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2727 (class 2606 OID 15516070)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2704 (class 2606 OID 15515960)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2736 (class 2606 OID 15516110)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2734 (class 2606 OID 15516120)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2735 (class 2606 OID 15516115)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2698 (class 2606 OID 15515935)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2699 (class 2606 OID 15515930)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2724 (class 2606 OID 15516060)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2765 (class 2606 OID 15516265)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2744 (class 2606 OID 15516150)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2743 (class 2606 OID 15516155)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2742 (class 2606 OID 15516160)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2773 (class 2606 OID 15516305)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2746 (class 2606 OID 15516180)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2749 (class 2606 OID 15516165)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2745 (class 2606 OID 15516185)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2747 (class 2606 OID 15516175)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2748 (class 2606 OID 15516170)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2696 (class 2606 OID 15515925)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2697 (class 2606 OID 15515920)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2688 (class 2606 OID 15515885)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2689 (class 2606 OID 15515880)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2730 (class 2606 OID 15516090)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2712 (class 2606 OID 15516000)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2685 (class 2606 OID 15515860)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2684 (class 2606 OID 15515865)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2731 (class 2606 OID 15516105)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2732 (class 2606 OID 15516100)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2733 (class 2606 OID 15516095)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2702 (class 2606 OID 15515940)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2700 (class 2606 OID 15515950)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2701 (class 2606 OID 15515945)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2767 (class 2606 OID 15516275)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2716 (class 2606 OID 15516035)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2718 (class 2606 OID 15516025)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2719 (class 2606 OID 15516020)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2717 (class 2606 OID 15516030)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2683 (class 2606 OID 15515850)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2682 (class 2606 OID 15515855)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2729 (class 2606 OID 15516085)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2778 (class 2606 OID 15516330)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2780 (class 2606 OID 15516335)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2779 (class 2606 OID 15516340)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2725 (class 2606 OID 15516065)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2739 (class 2606 OID 15516130)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2738 (class 2606 OID 15516135)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2756 (class 2606 OID 15516240)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2757 (class 2606 OID 15516235)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2760 (class 2606 OID 15516220)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2759 (class 2606 OID 15516225)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2758 (class 2606 OID 15516230)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2694 (class 2606 OID 15515910)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2695 (class 2606 OID 15515905)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2693 (class 2606 OID 15515915)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2763 (class 2606 OID 15516250)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2762 (class 2606 OID 15516255)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2753 (class 2606 OID 15516210)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2752 (class 2606 OID 15516215)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2755 (class 2606 OID 15516200)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2754 (class 2606 OID 15516205)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2737 (class 2606 OID 15516125)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2720 (class 2606 OID 15516055)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2721 (class 2606 OID 15516050)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2723 (class 2606 OID 15516040)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2722 (class 2606 OID 15516045)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2750 (class 2606 OID 15516195)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2751 (class 2606 OID 15516190)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2761 (class 2606 OID 15516245)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2703 (class 2606 OID 15515955)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2764 (class 2606 OID 15516260)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2766 (class 2606 OID 15516270)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2777 (class 2606 OID 15516320)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2776 (class 2606 OID 15516325)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2686 (class 2606 OID 15515875)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2687 (class 2606 OID 15515870)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2691 (class 2606 OID 15515890)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2690 (class 2606 OID 15515895)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2713 (class 2606 OID 15516015)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2714 (class 2606 OID 15516010)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2715 (class 2606 OID 15516005)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-08-25 14:40:10 CEST

--
-- PostgreSQL database dump complete
--

